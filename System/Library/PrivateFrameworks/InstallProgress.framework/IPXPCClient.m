@implementation IPXPCClient

- (IPXPCClient)initWithConnection:(id)a3 serviceQueue:(id)a4
{
  id v7;
  id v8;
  IPXPCClient *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id from;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IPXPCClient;
  v9 = -[IPXPCClient init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "_setQueue:", v8);
    IPServerExportedInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(v7, "setExportedObject:", v9);
    IPClientExportedInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v11);

    objc_initWeak(&location, v9);
    objc_initWeak(&from, v7);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__IPXPCClient_initWithConnection_serviceQueue___block_invoke;
    v13[3] = &unk_250FA3C40;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    objc_msgSend(v7, "setInvalidationHandler:", v13);
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __47__IPXPCClient_initWithConnection_serviceQueue___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v2, "clientDisconnected:", WeakRetained);

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setExportedObject:", 0);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p {%@}>"), objc_opt_class(), self, self->_connection);
}

- (void)resume
{
  NSObject *v3;
  NSXPCConnection *connection;
  int v5;
  NSXPCConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = 138412290;
    v6 = connection;
    _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "resuming %@", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCConnection resume](self->_connection, "resume");
}

- (id)asyncProxy:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (void)sendUpdateForIdentity:(id)a3 currentProgress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke;
  v9[3] = &unk_250FA3C68;
  v9[4] = self;
  v6 = a4;
  v7 = a3;
  -[IPXPCClient asyncProxy:](self, "asyncProxy:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "installableForIdentity:progressChanged:", v7, v6);

}

void __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke_cold_1();

}

- (void)sendProgressEndForIdentity:(id)a3 reason:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke;
  v8[3] = &unk_250FA3C68;
  v8[4] = self;
  v6 = a3;
  -[IPXPCClient asyncProxy:](self, "asyncProxy:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "installableForIdentity:progressEndedForReason:", v6, a4);

}

void __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke_cold_1();

}

- (void)actionBarrier:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)registerAsProgressObserver:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  IPXPCClient *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  _IPServerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_23F108000, v5, OS_LOG_TYPE_DEFAULT, "Client %@ registering as progress observer.", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (void)getActiveInstallations:(id)a3
{
  IPXPCClientDelegate **p_delegate;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, id, _QWORD);

  p_delegate = &self->_delegate;
  v10 = (void (**)(id, id, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "activeInstallationsForClient:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10[2](v10, v9, 0);
}

- (void)getAllInstallableStates:(id)a3
{
  IPXPCClientDelegate **p_delegate;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(id, id, _QWORD);

  p_delegate = &self->_delegate;
  v10 = (void (**)(id, id, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "allInstallableStatesForClient:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10[2](v10, v9, 0);
}

- (void)getProgressForIdentity:(id)a3 completion:(id)a4
{
  IPXPCClientDelegate **p_delegate;
  void (**v7)(id, void *, id);
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;

  p_delegate = &self->_delegate;
  v7 = (void (**)(id, void *, id))a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v12 = 0;
  objc_msgSend(WeakRetained, "progressForIdentity:forClient:error:", v8, self, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  v7[2](v7, v10, v11);

}

- (IPXPCClientDelegate)delegate
{
  return (IPXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F108000, v0, v1, "Could not send progress update to %@: %@");
}

void __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F108000, v0, v1, "could not send progress end to %@: %@");
}

@end
