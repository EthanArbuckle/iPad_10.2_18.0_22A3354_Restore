@implementation AMSUIWebBuyAction

- (AMSUIWebBuyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebBuyAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *buyParams;
  void *v14;
  NSString *v15;
  NSString *contentType;
  void *v17;
  char v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *metricsOverlay;
  void *v22;
  NSDictionary *v23;
  NSDictionary *performanceMetricsOverlay;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  ACAccount *account;
  void *v31;
  void *v32;
  uint64_t v33;
  ACAccount *v34;
  objc_super v36;

  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)AMSUIWebBuyAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v36, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7->_type = objc_msgSend(v8, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("legacyBuy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("legacyBuy"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_legacyBuy = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      v7->_legacyBuy = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buyParameters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    buyParams = v7->_buyParams;
    v7->_buyParams = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    contentType = v7->_contentType;
    v7->_contentType = v15;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requiresAccount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = objc_msgSend(v17, "BOOLValue");
    else
      v18 = 1;
    v7->_requiresAccount = v18;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("metricsOverlay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    metricsOverlay = v7->_metricsOverlay;
    v7->_metricsOverlay = v20;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("performanceMetricsOverlay"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    performanceMetricsOverlay = v7->_performanceMetricsOverlay;
    v7->_performanceMetricsOverlay = v23;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("makeCurrentAccount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("makeCurrentAccount"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_makeCurrentAccount = objc_msgSend(v26, "BOOLValue");

    }
    else
    {
      v7->_makeCurrentAccount = 0;
    }

    -[AMSUIWebAction context](v7, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "iTunesAccountFromJSAccount:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    account = v7->_account;
    v7->_account = (ACAccount *)v29;

    if (!v7->_account)
    {
      -[AMSUIWebAction context](v7, "context");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "iTunesAccountFromJSDSID:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v7->_account;
      v7->_account = (ACAccount *)v33;

    }
  }

  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
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
  v17.super_class = (Class)AMSUIWebBuyAction;
  v3 = -[AMSUIWebAction runAction](&v17, sel_runAction);
  -[AMSUIWebBuyAction buyParams](self, "buyParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
    -[AMSUIWebBuyAction account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running purchase with account: %{public}@ buyParameters: %@", buf, 0x2Au);

  }
  if (v4)
  {
    if (!-[AMSUIWebBuyAction legacyBuy](self, "legacyBuy")
      || (-[AMSUIWebBuyAction _runLegacyBuy](self, "_runLegacyBuy"),
          (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[AMSUIWebBuyAction contentType](self, "contentType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[AMSUIWebBuyAction _runBuyWithContentType:](self, "_runBuyWithContentType:", v12);
      else
        -[AMSUIWebBuyAction _runBuy](self, "_runBuy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __30__AMSUIWebBuyAction_runAction__block_invoke;
    v16[3] = &unk_24CB4FA50;
    v16[4] = self;
    objc_msgSend(v11, "addFinishBlock:", v16);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "promiseWithError:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __30__AMSUIWebBuyAction_runAction__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished purchase", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "signatureResumption");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalHeaders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE07DD8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE07DB0]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE07DB8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE07DC8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE07DC0]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE07DD0]);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdditionalHeaders:", v10);

  }
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v7 = a5;
  v8 = a4;
  -[AMSUIWebAction context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action:pauseTimeouts:handleAuthenticateRequest:", self, 1, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addFinishBlock:", v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__AMSUIWebBuyAction_purchase_handleAuthenticateRequest_completion___block_invoke;
  v12[3] = &unk_24CB50C08;
  v12[4] = self;
  objc_msgSend(v11, "addSuccessBlock:", v12);

}

void __67__AMSUIWebBuyAction_purchase_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_makeCurrentAccountIfNeeded:", v3);

}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  -[AMSUIWebAction context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action:pauseTimeouts:handleDialogRequest:", self, 1, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addFinishBlock:", v7);
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AMSUIWebBuyAction *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__AMSUIWebBuyAction_purchase_handleEngagementRequest_completion___block_invoke;
  block[3] = &unk_24CB50C30;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__AMSUIWebBuyAction_purchase_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  AMSUIEngagementTask *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AMSUIEngagementTask *v10;

  v2 = [AMSUIEngagementTask alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIEngagementTask initWithRequest:bag:presentingViewController:](v2, "initWithRequest:bag:presentingViewController:", v3, v5, v8);

  -[AMSUIEngagementTask presentEngagement](v10, "presentEngagement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", *(_QWORD *)(a1 + 48));

}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AMSUIWebAction context](self, "context", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 && !v10)
  {
    AMSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;

  -[AMSUIWebAction presentingSceneIdentifier](self, "presentingSceneIdentifier", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a5 && !v6)
  {
    AMSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)purchase:(id)a3 handleSceneBundleIdentifierRequest:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, _QWORD))a5;
  -[AMSUIWebAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "proxyAppBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = objc_opt_class();
    v29 = a2;
    if (v13)
      goto LABEL_12;
    goto LABEL_13;
  }
  -[AMSUIWebAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    AMSLogKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = objc_opt_class();
    v29 = a2;
    if (v13)
    {
LABEL_12:
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v15, v17, v28);
LABEL_14:
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      v32 = 2114;
      v33 = v8;
      v34 = 2114;
      v35 = v19;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Found scene identifier %{public}@ in %{public}@", buf, 0x20u);
      if (v13)
      {

        v18 = (void *)v28;
      }

      a2 = v29;
      goto LABEL_17;
    }
LABEL_13:
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@ "), v15, v17);
    goto LABEL_14;
  }
