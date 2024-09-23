@implementation AMSUIWebAppOverlayAction

- (AMSUIWebAppOverlayAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebAppOverlayAction *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *appIdentifier;
  void *v13;
  NSString *v14;
  NSString *campaignToken;
  void *v16;
  NSString *v17;
  NSString *providerToken;
  void *v19;
  NSString *v20;
  NSString *customProductPageIdentifier;
  void *v22;
  NSString *v23;
  NSString *latestReleaseID;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSUIWebAppOverlayAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v26, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dismiss"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dismiss"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_dismiss = objc_msgSend(v9, "BOOLValue");

    }
    else
    {
      v7->_dismiss = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    appIdentifier = v7->_appIdentifier;
    v7->_appIdentifier = v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("campaignToken"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    campaignToken = v7->_campaignToken;
    v7->_campaignToken = v14;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("providerToken"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    providerToken = v7->_providerToken;
    v7->_providerToken = v17;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("customProductPageIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    customProductPageIdentifier = v7->_customProductPageIdentifier;
    v7->_customProductPageIdentifier = v20;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latestReleaseID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    latestReleaseID = v7->_latestReleaseID;
    v7->_latestReleaseID = v23;

  }
  return v7;
}

- (id)runAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[5];
  AMSUIWebAppOverlayAction *v11;

  if (-[AMSUIWebAppOverlayAction dismiss](self, "dismiss"))
  {
    if (-[AMSUIWebAppOverlayAction _shouldUseStoreKit](self, "_shouldUseStoreKit"))
      -[AMSUIWebAppOverlayAction _dismissStoreKitOverlay](self, "_dismissStoreKitOverlay");
    else
      -[AMSUIWebAppOverlayAction _dismissOverlay](self, "_dismissOverlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIWebAppOverlayAction appIdentifier](self, "appIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      if (-[AMSUIWebAppOverlayAction _shouldUseStoreKit](self, "_shouldUseStoreKit"))
        -[AMSUIWebAppOverlayAction _presentStoreKitOverlayWithAppIdentifier:](self, "_presentStoreKitOverlayWithAppIdentifier:", v3);
      else
        -[AMSUIWebAppOverlayAction _presentOverlayWithAppIdentifier:](self, "_presentOverlayWithAppIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x24BE08078];
      AMSError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "promiseWithError:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__3;
  v10[4] = __Block_byref_object_dispose__3;
  v11 = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__AMSUIWebAppOverlayAction_runAction__block_invoke;
  v9[3] = &unk_24CB509E0;
  v9[4] = v11;
  v9[5] = v10;
  objc_msgSend(v4, "addFinishBlock:", v9);
  objc_msgSend(v4, "promiseAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v10, 8);

  return v7;
}

void __37__AMSUIWebAppOverlayAction_runAction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setPresentationOverlay:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AMSUIWebAppOverlayAction storeKitOverlayPromise](self, "storeKitOverlayPromise");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithError:", v5);

}

- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4
{
  id v4;

  -[AMSUIWebAppOverlayAction storeKitOverlayPromise](self, "storeKitOverlayPromise", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithSuccess");

}

- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4
{
  id v4;

  -[AMSUIWebAppOverlayAction storeKitOverlayPromise](self, "storeKitOverlayPromise", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithSuccess");

}

- (id)_determineScene
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSUIWebAction context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dismissOverlay
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing app overlay", (uint8_t *)&v11, 0x16u);

  }
  -[AMSUIWebAction context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "webPage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissAppOverlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dismissStoreKitOverlay
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Class SKOverlayClass;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing app overlay using StoreKit", (uint8_t *)&v11, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  -[AMSUIWebAppOverlayAction setStoreKitOverlayPromise:](self, "setStoreKitOverlayPromise:", v7);
  SKOverlayClass = getSKOverlayClass();
  -[AMSUIWebAppOverlayAction _determineScene](self, "_determineScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class dismissOverlayInScene:](SKOverlayClass, "dismissOverlayInScene:", v9);

  return v7;
}

- (id)_presentOverlayWithAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    v13 = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting app overlay: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  -[AMSUIWebAction context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentAppOverlayWithAdamID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_presentStoreKitOverlayWithAppIdentifier:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
    v18 = 138543874;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting app overlay using StoreKit: %{public}@", (uint8_t *)&v18, 0x20u);

  }
  v9 = (void *)objc_opt_new();
  -[AMSUIWebAppOverlayAction setStoreKitOverlayPromise:](self, "setStoreKitOverlayPromise:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(getSKOverlayAppConfigurationClass()), "initWithAppIdentifier:position:", v4, 0);
  -[AMSUIWebAppOverlayAction campaignToken](self, "campaignToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCampaignToken:", v11);

  -[AMSUIWebAppOverlayAction providerToken](self, "providerToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProviderToken:", v12);

  -[AMSUIWebAppOverlayAction customProductPageIdentifier](self, "customProductPageIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomProductPageIdentifier:", v13);

  -[AMSUIWebAppOverlayAction latestReleaseID](self, "latestReleaseID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLatestReleaseID:", v14);

  objc_msgSend(v10, "setUserDismissible:", 1);
  v15 = (void *)objc_msgSend(objc_alloc(getSKOverlayClass()), "initWithConfiguration:", v10);
  objc_msgSend(v15, "setDelegate:", self);
  -[AMSUIWebAppOverlayAction _determineScene](self, "_determineScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentInScene:", v16);

  -[AMSUIWebAppOverlayAction setPresentationOverlay:](self, "setPresentationOverlay:", v15);
  return v9;
}

- (BOOL)_shouldUseStoreKit
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)dismiss
{
  return self->_dismiss;
}

- (void)setDismiss:(BOOL)a3
{
  self->_dismiss = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (NSString)campaignToken
{
  return self->_campaignToken;
}

- (void)setCampaignToken:(id)a3
{
  objc_storeStrong((id *)&self->_campaignToken, a3);
}

- (NSString)providerToken
{
  return self->_providerToken;
}

- (void)setProviderToken:(id)a3
{
  objc_storeStrong((id *)&self->_providerToken, a3);
}

- (NSString)customProductPageIdentifier
{
  return self->_customProductPageIdentifier;
}

- (void)setCustomProductPageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_customProductPageIdentifier, a3);
}

- (NSString)latestReleaseID
{
  return self->_latestReleaseID;
}

- (void)setLatestReleaseID:(id)a3
{
  objc_storeStrong((id *)&self->_latestReleaseID, a3);
}

- (SKOverlay)presentationOverlay
{
  return self->_presentationOverlay;
}

- (void)setPresentationOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_presentationOverlay, a3);
}

- (AMSMutableBinaryPromise)storeKitOverlayPromise
{
  return self->_storeKitOverlayPromise;
}

- (void)setStoreKitOverlayPromise:(id)a3
{
  objc_storeStrong((id *)&self->_storeKitOverlayPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeKitOverlayPromise, 0);
  objc_storeStrong((id *)&self->_presentationOverlay, 0);
  objc_storeStrong((id *)&self->_latestReleaseID, 0);
  objc_storeStrong((id *)&self->_customProductPageIdentifier, 0);
  objc_storeStrong((id *)&self->_providerToken, 0);
  objc_storeStrong((id *)&self->_campaignToken, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end
