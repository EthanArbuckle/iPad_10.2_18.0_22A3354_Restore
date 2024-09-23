@implementation AMSUIWebClientContext

- (AMSUIWebClientContext)initWithAccount:(id)a3 clientInfo:(id)a4 backingBag:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUIWebClientContext *v11;
  AMSUIWebClientContext *v12;
  uint64_t v13;
  AMSLRUCache *snapshotCache;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebClientContext;
  v11 = -[AMSUIWebClientContext init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_backingBag, a5);
    objc_storeStrong((id *)&v12->_clientInfo, a4);
    +[AMSUIWebClientContext _sharedSnapshotCache](AMSUIWebClientContext, "_sharedSnapshotCache");
    v13 = objc_claimAutoreleasedReturnValue();
    snapshotCache = v12->_snapshotCache;
    v12->_snapshotCache = (AMSLRUCache *)v13;

    -[AMSUIWebClientContext replaceCurrentAccount:clientInfo:](v12, "replaceCurrentAccount:clientInfo:", v8, v9);
  }

  return v12;
}

- (AMSSnapshotBag)bag
{
  AMSSnapshotBag *bag;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  bag = self->_bag;
  if (!bag)
  {
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
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] INVALID: Use of bag before bootstrap.", (uint8_t *)&v9, 0x16u);

    }
    bag = self->_backingBag;
  }
  return bag;
}

- (BOOL)disableTrustedDomains
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = objc_msgSend((id)objc_opt_class(), "_BOOLForKey:defaultValue:domain:", CFSTR("AMSUIWebDisableTrustedDomains"), 0, CFSTR("com.apple.AppleMediaServices"));
  return has_internal_content;
}

- (id)iTunesAccountFromJSAccount:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
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
  void *v25;
  void *v26;
  void *v27;
  int v28;
  AMSUIWebClientContext *v29;
  id v30;
  void *v31;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DSID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v31, "longLongValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("altDSID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("username"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v8)
    {
      -[AMSUIWebClientContext account](self, "account");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ams_DSID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToNumber:", v8) & 1) != 0)
        goto LABEL_20;
      if (v11)
      {
LABEL_18:
        -[AMSUIWebClientContext account](self, "account");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ams_altDSID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v11))
        {

          if (!v8)
          {
LABEL_30:
            -[AMSUIWebClientContext account](self, "account");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "reload");

            -[AMSUIWebClientContext account](self, "account");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

            goto LABEL_38;
          }
LABEL_20:

          goto LABEL_30;
        }
        v27 = v15;
        v30 = v13;
        if (!v13)
        {
          v29 = self;
          v28 = 0;
          goto LABEL_32;
        }
        v25 = v14;
LABEL_27:
        v29 = self;
        -[AMSUIWebClientContext account](self, "account", v25, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "username");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v13;
        v28 = objc_msgSend(v17, "isEqualToString:", v13);

        v14 = v26;
        if (!v11)
        {
          if (v8)
            goto LABEL_29;
          goto LABEL_33;
        }
LABEL_32:

        if (v8)
        {
LABEL_29:

          self = v29;
          v13 = v30;
          if ((v28 & 1) != 0)
            goto LABEL_30;
LABEL_34:
          v19 = (void *)MEMORY[0x24BDB4398];
          -[AMSUIWebClientContext clientInfo](self, "clientInfo");
          v20 = v13;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "accountMediaType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "ams_sharedAccountStoreForMediaType:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v20;
          objc_msgSend(v23, "ams_iTunesAccountWithAltDSID:DSID:username:", v11, v8, v20);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
          {
            objc_msgSend(v23, "ams_localiTunesAccount");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_37;
        }
LABEL_33:
        self = v29;
        v13 = v30;
        if (v28)
          goto LABEL_30;
        goto LABEL_34;
      }
    }
    else if (v11)
    {
      goto LABEL_18;
    }
    if (!v13)
    {
      v29 = self;
      v30 = 0;
      v28 = 0;
      if (v8)
        goto LABEL_29;
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  v9 = 0;
LABEL_38:

  return v9;
}

