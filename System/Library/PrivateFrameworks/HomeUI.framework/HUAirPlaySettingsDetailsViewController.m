@implementation HUAirPlaySettingsDetailsViewController

- (HUAirPlaySettingsDetailsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v5;
  HUAirPlaySettingsDetailsItemManager *v6;
  void *v7;
  HUAirPlaySettingsDetailsViewController *v8;
  uint64_t v9;
  NSMapTable *cellToItemMap;
  void *v11;
  objc_super v13;

  v5 = a4;
  v6 = -[HUAirPlaySettingsDetailsItemManager initWithDelegate:module:]([HUAirPlaySettingsDetailsItemManager alloc], "initWithDelegate:module:", self, v5);

  -[HUAirPlaySettingsDetailsViewController setAirPlaySettingsDetailsItemManager:](self, "setAirPlaySettingsDetailsItemManager:", v6);
  -[HUAirPlaySettingsDetailsViewController airPlaySettingsDetailsItemManager](self, "airPlaySettingsDetailsItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v7, 1);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    cellToItemMap = v8->_cellToItemMap;
    v8->_cellToItemMap = (NSMapTable *)v9;

    _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpointSetting_AirPlay_Title"), CFSTR("HUSiriEndpointSetting_AirPlay_Title"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAirPlaySettingsDetailsViewController setTitle:](v8, "setTitle:", v11);

    -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](v8, "setAutomaticallyUpdatesViewControllerTitle:", 0);
  }
  return v8;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HUHomeKitAccessorySettingsItemModuleController *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v31;
  HUHomeKitAccessorySettingsItemModuleController *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint8_t buf[4];
  HUHomeKitAccessorySettingsItemModuleController *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v38.receiver = self;
  v38.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  -[HUItemTableViewController itemModuleControllers](&v38, sel_itemModuleControllers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HUAirPlaySettingsDetailsViewController airPlaySettingsDetailsItemManager](self, "airPlaySettingsDetailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitAccessorySettingsModules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v33 = v3;
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[HUAirPlaySettingsDetailsViewController airPlaySettingsDetailsItemManager](self, "airPlaySettingsDetailsItemManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "homeKitAccessorySettingsModules");
      v32 = (HUHomeKitAccessorySettingsItemModuleController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v32;
      _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "Creating Item Module Controllers from  homeKitAccessorySettingsModules = [%@]", buf, 0xCu);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[HUAirPlaySettingsDetailsViewController airPlaySettingsDetailsItemManager](self, "airPlaySettingsDetailsItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeKitAccessorySettingsModules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
          objc_opt_class();
          v15 = v14;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if (v17)
          {
            -[HUAirPlaySettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              v20 = -[HUHomeKitAccessorySettingsItemModuleController initWithModule:delegate:]([HUHomeKitAccessorySettingsItemModuleController alloc], "initWithModule:delegate:", v17, self);
              -[HUAirPlaySettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[HUAirPlaySettingsDetailsViewController setModuleToModuleControllerMap:](self, "setModuleToModuleControllerMap:", v22);

              }
              HFLogForCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v20;
                v41 = 2112;
                v42 = v17;
                _os_log_debug_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEBUG, "Setting moduleController = [%@] for Module = [%@] in moduleToModuleControllerMap", buf, 0x16u);
              }

              -[HUAirPlaySettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKey:", v20, v17);

            }
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v11);
    }

    -[HUAirPlaySettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectEnumerator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "nextObject");
    v27 = objc_claimAutoreleasedReturnValue();
    v3 = v33;
    if (v27)
    {
      v28 = (void *)v27;
      do
      {
        objc_msgSend(v33, "na_safeAddObject:", v28);
        objc_msgSend(v26, "nextObject");
        v29 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v29;
      }
      while (v29);
    }

  }
  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "userInterfaceType") != 8
    && objc_msgSend(v7, "userInterfaceType")
    && objc_msgSend(v7, "userInterfaceType") != 4)
  {
    objc_msgSend(v7, "userInterfaceType");
  }
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  v9 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  v21 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v21;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  v14 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v16, "settingDict");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "settingKeyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "setDelegate:", self);
  }
  else if (v13)
  {
    objc_msgSend(v13, "setHideIcon:", 1);
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F18]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessoryType:", v20 != 0);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v29;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v29, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  v15 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_opt_class();
  v18 = v15;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (v17)
  {
    objc_msgSend(v14, "settingValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOn:", objc_msgSend(v21, "BOOLValue"));
    objc_msgSend(v14, "settingKeyPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D301A8]);

    if (!v23)
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v17, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", 0);
LABEL_16:

    goto LABEL_18;
  }
  if (v20)
  {
    objc_msgSend(v14, "settingDict");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settingKeyPath");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30588]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_msgSend(v27, "BOOLValue");

    if ((v26 & 1) == 0)
    {
      objc_msgSend(v20, "setValueText:", 0);
      goto LABEL_18;
    }
    objc_msgSend(v12, "latestResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValueText:", v28);

    goto LABEL_16;
  }
LABEL_19:

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  HUAirPlaySettingsDetailsViewController *v26;
  SEL v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  id v31;
  BOOL v32;

  v4 = a4;
  v7 = a3;
  -[HUAirPlaySettingsDetailsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  -[HUAirPlaySettingsDetailsViewController airPlaySettingsDetailsItemManager](self, "airPlaySettingsDetailsItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateSettingItem:withValue:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke;
  v29[3] = &unk_1E6F53170;
  v30 = v7;
  v32 = v4;
  v19 = v12;
  v31 = v19;
  v20 = v7;
  v21 = (id)objc_msgSend(v17, "addFailureBlock:", v29);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke_17;
  v24[3] = &unk_1E6F52710;
  v28 = v4;
  v25 = v19;
  v26 = self;
  v27 = a2;
  v22 = v19;
  v23 = (id)objc_msgSend(v17, "addSuccessBlock:", v24);

}

void __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 48) == 0);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 48);
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Setting [%@] FAILED to update with value %{BOOL}d. Reverting UI state.", (uint8_t *)&v7, 0x12u);
  }

}

