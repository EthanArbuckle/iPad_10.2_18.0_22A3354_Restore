@implementation HUSoftwareUpdateStandaloneViewController

- (void)refreshDataModelForHome:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  HUSoftwareUpdateStandaloneViewController *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1B93EE06C();
  v9 = a3;
  v10 = self;
  v11 = sub_1B93EE060();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x1E0DF06E8];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v9;
  sub_1B8EB73F0((uint64_t)v7, (uint64_t)&unk_1EF20E918, (uint64_t)v12);

  swift_release();
}

- (HUSoftwareUpdateStandaloneViewController)initWithHome:(id)a3
{
  id v4;
  HUSoftwareUpdateStandaloneItemManager *v5;
  HUSoftwareUpdateStandaloneViewController *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[HUSoftwareUpdateStandaloneItemManager initWithDelegate:home:]([HUSoftwareUpdateStandaloneItemManager alloc], "initWithDelegate:home:", self, v4);

  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v8, sel_initWithItemManager_tableViewStyle_, v5, 1);

  return v6;
}

- (HUSoftwareUpdateStandaloneViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateStandaloneViewController.m"), 76, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateStandaloneViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[HUSoftwareUpdateStandaloneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSoftwareUpdateStandaloneViewController setLayoutOptions:](self, "setLayoutOptions:", v6);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdatePageTitle"), CFSTR("HUSoftwareUpdatePageTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneViewController setTitle:](self, "setTitle:", v7);

  if (-[HUSoftwareUpdateStandaloneViewController showDoneButtonInNavBar](self, "showDoneButtonInNavBar"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
    -[HUSoftwareUpdateStandaloneViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[HUSoftwareUpdateStandaloneViewController _refreshUpdateAllBarButton](self, "_refreshUpdateAllBarButton");
}

- (id)_createUpdateAllBarButton
{
  HUDownloadControl *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(HUDownloadControl);
  -[HUDownloadControl setAllowsAddImage:](v3, "setAllowsAddImage:", 0);
  -[HUDownloadControl setDisplayStyle:](v3, "setDisplayStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDownloadControl setFilledTintColor:](v3, "setFilledTintColor:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDownloadControl setTintColor:](v3, "setTintColor:", v5);

  -[HUDownloadControl addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__didTapUpdateAllButton_, 64);
  -[HUDownloadControl setControlStatus:animated:](v3, "setControlStatus:animated:", 1, 0x3FF0000000000000, 0);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateControlTitle_UpdateAll"), CFSTR("HUSoftwareUpdateControlTitle_UpdateAll"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDownloadControl setTitle:forControlStatusType:](v3, "setTitle:forControlStatusType:", v6, 1);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v3);
  return v7;
}

- (void)_refreshUpdateAllBarButton
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;

  if (!-[HUSoftwareUpdateStandaloneViewController showDoneButtonInNavBar](self, "showDoneButtonInNavBar"))
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateAllItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v32 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BD0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7 == 0;

    }
    -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (((v6 ^ v9) & 1) != 0)
    {
      if (!v6)
        goto LABEL_24;
    }
    else
    {
      if (!v6)
      {
        -[HUSoftwareUpdateStandaloneViewController setUpdateAllBarButton:](self, "setUpdateAllBarButton:", 0);
        -[HUSoftwareUpdateStandaloneViewController navigationItem](self, "navigationItem");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRightBarButtonItem:", 0);
LABEL_23:

LABEL_24:
        return;
      }
      -[HUSoftwareUpdateStandaloneViewController _createUpdateAllBarButton](self, "_createUpdateAllBarButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateStandaloneViewController setUpdateAllBarButton:](self, "setUpdateAllBarButton:", v10);

      -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSoftwareUpdateStandaloneViewController navigationItem](self, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRightBarButtonItem:", v11);

      -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "customView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);

    }
    objc_opt_class();
    -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "customView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "titleForControlStatusType:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BC0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) == 0)
    {
      objc_msgSend(v18, "setTitle:forControlStatusType:", v20, 1);
      objc_msgSend(v18, "sizeToFit");
    }
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
    {
      objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EC0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "floatValue");
        v26 = v25;
        objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFilledTintColor:", v27);

        objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 4;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFilledTintColor:", v31);

        objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 1.0;
        v29 = 3;
      }
      objc_msgSend(v18, "setTintColor:", v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFilledTintColor:", v30);

      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTintColor:", v24);
      v26 = 1.0;
      v29 = 1;
    }

    objc_msgSend(v18, "setControlStatus:animated:", v29, *(_QWORD *)&v26, 1);
    objc_msgSend(v18, "setEnabled:", v29 == 1);

    goto LABEL_23;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUSoftwareUpdateStandaloneViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleCells");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v9, "na_any:", &__block_literal_global_158);
    -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v6);

  }
}

