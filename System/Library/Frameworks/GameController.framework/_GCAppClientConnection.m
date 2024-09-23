@implementation _GCAppClientConnection

- (_GCAppClientConnection)initWithConnection:(id)a3 fromProcess:(id)a4
{
  id v6;
  _GCAppClientConnection *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCAppClientConnection;
  v7 = -[_GCIPCRemoteIncomingConnection initWithConnection:fromProcess:](&v11, sel_initWithConnection_fromProcess_, v6, a4);
  if (v7)
  {
    GCAppServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v8);

    GCAppClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v9);

  }
  return v7;
}

- (_GCAppServerInterface)server
{
  void *v2;
  void *v3;

  -[GCIPCRemoteConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exportedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_GCAppServerInterface *)v3;
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
