@implementation SettingsController

- (BOOL)shouldAllowCDPEnrollment
{
  char v2;
  void *v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v2 = CFPreferencesGetAppBooleanValue(CFSTR("UseCDP"), CFSTR("com.apple.corecdp"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/db/.AppleiCDPEnroll"));

  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[SettingsController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("CoreCDPInternalSettings"), self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_msgSend(v5, "mutableCopy");
    v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewDidLoad
{
  DummyWalrusStateController *v3;
  DummyWalrusStateController *walrusStateController;
  DummyWebAccessStateController *v5;
  DummyWebAccessStateController *webAccessStatusController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SettingsController;
  -[SettingsController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_alloc_init(DummyWalrusStateController);
  walrusStateController = self->_walrusStateController;
  self->_walrusStateController = v3;

  v5 = objc_alloc_init(DummyWebAccessStateController);
  webAccessStatusController = self->_webAccessStatusController;
  self->_webAccessStatusController = v5;

  -[SettingsController _loadSpecifiers](self, "_loadSpecifiers");
}

- (void)_loadSpecifiers
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SettingsController__loadSpecifiers__block_invoke;
  block[3] = &unk_24F824C48;
  block[4] = self;
  dispatch_async(v3, block);

}

void __37__SettingsController__loadSpecifiers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint64_t v32;

  v2 = objc_alloc_init(MEMORY[0x24BDB4398]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accountProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(MEMORY[0x24BE1A3D0], "isICDPEnabledForDSID:checkWithServer:", v6, 1);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "loadSpecifiersFromPlistName:target:", CFSTR("CoreCDPInternalSettings"), *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = (int)*MEMORY[0x24BE756E0];
  v12 = *(void **)(v10 + v11);
  *(_QWORD *)(v10 + v11) = v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BE75590];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enable iCDP on Sign-In"), *(_QWORD *)(a1 + 32), sel_setUserDefaultEnabled_specifier_, sel_getUserDefaultEnabled_, 0, 6, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", CFSTR("UseCDP"), *MEMORY[0x24BE75B50]);
    objc_msgSend(v19, "setProperty:forKey:", CFSTR("com.apple.corecdp"), *MEMORY[0x24BE759E8]);
    objc_msgSend(v19, "setProperty:forKey:", CFSTR("com.apple.corecdp.enable.changed"), *MEMORY[0x24BE75D98]);
    objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE759E0]);
    objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
LABEL_9:
    objc_msgSend(v13, "addObject:", v19);
    goto LABEL_10;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "username");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v7)
  {
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Enable iCDP for %@"), v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, *(_QWORD *)(a1 + 32), 0, 0, 0, 13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setButtonAction:", sel_enableCDP_);
    goto LABEL_9;
  }
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Enabled for %@"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, 0, 0, 0, 0, -1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  objc_msgSend(v13, "addObject:", v19);
  objc_msgSend(*(id *)(a1 + 32), "_recoverStingrayDataSpecifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v20);

  objc_msgSend(*(id *)(a1 + 32), "_recoverAndSyncrhonizeDataSpecifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v21);

  objc_msgSend(*(id *)(a1 + 32), "_recoveryKeySpecifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v22);

  objc_msgSend(*(id *)(a1 + 32), "_recoveryKeySpecifierRegen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v23);

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_enableWalrusSwitchCellSpecifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v25);

  objc_msgSend(*(id *)(a1 + 32), "_enableSwiftUIRemoteSecretFlowSwitchCellSpecifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v26);

  objc_msgSend(*(id *)(a1 + 32), "_enableCentralizedRPDFlow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v27);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SettingsController__loadSpecifiers__block_invoke_2;
  block[3] = &unk_24F824C20;
  v28 = *(_QWORD *)(a1 + 32);
  v31 = v13;
  v32 = v28;
  v29 = v13;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __37__SettingsController__loadSpecifiers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("iCloud Data Protection"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v2, 0);
    objc_msgSend(*(id *)(a1 + 40), "insertContiguousSpecifiers:atIndex:", *(_QWORD *)(a1 + 32), 0);

  }
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "_walrusSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSpecifiersFromArray:", v4);

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "_webAccessSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSpecifiersFromArray:", v6);

  return objc_msgSend(*(id *)(a1 + 40), "reload");
}

- (id)_enableCentralizedRPDFlow
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enable CentralizedRPDFlow"), self, sel_setUserDefaultEnabled_specifier_, sel_getUserDefaultEnabled_, 0, 6, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("CentralizedRPDFlow"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("com.apple.corecdp"), *MEMORY[0x24BE759E8]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE759E0]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v2;
}

- (id)_enableWalrusSwitchCellSpecifier
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enable Walrus"), self, sel_setUserDefaultEnabled_specifier_, sel_getUserDefaultEnabled_, 0, 6, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("EnableWalrus"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("com.apple.corecdp"), *MEMORY[0x24BE759E8]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE759E0]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v2;
}

- (id)_enableSwiftUIRemoteSecretFlowSwitchCellSpecifier
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enable SwiftUI Remote Secret Flow"), self, sel_setUserDefaultEnabled_specifier_, sel_getUserDefaultEnabled_, 0, 6, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("SwiftUIRemoteSecretFlow"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v2, "setProperty:forKey:", CFSTR("com.apple.corecdp"), *MEMORY[0x24BE759E8]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE759E0]);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v2;
}

