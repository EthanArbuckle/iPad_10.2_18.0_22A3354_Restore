@implementation HUSiriSettingsDetailsViewController

- (HUSiriSettingsDetailsViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v5;
  HUSiriSettingsDetailsItemManager *v6;
  void *v7;
  HUSiriSettingsDetailsViewController *v8;
  uint64_t v9;
  NSMapTable *cellToItemMap;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a4;
  v6 = -[HUSiriSettingsDetailsItemManager initWithDelegate:module:]([HUSiriSettingsDetailsItemManager alloc], "initWithDelegate:module:", self, v5);
  -[HUSiriSettingsDetailsViewController setSiriSettingsDetailsItemManager:](self, "setSiriSettingsDetailsItemManager:", v6);

  -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HUSiriSettingsDetailsViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v16, sel_initWithItemManager_tableViewStyle_, v7, 1);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    cellToItemMap = v8->_cellToItemMap;
    v8->_cellToItemMap = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessorySettingsDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settingGroupKeyPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_localizedTitleForKeyPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriSettingsDetailsViewController setTitle:](v8, "setTitle:", v14);

  }
  return v8;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HUHomeKitAccessorySettingsItemModuleController *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v30;
  HUHomeKitAccessorySettingsItemModuleController *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  HUHomeKitAccessorySettingsItemModuleController *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitAccessorySettingsModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v32 = v3;
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "homeKitAccessorySettingsModules");
      v31 = (HUHomeKitAccessorySettingsItemModuleController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v31;
      _os_log_debug_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEBUG, "Creating Item Module Controllers from  homeKitAccessorySettingsModules = [%@]", buf, 0xCu);

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeKitAccessorySettingsModules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
          objc_opt_class();
          v14 = v13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
          v16 = v15;

          if (v16)
          {
            -[HUSiriSettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v19 = -[HUHomeKitAccessorySettingsItemModuleController initWithModule:delegate:]([HUHomeKitAccessorySettingsItemModuleController alloc], "initWithModule:delegate:", v16, self);
              -[HUSiriSettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[HUSiriSettingsDetailsViewController setModuleToModuleControllerMap:](self, "setModuleToModuleControllerMap:", v21);

              }
              HFLogForCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v19;
                v39 = 2112;
                v40 = v16;
                _os_log_debug_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEBUG, "Setting moduleController = [%@] for Module = [%@] in moduleToModuleControllerMap", buf, 0x16u);
              }

              -[HUSiriSettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKey:", v19, v16);

            }
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v10);
    }

    -[HUSiriSettingsDetailsViewController moduleToModuleControllerMap](self, "moduleToModuleControllerMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectEnumerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "nextObject");
    v26 = objc_claimAutoreleasedReturnValue();
    v3 = v32;
    if (v26)
    {
      v27 = (void *)v26;
      do
      {
        objc_msgSend(v32, "na_safeAddObject:", v27);
        objc_msgSend(v25, "nextObject");
        v28 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v28;
      }
      while (v28);
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUSiriSettingsDetailsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v27, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
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
  }
  else
  {
    if (!v20)
      goto LABEL_13;
    objc_msgSend(v14, "settingDict");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settingKeyPath");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30588]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_msgSend(v24, "BOOLValue");

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v12, "latestResults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValueText:", v26);

    }
    else
    {
      objc_msgSend(v20, "setValueText:", 0);
    }
  }

LABEL_13:
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  HUSiriSettingsDetailsViewController *v19;
  BOOL v20;

  v4 = a4;
  v6 = a3;
  -[HUSiriSettingsDetailsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke;
  v16[3] = &unk_1E6F555F8;
  v17 = v6;
  v18 = v13;
  v20 = v4;
  v19 = self;
  v14 = v13;
  v15 = v6;
  -[HUSiriSettingsDetailsViewController _preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:](self, "_preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:", v14, v4, v16);

}

void __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) '%@/%@' running preflight check before changing...", buf, 0x16u);
    }

    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_14;
    v16[3] = &unk_1E6F555D0;
    v8 = *(id *)(a1 + 40);
    v20 = *(_BYTE *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 48);
    v17 = v8;
    v18 = v9;
    v19 = *(id *)(a1 + 32);
    v10 = (id)objc_msgSend(v3, "addSuccessBlock:", v16);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_26;
    v12[3] = &unk_1E6F53170;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    v15 = *(_BYTE *)(a1 + 56);
    v11 = (id)objc_msgSend(v3, "addFailureBlock:", v12);

  }
}

void __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(v3, "BOOLValue"))
      v6 = CFSTR("passed");
    else
      v6 = CFSTR("failed");
    v7 = objc_msgSend(v3, "BOOLValue");
    v8 = CFSTR("NOT CHANGING");
    v9 = *(unsigned __int8 *)(a1 + 56);
    if (v7)
      v8 = CFSTR("CHANGING");
    v10 = CFSTR("ON");
    v11 = 138413058;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    if (!v9)
      v10 = CFSTR("OFF");
    v16 = v8;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(Switch) preflight returned check %@, %@ %@ to '%@'", (uint8_t *)&v11, 0x2Au);
  }

  if (objc_msgSend(v3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 40), "_updateSwitchSettingItem:forCell:withValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

uint64_t __60__HUSiriSettingsDetailsViewController_switchCell_didTurnOn___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(Switch) preflight failed, NOT changing %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
}

