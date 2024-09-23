@implementation HUTriggerActionSetsModuleController

- (void)reloadActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  if (self->_actionSetsGridViewController)
    goto LABEL_3;
  -[HUItemModuleController module](self, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetsGridItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "itemIsBeingDisplayed:", v6);

  if (v7)
  {
LABEL_3:
    -[HUTriggerActionSetsModuleController actionSetsGridViewController](self, "actionSetsGridViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadActions");

  }
  if (self->_actionsGridViewController)
    goto LABEL_6;
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemUpdater");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceActionsGridItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "itemIsBeingDisplayed:", v12);

  if (v13)
  {
LABEL_6:
    -[HUTriggerActionSetsModuleController actionsGridViewController](self, "actionsGridViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadActions");

  }
  if (self->_prioritizedActionsGridViewController)
    goto LABEL_9;
  -[HUItemModuleController module](self, "module");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemUpdater");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "prioritizedServiceActionsGridItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "itemIsBeingDisplayed:", v18);

  if (v19)
  {
LABEL_9:
    -[HUTriggerActionSetsModuleController prioritizedActionsGridViewController](self, "prioritizedActionsGridViewController");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reloadActions");

  }
}

- (id)childViewControllersToPreload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionSetsModuleController actionsGridViewController](self, "actionsGridViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSetsGridItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "itemIsBeingDisplayed:", v8);

  if (v9)
  {
    -[HUTriggerActionSetsModuleController actionSetsGridViewController](self, "actionSetsGridViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemUpdater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prioritizedServiceActionsGridItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "itemIsBeingDisplayed:", v14);

  if (v15)
  {
    -[HUTriggerActionSetsModuleController prioritizedActionsGridViewController](self, "prioritizedActionsGridViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  objc_msgSend(v3, "na_safeAddObject:", self->_actionSetsGridViewController);
  objc_msgSend(v3, "na_safeAddObject:", self->_prioritizedActionsGridViewController);
  objc_msgSend(v3, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (HUTriggerSummaryActionGridViewControllerProtocol)actionSetsGridViewController
{
  HUTriggerSummaryActionGridViewControllerProtocol *actionSetsGridViewController;
  HUEmbeddedTriggerActionSetGridViewController *v4;
  void *v5;
  void *v6;
  HUEmbeddedTriggerActionSetGridViewController *v7;
  HUTriggerSummaryActionGridViewControllerProtocol *v8;

  actionSetsGridViewController = self->_actionSetsGridViewController;
  if (!actionSetsGridViewController)
  {
    v4 = [HUEmbeddedTriggerActionSetGridViewController alloc];
    -[HUItemModuleController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUEmbeddedTriggerActionSetGridViewController initWithTriggerBuilder:](v4, "initWithTriggerBuilder:", v6);

    -[HUEmbeddedTriggerActionSetGridViewController setDelegate:](v7, "setDelegate:", self);
    v8 = self->_actionSetsGridViewController;
    self->_actionSetsGridViewController = (HUTriggerSummaryActionGridViewControllerProtocol *)v7;

    actionSetsGridViewController = self->_actionSetsGridViewController;
  }
  return actionSetsGridViewController;
}

- (HUTriggerSummaryActionGridViewControllerProtocol)actionsGridViewController
{
  HUTriggerSummaryActionGridViewControllerProtocol *actionsGridViewController;
  HUEmbeddedTriggerActionGridViewController *v4;
  void *v5;
  void *v6;
  HUEmbeddedTriggerActionGridViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HUTriggerSummaryActionGridViewControllerProtocol *v14;

  actionsGridViewController = self->_actionsGridViewController;
  if (!actionsGridViewController)
  {
    v4 = [HUEmbeddedTriggerActionGridViewController alloc];
    -[HUItemModuleController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUEmbeddedTriggerActionGridViewController initWithTriggerBuilder:](v4, "initWithTriggerBuilder:", v6);

    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prioritizedAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[HUItemModuleController module](self, "module");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "prioritizedAccessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ActionGridViewController setDenylistedAccessories:](v7, "setDenylistedAccessories:", v13);

    }
    -[HUEmbeddedTriggerActionGridViewController setTriggerActionGridDelegate:](v7, "setTriggerActionGridDelegate:", self);
    v14 = self->_actionsGridViewController;
    self->_actionsGridViewController = (HUTriggerSummaryActionGridViewControllerProtocol *)v7;

    actionsGridViewController = self->_actionsGridViewController;
  }
  return actionsGridViewController;
}

- (HUTriggerSummaryActionGridViewControllerProtocol)prioritizedActionsGridViewController
{
  HUTriggerSummaryActionGridViewControllerProtocol *prioritizedActionsGridViewController;
  HUEmbeddedTriggerActionGridViewController *v4;
  void *v5;
  void *v6;
  HUEmbeddedTriggerActionGridViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HUTriggerSummaryActionGridViewControllerProtocol *v14;

  prioritizedActionsGridViewController = self->_prioritizedActionsGridViewController;
  if (!prioritizedActionsGridViewController)
  {
    v4 = [HUEmbeddedTriggerActionGridViewController alloc];
    -[HUItemModuleController module](self, "module");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUEmbeddedTriggerActionGridViewController initWithTriggerBuilder:](v4, "initWithTriggerBuilder:", v6);

    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prioritizedAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[HUItemModuleController module](self, "module");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "prioritizedAccessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ActionGridViewController setAllowlistedAccessories:](v7, "setAllowlistedAccessories:", v13);

    }
    v14 = self->_prioritizedActionsGridViewController;
    self->_prioritizedActionsGridViewController = (HUTriggerSummaryActionGridViewControllerProtocol *)v7;

    prioritizedActionsGridViewController = self->_prioritizedActionsGridViewController;
  }
  return prioritizedActionsGridViewController;
}

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetsGridItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
    goto LABEL_4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceActionsGridItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v8) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prioritizedServiceActionsGridItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
    -[HUItemModuleController module](self, "module");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortcutItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 != v4)
    {
      v9 = 0;
      goto LABEL_6;
    }
  }
