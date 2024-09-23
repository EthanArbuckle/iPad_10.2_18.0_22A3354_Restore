@implementation MRUIServiceServer

- (MRUIServiceServer)init
{
  MRUIServiceServer *v2;
  uint64_t v3;
  NSXPCListener *listener;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUIServiceServer;
  v2 = -[MRUIServiceServer init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](v2->_listener, "endpoint"));
    MRSetUIServiceRelayEndpoint();

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return 0;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
