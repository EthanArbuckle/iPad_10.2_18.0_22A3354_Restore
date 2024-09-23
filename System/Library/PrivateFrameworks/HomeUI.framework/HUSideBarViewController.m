@implementation HUSideBarViewController

- (HUSideBarViewController)initWithDelegate:(id)a3 forHome:(id)a4
{
  id v7;
  id v8;
  HUSideBarItemManager *v9;
  void *v10;
  HUSideBarViewController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = -[HUSideBarItemManager initWithDelegate:]([HUSideBarItemManager alloc], "initWithDelegate:", self);
  v10 = (void *)objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)HUSideBarViewController;
  v11 = -[HUItemCollectionViewController initWithItemManager:collectionViewLayout:](&v18, sel_initWithItemManager_collectionViewLayout_, v9, v10);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_sideBarDelegate, v7);
    -[HUItemCollectionViewController itemManager](v11, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

    objc_storeStrong((id *)&v11->_home, a4);
    objc_msgSend(v8, "accessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hideRoomSection = objc_msgSend(v14, "count") == 0;

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addHomeObserver:", v11);

    HFLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSideBarViewController setTitle:](v11, "setTitle:", v16);

  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSideBarViewController;
  -[HUItemCollectionViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUSideBarViewController _updateSplitViewSeparator](self, "_updateSplitViewSeparator");
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUSideBarViewController;
  -[HUItemCollectionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "refresh sidebar selection after view did appear", v5, 2u);
  }

  -[HUSideBarViewController refreshSideBarSelection](self, "refreshSideBarSelection");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  UIView *v22;
  UIView *blurView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)HUSideBarViewController;
  -[HUItemCollectionViewController viewDidLoad](&v30, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysBounceVertical:", 1);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDropDelegate:", self);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v9, v11);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = *MEMORY[0x1E0CEBF28];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v13, v14, v16);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSelectionFollowsFocus:", 1);

  v18 = objc_alloc(MEMORY[0x1E0CEA428]);
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __38__HUSideBarViewController_viewDidLoad__block_invoke;
  v29[3] = &unk_1E6F4D698;
  v29[4] = self;
  v20 = (void *)objc_msgSend(v18, "initWithSectionProvider:", v29);
  -[HUSideBarViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCollectionViewLayout:", v20);

  v22 = (UIView *)objc_opt_new();
  blurView = self->_blurView;
  self->_blurView = v22;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUSideBarViewController _updateBlurView](self, "_updateBlurView");
  -[HUSideBarViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_blurView);

  -[HUSideBarViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendSubviewToBack:", self->_blurView);

  v26 = (void *)MEMORY[0x1E0CB3718];
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __38__HUSideBarViewController_viewDidLoad__block_invoke_2;
  v28[3] = &unk_1E6F4D6C0;
  v28[4] = self;
  __38__HUSideBarViewController_viewDidLoad__block_invoke_2((uint64_t)v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v27);

}

id __38__HUSideBarViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACD0]), "initWithAppearanceStyle:layoutEnvironment:", 3, v5);
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleForSection:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    objc_msgSend(v6, "setSectionHeaderHeight:", *MEMORY[0x1E0CEBF30]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACC8]), "initWithConfiguration:layoutEnvironment:", v6, v5);

  return v9;
}

id __38__HUSideBarViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v17);

  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v22);

  return v2;
}

- (int64_t)preferredStatusBarStyle
{
  return -[HUSideBarViewController shouldUseDashboardEffects](self, "shouldUseDashboardEffects");
}

- (void)setHideRoomSection:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_hideRoomSection != a3)
  {
    v3 = a3;
    self->_hideRoomSection = a3;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

    if (v3)
    {
      -[HUSideBarViewController sideBarDelegate](self, "sideBarDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "switchToHomeForTabIdentifier:", *MEMORY[0x1E0D306D0]);

      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "homeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathForItem:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUSideBarViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v12, 0, 0);

      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(v12, "section");
        v16 = objc_msgSend(v12, "row");
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "homeItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = v15;
        v21 = 2048;
        v22 = v16;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "switch to home tab since room section should now be hidden, select sidebar section: %ld row: %ld for selected item: %@", (uint8_t *)&v19, 0x20u);

      }
    }
  }
}

