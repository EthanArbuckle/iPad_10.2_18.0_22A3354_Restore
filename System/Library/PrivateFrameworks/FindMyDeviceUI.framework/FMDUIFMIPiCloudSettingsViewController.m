@implementation FMDUIFMIPiCloudSettingsViewController

- (FMDUIFMIPiCloudSettingsViewController)init
{
  FMDUIFMIPiCloudSettingsViewController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  v2 = -[FMDUIFMIPiCloudSettingsViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "settingsConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDUIFMIPiCloudSettingsViewController setSpSession:](v2, "setSpSession:", v4);

  }
  return v2;
}

- (void)_loadSearchPartyConfiguration
{
  void *v3;
  _QWORD v4[5];

  -[FMDUIFMIPiCloudSettingsViewController spSession](self, "spSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke;
  v4[3] = &unk_24F536C88;
  v4[4] = self;
  objc_msgSend(v3, "beginRefreshingServiceStateWithBlock:", v4);

}

void __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke_2;
  block[3] = &unk_24F536C60;
  v10 = v5;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __70__FMDUIFMIPiCloudSettingsViewController__loadSearchPartyConfiguration__block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_22AE37000, v2, OS_LOG_TYPE_DEFAULT, "SP Session state changed: %@, disabled reason: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(a1[6], "setOfflineFindingEnabled:", objc_msgSend(a1[4], "isEqualToString:", *MEMORY[0x24BE82C30]));
  objc_msgSend(a1[5], "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setOfflineFindingDisabledDueToNotHSA2:", objc_msgSend(v5, "containsObject:", *MEMORY[0x24BE82C18]));

  return objc_msgSend(a1[6], "reloadSpecifiers");
}

- (void)setSearchPartyConfigurationActive:(BOOL)a3
{
  id *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = (id *)MEMORY[0x24BE82C30];
  if (!a3)
    v4 = (id *)MEMORY[0x24BE82C28];
  v5 = *v4;
  objc_initWeak(&location, self);
  -[FMDUIFMIPiCloudSettingsViewController spSession](self, "spSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__FMDUIFMIPiCloudSettingsViewController_setSearchPartyConfigurationActive___block_invoke;
  v8[3] = &unk_24F536CB0;
  v7 = v5;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "setServiceState:completion:", v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __75__FMDUIFMIPiCloudSettingsViewController_setSearchPartyConfigurationActive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_22AE37000, v4, OS_LOG_TYPE_DEFAULT, "Set SP Session state: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadSpecifiersOnMainQueue");

}

- (BOOL)FMWLANEnabled
{
  return MGGetBoolAnswer();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  -[FMDUIFMIPiCloudSettingsViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24F537048, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDUIFMIPiCloudSettingsViewController setTitle:](self, "setTitle:", v5);

  -[FMDUIFMIPiCloudSettingsViewController _loadSearchPartyConfiguration](self, "_loadSearchPartyConfiguration");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__fmipSettingsCacheDidUpdate_, CFSTR("FMDUIFMIPSettingsCacheDidUpdateNotification"), 0);

  -[FMDUIFMIPiCloudSettingsViewController _reloadSpecifiersOnMainQueue](self, "_reloadSpecifiersOnMainQueue");
  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  -[FMDUIFMIPiCloudSettingsViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v8;

  v3 = a3;
  +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fmipStateAvailable") & 1) == 0)
    goto LABEL_6;
  +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "fmipState") != 2)
  {

LABEL_6:
    goto LABEL_7;
  }
  v7 = -[FMDUIFMIPiCloudSettingsViewController isShowingActivityInProgressUI](self, "isShowingActivityInProgressUI");

  if (!v7)
    -[FMDUIFMIPiCloudSettingsViewController showActivityInProgress](self, "showActivityInProgress");
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  -[FMDUIFMIPiCloudSettingsViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("FMDUIFMIPSettingsCacheDidUpdateNotification"), 0);

  v6.receiver = self;
  v6.super_class = (Class)FMDUIFMIPiCloudSettingsViewController;
  -[FMDUIFMIPiCloudSettingsViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (BOOL)isDTOEnabledAndFindMyOn
{
  void *v2;
  int v3;
  __CFString *v4;
  void *v5;
  int v6;
  __CFString *v7;
  NSObject *v8;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFeatureEnabled");

  v4 = CFSTR("NO");
  if (v3)
  {
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fmipEnabled");

    if (v6)
      v4 = CFSTR("YES");
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  v7 = v4;
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_22AE37000, v8, OS_LOG_TYPE_DEFAULT, "Should show DTO Disclaimer - %{public}@", (uint8_t *)&v10, 0xCu);
  }

  return v6;
}

