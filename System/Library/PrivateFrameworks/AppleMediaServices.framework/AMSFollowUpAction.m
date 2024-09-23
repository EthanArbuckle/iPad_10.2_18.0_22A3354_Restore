@implementation AMSFollowUpAction

- (AMSFollowUpAction)initWithLabel:(id)a3 parentIdentifier:(id)a4
{
  id v7;
  id v8;
  AMSFollowUpAction *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *actionQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *internalQueue;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *userInfo;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSFollowUpAction;
  v9 = -[AMSFollowUpAction init](&v18, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.AppleMediaServices.followUpAction", 0);
    actionQueue = v9->_actionQueue;
    v9->_actionQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.AppleMediaServices.followUpActionInternal", 0);
    internalQueue = v9->_internalQueue;
    v9->_internalQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_label, a3);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = v14;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v8, CFSTR("AMSParentIdentifier"));
    userInfo = v9->_userInfo;
    v9->_userInfo = v15;

  }
  return v9;
}

- (AMSFollowUpAction)initWithAction:(id)a3 parentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSFollowUpAction *v9;
  void *v10;
  uint64_t v11;
  NSURL *url;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  AMSMetricsEvent *v17;
  AMSMetricsEvent *metricsEvent;
  NSMutableDictionary *userInfo;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](self, "initWithLabel:parentIdentifier:", v8, v7);

  if (v9)
  {
    objc_msgSend(v6, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "url");
      v11 = objc_claimAutoreleasedReturnValue();
      url = v9->_url;
      v9->_url = (NSURL *)v11;

      objc_msgSend(v6, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSMutableDictionary *)objc_msgSend(v13, "mutableCopy");

      -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("AMSMetrics"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;

        if (v16)
        {
          v17 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v16);
          metricsEvent = v9->_metricsEvent;
          v9->_metricsEvent = v17;

          -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", CFSTR("AMSMetrics"));
        }
      }
      else
      {

        v16 = 0;
      }
      userInfo = v9->_userInfo;
      v9->_userInfo = v14;

    }
  }

  return v9;
}

- (AMSFollowUpAction)initWithItem:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  AMSFollowUpItem *v8;
  void *v9;
  AMSFollowUpAction *v10;
  uint64_t v11;
  NSString *backingIdentifier;

  v6 = a3;
  v7 = a4;
  v8 = -[AMSFollowUpItem initWithFollowUpItem:]([AMSFollowUpItem alloc], "initWithFollowUpItem:", v6);
  -[AMSFollowUpItem identifier](v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSFollowUpAction initWithAction:parentIdentifier:](self, "initWithAction:parentIdentifier:", v7, v9);

  if (v10)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    backingIdentifier = v10->_backingIdentifier;
    v10->_backingIdentifier = (NSString *)v11;

  }
  return v10;
}

