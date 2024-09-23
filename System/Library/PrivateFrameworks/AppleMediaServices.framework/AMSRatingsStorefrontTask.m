@implementation AMSRatingsStorefrontTask

- (AMSRatingsStorefrontTask)initWithMediaType:(unint64_t)a3 clientIdentifier:(id)a4 bag:(id)a5
{
  id v9;
  id v10;
  AMSRatingsStorefrontTask *v11;
  AMSRatingsStorefrontTask *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AMSRatingsStorefrontTask;
  v11 = -[AMSTask init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mediaType = a3;
    objc_storeStrong((id *)&v11->_clientIdentifier, a4);
    objc_storeStrong((id *)&v12->_bag, a5);
  }

  return v12;
}

- (id)performTask
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = __39__AMSRatingsStorefrontTask_performTask__block_invoke;
  v4[3] = &unk_1E2545560;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)AMSRatingsStorefrontTask;
  v4[0] = MEMORY[0x1E0C809B0];
  -[AMSTask performTaskWithBlock:](&v3, sel_performTaskWithBlock_, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

AMSRatingsStorefrontResult *__39__AMSRatingsStorefrontTask_performTask__block_invoke(uint64_t a1, _QWORD *a2)
{
  AMSRatingsCache *v4;
  void *v5;
  AMSRatingsStorefrontResult *v6;
  AMSRatingsStorefrontResult *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  AMSMediaRequestEncoder *v16;
  void *v17;
  void *v18;
  AMSMediaRequestEncoder *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  AMSRatingsStorefrontResult *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  AMSMediaRequestEncoder *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = -[AMSRatingsCache initWithMediaType:]([AMSRatingsCache alloc], "initWithMediaType:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  -[AMSRatingsCache clearCacheIfNeeded](v4, "clearCacheIfNeeded");
  -[AMSRatingsCache getCacheData](v4, "getCacheData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = -[AMSRatingsStorefrontResult initWithData:mediaType:]([AMSRatingsStorefrontResult alloc], "initWithData:mediaType:", v5, objc_msgSend(*(id *)(a1 + 32), "mediaType"))) == 0)
  {
    v47 = a2;
    AMSLogKey();
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_urlForMediaType:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
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
      objc_msgSend(v9, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v12;
      v55 = 2114;
      v56 = v8;
      v57 = 2112;
      v58 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] URL for Storefronts: %@.", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMediaSharedProperties propertiesForStorefrontsTask:](AMSMediaSharedProperties, "propertiesForStorefrontsTask:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [AMSMediaRequestEncoder alloc];
    v50 = v15;
    objc_msgSend(v15, "tokenService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v16, "initWithTokenService:bag:", v17, v18);

    -[AMSMediaRequestEncoder setLogKey:](v19, "setLogKey:", v8);
    -[AMSMediaRequestEncoder requestByEncodingRequest:parameters:](v19, "requestByEncodingRequest:parameters:", v14, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v54 = v23;
      v55 = 2114;
      v56 = v8;
      v57 = 2112;
      v58 = v14;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request generated: %@.", buf, 0x20u);
    }

    v52 = 0;
    v48 = v20;
    objc_msgSend(v20, "resultWithTimeout:error:", &v52, 60.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v52;
    v26 = v25;
    v49 = v9;
    if (!v24)
    {
      v34 = (void *)v8;
      v35 = 0;
      v30 = v25;
      if (!v25)
        goto LABEL_34;
      goto LABEL_33;
    }
    v43 = v19;
    objc_msgSend(v50, "session");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dataTaskPromiseWithRequest:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v26;
    v44 = v28;
    objc_msgSend(v28, "resultWithTimeout:error:", &v51, 60.0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v51;

    v45 = v14;
    v46 = (void *)v29;
    if (v30)
    {
      +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      v19 = v43;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v54 = v33;
        v55 = 2114;
        v34 = (void *)v8;
        v56 = v8;
        v57 = 2112;
        v58 = v30;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request completed with error: %@.", buf, 0x20u);
      }
      else
      {
        v34 = (void *)v8;
      }
      v35 = 0;
    }
    else
    {
      v34 = (void *)v8;
      v35 = -[AMSRatingsStorefrontResult initWithURLResult:mediaType:]([AMSRatingsStorefrontResult alloc], "initWithURLResult:mediaType:", v29, objc_msgSend(*(id *)(a1 + 32), "mediaType"));
      +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v36, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      v19 = v43;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v54 = v38;
        v55 = 2114;
        v56 = (uint64_t)v34;
        v57 = 2112;
        v58 = v46;
        _os_log_impl(&dword_18C849000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request completed: %@.", buf, 0x20u);
      }

      objc_msgSend(v46, "data");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[AMSRatingsCache addCacheData:](v4, "addCacheData:", v39);

      if (v40)
      {
LABEL_32:

        v14 = v45;
        if (!v30)
        {
LABEL_34:
          v7 = v35;

          goto LABEL_35;
        }
LABEL_33:
        *v47 = objc_retainAutorelease(v30);
        goto LABEL_34;
      }
      +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v41 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v54 = v41;
        v55 = 2114;
        v56 = (uint64_t)v34;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cache data", buf, 0x16u);
      }
    }

    goto LABEL_32;
  }
  v7 = v6;
LABEL_35:

  return v7;
}

- (id)_urlBagKeyForMediaType:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("AMSRatingsStorefrontMediaURL");
  else
    return off_1E2545580[a3];
}

- (id)_urlForMediaType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[AMSRatingsStorefrontTask _urlBagKeyForMediaType:](self, "_urlBagKeyForMediaType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSRatingsStorefrontTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "valueWithError:", &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  if (v8 || !v7)
  {
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
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
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting URL from the bag for the key: %@.", buf, 0x20u);

    }
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
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
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating URL from string: %@.", buf, 0x20u);

    }
    AMSError(200, CFSTR("Storefronts URL string malformed"), CFSTR("Failed to create URL from bag-provided URL string"), 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  v10 = (void *)v9;
  -[AMSRatingsStorefrontTask _queryItems](self, "_queryItems");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v10, 0);
  objc_msgSend(v12, "queryItems");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setQueryItems:", v17);
  objc_msgSend(v12, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v18;
}

- (id)_queryItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSRatingsStorefrontTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", 0x1E254CA00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[AMSDevice language](AMSDevice, "language");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("l"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  +[AMSMediaURLBuilderUtility devicePlatform](AMSMediaURLBuilderUtility, "devicePlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("platform"), v11);
    objc_msgSend(v3, "addObject:", v12);

  }
  if (+[AMSDevice deviceIsChinaSKU](AMSDevice, "deviceIsChinaSKU"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("with"), CFSTR("cnformat"));
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSRatingsProvider");
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

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
