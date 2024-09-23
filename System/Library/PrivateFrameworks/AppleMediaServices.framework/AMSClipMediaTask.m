@implementation AMSClipMediaTask

- (AMSClipMediaTask)initWithClientID:(id)a3 bundleID:(id)a4 URL:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSClipMediaTask *v15;
  AMSClipMediaTask *v16;
  uint64_t v17;
  AMSProcessInfo *clientInfo;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMSClipMediaTask;
  v15 = -[AMSTask init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bag, a6);
    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_clientID, a3);
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v17 = objc_claimAutoreleasedReturnValue();
    clientInfo = v16->_clientInfo;
    v16->_clientInfo = (AMSProcessInfo *)v17;

    objc_storeStrong((id *)&v16->_URL, a5);
  }

  return v16;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__AMSClipMediaTask_perform__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __27__AMSClipMediaTask_perform__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v16 = v4;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting clip media task. (client: %{public}@, bundle: %@, url: %@)", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ams.ac"));

  v11 = *(void **)(a1 + 32);
  if (v10)
    objc_msgSend(v11, "_performJourneysLookup");
  else
    objc_msgSend(v11, "_performNetworkLookup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __27__AMSClipMediaTask_perform__block_invoke_2;
  v14[3] = &unk_1E2540168;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "addFinishBlock:", v14);
  return v12;
}

void __27__AMSClipMediaTask_perform__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
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
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v10 = "%{public}@: [%{public}@] Clip media task finished successfully.";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_10:
      _os_log_impl(&dword_18C849000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v4;
      v10 = "%{public}@: [%{public}@] Clip media task finished with error. %{public}@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
      goto LABEL_10;
    }
  }

}

+ (NSString)bagSubProfile
{
  return +[AMSMediaTask bagSubProfile](AMSMediaTask, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSMediaTask bagSubProfileVersion](AMSMediaTask, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSMediaTask createBagForSubProfile](AMSMediaTask, "createBagForSubProfile");
}

- (id)_performJourneysLookup
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  AMSEngagement *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v5;
    v34 = 2114;
    v35 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing journeys lookup", buf, 0x16u);

  }
  v31[0] = CFSTR("AMSClipMediaTask");
  v30[0] = CFSTR("source");
  v30[1] = CFSTR("url");
  -[AMSClipMediaTask URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E2548760;
  v31[1] = v10;
  v30[2] = CFSTR("clientId");
  -[AMSClipMediaTask clientID](self, "clientID");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E2548760;
  v31[2] = v13;
  v30[3] = CFSTR("bundleId");
  -[AMSClipMediaTask bundleID](self, "bundleID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E2548760;
  v31[3] = v16;
  v30[4] = CFSTR("clientInfo");
  v28 = CFSTR("bundleId");
  -[AMSClipMediaTask clientInfo](self, "clientInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_1E2548760;
  v29 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc_init(AMSEngagement);
  -[AMSEngagement enqueueData:](v23, "enqueueData:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __42__AMSClipMediaTask__performJourneysLookup__block_invoke;
  v27[3] = &unk_1E2540190;
  v27[4] = self;
  objc_msgSend(v24, "thenWithBlock:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __42__AMSClipMediaTask__performJourneysLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  AMSURLResult *v21;
  id v22;
  AMSURLResult *v23;
  AMSMediaResult *v24;

  v3 = a2;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA70];
  if (v5)
    v8 = (void *)v5;
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v9 = v8;

  objc_msgSend(v3, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("body"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v7;
  v14 = v13;

  if (objc_msgSend(v9, "count") && objc_msgSend(v14, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C18]), "initWithURL:statusCode:HTTPVersion:headerFields:", v18, 200, 0, v9);
    v21 = [AMSURLResult alloc];
    v22 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    v23 = -[AMSURLResult initWithTask:response:data:object:](v21, "initWithTask:response:data:object:", 0, v20, v22, v14);

    v24 = -[AMSMediaResult initWithResult:]([AMSMediaResult alloc], "initWithResult:", v23);
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AMSError(7, CFSTR("Clip Media Task Failed"), CFSTR("No journeys data provided"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)_performNetworkLookup
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  AMSMediaTokenService *v7;
  AMSURLSession *v8;
  void *v9;
  AMSURLSession *v10;
  AMSMediaProtocolHandler *v11;
  AMSMediaResponseDecoder *v12;
  void *v13;
  AMSMediaTokenService *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  AMSMediaTokenService *v22;
  AMSClipMediaTask *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
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
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v5;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network lookup", buf, 0x16u);

  }
  v7 = -[AMSMediaTokenService initWithClientIdentifier:bag:]([AMSMediaTokenService alloc], "initWithClientIdentifier:bag:", self->_clientID, self->_bag);
  v8 = [AMSURLSession alloc];
  objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSURLSession initWithConfiguration:](v8, "initWithConfiguration:", v9);

  v11 = -[AMSMediaProtocolHandler initWithTokenService:]([AMSMediaProtocolHandler alloc], "initWithTokenService:", v7);
  -[AMSURLSession setProtocolHandler:](v10, "setProtocolHandler:", v11);

  v12 = objc_alloc_init(AMSMediaResponseDecoder);
  -[AMSURLSession setResponseDecoder:](v10, "setResponseDecoder:", v12);

  -[AMSMediaTokenService setSession:](v7, "setSession:", v10);
  -[AMSClipMediaTask _componentsPromise](self, "_componentsPromise");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __41__AMSClipMediaTask__performNetworkLookup__block_invoke;
  v21 = &unk_1E25401B8;
  v22 = v7;
  v23 = self;
  v14 = v7;
  objc_msgSend(v13, "thenWithBlock:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLSession dataTaskPromiseWithRequestPromise:](v10, "dataTaskPromiseWithRequestPromise:", v15, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __41__AMSClipMediaTask__performNetworkLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AMSMediaRequestEncoder *v4;
  uint64_t v5;
  void *v6;
  AMSMediaRequestEncoder *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = [AMSMediaRequestEncoder alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v4, "initWithTokenService:bag:", v5, v6);

  objc_msgSend(*(id *)(a1 + 40), "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setClientInfo:](v7, "setClientInfo:", v8);

  AMSLogKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setLogKey:](v7, "setLogKey:", v9);

  -[AMSMediaRequestEncoder requestWithComponents:](v7, "requestWithComponents:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_componentsPromise
{
  AMSClipMediaURLBuilder *v3;
  void *v4;
  void *v5;
  AMSClipMediaURLBuilder *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = [AMSClipMediaURLBuilder alloc];
  -[AMSClipMediaTask bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSClipMediaTask bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSClipMediaURLBuilder initWithBundleID:bag:](v3, "initWithBundleID:bag:", v4, v5);

  -[AMSClipMediaTask externalVersionID](self, "externalVersionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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
      -[AMSClipMediaTask externalVersionID](self, "externalVersionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Requesting specific version (unsupported in production) %{public}@", (uint8_t *)&v16, 0x20u);

    }
    -[AMSClipMediaTask externalVersionID](self, "externalVersionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSClipMediaURLBuilder setExternalVersionID:](v6, "setExternalVersionID:", v13);

  }
  -[AMSClipMediaURLBuilder build](v6, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSNumber)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
  objc_storeStrong((id *)&self->_externalVersionID, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