- (void)updateSelectionToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUSideBarViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218498;
      v13 = objc_msgSend(v6, "section");
      v14 = 2048;
      v15 = objc_msgSend(v6, "row");
      v16 = 2112;
      v17 = v4;
      v9 = "select sidebar section: %ld row: %ld for selected item: %@";
      v10 = v8;
      v11 = 32;
LABEL_6:
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = (uint64_t)v4;
      v9 = "invalid indexPath for item: %@";
      v10 = v8;
      v11 = 12;
      goto LABEL_6;
    }
  }

}

- (void)switchToSelectedHome:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HUSideBarViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v10);

  if ((v5 & 1) == 0)
  {
    -[HUSideBarViewController setHome:](self, "setHome:", v10);
    objc_msgSend(v10, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      v7 = objc_msgSend(v10, "hf_shouldBlockCurrentUserFromHome");
    else
      v7 = 1;
    -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", v7);

    objc_msgSend(v10, "hf_reorderableRoomsList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReorderableRoomList:", v8);

  }
}

- (void)refreshSideBarSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSelectedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItem:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUSideBarViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUSideBarViewController;
  v6 = a4;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v7, sel_collectionView_didSelectItemAtIndexPath_, a3, v6);
  -[HUSideBarViewController _selectItemAtIndexPath:](self, "_selectItemAtIndexPath:", v6, v7.receiver, v7.super_class);

}

- (void)_selectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HUSideBarViewController sideBarDelegate](self, "sideBarDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "room");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "switchToRoom:", v11);

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "room");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 136315394;
      v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "(%s) user select room tab %@", (uint8_t *)&v33, 0x16u);

    }
  }
  objc_opt_class();
  v14 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    -[HUSideBarViewController sideBarDelegate](self, "sideBarDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryTypeGroup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "switchToAccessoryTypeGroup:", v18);

    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "accessoryTypeGroup");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 136315394;
      v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
      v35 = 2112;
      v36 = v20;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "(%s) user select accessory type group %@", (uint8_t *)&v33, 0x16u);

    }
  }
  objc_opt_class();
  v21 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  if (v23)
  {
    if (!objc_msgSend(v23, "type"))
    {
      -[HUSideBarViewController sideBarDelegate](self, "sideBarDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)*MEMORY[0x1E0D306D0];
      objc_msgSend(v24, "switchToHomeForTabIdentifier:", *MEMORY[0x1E0D306D0]);

      HFLogForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315394;
        v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
        v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "(%s) user select tab: %@", (uint8_t *)&v33, 0x16u);
      }

    }
    if (objc_msgSend(v23, "type") == 1)
    {
      -[HUSideBarViewController sideBarDelegate](self, "sideBarDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)*MEMORY[0x1E0D306D8];
      objc_msgSend(v27, "switchToHomeForTabIdentifier:", *MEMORY[0x1E0D306D8]);

      HFLogForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315394;
        v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
        v35 = 2112;
        v36 = v28;
        _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "(%s) user select tab: %@", (uint8_t *)&v33, 0x16u);
      }

    }
    if (objc_msgSend(v23, "type") == 2)
    {
      -[HUSideBarViewController sideBarDelegate](self, "sideBarDelegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)*MEMORY[0x1E0D306C8];
      objc_msgSend(v30, "switchToHomeForTabIdentifier:", *MEMORY[0x1E0D306C8]);

      HFLogForCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136315394;
        v34 = "-[HUSideBarViewController _selectItemAtIndexPath:]";
        v35 = 2112;
        v36 = v31;
        _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "(%s) user select tab: %@", (uint8_t *)&v33, 0x16u);
      }

    }
  }
  -[HUSideBarViewController _sendSideBarInteractionEventForItem:](self, "_sendSideBarInteractionEventForItem:", v21);

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  HUSideBarViewController *v22;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleForSection:", objc_msgSend(v8, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__HUSideBarViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  v20[3] = &unk_1E6F4D6E8;
  v21 = v12;
  v22 = self;
  v18 = v12;
  objc_msgSend(v17, "_setContentViewConfigurationProvider:", v20);

  return v17;
}

