@implementation AMSFamilyInfoLookupTask

- (AMSFamilyInfoLookupTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSFamilyInfoLookupTask *v9;
  AMSFamilyInfoLookupTask *v10;
  uint64_t v11;
  NSString *logKey;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSFamilyInfoLookupTask;
  v9 = -[AMSTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
    AMSGenerateLogCorrelationKey();
    v11 = objc_claimAutoreleasedReturnValue();
    logKey = v10->_logKey;
    v10->_logKey = (NSString *)v11;

  }
  return v10;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_8 != -1)
    dispatch_once(&_MergedGlobals_1_8, &__block_literal_global_52);
  return (NSString *)(id)qword_1ECEACB18;
}

void __40__AMSFamilyInfoLookupTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB18;
  qword_1ECEACB18 = (uint64_t)CFSTR("AMSFamilyInfo");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACB20 != -1)
    dispatch_once(&qword_1ECEACB20, &__block_literal_global_12_0);
  return (NSString *)(id)qword_1ECEACB28;
}

void __47__AMSFamilyInfoLookupTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB28;
  qword_1ECEACB28 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)performFamilyInfoLookup
{
  return -[AMSFamilyInfoLookupTask performFamilyInfoLookupWithCachePolicy:](self, "performFamilyInfoLookupWithCachePolicy:", 1);
}

- (id)performFamilyInfoLookupWithCachePolicy:(int64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke;
  v4[3] = &unk_1E2541BB8;
  v4[4] = self;
  v4[5] = a3;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v16 = v4;
    v17 = 2114;
    v18 = v7;
    v19 = 2050;
    v20 = v8;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing look up (cachePolicy: %{public}ld)", buf, 0x20u);

  }
  v9 = *(_QWORD *)(a1 + 40);
  switch(v9)
  {
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "fetchFamilyInfoLookupFromCache");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v2 = (void *)v13;
      return v2;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "fetchFamilyInfoLookupFromServer");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "fetchFamilyInfoLookupFromCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke_16;
      v14[3] = &unk_1E2541B90;
      v14[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "continueWithBlock:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
  }
  return v2;
}

id __66__AMSFamilyInfoLookupTask_performFamilyInfoLookupWithCachePolicy___block_invoke_16(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Failed to fetch cache, attempting to query server", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "fetchFamilyInfoLookupFromServer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)fetchFamilyInfoLookupFromCache
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AMSFamilyInfoLookupTask account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFamilyInfoLookupTask _cachedFamilyInfoLookupResultForAccount:](self, "_cachedFamilyInfoLookupResultForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] returning cached result %{public}@", (uint8_t *)&v19, 0x20u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Cache not available", (uint8_t *)&v19, 0x16u);

    }
    AMSError(7, CFSTR("Family Info Lookup Failed"), CFSTR("Cache not available"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)fetchFamilyInfoLookupFromServer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[AMSFamilyInfoLookupTask account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSFamilyInfoLookupTask account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    -[AMSFamilyInfoLookupTask _performFamilyInfoRequestForAccount:error:](self, "_performFamilyInfoRequestForAccount:error:", v4, &v45);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v45;

    +[AMSFamilyInfoLookupTask _processURLResult:](AMSFamilyInfoLookupTask, "_processURLResult:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_opt_class();
        v12 = v11;
        -[AMSFamilyInfoLookupTask logKey](self, "logKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = (uint64_t)v11;
        v48 = 2114;
        v49 = v13;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Successfully fetched family info from server", buf, 0x16u);

      }
      -[AMSFamilyInfoLookupTask account](self, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFamilyInfoLookupTask _cacheFamilyInfoLookupResult:forAccount:](self, "_cacheFamilyInfoLookupResult:forAccount:", v8, v14);
    }
    else
    {
      if (!v5)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v21, "OSLogObject");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = objc_opt_class();
          -[AMSFamilyInfoLookupTask logKey](self, "logKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v6);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v23;
          v48 = 2114;
          v49 = v24;
          v50 = 2114;
          v51 = v25;
          _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load the family info because the network call failed. error = %{public}@", buf, 0x20u);

        }
      }
      -[AMSFamilyInfoLookupTask account](self, "account");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSFamilyInfoLookupTask _cachedFamilyInfoLookupResultForAccount:](self, "_cachedFamilyInfoLookupResultForAccount:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v28 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v28;
      if (!v27)
      {
        if (!v28)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v14, "OSLogObject");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = objc_opt_class();
          -[AMSFamilyInfoLookupTask logKey](self, "logKey");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v43;
          v48 = 2114;
          v49 = v44;
          _os_log_impl(&dword_18C849000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We failed to load the family info, and we have no cached family info to return.", buf, 0x16u);

        }
        AMSError(0, CFSTR("Family Info Lookup Failed"), CFSTR("We failed to load the family info for the active account."), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      if (!v28)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "OSLogObject");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_opt_class();
        v31 = v30;
        -[AMSFamilyInfoLookupTask logKey](self, "logKey");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = (uint64_t)v30;
        v48 = 2114;
        v49 = v32;
        _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returning cached family info.", buf, 0x16u);

      }
      v8 = (void *)v27;
    }

    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v33, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      v35 = (void *)objc_opt_class();
      v36 = v35;
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = (uint64_t)v35;
      v48 = 2114;
      v49 = v37;
      v50 = 2114;
      v51 = v39;
      _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] returning result %{public}@", buf, 0x20u);

    }
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
    v40 = objc_claimAutoreleasedReturnValue();
