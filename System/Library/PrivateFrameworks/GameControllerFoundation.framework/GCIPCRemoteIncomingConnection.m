@implementation GCIPCRemoteIncomingConnection

+ (id)sharedConnectionWorkloop
{
  if (sharedConnectionWorkloop_onceToken != -1)
    dispatch_once(&sharedConnectionWorkloop_onceToken, &__block_literal_global_5);
  return (id)sharedConnectionWorkloop__workloop;
}

void __57__GCIPCRemoteIncomingConnection_sharedConnectionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("CoreController.incoming-connection-workloop");
  v1 = (void *)sharedConnectionWorkloop__workloop;
  sharedConnectionWorkloop__workloop = (uint64_t)inactive;

  dispatch_activate((dispatch_object_t)sharedConnectionWorkloop__workloop);
}

- (GCIPCRemoteIncomingConnection)initWithConnection:(id)a3
{
  GCIPCRemoteIncomingConnection *v3;
  GCIPCRemoteIncomingConnection *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCIPCRemoteIncomingConnection;
  v3 = -[GCIPCRemoteConnection initWithConnection:](&v8, sel_initWithConnection_, a3);
  v4 = v3;
  if (v3)
  {
    -[GCIPCRemoteConnection connection](v3, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "sharedConnectionWorkloop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v6);

  }
  return v4;
}

- (id)remoteProxy
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)remoteProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)synchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
