@implementation HUHomeKitAccessorySettingsItemModuleController

- (HUHomeKitAccessorySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6;
  HUHomeKitAccessorySettingsItemModuleController *v7;
  HUHomeKitAccessorySettingsItemModuleController *v8;
  uint64_t v9;
  NSMapTable *cellToItemMap;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUHomeKitAccessorySettingsItemModuleController;
  v7 = -[HUItemModuleController initWithModule:](&v12, sel_initWithModule_, a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    cellToItemMap = v8->_cellToItemMap;
    v8->_cellToItemMap = (NSMapTable *)v9;

  }
  return v8;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7 && (objc_msgSend(v10, "isCollapsed") & 1) == 0)
  {
    if (objc_msgSend(v7, "userInterfaceType") != 8
      && objc_msgSend(v7, "userInterfaceType")
      && objc_msgSend(v7, "userInterfaceType") != 4)
    {
      objc_msgSend(v7, "userInterfaceType");
    }
  }
  else if (objc_msgSend(v10, "isCollapsed"))
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Module [%@] is asked to be configured as Collapsed, hence we will configure this cell as HUTitleValueCell", (uint8_t *)&v14, 0xCu);
    }

  }
  objc_opt_class();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUHomeKitAccessorySettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v25, sel_setupCell_forItem_, v6, v7);
  -[HUHomeKitAccessorySettingsItemModuleController cellToItemMap](self, "cellToItemMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  objc_opt_class();
  v9 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  v12 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_opt_class();
  v18 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_msgSend(v20, "settingDict");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "settingKeyPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "setDelegate:", self);
  }
  else if (v14)
  {
    objc_msgSend(v14, "setHideIcon:", 1);
  }
  if (objc_msgSend(v17, "isCollapsed"))
  {
    objc_msgSend(v12, "setAccessoryType:", 1);
  }
  else
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F18]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessoryType:", v24 != 0);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUHomeKitAccessorySettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v25, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  v13 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_opt_class();
  v16 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v15)
  {
    objc_msgSend(v12, "settingValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOn:", objc_msgSend(v19, "BOOLValue"));
  }
  else
  {
    if (!v18)
      goto LABEL_13;
    objc_msgSend(v12, "settingDict");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settingKeyPath");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30588]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_msgSend(v22, "BOOLValue");

    if ((v21 & 1) != 0)
    {
      objc_msgSend(v10, "latestResults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValueText:", v24);

    }
    else
    {
      objc_msgSend(v18, "setValueText:", 0);
    }
  }

LABEL_13:
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  NSString *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138412290;
    v33 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "User tapped item [%@]", (uint8_t *)&v32, 0xCu);
  }

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "settingKeyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settingDict");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if ((v17 & 1) == 0)
  {
    v18 = (_QWORD *)MEMORY[0x1E0D30F18];
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F18]);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[HUHomeKitAccessorySettingsItemModuleController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", *v18);
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        v24 = NSClassFromString(v23);

        v25 = [v24 alloc];
        -[HUItemModuleController module](self, "module");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithAccessorySettingItem:module:", v9, v26);

        -[HUHomeKitAccessorySettingsItemModuleController delegate](self, "delegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "moduleController:presentSettingDetailsViewController:", self, v27);

LABEL_17:
        goto LABEL_18;
      }
    }
    if (v8)
    {
      if (objc_msgSend(v8, "isCollapsed"))
      {
        -[HUHomeKitAccessorySettingsItemModuleController delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_opt_respondsToSelector();

        if ((v30 & 1) != 0)
        {
          -[HUHomeKitAccessorySettingsItemModuleController delegate](self, "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "moduleController:expandModule:", self, v8);
          goto LABEL_17;
        }
      }
    }
  }
LABEL_18:

  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  HUHomeKitAccessorySettingsItemModuleController *v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  -[HUHomeKitAccessorySettingsItemModuleController cellToItemMap](self, "cellToItemMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  -[HUHomeKitAccessorySettingsItemModuleController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[HUHomeKitAccessorySettingsItemModuleController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v14[3] = &unk_1E6F555F8;
    v15 = v6;
    v18 = v4;
    v16 = v10;
    v17 = self;
    objc_msgSend(v13, "moduleController:preflightCheckToAllowSwitchingForSettingItem:changingToOn:withCompletion:", self, v16, v4, v14);

  }
  else
  {
    -[HUHomeKitAccessorySettingsItemModuleController _updateSwitchSettingItem:forCell:withValue:](self, "_updateSwitchSettingItem:forCell:withValue:", v10, v6, v4);
  }

}

void __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
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
    v16[2] = __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_18;
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
    v12[2] = __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_30;
    v12[3] = &unk_1E6F53170;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    v15 = *(_BYTE *)(a1 + 56);
    v11 = (id)objc_msgSend(v3, "addFailureBlock:", v12);

  }
}

void __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_18(uint64_t a1, void *a2)
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

uint64_t __71__HUHomeKitAccessorySettingsItemModuleController_switchCell_didTurnOn___block_invoke_30(uint64_t a1)
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
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__HUHomeKitAccessorySettingsItemModuleController__updateSwitchSettingItem_forCell_withValue___block_invoke;
  v14[3] = &unk_1E6F50330;
  v17 = v5;
  v15 = v8;
  v16 = v7;
  v11 = v7;
  v12 = v8;
  v13 = (id)objc_msgSend(v10, "addCompletionBlock:", v14);

}

void __93__HUHomeKitAccessorySettingsItemModuleController__updateSwitchSettingItem_forCell_withValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 48) == 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessorySettingsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "settingKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessoryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateSettingValue:forKeyPath:accessoryIdentifier:", v9, v10, v11);

  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = CFSTR("FAILED to");
    v15 = *(unsigned __int8 *)(a1 + 48);
    if (!v6)
      v14 = CFSTR("Successfully");
    v16 = CFSTR("Reverting UI state.");
    v17 = 138413058;
    v18 = v13;
    v19 = 2112;
    if (!v6)
      v16 = &stru_1E6F60E80;
    v20 = v14;
    v21 = 1024;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Setting [%@] %@ update with value %{BOOL}d. %@", (uint8_t *)&v17, 0x26u);
  }

}

- (HUHomeKitAccessorySettingsItemModuleControllerDelegate)delegate
{
  return (HUHomeKitAccessorySettingsItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMapTable)cellToItemMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCellToItemMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellToItemMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
