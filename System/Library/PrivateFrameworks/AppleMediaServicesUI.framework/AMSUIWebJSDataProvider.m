@implementation AMSUIWebJSDataProvider

- (AMSUIWebJSAppQueryManager)appQueryManager
{
  AMSUIWebJSDataProvider *v2;
  AMSUIWebJSAppQueryManager *appQueryManager;
  AMSUIWebJSAppQueryManager *v4;
  AMSUIWebJSAppQueryManager *v5;
  AMSUIWebJSAppQueryManager *v6;

  v2 = self;
  objc_sync_enter(v2);
  appQueryManager = v2->_appQueryManager;
  if (!appQueryManager)
  {
    v4 = -[AMSUIWebJSAppQueryManager initWithDelegate:]([AMSUIWebJSAppQueryManager alloc], "initWithDelegate:", v2);
    v5 = v2->_appQueryManager;
    v2->_appQueryManager = v4;

    appQueryManager = v2->_appQueryManager;
  }
  v6 = appQueryManager;
  objc_sync_exit(v2);

  return v6;
}

- (AMSUIWebJSTelephonyProtocol)telephony
{
  AMSUIWebJSDataProvider *v2;
  AMSUIWebJSTelephony *telephony;
  AMSUIWebJSTelephony *v4;
  AMSUIWebJSTelephony *v5;
  AMSUIWebJSTelephony *v6;

  v2 = self;
  objc_sync_enter(v2);
  telephony = v2->_telephony;
  if (!telephony)
  {
    v4 = -[AMSUIWebJSTelephony initWithDelegate:]([AMSUIWebJSTelephony alloc], "initWithDelegate:", v2);
    v5 = v2->_telephony;
    v2->_telephony = v4;

    telephony = v2->_telephony;
  }
  v6 = telephony;
  objc_sync_exit(v2);

  return (AMSUIWebJSTelephonyProtocol *)v6;
}

- (AMSUIWebJSDataProvider)initWithContext:(id)a3
{
  id v4;
  AMSUIWebJSDataProvider *v5;
  AMSUIWebJSProperties *v6;
  AMSUIWebJSProperties *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebJSDataProvider;
  v5 = -[AMSUIWebJSDataProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[AMSUIWebJSProperties initWithContext:delegate:]([AMSUIWebJSProperties alloc], "initWithContext:delegate:", v4, v5);
    properties = v5->_properties;
    v5->_properties = v6;

    objc_storeWeak((id *)&v5->_context, v4);
    -[AMSUIWebJSDataProvider _observeNotifications](v5, "_observeNotifications");
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AMSUIWebJSTelephony invalidate](self->_telephony, "invalidate");
  -[AMSUIWebJSAppQueryManager invalidate](self->_appQueryManager, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebJSDataProvider;
  -[AMSUIWebJSDataProvider dealloc](&v3, sel_dealloc);
}

- (id)createWebView
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  AMSUIWebView *v18;
  void *v19;
  void *v20;
  AMSUIWebView *v21;
  id v22;
  __CFString *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebJSDataProvider webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIWebJSDataProvider webView](self, "webView");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIWebJSDataProvider properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generateProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "resultWithTimeout:error:", &v22, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
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
        objc_msgSend(v8, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v11;
        v26 = 2114;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error while generating properties for web view: %@", buf, 0x20u);

      }
    }
    -[AMSUIWebJSDataProvider _syncPropertiesScriptWithProperties:](self, "_syncPropertiesScriptWithProperties:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = &stru_24CB5A078;
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    v18 = [AMSUIWebView alloc];
    -[AMSUIWebJSDataProvider context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[AMSUIWebView initWithContext:additionalScripts:](v18, "initWithContext:additionalScripts:", v19, v20);
    -[AMSUIWebJSDataProvider setWebView:](self, "setWebView:", v21);

    return v21;
  }
}

