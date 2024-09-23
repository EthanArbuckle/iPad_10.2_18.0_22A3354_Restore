@implementation AVNSURLProtocolRequest

- (void)dealloc
{
  _CFURLConnection *connection;
  __CFError *error;
  objc_super v5;

  connection = self->_connection;
  if (connection)
    CFRelease(connection);
  error = self->_error;
  if (error)
    CFRelease(error);
  v5.receiver = self;
  v5.super_class = (Class)AVNSURLProtocolRequest;
  -[AVAssetCustomURLRequest dealloc](&v5, sel_dealloc);
}

- (_CFURLConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(_CFURLConnection *)a3
{
  _CFURLConnection *connection;

  connection = self->_connection;
  self->_connection = a3;
  if (a3)
    CFRetain(a3);
  if (connection)
    CFRelease(connection);
}

- (AVAssetCustomURLBridgeForNSURLProtocol)bridge
{
  return (AVAssetCustomURLBridgeForNSURLProtocol *)objc_loadWeak((id *)&self->_bridge);
}

- (void)setBridge:(id)a3
{
  objc_storeWeak((id *)&self->_bridge, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bridge);
}

@end
