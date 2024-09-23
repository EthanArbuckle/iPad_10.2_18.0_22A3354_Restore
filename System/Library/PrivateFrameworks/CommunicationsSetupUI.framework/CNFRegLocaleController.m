@implementation CNFRegLocaleController

- (CNFRegLocaleController)initWithRegController:(id)a3
{
  id v4;
  CNFRegLocaleController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNFRegLocaleController;
  v5 = -[CNFRegFirstRunController initWithRegController:](&v19, sel_initWithRegController_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE30370], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isLoaded"))
    {
      objc_msgSend(v6, "regions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegLocaleController setRegionData:](v5, "setRegionData:", v7);

    }
    else
    {
      -[CNFRegLocaleController _loadRegionsIfNecessary](v5, "_loadRegionsIfNecessary");
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "appleIDAccounts", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "profileValidationStatus") != 3)
          {
            -[CNFRegFirstRunController setAccount:](v5, "setAccount:", v13);
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_15:

  }
  return v5;
}

- (void)dismiss
{
  void *v3;
  void (**v4)(id, _QWORD);

  -[CNFRegLocaleController dismissModalViewControllerWithTransition:](self, "dismissModalViewControllerWithTransition:", 7);
  -[CNFRegLocaleController completionBlock](self, "completionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNFRegLocaleController completionBlock](self, "completionBlock");
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
}

- (id)specifierList
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    CNFRegLoadSpecifiersFromPlist(self, CFSTR("CNFRegLocale"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_LOCALE_DESCRIPTION_GROUP_ID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isNaturallyRTL"))
      v8 = 2;
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v9, *MEMORY[0x24BE75860]);

    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "_isNaturallyRTL"))
      v11 = 2;
    else
      v11 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v12, *MEMORY[0x24BE75A28]);

    -[CNFRegLocaleController _buildSpecifierCache:](self, "_buildSpecifierCache:", v5);
    objc_msgSend(v5, "removeObjectsInArray:", self->_phoneNumberSpecifiers);
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)controllerForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("FACETIME_LOCALE_COUNTRY_SELECT_ID")),
        v6,
        !v7)
    || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CNFRegLocaleController showCountryPicker](self, "showCountryPicker"),
        !v8))
  {
    v10.receiver = self;
    v10.super_class = (Class)CNFRegLocaleController;
    -[CNFRegLocaleController controllerForSpecifier:](&v10, sel_controllerForSpecifier_, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)logName
{
  return CFSTR("Locale");
}

- (id)validationString
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  if (self->_isLoading)
  {
    CommunicationsSetupUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24D077260, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNFRegLocaleController;
    -[CNFRegFirstRunController validationString](&v6, sel_validationString);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_loadRegionsIfNecessary
{
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE30370], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "isLoaded");
  self->_isLoading = v3 ^ 1;
  if ((v3 & 1) == 0)
  {
    -[CNFRegLocaleController _startListeningForRegionListChanges](self, "_startListeningForRegionListChanges");
    objc_msgSend(v4, "startLoading");
  }

}

