@implementation AMSBagNetworkTask

id __60__AMSBagNetworkTask__requestIdentifierForQueryItems_prefix___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    objc_msgSend(v2, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@=%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __33__AMSBagNetworkTask_performFetch__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performFetchWithAttemptedCount:account:storefront:", 0, *(_QWORD *)(a1 + 40), a2);
}

id __33__AMSBagNetworkTask_performFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__AMSBagNetworkTask_performFetch__block_invoke_3;
  v8[3] = &unk_1E253EA98;
  v4 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "continueWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __57__AMSBagNetworkTask__cookiesForNames_clientInfo_account___block_invoke(uint64_t a1, void *a2)
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

+ (id)_requestIdentifierForQueryItems:(id)a3 prefix:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_112);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "ams_nonEmptyComponentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%@"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_queryItemsForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 cookieNames:(id)a6 accountProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v16, "accountMediaType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bagAccountForAccountMediaType:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountMediaType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bagStorefrontForAccountMediaType:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_queryItemsForClientInfo:profile:profileVersion:cookieNames:account:storefront:", v16, v15, v14, v13, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_bagDataByApplyingOverridesToBagData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[AMSDefaults bagOverrides](AMSDefaults, "bagOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDefaults bagOverrideIgnoredKeys](AMSDefaults, "bagOverrideIgnoredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDefaults bagOverrideInserts](AMSDefaults, "bagOverrideInserts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bagDataByApplyingOverridesToBagData:overrides:ignoredKeys:inserts:", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_queryItemsForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 cookieNames:(id)a6 account:(id)a7 storefront:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  AMSBagURLQueryItemsBuilder *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v41 = a6;
  v40 = a7;
  v15 = a8;
  v39 = a5;
  v16 = a4;
  +[AMSDefaults storefrontSuffixes](AMSDefaults, "storefrontSuffixes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v38 = a1;
    v42 = 0;
    +[AMSStorefrontHeaderValueCreation combinedStorefrontFromStorefront:suffix:error:](AMSStorefrontHeaderValueCreation, "combinedStorefrontFromStorefront:suffix:error:", v15, v19, &v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v42;
    if (v21)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v24 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB3940];
        v25 = objc_opt_class();
        v26 = v25;
        v37 = (void *)v24;
        if (v24)
        {
          AMSLogKey();
          v35 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] "), v26, v35);
        }
        else
        {
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: "), v25);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v21);
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v27;
        v45 = 2114;
        v30 = (void *)v29;
        v46 = v29;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@An empty storefront was provided. Either a valid, non-empty storefront should be provided or nil should be passed instead. Defaulting to the nil-storefront case. error = %{public}@", buf, 0x16u);
        if (v37)
        {

          v27 = (void *)v35;
        }

      }
    }
    v28 = (void *)v19;

    a1 = v38;
  }
  else
  {
    v28 = (void *)v19;
    v20 = 0;
  }
  objc_msgSend(a1, "_cookiesForNames:clientInfo:account:", v41, v14, v40);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[AMSBagURLQueryItemsBuilder initWithClientInfo:profile:profileVersion:]([AMSBagURLQueryItemsBuilder alloc], "initWithClientInfo:profile:profileVersion:", v14, v16, v39);

  -[AMSBagURLQueryItemsBuilder queryItemsWithCookies:storefront:](v32, "queryItemsWithCookies:storefront:", v31, v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)_cookiesForNames:(id)a3 clientInfo:(id)a4 account:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if (v7)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v7, "ams_cookies");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v12;
          v19[1] = 3221225472;
          v19[2] = __57__AMSBagNetworkTask__cookiesForNames_clientInfo_account___block_invoke;
          v19[3] = &unk_1E253D2F8;
          v19[4] = v14;
          objc_msgSend(v15, "ams_firstObjectPassingTest:", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v18, "addObject:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
  else
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

- (id)performFetch
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__AMSBagNetworkTask_performFetch__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)logKey
{
  return self->_logKey;
}

