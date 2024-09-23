@implementation HUHomeKitAccessorySettingsItemModule

- (HUHomeKitAccessorySettingsItemModule)initWithSettingsController:(id)a3 itemUpdater:(id)a4 home:(id)a5 sourceItem:(id)a6 settingGroupKeyPath:(id)a7 isCollapsed:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HUHomeKitAccessorySettingsItemModule *v19;
  HUHomeKitAccessorySettingsItemModule *v20;
  void *v22;
  void *v23;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeKitAccessorySettingsItemModule.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeKitAccessorySettingsItemModule.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceItem"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HUHomeKitAccessorySettingsItemModule;
  v19 = -[HFItemModule initWithItemUpdater:](&v26, sel_initWithItemUpdater_, v15);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_settingsController, a3);
    objc_storeStrong((id *)&v20->_home, a5);
    objc_storeStrong((id *)&v20->_sourceItem, a6);
    objc_storeStrong((id *)&v20->_settingGroupKeyPath, a7);
    v20->_isCollapsed = a8;
    -[HUHomeKitAccessorySettingsItemModule _buildItemProviders](v20, "_buildItemProviders");
  }

  return v20;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUHomeKitAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
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
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  _BOOL4 v23;
  _QWORD *v24;
  void *v25;
  const __CFString *v26;
  _QWORD *v27;
  void *v28;
  _BOOL4 v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v41;
  id v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44 = (id)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HUHomeKitAccessorySettingsItemModule settingGroupKeyPath](self, "settingGroupKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v7);
  -[HUHomeKitAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __72__HUHomeKitAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v45[3] = &unk_1E6F4DAD8;
  v42 = v4;
  v46 = v42;
  objc_msgSend(v11, "na_filter:", v45);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v12);

  objc_msgSend(v8, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v14);

  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModule settingGroupKeyPath](self, "settingGroupKeyPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (_QWORD *)MEMORY[0x1E0D30928];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30928]);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v20 = (void *)v19,
        objc_msgSend(v17, "objectForKeyedSubscript:", *v18),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        HFLocalizedString(),
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        !v22))
  {
    v23 = -[HUHomeKitAccessorySettingsItemModule isCollapsed](self, "isCollapsed");
    v24 = (_QWORD *)MEMORY[0x1E0D30518];
    if (!v23)
      v24 = (_QWORD *)MEMORY[0x1E0D305E8];
    objc_msgSend(v17, "objectForKeyedSubscript:", *v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *v18);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v22)
    v26 = v22;
  else
    v26 = &stru_1E6F60E80;
  objc_msgSend(v8, "setHeaderTitle:", v26);
  v27 = (_QWORD *)MEMORY[0x1E0D305F8];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D305F8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    goto LABEL_13;
  v29 = -[HUHomeKitAccessorySettingsItemModule isCollapsed](self, "isCollapsed");
  v30 = (_QWORD *)MEMORY[0x1E0D30518];
  if (!v29)
    v30 = (_QWORD *)MEMORY[0x1E0D305E8];
  objc_msgSend(v17, "objectForKeyedSubscript:", *v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", *v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0D310F0], "defaultFactory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "formatterForKey:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }
  -[HUHomeKitAccessorySettingsItemModule sourceItem](self, "sourceItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "attributedStringForObjectValue:withDefaultAttributes:", v34, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v8, "setAttributedFooterTitle:", v35);
  }
  else
  {
    -[HUHomeKitAccessorySettingsItemModule sourceItem](self, "sourceItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringForObjectValue:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFooterTitle:", v37);

  }
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v44, "addObject:", v8);
  HFLogForCategory();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    -[HUHomeKitAccessorySettingsItemModule settingGroupKeyPath](self, "settingGroupKeyPath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v48 = v44;
    v49 = 2112;
    v50 = v41;
    _os_log_debug_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEBUG, "Built sections [%@] for settingGroupKeyPath = [%@]", buf, 0x16u);

  }
  v39 = v44;

  return v39;
}

uint64_t __72__HUHomeKitAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __72__HUHomeKitAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = objc_msgSend(v8, "displayIndex");
  if (v12 > objc_msgSend(v11, "displayIndex"))
    v13 = 1;
  else
    v13 = -1;

  return v13;
}

- (void)_buildItemProviders
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModule settingGroupKeyPath](self, "settingGroupKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HUHomeKitAccessorySettingsItemModule isCollapsed](self, "isCollapsed");
  v7 = (_QWORD *)MEMORY[0x1E0D30518];
  if (!v6)
    v7 = (_QWORD *)MEMORY[0x1E0D305E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D31428]);
  -[HUHomeKitAccessorySettingsItemModule settingsController](self, "settingsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModule sourceItem](self, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeKitAccessorySettingsItemModule settingGroupKeyPath](self, "settingGroupKeyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithSettingsController:sourceItem:settingGroupKeyPath:moduleSettings:usageOptions:", v11, v12, v13, v9, 0);
  -[HUHomeKitAccessorySettingsItemModule setAccessorySettingsItemProvider:](self, "setAccessorySettingsItemProvider:", v14);

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[HUHomeKitAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeKitAccessorySettingsItemModule settingGroupKeyPath](self, "settingGroupKeyPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    _os_log_debug_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEBUG, "Built accessorySettingsItemProvider [%@] for settingGroupKeyPath = [%@]", (uint8_t *)&v18, 0x16u);

  }
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (NSString)settingGroupKeyPath
{
  return self->_settingGroupKeyPath;
}

- (void)setSettingGroupKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isCollapsed
{
  return self->_isCollapsed;
}

- (void)setIsCollapsed:(BOOL)a3
{
  self->_isCollapsed = a3;
}

- (HFHomeKitAccessorySettingsItemProvider)accessorySettingsItemProvider
{
  return self->_accessorySettingsItemProvider;
}

- (void)setAccessorySettingsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsItemProvider, a3);
}

- (HFAccessorySettingsManagerProtocol)accessorySettingsManager
{
  return self->_accessorySettingsManager;
}

- (void)setAccessorySettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySettingsManager, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_settingGroupKeyPath, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
