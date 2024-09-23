@implementation AMSCommerceService

+ (AMSCommerceService)proxyObject
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  v12 = 0;
  objc_msgSend(a1, "sharedConnectionAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__AMSCommerceService_proxyObject__block_invoke;
  v6[3] = &unk_1E2540228;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (AMSCommerceService *)v4;
}

void __33__AMSCommerceService_proxyObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_30);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__AMSCommerceService_proxyObject__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "AMSCommerceService: Failed to create the proxy object (sync). error = %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

+ (AMSCommerceService)proxyObjectAsync
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  v12 = 0;
  objc_msgSend(a1, "sharedConnectionAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AMSCommerceService_proxyObjectAsync__block_invoke;
  v6[3] = &unk_1E2540228;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (AMSCommerceService *)v4;
}

void __38__AMSCommerceService_proxyObjectAsync__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2_2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __38__AMSCommerceService_proxyObjectAsync__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "AMSCommerceService: Failed to create the proxy object (async). error = %{public}@", (uint8_t *)&v5, 0xCu);
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

  v6 = (void *)kSharedConnection;
  kSharedConnection = (uint64_t)v4;

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

  v4 = (void *)kSharedConnection;
  if (!kSharedConnection)
  {
    objc_msgSend(a1, "_createXPCConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)kSharedConnection;
    kSharedConnection = v5;

    objc_msgSend((id)kSharedConnection, "resume");
    v4 = (void *)kSharedConnection;
  }
  return (NSXPCConnection *)v4;
}

+ (OS_dispatch_queue)sharedConnectionAccessQueue
{
  if (_MergedGlobals_91 != -1)
    dispatch_once(&_MergedGlobals_91, &__block_literal_global_3);
  return (OS_dispatch_queue *)(id)qword_1ECEAD058;
}

void __49__AMSCommerceService_sharedConnectionAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSCommerceService.sharedConnection", 0);
  v1 = (void *)qword_1ECEAD058;
  qword_1ECEAD058 = (uint64_t)v0;

}

+ (id)_createXPCConnection
{
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id buf[2];

  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_INFO, "AMSCommerceService: Initializing commerce xpc connection", (uint8_t *)buf, 2u);
  }

  if (getuid() || +[AMSProcessInfo isBuddyRunning](AMSProcessInfo, "isBuddyRunning"))
    v5 = CFSTR("com.apple.commerce");
  else
    v5 = CFSTR("com.apple.commerced");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v5, 0);
  objc_initWeak(buf, a1);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__AMSCommerceService__createXPCConnection__block_invoke;
  v15[3] = &unk_1E253E9A0;
  objc_copyWeak(&v16, buf);
  objc_msgSend(v6, "setInterruptionHandler:", v15);
  v10 = v7;
  v11 = 3221225472;
  v12 = __42__AMSCommerceService__createXPCConnection__block_invoke_2;
  v13 = &unk_1E253E9A0;
  objc_copyWeak(&v14, buf);
  objc_msgSend(v6, "setInvalidationHandler:", &v10);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0ADAC8, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
  return v6;
}

void __42__AMSCommerceService__createXPCConnection__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
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
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "AMSCommerceService: The connection was interrupted.", buf, 2u);
  }

  objc_msgSend(WeakRetained, "sharedConnectionAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AMSCommerceService__createXPCConnection__block_invoke_10;
  block[3] = &unk_1E253E9A0;
  objc_copyWeak(&v7, v1);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __42__AMSCommerceService__createXPCConnection__block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSharedConnection:", 0);

}

void __42__AMSCommerceService__createXPCConnection__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[AMSLogConfig sharedAccountsConfig](AMSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "AMSCommerceService: The connection was invalidated.", buf, 2u);
  }

  objc_msgSend(WeakRetained, "sharedConnectionAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AMSCommerceService__createXPCConnection__block_invoke_11;
  block[3] = &unk_1E253E9A0;
  objc_copyWeak(&v7, v1);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
}

void __42__AMSCommerceService__createXPCConnection__block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSharedConnection:", 0);

}

@end