uint64_t __64__HUSoftwareUpdateStandaloneViewController_scrollViewDidScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  if (!-[HUSoftwareUpdateStandaloneViewController viewVisible](self, "viewVisible"))
  {
    objc_initWeak(&location, self);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __59__HUSoftwareUpdateStandaloneViewController_viewWillAppear___block_invoke;
    v8 = &unk_1E6F583E0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "addHomeSetupSuccessBlock:", &v5);

    -[HUSoftwareUpdateStandaloneViewController setViewVisible:](self, "setViewVisible:", 1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __59__HUSoftwareUpdateStandaloneViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_kickoffSoftwareUpdate");
  objc_msgSend(WeakRetained, "_fetchAccessoryDiagnosticInfo");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HUSoftwareUpdateStandaloneViewController setViewVisible:](self, "setViewVisible:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  objc_opt_class();
  -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v6, "intrinsicContentSize");
  v16 = v15;

  -[HUSoftwareUpdateStandaloneViewController updateAllBarButton](self, "updateAllBarButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "customView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v10, v12, v16, v14);

}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  HUSoftwareUpdateItemModuleController *v5;
  void *v6;
  void *v7;
  HUSoftwareUpdateItemModuleController *v8;
  void *v9;
  void *v10;
  HUFirmwareUpdateItemModuleController *v11;
  void *v12;
  void *v13;
  HUFirmwareUpdateItemModuleController *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [HUSoftwareUpdateItemModuleController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "softwareUpdateModule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUSoftwareUpdateItemModuleController initWithModule:delegate:expandableTextViewCellDelegate:](v5, "initWithModule:delegate:expandableTextViewCellDelegate:", v7, self, self);
    -[HUSoftwareUpdateStandaloneViewController setSoftwareUpdateItemModuleController:](self, "setSoftwareUpdateItemModuleController:", v8);

  }
  -[HUSoftwareUpdateStandaloneViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[HUSoftwareUpdateStandaloneViewController firmwareUpdateItemModuleController](self, "firmwareUpdateItemModuleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [HUFirmwareUpdateItemModuleController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firmwareUpdateModule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUFirmwareUpdateItemModuleController initWithModule:expandableTextViewCellDelegate:](v11, "initWithModule:expandableTextViewCellDelegate:", v13, self);
    -[HUSoftwareUpdateStandaloneViewController setFirmwareUpdateItemModuleController:](self, "setFirmwareUpdateItemModuleController:", v14);

  }
  -[HUSoftwareUpdateStandaloneViewController firmwareUpdateItemModuleController](self, "firmwareUpdateItemModuleController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAllItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
    goto LABEL_5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoUpdateItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v11))
  {

    goto LABEL_5;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autoUpdateThirdPartyItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "isEqual:", v13);

  if (v14)
    goto LABEL_5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "homeUpdateBannerItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "isEqual:", v18);

  if (v19)
    goto LABEL_5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fetchItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "isEqual:", v21);

  if (v22)
    goto LABEL_5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updatedRecentlyItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v24) & 1) != 0)
  {
LABEL_12:

    goto LABEL_5;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "betaUpdatesItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v26) & 1) != 0)
  {

    goto LABEL_12;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "carrySettingsItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "isEqual:", v28);

  if ((v29 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateStandaloneViewController.m"), 277, CFSTR("Unhandled item: %@"), v6);

    v15 = 0;
    goto LABEL_6;
  }
LABEL_5:
  objc_opt_class();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (Class)v15;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HUBannerView *v34;
  HUBannerView *softwareUpdateBannerView;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  objc_super v54;

  v8 = a3;
  v9 = a4;
  v54.receiver = self;
  v54.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v54, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoUpdateItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v11))
  {

    goto LABEL_4;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autoUpdateThirdPartyItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "isEqual:", v13);

  if (!v14)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "homeUpdateBannerItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v9, "isEqual:", v22);

    if (v23)
    {
      v24 = objc_opt_class();
      v25 = v8;
      if (v25)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
        v18 = v25;
        if (v26)
          goto LABEL_22;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v24, objc_opt_class());

      }
      v18 = 0;