- (id)getUserDefaultEnabled:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE759E8]);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75B50]);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  keyExistsAndHasValidFormat = 0;
  v6 = CFPreferencesGetAppBooleanValue(v5, v4, &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE759E0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "BOOLValue");

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setUserDefaultEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  const void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE759E8]);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75B50]);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v9, "BOOLValue"))
      v8 = v9;
    else
      v8 = 0;
    CFPreferencesSetAppValue(v7, v8, v6);
    CFPreferencesAppSynchronize(v6);
  }
  else
  {
    NSLog(CFSTR("CoreCDP: missing key on specifier: %@"), v5);
  }

}

- (id)_contextForPrimaryAccount
{
  return (id)objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
}

- (void)startSpinnerForSpecifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *MEMORY[0x24BE75A18];
  v4 = a3;
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v3);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 2);
    objc_msgSend(v5, "startAnimating");
    objc_msgSend(v6, "setAccessoryView:", v5);

  }
}

- (void)removeSpinnerFromSpecifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *MEMORY[0x24BE75A18];
  v4 = a3;
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v3);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setAccessoryView:", 0);
    v5 = v6;
  }

}

- (id)_recoveryKeySpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Generate Recovery Key - New"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel_generateNewRecoveryKey_);
  return v5;
}

- (id)_recoveryKeySpecifierRegen
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Generate Recovery Key - Regen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel_generateNewRecoveryKey_);
  return v5;
}

- (id)_walrusSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("Walrus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enabled"), self, 0, sel_walrusEnabled, 0, 6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Test Enable Walrus UI"), self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonAction:", sel_showEnableWalrusUI_);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Test Disable Walrus UI"), self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonAction:", sel_showDisableWalrusUI_);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Simulate ADP Upsell CFU"), self, 0, 0, 0, 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setButtonAction:", sel_simulateADPUpsell_);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  v10[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_webAccessSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("Web Access"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enabled"), self, 0, sel_webAccessEnabled, 0, 6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Test Enable Web Access UI"), self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonAction:", sel_showEnableWebAccessUI_);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Test Disable Web Access UI"), self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonAction:", sel_showDisableWebAccessUI_);
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)generateNewRecoveryKey:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v4 = (objc_class *)MEMORY[0x24BE1A490];
  v5 = a3;
  v6 = [v4 alloc];
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithContext:", v7);

  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v9, "hasSuffix:", CFSTR("Regen"));
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v5)
    v12 = 4;
  else
    v12 = 5;
  objc_msgSend(v10, "setType:", v12);

  v13 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithPresentingViewController:", v14);

  objc_msgSend(v15, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  objc_msgSend(v8, "setUiProvider:", v15);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __45__SettingsController_generateNewRecoveryKey___block_invoke;
  v16[3] = &unk_24F824C70;
  v16[4] = self;
  objc_msgSend(v8, "generateNewRecoveryKey:", v16);

}

void __45__SettingsController_generateNewRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popToViewController:animated:", *(_QWORD *)(a1 + 32), 1);

  if (objc_msgSend(v8, "code") != -5307 && objc_msgSend(v8, "code") != -5308)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failed to generate RK"), CFSTR("Somethng went wrong... File a radar to PEP CoreCDP"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (id)_recoverStingrayDataSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Restore Local Data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel__recoverStingrayData_);
  return v5;
}

- (void)_recoverStingrayData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[SettingsController startSpinnerForSpecifier:](self, "startSpinnerForSpecifier:", v4);
  v5 = objc_alloc(MEMORY[0x24BE1A490]);
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithContext:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__SettingsController__recoverStingrayData___block_invoke;
  v9[3] = &unk_24F824C98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "recoverWithSquirrel:", v9);

}

void __43__SettingsController__recoverStingrayData___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeSpinnerFromSpecifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)MEMORY[0x24BDF67F0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Result"), CFSTR("Recovered"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed: %@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Result"), v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v8);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
}

- (id)_recoverAndSyncrhonizeDataSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Restore Local Data and Synchronize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel__recoverAndSyncrhonizeStingrayData_);
  return v5;
}

- (void)_recoverAndSyncrhonizeStingrayData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[SettingsController startSpinnerForSpecifier:](self, "startSpinnerForSpecifier:", v4);
  v5 = objc_alloc(MEMORY[0x24BE1A490]);
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithContext:", v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SettingsController__recoverAndSyncrhonizeStingrayData___block_invoke;
  v9[3] = &unk_24F824C98;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "recoverAndSynchronizeWithSquirrel:", v9);

}

