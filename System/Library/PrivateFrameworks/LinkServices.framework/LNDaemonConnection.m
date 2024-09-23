@implementation LNDaemonConnection

- (void)connectWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  id location;
  objc_super v28;
  os_activity_scope_state_s buf;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LNDaemonConnection;
  -[LNConnection connectWithOptions:](&v28, sel_connectWithOptions_, v4);
  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ Establishing a mediator connection to the daemon", (uint8_t *)&buf, 0xCu);

  }
  -[LNConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.extension"), 0);
  -[LNDaemonConnection setMediatorXPCConnection:](self, "setMediatorXPCConnection:", v8);

  LNDaemonExtensionXPCInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDaemonConnection mediatorXPCConnection](self, "mediatorXPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRemoteObjectInterface:", v9);

  -[LNConnection activity](self, "activity");
  v11 = objc_claimAutoreleasedReturnValue();
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v11, &buf);
  objc_initWeak(&location, self);
  -[LNDaemonConnection mediatorXPCConnection](self, "mediatorXPCConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection queue](self, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setQueue:", v13);

  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke;
  v25[3] = &unk_1E45DDDC8;
  v25[4] = v11;
  objc_copyWeak(&v26, &location);
  -[LNDaemonConnection mediatorXPCConnection](self, "mediatorXPCConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInterruptionHandler:", v25);

  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_6;
  v23[3] = &unk_1E45DDDC8;
  v23[4] = v11;
  objc_copyWeak(&v24, &location);
  -[LNDaemonConnection mediatorXPCConnection](self, "mediatorXPCConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInvalidationHandler:", v23);

  -[LNDaemonConnection mediatorXPCConnection](self, "mediatorXPCConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

  -[LNDaemonConnection mediatorXPCConnection](self, "mediatorXPCConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_7;
  v22[3] = &unk_1E45DD430;
  v22[4] = self;
  objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_9;
  v21[3] = &unk_1E45DCCB8;
  v21[4] = self;
  objc_msgSend(v19, "getConnectionHostInterfaceForBundleIdentifier:completionHandler:", v20, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&buf);

}

- (BOOL)refreshWithOptions:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNDaemonConnection;
  v4 = -[LNConnection refreshWithOptions:](&v6, sel_refreshWithOptions_, a3);
  if (v4)
    -[LNConnection setConnected](self, "setConnected");
  return v4;
}

- (void)connectUsingListenerEndpoint:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  getLNLogCategoryConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_INFO, "%{public}@ Establishing a direct connection to the daemon via a listener endpoint", buf, 0xCu);

  }
  -[LNConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[LNConnection state](self, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDaemonConnection.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnecting"));

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);

  -[LNConnection setXPCConnection:](self, "setXPCConnection:", v9);
  -[LNConnection xpcConnection](self, "xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LNConnectionHostXPCInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ln_configureWithBundleIdentifier:interface:", v11, v12);

  -[LNConnection xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

  -[LNConnection setConnected](self, "setConnected");
}

- (NSXPCConnection)mediatorXPCConnection
{
  return self->_mediatorXPCConnection;
}

- (void)setMediatorXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_mediatorXPCConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediatorXPCConnection, 0);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been interrupted", v5, 2u);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "mediatorXPCConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(WeakRetained, "setMediatorXPCConnection:", 0);
  }

  os_activity_scope_leave(&state);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been invalidated", v4, 2u);
  }

  if (WeakRetained)
    objc_msgSend(WeakRetained, "setMediatorXPCConnection:", 0);

  os_activity_scope_leave(&state);
}

void __41__LNDaemonConnection_connectWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__LNDaemonConnection_connectWithOptions___block_invoke_2;
  v7[3] = &unk_1E45DDE40;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __41__LNDaemonConnection_connectWithOptions___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDisconnectedWithError:", v9);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "if_auditToken");
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
    }
    v10 = *(void **)(a1 + 32);
    v11[0] = v12;
    v11[1] = v13;
    objc_msgSend(v10, "setAuditToken:", v11);
    objc_msgSend(*(id *)(a1 + 32), "connectUsingListenerEndpoint:", v7);
  }

}

uint64_t __41__LNDaemonConnection_connectWithOptions___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getLNLogCategoryConnection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setDisconnectedWithError:", *(_QWORD *)(a1 + 32));
}

@end