void __43__AMSBagNetworkTask__defaultURLCookieNames__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACCA0;
  qword_1ECEACCA0 = (uint64_t)&unk_1E25B00E0;

}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nwActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataTaskPromiseWithRequest:activity:", v2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "catchWithBlock:", &__block_literal_global_17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (AMSBagNetworkTask)initWithClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5 accountProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSBagNetworkTask *v15;
  AMSBagNetworkTask *v16;
  uint64_t v17;
  NSString *logKey;
  AMSMetricsActivity *v19;
  AMSMetricsActivity *activity;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSBagNetworkTask;
  v15 = -[AMSTask init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountProvider, a6);
    objc_storeStrong((id *)&v16->_clientInfo, a3);
    objc_storeStrong((id *)&v16->_profile, a4);
    objc_storeStrong((id *)&v16->_profileVersion, a5);
    AMSSetLogKeyIfNeeded();
    v17 = objc_claimAutoreleasedReturnValue();
    logKey = v16->_logKey;
    v16->_logKey = (NSString *)v17;

    v19 = -[AMSMetricsActivity initWithLabel:]([AMSMetricsActivity alloc], "initWithLabel:", 1);
    activity = v16->_activity;
    v16->_activity = v19;

  }
  return v16;
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double Current;
  double v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AMSBagNetworkTaskResult *v31;
  void *v32;
  AMSBagNetworkTaskResult *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  v5 = v4;

  if (!v5)
  {
LABEL_9:
    AMSError(203, CFSTR("Bag Load Failed"), CFSTR("Network response object was not a dictionary."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("urlCookies"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkTask _setURLCookieNames:forProfile:](AMSBagNetworkTask, "_setURLCookieNames:forProfile:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "_updateStorefrontSuffixIfNecessaryWithBagData:", v5);
  objc_msgSend(v3, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkTask _setStorefrontFromURLResponse:bagData:](AMSBagNetworkTask, "_setStorefrontFromURLResponse:bagData:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSBagURLQueryItemsBuilder storefrontFromQueryItems:](AMSBagURLQueryItemsBuilder, "storefrontFromQueryItems:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v11 = v9;

  }
  v44 = v11;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldRetryForResult:cookieNames:urlCookies:responseStorefront:", v3, *(_QWORD *)(a1 + 48), v6, v9))
  {
    if (*(_QWORD *)(a1 + 64) == 3)
    {
      AMSError(203, CFSTR("Bag Load Failed"), CFSTR("Maximum number of attempts exceeded."), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v44;
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v34, "OSLogObject");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_opt_class();
        AMSLogKey();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v10);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v44);
        *(_DWORD *)buf = 138544130;
        v46 = v41;
        v47 = 2114;
        v48 = v43;
        v49 = 2114;
        v50 = v36;
        v51 = 2114;
        v52 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v52;
        _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Retrying bag load. originalStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);

      }
      v14 = v44;
      objc_msgSend(*(id *)(a1 + 32), "_performFetchWithAttemptedCount:account:storefront:", *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 56), v44);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_bagDataByApplyingOverridesToBagData:", v5);
    v40 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "response");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_expirationInterval");
    v18 = v17;

    Current = CFAbsoluteTimeGetCurrent();
    v20 = 60.0;
    if (v18 >= 60.0)
      v20 = v18;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", Current + v20);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = v6;
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      AMSLogKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v23;
      v47 = 2114;
      v48 = v24;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully loaded the bag data.", buf, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "_requestIdentifierForQueryItems:", *(_QWORD *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "clientInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "profileVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "requestPartialIdentifierForClientInfo:profile:profileVersion:", v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = [AMSBagNetworkTaskResult alloc];
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)v40;
    v14 = v44;
    v33 = -[AMSBagNetworkTaskResult initWithData:expirationDate:loadedBagIdentifier:loadedBagPartialIdentifier:storefront:accountIdentifier:](v31, "initWithData:expirationDate:loadedBagIdentifier:loadedBagPartialIdentifier:storefront:accountIdentifier:", v40, v39, v25, v30, v44, v32);

    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v42;
  }

LABEL_23:
  return v13;
}

