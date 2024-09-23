@implementation AUDeveloperSettingsLocationListController

- (id)specifiers
{
  AUDeveloperSettingsLocationListController *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *serialNumber;
  void *v10;
  uint64_t v11;
  NSString *assetLocationKey;
  void *v13;
  uint64_t v14;
  NSString *basejumperTrainKey;
  void *v16;
  uint64_t v17;
  NSString *basejumperBuildKey;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *modifiedSettings;
  void *v22;
  uint64_t v23;
  PSSpecifier *customBuildSpecifier;
  uint64_t v25;
  PSSpecifier *customerSpecifier;
  uint64_t v27;
  PSSpecifier *customerStagingSpecifier;
  uint64_t v29;
  PSSpecifier *publicSeedSpecifier;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  PSSpecifier *customBasejumperBuildGroup;
  uint64_t v39;
  PSSpecifier *customLivabilityBuildGroup;
  uint64_t v41;
  PSTextFieldSpecifier **p_customTrainSpecifier;
  PSTextFieldSpecifier *customTrainSpecifier;
  uint64_t v44;
  PSTextFieldSpecifier *customBuildNumberSpecifier;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  PSSpecifier *saveButtonGroup;
  uint64_t v51;
  PSSpecifier *saveSettingsButtonSpecifier;
  PSSpecifier *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x24BDF7B80], 0);

    -[AUDeveloperSettingsLocationListController specifier](v2, "specifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertyForKey:", CFSTR("serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v2->_serialNumber;
    v2->_serialNumber = (NSString *)v8;

    -[AUDeveloperSettingsLocationListController specifier](v2, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", CFSTR("assetLocation"));
    v11 = objc_claimAutoreleasedReturnValue();
    assetLocationKey = v2->_assetLocationKey;
    v2->_assetLocationKey = (NSString *)v11;

    -[AUDeveloperSettingsLocationListController specifier](v2, "specifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", CFSTR("basejumperTrain"));
    v14 = objc_claimAutoreleasedReturnValue();
    basejumperTrainKey = v2->_basejumperTrainKey;
    v2->_basejumperTrainKey = (NSString *)v14;

    -[AUDeveloperSettingsLocationListController specifier](v2, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "propertyForKey:", CFSTR("basejumperBuild"));
    v17 = objc_claimAutoreleasedReturnValue();
    basejumperBuildKey = v2->_basejumperBuildKey;
    v2->_basejumperBuildKey = (NSString *)v17;

    getInfoForAccessory(v2->_serialNumber);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");
    v58 = v3;
    modifiedSettings = v2->_modifiedSettings;
    v2->_modifiedSettings = (NSMutableDictionary *)v20;

    -[AUDeveloperSettingsLocationListController loadSpecifiersFromPlistName:target:](v2, "loadSpecifiersFromPlistName:target:", CFSTR("AUDeveloperSettingsLocation"), v2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "specifierForID:", CFSTR("CUSTOM_BASEJUMPER_BUILD"));
    v23 = objc_claimAutoreleasedReturnValue();
    customBuildSpecifier = v2->_customBuildSpecifier;
    v2->_customBuildSpecifier = (PSSpecifier *)v23;

    objc_msgSend(v22, "specifierForID:", CFSTR("CUSTOMER"));
    v25 = objc_claimAutoreleasedReturnValue();
    customerSpecifier = v2->_customerSpecifier;
    v2->_customerSpecifier = (PSSpecifier *)v25;

    objc_msgSend(v22, "specifierForID:", CFSTR("CUSTOMER_STAGING"));
    v27 = objc_claimAutoreleasedReturnValue();
    customerStagingSpecifier = v2->_customerStagingSpecifier;
    v2->_customerStagingSpecifier = (PSSpecifier *)v27;

    objc_msgSend(v22, "specifierForID:", CFSTR("PUBLIC_SEED"));
    v29 = objc_claimAutoreleasedReturnValue();
    publicSeedSpecifier = v2->_publicSeedSpecifier;
    v2->_publicSeedSpecifier = (PSSpecifier *)v29;

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v31 = v22;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v60;
      v34 = *MEMORY[0x24BE75948];
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v60 != v33)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v36, "setProperty:forKey:", objc_opt_class(), v34);
          objc_msgSend(v36, "setDetailControllerClass:", objc_opt_class());
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v32);
    }

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v37 = objc_claimAutoreleasedReturnValue();
    customBasejumperBuildGroup = v2->_customBasejumperBuildGroup;
    v2->_customBasejumperBuildGroup = (PSSpecifier *)v37;

    -[PSSpecifier setCellType:](v2->_customBasejumperBuildGroup, "setCellType:", 0);
    -[PSSpecifier setName:](v2->_customBasejumperBuildGroup, "setName:", CFSTR("Custom Basejumper Build"));
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v39 = objc_claimAutoreleasedReturnValue();
    customLivabilityBuildGroup = v2->_customLivabilityBuildGroup;
    v2->_customLivabilityBuildGroup = (PSSpecifier *)v39;

    -[PSSpecifier setCellType:](v2->_customLivabilityBuildGroup, "setCellType:", 0);
    -[PSSpecifier setName:](v2->_customLivabilityBuildGroup, "setName:", CFSTR("Custom Livability Train"));
    objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Train"), v2, sel_setTrainName_, sel_trainName, 0, 8, 0);
    v41 = objc_claimAutoreleasedReturnValue();
    p_customTrainSpecifier = &v2->_customTrainSpecifier;
    customTrainSpecifier = v2->_customTrainSpecifier;
    v2->_customTrainSpecifier = (PSTextFieldSpecifier *)v41;

    objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Build"), v2, sel_setBuildName_, sel_buildName, 0, 8, 0);
    v44 = objc_claimAutoreleasedReturnValue();
    customBuildNumberSpecifier = v2->_customBuildNumberSpecifier;
    v2->_customBuildNumberSpecifier = (PSTextFieldSpecifier *)v44;

    -[NSMutableDictionary objectForKeyedSubscript:](v2->_modifiedSettings, "objectForKeyedSubscript:", CFSTR("fusing"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((AUDeveloperSettingsAccessoryFusingStringToType(v46) & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      objc_msgSend(v31, "removeObject:", v2->_customerSpecifier);
      objc_msgSend(v31, "removeObject:", v2->_customerStagingSpecifier);
      objc_msgSend(v31, "removeObject:", v2->_publicSeedSpecifier);
    }
    v2->_defaultSpecifierListLength = objc_msgSend(v31, "count");
    -[NSMutableDictionary objectForKeyedSubscript:](v2->_modifiedSettings, "objectForKeyedSubscript:", v2->_assetLocationKey);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = AUDeveloperSettingsURLStringToType(v47);
    if (v48)
    {
      if (v48 != 5)
      {
LABEL_17:
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v49 = objc_claimAutoreleasedReturnValue();
        saveButtonGroup = v2->_saveButtonGroup;
        v2->_saveButtonGroup = (PSSpecifier *)v49;

        -[PSSpecifier setCellType:](v2->_saveButtonGroup, "setCellType:", 0);
        -[PSSpecifier setName:](v2->_saveButtonGroup, "setName:", 0);
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Apply"), v2, 0, 0, 0, 13, 0);
        v51 = objc_claimAutoreleasedReturnValue();
        saveSettingsButtonSpecifier = v2->_saveSettingsButtonSpecifier;
        v2->_saveSettingsButtonSpecifier = (PSSpecifier *)v51;

        v53 = v2->_saveSettingsButtonSpecifier;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](v53, "setProperty:forKey:", v54, *MEMORY[0x24BE75860]);

        -[PSSpecifier setButtonAction:](v2->_saveSettingsButtonSpecifier, "setButtonAction:", sel_saveNow);
        -[PSSpecifier setProperty:forKey:](v2->_saveSettingsButtonSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        -[PSSpecifier setProperty:forKey:](v2->_saveButtonGroup, "setProperty:forKey:", CFSTR("Apply will save settings changes and launch an asset check for the accessory if connected."), *MEMORY[0x24BE75A68]);
        objc_msgSend(v31, "addObject:", v2->_saveButtonGroup);
        objc_msgSend(v31, "addObject:", v2->_saveSettingsButtonSpecifier);
        v55 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v58);
        *(Class *)((char *)&v2->super.super.super.super.super.isa + v58) = (Class)v31;
        v56 = v31;

        v5 = *(id *)((char *)&v2->super.super.super.super.super.isa + v58);
        goto LABEL_18;
      }
      v2->_showingCustomBasejumperBuildSpecifiers = 1;
      objc_msgSend(v31, "addObject:", v2->_customBasejumperBuildGroup);
      objc_msgSend(v31, "addObject:", *p_customTrainSpecifier);
      p_customTrainSpecifier = &v2->_customBuildNumberSpecifier;
    }
    else
    {
      v2->_showingCustomLivabilityBuildSpecifiers = 1;
      objc_msgSend(v31, "addObject:", v2->_customLivabilityBuildGroup);
    }
    objc_msgSend(v31, "addObject:", *p_customTrainSpecifier);
    goto LABEL_17;
  }
  v5 = v4;
LABEL_18:
  objc_sync_exit(v2);

  return v5;
}