void __57__SettingsController__recoverAndSyncrhonizeStingrayData___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "removeSpinnerFromSpecifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)MEMORY[0x24BDF67F0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Result"), CFSTR("Recovered and synchronized"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed: %@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Result"), v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v8);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)enableCDP:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDB4398]);
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      -[SettingsController enableCDP:].cold.2(v6, v7);

    CFPreferencesSetAppValue(CFSTR("USeCDP"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.corecdp"));
    CFPreferencesSynchronize(CFSTR("com.apple.corecdp"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    v16 = objc_alloc_init(MEMORY[0x24BE0AE28]);
    objc_msgSend(v6, "accountProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("personID"));
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setDSID:", v7);
    objc_msgSend(v6, "username");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUsername:", v18);

    objc_msgSend(v16, "setIsUsernameEditable:", 0);
    objc_msgSend(v16, "setPresentingViewController:", self);
    objc_msgSend(v16, "setShouldForceInteractiveAuth:", 1);
    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(v4, "setProperty:forKey:", CFSTR("Enabling iCDP..."), *MEMORY[0x24BE75D50]);
    -[SettingsController reloadSpecifier:](self, "reloadSpecifier:", v4);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACC0]), "initWithIdentifier:", CFSTR("com.apple.corecdp.internal_prefs"));
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __32__SettingsController_enableCDP___block_invoke;
    v21[3] = &unk_24F824CE8;
    v21[4] = self;
    v22 = v16;
    v20 = v16;
    objc_msgSend(v19, "authenticateWithContext:completion:", v20, v21);

  }
  else if (v8)
  {
    -[SettingsController enableCDP:].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
  }

}

void __32__SettingsController_enableCDP___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD block[5];
  _QWORD v23[4];
  id v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __32__SettingsController_enableCDP___block_invoke_cold_2(v7, v9, v10, v11, v12, v13, v14, v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A490]), "initWithContext:", v16);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA18]), "initWithPresentingViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v17, "setUiProvider:", v18);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __32__SettingsController_enableCDP___block_invoke_140;
    v23[3] = &unk_24F824CC0;
    v19 = *(id *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 32);
    v24 = v19;
    v25 = v20;
    objc_msgSend(v17, "handleCloudDataProtectionStateWithCompletion:", v23);

  }
  else
  {
    if (v8)
      __32__SettingsController_enableCDP___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("iCDP Not Enabled"), CFSTR("iCDP was not enabled on your account because authentication failed"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v21);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v16, 1, 0);
    CFPreferencesSetAppValue(CFSTR("UseCDP"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.corecdp"));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__SettingsController_enableCDP___block_invoke_157;
    block[3] = &unk_24F824C48;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __32__SettingsController_enableCDP___block_invoke_140(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  _QWORD block[5];
  _QWORD v18[5];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    v20 = a2;
    v21 = 1024;
    v22 = a3;
    v23 = 2112;
    v24 = v7;
    _os_log_debug_impl(&dword_22D08A000, v8, OS_LOG_TYPE_DEBUG, "\"State machine finished with shouldCompleteSignIn=%i cloudDataProtectionEnabled=%i error=%@\", buf, 0x18u);
  }

  v9 = (void *)MEMORY[0x24BDF67F0];
  if (a2 && a3)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("iCDP has been successfuly enabled on your account (%@)"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", CFSTR("iCDP Enabled!"), v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("iCDP Not Enabled"), CFSTR("iCDP was not enabled on your account, please file a radar to PEP CoreCDP | 1.0"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("UseCDP"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.corecdp"));
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __32__SettingsController_enableCDP___block_invoke_149;
    v18[3] = &unk_24F824C48;
    v18[4] = *(_QWORD *)(a1 + 40);
    v14 = MEMORY[0x24BDAC9B8];
    v15 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("iCDP Enable Failed"), CFSTR("Something went wrong trying to enable iCDP on your account, please file a radar to PEP CoreCDP | 1.0"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("UseCDP"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.corecdp"));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__SettingsController_enableCDP___block_invoke_2;
    block[3] = &unk_24F824C48;
    block[4] = *(_QWORD *)(a1 + 40);
    v14 = MEMORY[0x24BDAC9B8];
    v15 = block;
  }
  dispatch_async(v14, v15);
  if (v13)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v13, 1, 0);
  }
LABEL_12:

}

uint64_t __32__SettingsController_enableCDP___block_invoke_149(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __32__SettingsController_enableCDP___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

uint64_t __32__SettingsController_enableCDP___block_invoke_157(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (BOOL)_offerRemoteApproval
{
  return CFPreferencesGetAppBooleanValue(CFSTR("OfferRemoteApproval"), CFSTR("com.apple.corecdp"), 0) != 0;
}

- (BOOL)_enableWalrus
{
  return CFPreferencesGetAppBooleanValue(CFSTR("EnableWalrus"), CFSTR("com.apple.corecdp"), 0) != 0;
}

- (BOOL)_didUseSMSVerification
{
  return CFPreferencesGetAppBooleanValue(CFSTR("DidUseSMS"), CFSTR("com.apple.corecdp"), 0) != 0;
}

- (BOOL)_forceInlineUI
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ForeceInLine"), CFSTR("com.apple.corecdp"), 0) != 0;
}

- (BOOL)_rkMandate
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AccountRecoveryRKMandate"), CFSTR("com.apple.corecdp"), 0) != 0;
}