- (void)_loadInitialValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleIDAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[CNFRegLocaleController currentRegionID](self, "currentRegionID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[CNFRegLocaleController currentRegionID](self, "currentRegionID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        !v8))
  {
    objc_msgSend(v16, "profileStringForKey:", *MEMORY[0x24BE50060]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegLocaleController setCurrentRegionID:](self, "setCurrentRegionID:", v9);

  }
  -[CNFRegLocaleController currentPhoneValue](self, "currentPhoneValue");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        -[CNFRegLocaleController currentPhoneValue](self, "currentPhoneValue"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "length"),
        v12,
        v11,
        !v13))
  {
    objc_msgSend(v16, "profileStringForKey:", *MEMORY[0x24BE50050]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNFRegLocaleController _unformattedPhoneNumber:](self, "_unformattedPhoneNumber:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegLocaleController setCurrentPhoneValue:](self, "setCurrentPhoneValue:", v15);

    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CNFRegLocaleController _loadInitialValues](self, "_loadInitialValues");
  -[CNFRegLocaleController _loadRegionsIfNecessary](self, "_loadRegionsIfNecessary");
  if (-[CNFRegLocaleController containsSpecifier:](self, "containsSpecifier:", self->_phoneNumberGroupSpecifier))
  {
    -[CNFRegLocaleController _phoneTextField](self, "_phoneTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
  -[CNFRegLocaleController _updateUI](self, "_updateUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_isLoading)
    -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CNFRegLocaleController _phoneTextField](self, "_phoneTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CNFRegLocaleController _stopListeningForRegionListChanges](self, "_stopListeningForRegionListChanges");
  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegLocaleController;
  -[CNFRegLocaleController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "styleUsesCustomAccessoryView"))
  {
    if (objc_msgSend(v4, "accessoryType") == 1)
    {
      objc_msgSend(v5, "tableCellCustomAccessoryViewDisclosureIndicator");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(v4, "setAccessoryView:", v6);

      }
    }
  }

  return v4;
}

- (id)titleString
{
  return &stru_24D077260;
}

- (void)_startListeningForRegionListChanges
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id regionListChangeObserver;
  _QWORD v10[5];
  uint8_t buf[16];

  if (!self->_regionListChangeObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Started listening for region list loading notifications", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    v5 = *MEMORY[0x24BE30318];
    objc_msgSend(MEMORY[0x24BE30370], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__CNFRegLocaleController__startListeningForRegionListChanges__block_invoke;
    v10[3] = &unk_24D076088;
    v10[4] = self;
    v7 = (void *)MEMORY[0x2199B8E98](v10);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, v6, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    regionListChangeObserver = self->_regionListChangeObserver;
    self->_regionListChangeObserver = v8;

  }
}

void __61__CNFRegLocaleController__startListeningForRegionListChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Region list finished loading", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(*(id *)(a1 + 32), "_handleRegionListLoad");

}

- (void)_stopListeningForRegionListChanges
{
  NSObject *v3;
  void *v4;
  id regionListChangeObserver;
  uint8_t v6[16];

  if (self->_regionListChangeObserver)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Stopped listening for region list loading notifications", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_regionListChangeObserver);
    regionListChangeObserver = self->_regionListChangeObserver;
    self->_regionListChangeObserver = 0;

  }
}

- (void)_handleRegionListLoad
{
  void *v3;
  id v4;

  -[CNFRegLocaleController _stopListeningForRegionListChanges](self, "_stopListeningForRegionListChanges");
  objc_msgSend(MEMORY[0x24BE30370], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegLocaleController setRegionData:](self, "setRegionData:", v3);

  self->_isLoading = 0;
  if (-[CNFRegLocaleController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNFRegLocaleController _updateUI](self, "_updateUI");
    -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
  }

}

- (void)_updateUI
{
  _BOOL4 isLoading;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController _updateUI](&v21, sel__updateUI);
  isLoading = self->_isLoading;
  v4 = !self->_isLoading;
  v5 = *MEMORY[0x24BE75A18];
  -[PSSpecifier propertyForKey:](self->_countryFieldSpecifier, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v4 != v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !isLoading);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](self->_countryFieldSpecifier, "setProperty:forKey:", v8, v5);

  }
  -[CNFRegLocaleController _refreshCountryFieldAnimated:](self, "_refreshCountryFieldAnimated:", 0);
  -[CNFRegLocaleController _refreshPhoneFieldAnimated:](self, "_refreshPhoneFieldAnimated:", 0);
  -[CNFRegLocaleController _currentRegion](self, "_currentRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "basePhoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = objc_msgSend(v11, "length") == 0;
    else
      v13 = 1;

  }
  else
  {
    v13 = 0;
  }
  -[CNFRegLocaleController _showPhoneField:animated:](self, "_showPhoneField:animated:", v13, 0);
  -[CNFRegFirstRunController account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileValueForKey:", *MEMORY[0x24BE50060]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegLocaleController currentRegionID](self, "currentRegionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  objc_msgSend(v14, "profileValueForKey:", *MEMORY[0x24BE50050]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegLocaleController currentPhoneValue](self, "currentPhoneValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (!self->_isLoading)
  {
    if ((v17 & v20) != 1 || objc_msgSend(v14, "profileValidationStatus") != 2)
    {
      -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);
      goto LABEL_15;
    }
    -[CNFRegLocaleController _startTimeout](self, "_startTimeout");
  }
  -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0);
