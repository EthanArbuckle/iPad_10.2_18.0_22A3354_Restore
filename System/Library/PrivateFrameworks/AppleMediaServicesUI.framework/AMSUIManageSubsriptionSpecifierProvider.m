@implementation AMSUIManageSubsriptionSpecifierProvider

- (AMSUIManageSubsriptionSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  AMSUIManageSubsriptionSpecifierProvider *v6;
  AMSUIManageSubsriptionSpecifierProvider *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIManageSubsriptionSpecifierProvider;
  v6 = -[AMSUIManageSubsriptionSpecifierProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    objc_initWeak(&location, v7);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke;
    v9[3] = &unk_24CB4FE48;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "addAccountChangeObserver:handler:", v7, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _BYTE buf[24];
  void *v55;
  id v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    v13 = v12;
    if (v10)
    {
      AMSLogKey();
      a3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, a3);
    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_INFO, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] handler called", buf, 0xCu);
    if (v10)
    {

      v14 = a3;
    }

  }
  if (WeakRetained)
  {
    getAIDAServiceTypeStore();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    getAIDAServiceTypeStore();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    v50 = v6;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v48 = v5;
      AMSLogKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x24BDD17C8];
      v23 = objc_opt_class();
      v24 = v23;
      if (v21)
      {
        AMSLogKey();
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v6);
      }
      else
      {
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2114;
      v55 = v27;
      _os_log_impl(&dword_211102000, v20, OS_LOG_TYPE_DEBUG, "%{public}@-[AIDAAccountManager addAccountChangeObserver:handler:] called with old account: %{public}@, new account: %{public}@", buf, 0x20u);
      if (v21)
      {

        v25 = v6;
      }

      v5 = v48;
      v6 = v50;
    }

    if ((v18 != 0) != (v16 != 0))
    {
      v28 = 1;
    }
    else
    {
      objc_msgSend(v16, "ams_DSID");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ams_DSID");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v29 && v30)
      {
        if (v18)
          v28 = objc_msgSend((id)v29, "isEqualToNumber:", v30) ^ 1;
        else
          v28 = 0;
      }
      else
      {
        v28 = (v29 | v30) != 0;
      }

    }
    objc_msgSend(MEMORY[0x24BE081D8], "sharedAccountsConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v32, "OSLogObject");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v49 = v16;
      v34 = v5;
      AMSLogKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD17C8];
      v37 = objc_opt_class();
      v38 = v37;
      if (v35)
      {
        AMSLogKey();
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: [%@] "), v38, v6);
      }
      else
      {
        objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: "), v37);
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("false");
      if (v28)
        v40 = CFSTR("true");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v40;
      _os_log_impl(&dword_211102000, v33, OS_LOG_TYPE_DEBUG, "%{public}@didChangeAccounts: %{public}@", buf, 0x16u);
      if (v35)
      {

        v39 = v6;
      }

      v5 = v34;
      v16 = v49;
      v6 = v50;
    }

    if (v28)
    {
      objc_msgSend(WeakRetained, "specifiers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "copy");

      objc_msgSend(WeakRetained, "setSpecifiers:", 0);
      v43 = MEMORY[0x24BDAC760];
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke_30;
      v51[3] = &unk_24CB4F4C0;
      v52 = WeakRetained;
      v53 = v42;
      v44 = v51;
      v45 = v42;
      AMSLogKey();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v43;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_3;
      v55 = &unk_24CB4F3C0;
      v56 = v46;
      v57 = v44;
      v47 = v46;
      dispatch_async(MEMORY[0x24BDAC9B8], buf);

    }
  }

}

