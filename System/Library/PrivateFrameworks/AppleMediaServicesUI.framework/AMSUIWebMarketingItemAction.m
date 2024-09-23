@implementation AMSUIWebMarketingItemAction

- (AMSUIWebMarketingItemAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebMarketingItemAction *v7;
  void *v8;
  NSString *v9;
  NSString *clientIdentifier;
  void *v11;
  NSString *v12;
  NSString *clientVersion;
  void *v14;
  NSDictionary *v15;
  NSDictionary *contextInfo;
  void *v17;
  NSString *v18;
  NSString *offerHints;
  void *v20;
  NSString *v21;
  NSString *placement;
  void *v23;
  NSString *v24;
  NSString *serviceType;
  void *v26;
  void *v27;
  uint64_t v28;
  ACAccount *account;
  void *v30;
  void *v31;
  uint64_t v32;
  ACAccount *v33;
  objc_super v35;

  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AMSUIWebMarketingItemAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v35, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    clientIdentifier = v7->_clientIdentifier;
    v7->_clientIdentifier = v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    clientVersion = v7->_clientVersion;
    v7->_clientVersion = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    contextInfo = v7->_contextInfo;
    v7->_contextInfo = v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("offerHints"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    offerHints = v7->_offerHints;
    v7->_offerHints = v18;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placement"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    placement = v7->_placement;
    v7->_placement = v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    serviceType = v7->_serviceType;
    v7->_serviceType = v24;

    -[AMSUIWebAction context](v7, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "iTunesAccountFromJSAccount:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    account = v7->_account;
    v7->_account = (ACAccount *)v28;

    if (!v7->_account)
    {
      -[AMSUIWebAction context](v7, "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "iTunesAccountFromJSDSID:", v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v7->_account;
      v7->_account = (ACAccount *)v32;

    }
  }

  return v7;
}

- (id)runAction
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  AMSUIWebMarketingItemAction *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)AMSUIWebMarketingItemAction;
  v3 = -[AMSUIWebAction runAction](&v35, sel_runAction);
  v4 = objc_alloc_init(MEMORY[0x24BE08340]);
  AMSLogKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMarketingItemAction clientIdentifier](self, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMarketingItemAction clientVersion](self, "clientVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMarketingItemAction account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v37 = v8;
    v38 = 2114;
    v39 = v9;
    v40 = 2114;
    v41 = v10;
    v42 = 2114;
    v43 = v11;
    v44 = 2114;
    v45 = v12;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running marketing item action with clientID: %{public}@ clientVersion: %{public}@ account: %{public}@", buf, 0x34u);

  }
  v13 = objc_alloc(MEMORY[0x24BE08208]);
  -[AMSUIWebAction context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMarketingItemAction clientIdentifier](self, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMarketingItemAction clientVersion](self, "clientVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMarketingItemAction placement](self, "placement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMarketingItemAction serviceType](self, "serviceType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v13, "initWithBag:clientIdentifier:clientVersion:placement:serviceType:", v15, v16, v17, v18, v19);

  -[AMSUIWebAction context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccount:", v22);

  -[AMSUIWebMarketingItemAction contextInfo](self, "contextInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContextInfo:", v23);

  -[AMSUIWebMarketingItemAction offerHints](self, "offerHints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOfferHints:", v24);

  objc_msgSend(v20, "setLogKey:", v5);
  objc_msgSend(v20, "perform");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __40__AMSUIWebMarketingItemAction_runAction__block_invoke;
  v31[3] = &unk_24CB518B0;
  v32 = v5;
  v33 = self;
  v26 = v4;
  v34 = v26;
  v27 = v5;
  objc_msgSend(v25, "addFinishBlock:", v31);

  v28 = v34;
  v29 = v26;

  return v29;
}

void __40__AMSUIWebMarketingItemAction_runAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id)AMSSetLogKey();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Marketing item task failed. %{public}@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Marketing item task completed successfully.", (uint8_t *)&v18, 0x16u);

    }
    v16 = *(void **)(a1 + 48);
    objc_msgSend(v5, "rawValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithResult:", v17);

  }
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)offerHints
{
  return self->_offerHints;
}

- (NSString)placement
{
  return self->_placement;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_offerHints, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
