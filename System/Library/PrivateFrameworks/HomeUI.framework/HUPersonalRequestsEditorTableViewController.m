@implementation HUPersonalRequestsEditorTableViewController

- (HUPersonalRequestsEditorTableViewController)initWithUserItem:(id)a3 onlyShowDeviceSwitches:(BOOL)a4
{
  return -[HUPersonalRequestsEditorTableViewController initWithUserItem:sourceMediaProfileContainer:onlyShowDeviceSwitches:](self, "initWithUserItem:sourceMediaProfileContainer:onlyShowDeviceSwitches:", a3, 0, a4);
}

- (HUPersonalRequestsEditorTableViewController)initWithUserItem:(id)a3 sourceMediaProfileContainer:(id)a4 onlyShowDeviceSwitches:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  HUPersonalRequestsEditorItemManager *v11;
  void *v12;
  HUPersonalRequestsEditorTableViewController *v13;
  HUPersonalRequestsEditorTableViewController *v14;
  HUPersonalRequestsDevicesModuleController *v15;
  void *v16;
  uint64_t v17;
  HUPersonalRequestsDevicesModuleController *prDevicesModuleController;
  void *v19;
  _QWORD v21[4];
  HUPersonalRequestsEditorTableViewController *v22;
  SEL v23;
  objc_super v24;

  v5 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HUPersonalRequestsEditorItemManager initWithDelegate:userItem:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorItemManager alloc], "initWithDelegate:userItem:onlyShowDeviceSwitches:", self, v10, v5);

  -[HUPersonalRequestsEditorItemManager prDevicesModule](v11, "prDevicesModule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceMediaProfileContainer:", v9);

  v24.receiver = self;
  v24.super_class = (Class)HUPersonalRequestsEditorTableViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v24, sel_initWithItemManager_tableViewStyle_, v11, 1);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_prEditorItemManager, v11);
    v15 = [HUPersonalRequestsDevicesModuleController alloc];
    -[HUPersonalRequestsEditorItemManager prDevicesModule](v11, "prDevicesModule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HUPersonalRequestsDevicesModuleController initWithModule:host:](v15, "initWithModule:host:", v16, v14);
    prDevicesModuleController = v14->_prDevicesModuleController;
    v14->_prDevicesModuleController = (HUPersonalRequestsDevicesModuleController *)v17;

    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequests"), CFSTR("HUUsersPersonalRequests"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsEditorTableViewController setTitle:](v14, "setTitle:", v19);

    v14->_onlyShowDeviceSwitches = v5;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __115__HUPersonalRequestsEditorTableViewController_initWithUserItem_sourceMediaProfileContainer_onlyShowDeviceSwitches___block_invoke;
    v21[3] = &unk_1E6F53210;
    v23 = a2;
    v22 = v14;
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguagesWithCompletion:", v21);

  }
  return v14;
}

void __115__HUPersonalRequestsEditorTableViewController_initWithUserItem_sourceMediaProfileContainer_onlyShowDeviceSwitches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v13;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", (uint8_t *)&v14, 0x20u);

  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "prEditorItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prDevicesModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportedMULanguageCodes:", v5);

    objc_msgSend(*(id *)(a1 + 32), "prEditorItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

  }
}

- (HUPersonalRequestsEditorTableViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HUPersonalRequestsEditorItemManager *v26;
  void *v27;
  HUPersonalRequestsEditorTableViewController *v28;
  HUPersonalRequestsEditorTableViewController *v29;
  HUPersonalRequestsDevicesModuleController *v30;
  void *v31;
  uint64_t v32;
  HUPersonalRequestsDevicesModuleController *prDevicesModuleController;
  void *v34;
  void *v36;
  _QWORD v37[4];
  HUPersonalRequestsEditorTableViewController *v38;
  SEL v39;
  objc_super v40;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0D31988];
  v9 = a3;
  v10 = [v8 alloc];
  objc_msgSend(v7, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithHome:user:nameStyle:", v11, v13, 1);

  objc_msgSend(v7, "sourceItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "mediaProfile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = &unk_1EF347468;
  v20 = v18;
  v21 = v20;
  if (v20)
  {
    if (objc_msgSend(v20, "conformsToProtocol:", v19))
      v22 = v21;
    else
      v22 = 0;
    v23 = v21;
    if (v22)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v25);

  }
  v23 = 0;
LABEL_8:

  v26 = -[HUPersonalRequestsEditorItemManager initWithDelegate:userItem:accessorySettingItem:module:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorItemManager alloc], "initWithDelegate:userItem:accessorySettingItem:module:onlyShowDeviceSwitches:", self, v14, v9, v7, 0);
  -[HUPersonalRequestsEditorItemManager prDevicesModule](v26, "prDevicesModule");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSourceMediaProfileContainer:", v23);

  v40.receiver = self;
  v40.super_class = (Class)HUPersonalRequestsEditorTableViewController;
  v28 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v40, sel_initWithItemManager_tableViewStyle_, v26, 1);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_prEditorItemManager, v26);
    v30 = [HUPersonalRequestsDevicesModuleController alloc];
    -[HUPersonalRequestsEditorItemManager prDevicesModule](v26, "prDevicesModule");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[HUPersonalRequestsDevicesModuleController initWithModule:host:](v30, "initWithModule:host:", v31, v29);
    prDevicesModuleController = v29->_prDevicesModuleController;
    v29->_prDevicesModuleController = (HUPersonalRequestsDevicesModuleController *)v32;

    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequests"), CFSTR("HUUsersPersonalRequests"), 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsEditorTableViewController setTitle:](v29, "setTitle:", v34);

    v29->_onlyShowDeviceSwitches = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __83__HUPersonalRequestsEditorTableViewController_initWithAccessorySettingItem_module___block_invoke;
    v37[3] = &unk_1E6F53210;
    v39 = a2;
    v38 = v29;
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguagesWithCompletion:", v37);

  }
  return v29;
}

void __83__HUPersonalRequestsEditorTableViewController_initWithAccessorySettingItem_module___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v13;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEBUG, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", (uint8_t *)&v14, 0x20u);

  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "prEditorItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prDevicesModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportedMULanguageCodes:", v5);

    objc_msgSend(*(id *)(a1 + 32), "prEditorItemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

  }
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)itemModuleControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUPersonalRequestsEditorTableViewController prDevicesModuleController](self, "prDevicesModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a3;
  -[HUPersonalRequestsEditorTableViewController prEditorItemManager](self, "prEditorItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityNotificationsItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    objc_opt_class();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUPersonalRequestsEditorTableViewController;
  v9 = a4;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v16, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUPersonalRequestsEditorTableViewController prEditorItemManager](self, "prEditorItemManager", v16.receiver, v16.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityNotificationsItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    objc_opt_class();
    v13 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_msgSend(v15, "setDelegate:", self);
  }

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v12;
  HUPersonalRequestsEditorTableViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "openURL:", v7);

  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[HUPersonalRequestsEditorTableViewController switchCell:didTurnOn:]";
    v11 = 2112;
    v12 = v6;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch cell: %@ to turn %{BOOL}d", (uint8_t *)&v9, 0x1Cu);
  }

  -[HUPersonalRequestsEditorTableViewController prEditorItemManager](self, "prEditorItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivityNotificationsEnabled:", v4);

}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_prEditorItemManager, a3);
}

- (HUPersonalRequestsDevicesModuleController)prDevicesModuleController
{
  return self->_prDevicesModuleController;
}

- (BOOL)onlyShowDeviceSwitches
{
  return self->_onlyShowDeviceSwitches;
}

- (void)setOnlyShowDeviceSwitches:(BOOL)a3
{
  self->_onlyShowDeviceSwitches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prDevicesModuleController, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
}

- (HUPersonalRequestsEditorTableViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  HUPersonalRequestsEditorTableViewController *v21;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v6, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithHome:user:nameStyle:", v6, v8, 1);

  objc_msgSend(v4, "homeKitSettingsVendor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "homeKitObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_1EF347468;
  v13 = v11;
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (objc_msgSend(v13, "conformsToProtocol:", v12))
    v15 = v14;
  else
    v15 = 0;
  v16 = v14;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v19);

LABEL_7:
    v16 = 0;
  }

  if (!v16)
  {
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "-[HUPersonalRequestsEditorTableViewController initWithAccessoryGroupItem:] called without a HFMediaProfileContainer", buf, 2u);
    }

  }
  v21 = -[HUPersonalRequestsEditorTableViewController initWithUserItem:sourceMediaProfileContainer:onlyShowDeviceSwitches:](self, "initWithUserItem:sourceMediaProfileContainer:onlyShowDeviceSwitches:", v9, v16, 0);

  return v21;
}

@end