- (id)iTunesAccountFromJSDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = CFSTR("DSID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[AMSUIWebClientContext iTunesAccountFromJSAccount:](self, "iTunesAccountFromJSAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)JSAccountFromAccount:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  const __CFString *v44;
  __CFString *v46;
  void *v47;
  id v48;
  const __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  _QWORD v52[11];
  _QWORD v53[13];

  v53[11] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBD1B8];
  if (!v6)
    goto LABEL_38;
  if (objc_msgSend(v6, "ams_isiTunesAccount"))
  {
    v9 = objc_msgSend(v6, "ams_isSandboxAccount");
    v10 = CFSTR("iTunes");
    v11 = CFSTR("iTunes.sandbox");
    goto LABEL_4;
  }
  if ((objc_msgSend(v6, "ams_isLocalAccount") & 1) != 0)
  {
    v10 = CFSTR("local");
  }
  else
  {
    if ((objc_msgSend(v6, "ams_isiCloudAccount") & 1) == 0)
    {
      v9 = objc_msgSend(v6, "ams_isIDMSAccount");
      v10 = CFSTR("unknown");
      v11 = CFSTR("IDMS");
LABEL_4:
      if (v9)
        v10 = v11;
      goto LABEL_11;
    }
    v10 = CFSTR("iCloud");
  }
LABEL_11:
  v49 = v10;
  v12 = (uint64_t)v8;
  objc_msgSend(v6, "ams_DSID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &unk_24CB8C170;
  if (v13)
    v15 = (void *)v13;
  v48 = v15;

  objc_msgSend(v6, "ams_altDSID");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_24CB5A078;
  if (v16)
    v18 = (__CFString *)v16;
  v51 = v18;

  if (!v7)
  {
    v19 = (void *)MEMORY[0x24BDB4398];
    -[AMSUIWebClientContext clientInfo](self, "clientInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "accountMediaType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ams_sharedAccountStoreForMediaType:", v21);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "ams_iTunesAccountForAccount:", v6);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (void *)v22;
  else
    v24 = v6;
  v25 = v24;

  objc_msgSend(v25, "ams_creditsString");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ams_firstName");
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ams_lastName");
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ams_storefront");
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "username");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v52[0] = CFSTR("accountFlags");
  objc_msgSend(v6, "ams_accountFlags");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = v29;
  else
    v31 = v12;
  v53[0] = v31;
  v52[1] = CFSTR("active");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isActive"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v32;
  v53[2] = v51;
  v52[2] = CFSTR("altDSID");
  v52[3] = CFSTR("credits");
  if (v26)
    v33 = v26;
  else
    v33 = &stru_24CB5A078;
  v53[3] = v33;
  v52[4] = CFSTR("DSID");
  objc_msgSend(v48, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)v27;
  if (v27)
    v35 = (const __CFString *)v27;
  else
    v35 = &stru_24CB5A078;
  v53[4] = v34;
  v53[5] = v35;
  v52[5] = CFSTR("firstName");
  v52[6] = CFSTR("lastName");
  v36 = v50;
  if (!v50)
    v36 = &stru_24CB5A078;
  v53[6] = v36;
  v52[7] = CFSTR("isManagedAppleID");
  v37 = (void *)MEMORY[0x24BDD16E0];
  v38 = v7;
  v39 = objc_msgSend(v6, "ams_isManagedAppleID");

  v40 = v39;
  v7 = v38;
  objc_msgSend(v37, "numberWithBool:", v40);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v46)
    v43 = v46;
  else
    v43 = &stru_24CB5A078;
  v53[7] = v41;
  v53[8] = v43;
  v52[8] = CFSTR("storefront");
  v52[9] = CFSTR("type");
  v52[10] = CFSTR("username");
  if (v28)
    v44 = v28;
  else
    v44 = &stru_24CB5A078;
  v53[9] = v49;
  v53[10] = v44;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
  return v8;
}