- (id)_fakeDevicesWithExpectedSecret:(id)a3 isNumber:(BOOL)a4 numericLength:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];

  v6 = a4;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)CFPreferencesCopyAppValue(CFSTR("DevicePlatforms"), CFSTR("com.apple.corecdp"));
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:].cold.1();

  v11 = objc_alloc_init(MEMORY[0x24BE1A410]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("James' iPhone 1 (%@)"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocalizedName:", v12);

  objc_msgSend(v11, "setHasNumericSecret:", v6);
  objc_msgSend(v11, "setNumericSecretLength:", v8);
  if (objc_msgSend(v9, "integerValue") < 1)
  {
    objc_msgSend(v11, "setPlatform:", 1);
    objc_msgSend(v11, "setModelClass:", CFSTR("iPhone"));
    objc_msgSend(v11, "setModel:", CFSTR("iPhone 6"));
    v13 = CFSTR("iPhone8,1");
  }
  else
  {
    objc_msgSend(v11, "setPlatform:", 2);
    objc_msgSend(v11, "setModel:", CFSTR("Mac Pro"));
    objc_msgSend(v11, "setModelClass:", CFSTR("MacPro"));
    v13 = CFSTR("MacPro1,1");
  }
  objc_msgSend(v11, "setModelVersion:", v13);
  v14 = objc_alloc_init(MEMORY[0x24BE1A410]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("James' iPad 2 (%@)"), v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedName:", v15);

  objc_msgSend(v14, "setHasNumericSecret:", v6);
  objc_msgSend(v14, "setNumericSecretLength:", v8);
  v16 = objc_msgSend(v9, "integerValue");
  if (v16 == 1)
    v17 = CFSTR("MacBook Pro");
  else
    v17 = CFSTR("iPad Air");
  if (v16 == 1)
    v18 = CFSTR("MacBookPro11,1");
  else
    v18 = CFSTR("iPad4,1");
  if (v16 == 1)
    v19 = CFSTR("MacBookPro");
  else
    v19 = CFSTR("iPad");
  if (v16 == 1)
    v20 = 2;
  else
    v20 = 1;
  objc_msgSend(v14, "setModel:", v17);
  objc_msgSend(v14, "setModelVersion:", v18);
  objc_msgSend(v14, "setModelClass:", v19);
  objc_msgSend(v14, "setPlatform:", v20);
  v21 = (void *)CFPreferencesCopyAppValue(CFSTR("NumberOfDevices"), CFSTR("com.apple.corecdp"));
  v22 = v21;
  if (!v21)
    goto LABEL_22;
  v23 = objc_msgSend(v21, "integerValue");
  if (!v23)
  {
    v27 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_25;
  }
  if (v23 == 1)
  {
    v30[0] = v11;
    v24 = (void *)MEMORY[0x24BDBCE30];
    v25 = v30;
    v26 = 1;
  }
  else
  {
LABEL_22:
    v29[0] = v11;
    v29[1] = v14;
    v24 = (void *)MEMORY[0x24BDBCE30];
    v25 = v29;
    v26 = 2;
  }
  objc_msgSend(v24, "arrayWithObjects:count:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v27;
}

- (void)promptForLocalSecret:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPresentingViewController:", v5);

  objc_msgSend(v6, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  objc_msgSend(v6, "cdpContext:promptForLocalSecretWithCompletion:", v7, &__block_literal_global_0);

}

void __43__SettingsController_promptForLocalSecret___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __43__SettingsController_promptForLocalSecret___block_invoke_cold_2(v5, v6);

  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __43__SettingsController_promptForLocalSecret___block_invoke_cold_1(v4, v7);

}

- (void)promptFor4DigitRemoteSecret:(id)a3
{
  void *v4;
  DummyRemoteDeviceSecretValidator *v5;
  id v6;
  void *v7;
  CDPUIController *v8;
  CDPUIController *uiController;
  _BOOL8 v10;
  id v11;
  id v12;

  v12 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v12, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:](self, "_fakeDevicesWithExpectedSecret:isNumber:numericLength:", CFSTR("1234"), 1, &unk_24F826FE8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("1234"));
  v6 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (CDPUIController *)objc_msgSend(v6, "initWithPresentingViewController:", v7);
  uiController = self->_uiController;
  self->_uiController = v8;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  v10 = -[SettingsController _offerRemoteApproval](self, "_offerRemoteApproval");
  v11 = objc_alloc_init(MEMORY[0x24BE1A480]);
  objc_msgSend(v11, "setContext:", v12);
  objc_msgSend(v11, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  objc_msgSend(v11, "setRpdProbationDuration:", 0.0);
  objc_msgSend(v11, "setHasPeersForRemoteApproval:", v10);
  -[CDPUIController cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:](self->_uiController, "cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:", v11, v4, v5);

}

- (void)promptFor6DigitRemoteSecret:(id)a3
{
  id v4;
  void *v5;
  DummyRemoteDeviceSecretValidator *v6;
  id v7;
  void *v8;
  CDPUIController *v9;
  CDPUIController *uiController;
  _BOOL8 v11;
  id v12;
  id v13;

  v4 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  v13 = v4;
  objc_msgSend(v4, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:](self, "_fakeDevicesWithExpectedSecret:isNumber:numericLength:", CFSTR("123456"), 1, &unk_24F827000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("123456"));
  v7 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (CDPUIController *)objc_msgSend(v7, "initWithPresentingViewController:", v8);
  uiController = self->_uiController;
  self->_uiController = v9;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  if ((-[DummyRemoteDeviceSecretValidator supportedEscapeOfferMask](v6, "supportedEscapeOfferMask") & 8) != 0)
    objc_msgSend(v13, "setType:", 2);
  if ((-[DummyRemoteDeviceSecretValidator supportedEscapeOfferMask](v6, "supportedEscapeOfferMask") & 0x40) != 0)
    objc_msgSend(v13, "set_supportsCustodianRecovery:", 1);
  v11 = -[SettingsController _offerRemoteApproval](self, "_offerRemoteApproval");
  v12 = objc_alloc_init(MEMORY[0x24BE1A480]);
  objc_msgSend(v12, "setContext:", v13);
  objc_msgSend(v12, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  objc_msgSend(v12, "setRpdProbationDuration:", 0.0);
  objc_msgSend(v12, "setHasPeersForRemoteApproval:", v11);
  -[CDPUIController cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:](self->_uiController, "cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:", v12, v5, v6);

}

- (void)promptForCustomNumericRemoteSecret:(id)a3
{
  void *v4;
  DummyRemoteDeviceSecretValidator *v5;
  id v6;
  void *v7;
  CDPUIController *v8;
  CDPUIController *uiController;
  _BOOL8 v10;
  id v11;
  id v12;

  v12 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v12, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:](self, "_fakeDevicesWithExpectedSecret:isNumber:numericLength:", CFSTR("1234567"), 1, &unk_24F827018);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("1234567"));
  v6 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (CDPUIController *)objc_msgSend(v6, "initWithPresentingViewController:", v7);
  uiController = self->_uiController;
  self->_uiController = v8;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  v10 = -[SettingsController _offerRemoteApproval](self, "_offerRemoteApproval");
  v11 = objc_alloc_init(MEMORY[0x24BE1A480]);
  objc_msgSend(v11, "setContext:", v12);
  objc_msgSend(v11, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  objc_msgSend(v11, "setRpdProbationDuration:", 0.0);
  objc_msgSend(v11, "setHasPeersForRemoteApproval:", v10);
  -[CDPUIController cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:](self->_uiController, "cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:", v11, v4, v5);

}

- (void)promptForCustomAlphanumericRemoteSecret:(id)a3
{
  void *v4;
  DummyRemoteDeviceSecretValidator *v5;
  id v6;
  void *v7;
  CDPUIController *v8;
  CDPUIController *uiController;
  _BOOL8 v10;
  id v11;
  id v12;

  v12 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v12, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:](self, "_fakeDevicesWithExpectedSecret:isNumber:numericLength:", CFSTR("Chuck"), 0, &unk_24F827030);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("Chuck"));
  v6 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (CDPUIController *)objc_msgSend(v6, "initWithPresentingViewController:", v7);
  uiController = self->_uiController;
  self->_uiController = v8;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  v10 = -[SettingsController _offerRemoteApproval](self, "_offerRemoteApproval");
  v11 = objc_alloc_init(MEMORY[0x24BE1A480]);
  objc_msgSend(v11, "setContext:", v12);
  objc_msgSend(v11, "setIsWalrusEnabled:", -[SettingsController _enableWalrus](self, "_enableWalrus"));
  objc_msgSend(v11, "setRpdProbationDuration:", 0.0);
  objc_msgSend(v11, "setHasPeersForRemoteApproval:", v10);
  -[CDPUIController cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:](self->_uiController, "cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:", v11, v4, v5);

}

