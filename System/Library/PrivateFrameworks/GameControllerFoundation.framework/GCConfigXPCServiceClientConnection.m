@implementation GCConfigXPCServiceClientConnection

- (GCConfigXPCServiceClientConnection)initWithConnection:(id)a3
{
  id v4;
  GCConfigXPCServiceClientConnection *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCConfigXPCServiceClientConnection;
  v5 = -[GCIPCRemoteIncomingConnection initWithConnection:](&v9, sel_initWithConnection_, v4);
  if (v5)
  {
    GCConfigXPCServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExportedInterface:", v6);

    GCConfigXPCServiceClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  }
  return v5;
}

- (GCConfigXPCServiceInterface)server
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCConfigXPCServiceInterface *)v3;
}

- (void)setServer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v4);

}

@end
