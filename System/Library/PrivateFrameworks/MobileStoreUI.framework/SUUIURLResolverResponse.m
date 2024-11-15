@implementation SUUIURLResolverResponse

- (SUUIURLResolverResponse)initWithData:(id)a3 URLResponse:(id)a4
{
  id v7;
  id v8;
  SUUIURLResolverResponse *v9;
  SUUIURLResolverResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIURLResolverResponse;
  v9 = -[SUUIURLResolverResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_response, a4);
  }

  return v10;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