- (void)promptFor4DigitICSC:(id)a3
{
  DummyRemoteDeviceSecretValidator *v4;
  id v5;
  void *v6;
  CDPUIController *v7;
  CDPUIController *uiController;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  v4 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("1234"));
  v5 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CDPUIController *)objc_msgSend(v5, "initWithPresentingViewController:", v6);
  uiController = self->_uiController;
  self->_uiController = v7;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[CDPUIController cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](self->_uiController, "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", v9, 1, &unk_24F826FE8, 0, v4);

}

- (void)promptFor6DigitICSC:(id)a3
{
  DummyRemoteDeviceSecretValidator *v4;
  id v5;
  void *v6;
  CDPUIController *v7;
  CDPUIController *uiController;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  v4 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("123456"));
  v5 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CDPUIController *)objc_msgSend(v5, "initWithPresentingViewController:", v6);
  uiController = self->_uiController;
  self->_uiController = v7;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[CDPUIController cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](self->_uiController, "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", v9, 1, &unk_24F827000, 0, v4);

}

- (void)promptForComplexICSC:(id)a3
{
  DummyRemoteDeviceSecretValidator *v4;
  id v5;
  void *v6;
  CDPUIController *v7;
  CDPUIController *uiController;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  v4 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("Chuck"));
  v5 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CDPUIController *)objc_msgSend(v5, "initWithPresentingViewController:", v6);
  uiController = self->_uiController;
  self->_uiController = v7;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[CDPUIController cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](self->_uiController, "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", v9, 0, 0, 0, v4);

}

- (void)promptForRandomICSC:(id)a3
{
  DummyRemoteDeviceSecretValidator *v4;
  id v5;
  void *v6;
  CDPUIController *v7;
  CDPUIController *uiController;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  objc_msgSend(v9, "setDidUseSMSVerification:", -[SettingsController _didUseSMSVerification](self, "_didUseSMSVerification"));
  v4 = -[DummyRemoteDeviceSecretValidator initWithExpectedSecret:]([DummyRemoteDeviceSecretValidator alloc], "initWithExpectedSecret:", CFSTR("Chuck"));
  v5 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CDPUIController *)objc_msgSend(v5, "initWithPresentingViewController:", v6);
  uiController = self->_uiController;
  self->_uiController = v7;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[CDPUIController cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](self->_uiController, "cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:", v9, 0, 0, 1, v4);

}