- (void)saveNow
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AUDeveloperSettingsLocationListController_saveNow__block_invoke;
  block[3] = &unk_24DFEE8F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__AUDeveloperSettingsLocationListController_saveNow__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAccessoryWithSerialNumber:info:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1520), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1528));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "settingsChangedForSerialNumber:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1520));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1448));
}

- (void)setTrainName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", a3, self->_basejumperTrainKey);
}

- (id)trainName
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", self->_basejumperTrainKey);
}

- (void)setBuildName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", a3, self->_basejumperBuildKey);
}

- (id)buildName
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", self->_basejumperBuildKey);
}

- (void)showCustomSpecifiersForSelectedSpecifier:(id)a3 show:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  PSSpecifier *saveSettingsButtonSpecifier;
  void *v10;
  int v11;
  PSTextFieldSpecifier *v12;
  PSSpecifier *v13;
  PSSpecifier *v14;
  void *v15;
  PSSpecifier **p_customBasejumperBuildGroup;
  uint64_t v17;
  PSTextFieldSpecifier *customTrainSpecifier;
  PSSpecifier *saveButtonGroup;
  uint64_t v20;
  uint64_t v21;
  unint64_t i;
  PSSpecifier *customLivabilityBuildGroup;
  PSTextFieldSpecifier *v24;
  PSSpecifier *v25;
  PSSpecifier *v26;
  PSSpecifier *customBasejumperBuildGroup;
  PSTextFieldSpecifier *v28;
  PSTextFieldSpecifier *customBuildNumberSpecifier;
  PSSpecifier *v30;
  PSSpecifier *v31;
  _QWORD v32[3];

  v5 = a5;
  v6 = a4;
  v32[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  saveSettingsButtonSpecifier = self->_saveSettingsButtonSpecifier;
  v32[0] = self->_saveButtonGroup;
  v32[1] = saveSettingsButtonSpecifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    self->_showingCustomBasejumperBuildSpecifiers = 0;
    self->_showingCustomLivabilityBuildSpecifiers = 0;
    if (!self->_showingCustomBasejumperBuildSpecifiers)
      goto LABEL_8;
LABEL_6:
    customTrainSpecifier = self->_customTrainSpecifier;
    customBasejumperBuildGroup = self->_customBasejumperBuildGroup;
    v28 = customTrainSpecifier;
    saveButtonGroup = self->_saveButtonGroup;
    customBuildNumberSpecifier = self->_customBuildNumberSpecifier;
    v30 = saveButtonGroup;
    v31 = self->_saveSettingsButtonSpecifier;
    v15 = (void *)MEMORY[0x24BDBCE30];
    p_customBasejumperBuildGroup = &customBasejumperBuildGroup;
    v17 = 5;
    goto LABEL_7;
  }
  self->_showingCustomBasejumperBuildSpecifiers = objc_msgSend(v8, "isEqual:", CFSTR("CUSTOM_BASEJUMPER_BUILD"));
  v11 = objc_msgSend(v8, "isEqual:", CFSTR("LIVABILITY"));
  self->_showingCustomLivabilityBuildSpecifiers = v11;
  if (self->_showingCustomBasejumperBuildSpecifiers)
    goto LABEL_6;
  if (v11)
  {
    v12 = self->_customTrainSpecifier;
    v13 = self->_saveButtonGroup;
    customLivabilityBuildGroup = self->_customLivabilityBuildGroup;
    v24 = v12;
    v14 = self->_saveSettingsButtonSpecifier;
    v25 = v13;
    v26 = v14;
    v15 = (void *)MEMORY[0x24BDBCE30];
    p_customBasejumperBuildGroup = &customLivabilityBuildGroup;
    v17 = 4;
LABEL_7:
    objc_msgSend(v15, "arrayWithObjects:count:", p_customBasejumperBuildGroup, v17, customLivabilityBuildGroup, v24, v25, v26, customBasejumperBuildGroup, v28, customBuildNumberSpecifier, v30, v31);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v20;
  }
