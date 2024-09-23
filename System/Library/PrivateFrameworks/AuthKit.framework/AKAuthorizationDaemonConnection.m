@implementation AKAuthorizationDaemonConnection

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKAuthorizationDaemonConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_connection
{
  os_unfair_lock_s *p_unfairLock;
  void *v3;
  _QWORD v5[5];

  p_unfairLock = &self->_unfairLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AKAuthorizationDaemonConnection__connection__block_invoke;
  v5[3] = &unk_1E2E5F278;
  v5[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __46__AKAuthorizationDaemonConnection__connection__block_invoke((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return v3;
}

id __46__AKAuthorizationDaemonConnection__connection__block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_initWeak(&location, v2);
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (v4)
      v6 = objc_msgSend(v5, "initWithListenerEndpoint:", v4);
    else
      v6 = objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.ak.authorizationservices.xpc"), 0);
    v7 = v6;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    +[AKAuthorizationDaemonInterface XPCInterface](AKAuthorizationDaemonInterface, "XPCInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    +[AKAuthorizationClientInterface XPCInterface](AKAuthorizationClientInterface, "XPCInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExportedInterface:", v13);

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __46__AKAuthorizationDaemonConnection__connection__block_invoke_2;
    v20[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v14, "setInterruptionHandler:", v20);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __46__AKAuthorizationDaemonConnection__connection__block_invoke_3;
    v18[3] = &unk_1E2E5E1F8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v16, "setInvalidationHandler:", v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v3;
}

- (AKAuthorizationDaemonConnection)initWithListenerEndpoint:(id)a3 exportedInterface:(id)a4
{
  id v7;
  id v8;
  AKAuthorizationDaemonConnection *v9;
  AKAuthorizationDaemonConnection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationDaemonConnection;
  v9 = -[AKAuthorizationDaemonConnection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listenerEndpoint, a3);
    objc_storeStrong((id *)&v10->_contextManager, a4);
    v10->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (AKAuthorizationDaemonConnection)init
{
  return -[AKAuthorizationDaemonConnection initWithListenerEndpoint:exportedInterface:](self, "initWithListenerEndpoint:exportedInterface:", 0, 0);
}

- (void)dealloc
{
  NSObject *v3;
  NSXPCConnection *connection;
  objc_super v5;

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AKCustodianDaemonConnection dealloc].cold.1((uint64_t)self, v3);

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationDaemonConnection;
  -[AKAuthorizationDaemonConnection dealloc](&v5, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKAuthorizationDaemonConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__AKAuthorizationDaemonConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterruptionHandler");

}

void __46__AKAuthorizationDaemonConnection__connection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidationHandler");

}

- (void)_connectionInterruptionHandler
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _AKLogSiwa();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[AKCustodianDaemonConnection _connectionInterruptionHandler].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)_connectionInvalidationHandler
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  _AKLogSiwa();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AKCustodianDaemonConnection _connectionInvalidationHandler].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__AKAuthorizationDaemonConnection__connectionInvalidationHandler__block_invoke;
  v11[3] = &unk_1E2E5E1D0;
  v11[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __65__AKAuthorizationDaemonConnection__connectionInvalidationHandler__block_invoke((uint64_t)v11);
  os_unfair_lock_unlock(&self->_unfairLock);
}

void __65__AKAuthorizationDaemonConnection__connectionInvalidationHandler__block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_contextManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