- (BOOL)isFMIPSwitchEnabled
{
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  BOOL v7;
  _BOOL4 v8;
  __CFString *v9;
  NSObject *v10;
  int v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fmipStateAvailable") & 1) != 0)
  {
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fmipStateChangeInProgress");

    v6 = CFSTR("NO");
    if ((v5 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v8 = -[FMDUIFMIPiCloudSettingsViewController isDTOEnabledAndFindMyOn](self, "isDTOEnabledAndFindMyOn");
      v7 = !v8;
      if (!v8)
        v6 = CFSTR("YES");
    }
  }
  else
  {

    v7 = 0;
    v6 = CFSTR("NO");
  }
  v9 = v6;
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_22AE37000, v10, OS_LOG_TYPE_DEFAULT, "Should FMIP Button be enabled %@", (uint8_t *)&v12, 0xCu);
  }

  return v7;
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FMDUIFMIPiCloudSettingsViewController _groupSpecifierForFMIP](self, "_groupSpecifierForFMIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDUIFMIPiCloudSettingsViewController _specifierForFMIP](self, "_specifierForFMIP");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDUIFMIPiCloudSettingsViewController setFmipSpecifier:](self, "setFmipSpecifier:", v5);

  objc_msgSend(v3, "addObject:", v4);
  -[FMDUIFMIPiCloudSettingsViewController fmipSpecifier](self, "fmipSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup")
    || (-[FMDUIFMIPiCloudSettingsViewController _fmipSwitchOnForSpecifier:](self, "_fmipSwitchOnForSpecifier:", 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        !v8))
  {
    -[FMDUIFMIPiCloudSettingsViewController setSendLastLocationSpecifier:](self, "setSendLastLocationSpecifier:", 0);
  }
  else
  {
    -[FMDUIFMIPiCloudSettingsViewController _groupSpecifierForOfflineFinding](self, "_groupSpecifierForOfflineFinding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

    -[FMDUIFMIPiCloudSettingsViewController _specifierForOfflineFinding](self, "_specifierForOfflineFinding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    -[FMDUIFMIPiCloudSettingsViewController _specifierForSendLastLocation](self, "_specifierForSendLastLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDUIFMIPiCloudSettingsViewController setSendLastLocationSpecifier:](self, "setSendLastLocationSpecifier:", v11);

    -[FMDUIFMIPiCloudSettingsViewController _groupSpecifierForSendLastLocation](self, "_groupSpecifierForSendLastLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    -[FMDUIFMIPiCloudSettingsViewController sendLastLocationSpecifier](self, "sendLastLocationSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  -[FMDUIFMIPiCloudSettingsViewController setSpecifiers:](self, "setSpecifiers:", v3);

  return v3;
}

- (id)_specifierForFMIP
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_SWITCH_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24F537048, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel__setFMIPSwitchOn_forSpecifier_, sel__fmipSwitchOnForSpecifier_, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FMDUIFMIPiCloudSettingsViewController isFMIPSwitchEnabled](self, "isFMIPSwitchEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);

  objc_msgSend(v6, "setProperty:forKey:", CFSTR("FIND_MY_SPECIFIER_ID"), *MEMORY[0x24BE75AC0]);
  return v6;
}

- (id)_groupSpecifierForFMIP
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  NSRange v22;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("FMD_GROUP_SPECIFIER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_FMIP_GROUP_FOOTER"), &stru_24F537048, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FMD_TOP_DTO_LEARN_MORE_LINK_TITLE"), &stru_24F537048, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_NEEDED_FOOTER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24F537048, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (-[FMDUIFMIPiCloudSettingsViewController isDTOEnabledAndFindMyOn](self, "isDTOEnabledAndFindMyOn"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_FMIP_GROUP_FOOTER_TOP_DTO"), &stru_24F537048, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@%@%@"), v9, v7, CFSTR("\n\n"), v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  v10 = v5;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FMD_ABOUT_FMIP_PRIVACY_LINK_TITLE"), &stru_24F537048, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FMDUIFMIPiCloudSettingsViewController isDTOEnabledAndFindMyOn](self, "isDTOEnabledAndFindMyOn"))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v16, *MEMORY[0x24BE75A30]);

    objc_msgSend(v3, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);
    -[FMDUIFMIPiCloudSettingsViewController addHyperLinkStyleToText:inString:action:forGroup:](self, "addHyperLinkStyleToText:inString:action:forGroup:", v7, v14, sel_showLearnMoreLinkInDTODisclosure_, v3);
  }
  else
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v18, *MEMORY[0x24BE75A30]);

  }
  objc_msgSend(v3, "setProperty:forKey:", v14, *MEMORY[0x24BE75A58]);
  v22.location = objc_msgSend(v14, "rangeOfString:", v13);
  NSStringFromRange(v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v19, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v20, *MEMORY[0x24BE75A50]);

  objc_msgSend(v3, "setProperty:forKey:", CFSTR("_showFMIPPrivacyPage"), *MEMORY[0x24BE75A38]);
  return v3;
}

