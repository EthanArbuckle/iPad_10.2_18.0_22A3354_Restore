@implementation NSURLSessionWebSocketMessage

- (NSURLSessionWebSocketMessage)initWithData:(NSData *)data
{
  NSData *v4;
  NSURLSessionWebSocketMessage *v5;
  uint64_t v6;
  NSObject *content;
  objc_super v9;

  v4 = data;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionWebSocketMessage;
  v5 = -[NSURLSessionWebSocketMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSData copy](v4, "copy");
    content = v5->content;
    v5->content = v6;

  }
  return v5;
}

- (NSURLSessionWebSocketMessage)initWithString:(NSString *)string
{
  NSString *v4;
  NSURLSessionWebSocketMessage *v5;
  uint64_t v6;
  NSObject *content;
  objc_super v9;

  v4 = string;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionWebSocketMessage;
  v5 = -[NSURLSessionWebSocketMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    content = v5->content;
    v5->content = v6;

  }
  return v5;
}

- (NSData)data
{
  NSObject *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->content;
  else
    v3 = 0;
  return (NSData *)v3;
}

- (NSString)string
{
  NSObject *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->content;
  else
    v3 = 0;
  return (NSString *)v3;
}

- (NSURLSessionWebSocketMessageType)type
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSObject isEqual:](self->content, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSObject hash](self->content, "hash");
}

- (id)description
{
  return (id)-[NSObject description](self->content, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->content, 0);
}

@end
