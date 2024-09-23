@implementation SKAccountPageSpecifierProvider

- (SKAccountPageSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  SKAccountPageSpecifierProvider *v6;
  SKAccountPageSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKAccountPageSpecifierProvider;
  v6 = -[SKAccountPageSpecifierProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  specifiers = self->_specifiers;
  if (specifiers)
    return specifiers;
  -[SKAccountPageSpecifierProvider _storeAccount](self, "_storeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPLEID_ACCOUNT_PAGE_CELL_TITLE"), &stru_1E5B2D460, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setControllerLoadAction:", sel__accountPageSpecifierWasTapped_);
  objc_msgSend(v8, "setIdentifier:", CFSTR("STORE_SERVICE"));
  objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D808D0]);
  objc_msgSend(v8, "setProperty:forKey:", CFSTR("com.apple.AppStore"), *MEMORY[0x1E0D808C0]);
  if (!-[SKAccountPageSpecifierProvider _isSingleIdentity](self, "_isSingleIdentity"))
  {
    objc_msgSend(v8, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
    v12 = *MEMORY[0x1E0DC53D8];
    if (!IsAccessibilityCategory)
      v12 = 58.0;
    objc_msgSend(v9, "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setProperty:forKey:", v13, *MEMORY[0x1E0D80938]);
    objc_msgSend(v8, "setProperty:forKey:", v7, *MEMORY[0x1E0D80978]);
    -[SKAccountPageSpecifierProvider _storeAccount](self, "_storeAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aa_formattedUsername");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v15, *MEMORY[0x1E0D80950]);

  }
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
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

  -[SKAccountPageSpecifierProvider _appleAccount](self, "_appleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAccountPageSpecifierProvider _storeAccount](self, "_storeAccount");
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
        v12 = &unk_1E5B4A230;
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
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAIDAServiceTypeCloudSymbolLoc_ptr;
  v11 = getAIDAServiceTypeCloudSymbolLoc_ptr;
  if (!getAIDAServiceTypeCloudSymbolLoc_ptr)
  {
    v4 = (void *)AppleIDSSOAuthenticationLibrary();
    v3 = dlsym(v4, "AIDAServiceTypeCloud");
    v9[3] = (uint64_t)v3;
    getAIDAServiceTypeCloudSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)-[SKAccountPageSpecifierProvider _appleAccount].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_storeAccount
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAIDAServiceTypeStoreSymbolLoc_ptr;
  v11 = getAIDAServiceTypeStoreSymbolLoc_ptr;
  if (!getAIDAServiceTypeStoreSymbolLoc_ptr)
  {
    v4 = (void *)AppleIDSSOAuthenticationLibrary();
    v3 = dlsym(v4, "AIDAServiceTypeStore");
    v9[3] = (uint64_t)v3;
    getAIDAServiceTypeStoreSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)-[SKAccountPageSpecifierProvider _appleAccount].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accountPageSpecifierWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  SKAccountPageSpecifierProvider *v37;
  id v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v4 = a3;
  -[SKAccountPageSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierProvider:willBeginLoadingSpecifier:", self, v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT"), &stru_1E5B2D460, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke;
  v35[3] = &unk_1E5B279A0;
  v11 = v6;
  v36 = v11;
  v37 = self;
  v12 = v4;
  v38 = v12;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v14 = (void *)getAMSBiometricsClass_softClass;
  v43 = getAMSBiometricsClass_softClass;
  if (!getAMSBiometricsClass_softClass)
  {
    v39[0] = v10;
    v39[1] = 3221225472;
    v39[2] = __getAMSBiometricsClass_block_invoke;
    v39[3] = &unk_1E5B26828;
    v39[4] = &v40;
    __getAMSBiometricsClass_block_invoke((uint64_t)v39);
    v14 = (void *)v41[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v40, 8);
  -[SKAccountPageSpecifierProvider _storeAccount](self, "_storeAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v15, "isAvailableForAccount:", v16);

  if ((v15 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PASSWORD_SETTINGS"), &stru_1E5B2D460, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_6;
    v33[3] = &unk_1E5B27950;
    v33[4] = self;
    v34 = v12;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v19);

  }
  v20 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("VIEW_ACCOUNT"), &stru_1E5B2D460, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_7;
  v31[3] = &unk_1E5B27950;
  v31[4] = self;
  v22 = v12;
  v32 = v22;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v23);

  v24 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5B2D460, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_8;
  v29[3] = &unk_1E5B27950;
  v29[4] = self;
  v30 = v22;
  v26 = v22;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v27);

  -[SKAccountPageSpecifierProvider delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "specifierProvider:showViewController:", self, v7);

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v2 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", CFSTR("ARE_YOU_SURE"), &stru_1E5B2D460, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", CFSTR("CONFIRM_BLURB"), &stru_1E5B2D460, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5B2D460, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_2;
  v22[3] = &unk_1E5B27950;
  v9 = *(void **)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 40);
  v23 = v9;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:value:table:", CFSTR("SIGN_OUT"), &stru_1E5B2D460, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  v17 = 3221225472;
  v18 = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_3;
  v19 = &unk_1E5B27950;
  v13 = *(void **)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = v13;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 2, &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v14, v16, v17, v18, v19, v20);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "specifierProvider:showViewController:", *(_QWORD *)(a1 + 40), v5);

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_storeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActive:", 0);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_saveAccount:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_4;
  v6[3] = &unk_1E5B27978;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "addFinishBlock:", v6);

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_5;
  v2[3] = &unk_1E5B27350;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v4 = (void *)getAMSUIPasswordSettingsViewControllerClass_softClass;
  v16 = getAMSUIPasswordSettingsViewControllerClass_softClass;
  if (!getAMSUIPasswordSettingsViewControllerClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getAMSUIPasswordSettingsViewControllerClass_block_invoke;
    v12[3] = &unk_1E5B26828;
    v12[4] = &v13;
    __getAMSUIPasswordSettingsViewControllerClass_block_invoke((uint64_t)v12);
    v4 = (void *)v14[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v13, 8);
  v6 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "_storeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAccount:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "specifierProvider:showViewController:", *(_QWORD *)(a1 + 32), v9);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_viewAccountPageSpecifierWasTapped:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__SKAccountPageSpecifierProvider__accountPageSpecifierWasTapped___block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_viewAccountPageSpecifierWasTapped:(id)a3
{
  void *v4;
  void *v5;
  SKAccountPageViewController *v6;

  v6 = -[SKAccountPageViewController initWithAccountURL:]([SKAccountPageViewController alloc], "initWithAccountURL:", 0);
  -[SKAccountPageSpecifierProvider _storeAccount](self, "_storeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAccountPageViewController setAccount:](v6, "setAccount:", v4);

  -[SKAccountPageSpecifierProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierProvider:showViewController:", self, v6);

}

- (BOOL)handleURL:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "valueForKey:", CFSTR("path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("VIEW_ACCOUNT"));
  if (v5)
  {
    -[SKAccountPageSpecifierProvider specifiers](self, "specifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKAccountPageSpecifierProvider delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specifierProvider:willBeginLoadingSpecifier:", self, v7);

    -[SKAccountPageSpecifierProvider _viewAccountPageSpecifierWasTapped:](self, "_viewAccountPageSpecifierWasTapped:", v7);
    -[SKAccountPageSpecifierProvider delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "specifierProvider:didFinishLoadingSpecifier:", self, v7);

  }
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

- (uint64_t)_appleAccount
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getAMSBiometricsClass_block_invoke_cold_1(v0);
}

@end
