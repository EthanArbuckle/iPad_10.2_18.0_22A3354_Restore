@implementation AMSUIWebPresentPrivacySplashAction

- (AMSUIWebPresentPrivacySplashAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebPresentPrivacySplashAction *v7;
  void *v8;
  NSString *v9;
  NSString *privacyIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebPresentPrivacySplashAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privacyIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    privacyIdentifier = v7->_privacyIdentifier;
    v7->_privacyIdentifier = v9;

  }
  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebPresentPrivacySplashAction;
  v3 = -[AMSUIWebAction runAction](&v22, sel_runAction);
  -[AMSUIWebPresentPrivacySplashAction privacyIdentifier](self, "privacyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
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
      v24 = v8;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting OBPrivacyPresenter", buf, 0x16u);

    }
    v10 = objc_alloc_init(MEMORY[0x24BE08340]);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke;
    v20[3] = &unk_24CB4F4C0;
    v20[4] = self;
    v11 = v10;
    v21 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);
    v12 = v21;
    v13 = v11;

    v14 = v13;
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No privacyIdentifier found", buf, 0x16u);

    }
    v18 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "promiseWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;

  v2 = (void *)MEMORY[0x24BE6E438];
  objc_msgSend(*(id *)(a1 + 32), "privacyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presenterForPrivacySplashWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v7);

  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke_2;
  v12 = &unk_24CB4F4C0;
  v8 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  objc_msgSend(v4, "setDismissHandler:", &v9);
  objc_msgSend(v4, "present", v9, v10, v11, v12, v13);

}

void __47__AMSUIWebPresentPrivacySplashAction_runAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE08000];
  objc_msgSend(*(id *)(a1 + 32), "privacyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "acknowledgementNeededForPrivacyIdentifier:", v3) ^ 1;

  v5 = *(void **)(a1 + 40);
  v8 = CFSTR("acknowledged");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v7);

}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_privacyIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
}

@end
