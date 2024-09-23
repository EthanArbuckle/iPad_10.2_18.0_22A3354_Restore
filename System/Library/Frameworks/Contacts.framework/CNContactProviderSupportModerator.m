@implementation CNContactProviderSupportModerator

+ (OS_os_log)log
{
  if (log_cn_once_token_0_5 != -1)
    dispatch_once(&log_cn_once_token_0_5, &__block_literal_global_82);
  return (OS_os_log *)(id)log_cn_once_object_0_5;
}

void __40__CNContactProviderSupportModerator_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.provider", "moderator");
  v1 = (void *)log_cn_once_object_0_5;
  log_cn_once_object_0_5 = (uint64_t)v0;

}

+ (CNContactProviderSupportModerator)sharedInstance
{
  if (sharedInstance_cn_once_token_1 != -1)
    dispatch_once(&sharedInstance_cn_once_token_1, &__block_literal_global_3_8);
  return (CNContactProviderSupportModerator *)(id)sharedInstance_cn_once_object_1;
}

void __51__CNContactProviderSupportModerator_sharedInstance__block_invoke()
{
  CNContactProviderSupportModerator *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactProviderSupportModerator);
  v1 = (void *)sharedInstance_cn_once_object_1;
  sharedInstance_cn_once_object_1 = (uint64_t)v0;

}

- (CNContactProviderSupportModerator)init
{
  CNContactProviderSupportModerator *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CNCache *cache;
  CNUnfairLock *v7;
  CNUnfairLock *lock;
  void *v9;
  void *v10;
  uint64_t v11;
  CNScheduler *workQueue;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *workSemaphore;
  CNContactProviderSupportModerator *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CNContactProviderSupportModerator;
  v2 = -[CNContactProviderSupportModerator init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D139B0]);
    objc_msgSend(MEMORY[0x1E0D139B0], "nonatomicCacheScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithResourceScheduler:", v4);
    cache = v2->_cache;
    v2->_cache = (CNCache *)v5;

    v7 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E0D13BD8]);
    lock = v2->_lock;
    v2->_lock = v7;

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.provider.moderator"));
    workQueue = v2->_workQueue;
    v2->_workQueue = (CNScheduler *)v11;

    v13 = dispatch_semaphore_create(1);
    workSemaphore = v2->_workSemaphore;
    v2->_workSemaphore = (OS_dispatch_semaphore *)v13;

    v15 = v2;
  }

  return v2;
}

- (id)synchronizeProviderDomainUsingSession:(id)a3 bundleIdentifier:(id)a4 providerHost:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v44 = v9;
    v45 = 2114;
    v46 = v8;
    _os_log_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_INFO, "Sync session requested for %{public}@ (%{public}@)", buf, 0x16u);
  }
  if (!v9)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_52_3);
    v12 = CNGuardOSLog_cn_once_object_0_4;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNContactProviderSupportModerator synchronizeProviderDomainUsingSession:bundleIdentifier:providerHost:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  objc_opt_class();
  v20 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (!v22)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_52_3);
    v23 = CNGuardOSLog_cn_once_object_0_4;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT))
      -[CNContactProviderSupportModerator synchronizeProviderDomainUsingSession:bundleIdentifier:providerHost:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
  }
  -[CNContactProviderSupportModerator lock](self, "lock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v9;
  v40 = v11;
  v41 = v22;
  v42 = v8;
  v32 = v8;
  v33 = v22;
  v34 = v11;
  v35 = v9;
  CNResultWithLock();
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "future");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

