@implementation AMSUIWebWalletPassAction

- (AMSUIWebWalletPassAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebWalletPassAction *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *lookupFeature;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebWalletPassAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v15, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attemptLynxProvisioning"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attemptLynxProvisioning"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_attemptLynxProvisioning = objc_msgSend(v9, "BOOLValue");

    }
    else
    {
      v7->_attemptLynxProvisioning = 0;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lookupFeatureIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = objc_msgSend(v10, "longLongValue");
      else
        v11 = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      lookupFeature = v7->_lookupFeature;
      v7->_lookupFeature = (NSNumber *)v12;

    }
  }

  return v7;
}

- (id)runAction
{
  id v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebWalletPassAction;
  v3 = -[AMSUIWebAction runAction](&v13, sel_runAction);
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSUIWebWalletPassAction attemptLynxProvisioning](self, "attemptLynxProvisioning");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke;
    v12[3] = &unk_24CB521F0;
    v12[4] = self;
    objc_msgSend(v4, "thenWithBlock:", v12);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[AMSUIWebWalletPassAction lookupFeature](self, "lookupFeature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke_3;
    v11[3] = &unk_24CB521F0;
    v11[4] = self;
    objc_msgSend(v4, "thenWithBlock:", v11);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  return v4;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_attemptLynxProvisioning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promiseAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke_2;
  v9[3] = &unk_24CB4FBD0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "thenWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "ams_dictionaryByAddingEntriesFromDictionary:", &unk_24CB8C870);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "lookupFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_lookupPassForIdentifier:", objc_msgSend(v5, "unsignedLongValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__AMSUIWebWalletPassAction_runAction__block_invoke_4;
  v10[3] = &unk_24CB52218;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "thenWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __37__AMSUIWebWalletPassAction_runAction__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v20 = CFSTR("pass");
  v18[0] = CFSTR("identifier");
  v3 = a2;
  objc_msgSend(v3, "devicePassIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24CB5A078;
  v19[0] = v6;
  v18[1] = CFSTR("terminalIdentifier");
  objc_msgSend(v3, "pairedTerminalIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24CB5A078;
  v19[1] = v9;
  v18[2] = CFSTR("activationState");
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v3, "passActivationState");

  objc_msgSend(v10, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_dictionaryByAddingEntriesFromDictionary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_attemptLynxProvisioning
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  AMSUIWebWalletPassAction *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    -[AMSUIWebAction context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v5;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting Lynx provisioning...", buf, 0x16u);

  }
  v8 = objc_alloc_init(MEMORY[0x24BE08078]);
  objc_msgSend(getPKAccountServiceClass(), "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();
  v11 = MEMORY[0x24BDAC760];
  if ((v10 & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke;
    v15[3] = &unk_24CB4F828;
    v16 = v8;
    v17 = self;
    objc_msgSend(v9, "attemptAppleStoredValueSetupWithCompletion:", v15);
    v12 = v16;
  }
  else
  {
    AMSError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v12);
  }

  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke_52;
  v14[3] = &unk_24CB4F560;
  v14[4] = self;
  objc_msgSend(v8, "addErrorBlock:", v14);

  return v8;
}

uint64_t __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
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
    objc_msgSend(*(id *)(a1 + 40), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Provisioning Lynx succeeded", (uint8_t *)&v9, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
}

void __52__AMSUIWebWalletPassAction__attemptLynxProvisioning__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Provisioning Lynx failed. %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

- (id)_lookupPassForIdentifier:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v7;
    v20 = 2114;
    v21 = v9;
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking up pass: %ld", buf, 0x20u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08340]), "initWithTimeout:", 30.0);
  objc_msgSend(getPKAccountServiceClass(), "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke;
  v16[3] = &unk_24CB52268;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  objc_msgSend(v11, "defaultAccountForFeature:completion:", a3, v16);

  v13 = v17;
  v14 = v12;

  return v14;
}

void __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE buf[24];
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2114;
      v31 = v6;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Pass lookup failed to locate account. %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accountIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v31 = v17;
      _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Pass lookup located the account: %@", buf, 0x20u);

    }
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v18 = (void *)getPKPassLibraryClass_softClass_1;
    v29 = getPKPassLibraryClass_softClass_1;
    v19 = MEMORY[0x24BDAC760];
    if (!getPKPassLibraryClass_softClass_1)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPKPassLibraryClass_block_invoke_1;
      v31 = &unk_24CB4F3E8;
      v32 = &v26;
      __getPKPassLibraryClass_block_invoke_1((uint64_t)buf);
      v18 = (void *)v27[3];
    }
    v20 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v20, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke_53;
    v24[3] = &unk_24CB52240;
    v23 = *(void **)(a1 + 40);
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = v23;
    objc_msgSend(v21, "paymentPassWithAssociatedAccountIdentifier:completion:", v22, v24);

  }
}

void __53__AMSUIWebWalletPassAction__lookupPassForIdentifier___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v9;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Pass fetched successfully", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v3);
  }
  else
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Pass not found", (uint8_t *)&v16, 0x16u);

    }
    v14 = *(void **)(a1 + 40);
    AMSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:", v15);

  }
}

- (BOOL)attemptLynxProvisioning
{
  return self->_attemptLynxProvisioning;
}

- (void)setAttemptLynxProvisioning:(BOOL)a3
{
  self->_attemptLynxProvisioning = a3;
}

- (NSNumber)lookupFeature
{
  return self->_lookupFeature;
}

- (void)setLookupFeature:(id)a3
{
  objc_storeStrong((id *)&self->_lookupFeature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupFeature, 0);
}

@end
