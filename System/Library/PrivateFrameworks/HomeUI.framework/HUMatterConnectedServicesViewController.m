@implementation HUMatterConnectedServicesViewController

- (HUMatterConnectedServicesViewController)initWithConnectedServicesItemProvider:(id)a3
{
  id v4;
  HUMatterConnectedServicesItemManager *v5;
  HUMatterConnectedServicesViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[HUMatterConnectedServicesItemManager initWithConnectedServicesItemProvider:delegate:]([HUMatterConnectedServicesItemManager alloc], "initWithConnectedServicesItemProvider:delegate:", v4, self);

  v9.receiver = self;
  v9.super_class = (Class)HUMatterConnectedServicesViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v9, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUMatterConnectedServicesTitle"), CFSTR("HUMatterConnectedServicesTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMatterConnectedServicesViewController setTitle:](v6, "setTitle:", v7);

  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HUItemTableSectionHeaderFooterView *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedFooterTitleForSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footerReuseIdentifier"));
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:]([HUItemTableSectionHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("footerReuseIdentifier"));
    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textDragInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", 1);

    -[HUItemTableSectionHeaderFooterView setType:](v9, "setType:", 1);
    -[HUItemTableSectionHeaderFooterView setMessage:](v9, "setMessage:", v8);
    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUMatterConnectedServicesViewController;
    -[HUItemTableViewController tableView:viewForFooterInSection:](&v13, sel_tableView_viewForFooterInSection_, v6, a4);
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v12;
  HUMatterConnectedServicesViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "openSensitiveURL:", v7);

  return 0;
}

- (BOOL)needsToWaitForPreload
{
  return 1;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HUMatterConnectedServicesViewController;
  -[HUItemTableViewController hu_preloadContent](&v11, sel_hu_preloadContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSystemCommissionerPairingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = v3;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combineAllFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatMap:", &__block_literal_global_285);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __60__HUMatterConnectedServicesViewController_hu_preloadContent__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;
  objc_class *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  v5 = (objc_class *)(id)objc_opt_class();

  return v5;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUMatterConnectedServicesViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v12, sel_setupCell_forItem_indexPath_, v8, a4, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "setButtonColorFollowsTintColor:", 1);
    objc_msgSend(v9, "setHideIcon:", 1);
    objc_msgSend(v9, "setDelegate:", self);
    v10 = 0;
LABEL_5:
    objc_msgSend(v8, "setAccessoryType:", v10);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    v10 = 1;
    objc_msgSend(v11, "setValueColorFollowsTintColor:", 1);
    objc_msgSend(v11, "setHideIcon:", 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUMatterConnectedServicesViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v13.receiver, v13.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    -[HUMatterConnectedServicesViewController _presentHomeConnectedEcosystemDetailViewController:](self, "_presentHomeConnectedEcosystemDetailViewController:", v12);

}

- (void)_presentRemoveFromEcosystemConfirmation:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HULocalizedStringWithFormat(CFSTR("HUEcosystemRemovalActionConfirmationTitle"), CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUEcosystemRemovalAction"), CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v16, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CEA2E0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __95__HUMatterConnectedServicesViewController__presentRemoveFromEcosystemConfirmation_atIndexPath___block_invoke;
  v32[3] = &unk_1E6F526A0;
  v32[4] = self;
  v33 = v6;
  v34 = v7;
  v26 = v7;
  v27 = v6;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v23, 2, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v28);
  v29 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addAction:", v31);
  objc_msgSend(v24, "setPreferredAction:", v31);
  -[HUMatterConnectedServicesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);

}

void __95__HUMatterConnectedServicesViewController__presentRemoveFromEcosystemConfirmation_atIndexPath___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "chipAccessoryPairings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__HUMatterConnectedServicesViewController__presentRemoveFromEcosystemConfirmation_atIndexPath___block_invoke_2;
  v7[3] = &unk_1E6F56310;
  v5 = a1[5];
  v6 = a1[4];
  v8 = v5;
  v9 = v6;
  v10 = a1[6];
  objc_msgSend(v3, "removeCHIPPairings:completion:", v4, v7);

}

void __95__HUMatterConnectedServicesViewController__presentRemoveFromEcosystemConfirmation_atIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
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
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "chipAccessoryPairings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "failed to remove accessory pairings: %@, error: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleError:", v3);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "chipAccessoryPairings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Removed accessory pairings: %@, error: %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedItemAtIndexPath:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadUIRepresentationForItems:withAnimation:", v11, 1);

    objc_msgSend(*(id *)(a1 + 32), "chipAccessoryPairings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v12, "na_any:", &__block_literal_global_48_1);

    if ((_DWORD)v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didRemoveCHIPPairingforAccessory:", v15);

    }
  }

}

uint64_t __95__HUMatterConnectedServicesViewController__presentRemoveFromEcosystemConfirmation_atIndexPath___block_invoke_46(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ecosystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleVendor");

  return v5;
}

- (void)_presentHomeConnectedEcosystemDetailViewController:(id)a3
{
  id v4;
  HUMatterConnectedEcosystemDetailViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HUMatterConnectedEcosystemDetailViewController *v11;

  v4 = a3;
  v5 = [HUMatterConnectedEcosystemDetailViewController alloc];
  objc_msgSend(v4, "connectedEcosystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectedHomeEcosystemItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUMatterConnectedEcosystemDetailViewController initWithConnectedEcosystem:connectedEcosystemItemProvider:](v5, "initWithConnectedEcosystem:connectedEcosystemItemProvider:", v6, v8);

  -[HUMatterConnectedServicesViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "hu_pushPreloadableViewController:animated:", v11, 1);

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  void *v4;
  id v5;

  -[HUMatterConnectedServicesViewController navigationController](self, "navigationController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)buttonTappedForCell:(id)a3 withItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  int v13;
  HUMatterConnectedServicesViewController *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@ Invalid connected home item: %@ at indexPath: %@", (uint8_t *)&v13, 0x20u);
    }

  }
  else
  {
    -[HUMatterConnectedServicesViewController _presentRemoveFromEcosystemConfirmation:atIndexPath:](self, "_presentRemoveFromEcosystemConfirmation:atIndexPath:", v10, v7);
  }

}

- (HUMatterConnectedServicesViewControllerDelegate)delegate
{
  return (HUMatterConnectedServicesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
