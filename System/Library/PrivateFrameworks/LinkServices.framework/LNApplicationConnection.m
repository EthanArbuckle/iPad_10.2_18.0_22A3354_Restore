@implementation LNApplicationConnection

- (BOOL)shouldRefreshWithOptions:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v23;
  objc_super v24;
  id v25;
  _BYTE v26[32];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[LNConnection state](self, "state") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNApplicationConnection.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnected"));

  }
  v7 = v5;
  v8 = v7;
  if (!v7 || (v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EE650580), v8, (v9 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNApplicationConnection.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("IFCastIfConforms(options, LNApplicationConnectionOptions) != nil"));

  }
  v11 = (void *)MEMORY[0x1E0D016E0];
  -[LNConnection auditToken](self, "auditToken");
  objc_msgSend(v11, "tokenFromAuditToken:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "pid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v13, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (!v14)
  {
    getLNLogCategoryConnection();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      v29 = 2114;
      v30 = v13;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get process handle for pid %{public}@, %{public}@", buf, 0x20u);

    }
  }
  if (objc_msgSend(v14, "isDaemon"))
  {
    getLNLogCategoryConnection();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[LNConnection logPrefix](self, "logPrefix");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2114;
      v30 = v13;
      _os_log_impl(&dword_1A18F6000, v18, OS_LOG_TYPE_INFO, "%{public}@ pid %{public}@ is a daemon; refresh is not required",
        buf,
        0x16u);

    }
    v20 = 0;
  }
  else if (objc_msgSend(v8, "isForeground"))
  {
    getLNLogCategoryConnection();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v21, OS_LOG_TYPE_INFO, "Should refresh because we need to launch into the foreground", buf, 2u);
    }

    v20 = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNApplicationConnection;
    v20 = -[LNConnection shouldRefreshWithOptions:](&v24, sel_shouldRefreshWithOptions_, v8);
  }

  return v20;
}

- (void)handleConnectionActionResponse:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[LNConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNApplicationConnection.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionResponse"));

  }
  if (-[LNConnection state](self, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNApplicationConnection.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.state == LNConnectionStateConnecting"));

    if (v5)
      goto LABEL_5;
LABEL_7:
    v24 = 0u;
    v25 = 0u;
    goto LABEL_8;
  }
  if (!v5)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v5, "auditToken");
LABEL_8:
  v23[0] = v24;
  v23[1] = v25;
  -[LNConnection setAuditToken:](self, "setAuditToken:", v23);
  v9 = objc_alloc(MEMORY[0x1E0CB3B38]);
  objc_msgSend(v5, "listenerEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithListenerEndpoint:", v10);
  -[LNConnection setXPCConnection:](self, "setXPCConnection:", v11);

  LNConnectionHostXPCInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRemoteObjectInterface:", v12);

  v26 = CFSTR("bundleIdentifier");
  -[LNConnection bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnection xpcConnection](self, "xpcConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUserInfo:", v15);

  -[LNConnection xpcConnection](self, "xpcConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setUUID:", v18);

  -[LNConnection xpcConnection](self, "xpcConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resume");

  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__LNApplicationConnection_handleConnectionActionResponse___block_invoke;
  v20[3] = &unk_1E45DE240;
  objc_copyWeak(&v21, &location);
  -[LNConnection setUpConnectionContextWithAssertions:completionHandler:](self, "setUpConnectionContextWithAssertions:completionHandler:", 0, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (LNApplicationConnection)initWithBundleIdentifier:(id)a3 bundleURL:(id)a4 bundleType:(id)a5 appBundleIdentifier:(id)a6 appIntentsEnabledOnly:(BOOL)a7 userIdentity:(id)a8 error:(id *)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  LNEmbeddedApplicationConnection *v20;
  LNApplicationConnection *p_super;
  objc_super v23;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (-[LNApplicationConnection isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v20 = -[LNEmbeddedApplicationConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:]([LNEmbeddedApplicationConnection alloc], "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:", v15, v16, v17, v18, v10, v19, a9);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)LNApplicationConnection;
    v20 = -[LNConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:](&v23, sel_initWithBundleIdentifier_bundleURL_bundleType_appBundleIdentifier_appIntentsEnabledOnly_userIdentity_error_, v15, v16, v17, v18, v10, v19, a9);
    self = &v20->super;
  }
  p_super = &v20->super;

  return p_super;
}

- (LNApplicationConnection)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  LNApplicationConnection *v6;

  v4 = a3;
  +[LNConnectionManager sharedInstance](LNConnectionManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionForBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:mangledTypeName:userIdentity:error:", v4, 0, 0, 0, 0, 0, 0);
  v6 = (LNApplicationConnection *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __58__LNApplicationConnection_handleConnectionActionResponse___block_invoke(uint64_t a1, void *a2)
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

@end
