@implementation AUDeveloperSettingsAboutListController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUDeveloperSettingsAboutListController;
  -[AUDeveloperSettingsAboutListController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  AUObserverXPC *v4;
  AUObserverXPC *observer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUDeveloperSettingsAboutListController;
  -[AUDeveloperSettingsAboutListController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[AUDeveloperSettingsAboutListController reloadSpecifier:](self, "reloadSpecifier:", self->_assetLocationSpecifier);
  -[AUDeveloperSettingsAboutListController reloadSpecifier:](self, "reloadSpecifier:", self->_supplementalAssetLocationSpecifier);
  if (!self->_observer)
  {
    v4 = objc_alloc_init(AUObserverXPC);
    observer = self->_observer;
    self->_observer = v4;

    -[AUObserverXPC registerClient:](self->_observer, "registerClient:", self);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AUDeveloperSettingsAboutListController;
  -[AUDeveloperSettingsAboutListController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (id)specifiers
{
  AUDeveloperSettingsAboutListController *v2;
  id v3;
  uint64_t v4;
  PSSpecifier *accessoryInfoGroupSpecifier;
  void *v6;
  uint64_t v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  PSSpecifier *authListingEnabledSwitchSpecifier;
  uint64_t v48;
  PSSpecifier *updateNowButtonSpecifier;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  __CFString *v61;
  void *v62;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("About"), v2, 0, 0, 0, 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  accessoryInfoGroupSpecifier = v2->_accessoryInfoGroupSpecifier;
  v2->_accessoryInfoGroupSpecifier = (PSSpecifier *)v4;

  objc_msgSend(v3, "addObject:", v2->_accessoryInfoGroupSpecifier);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Serial Number"), v2, 0, sel_getSerialNumber_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE759C8];
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Disable OTA Updates"), v2, sel_setOTADisableStatus_specifier_, sel_isOTADisabled_, 0, 6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);
  -[AUDeveloperSettingsAboutListController getModelNumber:](v2, "getModelNumber:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Model Number"), v2, 0, sel_getModelNumber_, 0, 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v7);
    objc_msgSend(v3, "addObject:", v10);

  }
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Fusing"), v2, 0, sel_getFusing_, 0, 4, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v7);
  objc_msgSend(v3, "addObject:", v62);
  -[AUDeveloperSettingsAboutListController getHWRevision:](v2, "getHWRevision:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Hardware Revision"), v2, 0, sel_getHWRevision_, 0, 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v7);
    objc_msgSend(v3, "addObject:", v12);

  }
  -[AUDeveloperSettingsAboutListController getActiveVersion:](v2, "getActiveVersion:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Active Version"), v2, 0, sel_getActiveVersion_, 0, 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v7);
    objc_msgSend(v3, "addObject:", v14);

  }
  -[AUDeveloperSettingsAboutListController getDropboxVersion:](v2, "getDropboxVersion:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Dropbox Version"), v2, 0, sel_getDropboxVersion_, 0, 4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_removedSpecifier_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v17, *MEMORY[0x24BE759F0]);

    objc_msgSend(v16, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v3, "addObject:", v16);
  }
  else
  {
    -[AUDeveloperSettingsAboutListController getAssetURLOverride:](v2, "getAssetURLOverride:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Asset URL Override"), v2, 0, sel_getAssetURLOverride_, 0, 4, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v7);
      objc_msgSend(v3, "addObject:", v19);

    }
    v20 = (void *)MEMORY[0x24BE75590];
    objc_opt_class();
    objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUDeveloperSettingsAboutListController specifier](v2, "specifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperties:", v22);

    v23 = objc_opt_class();
    v58 = *MEMORY[0x24BE75948];
    objc_msgSend(v16, "setProperty:forKey:", v23);
    -[AUDeveloperSettingsAboutListController specifier](v2, "specifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setProperty:forKey:", v25);

    objc_msgSend(v16, "setProperty:forKey:", CFSTR("assetLocation"), CFSTR("assetLocation"));
    objc_msgSend(v16, "setProperty:forKey:", CFSTR("basejumperTrain"), CFSTR("basejumperTrain"));
    objc_msgSend(v16, "setProperty:forKey:", CFSTR("basejumperBuild"), CFSTR("basejumperBuild"));
    objc_storeStrong((id *)&v2->_assetLocationSpecifier, v16);
    objc_msgSend(v3, "addObject:", v16);
    -[AUDeveloperSettingsAboutListController specifier](v2, "specifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUDeveloperSettingsAboutListController getSupplementalAssetLocation:](v2, "getSupplementalAssetLocation:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v60 = (void *)v27;
    if (v27)
    {
      -[AUDeveloperSettingsAboutListController specifier](v2, "specifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AUDeveloperSettingsAboutListController getModelNumber:](v2, "getModelNumber:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v57 = (void *)v29;
      objc_msgSend(MEMORY[0x24BE28A18], "findByAppleModelNumber:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("Supplemental Asset Location");
      v59 = v30;
      objc_msgSend(v30, "supplementalAssets");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        v55 = v8;
        v56 = v6;
        objc_msgSend(v59, "supplementalAssets");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "allObjects");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "objectAtIndex:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v35, "componentsSeparatedByString:", CFSTR("-"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("%@ %@"), v38, CFSTR("Asset Location"));
        v39 = objc_claimAutoreleasedReturnValue();

        v61 = (__CFString *)v39;
        v8 = v55;
        v6 = v56;
      }
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v61, v2, 0, sel_getSupplementalAssetLocation_, objc_opt_class(), 2, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[AUDeveloperSettingsAboutListController specifier](v2, "specifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "properties");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setProperties:", v42);

      objc_msgSend(v40, "setProperty:forKey:", objc_opt_class(), v58);
      -[AUDeveloperSettingsAboutListController specifier](v2, "specifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setProperty:forKey:", v44, CFSTR("serialNumber"));

      objc_msgSend(v40, "setProperty:forKey:", CFSTR("supplementalAssetLocation"), CFSTR("assetLocation"));
      objc_msgSend(v40, "setProperty:forKey:", CFSTR("supplementalBasejumperTrain"), CFSTR("basejumperTrain"));
      objc_msgSend(v40, "setProperty:forKey:", CFSTR("supplementalBasejumperBuild"), CFSTR("basejumperBuild"));
      objc_storeStrong((id *)&v2->_supplementalAssetLocationSpecifier, v40);
      objc_msgSend(v3, "addObject:", v40);

    }
  }

  if (-[AUDeveloperSettingsAboutListController shouldDisplayAuthListingOption](v2, "shouldDisplayAuthListingOption"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Downloaded Version"), v2, 0, sel_getDownloadedVersion_, 0, 4, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v7);
    objc_msgSend(v3, "addObject:", v45);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Enable Auth Listing"), v2, sel_setAuthListingStatus_, sel_isAuthListingEnabled, 0, 6, 0);
    v46 = objc_claimAutoreleasedReturnValue();
    authListingEnabledSwitchSpecifier = v2->_authListingEnabledSwitchSpecifier;
    v2->_authListingEnabledSwitchSpecifier = (PSSpecifier *)v46;

    objc_msgSend(v3, "addObject:", v2->_authListingEnabledSwitchSpecifier);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Update Now"), v2, 0, 0, 0, 13, 0);
    v48 = objc_claimAutoreleasedReturnValue();
    updateNowButtonSpecifier = v2->_updateNowButtonSpecifier;
    v2->_updateNowButtonSpecifier = (PSSpecifier *)v48;

    -[PSSpecifier setProperty:forKey:](v2->_updateNowButtonSpecifier, "setProperty:forKey:", CFSTR("Update Now"), *MEMORY[0x24BE75D50]);
    -[PSSpecifier setButtonAction:](v2->_updateNowButtonSpecifier, "setButtonAction:", sel_updateNow);
    objc_msgSend(v3, "addObject:", v2->_updateNowButtonSpecifier);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (int)*MEMORY[0x24BE756E0];
  v52 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v51);
  *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v51) = (Class)v50;

  v53 = *(id *)((char *)&v2->super.super.super.super.super.super.isa + v51);
  objc_sync_exit(v2);

  return v53;
}

