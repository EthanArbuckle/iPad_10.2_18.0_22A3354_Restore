@implementation AMSMediaTask

void __36__AMSMediaTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB88;
  qword_1ECEACB88 = (uint64_t)CFSTR("1");

}

void __29__AMSMediaTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB78;
  qword_1ECEACB78 = (uint64_t)CFSTR("AMSMediaTask");

}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_11 != -1)
    dispatch_once(&_MergedGlobals_1_11, &__block_literal_global_76);
  return (NSString *)(id)qword_1ECEACB78;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACB80 != -1)
    dispatch_once(&qword_1ECEACB80, &__block_literal_global_42_0);
  return (NSString *)(id)qword_1ECEACB88;
}

- (AMSMediaTask)initWithType:(int64_t)a3 clientIdentifier:(id)a4 clientVersion:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSMediaTask *v14;
  AMSMediaTask *v15;
  uint64_t v16;
  NSString *logKey;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AMSMediaTask;
  v14 = -[AMSTask init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_clientIdentifier, a4);
    objc_storeStrong((id *)&v15->_clientVersion, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
    AMSGenerateLogCorrelationKey();
    v16 = objc_claimAutoreleasedReturnValue();
    logKey = v15->_logKey;
    v15->_logKey = (NSString *)v16;

  }
  return v15;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__AMSMediaTask_perform__block_invoke;
  v3[3] = &unk_1E2541E90;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __23__AMSMediaTask_perform__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  AMSMediaTaskURLBuilder *v11;
  void *v12;
  void *v13;
  AMSMediaTaskURLBuilder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  AMSMediaRequestEncoder *v26;
  uint64_t v27;
  void *v28;
  AMSMediaRequestEncoder *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v43;
  AMSMediaResponseDecoder *v44;
  void *v45;
  _QWORD *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v6;
    v52 = 2114;
    v53 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Starting media task", buf, 0x16u);

  }
  +[AMSMediaTaskTypeConfig configForType:](AMSMediaTaskTypeConfig, "configForType:", objc_msgSend(*(id *)(a1 + 32), "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [AMSMediaTaskURLBuilder alloc];
  objc_msgSend(*(id *)(a1 + 32), "clientVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AMSMediaTaskURLBuilder initWithConfig:clientVersion:bag:](v11, "initWithConfig:clientVersion:bag:", v10, v12, v13);

  objc_msgSend(*(id *)(a1 + 32), "additionalPlatforms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setAdditionalPlatforms:](v14, "setAdditionalPlatforms:", v15);

  objc_msgSend(*(id *)(a1 + 32), "additionalQueryParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setAdditionalQueryParams:](v14, "setAdditionalQueryParams:", v16);

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setBundleIdentifiers:](v14, "setBundleIdentifiers:", v17);

  -[AMSMediaTaskURLBuilder setCharts:](v14, "setCharts:", objc_msgSend(*(id *)(a1 + 32), "charts"));
  objc_msgSend(*(id *)(a1 + 32), "filters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setFilters:](v14, "setFilters:", v18);

  objc_msgSend(*(id *)(a1 + 32), "includedResultKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setIncludedResultKeys:](v14, "setIncludedResultKeys:", v19);

  objc_msgSend(*(id *)(a1 + 32), "itemIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setItemIdentifiers:](v14, "setItemIdentifiers:", v20);

  objc_msgSend(*(id *)(a1 + 32), "searchTerm");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaTaskURLBuilder setSearchTerm:](v14, "setSearchTerm:", v21);

  -[AMSMediaTaskURLBuilder build](v14, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v22, "resultWithTimeout:error:", &v49, 30.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v49;
  if (!v23)
  {
    v40 = 0;
    if (!a2)
      goto LABEL_15;
    goto LABEL_14;
  }
  v45 = v10;
  v46 = a2;
  +[AMSMediaSharedProperties propertiesForMediaTask:](AMSMediaSharedProperties, "propertiesForMediaTask:", *(_QWORD *)(a1 + 32));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v25, "tokenService");
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v26, "initWithTokenService:bag:", v27, v28);

  objc_msgSend(*(id *)(a1 + 32), "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_msgSend(v30, "ams_isEphemeralAccount");

  if ((v27 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMediaRequestEncoder setAccount:](v29, "setAccount:", v31);

  }
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setClientInfo:](v29, "setClientInfo:", v32);

  objc_msgSend(*(id *)(a1 + 32), "logKey");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setLogKey:](v29, "setLogKey:", v33);

  -[AMSMediaRequestEncoder setURLKnownToBeTrusted:](v29, "setURLKnownToBeTrusted:", objc_msgSend(*(id *)(a1 + 32), "URLKnownToBeTrusted"));
  v44 = objc_alloc_init(AMSMediaResponseDecoder);
  -[AMSMediaRequestEncoder setResponseDecoder:](v29, "setResponseDecoder:");
  -[AMSMediaRequestEncoder requestWithComponents:](v29, "requestWithComponents:", v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v24;
  objc_msgSend(v34, "resultWithTimeout:error:", &v48, 60.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v48;

  if (v35)
  {
    objc_msgSend(v25, "session");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dataTaskPromiseWithRequest:", v35);
    v43 = v23;
    v38 = v22;
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v36;
    objc_msgSend(v39, "resultWithTimeout:error:", &v47, 60.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v47;

    v22 = v38;
    v23 = v43;
    v36 = v41;
  }
  else
  {
    v40 = 0;
  }

  v24 = v36;
  v10 = v45;
  a2 = v46;
  if (v46)
LABEL_14:
    *a2 = objc_retainAutorelease(v24);
LABEL_15:

  return v40;
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

- (NSArray)additionalPlatforms
{
  return self->_additionalPlatforms;
}

- (void)setAdditionalPlatforms:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPlatforms, a3);
}

- (NSDictionary)additionalQueryParams
{
  return self->_additionalQueryParams;
}

- (void)setAdditionalQueryParams:(id)a3
{
  objc_storeStrong((id *)&self->_additionalQueryParams, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, a3);
}

- (BOOL)charts
{
  return self->_charts;
}

- (void)setCharts:(BOOL)a3
{
  self->_charts = a3;
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

- (NSDictionary)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (NSArray)includedResultKeys
{
  return self->_includedResultKeys;
}

- (void)setIncludedResultKeys:(id)a3
{
  objc_storeStrong((id *)&self->_includedResultKeys, a3);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifiers, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)URLKnownToBeTrusted
{
  return self->_URLKnownToBeTrusted;
}

- (void)setURLKnownToBeTrusted:(BOOL)a3
{
  self->_URLKnownToBeTrusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedResultKeys, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalQueryParams, 0);
  objc_storeStrong((id *)&self->_additionalPlatforms, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
