@implementation HUUserCamerasAccessLevelViewController

- (HUUserCamerasAccessLevelViewController)initWithUserItem:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUUserCamerasAccessLevelItemManager *v8;
  void *v9;
  HUUserCamerasAccessLevelItemManager *v10;
  HUUserCamerasAccessLevelViewController *v11;
  uint64_t v12;
  HFUserItem *userItem;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = [HUUserCamerasAccessLevelItemManager alloc];
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = -[HUUserCamerasAccessLevelItemManager initWithHome:userItem:delegate:](v8, "initWithHome:userItem:delegate:", v7, v9, self);

  v15.receiver = self;
  v15.super_class = (Class)HUUserCamerasAccessLevelViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v10, 1);
  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    userItem = v11->_userItem;
    v11->_userItem = (HFUserItem *)v12;

    objc_storeStrong((id *)&v11->_camerasAccessLevelItemManager, v10);
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUUserCamerasAccessLevelViewController;
  -[HUItemTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCamerasTitle"), CFSTR("HUUsersCamerasTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserCamerasAccessLevelViewController setTitle:](self, "setTitle:", v3);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[HUUserCamerasAccessLevelViewController camerasAccessLevelItemManager](self, "camerasAccessLevelItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessLevelItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    objc_opt_class();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUUserCamerasAccessLevelViewController;
    -[HUItemTableViewController cellClassForItem:indexPath:](&v14, sel_cellClassForItem_indexPath_, v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUUserCamerasAccessLevelViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v20, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUUserCamerasAccessLevelViewController camerasAccessLevelItemManager](self, "camerasAccessLevelItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessLevelItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v9);

  if (v12)
  {
    objc_msgSend(v9, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_msgSend(v9, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v8, "setUserInteractionEnabled:", v15 ^ 1);
    objc_msgSend(v8, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", v15 ^ 1);

    if ((_DWORD)v15)
      v19 = 0;
    else
      v19 = 3;
    objc_msgSend(v8, "setSelectionStyle:", v19);
  }

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
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  objc_super v20;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HUUserCamerasAccessLevelViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v20, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);
  -[HUUserCamerasAccessLevelViewController camerasAccessLevelItemManager](self, "camerasAccessLevelItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessLevelItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v11);

  if (v15)
  {
    objc_msgSend(v11, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      -[HUUserCamerasAccessLevelViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v12);
      v19 = 3;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v10, "setAccessoryType:", v19);
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HUUserCamerasAccessLevelViewController selectedIndexPath](self, "selectedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  return v7 ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  objc_super v33;

  v6 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HUUserCamerasAccessLevelViewController;
  v25 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v33, sel_tableView_didSelectRowAtIndexPath_);
  -[HUUserCamerasAccessLevelViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserCamerasAccessLevelViewController camerasAccessLevelItemManager](self, "camerasAccessLevelItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeAccessControlForUser:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserCamerasAccessLevelViewController camerasAccessLevelItemManager](self, "camerasAccessLevelItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessLevelItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v8);

  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E6F4FA10;
    v31 = v8;
    v32 = v13;
    v18 = _Block_copy(aBlock);

  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)MEMORY[0x1E0D519C0];
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v28[3] = &unk_1E6F55330;
  v29 = v18;
  v20 = v18;
  objc_msgSend(v19, "futureWithErrorOnlyHandlerAdapterBlock:", v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v26[3] = &unk_1E6F4D188;
  v26[4] = self;
  v27 = v10;
  v22 = v10;
  v23 = (id)objc_msgSend(v21, "addSuccessBlock:", v26);
  v24 = (id)objc_msgSend(v21, "addFailureBlock:", &__block_literal_global_145);
  objc_msgSend(v25, "deselectRowAtIndexPath:animated:", v6, 1);

}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFAccessLevelValueResultKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(*(id *)(a1 + 40), "updateCamerasAccessLevel:completionHandler:", v6, v7);
}

uint64_t __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v4[3] = &unk_1E6F4F418;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "dispatchHomeObserverMessage:sender:", v4, 0);

}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateAccessControlForUser:", v4, *(_QWORD *)(a1 + 40));

  }
}

void __76__HUUserCamerasAccessLevelViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D30A10], 0, 0, 0);

}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUUserCamerasAccessLevelItemManager)camerasAccessLevelItemManager
{
  return self->_camerasAccessLevelItemManager;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_camerasAccessLevelItemManager, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
