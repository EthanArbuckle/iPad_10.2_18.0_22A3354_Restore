@implementation HUEditLocationViewController

- (HUEditLocationViewController)initWithHomeBuilder:(id)a3 presentationDelegate:(id)a4 addLocationDelegate:(id)a5 context:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  HUEditLocationItemManager *v14;
  HUEditLocationViewController *v15;
  uint64_t v16;
  NSString *editedName;
  uint64_t v18;
  NSString *editedNotes;
  void *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[HUEditLocationItemManager initWithHomeBuilder:delegate:context:]([HUEditLocationItemManager alloc], "initWithHomeBuilder:delegate:context:", v11, self, a6);
  v22.receiver = self;
  v22.super_class = (Class)HUEditLocationViewController;
  v15 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v22, sel_initWithItemManager_tableViewStyle_, v14, 1);
  if (v15)
  {
    objc_msgSend(v11, "name");
    v16 = objc_claimAutoreleasedReturnValue();
    editedName = v15->_editedName;
    v15->_editedName = (NSString *)v16;

    objc_msgSend(v11, "userNotes");
    v18 = objc_claimAutoreleasedReturnValue();
    editedNotes = v15->_editedNotes;
    v15->_editedNotes = (NSString *)v18;

    objc_storeWeak((id *)&v15->_homeItemManager, v14);
    objc_storeStrong((id *)&v15->_homeBuilder, a3);
    objc_storeWeak((id *)&v15->_presentationDelegate, v12);
    objc_storeWeak((id *)&v15->_addLocationDelegate, v13);
    v15->_context = a6;
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addHomeManagerObserver:", v15);

  }
  return v15;
}

- (HUEditLocationViewController)initWithHomeBuilder:(id)a3 presentationDelegate:(id)a4 addLocationDelegate:(id)a5
{
  return -[HUEditLocationViewController initWithHomeBuilder:presentationDelegate:addLocationDelegate:context:](self, "initWithHomeBuilder:presentationDelegate:addLocationDelegate:context:", a3, a4, a5, 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUWallpaperPickerInlineViewController *v10;
  HUWallpaperPickerInlineViewController *wallpaperPickerViewController;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)HUEditLocationViewController;
  -[HUItemTableViewController viewDidLoad](&v30, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[HUEditLocationViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[HUEditLocationViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.Done"));

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController setTitle:](self, "setTitle:", v9);

  if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell"))
  {
    v10 = objc_alloc_init(HUWallpaperPickerInlineViewController);
    wallpaperPickerViewController = self->_wallpaperPickerViewController;
    self->_wallpaperPickerViewController = v10;

  }
  -[HUEditLocationViewController addLocationDelegate](self, "addLocationDelegate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[HUEditLocationViewController context](self, "context");

    if (v14 != 1)
    {
      if (objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode"))
      {
        -[HUEditLocationViewController navigationItem](self, "navigationItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setHidesBackButton:", 1);
      }
      else
      {
        if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
          goto LABEL_10;
        v16 = objc_alloc(MEMORY[0x1E0CEA380]);
        _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationAddButtonTitle"), CFSTR("HUEditLocationAddButtonTitle"), 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v17, 0, self, sel_addButtonPressed_);
        -[HUEditLocationViewController navigationItem](self, "navigationItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLeftBarButtonItem:", v18);

        -[HUEditLocationViewController navigationItem](self, "navigationItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "leftBarButtonItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.AddHome"));

      }
    }
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "homeManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hasOptedToHH2");

  if (v23)
  {
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startHomeDataSyncWithCompletionHandler:", &__block_literal_global_127);

  }
  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "home");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v26, "fetchMediaServicesForHome:", v28);

  -[HUEditLocationViewController prefetchActivityLogEventsIfNecessary](self, "prefetchActivityLogEventsIfNecessary");
}

void __43__HUEditLocationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Failed to initiate home data sync with error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)scrollToNotificationTopicsAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  BOOL v9;

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstFastUpdateFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HUEditLocationViewController_scrollToNotificationTopicsAnimated___block_invoke;
  v8[3] = &unk_1E6F559B0;
  v8[4] = self;
  v9 = a3;
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v8);

}

void __67__HUEditLocationViewController_scrollToNotificationTopicsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "homeItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUUserNotificationTopicListModule sectionID](HUUserNotificationTopicListModule, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "sectionIndexForDisplayedSectionIdentifier:", v3);

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeItemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayedItemsInSection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v8;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollToItem:animated:", v8, *(unsigned __int8 *)(a1 + 40));
      v7 = v8;
    }

  }
}

