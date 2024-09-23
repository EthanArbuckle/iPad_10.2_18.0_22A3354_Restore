@implementation APHTTPResponse

- (BOOL)valid
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  objc_msgSend_responseError(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = !v8
     && objc_msgSend_responseStatusCode(self, v5, v6, v7) >= 200
     && objc_msgSend_responseStatusCode(self, v9, v10, v11) < 300;

  return v12;
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (NSData)responseBody
{
  return self->_responseBody;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_URLResponse;
}

- (APHTTPResponse)init
{

  return 0;
}

- (id)_initWithResponseData:(id)a3 URLResponse:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  APHTTPResponse *v12;
  APHTTPResponse *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *responseHeaders;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)APHTTPResponse;
  v12 = -[APHTTPResponse init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_responseBody, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v13->_URLResponse, a4);
      v13->_responseStatusCode = objc_msgSend_statusCode(v10, v14, v15, v16);
      objc_msgSend_allHeaderFields(v10, v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      responseHeaders = v13->_responseHeaders;
      v13->_responseHeaders = (NSDictionary *)v20;

    }
    objc_storeStrong((id *)&v13->_responseError, a5);
  }

  return v13;
}

- (id)valueForResponseHeaderField:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_responseHeaders(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setResponseStatusCode:(int64_t)a3
{
  self->_responseStatusCode = a3;
}

- (void)setResponseError:(id)a3
{
  objc_storeStrong((id *)&self->_responseError, a3);
}

- (void)setURLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_URLResponse, a3);
}

- (void)setResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_responseHeaders, a3);
}

- (void)setResponseBody:(id)a3
{
  objc_storeStrong((id *)&self->_responseBody, a3);
}

@end
