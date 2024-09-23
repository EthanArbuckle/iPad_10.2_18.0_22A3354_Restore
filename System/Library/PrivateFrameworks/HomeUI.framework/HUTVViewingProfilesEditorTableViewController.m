@implementation HUTVViewingProfilesEditorTableViewController

- (HUTVViewingProfilesEditorTableViewController)initWithUserItem:(id)a3
{
  id v4;
  HUTVViewingProfilesEditorItemManager *v5;
  HUTVViewingProfilesEditorTableViewController *v6;
  HUTVViewingProfilesDevicesModuleController *v7;
  void *v8;
  uint64_t v9;
  HUTVViewingProfilesDevicesModuleController *tvpDevicesModuleController;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = -[HUTVViewingProfilesEditorItemManager initWithDelegate:userItem:]([HUTVViewingProfilesEditorItemManager alloc], "initWithDelegate:userItem:", self, v4);

  v13.receiver = self;
  v13.super_class = (Class)HUTVViewingProfilesEditorTableViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    v7 = [HUTVViewingProfilesDevicesModuleController alloc];
    -[HUTVViewingProfilesEditorItemManager tvpDevicesModule](v5, "tvpDevicesModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUTVViewingProfilesDevicesModuleController initWithModule:host:](v7, "initWithModule:host:", v8, v6);
    tvpDevicesModuleController = v6->_tvpDevicesModuleController;
    v6->_tvpDevicesModuleController = (HUTVViewingProfilesDevicesModuleController *)v9;

    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersTVViewingProfiles"), CFSTR("HUUsersTVViewingProfiles"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTVViewingProfilesEditorTableViewController setTitle:](v6, "setTitle:", v11);

    v6->_hideHeadersAndFooters = 0;
  }

  return v6;
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
  -[HUTVViewingProfilesEditorTableViewController tvpDevicesModuleController](self, "tvpDevicesModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performPresentationRequest:](self, "hu_performPresentationRequest:", a4);
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performDismissalRequest:](self, "hu_performDismissalRequest:", a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (BOOL)hideHeadersAndFooters
{
  return self->_hideHeadersAndFooters;
}

- (void)setHideHeadersAndFooters:(BOOL)a3
{
  self->_hideHeadersAndFooters = a3;
}

- (HUTVViewingProfilesDevicesModuleController)tvpDevicesModuleController
{
  return self->_tvpDevicesModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvpDevicesModuleController, 0);
}

@end
