@implementation _GCAppAgentConnection

- (_GCAppAgentConnection)initWithMachServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _GCAppAgentConnection *v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEEA40), "initWithMachServiceName:options:", v4, 0);

  +[NSXPCInterface interfaceWithProtocol:](&off_254DEED48, "interfaceWithProtocol:", &unk_254DEAC08);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  v9.receiver = self;
  v9.super_class = (Class)_GCAppAgentConnection;
  v7 = -[GCIPCRemoteOutgoingConnection initWithConnection:](&v9, sel_initWithConnection_, v5);

  return v7;
}

- (_GCAppAgentConnection)init
{
  return -[_GCAppAgentConnection initWithMachServiceName:](self, "initWithMachServiceName:", CFSTR("com.apple.GameController.gamecontrolleragentd"));
}

@end