LABEL_15:

}

- (void)_updateControllerState
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  const __CFString *v11;
  objc_super v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController _updateControllerState](&v12, sel__updateControllerState);
  -[CNFRegLocaleController _updateUI](self, "_updateUI");
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "accountStateForAccount:", v4);

  OSLogHandleForIDSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((v5 & 2) != 0)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Popping controller. Has local dialing support? %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v8 = CFSTR("NO");
    if ((v5 & 2) != 0)
      v8 = CFSTR("YES");
    v11 = v8;
    IMLogString();
  }
  -[CNFRegLocaleController dismissModalViewControllerWithTransition:](self, "dismissModalViewControllerWithTransition:", 7, v11);
  -[CNFRegLocaleController completionBlock](self, "completionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNFRegLocaleController completionBlock](self, "completionBlock");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, (v5 >> 1) & 1);

  }
}

- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_phoneNumberFieldSpecifier, a3, a4);
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_countryFieldSpecifier, v5, v4);
}

- (id)_currentRegion
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE30370], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegLocaleController currentRegionID](self, "currentRegionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentCountryValueForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v10;

  v4 = a3;
  if (self->_isLoading)
  {
    CommunicationsSetupUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("LOADING");
LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D077260, v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (self->_isError)
  {
    CommunicationsSetupUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("ERROR");
    goto LABEL_5;
  }
  -[CNFRegLocaleController _currentRegion](self, "_currentRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v10)
  {
    objc_msgSend(v10, "label");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_24D077260;
  }
LABEL_6:

  return v8;
}

- (void)_refreshCountryFieldAnimated:(BOOL)a3
{
  -[CNFRegLocaleController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_countryFieldSpecifier, a3);
}

- (void)_showPhoneField:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  int v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v7 = -[CNFRegLocaleController containsSpecifier:](self, "containsSpecifier:", self->_phoneNumberGroupSpecifier);
  if (!v5 || (v7 & 1) != 0)
  {
    if (!v5 && ((v7 ^ 1) & 1) == 0)
    {
      -[CNFRegLocaleController _phoneTextField](self, "_phoneTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resignFirstResponder");

      -[CNFRegLocaleController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_phoneNumberSpecifiers, v4);
    }
  }
  else
  {
    -[CNFRegLocaleController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", self->_phoneNumberSpecifiers, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count"), v4);
  }
}

- (id)_phoneTextField
{
  void *v2;
  void *v3;

  -[CNFRegLocaleController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", self->_phoneNumberFieldSpecifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentPhoneCompatibleCountryCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNFRegLocaleController _currentRegion](self, "_currentRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "isoCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_unformattedPhoneNumber:(id)a3
{
  if (a3)
    return (id)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
  else
    return 0;
}

- (id)currentPhoneNumberForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CNFRegLocaleController currentPhoneValue](self, "currentPhoneValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegLocaleController currentPhoneCompatibleCountryCode](self, "currentPhoneCompatibleCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNFRegLocaleController currentPhoneValue](self, "currentPhoneValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)PNCopyFormattedStringWithCountry();

    v9 = v8;
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, "Getting formatted phone number {%@}: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();

  }
  else
  {
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Getting unformatted phone number: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    v9 = v5;
  }

  return v9;
}

- (void)setCurrentPhoneNumber:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CNFRegLocaleController _unformattedPhoneNumber:](self, "_unformattedPhoneNumber:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Setting unformatted phone number: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v10 = v8;
    IMLogString();
  }
  -[CNFRegLocaleController setCurrentPhoneValue:](self, "setCurrentPhoneValue:", v8, v10);

}

- (void)_refreshPhoneFieldAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CNFRegLocaleController containsSpecifier:](self, "containsSpecifier:", self->_phoneNumberGroupSpecifier))-[CNFRegLocaleController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_phoneNumberFieldSpecifier, v3);
}