- (id)loadSnapshot
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE08078]);
  if (self->_bag)
  {
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
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Snapshot already loaded.", buf, 0x16u);

    }
    objc_msgSend(v3, "finishWithSuccess");
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[AMSUIWebClientContext backingBag](self, "backingBag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __37__AMSUIWebClientContext_loadSnapshot__block_invoke;
    v10[3] = &unk_24CB50E88;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v3;
    objc_msgSend(v8, "createSnapshotWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __37__AMSUIWebClientContext_loadSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 2, a2);
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", v6 == 0, v6);
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    AMSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
}

- (void)replaceCurrentAccount:(id)a3 clientInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ACAccount *v10;
  void *account;
  void *v12;
  void *v13;
  ACAccount *v14;
  ACAccount *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AMSUIWebClientContext clientInfo](self, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_createClientInfoFromAccount:clientInfo:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_clientInfo, v9);
  if (v6)
  {
    v10 = (ACAccount *)v6;
    account = self->_account;
    self->_account = v10;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDB4398];
    -[AMSUIWebClientContext clientInfo](self, "clientInfo");
    account = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ams_sharedAccountStoreForClient:", account);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ams_localiTunesAccount");
    v14 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v15 = self->_account;
    self->_account = v14;

  }
  -[AMSUIWebClientContext backingBag](self, "backingBag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0)
    goto LABEL_8;
  -[AMSUIWebClientContext backingBag](self, "backingBag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "accountMediaType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = 0;
    if (!v8)
      goto LABEL_22;
  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_opt_class();
      AMSLogKey();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v24;
      v48 = 2114;
      v49 = v25;
      _os_log_impl(&dword_211102000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unable to locate bag media type", buf, 0x16u);

    }
    v20 = 0;
    v21 = 1;
    if (!v8)
      goto LABEL_22;
  }
  -[AMSUIWebClientContext clientInfo](self, "clientInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "accountMediaType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v8, "accountMediaType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqualToString:", v29);

    if ((v30 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    v31 = objc_msgSend(v27, "isEqualToString:", v20);

    if ((v31 & 1) != 0)
      goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = v9;
  objc_msgSend(v32, "OSLogObject");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_opt_class();
    AMSLogKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v34;
    v48 = 2114;
    v49 = v35;
    _os_log_impl(&dword_211102000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating bag to match new account type", buf, 0x16u);

  }
  v36 = (void *)MEMORY[0x24BE08050];
  -[AMSUIWebClientContext backingBag](self, "backingBag");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "profile");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebClientContext backingBag](self, "backingBag");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "profileVersion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebClientContext clientInfo](self, "clientInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bagForProfile:profileVersion:processInfo:", v38, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebClientContext updateBackingBag:](self, "updateBackingBag:", v42);

  v9 = v45;
LABEL_22:
  -[AMSUIWebClientContext dataProvider](self, "dataProvider");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (id)objc_msgSend(v43, "syncProperties");

}

+ (id)_sharedSnapshotCache
{
  if (_sharedSnapshotCache_ams_once_token___COUNTER__ != -1)
    dispatch_once(&_sharedSnapshotCache_ams_once_token___COUNTER__, &__block_literal_global_20);
  return (id)_sharedSnapshotCache_ams_once_object___COUNTER__;
}

void __45__AMSUIWebClientContext__sharedSnapshotCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE081C0]), "initWithMaxSize:", 5);
  v1 = (void *)_sharedSnapshotCache_ams_once_object___COUNTER__;
  _sharedSnapshotCache_ams_once_object___COUNTER__ = v0;

}

