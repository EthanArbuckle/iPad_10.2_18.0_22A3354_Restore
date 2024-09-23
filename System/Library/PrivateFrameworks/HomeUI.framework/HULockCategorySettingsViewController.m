@implementation HULockCategorySettingsViewController

- (HULockCategorySettingsViewController)initWithLockTopic:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  HULockCategorySettingsItemManager *v11;
  void *v12;
  void *v13;
  void *v14;
  HULockCategorySettingsViewController *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "serviceTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0CB9A80]);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Error: this view controller is only intended for Lock services"));
  v11 = -[HULockCategorySettingsItemManager initWithDelegate:topic:home:]([HULockCategorySettingsItemManager alloc], "initWithDelegate:topic:home:", 0, v7, v8);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "setHeaderMode:", 1);
  objc_msgSend(v12, "setFooterMode:", 1);
  objc_msgSend(MEMORY[0x1E0CEA428], "layoutWithListConfiguration:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HULockCategorySettingsViewController;
  v15 = -[HUItemCollectionViewController initWithItemManager:collectionViewLayout:](&v18, sel_initWithItemManager_collectionViewLayout_, v11, v14);
  if (v15)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULockCategorySettingsViewControllerTitle"), CFSTR("HULockCategorySettingsViewControllerTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockCategorySettingsViewController setTitle:](v15, "setTitle:", v16);

    objc_storeStrong((id *)&v15->_lockSettingsItemManager, v11);
    objc_storeStrong((id *)&v15->_topic, a3);
  }

  return v15;
}

- (HULockCategorySettingsViewController)initWithLockTopic:(id)a3 pinCodeManager:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  HULockCategorySettingsItemManager *v12;
  void *v13;
  void *v14;
  void *v15;
  HULockCategorySettingsItemManager *v16;
  void *v17;
  HULockCategorySettingsViewController *v18;
  void *v19;
  id obj;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  HULockCategorySettingsItemManager *v25;
  id v26;
  id location;

  v9 = a3;
  obj = a4;
  v10 = a4;
  v11 = a5;
  v22 = v10;
  v12 = -[HULockCategorySettingsItemManager initWithDelegate:topic:pinCodeManager:home:]([HULockCategorySettingsItemManager alloc], "initWithDelegate:topic:pinCodeManager:home:", 0, v9, v10, v11);
  objc_msgSend(v9, "serviceTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0CB9A80]);

  if ((v10 & 1) == 0)
    NSLog(CFSTR("Error: this view controller is only intended for Lock services"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  objc_msgSend(v14, "setHeaderMode:", 1);
  objc_msgSend(v14, "setFooterMode:", 1);
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __78__HULockCategorySettingsViewController_initWithLockTopic_pinCodeManager_home___block_invoke;
  v24[3] = &unk_1E6F53198;
  objc_copyWeak(&v26, &location);
  v16 = v12;
  v25 = v16;
  objc_msgSend(v14, "setItemSeparatorHandler:", v24);
  objc_msgSend(MEMORY[0x1E0CEA428], "layoutWithListConfiguration:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)HULockCategorySettingsViewController;
  v18 = -[HUItemCollectionViewController initWithItemManager:collectionViewLayout:](&v23, sel_initWithItemManager_collectionViewLayout_, v16, v17);
  if (v18)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULockCategorySettingsViewControllerTitle"), CFSTR("HULockCategorySettingsViewControllerTitle"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULockCategorySettingsViewController setTitle:](v18, "setTitle:", v19);

    objc_storeStrong((id *)&v18->_lockSettingsItemManager, v12);
    objc_storeStrong((id *)&v18->_topic, a3);
    objc_storeStrong((id *)&v18->_pinCodeManager, obj);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v18;
}

id __78__HULockCategorySettingsViewController_initWithLockTopic_pinCodeManager_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_msgSend(v5, "section");
  if (v8 == objc_msgSend(*(id *)(a1 + 32), "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HULockCategorySettingsPeopleSection")))
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "avatarContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");

    objc_msgSend(v13, "listContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v13, "listContentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v26, v19, v21, v23, v25);
    v28 = v27;
    v30 = v29;

    if (v15 == 1)
    {
      objc_msgSend(v12, "bounds");
      v28 = v31 - (v28 + v30);
    }
    objc_msgSend(v6, "setBottomSeparatorInsets:", 0.0, v28, 0.0, 0.0);

  }
  return v6;
}

