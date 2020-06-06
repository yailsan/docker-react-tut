# build phase
FROM node:alpine as builder

WORKDIR /var/www/app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx

COPY --from=builder /var/www/app/build /usr/share/nginx/html