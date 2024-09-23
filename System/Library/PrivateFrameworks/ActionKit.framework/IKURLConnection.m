@implementation IKURLConnection

- (IKURLConnection)initWithRequest:(id)a3 delegate:(id)a4 startImmediately:(BOOL)a5
{
  IKURLConnection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IKURLConnection;
  v6 = -[NSURLConnection initWithRequest:delegate:startImmediately:](&v8, sel_initWithRequest_delegate_startImmediately_, a3, a4, a5);
  if (v6)
  {
    v6->_request = (NSURLRequest *)a3;
    v6->_response = 0;
    v6->_data = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v6->_userInfo = 0;
    v6->_type = -1;
    v6->_context = 0;
  }
  return v6;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", self->_data);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IKURLConnection;
  -[NSURLConnection dealloc](&v3, sel_dealloc);
}

- (void)_appendData:(id)a3
{
  -[NSMutableData appendData:](self->_data, "appendData:", a3);
}

- (void)_setUserInfo:(id)a3
{
  id userInfo;

  userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_userInfo = a3;
  }
}

- (void)_setResponse:(id)a3
{
  NSHTTPURLResponse *response;

  response = self->_response;
  if (response != a3)
  {

    self->_response = (NSHTTPURLResponse *)a3;
  }
}

- (void)_setType:(int)a3
{
  if (self->_type != a3)
    self->_type = a3;
}

- (void)_setContext:(id)a3
{
  id context;

  context = self->_context;
  if (context != a3)
  {

    self->_context = a3;
  }
}

- (id)_context
{
  return self->_context;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (int)type
{
  return self->_type;
}

@end