- (id)loadPageModelWithInfo:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  AMSUIWebJSRequest *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[AMSUIWebJSDataProvider _canInteractWithJS](self, "_canInteractWithJS");
  v6 = (void *)MEMORY[0x24BE08340];
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE08340]);
    -[AMSUIWebJSDataProvider context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUIWebSetSubLogKey(v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = objc_opt_class();
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading page model", buf, 0x16u);
    }

    v13 = -[AMSUIWebJSRequest initWithServiceName:logKey:]([AMSUIWebJSRequest alloc], "initWithServiceName:logKey:", CFSTR("PageData"), v10);
    -[AMSUIWebJSRequest setOptions:](v13, "setOptions:", v4);
    -[AMSUIWebJSDataProvider runJSRequest:](self, "runJSRequest:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __48__AMSUIWebJSDataProvider_loadPageModelWithInfo___block_invoke;
    v18[3] = &unk_24CB516B0;
    objc_copyWeak(&v20, (id *)buf);
    v15 = v7;
    v19 = v15;
    objc_msgSend(v14, "addFinishBlock:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    AMSError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "promiseWithError:", v16);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __48__AMSUIWebJSDataProvider_loadPageModelWithInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(v5, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIWebModel pageModelFromJSObject:context:](AMSUIWebModel, "pageModelFromJSObject:context:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10)
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_opt_class();
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v14;
        v23 = 2114;
        v24 = v15;
        v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loaded page: %{public}@", (uint8_t *)&v21, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v10);
    }
    else
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v17;
        v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load page model", (uint8_t *)&v21, 0x16u);

      }
      v19 = *(void **)(a1 + 32);
      AMSError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "finishWithError:", v20);

    }
  }

}

- (id)loadPageRenderData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  AMSUIWebJSRequest *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIWebJSDataProvider context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AMSUIWebJSRequest initWithServiceName:logKey:]([AMSUIWebJSRequest alloc], "initWithServiceName:logKey:", CFSTR("PageRender"), v6);
  -[AMSUIWebJSDataProvider runJSRequest:](self, "runJSRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__AMSUIWebJSDataProvider_loadPageRenderData__block_invoke;
  v11[3] = &unk_24CB516D8;
  v11[4] = self;
  objc_msgSend(v8, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__AMSUIWebJSDataProvider_loadPageRenderData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
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
      v14 = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loaded page render data from JS", (uint8_t *)&v14, 0x16u);

    }
    v8 = (void *)MEMORY[0x24BE08340];
    objc_msgSend(v2, "body");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "promiseWithResult:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "promiseWithError:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  return v12;
}