LABEL_17:

LABEL_18:
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v20, "OSLogObject");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = objc_opt_class();
    if (v22)
    {
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] %@ "), v24, v25, v8);
    }
    else
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: %@ "), v24, v25);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v26;
    v32 = 2114;
    v33 = v27;
    _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Using bundle identifier: %{public}@", buf, 0x16u);
    if (v22)
    {

      v26 = v8;
    }

  }
  v7[2](v7, v10, 0);

}

- (id)_iTunesAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[AMSUIWebBuyAction account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "ams_isiTunesAccount") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x24BDB4398];
    -[AMSUIWebAction context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountMediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_sharedAccountStoreForMediaType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "ams_iTunesAccountForAccount:", v3);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v3;
    v12 = v11;

    v3 = v12;
  }
  return v3;
}

- (void)_makeCurrentAccountIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[AMSUIWebBuyAction makeCurrentAccount](self, "makeCurrentAccount")
    || (-[AMSUIWebAction context](self, "context"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "account"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v10, "web_matchAccount:", v5),
        v5,
        v4,
        v6))
  {
    -[AMSUIWebAction context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceCurrentAccount:clientInfo:", v10, v9);

  }
}

- (id)purchaseContentWithType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
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
  void *v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  Class (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE08340]);
  if (objc_msgSend(v4, "isEqualToString:", AMSUIWebPluginPurchaseContentTypeApp))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v6 = (void *)getASDPurchaseClass_softClass;
    v33 = getASDPurchaseClass_softClass;
    v7 = MEMORY[0x24BDAC760];
    if (!getASDPurchaseClass_softClass)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __getASDPurchaseClass_block_invoke;
      v28 = &unk_24CB4F3E8;
      v29 = &v30;
      __getASDPurchaseClass_block_invoke((uint64_t)&v25);
      v6 = (void *)v31[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v30, 8);
    v9 = objc_alloc_init(v8);
    v10 = objc_alloc(MEMORY[0x24BE08098]);
    -[AMSUIWebBuyAction buyParams](self, "buyParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

    -[AMSUIWebBuyAction account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_DSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccountIdentifier:", v14);

    objc_msgSend(v12, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBuyParameters:", v15);

    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v12, "parameterForKey:", *MEMORY[0x24BE07CE8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "longLongValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItemID:", v18);

    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v19 = (void *)getASDPurchaseManagerClass_softClass;
    v33 = getASDPurchaseManagerClass_softClass;
    if (!getASDPurchaseManagerClass_softClass)
    {
      v25 = v7;
      v26 = 3221225472;
      v27 = __getASDPurchaseManagerClass_block_invoke;
      v28 = &unk_24CB4F3E8;
      v29 = &v30;
      __getASDPurchaseManagerClass_block_invoke((uint64_t)&v25);
      v19 = (void *)v31[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v20, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __45__AMSUIWebBuyAction_purchaseContentWithType___block_invoke;
    v23[3] = &unk_24CB50C58;
    v24 = v5;
    objc_msgSend(v21, "processPurchase:withResponseHandler:", v9, v23);

  }
  else
  {
    AMSError();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v9);
  }

  return v5;
}

void __45__AMSUIWebBuyAction_purchaseContentWithType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7 = v8;
  }
  else
  {
    objc_msgSend(v6, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if ((objc_msgSend(v6, "success") & 1) != 0 || (AMSError(), (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &unk_24CB8C730);
        goto LABEL_5;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);

LABEL_5:
}

- (id)_purchasePluginIdentifierForContentType:(id)a3
{
  return 0;
}

- (id)_runBuy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  AMSUIPurchaseTask *v35;
  void *v36;
  void *v37;
  AMSUIPurchaseTask *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *, void *);
  void *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE08098]);
  -[AMSUIWebBuyAction buyParams](self, "buyParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

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
    *(_DWORD *)buf = 138543618;
    v50 = v8;
    v51 = 2114;
    v52 = v9;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting buy", buf, 0x16u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08350]), "initWithPurchaseType:buyParams:", -[AMSUIWebBuyAction type](self, "type"), v5);
  -[AMSUIWebBuyAction _iTunesAccount](self, "_iTunesAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccount:", v11);

  objc_msgSend(v10, "setUserInitiated:", 1);
  -[AMSUIWebAction context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClientInfo:", v13);

  objc_msgSend(v10, "setRequiresAccount:", -[AMSUIWebBuyAction requiresAccount](self, "requiresAccount"));
  -[AMSUIWebAction context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "additionalHeaders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdditionalHeaders:", v15);

  AMSLogKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLogUUID:", v16);

  -[AMSUIWebBuyAction metricsOverlay](self, "metricsOverlay");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = v20;

  -[AMSUIWebAction context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "metricsOverlay");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AMSUIWebAction context](self, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "metricsOverlay");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addEntriesFromDictionary:", v25);

  }
  objc_msgSend(v10, "setMetricsOverlay:", v21);
  -[AMSUIWebBuyAction performanceMetricsOverlay](self, "performanceMetricsOverlay");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");
  v28 = v27;
  if (v27)
    v29 = v27;
  else
    v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = v29;

  -[AMSUIWebAction context](self, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "performanceMetricsOverlay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[AMSUIWebAction context](self, "context");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "performanceMetricsOverlay");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addEntriesFromDictionary:", v34);

  }
  objc_msgSend(v10, "setPerformanceMetricsOverlay:", v30);
  v35 = [AMSUIPurchaseTask alloc];
  -[AMSUIWebAction context](self, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bag");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[AMSPurchaseTask initWithPurchase:bag:](v35, "initWithPurchase:bag:", v10, v37);

  -[AMSPurchaseTask setDelegate:](v38, "setDelegate:", self);
  -[AMSPurchaseTask performPurchase](v38, "performPurchase");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v43 = MEMORY[0x24BDAC760];
  v44 = 3221225472;
  v45 = __28__AMSUIWebBuyAction__runBuy__block_invoke;
  v46 = &unk_24CB50C80;
  objc_copyWeak(&v48, (id *)buf);
  v40 = v10;
  v47 = v40;
  objc_msgSend(v39, "addFinishBlock:", &v43);
  objc_msgSend(v39, "thenWithBlock:", &__block_literal_global_18, v43, v44, v45, v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)buf);

  return v41;
}

