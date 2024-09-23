@implementation AMSUIWebOpenApplicationAction

- (AMSUIWebOpenApplicationAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebOpenApplicationAction *v7;
  void *v8;
  NSString *v9;
  NSString *bundleIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebOpenApplicationAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v12, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v9;

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
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  AMSUIWebOpenApplicationAction *v21;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)AMSUIWebOpenApplicationAction;
  v3 = -[AMSUIWebAction runAction](&v23, sel_runAction);
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
    -[AMSUIWebOpenApplicationAction bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    v28 = 2114;
    v29 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening application: %{public}@", buf, 0x20u);

  }
  -[AMSUIWebOpenApplicationAction bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE08078]);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebOpenApplicationAction bundleIdentifier](self, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __42__AMSUIWebOpenApplicationAction_runAction__block_invoke;
    v20 = &unk_24CB4FA28;
    v21 = self;
    v22 = v10;
    v13 = v10;
    objc_msgSend(v11, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v12, 0, &v17);

    objc_msgSend(v13, "promiseAdapter", v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x24BE08340];
    AMSError();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "promiseWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __42__AMSUIWebOpenApplicationAction_runAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error opening application with bundle identifier %{public}@ : %{public}@", (uint8_t *)&v17, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully opened application with bundle identifier %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess:error:", a2, 0);
  }

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
