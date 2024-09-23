@implementation AUInternalSettingsController

- (void)viewDidLoad
{
  NSMutableDictionary *v3;
  NSMutableDictionary *accessoryToStatus;
  objc_super v5;

  +[AUInternalSettingsController clearSettingsAssetLocationForFollowup](AUInternalSettingsController, "clearSettingsAssetLocationForFollowup");
  v5.receiver = self;
  v5.super_class = (Class)AUInternalSettingsController;
  -[AUInternalSettingsController viewDidLoad](&v5, sel_viewDidLoad);
  -[AUInternalSettingsController setTitle:](self, "setTitle:", CFSTR("Accessories Firmware Update"));
  -[AUInternalSettingsController setEditing:](self, "setEditing:", 1);
  v3 = (NSMutableDictionary *)objc_opt_new();
  accessoryToStatus = self->_accessoryToStatus;
  self->_accessoryToStatus = v3;

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  AUObserverXPC *v5;
  AUObserverXPC *observer;
  objc_super v7;

  v3 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    -[AUInternalSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  v7.receiver = self;
  v7.super_class = (Class)AUInternalSettingsController;
  -[AUInternalSettingsController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_alloc_init(AUObserverXPC);
  observer = self->_observer;
  self->_observer = v5;

  -[AUObserverXPC registerClient:](self->_observer, "registerClient:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AUInternalSettingsController;
  -[AUInternalSettingsController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[AUObserverXPC stopMonitoring](self->_observer, "stopMonitoring");
}

- (id)selectSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v5 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75948]);
  if (v5 == (id)objc_opt_class())
    objc_msgSend(v4, "setProperty:forKey:", &unk_24DFF65D8, *MEMORY[0x24BE75898]);
  v8.receiver = self;
  v8.super_class = (Class)AUInternalSettingsController;
  -[AUInternalSettingsController selectSpecifier:](&v8, sel_selectSpecifier_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("Pre-release Beta Program"));
  objc_msgSend(v3, "addObject:", v4);
  -[AUInternalSettingsController createInternalSpecifiers](self, "createInternalSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", CFSTR("Internal Development Firmware should only be installed on Apple Owned Units (AOU)"), *MEMORY[0x24BE75A68]);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v8 = (int)*MEMORY[0x24BE756E0];
  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = v7;

  v10 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v8);
  return v10;
}

- (id)createInternalSpecifiers
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessoriesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v27)
  {
    v22 = 0;
    v23 = 0;
    v25 = *(_QWORD *)v29;
    v24 = *MEMORY[0x24BE759F0];
    v3 = *MEMORY[0x24BE75948];
    v21 = *MEMORY[0x24BE75898];
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v2);
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", &stru_24DFF2410))
        {
          v8 = v5;

          v7 = v8;
        }
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, objc_opt_class(), 1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_removedSpecifier_);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setProperty:forKey:", v10, v24);

        objc_msgSend(v9, "setIdentifier:", v5);
        objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), v3);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personalizationRequired"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authListingEnabled"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "BOOLValue") && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), v3);
          objc_msgSend(v9, "setProperty:forKey:", &unk_24DFF65F0, v21);
        }
        if (configuredToDefaultAssetLocationForAccessory(v6))
        {
          v13 = v22;
          if (v22)
            goto LABEL_17;
          v14 = objc_alloc(MEMORY[0x24BDBCEB8]);
          objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("Default Configuration"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v14, "initWithObjects:", v15, 0);
          v22 = v13;
        }
        else
        {
          v13 = v23;
          if (v23)
            goto LABEL_17;
          v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
          objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("Custom Configuration"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v16, "initWithObjects:", v15, 0);
          v23 = v13;
        }

LABEL_17:
        objc_msgSend(v13, "addObject:", v9);

      }
      v27 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v27)
        goto LABEL_21;
    }
  }
  v22 = 0;
  v23 = 0;
LABEL_21:
  objc_msgSend(v20, "addObjectsFromArray:", v22);
  objc_msgSend(v20, "addObjectsFromArray:", v23);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)removedSpecifier:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeAccessoryWithSerialNumber:", v4);
}

+ (void)clearSettingsAssetLocationForFollowup
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error while clearing followUp: %@", (uint8_t *)&v1, 0xCu);
}

- (void)modifySpecifiersForAccessoryID:(id)a3 withStatus:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  AUInternalSettingsController *v31;
  void *v32;
  id obj;
  int v34;
  void *v35;
  _QWORD block[4];
  id v37;
  AUInternalSettingsController *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessoryToStatus, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue") != v4)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v8)
    {
      v9 = v8;
      v29 = v4;
      v30 = v7;
      v31 = self;
      v10 = *(_QWORD *)v40;
      v11 = *MEMORY[0x24BE75948];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_class();

          if (v14 == (void *)v15)
          {
            objc_msgSend(v13, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            getInfoForAccessory(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("partnerSerialNumbers"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "serialNumber");
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v13;
            v21 = (void *)v19;
            v32 = v20;
            objc_msgSend(v20, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "isEqualToString:", v22))
            {

LABEL_16:
              objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("AUSettingsProgressActiveUpdate"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "BOOLValue") == v29)
              {
                v25 = 0;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v31->_accessoryToStatus, "setObject:forKeyedSubscript:", v27, v6);
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v27, CFSTR("AUSettingsProgressActiveUpdate"));
                v25 = v32;

              }
              v7 = v30;

              goto LABEL_20;
            }
            objc_msgSend(v6, "serialNumber");
            v35 = v17;
            v23 = v6;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v18, "containsObject:", v24);

            v6 = v23;
            v17 = v35;

            if (v34)
              goto LABEL_16;

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v9)
          continue;
        break;
      }
      v25 = 0;
      v7 = v30;
LABEL_20:
      self = v31;
    }
    else
    {
      v25 = 0;
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__AUInternalSettingsController_modifySpecifiersForAccessoryID_withStatus___block_invoke;
    block[3] = &unk_24DFEE8D0;
    v37 = v25;
    v38 = self;
    v28 = v25;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __74__AUInternalSettingsController_modifySpecifiersForAccessoryID_withStatus___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "reloadSpecifier:");
  return result;
}

- (void)addAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = a4;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Accessory connected: %@ with asset: %@", (uint8_t *)&v7, 0x16u);
  }
  -[AUInternalSettingsController modifySpecifiersForAccessoryID:withStatus:](self, "modifySpecifiersForAccessoryID:withStatus:", v6, 0);

}

- (void)removeAccessoryID:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Accessory disconnected: %@", (uint8_t *)&v5, 0xCu);
  }
  -[AUInternalSettingsController modifySpecifiersForAccessoryID:withStatus:](self, "modifySpecifiersForAccessoryID:withStatus:", v4, 0);

}

- (void)firmwareUpdateProgressForAccessoryID:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v9;
  int v10;
  id v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = a5;
    v14 = 2048;
    v15 = a6;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "FW update progress: %@ bytes/total: %lu/%lu", (uint8_t *)&v10, 0x20u);
  }
  -[AUInternalSettingsController modifySpecifiersForAccessoryID:withStatus:](self, "modifySpecifiersForAccessoryID:withStatus:", v9, 1);

}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Staging complete: %@", (uint8_t *)&v7, 0xCu);
  }
  -[AUInternalSettingsController modifySpecifiersForAccessoryID:withStatus:](self, "modifySpecifiersForAccessoryID:withStatus:", v6, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryToStatus, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
