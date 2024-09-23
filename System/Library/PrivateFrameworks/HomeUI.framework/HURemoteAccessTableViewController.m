@implementation HURemoteAccessTableViewController

- (HURemoteAccessTableViewController)initWithItem:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HURemoteAccessItemManager *v8;
  void *v9;
  HURemoteAccessItemManager *v10;
  HURemoteAccessTableViewController *v11;
  uint64_t v12;
  HFUserItem *userItem;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = [HURemoteAccessItemManager alloc];
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = -[HURemoteAccessItemManager initWithHome:userItem:delegate:](v8, "initWithHome:userItem:delegate:", v7, v9, self);

  v15.receiver = self;
  v15.super_class = (Class)HURemoteAccessTableViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v10, 1);
  if (v11)
  {
    v12 = objc_msgSend(v6, "copy");
    userItem = v11->_userItem;
    v11->_userItem = (HFUserItem *)v12;

    objc_storeStrong((id *)&v11->_remoteAccessItemManager, v10);
  }

  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HURemoteAccessTableViewController;
  -[HUItemTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HURemoteAccessTitle"), CFSTR("HURemoteAccessTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURemoteAccessTableViewController setTitle:](self, "setTitle:", v3);

}

- (id)user
{
  void *v2;
  void *v3;

  -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowRemoteAccessItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
  {
    objc_opt_class();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HURemoteAccessTableViewController;
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
  id v13;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HURemoteAccessTableViewController;
  v9 = a4;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v14, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager", v14.receiver, v14.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowRemoteAccessItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = v8;
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setSelectionStyle:", 0);

  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)HURemoteAccessTableViewController;
  LOBYTE(v8) = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v14, sel_shouldHideSeparatorsForCell_indexPath_, v7, v6);

  if ((v8 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allowRemoteAccessItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v12);

  }
  return v10;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  id v5;
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
  int v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD aBlock[4];
  id v37;
  BOOL v38;

  v5 = a3;
  -[HURemoteAccessTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeAccessControlForUser:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HURemoteAccessTableViewController remoteAccessItemManager](self, "remoteAccessItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allowRemoteAccessItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "isEqual:", v16);

  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6F511A8;
    v37 = v14;
    v19 = a4;
    v38 = a4;
    v20 = _Block_copy(aBlock);

  }
  else
  {
    v20 = 0;
    v19 = a4;
  }
  v21 = (void *)MEMORY[0x1E0D519C0];
  v34[0] = v18;
  v34[1] = 3221225472;
  v34[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_2;
  v34[3] = &unk_1E6F55330;
  v35 = v20;
  v22 = v20;
  objc_msgSend(v21, "futureWithErrorOnlyHandlerAdapterBlock:", v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_3;
  v32[3] = &unk_1E6F4D188;
  v32[4] = self;
  v33 = v11;
  v24 = v11;
  v25 = (id)objc_msgSend(v23, "addSuccessBlock:", v32);
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_5;
  v29[3] = &unk_1E6F52A58;
  v30 = v5;
  v31 = v19;
  v26 = v5;
  v27 = (id)objc_msgSend(v23, "addFailureBlock:", v29);

}

uint64_t __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRemoteAccess:completionHandler:", *(unsigned __int8 *)(a1 + 40), a2);
}

uint64_t __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_4;
  v4[3] = &unk_1E6F4F418;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "dispatchHomeObserverMessage:sender:", v4, 0);

}

void __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_4(uint64_t a1, void *a2)
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

uint64_t __58__HURemoteAccessTableViewController_switchCell_didTurnOn___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v4, *MEMORY[0x1E0D30A10], 0, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HURemoteAccessItemManager)remoteAccessItemManager
{
  return self->_remoteAccessItemManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccessItemManager, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
