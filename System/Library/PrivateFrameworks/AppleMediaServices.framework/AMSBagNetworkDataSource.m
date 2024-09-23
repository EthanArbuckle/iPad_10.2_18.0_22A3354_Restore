@implementation AMSBagNetworkDataSource

void __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
      AMSLogKey();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      v23 = (void *)v9;
      if (v9)
      {
        AMSLogKey();
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v22);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(*(void **)(a1 + 32));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v13;
      v28 = 2114;
      v29 = v18;
      v30 = 2114;
      v31 = v20;
      v32 = 2114;
      v33 = v21;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch value for URL variable. variable = %{public}@ | account ID = %{public}@ | error = %{public}@.", buf, 0x2Au);

      if (v23)
      {

        v13 = (void *)v22;
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "ams_cookies");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke_40;
    v24[3] = &unk_1E253D2F8;
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v14, "ams_firstObjectPassingTest:", v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v15, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  }
}

- (AMSBagNetworkDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 accountProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSBagNetworkDataSource *v15;
  AMSBagNetworkDataSource *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *defaultValues;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *processAccountStoreDidChangeNotificationQueue;
  NSString *cachedStorefront;
  NSObject *v23;
  uint64_t v24;
  AMSObserver *v25;
  uint64_t v26;
  AMSObserver *accountsChangedObserver;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id location;
  objc_super v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v40.receiver = self;
  v40.super_class = (Class)AMSBagNetworkDataSource;
  v15 = -[AMSBagNetworkDataSource init](&v40, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountProvider, a6);
    v16->_cachedDataAccessLock = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    defaultValues = v16->_defaultValues;
    v16->_defaultValues = v17;

    objc_storeStrong((id *)&v16->_profile, a3);
    objc_storeStrong((id *)&v16->_profileVersion, a4);
    objc_storeStrong((id *)&v16->_processInfo, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBagNetworkDataSource.processAccountStoreDidChangeNotification", v19);
    processAccountStoreDidChangeNotificationQueue = v16->_processAccountStoreDidChangeNotificationQueue;
    v16->_processAccountStoreDidChangeNotificationQueue = (OS_dispatch_queue *)v20;

    cachedStorefront = v16->_cachedStorefront;
    v16->_cachedStorefront = 0;

    objc_initWeak(&location, v16);
    v23 = v16->_processAccountStoreDidChangeNotificationQueue;
    v24 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke;
    block[3] = &unk_1E253E8B0;
    objc_copyWeak(&v38, &location);
    v37 = v13;
    dispatch_async(v23, block);
    v25 = [AMSObserver alloc];
    v31 = v24;
    v32 = 3221225472;
    v33 = __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke_11;
    v34 = &unk_1E253E8D8;
    objc_copyWeak(&v35, &location);
    v26 = -[AMSObserver initWithResultBlock:](v25, "initWithResultBlock:", &v31);
    accountsChangedObserver = v16->_accountsChangedObserver;
    v16->_accountsChangedObserver = (AMSObserver *)v26;

    +[AMSAccountsChangedObservable sharedInstance](AMSAccountsChangedObservable, "sharedInstance", v31, v32, v33, v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subscribe:", v16->_accountsChangedObserver);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v16, sel__invalidateCacheNotification_, CFSTR("AMSBagNetworkDataSourceInvalidateCacheNotification"), 0);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (BOOL)isLoaded
{
  void *v3;
  void *v4;
  BOOL v5;

  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (id)defaultValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource defaultValues](self, "defaultValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  if (!v6)
  {
    -[AMSBagNetworkDataSource profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource profileVersion](self, "profileVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBagKeySet defaultValueForKey:profile:profileVersion:](AMSBagKeySet, "defaultValueForKey:profile:profileVersion:", v4, v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AMSBagNetworkDataSource profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagNetworkDataSource profileVersion](self, "profileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagNetworkDataSource processInfo](self, "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountMediaType");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; profile: %@; version: %@; sandbox: %d>"),
    v4,
    self,
    v5,
    v6,
    v8 == AMSAccountMediaTypeAppStoreSandbox);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (NSMutableDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)_updateCachedResult:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
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
  uint64_t v19;
  void *v20;
  AMSBagDataSourceChange *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  AMSBagDataSourceChange *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(_QWORD, _QWORD);
  void (**v42)(void);
  void *v43;
  os_log_t log;
  id v45;
  _QWORD aBlock[5];
  id v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_cachedDataAccessLock);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__AMSBagNetworkDataSource__updateCachedResult___block_invoke;
  aBlock[3] = &unk_1E253E2B0;
  aBlock[4] = self;
  v45 = v5;
  v47 = v45;
  v42 = (void (**)(void))_Block_copy(aBlock);
  -[AMSBagNetworkDataSource dataSourceChangedHandler](self, "dataSourceChangedHandler");
  v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v43)
      v9 = v43;
    else
      v9 = (void *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v7, "ams_keysForChangedValuesComparedToDictionary:", v9);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();

    if (!-[NSObject count](log, "count"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v21 = (AMSBagDataSourceChange *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (AMSBagDataSourceChange *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSBagDataSourceChange OSLogObject](v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3940];
        if (v23)
        {
          v25 = objc_opt_class();
          AMSLogKey();
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v3);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v26;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded bag is equal to the previous bag. dataSourceChangedHandler won't be called.", buf, 0xCu);
        if (v23)
        {

          v26 = (void *)v3;
        }

      }
      goto LABEL_45;
    }
    if (v43)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_44;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      if (v12)
      {
        v14 = objc_opt_class();
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v3);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v15;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Bag data has changed. dataSourceChangedHandler will be called.", buf, 0xCu);
      if (v12)
      {

        v15 = (void *)v3;
      }
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_44;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB3940];
      if (v12)
      {
        v28 = objc_opt_class();
        AMSLogKey();
        v3 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: [%@] "), v28, v3);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v15;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Bag data was initially loaded. dataSourceChangedHandler will be called.", buf, 0xCu);
      if (v12)
      {

        v15 = (void *)v3;
      }
    }

LABEL_44:
    v29 = [AMSBagDataSourceChange alloc];
    -[AMSBagNetworkDataSource profile](self, "profile");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource profileVersion](self, "profileVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "data");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "expirationDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "data");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "expirationDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "loadedBagIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "loadedBagPartialIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "accountIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[AMSBagDataSourceChange initWithProfile:profileVersion:originalData:originalExpirationDate:updatedData:updatedExpirationDate:changedKeys:loadedBagIdentifier:loadedBagPartialIdentifier:accountIdentifier:](v29, "initWithProfile:profileVersion:originalData:originalExpirationDate:updatedData:updatedExpirationDate:changedKeys:loadedBagIdentifier:loadedBagPartialIdentifier:accountIdentifier:", v40, v39, v31, v33, v34, v35, log, v36, v37, v38);

    ((void (**)(_QWORD, AMSBagDataSourceChange *))v41)[2](v41, v21);