- (void)addHyperLinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  char v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v12, "propertyForKey:", *MEMORY[0x24BE75A30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToString:", v15);

  if ((v16 & 1) == 0)
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Unspecified();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FMDUIFMIPiCloudSettingsViewController addHyperLinkStyleToText:inString:action:forGroup:].cold.1((uint64_t)v18, v19);

  }
  v20 = objc_msgSend(v11, "rangeOfString:", v10);
  if (v21)
    objc_msgSend(v12, "addFooterHyperlinkWithRange:target:action:", v20, v21, self, a5);

}

- (void)showLearnMoreLinkInDTODisclosure:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212510"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v3, MEMORY[0x24BDBD1B8], &v9);
  v6 = v9;

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("https://support.apple.com/kb/HT212510");
      _os_log_impl(&dword_22AE37000, v8, OS_LOG_TYPE_ERROR, "Could not open %@ through FindMy", buf, 0xCu);
    }

  }
}

- (id)_specifierForOfflineFinding
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_OFFLINE_FINDING_SWITCH_TITLE"), &stru_24F537048, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel__setOfflineFindingSwitchOn_forSpecifier_, sel__offlineFindingSwitchOnForSpecifier_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("OFFLINE_FINDING_SPECIFIER_ID"), *MEMORY[0x24BE75AC0]);

  return v5;
}

- (id)_groupSpecifierForOfflineFinding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("OFFLINE_GROUP_SPECIFIER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_OFFLINE_FINDING_FOOTER"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_24F537048, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[FMDUIFMIPiCloudSettingsViewController _doesDeviceSupportOfflineFindingLowPowerMode](self, "_doesDeviceSupportOfflineFindingLowPowerMode"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_OFFLINE_FINDING_FOOTER_LPEM"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24F537048, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(v3, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v10, *MEMORY[0x24BE75A50]);

  objc_msgSend(v3, "setProperty:forKey:", CFSTR("_showOfflineFindingLearnMorePage"), *MEMORY[0x24BE75A38]);
  return v3;
}

- (BOOL)_doesDeviceSupportOfflineFindingLowPowerMode
{
  void *v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  MGCopyAnswerWithError();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v2;
    _os_log_impl(&dword_22AE37000, v3, OS_LOG_TYPE_DEFAULT, "deviceSupportsLPEM supportedTypes %@", (uint8_t *)&v9, 0xCu);
  }

  v4 = objc_msgSend(v2, "containsObject:", CFSTR("find-my"));
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      v7 = "deviceSupportsLPEM YES";
LABEL_8:
      _os_log_impl(&dword_22AE37000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 2u);
    }
  }
  else if (v6)
  {
    LOWORD(v9) = 0;
    v7 = " deviceSupportsLPEM NO";
    goto LABEL_8;
  }

  return v4;
}