- (void)_failValidationWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "_failValidationWithError: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v17 = v4;
    IMLogString();
  }
  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1, v17);
  CommunicationsSetupUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    CommunicationsSetupUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  CommunicationsSetupUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v14, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v16);

  -[CNFRegLocaleController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)_finishValidation
{
  void *v3;
  void *v4;
  void *v5;

  -[CNFRegFirstRunController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
  -[CNFRegLocaleController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", 0);

  -[CNFRegLocaleController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", 0);

  -[CNFRegLocaleController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

  -[CNFRegLocaleController _updateControllerState](self, "_updateControllerState");
}

- (id)_rightButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE"), &stru_24D077260, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 2, self, sel__rightButtonTapped);

  return v7;
}

- (void)_rightButtonTapped
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  const __CFString *v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!-[CNFRegListController _showWiFiAlertIfNecessary](self, "_showWiFiAlertIfNecessary"))
  {
    -[CNFRegLocaleController _currentRegion](self, "_currentRegion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      CommunicationsSetupUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      CommunicationsSetupUIBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACETIME_LOCALE_MISSING_REGION_ALERT_MESSAGE"), &stru_24D077260, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      CommunicationsSetupUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v22, v25, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v28, 0, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addAction:", v30);

      -[CNFRegLocaleController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);
LABEL_37:

      return;
    }
    objc_msgSend(v3, "regionID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "basePhoneNumber");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || !-[__CFString length](v6, "length"))
    {
      -[CNFRegLocaleController _phoneTextField](self, "_phoneTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNFRegLocaleController _unformattedPhoneNumber:](self, "_unformattedPhoneNumber:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      -[CNFRegLocaleController setCurrentPhoneValue:](self, "setCurrentPhoneValue:", v10);
      v7 = (__CFString *)v10;
    }
    -[CNFRegFirstRunController account](self, "account");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Setting profile for account: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v31 = v11;
      IMLogString();
    }
    OSLogHandleForIDSCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "  => Region ID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v31 = v5;
      IMLogString();
    }
    OSLogHandleForIDSCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "  => Phone: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v31 = v7;
      IMLogString();
    }
    v15 = -[__CFString setProfileString:forKey:](v11, "setProfileString:forKey:", v5, *MEMORY[0x24BE50060], v31);
    v16 = v15 | -[__CFString setProfileString:forKey:](v11, "setProfileString:forKey:", v7, *MEMORY[0x24BE50050]);
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      if (v16)
        v18 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "  => Changed: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v19 = CFSTR("NO");
      if (v16)
        v19 = CFSTR("YES");
      v32 = v19;
      IMLogString();
    }
    if ((v16 & 1) != 0)
    {
      -[__CFString writeSettings](v11, "writeSettings");
    }
    else if (-[__CFString profileValidationStatus](v11, "profileValidationStatus") == 3)
    {
      -[CNFRegLocaleController _finishValidation](self, "_finishValidation");
LABEL_36:

      goto LABEL_37;
    }
    -[CNFRegFirstRunController _startValidationModeAnimated:](self, "_startValidationModeAnimated:", 0, v32);
    -[CNFRegLocaleController _startTimeout](self, "_startTimeout");
    -[__CFString validateProfile](v11, "validateProfile");
    goto LABEL_36;
  }
}

- (void)_startTimeout
{
  -[CNFRegFirstRunController _startTimeoutWithDuration:](self, "_startTimeoutWithDuration:", 30.0);
}

- (void)_handleTimeout
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "_handleTimeout", v9, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD0FC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.conference.registration"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegLocaleController _failValidationWithError:](self, "_failValidationWithError:", v8);

}

