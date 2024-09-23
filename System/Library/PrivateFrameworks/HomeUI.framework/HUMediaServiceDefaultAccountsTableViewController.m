@implementation HUMediaServiceDefaultAccountsTableViewController

- (HUMediaServiceDefaultAccountsTableViewController)initWithItem:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUMediaServiceDefaultAccountsItemManager *v8;
  void *v9;
  HUMediaServiceDefaultAccountsItemManager *v10;
  HUMediaServiceDefaultAccountsTableViewController *v11;
  HUMediaServiceDefaultAccountsTableViewController *v12;
  id v13;
  void *v14;
  uint64_t v15;
  HFUserItem *userItem;
  objc_super v18;

  v6 = a4;
  v7 = a3;
  v8 = [HUMediaServiceDefaultAccountsItemManager alloc];
  v9 = (void *)objc_msgSend(v7, "copy");

  v10 = -[HUMediaServiceDefaultAccountsItemManager initWithHome:sourceItem:delegate:](v8, "initWithHome:sourceItem:delegate:", v6, v9, self);
  v18.receiver = self;
  v18.super_class = (Class)HUMediaServiceDefaultAccountsTableViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v18, sel_initWithItemManager_tableViewStyle_, v10, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaServiceDefaultAccountsItemManager, v10);
    v13 = objc_alloc(MEMORY[0x1E0D31988]);
    objc_msgSend(v6, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithHome:user:nameStyle:", v6, v14, 0);
    userItem = v12->_userItem;
    v12->_userItem = (HFUserItem *)v15;

  }
  return v12;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemManager](self, "mediaServiceDefaultAccountsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultAccountsTitleItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isEqual:", v7);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUMediaServiceDefaultAccountsTableViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v20, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemManager](self, "mediaServiceDefaultAccountsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultAccountsTitleItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9)
  {
    objc_opt_class();
    v12 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v9, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    objc_msgSend(v14, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v19);

  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("HUMediaServiceDefaultAccountsTitleSectionIdentifier")))
    v7 = 0.01;
  else
    v7 = *MEMORY[0x1E0CEBC10];

  return v7;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HUMediaServiceDefaultAccountsItemModuleController *v7;
  void *v8;
  HUMediaServiceDefaultAccountsItemModuleController *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemModuleController](self, "mediaServiceDefaultAccountsItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemManager](self, "mediaServiceDefaultAccountsItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAccountsItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HUMediaServiceDefaultAccountsItemModuleController alloc];
    -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemManager](self, "mediaServiceDefaultAccountsItemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultAccountsItemModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUMediaServiceDefaultAccountsItemModuleController initWithModule:delegate:host:](v7, "initWithModule:delegate:host:", v8, self, self);
    -[HUMediaServiceDefaultAccountsTableViewController setMediaServiceDefaultAccountsItemModuleController:](self, "setMediaServiceDefaultAccountsItemModuleController:", v9);

LABEL_4:
  }
  -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemModuleController](self, "mediaServiceDefaultAccountsItemModuleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v10);

  return v3;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (void)mediaServiceDefaultAccountsItemModuleController:(id)a3 didUpdateDefaultAccount:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[HUMediaServiceDefaultAccountsTableViewController mediaServiceDefaultAccountsItemManager](self, "mediaServiceDefaultAccountsItemManager", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "diffableDataSourceDisabled");

  if ((_DWORD)v6)
  {
    -[HUMediaServiceDefaultAccountsTableViewController tableView](self, "tableView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadSections:withRowAnimation:", v9, 5);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemSectionForSectionIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadUIRepresentationForSections:withAnimation:", v13, 0);

    }
  }
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUMediaServiceDefaultAccountsItemManager)mediaServiceDefaultAccountsItemManager
{
  return self->_mediaServiceDefaultAccountsItemManager;
}

- (HUMediaServiceDefaultAccountsItemModuleController)mediaServiceDefaultAccountsItemModuleController
{
  return self->_mediaServiceDefaultAccountsItemModuleController;
}

- (void)setMediaServiceDefaultAccountsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceDefaultAccountsItemModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceDefaultAccountsItemModuleController, 0);
  objc_storeStrong((id *)&self->_mediaServiceDefaultAccountsItemManager, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