- (void)showHSA2UpgradeAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_ALERT_TITLE"), &stru_24F537048, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_ALERT_MESSAGE"), &stru_24F537048, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_NOT_NOT_BUTTON"), &stru_24F537048, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke;
  v19[3] = &unk_24F536CD8;
  v19[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FMD_OFFLINE_FINDING_ACCOUNT_UPGRADE_CONTINUE_BUTTON"), &stru_24F537048, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke_2;
  v18[3] = &unk_24F536CD8;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v17);
  objc_msgSend(v8, "addAction:", v13);
  objc_msgSend(v8, "setPreferredAction:", v17);
  -[FMDUIFMIPiCloudSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __61__FMDUIFMIPiCloudSettingsViewController_showHSA2UpgradeAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentHSA2UpgradeForOfflineFinding");
}

- (void)presentHSA2UpgradeForOfflineFinding
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  FMDUIFMIPiCloudSettingsViewController *v14;

  v3 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryAccountAltDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04DB0]), "initWithNibName:bundle:", 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithPresentingViewController:", v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke;
  v11[3] = &unk_24F536C60;
  v12 = v8;
  v13 = v3;
  v14 = self;
  v9 = v3;
  v10 = v8;
  -[FMDUIFMIPiCloudSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v11);

}

uint64_t __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_2;
  v4[3] = &unk_24F536D28;
  v4[4] = a1[6];
  return objc_msgSend(v2, "performDeviceToDeviceEncryptionStateRepairForContext:withCompletion:", v1, v4);
}

void __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_3;
  v2[3] = &unk_24F536D00;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __76__FMDUIFMIPiCloudSettingsViewController_presentHSA2UpgradeForOfflineFinding__block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setSearchPartyConfigurationActive:", 1);
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_specifierForSendLastLocation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_SEND_LAST_LOCATION_SWITCH_TITLE"), &stru_24F537048, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel__setSendLastLocationSwitchOn_forSpecifier_, sel__sendLastLocationSwitchOnForSpecifier_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SLL_SPECIFIER_ID"), *MEMORY[0x24BE75AC0]);

  return v5;
}

- (id)_groupSpecifierForSendLastLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SLL_GROUP_SPECIFIER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_SEND_LAST_LOCATION_FOOTER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24F537048, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);
  return v2;
}

- (void)_showFMIPPrivacyPage
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifer:", *MEMORY[0x24BE6E460]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)_setFMIPSwitchOn:(id)a3 forSpecifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  FMDUIFMIPiCloudSettingsViewController *v16;
  id v17;
  id location;

  v5 = a3;
  if (-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup"))
  {
    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShouldEnable:", objc_msgSend(v5, "BOOLValue"));

    -[FMDUIFMIPiCloudSettingsViewController _reloadSpecifiersOnMainQueue](self, "_reloadSpecifiersOnMainQueue");
    -[FMDUIFMIPiCloudSettingsViewController parentController](self, "parentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDUIFMIPiCloudSettingsViewController specifier](self, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadSpecifierID:animated:", v9, 0);

  }
  else
  {
    v10 = objc_msgSend(v5, "BOOLValue");
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fmipEnabled");

    if (v10 != v12 && !-[FMDUIFMIPiCloudSettingsViewController togglingFMIPSwitch](self, "togglingFMIPSwitch"))
    {
      -[FMDUIFMIPiCloudSettingsViewController setTogglingFMIPSwitch:](self, "setTogglingFMIPSwitch:", 1);
      objc_msgSend((id)*MEMORY[0x24BDF74F8], "beginIgnoringInteractionEvents");
      objc_initWeak(&location, self);
      v13 = dispatch_time(0, 100000000);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __71__FMDUIFMIPiCloudSettingsViewController__setFMIPSwitchOn_forSpecifier___block_invoke;
      v14[3] = &unk_24F536D50;
      objc_copyWeak(&v17, &location);
      v15 = v5;
      v16 = self;
      dispatch_after(v13, MEMORY[0x24BDAC9B8], v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

}

void __71__FMDUIFMIPiCloudSettingsViewController__setFMIPSwitchOn_forSpecifier___block_invoke(id *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "endIgnoringInteractionEvents");
  if (objc_msgSend(a1[4], "BOOLValue"))
    objc_msgSend(WeakRetained, "_enableFMIP");
  else
    objc_msgSend(WeakRetained, "_disableFMIP");
  objc_msgSend(a1[5], "setTogglingFMIPSwitch:", 0);

}

- (id)_fmipSwitchOnForSpecifier:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup", a3))
  {
    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldEnable");
  }
  else
  {
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "fmipStateAvailable"))
    {
      +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "fmipEnabled");

    }
    else
    {
      v4 = 0;
    }
  }

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
}

