@implementation HUMediaAccessControlEditorTableViewController

- (HUMediaAccessControlEditorTableViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  HUMediaAccessControlEditorTableViewController *v7;
  HUMediaAccessControlEditorTableViewController *v8;
  HUMediaAccessControlEditorModuleController *v9;
  void *v10;
  uint64_t v11;
  HUMediaAccessControlEditorModuleController *accessControlEditorModuleController;
  void *v13;
  objc_super v15;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31500]), "initWithDelegate:home:", self, v5);
  v15.receiver = self;
  v15.super_class = (Class)HUMediaAccessControlEditorTableViewController;
  v7 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v6, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_home, a3);
    v9 = [HUMediaAccessControlEditorModuleController alloc];
    objc_msgSend(v6, "accessControlEditorItemModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUMediaAccessControlEditorModuleController initWithModule:](v9, "initWithModule:", v10);
    accessControlEditorModuleController = v8->_accessControlEditorModuleController;
    v8->_accessControlEditorModuleController = (HUMediaAccessControlEditorModuleController *)v11;

    -[HUMediaAccessControlEditorModuleController setDelegate:](v8->_accessControlEditorModuleController, "setDelegate:", v8);
    HFLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaAccessControlEditorTableViewController setTitle:](v8, "setTitle:", v13);

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaAccessControlEditorTableViewController;
  -[HUItemTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("Footer"));

}

- (id)itemModuleControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaAccessControlEditorTableViewController accessControlEditorModuleController](self, "accessControlEditorModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[HUItemTableViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("Footer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaAccessControlEditorTableViewController _updateFooterView:forSection:](self, "_updateFooterView:forSection:", v9, a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)accessControlEditorModuleController:(id)a3 didUpdateAccessControl:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSections");

  if (v7 >= 1)
  {
    v8 = 0;
    do
    {
      objc_opt_class();
      -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "footerViewForSection:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      -[HUMediaAccessControlEditorTableViewController _updateFooterView:forSection:](self, "_updateFooterView:forSection:", v12, v8);
      ++v8;
      -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfSections");

    }
    while (v8 < v14);
  }
  -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endUpdates");

}

- (void)_updateFooterView:(id)a3 forSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "setType:", 1);
  -[HUMediaAccessControlEditorTableViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v8, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessage:", v7);

}

- (HMHome)home
{
  return self->_home;
}

- (HUMediaAccessControlEditorModuleController)accessControlEditorModuleController
{
  return self->_accessControlEditorModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlEditorModuleController, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
