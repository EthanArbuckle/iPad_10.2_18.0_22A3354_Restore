@implementation ACUIAddOtherAccountsViewController

- (id)specifiers
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[2];
  ACUIAddOtherAccountsViewController *v10;

  v10 = self;
  v9[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]))
  {
    v9[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = v9[0];
    v4 = -[ACUIAddOtherAccountsViewController _specifiersForOtherMailAccounts](v10, "_specifiersForOtherMailAccounts");
    objc_msgSend(v3, "addObjectsFromArray:");

    v5 = v9[0];
    v6 = -[ACUIAddOtherAccountsViewController _specifiersForOtherContactsAccounts](v10, "_specifiersForOtherContactsAccounts");
    objc_msgSend(v5, "addObjectsFromArray:");

    v7 = v9[0];
    v8 = -[ACUIAddOtherAccountsViewController _specifiersForOtherCalendarAccounts](v10, "_specifiersForOtherCalendarAccounts");
    objc_msgSend(v7, "addObjectsFromArray:");

    objc_storeStrong((id *)((char *)&v10->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), v9[0]);
    objc_storeStrong(v9, 0);
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&v10->super.super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

- (id)_specifiersForOtherMailAccounts
{
  BOOL v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  ACUIAddAccountDataSource *v10;
  id v11;
  id v12;
  ACUIAddAccountDataSource *v13;
  uint64_t v14;
  ACUIAccountViewProvidersManager *v15;
  ACUIAddAccountDataSource *v16;
  uint64_t v17;
  NSString *v18;
  char v19;
  NSString *v20;
  id v21;
  char v22;
  NSString *v23;
  char v24;
  id v25[2];
  ACUIAddOtherAccountsViewController *v26;

  v26 = self;
  v25[1] = (id)a2;
  v25[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 1;
  v20 = -[ACUIAddAccountViewController filteredDataclass](v26, "filteredDataclass");

  if (v20)
  {
    v18 = -[ACUIAddAccountViewController filteredDataclass](v26, "filteredDataclass");
    v2 = -[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0C8F3D0]);
    v22 = 0;
    v19 = 1;
    if (!v2)
    {
      v23 = -[ACUIAddAccountViewController filteredDataclass](v26, "filteredDataclass");
      v22 = 1;
      v19 = -[NSString isEqualToString:](v23, "isEqualToString:", *MEMORY[0x1E0C8F3F8]);
    }
    v24 = v19 & 1;
    if ((v22 & 1) != 0)

  }
  if ((v24 & 1) != 0)
  {
    v16 = -[ACUIAddAccountViewController addAccountDataSource](v26, "addAccountDataSource");
    v14 = *MEMORY[0x1E0C8F0D0];
    v15 = -[ACUIAddAccountViewController viewProvidersManager](v26, "viewProvidersManager");
    v17 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v16, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v14);

    if (v17)
    {
      v5 = (void *)MEMORY[0x1E0D804E8];
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MAIL_LABEL"));
      v6 = (id)objc_msgSend(v5, "groupSpecifierWithName:");
      objc_msgSend(v25[0], "addObject:");

      v9 = (void *)MEMORY[0x1E0D804E8];
      v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ADD_OTHER_MAIL_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
      v10 = -[ACUIAddAccountViewController addAccountDataSource](v26, "addAccountDataSource");
      v21 = (id)objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v26, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v10, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

      objc_msgSend(v21, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
      objc_msgSend(v21, "setProperty:forKey:", *MEMORY[0x1E0C8F0D0], CFSTR("ACUIAccountType"));
      v13 = -[ACUIAddAccountViewController addAccountDataSource](v26, "addAccountDataSource");
      -[ACUIAddAccountDataSource configureSpecifierForOtherAccountSpecifier:](v13, "configureSpecifierForOtherAccountSpecifier:", v21);

      objc_msgSend(v25[0], "addObject:", v21);
      objc_storeStrong(&v21, 0);
    }
  }
  v4 = v25[0];
  objc_storeStrong(v25, 0);
  return v4;
}

- (id)_specifiersForOtherContactsAccounts
{
  id v3;
  ACUIAddOtherAccountsViewController *v4;
  void *v5;
  ACUIAddAccountDataSource *v6;
  id v7;
  id v8;
  ACUIAddAccountDataSource *v9;
  void *v10;
  ACUIAddAccountDataSource *v11;
  id v12;
  id v13;
  ACUIAddAccountDataSource *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  ACUIAccountViewProvidersManager *v20;
  ACUIAddAccountDataSource *v21;
  BOOL v22;
  uint64_t v23;
  ACUIAccountViewProvidersManager *v24;
  ACUIAddAccountDataSource *v25;
  BOOL v26;
  NSString *v27;
  NSString *v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  char v33;
  id v34[2];
  ACUIAddOtherAccountsViewController *v35;

  v35 = self;
  v34[1] = (id)a2;
  v34[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 1;
  v28 = -[ACUIAddAccountViewController filteredDataclass](v35, "filteredDataclass");

  if (v28)
  {
    v27 = -[ACUIAddAccountViewController filteredDataclass](v35, "filteredDataclass");
    v33 = -[NSString isEqualToString:](v27, "isEqualToString:", *MEMORY[0x1E0C8F388]);

  }
  if ((v33 & 1) != 0)
  {
    v32 = 0;
    v21 = -[ACUIAddAccountViewController addAccountDataSource](v35, "addAccountDataSource");
    v19 = *MEMORY[0x1E0C8F100];
    v20 = -[ACUIAddAccountViewController viewProvidersManager](v35, "viewProvidersManager");
    v22 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v21, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v19) != 0;

    v32 = v22;
    v31 = 0;
    v25 = -[ACUIAddAccountViewController addAccountDataSource](v35, "addAccountDataSource");
    v23 = *MEMORY[0x1E0C8F060];
    v24 = -[ACUIAddAccountViewController viewProvidersManager](v35, "viewProvidersManager");
    v26 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v25, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v23) != 0;

    v31 = v26;
    if (v22 || v31)
    {
      v15 = (void *)MEMORY[0x1E0D804E8];
      v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CONTACTS_LABEL"), &stru_1E9A15E98, CFSTR("Localizable"));
      v16 = (id)objc_msgSend(v15, "groupSpecifierWithName:");
      objc_msgSend(v34[0], "addObject:");

      if (v32)
      {
        v10 = (void *)MEMORY[0x1E0D804E8];
        v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ADD_LDAP_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
        v11 = -[ACUIAddAccountViewController addAccountDataSource](v35, "addAccountDataSource");
        v30 = (id)objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, v35, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v11, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        objc_msgSend(v30, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
        objc_msgSend(v30, "setProperty:forKey:", *MEMORY[0x1E0C8F100], CFSTR("ACUIAccountType"));
        v14 = -[ACUIAddAccountViewController addAccountDataSource](v35, "addAccountDataSource");
        -[ACUIAddAccountDataSource configureSpecifierForOtherAccountSpecifier:](v14, "configureSpecifierForOtherAccountSpecifier:", v30);

        objc_msgSend(v34[0], "addObject:", v30);
        objc_storeStrong(&v30, 0);
      }
      if (v31)
      {
        v5 = (void *)MEMORY[0x1E0D804E8];
        v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_CARDDAV_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
        v4 = v35;
        v6 = -[ACUIAddAccountViewController addAccountDataSource](v35, "addAccountDataSource");
        v29 = (id)objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v4, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v6, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        objc_msgSend(v29, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
        objc_msgSend(v29, "setProperty:forKey:", *MEMORY[0x1E0C8F060], CFSTR("ACUIAccountType"));
        v9 = -[ACUIAddAccountViewController addAccountDataSource](v35, "addAccountDataSource");
        -[ACUIAddAccountDataSource configureSpecifierForOtherAccountSpecifier:](v9, "configureSpecifierForOtherAccountSpecifier:", v29);

        objc_msgSend(v34[0], "addObject:", v29);
        objc_storeStrong(&v29, 0);
      }
    }
  }
  v3 = v34[0];
  objc_storeStrong(v34, 0);
  return v3;
}

- (id)_specifiersForOtherCalendarAccounts
{
  BOOL v2;
  id v4;
  ACUIAddOtherAccountsViewController *v5;
  void *v6;
  ACUIAddAccountDataSource *v7;
  id v8;
  id v9;
  ACUIAddAccountDataSource *v10;
  void *v11;
  ACUIAddAccountDataSource *v12;
  id v13;
  id v14;
  ACUIAddAccountDataSource *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  ACUIAccountViewProvidersManager *v21;
  ACUIAddAccountDataSource *v22;
  BOOL v23;
  uint64_t v24;
  ACUIAccountViewProvidersManager *v25;
  ACUIAddAccountDataSource *v26;
  BOOL v27;
  NSString *v28;
  char v29;
  NSString *v30;
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;
  char v35;
  NSString *v36;
  char v37;
  id v38[2];
  ACUIAddOtherAccountsViewController *v39;

  v39 = self;
  v38[1] = (id)a2;
  v38[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 1;
  v30 = -[ACUIAddAccountViewController filteredDataclass](v39, "filteredDataclass");

  if (v30)
  {
    v28 = -[ACUIAddAccountViewController filteredDataclass](v39, "filteredDataclass");
    v2 = -[NSString isEqualToString:](v28, "isEqualToString:", *MEMORY[0x1E0C8F378]);
    v35 = 0;
    v29 = 1;
    if (!v2)
    {
      v36 = -[ACUIAddAccountViewController filteredDataclass](v39, "filteredDataclass");
      v35 = 1;
      v29 = -[NSString isEqualToString:](v36, "isEqualToString:", *MEMORY[0x1E0C8F400]);
    }
    v37 = v29 & 1;
    if ((v35 & 1) != 0)

  }
  if ((v37 & 1) != 0)
  {
    v34 = 0;
    v22 = -[ACUIAddAccountViewController addAccountDataSource](v39, "addAccountDataSource");
    v20 = *MEMORY[0x1E0C8F058];
    v21 = -[ACUIAddAccountViewController viewProvidersManager](v39, "viewProvidersManager");
    v23 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v22, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v20) != 0;

    v34 = v23;
    v33 = 0;
    v26 = -[ACUIAddAccountViewController addAccountDataSource](v39, "addAccountDataSource");
    v24 = *MEMORY[0x1E0C8F140];
    v25 = -[ACUIAddAccountViewController viewProvidersManager](v39, "viewProvidersManager");
    v27 = -[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v26, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v24) != 0;

    v33 = v27;
    if (v23 || v33)
    {
      v16 = (void *)MEMORY[0x1E0D804E8];
      v19 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CALENDARS_LABEL"), &stru_1E9A15E98, CFSTR("Localizable"));
      v17 = (id)objc_msgSend(v16, "groupSpecifierWithName:");
      objc_msgSend(v38[0], "addObject:");

      if (v34)
      {
        v11 = (void *)MEMORY[0x1E0D804E8];
        v14 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_CALDAV_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
        v12 = -[ACUIAddAccountViewController addAccountDataSource](v39, "addAccountDataSource");
        v32 = (id)objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, v39, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v12, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        objc_msgSend(v32, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
        objc_msgSend(v32, "setProperty:forKey:", *MEMORY[0x1E0C8F058], CFSTR("ACUIAccountType"));
        v15 = -[ACUIAddAccountViewController addAccountDataSource](v39, "addAccountDataSource");
        -[ACUIAddAccountDataSource configureSpecifierForOtherAccountSpecifier:](v15, "configureSpecifierForOtherAccountSpecifier:", v32);

        objc_msgSend(v38[0], "addObject:", v32);
        objc_storeStrong(&v32, 0);
      }
      if (v33)
      {
        v6 = (void *)MEMORY[0x1E0D804E8];
        v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ADD_SUBCAL_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
        v5 = v39;
        v7 = -[ACUIAddAccountViewController addAccountDataSource](v39, "addAccountDataSource");
        v31 = (id)objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v5, 0, 0, -[ACUIAddAccountDataSource viewControllerClassForCreatingOtherAccountTypes](v7, "viewControllerClassForCreatingOtherAccountTypes"), 1, 0);

        objc_msgSend(v31, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
        objc_msgSend(v31, "setProperty:forKey:", *MEMORY[0x1E0C8F140], CFSTR("ACUIAccountType"));
        v10 = -[ACUIAddAccountViewController addAccountDataSource](v39, "addAccountDataSource");
        -[ACUIAddAccountDataSource configureSpecifierForOtherAccountSpecifier:](v10, "configureSpecifierForOtherAccountSpecifier:", v31);

        objc_msgSend(v38[0], "addObject:", v31);
        objc_storeStrong(&v31, 0);
      }
    }
  }
  v4 = v38[0];
  objc_storeStrong(v38, 0);
  return v4;
}

@end
