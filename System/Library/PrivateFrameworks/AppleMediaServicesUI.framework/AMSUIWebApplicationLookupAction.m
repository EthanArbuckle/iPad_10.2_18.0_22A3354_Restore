@implementation AMSUIWebApplicationLookupAction

- (AMSUIWebApplicationLookupAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebApplicationLookupAction *v7;
  void *v8;
  NSString *v9;
  NSString *bundleIdentifier;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebApplicationLookupAction;
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
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  objc_super v20;
  _QWORD block[4];
  id v22;
  id v23;

  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebApplicationLookupAction;
  v3 = -[AMSUIWebAction runAction](&v20, sel_runAction);
  -[AMSUIWebApplicationLookupAction bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)MEMORY[0x24BE08340];
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE08340]);
    dispatch_get_global_queue(-32768, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __44__AMSUIWebApplicationLookupAction_runAction__block_invoke;
    v18[3] = &unk_24CB4F4C0;
    v18[4] = self;
    v10 = v7;
    v19 = v10;
    v11 = v18;
    AMSLogKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_6;
    block[3] = &unk_24CB4F3C0;
    v22 = v12;
    v23 = v11;
    v13 = v12;
    dispatch_async(v8, block);

    v14 = v19;
    v15 = v10;

    v16 = v15;
  }
  else
  {
    AMSError();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "promiseWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __44__AMSUIWebApplicationLookupAction_runAction__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v4;
    v31 = 2114;
    v32 = v5;
    v33 = 2114;
    v34 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up application record: %{public}@", buf, 0x20u);

  }
  v7 = objc_alloc(MEMORY[0x24BDC1540]);
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v28);
  v10 = v28;

  if (!v9 || v10)
  {
    if (!v10)
    {
      AMSError();
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_opt_class();
      AMSLogKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      v31 = 2114;
      v32 = v27;
      v33 = 2114;
      v34 = v10;
      _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup application record. %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v10);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v9, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("bundleIdentifier"));

    objc_msgSend(v9, "bundleVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("bundleVersion"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isBeta"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("beta"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isPlaceholder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("placeholder"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v9, "isArcadeApp"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("arcadeApp"));

    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "applicationState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "isInstalled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("installed"));

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
      v22 = objc_opt_class();
      AMSLogKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v22;
      v31 = 2114;
      v32 = v23;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found application: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v11);

    v10 = 0;
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
