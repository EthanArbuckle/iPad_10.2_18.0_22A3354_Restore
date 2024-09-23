@implementation AMSUIWebMediaAction

- (AMSUIWebMediaAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebMediaAction *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *bundleIdentifiers;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  NSArray *v21;
  NSArray *itemIdentifiers;
  void *v23;
  NSArray *v24;
  NSArray *includedResultKeys;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSUIWebMediaAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v27, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
      objc_storeStrong((id *)&v7->_urlString, v9);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7->_type = objc_msgSend(v10, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    bundleIdentifiers = v7->_bundleIdentifiers;
    v7->_bundleIdentifiers = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    if (v15)
      v16 = v15;
    else
      v16 = CFSTR("appstore");
    objc_storeStrong((id *)&v7->_clientIdentifier, v16);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    if (v18)
      v19 = v18;
    else
      v19 = CFSTR("1");
    objc_storeStrong((id *)&v7->_clientVersion, v19);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemIdentifiers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    itemIdentifiers = v7->_itemIdentifiers;
    v7->_itemIdentifiers = v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("includedResultKeys"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    includedResultKeys = v7->_includedResultKeys;
    v7->_includedResultKeys = v24;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AMSUIWebMediaAction;
  v3 = -[AMSUIWebAction runAction](&v17, sel_runAction);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction bundleIdentifiers](self, "bundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction itemIdentifiers](self, "itemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v6;
    v20 = 2114;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running media action with identifiers: %@ %@", buf, 0x2Au);

  }
  -[AMSUIWebMediaAction urlString](self, "urlString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AMSUIWebMediaAction urlString](self, "urlString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction clientIdentifier](self, "clientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction clientVersion](self, "clientVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction _runMediaRequestWithURL:clientIdentifier:clientVersion:](self, "_runMediaRequestWithURL:clientIdentifier:clientVersion:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = -[AMSUIWebMediaAction type](self, "type");
    -[AMSUIWebMediaAction clientIdentifier](self, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction clientVersion](self, "clientVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebMediaAction _runMediaRequestWithType:clientIdentifier:clientVersion:](self, "_runMediaRequestWithType:clientIdentifier:clientVersion:", v15, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_runMediaRequestWithURL:(id)a3 clientIdentifier:(id)a4 clientVersion:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD1808];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithString:", v9);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BE08240]);
    -[AMSUIWebAction context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithClientIdentifier:bag:", v7, v13);

    v15 = objc_alloc(MEMORY[0x24BE08220]);
    -[AMSUIWebAction context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithTokenService:bag:", v14, v17);

    v19 = objc_alloc_init(MEMORY[0x24BE08228]);
    objc_msgSend(v18, "setResponseDecoder:", v19);

    -[AMSUIWebAction context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAccount:", v21);

    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLogKey:", v22);

    v23 = objc_alloc_init(MEMORY[0x24BE08410]);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08218]), "initWithTokenService:", v14);
    objc_msgSend(v23, "setProtocolHandler:", v24);

    objc_msgSend(v18, "requestWithComponents:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataTaskPromiseWithRequestPromise:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(MEMORY[0x24BE08340]);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __78__AMSUIWebMediaAction__runMediaRequestWithURL_clientIdentifier_clientVersion___block_invoke;
    v32[3] = &unk_24CB518D8;
    v28 = v27;
    v33 = v28;
    objc_msgSend(v26, "addFinishBlock:", v32);

  }
  else
  {
    v29 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "promiseWithError:", v30);
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

void __78__AMSUIWebMediaAction__runMediaRequestWithURL_clientIdentifier_clientVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v10;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE08230]), "initWithResult:", v10);
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "responseDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithResult:error:", v9, v5);

}

- (id)_runMediaRequestWithType:(int64_t)a3 clientIdentifier:(id)a4 clientVersion:(id)a5
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;

  v6 = objc_alloc_init(MEMORY[0x24BE08340]);
  v7 = objc_alloc(MEMORY[0x24BE08238]);
  v8 = -[AMSUIWebMediaAction type](self, "type");
  -[AMSUIWebMediaAction clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebMediaAction clientVersion](self, "clientVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithType:clientIdentifier:clientVersion:bag:", v8, v9, v10, v12);

  -[AMSUIWebAction context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccount:", v15);

  -[AMSUIWebMediaAction bundleIdentifiers](self, "bundleIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBundleIdentifiers:", v16);

  -[AMSUIWebMediaAction itemIdentifiers](self, "itemIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItemIdentifiers:", v17);

  -[AMSUIWebMediaAction includedResultKeys](self, "includedResultKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncludedResultKeys:", v18);

  objc_msgSend(v13, "perform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __79__AMSUIWebMediaAction__runMediaRequestWithType_clientIdentifier_clientVersion___block_invoke;
  v22[3] = &unk_24CB51900;
  v20 = v6;
  v23 = v20;
  objc_msgSend(v19, "addFinishBlock:", v22);

  return v20;
}

void __79__AMSUIWebMediaAction__runMediaRequestWithType_clientIdentifier_clientVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "responseDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:error:", v6, v5);

}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientVersion, a3);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifiers, a3);
}

- (NSArray)includedResultKeys
{
  return self->_includedResultKeys;
}

- (void)setIncludedResultKeys:(id)a3
{
  objc_storeStrong((id *)&self->_includedResultKeys, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_includedResultKeys, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
