@implementation AAFXPCSession

- (void)invalidate
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD v3[5];

  p_connectionLock = &self->_connectionLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__AAFXPCSession_invalidate__block_invoke;
  v3[3] = &unk_1E9946540;
  v3[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __27__AAFXPCSession_invalidate__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

uint64_t __27__AAFXPCSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_destroyXPCConnection");
}

- (void)_unsafe_destroyXPCConnection
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteServiceConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (AAFXPCSession)initWithRemoteServiceConfig:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  AAFXPCSession *v9;
  NSUUID *v10;
  NSUUID *identifier;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAFXPCSession;
  v9 = -[AAFXPCSession init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_remoteServiceConfig, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v9->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)remoteServiceProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AAFXPCSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resume
{
  id v2;

  -[AAFXPCSession connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_connectionLock;
  void *v3;
  _QWORD v5[5];

  p_connectionLock = &self->_connectionLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AAFXPCSession_connection__block_invoke;
  v5[3] = &unk_1E9946568;
  v5[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __27__AAFXPCSession_connection__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_connectionLock);
  return (NSXPCConnection *)v3;
}

id __27__AAFXPCSession_connection__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_unsafe_createNewConnection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_unsafe_createNewConnection
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSXPCConnection *v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  char v14;
  id v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  uint64_t v26;
  NSXPCConnection *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id from;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  -[AAFXPCSession remoteServiceConfig](self, "remoteServiceConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFXPCSession remoteServiceConfig](self, "remoteServiceConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", v5, objc_msgSend(v6, "options"));
  connection = self->_connection;
  self->_connection = v7;

  -[AAFXPCSessionConfig exportedProtocol](self->_remoteServiceConfig, "exportedProtocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3B50];
    -[AAFXPCSessionConfig exportedProtocol](self->_remoteServiceConfig, "exportedProtocol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interfaceWithProtocol:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "configureExportedInterface:", v12);

    }
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v12);
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "exportedObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v19);

    }
  }
  v20 = (void *)MEMORY[0x1E0CB3B50];
  -[AAFXPCSessionConfig remoteProtocol](self->_remoteServiceConfig, "remoteProtocol");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "interfaceWithProtocol:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "configureRemoteInterface:", v22);

  }
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v22);
  objc_initWeak(&location, self->_connection);
  objc_initWeak(&from, self);
  v26 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __44__AAFXPCSession__unsafe_createNewConnection__block_invoke;
  v32[3] = &unk_1E9946590;
  objc_copyWeak(&v33, &location);
  objc_copyWeak(&v34, &from);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v32);
  v29[0] = v26;
  v29[1] = 3221225472;
  v29[2] = __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_14;
  v29[3] = &unk_1E9946590;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(&v31, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v29);
  v27 = self->_connection;
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v27;
}

- (AAFXPCSessionConfig)remoteServiceConfig
{
  return self->_remoteServiceConfig;
}

- (id)remoteServiceProxy
{
  void *v2;
  void *v3;

  -[AAFXPCSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __35__AAFXPCSession_remoteServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AAFLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__AAFXPCSession_remoteServiceProxy__block_invoke_cold_1();

}

- (id)syncRemoteServiceProxy
{
  void *v2;
  void *v3;

  -[AAFXPCSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __39__AAFXPCSession_syncRemoteServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _AAFLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__AAFXPCSession_remoteServiceProxy__block_invoke_cold_1();

}

- (id)syncRemoteServiceProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AAFXPCSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)suspend
{
  os_unfair_lock_s *p_connectionLock;
  _QWORD v3[5];

  p_connectionLock = &self->_connectionLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__AAFXPCSession_suspend__block_invoke;
  v3[3] = &unk_1E9946540;
  v3[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __24__AAFXPCSession_suspend__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

uint64_t __24__AAFXPCSession_suspend__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "suspend");
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id *)(a1 + 40);
  v4 = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0 && WeakRetained)
  {
    v7 = objc_loadWeakRetained(v3);
    -[NSObject delegate](v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteServiceDidInterrupt");

  }
  else
  {
    _AAFLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_cold_1();
  }

}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate");
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0 && v3)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteServiceDidInvalidate](v6, "remoteServiceDidInvalidate");
  }
  else
  {
    _AAFLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_14_cold_1();
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (AAFXPCSessionDelegate)delegate
{
  return (AAFXPCSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

void __35__AAFXPCSession_remoteServiceProxy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, v0, v1, "Error getting synchronous connection to service : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, v0, v1, "Connection interrupted: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, v0, v1, "Connection invalidated: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
