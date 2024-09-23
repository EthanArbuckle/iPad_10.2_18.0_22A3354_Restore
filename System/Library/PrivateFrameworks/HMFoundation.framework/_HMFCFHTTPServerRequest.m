@implementation _HMFCFHTTPServerRequest

- (_HMFCFHTTPServerRequest)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMFCFHTTPServerRequest)initWithConnection:(id)a3 requestRef:(_CFHTTPServerRequest *)a4
{
  id v6;
  _HMFCFHTTPServerRequest *v7;
  _HMFCFHTTPServerRequest *v8;
  uint64_t v9;
  NSMutableData *bodyData;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HMFCFHTTPServerRequest;
  v7 = -[HMFHTTPRequestInternal init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_connection, v6);
    v8->_requestRef = (_CFHTTPServerRequest *)CFRetain(a4);
    v8->_bodyStream = (__CFReadStream *)_CFHTTPServerRequestCopyBodyStream();
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v9 = objc_claimAutoreleasedReturnValue();
    bodyData = v8->_bodyData;
    v8->_bodyData = (NSMutableData *)v9;

  }
  return v8;
}

- (void)dealloc
{
  _CFHTTPServerRequest *requestRef;
  __CFReadStream *bodyStream;
  objc_super v5;

  requestRef = self->_requestRef;
  if (requestRef)
  {
    CFRelease(requestRef);
    self->_requestRef = 0;
  }
  bodyStream = self->_bodyStream;
  if (bodyStream)
  {
    CFReadStreamClose(bodyStream);
    CFRelease(self->_bodyStream);
    self->_bodyStream = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_HMFCFHTTPServerRequest;
  -[_HMFCFHTTPServerRequest dealloc](&v5, sel_dealloc);
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  HMFAttributeDescription *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), -[_HMFCFHTTPServerRequest requestRef](self, "requestRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Request"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)responseWithStatusCode:(int64_t)a3
{
  return -[_HMFCFHTTPServerResponse initWithRequest:statusCode:]([_HMFCFHTTPServerResponse alloc], "initWithRequest:statusCode:", self, a3);
}

- (void)appendBodyData:(id)a3
{
  -[NSMutableData appendData:](self->_bodyData, "appendData:", a3);
}

- (id)URL
{
  -[_HMFCFHTTPServerRequest requestRef](self, "requestRef");
  return (id)_CFHTTPServerRequestCopyProperty();
}

- (id)method
{
  -[_HMFCFHTTPServerRequest requestRef](self, "requestRef");
  return (id)_CFHTTPServerRequestCopyProperty();
}

- (id)headerFields
{
  void *v2;
  void *v3;

  -[_HMFCFHTTPServerRequest requestRef](self, "requestRef");
  v2 = (void *)_CFHTTPServerRequestCopyProperty();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C92FE8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

- (id)body
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[_HMFCFHTTPServerRequest bodyData](self, "bodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    v5 = (void *)-[NSMutableData copy](self->_bodyData, "copy");
  else
    v5 = 0;
  return v5;
}

- (void)setURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setMethod:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setHeaders:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setBody:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (_CFHTTPServerRequest)requestRef
{
  return self->_requestRef;
}

- (__CFReadStream)bodyStream
{
  return self->_bodyStream;
}

- (_HMFCFHTTPServerConnection)connection
{
  return (_HMFCFHTTPServerConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (NSMutableData)bodyData
{
  return self->_bodyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
