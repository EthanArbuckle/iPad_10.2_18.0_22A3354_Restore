@implementation MKHTTPResponse

- (MKHTTPResponse)init
{
  MKHTTPResponse *v2;
  MKHTTPHeaders *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKHTTPResponse;
  v2 = -[MKHTTPResponse init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKHTTPHeaders);
    -[MKHTTPResponse setHeaders:](v2, "setHeaders:", v3);

  }
  return v2;
}

- (id)responseData
{
  id v3;
  void *v4;

  -[MKHTTPHeaders setContentLength:](self->_headers, "setContentLength:", -[NSData length](self->_body, "length"));
  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  -[MKHTTPHeaders responseHeadersData](self->_headers, "responseHeadersData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  if (self->_body)
    objc_msgSend(v3, "appendData:");
  return v3;
}

- (MKHTTPHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