LABEL_8:
  v21 = (int)*MEMORY[0x24BE756E0];
  for (i = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v21), "count");
        i > self->_defaultSpecifierListLength;
        i = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v21), "count"))
  {
    -[AUDeveloperSettingsLocationListController removeLastSpecifierAnimated:](self, "removeLastSpecifierAnimated:", 1);
  }
  if (v10)
    -[AUDeveloperSettingsLocationListController insertContiguousSpecifiers:atEndOfGroup:animated:](self, "insertContiguousSpecifiers:atEndOfGroup:animated:", v10, 0, v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;

  -[AUDeveloperSettingsLocationListController table](self, "table", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", self->_lastSelectedIndexPath);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSelected:animated:", 1, 1);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[AUDeveloperSettingsLocationListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", self->_assetLocationKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75D50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (AUDeveloperSettingsURLStringToType(v9) == 6)
    {
      v11 = CFSTR("Customer Staging");

      v9 = v11;
    }
    if (AUDeveloperSettingsURLStringToType(v9) != 5)
    {
      if (AUDeveloperSettingsURLStringToType(v9)
        || (-[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", self->_basejumperBuildKey), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", 0, self->_basejumperTrainKey);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", 0, self->_basejumperBuildKey);
    }
    if (objc_msgSend(v10, "isEqualToString:", v9)
      || AUDeveloperSettingsURLStringToType(v9) == 5
      && objc_msgSend(v8, "isEqualToSpecifier:", self->_customBuildSpecifier))
    {
      objc_msgSend(v13, "setSelected:", 1);
      objc_storeStrong((id *)&self->_lastSelectedIndexPath, a5);
    }
    else
    {
      objc_msgSend(v13, "setSelected:", 0);
    }
    objc_msgSend(v13, "reloadWithSpecifier:animated:", v8, 1);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id WeakRetained;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AUDeveloperSettingsLocationListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_30;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AUDeveloperSettingsLocationListController table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v7, 1);

    -[AUDeveloperSettingsLocationListController selectSpecifier:](self, "selectSpecifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUDeveloperSettingsLocationListController showController:](self, "showController:", v10);
LABEL_21:

    goto LABEL_22;
  }
  if (!objc_msgSend(v8, "isEqualToSpecifier:", self->_saveSettingsButtonSpecifier))
  {
    objc_storeStrong((id *)&self->_lastSelectedIndexPath, a4);
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", 0, self->_basejumperTrainKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", 0, self->_basejumperBuildKey);
    -[PSSpecifier setProperty:forKey:](self->_saveSettingsButtonSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    if ((objc_msgSend(v10, "isEqual:", CFSTR("BASEJUMPER")) & 1) != 0)
    {
      v12 = 0;
      v13 = 4;
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("CUSTOM_BASEJUMPER_BUILD")) & 1) != 0)
    {
      v12 = 1;
      v13 = 5;
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("CUSTOMER")) & 1) != 0)
    {
      v12 = 0;
      v13 = 2;
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("CUSTOMER_STAGING")) & 1) != 0)
    {
      v12 = 0;
      v13 = 6;
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("INTERNAL_SEED")) & 1) != 0)
    {
      v12 = 0;
      v13 = 1;
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("LIVABILITY")) & 1) != 0)
    {
      v13 = 0;
      v12 = 1;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqual:", CFSTR("PUBLIC_SEED")))
        goto LABEL_21;
      v12 = 0;
      v13 = 3;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modifiedSettings, "setObject:forKeyedSubscript:", v14, self->_assetLocationKey);

    -[AUDeveloperSettingsLocationListController showCustomSpecifiersForSelectedSpecifier:show:animated:](self, "showCustomSpecifiersForSelectedSpecifier:show:animated:", v8, v12, 1);
    goto LABEL_21;
  }
  -[AUDeveloperSettingsLocationListController table](self, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v7, 1);

  objc_msgSend(v8, "performButtonAction");
