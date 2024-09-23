@implementation HUSoftwareUpdateRecentUpdatesViewController

- (HUSoftwareUpdateRecentUpdatesViewController)initWithHome:(id)a3
{
  id v4;
  HUSoftwareUpdateRecentUpdatesItemManager *v5;
  HUSoftwareUpdateRecentUpdatesViewController *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[HUSoftwareUpdateRecentUpdatesItemManager initWithDelegate:home:]([HUSoftwareUpdateRecentUpdatesItemManager alloc], "initWithDelegate:home:", self, v4);

  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateRecentUpdatesViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v8, sel_initWithItemManager_tableViewStyle_, v5, 1);

  return v6;
}

- (HUSoftwareUpdateRecentUpdatesViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateRecentUpdatesViewController.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateRecentUpdatesViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateRecentUpdatesViewController;
  -[HUItemTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateUpdatedRecentlyTitle"), CFSTR("HUSoftwareUpdateUpdatedRecentlyTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateRecentUpdatesViewController setTitle:](self, "setTitle:", v3);

}

- (id)itemModuleControllers
{
  void *v3;
  HUSoftwareUpdateItemModuleController *v4;
  void *v5;
  void *v6;
  HUSoftwareUpdateItemModuleController *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUSoftwareUpdateRecentUpdatesViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [HUSoftwareUpdateItemModuleController alloc];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "softwareUpdateModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUSoftwareUpdateItemModuleController initWithModule:delegate:expandableTextViewCellDelegate:](v4, "initWithModule:delegate:expandableTextViewCellDelegate:", v6, 0, self);
    -[HUSoftwareUpdateRecentUpdatesViewController setSoftwareUpdateItemModuleController:](self, "setSoftwareUpdateItemModuleController:", v7);

  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoftwareUpdateRecentUpdatesViewController softwareUpdateItemModuleController](self, "softwareUpdateItemModuleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HUSoftwareUpdateItemModuleController)softwareUpdateItemModuleController
{
  return self->_softwareUpdateItemModuleController;
}

- (void)setSoftwareUpdateItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateItemModuleController, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
