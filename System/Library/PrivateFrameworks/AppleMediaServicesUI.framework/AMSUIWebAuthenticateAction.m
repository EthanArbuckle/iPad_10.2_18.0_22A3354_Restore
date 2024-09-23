@implementation AMSUIWebAuthenticateAction

- (AMSUIWebAuthenticateAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebAuthenticateAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
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
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  AMSAuthenticateRequest *request;
  id v59;
  void *v60;
  id v61;
  objc_super v62;

  v6 = a3;
  v62.receiver = self;
  v62.super_class = (Class)AMSUIWebAuthenticateAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v62, sel_initWithJSObject_context_, v6, a4);
  if (!v7)
    goto LABEL_65;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pauseTimeouts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pauseTimeouts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_pauseTimeouts = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v7->_pauseTimeouts = 1;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("makeCurrentAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("makeCurrentAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_makeCurrentAccount = objc_msgSend(v11, "BOOLValue");

  }
  else
  {
    v7->_makeCurrentAccount = 0;
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("defaultButtonText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("headers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v59 = v14;
  else
    v59 = 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("promptTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v60 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v61 = v15;
  else
    v61 = 0;

  -[AMSUIWebAction context](v7, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "iTunesAccountFromJSAccount:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 || objc_msgSend(v18, "ams_isLocalAccount"))
  {
    v19 = (void *)MEMORY[0x24BDB4398];
    -[AMSUIWebAction context](v7, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clientInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accountMediaType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ams_sharedAccountStoreForMediaType:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4180]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithAccountType:", v24);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("account"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("username"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;

    objc_msgSend(v25, "setUsername:", v29);
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("DSID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("DSID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "longLongValue");

      if (v32)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "ams_setDSID:", v33);

LABEL_30:
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("altDSID"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;

        objc_msgSend(v25, "ams_setAltDSID:", v35);
        goto LABEL_35;
      }
    }
    else
    {

    }
    objc_msgSend(v25, "ams_setDSID:", 0);
    goto LABEL_30;
  }
  v25 = v18;
LABEL_35:
  objc_msgSend(v25, "ams_DSID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dsid"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v37, "longLongValue"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "ams_setDSID:", v38);

    }
    else
    {
      objc_msgSend(v25, "ams_setDSID:", 0);
    }

  }
  objc_msgSend(v25, "ams_altDSID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altDSID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v40;
    else
      v41 = 0;

    objc_msgSend(v25, "ams_setAltDSID:", v41);
  }
  objc_msgSend(v25, "username");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("username"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v43;
    else
      v44 = 0;

    objc_msgSend(v25, "setUsername:", v44);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v45;
  else
    v46 = 0;

  if (objc_msgSend(v46, "isEqualToString:", CFSTR("cloud")))
    -[AMSUIWebAuthenticateAction setIsAuthenticatingCloud:](v7, "setIsAuthenticatingCloud:", 1);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v48 = objc_msgSend(v47, "unsignedIntegerValue");
  else
    v48 = 1;
  v49 = objc_alloc_init(MEMORY[0x24BE08020]);
  -[AMSUIWebAction context](v7, "context");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "clientInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setClientInfo:", v51);

  objc_msgSend(v49, "setAuthenticationType:", v48);
  objc_msgSend(v49, "setPromptTitle:", v61);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("canMakeAccountActive"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("canMakeAccountActive"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setCanMakeAccountActive:", objc_msgSend(v53, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v49, "setCanMakeAccountActive:", 0);
  }

  objc_msgSend(v49, "setHTTPHeaders:", v59);
  objc_msgSend(v49, "setDefaultButtonString:", v60);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreAccountConversion"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoreAccountConversion"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setIgnoreAccountConversion:", objc_msgSend(v55, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v49, "setIgnoreAccountConversion:", 0);
  }

  v56 = objc_msgSend(objc_alloc(MEMORY[0x24BE08028]), "initWithAccount:options:", v25, v49);
  request = v7->_request;
  v7->_request = (AMSAuthenticateRequest *)v56;

LABEL_65:
  return v7;
}

- (id)runAction
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t, void *);
  void *v34;
  AMSUIWebAuthenticateAction *v35;
  uint64_t v36;
  uint64_t v37;
  id (*v38)(uint64_t, void *);
  void *v39;
  AMSUIWebAuthenticateAction *v40;
  objc_super v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)AMSUIWebAuthenticateAction;
  v3 = -[AMSUIWebAction runAction](&v41, sel_runAction);
  v4 = -[AMSUIWebAuthenticateAction isAuthenticatingCloud](self, "isAuthenticatingCloud");
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
      -[AMSUIWebAuthenticateAction request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v8;
      v44 = 2114;
      v45 = v9;
      v46 = 2114;
      v47 = v12;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running cloud authenticate action for account: %{public}@", buf, 0x20u);

    }
    -[AMSUIWebAction context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AMSUIWebAuthenticateAction pauseTimeouts](self, "pauseTimeouts");
    -[AMSUIWebAuthenticateAction request](self, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "action:pauseTimeouts:handleAuthenticateCloudRequest:", self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __39__AMSUIWebAuthenticateAction_runAction__block_invoke;
    v39 = &unk_24CB50A78;
    v40 = self;
    v18 = &v36;
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebAuthenticateAction request](self, "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "account");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v20;
      v44 = 2114;
      v45 = v21;
      v46 = 2114;
      v47 = v24;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running authenticate action for account: %{public}@", buf, 0x20u);

    }
    -[AMSUIWebAction context](self, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "actionDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AMSUIWebAuthenticateAction pauseTimeouts](self, "pauseTimeouts");
    -[AMSUIWebAuthenticateAction request](self, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "action:pauseTimeouts:handleAuthenticateRequest:", self, v27, v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __39__AMSUIWebAuthenticateAction_runAction__block_invoke_44;
    v34 = &unk_24CB50AA0;
    v35 = self;
    v18 = &v31;
  }
  objc_msgSend(v17, "thenWithBlock:", v18, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

id __39__AMSUIWebAuthenticateAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateContextWithAccountIfNeeded:", v5);

  v6 = (void *)MEMORY[0x24BE08340];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_responseForAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__AMSUIWebAuthenticateAction_runAction__block_invoke_44(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateContextWithAccountIfNeeded:", v5);

  v6 = (void *)MEMORY[0x24BE08340];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_responseForAccount:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promiseWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_updateContextWithAccountIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[AMSUIWebAuthenticateAction makeCurrentAccount](self, "makeCurrentAccount")
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

- (id)_responseForAccount:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "ams_DSID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24CB8C158;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v14[0] = CFSTR("dsid");
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = CFSTR("account");
  v15[0] = v9;
  -[AMSUIWebAction context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "JSAccountFromAccount:store:", v4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)makeCurrentAccount
{
  return self->_makeCurrentAccount;
}

- (void)setMakeCurrentAccount:(BOOL)a3
{
  self->_makeCurrentAccount = a3;
}

- (AMSAuthenticateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (BOOL)pauseTimeouts
{
  return self->_pauseTimeouts;
}

- (void)setPauseTimeouts:(BOOL)a3
{
  self->_pauseTimeouts = a3;
}

- (BOOL)isAuthenticatingCloud
{
  return self->_isAuthenticatingCloud;
}

- (void)setIsAuthenticatingCloud:(BOOL)a3
{
  self->_isAuthenticatingCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
