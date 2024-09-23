@implementation AMSMediaTokenService

uint64_t __39__AMSMediaTokenService_fetchMediaToken__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenStore, 0);
  objc_storeStrong((id *)&self->_tokenFetchQueue, 0);
  objc_storeStrong((id *)&self->_throttler, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_session);
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 bag:(id)a4
{
  return -[AMSMediaTokenService initWithClientIdentifier:keychainAccessGroup:bag:](self, "initWithClientIdentifier:keychainAccessGroup:bag:", a3, 0, a4);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

void __35__AMSMediaTokenService__fetchToken__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cachedMediaToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "_shouldReturnMediaToken:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
  }
  else
  {
    objc_msgSend(WeakRetained, "throttler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldThrottle");

    if (v5)
    {
      +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
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
        objc_msgSend(WeakRetained, "clientIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v8;
        v50 = 2114;
        v51 = (uint64_t)v10;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token request throttled. Returning cached media token if available.", buf, 0x16u);

      }
      AMSError(402, CFSTR("Token request throttled"), CFSTR("Throttling to reduce server load."), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v12 = 0;
      else
        v12 = v11;
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v12);

    }
    else
    {
      v47 = 0;
      objc_msgSend(WeakRetained, "_tokenRequestWithError:", &v47);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v47;
      if (v14 || !v13)
      {
        +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
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
          v24 = (void *)objc_opt_class();
          v25 = v24;
          objc_msgSend(WeakRetained, "clientIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v49 = v24;
          v50 = 2114;
          v51 = (uint64_t)v26;
          v52 = 2114;
          v53 = v14;
          _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token request encoding failed. Returning cached media token if available. Error: %{public}@", buf, 0x20u);

        }
        AMSError(300, CFSTR("Token request encoding failed"), CFSTR("The token request encoder finished with an error."), v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          v27 = 0;
        else
          v27 = v17;
        objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v27);
      }
      else
      {
        objc_msgSend(WeakRetained, "throttler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "throttle");

        objc_msgSend(WeakRetained, "session");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dataTaskPromiseWithRequest:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = 0;
        objc_msgSend(v17, "resultWithTimeout:error:", &v46, 60.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v46;
        if (v14 || !v18)
        {
          +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v28, "OSLogObject");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v43 = v13;
            v30 = v18;
            v31 = (void *)objc_opt_class();
            v41 = v31;
            objc_msgSend(WeakRetained, "clientIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v31;
            v18 = v30;
            v13 = v43;
            v50 = 2114;
            v51 = (uint64_t)v32;
            v52 = 2114;
            v53 = v14;
            _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token result error. Returning cached media token if available. Error: %{public}@", buf, 0x20u);

          }
          AMSError(301, CFSTR("Token result error"), CFSTR("The token result promise finished with an error."), v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v3)
            v33 = 0;
          else
            v33 = v20;
          objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v33);
        }
        else
        {
          objc_msgSend(v18, "object");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0;
          +[AMSMediaTokenServiceDeserializer mediaTokenFromDictionary:error:](AMSMediaTokenServiceDeserializer, "mediaTokenFromDictionary:error:", v19, &v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v45;

          if (v14 || !v20)
          {
            v44 = v18;
            +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v34)
            {
              +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v34, "OSLogObject");
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v36 = (void *)objc_opt_class();
              v42 = v36;
              objc_msgSend(WeakRetained, "clientIdentifier");
              v37 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v49 = v36;
              v50 = 2114;
              v51 = v37;
              v38 = (void *)v37;
              v52 = 2114;
              v53 = v14;
              _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Token result could not be deserialized. Returning cached media token if available. Error: %{public}@", buf, 0x20u);

            }
            AMSError(301, CFSTR("Token result error"), CFSTR("Token result could not be deserialized."), v14);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v3)
              v40 = 0;
            else
              v40 = v39;
            objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v3, v40);

            v18 = v44;
          }
          else
          {
            objc_msgSend(WeakRetained, "throttler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "reset");

            objc_msgSend(WeakRetained, "setCachedMediaToken:", v20);
            objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v20);
            v14 = 0;
          }
        }

      }
    }
  }

}