LABEL_22:
  objc_msgSend(v6, "cellForRowAtIndexPath:", self->_lastSelectedIndexPath);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v6, "visibleCells", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "setSelected:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "isEqual:", v15));
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

LABEL_30:
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  AUInternalSettingsDetailsController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[AUDeveloperSettingsLocationListController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = v5;
    v6 = objc_alloc_init(AUInternalSettingsDetailsController);
    objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", CFSTR("description"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", CFSTR("assetURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", CFSTR("assetURLOverride"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", CFSTR("assetURLOverride"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" :\nProfile Asset URL Override\n\nThis resolves to a URL that looks like this :\n%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    else
    {
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" :\n%@\n\nThis resolves to a URL that looks like this :\n%@"), v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[AUInternalSettingsDetailsController setDescription:](v6, "setDescription:", v12);
    -[AUDeveloperSettingsLocationListController showController:](self, "showController:", v6);

    v5 = v13;
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int *v11;
  int *v12;
  id *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AUDeveloperSettingsLocationListController;
  -[AUDeveloperSettingsLocationListController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 8)
  {
    objc_msgSend(v5, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTextFieldSpecifier name](self->_customBuildNumberSpecifier, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      v11 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__trainTextField;
      if (v10)
      {
        v11 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__buildTextField;
        v12 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__basejumperBuildKey;
      }
      else
      {
        v12 = &OBJC_IVAR___AUDeveloperSettingsLocationListController__basejumperTrainKey;
      }
      v13 = (id *)((char *)&self->super.super.super.super.super.isa + *v11);
      objc_storeStrong(v13, v6);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_modifiedSettings, "objectForKeyedSubscript:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v13, "setText:", v14);

      objc_msgSend(v6, "addTarget:action:forEvents:", self, sel_textFieldDidEndEditing_, 0x40000);
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "setReturnKeyType:", 9);
      objc_msgSend(v6, "setAutocorrectionType:", 1);
      objc_msgSend(v6, "setTextAlignment:", 2);
      objc_msgSend(v6, "setAutocapitalizationType:", 1);
      objc_msgSend(v6, "setClearButtonMode:", 1);
      -[AUDeveloperSettingsLocationListController reloadSpecifier:](self, "reloadSpecifier:", self->_customTrainSpecifier);
    }

  }
  return v5;
}

- (void)textFieldDidEndEditing:(id)a3
{
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v10;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
      objc_msgSend(v10, "setText:", &stru_24DFF2410);
    if (objc_msgSend(v10, "isEqual:", self->_trainTextField))
      -[AUDeveloperSettingsLocationListController setTrainName:](self, "setTrainName:", v8);
    else
      -[AUDeveloperSettingsLocationListController setBuildName:](self, "setBuildName:", v8);
    -[PSSpecifier setProperty:forKey:](self->_saveSettingsButtonSpecifier, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReturnKeyEnabled:", 1);

    -[AUDeveloperSettingsLocationListController reloadSpecifier:](self, "reloadSpecifier:", self->_saveSettingsButtonSpecifier);
    v5 = v10;
  }

}

- (void)keyboardWillShow:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6B18], "activeKeyboard", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReturnKeyEnabled:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedSettings, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_buildTextField, 0);
  objc_storeStrong((id *)&self->_trainTextField, 0);
  objc_storeStrong((id *)&self->_basejumperBuildKey, 0);
  objc_storeStrong((id *)&self->_basejumperTrainKey, 0);
  objc_storeStrong((id *)&self->_assetLocationKey, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_saveSettingsButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_saveButtonGroup, 0);
  objc_storeStrong((id *)&self->_customBuildNumberSpecifier, 0);
  objc_storeStrong((id *)&self->_customTrainSpecifier, 0);
  objc_storeStrong((id *)&self->_customLivabilityBuildGroup, 0);
  objc_storeStrong((id *)&self->_customBasejumperBuildGroup, 0);
  objc_storeStrong((id *)&self->_publicSeedSpecifier, 0);
  objc_storeStrong((id *)&self->_customerStagingSpecifier, 0);
  objc_storeStrong((id *)&self->_customerSpecifier, 0);
  objc_storeStrong((id *)&self->_customBuildSpecifier, 0);
}

@end
