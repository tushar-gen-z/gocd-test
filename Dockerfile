FROM golang:1.24 AS builder
WORKDIR /app
COPY . .
RUN go test ./...
RUN go build -o ./main .

FROM builder AS final
WORKDIR /app
COPY --from=builder /app/main ./main
ENTRYPOINT [ "./main" ]