LABEL_45:

    goto LABEL_46;
  }
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43 = v16;
  objc_msgSend(v16, "OSLogObject");
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    if (v17)
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v19, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v20;
    _os_log_impl(&dword_18C849000, log, OS_LOG_TYPE_DEFAULT, "%{public}@dataSourceChangedHandler won't be called as one wasn't provided.", buf, 0xCu);
    if (v17)
    {

      v20 = (void *)v3;
    }

  }
LABEL_46:

  v42[2]();
}

void __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke_2(uint64_t a1)
{
  AMSBagDataSourceLoadResult *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AMSBagDataSourceLoadResult *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = [AMSBagDataSourceLoadResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "loadedBagIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "loadedBagPartialIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSBagDataSourceLoadResult initWithData:expirationDate:loadedBagIdentifier:loadedBagPartialIdentifier:](v2, "initWithData:expirationDate:loadedBagIdentifier:loadedBagPartialIdentifier:", v3, v4, v5, v6);

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)loadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(void *, void *, _QWORD);
  void *v15;
  uint64_t v16;
  _QWORD aBlock[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "expired") ^ 1;
  else
    v7 = 0;
  if (objc_msgSend(v6, "expired"))
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagNetworkDataSource profile](self, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagNetworkDataSource profileVersion](self, "profileVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v16;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The backing data for the bag is expired. profile = %{public}@ | profileVersion = %{public}@", buf, 0x2Au);

    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke;
  aBlock[3] = &unk_1E253E928;
  aBlock[4] = self;
  v18 = v4;
  v13 = v4;
  v14 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  if (v7)
  {
    os_unfair_recursive_lock_unlock();
    v14[2](v14, v6, 0);
  }
  else
  {
    -[AMSBagNetworkDataSource _fetchBag](self, "_fetchBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_recursive_lock_unlock();
    objc_msgSend(v15, "addFinishBlock:", v14);

  }
}