LABEL_31:
    v20 = (void *)v40;

    goto LABEL_32;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "OSLogObject");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_opt_class();
    v18 = v17;
    -[AMSFamilyInfoLookupTask logKey](self, "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = (uint64_t)v17;
    v48 = 2114;
    v49 = v19;
    _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed because there's no account.", buf, 0x16u);

  }
  AMSError(103, CFSTR("Family Info Lookup Failed"), CFSTR("We cannot load the family circle if there's no account."), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v20;
}

- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  AMSURLRequestEncoder *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AMSPromise *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSFamilyInfoLookupTask bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForKey:", CFSTR("family-info"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v8, "valueWithError:", &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;

  if (v9)
  {
    v11 = objc_alloc_init(AMSURLRequestEncoder);
    -[AMSURLRequestEncoder setAccount:](v11, "setAccount:", v6);
    -[AMSFamilyInfoLookupTask bag](self, "bag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setBag:](v11, "setBag:", v12);

    -[AMSFamilyInfoLookupTask logKey](self, "logKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setLogUUID:](v11, "setLogUUID:", v13);

    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v11, "setUrlKnownToBeTrusted:", 1);
    -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v11, "requestWithMethod:URL:parameters:", 2, v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resultWithError:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(AMSPromise);
    +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v16, "completionHandlerAdapter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "resume");
    -[AMSPromise resultWithError:](v16, "resultWithError:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      v31 = 2114;
      v32 = v10;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed because the bag didn't give us the URL. error = %{public}@", buf, 0x20u);

    }
    if (a4)
    {
      AMSError(204, CFSTR("Family Info Lookup Failed"), CFSTR("We were unable to get the family circle URL."), v10);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

+ (id)_processURLResult:(id)a3
{
  void *v3;
  id v4;
  AMSFamilyInfoLookupResult *v5;

  if (a3)
  {
    objc_msgSend(a3, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;

      if (v4)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("family"));
        v5 = (AMSFamilyInfoLookupResult *)objc_claimAutoreleasedReturnValue();

        if (v5)
          v5 = -[AMSFamilyInfoLookupResult initWithDictionaryRepresentation:cached:]([AMSFamilyInfoLookupResult alloc], "initWithDictionaryRepresentation:cached:", v4, 0);
        goto LABEL_9;
      }
    }
    else
    {

      v4 = 0;
    }
    v5 = 0;
LABEL_9:

    return v5;
  }
  v5 = 0;
  return v5;
}

- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AMSFamilyInfoLookupTask _pathForCachedFamilyInfoLookupResult](self, "_pathForCachedFamilyInfoLookupResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "ams_DSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB38B0];
      v39[0] = CFSTR("account");
      objc_msgSend(v7, "ams_DSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v11;
      v39[1] = CFSTR("circle");
      objc_msgSend(v6, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v12;
      v39[2] = CFSTR("timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v40[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v10, "dataWithPropertyList:format:options:error:", v14, 200, 0, &v38);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v38;

      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v33 = objc_opt_class();
          -[AMSFamilyInfoLookupTask logKey](self, "logKey");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          AMSLogableError(v16);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v42 = v33;
          v43 = 2114;
          v44 = v34;
          v45 = 2114;
          v46 = v35;
          _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize the family info. error = %{public}@", buf, 0x20u);

        }
        goto LABEL_28;
      }
      v37 = v16;
      v17 = -[NSObject writeToFile:options:error:](v15, "writeToFile:options:error:", v8, 1, &v37);
      v18 = v37;

      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if ((v17 & 1) != 0)
      {
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          goto LABEL_27;
        v22 = (void *)objc_opt_class();
        v23 = v22;
        -[AMSFamilyInfoLookupTask logKey](self, "logKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = (uint64_t)v22;
        v43 = 2114;
        v44 = v24;
        v25 = "%{public}@: [%{public}@] Successfully cached family info";
        v26 = v21;
        v27 = OS_LOG_TYPE_INFO;
        v28 = 22;
      }
      else
      {
        if (!v19)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v36 = objc_opt_class();
        -[AMSFamilyInfoLookupTask logKey](self, "logKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v18);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v36;
        v43 = 2114;
        v44 = v24;
        v45 = 2114;
        v46 = v23;
        v25 = "%{public}@: [%{public}@] Failed to write the serialized family info to disk. error = %{public}@";
        v26 = v21;
        v27 = OS_LOG_TYPE_ERROR;
        v28 = 32;
      }
      _os_log_impl(&dword_18C849000, v26, v27, v25, buf, v28);

LABEL_27:
      v16 = v18;
LABEL_28:

      goto LABEL_29;
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_opt_class();
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hashedDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v31;
      v43 = 2114;
      v44 = v30;
      v45 = 2114;
      v46 = v32;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to cache a family info lookup because the given account has no DSID. account = %{public}@", buf, 0x20u);

      goto LABEL_17;
    }
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_opt_class();
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v29;
      v43 = 2114;
      v44 = v30;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to generate the path in order to cache a family info lookup.", buf, 0x16u);
LABEL_17:

    }
  }
