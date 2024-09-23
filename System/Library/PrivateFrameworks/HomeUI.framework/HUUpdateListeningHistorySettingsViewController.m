@implementation HUUpdateListeningHistorySettingsViewController

- (HUUpdateListeningHistorySettingsViewController)initWithUserItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  HUUpdateListeningHistorySettingsViewController *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke;
  v15[3] = &unk_1E6F4C518;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "setHomeCreator:", v15);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke_2;
  v13[3] = &unk_1E6F59498;
  v8 = v7;
  v14 = v8;
  objc_msgSend(v5, "setItemModuleCreator:", v13);
  v12.receiver = self;
  v12.super_class = (Class)HUUpdateListeningHistorySettingsViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v12, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v9)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUpdateListeningHistorySettingTitle"), CFSTR("HUUpdateListeningHistorySettingTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUpdateListeningHistorySettingsViewController setTitle:](v9, "setTitle:", v10);

  }
  return v9;
}

id __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke(uint64_t a1)
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

id __67__HUUpdateListeningHistorySettingsViewController_initWithUserItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  HUUpdateListeningHistorySettingsItemModule *v9;
  void *v10;
  HUUpdateListeningHistorySettingsItemModule *v11;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HUUpdateListeningHistorySettingsItemModule alloc];
  objc_msgSend(*(id *)(a1 + 32), "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUUpdateListeningHistorySettingsItemModule initWithItemUpdater:home:user:](v9, "initWithItemUpdater:home:user:", v6, v7, v10);

  objc_msgSend(v8, "addObject:", v11);
  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUUpdateListeningHistorySettingsItemModuleController *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  v5 = -[HUItemModuleController initWithModule:]([HUUpdateListeningHistorySettingsItemModuleController alloc], "initWithModule:", v4);
  -[HUUpdateListeningHistorySettingsViewController setModuleController:](self, "setModuleController:", v5);

  -[HUUpdateListeningHistorySettingsViewController moduleController](self, "moduleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  HUUpdateListeningHistorySettingsViewController *v15;
  HUUpdateListeningHistorySettingsViewController *v16;
  void *v17;
  void *v18;
  id v19;
  int v21;
  HUUpdateListeningHistorySettingsViewController *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    -[HUUpdateListeningHistorySettingsViewController navigationController](self, "navigationController");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (HUUpdateListeningHistorySettingsViewController *)v13;
    else
      v15 = self;
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "splashController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDisplayDeviceType:", 6);

    objc_msgSend(v17, "setPresentingViewController:", v16);
    objc_msgSend(v17, "present");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "openURL:", v7);
  }

  return 0;
}

- (HUUpdateListeningHistorySettingsItemModuleController)moduleController
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
}

@end