- (AMSBagNetworkTaskResult)cachedResult
{
  return self->_cachedResult;
}

void __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newCompletionQueue");
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke_2;
  v16[3] = &unk_1E253E900;
  v17 = v5;
  v9 = *(id *)(a1 + 40);
  v18 = v6;
  v19 = v9;
  v10 = v16;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  AMSLogKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_0;
  block[3] = &unk_1E253DC28;
  v21 = v14;
  v22 = v10;
  v15 = v14;
  dispatch_async(v11, block);

}

- (id)_newCompletionQueue
{
  id v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AppleMediaServices.AMSBagNetworkDataSource.loadCompletionQueue.%lx"), self);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(v3, v4);

  return v5;
}

- (id)_fetchBag
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  AMSBagNetworkTask *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  AMSBagNetworkTask *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_cachedDataAccessLock);
  AMSSetLogKeyIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AMSSetLogKey(v3);
  -[AMSBagNetworkDataSource currentLoadTask](self, "currentLoadTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5 == 0;
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagNetworkDataSource description](self, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v16;
      v33 = 2114;
      v34 = v18;
      v35 = 2114;
      v36 = v19;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading bag from the network. %{public}@", buf, 0x20u);

    }
    v20 = [AMSBagNetworkTask alloc];
    -[AMSBagNetworkDataSource processInfo](self, "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource profile](self, "profile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource profileVersion](self, "profileVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkDataSource accountProvider](self, "accountProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[AMSBagNetworkTask initWithClientInfo:profile:profileVersion:accountProvider:](v20, "initWithClientInfo:profile:profileVersion:accountProvider:", v21, v22, v23, v24);
    -[AMSBagNetworkDataSource setCurrentLoadTask:](self, "setCurrentLoadTask:", v25);

    -[AMSBagNetworkDataSource currentLoadTask](self, "currentLoadTask");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "performFetch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __36__AMSBagNetworkDataSource__fetchBag__block_invoke;
    v28[3] = &unk_1E253E9C8;
    objc_copyWeak(&v30, (id *)buf);
    v29 = v3;
    objc_msgSend(v14, "addFinishBlock:", v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v10;
      v33 = 2114;
      v34 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Awaiting bag load", buf, 0x16u);

    }
    -[AMSBagNetworkDataSource currentLoadTask](self, "currentLoadTask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performFetch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (AMSBagNetworkTask)currentLoadTask
{
  return self->_currentLoadTask;
}

- (AMSBagAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setCurrentLoadTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentLoadTask, a3);
}

uint64_t __47__AMSBagNetworkDataSource__updateCachedResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCachedResult:", *(_QWORD *)(a1 + 40));
}

- (void)setCachedResult:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResult, a3);
}

- (id)dataSourceChangedHandler
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  v3 = _Block_copy(self->_dataSourceChangedHandler);
  os_unfair_recursive_lock_unlock();
  v4 = _Block_copy(v3);

  return v4;
}

+ (void)valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5 completion:(id)a6
{
  +[AMSBagNetworkDataSource _valueForURLVariable:account:clientInfo:sync:completion:](AMSBagNetworkDataSource, "_valueForURLVariable:account:clientInfo:sync:completion:", a3, a4, a5, 0, a6);
}