void __28__AMSUIWebBuyAction__runBuy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = CFSTR("purchase");
  v15[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_errorByAddingUserInfo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionDidFinishPurchaseWithResult:error:", v7, v11);

}

id __28__AMSUIWebBuyAction__runBuy__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD16D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AMSPurchaseFinishedNotification"), 0);

  v12[0] = CFSTR("success");
  v12[1] = CFSTR("responseData");
  v13[0] = CFSTR("true");
  objc_msgSend(v3, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ams_sanitizeServerObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24CB5A078;
  if (v6)
    v8 = (const __CFString *)v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_runBuyWithContentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    *(_DWORD *)buf = 138543874;
    v28 = objc_opt_class();
    v29 = 2114;
    v30 = v5;
    v31 = 2114;
    v32 = v4;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Purchasing content with type: %{public}@", buf, 0x20u);
  }

  -[AMSUIWebBuyAction _purchasePluginIdentifierForContentType:](self, "_purchasePluginIdentifierForContentType:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v28 = v11;
      v29 = 2114;
      v30 = v5;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading plugin: %{public}@", buf, 0x20u);
    }

    -[AMSUIWebAction context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pluginLoader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pluginForBundleIdentifier:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AMSUIWebBuyAction buyParams](self, "buyParams");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "purchaseContentWithType:buyParams:", v4, v15);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v17 = (void *)v16;

        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x24BE08340];
    }
    else
    {
      v18 = (void *)MEMORY[0x24BE08340];
    }
    AMSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "promiseWithError:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[AMSUIWebBuyAction purchaseContentWithType:](self, "purchaseContentWithType:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v19 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke;
  v25[3] = &unk_24CB50CE8;
  v25[4] = self;
  v20 = v5;
  v26 = v20;
  objc_msgSend(v17, "addSuccessBlock:", v25);
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke_86;
  v23[3] = &unk_24CB4F828;
  v23[4] = self;
  v24 = v20;
  v21 = v20;
  objc_msgSend(v17, "addErrorBlock:", v23);

  return v17;
}

