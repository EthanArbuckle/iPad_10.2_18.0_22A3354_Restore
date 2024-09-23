@implementation GCIPCRemoteOutgoingConnection

+ (id)sharedConnectionWorkloop
{
  if (sharedConnectionWorkloop_onceToken_0 != -1)
    dispatch_once(&sharedConnectionWorkloop_onceToken_0, &__block_literal_global_7);
  return (id)sharedConnectionWorkloop__workloop_0;
}

void __57__GCIPCRemoteOutgoingConnection_sharedConnectionWorkloop__block_invoke()
{
  dispatch_workloop_t inactive;
  void *v1;

  inactive = dispatch_workloop_create_inactive("CoreController.server-connection-workloop");
  v1 = (void *)sharedConnectionWorkloop__workloop_0;
  sharedConnectionWorkloop__workloop_0 = (uint64_t)inactive;

  dispatch_activate((dispatch_object_t)sharedConnectionWorkloop__workloop_0);
}

- (GCIPCRemoteOutgoingConnection)initWithConnection:(id)a3
{
  GCIPCRemoteOutgoingConnection *v3;
  GCIPCRemoteOutgoingConnection *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCIPCRemoteOutgoingConnection;
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

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  -[GCIPCRemoteConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ service: '%@'>"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)redactedDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  -[GCIPCRemoteConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ service: '%@'>"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class();
  -[GCIPCRemoteConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p service: '%@'>"), v3, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
