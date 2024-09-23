@implementation HUBridgeListViewController

- (HUBridgeListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUBridgeListViewController.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUBridgeListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUBridgeListViewController)initWithHome:(id)a3
{
  id v5;
  HUBridgeListItemManager *v6;
  HUBridgeListViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  objc_super v20;
  uint8_t buf[4];
  HUBridgeListViewController *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HUBridgeListItemManager initWithHome:delegate:]([HUBridgeListItemManager alloc], "initWithHome:delegate:", v5, self);
  v20.receiver = self;
  v20.super_class = (Class)HUBridgeListViewController;
  v7 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v20, sel_initWithItemManager_tableViewStyle_, v6, 1);
  if (v7)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUBridgeAndResidentListItemTitle"), CFSTR("HUBridgeAndResidentListItemTitle"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUBridgeListViewController setTitle:](v7, "setTitle:", v8);

    objc_msgSend(v5, "residentDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_filter:", &__block_literal_global_7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "count");
      v14 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138413314;
      v22 = v7;
      v23 = 2112;
      v24 = v12;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = v14;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Total residents: %lu - Reachable (%lu): %@", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "homeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasOptedToHH2");

    v18 = v17 && objc_msgSend(v9, "count") && objc_msgSend(v10, "count") == 0;
    v7->_shouldShowHomeHubWarningHeader = v18;

  }
  return v7;
}

uint64_t __43__HUBridgeListViewController_initWithHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

- (id)itemTableHeaderView
{
  void *v3;
  void *v4;
  HUHomeHubHeaderView *v5;
  void *v6;
  void *v7;

  if (-[HUBridgeListViewController shouldShowHomeHubWarningHeader](self, "shouldShowHomeHubWarningHeader"))
  {
    -[HUBridgeListViewController homehubHeaderView](self, "homehubHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      HULocalizedWiFiString(CFSTR("HUBridgeAndResidentListHomeHubWarningHeader"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HUHomeHubHeaderView initWithMessage:]([HUHomeHubHeaderView alloc], "initWithMessage:", v4);
      -[HUBridgeListViewController setHomehubHeaderView:](self, "setHomehubHeaderView:", v5);

      -[HUBridgeListViewController homehubHeaderView](self, "homehubHeaderView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutIfNeeded");

    }
    -[HUBridgeListViewController homehubHeaderView](self, "homehubHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUBridgeListViewController setHomehubHeaderView:](self, "setHomehubHeaderView:", 0);
    v7 = 0;
  }
  return v7;
}

- (id)presentBridgeSettingsForAccessory:(id)a3 animated:(BOOL)a4
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
  v11[2] = __73__HUBridgeListViewController_presentBridgeSettingsForAccessory_animated___block_invoke;
  v11[3] = &unk_1E6F4C990;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __73__HUBridgeListViewController_presentBridgeSettingsForAccessory_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bridgeItemForAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_presentBridgeSettingsForItem:animated:", v3, *(unsigned __int8 *)(a1 + 48));
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUBridgeListViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v15, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  v10 = v8;
  objc_msgSend(v10, "setIconDisplayStyle:", 1);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isBridgeItem:", v9);

  if (v12)
  {
    objc_msgSend(v10, "setAccessoryType:", -[HUBridgeListViewController _bridgeDetailsViewControllerClass](self, "_bridgeDetailsViewControllerClass") != 0);
    objc_msgSend(v10, "setHideValue:", 1);
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isResidentDeviceItem:", v9);

    if (v14)
      objc_msgSend(v10, "setHideIcon:", 1);
  }

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "displayedSectionIdentifierForSectionIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isEqualToString:", CFSTR("HUBridgeAndResidentDeviceBridgeSectionIdentifier"));

  return (_DWORD)v7
      && -[HUBridgeListViewController _bridgeDetailsViewControllerClass](self, "_bridgeDetailsViewControllerClass") != 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUBridgeListViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v11, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HUBridgeListViewController _presentBridgeSettingsForItem:animated:](self, "_presentBridgeSettingsForItem:animated:", v9, 1);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (Class)_bridgeDetailsViewControllerClass
{
  void *v2;
  void *v3;

  +[HUViewControllerRegistry sharedInstance](HUViewControllerRegistry, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerClassForIdentifier:", CFSTR("serviceLikeItemDetails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)_presentBridgeSettingsForItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBridgeItem:", v6);

  if (!v8)
    goto LABEL_12;
  v9 = &unk_1EF2AC470;
  v10 = v6;
  v11 = v10;
  if (!v10)
    goto LABEL_8;
  if (objc_msgSend(v10, "conformsToProtocol:", v9))
    v12 = v11;
  else
    v12 = 0;
  v13 = v11;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v16);

LABEL_8:
    v13 = 0;
  }

  if (!-[HUBridgeListViewController _bridgeDetailsViewControllerClass](self, "_bridgeDetailsViewControllerClass"))
  {

LABEL_12:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v17 = (void *)objc_msgSend(objc_alloc(-[HUBridgeListViewController _bridgeDetailsViewControllerClass](self, "_bridgeDetailsViewControllerClass")), "initWithServiceLikeItem:", v13);
  objc_msgSend(v17, "setPresentationDelegate:", self);
  -[HUBridgeListViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hu_pushPreloadableViewController:animated:", v17, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v19;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  void *v4;
  id v5;

  -[HUBridgeListViewController navigationController](self, "navigationController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (HUHomeHubHeaderView)homehubHeaderView
{
  return self->_homehubHeaderView;
}

- (void)setHomehubHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_homehubHeaderView, a3);
}

- (BOOL)shouldShowHomeHubWarningHeader
{
  return self->_shouldShowHomeHubWarningHeader;
}

- (void)setShouldShowHomeHubWarningHeader:(BOOL)a3
{
  self->_shouldShowHomeHubWarningHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homehubHeaderView, 0);
}

@end
