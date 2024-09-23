@implementation HAPCoreUtilsHTTPClient

- (HAPCoreUtilsHTTPClient)initWithQueue:(id)a3
{
  id v4;
  HAPCoreUtilsHTTPClient *v5;
  HAPCoreUtilsHTTPClient *v6;
  HAPCoreUtilsHTTPClient *v7;
  objc_super v9;
  HTTPClientPrivate *v10;

  v4 = a3;
  v10 = 0;
  if (HTTPClientCreate())
  {
    v5 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HAPCoreUtilsHTTPClient;
    v6 = -[HAPCoreUtilsHTTPClient init](&v9, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_httpClient = v10;
      -[HAPCoreUtilsHTTPClient setDispatchQueue:](v6, "setDispatchQueue:", v4);
    }
    self = v7;
    v5 = self;
  }

  return v5;
}

- (int)setProperty:(__CFString *)a3 value:(void *)a4
{
  return _HTTPClientSetProperty();
}

- (void)setDispatchQueue:(id)a3
{
  HTTPClientSetDispatchQueue();
}

- (void)setFlags:(unsigned int)a3 mask:(unsigned int)a4
{
  HTTPClientSetFlags();
}

- (void)setTimeoutInSeconds:(int)a3
{
  HTTPClientSetTimeout();
}

- (int)setDestination:(const char *)a3 port:(int)a4
{
  return HTTPClientSetDestination();
}

- (void)setDelegate:(id *)a3
{
  HTTPClientSetDelegate();
}

- (void)setTransportDelegate:(id *)a3
{
  HTTPClientSetTransportDelegate();
}

- (void)setDebugDelegate:(id *)a3
{
  HTTPClientSetDebugDelegate();
}

- (void)invalidate
{
  if (self->_httpClient)
  {
    HTTPClientInvalidate();
    CFRelease(self->_httpClient);
    self->_httpClient = 0;
  }
}

- (int)sendMessage:(HTTPMessagePrivate *)a3
{
  return HTTPClientSendMessage();
}

- (int)getPeerAddress:(void *)a3 maxLength:(unint64_t)a4 outLength:(unint64_t *)a5
{
  if (self->_httpClient)
    return HTTPClientGetPeerAddress();
  else
    return -6718;
}

- (void)dealloc
{
  objc_super v3;

  -[HAPCoreUtilsHTTPClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HAPCoreUtilsHTTPClient;
  -[HAPCoreUtilsHTTPClient dealloc](&v3, sel_dealloc);
}

@end