LABEL_29:

}

- (id)_cachedFamilyInfoLookupResultForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AMSFamilyInfoLookupResult *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  int v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "ams_DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hashedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543874;
      v35 = v10;
      v36 = 2114;
      v37 = v11;
      v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load cached family info because the account has no DSID. account = %{public}@", (uint8_t *)&v34, 0x20u);

    }
    v13 = 0;
    goto LABEL_36;
  }
  -[AMSFamilyInfoLookupTask _currentCachedFamilyInfo](self, "_currentCachedFamilyInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    objc_msgSend(v4, "ams_DSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject isEqualToNumber:](v9, "isEqualToNumber:", v14);

    if ((v15 & 1) == 0)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = objc_opt_class();
        -[AMSFamilyInfoLookupTask logKey](self, "logKey");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v21;
        v36 = 2114;
        v37 = v22;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Our cached family info isn't for the given account.", (uint8_t *)&v34, 0x16u);

      }
      goto LABEL_34;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;

      if (!v17)
      {
        v19 = 2.22044605e-16;
LABEL_22:
        -[AMSFamilyInfoLookupTask bag](self, "bag");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleForKey:", CFSTR("family-info-max-cache-age"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "valueWithError:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        if (v19 > 2.22044605e-16)
        {
          v28 = 604800.0;
          if (v27 != 0.0)
            v28 = v27;
          if (v19 < v28)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("circle"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("family"));
            v13 = (AMSFamilyInfoLookupResult *)objc_claimAutoreleasedReturnValue();

            if (v13)
              v13 = -[AMSFamilyInfoLookupResult initWithDictionaryRepresentation:cached:]([AMSFamilyInfoLookupResult alloc], "initWithDictionaryRepresentation:cached:", v29, 1);

            goto LABEL_35;
          }
        }
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v20, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = objc_opt_class();
          -[AMSFamilyInfoLookupTask logKey](self, "logKey");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v31;
          v36 = 2114;
          v37 = v32;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] We have cached family info for the account, but it's too old to return.", (uint8_t *)&v34, 0x16u);

        }
LABEL_34:

        v13 = 0;
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v17);
      v19 = v18;
    }
    else
    {
      v17 = 0;
      v19 = 2.22044605e-16;
    }

    goto LABEL_22;
  }
  v13 = 0;
LABEL_37:

  return v13;
}

- (id)_currentCachedFamilyInfo
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AMSFamilyInfoLookupTask _pathForCachedFamilyInfoLookupResult](self, "_pathForCachedFamilyInfoLookupResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to generate the path in order to load cached family info.", buf, 0x16u);

    }
    goto LABEL_17;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v3);
  if (v4)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;

      if (v7)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      -[AMSFamilyInfoLookupTask logKey](self, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to deserialize the cached family info. error = %{public}@", buf, 0x20u);

    }
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  v7 = 0;
LABEL_19:

  return v7;
}

- (id)_pathForCachedFamilyInfoLookupResult
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v13[0] = v3;
    v13[1] = CFSTR("com.apple.itunesstored");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathWithComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) != 0
      || (v8 = 0,
          objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0)))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v12[0] = v6;
      v12[1] = CFSTR("JFamilyCircle.plist");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathWithComponents:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AMSFamilyInfoLookupTask)initWithBag:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSFamilyInfoLookupTask *v8;

  v4 = (void *)MEMORY[0x1E0C8F2B8];
  v5 = a3;
  objc_msgSend(v4, "ams_sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSFamilyInfoLookupTask initWithAccount:bag:](self, "initWithAccount:bag:", v7, v5);
  return v8;
}

- (AMSFamilyInfoLookupTask)initWithBagContract:(id)a3
{
  id v4;
  AMSContractBagShim *v5;
  AMSFamilyInfoLookupTask *v6;

  v4 = a3;
  v5 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);

  v6 = -[AMSFamilyInfoLookupTask initWithBag:](self, "initWithBag:", v5);
  return v6;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