id __88__HUSideBarViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEAC78], "outlineRootParentCellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  if (objc_msgSend(*(id *)(a1 + 40), "shouldUseDashboardEffects"))
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  return v2;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a6;
  v10 = objc_msgSend(v9, "section");
  v11 = objc_msgSend(v8, "section");
  v12 = v9;
  if (v10 != v11)
  {
    -[HUSideBarViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDropDelegate:", self);

    v12 = v8;
  }
  v14 = v12;

  return v14;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v27 = a4;
  v7 = a5;
  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reorderableRoomList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "roomItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithArray:", v16);

    v18 = objc_msgSend(v17, "count");
    if (v18 > objc_msgSend(v7, "row"))
    {
      v19 = objc_msgSend(v17, "count");
      if (v19 > objc_msgSend(v27, "row"))
      {
        objc_msgSend(v17, "removeObjectAtIndex:", objc_msgSend(v27, "row"));
        objc_msgSend(v17, "insertObject:atIndex:", v11, objc_msgSend(v7, "row"));
        v20 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v20, "setSortedHomeKitItems:", v17);
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setReorderableRoomList:", v20);

        -[HUItemCollectionViewController setSuppressCollectionViewUpdatesForReorderCommit:](self, "setSuppressCollectionViewUpdatesForReorderCommit:", 1);
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sortDisplayedItemsInSection:", objc_msgSend(v27, "section"));

        -[HUItemCollectionViewController setSuppressCollectionViewUpdatesForReorderCommit:](self, "setSuppressCollectionViewUpdatesForReorderCommit:", 0);
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "saveWithSender:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v24, "addFailureBlock:", &__block_literal_global_16);

      }
    }

  }
  -[HUSideBarViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDropDelegate:", self);

}

void __74__HUSideBarViewController_collectionView_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, CFSTR("ReorderItems"));

}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reorderableRoomList");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("room"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_map:", &__block_literal_global_33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSortedHomeKitItems:", v8);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReorderableRoomList:", v6);

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveWithSender:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "addFailureBlock:", &__block_literal_global_79);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDropDelegate:", self);

}

id __68__HUSideBarViewController_didReorderItemWithSortedItemsBySectionID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2544A8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __68__HUSideBarViewController_didReorderItemWithSortedItemsBySectionID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, CFSTR("ReorderItems"));

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void *, id, void *);
  void *v20;
  _QWORD aBlock[5];
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUSideBarViewController;
  -[HUItemCollectionViewController configureCell:forItem:](&v22, sel_configureCell_forItem_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = CFSTR("square.split.bottomrightquarter");
  }
  else
  {
    objc_msgSend(v7, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C78]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:shape:fill:", v8, -1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v13, "_imageThatSuppressesAccessibilityHairlineThickening");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA718], "sidebarCellConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v14);
  objc_msgSend(v7, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v17);

  objc_msgSend(v6, "setContentConfiguration:", v15);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0CEA370], "listSidebarCellConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundConfiguration:", v18);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__HUSideBarViewController_configureCell_forItem___block_invoke;
  aBlock[3] = &unk_1E6F4D7B0;
  aBlock[4] = self;
  v19 = (void (**)(void *, id, void *))_Block_copy(aBlock);
  objc_msgSend(v6, "setConfigurationUpdateHandler:", v19);
  objc_msgSend(v6, "configurationState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v6, v20);

}