- (void)_showCountryPickerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CNFRegLocaleController *v6;
  void *v7;
  void *v8;
  CNFRegRegionChooserController *v9;
  void *v10;
  void *v11;
  CNFRegRegionChooserController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v3 = a3;
  -[CNFRegLocaleController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleViewController");
  v6 = (CNFRegLocaleController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[CNFRegListController setShowingChildController:](self, "setShowingChildController:", 1);
    -[CNFRegLocaleController _phoneTextField](self, "_phoneTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resignFirstResponder");

    v21 = objc_alloc_init(MEMORY[0x24BE75588]);
    objc_msgSend(v21, "setParentController:", self);
    -[CNFRegLocaleController rootController](self, "rootController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRootController:", v8);

    v9 = [CNFRegRegionChooserController alloc];
    -[CNFRegLocaleController regionData](self, "regionData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegLocaleController currentRegionID](self, "currentRegionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNFRegRegionChooserController initWithRegionList:selectedRegionID:](v9, "initWithRegionList:selectedRegionID:", v10, v11);

    -[CNFRegRegionChooserController setDelegate:](v12, "setDelegate:", self);
    -[CNFRegRegionChooserController setRootController:](v12, "setRootController:", v21);
    -[CNFRegRegionChooserController setParentController:](v12, "setParentController:", v21);
    -[CNFRegRegionChooserController setSpecifier:](v12, "setSpecifier:", self->_countryFieldSpecifier);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_hideCountryPicker);
    -[CNFRegRegionChooserController navigationItem](v12, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    -[CNFRegRegionChooserController drillDownControllerList](v12, "drillDownControllerList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setViewControllers:", v15);

    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setModalPresentationStyle:", objc_msgSend(v16, "modalPresentationStyle"));
    v17 = objc_msgSend(v16, "navigationBarStyle");
    objc_msgSend(v21, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBarStyle:", v17);

    v19 = objc_msgSend(v16, "navigationBarIsTranslucent");
    objc_msgSend(v21, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslucent:", v19);

    -[CNFRegLocaleController showController:animate:](self, "showController:animate:", v21, v3);
  }
}

- (void)_hideCountryPickerAnimated:(BOOL)a3
{
  void *v4;
  CNFRegLocaleController *v5;
  _QWORD v6[5];

  -[CNFRegLocaleController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleViewController");
  v5 = (CNFRegLocaleController *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__CNFRegLocaleController__hideCountryPickerAnimated___block_invoke;
    v6[3] = &unk_24D075180;
    v6[4] = self;
    -[CNFRegFirstRunController _executeDismissBlock:](self, "_executeDismissBlock:", v6);
  }
}

void __53__CNFRegLocaleController__hideCountryPickerAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismiss");

}

- (void)showCountryPicker
{
  -[CNFRegLocaleController _showCountryPickerAnimated:](self, "_showCountryPickerAnimated:", 1);
}

- (void)hideCountryPicker
{
  -[CNFRegLocaleController _hideCountryPickerAnimated:](self, "_hideCountryPickerAnimated:", 1);
}

- (void)regionChooser:(id)a3 selectedRegionID:(id)a4
{
  -[CNFRegLocaleController setCurrentRegionID:](self, "setCurrentRegionID:", a4);
  -[CNFRegLocaleController _updateUI](self, "_updateUI");
  -[CNFRegLocaleController hideCountryPicker](self, "hideCountryPicker");
}

- (void)_buildCountryFieldSpecifierCache:(id)a3
{
  PSSpecifier *v4;
  PSSpecifier *countryFieldSpecifier;

  objc_msgSend(a3, "specifierForID:", CFSTR("FACETIME_LOCALE_COUNTRY_SELECT_ID"));
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  countryFieldSpecifier = self->_countryFieldSpecifier;
  self->_countryFieldSpecifier = v4;

}

- (void)_buildPhoneNumberSpecifierCache:(id)a3
{
  id v5;
  PSSpecifier *v6;
  PSSpecifier *v7;
  PSSpecifier *phoneNumberGroupSpecifier;
  PSSpecifier *phoneNumberFieldSpecifier;
  PSSpecifier *v10;
  NSArray *v11;
  NSArray *phoneNumberSpecifiers;
  void *v13;
  PSSpecifier *v14;

  v5 = a3;
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_LOCALE_PHONE_GROUP_ID"));
  v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_LOCALE_PHONE_FIELD_ID"));
  v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  if (!v6 || !v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegLocaleController.m"), 675, CFSTR("Specifier list did not contain phone fields"));

  }
  phoneNumberGroupSpecifier = self->_phoneNumberGroupSpecifier;
  self->_phoneNumberGroupSpecifier = v6;
  v14 = v6;

  phoneNumberFieldSpecifier = self->_phoneNumberFieldSpecifier;
  self->_phoneNumberFieldSpecifier = v7;
  v10 = v7;

  v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v14, v10, 0);
  phoneNumberSpecifiers = self->_phoneNumberSpecifiers;
  self->_phoneNumberSpecifiers = v11;

}

- (void)_buildSpecifierCache:(id)a3
{
  id v4;

  v4 = a3;
  -[CNFRegLocaleController _buildCountryFieldSpecifierCache:](self, "_buildCountryFieldSpecifierCache:", v4);
  -[CNFRegLocaleController _buildPhoneNumberSpecifierCache:](self, "_buildPhoneNumberSpecifierCache:", v4);

}

- (void)_setupEventHandlers
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegLocaleController;
  -[CNFRegFirstRunController _setupEventHandlers](&v7, sel__setupEventHandlers);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke;
  v6[3] = &unk_24D075CB8;
  v6[4] = self;
  objc_msgSend(v3, "setProfileStatusChangedBlock:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke_140;
  v5[3] = &unk_24D075CB8;
  v5[4] = self;
  objc_msgSend(v3, "setAccountRegistrationBlock:", v5);

}

void __45__CNFRegLocaleController__setupEventHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CNFRegStringForAccount(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Profile status changed for account: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    CNFRegStringForAccount(v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  objc_msgSend(*(id *)(a1 + 32), "account", v16);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9 == v5;

  if (v10)
  {
    v15 = objc_msgSend(v5, "profileValidationStatus");
    if (v15 == 3)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke_2;
      v18[3] = &unk_24D075180;
      v18[4] = *(_QWORD *)(a1 + 32);
      v14 = (void (**)(_QWORD))MEMORY[0x2199B8E98](v18);
      if (!v14)
        goto LABEL_20;
    }
    else
    {
      if (v15 != -1)
      {
        v14 = 0;
        goto LABEL_20;
      }
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __45__CNFRegLocaleController__setupEventHandlers__block_invoke_136;
      v19[3] = &unk_24D075680;
      v19[4] = *(_QWORD *)(a1 + 32);
      v20 = v6;
      v14 = (void (**)(_QWORD))MEMORY[0x2199B8E98](v19);

      if (!v14)
        goto LABEL_20;
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "timedOut") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_stopTimeout");
      v14[2](v14);
    }
    goto LABEL_20;
  }
  OSLogHandleForIDSCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringForAccount(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "  => Ignoring because the account does not match our account: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v14 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    CNFRegStringForAccount(v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

LABEL_20:
  }

}