- (void)beginIDMSRecoveryRK:(id)a3
{
  id v4;
  void *v5;
  CDPUIController *v6;
  CDPUIController *uiController;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CDPUIController *)objc_msgSend(v4, "initWithPresentingViewController:", v5);
  uiController = self->_uiController;
  self->_uiController = v6;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdmsMasterKeyRecovery:", 1);
  objc_msgSend(v8, "setMandatesRecoveryKey:", -[SettingsController _rkMandate](self, "_rkMandate"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A478]), "initWithContext:", v8);
  objc_msgSend(v9, "setUiProvider:", self->_uiController);
  objc_msgSend(v9, "setAuthProvider:", self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__SettingsController_beginIDMSRecoveryRK___block_invoke;
  v10[3] = &unk_24F824D50;
  v10[4] = self;
  objc_msgSend(v9, "performRecovery:", v10);

}

void __42__SettingsController_beginIDMSRecoveryRK___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDF67F0];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a2;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Recovered: %@. Error: %ld"), v7, objc_msgSend(a3, "code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failure"), v8, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v9);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)beginIDMSRecoveryWithRKSkip:(id)a3
{
  id v4;
  void *v5;
  CDPUIController *v6;
  CDPUIController *uiController;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CDPUIController *)objc_msgSend(v4, "initWithPresentingViewController:", v5);
  uiController = self->_uiController;
  self->_uiController = v6;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdmsMasterKeyRecovery:", 1);
  objc_msgSend(v8, "setMandatesRecoveryKey:", -[SettingsController _rkMandate](self, "_rkMandate"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A478]), "initWithContext:", v8);
  objc_msgSend(v9, "setUiProvider:", self->_uiController);
  objc_msgSend(v9, "setAuthProvider:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A9D0]), "initWithConnection:entitlements:clientType:", 0, 8, 0);
  v11 = objc_alloc(MEMORY[0x24BE1A498]);
  objc_msgSend(v9, "uiProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithUIProvider:", v12);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__SettingsController_beginIDMSRecoveryWithRKSkip___block_invoke;
  v14[3] = &unk_24F824D50;
  v14[4] = self;
  objc_msgSend(v10, "performRecoveryWithContext:uiProvider:authProvider:completion:", v8, v13, 0, v14);

}

void __50__SettingsController_beginIDMSRecoveryWithRKSkip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x24BDF67F0];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a2;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Recovered: %@. Error: %ld"), v7, objc_msgSend(a3, "code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failure"), v8, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v9);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a5;
  v6 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SettingsController_cdpContext_verifyMasterKey_completion___block_invoke;
  block[3] = &unk_24F824BB8;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

uint64_t __60__SettingsController_cdpContext_verifyMasterKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginIDMSRecovery:(id)a3
{
  CDPRecoveryTestController *v4;
  void *v5;
  void *v6;
  CDPRecoveryTestController *v7;
  CDPRecoveryTestController *recoveryTestController;

  v4 = [CDPRecoveryTestController alloc];
  -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:](self, "_fakeDevicesWithExpectedSecret:isNumber:numericLength:", CFSTR("1234567"), 1, &unk_24F827018);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SettingsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPRecoveryTestController initWithDevices:andNavigationController:](v4, "initWithDevices:andNavigationController:", v5, v6);
  recoveryTestController = self->_recoveryTestController;
  self->_recoveryTestController = v7;

  -[CDPRecoveryTestController beginIDMSRecoveryFlow](self->_recoveryTestController, "beginIDMSRecoveryFlow");
}

- (void)beginFMIPRecovery:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend((id)v12[5], "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDSID:", v7);

  objc_msgSend((id)v12[5], "appleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v8);

  objc_msgSend(v5, "setIsUsernameEditable:", 0);
  objc_msgSend(v5, "setPresentingViewController:", self);
  objc_msgSend(v5, "setShouldForceInteractiveAuth:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACC0]), "initWithIdentifier:", CFSTR("com.apple.corecdp.internal_prefs"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__SettingsController_beginFMIPRecovery___block_invoke;
  v10[3] = &unk_24F824D78;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v9, "authenticateWithContext:completion:", v5, v10);

  _Block_object_dispose(&v11, 8);
}

void __40__SettingsController_beginFMIPRecovery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x24BE1A3F8];
    v7 = a2;
    v8 = objc_msgSend([v6 alloc], "initWithAuthenticationResults:", v7);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setGuestMode:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFindMyiPhoneUUID:", CFSTR("1234"));
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE1A478]), "initWithContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1400);
    *(_QWORD *)(v12 + 1400) = v11;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA18]), "initWithPresentingViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setUiProvider:", v14);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 1400);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __40__SettingsController_beginFMIPRecovery___block_invoke_2;
    v18[3] = &unk_24F824CE8;
    v16 = v5;
    v17 = *(_QWORD *)(a1 + 32);
    v19 = v16;
    v20 = v17;
    objc_msgSend(v15, "performRecovery:", v18);

  }
}

