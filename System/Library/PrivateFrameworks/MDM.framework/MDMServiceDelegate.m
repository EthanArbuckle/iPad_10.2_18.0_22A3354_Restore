@implementation MDMServiceDelegate

- (MDMServiceDelegate)initWithServer:(id)a3
{
  id v5;
  MDMServiceDelegate *v6;
  MDMServiceDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMServiceDelegate;
  v6 = -[MDMServiceDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_server, a3);

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  MDMServicerCore *v9;
  void *v10;
  MDMServicerCore *v11;
  NSObject *v12;
  uint8_t v14[16];

  v5 = a4;
  -[MDMServiceDelegate server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "channelType");

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255782240);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MDMUserXPCProtocolInitialize();
  }
  else if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255782118);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MDMXPCProtocolInitialize();
  }
  objc_msgSend(v5, "setExportedInterface:", v8);
  v9 = [MDMServicerCore alloc];
  -[MDMServiceDelegate server](self, "server");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MDMServicerCore initWithXPCConnection:server:](v9, "initWithXPCConnection:server:", v5, v10);
  objc_msgSend(v5, "setExportedObject:", v11);

  objc_msgSend(v5, "resume");
  v12 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Accepted new connection.", v14, 2u);
  }

  return 1;
}

- (MDMServerCore)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

@end