LABEL_22:

      -[HUSoftwareUpdateStandaloneViewController layoutOptions](self, "layoutOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bannerCellOptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cornerRadius");
      objc_msgSend(v30, "setCellCornerRadius:");

      -[HUSoftwareUpdateStandaloneViewController layoutOptions](self, "layoutOptions");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bannerCellOptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLayoutOptions:", v33);

      objc_msgSend(v18, "setDelegate:", self);
      objc_msgSend(v18, "bannerView");
      v34 = (HUBannerView *)objc_claimAutoreleasedReturnValue();
      softwareUpdateBannerView = self->_softwareUpdateBannerView;
      self->_softwareUpdateBannerView = v34;

      goto LABEL_12;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "updateAllItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v9, "isEqual:", v37);

    if (v38)
    {
      objc_opt_class();
      v39 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v40 = v39;
      else
        v40 = 0;
      v18 = v40;

      objc_msgSend(v18, "downloadControl");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAllowsAddImage:", 0);
      objc_msgSend(v41, "setDisplayStyle:", 1);
      objc_msgSend(v41, "addTarget:action:forControlEvents:", self, sel__didTapUpdateAllButton_, 64);

      goto LABEL_12;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "updatedRecentlyItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v43) & 1) == 0)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "betaUpdatesItem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqual:", v45) & 1) == 0)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "carrySettingsItem");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v9, "isEqual:", v52);

        if ((v53 & 1) == 0)
          goto LABEL_13;
LABEL_32:
        v46 = objc_opt_class();
        v47 = v8;
        if (v47)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v48 = v47;
          else
            v48 = 0;
          v18 = v47;
          if (v48)
            goto LABEL_39;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v46, objc_opt_class());

        }
        v18 = 0;
LABEL_39:

        objc_msgSend(v18, "setHideIcon:", 1);
        objc_msgSend(v18, "setAccessoryType:", 1);
        goto LABEL_12;
      }

    }
    goto LABEL_32;
  }
LABEL_4:
  v15 = objc_opt_class();
  v16 = v8;
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v16;
    if (v17)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class());

  }
  v18 = 0;
LABEL_11:

  objc_msgSend(v18, "setDelegate:", self);
LABEL_12:

LABEL_13:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  objc_super v41;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v41, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autoUpdateItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v13))
  {

    goto LABEL_4;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "autoUpdateThirdPartyItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqual:", v15);

  if (!v16)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateAllItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v11, "isEqual:", v26);

    if (!v27)
      goto LABEL_13;
    objc_opt_class();
    v28 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v20 = v29;

    objc_msgSend(v20, "downloadControl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latestResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLValue");

    if (v33)
    {
      objc_msgSend(v11, "latestResults");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EC0]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFilledTintColor:", v36);

      v37 = (void *)MEMORY[0x1E0CEA478];
      if (!v35)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v40 = (void *)v38;
        objc_msgSend(v30, "setTintColor:", v38);

        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFilledTintColor:", v39);

      v37 = (void *)MEMORY[0x1E0CEA478];
    }
    objc_msgSend(v37, "hf_keyColor");
    v38 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_4:
  v17 = objc_opt_class();
  v18 = v10;
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v18;
    if (v19)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

  }
  v20 = 0;
