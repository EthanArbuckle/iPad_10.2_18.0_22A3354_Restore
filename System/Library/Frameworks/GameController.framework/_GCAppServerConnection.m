@implementation _GCAppServerConnection

- (_GCAppServerConnection)initWithMachServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _GCAppServerConnection *v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEEA40), "initWithMachServiceName:options:", v4, 4096);

  GCAppClientInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  GCAppServerInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v7);

  v10.receiver = self;
  v10.super_class = (Class)_GCAppServerConnection;
  v8 = -[GCIPCRemoteOutgoingConnection initWithConnection:](&v10, sel_initWithConnection_, v5);

  return v8;
}

- (_GCAppServerConnection)init
{
  return -[_GCAppServerConnection initWithMachServiceName:](self, "initWithMachServiceName:", CFSTR("com.apple.GameController.gamecontrollerd.app"));
}

- (_GCAppClientInterface)client
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_GCAppClientInterface *)v3;
}

- (void)setClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCIPCRemoteConnection connection](self, "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v4);

}

@end