void __49__HUSideBarViewController_configureCell_forItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a2;
  v5 = a3;
  objc_msgSend(v34, "contentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedConfigurationForState:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "backgroundConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedConfigurationForState:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  v10 = objc_msgSend(*(id *)(a1 + 32), "shouldUseDashboardEffects");
  if ((_DWORD)v8)
  {
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setColor:", v11);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageProperties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTintColor:", v13);

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v15);

      if ((objc_msgSend(v5, "isSelected") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setVisualEffect:", v16);

LABEL_29:
        objc_msgSend(v9, "setCornerRadius:", 6.49350977);
        goto LABEL_30;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setColor:", v17);

      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTintColor:", v19);

      if (objc_msgSend(v5, "isSelected"))
      {
        objc_msgSend(*(id *)(a1 + 32), "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "userInterfaceStyle") == 2)
          objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
        else
          objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v33);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v21);
      }

    }
    objc_msgSend(v9, "setVisualEffect:", 0);
    goto LABEL_29;
  }
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setColor:", v22);

    if (objc_msgSend(v5, "isSelected"))
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    else
      objc_msgSend(v34, "tintColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTintColor:", v26);

    if (objc_msgSend(v5, "isSelected"))
    {
      objc_msgSend(v9, "setBackgroundColor:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v32);

    }
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "isSelected"))
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setColor:", v24);

  if (objc_msgSend(v5, "isSelected"))
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v28);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v30);

  if ((objc_msgSend(v5, "isSelected") & 1) == 0)
  {
LABEL_24:
    objc_msgSend(v9, "setVisualEffect:", 0);
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisualEffect:", v31);

LABEL_30:
  objc_msgSend(v34, "setContentConfiguration:", v7);
  objc_msgSend(v34, "setBackgroundConfiguration:", v9);

}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUSideBarViewController;
  -[HUItemCollectionViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v10, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, a4, a5, a6);
  -[HUSideBarViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    -[HUSideBarViewController refreshSideBarSelection](self, "refreshSideBarSelection");
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a3, "hf_reorderableRoomsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReorderableRoomList:", v5);

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5;

  objc_msgSend(a3, "accessories");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v5, "count") == 0);

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5;

  objc_msgSend(a3, "accessories");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v5, "count") == 0);

}

- (void)homeDidUpdateToROAR:(id)a3
{
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(a3, "hf_shouldBlockCurrentUserFromHome"));
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUSideBarViewController home](self, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v5 == v8)
  {

    v7 = v8;
  }
  else
  {
    if (!v5)
    {

      goto LABEL_8;
    }
    v6 = objc_msgSend(v5, "isEqual:", v8);

    v7 = v8;
    if (!v6)
      goto LABEL_9;
  }
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v7, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:
  v7 = v8;
LABEL_9:

}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HUSideBarViewController home](self, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v5 == v8)
  {

    v7 = v8;
  }
  else
  {
    if (!v5)
    {

      goto LABEL_8;
    }
    v6 = objc_msgSend(v5, "isEqual:", v8);

    v7 = v8;
    if (!v6)
      goto LABEL_9;
  }
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v7, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:
  v7 = v8;
LABEL_9:

}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v4 = a3;
  -[HUSideBarViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (!v6)
    {

      goto LABEL_8;
    }
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_9;
  }
  -[HUSideBarViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v5, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:

LABEL_9:
}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v4 = a3;
  -[HUSideBarViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (!v6)
    {

      goto LABEL_8;
    }
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_9;
  }
  -[HUSideBarViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarViewController setHideRoomSection:](self, "setHideRoomSection:", objc_msgSend(v5, "hf_shouldBlockCurrentRestrictedGuestFromHome"));
LABEL_8:

LABEL_9:
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUSideBarViewController home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hf_currentUserIsAdministrator");

      if (v12)
      {
        objc_msgSend(v7, "items");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF2AC470))
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:intent:", 3, 2);

LABEL_9:
          goto LABEL_10;
        }

      }
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:", 1);
    goto LABEL_9;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA448]), "initWithDropOperation:", 0);
LABEL_10:

  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v26 = a4;
  objc_msgSend(v26, "proposal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "operation");

  if (v6 == 3)
  {
    objc_opt_class();
    objc_msgSend(v26, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dragItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF2AC470))
    {
      v13 = v12;
      objc_opt_class();
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "destinationIndexPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayedItemAtIndexPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      v19 = objc_alloc(MEMORY[0x1E0D31700]);
      objc_msgSend(v18, "room");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(v19, "initWithExistingObject:inHome:", v20, v21);
      objc_msgSend(v13, "accessories");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __69__HUSideBarViewController_collectionView_performDropWithCoordinator___block_invoke;
      v27[3] = &unk_1E6F4D7D8;
      v28 = v22;
      v24 = v22;
      objc_msgSend(v23, "na_each:", v27);

      v25 = (id)objc_msgSend(v24, "commitItem");
    }

  }
}

