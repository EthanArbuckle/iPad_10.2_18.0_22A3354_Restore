@implementation AAIdentityDaemonConnection

- (AAIdentityDaemonConnection)init
{
  return -[AAIdentityDaemonConnection initWithListenerEndpoint:](self, "initWithListenerEndpoint:", 0);
}

- (AAIdentityDaemonConnection)initWithListenerEndpoint:(id)a3
{
  id v5;
  AAIdentityDaemonConnection *v6;
  AAIdentityDaemonConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAIdentityDaemonConnection;
  v6 = -[AAIdentityDaemonConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listenerEndpoint, a3);
    v7->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  NSXPCConnection *connection;
  objc_super v5;

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AAAccountUserNotificationDaemonConnection dealloc].cold.1((uint64_t)self, v3);

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v5.receiver = self;
  v5.super_class = (Class)AAIdentityDaemonConnection;
  -[AAIdentityDaemonConnection dealloc](&v5, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAIdentityDaemonConnection.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  -[AAIdentityDaemonConnection _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAIdentityDaemonConnection.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  -[AAIdentityDaemonConnection _connection](self, "_connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_connection
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AAIdentityDaemonConnection__connection__block_invoke;
  v5[3] = &unk_1E416E380;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __41__AAIdentityDaemonConnection__connection__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return v3;
}

id __41__AAIdentityDaemonConnection__connection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (v4)
      v6 = objc_msgSend(v5, "initWithListenerEndpoint:", v4);
    else
      v6 = objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.aa.identity.xpc"), 0);
    v7 = v6;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    +[AAIdentityDaemonInterface XPCInterface](AAIdentityDaemonInterface, "XPCInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __41__AAIdentityDaemonConnection__connection__block_invoke_2;
    v26[3] = &unk_1E416E358;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v12, "setInterruptionHandler:", v26);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __41__AAIdentityDaemonConnection__connection__block_invoke_3;
    v24[3] = &unk_1E416E358;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v14, "setInvalidationHandler:", v24);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __41__AAIdentityDaemonConnection__connection__block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3;
}

void __41__AAIdentityDaemonConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterruptionHandler");

}

void __41__AAIdentityDaemonConnection__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidationHandler");

}

- (void)_connectionInterruptionHandler
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "Connection to identity service interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_connectionInvalidationHandler
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "Connection to identity service invalidated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __60__AAIdentityDaemonConnection__connectionInvalidationHandler__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __41__AAIdentityDaemonConnection__connection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "Connection to identity service initialized", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