+ (void)_valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5 sync:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  AMSBagActiveAccountProvider *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = [AMSBagActiveAccountProvider alloc];
    objc_msgSend(v14, "accountMediaType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[AMSBagActiveAccountProvider bagAccountForAccountMediaType:](v17, "bagAccountForAccountMediaType:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        AMSError(7, CFSTR("No account found"), CFSTR("The active account provider didn't provide an account"), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      -[AMSBagActiveAccountProvider bagAccountPromiseForAccountMediaType:](v17, "bagAccountPromiseForAccountMediaType:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke;
  v23[3] = &unk_1E253E9F0;
  v25 = v15;
  v26 = a1;
  v24 = v12;
  v21 = v15;
  v22 = v12;
  objc_msgSend(v16, "addFinishBlock:", v23);

}

void __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accountProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountMediaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bagStorefrontForAccountMediaType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "setCachedStorefront:", v6);
  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
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
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = v11;
      if (v9)
      {
        AMSLogKey();
        v1 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v12, v1);
      }
      else
      {
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: "), v11);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not fetch initial cached storefront. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = (void *)v1;
      }

    }
  }

}

- (void)setCachedStorefront:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *cachedStorefront;

  v4 = a3;
  -[AMSBagNetworkDataSource processAccountStoreDidChangeNotificationQueue](self, "processAccountStoreDidChangeNotificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (NSString *)objc_msgSend(v4, "copy");
  cachedStorefront = self->_cachedStorefront;
  self->_cachedStorefront = v6;

}

- (OS_dispatch_queue)processAccountStoreDidChangeNotificationQueue
{
  return self->_processAccountStoreDidChangeNotificationQueue;
}

- (NSString)bagLoadingPartialIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AMSBagNetworkDataSource processInfo](self, "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagNetworkDataSource profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagNetworkDataSource profileVersion](self, "profileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkTask requestPartialIdentifierForClientInfo:profile:profileVersion:](AMSBagNetworkTask, "requestPartialIdentifierForClientInfo:profile:profileVersion:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)requestPartialIdentifierForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  return +[AMSBagNetworkTask requestPartialIdentifierForClientInfo:profile:profileVersion:](AMSBagNetworkTask, "requestPartialIdentifierForClientInfo:profile:profileVersion:", a3, a4, a5);
}

- (void)setDataSourceDataInvalidatedHandler:(id)a3
{
  id v4;
  void *v5;
  id dataSourceDataInvalidatedHandler;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = (void *)objc_msgSend(v4, "copy");

  dataSourceDataInvalidatedHandler = self->_dataSourceDataInvalidatedHandler;
  self->_dataSourceDataInvalidatedHandler = v5;

  os_unfair_recursive_lock_unlock();
}

- (void)setDataSourceChangedHandler:(id)a3
{
  id v4;
  void *v5;
  id dataSourceChangedHandler;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = (void *)objc_msgSend(v4, "copy");

  dataSourceChangedHandler = self->_dataSourceChangedHandler;
  self->_dataSourceChangedHandler = v5;

  os_unfair_recursive_lock_unlock();
}

- (NSDate)expirationDate
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return (NSDate *)v4;
}

void __36__AMSBagNetworkDataSource__fetchBag__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = AMSSetLogKey(*(void **)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (v3)
      objc_msgSend(WeakRetained, "_updateCachedResult:", v3);
    objc_msgSend(WeakRetained, "setCurrentLoadTask:", 0);
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Someone is loading the bag but not retaining the data source object.", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (id)loadedValuesForKeys:(id)a3 outExpirationDate:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ams_valuesForKeys:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "expirationDate");
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return v11;
}

- (AMSBagNetworkDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSBagActiveAccountProvider *v11;
  AMSBagNetworkDataSource *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AMSBagActiveAccountProvider);
  v12 = -[AMSBagNetworkDataSource initWithProfile:profileVersion:processInfo:accountProvider:](self, "initWithProfile:profileVersion:processInfo:accountProvider:", v10, v9, v8, v11);

  return v12;
}

void __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke_11(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "accountProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountMediaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "associatedAccountIsEqualToAccount:forMediaType:", v6, v8);

  if (v9)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] An account changed.", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(WeakRetained, "_accountStoreDidChange");
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[AMSAccountsChangedObservable sharedInstance](AMSAccountsChangedObservable, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagNetworkDataSource accountsChangedObserver](self, "accountsChangedObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsubscribe:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)AMSBagNetworkDataSource;
  -[AMSBagNetworkDataSource dealloc](&v6, sel_dealloc);
}