+ (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4 domain:(__CFString *)a5
{
  __CFString *v7;
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  v7 = (__CFString *)a3;
  CFPreferencesAppSynchronize(a5);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v7, a5, &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    return AppBooleanValue != 0;
  else
    return a4;
}

+ (id)_createClientInfoFromAccount:(id)a3 clientInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  if (objc_msgSend(v5, "ams_isSandboxAccount"))
  {
    objc_msgSend(v10, "setAccountMediaType:", *MEMORY[0x24BE07CA8]);
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
      AMSLogKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Switching to sandbox media type", (uint8_t *)&v29, 0x16u);

    }
  }
  objc_msgSend(v10, "accountMediaType");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_14;
  v16 = (void *)v15;
  if (!v5 || (objc_msgSend(v5, "ams_isSandboxAccount") & 1) != 0)
  {
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v6, "accountMediaType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE07CA8]);

  if (v18)
  {
LABEL_14:
    v19 = objc_alloc(MEMORY[0x24BE08328]);
    objc_msgSend(v6, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:", v20);

    objc_msgSend(v16, "accountMediaType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v10, "setAccountMediaType:", v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE08328], "defaultMediaTypeForCurrentProcess");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccountMediaType:", v22);

    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_opt_class();
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountMediaType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v25;
      v31 = 2114;
      v32 = v26;
      v33 = 2114;
      v34 = v27;
      _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Switching to media type: %{public}@", (uint8_t *)&v29, 0x20u);

    }
    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSUIWebActionRunnerDelegate)actionDelegate
{
  return (AMSUIWebActionRunnerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaders, a3);
}

- (BOOL)bootstrapComplete
{
  return self->_bootstrapComplete;
}

- (void)setBootstrapComplete:(BOOL)a3
{
  self->_bootstrapComplete = a3;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (void)setClientOptions:(id)a3
{
  objc_storeStrong((id *)&self->_clientOptions, a3);
}

- (AMSUIWebJSDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (AMSUIWebFlowController)flowController
{
  return self->_flowController;
}

- (void)setFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_flowController, a3);
}

- (NSString)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_versionNumber, a3);
}

- (BOOL)loadUsingWebKit
{
  return self->_loadUsingWebKit;
}

- (void)setLoadUsingWebKit:(BOOL)a3
{
  self->_loadUsingWebKit = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
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

- (AMSMescalAccountPrimeSession)mescalSession
{
  return self->_mescalSession;
}

- (void)setMescalSession:(id)a3
{
  objc_storeStrong((id *)&self->_mescalSession, a3);
}

- (AMSUIWebPluginLoader)pluginLoader
{
  return self->_pluginLoader;
}

- (void)setPluginLoader:(id)a3
{
  objc_storeStrong((id *)&self->_pluginLoader, a3);
}

- (BOOL)reducedMemoryMode
{
  return self->_reducedMemoryMode;
}

- (void)setReducedMemoryMode:(BOOL)a3
{
  self->_reducedMemoryMode = a3;
}

- (BOOL)signatureResumption
{
  return self->_signatureResumption;
}

- (void)setSignatureResumption:(BOOL)a3
{
  self->_signatureResumption = a3;
}

- (AMSLRUCache)snapshotCache
{
  return self->_snapshotCache;
}

- (void)setSnapshotCache:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotCache, a3);
}

- (AMSURLSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (AMSUIWebPageViewController)webPage
{
  return (AMSUIWebPageViewController *)objc_loadWeakRetained((id *)&self->_webPage);
}

- (void)setWebPage:(id)a3
{
  objc_storeWeak((id *)&self->_webPage, a3);
}

- (NSString)URL
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_URL);
}

- (void)setURL:(id)a3
{
  objc_storeWeak((id *)&self->_URL, a3);
}

- (AMSBagProtocol)backingBag
{
  return self->_backingBag;
}

- (void)setBackingBag:(id)a3
{
  objc_storeStrong((id *)&self->_backingBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingBag, 0);
  objc_destroyWeak((id *)&self->_URL);
  objc_destroyWeak((id *)&self->_webPage);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_pluginLoader, 0);
  objc_storeStrong((id *)&self->_mescalSession, 0);
  objc_storeStrong((id *)&self->_performanceMetricsOverlay, 0);
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_clientOptions, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