- (id)presentNotificationSettingsForTopic:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HUEditLocationViewController_presentNotificationSettingsForTopic_animated___block_invoke;
  v11[3] = &unk_1E6F4C990;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __77__HUEditLocationViewController_presentNotificationSettingsForTopic_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "notificationTopicModuleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentNotificationSettingsForTopic:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HUEditLocationViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke;
  v11[3] = &unk_1E6F4C990;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __82__HUEditLocationViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "notificationTopicModuleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showNotificationSettingsForHomeKitObject:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presentNetworkSettings:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HUEditLocationViewController_presentNetworkSettings___block_invoke;
  v8[3] = &unk_1E6F559D8;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__HUEditLocationViewController_presentNetworkSettings___block_invoke(uint64_t a1)
{
  HUNetworkRouterSettingsViewController *v2;
  void *v3;
  void *v4;
  HUNetworkRouterSettingsViewController *v5;
  void *v6;
  void *v7;
  HUNetworkRouterSettingsViewController *v8;
  void *v9;
  _QWORD v11[4];
  HUNetworkRouterSettingsViewController *v12;

  v2 = [HUNetworkRouterSettingsViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "homeBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUNetworkRouterSettingsViewController initWithHome:](v2, "initWithHome:", v4);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HUEditLocationViewController_presentNetworkSettings___block_invoke_2;
  v11[3] = &unk_1E6F514A0;
  v12 = v5;
  v8 = v5;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __55__HUEditLocationViewController_presentNetworkSettings___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)presentBridgeSettings:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HUEditLocationViewController_presentBridgeSettings___block_invoke;
  v8[3] = &unk_1E6F559D8;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __54__HUEditLocationViewController_presentBridgeSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "homeBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HomeHubsAndBridgesHelper createHomeHubsAndBridgesListViewHostingControllerWithHome:](_TtC6HomeUI24HomeHubsAndBridgesHelper, "createHomeHubsAndBridgesListViewHostingControllerWithHome:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v4, *(unsigned __int8 *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HUEditLocationViewController_presentBridgeSettings___block_invoke_2;
  v10[3] = &unk_1E6F514A0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __54__HUEditLocationViewController_presentBridgeSettings___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)presentSoftwareUpdate:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke;
  v8[3] = &unk_1E6F559D8;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  HUSoftwareUpdateStandaloneViewController *v5;
  void *v6;
  void *v7;
  HUSoftwareUpdateStandaloneViewController *v8;
  void *v9;
  void *v10;
  HUSoftwareUpdateStandaloneViewController *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  HUSoftwareUpdateStandaloneViewController *v18;

  objc_msgSend(*(id *)(a1 + 32), "homeBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_shouldShowSoftwareUpdateSettings");

  if ((v4 & 1) != 0)
  {
    v5 = [HUSoftwareUpdateStandaloneViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "homeBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUSoftwareUpdateStandaloneViewController initWithHome:](v5, "initWithHome:", v7);

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hu_pushPreloadableViewController:animated:", v8, *(unsigned __int8 *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke_2;
    v17[3] = &unk_1E6F514A0;
    v18 = v8;
    v11 = v8;
    objc_msgSend(v10, "flatMap:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
}

uint64_t __54__HUEditLocationViewController_presentSoftwareUpdate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)presentPersonalRequestsSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HUEditLocationViewController *v11;

  v4 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke;
  v9[3] = &unk_1E6F55A28;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  HUEditUserViewController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HUEditUserViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v2 = objc_alloc(MEMORY[0x1E0D31988]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithHome:user:nameStyle:", v3, v4, 0);

  v6 = [HUEditUserViewController alloc];
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUEditUserViewController initWithItem:home:pinCodeManager:](v6, "initWithItem:home:pinCodeManager:", v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hu_pushPreloadableViewController:animated:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_2;
  v17[3] = &unk_1E6F55A00;
  v13 = *(_QWORD *)(a1 + 40);
  v18 = v5;
  v19 = v13;
  v14 = v5;
  objc_msgSend(v12, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_2(uint64_t a1)
{
  HUPersonalRequestsEditorTableViewController *v2;
  void *v3;
  void *v4;
  HUPersonalRequestsEditorTableViewController *v5;
  void *v6;
  _QWORD v8[4];
  HUPersonalRequestsEditorTableViewController *v9;

  v2 = -[HUPersonalRequestsEditorTableViewController initWithUserItem:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorTableViewController alloc], "initWithUserItem:onlyShowDeviceSwitches:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hu_pushPreloadableViewController:animated:", v2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_3;
  v8[3] = &unk_1E6F514A0;
  v9 = v2;
  v5 = v2;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __64__HUEditLocationViewController_presentPersonalRequestsSettings___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)presentUserViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HUEditLocationViewController *v11;

  v4 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HUEditLocationViewController_presentUserViewController___block_invoke;
  v9[3] = &unk_1E6F55A28;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __58__HUEditLocationViewController_presentUserViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allHomesFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HUEditLocationViewController_presentUserViewController___block_invoke_2;
  v8[3] = &unk_1E6F51740;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  objc_msgSend(v3, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__HUEditLocationViewController_presentUserViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HUEditUserViewController *v20;
  void *v21;
  void *v22;
  HUEditUserViewController *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = a2;
  v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v27)
  {
    v4 = *(_QWORD *)v35;
    v29 = v3;
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v35 != v4)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v28 = v6;
        objc_msgSend(v6, "hf_allUsersIncludingCurrentUser", v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v31;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v31 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              objc_msgSend(v12, "uniqueIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

              if ((v15 & 1) != 0)
              {
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31988]), "initWithHome:user:nameStyle:", v28, v12, 0);
                v20 = [HUEditUserViewController alloc];
                objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "pinCodeManager");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = -[HUEditUserViewController initWithItem:home:pinCodeManager:](v20, "initWithItem:home:pinCodeManager:", v19, v28, v22);

                objc_msgSend(*(id *)(a1 + 40), "navigationController");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "hu_pushPreloadableViewController:animated:", v23, 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                v3 = v29;
                v17 = v29;
                goto LABEL_18;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v9)
              continue;
            break;
          }
        }

        v4 = v26;
        v3 = v29;
      }
      v27 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v27);
  }

  v16 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "futureWithError:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v18;
}

- (id)presentRestrictedGuestLockSettings
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26[2];
  uint8_t buf[4];
  HUEditLocationViewController *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = self;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@ Presenting lock category settings for restricted guest.", buf, 0x16u);

  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v7, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithHome:user:nameStyle:", v7, v10, 0);

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pinCodeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  objc_msgSend(v13, "userPinCodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke;
  v21[3] = &unk_1E6F55A50;
  objc_copyWeak(v26, (id *)buf);
  v15 = v8;
  v22 = v15;
  v26[1] = (id)a2;
  v16 = v7;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  v18 = v11;
  v25 = v18;
  v19 = (id)objc_msgSend(v14, "addSuccessBlock:", v21);

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);

  return v14;
}

void __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HUPinCodeDetailsViewController *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 64);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke_2;
  v14[3] = &unk_1E6F531C0;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = WeakRetained;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Found matching PIN code for user.", buf, 0x16u);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v6, *(_QWORD *)(a1 + 40), 0);
    v10 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:]([HUPinCodeDetailsViewController alloc], "initWithItem:pinCodeManager:home:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v10 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:]([HUPinCodeDetailsViewController alloc], "initWithItem:pinCodeManager:home:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersLocksTitle"), CFSTR("HUUsersLocksTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeDetailsViewController setTitle:](v10, "setTitle:", v11);

  objc_msgSend(WeakRetained, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v10, 1);

}

uint64_t __66__HUEditLocationViewController_presentRestrictedGuestLockSettings__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)presentUserLockSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUEditLocationViewController_presentUserLockSettings___block_invoke;
  v9[3] = &unk_1E6F55A28;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __56__HUEditLocationViewController_presentUserLockSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUEditUserViewController *v8;
  void *v9;
  id v10;
  uint64_t v11;
  HUEditUserViewController *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  HUEditUserViewController *v18;

  objc_msgSend(*(id *)(a1 + 32), "homeItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:user:nameStyle:", v5, v6, 0);

  v8 = -[HUEditUserViewController initWithItem:home:pinCodeManager:]([HUEditUserViewController alloc], "initWithItem:home:pinCodeManager:", v7, *(_QWORD *)(a1 + 40), v3);
  objc_msgSend(v3, "refreshDataStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_2;
  v15[3] = &unk_1E6F55A78;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  v17 = v11;
  v18 = v8;
  v12 = v8;
  objc_msgSend(v9, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "hf_userIsRestrictedGuest:", v3);

  v4 = *(void **)(a1 + 40);
  if ((_DWORD)v2)
  {
    objc_msgSend(v4, "presentRestrictedGuestLockSettings");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", *(_QWORD *)(a1 + 48), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_3;
    v9[3] = &unk_1E6F502A0;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v7, "addSuccessBlock:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

id __56__HUEditLocationViewController_presentUserLockSettings___block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "presentPinDetailsViewController");
}

- (id)presentDefaultMediaServiceSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HUEditLocationViewController *v11;

  v4 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke;
  v9[3] = &unk_1E6F55A28;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  HUEditUserViewController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HUEditUserViewController *v10;
  void *v11;
  void *v12;
  HUEditUserViewController *v13;
  void *v14;
  _QWORD v16[4];
  HUEditUserViewController *v17;

  v2 = objc_alloc(MEMORY[0x1E0D31988]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithHome:user:nameStyle:", v3, v4, 0);

  v6 = [HUEditUserViewController alloc];
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUEditUserViewController initWithItem:home:pinCodeManager:](v6, "initWithItem:home:pinCodeManager:", v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hu_pushPreloadableViewController:animated:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke_2;
  v16[3] = &unk_1E6F502A0;
  v17 = v10;
  v13 = v10;
  objc_msgSend(v12, "addSuccessBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __67__HUEditLocationViewController_presentDefaultMediaServiceSettings___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "presentDefaultAccountViewController");
}

- (void)addButtonPressed:(id)a3
{
  id v4;

  -[HUEditLocationViewController addLocationDelegate](self, "addLocationDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editLocationViewControllerWouldPresentAddController:", self);

}

- (void)doneButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D319D0];
  -[HUEditLocationViewController editedName](self, "editedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sanitizeUserEnteredHomeKitName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  -[HUEditLocationViewController nameCell](self, "nameCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v7);

  -[HUEditLocationViewController setTitle:](self, "setTitle:", v7);
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v7);

  -[HUEditLocationViewController editedNotes](self, "editedNotes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserNotes:", v13);

  -[HUEditLocationViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightBarButtonItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController setSavedButtonBarItem:](self, "setSavedButtonBarItem:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v17);
  -[HUEditLocationViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRightBarButtonItem:", v18);

  objc_msgSend(v17, "startAnimating");
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commitItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke;
  v28[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v29, &location);
  v23 = (id)objc_msgSend(v21, "addFailureBlock:", v28);
  v27[0] = v22;
  v27[1] = 3221225472;
  v27[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke_3;
  v27[3] = &unk_1E6F4C610;
  v27[4] = self;
  v24 = (id)objc_msgSend(v21, "addCompletionBlock:", v27);
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke_4;
  v26[3] = &unk_1E6F502A0;
  v26[4] = self;
  v25 = (id)objc_msgSend(v21, "addSuccessBlock:", v26);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __50__HUEditLocationViewController_doneButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HUEditLocationViewController_doneButtonPressed___block_invoke_2;
  v6[3] = &unk_1E6F4D988;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

}

uint64_t __50__HUEditLocationViewController_doneButtonPressed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doneButtonPressed:", 0);
}

uint64_t __50__HUEditLocationViewController_doneButtonPressed___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "savedButtonBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "setSavedButtonBarItem:", 0);
}