- (AMSFollowUpAction)initWithJSONDictionary:(id)a3 parentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AMSFollowUpAction *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  AMSMetricsEvent *v27;
  AMSMetricsEvent *metricsEvent;
  uint64_t v29;
  NSURL *url;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSURL *v36;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSFollowUpAction initWithLabel:parentIdentifier:](self, "initWithLabel:parentIdentifier:", v8, v7);

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clear"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend(v10, "BOOLValue");
    else
      v11 = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientActionDeepLink"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("financeLink"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metrics"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serverActionUrl"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v43 = v14;
    if (v15)
    {
      v40 = v11;
      v41 = v13;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("url"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("method"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("body"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v39 = v12;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v20);
          v23 = v22;
          if (v18)
            v24 = v18;
          else
            v24 = CFSTR("GET");
          objc_msgSend(v22, "setHTTPMethod:", v24);
          objc_msgSend(v19, "dataUsingEncoding:", 4);
          v38 = v8;
          v25 = v10;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setHTTPBody:", v26);

          v10 = v25;
          v8 = v38;

        }
        else
        {
          v23 = 0;
        }
        v12 = v39;
      }
      else
      {
        v23 = 0;
      }

      v13 = v41;
      v14 = v43;
      v11 = v40;
    }
    else
    {
      v23 = 0;
    }
    -[AMSFollowUpAction setRequest:](v9, "setRequest:", v23);
    -[AMSFollowUpAction setShouldClear:](v9, "setShouldClear:", v11);
    if (v14)
    {
      v27 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v14);
      metricsEvent = v9->_metricsEvent;
      v9->_metricsEvent = v27;

    }
    if (v13)
    {
      -[AMSFollowUpAction setRequiresFollowUpUI:](v9, "setRequiresFollowUpUI:", 1);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
      v29 = objc_claimAutoreleasedReturnValue();
      url = v9->_url;
      v9->_url = (NSURL *)v29;

      if (v12)
      {
        +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v31, "OSLogObject");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v45 = (id)objc_opt_class();
          v42 = v13;
          v33 = v12;
          v34 = v45;
          _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring clientActionDeepLink due to existance of financeLink", buf, 0xCu);

          v12 = v33;
          v13 = v42;
        }

        v14 = v43;
      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v9->_url;
      v9->_url = (NSURL *)v35;

    }
  }

  return v9;
}

- (NSString)logKey
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__AMSFollowUpAction_logKey__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __27__AMSFollowUpAction_logKey__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSLogKey"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    AMSGenerateLogCorrelationKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, CFSTR("AMSLogKey"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSLogKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (NSString)parentIdentifier
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__AMSFollowUpAction_parentIdentifier__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __37__AMSFollowUpAction_parentIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSParentIdentifier"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)preferredClient
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__AMSFollowUpAction_preferredClient__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__AMSFollowUpAction_preferredClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSPreferredClient"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSURLRequest)request
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__AMSFollowUpAction_request__block_invoke;
  v6[3] = &unk_1E2542338;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURLRequest *)v4;
}

void __28__AMSFollowUpAction_request__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSRequest"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = v2;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AMSRequestURL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSRequestBody"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AMSRequestMethod"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v6);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      if (v5)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHTTPMethod:", v5);
      if (v4)
      {
        objc_msgSend(v4, "dataUsingEncoding:", 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHTTPBody:", v10);

      }
    }

    v2 = v11;
  }

}

- (BOOL)requiresFollowUpUI
{
  AMSFollowUpAction *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AMSFollowUpAction_requiresFollowUpUI__block_invoke;
  v5[3] = &unk_1E2542338;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__AMSFollowUpAction_requiresFollowUpUI__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSRequiresFollowUpUI"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v3, "BOOLValue");
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (BOOL)shouldClear
{
  AMSFollowUpAction *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AMSFollowUpAction_shouldClear__block_invoke;
  v5[3] = &unk_1E2542338;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __32__AMSFollowUpAction_shouldClear__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("AMSShouldClear"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v3, "BOOLValue");
  else
    v2 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (NSMutableDictionary)userInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__AMSFollowUpAction_userInfo__block_invoke;
  v6[3] = &unk_1E253E378;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __29__AMSFollowUpAction_userInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setLogKey:(id)a3
{
  -[AMSFollowUpAction _setUserInfoProperty:forKey:](self, "_setUserInfoProperty:forKey:", a3, CFSTR("AMSLogKey"));
}

- (void)setParentIdentifier:(id)a3
{
  -[AMSFollowUpAction _setUserInfoProperty:forKey:](self, "_setUserInfoProperty:forKey:", a3, CFSTR("AMSParentIdentifier"));
}

- (void)setPreferredClient:(id)a3
{
  -[AMSFollowUpAction _setUserInfoProperty:forKey:](self, "_setUserInfoProperty:forKey:", a3, CFSTR("AMSPreferredClient"));
}

- (void)setRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v13)
  {
    objc_msgSend(v13, "HTTPMethod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v13, "HTTPBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:encoding:", v7, 4);

    objc_msgSend(v13, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("AMSRequestURL"));
    if (v8)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("AMSRequestBody"));
    if (v5)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("AMSRequestMethod"));

  }
  if (objc_msgSend(v4, "count"))
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  -[AMSFollowUpAction _setUserInfoProperty:forKey:](self, "_setUserInfoProperty:forKey:", v12, CFSTR("AMSRequest"));
}