LABEL_11:

  objc_msgSend(v11, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDisabled:", objc_msgSend(v24, "BOOLValue"));

  objc_msgSend(v20, "setDelegate:", self);
LABEL_12:

LABEL_13:
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v5;
  char isKindOfClass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  v5 = a3;
  LOBYTE(a4) = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v8, sel_shouldHideSeparatorsForCell_indexPath_, v5, a4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass | a4) & 1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  HUSoftwareUpdateRecentUpdatesViewController *v23;
  void *v24;
  void *v25;
  HUSoftwareUpdateRecentUpdatesViewController *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v52, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_homePods");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v49;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v49 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v16), "uniqueIdentifier", (_QWORD)v48);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v14);
  }

  -[HUItemTableViewController itemManager](self, "itemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayedItemAtIndexPath:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updatedRecentlyItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "isEqual:", v21);

  if (v22)
  {
    v23 = [HUSoftwareUpdateRecentUpdatesViewController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HUSoftwareUpdateRecentUpdatesViewController initWithHome:](v23, "initWithHome:", v25);

    -[HUSoftwareUpdateStandaloneViewController navigationController](self, "navigationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v27, "hu_pushPreloadableViewController:animated:", v26, 1);
LABEL_20:

    goto LABEL_21;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "betaUpdatesItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v19, "isEqual:", v30);

  if (v31)
  {
    if (objc_msgSend(MEMORY[0x1E0D148E0], "isNoDaemonMessageChannelEnabled"))
    {
      v32 = objc_alloc(MEMORY[0x1E0D33500]);
      -[HUItemTableViewController itemManager](self, "itemManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "home");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uniqueIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (HUSoftwareUpdateRecentUpdatesViewController *)objc_msgSend(v32, "initWithHomeID:homeKitIdentifiers:", v35, v11);

      if (v26)
        goto LABEL_19;
    }
    v36 = (objc_class *)MEMORY[0x1E0D33500];
LABEL_18:
    v44 = [v36 alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "home");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "uniqueIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (HUSoftwareUpdateRecentUpdatesViewController *)objc_msgSend(v44, "initWithHomeID:", v47);

LABEL_19:
    -[HUSoftwareUpdateStandaloneViewController navigationController](self, "navigationController", (_QWORD)v48);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pushViewController:animated:", v26, 1);
    goto LABEL_20;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "carrySettingsItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v19, "isEqual:", v38);

  if (v39)
  {
    if (objc_msgSend(MEMORY[0x1E0D148E0], "isNoDaemonMessageChannelEnabled"))
    {
      v40 = objc_alloc(MEMORY[0x1E0D33508]);
      -[HUItemTableViewController itemManager](self, "itemManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "home");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "uniqueIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (HUSoftwareUpdateRecentUpdatesViewController *)objc_msgSend(v40, "initWithHomeID:homeKitIdentifiers:", v43, v11);

      if (v26)
        goto LABEL_19;
    }
    v36 = (objc_class *)MEMORY[0x1E0D33508];
    goto LABEL_18;
  }
LABEL_21:

}

- (void)bannerView:(id)a3 footerViewTapped:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a3;
  -[HUSoftwareUpdateStandaloneViewController softwareUpdateBannerView](self, "softwareUpdateBannerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    if (-[HUSoftwareUpdateStandaloneViewController _homePodSoftwareUpdateInProgress](self, "_homePodSoftwareUpdateInProgress"))
    {
      -[HUSoftwareUpdateStandaloneViewController _presentHomePodSoftwareUpdateAlreadyInProgressAlert](self, "_presentHomePodSoftwareUpdateAlreadyInProgressAlert");
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "devices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUHomeFeatureOnboardingUtilities home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:", v9, self, v11, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v12 = (id)objc_msgSend(v13, "flatMap:", &__block_literal_global_104);
    }
  }
}

uint64_t __72__HUSoftwareUpdateStandaloneViewController_bannerView_footerViewTapped___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)_didTapUpdateAllButton:(id)a3
{
  id v3;

  -[HUSoftwareUpdateStandaloneViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAllAccessories");

}

- (void)doneButtonPressed:(id)a3
{
  id v3;

  -[HUSoftwareUpdateStandaloneViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26[2];
  id location;

  v4 = a4;
  v7 = a3;
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "autoUpdateItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_updateAutomaticSoftwareUpdateEnabled:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "autoUpdateThirdPartyItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "isEqual:", v16);

    if (!v17)
      goto LABEL_7;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_updateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v15;

  if (v18)
  {
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__HUSoftwareUpdateStandaloneViewController_switchCell_didTurnOn___block_invoke;
    v24[3] = &unk_1E6F58428;
    objc_copyWeak(v26, &location);
    v25 = v8;
    v26[1] = (id)a2;
    v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v24);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);

  }
LABEL_7:
  objc_opt_class();
  objc_msgSend(v8, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0D31170], "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v8, v4, v23, self);
}

void __65__HUSoftwareUpdateStandaloneViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:", v4);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestToUpdateItems:senderSelector:", v8, *(_QWORD *)(a1 + 48));
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "performItemUpdateRequest:", v9);