void __50__HUEditLocationViewController_doneButtonPressed___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "finishPresentation:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[HUEditLocationViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[HUEditLocationViewController tableView](self, "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HUUserNotificationTopicListModuleController *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HUMatterConnectedServicesItemModuleController *v17;

  v5 = a3;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationSettingsModule");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v12 = -[HUItemModuleController initWithModule:]([HUUserNotificationTopicListModuleController alloc], "initWithModule:", v5);
    -[HUEditLocationViewController setNotificationTopicModuleController:](self, "setNotificationTopicModuleController:", v12);

    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pinCodeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController notificationTopicModuleController](self, "notificationTopicModuleController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPinCodeManager:", v14);

    -[HUEditLocationViewController notificationTopicModuleController](self, "notificationTopicModuleController");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v16;
    goto LABEL_7;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectedServicesItemModule");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    v17 = -[HUItemModuleController initWithModule:]([HUMatterConnectedServicesItemModuleController alloc], "initWithModule:", v5);
    -[HUEditLocationViewController setConnectedServicesItemModuleController:](self, "setConnectedServicesItemModuleController:", v17);

    -[HUEditLocationViewController connectedServicesItemModuleController](self, "connectedServicesItemModuleController");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUEditLocationViewController.m"), 452, CFSTR("Unknown module %@"), v5);

  v11 = 0;
LABEL_7:

  return v11;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;

  v6 = a3;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nameItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inviteUsersItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "isEqual:", v11);

  if (v12)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chooseWallpaperItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v14))
    goto LABEL_5;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allowedAccessoryCategoryItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v6);

  if (v18)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "homeScheduleItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "isEqual:", v22);

  if (v23)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "wallpaperThumbnailItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v6, "isEqual:", v25);

  if (v26)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "wallpaperPickerItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "isEqual:", v28);

  if (v29)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "detailNotesItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v6, "isEqual:", v31);

  if (v32)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "softwareUpdateItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v6, "isEqual:", v34);

  if (v35)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "showPredictedScenes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v6, "isEqual:", v37);

  if (v38)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cameraItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v14))
  {
LABEL_5:

  }
  else
  {
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "removeItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v6, "isEqual:", v40);

    if (!v41)
    {
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "soundCheckItem");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v6, "isEqual:", v43);

      if (!v44)
      {
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "userItemProvider");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "items");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "containsObject:", v6))
        {

        }
        else
        {
          -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "inviteItemProvider");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "items");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "containsObject:", v6);

          if (!v51)
          {
            -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "guestsItem");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v6, "isEqual:", v53);

            if (!v54)
            {
              -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "locationServicesSettingItem");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v6, "isEqual:", v56);

              if (!v57)
              {
                -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "siriTriggerPhraseSettingItem");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v6, "isEqual:", v59);

                if (!v60)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUEditLocationViewController.m"), 526, CFSTR("Couldn't find a cell class for item: %@"), v6);

                  v19 = 0;
                  goto LABEL_8;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_7:
  objc_opt_class();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return (Class)v19;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  char isKindOfClass;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  id v144;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  v144 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v144;
  else
    v11 = 0;
  v12 = v11;

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "chooseWallpaperItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v14))
  {

LABEL_7:
    v19 = v144;
    objc_msgSend(v19, "setAccessoryView:", 0);
    objc_msgSend(v19, "setAccessoryType:", 1);
    objc_msgSend(v19, "setHideIcon:", 1);
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allowedAccessoryCategoryItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v9);

    if (!v23)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v19, "setHideIcon:", 0);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentMetrics:", v24);
LABEL_9:

    goto LABEL_10;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allowedAccessoryCategoryItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "items");
  v143 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v9);

  v10 = v143;
  if (v18)
    goto LABEL_7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "homeScheduleItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v9, "isEqual:", v26);

  if (v27)
  {
    v28 = v144;
    objc_msgSend(v28, "setIconDisplayStyle:", 1);
    objc_msgSend(v28, "setDisableContinuousIconAnimation:", 1);
    HUDefaultSizeForIconSize();
    v30 = v29;
    v32 = v31;
    objc_msgSend(v28, "contentMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setIconSize:", v30, v32);

    objc_msgSend(v28, "setAccessoryView:", 0);
    objc_msgSend(v28, "setAccessoryType:", 1);
LABEL_14:

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "nameItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v9, "isEqual:", v35);

    if (!v36)
      goto LABEL_11;
    -[HUEditLocationViewController setNameCell:](self, "setNameCell:", v144);
    -[HUEditLocationViewController nameCell](self, "nameCell");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("Home.HomeSettings.HomeName"));
    goto LABEL_14;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v38, "detailNotesItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v9, "isEqual:", v40);

    if (!v41)
      goto LABEL_11;
    -[HUEditLocationViewController setDetailNotesCell:](self, "setDetailNotesCell:", v144);
    -[HUEditLocationViewController detailNotesCell](self, "detailNotesCell");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextViewDelegate:", self);

    objc_msgSend(v9, "latestResults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController detailNotesCell](self, "detailNotesCell");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAccessibilityIdentifier:", v44);

    -[HUEditLocationViewController detailNotesCell](self, "detailNotesCell");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEditEnabled:", objc_msgSend(v46, "hf_currentUserIsAdministrator"));

    goto LABEL_9;
  }
  objc_msgSend(v38, "siriTriggerPhraseSettingItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v9, "isEqual:", v47);

  if (v48)
  {
    v49 = v144;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "titleForSection:", objc_msgSend(v143, "section"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "setAccessoryType:", 1);
    objc_msgSend(v49, "setHideIcon:", 1);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setContentMetrics:", v52);

    goto LABEL_11;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "softwareUpdateItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v9, "isEqual:", v54);

  if (v55)
  {
    v56 = v144;
    objc_msgSend(v56, "setAccessoryType:", 1);
    +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setContentMetrics:", v57);

    objc_msgSend(v9, "latestResults");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setHideIcon:", v58 == 0);
LABEL_36:

    goto LABEL_37;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "wallpaperThumbnailItem");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v9, "isEqual:", v60);

  if (v61)
  {
    v62 = objc_opt_class();
    v63 = v144;
    if (v63)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v64 = v63;
      else
        v64 = 0;
      v65 = v63;
      if (v64)
        goto LABEL_33;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v62, objc_opt_class());

    }
    v65 = 0;
