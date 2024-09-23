@implementation LNExtensionConnection

- (BOOL)refreshWithOptions:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNExtensionConnection;
  v4 = -[LNConnection refreshWithOptions:](&v6, sel_refreshWithOptions_, a3);
  if (v4)
    -[LNConnection setConnected](self, "setConnected");
  return v4;
}

void __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;
  _QWORD aBlock[4];
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_2;
  aBlock[3] = &unk_1E45DDE18;
  v16 = *(id *)(a1 + 32);
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setDisconnectedWithError:", v9);
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v8, "if_auditToken");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
    v11 = *(void **)(a1 + 40);
    v12[0] = v13;
    v12[1] = v14;
    objc_msgSend(v11, "setAuditToken:", v12);
    objc_msgSend(*(id *)(a1 + 40), "connectUsingListenerEndpoint:", v7);
  }
  v10[2](v10);

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
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  getLNLogCategoryConnection();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v7;
    _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_INFO, "%{public}@ Establishing a direct connection to the extension via a listener endpoint", buf, 0xCu);

  }
  -[LNConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[LNConnection state](self, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNExtensionConnection.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnecting"));

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

  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__LNExtensionConnection_connectUsingListenerEndpoint___block_invoke;
  v15[3] = &unk_1E45DE240;
  objc_copyWeak(&v16, (id *)buf);
  -[LNConnection setUpConnectionContextWithAssertions:completionHandler:](self, "setUpConnectionContextWithAssertions:completionHandler:", 1, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (void)connectWithOptions:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LNExtensionConnection;
  v4 = a3;
  -[LNConnection connectWithOptions:](&v5, sel_connectWithOptions_, v4);
  getpid();
  if (sandbox_check())
    -[LNExtensionConnection connectDirectlyWithOptions:](self, "connectDirectlyWithOptions:", v4, "com.apple.linkd.extension");
  else
    -[LNExtensionConnection connectUsingMediatorWithOptions:](self, "connectUsingMediatorWithOptions:", v4, "com.apple.linkd.extension");

}

- (void)connectUsingMediatorWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  LNExtensionConnection *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  os_activity_scope_state_s buf;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.opaque[0]) = 138543362;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ Establishing a mediator connection to the extension", (uint8_t *)&buf, 0xCu);

  }
  -[LNConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.linkd.extension"), 0);
  LNDaemonExtensionXPCInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  -[LNConnection activity](self, "activity");
  v10 = objc_claimAutoreleasedReturnValue();
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v10, &buf);
  -[LNConnection queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setQueue:", v11);

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke;
  v20[3] = &unk_1E45DDE18;
  v20[4] = v10;
  objc_msgSend(v8, "setInterruptionHandler:", v20);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_14;
  v19[3] = &unk_1E45DDE18;
  v19[4] = v10;
  objc_msgSend(v8, "setInvalidationHandler:", v19);
  objc_msgSend(v8, "resume");
  objc_msgSend(v8, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_15;
  v16[3] = &unk_1E45DD7F8;
  v15 = v8;
  v17 = v15;
  v18 = self;
  objc_msgSend(v13, "getConnectionHostInterfaceForBundleIdentifier:completionHandler:", v14, v16);

  os_activity_scope_leave(&buf);
}

- (void)invalidateExtensionProcess
{
  _EXExtensionProcess *extensionProcess;
  _EXExtensionProcess *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  extensionProcess = self->_extensionProcess;
  if (extensionProcess)
  {
    -[_EXExtensionProcess invalidate](extensionProcess, "invalidate");
    v4 = self->_extensionProcess;
    self->_extensionProcess = 0;

    getLNLogCategoryConnection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ Invalidated extension process on dealloc", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[LNExtensionConnection invalidateExtensionProcess](self, "invalidateExtensionProcess");
  v3.receiver = self;
  v3.super_class = (Class)LNExtensionConnection;
  -[LNConnection dealloc](&v3, sel_dealloc);
}

- (void)connectDirectlyWithOptions:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  id v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  getLNLogCategoryConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v5;

  }
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = objc_alloc(MEMORY[0x1E0CA5848]);
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:error:", v8, &v32);
  v10 = v32;

  if (v9)
  {
    v30 = v10;
    v31 = 0;
    +[LNExtensionHostConfigurator extensionProcessWithExtensionRecord:extensionType:error:](LNExtensionHostConfigurator, "extensionProcessWithExtensionRecord:extensionType:error:", v9, &v31, &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;

    -[LNExtensionConnection setExtensionProcess:](self, "setExtensionProcess:", v11);
    -[LNExtensionConnection extensionProcess](self, "extensionProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[LNExtensionConnection extensionProcess](self, "extensionProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "auditToken");
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
      }
      v27[0] = v28;
      v27[1] = v29;
      -[LNConnection setAuditToken:](self, "setAuditToken:", v27);

      -[LNExtensionConnection extensionProcess](self, "extensionProcess");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      objc_msgSend(v18, "makeXPCConnectionWithError:", &v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v26;

      -[LNConnection setXPCConnection:](self, "setXPCConnection:", v19);
      -[LNConnection xpcConnection](self, "xpcConnection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[LNConnection xpcConnection](self, "xpcConnection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNConnection bundleIdentifier](self, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LNConnectionHostXPCInterface();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ln_configureWithBundleIdentifier:interface:", v23, v24);

        -[LNConnection xpcConnection](self, "xpcConnection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "resume");

        -[LNConnection setConnected](self, "setConnected");
      }
      else
      {
        -[LNConnection setDisconnectedWithError:](self, "setDisconnectedWithError:", v20);
      }
      v12 = v20;
    }
    else
    {
      getLNLogCategoryConnection();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[LNConnection logPrefix](self, "logPrefix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v17;
        v35 = 2114;
        v36 = v12;
        _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_ERROR, "%{public}@ No extension process: %{public}@", buf, 0x16u);

      }
      -[LNConnection setDisconnectedWithError:](self, "setDisconnectedWithError:", v12);
    }
    v10 = v12;
  }
  else
  {
    -[LNConnection setDisconnectedWithError:](self, "setDisconnectedWithError:", v10);
  }

}

- (id)extensionIdentityWithExtensionPointIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[LNConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a4)
    *a4 = 0;
  v8 = objc_alloc(MEMORY[0x1E0CAA560]);
  v9 = (void *)MEMORY[0x1E0CB3880];
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("bundleIdentifier = %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithExtensionPointIdentifier:predicate:", v6, v11);

  objc_msgSend(MEMORY[0x1E0CAA568], "executeQuery:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      getLNLogCategoryConnection();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[LNConnection bundleIdentifier](self, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "url");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v15;
        v26 = 2112;
        v27 = v17;

      }
    }
    objc_msgSend(v13, "firstObject");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[LNConnection bundleIdentifier](self, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("LNConnectionErrorDomain"), 1100, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (_EXExtensionProcess)extensionProcess
{
  return self->_extensionProcess;
}

- (void)setExtensionProcess:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProcess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProcess, 0);
}

void __54__LNExtensionConnection_connectUsingListenerEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    getLNLogCategoryConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_ERROR, "Failed to set connection context: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v5, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(v5, "setDisconnectedWithError:", v3);
  }
  else
  {
    objc_msgSend(WeakRetained, "setConnected");
  }

}

void __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  getLNLogCategoryConnection();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A18F6000, v1, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been interrupted", v2, 2u);
  }

  os_activity_scope_leave(&state);
}

void __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_14(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  getLNLogCategoryConnection();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A18F6000, v1, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been invalidated", v2, 2u);
  }

  os_activity_scope_leave(&state);
}

uint64_t __57__LNExtensionConnection_connectUsingMediatorWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
