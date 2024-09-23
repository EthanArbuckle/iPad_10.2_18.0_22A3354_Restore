@implementation HUNetworkRouterSettingsViewController

- (HUNetworkRouterSettingsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterSettingsViewController.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkRouterSettingsViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUNetworkRouterSettingsViewController)initWithHome:(id)a3
{
  id v4;
  HUNetworkRouterSettingsItemManager *v5;
  HUNetworkRouterSettingsViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[HUNetworkRouterSettingsItemManager initWithHome:delegate:]([HUNetworkRouterSettingsItemManager alloc], "initWithHome:delegate:", v4, self);

  v9.receiver = self;
  v9.super_class = (Class)HUNetworkRouterSettingsViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v9, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    HULocalizedWiFiString(CFSTR("HUNetworkRouterSettingsTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNetworkRouterSettingsViewController setTitle:](v6, "setTitle:", v7);

  }
  return v6;
}

- (id)presentNetworkConfigurationSettingsForProfile:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__HUNetworkRouterSettingsViewController_presentNetworkConfigurationSettingsForProfile_animated___block_invoke;
  v11[3] = &unk_1E6F4C990;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __96__HUNetworkRouterSettingsViewController_presentNetworkConfigurationSettingsForProfile_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkConfigurationItemListModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkConfigurationGroupItemForProfile:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "networkConfigurationItemListModuleController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentNetworkConfigurationSettingsForItem:animated:", v4, *(unsigned __int8 *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)presentNetworkRouterSettingsForAccessory:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForAccessory_animated___block_invoke;
  v11[3] = &unk_1E6F4C990;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __91__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForAccessory_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkRouterServiceItemForAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "presentNetworkRouterSettingsForItem:animated:", v3, *(unsigned __int8 *)(a1 + 48));
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)presentNetworkRouterSettingsForItem:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForItem_animated___block_invoke;
  v11[3] = &unk_1E6F4C990;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __86__HUNetworkRouterSettingsViewController_presentNetworkRouterSettingsForItem_animated___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isItemNetworkRouterServiceItem:", *(_QWORD *)(a1 + 40));

  if (!v3)
    goto LABEL_6;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldShowNetworkRouterDetails") & 1) == 0)
    NSLog(CFSTR("Attempting to display router details when unavailable"));
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldShowNetworkRouterDetails"))
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "_networkRouterDetailsViewControllerClass")), "initWithServiceLikeItem:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "setPresentationDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v4, *(unsigned __int8 *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  HUNetworkConfigurationItemListModuleController *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "networkConfigurationItemListModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    v9 = -[HUNetworkConfigurationItemListModuleController initWithModule:]([HUNetworkConfigurationItemListModuleController alloc], "initWithModule:", v5);
    -[HUNetworkRouterSettingsViewController setNetworkConfigurationItemListModuleController:](self, "setNetworkConfigurationItemListModuleController:", v9);

    -[HUNetworkRouterSettingsViewController networkConfigurationItemListModuleController](self, "networkConfigurationItemListModuleController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterSettingsViewController.m"), 100, CFSTR("Unexpected module %@"), v5);

    v10 = 0;
  }

  return v10;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemNetworkRouterServiceItem:", v6);

  if (v8
    || (-[HUItemTableViewController itemManager](self, "itemManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "homeProtectionItem"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v6, "isEqual:", v10),
        v10,
        v9,
        v11))
  {
    objc_opt_class();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterSettingsViewController.m"), 110, CFSTR("Couldn't find a cell class for item: %@"), v6);

    v12 = 0;
  }

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUNetworkRouterSettingsViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v16, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isItemNetworkRouterServiceItem:", v9);

  if (v11)
  {
    v12 = v8;
    objc_msgSend(v12, "setAccessoryType:", -[HUNetworkRouterSettingsViewController _shouldShowNetworkRouterDetails](self, "_shouldShowNetworkRouterDetails"));
    objc_msgSend(v12, "setHideIcon:", 1);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeProtectionItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "isEqual:", v14);

    if (v15)
      objc_msgSend(v8, "setDelegate:", self);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUNetworkRouterSettingsViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v18, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeProtectionItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v11, "isEqual:", v13);

  if ((_DWORD)self)
  {
    v14 = v10;
    objc_msgSend(v11, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue") == 2;

    objc_msgSend(v14, "setOn:animated:", v17, 1);
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned __int8 v12;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isItemNetworkRouterServiceItem:", v9);

  if (v11)
  {
    v12 = -[HUNetworkRouterSettingsViewController _shouldShowNetworkRouterDetails](self, "_shouldShowNetworkRouterDetails");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HUNetworkRouterSettingsViewController;
    v12 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v15, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }
  v13 = v12;

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUNetworkRouterSettingsViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isItemNetworkRouterServiceItem:", v9);

  if (v11)
  {
    objc_opt_class();
    v12 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = -[HUNetworkRouterSettingsViewController presentNetworkRouterSettingsForItem:animated:](self, "presentNetworkRouterSettingsForItem:animated:", v14, 1);
  }
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  HUNetworkRouterSettingsViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUNetworkRouterSettingsViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", self);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[HUNetworkRouterSettingsViewController navigationController](self, "navigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNetworkRouterSettingsViewController navigationController](self, "navigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "viewControllers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = self;
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v25;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@ not in %@ navigation stack: %@", (uint8_t *)&v26, 0x20u);

    }
    v9 = 0;
    v11 = 0;
  }
  else if (v9 <= 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = v9 - 1;
  }
  v12 = v6;
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF2578B8))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = objc_msgSend(v14, "requiresPresentingViewControllerDismissal");
  if (v15)
    v9 = v11;
  -[HUNetworkRouterSettingsViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNetworkRouterSettingsViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewControllers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndex:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v16, "popToViewController:animated:", v19, v4);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;

  v4 = a4;
  v7 = a3;
  -[HUNetworkRouterSettingsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeProtectionItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_updateNetworkProtection:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__HUNetworkRouterSettingsViewController_switchCell_didTurnOn___block_invoke;
    v20[3] = &unk_1E6F52A58;
    v21 = v7;
    v22 = v4;
    v18 = (id)objc_msgSend(v17, "addFailureBlock:", v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterSettingsViewController.m"), 202, CFSTR("Invalid item: %@"), v11);

  }
}

uint64_t __62__HUNetworkRouterSettingsViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

- (BOOL)_shouldShowNetworkRouterDetails
{
  return -[HUNetworkRouterSettingsViewController _networkRouterDetailsViewControllerClass](self, "_networkRouterDetailsViewControllerClass") != 0;
}

- (Class)_networkRouterDetailsViewControllerClass
{
  void *v2;
  void *v3;

  +[HUViewControllerRegistry sharedInstance](HUViewControllerRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerClassForIdentifier:", CFSTR("serviceLikeItemDetails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (HUNetworkConfigurationItemListModuleController)networkConfigurationItemListModuleController
{
  return self->_networkConfigurationItemListModuleController;
}

- (void)setNetworkConfigurationItemListModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationItemListModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationItemListModuleController, 0);
}

@end
