@implementation HUServiceActionControlsViewController

- (HUServiceActionControlsViewController)initWithServiceActionItem:(id)a3 mode:(unint64_t)a4
{
  id v6;
  HUServiceActionControlsItemManager *v7;
  HUServiceActionControlsViewController *v8;
  HUServiceActionControlsViewController *v9;
  HUControlPanelController *v10;
  UIColor *overrideCellColor;
  objc_super v13;

  v6 = a3;
  v7 = -[HUServiceActionControlsItemManager initWithServiceActionItem:mode:delegate:]([HUServiceActionControlsItemManager alloc], "initWithServiceActionItem:mode:delegate:", v6, a4, self);
  v13.receiver = self;
  v13.super_class = (Class)HUServiceActionControlsViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v9 = v8;
  if (v8)
  {
    -[HUServiceActionControlsViewController setServiceActionItem:](v8, "setServiceActionItem:", v6);
    v10 = -[HUControlPanelController initWithDelegate:]([HUControlPanelController alloc], "initWithDelegate:", v9);
    -[HUServiceActionControlsViewController setControlPanelController:](v9, "setControlPanelController:", v10);

    v9->_mode = a4;
    overrideCellColor = v9->_overrideCellColor;
    v9->_overrideCellColor = 0;

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUServiceActionControlsViewController;
  -[HUItemTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUServiceActionControlsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

- (void)_done:(id)a3
{
  id v4;
  id v5;

  -[HUServiceActionControlsViewController presentationDelegate](self, "presentationDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "finishPresentation:animated:", self, 1);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellClassForItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceActionControlsViewController.m"), 75, CFSTR("Couldn't find a cell class for item: %@"), v6);
    v8 = 0;
  }

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setupCell:forItem:", v9, v7);

    }
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUServiceActionControlsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v15, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateCell:forItem:animated:", v10, v11, v6);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setDestructive:", 1);
  }
  -[HUServiceActionControlsViewController overrideCellColor](self, "overrideCellColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HUServiceActionControlsViewController overrideCellColor](self, "overrideCellColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v14);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        objc_msgSend(v13, "item");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
        {
          if (objc_msgSend(v13, "type") == 1)
          {
            -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addItem:", v16);
          }
          else
          {
            if (objc_msgSend(v13, "type") != 2)
              goto LABEL_15;
            -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeItem:", v16);
          }

        }
LABEL_15:

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v19.receiver = self;
  v19.super_class = (Class)HUServiceActionControlsViewController;
  -[HUItemTableViewController itemManager:performUpdateRequest:](&v19, sel_itemManager_performUpdateRequest_, v18, v6);

}

- (BOOL)itemManager:(id)a3 shouldShowControlPanelItem:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldDisplayItem:", v5);

  return v7;
}

- (BOOL)itemManager:(id)a3 shouldShowSectionTitleForControlPanelItem:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[HUServiceActionControlsViewController controlPanelController](self, "controlPanelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShowSectionTitleForItem:", v5);

  return v7;
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  v7 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HUServiceActionControlsViewController;
  v12 = a6;
  v13 = a5;
  -[HUItemTableViewController diffableDataItemManager:willUpdateItems:addItems:removeItems:isInitialLoad:](&v17, sel_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad_, a3, a4, v13, v12, v7);
  v14 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke;
  v16[3] = &unk_1E6F51390;
  v16[4] = self;
  objc_msgSend(v13, "na_each:", v16);

  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2;
  v15[3] = &unk_1E6F51390;
  v15[4] = self;
  objc_msgSend(v12, "na_each:", v15);

}

void __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v10;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "controlPanelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "controlPanelController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addItem:", v5);

    }
  }

}

void __116__HUServiceActionControlsViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "controlPanelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItem:", v5);

  }
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HFServiceActionItem)serviceActionItem
{
  return self->_serviceActionItem;
}

- (void)setServiceActionItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceActionItem, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HUServiceActionControlsViewControllerDelegate)serviceActionControlsDelegate
{
  return (HUServiceActionControlsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_serviceActionControlsDelegate);
}

- (void)setServiceActionControlsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serviceActionControlsDelegate, a3);
}

- (HUControlPanelController)controlPanelController
{
  return self->_controlPanelController;
}

- (void)setControlPanelController:(id)a3
{
  objc_storeStrong((id *)&self->_controlPanelController, a3);
}

- (UIColor)overrideCellColor
{
  return self->_overrideCellColor;
}

- (void)setOverrideCellColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideCellColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCellColor, 0);
  objc_storeStrong((id *)&self->_controlPanelController, 0);
  objc_destroyWeak((id *)&self->_serviceActionControlsDelegate);
  objc_storeStrong((id *)&self->_serviceActionItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