- (void)setOTADisableStatus:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("isOTADisabled"));
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAccessoryWithSerialNumber:info:", v11, v14);

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController settingsChangedForSerialNumber:](self, "settingsChangedForSerialNumber:", v13);

}

- (id)isOTADisabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isOTADisabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)MEMORY[0x24BDBD1C0];

  return v8;
}

- (BOOL)shouldDisplayAuthListingOption
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalizationRequired"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authListingEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setAuthListingStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("authListingEnabled"));
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAccessoryWithSerialNumber:info:", v10, v11);

}

- (id)isAuthListingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authListingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)MEMORY[0x24BDBD1C0];

  return v7;
}

- (void)updateNow
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AUDeveloperSettingsAboutListController_updateNow__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __51__AUDeveloperSettingsAboutListController_updateNow__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v3 = *MEMORY[0x24BE75988];
  v6[0] = *MEMORY[0x24BE75990];
  v6[1] = v3;
  v7[0] = CFSTR("Update Now");
  v7[1] = CFSTR("If this accessory is not auth listed, select 'Update Now' to personalize FW via AppleConnect (prompt should show in the next couple seconds). Otherwise, enable auth listing and the updates will run automatically.");
  v4 = *MEMORY[0x24BE75970];
  v6[2] = *MEMORY[0x24BE75980];
  v6[3] = v4;
  v7[2] = CFSTR("Ok");
  v7[3] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupWithDictionary:", v5);

  objc_msgSend(v2, "setTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setConfirmationAction:", sel_confirmUpdateNow);
  objc_msgSend(*(id *)(a1 + 32), "showConfirmationViewForSpecifier:", v2);

}

