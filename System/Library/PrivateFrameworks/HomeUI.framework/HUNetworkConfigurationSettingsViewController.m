@implementation HUNetworkConfigurationSettingsViewController

- (HUNetworkConfigurationSettingsViewController)initWithNetworkConfigurationGroupItem:(id)a3
{
  id v4;
  HUNetworkConfigurationSettingsItemManager *v5;
  HUNetworkConfigurationSettingsViewController *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = -[HUNetworkConfigurationSettingsItemManager initWithDelegate:networkConfigurationGroupItem:]([HUNetworkConfigurationSettingsItemManager alloc], "initWithDelegate:networkConfigurationGroupItem:", self, v4);
  v10.receiver = self;
  v10.super_class = (Class)HUNetworkConfigurationSettingsViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    objc_msgSend(v4, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNetworkConfigurationSettingsViewController setTitle:](v6, "setTitle:", v8);

  }
  return v6;
}

- (HUNetworkConfigurationSettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithNetworkConfigurationGroupItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationSettingsViewController.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkConfigurationSettingsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  HUNetworkConfigurationSettingsModuleController *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkConfigurationSettingsModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    v9 = -[HUNetworkConfigurationSettingsModuleController initWithModule:]([HUNetworkConfigurationSettingsModuleController alloc], "initWithModule:", v5);
    -[HUNetworkConfigurationSettingsViewController setNetworkConfigurationSettingsModuleController:](self, "setNetworkConfigurationSettingsModuleController:", v9);

    -[HUNetworkConfigurationSettingsViewController networkConfigurationSettingsModuleController](self, "networkConfigurationSettingsModuleController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationSettingsViewController.m"), 54, CFSTR("Unexpected module %@"), v5);

    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUNetworkConfigurationSettingsViewController;
  -[HUItemTableViewController tableView:viewForFooterInSection:](&v15, sel_tableView_viewForFooterInSection_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HUNetworkConfigurationSettingsViewController networkConfigurationSettingsModuleController](self, "networkConfigurationSettingsModuleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTappableTextViewDelegate:", v9);

  objc_msgSend(v8, "messageTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  objc_msgSend(v8, "messageTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectable:", 0);

  objc_msgSend(v8, "messageTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setInteractiveTextSelectionDisabled:", 1);

  return v6;
}

- (void)itemManagerDidFinishUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUNetworkConfigurationSettingsViewController;
  -[HUItemTableViewController itemManagerDidFinishUpdate:](&v4, sel_itemManagerDidFinishUpdate_, a3);
  -[HUNetworkConfigurationSettingsViewController updateNetworkConfigurationSettingsModuleFooter](self, "updateNetworkConfigurationSettingsModuleFooter");
}

- (void)updateNetworkConfigurationSettingsModuleFooter
{
  void *v3;
  id v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recalculateVisibilityAndSortAllItems");

  -[HUNetworkConfigurationSettingsViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  NSObject *v9;
  int v11;
  HUNetworkConfigurationSettingsViewController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v11, 0x16u);
  }

  return (unint64_t)(a6 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (HUNetworkConfigurationSettingsModuleController)networkConfigurationSettingsModuleController
{
  return self->_networkConfigurationSettingsModuleController;
}

- (void)setNetworkConfigurationSettingsModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationSettingsModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationSettingsModuleController, 0);
}

@end
