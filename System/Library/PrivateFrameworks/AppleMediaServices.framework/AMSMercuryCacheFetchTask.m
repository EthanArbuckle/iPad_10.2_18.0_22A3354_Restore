@implementation AMSMercuryCacheFetchTask

- (AMSMercuryCacheFetchTask)initWithAccount:(id)a3 bag:(id)a4 cacheTypeIDs:(id)a5 clientIdentifier:(id)a6 clientVersion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AMSMercuryCacheFetchTask *v17;
  AMSMercuryCacheFetchTask *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AMSMercuryCacheFetchTask;
  v17 = -[AMSTask init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_bag, a4);
    objc_storeStrong((id *)&v18->_cacheTypeIDs, a5);
    objc_storeStrong((id *)&v18->_clientIdentifier, a6);
    objc_storeStrong((id *)&v18->_clientVersion, a7);
  }

  return v18;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__AMSMercuryCacheFetchTask_perform__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __35__AMSMercuryCacheFetchTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "sharedPropertiesFromTask:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "requestEncoderWithSharedProperties:task:", v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v63 = 0;
  objc_msgSend(v5, "_updateEndpointURLRequestWithError:", &v63);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v63;
  objc_msgSend(v4, "requestByEncodingRequest:parameters:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
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
      v11 = (void *)objc_opt_class();
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v11;
      v66 = 2114;
      v67 = v14;
      v68 = 2114;
      v69 = v7;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating url request: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v2, "finishWithError:", v7);
    v15 = v2;
  }
  else
  {
    v62 = 0;
    objc_msgSend(v8, "resultWithTimeout:error:", &v62, 60.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v62;
    if (v17)
    {
      v7 = v17;
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
        v20 = v8;
        v21 = v16;
        v22 = (void *)objc_opt_class();
        v23 = *(void **)(a1 + 32);
        v59 = v22;
        objc_msgSend(v23, "logKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = v22;
        v16 = v21;
        v8 = v20;
        v66 = 2114;
        v67 = v24;
        v68 = 2114;
        v69 = v7;
        _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

      }
      objc_msgSend(v2, "finishWithError:", v7);
      v25 = v2;
    }
    else
    {
      objc_msgSend(v3, "session");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dataTaskPromiseWithRequest:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = v27;
      v61 = 0;
      objc_msgSend(v27, "resultWithTimeout:error:", &v61, 60.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v61;
      v58 = v28;
      if (v29)
      {
        v7 = v29;
        v56 = v16;
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v30, "OSLogObject");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)objc_opt_class();
          v33 = *(void **)(a1 + 32);
          v34 = v32;
          objc_msgSend(v33, "logKey");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v65 = v32;
          v66 = 2114;
          v67 = v35;
          v68 = 2114;
          v69 = v7;
          _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error performing data task: %{public}@", buf, 0x20u);

        }
        objc_msgSend(v2, "finishWithError:", v7);
        v36 = v2;
        v16 = v56;
      }
      else
      {
        objc_msgSend(v28, "responseDictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "responseHeaders");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "ams_dictionaryByAddingEntriesFromDictionary:", v38);
        v39 = objc_claimAutoreleasedReturnValue();

        v55 = (void *)v39;
        if (v39)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v40, "OSLogObject");
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = (void *)objc_opt_class();
            v43 = *(void **)(a1 + 32);
            v44 = v42;
            objc_msgSend(v43, "logKey");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v65 = v42;
            v66 = 2114;
            v67 = v45;
            v68 = 2114;
            v69 = v55;
            _os_log_impl(&dword_18C849000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetch complete %{public}@", buf, 0x20u);

          }
          v46 = v55;
          objc_msgSend(v2, "finishWithResult:", v55);
          v7 = 0;
        }
        else
        {
          v57 = v16;
          AMSError(7, CFSTR("Sync response contains no data"), CFSTR("Data expected is missing."), 0);
          v7 = (id)objc_claimAutoreleasedReturnValue();
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v47)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v47, "OSLogObject");
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = (void *)objc_opt_class();
            v50 = *(void **)(a1 + 32);
            v51 = v49;
            objc_msgSend(v50, "logKey");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v65 = v49;
            v66 = 2114;
            v67 = v52;
            v68 = 2114;
            v69 = v7;
            _os_log_impl(&dword_18C849000, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error performing fetching data: %{public}@", buf, 0x20u);

          }
          objc_msgSend(v2, "finishWithError:", v7);
          v46 = 0;
          v16 = v57;
        }
        v53 = v2;

      }
    }

  }
  return v2;
}