- (HULockCategorySettingsViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithLockTopic_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULockCategorySettingsViewController.m"), 96, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULockCategorySettingsViewController initWithItemManager:collectionViewLayout:]",
    v7);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containsObject:", v5);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HULockCategorySettingsViewController;
  -[HUItemCollectionViewController configureCell:forItem:](&v41, sel_configureCell_forItem_, v6, v7);
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CEA3E8]);
  v42[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessories:", v13);

  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userItemProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v7);

  if (v17)
  {
    objc_opt_class();
    v18 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    objc_msgSend(v20, "setShowAccessLevelDescription:", 1);
    objc_msgSend(v7, "latestResults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v20, "setUserHandle:", v22);

    goto LABEL_13;
  }
  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "guestsItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v7, "isEqual:", v24);

  if (v25)
  {
    objc_msgSend(v7, "latestResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v27);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProperties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTintColor:", v28);

    v30 = *MEMORY[0x1E0CEB990];
    objc_msgSend(v11, "imageProperties");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setReservedLayoutSize:", 37.0, v30);
LABEL_13:

    goto LABEL_14;
  }
  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lockServiceItemProvider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "items");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "containsObject:", v7);

  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("lock.fill"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v35);

    objc_msgSend(MEMORY[0x1E0D31130], "securityAccessoryTypeGroup");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hu_tintColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProperties");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTintColor:", v37);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageProperties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPreferredSymbolConfiguration:", v39);

    objc_msgSend(v11, "setSecondaryText:", 0);
  }
LABEL_14:
  objc_msgSend(v10, "setContentConfiguration:", v11);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  HUGuestsPinCodesViewController *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  HUGuestsPinCodesViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  HUGuestsPinCodesViewController *v43;
  id v44;
  id v45;
  id location;
  objc_super v47;

  v6 = a3;
  v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)HULockCategorySettingsViewController;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v47, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v9);

  if (v13)
  {
    objc_opt_class();
    v14 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v16, "user");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    -[HULockCategorySettingsViewController pinCodeManager](self, "pinCodeManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userPinCodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v41[3] = &unk_1E6F531E8;
    objc_copyWeak(&v45, &location);
    v22 = v17;
    v42 = v22;
    v23 = (HUGuestsPinCodesViewController *)v16;
    v43 = v23;
    v24 = v19;
    v44 = v24;
    v25 = (id)objc_msgSend(v21, "addSuccessBlock:", v41);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

    goto LABEL_14;
  }
  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "guestsItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v9, "isEqual:", v27);

  if (v28)
  {
    v29 = [HUGuestsPinCodesViewController alloc];
    -[HULockCategorySettingsViewController pinCodeManager](self, "pinCodeManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HUGuestsPinCodesViewController initWithPinCodeManager:settingsContext:](v29, "initWithPinCodeManager:settingsContext:", v30, 1);
LABEL_13:

    -[HULockCategorySettingsViewController navigationController](self, "navigationController");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend(v22, "hu_pushPreloadableViewController:animated:", v23, 1);
LABEL_14:

    goto LABEL_15;
  }
  -[HULockCategorySettingsViewController lockSettingsItemManager](self, "lockSettingsItemManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lockServiceItemProvider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "items");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "containsObject:", v9);

  if (v34)
  {
    v35 = v9;
    v36 = &unk_1EF2AC470;
    if (objc_msgSend(v35, "conformsToProtocol:", v36))
      v37 = v35;
    else
      v37 = 0;
    v38 = v37;

    -[HULockCategorySettingsViewController navigationController](self, "navigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUAccessoryDetailsRouter detailsViewFor:navigationController:dismiss:](HUAccessoryDetailsRouter, "detailsViewFor:navigationController:dismiss:", v38, v30, 0);
    v23 = (HUGuestsPinCodesViewController *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_15:
  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHighlighted:", 0);

}

void __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  HUPinCodeDetailsViewController *v8;
  void *v9;
  HUPinCodeDetailsViewController *v10;
  void *v11;
  id v12;
  id WeakRetained;
  _QWORD v14[4];
  id v15;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v14[3] = &unk_1E6F531C0;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(id *)(a1 + 40);
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v5, *(_QWORD *)(a1 + 48), 0);

    v6 = (id)v7;
  }
  v8 = [HUPinCodeDetailsViewController alloc];
  objc_msgSend(WeakRetained, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:](v8, "initWithItem:pinCodeManager:home:", v6, v9, *(_QWORD *)(a1 + 48));

  objc_msgSend(WeakRetained, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "hu_pushPreloadableViewController:animated:", v10, 1);

}

uint64_t __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HULockCategorySettingsItemManager)lockSettingsItemManager
{
  return self->_lockSettingsItemManager;
}

- (void)setLockSettingsItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_lockSettingsItemManager, a3);
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_lockSettingsItemManager, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end