uint64_t __69__HUSideBarViewController_collectionView_performDropWithCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAccessory:", a2);
}

- (void)switchToDiscover
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoverItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "trying to select the discover tab, but there is no discover item", v11, 2u);
    }

  }
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "discoverItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSideBarViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

}

- (void)setShouldUseDashboardEffects:(BOOL)a3
{
  if (self->_shouldUseDashboardEffects != a3)
  {
    self->_shouldUseDashboardEffects = a3;
    -[HUSideBarViewController _updateAppearance](self, "_updateAppearance");
  }
}

- (void)_updateShouldUseDashboardEffects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTabIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31838], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedHomeAppTabIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HUSideBarViewController setShouldUseDashboardEffects:](self, "setShouldUseDashboardEffects:", objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D306D0]));

}

- (void)_updateBlurView
{
  uint64_t v3;
  id v4;
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
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  -[HUSideBarViewController blurView](self, "blurView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  if (-[HUSideBarViewController shouldUseDashboardEffects](self, "shouldUseDashboardEffects"))
  {
    objc_msgSend(MEMORY[0x1E0CEABE0], "hu_dashboardBarEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundEffects:", v9);

    objc_msgSend(v6, "setContentEffects:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v10, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", 0);
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundEffects:", v12);

    v14 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentEffects:", v13);

  }
}

- (void)_updateNavigationBar
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (-[HUSideBarViewController shouldUseDashboardEffects](self, "shouldUseDashboardEffects"))
  {
    objc_msgSend(MEMORY[0x1E0CEABE0], "hu_dashboardBarEffects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundEffects:", v4);

    v13 = *MEMORY[0x1E0CEA0A0];
    v5 = v13;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleTextAttributes:", v7);

    v11 = v5;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLargeTitleTextAttributes:", v9);

  }
  -[HUSideBarViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStandardAppearance:", v3);

}

- (void)_updateSplitViewSeparator
{
  float v3;
  double v4;
  id v5;

  if (-[HUSideBarViewController shouldUseDashboardEffects](self, "shouldUseDashboardEffects"))
    v3 = 0.001;
  else
    v3 = 1.0;
  -[HUSideBarViewController splitViewController](self, "splitViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setGutterWidth:", v4);

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUSideBarViewController _updateBlurView](self, "_updateBlurView");
  -[HUSideBarViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[HUSideBarViewController _updateSplitViewSeparator](self, "_updateSplitViewSeparator");
  -[HUSideBarViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preparedCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_each:", &__block_literal_global_132);

  -[HUSideBarViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0CEBF28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_each:", &__block_literal_global_134);

}

uint64_t __44__HUSideBarViewController__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsUpdateConfiguration");
}

void __44__HUSideBarViewController__updateAppearance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v5 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v5;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "_setNeedsConfigurationStateUpdate");
}

- (void)_sendSideBarInteractionEventForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v3, *MEMORY[0x1E0D30328]);
  objc_opt_class();
  v15 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v15;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HUSideBarStaticItemTypeString(objc_msgSend(v6, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D30330]);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad"))
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "orientation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_safeSetObject:forKey:", v14, *MEMORY[0x1E0D302F0]);

  }
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 37, v4);

}

- (BOOL)shouldUseDashboardEffects
{
  return self->_shouldUseDashboardEffects;
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (HUSideBarDelegate)sideBarDelegate
{
  return (HUSideBarDelegate *)objc_loadWeakRetained((id *)&self->_sideBarDelegate);
}

- (void)setSideBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sideBarDelegate, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (BOOL)hideRoomSection
{
  return self->_hideRoomSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_sideBarDelegate);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
