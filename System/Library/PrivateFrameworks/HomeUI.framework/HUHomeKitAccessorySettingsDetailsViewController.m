@implementation HUHomeKitAccessorySettingsDetailsViewController

- (HUHomeKitAccessorySettingsDetailsViewController)initWithCollapsedAccessorySettingItemModule:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  HUHomeKitAccessorySettingsDetailsViewController *v15;
  HUHomeKitAccessorySettingsDetailsViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeKitAccessorySettingsDetailsViewController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemModule != nil"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessorySettingsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke;
  v26[3] = &unk_1E6F4C518;
  v13 = v11;
  v27 = v13;
  objc_msgSend(v6, "setHomeCreator:", v26);
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke_2;
  v24[3] = &unk_1E6F59498;
  v14 = v13;
  v25 = v14;
  objc_msgSend(v6, "setItemModuleCreator:", v24);
  v23.receiver = self;
  v23.super_class = (Class)HUHomeKitAccessorySettingsDetailsViewController;
  v15 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v23, sel_initWithItemManager_tableViewStyle_, v6, 1);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_collapsedModule, v10);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessorySettingsDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settingGroupKeyPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_localizedTitleForKeyPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeKitAccessorySettingsDetailsViewController setTitle:](v16, "setTitle:", v20);

  }
  return v16;
}

id __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __95__HUHomeKitAccessorySettingsDetailsViewController_initWithCollapsedAccessorySettingItemModule___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  HUHomeKitAccessorySettingsItemModule *v8;
  void *v9;
  void *v10;
  void *v11;
  HUHomeKitAccessorySettingsItemModule *v12;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_new();
  v8 = [HUHomeKitAccessorySettingsItemModule alloc];
  objc_msgSend(*(id *)(a1 + 32), "settingsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settingGroupKeyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HUHomeKitAccessorySettingsItemModule initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:](v8, "initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:", v9, v5, v6, v10, v11, 0);

  objc_msgSend(v7, "addObject:", v12);
  return v7;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUHomeKitAccessorySettingsItemModuleController *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  v5 = -[HUHomeKitAccessorySettingsItemModuleController initWithModule:delegate:]([HUHomeKitAccessorySettingsItemModuleController alloc], "initWithModule:delegate:", v4, 0);
  -[HUHomeKitAccessorySettingsDetailsViewController setModuleController:](self, "setModuleController:", v5);

  -[HUHomeKitAccessorySettingsDetailsViewController moduleController](self, "moduleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    v32 = 2112;
    v33 = v7;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@ didRecieveSettingsUpdatesForAccessoryWithIdentifier = [%@] settings = [%@]. Now reloading all Items.", buf, 0x20u);

  }
  v24 = v7;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemModules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        objc_opt_class();
        v18 = v17;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        if (v20)
        {
          objc_msgSend(v20, "accessorySettingsItemProvider");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "updateSettings:", v8);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  -[HUItemTableViewController itemManager](self, "itemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  HUHomeKitAccessorySettingsDetailsViewController *v11;
  HUHomeKitAccessorySettingsDetailsViewController *v12;
  void *v13;
  void *v14;
  int v16;
  HUHomeKitAccessorySettingsDetailsViewController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v16, 0x16u);
  }

  -[HUHomeKitAccessorySettingsDetailsViewController navigationController](self, "navigationController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (HUHomeKitAccessorySettingsDetailsViewController *)v9;
  else
    v11 = self;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "splashController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayDeviceType:", 6);

  objc_msgSend(v13, "setPresentingViewController:", v12);
  objc_msgSend(v13, "present");

  return 0;
}

- (void)dismissPrivacyController
{
  -[HUHomeKitAccessorySettingsDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HUHomeKitAccessorySettingsItemModule)collapsedModule
{
  return self->_collapsedModule;
}

- (void)setCollapsedModule:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedModule, a3);
}

- (HUHomeKitAccessorySettingsItemModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_moduleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleController, 0);
  objc_storeStrong((id *)&self->_collapsedModule, 0);
}

@end
