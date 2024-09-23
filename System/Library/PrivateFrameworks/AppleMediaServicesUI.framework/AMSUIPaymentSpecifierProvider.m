@implementation AMSUIPaymentSpecifierProvider

- (void)setPaymentSummaryDescription:(id)a3
{
  NSString *v4;
  NSString *paymentSummaryDescription;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_paymentSummaryDescription, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    paymentSummaryDescription = self->_paymentSummaryDescription;
    self->_paymentSummaryDescription = v4;

    -[AMSUIPaymentSpecifierProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSpecifierForProvider:identifier:", self, CFSTR("PAYMENT_AND_SHIPPING"));

  }
}

- (AMSUIPaymentSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  AMSUIPaymentSpecifierProvider *v6;
  AMSUIPaymentSpecifierProvider *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIPaymentSpecifierProvider;
  v6 = -[AMSUIPaymentSpecifierProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    objc_initWeak(&location, v7);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke;
    v9[3] = &unk_24CB4FE48;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "addAccountChangeObserver:handler:", v7, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE buf[24];
  void *v54;
  id v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = 0x24BE08000uLL;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = objc_opt_class();
    v14 = v13;
    if (v11)
    {
      AMSLogKey();
      a3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v14, a3);
    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: "), v13);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_INFO, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] handler called", buf, 0xCu);
    if (v11)
    {

      v15 = a3;
    }

  }
  if (WeakRetained)
  {
    getAIDAServiceTypeStore_0();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    getAIDAServiceTypeStore_0();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v49 = v5;
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v47 = v6;
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = objc_opt_class();
      v25 = v24;
      if (v22)
      {
        AMSLogKey();
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v6);
      }
      else
      {
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      v54 = v28;
      _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEBUG, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] called with old account: %{public}@, new account: %{public}@", buf, 0x20u);
      if (v22)
      {

        v26 = v6;
      }

      v6 = v47;
      v8 = 0x24BE08000uLL;
    }

    v29 = objc_msgSend((id)objc_opt_class(), "_accountsChangedFromAccount:toAccount:", v17, v19);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v30, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v48 = v19;
      v32 = v17;
      v33 = v6;
      AMSLogKey();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = objc_opt_class();
      v37 = v36;
      if (v34)
      {
        AMSLogKey();
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: [%@] "), v37, v8);
      }
      else
      {
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@: "), v36);
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("false");
      if (v29)
        v39 = CFSTR("true");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_211102000, v31, OS_LOG_TYPE_DEBUG, "%{public}@didChangeAccounts: %{public}@", buf, 0x16u);
      if (v34)
      {

        v38 = (void *)v8;
      }

      v6 = v33;
      v17 = v32;
      v19 = v48;
    }

    if (v29)
    {
      objc_msgSend(WeakRetained, "specifiers");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v40, "copy");

      objc_msgSend(WeakRetained, "setSpecifiers:", 0);
      v42 = MEMORY[0x24BDAC760];
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke_28;
      v50[3] = &unk_24CB4F4C0;
      v51 = WeakRetained;
      v52 = v41;
      v43 = v50;
      v44 = v41;
      AMSLogKey();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v42;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_4;
      v54 = &unk_24CB4F3C0;
      v55 = v45;
      v56 = v43;
      v46 = v45;
      dispatch_async(MEMORY[0x24BDAC9B8], buf);

    }
    v5 = v49;
  }

}

