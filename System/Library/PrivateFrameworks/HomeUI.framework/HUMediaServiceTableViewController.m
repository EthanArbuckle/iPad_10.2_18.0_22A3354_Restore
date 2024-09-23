@implementation HUMediaServiceTableViewController

- (HUMediaServiceTableViewController)initWithItem:(id)a3 mediaServiceItem:(id)a4
{
  id v6;
  id v7;
  HUMediaServiceItemManager *v8;
  void *v9;
  void *v10;
  HUMediaServiceItemManager *v11;
  HUMediaServiceTableViewController *v12;
  uint64_t v13;
  HFUserItem *userItem;
  uint64_t v15;
  HUMediaServiceItem *mediaServiceItem;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = [HUMediaServiceItemManager alloc];
  objc_msgSend(v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "copy");
  v11 = -[HUMediaServiceItemManager initWithHome:mediaServiceItem:delegate:](v8, "initWithHome:mediaServiceItem:delegate:", v9, v10, self);

  v18.receiver = self;
  v18.super_class = (Class)HUMediaServiceTableViewController;
  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v18, sel_initWithItemManager_tableViewStyle_, v11, 1);
  if (v12)
  {
    v13 = objc_msgSend(v6, "copy");
    userItem = v12->_userItem;
    v12->_userItem = (HFUserItem *)v13;

    v15 = objc_msgSend(v7, "copy");
    mediaServiceItem = v12->_mediaServiceItem;
    v12->_mediaServiceItem = (HUMediaServiceItem *)v15;

    objc_storeStrong((id *)&v12->_mediaServiceItemManager, v11);
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUMediaServiceTableViewController;
  -[HUItemTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[HUMediaServiceTableViewController mediaServiceItem](self, "mediaServiceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaServiceTableViewController setTitle:](self, "setTitle:", v5);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaServiceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
    goto LABEL_7;
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateListeningHistoryItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqual:", v12);

  if (v13)
    goto LABEL_7;
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateListeningHistoryFooterItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "isEqual:", v15);

  if (v16)
    goto LABEL_7;
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "isEqual:", v18);

  if (v19)
    goto LABEL_7;
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reconnectItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "isEqual:", v21);

  if (v22
    || (-[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v23, "reconnectTitleItem"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v6, "isEqual:", v24),
        v24,
        v23,
        v25))
  {
LABEL_7:
    objc_opt_class();
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)HUMediaServiceTableViewController;
    -[HUItemTableViewController cellClassForItem:indexPath:](&v29, sel_cellClassForItem_indexPath_, v6, v7);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v26;

  return (Class)v27;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HUMediaServiceTableViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v31, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateListeningHistoryItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = v8;
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setSelectionStyle:", 0);

  }
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
  {
    v17 = v8;
    objc_msgSend(v17, "setDestructive:", 1);
    objc_msgSend(v17, "setUseFullWidthSeparator:", 0);

  }
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reconnectItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v9, "isEqual:", v19);

  if (v20)
  {
    v21 = v8;
    objc_msgSend(v21, "setTitleColorFollowsTintColor:", 1);
    objc_msgSend(v21, "setHideIcon:", 1);

  }
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reconnectTitleItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v9, "isEqual:", v23);

  if (v24)
  {
    v25 = v8;
    objc_msgSend(v9, "latestResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v27);

    objc_msgSend(v25, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v30);

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUMediaServiceTableViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v26, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateListeningHistoryItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
  {
    -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaServiceItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "mediaService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "updateListeningHistoryEnabled");

    objc_msgSend(v10, "setOn:animated:", v18, 1);
  }
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v11, "isEqual:", v20);

  if (v21)
  {
    v22 = v10;
    objc_msgSend(v11, "latestResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setText:", v24);
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
  v14.super_class = (Class)HUMediaServiceTableViewController;
  LOBYTE(v8) = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v14, sel_shouldHideSeparatorsForCell_indexPath_, v7, v6);

  if ((v8 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateListeningHistoryItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v12);

  }
  return v10;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUMediaServiceUpdateListeningHistoryFooterSectionIdentifier"));

  return v6;
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

  v7 = 0.01;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HUMediaServiceUpdateListeningHistorySectionIdentifier")) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("HUMediaServiceReconnectServiceTitleSectionIdentifier")) & 1) == 0)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("HUMediaServiceAccountInfoSectionIdentifier")))
      v7 = 10.0;
    else
      v7 = *MEMORY[0x1E0CEBC10];
  }

  return v7;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HUMediaServiceUpdateListeningHistorySectionIdentifier")) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUMediaServiceUpdateListeningHistoryFooterSectionIdentifier"));

  return v6;
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  objc_super v46;

  v6 = a4;
  v46.receiver = self;
  v46.super_class = (Class)HUMediaServiceTableViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v46, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    -[HUMediaServiceTableViewController mediaServiceItem](self, "mediaServiceItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUMediaServiceTableViewController mediaServiceItem](self, "mediaServiceItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    HULocalizedStringWithFormat(CFSTR("HUMediaServiceRemoveServiceAlertTitle"), CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUMediaServiceRemoveServiceAlertConfirmationMessage"), CFSTR("%@%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v23, v44, v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v30, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addAction:", v33);

    v34 = v43;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __71__HUMediaServiceTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v45[3] = &unk_1E6F4C6E0;
    v45[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v31, 2, v45);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addAction:", v35);

    -[HUMediaServiceTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v32, 1, 0);
LABEL_5:

    goto LABEL_6;
  }
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "reconnectItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v9, "isEqual:", v37);

  if (v38)
  {
    -[HUMediaServiceTableViewController mediaServiceItem](self, "mediaServiceItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "mediaService");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "hf_appStoreURLForBundleIdentifier:", v34);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (id)objc_msgSend(v23, "openURL:", v16);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __71__HUMediaServiceTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeService");
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUMediaServiceTableViewController;
  -[HUItemTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v10, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v8, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

  }
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HUAccessorySettingsItemModuleController *v7;
  void *v8;
  HUAccessorySettingsItemModuleController *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[HUMediaServiceTableViewController userSettingsItemModuleController](self, "userSettingsItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userSettingsItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HUAccessorySettingsItemModuleController alloc];
    -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userSettingsItemModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUAccessorySettingsItemModuleController initWithModule:delegate:](v7, "initWithModule:delegate:", v8, self);
    -[HUMediaServiceTableViewController setUserSettingsItemModuleController:](self, "setUserSettingsItemModuleController:", v9);

LABEL_4:
  }
  -[HUMediaServiceTableViewController userSettingsItemModuleController](self, "userSettingsItemModuleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v10);

  return v3;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  BOOL v25;

  v4 = a4;
  v6 = a3;
  -[HUMediaServiceTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateListeningHistoryItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (v13)
  {
    -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaServiceItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_safeSetObject:forKey:", v17, &unk_1E7041DA0);

    objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateProperty:forHome:withOptions:", v19, v20, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke;
    v23[3] = &unk_1E6F52A58;
    v24 = v6;
    v25 = v4;
    v22 = (id)objc_msgSend(v21, "addFailureBlock:", v23);

  }
}

void __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke_2;
  block[3] = &unk_1E6F5D338;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__HUMediaServiceTableViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleError:", *(_QWORD *)(a1 + 32));

  }
  return objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
}