void __40__SettingsController_beginFMIPRecovery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE1A320]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDF67F0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Success"), CFSTR("FMIP present"), 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FMIP are missing, error: %@"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failure"), v5, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v6);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)beginIDMSRecoveryPrimary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend((id)v12[5], "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDSID:", v7);

  objc_msgSend((id)v12[5], "appleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v8);

  objc_msgSend(v5, "setIsUsernameEditable:", 0);
  objc_msgSend(v5, "setPresentingViewController:", self);
  objc_msgSend(v5, "setShouldForceInteractiveAuth:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACC0]), "initWithIdentifier:", CFSTR("com.apple.corecdp.internal_prefs"));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke;
  v10[3] = &unk_24F824D78;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v9, "authenticateWithContext:completion:", v5, v10);

  _Block_object_dispose(&v11, 8);
}

void __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x24BE1A3F8];
    v7 = a2;
    v8 = objc_msgSend([v6 alloc], "initWithAuthenticationResults:", v7);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIdmsRecovery:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setGuestMode:", 1);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE1A478]), "initWithContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1400);
    *(_QWORD *)(v12 + 1400) = v11;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA10]), "initWithPresentingViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setUiProvider:", v14);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 1400);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke_2;
    v18[3] = &unk_24F824CE8;
    v16 = v5;
    v17 = *(_QWORD *)(a1 + 32);
    v19 = v16;
    v20 = v17;
    objc_msgSend(v15, "performRecovery:", v18);

  }
}

void __47__SettingsController_beginIDMSRecoveryPrimary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE1A340]);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE1A338]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Success"), CFSTR("PRK + MID present"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PRK + MID are missing, error: %@"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failure"), v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)beginIDMSRecoveryWithFailure:(id)a3
{
  CDPRecoveryTestController *v4;
  void *v5;
  void *v6;
  CDPRecoveryTestController *v7;
  CDPRecoveryTestController *recoveryTestController;

  v4 = [CDPRecoveryTestController alloc];
  -[SettingsController _fakeDevicesWithExpectedSecret:isNumber:numericLength:](self, "_fakeDevicesWithExpectedSecret:isNumber:numericLength:", CFSTR("1234567"), 1, &unk_24F827018);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SettingsController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPRecoveryTestController initWithDevices:andNavigationController:](v4, "initWithDevices:andNavigationController:", v5, v6);
  recoveryTestController = self->_recoveryTestController;
  self->_recoveryTestController = v7;

  -[CDPRecoveryTestController beginIDMSRecoveryFlowWithSecretFailure](self->_recoveryTestController, "beginIDMSRecoveryFlowWithSecretFailure");
}

- (void)deviceToDeviceAccountUpgradeCardUI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = objc_alloc(MEMORY[0x24BE1AA20]);
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryAccountAltDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "initWithAltDSID:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA28]), "initWithContext:", v8);
  objc_msgSend(v8, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 1);
  objc_msgSend(v8, "setDeviceToDeviceEncryptionUpgradeType:", 0);
  objc_msgSend(v8, "setFeatureName:", CFSTR("Account Upgrade Flow - Card UI"));
  objc_msgSend(v8, "setPresentingViewController:", self);
  objc_msgSend(v7, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", 0);

}

- (void)startBeneficiaryFlow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CDPUIController *v8;
  CDPUIController *uiController;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x24BE1A3F8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1880]);
  objc_msgSend(v10, "setBeneficiaryIdentifier:", v4);

  objc_msgSend(CFSTR("ABCD"), "aaf_toBase64DecodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBeneficiaryWrappedKeyData:", v5);

  v6 = objc_alloc(MEMORY[0x24BE1AA18]);
  -[SettingsController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (CDPUIController *)objc_msgSend(v6, "initWithPresentingViewController:", v7);
  uiController = self->_uiController;
  self->_uiController = v8;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", -[SettingsController _forceInlineUI](self, "_forceInlineUI"));
  -[CDPUIController cdpContext:promptForBeneficiaryAccessKeyWithCompletion:](self->_uiController, "cdpContext:promptForBeneficiaryAccessKeyWithCompletion:", v10, &__block_literal_global_247);

}

- (void)_showStatusChangeUIFor:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = (objc_class *)MEMORY[0x24BE1AA30];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithModel:", v5);

  v7 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__SettingsController__showStatusChangeUIFor___block_invoke;
  v9[3] = &unk_24F824DE0;
  v9[4] = self;
  objc_msgSend(v6, "setUserActionCallback:", v9);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __45__SettingsController__showStatusChangeUIFor___block_invoke_2;
  v8[3] = &unk_24F824E08;
  v8[4] = self;
  objc_msgSend(v6, "setCompletionCallback:", v8);
  objc_msgSend(v6, "presentWithViewController:presentationType:", self, 2);

}

void __45__SettingsController__showStatusChangeUIFor___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  void *v4;
  id v5;

  if (a2)
    v3 = CFSTR("Approved");
  else
    v3 = CFSTR("Declined");
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("User choice callback made"), v3, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
}

uint64_t __45__SettingsController__showStatusChangeUIFor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reload");
}