LABEL_33:

    objc_msgSend(v9, "latestResults");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setAccessibilityIdentifier:", v69);

    objc_msgSend(v65, "setDelegate:", self);
    goto LABEL_11;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "wallpaperPickerItem");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v9, "isEqual:", v71);

  if (v72)
  {
    v73 = v144;
    -[HUEditLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setViewController:", v74);

    -[HUEditLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setDelegate:", self);

    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "allNamedWallpapersForWallpaperCollectionType:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setNamedWallpapers:", v77);

    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allNamedWallpaperThumbnailsForWallpaperCollectionType:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setNamedWallpaperThumbnails:", v58);
    goto LABEL_36;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "inviteUsersItem");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v9, "isEqual:", v80);

  if (v81)
  {
    objc_msgSend(v144, "defaultContentConfiguration");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "latestResults");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v83);

    v84 = (void *)MEMORY[0x1E0CEA638];
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "inviteUsersItem");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "latestResults");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C78]);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "systemImageNamed:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v89);

    objc_msgSend(v9, "latestResults");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "setAccessibilityIdentifier:", v91);

    objc_msgSend(v9, "latestResults");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v86) = objc_msgSend(v93, "BOOLValue");

    if ((_DWORD)v86)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textProperties");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setColor:", v94);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageProperties");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setTintColor:", v96);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textProperties");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "setColor:", v100);

      objc_msgSend(v19, "imageProperties");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setTintColor:", 0);
    }
    v10 = v143;

    v102 = *MEMORY[0x1E0CEB990];
    objc_msgSend(v19, "imageProperties");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setReservedLayoutSize:", 37.0, v102);

    objc_msgSend(v144, "setContentConfiguration:", v19);
    goto LABEL_10;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "cameraItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v99))
  {

    goto LABEL_46;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "removeItem");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v9, "isEqual:", v105);

  if (v106)
  {
LABEL_46:
    objc_msgSend(v144, "imageView");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setImage:", 0);

    objc_msgSend(v144, "setIndentationLevel:", 0);
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "cameraItem");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v9, "isEqual:", v109);

    if (v110)
    {
      objc_msgSend(v9, "latestResults");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setAccessibilityIdentifier:", v112);

    }
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v143;
    if ((objc_msgSend(v9, "isEqual:", v58) & 1) != 0)
    {
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "home");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "hf_currentUserIsOwner");

      if (!v115)
        goto LABEL_11;
      objc_msgSend(v9, "latestResults");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setAccessibilityIdentifier:", v116);

      goto LABEL_14;
    }
LABEL_37:

    goto LABEL_10;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "soundCheckItem");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v9, "isEqual:", v118);

  if (!v119)
  {
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "userItemProvider");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "items");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "containsObject:", v9))
    {

    }
    else
    {
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "inviteItemProvider");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "items");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend(v125, "containsObject:", v9);

      if (!v126)
      {
        v10 = v143;
        if (!v12)
          goto LABEL_11;
        objc_msgSend(v12, "item");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "showPredictedScenes");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = objc_msgSend(v134, "isEqual:", v136);

        if (v137)
        {
          objc_msgSend(v9, "latestResults");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAccessibilityIdentifier:", v139);

        }
        objc_msgSend(v12, "setDelegate:", self);
        goto LABEL_64;
      }
    }
    objc_msgSend(v144, "setAccessoryType:", 1);
    objc_opt_class();
    v127 = v144;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v128 = v127;
    else
      v128 = 0;
    v129 = v128;

    objc_msgSend(v129, "setShowAccessLevelDescription:", 1);
    objc_msgSend(v9, "latestResults");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    if (v131)
    {
      objc_msgSend(v129, "setUserHandle:", v131);
      objc_msgSend(v9, "latestResults");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "setAccessibilityIdentifier:", v133);

    }
LABEL_64:
    v10 = v143;
    goto LABEL_11;
  }
  v10 = v143;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HUEditLocationViewController setupCell:forItem:indexPath:]");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_opt_class();
    objc_msgSend(v140, "handleFailureInFunction:file:lineNumber:description:", v141, CFSTR("HUEditLocationViewController.m"), 636, CFSTR("Expected class of %@ but was %@"), v142, objc_opt_class());

  }
  objc_msgSend(v12, "setDelegate:", self);
LABEL_11:

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  _BOOL8 v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;
  _QWORD v78[5];
  BOOL v79;
  _QWORD v80[4];
  id v81;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wallpaperThumbnailItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "isEqual:", v14);

  if (v15)
  {
    v16 = v10;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v19 / v21;

    objc_msgSend(v16, "setImageSize:", round(v22 * 244.0));
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "wallpaperBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "wallpaperEditCollectionFuture");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke;
    v80[3] = &unk_1E6F55AA0;
    v81 = v16;
    v26 = v16;
    v27 = (id)objc_msgSend(v25, "addSuccessBlock:", v80);

  }
  else
  {
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "wallpaperPickerItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v11, "isEqual:", v29);

    if (v30)
    {
      -[HUEditLocationViewController wallpaperPickerViewController](self, "wallpaperPickerViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUEditLocationViewController tableView](self, "tableView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "frame");
      objc_msgSend(v31, "setImageSizeToFitWidth:forNumberOfWallpapers:", 3, v33);

      -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "wallpaperBuilder");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "wallpaperEditCollectionFuture");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke_2;
      v78[3] = &unk_1E6F55AC8;
      v78[4] = self;
      v79 = v6;
      v36 = (id)objc_msgSend(v35, "addSuccessBlock:", v78);
    }
    else
    {
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "detailNotesItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v11, "isEqual:", v38);

      if (v39)
      {
        v40 = v10;
        -[HUEditLocationViewController editedNotes](self, "editedNotes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setText:", v41);

        -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "home");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setEditEnabled:", objc_msgSend(v43, "hf_currentUserIsAdministrator"));

        objc_msgSend(v11, "latestResults");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D28]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setPlaceholderText:", v45);

        goto LABEL_7;
      }
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v11, "isEqual:", v47);

      if (v48)
      {
        objc_msgSend(v10, "setDestructive:", 1);
        goto LABEL_7;
      }
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "soundCheckItem");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v11, "isEqual:", v50);

      if (v51)
      {
        v26 = v10;
        objc_msgSend(v11, "latestResults");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "integerValue") == 2;

        objc_msgSend(v26, "setOn:animated:", v54, 1);
        goto LABEL_6;
      }
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "guestsItem");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v11, "isEqual:", v56);

      if (v57)
      {
        objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "latestResults");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setText:", v59);

        objc_msgSend(v11, "latestResults");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setSecondaryText:", v61);

        objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "secondaryTextProperties");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setColor:", v62);

        objc_msgSend(v11, "latestResults");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setImage:", v65);

        objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "imageProperties");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setTintColor:", v66);

        v68 = *MEMORY[0x1E0CEB990];
        objc_msgSend(v26, "imageProperties");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setReservedLayoutSize:", 37.0, v68);

        objc_msgSend(v10, "setContentConfiguration:", v26);
        objc_msgSend(v10, "setAccessoryType:", 1);
        goto LABEL_6;
      }
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "locationServicesSettingItem");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v11, "isEqual:", v71);

      if (!v72)
        goto LABEL_7;
      objc_opt_class();
      v73 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v74 = v73;
      else
        v74 = 0;
      v26 = v74;

      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "home");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setOn:", objc_msgSend(v76, "isLocationServicesEnabled"));

      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "home");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDisabled:", objc_msgSend(v35, "hf_currentUserIsAdministrator") ^ 1);
    }

  }