- (id)_offlineFindingSwitchOnForSpecifier:(id)a3
{
  void *v4;
  uint64_t v5;

  if (-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup", a3))
  {
    v4 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    if (-[FMDUIFMIPiCloudSettingsViewController offlineFindingEnabled](self, "offlineFindingEnabled"))
      v5 = -[FMDUIFMIPiCloudSettingsViewController offlineFindingDisabledDueToNotHSA2](self, "offlineFindingDisabledDueToNotHSA2") ^ 1;
    else
      v5 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_setOfflineFindingSwitchOn:(id)a3 forSpecifier:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  FMDUIFMIPiCloudSettingsViewController *v8;

  v5 = a3;
  if (!-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __81__FMDUIFMIPiCloudSettingsViewController__setOfflineFindingSwitchOn_forSpecifier___block_invoke;
    v6[3] = &unk_24F536D78;
    v7 = v5;
    v8 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

uint64_t __81__FMDUIFMIPiCloudSettingsViewController__setOfflineFindingSwitchOn_forSpecifier___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  int v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v3 = *(void **)(a1 + 40);
  if ((v2 & 1) == 0)
    return objc_msgSend(v3, "_showOfflineFindingAlertWhenTurningOff");
  v4 = objc_msgSend(v3, "offlineFindingDisabledDueToNotHSA2");
  v5 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v5, "showHSA2UpgradeAlert");
  else
    objc_msgSend(v5, "setSearchPartyConfigurationActive:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "_reloadSpecifiersOnMainQueue");
}

- (void)_showOfflineFindingAlertWhenTurningOff
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_TITLE"), &stru_24F537048, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[FMDUIFMIPiCloudSettingsViewController FMWLANEnabled](self, "FMWLANEnabled");
  v5 = -[FMDUIFMIPiCloudSettingsViewController _doesDeviceSupportOfflineFindingLowPowerMode](self, "_doesDeviceSupportOfflineFindingLowPowerMode");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WLAN");
  if (v5)
    v8 = CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WLAN_LPEM");
  v9 = CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WIFI_LPEM");
  if (!v5)
    v9 = CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_MESSAGE_WIFI");
  if (v4)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_24F537048, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_CANCEL_BUTTON"), &stru_24F537048, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke;
  v24[3] = &unk_24F536CD8;
  v24[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FMD_DISABLE_OFFLINE_FINDING_ALERT_DISABLE_BUTTON"), &stru_24F537048, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke_2;
  v23[3] = &unk_24F536CD8;
  v23[4] = self;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 2, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v22, v11, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v16);
  objc_msgSend(v21, "addAction:", v20);
  objc_msgSend(v21, "setPreferredAction:", v16);
  -[FMDUIFMIPiCloudSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v21, 1, 0);

}

uint64_t __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __79__FMDUIFMIPiCloudSettingsViewController__showOfflineFindingAlertWhenTurningOff__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOfflineFindingEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setSearchPartyConfigurationActive:", 0);
}

- (void)_setSendLastLocationSwitchOn:(id)a3 forSpecifier:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a3;
  if (!-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup"))
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke;
    block[3] = &unk_24F536DC8;
    v8 = v5;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke_2;
  v4[3] = &unk_24F536DA0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "setLowBatteryLocateEnabled:withCompletion:", v3, v4);

  objc_destroyWeak(&v5);
}

