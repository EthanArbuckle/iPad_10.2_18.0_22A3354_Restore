@implementation AMSUIWebVerifyCredentialsAction

- (AMSUIWebVerifyCredentialsAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebVerifyCredentialsAction *v8;
  void *v9;
  id v10;
  uint64_t v11;
  ACAccount *account;
  ACAccount *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  ACAccount *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSString *v33;
  NSString *authenticationType;
  void *v35;
  NSString *v36;
  NSString *buttonText;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  NSString *serviceIdentifier;
  void *v43;
  void *v44;
  void *v45;
  NSString *v46;
  NSString *subtitle;
  void *v48;
  NSString *v49;
  NSString *title;
  void *v51;
  void *v52;
  void *v54;
  objc_super v55;

  v6 = a3;
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)AMSUIWebVerifyCredentialsAction;
  v8 = -[AMSUIWebAction initWithJSObject:context:](&v55, sel_initWithJSObject_context_, v6, v7);
  if (!v8)
    goto LABEL_44;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(v7, "iTunesAccountFromJSAccount:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  account = v8->_account;
  v8->_account = (ACAccount *)v11;

  v13 = v8->_account;
  if (!v13 || -[ACAccount ams_isLocalAccount](v13, "ams_isLocalAccount"))
  {
    v14 = (void *)MEMORY[0x24BDB4398];
    -[AMSUIWebAction context](v8, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountMediaType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ams_sharedAccountStoreForMediaType:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4180]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v54);
    v20 = v8->_account;
    v8->_account = (ACAccount *)v19;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("username"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    -[ACAccount setUsername:](v8->_account, "setUsername:", v22);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DSID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    v25 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = v10;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DSID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "longLongValue");

      if (v28)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACAccount ams_setDSID:](v8->_account, "ams_setDSID:", v29);

LABEL_15:
        v10 = v26;
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("altDSID"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = v30;
        else
          v31 = 0;
        v7 = v25;

        -[ACAccount ams_setAltDSID:](v8->_account, "ams_setAltDSID:", v31);
        goto LABEL_19;
      }
    }
    else
    {
      v26 = v10;

    }
    -[ACAccount ams_setDSID:](v8->_account, "ams_setDSID:", 0);
    goto LABEL_15;
  }
LABEL_19:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authenticationType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;

  authenticationType = v8->_authenticationType;
  v8->_authenticationType = v33;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buttonText"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;

  buttonText = v8->_buttonText;
  v8->_buttonText = v36;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ephemeral"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ephemeral"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_ephemeral = objc_msgSend(v39, "BOOLValue");

  }
  else
  {
    v8->_ephemeral = 0;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v40;
  else
    v41 = 0;

  serviceIdentifier = v8->_serviceIdentifier;
  v8->_serviceIdentifier = v41;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_serviceType = objc_msgSend(v44, "longLongValue");

  }
  else
  {
    v8->_serviceType = 0;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;

  subtitle = v8->_subtitle;
  v8->_subtitle = v46;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v49 = v48;
  else
    v49 = 0;

  title = v8->_title;
  v8->_title = v49;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usernameEditable"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usernameEditable"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_usernameEditable = objc_msgSend(v52, "BOOLValue");

  }
  else
  {
    v8->_usernameEditable = 0;
  }

LABEL_44:
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  AMSUIAuthKitUpdateTask *v23;
  void *v24;
  AMSUIAuthKitUpdateTask *v25;
  void *v26;
  void *v27;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)AMSUIWebVerifyCredentialsAction;
  v3 = -[AMSUIWebAction runAction](&v29, sel_runAction);
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
    -[AMSUIWebVerifyCredentialsAction account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v6;
    v32 = 2114;
    v33 = v7;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AuthKit action for account: %{public}@", buf, 0x20u);

  }
  v10 = objc_alloc_init(MEMORY[0x24BE08020]);
  -[AMSUIWebVerifyCredentialsAction buttonText](self, "buttonText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultButtonString:", v11);

  objc_msgSend(v10, "setEphemeral:", -[AMSUIWebVerifyCredentialsAction ephemeral](self, "ephemeral"));
  -[AMSUIWebVerifyCredentialsAction title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPromptTitle:", v12);

  -[AMSUIWebVerifyCredentialsAction subtitle](self, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReason:", v13);

  objc_msgSend(v10, "setServiceType:", objc_msgSend((id)objc_opt_class(), "_serviceTypeFromType:", -[AMSUIWebVerifyCredentialsAction serviceType](self, "serviceType")));
  -[AMSUIWebVerifyCredentialsAction serviceIdentifier](self, "serviceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServiceIdentifier:", v14);

  v15 = (void *)objc_opt_class();
  -[AMSUIWebVerifyCredentialsAction authenticationType](self, "authenticationType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_authenticationTypeFromStringedType:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebVerifyCredentialsAction authenticationType](self, "authenticationType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = objc_msgSend(v17, "unsignedIntegerValue");
  else
    v19 = 0;
  objc_msgSend(v10, "setAuthenticationType:", v19);
  -[AMSUIWebAction context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "flowController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [AMSUIAuthKitUpdateTask alloc];
  -[AMSUIWebVerifyCredentialsAction account](self, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AMSUIAuthKitUpdateTask initWithAccount:presentingViewController:options:](v23, "initWithAccount:presentingViewController:options:", v24, v22, v10);

  -[AMSAuthKitUpdateTask performAuthKitUpdate](v25, "performAuthKitUpdate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "thenWithBlock:", &__block_literal_global_32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id __44__AMSUIWebVerifyCredentialsAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "authenticationResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE0ABD8]);
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)_serviceTypeFromType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a3 == 1)
      return 1;
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Defaulting to STORE service type. (%ld)", (uint8_t *)&v9, 0x20u);

    }
  }
  return 2;
}

+ (id)_authenticationTypeFromStringedType:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(&unk_24CB8C820, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationType, a3);
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonText, a3);
}

- (BOOL)ephemeral
{
  return self->_ephemeral;
}

- (void)setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)usernameEditable
{
  return self->_usernameEditable;
}

- (void)setUsernameEditable:(BOOL)a3
{
  self->_usernameEditable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