LABEL_6:

LABEL_7:
  v77.receiver = self;
  v77.super_class = (Class)HUEditLocationViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v77, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

void __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "processedImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);
  objc_msgSend(v3, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "type") != 2;
  objc_msgSend(*(id *)(a1 + 32), "setContentMode:", 2 * v3);

}

void __70__HUEditLocationViewController_updateCell_forItem_indexPath_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {

LABEL_4:
    objc_msgSend(v11, "processedImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "wallpaperPickerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wallpaper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCustomWallpaper:image:", v8, v6);

    goto LABEL_5;
  }
  objc_msgSend(v11, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 6)
    goto LABEL_4;
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "wallpaperPickerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wallpaper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedWallpaper:animated:", v10, *(unsigned __int8 *)(a1 + 40));

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cameraItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "chooseWallpaperItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperThumbnailItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v5;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeScheduleItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v7;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "softwareUpdateItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v9;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allowedAccessoryCategoryItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "containsObject:", v28) & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    -[HUEditLocationViewController notificationTopicModuleController](self, "notificationTopicModuleController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "module");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", v28);

    if (v22)
      v18 = 1;
    else
      v18 = -1;
  }

  return v18;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[HUEditLocationViewController nameCell](self, "nameCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textField");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[HUEditLocationViewController editedName](self, "editedName");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUEditLocationViewController;
    -[HUItemTableViewController currentTextForTextField:item:](&v13, sel_currentTextForTextField_item_, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUEditLocationViewController;
  v9 = a4;
  -[HUItemTableViewController textDidChange:forTextField:item:](&v12, sel_textDidChange_forTextField_item_, v8, v9, a5);
  -[HUEditLocationViewController nameCell](self, "nameCell", v12.receiver, v12.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textField");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
    -[HUEditLocationViewController setEditedName:](self, "setEditedName:", v8);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  objc_super v47;

  v6 = a3;
  v7 = a4;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v47.receiver = self;
    v47.super_class = (Class)HUEditLocationViewController;
    v11 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v47, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
    goto LABEL_12;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inviteUsersItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v13))
  {

LABEL_6:
    objc_msgSend(v9, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    v11 = v19 ^ 1;
    goto LABEL_12;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cameraItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
    goto LABEL_6;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userItemProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "containsObject:", v9))
    goto LABEL_10;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inviteItemProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "items");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "containsObject:", v9) & 1) != 0)
  {

LABEL_10:
LABEL_11:
    v11 = 1;
    goto LABEL_12;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "allowedAccessoryCategoryItemProvider");
  v43 = v23;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "items");
  v41 = v24;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v28, "containsObject:", v9);

  if ((v45 & 1) != 0)
    goto LABEL_11;
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "chooseWallpaperItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v30) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "wallpaperThumbnailItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v32) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", v34) & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "homeScheduleItem");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:") & 1) != 0)
        {
          v11 = 1;
        }
        else
        {
          -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "softwareUpdateItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:") & 1) != 0)
          {
            v11 = 1;
          }
          else
          {
            -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "siriTriggerPhraseSettingItem");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "isEqual:") & 1) != 0)
            {
              v11 = 1;
            }
            else
            {
              -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "guestsItem");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v9, "isEqual:", v35);

            }
          }

        }
      }

    }
  }

LABEL_12:
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HUWallpaperPickerViewController *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  HUWallpaperPickerViewController *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HUUserAccessoryAccessViewController *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  HUEditOutgoingInvitationViewController *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  BOOL v79;
  __CFString *v80;
  __CFString *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  __CFString *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  int v103;
  HUSiriTriggerPhraseSettingDetailsViewController *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  HUSoftwareUpdateStandaloneViewController *v110;
  HUAddPersonRoleViewController *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  HUEditOutgoingInvitationViewController *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  HUEditUserViewController *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  int v133;
  HUGuestsPinCodesViewController *v134;
  void *v135;
  HUUserAccessoryAccessViewController *v136;
  void *v137;
  char v138;
  void *v139;
  void *v140;
  _QWORD v141[4];
  __CFString *v142;
  HUEditLocationViewController *v143;
  char v144;
  _QWORD v145[5];
  objc_super v146;
  uint8_t buf[4];
  HUEditLocationViewController *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  id v152;
  __int16 v153;
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v146.receiver = self;
  v146.super_class = (Class)HUEditLocationViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v146, sel_tableView_didSelectRowAtIndexPath_, v7, v8);
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v148 = self;
    v149 = 2112;
    v150 = v12;
    v151 = 2112;
    v152 = v8;
    v153 = 2112;
    v154 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ Did select row for indexPath=%@  | item=%@.", buf, 0x2Au);

  }
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cameraItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "isEqual:", v15);

    if (v16)
    {
      v17 = (HUWallpaperPickerViewController *)objc_alloc_init(MEMORY[0x1E0CEA648]);
      -[HUWallpaperPickerViewController setDelegate:](v17, "setDelegate:", self);
      -[HUWallpaperPickerViewController setSourceType:](v17, "setSourceType:", 1);
      -[HUWallpaperPickerViewController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 0);
      -[HUEditLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
LABEL_10:

      goto LABEL_11;
    }
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "homeScheduleItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "isEqual:", v19);

    if (v20)
    {
      v21 = objc_alloc(MEMORY[0x1E0D33728]);
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "home");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemBackgroundColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (HUWallpaperPickerViewController *)objc_msgSend(v21, "initWithHomeID:tintColor:listRowBackgroundColor:", v24, v25, v26);

LABEL_8:
      -[HUEditLocationViewController navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v27, "hu_pushPreloadableViewController:animated:", v17, 1);
LABEL_9:

      goto LABEL_10;
    }
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allowedAccessoryCategoryItemProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "items");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsObject:", v10);

    if (v32)
    {
      objc_opt_class();
      v33 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      objc_msgSend(v35, "categoryType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0CB7A38]);

      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "home");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "hf_canAddAccessCode");

      if (v37 && v40)
      {
        v41 = -[HUEditLocationViewController presentRestrictedGuestLockSettings](self, "presentRestrictedGuestLockSettings");
      }
      else
      {
        v136 = [HUUserAccessoryAccessViewController alloc];
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "home");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "home");
        v139 = v35;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "currentUser");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "categoryType");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[HUUserAccessoryAccessViewController initWithHome:user:accessoryCategoryType:](v136, "initWithHome:user:accessoryCategoryType:", v135, v51, v52);

        -[HUEditLocationViewController navigationController](self, "navigationController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (id)objc_msgSend(v54, "hu_pushPreloadableViewController:animated:", v53, 1);

        v35 = v139;
        HFLogForCategory();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v148 = self;
          v149 = 2112;
          v150 = v57;
          v151 = 2112;
          v152 = v139;
          _os_log_impl(&dword_1B8E1E000, v56, OS_LOG_TYPE_DEFAULT, "%@: %@ Checking for allowed accessory category item: categoryItem=%@.", buf, 0x20u);

        }
      }
      goto LABEL_26;
    }
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "chooseWallpaperItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v10, "isEqual:", v43);

    if (v44)
    {
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0CF9680], "applicationWithBundleIdentifier:", CFSTR("com.apple.mobileslideshow"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CF9698], "sharedGuard");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "initiateAuthenticationWithShieldingForSubject:completion:", v45, &__block_literal_global_144);

      }
      v47 = [HUWallpaperPickerViewController alloc];
      _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationNamedWallpaperSectionTitle"), CFSTR("HUEditLocationNamedWallpaperSectionTitle"), 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HUWallpaperPickerViewController initWithCollectionType:namedSectionTitle:delegate:](v47, "initWithCollectionType:namedSectionTitle:delegate:", 0, v48, self);

      -[HUEditLocationViewController navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pushViewController:animated:", v17, 1);
      goto LABEL_9;
    }
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "wallpaperThumbnailItem");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v10, "isEqual:", v59);

    if (v60)
    {
      -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
      v17 = (HUWallpaperPickerViewController *)objc_claimAutoreleasedReturnValue();
      -[HUWallpaperPickerViewController wallpaperBuilder](v17, "wallpaperBuilder");
      v61 = (HUEditOutgoingInvitationViewController *)objc_claimAutoreleasedReturnValue();
      -[HUEditOutgoingInvitationViewController wallpaperEditCollectionFuture](v61, "wallpaperEditCollectionFuture");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v145[0] = MEMORY[0x1E0C809B0];
      v145[1] = 3221225472;
      v145[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_148;
      v145[3] = &unk_1E6F55AA0;
      v145[4] = self;
      v63 = (id)objc_msgSend(v62, "addSuccessBlock:", v145);

      goto LABEL_29;
    }
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "removeItem");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v10, "isEqual:", v65);

    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v66)
    {
      objc_msgSend(v67, "home");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "hf_currentUserIsOwner");
      v138 = v70 ^ 1;

      -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "name");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v70 == 0;
      if (v70)
        v80 = CFSTR("HUEditLocationRemoveHomeAlertTitle");
      else
        v80 = CFSTR("HUEditLocationLeaveHomeAlertTitle");
      if (v70)
        v81 = CFSTR("HUEditLocationRemoveHomeConfirmationMessage");
      else
        v81 = CFSTR("HUEditLocationLeaveHomeConfirmationMessage");
      if (v79)
        v82 = CFSTR("HUEditLocationLeaveHomeDeleteButtonTitle");
      else
        v82 = CFSTR("HURemoveTitle");
      HULocalizedStringWithFormat(v80, CFSTR("%@"), v72, v73, v74, v75, v76, v77, (uint64_t)v78);
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      _HULocalizedStringWithDefaultValue(v81, v81, 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v140, v83, v8);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "actionWithTitle:style:handler:", v86, 1, 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addAction:", v87);

      v88 = v82;
      v89 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(v88, v88, 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v141[0] = MEMORY[0x1E0C809B0];
      v141[1] = 3221225472;
      v141[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v141[3] = &unk_1E6F55B58;
      v144 = v138;
      v142 = v88;
      v143 = self;
      v91 = v88;
      objc_msgSend(v89, "actionWithTitle:style:handler:", v90, 2, v141);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "addAction:", v92);

      -[HUEditLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v84, 1, 0);
      goto LABEL_11;
    }
    objc_msgSend(v67, "inviteUsersItem");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v10, "isEqual:", v93);

    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if (v94)
    {
      objc_msgSend(v95, "home");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v97, "hasOnboardedForAccessCode"))
      {
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "home");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "accessories");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "na_any:", &__block_literal_global_174);

      }
      else
      {
        v101 = 0;
      }

      if ((_os_feature_enabled_impl() & 1) == 0 && !v101)
      {
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "home");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        +[HUAddPeopleViewController presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:](HUAddPeopleViewController, "presentAddPersonOrAlertForHH2Upgrade:withHome:viewContext:delegate:presentationDelegate:", self, v106, 0, 0, self);

