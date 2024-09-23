@implementation AMSCampaignAttributionTask

- (AMSCampaignAttributionTask)initWithURL:(id)a3 bag:(id)a4 URLSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSCampaignAttributionTask *v12;
  AMSCampaignAttributionTask *v13;
  void *v14;
  NSObject *v15;
  AMSCampaignAttributor *v16;
  AMSCampaignAttributor *campaignAttributor;
  uint8_t v19[16];
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AMSCampaignAttributionTask;
  v12 = -[AMSTask init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_bag, a4);
    objc_storeStrong((id *)&v13->_URLSession, a5);
  }
  if (+[AMSCampaignAttributionTask _isCampaignAttributorV2Enabled](AMSCampaignAttributionTask, "_isCampaignAttributorV2Enabled"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEBUG, "Campaign Attributor V2 is Enabled", v19, 2u);
    }

    v16 = -[AMSCampaignAttributor initWithBag:]([AMSCampaignAttributor alloc], "initWithBag:", v10);
    campaignAttributor = v13->_campaignAttributor;
    v13->_campaignAttributor = v16;

  }
  return v13;
}

- (AMSCampaignAttributionTask)initWithURL:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSCampaignAttributionTask *v9;

  v6 = a4;
  v7 = a3;
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSCampaignAttributionTask initWithURL:bag:URLSession:](self, "initWithURL:bag:URLSession:", v7, v6, v8);

  return v9;
}

