@implementation AMSServerDataCacheService

- (AMSServerDataCacheService)init
{
  AMSServerDataCacheService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSServerDataCacheService;
  v2 = -[AMSServerDataCacheService init](&v7, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.AppleMediaServices.serverDataCacheService", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__61;
  v16 = __Block_byref_object_dispose__61;
  v17 = 0;
  -[AMSServerDataCacheService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E2545748;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newRemoteConnection");
    objc_msgSend(*(id *)(a1 + 32), "setConnection:", v2);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke_2;
  v7[3] = &unk_1E2545720;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __51__AMSServerDataCacheService_proxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dealloc
{
  objc_super v3;

  -[AMSServerDataCacheService _removeRemoteConnection](self, "_removeRemoteConnection");
  v3.receiver = self;
  v3.super_class = (Class)AMSServerDataCacheService;
  -[AMSServerDataCacheService dealloc](&v3, sel_dealloc);
}

- (id)_makeRemoteConnectionInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0AE128);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setUpCacheForAccount_completion_, 0, 0);
  return v2;
}

- (id)_newRemoteConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[AMSServerDataCacheService queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.xpc.amsserverdatacacheservice"), 0);
  -[AMSServerDataCacheService queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v5);

  -[AMSServerDataCacheService _makeRemoteConnectionInterface](self, "_makeRemoteConnectionInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v6);

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AMSServerDataCacheService__newRemoteConnection__block_invoke;
  v11[3] = &unk_1E253E9A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "setInvalidationHandler:", v11);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __49__AMSServerDataCacheService__newRemoteConnection__block_invoke_2;
  v9[3] = &unk_1E253E9A0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  objc_msgSend(v4, "resume");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v4;
}

void __49__AMSServerDataCacheService__newRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeRemoteConnection");

}

void __49__AMSServerDataCacheService__newRemoteConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeRemoteConnection");

}

- (void)_removeRemoteConnection
{
  void *v3;

  -[AMSServerDataCacheService connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AMSServerDataCacheService setConnection:](self, "setConnection:", 0);
}

- (id)reminderEventsForAccount:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  objc_msgSend(a3, "ams_DSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) == 0)
  {
    v22 = CFSTR("Feature disabled");
    v23 = CFSTR("ServerDataCache is not enabled");
    v24 = 11;
LABEL_10:
    AMSError(v24, v22, v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithError:", v25);

    v26 = v13;
    goto LABEL_11;
  }
  if (!v12)
  {
    v22 = CFSTR("No dsid for account");
    v23 = CFSTR("Account is missing dsid");
    v24 = 12;
    goto LABEL_10;
  }
  +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_opt_class();
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v31 = v16;
    v32 = 2114;
    v33 = v17;
    v34 = 2114;
    v35 = v11;
    v36 = 2114;
    v37 = v10;
    v38 = 2114;
    v39 = v12;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving %{public}@ events for %{public}@ %{public}@.", buf, 0x34u);

  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __86__AMSServerDataCacheService_reminderEventsForAccount_service_eventType_networkPolicy___block_invoke;
  v28[3] = &unk_1E253E120;
  v18 = v13;
  v29 = v18;
  -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "completionHandlerAdapter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reminderEventsForAccountDSID:service:eventType:networkPolicy:completion:", v12, v10, v11, a6, v20);

  v21 = v18;
LABEL_11:

  return v13;
}

uint64_t __86__AMSServerDataCacheService_reminderEventsForAccount_service_eventType_networkPolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)granularNotificationSettingsForAccountDSID:(id)a3 bundleID:(id)a4 networkPolicy:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving granular notification settings for %{public}@ %{public}@.", buf, 0x2Au);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __95__AMSServerDataCacheService_granularNotificationSettingsForAccountDSID_bundleID_networkPolicy___block_invoke;
    v20[3] = &unk_1E253E120;
    v15 = v10;
    v21 = v15;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completionHandlerAdapter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "granularNotificationSettingsForAccountDSID:bundleID:networkPolicy:completion:", v8, v9, a5, v17);

    v18 = v15;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithError:", v18);
  }

  return v10;
}