LABEL_26:
        goto LABEL_11;
      }
      v111 = [HUAddPersonRoleViewController alloc];
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "home");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HUAddPersonRoleViewController initWithHome:](v111, "initWithHome:", v113);

      if (v101)
      {
        -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "pinCodeManager");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUWallpaperPickerViewController setPinCodeManager:](v17, "setPinCodeManager:", v115);

      }
      -[HUWallpaperPickerViewController setPresentationDelegate:](v17, "setPresentationDelegate:", self);
      v61 = (HUEditOutgoingInvitationViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v17);
      -[HUEditOutgoingInvitationViewController setModalPresentationStyle:](v61, "setModalPresentationStyle:", 2);
      -[HUEditLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v61, 1, 0);
LABEL_29:

      goto LABEL_10;
    }
    objc_msgSend(v95, "siriTriggerPhraseSettingItem");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v10, "isEqual:", v102);

    if (v103)
    {
      v104 = [HUSiriTriggerPhraseSettingDetailsViewController alloc];
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "home");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = -[HUSiriTriggerPhraseSettingDetailsViewController initWithHome:delegate:](v104, "initWithHome:delegate:", v23, self);
    }
    else
    {
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "softwareUpdateItem");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v10, "isEqual:", v108);

      if (!v109)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          v116 = v10;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v117 = v116;
          else
            v117 = 0;
          v17 = v117;

          v118 = [HUEditOutgoingInvitationViewController alloc];
          -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "home");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[HUEditOutgoingInvitationViewController initWithItem:home:](v118, "initWithItem:home:", v17, v120);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "guestsItem");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = objc_msgSend(v10, "isEqual:", v132);

            if (!v133)
              goto LABEL_11;
            v134 = [HUGuestsPinCodesViewController alloc];
            -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "pinCodeManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = -[HUGuestsPinCodesViewController initWithPinCodeManager:settingsContext:](v134, "initWithPinCodeManager:settingsContext:", v23, 0);
            goto LABEL_52;
          }
          objc_opt_class();
          v121 = v10;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v122 = v121;
          else
            v122 = 0;
          v17 = v122;

          -[HUWallpaperPickerViewController user](v17, "user");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "userID");
          v124 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v124)
          {
            HFLogForCategory();
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v148 = (HUEditLocationViewController *)v17;
              _os_log_error_impl(&dword_1B8E1E000, v125, OS_LOG_TYPE_ERROR, "User ID on item %@ is nil", buf, 0xCu);
            }

          }
          v126 = [HUEditUserViewController alloc];
          -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "home");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "pinCodeManager");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[HUEditUserViewController initWithItem:home:pinCodeManager:](v126, "initWithItem:home:pinCodeManager:", v17, v120, v128);

        }
        -[HUEditLocationViewController navigationController](self, "navigationController");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = (id)objc_msgSend(v129, "hu_pushPreloadableViewController:animated:", v61, 1);

        goto LABEL_29;
      }
      v110 = [HUSoftwareUpdateStandaloneViewController alloc];
      -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "home");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = -[HUSoftwareUpdateStandaloneViewController initWithHome:](v110, "initWithHome:", v23);
    }
LABEL_52:
    v17 = (HUWallpaperPickerViewController *)v105;
    goto LABEL_8;
  }