- (void)_updateSwitchSettingItem:(id)a3 forCell:(id)a4 withValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSettingItem:withValue:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke;
  v22[3] = &unk_1E6F53170;
  v23 = v9;
  v25 = v5;
  v14 = v8;
  v24 = v14;
  v15 = v9;
  v16 = (id)objc_msgSend(v12, "addFailureBlock:", v22);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke_30;
  v19[3] = &unk_1E6F55620;
  v20 = v14;
  v21 = v5;
  v17 = v14;
  v18 = (id)objc_msgSend(v12, "addSuccessBlock:", v19);

}

void __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke(uint64_t a1, void *a2)
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

void __82__HUSiriSettingsDetailsViewController__updateSwitchSettingItem_forCell_withValue___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Setting [%@] Successfully updated with value %{BOOL}d.", (uint8_t *)&v5, 0x12u);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  NSString *v19;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)HUSiriSettingsDetailsViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v27, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v27.receiver, v27.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "User tapped item [%@]", buf, 0xCu);
  }

  objc_opt_class();
  v11 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "settingKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "settingDict");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (_QWORD *)MEMORY[0x1E0D30F18];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F18]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", *v17);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    v20 = NSClassFromString(v19);

    v21 = [v20 alloc];
    -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "module");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithAccessorySettingItem:module:", v11, v23);

    -[HUSiriSettingsDetailsViewController navigationController](self, "navigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "hu_pushPreloadableViewController:animated:", v24, 1);

  }
}

- (void)_preflightCheckToAllowSwitchingForSettingItem:(id)a3 changingToOn:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  HUSiriSettingsDetailsViewController *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  _BOOL4 v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  int v73;
  uint64_t v74;

  v6 = a4;
  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v60 = self;
  -[HUSiriSettingsDetailsViewController siriSettingsDetailsItemManager](self, "siriSettingsDetailsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = &unk_1EF2AC470;
  if (objc_msgSend(v12, "conformsToProtocol:", v13))
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v15, "accessories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "mediaProfile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_mediaAccessoryCommonSettingsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (_QWORD *)MEMORY[0x1E0D301B8];
  objc_msgSend(v19, "settingValueForKeyPath:", *MEMORY[0x1E0D301B8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v21;
  if (v6 && (objc_msgSend(v21, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v8, "settingKeyPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D30FD0]);

  }
  else
  {
    v22 = 0;
  }
  HFLogForCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "settingKeyPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v67 = v15;
    v68 = 1024;
    v69 = v6;
    v70 = 2112;
    v71 = v25;
    v72 = 1024;
    v73 = v22;
    _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "sourceItem = %@, turningOnorOff = %{BOOL}d, settingItem.settingKeyPath = %@ , justTurningOnTapToAccess = %{BOOL}d", buf, 0x22u);

  }
  if (v6
    && (objc_msgSend(v8, "settingKeyPath"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = objc_msgSend(v26, "isEqualToString:", *v20) | v22,
        v26,
        v27 == 1))
  {
    objc_msgSend(v17, "hf_siriEndpointProfile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "currentAssistant");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v29, "isSiriAssistant");
      *(_DWORD *)buf = 138412546;
      v67 = v29;
      v68 = 1024;
      v69 = v31;
      _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "currentAssistant = %@, currentAssistant.isSiriAssistant = %{BOOL}d", buf, 0x12u);
    }

    if (v29 && (objc_msgSend(v29, "isSiriAssistant") & 1) == 0)
    {
      HFLogForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v29;
        _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "Accessory has a different assistant = %@", buf, 0xCu);
      }

      objc_msgSend(v29, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertTitle"), CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v34);
      v58 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertMessage"), CFSTR("%@"), v42, v43, v44, v45, v46, v47, (uint64_t)v41);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v58, v59, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle"), CFSTR("HUSiriEndpoint_TurnOffAssistant_AlertButtonTitle"), 1);
      v50 = objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke;
      v64[3] = &unk_1E6F55070;
      v57 = v9;
      v65 = v57;
      v51 = v49;
      v52 = (void *)v50;
      objc_msgSend(v51, "actionWithTitle:style:handler:", v50, 0, v64);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addAction:", v53);

      v54 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_2;
      v62[3] = &unk_1E6F55070;
      v63 = v57;
      objc_msgSend(v54, "actionWithTitle:style:handler:", v55, 1, v62);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addAction:", v56);

      v32 = (void *)v58;
      -[HUSiriSettingsDetailsViewController presentViewController:animated:completion:](v60, "presentViewController:animated:completion:", v48, 1, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v32);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v28);
  }

}

void __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __113__HUSiriSettingsDetailsViewController__preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 37);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  HUSiriSettingsDetailsViewController *v13;
  HUSiriSettingsDetailsViewController *v14;
  void *v15;
  int v17;
  HUSiriSettingsDetailsViewController *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31970], "siriPrivacyURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    -[HUSiriSettingsDetailsViewController navigationController](self, "navigationController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (HUSiriSettingsDetailsViewController *)v11;
    else
      v13 = self;
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D65208]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPresentingViewController:", v14);

    objc_msgSend(v15, "present");
  }

  return 0;
}

- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6
{
  -[HUSiriSettingsDetailsViewController _preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:](self, "_preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:", a4, a5, a6);
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setCellToItemMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (HUSiriSettingsDetailsItemManager)siriSettingsDetailsItemManager
{
  return self->_siriSettingsDetailsItemManager;
}

- (void)setSiriSettingsDetailsItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriSettingsDetailsItemManager, a3);
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
  objc_storeStrong((id *)&self->_siriSettingsDetailsItemManager, 0);
  objc_storeStrong((id *)&self->_cellToItemMap, 0);
}

@end
