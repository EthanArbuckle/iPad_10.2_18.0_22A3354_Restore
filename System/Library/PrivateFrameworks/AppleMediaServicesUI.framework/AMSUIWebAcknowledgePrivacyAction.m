@implementation AMSUIWebAcknowledgePrivacyAction

- (AMSUIWebAcknowledgePrivacyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebAcknowledgePrivacyAction *v8;
  void *v9;
  NSString *v10;
  NSString *privacyIdentifier;
  void *v12;
  id v13;
  uint64_t v14;
  ACAccount *account;
  ACAccount *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  ACAccount *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)AMSUIWebAcknowledgePrivacyAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v34, sel_initWithJSObject_context_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privacyIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    privacyIdentifier = v8->_privacyIdentifier;
    v8->_privacyIdentifier = v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v7, "iTunesAccountFromJSAccount:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    account = v8->_account;
    v8->_account = (ACAccount *)v14;

    v16 = v8->_account;
    if (v16 && !-[ACAccount ams_isLocalAccount](v16, "ams_isLocalAccount"))
      goto LABEL_22;
    v17 = (void *)MEMORY[0x24BDB4398];
    -[AMSUIWebAction context](v8, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accountMediaType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_sharedAccountStoreForMediaType:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4180]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v22);
    v24 = v8->_account;
    v8->_account = (ACAccount *)v23;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("username"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    -[ACAccount setUsername:](v8->_account, "setUsername:", v26);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DSID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DSID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "longLongValue");

      if (v29)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACAccount ams_setDSID:](v8->_account, "ams_setDSID:", v30);

LABEL_18:
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("altDSID"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;

        -[ACAccount ams_setAltDSID:](v8->_account, "ams_setAltDSID:", v32);
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {

    }
    -[ACAccount ams_setDSID:](v8->_account, "ams_setDSID:", 0);
    goto LABEL_18;
  }
LABEL_23:

  return v8;
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
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebAcknowledgePrivacyAction;
  v3 = -[AMSUIWebAction runAction](&v21, sel_runAction);
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
    -[AMSUIWebAcknowledgePrivacyAction privacyIdentifier](self, "privacyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v6;
    v24 = 2114;
    v25 = v7;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Acknowledging privacy for ID: %{public}@", buf, 0x20u);

  }
  -[AMSUIWebAcknowledgePrivacyAction privacyIdentifier](self, "privacyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    v19 = (void *)MEMORY[0x24BE08340];
LABEL_10:
    AMSError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "promiseWithError:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[AMSUIWebAcknowledgePrivacyAction account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v19 = (void *)MEMORY[0x24BE08340];
    goto LABEL_10;
  }
  v12 = objc_alloc(MEMORY[0x24BE08000]);
  -[AMSUIWebAcknowledgePrivacyAction privacyIdentifier](self, "privacyIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAcknowledgePrivacyAction account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithPrivacyIdentifier:account:", v13, v14);

  objc_msgSend(v15, "acknowledgePrivacy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "promiseAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "thenWithBlock:", &__block_literal_global_16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v18;
}

uint64_t __45__AMSUIWebAcknowledgePrivacyAction_runAction__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", &unk_24CB8C6E0);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
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
  objc_storeStrong((id *)&self->_account, 0);
}

@end