void __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Purchase finished", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("AMSPurchaseFinishedNotification"), 0);

}

void __44__AMSUIWebBuyAction__runBuyWithContentType___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Purchase failed: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

- (id)_runLegacyBuy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebAction presentingSceneIdentifierPromise](self, "presentingSceneIdentifierPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAction presentingSceneBundleIdentifierPromise](self, "presentingSceneBundleIdentifierPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE08340];
  v11[0] = v3;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promiseWithAll:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke;
  v10[3] = &unk_24CB50D60;
  v10[4] = self;
  objc_msgSend(v7, "thenWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  id v48;
  __int128 *p_buf;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x24BE08340]);
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
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_opt_class();
    v11 = v10;
    if (v8)
    {
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v2);
    }
    else
    {
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: "), v10);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Starting legacy buy", (uint8_t *)&buf, 0xCu);
    if (v8)
    {

      v12 = (void *)v2;
    }

  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v13 = (void *)getSSPurchaseClass_softClass;
  v54 = getSSPurchaseClass_softClass;
  v14 = MEMORY[0x24BDAC760];
  if (!getSSPurchaseClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v56 = (uint64_t)__getSSPurchaseClass_block_invoke;
    v57 = (uint64_t (*)(uint64_t, uint64_t))&unk_24CB4F3E8;
    v58 = (void (*)(uint64_t))&v51;
    __getSSPurchaseClass_block_invoke((uint64_t)&buf);
    v13 = (void *)v52[3];
  }
  v15 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v51, 8);
  v16 = objc_alloc_init(v15);
  objc_msgSend(*(id *)(a1 + 32), "buyParams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBuyParameters:", v17);

  objc_msgSend(*(id *)(a1 + 32), "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ams_DSID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccountIdentifier:", v19);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPresentingSceneIdentifier:", v21);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "value");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPresentingSceneBundleIdentifier:", v23);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "additionalHeaders");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTidHeaders:", v25);

  objc_msgSend(*(id *)(a1 + 32), "account");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = objc_msgSend(v26, "ams_isSandboxAccount");

  if ((_DWORD)v25)
  {
    objc_msgSend(v16, "requestProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      v51 = 0;
      v52 = &v51;
      v53 = 0x2050000000;
      v31 = (void *)getSSMutableURLRequestPropertiesClass_softClass;
      v54 = getSSMutableURLRequestPropertiesClass_softClass;
      if (!getSSMutableURLRequestPropertiesClass_softClass)
      {
        *(_QWORD *)&buf = v14;
        *((_QWORD *)&buf + 1) = 3221225472;
        v56 = (uint64_t)__getSSMutableURLRequestPropertiesClass_block_invoke;
        v57 = (uint64_t (*)(uint64_t, uint64_t))&unk_24CB4F3E8;
        v58 = (void (*)(uint64_t))&v51;
        __getSSMutableURLRequestPropertiesClass_block_invoke((uint64_t)&buf);
        v31 = (void *)v52[3];
      }
      v32 = objc_retainAutorelease(v31);
      _Block_object_dispose(&v51, 8);
      v30 = objc_alloc_init(v32);
    }
    v33 = v30;

    objc_msgSend(v33, "setURLBagType:", 1);
    objc_msgSend(v16, "setRequestProperties:", v33);

  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v34 = (void *)getSSPurchaseRequestClass_softClass;
  v54 = getSSPurchaseRequestClass_softClass;
  if (!getSSPurchaseRequestClass_softClass)
  {
    *(_QWORD *)&buf = v14;
    *((_QWORD *)&buf + 1) = 3221225472;
    v56 = (uint64_t)__getSSPurchaseRequestClass_block_invoke;
    v57 = (uint64_t (*)(uint64_t, uint64_t))&unk_24CB4F3E8;
    v58 = (void (*)(uint64_t))&v51;
    __getSSPurchaseRequestClass_block_invoke((uint64_t)&buf);
    v34 = (void *)v52[3];
  }
  v35 = objc_retainAutorelease(v34);
  _Block_object_dispose(&v51, 8);
  v36 = [v35 alloc];
  v60[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v36, "initWithPurchases:", v37);

  objc_msgSend(v38, "setBackgroundRequest:", 0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__4;
  v58 = __Block_byref_object_dispose__4;
  v59 = 0;
  AMSLogKey();
  v50[0] = v14;
  v50[1] = 3221225472;
  v50[2] = __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_93;
  v50[3] = &unk_24CB50D10;
  v50[4] = &buf;
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_2;
  v45[3] = &unk_24CB50D38;
  v39 = (id)objc_claimAutoreleasedReturnValue();
  p_buf = &buf;
  v40 = *(_QWORD *)(a1 + 32);
  v46 = v39;
  v47 = v40;
  v41 = v5;
  v48 = v41;
  objc_msgSend(v38, "startWithPurchaseResponseBlock:completionBlock:", v50, v45);
  v42 = v48;
  v43 = v41;

  _Block_object_dispose(&buf, 8);
  return v43;
}

void __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_93(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__AMSUIWebBuyAction__runLegacyBuy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id)AMSSetLogKey();
  if (v3
    || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "error"),
        (v3 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("SSErrorDomain")))
    {
      v6 = objc_msgSend(v3, "code");

      if (v6 != 134)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "OSLogObject");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = objc_opt_class();
          v10 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v42 = v9;
          v43 = 2114;
          v44 = v10;
          v45 = 2114;
          v46 = v3;
          _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy purchase failed: %{public}@", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
        goto LABEL_12;
      }
      AMSError();
      v5 = v3;
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_7;
  }
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
    v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Legacy buy finished successfully", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "URLResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bodyData");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v38 = 0;
    objc_msgSend(MEMORY[0x24BE080F8], "objectWithData:encoding:error:", v3, 0, &v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v38;
    v18 = v16;
    objc_opt_class();
    v19 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;

    if (!v19 || v17)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_opt_class();
        AMSLogKey();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v22;
        v43 = 2114;
        v44 = v23;
        v45 = 2114;
        v46 = v17;
        _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode server response. %{public}@", buf, 0x20u);

      }
    }

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "purchase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accountIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x24BDB4398];
    objc_msgSend(*(id *)(a1 + 40), "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "clientInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "accountMediaType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ams_sharedAccountStoreForMediaType:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "purchase");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "accountIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ams_iTunesAccountWithDSID:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_makeCurrentAccountIfNeeded:", v33);
  }
  v39[0] = CFSTR("success");
  v39[1] = CFSTR("responseData");
  v40[0] = CFSTR("true");
  objc_msgSend(v19, "ams_sanitizeServerObject");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  v36 = &stru_24CB5A078;
  if (v34)
    v36 = (const __CFString *)v34;
  v40[1] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v37);
LABEL_12:

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_buyParams, a3);
}

- (BOOL)legacyBuy
{
  return self->_legacyBuy;
}

- (void)setLegacyBuy:(BOOL)a3
{
  self->_legacyBuy = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (BOOL)makeCurrentAccount
{
  return self->_makeCurrentAccount;
}

- (void)setMakeCurrentAccount:(BOOL)a3
{
  self->_makeCurrentAccount = a3;
}

- (BOOL)requiresAccount
{
  return self->_requiresAccount;
}

- (void)setRequiresAccount:(BOOL)a3
{
  self->_requiresAccount = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_metricsOverlay, a3);
}

- (NSDictionary)performanceMetricsOverlay
{
  return self->_performanceMetricsOverlay;
}

- (void)setPerformanceMetricsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