LABEL_11:

}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (a2 & 1) == 0)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error authenticating Home app for photo picker usage: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_148(uint64_t a1, void *a2)
{
  id v3;
  HUWallpaperEditingViewController *v4;
  void *v5;
  HUWallpaperEditingViewController *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "originalImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [HUWallpaperEditingViewController alloc];
  objc_msgSend(v3, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:](v4, "initWithWallpaper:image:delegate:", v5, v7, *(_QWORD *)(a1 + 32));
  -[HUWallpaperEditingViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v35 = "-[HUEditLocationViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pinCodeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "deleteUserPinCodeWithUser:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recoverIgnoringError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v13);
  }
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "homeBuilder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D519C0];
  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_168;
  v31[3] = &unk_1E6F4D600;
  v20 = v15;
  v32 = v20;
  v21 = v17;
  v33 = v21;
  objc_msgSend(v18, "lazyFutureWithBlock:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v22);
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_170;
  v27[3] = &unk_1E6F55B30;
  objc_copyWeak(&v30, (id *)buf);
  v24 = v20;
  v28 = v24;
  v25 = v21;
  v29 = v25;
  v26 = (id)objc_msgSend(v23, "addSuccessBlock:", v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_168(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "errorOnlyCompletionHandlerAdapter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeHome:completionHandler:", v3, v4);

}

void __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_170(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v9 = &unk_1E6F55448;
  v10 = a1[4];
  v11 = a1[5];
  objc_msgSend(v3, "dispatchHomeManagerObserverMessage:sender:", &v6, 0);

  objc_msgSend(WeakRetained, "presentationDelegate", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "finishPresentation:animated:", WeakRetained, 1);

}

uint64_t __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeManager:didRemoveHome:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__HUEditLocationViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUEditLocationViewController detailNotesCell](self, "detailNotesCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  if (v6)
  {
    -[HUEditLocationViewController detailNotesCell](self, "detailNotesCell");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController setEditedNotes:](self, "setEditedNotes:", v7);

  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  HUEditLocationViewController *v13;
  HUEditLocationViewController *v14;
  void *v15;
  void *v16;
  id v17;
  int v19;
  HUEditLocationViewController *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31970], "locationPrivacyURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    -[HUEditLocationViewController navigationController](self, "navigationController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (HUEditLocationViewController *)v11;
    else
      v13 = self;
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651F8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "splashController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisplayDeviceType:", 6);

    objc_msgSend(v15, "setPresentingViewController:", v14);
    objc_msgSend(v15, "present");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "openURL:", v7);
  }

  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  BOOL v43;
  _QWORD v44[4];
  id v45;
  HUEditLocationViewController *v46;
  BOOL v47;
  _QWORD v48[4];
  id v49;
  HUEditLocationViewController *v50;
  BOOL v51;
  uint8_t buf[4];
  HUEditLocationViewController *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("OFF");
    if (v4)
      v8 = CFSTR("ON");
    *(_DWORD *)buf = 138412290;
    v53 = (HUEditLocationViewController *)v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "User Tapped switch to turn %@.", buf, 0xCu);
  }

  -[HUEditLocationViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForCell:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayedItemAtIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationServicesSettingItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqual:", v14);

  v16 = MEMORY[0x1E0C809B0];
  if (v15)
  {
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateLocationServicesEnabled:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = v16;
    v48[1] = 3221225472;
    v48[2] = __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke;
    v48[3] = &unk_1E6F50330;
    v51 = v4;
    v49 = v6;
    v50 = self;
    v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v48);

  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "soundCheckItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v12, "isEqual:", v21);

  if (v22)
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v16;
      if (v4)
        v25 = CFSTR("ON");
      else
        v25 = CFSTR("OFF");
      -[HUItemTableViewController itemManager](self, "itemManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v53 = self;
      v54 = 2112;
      v55 = v25;
      v16 = v24;
      v56 = 2112;
      v57 = v27;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@: Updating sound check setting to %@ for home: %@", buf, 0x20u);

    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "home");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v16;
    v44[1] = 3221225472;
    v44[2] = __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_191;
    v44[3] = &unk_1E6F53170;
    v47 = v4;
    v45 = v6;
    v46 = self;
    objc_msgSend(v29, "updateSoundCheckEnabled:completion:", v4, v44);

  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "showPredictedScenes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v12, "isEqual:", v31);

  if (v32)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hf_setShowPredictedScenesOnDashboard:", v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v16;
    v42[1] = 3221225472;
    v42[2] = __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_192;
    v42[3] = &__block_descriptor_33_e20_v24__0_8__NSError_16l;
    v43 = v4;
    v36 = (id)objc_msgSend(v35, "addCompletionBlock:", v42);

  }
  objc_msgSend(v12, "latestResults");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0D30D20];
  objc_msgSend(v37, "objectForKey:", *MEMORY[0x1E0D30D20]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v12, "latestResults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D31170], "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v12, v4, v41, self);

}

void __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const char *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 48) == 0);
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v5 = CFSTR("ON");
      else
        v5 = CFSTR("OFF");
      objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      v8 = "Location Services Failed to turn %@ for Home %@.";
LABEL_12:
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);

    }
  }
  else
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v9 = CFSTR("ON");
      else
        v9 = CFSTR("OFF");
      objc_msgSend(*(id *)(a1 + 40), "homeItemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      v8 = "Location Services Successfully turned %@ for Home %@.";
      goto LABEL_12;
    }
  }

}

void __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_191(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to update sound check setting with error: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "soundCheckEnabled");
      v9 = CFSTR("OFF");
      if (v8)
        v9 = CFSTR("ON");
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated sound check setting to %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

void __53__HUEditLocationViewController_switchCell_didTurnOn___block_invoke_192(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 32);
    v7[0] = 67109634;
    v7[1] = v6;
    v8 = 1024;
    v9 = v4 == 0;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Updating showPredictedScenesOnDashboard to (%{BOOL}d) succeeded: %{BOOL}d  %@", (uint8_t *)v7, 0x18u);
  }

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  UIImage *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HUWallpaperEditingViewController *v12;
  id v13;

  v5 = a4;
  -[HUEditLocationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB6D0]);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  UIImageWriteToSavedPhotosAlbum(v6, 0, 0, 0);
  v7 = objc_alloc(MEMORY[0x1E0D319F0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:assetIdentifier:cropInfo:", 1, v9, 0);

  objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processOriginalImageFromWallpaper:originalImage:", v10, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:]([HUWallpaperEditingViewController alloc], "initWithWallpaper:image:delegate:", v10, v13, self);
  -[HUWallpaperEditingViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 0);
  -[HUEditLocationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5
{
  id v6;
  id v7;

  -[HUEditLocationViewController updateWallpaper:image:](self, "updateWallpaper:image:", a4, a5);
  -[HUEditLocationViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "popToViewController:animated:", self, 1);

}

- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0D319F0];
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customWallpaperWithAssetIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController updateWallpaper:image:](self, "updateWallpaper:image:", v9, v7);

}

- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
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
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v6 = (void *)MEMORY[0x1E0D319F0];
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customWallpaperWithAssetIdentifier:", v11);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setOriginalCustomImage:", v8);
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wallpaperBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWallpaper:image:", v27, v8);

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "wallpaperPickerItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForItem:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditLocationViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cellForRowAtIndexPath:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "wallpaperPickerItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v19, v21, v17, 1);

  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "wallpaperBuilder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "commitWallpaper");

  }
}

- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v7 = a5;
  v8 = a4;
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wallpaperBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWallpaper:image:", v8, v7);

  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wallpaperBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "commitWallpaper");

  }
}

- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[HUEditLocationViewController homeBuilder](self, "homeBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperEditCollectionFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__HUEditLocationViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke;
  v8[3] = &unk_1E6F55AA0;
  v8[4] = self;
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v8);

}