id __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = a1[6];
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[5];
      *(_DWORD *)buf = 138543362;
      v35 = v6;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_INFO, "Joining existing sync session for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v7 = a1[5];
      *(_DWORD *)buf = 138543362;
      v35 = v7;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_INFO, "Creating new sync session for %{public}@", buf, 0xCu);
    }
    v8 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    objc_msgSend(a1[4], "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, a1[5]);

    objc_msgSend(a1[4], "workSemaphore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_10;
    v27[3] = &unk_1E29FBBE0;
    v13 = v10;
    v28 = v13;
    v29 = a1[6];
    v30 = a1[5];
    v31 = a1[7];
    v32 = a1[8];
    v3 = v8;
    v33 = v3;
    objc_msgSend(v11, "performBlock:", v27);

    objc_initWeak((id *)buf, a1[4]);
    objc_msgSend(v3, "future");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_2;
    v22[3] = &unk_1E29FBC08;
    v23 = a1[6];
    v24 = a1[5];
    v25 = a1[8];
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v14, "addSuccessBlock:", v22);

    objc_msgSend(v3, "future");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_14;
    v17[3] = &unk_1E29FBC30;
    v18 = a1[6];
    v19 = a1[5];
    v20 = a1[8];
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v15, "addFailureBlock:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v26);

    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v2, v3))
  {
    v4 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_10_cold_1(a1, v4);
  }
  v5 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Performing sync session for %{public}@", buf, 0xCu);
  }
  v8 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_11;
  v10[3] = &unk_1E29FAA10;
  v9 = *(_QWORD *)(a1 + 64);
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v7, "synchronizeUsing:bundleIdentifier:completionHandler:", v9, v8, v10);

}

intptr_t __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    v5 = v2;
    objc_msgSend(v3, "synchronizationReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Sync session completed successfully for %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "evictPromiseForBundleIdentifier:", *(_QWORD *)(a1 + 40));

}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_14_cold_1(a1, v4, (uint64_t)v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "evictPromiseForBundleIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)evictPromiseForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactProviderSupportModerator lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  CNRunWithLock();

}

void __69__CNContactProviderSupportModerator_evictPromiseForBundleIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_INFO, "Clearing existing sync session for %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

+ (id)synchronizeAllUsingSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CNContactProviderSupportModerator_synchronizeAllUsingSession___block_invoke;
  v9[3] = &unk_1E29FBC80;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __64__CNContactProviderSupportModerator_synchronizeAllUsingSession___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  __int128 v24;
  id obj;
  _TtC8Contacts28CNContactProviderSupportHost *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactProviderSupportCache sharedCache](_TtC8Contacts29CNContactProviderSupportCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNContactProviderSupportModerator sharedInstance](CNContactProviderSupportModerator, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(_TtC8Contacts28CNContactProviderSupportHost);
  v4 = v1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v35 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_INFO, "Will synchronize %lu providers", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138543362;
    v24 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timestamp");
        v14 = v13;

        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v24;
          v35 = v10;
          _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Will sync %{public}@", buf, 0xCu);
        }
        objc_msgSend(v28, "synchronizeProviderDomainUsingSession:bundleIdentifier:providerHost:", *(_QWORD *)(a1 + 32), v10, v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v16 = (id)objc_msgSend(v15, "result:", &v29);
        v17 = v29;
        objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeProvider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timestamp");
        v21 = v20;

        objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v21 - v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v10;
          v36 = 2114;
          v37 = v22;
          _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Did sync %{public}@ (%{public}@)", buf, 0x16u);
        }
        if (v17 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v35 = v10;
          v36 = 2114;
          v37 = v17;
          _os_log_error_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_ERROR, "Error syncing %{public}@: %{public}@", buf, 0x16u);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v7);
  }

  return MEMORY[0x1E0C9AAB0];
}

- (CNCache)cache
{
  return self->_cache;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_semaphore)workSemaphore
{
  return self->_workSemaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workSemaphore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)synchronizeProviderDomainUsingSession:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 providerHost:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘providerHost’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)synchronizeProviderDomainUsingSession:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 providerHost:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘bundleIdentifier’ must be nonnull", a5, a6, a7, a8, 0);
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Timeout waiting to perform sync session for %{public}@", (uint8_t *)&v3, 0xCu);
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_14_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v4, "synchronizationReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = a3;
  _os_log_error_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_ERROR, "Sync session failed for %{public}@ (%{public}@) with error: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
