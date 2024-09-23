@implementation AASigningSessionRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AASigningSessionRequest)initWithURLString:(id)a3 sessionInfoRequestData:(id)a4
{
  id v7;
  AASigningSessionRequest *v8;
  AASigningSessionRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AASigningSessionRequest;
  v8 = -[AARequest initWithURLString:](&v11, sel_initWithURLString_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_sessionInfoRequestData, a4);

  return v9;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AASigningSessionRequest;
  -[AARequest urlRequest](&v7, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSData base64EncodedStringWithOptions:](self->_sessionInfoRequestData, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("X-MMe-Nas-Session"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInfoRequestData, 0);
}

@end
