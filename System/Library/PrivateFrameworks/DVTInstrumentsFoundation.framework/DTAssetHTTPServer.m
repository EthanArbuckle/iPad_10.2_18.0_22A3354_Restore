@implementation DTAssetHTTPServer

- (BOOL)startListeningWithError:(id *)a3
{
  dispatch_queue_t v5;
  _DT_GCDAsyncSocket *v6;
  void *v7;
  _DT_GCDAsyncSocket *v8;
  void *v9;

  v5 = dispatch_queue_create("com.apple.dt.DTAssetHTTPServer", MEMORY[0x24BDAC9C0]);
  -[DTAssetHTTPServer setSocketDelegateQueue:](self, "setSocketDelegateQueue:", v5);

  v6 = [_DT_GCDAsyncSocket alloc];
  -[DTAssetHTTPServer socketDelegateQueue](self, "socketDelegateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DT_GCDAsyncSocket initWithDelegate:delegateQueue:](v6, "initWithDelegate:delegateQueue:", self, v7);
  -[DTAssetHTTPServer setSocket:](self, "setSocket:", v8);

  -[DTAssetHTTPServer socket](self, "socket");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v9, "acceptOnInterface:port:error:", CFSTR("localhost"), 0, a3);

  return (char)a3;
}

- (void)stopListening
{
  id v2;

  -[DTAssetHTTPServer socket](self, "socket");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnect");

}

- (void)socket:(id)a3 didAcceptNewSocket:(id)a4
{
  id v5;
  DTAssetHTTPRequestHandler *v6;
  void *v7;
  void *v8;
  DTAssetHTTPRequestHandler *v9;

  v5 = a4;
  v6 = [DTAssetHTTPRequestHandler alloc];
  -[DTAssetHTTPServer channel](self, "channel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DTAssetHTTPRequestHandler initWithSocket:channel:](v6, "initWithSocket:channel:", v5, v7);

  -[DTAssetHTTPServer allowedResources](self, "allowedResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTAssetHTTPRequestHandler setAllowedResources:](v9, "setAllowedResources:", v8);

  -[DTAssetHTTPRequestHandler startReading](v9, "startReading");
}

- (unint64_t)port
{
  void *v2;
  unint64_t v3;

  -[DTAssetHTTPServer socket](self, "socket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "localPort");

  return v3;
}

- (DTXChannel)channel
{
  return (DTXChannel *)objc_getProperty(self, a2, 8, 1);
}

- (void)setChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSSet)allowedResources
{
  return self->_allowedResources;
}

- (void)setAllowedResources:(id)a3
{
  objc_storeStrong((id *)&self->_allowedResources, a3);
}

- (_DT_GCDAsyncSocket)socket
{
  return (_DT_GCDAsyncSocket *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSocket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)socketDelegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSocketDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketDelegateQueue, 0);
  objc_storeStrong((id *)&self->_socket, 0);
  objc_storeStrong((id *)&self->_allowedResources, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