void __83__FMDUIFMIPiCloudSettingsViewController__setSendLastLocationSwitchOn_forSpecifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_reloadSpecifiersOnMainQueue");
    WeakRetained = v4;
  }

}

- (id)_sendLastLocationSwitchOnForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (-[FMDUIFMIPiCloudSettingsViewController firstTimeSetup](self, "firstTimeSetup", a3))
  {
    v3 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "lowBatteryLocateEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_reloadSpecifiersOnMainQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__FMDUIFMIPiCloudSettingsViewController__reloadSpecifiersOnMainQueue__block_invoke;
  block[3] = &unk_24F536DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __69__FMDUIFMIPiCloudSettingsViewController__reloadSpecifiersOnMainQueue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)_enableFMIP
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BE04CE8];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke;
  v4[3] = &unk_24F536E80;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "showEnableAlertWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke(uint64_t a1, char a2)
{
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke_2;
  block[3] = &unk_24F536E58;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v6 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
}

void __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v19 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "fmipSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadSpecifier:", v3);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableInContext:", 2);

  if ((objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_TITLE"), &stru_24F537048, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_TEXT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24F537048, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_CANCEL_BUTTON"), &stru_24F537048, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FMD_ICLOUD_SETTINGS_LOCATION_SERVICES_OFF_ALERT_SETTINGS_BUTTON"), &stru_24F537048, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, &__block_literal_global);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addAction:", v18);
    objc_msgSend(v3, "addAction:", v14);
    objc_msgSend(v3, "setPreferredAction:", v14);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);

    goto LABEL_5;
  }
LABEL_6:

}

void __52__FMDUIFMIPiCloudSettingsViewController__enableFMIP__block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE75540], "preferencesURL");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)_disableFMIP
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BE04CE8];
  -[FMDUIFMIPiCloudSettingsViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke;
  v5[3] = &unk_24F536ED0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v3, "showDisableAlertForAccount:presentingViewController:withCompletion:", v4, self, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke_2;
  v7[3] = &unk_24F536EA8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v10 = a2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v9);
}

void __53__FMDUIFMIPiCloudSettingsViewController__disableFMIP__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "fmipSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSpecifier:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "showActivityInProgress");
    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "disableInContext:withWipeToken:", 1, *(_QWORD *)(a1 + 40));
  }

}

- (void)_fmipSettingsCacheDidUpdate:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__FMDUIFMIPiCloudSettingsViewController__fmipSettingsCacheDidUpdate___block_invoke;
  block[3] = &unk_24F536DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __69__FMDUIFMIPiCloudSettingsViewController__fmipSettingsCacheDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fmipStateChangeInProgress");

  if (v3)
  {
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "fmipState") == 2)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "isShowingActivityInProgressUI");

      if ((v4 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "showActivityInProgress");
    }
    else
    {

    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isShowingActivityInProgressUI"))
      objc_msgSend(*(id *)(a1 + 32), "hideActivityInProgressUIWithDelay:", 0.5);
    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fmipStateAvailable");

    objc_msgSend(*(id *)(a1 + 32), "fmipSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE75A18];
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);

    +[FMDUIFMIPSettingsCache sharedInstance](FMDUIFMIPSettingsCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "lowBatteryLocateStateAvailable");

    objc_msgSend(*(id *)(a1 + 32), "sendLastLocationSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((_DWORD)v8)
      v13 = MEMORY[0x24BDBD1C8];
    else
      v13 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v11, "setProperty:forKey:", v13, v9);

    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }
}

- (id)_userAgentHeader
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x24BE04958]);
  objc_msgSend(v2, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iOS %@ %@ %@ Find My iPhone Settings"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_clientInfoHeader
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v2 = objc_alloc_init(MEMORY[0x24BE04958]);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "productType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "osName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "osVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@;%@;%@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDBD2A0];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBD2A0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "infoDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@ (%@/%@)"), v18, v13, v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@> <%@> <%@>"), v23, v9, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)showActivityInProgress
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("FMD_TURN_OFF_FMIP_PROGRESS_MSG"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_24F537048, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDUIFMIPiCloudSettingsViewController showActivityInProgressUIWithMessage:](self, "showActivityInProgressUIWithMessage:", v4);

}