+ (id)requestPartialIdentifierForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  void *v6;
  void *v7;

  +[AMSBagNetworkTask _queryItemsForClientInfo:profile:profileVersion:cookieNames:accountProvider:](AMSBagNetworkTask, "_queryItemsForClientInfo:profile:profileVersion:cookieNames:accountProvider:", a3, a4, a5, MEMORY[0x1E0C9AA60], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_requestIdentifierForQueryItems:prefix:", v6, CFSTR("com.apple.AppleMediaServices.AMSBagNetworkTask.partial-identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __50__AMSBagNetworkTask__createRequestWithQueryItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  +[AMSBagURLQueryItemsBuilder storefrontFromQueryItems:](AMSBagURLQueryItemsBuilder, "storefrontFromQueryItems:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-Store-Front"));
  objc_msgSend(*(id *)(a1 + 40), "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLogUUID:", v5);

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_performFetchWithAttemptedCount:(unint64_t)a3 account:(id)a4 storefront:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  _QWORD v41[5];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v8)
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v12;
      v44 = 2114;
      v45 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempted a bag load but an account wasn't provided.", buf, 0x16u);

    }
  }
  if (a3 < 3)
  {
    -[AMSBagNetworkTask profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBagNetworkTask _URLCookieNamesForProfile:](AMSBagNetworkTask, "_URLCookieNamesForProfile:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSBagNetworkTask clientInfo](self, "clientInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkTask profile](self, "profile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagNetworkTask profileVersion](self, "profileVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBagNetworkTask _queryItemsForClientInfo:profile:profileVersion:cookieNames:account:storefront:](AMSBagNetworkTask, "_queryItemsForClientInfo:profile:profileVersion:cookieNames:account:storefront:", v23, v24, v25, v22, v8, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSBagNetworkTask _createRequestWithQueryItems:](self, "_createRequestWithQueryItems:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke;
    v41[3] = &unk_1E253DB08;
    v41[4] = self;
    objc_msgSend(v27, "thenWithBlock:", v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v28;
    v36[1] = 3221225472;
    v36[2] = __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_4;
    v36[3] = &unk_1E253EA70;
    v36[4] = self;
    v37 = v26;
    v38 = v22;
    v40 = a3;
    v39 = v8;
    v30 = v22;
    v31 = v26;
    objc_msgSend(v29, "thenWithBlock:", v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14)
    {
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v44 = 2114;
        v45 = v19;
        v46 = 2050;
        v47 = a3;
        _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempt-count parameter exceeds the maximum. count = %{public}lu", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v20, 0);
    }
    else
    {
      if (!v15)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v33 = objc_opt_class();
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v33;
        v44 = 2114;
        v45 = v34;
        v46 = 2050;
        v47 = a3;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Attempt-count parameter exceeds the maximum. count = %{public}lu", buf, 0x20u);

      }
    }

    AMSError(203, CFSTR("Bag Load Failed"), CFSTR("Invalid attempt count."), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v32;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (id)_createRequestWithQueryItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  AMSURLRequestEncoder *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  AMSBagNetworkTask *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSBagNetworkTask clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountMediaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("https://sandbox.itunes.apple.com/WebObjects/MZInit.woa/wa/initiateSession");
  if ((objc_msgSend(v6, "isEqualToString:", AMSAccountMediaTypeAppStoreSandbox) & 1) == 0)
  {
    -[AMSBagNetworkTask clientInfo](self, "clientInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountMediaType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", AMSAccountMediaTypeAppStoreBeta))
      v7 = CFSTR("https://bag.itunes.apple.com/bag.xml");

  }
  v10 = (objc_class *)MEMORY[0x1E0CB3998];
  v11 = v7;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithString:", v11);

  objc_msgSend(v12, "setPercentEncodedQueryItems:", v4);
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(AMSURLRequestEncoder);
    -[AMSBagNetworkTask clientInfo](self, "clientInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setClientInfo:](v14, "setClientInfo:", v15);

    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setLogUUID:](v14, "setLogUUID:", v16);

    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v14, "setUrlKnownToBeTrusted:", 1);
    -[AMSURLRequestEncoder setIncludeClientVersions:](v14, "setIncludeClientVersions:", 0);
    -[AMSURLRequestEncoder setPreserveQueryParameterEncoding:](v14, "setPreserveQueryParameterEncoding:", 1);
    -[AMSURLRequestEncoder setShouldSetStorefrontHeader:](v14, "setShouldSetStorefrontHeader:", 0);
    -[AMSURLRequestEncoder setShouldSetCookieHeader:](v14, "setShouldSetCookieHeader:", 0);
    -[AMSBagNetworkTask accountProvider](self, "accountProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[AMSBagNetworkTask accountProvider](self, "accountProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSURLRequestEncoder setAccount:](v14, "setAccount:", v20);

    }
    -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v14, "requestWithMethod:URL:parameters:", 2, v13, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __50__AMSBagNetworkTask__createRequestWithQueryItems___block_invoke;
    v32 = &unk_1E253EBD8;
    v33 = v4;
    v34 = self;
    -[NSObject thenWithBlock:](v21, "thenWithBlock:", &v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "catchWithBlock:", &__block_literal_global_100, v29, v30, v31, v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v14 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (AMSURLRequestEncoder *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSURLRequestEncoder OSLogObject](v14, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ams_nonEmptyComponentsJoinedByString:", CFSTR(","));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v24;
      v37 = 2114;
      v38 = v25;
      v39 = 2114;
      v40 = v27;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to format bag URL. Query items = %{public}@", buf, 0x20u);

    }
    v23 = 0;
  }

  return v23;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

