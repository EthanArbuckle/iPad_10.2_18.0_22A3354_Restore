@implementation DCDeviceMetadataDaemonConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connLock, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (id)synchronousRemoteObjectProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DCDeviceMetadataDaemonConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)connection
{
  NSXPCConnection *conn;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[NSLock lock](self->_connLock, "lock");
  conn = self->_conn;
  if (!conn)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.devicecheckd"), 0);
    v5 = self->_conn;
    self->_conn = v4;

    objc_initWeak(&location, self);
    v6 = self->_conn;
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__DCDeviceMetadataDaemonConnection_connection__block_invoke;
    v15[3] = &unk_24F1E98E0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v15);
    v8 = self->_conn;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __46__DCDeviceMetadataDaemonConnection_connection__block_invoke_2;
    v13[3] = &unk_24F1E98E0;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v13);
    v9 = self->_conn;
    +[DCDeviceMetadataInterface XPCInterface](DCDeviceMetadataInterface, "XPCInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](self->_conn, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    conn = self->_conn;
  }
  v11 = conn;
  -[NSLock unlock](self->_connLock, "unlock");
  return v11;
}

- (DCDeviceMetadataDaemonConnection)init
{
  DCDeviceMetadataDaemonConnection *v2;
  NSLock *v3;
  NSLock *connLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DCDeviceMetadataDaemonConnection;
  v2 = -[DCDeviceMetadataDaemonConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connLock = v2->_connLock;
    v2->_connLock = v3;

  }
  return v2;
}

void __46__DCDeviceMetadataDaemonConnection_connection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "lock");
    v2 = v3[1];
    v3[1] = 0;

    objc_msgSend(v3[2], "unlock");
    WeakRetained = v3;
  }

}

void __46__DCDeviceMetadataDaemonConnection_connection__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "lock");
    v2 = v3[1];
    v3[1] = 0;

    objc_msgSend(v3[2], "unlock");
    WeakRetained = v3;
  }

}

- (id)remoteObjectProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DCDeviceMetadataDaemonConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