- (id)postEvent:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  AMSUIWebJSRequest *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[2];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[AMSUIWebJSDataProvider _canInteractWithJS](self, "_canInteractWithJS"))
  {
    -[AMSUIWebJSDataProvider context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUIWebSetSubLogKey(v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      objc_msgSend(v7, "ams_JSONStringWithError:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v13;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v6;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting event: %{public}@ options: %@", buf, 0x2Au);

    }
    v15 = -[AMSUIWebJSRequest initWithServiceName:logKey:]([AMSUIWebJSRequest alloc], "initWithServiceName:logKey:", CFSTR("_PostEvent"), v10);
    v22 = CFSTR("name");
    v23 = CFSTR("options");
    v16 = (id)MEMORY[0x24BDBD1B8];
    if (v7)
      v16 = v7;
    v24[0] = v6;
    v24[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebJSRequest setOptions:](v15, "setOptions:", v17, v22, v23);

    -[AMSUIWebJSDataProvider runJSRequest:](self, "runJSRequest:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "binaryPromiseAdapter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x24BE08078];
    AMSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "promiseWithError:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)runJSRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[AMSUIWebJSDataProvider webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIWebJSDataProvider webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendJSRequest:", v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "promiseWithError:", v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)runSafariCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  AMSUIWebJSRequest *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIWebJSDataProvider context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running safari callback", (uint8_t *)&v16, 0x16u);

  }
  v12 = -[AMSUIWebJSRequest initWithServiceName:logKey:]([AMSUIWebJSRequest alloc], "initWithServiceName:logKey:", CFSTR("SafariCallback"), v7);
  -[AMSUIWebJSRequest setOptions:](v12, "setOptions:", v4);

  -[AMSUIWebJSDataProvider runJSRequest:](self, "runJSRequest:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thenWithBlock:", &__block_literal_global_27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __44__AMSUIWebJSDataProvider_runSafariCallback___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(a2, "body");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = v3;
  else
    v5 = MEMORY[0x24BDBD1B8];
  objc_msgSend(v2, "promiseWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)startOTPListener
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebJSDataProvider stopOTPListener](self, "stopOTPListener");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebJSDataProvider setOtpIdentifier:](self, "setOtpIdentifier:", v4);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebJSDataProvider otpIdentifier](self, "otpIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting OTP listener with ID: %{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v12, (id *)buf);
  -[AMSUIWebJSDataProvider otpIdentifier](self, "otpIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier();

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __42__AMSUIWebJSDataProvider_startOTPListener__block_invoke(uint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  id WeakRetained;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16[0] = CFSTR("token");
  v16[1] = CFSTR("source");
  v10 = &stru_24CB5A078;
  if (a5)
    v11 = a5;
  else
    v11 = &stru_24CB5A078;
  if (a2)
    v12 = a2;
  else
    v12 = &stru_24CB5A078;
  v17[0] = v11;
  v17[1] = v12;
  if (a3)
    v13 = a3;
  else
    v13 = &stru_24CB5A078;
  v16[2] = CFSTR("serviceID");
  v16[3] = CFSTR("body");
  if (a4)
    v10 = a4;
  v17[2] = v13;
  v17[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(WeakRetained, "postEvent:options:", CFSTR("OTPReceived"), v14);

}

- (BOOL)stopOTPListener
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebJSDataProvider otpIdentifier](self, "otpIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
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
      -[AMSUIWebJSDataProvider otpIdentifier](self, "otpIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Stopping OTP listener with ID: %{public}@", (uint8_t *)&v11, 0x20u);

    }
    -[AMSUIWebJSDataProvider otpIdentifier](self, "otpIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier();

    -[AMSUIWebJSDataProvider setOtpIdentifier:](self, "setOtpIdentifier:", 0);
  }
  return 1;
}

- (id)syncProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebJSDataProvider context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUIWebSetSubLogKey(v4, 0);
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v21 = objc_opt_class();
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Syncing properties", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[AMSUIWebJSDataProvider properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __40__AMSUIWebJSDataProvider_syncProperties__block_invoke;
  v17 = &unk_24CB517B8;
  objc_copyWeak(&v19, (id *)buf);
  v10 = v5;
  v18 = v10;
  objc_msgSend(v9, "thenWithBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "binaryPromiseAdapter", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v12;
}

id __40__AMSUIWebJSDataProvider_syncProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(WeakRetained, "_syncPropertiesScriptWithProperties:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(WeakRetained, "webView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateUserScriptsWithScripts:", v7);

      if ((objc_msgSend(WeakRetained, "_canInteractWithJS") & 1) != 0)
      {
        v8 = objc_alloc_init(MEMORY[0x24BE08340]);
        objc_initWeak(&location, WeakRetained);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_2;
        v17[3] = &unk_24CB51790;
        v17[4] = WeakRetained;
        v18 = v5;
        objc_copyWeak(&v21, &location);
        v19 = *(id *)(a1 + 32);
        v9 = v8;
        v20 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], v17);
        v10 = v20;
        v11 = v9;

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "promiseWithError:", v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "promiseWithError:", v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "underlyingWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_3;
  v5[3] = &unk_24CB51768;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "evaluateJavaScript:completionHandler:", v4, v5);

  objc_destroyWeak(&v8);
}

void __40__AMSUIWebJSDataProvider_syncProperties__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543874;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sync properties. %{public}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x24BDBD1C8]);
  }

}

- (void)_subscriptionStatusChangeMusic:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 2);
}

- (void)_subscriptionStatusChangeActivity:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 0);
}

- (void)_subscriptionStatusChangeAppStore:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 1);
}

- (void)_subscriptionStatusChangeNews:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 3);
}

- (void)_subscriptionStatusChangeTV:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 4);
}

- (void)_subscriptionStatusChangeiCloud:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 5);
}

- (void)_subscriptionStatusChangeHWBundle:(id)a3
{
  -[AMSUIWebJSDataProvider _postSubscriptionChangedWithType:](self, "_postSubscriptionChangedWithType:", 7);
}

- (void)appQueryManager:(id)a3 didReceiveApps:(id)a4
{
  -[AMSUIWebJSDataProvider _postMediaQueryResultsChangeEventWithApps:](self, "_postMediaQueryResultsChangeEventWithApps:", a4);
}

- (void)propertiesDidChange:(id)a3
{
  id v3;

  v3 = -[AMSUIWebJSDataProvider syncProperties](self, "syncProperties", a3);
}