id __33__AMSBagNetworkTask_performFetch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "accountProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountMediaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bagAccountPromiseForAccountMediaType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "accountProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountMediaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bagStorefrontPromiseForAccountMediaType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__AMSBagNetworkTask_performFetch__block_invoke_2;
  v14[3] = &unk_1E253EAC0;
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v11 = v9;
  objc_msgSend(v5, "continueWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (AMSBagAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)_updateStorefrontSuffixIfNecessaryWithBagData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSBagNetworkTask clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "length"))
  {
    +[AMSDefaults storefrontSuffixes](AMSDefaults, "storefrontSuffixes");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)v8, "mutableCopy");
    if (!v9)
      v9 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storefront-header-suffix"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend((id)v9, "setObject:forKeyedSubscript:", v10, v6);
    else
      objc_msgSend((id)v9, "removeObjectForKey:", v6);
    if (v8 | v9 && (objc_msgSend((id)v9, "isEqual:", v8) & 1) == 0)
    {
      objc_msgSend((id)v8, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedAccountsStorefrontConfig](AMSLogConfig, "sharedAccountsStorefrontConfig");
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
        v16 = (void *)objc_opt_class();
        v19 = v16;
        AMSLogKey();
        v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v21 = v16;
        v22 = 2114;
        v23 = v18;
        v24 = 2114;
        v25 = v17;
        v26 = 2114;
        v27 = v10;
        v28 = 2114;
        v29 = v6;
        _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating a storefront suffix. originalStorefontSuffix = %{public}@ | newStorefrontSuffix = %{public}@ | bundleID = %{public}@", buf, 0x34u);

        v13 = v17;
      }

      +[AMSDefaults setStorefrontSuffixes:](AMSDefaults, "setStorefrontSuffixes:", v9);
    }
    goto LABEL_20;
  }
  +[AMSLogConfig sharedAccountsStorefrontConfig](AMSLogConfig, "sharedAccountsStorefrontConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_opt_class();
    v10 = v11;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_18C849000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to set a storefront suffix because we have no bundle identifier.", buf, 0x16u);

LABEL_20:
  }

}

- (BOOL)_shouldRetryForResult:(id)a3 cookieNames:(id)a4 urlCookies:(id)a5 responseStorefront:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (+[AMSBagNetworkTask _shouldReloadDataForOriginalCookies:newCookies:](AMSBagNetworkTask, "_shouldReloadDataForOriginalCookies:newCookies:", v10, v11))
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v26 = v15;
    v27 = 2114;
    v28 = v16;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to load the bag again due to urlCookies. originalCookies = %{public}@ | newCookies = %{public}@", buf, 0x2Au);
LABEL_13:

LABEL_14:
    v19 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v9, "task");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "originalRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v13, "isEqualToString:", v12) & 1) == 0)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v14, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v20 = objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v24;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32 = v22;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to load the bag again because the response had a x-set-apple-store-front header. originalStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);

    }
    goto LABEL_13;
  }
  v19 = 0;
LABEL_15:

  return v19;
}

+ (BOOL)_shouldReloadDataForOriginalCookies:(id)a3 newCookies:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  char v12;

  v6 = a4;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99E60];
    v8 = a3;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithArray:", v8);

    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
    v11 = objc_msgSend(v9, "isEqualToSet:", v10);
  }
  else
  {
    v10 = a3;
    objc_msgSend(a1, "_defaultURLCookieNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToArray:", v9);
  }
  v12 = v11;

  return v12 ^ 1;
}

+ (id)_URLCookieNamesForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[AMSStorage bagURLCookies](AMSStorage, "bagURLCookies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(a1, "_defaultURLCookieNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_defaultURLCookieNames
{
  if (qword_1ECEACC98 != -1)
    dispatch_once(&qword_1ECEACC98, &__block_literal_global_124);
  return (id)qword_1ECEACCA0;
}

+ (void)_setURLCookieNames:(id)a3 forProfile:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  v5 = a4;
  +[AMSStorage bagURLCookies](AMSStorage, "bagURLCookies");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v8 | v6)
  {
    v7 = (id)objc_msgSend((id)v6, "mutableCopy");
    if (!v7)
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v8)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v5);
    else
      objc_msgSend(v7, "removeObjectForKey:", v5);
    if ((objc_msgSend((id)v6, "isEqualToDictionary:", v7) & 1) == 0)
      +[AMSStorage setBagURLCookies:](AMSStorage, "setBagURLCookies:", v7);

  }
}

