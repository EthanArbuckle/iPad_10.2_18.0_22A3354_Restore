@implementation AMSUIWebAccountAction

- (AMSUIWebAccountAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebAccountAction *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *accountObject;
  void *v12;
  uint64_t v13;
  ACAccount *account;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebAccountAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v16, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    accountObject = v8->_accountObject;
    v8->_accountObject = v10;

    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v8->_accountObject);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    account = v8->_account;
    v8->_account = (ACAccount *)v13;

  }
  return v8;
}

- (id)runAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)AMSUIWebAccountAction;
  v3 = -[AMSUIWebAction runAction](&v28, sel_runAction);
  -[AMSUIWebAccountAction account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAccountAction accountObject](self, "accountObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accountFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __34__AMSUIWebAccountAction_runAction__block_invoke;
  v26[3] = &unk_24CB50978;
  v8 = v4;
  v27 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v26);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("active"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("active"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", objc_msgSend(v10, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v8, "setActive:", 0);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("credits"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  objc_msgSend(v8, "ams_setCreditsString:", v12);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    AMSLogKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dirtyProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v15;
    v31 = 2114;
    v32 = v16;
    v33 = 2114;
    v34 = v17;
    _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating account keys: %{public}@", buf, 0x20u);

  }
  v18 = (void *)MEMORY[0x24BDB4398];
  -[AMSUIWebAction context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accountMediaType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ams_sharedAccountStoreForMediaType:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "ams_saveAccount:verifyCredentials:", v8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "promiseAdapter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __34__AMSUIWebAccountAction_runAction__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "ams_setAccountFlagValue:forAccountFlag:", a3, a2);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)accountObject
{
  return self->_accountObject;
}

- (void)setAccountObject:(id)a3
{
  objc_storeStrong((id *)&self->_accountObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountObject, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