void __63__HUAirPlaySettingsDetailsViewController_switchCell_didTurnOn___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 56);
    v7 = 138412546;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Setting [%@] Successfully updated with value %{BOOL}d.", (uint8_t *)&v7, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "airPlaySettingsDetailsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  NSString *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)HUAirPlaySettingsDetailsViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v30, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v30.receiver, v30.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "User tapped item [%@]", buf, 0xCu);
  }

  objc_opt_class();
  v14 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v16, "settingKeyPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "settingDict");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v20 = (_QWORD *)MEMORY[0x1E0D30F18];
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F18]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", *v20);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = NSClassFromString(v22);

      v24 = [v23 alloc];
      -[HUAirPlaySettingsDetailsViewController airPlaySettingsDetailsItemManager](self, "airPlaySettingsDetailsItemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "module");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v24, "initWithAccessorySettingItem:module:", v14, v26);

      -[HUAirPlaySettingsDetailsViewController navigationController](self, "navigationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v28, "hu_pushPreloadableViewController:animated:", v27, 1);

    }
  }

}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setCellToItemMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (HUAirPlaySettingsDetailsItemManager)airPlaySettingsDetailsItemManager
{
  return self->_airPlaySettingsDetailsItemManager;
}

- (void)setAirPlaySettingsDetailsItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_airPlaySettingsDetailsItemManager, a3);
}

- (NSMapTable)moduleToModuleControllerMap
{
  return self->_moduleToModuleControllerMap;
}

- (void)setModuleToModuleControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_moduleToModuleControllerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleToModuleControllerMap, 0);
  objc_storeStrong((id *)&self->_airPlaySettingsDetailsItemManager, 0);
  objc_storeStrong((id *)&self->_cellToItemMap, 0);
}

@end