AMSPromise *__43__AMSMediaTokenService__fetchBagProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "throttler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseSleepInterval:", v6);

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "throttler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaxSleepInterval:", v10);

  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setRefreshPercentage:");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setRefreshTime:");

  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
}

- (AMSMediaTokenServiceThrottler)throttler
{
  return self->_throttler;
}

void __39__AMSMediaTokenService_fetchMediaToken__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "isEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "cachedMediaToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 40), "_shouldReturnMediaToken:", v4);
    v6 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v6, "_refreshMediaTokenIfNeeded:", v4);
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);
    }
    else
    {
      objc_msgSend(v6, "_fetchToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __39__AMSMediaTokenService_fetchMediaToken__block_invoke_2;
      v10[3] = &unk_1E2543040;
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v8, "addFinishBlock:", v10);

    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    AMSError(400, CFSTR("Token Service Disabled"), CFSTR("Bag value of token-service-enabled is false."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v9);

  }
}

- (AMSMediaToken)cachedMediaToken
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  AMSMediaToken *v13;
  void *v14;
  AMSMediaToken *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content()
    && (+[AMSDefaults mediaTokenOverride](AMSDefaults, "mediaTokenOverride"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
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
      v6 = (void *)objc_opt_class();
      v7 = v6;
      -[AMSMediaTokenService clientIdentifier](self, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSDefaults mediaTokenOverride](AMSDefaults, "mediaTokenOverride");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v6;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding media token. Identifier: %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceNow");
    v12 = v11;
    v13 = [AMSMediaToken alloc];
    +[AMSDefaults mediaTokenOverride](AMSDefaults, "mediaTokenOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AMSMediaToken initWithString:expirationDate:lifetime:](v13, "initWithString:expirationDate:lifetime:", v14, v10, v12);

  }
  else
  {
    -[AMSMediaTokenService tokenStore](self, "tokenStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "retrieveToken");
    v15 = (AMSMediaToken *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (AMSMediaTokenServiceStore)tokenStore
{
  return self->_tokenStore;
}

- (void)setRefreshTime:(double)a3
{
  self->_refreshTime = a3;
}

- (void)setRefreshPercentage:(double)a3
{
  self->_refreshPercentage = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)_shouldRefreshMediaToken:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  char v9;

  v4 = a3;
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "isValid")
    && (objc_msgSend(v5, "percentageOfLifetimeRemaining"),
        v7 = v6,
        -[AMSMediaTokenService refreshPercentage](self, "refreshPercentage"),
        v7 >= v8))
  {
    -[AMSMediaTokenService refreshTime](self, "refreshTime");
    v9 = objc_msgSend(v5, "willExpireWithin:");
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_shouldReturnMediaToken:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isValid"))
    v5 = objc_msgSend(v4, "isExpired") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (double)refreshPercentage
{
  return self->_refreshPercentage;
}

- (void)_refreshMediaTokenIfNeeded:(id)a3
{
  id v4;

  if (-[AMSMediaTokenService _shouldRefreshMediaToken:](self, "_shouldRefreshMediaToken:", a3))
    v4 = -[AMSMediaTokenService _fetchToken](self, "_fetchToken");
}

- (double)refreshTime
{
  return self->_refreshTime;
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 keychainAccessGroup:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMediaTokenServiceStore *v11;
  AMSMediaTokenService *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AMSMediaTokenServiceStore initWithClientIdentifier:keychainAccessGroup:]([AMSMediaTokenServiceStore alloc], "initWithClientIdentifier:keychainAccessGroup:", v10, v9);

  v12 = -[AMSMediaTokenService initWithClientIdentifier:tokenStore:bag:](self, "initWithClientIdentifier:tokenStore:bag:", v10, v11, v8);
  return v12;
}

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 tokenStore:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMediaTokenService *v11;
  AMSMediaTokenService *v12;
  NSString *v13;
  NSString *clientIdentifier;
  AMSMediaTokenServiceThrottler *v15;
  AMSMediaTokenServiceThrottler *throttler;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *tokenFetchQueue;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AMSMediaTokenService;
  v11 = -[AMSMediaTokenService init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bag, a5);
    if (os_variant_has_internal_content())
    {
      objc_msgSend((id)objc_opt_class(), "_overrideOrClientIdentifier:", v8);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (NSString *)v8;
    }
    clientIdentifier = v12->_clientIdentifier;
    v12->_clientIdentifier = v13;

    v15 = -[AMSMediaTokenServiceThrottler initWithBaseSleepInterval:maxSleepInterval:]([AMSMediaTokenServiceThrottler alloc], "initWithBaseSleepInterval:maxSleepInterval:", 0.5, 30.0);
    throttler = v12->_throttler;
    v12->_throttler = v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.AppleMediaServices.AMSMediaTokenService", v17);
    tokenFetchQueue = v12->_tokenFetchQueue;
    v12->_tokenFetchQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v12->_tokenStore, a4);
  }

  return v12;
}