- (NSString)cachedStorefront
{
  NSObject *v3;

  -[AMSBagNetworkDataSource processAccountStoreDidChangeNotificationQueue](self, "processAccountStoreDidChangeNotificationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_cachedStorefront;
}

- (id)dataSourceDataInvalidatedHandler
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  v3 = _Block_copy(self->_dataSourceDataInvalidatedHandler);
  os_unfair_recursive_lock_unlock();
  v4 = _Block_copy(v3);

  return v4;
}

- (NSString)descriptionExtended
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[AMSBagNetworkDataSource description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource cachedResult](self, "cachedResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v8);

  return (NSString *)v3;
}

- (void)setDefaultValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource defaultValues](self, "defaultValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  os_unfair_recursive_lock_unlock();
}

- (id)valueForURLVariable:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[AMSBagNetworkDataSource processInfo](self, "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkDataSource valueForURLVariable:account:clientInfo:](AMSBagNetworkDataSource, "valueForURLVariable:account:clientInfo:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AMSBagNetworkDataSource processInfo](self, "processInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkDataSource valueForURLVariable:account:clientInfo:completion:](AMSBagNetworkDataSource, "valueForURLVariable:account:clientInfo:completion:", v10, v9, v11, v8);

}

+ (id)valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9;
  v18 = __Block_byref_object_dispose__9;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__AMSBagNetworkDataSource_valueForURLVariable_account_clientInfo___block_invoke;
  v13[3] = &unk_1E253E950;
  v13[4] = &v14;
  objc_msgSend(a1, "_valueForURLVariable:account:clientInfo:sync:completion:", v8, v9, v10, 1, v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __66__AMSBagNetworkDataSource_valueForURLVariable_account_clientInfo___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_accountStoreDidChange
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD block[4];
  id v14;
  id v15;

  -[AMSBagNetworkDataSource processAccountStoreDidChangeNotificationQueue](self, "processAccountStoreDidChangeNotificationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  objc_initWeak(&location, self);
  -[AMSBagNetworkDataSource processAccountStoreDidChangeNotificationQueue](self, "processAccountStoreDidChangeNotificationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke;
  v10[3] = &unk_1E253E9A0;
  objc_copyWeak(&v11, &location);
  v6 = v10;
  v7 = v4;
  AMSLogKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_0;
  block[3] = &unk_1E253DC28;
  v14 = v8;
  v15 = v6;
  v9 = v8;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cachedStorefront");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accountProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountMediaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bagStorefrontForAccountMediaType:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v3 | v7 && (objc_msgSend((id)v3, "isEqualToString:", v7) & 1) == 0)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded((void *)v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded((void *)v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v19 = v10;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v12;
        v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The storefront changed. Clearing the bag from the in-memory cache. oldStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);

      }
      objc_msgSend(v2, "setCachedStorefront:", v7);
      os_unfair_recursive_lock_lock_with_options();
      objc_msgSend(v2, "setCachedResult:", 0);
      objc_msgSend(v2, "dataSourceDataInvalidatedHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_recursive_lock_unlock();
      if (v14)
      {
        objc_msgSend(v2, "processAccountStoreDidChangeNotificationQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke_31;
        v16[3] = &unk_1E253E978;
        v16[4] = v2;
        v17 = v14;
        dispatch_async(v15, v16);

      }
    }

  }
}

void __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke_31(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)_invalidateCacheNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notification received to invalidate cache", (uint8_t *)&v8, 0x16u);

  }
  os_unfair_recursive_lock_lock_with_options();
  -[AMSBagNetworkDataSource setCachedResult:](self, "setCachedResult:", 0);
  os_unfair_recursive_lock_unlock();
}

uint64_t __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "ams_isCookieValidForBag"))
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AMSObserver)accountsChangedObserver
{
  return self->_accountsChangedObserver;
}

- (void)setAccountsChangedObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountsChangedObserver, a3);
}

- (os_unfair_recursive_lock_s)cachedDataAccessLock
{
  return self->_cachedDataAccessLock;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void)setDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAccountStoreDidChangeNotificationQueue, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_currentLoadTask, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_cachedResult, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_accountsChangedObserver, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong(&self->_dataSourceDataInvalidatedHandler, 0);
  objc_storeStrong(&self->_dataSourceChangedHandler, 0);
  objc_storeStrong((id *)&self->_cachedStorefront, 0);
}

@end