LABEL_5:
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSetsGridItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v20 = (void *)MEMORY[0x1E0CEA478];
    v19 = v33;
    objc_msgSend(v20, "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v21);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v22);

    objc_msgSend(v19, "setIgnoreRounding:", 1);
    -[HUTriggerActionSetsModuleController actionSetsGridViewController](self, "actionSetsGridViewController");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v16 = (id)v24;
    objc_msgSend(v19, "setViewController:", v24);
    goto LABEL_11;
  }
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceActionsGridItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    v25 = (void *)MEMORY[0x1E0CEA478];
    v19 = v33;
    objc_msgSend(v25, "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v26);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBackgroundColor:", v27);

    objc_msgSend(v19, "setIgnoreRounding:", 1);
    -[HUTriggerActionSetsModuleController actionsGridViewController](self, "actionsGridViewController");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[HUItemModuleController module](self, "module");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prioritizedServiceActionsGridItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v6)
  {
    v29 = (void *)MEMORY[0x1E0CEA478];
    v19 = v33;
    objc_msgSend(v29, "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v30);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v31);

    objc_msgSend(v19, "setIgnoreRounding:", 1);
    -[HUTriggerActionSetsModuleController prioritizedActionsGridViewController](self, "prioritizedActionsGridViewController");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[HUItemModuleController module](self, "module");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shortcutItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "isEqual:", v14);

  if (v15)
  {
    v16 = v33;
    objc_msgSend(v16, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceStyle");

    if (v18 != 1)
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCellColor:", v19);
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:

}

- (void)triggerActionGridViewController:(id)a3 didUpdate:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUTriggerActionSetsModuleController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionSetsModuleController:didUpdateTriggerBuilder:", self, v5);

}

- (void)triggerActionSetGridViewController:(id)a3 didUpdate:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUTriggerActionSetsModuleController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionSetsModuleController:didUpdateTriggerBuilder:", self, v5);

}

- (HUTriggerActionSetsModuleControllerDelegate)delegate
{
  return (HUTriggerActionSetsModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prioritizedActionsGridViewController, 0);
  objc_storeStrong((id *)&self->_actionsGridViewController, 0);
  objc_storeStrong((id *)&self->_actionSetsGridViewController, 0);
}

@end