- (void)_showWalrusChangeUI:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA38]), "initWithTargetStatus:statusProvider:statusUpdater:", a3, self->_walrusStateController, self->_walrusStateController);
  -[SettingsController _showStatusChangeUIFor:](self, "_showStatusChangeUIFor:", v4);

}

- (void)showEnableWalrusUI:(id)a3
{
  -[SettingsController _showWalrusChangeUI:](self, "_showWalrusChangeUI:", 1);
}

- (void)showDisableWalrusUI:(id)a3
{
  -[SettingsController _showWalrusChangeUI:](self, "_showWalrusChangeUI:", 2);
}

- (void)_showWebAccessChangeUI:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1AA48]), "initWithTargetStatus:statusProvider:statusUpdater:walrusStatusProvider:", a3, self->_webAccessStatusController, self->_webAccessStatusController, self->_walrusStateController);
  -[SettingsController _showStatusChangeUIFor:](self, "_showStatusChangeUIFor:", v4);

}

- (void)showEnableWebAccessUI:(id)a3
{
  -[SettingsController _showWebAccessChangeUI:](self, "_showWebAccessChangeUI:", 1);
}

- (void)showDisableWebAccessUI:(id)a3
{
  -[SettingsController _showWebAccessChangeUI:](self, "_showWebAccessChangeUI:", 2);
}

- (id)webAccessEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DummyWebAccessStateController webAccessStatus:](self->_webAccessStatusController, "webAccessStatus:", 0) == 1);
}

- (void)setWebAccessStatus:(BOOL)a3
{
  DummyWebAccessStateController *webAccessStatusController;
  uint64_t v4;

  webAccessStatusController = self->_webAccessStatusController;
  if (a3)
    v4 = 1;
  else
    v4 = 2;
  -[DummyWebAccessStateController updateWebAccessStatus:completion:](webAccessStatusController, "updateWebAccessStatus:completion:", v4, &__block_literal_global_260);
}

- (id)walrusEnabled
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[DummyWalrusStateController walrusStatus:](self->_walrusStateController, "walrusStatus:", 0) == 1);
}

- (void)setWalrusStatus:(BOOL)a3
{
  DummyWalrusStateController *walrusStateController;
  uint64_t v4;

  walrusStateController = self->_walrusStateController;
  if (a3)
    v4 = 1;
  else
    v4 = 2;
  -[DummyWalrusStateController updateWalrusStatus:completion:](walrusStateController, "updateWalrusStatus:completion:", v4, &__block_literal_global_261);
}

- (void)simulateADPUpsell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[SettingsController _contextForPrimaryAccount](self, "_contextForPrimaryAccount", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE1AA40]);
  objc_msgSend(MEMORY[0x24BE0ADF0], "sharedBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0ADA8], "sharedNetworkObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SettingsController_simulateADPUpsell___block_invoke;
  v8[3] = &unk_24F824E90;
  v8[4] = self;
  objc_msgSend(v5, "makeSwiftUIUpsellViewWithCDPContext:urlBag:networkObserver:viewModelDelegate:completion:", v4, v6, v7, self, v8);

}

uint64_t __40__SettingsController_simulateADPUpsell___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", a2, 1, 0);
}

- (void)beginEnablementFlow:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Began Enablement Flow"), 0, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);

  -[SettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)presentAccountRecoveryFlow
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Account Recovery Flow"), 0, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v3);

  -[SettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
}

- (void)upsellViewModelDidRequestBeginEnablementFlow
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Began Enablement Flow"), 0, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v3);

  -[SettingsController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)upsellViewModelDidRequestCFUDismissal
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Requested CFU dismissal"), 0, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v3);

  -[SettingsController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)upsellViewModelDidRequestFlowCancellation
{
  -[SettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccessStatusController, 0);
  objc_storeStrong((id *)&self->_walrusStateController, 0);
  objc_storeStrong((id *)&self->_recoveryController, 0);
  objc_storeStrong((id *)&self->_recoveryTestController, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
}

- (void)enableCDP:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D08A000, a1, a3, "\"No primary account present, not running CDP state machine\", a5, a6, a7, a8, 0);
}

- (void)enableCDP:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D08A000, a2, v4, "\"Primary account is present (%@), will try to auth\", v5);

  OUTLINED_FUNCTION_2();
}

void __32__SettingsController_enableCDP___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D08A000, v0, v1, "\"Authentication failed with error %@\", v2);
}

void __32__SettingsController_enableCDP___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22D08A000, a1, a3, "\"Authentication succeeded, starting up the state machine\", a5, a6, a7, a8, 0);
}

- (void)_fakeDevicesWithExpectedSecret:isNumber:numericLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D08A000, v0, v1, "\"Platforms: %@\", v2);
}

void __43__SettingsController_promptForLocalSecret___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "validatedSecret");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 1024;
  v8 = objc_msgSend(a1, "secretType");
  _os_log_debug_impl(&dword_22D08A000, a2, OS_LOG_TYPE_DEBUG, "\"User entered secret %@ of type %ul\", (uint8_t *)&v5, 0x12u);

}

void __43__SettingsController_promptForLocalSecret___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22D08A000, a2, v4, "\"Error when collecting local secret: %@\", v5);

  OUTLINED_FUNCTION_2();
}

@end