- (void)setRequiresFollowUpUI:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUpAction _setUserInfoProperty:forKey:](self, "_setUserInfoProperty:forKey:", v4, CFSTR("AMSRequiresFollowUpUI"));

}

- (void)setShouldClear:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUpAction _setUserInfoProperty:forKey:](self, "_setUserInfoProperty:forKey:", v4, CFSTR("AMSShouldClear"));

}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AMSFollowUpAction_setUserInfo___block_invoke;
  block[3] = &unk_1E253E2B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __33__AMSFollowUpAction_setUserInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (id)generateAction
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)_MergedGlobals_109;
  v19 = _MergedGlobals_109;
  if (!_MergedGlobals_109)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getFLFollowUpActionClass_block_invoke;
    v15[3] = &unk_1E253DDB8;
    v15[4] = &v16;
    __getFLFollowUpActionClass_block_invoke((uint64_t)v15);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  -[AMSFollowUpAction label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUpAction url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithLabel:url:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSFollowUpAction identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v8);

  -[AMSFollowUpAction userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[AMSFollowUpAction metricsEvent](self, "metricsEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AMSFollowUpAction metricsEvent](self, "metricsEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "underlyingDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("AMSMetrics"));

  }
  objc_msgSend(v7, "setUserInfo:", v10);

  return v7;
}