- (void)moduleController:(id)a3 presentGroup:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  objc_msgSend(v15, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30C80];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v15, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  +[HUAccessorySettingsDetailsViewControllerFactory viewControllerForGroup:](HUAccessorySettingsDetailsViewControllerFactory, "viewControllerForGroup:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceTableViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v12, 1);

LABEL_6:
}

- (id)moduleController:(id)a3 requestPresentViewController:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__HUMediaServiceTableViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke;
  v12[3] = &unk_1E6F4D988;
  v10 = v9;
  v13 = v10;
  -[HUMediaServiceTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, v6, v12);

  return v10;
}

uint64_t __107__HUMediaServiceTableViewController_moduleController_requestPresentViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (void)moduleController:(id)a3 preflightCheckToAllowSwitchingForSettingItem:(id)a4 changingToOn:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  HUMediaServiceTableViewController *v44;
  id v45;
  SEL v46;
  id location[4];

  v7 = a5;
  location[2] = *(id *)MEMORY[0x1E0C80C00];
  v38 = a3;
  v11 = a4;
  v12 = a6;
  if (!v11)
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ called with no settingItem"), v13);

  }
  objc_msgSend(v11, "settingKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D30730]);

  if (v15)
    v16 = !v7;
  else
    v16 = 1;
  if (!v16)
  {
    -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "userSettingsItemModule");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessorySettingsItemProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "homeKitSettingsVendor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "settings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30750]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 67109120;
      HIDWORD(location[0]) = v23;
      _os_log_debug_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEBUG, "isVoiceIDSetup = %{BOOL}d", (uint8_t *)location, 8u);
    }

    if ((v23 & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Title"), CFSTR("HUPlaybackInfluencesActivation_Alert_Title"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Description"), CFSTR("HUPlaybackInfluencesActivation_Alert_Description"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v26, v27, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Action_NotNow"), CFSTR("HUPlaybackInfluencesActivation_Alert_Action_NotNow"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke;
      v42[3] = &unk_1E6F553D0;
      v43 = v21;
      v44 = self;
      v46 = a2;
      v32 = v12;
      v45 = v32;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, v42);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(location, self);
      v34 = (void *)MEMORY[0x1E0CEA2E0];
      _HULocalizedStringWithDefaultValue(CFSTR("HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice"), CFSTR("HUPlaybackInfluencesActivation_Alert_Action_IdentifyVoice"), 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v31;
      v39[1] = 3221225472;
      v39[2] = __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_61;
      v39[3] = &unk_1E6F553F8;
      objc_copyWeak(&v41, location);
      v40 = v32;
      objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, v39);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "addAction:", v33);
      objc_msgSend(v28, "addAction:", v36);
      -[HUMediaServiceTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v28, 1, 0);

      objc_destroyWeak(&v41);
      objc_destroyWeak(location);

    }
  }
  (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

}

