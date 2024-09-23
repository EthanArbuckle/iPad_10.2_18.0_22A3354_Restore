@implementation UIViewController(AccountManagerExtras)

- (uint64_t)safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:()AccountManagerExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D1D8]), "initWithPolicyChangeHandler:", 0);
  v23[0] = CFSTR("com.apple.mobilesafari");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestPoliciesForBundleIdentifiers:withError:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applicationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isRestricted"))
  {

  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.mobilesafari"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (!v11)
    {
      v20 = 1;
      goto LABEL_5;
    }
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__UIViewController_AccountManagerExtras__safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary___block_invoke;
  v22[3] = &unk_1E4AC0010;
  v22[4] = a1;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

  objc_msgSend(a1, "presentViewController:animated:completion:", v16, 1, 0);
  v20 = 0;
LABEL_5:

  return v20;
}

@end