+ (id)_setStorefrontFromURLResponse:(id)a3 bagData:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = 0;
  if (v5 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "valueForHTTPHeaderField:", CFSTR("X-Set-Apple-Store-Front"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storefront-header-suffix"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v9, "length")
      && (objc_msgSend(v8, "containsString:", v9) & 1) == 0)
    {
      objc_msgSend(v8, "stringByAppendingString:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }

  }
  return v8;
}

+ (id)_requestIdentifierForQueryItems:(id)a3
{
  return (id)objc_msgSend(a1, "_requestIdentifierForQueryItems:prefix:", a3, CFSTR("com.apple.AppleMediaServices.AMSBagNetworkTask"));
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  +[AMSBagNetworkTask _urlSessionPromise](AMSBagNetworkTask, "_urlSessionPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_2;
  v9[3] = &unk_1E253EA48;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

id __72__AMSBagNetworkTask__performFetchWithAttemptedCount_account_storefront___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  AMSError(203, CFSTR("Bag Load Failed"), CFSTR("We failed to load the bag."), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_bagDataByApplyingOverridesToBagData:(id)a3 overrides:(id)a4 ignoredKeys:(id)a5 inserts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t v53[128];
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count") || objc_msgSend(v13, "count"))
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      AMSLogKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = (uint64_t)a1;
      v56 = 2114;
      v57 = v16;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Applying bag overrides", buf, 0x16u);

    }
    v17 = (id)objc_msgSend(v10, "mutableCopy");
    if (objc_msgSend(v11, "count"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v18, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v10;
        v21 = objc_opt_class();
        AMSLogKey();
        v43 = v12;
        v22 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allKeys");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v21;
        v10 = v20;
        v56 = 2114;
        v57 = v23;
        v58 = 2114;
        v59 = v24;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding the following keys: %{public}@", buf, 0x20u);

        v13 = v22;
        v12 = v43;
      }

      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke;
      v51[3] = &unk_1E253EAE8;
      v52 = v17;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v51);

    }
    if (objc_msgSend(v13, "count"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_opt_class();
        AMSLogKey();
        v44 = v10;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allKeys");
        v29 = v11;
        v30 = v12;
        v31 = v13;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v27;
        v56 = 2114;
        v57 = v28;
        v58 = 2114;
        v59 = v32;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Inserting to the following keys: %{public}@", buf, 0x20u);

        v13 = v31;
        v12 = v30;
        v11 = v29;

        v10 = v44;
      }

      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke_83;
      v49[3] = &unk_1E253EB10;
      v50 = v17;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v49);

    }
    if (objc_msgSend(v12, "count"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v33, "OSLogObject");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_opt_class();
        AMSLogKey();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v35;
        v56 = 2114;
        v57 = v36;
        v58 = 2114;
        v59 = v12;
        _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing the following keys: %{public}@", buf, 0x20u);

      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v37 = v12;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v46 != v40)
              objc_enumerationMutation(v37);
            objc_msgSend(v17, "ams_deleteValueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v39);
      }

    }
  }
  else
  {
    v17 = v10;
  }

  return v17;
}

uint64_t __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_setValue:forKeyPath:", a3, a2);
}

uint64_t __88__AMSBagNetworkTask__bagDataByApplyingOverridesToBagData_overrides_ignoredKeys_inserts___block_invoke_83(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_flatInsertValue:forKeyPath:", a3, a2);
}

+ (id)_createURLSessionPromise
{
  return -[AMSMutableLazyPromise initWithBlock:]([AMSMutableLazyPromise alloc], "initWithBlock:", &__block_literal_global_87_0);
}

void __45__AMSBagNetworkTask__createURLSessionPromise__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C92CA0];
  v3 = a2;
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_configurationWithClientInfo:bag:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thenWithBlock:", &__block_literal_global_91);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "finishWithPromise:", v6);
}

id __45__AMSBagNetworkTask__createURLSessionPromise__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  AMSURLSession *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "setTimeoutIntervalForResource:", 30.0);
  v3 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:]([AMSURLSession alloc], "initWithConfiguration:delegate:delegateQueue:", v2, 0, 0);

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_urlSessionPromise
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AMSBagNetworkTask__urlSessionPromise__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_3_1 != -1)
    dispatch_once(&_MergedGlobals_3_1, block);
  return (id)qword_1ECEACC90;
}

void __39__AMSBagNetworkTask__urlSessionPromise__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_createURLSessionPromise");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECEACC90;
  qword_1ECEACC90 = v1;

}

id __50__AMSBagNetworkTask__createRequestWithQueryItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  AMSError(203, CFSTR("Bag Load Failed"), CFSTR("Failed to create URL request."), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void)setProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_profileVersion, a3);
}

@end