- (BOOL)_canInteractWithJS
{
  void *v2;
  char v3;

  -[AMSUIWebJSDataProvider webView](self, "webView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentLoaded");

  return v3;
}

- (void)_observeNotifications
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  void *v26;
  id *v27;
  void *v28;
  id v29;
  void *v30;
  id *v31;
  void *v32;
  id v33;
  void *v34;
  id *v35;
  void *v36;
  id v37;
  void *v38;
  id *v39;
  void *v40;
  id v41;
  void *v42;
  id *v43;
  id v44;
  void *v45;
  _QWORD block[5];
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;

  v57 = 0;
  v58 = &v57;
  v59 = 0x2050000000;
  v3 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  v60 = getASDSubscriptionEntitlementsClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    v52 = MEMORY[0x24BDAC760];
    v53 = 3221225472;
    v54 = (uint64_t)__getASDSubscriptionEntitlementsClass_block_invoke;
    v55 = &unk_24CB4F3E8;
    v56 = &v57;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)&v52);
    v3 = (void *)v58[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v57, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEBE010];
  v49[0] = v4;
  v49[1] = 3221225472;
  v49[2] = __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke;
  v49[3] = &unk_24CB517E0;
  objc_copyWeak(&v50, &location);
  v9 = (id)objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, 0, 0, v49);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBDF88];
  v47[0] = v4;
  v47[1] = 3221225472;
  v47[2] = __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_2;
  v47[3] = &unk_24CB517E0;
  objc_copyWeak(&v48, &location);
  v12 = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v47);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__safariDataUpdate_, CFSTR("SSScriptSafariViewControllerDataUpdateNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v15 = (id *)getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr)
  {
    v16 = (void *)AppStoreDaemonLibrary_0();
    v15 = (id *)dlsym(v16, "ASDSubscriptionEntitlementsActivityDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v15;
    getASDSubscriptionEntitlementsActivityDidChangeNotificationSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v52, 8);
  if (!v15)
    goto LABEL_29;
  v17 = *v15;
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeActivity_, v17, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v19 = (id *)getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr)
  {
    v20 = (void *)AppStoreDaemonLibrary_0();
    v19 = (id *)dlsym(v20, "ASDSubscriptionEntitlementsAppStoreDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v19;
    getASDSubscriptionEntitlementsAppStoreDidChangeNotificationSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v52, 8);
  if (!v19)
    goto LABEL_29;
  v21 = *v19;
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeAppStore_, v21, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v23 = (id *)getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr)
  {
    v24 = (void *)AppStoreDaemonLibrary_0();
    v23 = (id *)dlsym(v24, "ASDSubscriptionEntitlementsNewsDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v23;
    getASDSubscriptionEntitlementsNewsDidChangeNotificationSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v52, 8);
  if (!v23)
    goto LABEL_29;
  v25 = *v23;
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeNews_, v25, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v27 = (id *)getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr)
  {
    v28 = (void *)AppStoreDaemonLibrary_0();
    v27 = (id *)dlsym(v28, "ASDSubscriptionEntitlementsMusicDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v27;
    getASDSubscriptionEntitlementsMusicDidChangeNotificationSymbolLoc_ptr = (uint64_t)v27;
  }
  _Block_object_dispose(&v52, 8);
  if (!v27)
    goto LABEL_29;
  v29 = *v27;
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeMusic_, v29, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v31 = (id *)getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr)
  {
    v32 = (void *)AppStoreDaemonLibrary_0();
    v31 = (id *)dlsym(v32, "ASDSubscriptionEntitlementsTVDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v31;
    getASDSubscriptionEntitlementsTVDidChangeNotificationSymbolLoc_ptr = (uint64_t)v31;
  }
  _Block_object_dispose(&v52, 8);
  if (!v31)
    goto LABEL_29;
  v33 = *v31;
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeTV_, v33, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v35 = (id *)getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr)
  {
    v36 = (void *)AppStoreDaemonLibrary_0();
    v35 = (id *)dlsym(v36, "ASDSubscriptionEntitlementsiCloudDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v35;
    getASDSubscriptionEntitlementsiCloudDidChangeNotificationSymbolLoc_ptr = (uint64_t)v35;
  }
  _Block_object_dispose(&v52, 8);
  if (!v35)
    goto LABEL_29;
  v37 = *v35;
  objc_msgSend(v34, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeiCloud_, v37, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = (uint64_t)&v52;
  v54 = 0x2020000000;
  v39 = (id *)getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr;
  v55 = (void *)getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr;
  if (!getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr)
  {
    v40 = (void *)AppStoreDaemonLibrary_0();
    v39 = (id *)dlsym(v40, "ASDSubscriptionEntitlementsHWBundleDidChangeNotification");
    *(_QWORD *)(v53 + 24) = v39;
    getASDSubscriptionEntitlementsHWBundleDidChangeNotificationSymbolLoc_ptr = (uint64_t)v39;
  }
  _Block_object_dispose(&v52, 8);
  if (!v39)
    goto LABEL_29;
  v41 = *v39;
  objc_msgSend(v38, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeHWBundle_, v41, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v43 = (id *)getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_ptr;
  v60 = getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_ptr;
  if (!getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_ptr)
  {
    v52 = v4;
    v53 = 3221225472;
    v54 = (uint64_t)__getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_block_invoke;
    v55 = &unk_24CB4F3E8;
    v56 = &v57;
    __getICMusicSubscriptionStatusDidChangeNotificationSymbolLoc_block_invoke((uint64_t)&v52);
    v43 = (id *)v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v43)
  {
LABEL_29:
    dlerror();
    abort_report_np();
    __break(1u);
    goto LABEL_30;
  }
  v44 = *v43;
  objc_msgSend(v42, "addObserver:selector:name:object:", self, sel__subscriptionStatusChangeMusic_, v44, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", self, sel__purchaseDidSucceed_, CFSTR("AMSPurchaseFinishedNotification"), 0);

  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_3;
  block[3] = &unk_24CB4F0E8;
  block[4] = self;
  if (_observeNotifications_onceToken != -1)
LABEL_30:
    dispatch_once(&_observeNotifications_onceToken, block);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

}

void __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "postEvent:options:", CFSTR("DidDisappear"), &unk_24CB8C7A8);

}

void __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_2(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "postEvent:options:", CFSTR("DidAppear"), &unk_24CB8C7D0);

}

void __47__AMSUIWebJSDataProvider__observeNotifications__block_invoke_3(uint64_t a1)
{
  __CFNotificationCenter *DistributedCenter;
  __CFNotificationCenter *v3;

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, 0, (CFNotificationCallback)_purchaseDidSucceed, CFSTR("kSSPurchaseRequestFinishedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(v3, *(const void **)(a1 + 32), (CFNotificationCallback)_handleDataUpdateNotification, CFSTR("AMSUIWebSafariDataUpdateDarwin"), 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_postMediaQueryResultsChangeEventWithApps:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("apps");
  v9[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AMSUIWebJSDataProvider postEvent:options:](self, "postEvent:options:", CFSTR("MediaQueryResultsChange"), v6);
}

- (void)_postSubscriptionChangedWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("mediaType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSUIWebJSDataProvider postEvent:options:](self, "postEvent:options:", CFSTR("SubscriptionChanged"), v5);

}

- (void)_postTelephonyDidChangeEvent
{
  id v2;

  v2 = -[AMSUIWebJSDataProvider postEvent:options:](self, "postEvent:options:", CFSTR("TelephonyChange"), MEMORY[0x24BDBD1B8]);
}

- (void)_purchaseDidSucceed:(id)a3
{
  id v3;

  v3 = -[AMSUIWebJSDataProvider postEvent:options:](self, "postEvent:options:", CFSTR("BuyConfirmed"), MEMORY[0x24BDBD1B8]);
}

- (void)_safariDataUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received ScriptDataUpdate notification", (uint8_t *)&v15, 0x16u);

    }
    +[AMSUIWebOpenSafariAction resultFromURL:error:](AMSUIWebOpenSafariAction, "resultFromURL:error:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AMSUIWebJSDataProvider postEvent:options:](self, "postEvent:options:", CFSTR("SafariDataUpdate"), v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari data update called without a URL", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (id)_syncPropertiesScriptWithProperties:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AMS.updateProperties('%@')"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (AMSUIWebView)webView
{
  return (AMSUIWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (AMSUIWebJSProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSString)otpIdentifier
{
  return self->_otpIdentifier;
}

- (void)setOtpIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_otpIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otpIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_telephony, 0);
  objc_storeStrong((id *)&self->_appQueryManager, 0);
}

@end