void __66__AMSUIManageSubsriptionSpecifierProvider_initWithAccountManager___block_invoke_30(uint64_t a1)
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

  -[AMSUIManageSubsriptionSpecifierProvider accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAccountChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AMSUIManageSubsriptionSpecifierProvider;
  -[AMSUIManageSubsriptionSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (specifiers)
    return specifiers;
  -[AMSUIManageSubsriptionSpecifierProvider _storeAccount](self, "_storeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v19 = self->_specifiers;
    self->_specifiers = (NSArray *)MEMORY[0x24BDBD1A8];

    specifiers = self->_specifiers;
    return specifiers;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("APPLEID_SUBSCRIPTIONS_CELL_TITLE"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setControllerLoadAction:", sel__subscriptionsSpecifierWasTapped_);
  objc_msgSend(v8, "setIdentifier:", CFSTR("SUBSCRIPTIONS"));
  if (!-[AMSUIManageSubsriptionSpecifierProvider _isSingleIdentity](self, "_isSingleIdentity"))
  {
    objc_msgSend(v8, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
    v12 = *MEMORY[0x24BEBE770];
    if (!IsAccessibilityCategory)
      v12 = 58.0;
    objc_msgSend(v9, "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setProperty:forKey:", v13, *MEMORY[0x24BE75D10]);
    objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x24BE75D50]);
    -[AMSUIManageSubsriptionSpecifierProvider _storeAccount](self, "_storeAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aa_formattedUsername");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v15, *MEMORY[0x24BE75D28]);

  }
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v17 = self->_specifiers;
  self->_specifiers = v16;

  v18 = self->_specifiers;
  return v18;
}

- (BOOL)_isSingleIdentity
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[AMSUIManageSubsriptionSpecifierProvider _appleAccount](self, "_appleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIManageSubsriptionSpecifierProvider _storeAccount](self, "_storeAccount");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 1;
  if (v3 && v4)
  {
    objc_msgSend(v3, "ams_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
    {
      v6 = objc_msgSend(v7, "isEqualToString:", v8);
    }
    else
    {
      objc_msgSend(v3, "ams_DSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ams_DSID");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = &unk_24CB8C0E0;
      v6 = objc_msgSend(v9, "isEqualToNumber:", v12);

    }
  }

  return v6;
}

- (id)_appleAccount
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getAIDAServiceTypeCloudSymbolLoc_ptr_0;
  v10 = getAIDAServiceTypeCloudSymbolLoc_ptr_0;
  if (!getAIDAServiceTypeCloudSymbolLoc_ptr_0)
  {
    v4 = (void *)AppleIDSSOAuthenticationLibrary_0();
    v3 = dlsym(v4, "AIDAServiceTypeCloud");
    v8[3] = (uint64_t)v3;
    getAIDAServiceTypeCloudSymbolLoc_ptr_0 = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    getAIDAServiceTypeCloud_cold_1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_storeAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getAIDAServiceTypeStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_subscriptionsSpecifierWasTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AMSUIWebViewController *v13;
  void *v14;
  AMSUIWebViewController *v15;
  void *v16;
  void *v17;
  id v18;
  AMSUIWebViewController *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  AMSUIManageSubsriptionSpecifierProvider *v24;
  AMSUIWebViewController *v25;
  id v26;

  v21 = a3;
  -[AMSUIManageSubsriptionSpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifierProvider:willBeginLoadingSpecifier:", self, v21);

  v5 = objc_alloc_init(MEMORY[0x24BE08298]);
  +[AMSUISubscriptionsViewController bagKeySet](AMSUISubscriptionsViewController, "bagKeySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionBagKeySet:", v6);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://apps.mzstatic.com/content/54a1317a0ad442d3965d64ef6bfaae1c/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBagKey:valueType:defaultValue:", CFSTR("manageSubscriptionsV2Url"), 5, v7);

  +[AMSUISubscriptionsViewController bagSubProfile](AMSUISubscriptionsViewController, "bagSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUISubscriptionsViewController bagSubProfileVersion](AMSUISubscriptionsViewController, "bagSubProfileVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08060], "registerBagKeySet:forProfile:profileVersion:", v5, v8, v9);
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AMSSetLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLForKey:", CFSTR("manageSubscriptionsV2Url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [AMSUIWebViewController alloc];
  -[AMSUIManageSubsriptionSpecifierProvider _storeAccount](self, "_storeAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSUIWebViewController initWithBag:account:clientInfo:](v13, "initWithBag:account:clientInfo:", v10, v14, 0);

  +[AMSUIWebAppearance tableViewAppearance](AMSUIWebAppearance, "tableViewAppearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebViewController setAppearance:](v15, "setAppearance:", v16);

  -[AMSUIWebViewController setDelegate:](v15, "setDelegate:", self);
  -[AMSUIWebViewController loadBagValue:](v15, "loadBagValue:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke;
  v22[3] = &unk_24CB4FE98;
  v23 = v11;
  v24 = self;
  v25 = v15;
  v26 = v21;
  v18 = v21;
  v19 = v15;
  v20 = v11;
  objc_msgSend(v17, "addFinishBlock:", v22);

}

void __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke_2;
  block[3] = &unk_24CB4FE70;
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v5 = *(void **)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = *(id *)(a1 + 56);
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__AMSUIManageSubsriptionSpecifierProvider__subscriptionsSpecifierWasTapped___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
      v7 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v10 = "%{public}@: [%{public}@] Failed to load manage subscription. %{public}@";
      v11 = v6;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_10:
      _os_log_impl(&dword_211102000, v11, v12, v10, (uint8_t *)&v17, v13);

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
      v14 = objc_opt_class();
      AMSLogKey();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v8;
      v10 = "%{public}@: [%{public}@] Presenting manage subs";
      v11 = v6;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
      goto LABEL_10;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "specifierProvider:showViewController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

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
  -[AMSUIManageSubsriptionSpecifierProvider _findViewController](self, "_findViewController");
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
  -[AMSUIManageSubsriptionSpecifierProvider _findViewController](self, "_findViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v9, "initWithRequest:presentingViewController:", v8, v10);

  -[AMSUIAlertDialogTask present](v12, "present");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFinishBlock:", v7);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (PSSpecifier)activelyLoadingSpecifier
{
  return self->_activelyLoadingSpecifier;
}

- (void)setActivelyLoadingSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_activelyLoadingSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activelyLoadingSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