uint64_t __95__AMSServerDataCacheService_granularNotificationSettingsForAccountDSID_bundleID_networkPolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)dataForAccountDSID:(id)a3 cacheTypeID:(id)a4 networkPolicy:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v9;
      v30 = 2048;
      v31 = a5;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrieving data for %{public}@ cacheTypeId: %{public}@, networkPolicy: %ld.", buf, 0x34u);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__AMSServerDataCacheService_dataForAccountDSID_cacheTypeID_networkPolicy___block_invoke;
    v20[3] = &unk_1E253E120;
    v15 = v10;
    v21 = v15;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completionHandlerAdapter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataForAccountDSID:cacheTypeID:networkPolicy:completion:", v8, v9, a5, v17);

    v18 = v15;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithError:", v18);
  }

  return v10;
}

uint64_t __74__AMSServerDataCacheService_dataForAccountDSID_cacheTypeID_networkPolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)setUpCacheForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ams_DSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up cache for dsid %{public}@.", buf, 0x20u);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__AMSServerDataCacheService_setUpCacheForAccount___block_invoke;
    v17[3] = &unk_1E253E120;
    v11 = v5;
    v18 = v11;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completionHandlerAdapter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUpCacheForAccount:completion:", v4, v13);

    v14 = v11;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v15);

  }
  return v5;
}

uint64_t __50__AMSServerDataCacheService_setUpCacheForAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)setUpCacheForAccountDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up cache for dsid %{public}@.", buf, 0x20u);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__AMSServerDataCacheService_setUpCacheForAccountDSID___block_invoke;
    v16[3] = &unk_1E253E120;
    v10 = v5;
    v17 = v10;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completionHandlerAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUpCacheForAccountDSID:completion:", v4, v12);

    v13 = v10;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v14);

  }
  return v5;
}

uint64_t __54__AMSServerDataCacheService_setUpCacheForAccountDSID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)tearDownCacheForAccountDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Tearing down cache for dsid %{public}@.", buf, 0x20u);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__AMSServerDataCacheService_tearDownCacheForAccountDSID___block_invoke;
    v16[3] = &unk_1E253E120;
    v10 = v5;
    v17 = v10;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "completionHandlerAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tearDownCacheForAccountDSID:completion:", v4, v12);

    v13 = v10;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v14);

  }
  return v5;
}

uint64_t __57__AMSServerDataCacheService_tearDownCacheForAccountDSID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      v25 = 2114;
      v26 = v6;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating cache for %{public}@ with payload", buf, 0x20u);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCachePayload___block_invoke;
    v19[3] = &unk_1E253E120;
    v13 = v8;
    v20 = v13;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "completionHandlerAdapter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateCacheForAccountDSID:withCachePayload:completion:", v6, v7, v15);

    v16 = v13;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v17);

  }
  return v8;
}

uint64_t __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCachePayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if ((objc_msgSend((id)objc_opt_class(), "_serverDataCacheFeatureEnabled") & 1) != 0)
  {
    +[AMSLogConfig sharedServerDataCacheConfig](AMSLogConfig, "sharedServerDataCacheConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating data for %{public}@ cacheTypeIds: %{public}@", buf, 0x2Au);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCacheTypeIDs___block_invoke;
    v19[3] = &unk_1E253E120;
    v13 = v8;
    v20 = v13;
    -[AMSServerDataCacheService proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "completionHandlerAdapter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateCacheForAccountDSID:withCacheTypeIDs:completion:", v6, v7, v15);

    v16 = v13;
  }
  else
  {
    AMSError(11, CFSTR("Feature disabled"), CFSTR("ServerDataCache is not enabled"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v17);

  }
  return v8;
}

uint64_t __72__AMSServerDataCacheService_updateCacheForAccountDSID_withCacheTypeIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (BOOL)_serverDataCacheFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