LABEL_8:
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "Failure to update software update preference due to missing autoupdateItem", v14, 2u);
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(WeakRetained, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "refreshDataModelForHome:", v13);

}

- (id)softwareUpdateModuleController:(id)a3 presentViewController:(id)a4
{
  return -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (id)softwareUpdateModuleController:(id)a3 dismissViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__HUSoftwareUpdateStandaloneViewController_softwareUpdateModuleController_dismissViewController___block_invoke;
  v8[3] = &unk_1E6F4D988;
  v6 = v5;
  v9 = v6;
  -[HUSoftwareUpdateStandaloneViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  return v6;
}

uint64_t __97__HUSoftwareUpdateStandaloneViewController_softwareUpdateModuleController_dismissViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (id)softwareUpdateModuleController:(id)a3 navigateToViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUSoftwareUpdateStandaloneViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_pushPreloadableViewController:animated:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  v12 = a4;
  -[HUItemTableViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v15, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, v12, v10, v11);
  -[HUItemTableViewController itemManager](self, "itemManager", v15.receiver, v15.super_class);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "updateAllItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v13) = objc_msgSend(v12, "containsObject:", v14);
  if ((v13 & 1) != 0
    || (objc_msgSend(v10, "containsObject:", v14) & 1) != 0
    || objc_msgSend(v11, "containsObject:", v14))
  {
    -[HUSoftwareUpdateStandaloneViewController _refreshUpdateAllBarButton](self, "_refreshUpdateAllBarButton");
  }

}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v9)
  {
    objc_msgSend(v9, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[HUSoftwareUpdateStandaloneViewController setAllowRefresh:](self, "setAllowRefresh:", v15 ^ 1u);
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateAllItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v9, "isEqual:", v17);

  if (v18)
    -[HUSoftwareUpdateStandaloneViewController _refreshUpdateAllBarButton](self, "_refreshUpdateAllBarButton");
  v19.receiver = self;
  v19.super_class = (Class)HUSoftwareUpdateStandaloneViewController;
  -[HUItemTableViewController itemManager:didUpdateResultsForItem:atIndexPath:](&v19, sel_itemManager_didUpdateResultsForItem_atIndexPath_, v8, v9, v10);

}

