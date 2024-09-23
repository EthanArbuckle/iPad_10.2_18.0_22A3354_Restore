@implementation HUValveEditorViewController

- (HUValveEditorViewController)initWithSourceItem:(id)a3 editorMode:(unint64_t)a4
{
  id v6;
  HUValveEditorItemManager *v7;
  HUValveEditorViewController *v8;
  HUValveEditorViewController *v9;
  uint64_t v10;
  NSMutableSet *moduleControllers;
  objc_super v13;

  v6 = a3;
  v7 = -[HUValveEditorItemManager initWithDelegate:sourceItem:editorMode:]([HUValveEditorItemManager alloc], "initWithDelegate:sourceItem:editorMode:", self, v6, a4);

  v13.receiver = self;
  v13.super_class = (Class)HUValveEditorViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_valveEditorItemManager, v7);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    moduleControllers = v9->_moduleControllers;
    v9->_moduleControllers = (NSMutableSet *)v10;

  }
  return v9;
}

- (HUValveEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSourceItem_editorMode_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUValveEditorViewController.m"), 49, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUValveEditorViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "controlPanelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellClassForItem:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "identifyItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isEqual:", v11);

    objc_opt_class();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlPanelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setupCell:forItem:", v10, v7);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUValveEditorViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v14, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "controlPanelController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateCell:forItem:animated:", v10, v11, 1);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUValveEditorViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v21, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifyItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    objc_opt_class();
    -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_opt_class();
    objc_msgSend(v16, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    objc_msgSend(v19, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "identifyWithCompletionHandler:", &__block_literal_global_152);
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  }

}

void __65__HUValveEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0D313A0];
    v3 = a2;
    objc_msgSend(v2, "sharedHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleError:", v3);

  }
}

- (id)itemModuleControllers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  HUNameItemModuleController *v7;
  void *v8;
  void *v9;
  HUNameItemModuleController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUValveEditorViewController nameModuleController](self, "nameModuleController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_3;
  v4 = (void *)v3;
  -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nameModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    v7 = [HUNameItemModuleController alloc];
    -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nameModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUNameItemModuleController initWithModule:host:](v7, "initWithModule:host:", v9, self);
    -[HUValveEditorViewController setNameModuleController:](self, "setNameModuleController:", v10);

    -[HUValveEditorViewController nameModuleController](self, "nameModuleController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNameFieldHasClearButton:", 1);

    -[HUValveEditorViewController nameModuleController](self, "nameModuleController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowIcon:", 0);

    -[HUValveEditorViewController moduleControllers](self, "moduleControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUValveEditorViewController nameModuleController](self, "nameModuleController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  return -[HUValveEditorViewController moduleControllers](self, "moduleControllers");
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  objc_msgSend(a3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUValveEditorViewController nameModuleController](self, "nameModuleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForCommit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke;
  v10[3] = &unk_1E6F4D188;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v10);

}

void __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valveEditorItemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke_2;
  v6[3] = &unk_1E6F4E2D8;
  v7 = *(id *)(a1 + 40);
  v5 = (id)objc_msgSend(v4, "addFailureBlock:", v6);

}

void __59__HUValveEditorViewController_textFieldDidEndEditing_item___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D309B0];
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *MEMORY[0x1E0D305A8];
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v4, v6, v8, 0, 0);

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
  void *v18;
  id v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v6, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
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
            -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "controlPanelController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addItem:", v16);
          }
          else
          {
            if (objc_msgSend(v13, "type") != 2)
              goto LABEL_15;
            -[HUValveEditorViewController valveEditorItemManager](self, "valveEditorItemManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "controlPanelController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeItem:", v16);
          }

        }
LABEL_15:

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v20.receiver = self;
  v20.super_class = (Class)HUValveEditorViewController;
  -[HUItemTableViewController itemManager:performUpdateRequest:](&v20, sel_itemManager_performUpdateRequest_, v19, v6);

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
  v17.super_class = (Class)HUValveEditorViewController;
  v12 = a6;
  v13 = a5;
  -[HUItemTableViewController diffableDataItemManager:willUpdateItems:addItems:removeItems:isInitialLoad:](&v17, sel_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad_, a3, a4, v13, v12, v7);
  v14 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke;
  v16[3] = &unk_1E6F51390;
  v16[4] = self;
  objc_msgSend(v13, "na_each:", v16);

  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2;
  v15[3] = &unk_1E6F51390;
  v15[4] = self;
  objc_msgSend(v12, "na_each:", v15);

}

void __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_opt_class();
  v12 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v12;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "valveEditorItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlPanelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v5);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "valveEditorItemManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "controlPanelController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addItem:", v5);

    }
  }

}

void __106__HUValveEditorViewController_diffableDataItemManager_willUpdateItems_addItems_removeItems_isInitialLoad___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_opt_class();
  v8 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v8;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "valveEditorItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlPanelController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItem:", v5);

  }
}

- (HUValveEditorItemManager)valveEditorItemManager
{
  return self->_valveEditorItemManager;
}

- (void)setValveEditorItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_valveEditorItemManager, a3);
}

- (HUNameItemModuleController)nameModuleController
{
  return self->_nameModuleController;
}

- (void)setNameModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_nameModuleController, a3);
}

- (NSMutableSet)moduleControllers
{
  return self->_moduleControllers;
}

- (void)setModuleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_moduleControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleControllers, 0);
  objc_storeStrong((id *)&self->_nameModuleController, 0);
  objc_storeStrong((id *)&self->_valveEditorItemManager, 0);
}

@end
