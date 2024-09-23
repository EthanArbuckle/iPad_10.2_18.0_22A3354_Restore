@implementation MGRemoteQueryServerHandlerPing

- (id)_initWithRequest:(id)a3
{
  id v5;
  MGRemoteQueryServerHandlerPing *v6;
  MGRemoteQueryServerHandlerPing *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MGRemoteQueryServerHandlerPing;
  v6 = -[MGRemoteQueryServerHandlerPing init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)urlPath
{
  return CFSTR("/ping");
}

+ (id)handlerForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRequest:", v4);

  return v5;
}

- (BOOL)validateRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "urlPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerHandlerPing request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqual:", v6);

  return v7;
}

- (int)prepareResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;

  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v6, "rq_coded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "dataWithJSONObject:options:error:", v8, 0, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryServerHandlerPing setResponsePayload:](self, "setResponsePayload:", v9);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v9, "length"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  nw_http_fields_append();

  return 200;
}

- (void)provideResponseData:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MGRemoteQueryServerHandlerPing replied](self, "replied"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }
  else
  {
    -[MGRemoteQueryServerHandlerPing setReplied:](self, "setReplied:", 1);
    -[MGRemoteQueryServerHandlerPing responsePayload](self, "responsePayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v4, 0);

  }
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSData)responsePayload
{
  return self->_responsePayload;
}

- (void)setResponsePayload:(id)a3
{
  objc_storeStrong((id *)&self->_responsePayload, a3);
}

- (BOOL)replied
{
  return self->_replied;
}

- (void)setReplied:(BOOL)a3
{
  self->_replied = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePayload, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
