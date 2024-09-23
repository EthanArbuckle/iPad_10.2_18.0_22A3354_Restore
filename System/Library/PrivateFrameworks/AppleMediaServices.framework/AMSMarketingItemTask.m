@implementation AMSMarketingItemTask

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (AMSMarketingItemTask)initWithBag:(id)a3 clientIdentifier:(id)a4 clientVersion:(id)a5 placement:(id)a6 serviceType:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AMSMarketingItemTask *v17;
  AMSMarketingItemTask *v18;
  id v20;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v20 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AMSMarketingItemTask;
  v17 = -[AMSTask init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bag, a3);
    objc_storeStrong((id *)&v18->_clientIdentifier, a4);
    objc_storeStrong((id *)&v18->_clientVersion, a5);
    v18->_hydrateRelatedContent = 1;
    v18->_includeMediaAssets = 1;
    objc_storeStrong((id *)&v18->_placement, a6);
    objc_storeStrong((id *)&v18->_serviceType, a7);
  }

  return v18;
}

- (AMSMarketingItemTask)initWithAccount:(id)a3 bag:(id)a4 clientIdentifier:(id)a5 clientVersion:(id)a6 placement:(id)a7 serviceType:(id)a8
{
  id v15;
  AMSMarketingItemTask *v16;
  AMSMarketingItemTask *v17;

  v15 = a3;
  v16 = -[AMSMarketingItemTask initWithBag:clientIdentifier:clientVersion:placement:serviceType:](self, "initWithBag:clientIdentifier:clientVersion:placement:serviceType:", a4, a5, a6, a7, a8);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_account, a3);

  return v17;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__AMSMarketingItemTask_perform__block_invoke;
  v3[3] = &unk_1E2542CA8;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __31__AMSMarketingItemTask_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_fetchItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__AMSMarketingItemTask_perform__block_invoke_2;
  v8[3] = &unk_1E253D638;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "thenWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resultWithError:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __31__AMSMarketingItemTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMarketingItemParser selectionFromRawMarketingItems:serviceType:placement:](AMSMarketingItemParser, "selectionFromRawMarketingItems:serviceType:placement:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)performWithFetchOnly
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__AMSMarketingItemTask_performWithFetchOnly__block_invoke;
  v3[3] = &unk_1E2542CD0;
  v3[4] = self;
  -[AMSTask performTaskWithBlock:](self, "performTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __44__AMSMarketingItemTask_performWithFetchOnly__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_fetchItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thenWithBlock:", &__block_literal_global_72);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resultWithError:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

AMSMutablePromise *__44__AMSMarketingItemTask_performWithFetchOnly__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  AMSMutablePromise *v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init(AMSMutablePromise);
  objc_msgSend(v2, "ams_mapWithTransform:", &__block_literal_global_7_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMutablePromise finishWithResult:](v3, "finishWithResult:", v4);
  return v3;
}

