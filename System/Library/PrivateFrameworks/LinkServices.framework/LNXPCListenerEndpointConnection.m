@implementation LNXPCListenerEndpointConnection

- (LNXPCListenerEndpointConnection)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 appIntentsEnabledOnly:(BOOL)a7 userIdentity:(id)a8 listenerEndpoint:(id)a9 auditToken:(id *)a10 error:(id *)a11
{
  _BOOL8 v12;
  id v18;
  LNXPCListenerEndpointConnection *v19;
  LNXPCListenerEndpointConnection *v20;
  __int128 v21;
  LNXPCListenerEndpointConnection *v22;
  _OWORD v24[2];
  objc_super v25;

  v12 = a7;
  v18 = a9;
  v25.receiver = self;
  v25.super_class = (Class)LNXPCListenerEndpointConnection;
  v19 = -[LNConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:](&v25, sel_initWithBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_appIntentsEnabledOnly_userIdentity_error_, a3, a4, a5, a6, v12, a8, a11);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_listenerEndpoint, a9);
    v21 = *(_OWORD *)&a10->var0[4];
    v24[0] = *(_OWORD *)a10->var0;
    v24[1] = v21;
    -[LNConnection setAuditToken:](v20, "setAuditToken:", v24);
    v22 = v20;
  }

  return v20;
}

- (void)connectWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _BYTE v16[32];
  objc_super v17;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LNXPCListenerEndpointConnection;
  -[LNConnection connectWithOptions:](&v17, sel_connectWithOptions_, v4);
  -[LNConnection auditToken](self, "auditToken");
  if (+[LNEntitlementsValidator validateEntitlement:auditToken:validator:](LNEntitlementsValidator, "validateEntitlement:auditToken:validator:", CFSTR("com.apple.private.appintents.xpc-host"), v16, &__block_literal_global_11708))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[LNXPCListenerEndpointConnection listenerEndpoint](self, "listenerEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithListenerEndpoint:", v6);
    -[LNConnection setXPCConnection:](self, "setXPCConnection:", v7);

    -[LNConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnection bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LNConnectionHostXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ln_configureWithBundleIdentifier:interface:", v9, v10);

    -[LNConnection xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

    objc_initWeak(location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__LNXPCListenerEndpointConnection_connectWithOptions___block_invoke_12;
    v14[3] = &unk_1E45DE240;
    objc_copyWeak(&v15, location);
    -[LNConnection setUpConnectionContextWithAssertions:completionHandler:](self, "setUpConnectionContextWithAssertions:completionHandler:", 0, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    LNConnectionErrorWithCode(1015);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getLNLogCategoryConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v12;
      _os_log_impl(&dword_1A18F6000, v13, OS_LOG_TYPE_ERROR, "Unable to connect using an XPC listener endpoint: %{public}@", (uint8_t *)location, 0xCu);
    }

    -[LNConnection setDisconnectedWithError:](self, "setDisconnectedWithError:", v12);
  }

}

- (BOOL)refreshWithOptions:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNXPCListenerEndpointConnection;
  v4 = -[LNConnection refreshWithOptions:](&v6, sel_refreshWithOptions_, a3);
  if (v4)
    -[LNConnection setConnected](self, "setConnected");
  return v4;
}

- (void)acquireAssertionsForConnectionOperation:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[LNConnection queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  getLNLogCategoryConnection();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[LNConnection logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "%{public}@ Assertion is not required for XPC listener endpoint connection", (uint8_t *)&v7, 0xCu);

  }
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
}

void __54__LNXPCListenerEndpointConnection_connectWithOptions___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[16];
  __int128 v19;
  uint8_t buf[16];
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    getLNLogCategoryConnection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_ERROR, "Unable to connect using an XPC listener endpoint. Failed to set connection context: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v5, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(v5, "setDisconnectedWithError:", v3);
  }
  else
  {
    *(_OWORD *)buf = 0u;
    v21 = 0u;
    objc_msgSend(WeakRetained, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "auditToken");
    }
    else
    {
      *(_OWORD *)buf = 0u;
      v21 = 0u;
    }

    if (v5)
    {
      objc_msgSend(v5, "auditToken");
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }
    *(_OWORD *)v18 = *(_OWORD *)buf;
    v19 = v21;
    if (*(_QWORD *)buf == (_QWORD)v16
      && *(_QWORD *)&buf[8] == *((_QWORD *)&v16 + 1)
      && (_QWORD)v21 == (_QWORD)v17
      && *((_QWORD *)&v21 + 1) == *((_QWORD *)&v17 + 1))
    {
      objc_msgSend(v5, "setConnected");
    }
    else
    {
      LNConnectionErrorWithCode(1016);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      getLNLogCategoryConnection();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 138543362;
        *(_QWORD *)&v18[4] = v13;
        _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_ERROR, "Unable to connect using an XPC listener endpoint: %{public}@", v18, 0xCu);
      }

      objc_msgSend(v5, "xpcConnection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidate");

      objc_msgSend(v5, "setDisconnectedWithError:", v13);
    }
  }

}

uint64_t __54__LNXPCListenerEndpointConnection_connectWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

@end