- (id)perform
{
  AMSMutablePromise *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AMSMutablePromise *v8;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[4];
  AMSMutablePromise *v13;

  if (+[AMSCampaignAttributionTask _isCampaignAttributorV2Enabled](AMSCampaignAttributionTask, "_isCampaignAttributorV2Enabled"))
  {
    v3 = objc_alloc_init(AMSMutablePromise);
    -[AMSCampaignAttributionTask account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSCampaignAttributionTask campaignAttributor](self, "campaignAttributor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccount:", v4);

    -[AMSCampaignAttributionTask campaignAttributor](self, "campaignAttributor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSCampaignAttributionTask URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__AMSCampaignAttributionTask_perform__block_invoke;
    v12[3] = &unk_1E253FA90;
    v8 = v3;
    v13 = v8;
    objc_msgSend(v6, "processURL:ignoreMarketing:completionHandler:", v7, 0, v12);

    return v8;
  }
  else
  {
    v11[1] = 3221225472;
    v11[2] = __37__AMSCampaignAttributionTask_perform__block_invoke_2;
    v11[3] = &unk_1E253FAB8;
    v11[4] = self;
    v10.receiver = self;
    v10.super_class = (Class)AMSCampaignAttributionTask;
    v11[0] = MEMORY[0x1E0C809B0];
    -[AMSTask performTaskWithBlock:](&v10, sel_performTaskWithBlock_, v11);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __37__AMSCampaignAttributionTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSCampaignAttributionResult *v4;

  if (a2)
  {
    v3 = a2;
    v4 = -[AMSCampaignAttributionResult initWithURL:]([AMSCampaignAttributionResult alloc], "initWithURL:", v3);

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);

}

AMSCampaignAttributionResult *__37__AMSCampaignAttributionTask_perform__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  AMSCampaignAttributionResult *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v4 = *(void **)(a1 + 32);
  v29 = 0;
  objc_msgSend(v4, "_retrieveProcessRedirectInfoWithError:", &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;
  if (v6)
  {
    v7 = v6;
    if (a2)
    {
      v7 = objc_retainAutorelease(v6);
      v8 = 0;
      *a2 = v7;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v28 = 0;
    objc_msgSend(v9, "_parseAllowedQueryParamsFromInfo:error:", v5, &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;
    if (v11)
    {
      v7 = v11;
      if (a2)
      {
        v7 = objc_retainAutorelease(v11);
        v8 = 0;
        *a2 = v7;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v12 = *(void **)(a1 + 32);
      v27 = 0;
      objc_msgSend(v12, "_parseEndpointURLFromInfo:error:", v5, &v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      if (v14
        || (v15 = *(void **)(a1 + 32),
            v26 = 0,
            objc_msgSend(v15, "_validateAllowlist:error:", v10, &v26),
            (v14 = v26) != 0))
      {
        v7 = v14;
        if (a2)
        {
          v7 = objc_retainAutorelease(v14);
          v8 = 0;
          *a2 = v7;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v16 = *(void **)(a1 + 32);
        v25 = 0;
        objc_msgSend(v16, "_processRedirectWithEndpointURL:error:", v13, &v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v25;
        if (v18)
        {
          v7 = v18;
          if (a2)
          {
            v7 = objc_retainAutorelease(v18);
            v8 = 0;
            *a2 = v7;
          }
          else
          {
            v8 = 0;
          }
        }
        else
        {
          v19 = *(void **)(a1 + 32);
          v24 = 0;
          objc_msgSend(v19, "_parseRedirectURLFromResult:error:", v17, &v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v24;
          v7 = v21;
          if (v21)
          {
            v8 = 0;
            if (a2)
              *a2 = objc_retainAutorelease(v21);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "_parseCookiesFromResult:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_setAccountCookies:", v22);
            v8 = -[AMSCampaignAttributionResult initWithURL:]([AMSCampaignAttributionResult alloc], "initWithURL:", v20);

          }
        }

      }
    }

  }
  return v8;
}

+ (BOOL)_isCampaignAttributorV2Enabled
{
  return _os_feature_enabled_impl();
}

- (id)_retrieveProcessRedirectInfoWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AMSCampaignAttributionTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", 0x1E254C6C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "valueWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v7)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2114;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve process redirect information. Error: %@.", buf, 0x20u);

    }
    if (a3)
    {
      AMSError(204, CFSTR("Failed to retrieve process redirect information"), 0, v7);
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (id)_parseAllowedQueryParamsFromInfo:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("whitelistedQueryParams"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {

  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve allowed query params", (uint8_t *)&v13, 0x16u);

  }
  if (a4)
  {
    AMSError(204, CFSTR("Failed to retrieve allowed query params"), 0, 0);
    v6 = 0;
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (id)_parseEndpointURLFromInfo:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("endpoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
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
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve endpoint", (uint8_t *)&v15, 0x16u);

    }
    if (a4)
    {
      AMSError(204, CFSTR("Failed to retrieve endpoint"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (BOOL)_validateAllowlist:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSCampaignAttributionTask _queryItemNames](self, "_queryItemNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intersectsSet:", v6);

  if ((v8 & 1) == 0)
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
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] URL not for a campaign", (uint8_t *)&v14, 0x16u);

    }
    if (a4)
    {
      AMSError(700, CFSTR("URL not for a campaign"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8;
}

- (id)_queryItemNames
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3998]);
  -[AMSCampaignAttributionTask URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:resolvingAgainstBaseURL:", v4, 1);

  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __45__AMSCampaignAttributionTask__queryItemNames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (id)_processRedirectWithEndpointURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  id v17;

  v17 = 0;
  -[AMSCampaignAttributionTask _buildProcessRedirectURLWithEndpointURL:error:](self, "_buildProcessRedirectURLWithEndpointURL:error:", a3, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v7)
  {
    v8 = v7;
    if (a4)
    {
      v8 = objc_retainAutorelease(v7);
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v16 = 0;
    -[AMSCampaignAttributionTask _encodeRequestForURL:error:](self, "_encodeRequestForURL:error:", v6, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (v11)
    {
      v8 = v11;
      if (a4)
      {
        v8 = objc_retainAutorelease(v11);
        v9 = 0;
        *a4 = v8;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v15 = 0;
      -[AMSCampaignAttributionTask _processRedirectWithRequest:error:](self, "_processRedirectWithRequest:error:", v10, &v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v8 = v13;
      if (v13)
      {
        v9 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v13);
      }
      else
      {
        v9 = v12;
      }

    }
  }

  return v9;
}

- (id)_buildProcessRedirectURLWithEndpointURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB39D8];
  -[AMSCampaignAttributionTask URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("url"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSCampaignAttributionTask additionalQueryItems](self, "additionalQueryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSCampaignAttributionTask additionalQueryItems](self, "additionalQueryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setQueryItems:", v11);
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v21;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to build process redirect URL", buf, 0x16u);

    }
    if (a4)
    {
      AMSError(701, CFSTR("Failed to build process redirect URL"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (id)_encodeRequestForURL:(id)a3 error:(id *)a4
{
  id v6;
  AMSURLRequestEncoder *v7;
  void *v8;
  AMSURLRequestEncoder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [AMSURLRequestEncoder alloc];
  -[AMSCampaignAttributionTask bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSURLRequestEncoder initWithBag:](v7, "initWithBag:", v8);

  -[AMSCampaignAttributionTask account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setAccount:](v9, "setAccount:", v10);

  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setLogUUID:](v9, "setLogUUID:", v11);

  -[AMSCampaignAttributionTask clientInfo](self, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLRequestEncoder setClientInfo:](v9, "setClientInfo:", v12);

  -[AMSURLRequestEncoder setRequestEncoding:](v9, "setRequestEncoding:", 1);
  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v9, "requestWithMethod:URL:parameters:", 4, v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(v13, "resultWithTimeout:error:", &v22, 60.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  if (v15)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
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
      *(_DWORD *)buf = 138543618;
      v24 = v18;
      v25 = 2114;
      v26 = v19;
      _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode process redirect request", buf, 0x16u);

    }
    if (a4)
    {
      AMSError(3, CFSTR("Failed to encode process redirect request"), 0, v15);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = v14;
  }

  return v20;
}

- (id)_processRedirectWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSCampaignAttributionTask URLSession](self, "URLSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataTaskPromiseWithRequest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(v8, "resultWithTimeout:error:", &v18, 60.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (v10)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Process redirect request failed", buf, 0x16u);

    }
    if (a4)
    {
      AMSError(3, CFSTR("Process redirect request failed"), 0, v10);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    objc_msgSend(v9, "object");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v16;
    else
      v15 = 0;

  }
  return v15;
}

- (id)_parseRedirectURLFromResult:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("redirectUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
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
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Process redirect result missing redirect url", (uint8_t *)&v15, 0x16u);

    }
    if (a4)
    {
      AMSError(701, CFSTR("Process redirect result missing redirect url"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (id)_parseCookiesFromResult:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("setCookies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

- (void)_setAccountCookies:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ams_mapWithTransform:", &__block_literal_global_57_0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSCampaignAttributionTask account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_addCookies:", v5);

}

id __49__AMSCampaignAttributionTask__setAccountCookies___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (objc_class *)MEMORY[0x1E0C99E08];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C92AB0]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxAge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C92AC8]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C92AD0]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C92AE0]);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C92B10]);
  objc_msgSend(MEMORY[0x1E0C92C00], "cookieWithProperties:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSCampaignAttribution");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
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

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSArray)additionalQueryItems
{
  return self->_additionalQueryItems;
}

- (void)setAdditionalQueryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)URL
{
  return self->_URL;
}

- (AMSURLSession)URLSession
{
  return self->_URLSession;
}

- (AMSCampaignAttributor)campaignAttributor
{
  return self->_campaignAttributor;
}

- (void)setCampaignAttributor:(id)a3
{
  objc_storeStrong((id *)&self->_campaignAttributor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_campaignAttributor, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_additionalQueryItems, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