uint64_t __45__CNFRegLocaleController__setupEventHandlers__block_invoke_136(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_failValidationWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__CNFRegLocaleController__setupEventHandlers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishValidation");
}

void __45__CNFRegLocaleController__setupEventHandlers__block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "isActive");
    CNFRegStringForAccount(v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    if (v8)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v16 = v11;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Account status changed (isActive=%@): %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    if (objc_msgSend(v5, "isActive"))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    CNFRegStringForAccount(v5);
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateControllerState", v13, v14);

}

- (NSString)currentRegionID
{
  return self->_currentRegionID;
}

- (void)setCurrentRegionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (NSString)currentPhoneValue
{
  return self->_currentPhoneValue;
}

- (void)setCurrentPhoneValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (NSArray)regionData
{
  return self->_regionData;
}

- (void)setRegionData:(id)a3
{
  objc_storeStrong((id *)&self->_regionData, a3);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 1552, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1552);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_regionListChangeObserver, 0);
  objc_storeStrong((id *)&self->_regionData, 0);
  objc_storeStrong((id *)&self->_phoneNumberFieldSpecifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_phoneNumberSpecifiers, 0);
  objc_storeStrong((id *)&self->_countryFieldSpecifier, 0);
  objc_storeStrong((id *)&self->_currentPhoneValue, 0);
  objc_storeStrong((id *)&self->_currentRegionID, 0);
}

@end