- (void)confirmUpdateNow
{
  void *v3;
  id v4;
  id v5;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController getModelNumber:](self, "getModelNumber:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%@"), "com.apple.accessoryUpdater.uarp.fwUpdateNow.", v5);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v4, "UTF8String"));

}

- (id)getDownloadedVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("downloadedVersion"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = CFSTR("-");
  v8 = v6;

  return v8;
}

- (id)getSerialNumber:(id)a3
{
  void *v3;
  void *v4;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getModelNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getFusing:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fusing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getActiveVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activeVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getDropboxVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dropboxVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getHWRevision:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hwRevision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getAssetURLOverride:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetURLOverride"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getFirmwareAssetLocation:(id)a3
{
  return -[AUDeveloperSettingsAboutListController getAssetLocationForSupplementalAsset:](self, "getAssetLocationForSupplementalAsset:", 0);
}

- (id)getSupplementalAssetLocation:(id)a3
{
  return -[AUDeveloperSettingsAboutListController getAssetLocationForSupplementalAsset:](self, "getAssetLocationForSupplementalAsset:", 1);
}

- (id)getAssetLocationForSupplementalAsset:(BOOL)a3
{
  _BOOL4 v3;
  __CFString **v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString **v11;
  BOOL v12;
  __CFString *v13;
  __CFString **v14;
  __CFString *v15;
  void *v16;
  void *v17;
  BOOL v18;
  __CFString *v19;

  v3 = a3;
  v5 = kSupplementalAssetLocationKey;
  if (!a3)
    v5 = kAssetLocationKey;
  v6 = *v5;
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (AUDeveloperSettingsURLStringToType(v10) == 5)
    {
      v11 = kSupplementalBasejumperTrainKey;
      v12 = !v3;
      if (!v3)
        v11 = kBasejumperTrainKey;
      v13 = *v11;
      v14 = kSupplementalBasejumperBuildKey;
      if (v12)
        v14 = kBasejumperBuildKey;
      v15 = *v14;
      objc_msgSend(v9, "objectForKeyedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        v18 = v17 == 0;
      else
        v18 = 1;
      if (v18)
      {
        v19 = &stru_24DFF2410;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v16, v17);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_19;
    }
    if (AUDeveloperSettingsURLStringToType(v10) == 6)
    {
      v19 = CFSTR("Customer Staging");
LABEL_19:

      v10 = v19;
    }
  }

  return v10;
}

- (BOOL)currentSpecifierMatchesAccessoryID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *activePartnerSerialNumber;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *v16;

  v4 = a3;
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController getSerialNumber:](self, "getSerialNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "serialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if (v8)
  {
    activePartnerSerialNumber = self->_activePartnerSerialNumber;
    self->_activePartnerSerialNumber = 0;
    LOBYTE(v10) = 1;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v4, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", self->_activePartnerSerialNumber);

  if ((v12 & 1) == 0)
  {
    getInfoForAccessory(v6);
    activePartnerSerialNumber = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(activePartnerSerialNumber, "objectForKeyedSubscript:", CFSTR("partnerSerialNumbers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "containsObject:", v14);

    if (v10)
    {
      objc_msgSend(v4, "serialNumber");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      v16 = self->_activePartnerSerialNumber;
      self->_activePartnerSerialNumber = v15;

    }
    goto LABEL_8;
  }
  LOBYTE(v10) = 1;
LABEL_9:

  return v10;
}

- (void)removedSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController getModelNumber:](self, "getModelNumber:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController getFusing:](self, "getFusing:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AUObserverXPC clearDropboxForModelNumber:withFusing:](self->_observer, "clearDropboxForModelNumber:withFusing:", v10, v7);
  -[AUDeveloperSettingsAboutListController removeSpecifier:](self, "removeSpecifier:", v4);

  -[AUDeveloperSettingsAboutListController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsAboutListController settingsChangedForSerialNumber:](self, "settingsChangedForSerialNumber:", v9);

  -[AUDeveloperSettingsAboutListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)settingsChangedForSerialNumber:(id)a3
{
  -[AUObserverXPC settingsChangedForSerialNumber:](self->_observer, "settingsChangedForSerialNumber:", a3);
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[AUDeveloperSettingsAboutListController currentSpecifierMatchesAccessoryID:](self, "currentSpecifierMatchesAccessoryID:", v6))
  {
    -[AUDeveloperSettingsAboutListController cleanupProgress](self, "cleanupProgress");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Accessory connected: %@ with asset: %@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)cleanupProgress
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AUDeveloperSettingsAboutListController_cleanupProgress__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__AUDeveloperSettingsAboutListController_cleanupProgress__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "clearProgress");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "refreshContentsWithSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1416);
  *(_QWORD *)(v2 + 1416) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1448);
  *(_QWORD *)(v4 + 1448) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)removeAccessoryID:(id)a3
{
  id v4;
  _QWORD block[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[AUDeveloperSettingsAboutListController currentSpecifierMatchesAccessoryID:](self, "currentSpecifierMatchesAccessoryID:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Accessory disconnected: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__AUDeveloperSettingsAboutListController_removeAccessoryID___block_invoke;
    block[3] = &unk_24DFEE8F8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __60__AUDeveloperSettingsAboutListController_removeAccessoryID___block_invoke(uint64_t a1)
{
  __CFString *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "objectForKeyedSubscript:", CFSTR("AUSettingsProgressComplete"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "progressIsComplete"))
      v2 = (__CFString *)*(id *)(*(_QWORD *)(a1 + 32) + 1440);
    else
      v2 = CFSTR("stopped due to disconnect");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", CFSTR("YES"), CFSTR("AUSettingsProgressComplete"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", v2, CFSTR("AUSettingsProgressKeyBuild"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", 0, CFSTR("AUSettingsProgressKeyBytesSent"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", 0, CFSTR("AUSettingsProgressKeyBytesTotal"));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1448);
    *(_QWORD *)(v3 + 1448) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "refreshContentsWithSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));

  }
}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  NSString *v12;
  NSString *v13;
  NSString *assetVersion;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  PSSpecifier *accessoryInfoGroupSpecifier;
  NSString *activePartnerSerialNumber;
  void *v21;
  PSSpecifier *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  __CFString *v26;
  void *v27;

  v10 = a3;
  v11 = a4;
  v12 = self->_activePartnerSerialNumber;
  if (-[AUDeveloperSettingsAboutListController currentSpecifierMatchesAccessoryID:](self, "currentSpecifierMatchesAccessoryID:", v10))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[AUDeveloperSettingsAboutListController firmwareUpdateProgressForAccessoryID:assetID:bytesSent:bytesTotal:].cold.1((uint64_t)v10, a5, a6);
    if (!self->_progressView)
    {
      objc_msgSend(v11, "assetVersion");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      assetVersion = self->_assetVersion;
      self->_assetVersion = v13;

      -[AUDeveloperSettingsAboutListController performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", sel_backgroundSetupUI, 0);
    }
    if (-[NSString length](self->_assetVersion, "length"))
      v15 = self->_assetVersion;
    else
      v15 = CFSTR("Unknown");
    v26 = (__CFString *)v15;
    -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", v15, CFSTR("AUSettingsProgressKeyBuild"));
    -[PSSpecifier objectForKeyedSubscript:](self->_accessoryInfoGroupSpecifier, "objectForKeyedSubscript:", CFSTR("AUSettingsProgressKeyBytesSent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier objectForKeyedSubscript:](self->_accessoryInfoGroupSpecifier, "objectForKeyedSubscript:", CFSTR("AUSettingsProgressComplete"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16
      || objc_msgSend(v17, "compare:", v16) == 1
      || !-[NSString isEqualToString:](v12, "isEqualToString:", self->_activePartnerSerialNumber)
      || objc_msgSend(v27, "BOOLValue"))
    {
      v24 = v12;
      v18 = v11;
      accessoryInfoGroupSpecifier = self->_accessoryInfoGroupSpecifier;
      activePartnerSerialNumber = self->_activePartnerSerialNumber;
      if (activePartnerSerialNumber)
      {
        -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", activePartnerSerialNumber, CFSTR("kAUSettingsProgressActiveSerialNumber"));
      }
      else
      {
        objc_msgSend(v10, "serialNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](accessoryInfoGroupSpecifier, "setProperty:forKey:", v21, CFSTR("kAUSettingsProgressActiveSerialNumber"));

      }
      -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", CFSTR("NO"), CFSTR("AUSettingsProgressComplete"), v24);
      -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", v17, CFSTR("AUSettingsProgressKeyBytesSent"));
      v22 = self->_accessoryInfoGroupSpecifier;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v22, "setProperty:forKey:", v23, CFSTR("AUSettingsProgressKeyBytesTotal"));

      v11 = v18;
      v12 = v25;
    }
    -[AUDeveloperSettingsAboutListController performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", sel_backgroundUpdateProgress, 0);

  }
}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  _BOOL4 v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSString *v15;
  NSString *assetVersion;
  void *v17;
  id v18;

  v18 = a4;
  v8 = -[AUDeveloperSettingsAboutListController currentSpecifierMatchesAccessoryID:](self, "currentSpecifierMatchesAccessoryID:", a3);
  v9 = v18;
  if (v8)
  {
    objc_msgSend(v18, "remoteURL");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString path](v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "containsString:", CFSTR("supplementalassets")) & 1) != 0)
    {
LABEL_12:

      v9 = v18;
      goto LABEL_13;
    }
    objc_msgSend(v18, "remoteURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsString:", CFSTR("dynamicassets"));

    v9 = v18;
    if ((v14 & 1) == 0)
    {
      if (!self->_progressView)
      {
        objc_msgSend(v18, "assetVersion");
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        assetVersion = self->_assetVersion;
        self->_assetVersion = v15;

        -[AUDeveloperSettingsAboutListController performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", sel_backgroundSetupUI, 0);
      }
      if (-[NSString length](self->_assetVersion, "length"))
        v10 = self->_assetVersion;
      else
        v10 = CFSTR("Unknown");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %s"), v10, UARPFirmwareStagingCompletionStatusToString());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
      {
        -[PSSpecifier objectForKeyedSubscript:](self->_accessoryInfoGroupSpecifier, "objectForKeyedSubscript:", CFSTR("AUSettingsProgressKeyBytesTotal"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", v17, CFSTR("AUSettingsProgressKeyBytesSent"));

      }
      -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", v11, CFSTR("AUSettingsProgressKeyBuild"));
      -[PSSpecifier setProperty:forKey:](self->_accessoryInfoGroupSpecifier, "setProperty:forKey:", CFSTR("YES"), CFSTR("AUSettingsProgressComplete"));
      -[AUDeveloperSettingsAboutListController performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", sel_backgroundUpdateProgress, 0);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)backgroundSetupUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__AUDeveloperSettingsAboutListController_backgroundSetupUI__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __59__AUDeveloperSettingsAboutListController_backgroundSetupUI__block_invoke(uint64_t a1)
{
  UIProgressFooterView *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v2 = -[UIProgressFooterView initWithSpecifier:]([UIProgressFooterView alloc], "initWithSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1416);
  *(_QWORD *)(v3 + 1416) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1408);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v7, *MEMORY[0x24BE75A30]);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416), *MEMORY[0x24BE75A78]);
}

- (void)backgroundUpdateProgress
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__AUDeveloperSettingsAboutListController_backgroundUpdateProgress__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __66__AUDeveloperSettingsAboutListController_backgroundUpdateProgress__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "refreshContentsWithSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalAssetLocationSpecifier, 0);
  objc_storeStrong((id *)&self->_assetLocationSpecifier, 0);
  objc_storeStrong((id *)&self->_updateNowButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_authListingEnabledSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_activePartnerSerialNumber, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_accessoryInfoGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)firmwareUpdateProgressForAccessoryID:(uint64_t)a3 assetID:bytesSent:bytesTotal:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = a3;
  _os_log_debug_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "FW update progress: %@ bytes/total: %lu/%lu", (uint8_t *)&v3, 0x20u);
}

@end
