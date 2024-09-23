@implementation AMSMultiUserService

+ (AMSMultiUserServiceProtocol)proxyObject
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  NSObject *v13;
  id v14;
  _QWORD v15[6];
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  if (v6)
  {
    +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v17 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ is unavailable from amsaccountsd.", buf, 0x20u);

    }
    return (AMSMultiUserServiceProtocol *)0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__51;
    v18 = __Block_byref_object_dispose__51;
    v19 = 0;
    objc_msgSend(a1, "sharedConnectionAccessQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __34__AMSMultiUserService_proxyObject__block_invoke;
    v15[3] = &unk_1E2540228;
    v15[4] = buf;
    v15[5] = a1;
    dispatch_sync(v13, v15);

    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    return (AMSMultiUserServiceProtocol *)v14;
  }
}

void __34__AMSMultiUserService_proxyObject__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  AMSLogKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__AMSMultiUserService_proxyObject__block_invoke_2;
  v8[3] = &unk_1E25441A0;
  v4 = v2;
  v9 = v4;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

+ (NSXPCConnection)sharedConnection
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "sharedConnectionAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)kSharedConnection_0;
  if (!kSharedConnection_0)
  {
    objc_msgSend(a1, "_createXPCConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)kSharedConnection_0;
    kSharedConnection_0 = v5;

    objc_msgSend((id)kSharedConnection_0, "resume");
    v4 = (void *)kSharedConnection_0;
  }
  return (NSXPCConnection *)v4;
}

+ (OS_dispatch_queue)sharedConnectionAccessQueue
{
  if (_MergedGlobals_133 != -1)
    dispatch_once(&_MergedGlobals_133, &__block_literal_global_97);
  return (OS_dispatch_queue *)(id)qword_1ECEAD768;
}

+ (id)_createXPCConnection
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v5;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing amsaccountsd XPC connection.", buf, 0x16u);

  }
  v7 = objc_alloc(MEMORY[0x1E0CB3B38]);
  objc_msgSend(a1, "machServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithMachServiceName:options:", v8, 0);

  AMSLogKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, a1);
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __43__AMSMultiUserService__createXPCConnection__block_invoke;
  v22[3] = &unk_1E253E8B0;
  objc_copyWeak(&v24, (id *)buf);
  v12 = v10;
  v23 = v12;
  objc_msgSend(v9, "setInterruptionHandler:", v22);
  v16 = v11;
  v17 = 3221225472;
  v18 = __43__AMSMultiUserService__createXPCConnection__block_invoke_2;
  v19 = &unk_1E253E8B0;
  objc_copyWeak(&v21, (id *)buf);
  v13 = v12;
  v20 = v13;
  objc_msgSend(v9, "setInvalidationHandler:", &v16);
  objc_msgSend(a1, "serviceInterface", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return v9;
}

+ (NSXPCInterface)serviceInterface
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0AE0C8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_exportMultiUserTokenForHomeIdentifier_generateIfMissing_generateIfInvalid_completion_, 0, 1);

  return (NSXPCInterface *)v2;
}

+ (NSString)machServiceName
{
  return (NSString *)CFSTR("com.apple.amsaccountsd.multiuser");
}

void __50__AMSMultiUserService_sharedConnectionAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSMultiUserService.sharedConnection", 0);
  v1 = (void *)qword_1ECEAD768;
  qword_1ECEAD768 = (uint64_t)v0;

}

+ (BOOL)isConnectionEntitled:(id)a3
{
  void *v3;
  id v4;
  char v5;

  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.private.applemediaservices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

void __34__AMSMultiUserService_proxyObject__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the proxy object (sync). error = %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

+ (AMSMultiUserServiceProtocol)proxyObjectAsync
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  NSObject *v13;
  id v14;
  _QWORD v15[6];
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.amsaccountsd"));

  if (v6)
  {
    +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      v17 = v11;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@ is unavailable from amsaccountsd.", buf, 0x20u);

    }
    return (AMSMultiUserServiceProtocol *)0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__51;
    v18 = __Block_byref_object_dispose__51;
    v19 = 0;
    objc_msgSend(a1, "sharedConnectionAccessQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__AMSMultiUserService_proxyObjectAsync__block_invoke;
    v15[3] = &unk_1E2540228;
    v15[4] = buf;
    v15[5] = a1;
    dispatch_sync(v13, v15);

    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    return (AMSMultiUserServiceProtocol *)v14;
  }
}

void __39__AMSMultiUserService_proxyObjectAsync__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  AMSLogKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AMSMultiUserService_proxyObjectAsync__block_invoke_2;
  v8[3] = &unk_1E25441A0;
  v4 = v2;
  v9 = v4;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __39__AMSMultiUserService_proxyObjectAsync__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the proxy object (async). error = %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

+ (void)setSharedConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedConnectionAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)kSharedConnection_0;
  kSharedConnection_0 = (uint64_t)v4;

}

void __43__AMSMultiUserService__createXPCConnection__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The connection was interrupted.", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "sharedConnectionAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AMSMultiUserService__createXPCConnection__block_invoke_85;
  block[3] = &unk_1E253E9A0;
  objc_copyWeak(&v11, v2);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void __43__AMSMultiUserService__createXPCConnection__block_invoke_85(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSharedConnection:", 0);

}

void __43__AMSMultiUserService__createXPCConnection__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = AMSSetLogKey(*(void **)(a1 + 32));
  +[AMSLogConfig sharedAccountsMultiUserConfig](AMSLogConfig, "sharedAccountsMultiUserConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The connection was invalidated.", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "sharedConnectionAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AMSMultiUserService__createXPCConnection__block_invoke_86;
  block[3] = &unk_1E253E9A0;
  objc_copyWeak(&v11, v2);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

void __43__AMSMultiUserService__createXPCConnection__block_invoke_86(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSharedConnection:", 0);

}

@end