- (void)showActivityInProgressUIWithMessage:(id)a3
{
  UIProgressHUD *v4;
  UIProgressHUD *hud;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  self->_activityInProgress = 1;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "beginIgnoringInteractionEvents");
  v4 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x24BDF6CF0]);
  hud = self->_hud;
  self->_hud = v4;

  -[UIProgressHUD setFontSize:](self->_hud, "setFontSize:", 16);
  -[UIProgressHUD setText:](self->_hud, "setText:", v11);
  v6 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  objc_msgSend(v6, "superview");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v6;
    do
    {
      v10 = v9;

      v9 = v8;
      objc_msgSend(v9, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v10;
    }
    while (v8);
  }
  else
  {
    v9 = v6;
    v10 = v6;
  }
  -[UIProgressHUD showInView:](self->_hud, "showInView:", v10);

}

- (void)hideActivityInProgressUI
{
  UIProgressHUD *hud;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "endIgnoringInteractionEvents");
  -[UIProgressHUD removeFromSuperview](self->_hud, "removeFromSuperview");
  hud = self->_hud;
  self->_hud = 0;

  self->_activityInProgress = 0;
}

- (void)hideActivityInProgressUIWithDelay:(double)a3
{
  if (a3 <= 0.0)
  {
    -[FMDUIFMIPiCloudSettingsViewController hideActivityInProgressUI](self, "hideActivityInProgressUI");
  }
  else
  {
    -[UIProgressHUD done](self->_hud, "done");
    -[FMDUIFMIPiCloudSettingsViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideActivityInProgressUI, self, a3);
  }
}

- (BOOL)isShowingActivityInProgressUI
{
  return self->_activityInProgress;
}

- (BOOL)firstTimeSetup
{
  return self->_firstTimeSetup;
}

- (void)setFirstTimeSetup:(BOOL)a3
{
  self->_firstTimeSetup = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PSSpecifier)fmipSpecifier
{
  return self->_fmipSpecifier;
}

- (void)setFmipSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_fmipSpecifier, a3);
}

- (BOOL)togglingFMIPSwitch
{
  return self->_togglingFMIPSwitch;
}

- (void)setTogglingFMIPSwitch:(BOOL)a3
{
  self->_togglingFMIPSwitch = a3;
}

- (PSSpecifier)sendLastLocationSpecifier
{
  return self->_sendLastLocationSpecifier;
}

- (void)setSendLastLocationSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_sendLastLocationSpecifier, a3);
}

- (UIProgressHUD)hud
{
  return self->_hud;
}

- (void)setHud:(id)a3
{
  objc_storeStrong((id *)&self->_hud, a3);
}

- (BOOL)activityInProgress
{
  return self->_activityInProgress;
}

- (void)setActivityInProgress:(BOOL)a3
{
  self->_activityInProgress = a3;
}

- (SPSettingsConfigurating)spSession
{
  return self->_spSession;
}

- (void)setSpSession:(id)a3
{
  objc_storeStrong((id *)&self->_spSession, a3);
}

- (BOOL)offlineFindingEnabled
{
  return self->_offlineFindingEnabled;
}

- (void)setOfflineFindingEnabled:(BOOL)a3
{
  self->_offlineFindingEnabled = a3;
}

- (BOOL)offlineFindingDisabledDueToNotHSA2
{
  return self->_offlineFindingDisabledDueToNotHSA2;
}

- (void)setOfflineFindingDisabledDueToNotHSA2:(BOOL)a3
{
  self->_offlineFindingDisabledDueToNotHSA2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spSession, 0);
  objc_storeStrong((id *)&self->_hud, 0);
  objc_storeStrong((id *)&self->_sendLastLocationSpecifier, 0);
  objc_storeStrong((id *)&self->_fmipSpecifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)addHyperLinkStyleToText:(uint64_t)a1 inString:(NSObject *)a2 action:forGroup:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22AE37000, a2, OS_LOG_TYPE_ERROR, "Group must use %@ as footer cell class", (uint8_t *)&v2, 0xCu);
}

@end