- (id)_updateEndpointURLRequestWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[AMSMercuryCacheFetchTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", 0x1E254CC60);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v7, "resultWithError:", &v60);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v60;

  -[AMSMercuryCacheFetchTask bag](self, "bag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringForKey:", 0x1E254C520);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valuePromise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v9;
  objc_msgSend(v12, "resultWithError:", &v59);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v59;

  -[AMSMercuryCacheFetchTask bag](self, "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringForKey:", 0x1E254CA00);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valuePromise");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v14;
  objc_msgSend(v17, "resultWithError:", &v58);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v58;

  if (v19)
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
      v22 = (void *)objc_opt_class();
      v23 = v22;
      -[AMSMercuryCacheFetchTask logKey](self, "logKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v22;
      v63 = 2114;
      v64 = v24;
      v65 = 2114;
      v66 = v19;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error fetching bag values for url generation %{public}@", buf, 0x20u);

    }
    if (a3)
    {
      v19 = objc_retainAutorelease(v19);
      v25 = 0;
      *a3 = v19;
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    -[AMSMercuryCacheFetchTask cacheTypeIDs](self, "cacheTypeIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
    v29 = objc_claimAutoreleasedReturnValue();

    v57 = v13;
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{cc}"), v13);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v54, 1);
    v31 = (void *)objc_opt_new();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("l"), v18);
    objc_msgSend(v31, "addObject:", v32);

    v56 = (void *)v29;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("kinds"), v29);
    objc_msgSend(v31, "addObject:", v33);

    +[AMSMediaURLBuilderUtility devicePlatform](AMSMediaURLBuilderUtility, "devicePlatform");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("platform"), v34);
      objc_msgSend(v31, "addObject:", v35);

    }
    objc_msgSend(v30, "setQueryItems:", v31);
    v53 = v30;
    objc_msgSend(v30, "URL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setHTTPMethod:", CFSTR("GET"));
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v37, "OSLogObject");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_opt_class();
        v49 = v39;
        -[AMSMercuryCacheFetchTask logKey](self, "logKey");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        AMSLogableURLRequest((uint64_t)v25);
        v51 = v18;
        v41 = v8;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v39;
        v63 = 2114;
        v64 = v40;
        v65 = 2114;
        v66 = v42;
        _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request generated %{public}@", buf, 0x20u);

        v8 = v41;
        v18 = v51;

      }
      v19 = 0;
    }
    else
    {
      AMSError(12, CFSTR("URL was not generated from components"), CFSTR("No URL generated"), 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v43, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v52 = v18;
        v45 = v8;
        v46 = (void *)objc_opt_class();
        v50 = v46;
        -[AMSMercuryCacheFetchTask logKey](self, "logKey");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v46;
        v8 = v45;
        v18 = v52;
        v63 = 2114;
        v64 = v47;
        v65 = 2114;
        v66 = v19;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error fetching bag values for url generation %{public}@", buf, 0x20u);

      }
      if (a3)
      {
        v19 = objc_retainAutorelease(v19);
        v25 = 0;
        *a3 = v19;
      }
      else
      {
        v25 = 0;
      }
    }

    v13 = v57;
  }

  return v25;
}

+ (id)requestEncoderWithSharedProperties:(id)a3 task:(id)a4
{
  id v5;
  id v6;
  AMSMediaRequestEncoder *v7;
  void *v8;
  void *v9;
  AMSMediaRequestEncoder *v10;
  void *v11;
  void *v12;
  AMSMediaResponseDecoder *v13;

  v5 = a4;
  v6 = a3;
  v7 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v6, "tokenService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v7, "initWithTokenService:bag:", v8, v9);

  objc_msgSend(v5, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setAccount:](v10, "setAccount:", v11);

  objc_msgSend(v5, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMediaRequestEncoder setClientInfo:](v10, "setClientInfo:", v12);
  v13 = objc_alloc_init(AMSMediaResponseDecoder);
  -[AMSMediaRequestEncoder setResponseDecoder:](v10, "setResponseDecoder:", v13);

  return v10;
}

+ (id)sharedPropertiesFromTask:(id)a3
{
  return +[AMSMediaSharedProperties propertiesForMercuryCacheFetchTask:](AMSMediaSharedProperties, "propertiesForMercuryCacheFetchTask:", a3);
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_12 != -1)
    dispatch_once(&_MergedGlobals_1_12, &__block_literal_global_81);
  return (NSString *)(id)qword_1ECEACB98;
}

void __41__AMSMercuryCacheFetchTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB98;
  qword_1ECEACB98 = (uint64_t)CFSTR("AMSMercuryCache");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACBA0 != -1)
    dispatch_once(&qword_1ECEACBA0, &__block_literal_global_35_1);
  return (NSString *)(id)qword_1ECEACBA8;
}

void __48__AMSMercuryCacheFetchTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACBA8;
  qword_1ECEACBA8 = (uint64_t)CFSTR("1");

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

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSSet)cacheTypeIDs
{
  return self->_cacheTypeIDs;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
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
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheTypeIDs, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