AMSMarketingItem *__44__AMSMarketingItemTask_performWithFetchOnly__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  AMSMarketingItem *v3;

  v2 = a2;
  v3 = -[AMSMarketingItem initWithDictionary:]([AMSMarketingItem alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)_fetchItems
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AMSMarketingItemTaskURLBuilder *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
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
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[AMSMarketingItemTask logKey](self, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask serviceType](self, "serviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask placement](self, "placement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask contextInfo](self, "contextInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v31 = v5;
    v32 = 2114;
    v33 = v7;
    v34 = 2114;
    v35 = v8;
    v36 = 2114;
    v37 = v9;
    v38 = 2114;
    v39 = v10;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching marketing items for serviceType: %{public}@ \nplacement: %{public}@ \ncontext: %{public}@", buf, 0x34u);

  }
  if (+[AMSDefaults disableStubbedMarketingItems](AMSDefaults, "disableStubbedMarketingItems"))
  {
    v11 = objc_alloc_init(AMSMarketingItemTaskURLBuilder);
    -[AMSMarketingItemTask serviceType](self, "serviceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask placement](self, "placement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask bag](self, "bag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AMSMarketingItemTask hydrateRelatedContent](self, "hydrateRelatedContent");
    -[AMSMarketingItemTask offerHints](self, "offerHints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask contextInfo](self, "contextInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTaskURLBuilder urlWithServiceType:placement:bag:hydrateRelatedContents:offerHints:additionalParameters:](v11, "urlWithServiceType:placement:bag:hydrateRelatedContents:offerHints:additionalParameters:", v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __35__AMSMarketingItemTask__fetchItems__block_invoke;
    v28[3] = &unk_1E253FE80;
    v28[4] = self;
    objc_msgSend(v18, "thenWithBlock:", v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      v23 = v22;
      -[AMSMarketingItemTask logKey](self, "logKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using local stubs", buf, 0x16u);

    }
    -[AMSMarketingItemTask serviceType](self, "serviceType");
    v11 = (AMSMarketingItemTaskURLBuilder *)objc_claimAutoreleasedReturnValue();
    -[AMSMarketingItemTask placement](self, "placement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMarketingItemStub stubForServiceType:placement:](AMSMarketingItemStub, "stubForServiceType:placement:", v11, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

uint64_t __35__AMSMarketingItemTask__fetchItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchItemsFromURL:", a2);
}

- (id)_fetchItemsFromURL:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  AMSMediaRequestEncoder *v7;
  void *v8;
  void *v9;
  AMSMediaRequestEncoder *v10;
  void *v11;
  void *v12;
  void *v13;
  AMSMediaResponseDecoder *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  AMSMutableLazyPromise *v22;
  AMSMutableLazyPromise *v23;
  void *v24;
  id v26;
  void *v27;
  AMSMutablePromise *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  +[AMSMediaSharedProperties propertiesForMarketingItemTask:](AMSMediaSharedProperties, "propertiesForMarketingItemTask:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v6, "tokenService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItemTask bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v7, "initWithTokenService:bag:", v8, v9);

  -[AMSMarketingItemTask account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setAccount:](v10, "setAccount:", v11);

  -[AMSMarketingItemTask clientInfo](self, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setClientInfo:](v10, "setClientInfo:", v12);

  -[AMSMarketingItemTask logKey](self, "logKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMediaRequestEncoder setLogKey:](v10, "setLogKey:", v13);

  v14 = objc_alloc_init(AMSMediaResponseDecoder);
  -[AMSMediaRequestEncoder setResponseDecoder:](v10, "setResponseDecoder:", v14);
  -[AMSMediaRequestEncoder requestWithURL:](v10, "requestWithURL:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(v15, "resultWithTimeout:error:", &v32, 60.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  if (v17)
  {
    v27 = v6;
    v28 = v5;
    +[AMSLogConfig sharedMarketingItemConfig](AMSLogConfig, "sharedMarketingItemConfig");
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
      v20 = (void *)objc_opt_class();
      v26 = v20;
      -[AMSMarketingItemTask logKey](self, "logKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v17;
      _os_log_impl(&dword_18C849000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

    }
    v5 = v28;
    -[AMSMutablePromise finishWithError:](v28, "finishWithError:", v17);
    v6 = v27;
  }
  if (v16)
  {
    v22 = [AMSMutableLazyPromise alloc];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __43__AMSMarketingItemTask__fetchItemsFromURL___block_invoke;
    v29[3] = &unk_1E2542CF8;
    v30 = v6;
    v31 = v16;
    v23 = -[AMSMutableLazyPromise initWithBlock:](v22, "initWithBlock:", v29);
    -[AMSMarketingItemTask _processMediaResultFromPromise:](self, "_processMediaResultFromPromise:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMutablePromise finishWithPromise:](v5, "finishWithPromise:", v24);

  }
  return v5;
}

void __43__AMSMarketingItemTask__fetchItemsFromURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "session");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataTaskPromiseWithRequest:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithPromise:", v5);

}

- (id)_processMediaResultFromPromise:(id)a3
{
  id v3;
  AMSMutableLazyPromise *v4;
  id v5;
  AMSMutableLazyPromise *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke;
  v8[3] = &unk_1E253FBC0;
  v9 = v3;
  v5 = v3;
  v6 = -[AMSMutableLazyPromise initWithTimeout:block:](v4, "initWithTimeout:block:", v8, 60.0);

  return v6;
}

void __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_2;
  v11[3] = &unk_1E253E120;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v4, "addErrorBlock:", v11);
  v7 = *(void **)(a1 + 32);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_3;
  v9[3] = &unk_1E2542D20;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "addSuccessBlock:", v9);

}

uint64_t __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __55__AMSMarketingItemTask__processMediaResultFromPromise___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("results"), CFSTR("data"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKeyPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = v6;

  if (!v7)
  {
LABEL_5:
    AMSError(7, CFSTR("Could not find array for key path results.data in response dictionary"), CFSTR("Data expected is missing."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v8);

    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v7);
LABEL_6:

}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_10 != -1)
    dispatch_once(&_MergedGlobals_1_10, &__block_literal_global_32_2);
  return (NSString *)(id)qword_1ECEACB58;
}

void __37__AMSMarketingItemTask_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB58;
  qword_1ECEACB58 = (uint64_t)CFSTR("AMSMarketingItemTask");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEACB60 != -1)
    dispatch_once(&qword_1ECEACB60, &__block_literal_global_35_0);
  return (NSString *)(id)qword_1ECEACB68;
}

void __44__AMSMarketingItemTask_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEACB68;
  qword_1ECEACB68 = (uint64_t)CFSTR("1");

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

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

- (BOOL)hydrateRelatedContent
{
  return self->_hydrateRelatedContent;
}

- (void)setHydrateRelatedContent:(BOOL)a3
{
  self->_hydrateRelatedContent = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSString)offerHints
{
  return self->_offerHints;
}

- (void)setOfferHints:(id)a3
{
  objc_storeStrong((id *)&self->_offerHints, a3);
}

- (NSString)placement
{
  return self->_placement;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (BOOL)includeMediaAssets
{
  return self->_includeMediaAssets;
}

- (void)setIncludeMediaAssets:(BOOL)a3
{
  self->_includeMediaAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_offerHints, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