void __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  id location[2];

  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(location[0]) = 0;
    _os_log_debug_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEBUG, "User tapped Not Now Action", (uint8_t *)location, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30730]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, *(id *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_56;
  v7[3] = &unk_1E6F553A8;
  v6 = v5;
  v8 = v6;
  objc_copyWeak(v9, location);
  v9[1] = *(id *)(a1 + 56);
  objc_msgSend(v6, "updateValue:completionHandler:", MEMORY[0x1E0C9AAA0], v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_destroyWeak(v9);

  objc_destroyWeak(location);
}

void __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  NSObject *WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject mediaServiceItemManager](WeakRetained, "mediaServiceItemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sectionIndexForDisplayedSectionIdentifier:", *MEMORY[0x1E0D30728]);

    -[NSObject itemManager](WeakRetained, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 48));

    -[NSObject itemManager](WeakRetained, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "diffableDataSourceDisabled");

    if ((_DWORD)v8)
    {
      -[NSObject tableView](WeakRetained, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 5);
    }
    else
    {
      -[NSObject itemManager](WeakRetained, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemSectionForSectionIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[NSObject itemManager](WeakRetained, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadUIRepresentationForSections:withAnimation:", v14, 0);

    }
    goto LABEL_9;
  }
  HFLogForCategory();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Error [%@] setting value for setting [%@] to NO", buf, 0x16u);
  }
LABEL_10:

}

void __127__HUMediaServiceTableViewController_moduleController_preflightCheckToAllowSwitchingForSettingItem_changingToOn_withCompletion___block_invoke_61(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[8];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEBUG, "User tapped Identify Voice Action", v9, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "mediaServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("OnboardingDisplayOption_OnboardingFromUserInput");
  v11[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardIdentifyVoiceFromPresentingViewController:usageOptions:", v6, WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);

}

- (BOOL)moduleController:(id)a3 shouldDisableItem:(id)a4
{
  void *v5;
  id v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0D319D0];
  v6 = a4;
  v7 = objc_msgSend(v5, "isAMac");
  objc_msgSend(v6, "settingKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30730]);
  if (!v7)
  {
    if (v9)
    {
      -[HUMediaServiceTableViewController userItem](self, "userItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "user");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaServiceTableViewController userItem](self, "userItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentUser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqual:", v15) ^ 1;

      return v10;
    }
LABEL_6:
    LOBYTE(v10) = 0;
    return v10;
  }
  if ((v9 & 1) == 0)
    goto LABEL_6;
  LOBYTE(v10) = 1;
  return v10;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  HUMediaServiceTableViewController *v15;
  HUMediaServiceTableViewController *v16;
  void *v17;
  void *v18;
  id v19;
  int v21;
  HUMediaServiceTableViewController *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v21, 0x16u);
  }

  objc_msgSend(v7, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    -[HUMediaServiceTableViewController navigationController](self, "navigationController");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (HUMediaServiceTableViewController *)v13;
    else
      v15 = self;
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "splashController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDisplayDeviceType:", 6);

    objc_msgSend(v17, "setPresentingViewController:", v16);
    objc_msgSend(v17, "present");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v17, "openURL:", v7);
  }

  return 0;
}

- (void)_removeService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  HUMediaServiceTableViewController *v19;

  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceTableViewController mediaServiceItemManager](self, "mediaServiceItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaServiceTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceTableViewController mediaServiceItem](self, "mediaServiceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceTableViewController mediaServiceItem](self, "mediaServiceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeMediaService:forHome:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setShowSpinner:", 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__HUMediaServiceTableViewController__removeService__block_invoke;
  v17[3] = &unk_1E6F4C0D8;
  v18 = v8;
  v19 = self;
  v15 = v8;
  v16 = (id)objc_msgSend(v14, "addCompletionBlock:", v17);

}

void __51__HUMediaServiceTableViewController__removeService__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HUMediaServiceTableViewController__removeService__block_invoke_2;
  block[3] = &unk_1E6F4E020;
  v9 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__HUMediaServiceTableViewController__removeService__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setShowSpinner:", 0);
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);
  }

}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HUMediaServiceItem)mediaServiceItem
{
  return self->_mediaServiceItem;
}

- (HUMediaServiceItemManager)mediaServiceItemManager
{
  return self->_mediaServiceItemManager;
}

- (HUAccessorySettingsItemModuleController)userSettingsItemModuleController
{
  return self->_userSettingsItemModuleController;
}

- (void)setUserSettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsItemModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_mediaServiceItemManager, 0);
  objc_storeStrong((id *)&self->_mediaServiceItem, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
