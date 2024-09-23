@implementation SecSOSStatus

- (SecSOSStatus)init
{
  SecSOSStatus *v2;
  void *v3;
  void *v4;
  SecSOSStatus *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SecSOSStatus;
  v2 = -[SecSOSStatus init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF88B08);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _SOSControlSetupInterface(v3);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.securityd.sos"), 0);
    -[SecSOSStatus setConnection:](v2, "setConnection:", v4);

    -[SecSOSStatus connection](v2, "connection");
    v5 = (SecSOSStatus *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SecSOSStatus connection](v2, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRemoteObjectInterface:", v3);

      -[SecSOSStatus connection](v2, "connection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resume");

      v5 = v2;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
