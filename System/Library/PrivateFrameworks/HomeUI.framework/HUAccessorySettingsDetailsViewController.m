@implementation HUAccessorySettingsDetailsViewController

- (HUAccessorySettingsDetailsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsDetailsViewController.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySettingsDetailsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUAccessorySettingsDetailsViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4;
  HUAccessorySettingsItemManager *v5;
  HUAccessorySettingsDetailsViewController *v6;
  uint64_t v7;
  HFAccessorySettingGroupItem *groupItem;
  objc_super v10;

  v4 = a3;
  v5 = -[HUAccessorySettingsItemManager initWithDelegate:accessoryGroupItem:]([HUAccessorySettingsItemManager alloc], "initWithDelegate:accessoryGroupItem:", self, v4);
  v10.receiver = self;
  v10.super_class = (Class)HUAccessorySettingsDetailsViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    groupItem = v6->_groupItem;
    v6->_groupItem = (HFAccessorySettingGroupItem *)v7;

  }
  return v6;
}

- (id)accessorySettingsItemManager
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  HUAccessorySettingsItemModuleController *v5;
  void *v6;
  void *v7;
  HUAccessorySettingsItemModuleController *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[HUAccessorySettingsDetailsViewController accessorySettingsItemModuleController](self, "accessorySettingsItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [HUAccessorySettingsItemModuleController alloc];
    -[HUAccessorySettingsDetailsViewController accessorySettingsItemManager](self, "accessorySettingsItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessorySettingsSectionItemModule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUAccessorySettingsItemModuleController initWithModule:delegate:](v5, "initWithModule:delegate:", v7, self);
    -[HUAccessorySettingsDetailsViewController setAccessorySettingsItemModuleController:](self, "setAccessorySettingsItemModuleController:", v8);

  }
  -[HUAccessorySettingsDetailsViewController accessorySettingsItemModuleController](self, "accessorySettingsItemModuleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v9);

  return v3;
}

- (void)moduleController:(id)a3 presentGroup:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  objc_msgSend(v15, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30C80];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v15, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:](HUAccessorySettingsDetailsViewControllerFactory, "viewControllerForGroup:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsDetailsViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);

LABEL_6:
}

- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsDetailsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceView:", v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__HUAccessorySettingsDetailsViewController_moduleController_requestPresentViewController_animated___block_invoke;
  v13[3] = &unk_1E6F4D988;
  v11 = v8;
  v14 = v11;
  -[HUAccessorySettingsDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, v5, v13);

  return v11;
}

uint64_t __99__HUAccessorySettingsDetailsViewController_moduleController_requestPresentViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (HFAccessorySettingGroupItem)groupItem
{
  return self->_groupItem;
}

- (void)setGroupItem:(id)a3
{
  objc_storeStrong((id *)&self->_groupItem, a3);
}

- (HUAccessorySettingsItemModuleController)accessorySettingsItemModuleController
{
  return self->_accessorySettingsItemModuleController;
}

- (void)setAccessorySettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsItemModuleController, a3);
}

- (HFAccessorySettingItem)fileUploadItem
{
  return self->_fileUploadItem;
}

- (void)setFileUploadItem:(id)a3
{
  objc_storeStrong((id *)&self->_fileUploadItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileUploadItem, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_groupItem, 0);
}

@end
