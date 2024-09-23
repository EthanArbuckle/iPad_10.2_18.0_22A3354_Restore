@implementation CDPDaemonConnection

void __33__CDPDaemonConnection_connection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __33__CDPDaemonConnection_connection__block_invoke_cold_1(v2);

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "lock");
    v3 = WeakRetained[1];
    WeakRetained[1] = 0;

    objc_msgSend(WeakRetained[2], "unlock");
  }

}

- (CDPDaemonConnection)init
{
  CDPDaemonConnection *v2;
  NSLock *v3;
  NSLock *connLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPDaemonConnection;
  v2 = -[CDPDaemonConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connLock = v2->_connLock;
    v2->_connLock = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CDPDaemonConnection;
  -[CDPDaemonConnection dealloc](&v3, sel_dealloc);
}

- (id)connection
{
  NSXPCConnection *conn;
  NSXPCListenerEndpoint *daemonXPCEndpoint;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  void *v12;
  NSXPCConnection *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[NSLock lock](self->_connLock, "lock");
  conn = self->_conn;
  if (!conn)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    if (daemonXPCEndpoint)
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithListenerEndpoint:", self->_daemonXPCEndpoint);
    else
      v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.cdp.daemon"), 0);
    v7 = self->_conn;
    self->_conn = v6;

    objc_initWeak(&location, self);
    v8 = self->_conn;
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __33__CDPDaemonConnection_connection__block_invoke;
    v17[3] = &unk_24C7C2048;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v17);
    v10 = self->_conn;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __33__CDPDaemonConnection_connection__block_invoke_15;
    v15[3] = &unk_24C7C2048;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v15);
    v11 = self->_conn;
    CDPDaemonExportedInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v12);

    -[NSXPCConnection resume](self->_conn, "resume");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    conn = self->_conn;
  }
  v13 = conn;
  -[NSLock unlock](self->_connLock, "unlock");
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_connLock, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

void __33__CDPDaemonConnection_connection__block_invoke_15(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __33__CDPDaemonConnection_connection__block_invoke_15_cold_1(v2);

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "lock");
    v3 = WeakRetained[1];
    WeakRetained[1] = 0;

    objc_msgSend(WeakRetained[2], "unlock");
  }

}

- (id)daemon
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CDPDaemonConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__CDPDaemonConnection_daemon__block_invoke;
  v6[3] = &unk_24C7C1030;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __29__CDPDaemonConnection_daemon__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __29__CDPDaemonConnection_daemon__block_invoke_cold_1((uint64_t)v3, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (id)daemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CDPDaemonConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__CDPDaemonConnection_daemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24C7C0F80;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __46__CDPDaemonConnection_daemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CDPDaemonConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__CDPDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24C7C0F80;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__CDPDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (NSXPCListenerEndpoint)daemonXPCEndpoint
{
  return self->_daemonXPCEndpoint;
}

- (void)setDaemonXPCEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, a3);
}

void __33__CDPDaemonConnection_connection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D7E6000, log, OS_LOG_TYPE_DEBUG, "\"Daemon connection invalidated!\", v1, 2u);
}

void __33__CDPDaemonConnection_connection__block_invoke_15_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D7E6000, log, OS_LOG_TYPE_ERROR, "\"Daemon connection interrupted!\", v1, 2u);
}

void __29__CDPDaemonConnection_daemon__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"XPC Error from daemon: %@\", (uint8_t *)&v2, 0xCu);
}

@end
