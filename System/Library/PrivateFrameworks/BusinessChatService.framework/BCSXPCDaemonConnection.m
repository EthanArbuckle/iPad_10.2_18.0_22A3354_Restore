@implementation BCSXPCDaemonConnection

- (id)initWithMachServiceName:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)BCSXPCDaemonConnection;
    a1 = (id *)objc_msgSendSuper2(&v8, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25462B250);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v3, 0);
      v6 = a1[1];
      a1[1] = (id)v5;

      objc_msgSend(a1[1], "setRemoteObjectInterface:", v4);
    }
  }

  return a1;
}

- (BCSXPCDaemonProtocol)remoteObjectProxy
{
  if (self)
    self = (BCSXPCDaemonConnection *)self->_connection;
  return -[BCSXPCDaemonConnection remoteObjectProxy](self, "remoteObjectProxy");
}

- (void)resume
{
  if (self)
    self = (BCSXPCDaemonConnection *)self->_connection;
  -[BCSXPCDaemonConnection resume](self, "resume");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