void __74__HUEditLocationViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HUWallpaperEditingViewController *v4;
  void *v5;
  HUWallpaperEditingViewController *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "originalImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [HUWallpaperEditingViewController alloc];
  objc_msgSend(v3, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:](v4, "initWithWallpaper:image:delegate:", v5, v7, *(_QWORD *)(a1 + 32));
  -[HUWallpaperEditingViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  -[HUEditLocationViewController updateWallpaper:image:](self, "updateWallpaper:image:", a4, a5);
  -[HUEditLocationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)wallpaperEditingDidCancel:(id)a3
{
  -[HUEditLocationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  objc_msgSend(a4, "uniqueIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if (v9)
  {
    -[HUEditLocationViewController presentationDelegate](self, "presentationDelegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v11, "finishPresentation:animated:", self, 1);

  }
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v17;

  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HUEditLocationViewController;
  v11 = a4;
  -[HUItemTableViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v17, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, v11, v10, a6);
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager", v17.receiver, v17.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "softwareUpdateItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v11, "containsObject:", v13);

  if ((_DWORD)a3)
  {

LABEL_4:
    -[HUEditLocationViewController _updateSoftwareUpdateDynamicFooterView](self, "_updateSoftwareUpdateDynamicFooterView");
    goto LABEL_5;
  }
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "softwareUpdateItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "containsObject:", v15);

  if (v16)
    goto LABEL_4;
LABEL_5:

}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUEditLocationViewController;
  v8 = a4;
  -[HUItemTableViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v12, sel_itemManager_didUpdateResultsForItem_atIndexPath_, a3, v8, a5);
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager", v12.receiver, v12.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "softwareUpdateItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
    -[HUEditLocationViewController _updateSoftwareUpdateDynamicFooterView](self, "_updateSoftwareUpdateDynamicFooterView");
}

- (void)_updateSoftwareUpdateDynamicFooterView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUEditLocationSoftwareUpdateSectionIdentifier"));

  -[HUEditLocationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerViewForSection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerTitleForSection:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUEditLocationViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginUpdates");

    objc_msgSend(v6, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v8);

    objc_msgSend(v6, "setNeedsLayout");
    -[HUEditLocationViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endUpdates");

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__HUEditLocationViewController__updateSoftwareUpdateDynamicFooterView__block_invoke;
    v13[3] = &unk_1E6F55BC0;
    v14 = v8;
    objc_msgSend(v6, "_setContentViewConfigurationProvider:", v13);

  }
}

id __70__HUEditLocationViewController__updateSoftwareUpdateDynamicFooterView__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEAC80], "defaultGroupedFooterConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  return v2;
}

- (void)didUpdateSiriTriggerPhraseSetting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriTriggerPhraseSettingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadUIRepresentationForItems:withAnimation:", v6, 1);

}

void __62__HUEditLocationViewController_reloadActivityLogItemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "homeItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSettingsModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_205);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "reloadItems");

  objc_msgSend(*(id *)(a1 + 32), "homeItemManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 40));

}

uint64_t __62__HUEditLocationViewController_reloadActivityLogItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)activityLogCoordinator:(id)a3 didDetermineEventsExist:(BOOL)a4
{
  _QWORD v4[6];

  if (a4)
  {
    if (self)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __62__HUEditLocationViewController_reloadActivityLogItemProviders__block_invoke;
      v4[3] = &unk_1E6F4CE48;
      v4[4] = self;
      v4[5] = sel_reloadActivityLogItemProviders;
      dispatch_async(MEMORY[0x1E0C80D38], v4);
    }
  }
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 1, a4);
}

- (void)updateWallpaper:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wallpaperBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWallpaper:image:", v7, v6);

  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wallpaperBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "commitWallpaper");

  }
  v15 = +[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell");
  -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "wallpaperPickerItem");
  else
    objc_msgSend(v16, "wallpaperThumbnailItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "diffableDataSourceDisabled");

  if (v20)
  {
    -[HUEditLocationViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditLocationViewController homeItemManager](self, "homeItemManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "indexPathForItem:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadRowsAtIndexPaths:withRowAnimation:", v24, 5);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadUIRepresentationForItems:withAnimation:", v22, 0);
  }

}

- (void)prefetchActivityLogEventsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  int v9;
  id v10;

  -[HUEditLocationViewController homeBuilder](self, "homeBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityLogCoordinatorForHome:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "residentDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_208_0);

  v8 = objc_msgSend(v5, "eventsExist");
  if (objc_msgSend(v10, "isEventLogEnabled") && (v8 & 1) == 0)
  {
    v9 = objc_msgSend(v10, "hf_hasActivityLogPrerequisites");
    if ((v9 & v7) == 1)
    {
      if (objc_msgSend(v10, "hf_hasEnabledResident")
        && (objc_msgSend(v10, "hf_hasCompatibleActivityLogAccessories") & 1) != 0)
      {
        goto LABEL_9;
      }
    }
    else if (!v9)
    {
      goto LABEL_9;
    }
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "checkIfEventsExist");
  }
LABEL_9:

}

unint64_t __68__HUEditLocationViewController_prefetchActivityLogEventsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 27) & 1;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HFHomeBuilder)homeBuilder
{
  return self->_homeBuilder;
}

- (HUEditLocationViewControllerAddLocationDelegate)addLocationDelegate
{
  return (HUEditLocationViewControllerAddLocationDelegate *)objc_loadWeakRetained((id *)&self->_addLocationDelegate);
}

- (void)setAddLocationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_addLocationDelegate, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (HUUserNotificationTopicListModuleController)notificationTopicModuleController
{
  return self->_notificationTopicModuleController;
}

- (void)setNotificationTopicModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTopicModuleController, a3);
}

- (HUMatterConnectedServicesItemModuleController)connectedServicesItemModuleController
{
  return self->_connectedServicesItemModuleController;
}

- (void)setConnectedServicesItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_connectedServicesItemModuleController, a3);
}

- (HUEditLocationItemManager)homeItemManager
{
  return (HUEditLocationItemManager *)objc_loadWeakRetained((id *)&self->_homeItemManager);
}

- (void)setHomeItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeItemManager, a3);
}

- (HUEditableTextCell)nameCell
{
  return (HUEditableTextCell *)objc_loadWeakRetained((id *)&self->_nameCell);
}

- (void)setNameCell:(id)a3
{
  objc_storeWeak((id *)&self->_nameCell, a3);
}

- (NSString)editedName
{
  return self->_editedName;
}

- (void)setEditedName:(id)a3
{
  objc_storeStrong((id *)&self->_editedName, a3);
}

- (HUEditableTextViewCell)detailNotesCell
{
  return (HUEditableTextViewCell *)objc_loadWeakRetained((id *)&self->_detailNotesCell);
}

- (void)setDetailNotesCell:(id)a3
{
  objc_storeWeak((id *)&self->_detailNotesCell, a3);
}

- (NSString)editedNotes
{
  return self->_editedNotes;
}

- (void)setEditedNotes:(id)a3
{
  objc_storeStrong((id *)&self->_editedNotes, a3);
}

- (HUWallpaperPickerInlineViewController)wallpaperPickerViewController
{
  return self->_wallpaperPickerViewController;
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_storeStrong((id *)&self->_wallpaperPickerViewController, 0);
  objc_storeStrong((id *)&self->_editedNotes, 0);
  objc_destroyWeak((id *)&self->_detailNotesCell);
  objc_storeStrong((id *)&self->_editedName, 0);
  objc_destroyWeak((id *)&self->_nameCell);
  objc_destroyWeak((id *)&self->_homeItemManager);
  objc_storeStrong((id *)&self->_connectedServicesItemModuleController, 0);
  objc_storeStrong((id *)&self->_notificationTopicModuleController, 0);
  objc_destroyWeak((id *)&self->_addLocationDelegate);
  objc_storeStrong((id *)&self->_homeBuilder, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