+ (id)_overrideOrClientIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[AMSDefaults mediaClientIdOverrides](AMSDefaults, "mediaClientIdOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v5)
  {
    +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Client identifier was manually overridden in defaults. %@ is overridden with: %@. Use amstool to clear any overrides if you did not expect this.", (uint8_t *)&v13, 0x2Au);

    }
    v6 = v5;
  }
  v11 = v6;

  return v11;
}

- (id)_fetchToken
{
  AMSMutablePromise *v3;
  NSObject *v4;
  AMSMutablePromise *v5;
  _QWORD block[4];
  AMSMutablePromise *v8;
  id v9;
  id location;

  v3 = objc_alloc_init(AMSMutablePromise);
  objc_initWeak(&location, self);
  -[AMSMediaTokenService tokenFetchQueue](self, "tokenFetchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AMSMediaTokenService__fetchToken__block_invoke;
  block[3] = &unk_1E253E8B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

- (OS_dispatch_queue)tokenFetchQueue
{
  return self->_tokenFetchQueue;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (id)_tokenRequestWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  AMSURLRequestEncoder *v25;
  void *v26;
  AMSURLRequestEncoder *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  -[AMSMediaTokenService tokenFetchQueue](self, "tokenFetchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[AMSMediaTokenService bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForKey:", 0x1E254CC40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v7, "valueWithError:", &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;

  if (v9)
  {
    v10 = 0;
    if (a3)
LABEL_3:
      *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    -[AMSMediaTokenService clientInfo](self, "clientInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMappedBundleInfo accountMediaTypeInfoForProcessInfo:](AMSMappedBundleInfo, "accountMediaTypeInfoForProcessInfo:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[AMSMediaTokenService clientInfo](self, "clientInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSMappedBundleInfo bundleInfoForProcessInfo:](AMSMappedBundleInfo, "bundleInfoForProcessInfo:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v31 = v13;
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[AMSMediaTokenService clientType](self, "clientType") == 1)
      v16 = CFSTR("other");
    else
      v16 = CFSTR("apple");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("clientClass"));
    -[AMSMediaTokenService clientIdentifier](self, "clientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("clientId"));

    +[AMSDevice productVersion](AMSDevice, "productVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("osVersion"));

    +[AMSDevice operatingSystem](AMSDevice, "operatingSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("os"));

    objc_msgSend(v13, "clientVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("productVersion"));

    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("2"), CFSTR("version"));
    if (os_variant_has_internal_content())
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("internal"), CFSTR("buildVariant"));
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHTTPMethod:", CFSTR("GET"));
    v22 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringFromDate:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addValue:forHTTPHeaderField:", v24, CFSTR("x-request-timestamp"));
    v25 = [AMSURLRequestEncoder alloc];
    -[AMSMediaTokenService bag](self, "bag");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AMSURLRequestEncoder initWithBag:](v25, "initWithBag:", v26);

    -[AMSMediaTokenService account](self, "account");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v27, "setAccount:", v28);

    -[AMSMediaTokenService clientInfo](self, "clientInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setClientInfo:](v27, "setClientInfo:", v29);

    -[AMSURLRequestEncoder setMescalType:](v27, "setMescalType:", 1);
    -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v27, "setUrlKnownToBeTrusted:", -[AMSMediaTokenService URLKnownToBeTrusted](self, "URLKnownToBeTrusted"));
    -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](v27, "requestByEncodingRequest:parameters:", v21, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v30, "resultWithTimeout:error:", &v32, 60.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v32;

    if (a3)
      goto LABEL_3;
  }

  return v10;
}

- (id)fetchMediaToken
{
  AMSMutablePromise *v3;
  void *v4;
  AMSMutablePromise *v5;
  AMSMutablePromise *v6;
  _QWORD v8[4];
  AMSMutablePromise *v9;
  AMSMediaTokenService *v10;

  v3 = objc_alloc_init(AMSMutablePromise);
  -[AMSMediaTokenService _fetchBagProperties](self, "_fetchBagProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AMSMediaTokenService_fetchMediaToken__block_invoke;
  v8[3] = &unk_1E253F870;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "addFinishBlock:", v8);

  v6 = v5;
  return v6;
}

- (id)_fetchBagProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[7];

  v24[5] = *MEMORY[0x1E0C80C00];
  -[AMSMediaTokenService bag](self, "bag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleForKey:", 0x1E254CBA0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valuePromise");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  -[AMSMediaTokenService bag](self, "bag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleForKey:", 0x1E254CBC0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valuePromise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  -[AMSMediaTokenService bag](self, "bag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "BOOLForKey:", 0x1E254CBE0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valuePromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v3;
  -[AMSMediaTokenService bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleForKey:", 0x1E254CC00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valuePromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v6;
  -[AMSMediaTokenService bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleForKey:", 0x1E254CC20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valuePromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __43__AMSMediaTokenService__fetchBagProperties__block_invoke;
  v23[3] = &unk_1E253D638;
  v23[4] = self;
  objc_msgSend(v11, "thenWithBlock:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "binaryPromiseAdapter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (void)setCachedMediaToken:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSMediaTokenService tokenStore](self, "tokenStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v6)
    objc_msgSend(v4, "storeToken:", v6);
  else
    objc_msgSend(v4, "deleteToken");

}

- (AMSURLSession)session
{
  AMSURLSession **p_session;
  id WeakRetained;
  void *v4;

  p_session = &self->_session;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_session);
  }
  else
  {
    +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (AMSURLSession *)v4;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (ACAccount)account
{
  return self->_account;
}

- (BOOL)URLKnownToBeTrusted
{
  return self->_URLKnownToBeTrusted;
}

- (NSString)keychainAccessGroup
{
  void *v2;
  void *v3;

  -[AMSMediaTokenService tokenStore](self, "tokenStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keychainAccessGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setKeychainAccessGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSMediaTokenService tokenStore](self, "tokenStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeychainAccessGroup:", v4);

}

- (void)invalidateMediaToken
{
  void *v3;
  id v4;

  -[AMSMediaTokenService cachedMediaToken](self, "cachedMediaToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidCopy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[AMSMediaTokenService setCachedMediaToken:](self, "setCachedMediaToken:", v4);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_121 != -1)
    dispatch_once(&_MergedGlobals_121, &__block_literal_global_78);
  return (NSString *)(id)qword_1ECEAD5C8;
}

void __37__AMSMediaTokenService_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD5C8;
  qword_1ECEAD5C8 = (uint64_t)CFSTR("AMSMediaTokenService");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD5D0 != -1)
    dispatch_once(&qword_1ECEAD5D0, &__block_literal_global_48);
  return (NSString *)(id)qword_1ECEAD5D8;
}

void __44__AMSMediaTokenService_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD5D8;
  qword_1ECEAD5D8 = (uint64_t)CFSTR("1");

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

- (AMSMediaTokenService)initWithClientIdentifier:(id)a3 clientVersion:(id)a4 bag:(id)a5
{
  return -[AMSMediaTokenService initWithClientIdentifier:bag:](self, "initWithClientIdentifier:bag:", a3, a5);
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setURLKnownToBeTrusted:(BOOL)a3
{
  self->_URLKnownToBeTrusted = a3;
}

@end