- (id)performActionsWithBag:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSMutableBinaryPromise *v8;
  NSObject *v9;
  AMSMutableBinaryPromise *v10;
  id v11;
  id v12;
  AMSMutableBinaryPromise *v13;
  AMSMutableBinaryPromise *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  AMSMutableBinaryPromise *v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutableBinaryPromise);
  -[AMSFollowUpAction actionQueue](self, "actionQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__AMSFollowUpAction_performActionsWithBag_account___block_invoke;
  v16[3] = &unk_1E2541468;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

void __51__AMSFollowUpAction_performActionsWithBag_account___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  AMSURLRequestEncoder *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AMSFollowUp *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
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
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v6;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing request", buf, 0x16u);

    }
    v10 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", *(_QWORD *)(a1 + 40));
    -[AMSURLRequestEncoder setAccount:](v10, "setAccount:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setLogUUID:](v10, "setLogUUID:", v11);

    objc_msgSend(*(id *)(a1 + 32), "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](v10, "requestByEncodingRequest:parameters:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v13, "resultWithError:", &v38);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v38;

    if (!v15)
    {
      +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dataTaskPromiseWithRequest:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v18 = (id)objc_msgSend(v17, "resultWithError:", &v37);
      v15 = v37;

    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "url");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = objc_msgSend(*(id *)(a1 + 32), "requiresFollowUpUI");

    if ((v21 & 1) == 0)
    {
      +[AMSLogConfig sharedFollowUpConfig](AMSLogConfig, "sharedFollowUpConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v22, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_opt_class();
        v25 = *(void **)(a1 + 32);
        v26 = v24;
        objc_msgSend(v25, "logKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "url");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v24;
        v41 = 2114;
        v42 = v27;
        v43 = 2112;
        v44 = v28;
        _os_log_impl(&dword_18C849000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening url: %@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "url");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSOpenURL openStandardURL:](AMSOpenURL, "openStandardURL:", v29);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldClear"))
  {
    objc_msgSend(*(id *)(a1 + 32), "backingIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_alloc_init(AMSFollowUp);
      objc_msgSend(*(id *)(a1 + 32), "backingIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[AMSFollowUp clearFollowUpWithBackingIdentifier:](v31, "clearFollowUpWithBackingIdentifier:", v32);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "parentIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_23;
      v31 = objc_alloc_init(AMSFollowUp);
      objc_msgSend(*(id *)(a1 + 32), "parentIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[AMSFollowUp clearFollowUpWithIdentifier:account:](v31, "clearFollowUpWithIdentifier:account:", v32, *(_QWORD *)(a1 + 48));
    }

  }
LABEL_23:
  v36 = *(void **)(a1 + 56);
  if (v15)
    objc_msgSend(v36, "finishWithError:", v15);
  else
    objc_msgSend(v36, "finishWithSuccess");

}

- (id)postMetricsWithBag:(id)a3
{
  id v4;
  AMSMutablePromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  AMSMutablePromise *v14;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  -[AMSFollowUpAction metricsEvent](self, "metricsEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSFollowUpAction metricsEvent](self, "metricsEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "underlyingDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFollowUpMetricsEvent eventFromMetricsDictionary:](AMSFollowUpMetricsEvent, "eventFromMetricsDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enqueueEvent:", v9);
    objc_msgSend(v10, "flush");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__AMSFollowUpAction_postMetricsWithBag___block_invoke;
    v13[3] = &unk_1E253DF98;
    v14 = v5;
    objc_msgSend(v11, "addFinishBlock:", v13);

  }
  else
  {
    -[AMSMutablePromise finishWithResult:](v5, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }

  return v5;
}

uint64_t __40__AMSFollowUpAction_postMetricsWithBag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (a2)
    v4 = MEMORY[0x1E0C9AAB0];
  else
    v4 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v4, a3);
}

- (void)_setUserInfoProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[AMSFollowUpAction internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AMSFollowUpAction__setUserInfoProperty_forKey___block_invoke;
  v11[3] = &unk_1E25400F0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__AMSFollowUpAction__setUserInfoProperty_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = (void *)WeakRetained[1];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (AMSFollowUpAction)initWithLabel:(id)a3
{
  return -[AMSFollowUpAction initWithLabel:parentIdentifier:](self, "initWithLabel:parentIdentifier:", a3, 0);
}

- (AMSFollowUpAction)initWithAction:(id)a3
{
  return -[AMSFollowUpAction initWithAction:parentIdentifier:](self, "initWithAction:parentIdentifier:", a3, 0);
}

- (id)performActionsWithContract:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSContractBagShim *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v7);

  +[AMSNilBagValueFilteringProxy proxyWithBag:](AMSNilBagValueFilteringProxy, "proxyWithBag:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFollowUpAction performActionsWithBag:account:](self, "performActionsWithBag:account:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)postMetricsWithBagContract:(id)a3
{
  id v4;
  AMSPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AMSContractBagShim *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  AMSPromise *v16;

  v4 = a3;
  v5 = objc_alloc_init(AMSPromise);
  -[AMSFollowUpAction metricsEvent](self, "metricsEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSFollowUpAction metricsEvent](self, "metricsEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "underlyingDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSFollowUpMetricsEvent eventFromMetricsDictionary:](AMSFollowUpMetricsEvent, "eventFromMetricsDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v4);
    +[AMSNilBagValueFilteringProxy proxyWithBag:](AMSNilBagValueFilteringProxy, "proxyWithBag:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "enqueueEvent:", v9);
    objc_msgSend(v12, "flush");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__AMSFollowUpAction_postMetricsWithBagContract___block_invoke;
    v15[3] = &unk_1E253DF98;
    v16 = v5;
    objc_msgSend(v13, "addFinishBlock:", v15);

  }
  else
  {
    -[AMSPromise finishWithResult:](v5, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }

  return v5;
}

uint64_t __48__AMSFollowUpAction_postMetricsWithBagContract___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (a2)
    v4 = MEMORY[0x1E0C9AAB0];
  else
    v4 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", v4, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)backingIdentifier
{
  return self->_backingIdentifier;
}

- (void)setBackingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_backingIdentifier, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (OS_dispatch_queue)actionQueue
{
  return self->_actionQueue;
}

- (void)setActionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_actionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_backingIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