void __56__AMSUIPaymentSpecifierProvider_initWithAccountManager___block_invoke_28(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = objc_opt_class();
    v8 = v7;
    if (v5)
    {
      AMSLogKey();
      v1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] "), v8, v1);
    }
    else
    {
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: "), v7);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v16 = v9;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = CFSTR("false");
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling -[AAUISpecifierProviderDelegate reloadSpecifiersForProvider:oldSpecifiers:animated:] on delegate: %{public}@ with provider: %{public}@, oldSpecifiers: %{public}@, animated: %{public}@", buf, 0x34u);

    if (v5)
    {

      v9 = (void *)v1;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadSpecifiersForProvider:oldSpecifiers:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AMSUIPaymentSpecifierProvider accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAccountChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSUIPaymentSpecifierProvider;
  -[AMSUIPaymentSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AMSUILocalizedStringFromBundle(CFSTR("APPLEID_PAYMENT_CELL_TITLE"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__paymentSummaryDescriptionForSpecifier_, 0, 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setControllerLoadAction:", sel__loadControllerForSpecifier_);
    objc_msgSend(v7, "setIdentifier:", CFSTR("PAYMENT_AND_SHIPPING"));
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, 0);
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  AMSUIAuthenticateTask *v9;
  void *v10;
  void *v11;
  AMSUIAuthenticateTask *v12;

  v7 = a5;
  v8 = a4;
  v9 = [AMSUIAuthenticateTask alloc];
  -[AMSUIPaymentSpecifierProvider _findViewController](self, "_findViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AMSUIAuthenticateTask initWithRequest:presentingViewController:](v9, "initWithRequest:presentingViewController:", v8, v10);

  -[AMSAuthenticateTask performAuthentication](v12, "performAuthentication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFinishBlock:", v7);

}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  AMSUIAlertDialogTask *v9;
  void *v10;
  void *v11;
  AMSUIAlertDialogTask *v12;

  v7 = a5;
  v8 = a4;
  v9 = [AMSUIAlertDialogTask alloc];
  -[AMSUIPaymentSpecifierProvider _findViewController](self, "_findViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v9, "initWithRequest:presentingViewController:", v8, v10);

  -[AMSUIAlertDialogTask present](v12, "present");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFinishBlock:", v7);

}

+ (BOOL)_accountsChangedFromAccount:(id)a3 toAccount:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  BOOL v15;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6)
      v9 = v5 == 0;
    else
      v9 = 0;
    if (v6)
      v10 = 1;
    else
      v10 = v5 == 0;
    LOBYTE(v8) = 1;
    if (v10 && !v9)
    {
      objc_msgSend((id)v5, "ams_DSID");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ams_DSID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 | v12)
      {
        if (v12)
          v14 = v11 == 0;
        else
          v14 = 0;
        if (v12)
          v15 = 1;
        else
          v15 = v11 == 0;
        if (v15 && !v14)
          v8 = objc_msgSend((id)v11, "isEqualToNumber:", v12) ^ 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_findViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_grandSlamAccount
{
  ACAccount *grandSlamAccount;
  ACAccount **p_grandSlamAccount;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  ACAccount *v28;
  void *v29;
  NSObject *v30;
  ACAccount *v31;
  void *v32;
  id v33;
  void *v34;
  id v36;
  _BYTE buf[24];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  p_grandSlamAccount = &self->_grandSlamAccount;
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    -[AMSUIPaymentSpecifierProvider accountManager](self, "accountManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = (_QWORD *)getAIDAServiceTypeCloudSymbolLoc_ptr_1;
    v38 = getAIDAServiceTypeCloudSymbolLoc_ptr_1;
    if (!getAIDAServiceTypeCloudSymbolLoc_ptr_1)
    {
      v9 = (void *)AppleIDSSOAuthenticationLibrary_1();
      v8 = dlsym(v9, "AIDAServiceTypeCloud");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getAIDAServiceTypeCloudSymbolLoc_ptr_1 = (uint64_t)v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
      getAIDAServiceTypeCloud_cold_1();
    objc_msgSend(v7, "objectForKeyedSubscript:", *v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
        v13 = (void *)objc_opt_class();
        v14 = v13;
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching grandslam account from iCloud account", buf, 0x16u);

      }
      objc_msgSend(v6, "aida_accountForiCloudAccount:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *p_grandSlamAccount;
      *p_grandSlamAccount = (ACAccount *)v16;
    }
    else
    {
      objc_msgSend(v5, "accounts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      getAIDAServiceTypeStore_0();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
          v22 = (void *)objc_opt_class();
          v36 = v22;
          AMSLogKey();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v23;
          _os_log_impl(&dword_211102000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching grandslam account from store account", buf, 0x16u);

        }
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE060E0]), "initWithAccountStore:", v6);
        getAIDAServiceTypeStore_0();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "altDSIDForAccount:service:", v17, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "aida_accountForAltDSID:", v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *p_grandSlamAccount;
        *p_grandSlamAccount = (ACAccount *)v27;

      }
    }

    if (*p_grandSlamAccount)
    {
      objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "ams_iTunesAccountForAccount:", *p_grandSlamAccount);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (ACAccount *)v30;
      if (!v30)
        v31 = *p_grandSlamAccount;
      objc_storeStrong((id *)p_grandSlamAccount, v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_opt_class();
        v33 = v32;
        AMSLogKey();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v34;
        _os_log_impl(&dword_211102000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not fetch GrandSlam Account, we're destined for failure!", buf, 0x16u);

      }
    }

    grandSlamAccount = *p_grandSlamAccount;
  }
  return grandSlamAccount;
}

- (void)_loadControllerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  AMSUIPaymentSpecifierProvider *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  AMSUIPaymentSpecifierProvider *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIPaymentSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierProvider:willBeginLoadingSpecifier:", self, v4);

  +[AMSUIWebViewController createBagForSubProfile](AMSUIWebViewController, "createBagForSubProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForKey:", CFSTR("paymentsAndShippingUrl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke;
  v26[3] = &unk_24CB4F160;
  v10 = v6;
  v27 = v10;
  v28 = self;
  objc_msgSend(v8, "thenWithBlock:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AMSSetLogKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    v15 = v10;
    v16 = v8;
    v17 = (void *)objc_opt_class();
    v21 = v17;
    AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v17;
    v8 = v16;
    v10 = v15;
    v9 = MEMORY[0x24BDAC760];
    v31 = 2114;
    v32 = v18;
    _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading payments and shipment", buf, 0x16u);

  }
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_57;
  v22[3] = &unk_24CB505F8;
  v23 = v12;
  v24 = self;
  v25 = v4;
  v19 = v4;
  v20 = v12;
  objc_msgSend(v11, "addFinishBlock:", v22);

}

id __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE083E8]), "initWithBag:", a1[2].i64[0]);
  objc_msgSend(v4, "typeForURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2;
  v11[3] = &unk_24CB505D0;
  v10 = a1[2];
  v6 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v13 = v3;
  v7 = v3;
  objc_msgSend(v5, "thenWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  AMSUIDynamicViewController *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a2;
  objc_msgSend(a1[4], "_grandSlamAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE08340]);
  v6 = objc_msgSend(v3, "integerValue");
  if (v6)
  {
    if (v6 == 2)
    {
      v7 = -[AMSUIDynamicViewController initWithBag:URL:]([AMSUIDynamicViewController alloc], "initWithBag:URL:", a1[5], a1[6]);
      -[AMSUIDynamicViewController setAccount:](v7, "setAccount:", v4);
      objc_msgSend(v5, "finishWithResult:", v7);
    }
    else
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x2050000000;
      v10 = (void *)getSKAccountPageViewControllerClass_softClass;
      v28 = getSKAccountPageViewControllerClass_softClass;
      v11 = MEMORY[0x24BDAC760];
      if (!getSKAccountPageViewControllerClass_softClass)
      {
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __getSKAccountPageViewControllerClass_block_invoke;
        v24[3] = &unk_24CB4F3E8;
        v24[4] = &v25;
        __getSKAccountPageViewControllerClass_block_invoke((uint64_t)v24);
        v10 = (void *)v26[3];
      }
      v12 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v25, 8);
      v13 = (void *)objc_msgSend([v12 alloc], "initWithAccountURL:", a1[6]);
      objc_msgSend(v13, "setAccount:", v4);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_5;
      v15[3] = &unk_24CB4F4C0;
      v16 = v5;
      v17 = v13;
      v7 = v13;
      -[AMSUIDynamicViewController loadWithCompletionBlock:](v7, "loadWithCompletionBlock:", v15);

    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_3;
    block[3] = &unk_24CB4FE70;
    v19 = a1[5];
    v8 = v4;
    v9 = a1[4];
    v20 = v8;
    v21 = v9;
    v22 = a1[6];
    v23 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v5;
}

void __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_3(uint64_t a1)
{
  AMSUIWebViewController *v2;
  void *v3;
  void *v4;
  AMSUIWebViewController *v5;
  _QWORD v6[4];
  id v7;
  AMSUIWebViewController *v8;

  v2 = -[AMSUIWebViewController initWithBag:account:clientInfo:]([AMSUIWebViewController alloc], "initWithBag:account:clientInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  +[AMSUIWebAppearance tableViewAppearance](AMSUIWebAppearance, "tableViewAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebViewController setAppearance:](v2, "setAppearance:", v3);

  -[AMSUIWebViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 48));
  -[AMSUIWebViewController loadURL:](v2, "loadURL:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_4;
  v6[3] = &unk_24CB4FA28;
  v7 = *(id *)(a1 + 64);
  v8 = v2;
  v5 = v2;
  objc_msgSend(v4, "addFinishBlock:", v6);

}

uint64_t __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "finishWithError:");
  else
    return objc_msgSend(v4, "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2_58;
  block[3] = &unk_24CB4FE70;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v7 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = v5;
  v15 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __61__AMSUIPaymentSpecifierProvider__loadControllerForSpecifier___block_invoke_2_58(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (id)AMSSetLogKey();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v18 = 138543874;
      *(_QWORD *)&v18[4] = v7;
      *(_WORD *)&v18[12] = 2114;
      *(_QWORD *)&v18[14] = v9;
      *(_WORD *)&v18[22] = 2114;
      v19 = v10;
      v11 = "%{public}@: [%{public}@] Failed to load payments and shipment. %{public}@";
      v12 = v6;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_10:
      _os_log_impl(&dword_211102000, v12, v13, v11, v18, v14);

    }
  }
  else
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
      v15 = (void *)objc_opt_class();
      v8 = v15;
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = v15;
      *(_WORD *)&v18[12] = 2114;
      *(_QWORD *)&v18[14] = v9;
      v11 = "%{public}@: [%{public}@] Presenting payments and shipment";
      v12 = v6;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
      goto LABEL_10;
    }
  }

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "specifierProvider:showViewController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(*(id *)(a1 + 48), "delegate", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)paymentSummaryDescription
{
  return self->_paymentSummaryDescription;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_paymentSummaryDescription, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
}

@end