- (void)_triggerRefresh:(id)a3
{
  void *v4;
  int v5;

  -[HUSoftwareUpdateStandaloneViewController softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if (v5)
    -[HUSoftwareUpdateStandaloneViewController _kickoffSoftwareUpdate](self, "_kickoffSoftwareUpdate");
}

- (void)_kickoffSoftwareUpdate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  -[HUSoftwareUpdateStandaloneViewController setAllowRefresh:](self, "setAllowRefresh:", 0);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerSoftwareUpdateFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneViewController setSoftwareUpdateFetchFuture:](self, "setSoftwareUpdateFetchFuture:", v5);

  objc_initWeak(&location, self);
  +[HUSoftwareUpdateUIManager sharedManager](HUSoftwareUpdateUIManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAvailableUpdatesForHome:options:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HUSoftwareUpdateStandaloneViewController__kickoffSoftwareUpdate__block_invoke;
  v11[3] = &unk_1E6F519F8;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a2;
  v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v11);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __66__HUSoftwareUpdateStandaloneViewController__kickoffSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "softwareUpdateFetchFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithResult:error:", v15, v5);

    objc_msgSend(v7, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v9, "updateResultsForItems:senderSelector:", v13, *(_QWORD *)(a1 + 40));

  }
}

- (void)_fetchAccessoryDiagnosticInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_homePods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hf_currentUserIsOwner"))
  {
    v8 = objc_msgSend(v5, "count");

    if (v8)
    {
      objc_msgSend(v5, "na_each:", &__block_literal_global_120_0);
      goto LABEL_8;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsOwner"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Not fetching diagnostic info: [isOwner:%@], [homePods:%@]", (uint8_t *)&v14, 0x16u);

  }
LABEL_8:

}

void __73__HUSoftwareUpdateStandaloneViewController__fetchAccessoryDiagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "fetchDiagnosticInfoForAccessory:", v5);

}

- (void)_presentHomePodSoftwareUpdateAlreadyInProgressAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateAlreadyInProgressAlertTitle"), CFSTR("HUHomePodSoftwareUpdateAlreadyInProgressAlertTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateAlreadyInProgressAlertDescription"), CFSTR("HUHomePodSoftwareUpdateAlreadyInProgressAlertDescription"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[HUSoftwareUpdateStandaloneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (BOOL)_homePodSoftwareUpdateInProgress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_homePods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31830]), "initWithAccessories:", v4);
  LOBYTE(v3) = objc_msgSend(v5, "softwareUpdatesInProgress") != 0;

  return (char)v3;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom")
    || !-[HUSoftwareUpdateStandaloneViewController allowRefresh](self, "allowRefresh"))
  {
    return MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("R"), 0x100000, sel__triggerRefresh_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)showDoneButtonInNavBar
{
  return self->_showDoneButtonInNavBar;
}

- (void)setShowDoneButtonInNavBar:(BOOL)a3
{
  self->_showDoneButtonInNavBar = a3;
}

- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController
{
  return self->_softwareUpdateItemModuleController;
}

- (void)setSoftwareUpdateItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, a3);
}

- (HUFirmwareUpdateItemModuleController)firmwareUpdateItemModuleController
{
  return self->_firmwareUpdateItemModuleController;
}

- (void)setFirmwareUpdateItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateItemModuleController, a3);
}

- (UIBarButtonItem)updateAllBarButton
{
  return self->_updateAllBarButton;
}

- (void)setUpdateAllBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_updateAllBarButton, a3);
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, a3);
}

- (HUBannerView)softwareUpdateBannerView
{
  return self->_softwareUpdateBannerView;
}

- (void)setSoftwareUpdateBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateBannerView, a3);
}

- (BOOL)allowRefresh
{
  return self->_allowRefresh;
}

- (void)setAllowRefresh:(BOOL)a3
{
  self->_allowRefresh = a3;
}

- (BOOL)viewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_softwareUpdateBannerView, 0);
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_updateAllBarButton, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateItemModuleController, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, 0);
}

@end
