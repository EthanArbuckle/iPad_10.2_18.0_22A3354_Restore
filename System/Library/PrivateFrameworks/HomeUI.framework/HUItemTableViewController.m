@implementation HUItemTableViewController

- (HUItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v7;
  HUItemTableViewController *v8;
  HUItemTableViewController *v9;
  uint64_t v10;
  NSMutableSet *internalItemModuleControllers;
  uint64_t v12;
  NSMutableSet *recentlyRemovedItemModuleControllers;
  uint64_t v14;
  NSMutableSet *registeredCellClasses;
  uint64_t v16;
  NSMapTable *textFieldToCellMap;
  uint64_t v18;
  NSMutableArray *foregroundUpdateFutures;
  void *v20;
  objc_super v22;

  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HUItemTableViewController;
  v8 = -[HUTableViewController initWithStyle:](&v22, sel_initWithStyle_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemManager, a3);
    -[HFItemManager setDelegate:](v9->_itemManager, "setDelegate:", v9);
    if (!objc_msgSend((id)objc_opt_class(), "updateMode"))
      objc_msgSend(v7, "disableExternalUpdatesWithReason:", CFSTR("HUItemTableViewController_NotVisible"));
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    internalItemModuleControllers = v9->_internalItemModuleControllers;
    v9->_internalItemModuleControllers = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    recentlyRemovedItemModuleControllers = v9->_recentlyRemovedItemModuleControllers;
    v9->_recentlyRemovedItemModuleControllers = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    registeredCellClasses = v9->_registeredCellClasses;
    v9->_registeredCellClasses = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    textFieldToCellMap = v9->_textFieldToCellMap;
    v9->_textFieldToCellMap = (NSMapTable *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    foregroundUpdateFutures = v9->_foregroundUpdateFutures;
    v9->_foregroundUpdateFutures = (NSMutableArray *)v18;

    v9->_automaticallyUpdatesViewControllerTitle = 1;
    objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:", v9);

    -[HUItemTableViewController _updateTitle](v9, "_updateTitle");
  }

  return v9;
}

- (HUItemTableViewController)initWithStyle:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemManager_tableViewStyle_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableViewController.m"), 130, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUItemTableViewController initWithStyle:]",
    v6);

  return 0;
}

- (void)setUpDiffableDataItemManagerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUTableViewDiffableDataSource *v10;
  void *v11;
  HUTableViewDiffableDataSource *v12;
  void *v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  id v17[3];
  id from;
  id location;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "diffableDataSourceDisabled"))
  {

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diffableDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_opt_class();

      v7 = (void *)objc_opt_class();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v8);

      objc_initWeak(&from, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __65__HUItemTableViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke;
      aBlock[3] = &unk_1E6F5F0C8;
      objc_copyWeak(&v16, &from);
      objc_copyWeak(v17, &location);
      v17[1] = v6;
      v17[2] = v7;
      v9 = _Block_copy(aBlock);
      v10 = [HUTableViewDiffableDataSource alloc];
      -[HUItemTableViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HUTableViewDiffableDataSource initWithTableView:cellProvider:delegate:](v10, "initWithTableView:cellProvider:delegate:", v11, v9, self);

      -[UITableViewDiffableDataSource setDefaultRowAnimation:](v12, "setDefaultRowAnimation:", 0);
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDiffableDataSource:", v12);

      objc_destroyWeak(v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

id __65__HUItemTableViewController_setUpDiffableDataItemManagerIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 40));
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 56);
      v20 = 138413826;
      v21 = v9;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = 0;
      v32 = 2112;
      v33 = v17;
      _os_log_fault_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_FAULT, "Attempting to get cell for item: %@ at index %@ in itemManager: %@ type: %@ for tableView: %@ when the tableViewController: %@ has dealloc already type: %@", (uint8_t *)&v20, 0x48u);

    }
  }
  objc_msgSend(WeakRetained, "tableView:cellForRowAtIndexPath:", v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v18 = objc_loadWeakRetained((id *)(a1 + 40));
      v19 = *(_QWORD *)(a1 + 48);
      v20 = 138413570;
      v21 = v9;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = WeakRetained;
      _os_log_fault_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_FAULT, "Failed to get cell for item: %@ at index %@ in itemManager: %@ type: %@ for tableView: %@ tableViewController: %@", (uint8_t *)&v20, 0x3Eu);

    }
    v12 = objc_alloc_init(MEMORY[0x1E0CEAA60]);
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[HUItemTableViewController setUpDiffableDataItemManagerIfNeeded](self, "setUpDiffableDataItemManagerIfNeeded");
  -[HUItemTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v5, v7);

  -[HUItemTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forHeaderFooterViewReuseIdentifier:", v9, v11);

  -[HUItemTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSeparatorStyle:", 0);

  v13 = *MEMORY[0x1E0CEBC18];
  -[HUItemTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEstimatedRowHeight:", v13);

  v15 = *MEMORY[0x1E0CEBC10];
  -[HUItemTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRowHeight:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v17);

  if (objc_msgSend((id)objc_opt_class(), "updateMode") == 1)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  }
  -[HUItemTableViewController _updateTableHeaderAndFooter](self, "_updateTableHeaderAndFooter");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[5];
  id v29;

  v3 = a3;
  -[HUItemTableViewController setAppearState:](self, "setAppearState:", 1);
  -[HUItemTableViewController gridLayoutOptions](self, "gridLayoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewSize");
  v7 = v6;
  v9 = v8;
  -[HUItemTableViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    -[HUItemTableViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController setGridLayoutOptions:](self, "setGridLayoutOptions:", v19);

  }
  if (!objc_msgSend((id)objc_opt_class(), "updateMode"))
  {
    -[HUTableViewController childViewControllersAtViewWillDisappearTime](self, "childViewControllersAtViewWillDisappearTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", MEMORY[0x1E0C80D38]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __44__HUItemTableViewController_viewWillAppear___block_invoke;
    v28[3] = &unk_1E6F597C8;
    v28[4] = self;
    v29 = v21;
    v23 = v21;
    objc_msgSend(v22, "performCancelableBlock:", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController setDeferredVisibilityUpdate:](self, "setDeferredVisibilityUpdate:", v24);

  }
  v27.receiver = self;
  v27.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewWillAppear:](&v27, sel_viewWillAppear_, v3);
  -[HUItemTableViewController pendingScrollDestination](self, "pendingScrollDestination");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HUItemTableViewController pendingScrollDestination](self, "pendingScrollDestination");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController _scrollToDestination:](self, "_scrollToDestination:", v26);

    -[HUItemTableViewController setPendingScrollDestination:](self, "setPendingScrollDestination:", 0);
  }
  -[HUItemTableViewController _updateMaterials](self, "_updateMaterials");
}

void __44__HUItemTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "visibilityUpdatesEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endDisableExternalUpdatesWithReason:", CFSTR("HUItemTableViewController_NotVisible"));

    objc_msgSend(*(id *)(a1 + 32), "setVisibilityUpdatesEnabled:", 1);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF230880, (_QWORD)v10))
        {
          objc_msgSend(v8, "itemManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "endDisableExternalUpdatesWithReason:", CFSTR("HUItemTableViewController_ParentNotVisible"));

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[HUItemTableViewController setAppearState:](self, "setAppearState:", 2);
  -[HUItemTableViewController setViewHasAppeared:](self, "setViewHasAppeared:", 1);
  v6.receiver = self;
  v6.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_textFieldDidChange_, *MEMORY[0x1E0CEBD20], 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController setAppearState:](self, "setAppearState:", 3);
  if (!objc_msgSend((id)objc_opt_class(), "updateMode"))
  {
    if (-[HUItemTableViewController visibilityUpdatesEnabled](self, "visibilityUpdatesEnabled"))
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "disableExternalUpdatesWithReason:", CFSTR("HUItemTableViewController_NotVisible"));

      -[HUItemTableViewController setVisibilityUpdatesEnabled:](self, "setVisibilityUpdatesEnabled:", 0);
    }
    -[HUItemTableViewController deferredVisibilityUpdate](self, "deferredVisibilityUpdate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HUItemTableViewController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF230880))
          {
            objc_msgSend(v12, "itemManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "disableExternalUpdatesWithReason:", CFSTR("HUItemTableViewController_ParentNotVisible"));

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBD20], 0);

  -[HUItemTableViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endEditing:", 1);

  v16.receiver = self;
  v16.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewWillDisappear:](&v16, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[HUItemTableViewController setAppearState:](self, "setAppearState:", 0);
  v5.receiver = self;
  v5.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)HUItemTableViewController;
  v7 = a4;
  -[HUItemTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__HUItemTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6F4CB78;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __80__HUItemTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setGridLayoutOptions:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[HUItemTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v10));

  -[HUItemTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tableFooterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v11));

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[HUItemTableViewController _updatePreferredContentSizeIfNecessary](self, "_updatePreferredContentSizeIfNecessary");
}

- (void)setGridLayoutOptions:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", self->_gridLayoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gridLayoutOptions, a3);
    -[HUItemTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "visibleCells");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController _updateLayoutMarginsForCells:](self, "_updateLayoutMarginsForCells:", v8);

    }
  }

}

- (void)setWantsPreferredContentSize:(BOOL)a3
{
  if (self->_wantsPreferredContentSize != a3)
  {
    self->_wantsPreferredContentSize = a3;
    -[HUItemTableViewController _updatePreferredContentSizeIfNecessary](self, "_updatePreferredContentSizeIfNecessary");
  }
}

- (BOOL)bypassInitialItemUpdateReload
{
  return 0;
}

- (BOOL)alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared
{
  return 0;
}

- (id)itemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;

  -[HUItemTableViewController itemModuleControllers](self, "itemModuleControllers", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableViewController.m"), 362, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUItemTableViewController cellClassForItem:indexPath:]", objc_opt_class());

  }
  return 0;
}

- (Class)mappableCellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF27CFA0))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "mapsToViewClass");
  else
    -[HUItemTableViewController cellClassForItem:indexPath:](self, "cellClassForItem:indexPath:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v11;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "shouldManageTextFieldForItem:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "currentTextForTextField:item:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "defaultTextForTextField:item:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "placeholderTextForTextField:item:", v7, v6);
  else
    -[HUItemTableViewController defaultTextForTextField:item:](self, "defaultTextForTextField:item:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char isKindOfClass;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF27F368))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    isKindOfClass = objc_msgSend(v6, "prefersSeparatorsHidden");
LABEL_9:
    v9 = isKindOfClass;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_9;
  }
  v9 = 1;
LABEL_10:

  return v9 & 1;
}

- (void)setAutomaticallyUpdatesViewControllerTitle:(BOOL)a3
{
  if (self->_automaticallyUpdatesViewControllerTitle != a3)
  {
    self->_automaticallyUpdatesViewControllerTitle = a3;
    if (a3)
      -[HUItemTableViewController _updateTitle](self, "_updateTitle");
  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 0;
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 0;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return -1;
}

- (id)itemTableHeaderMessage
{
  return 0;
}

- (id)itemTableFooterMessage
{
  return 0;
}

- (id)itemTableHeaderView
{
  void *v3;
  void *v4;
  HUItemTableHeaderFooterView *v5;
  HUItemTableHeaderFooterView *v6;
  HUItemTableHeaderFooterView *v7;

  -[HUItemTableViewController itemTableHeaderMessage](self, "itemTableHeaderMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    -[HUItemTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableHeaderView");
    v5 = (HUItemTableHeaderFooterView *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (!v7)
      v5 = -[HUItemTableHeaderFooterView initWithReuseIdentifier:]([HUItemTableHeaderFooterView alloc], "initWithReuseIdentifier:", 0);
    -[HUItemTableHeaderFooterView setAttributedMessage:](v5, "setAttributedMessage:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)itemTableFooterView
{
  void *v3;
  void *v4;
  HUItemTableHeaderFooterView *v5;
  HUItemTableHeaderFooterView *v6;
  HUItemTableHeaderFooterView *v7;

  -[HUItemTableViewController itemTableFooterMessage](self, "itemTableFooterMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    -[HUItemTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableFooterView");
    v5 = (HUItemTableHeaderFooterView *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (!v7)
      v5 = -[HUItemTableHeaderFooterView initWithReuseIdentifier:]([HUItemTableHeaderFooterView alloc], "initWithReuseIdentifier:", 0);
    -[HUItemTableHeaderFooterView setAttributedMessage:](v5, "setAttributedMessage:", v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)childViewControllersToPreload
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)leadingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  return 0;
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForSection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemSectionForSectionIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "headerAccessoryButtonTitle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          objc_msgSend(v8, "headerAccessoryButtonDelegate"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "style");

      if (v14 == 2)
      {
        objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else if (v14 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14)
        {
          v12 = 0;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0CEA718], "plainHeaderConfiguration");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v15;
LABEL_13:
      objc_msgSend(v12, "setText:", v6);
      goto LABEL_14;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)contentConfigurationForFooterViewAtSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerTitleForSection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "style");

    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (v8)
      {
        v10 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CEA718], "plainFooterConfiguration");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA718], "groupedFooterConfiguration");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
LABEL_9:
    objc_msgSend(v10, "setText:", v6);
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)moduleControllerForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HUItemTableViewController itemModuleControllers](self, "itemModuleControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HUItemTableViewController_moduleControllerForItem___block_invoke;
  v11[3] = &unk_1E6F59928;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __53__HUItemTableViewController_moduleControllerForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsItem:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "moduleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "moduleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  return v5;
}

- (void)cleanupRecentlyRemovedModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  HUItemTableViewController *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_274);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v4;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  v11 = v8;
  if (!v9)
  {
LABEL_15:

    goto LABEL_16;
  }
  v12 = v9;
  v13 = 0;
  v14 = *(_QWORD *)v26;
  *(_QWORD *)&v10 = 138412802;
  v24 = v10;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v26 != v14)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v16, "moduleIdentifier", v24, (_QWORD)v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v7, "containsObject:", v17);

      if ((v18 & 1) == 0)
      {
        HFLogForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "moduleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v30 = self;
          v31 = 2112;
          v32 = v16;
          v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@: Finishing removal of module controller %@ (%@) because no items refer to it anymore", buf, 0x20u);

        }
        -[HUItemTableViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v16);

        v13 = 1;
      }
    }
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  }
  while (v12);

  if ((v13 & 1) != 0)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HUItemTableViewController recentlyRemovedItemModuleControllers](self, "recentlyRemovedItemModuleControllers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "na_map:", &__block_literal_global_127_0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = self;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: Module controllers awaiting removal remaining: %@", buf, 0x16u);

    }
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __68__HUItemTableViewController_cleanupRecentlyRemovedModuleControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "moduleIdentifier");
}

uint64_t __68__HUItemTableViewController_cleanupRecentlyRemovedModuleControllers__block_invoke_125(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "moduleIdentifier");
}

- (id)textFieldForVisibleItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF258718))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("sourceItem"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_updateMaterials
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
  {
    -[HUItemTableViewController traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    if (v4 == 2)
      v5 = 19;
    else
      v5 = 14;
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", v5);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("HUQuickControlNavigationController"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v20, 6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v9);
      -[HUItemTableViewController setBackgroundVisualEffectView:](self, "setBackgroundVisualEffectView:", v10);

      -[HUItemTableViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundView:", v11);

      -[HUItemTableViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSeparatorEffect:", v9);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.6);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    v15 = (objc_class *)objc_opt_class();
    if (v15 == NSClassFromString(CFSTR("HUServiceDetailsViewController")))
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.1);
      v16 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v16;
    }
    -[HUItemTableViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v6);

    -[HUItemTableViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v6);

    -[HUItemTableViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEffect:", v20);

  }
}

- (void)_dispatchUpdateForCell:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a5;
  v10 = a4;
  v11 = a3;
  -[HUItemTableViewController _performCommonUpdateForCell:item:indexPath:animated:](self, "_performCommonUpdateForCell:item:indexPath:animated:", v11, v10, v14, v6);
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "updateCell:forItem:animated:", v11, v10, v6);
  else
    -[HUItemTableViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v11, v10, v14, v6);

}

- (void)_performCommonUpdateForCell:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  HUItemTableViewController *v29;
  HUItemTableViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[2];

  v6 = a6;
  v47[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v47[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController _updateLayoutMarginsForCells:](self, "_updateLayoutMarginsForCells:", v11);

  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF253320))
  {
    v12 = v9;
    v13 = -[HUItemTableViewController automaticDisablingReasonsForItem:](self, "automaticDisablingReasonsForItem:", v10);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hf_currentUserIsAdministrator");

    if ((v16 & 1) != 0)
    {
      LODWORD(v17) = 0;
    }
    else
    {
      objc_msgSend(v10, "latestResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CE8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        LODWORD(v17) = objc_msgSend(v19, "BOOLValue");
      else
        v17 = (v13 >> 1) & 1;

    }
    objc_msgSend(v10, "latestResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if ((v22 & 1) != 0 || (_DWORD)v17)
    {
      objc_msgSend(v12, "setDisabled:", 1);
      -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && (objc_msgSend(v23, "canSelectDisabledItem:", v10) & 1) != 0)
        v25 = 3;
      else
        v25 = 0;
      objc_msgSend(v12, "setSelectionStyle:", v25);

    }
    else
    {
      objc_msgSend(v12, "setDisabled:", 0);
      objc_msgSend(v12, "setSelectionStyle:", 3);
    }

  }
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF258718)
    && -[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v10))
  {
    v26 = v9;
    -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v10);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (HUItemTableViewController *)v27;
    else
      v29 = self;
    v30 = v29;

    objc_msgSend(v26, "textField");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController defaultTextForTextField:item:](v30, "defaultTextForTextField:item:", v31, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "textField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController currentTextForTextField:item:](v30, "currentTextForTextField:item:", v33, v10);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "textField");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController placeholderTextForTextField:item:](v30, "placeholderTextForTextField:item:", v35, v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "textField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPlaceholder:", v36);

    if (v34)
      v38 = v34;
    else
      v38 = v32;
    objc_msgSend(v26, "textField");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v38);

    objc_msgSend(v26, "textField");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "keyboardType") != 7;

    objc_msgSend(v26, "textField");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAutocapitalizationType:", v41);

  }
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF2424C8))
  {
    v43 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v43, "setResizingDelegate:", self);
    objc_msgSend(v43, "updateUIWithAnimation:", v6);

  }
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF28DE38))
  {
    v44 = v9;
    objc_msgSend(v10, "latestResults");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C98]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "setCanBeSelected:", v46 == 0);
  }

}

- (id)_visibleCellForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HUItemTableViewController tableView](self, "tableView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[HUItemTableViewController itemManager](self, "itemManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayedItemAtIndexPath:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v4)
        {
          -[HUItemTableViewController tableView](self, "tableView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cellForRowAtIndexPath:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)_itemForTextField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[HUItemTableViewController textFieldToCellMap](self, "textFieldToCellMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2424C8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForCell:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayedItemAtIndexPath:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)_updateTitle
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[HUItemTableViewController automaticallyUpdatesViewControllerTitle](self, "automaticallyUpdatesViewControllerTitle");

    if (!v5)
      return;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void)_updateTableHeaderAndFooter
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];
  CGRect v17;
  CGRect v18;

  -[HUItemTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableFooterView");
  v6 = objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemTableHeaderView](self, "itemTableHeaderView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7 | v4)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTableHeaderView:", v7);

    -[HUItemTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend((id)v7, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v17));

    -[HUItemTableViewController tableView](self, "tableView");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setTableHeaderView:](v8, "setTableHeaderView:", v7);
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEBUG, "Header View not set; skipping", buf, 2u);
    }
  }

  -[HUItemTableViewController itemTableFooterView](self, "itemTableFooterView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 | v6)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTableFooterView:", v11);

    -[HUItemTableViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend((id)v11, "hu_autoSizeByConstrainingWidth:", CGRectGetWidth(v18));

    -[HUItemTableViewController tableView](self, "tableView");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject setTableFooterView:](v14, "setTableFooterView:", v11);
  }
  else
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_debug_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEBUG, "Footer View not set; skipping", v15, 2u);
    }
  }

}

- (BOOL)_shouldHideHeaderForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  HUItemTableViewController *v18;
  id v19;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemsInSectionWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __57__HUItemTableViewController__shouldHideHeaderForSection___block_invoke;
  v17 = &unk_1E6F4EEA8;
  v18 = self;
  v19 = v6;
  v9 = v6;
  if ((objc_msgSend(v8, "na_any:", &v14) & 1) != 0
    || -[HUItemTableViewController shouldHideHeaderAboveSection:](self, "shouldHideHeaderAboveSection:", a3, v14, v15, v16, v17, v18, v19))
  {
    v10 = 1;
  }
  else if (a3 >= 1
         && -[HUItemTableViewController shouldHideFooterBelowSection:](self, "shouldHideFooterBelowSection:", a3 - 1))
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13 == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __57__HUItemTableViewController__shouldHideHeaderForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "moduleControllerForItem:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHideHeaderAboveSectionWithIdentifier:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (BOOL)_shouldHideFooterForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  HUItemTableViewController *v19;
  id v20;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemsInSectionWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __57__HUItemTableViewController__shouldHideFooterForSection___block_invoke;
  v18 = &unk_1E6F4EEA8;
  v19 = self;
  v20 = v6;
  v9 = v6;
  if ((objc_msgSend(v8, "na_any:", &v15) & 1) != 0
    || -[HUItemTableViewController shouldHideFooterBelowSection:](self, "shouldHideFooterBelowSection:", a3, v15, v16, v17, v18, v19, v20))
  {
    v10 = 1;
  }
  else
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "numberOfSections") - 1 > a3
      && -[HUItemTableViewController shouldHideHeaderAboveSection:](self, "shouldHideHeaderAboveSection:", a3 + 1))
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController tableView:titleForFooterInSection:](self, "tableView:titleForFooterInSection:", v12, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13 == 0;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

uint64_t __57__HUItemTableViewController__shouldHideFooterForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "moduleControllerForItem:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHideFooterBelowSectionWithIdentifier:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)_updateLayoutMarginsForCells:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "adoptsDefaultGridLayoutMargins"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v10, "layoutMargins", (_QWORD)v21);
          v12 = v11;
          v14 = v13;
          -[HUItemTableViewController gridLayoutOptions](self, "gridLayoutOptions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sectionLeadingMargin");
          v17 = v16;

          -[HUItemTableViewController gridLayoutOptions](self, "gridLayoutOptions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "sectionTrailingMargin");
          v20 = v19;

          objc_msgSend(v10, "setLayoutMargins:", v12, v17, v14, v20);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

  }
}

- (void)_updatePreferredContentSizeIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v11;

  -[HUItemTableViewController preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  v6 = v5;
  if (-[HUItemTableViewController wantsPreferredContentSize](self, "wantsPreferredContentSize"))
  {
    if (-[HUItemTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_contentSize");
      -[HUItemTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    }
  }
  else
  {
    -[HUItemTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  -[HUItemTableViewController preferredContentSize](self, "preferredContentSize");
  if (v4 != v9 || v6 != v8)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsUpdateConstraints");

  }
}

- (void)_updateHeadersAndFootersIfNeededAfterPerformingRequest:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v18 = a3;
  objc_msgSend(v18, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v18, "changes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupOperations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_map:", &__block_literal_global_175);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "changes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "groupOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__HUItemTableViewController__updateHeadersAndFootersIfNeededAfterPerformingRequest___block_invoke_2;
    v19[3] = &unk_1E6F5F170;
    v19[4] = self;
    v20 = v12;
    v21 = v7;
    v15 = v7;
    v16 = v12;
    objc_msgSend(v14, "na_each:", v19);

    -[HUItemTableViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_reloadSectionHeaderFooters:withRowAnimation:", v15, 100);

  }
}

id __84__HUItemTableViewController__updateHeadersAndFootersIfNeededAfterPerformingRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "fromIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "toIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __84__HUItemTableViewController__updateHeadersAndFootersIfNeededAfterPerformingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "fromIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "toIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (v5)
    {
      v6 = *(void **)(a1 + 48);
      objc_msgSend(v12, "toIndex");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addIndex:", objc_msgSend(v7, "integerValue"));

    }
  }
  else
  {
    v8 = objc_msgSend(v4, "integerValue") + 1;

    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= objc_msgSend(v9, "numberOfSections"))
    {

    }
    else
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11);

      if ((v10 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 48), "addIndex:", v8);
    }
  }

}

- (void)_scrollToDestination:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 1, objc_msgSend(v8, "isAnimated"));
  }
  else
  {
    objc_msgSend(v8, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Could not find item %@!"), v7);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemsInSection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[8];

  v6 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__HUItemTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v27[3] = &unk_1E6F59878;
  v10 = v9;
  v27[4] = v10;
  v11 = v8;
  v27[5] = v11;
  v27[6] = self;
  v12 = v6;
  v27[7] = v12;
  v13 = (objc_class *)__61__HUItemTableViewController_tableView_cellForRowAtIndexPath___block_invoke((uint64_t)v27);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableViewController.m"), 986, CFSTR("No cell class specified for item: %@"), v11);

  }
  -[HUItemTableViewController registeredCellClasses](self, "registeredCellClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v13);

  if ((v15 & 1) == 0)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", v13, v17);

    -[HUItemTableViewController registeredCellClasses](self, "registeredCellClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v13);

  }
  -[HUItemTableViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dequeueReusableCellWithIdentifier:forIndexPath:", v20, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF2424C8))
    objc_msgSend(v21, "setItem:", v11);
  v22 = -[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](self, "shouldHideSeparatorsForCell:indexPath:", v21, v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", !v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hu_setForcedSeparatorStyle:", v23);

  if (-[HUItemTableViewController shouldUseAlternateCellColor](self, "shouldUseAlternateCellColor"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v24);

  }
  if (v10)
    objc_msgSend(v10, "setupCell:forItem:", v21, v11);
  else
    -[HUItemTableViewController setupCell:forItem:indexPath:](self, "setupCell:forItem:indexPath:", v21, v11, v12);
  -[HUItemTableViewController _dispatchUpdateForCell:item:indexPath:animated:](self, "_dispatchUpdateForCell:item:indexPath:animated:", v21, v11, v12, 0);

  return v21;
}

id __61__HUItemTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 32), "cellClassForItem:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(*(id *)(a1 + 48), "mappableCellClassForItem:indexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemSectionForSectionIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController contentConfigurationForHeaderViewAtSectionIndex:](self, "contentConfigurationForHeaderViewAtSectionIndex:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = (void *)v8, v10 = objc_msgSend(v7, "forceShowHeaderTitle"), v9, !v10))
  {
    v12 = 0;
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleForSection:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[HUItemTableViewController contentConfigurationForFooterViewAtSectionIndex:](self, "contentConfigurationForFooterViewAtSectionIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "footerTitleForSection:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && objc_msgSend(v10, "conformsToProtocol:", &unk_1EF253320)
    && objc_msgSend(v10, "isDisabled"))
  {
    if (!v8)
    {
      v12 = 0;
      goto LABEL_10;
    }
    v11 = objc_msgSend(v8, "canSelectDisabledItem:", v7);
  }
  else
  {
    if (!v8)
    {
      v12 = 1;
      goto LABEL_10;
    }
    v11 = objc_msgSend(v8, "canSelectItem:", v7);
  }
  v12 = v11;
LABEL_10:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  HUItemTableViewController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend((id)+[HUItemTableViewController superclass](HUItemTableViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v14.receiver = self;
    v14.super_class = (Class)HUItemTableViewController;
    -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, v7, v8);
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: User tapped item: %@", buf, 0x16u);
  }

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && !objc_msgSend(v12, "didSelectItem:", v10))
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v16, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v8, v9);
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF258718))
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && -[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v11))
    {
      v12 = v8;
      objc_msgSend(v12, "textField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", self);

      -[HUItemTableViewController textFieldToCellMap](self, "textFieldToCellMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v12, v15);

    }
  }

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUItemTableViewController;
  -[HUTableViewController tableView:didEndDisplayingCell:forRowAtIndexPath:](&v16, sel_tableView_didEndDisplayingCell_forRowAtIndexPath_, a3, v8, v9);
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF258718))
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && -[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v11))
    {
      v12 = v8;
      objc_msgSend(v12, "textField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegate:", 0);

      -[HUItemTableViewController textFieldToCellMap](self, "textFieldToCellMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "removeObjectForKey:", v15);
    }

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;

  v6 = a3;
  if (-[HUItemTableViewController _shouldHideHeaderForSection:](self, "_shouldHideHeaderForSection:", a4))
  {
    v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    v8 = 0;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemSectionForSectionIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController contentConfigurationForHeaderViewAtSectionIndex:](self, "contentConfigurationForHeaderViewAtSectionIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerAccessoryButtonTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v10, "headerAccessoryButtonDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setItemSection:", v10);
      -[HUItemTableViewController tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v18, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      objc_msgSend(v17, "updateUIWithAnimation:", 0);
LABEL_9:

      v8 = v17;
      goto LABEL_10;
    }
  }
  if (v11)
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setContentConfiguration:", v11);
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  HUItemTableSectionHeaderFooterView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedFooterTitleForSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController contentConfigurationForFooterViewAtSectionIndex:](self, "contentConfigurationForFooterViewAtSectionIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v11);
    v12 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

    -[HUItemTableSectionHeaderFooterView setContentConfiguration:](v12, "setContentConfiguration:", v9);
  }
  else if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footerReuseIdentifier"));
    v12 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      v12 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:]([HUItemTableSectionHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("footerReuseIdentifier"));
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayedSectionIdentifierForSectionIndex:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView messageTextView](v12, "messageTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIdentifier:", v14);

    -[HUItemTableSectionHeaderFooterView setType:](v12, "setType:", 1);
    -[HUItemTableSectionHeaderFooterView setMessage:](v12, "setMessage:", v8);
    -[HUItemTableSectionHeaderFooterView messageTextView](v12, "messageTextView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

    -[HUItemTableSectionHeaderFooterView messageTextView](v12, "messageTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textDragInteraction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", 0);

  }
  else
  {
    v12 = 0;
  }
  if (-[HUItemTableViewController _shouldHideFooterForSection:](self, "_shouldHideFooterForSection:", a4))
  {
    v19 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    v12 = (HUItemTableSectionHeaderFooterView *)v20;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  _BOOL4 v5;
  double result;

  v4 = *MEMORY[0x1E0CEBC10];
  v5 = -[HUItemTableViewController _shouldHideHeaderForSection:](self, "_shouldHideHeaderForSection:", a4);
  result = 2.22507386e-308;
  if (!v5)
    return v4;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4;
  _BOOL4 v5;
  double result;

  v4 = *MEMORY[0x1E0CEBC10];
  v5 = -[HUItemTableViewController _shouldHideFooterForSection:](self, "_shouldHideFooterForSection:", a4);
  result = 2.22507386e-308;
  if (!v5)
    return v4;
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double v4;
  _BOOL4 v5;
  double result;

  v4 = *MEMORY[0x1E0CEBC10];
  v5 = -[HUItemTableViewController _shouldHideHeaderForSection:](self, "_shouldHideHeaderForSection:", a4);
  result = 2.22507386e-308;
  if (!v5)
    return v4;
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  double v4;
  _BOOL4 v5;
  double result;

  v4 = *MEMORY[0x1E0CEBC10];
  v5 = -[HUItemTableViewController _shouldHideFooterForSection:](self, "_shouldHideFooterForSection:", a4);
  result = 2.22507386e-308;
  if (!v5)
    return v4;
  return result;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "accessoryButtonTappedForItem:", v9);

}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  HUItemTableViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User swiped for leading actions on item: %@", (uint8_t *)&v13, 0x16u);
  }

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = self;
  objc_msgSend(v9, "leadingSwipeActionsForItem:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  HUItemTableViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", (uint8_t *)&v13, 0x16u);
  }

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = self;
  objc_msgSend(v9, "trailingSwipeActionsForItem:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  HUItemTableViewController *v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[HUItemTableViewController itemManagerDidUpdate:](self, "itemManagerDidUpdate:", a3);
  -[HUItemTableViewController cleanupRecentlyRemovedModuleControllers](self, "cleanupRecentlyRemovedModuleControllers");
  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke;
    v21 = &unk_1E6F4C638;
    v22 = v10;
    v23 = self;
    v13 = (void (**)(_QWORD))_Block_copy(&v18);
    -[HUItemTableViewController itemManager](self, "itemManager", v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HUItemTableViewController shouldPerformUpdateWithAnimationForDiffableDataItemManager:](self, "shouldPerformUpdateWithAnimationForDiffableDataItemManager:", v14);

    if (v15)
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "beginUpdates");

      v13[2](v13);
      -[HUItemTableViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endUpdates");

    }
    else
    {
      v13[2](v13);
    }

  }
}

uint64_t __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2;
  v3[3] = &unk_1E6F51390;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __89__HUItemTableViewController_diffableDataItemManager_didUpdateItems_addItems_removeItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItem:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_dispatchUpdateForCell:item:indexPath:animated:", v6, v7, v4, 1);

}

- (void)itemManagerDidUpdate:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController _updatePreferredContentSizeIfNecessary](self, "_updatePreferredContentSizeIfNecessary", a3);
  if (!-[HUItemTableViewController hasFinishedInitialLoad](self, "hasFinishedInitialLoad"))
  {
    -[HUItemTableViewController setHasFinishedInitialLoad:](self, "setHasFinishedInitialLoad:", 1);
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: finished initial load", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (BOOL)shouldPerformUpdateWithAnimationForDiffableDataItemManager:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUItemTableViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (int64_t)_rowAnimationForOperationType:(unint64_t)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "rowAnimationForOperationType:item:suggestedAnimation:", a3, v6, 0);
  else
    v9 = 0;

  return v9;
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t v14[16];

  v6 = a5;
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "runningState"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the application is active", v14, 2u);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HUItemTableViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

LABEL_8:
  return v11;
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (-[HUItemTableViewController viewHasAppeared](self, "viewHasAppeared")
    && -[HUItemTableViewController alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared](self, "alwaysUseDeltaTableViewUpdatesAfterViewHasAppeared")|| -[HUItemTableViewController bypassInitialItemUpdateReload](self, "bypassInitialItemUpdateReload")|| (objc_msgSend(v6, "isInitialUpdate") & 1) == 0&& (-[HUItemTableViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    if (!-[HUItemTableViewController hasForcedLoadingVisibleCells](self, "hasForcedLoadingVisibleCells"))
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "visibleCells");

      -[HUItemTableViewController setHasForcedLoadingVisibleCells:](self, "setHasForcedLoadingVisibleCells:", 1);
    }
    -[HUItemTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginUpdates");

    objc_msgSend(v6, "performWithOptions:", 0);
    -[HUItemTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endUpdates");

    -[HUItemTableViewController _updateHeadersAndFootersIfNeededAfterPerformingRequest:](self, "_updateHeadersAndFootersIfNeededAfterPerformingRequest:", v6);
  }
  else
  {
    objc_msgSend(v6, "performWithOptions:", 1);
    if (-[HUItemTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUItemTableViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

    }
  }
  -[HUItemTableViewController itemManagerDidUpdate:](self, "itemManagerDidUpdate:", v12);

}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[HUItemTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[HUItemTableViewController _dispatchUpdateForCell:item:indexPath:animated:](self, "_dispatchUpdateForCell:item:indexPath:animated:", v9, v10, v7, 1);

}

- (void)itemManager:(id)a3 didRemoveItem:(id)a4 atIndexPath:(id)a5
{
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = -[HUItemTableViewController _rowAnimationForOperationType:item:](self, "_rowAnimationForOperationType:item:", 2, a4);
  -[HUItemTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "deleteRowsAtIndexPaths:withRowAnimation:", v10, v8);
}

- (void)itemManager:(id)a3 didInsertItem:(id)a4 atIndexPath:(id)a5
{
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = -[HUItemTableViewController _rowAnimationForOperationType:item:](self, "_rowAnimationForOperationType:item:", 1, a4);
  -[HUItemTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "insertRowsAtIndexPaths:withRowAnimation:", v10, v8);
}

- (void)itemManager:(id)a3 didMoveItem:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = a5;
  v10 = a6;
  -[HUItemTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForRowAtIndexPath:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[HUItemTableViewController _dispatchUpdateForCell:item:indexPath:animated:](self, "_dispatchUpdateForCell:item:indexPath:animated:", v12, v14, v9, 1);
  -[HUItemTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moveRowAtIndexPath:toIndexPath:", v9, v10);

}

- (void)itemManager:(id)a3 didRemoveSections:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUItemTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteSections:withRowAnimation:", v5, 0);

}

- (void)itemManager:(id)a3 didInsertSections:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUItemTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSections:withRowAnimation:", v5, 0);

}

- (void)itemManager:(id)a3 didMoveSection:(int64_t)a4 toSection:(int64_t)a5
{
  id v7;

  -[HUItemTableViewController tableView](self, "tableView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moveSection:toSection:", a4, a5);

}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  -[HUItemTableViewController _updateTitle](self, "_updateTitle", a3, a4);
  -[HUItemTableViewController _updateTableHeaderAndFooter](self, "_updateTableHeaderAndFooter");
}

- (void)itemManager:(id)a3 didChangeSourceItem:(id)a4
{
  -[HUItemTableViewController _updateTitle](self, "_updateTitle", a3, a4);
  -[HUItemTableViewController _updateTableHeaderAndFooter](self, "_updateTableHeaderAndFooter");
}

- (void)itemManager:(id)a3 didUpdateItemModules:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  HUItemTableViewController *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HUItemTableViewController itemModuleControllers](self, "itemModuleControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_198);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D317F0];
  v32 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v7;
  objc_msgSend(v8, "diffFromSet:toSet:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v10, "additions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  v13 = &OBJC_IVAR___HUAvailableTriggerItem__relatedServiceLikeItems;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[HUItemTableViewController buildItemModuleControllerForModule:](self, "buildItemModuleControllerForModule:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "setHost:", self);
          objc_msgSend(v19, "setHostType:", 1);
          -[NSMutableSet addObject:](self->_internalItemModuleControllers, "addObject:", v19);
        }
        else
        {
          NSLog(CFSTR("No module controller provided for item module %@ in HUItemTableViewController subclass %@!"), v17, self);
        }

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v14);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v10, "deletions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        v25 = v13[116];
        v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __62__HUItemTableViewController_itemManager_didUpdateItemModules___block_invoke_2;
        v34[3] = &unk_1E6F59928;
        v34[4] = v24;
        objc_msgSend(v26, "na_firstObjectPassingTest:", v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = v13;
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v25), "removeObject:", v27);
          HFLogForCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "moduleIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v44 = self;
            v45 = 2112;
            v46 = v27;
            v47 = 2112;
            v48 = v30;
            _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@: Starting removal of module controller %@ (%@) because module was deleted. Adding to recently removed for safety", buf, 0x20u);

          }
          -[NSMutableSet addObject:](self->_recentlyRemovedItemModuleControllers, "addObject:", v27);
          v13 = v28;
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v21);
  }

}

uint64_t __62__HUItemTableViewController_itemManager_didUpdateItemModules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "module");
}

BOOL __62__HUItemTableViewController_itemManager_didUpdateItemModules___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)expandableTextViewCellStateDidChange:(id)a3
{
  id v3;

  -[HUItemTableViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)highlightItemAnimated:(id)a3
{
  -[HUItemTableViewController highlightItemAnimated:duration:](self, "highlightItemAnimated:duration:", a3, 0.5);
}

- (void)highlightItemAnimated:(id)a3 duration:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  dispatch_queue_t v16;
  id v17[2];
  id location;

  v6 = a3;
  if (_MergedGlobals_2_2 != -1)
    dispatch_once(&_MergedGlobals_2_2, &__block_literal_global_204);
  v7 = (id)qword_1EF226C28;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    -[HUItemTableViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexPathForItem:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_initWeak(&location, v14);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_3;
      v15[3] = &unk_1E6F56CC8;
      objc_copyWeak(v17, &location);
      v16 = (dispatch_queue_t)v7;
      v17[1] = *(id *)&a4;
      dispatch_async(v16, v15);

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }

  }
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.Home.itemTableViewController.highlightQueue", v2);
  v1 = (void *)qword_1EF226C28;
  qword_1EF226C28 = (uint64_t)v0;

}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_3(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4[2];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_4;
  block[3] = &unk_1E6F56CC8;
  objc_copyWeak(v4, a1 + 5);
  v3 = a1[4];
  v4[1] = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v4);
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[4];
  id v6[2];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHighlighted:animated:", 1, 1);

  v4 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_5;
  v5[3] = &unk_1E6F4E870;
  v6[1] = *(id *)(a1 + 48);
  objc_copyWeak(v6, v2);
  dispatch_async(v4, v5);
  objc_destroyWeak(v6);
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_5(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", *(double *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_6;
  block[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v3);
}

void __60__HUItemTableViewController_highlightItemAnimated_duration___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHighlighted:animated:", 0, 1);

}

- (void)scrollToItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HUItemTableViewScrollDestination *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[HUItemTableViewScrollDestination initWithItem:animated:]([HUItemTableViewScrollDestination alloc], "initWithItem:animated:", v6, v4);

  if (-[HUItemTableViewController appearState](self, "appearState") == 1
    || -[HUItemTableViewController appearState](self, "appearState") == 2)
  {
    -[HUItemTableViewController _scrollToDestination:](self, "_scrollToDestination:", v7);
  }
  else
  {
    -[HUItemTableViewController setPendingScrollDestination:](self, "setPendingScrollDestination:", v7);
  }

}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HUItemTableViewController _itemForTextField:](self, "_itemForTextField:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v5, "textFieldDidBeginEditing:item:", v7, v4);
  }
  else if (!v4)
  {
    goto LABEL_7;
  }
  if (-[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v4))
    -[HUItemTableViewController textFieldDidBeginEditing:item:](self, "textFieldDidBeginEditing:item:", v7, v4);
LABEL_7:

}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HUItemTableViewController _itemForTextField:](self, "_itemForTextField:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "shouldManageTextFieldForItem:", v5))
      objc_msgSend(v7, "textDidChange:forTextField:item:", &stru_1E6F60E80, v4, v5);
    if (-[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v5))
      -[HUItemTableViewController textDidChange:forTextField:item:](self, "textDidChange:forTextField:item:", &stru_1E6F60E80, v4, v5);
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemTableViewController _itemForTextField:](self, "_itemForTextField:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "User finished editing text field for %@, entered: %@", (uint8_t *)&v10, 0x16u);

  }
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (objc_msgSend(v8, "shouldManageTextFieldForItem:", v5))
      objc_msgSend(v9, "textFieldDidEndEditing:item:", v4, v5);
    if (-[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v5))
      -[HUItemTableViewController textFieldDidEndEditing:item:](self, "textFieldDidEndEditing:item:", v4, v5);
  }

}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController _itemForTextField:](self, "_itemForTextField:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (objc_msgSend(v5, "shouldManageTextFieldForItem:", v4))
    {
      objc_msgSend(v9, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textDidChange:forTextField:item:", v7, v9, v4);

    }
    if (-[HUItemTableViewController shouldManageTextFieldForItem:](self, "shouldManageTextFieldForItem:", v4))
    {
      objc_msgSend(v9, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController textDidChange:forTextField:item:](self, "textDidChange:forTextField:item:", v8, v9, v4);

    }
  }

}

- (id)hu_preloadContent
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[HUItemTableViewController hasFinishedInitialLoad](self, "hasFinishedInitialLoad"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "diffableDataSourceDisabled");

    if ((v5 & 1) == 0)
      -[HUItemTableViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    if (!objc_msgSend((id)objc_opt_class(), "updateMode")
      && !-[HUItemTableViewController visibilityUpdatesEnabled](self, "visibilityUpdatesEnabled"))
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDisableExternalUpdatesWithReason:", CFSTR("HUItemTableViewController_NotVisible"));

      -[HUItemTableViewController setVisibilityUpdatesEnabled:](self, "setVisibilityUpdatesEnabled:", 1);
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "diffableDataSourceDisabled");

    if (v8)
      -[HUItemTableViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    v9 = (void *)MEMORY[0x1E0C99DE8];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstFastUpdateFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[HUItemTableViewController childViewControllersToPreload](self, "childViewControllersToPreload", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "hu_preloadContent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "na_safeAddObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    return v21;
  }
}

- (void)executionEnvironmentRunningStateDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (!objc_msgSend(a3, "runningState"))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Proceeding with full item update(s)", v6, 2u);
    }

    -[HUItemTableViewController foregroundUpdateFutures](self, "foregroundUpdateFutures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_each:", &__block_literal_global_211_0);

  }
}

uint64_t __71__HUItemTableViewController_executionEnvironmentRunningStateDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

- (HFItem)hu_presentedItem
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

+ (unint64_t)updateMode
{
  return 0;
}

- (void)recursivelyDisableItemUpdates:(BOOL)a3 withReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "disableExternalUpdatesWithReason:", v6);
  else
    objc_msgSend(v7, "endDisableExternalUpdatesWithReason:", v6);

  v9 = (void *)MEMORY[0x1E0C99E20];
  -[HUItemTableViewController childViewControllers](self, "childViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController childViewControllersToPreload](self, "childViewControllersToPreload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF230880, (_QWORD)v19))
          objc_msgSend(v18, "recursivelyDisableItemUpdates:withReason:", v4, v6);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[HUItemTableViewController _transformViewControllerForRequest:](self, "_transformViewControllerForRequest:", v5);
  -[UIViewController hu_performPresentationRequest:](self, "hu_performPresentationRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_transformViewControllerForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v18 = v6;

  v7 = v18;
  if (v18)
  {
    v8 = objc_msgSend(v18, "preferredStyle");
    v7 = v18;
    if (!v8)
    {
      objc_msgSend(v18, "popoverPresentationController");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v18;
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v18, "popoverPresentationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sourceView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v18;
        if (!v12)
        {
          -[HUItemTableViewController tableView](self, "tableView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "indexPathForSelectedRow");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[HUItemTableViewController tableView](self, "tableView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "cellForRowAtIndexPath:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              -[HUItemTableViewController tableView](self, "tableView");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v18, "popoverPresentationController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSourceView:", v16);

          }
          v7 = v18;
        }
      }
    }
  }

}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performDismissalRequest:](self, "hu_performDismissalRequest:", a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return -[HUItemTableViewController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", a4);
}

- (void)updateCellForItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "diffableDataSourceDisabled");

  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__HUItemTableViewController_updateCellForItems___block_invoke;
    v10[3] = &unk_1E6F599B0;
    v10[4] = self;
    objc_msgSend(v4, "na_map:", v10);
    v7 = objc_claimAutoreleasedReturnValue();

    -[HUItemTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

    v4 = (id)v7;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__HUItemTableViewController_updateCellForItems___block_invoke_2;
    v9[3] = &unk_1E6F51390;
    v9[4] = self;
    objc_msgSend(v4, "na_each:", v9);
  }

}

id __48__HUItemTableViewController_updateCellForItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__HUItemTableViewController_updateCellForItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "itemManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemManager:didUpdateResultsForItem:atIndexPath:", v7, v4, v6);

}

- (void)reloadCellForItems:(id)a3 withDiffableDataSourceReload:(BOOL)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "diffableDataSourceDisabled");

  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__HUItemTableViewController_reloadCellForItems_withDiffableDataSourceReload___block_invoke;
    v11[3] = &unk_1E6F599B0;
    v11[4] = self;
    objc_msgSend(v10, "na_map:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);

  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadUIRepresentationForItems:withAnimation:", v10, 0);

  }
}

id __77__HUItemTableViewController_reloadCellForItems_withDiffableDataSourceReload___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)wantsPreferredContentSize
{
  return self->_wantsPreferredContentSize;
}

- (unint64_t)appearState
{
  return self->_appearState;
}

- (void)setAppearState:(unint64_t)a3
{
  self->_appearState = a3;
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (BOOL)hasForcedLoadingVisibleCells
{
  return self->_hasForcedLoadingVisibleCells;
}

- (void)setHasForcedLoadingVisibleCells:(BOOL)a3
{
  self->_hasForcedLoadingVisibleCells = a3;
}

- (HUItemTableViewScrollDestination)pendingScrollDestination
{
  return self->_pendingScrollDestination;
}

- (void)setPendingScrollDestination:(id)a3
{
  objc_storeStrong((id *)&self->_pendingScrollDestination, a3);
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (NSMutableSet)internalItemModuleControllers
{
  return self->_internalItemModuleControllers;
}

- (NSMutableSet)recentlyRemovedItemModuleControllers
{
  return self->_recentlyRemovedItemModuleControllers;
}

- (BOOL)hasFinishedInitialLoad
{
  return self->_hasFinishedInitialLoad;
}

- (void)setHasFinishedInitialLoad:(BOOL)a3
{
  self->_hasFinishedInitialLoad = a3;
}

- (NSMutableArray)foregroundUpdateFutures
{
  return self->_foregroundUpdateFutures;
}

- (void)setForegroundUpdateFutures:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundUpdateFutures, a3);
}

- (NSMutableSet)registeredCellClasses
{
  return self->_registeredCellClasses;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return self->_automaticallyUpdatesViewControllerTitle;
}

- (BOOL)visibilityUpdatesEnabled
{
  return self->_visibilityUpdatesEnabled;
}

- (void)setVisibilityUpdatesEnabled:(BOOL)a3
{
  self->_visibilityUpdatesEnabled = a3;
}

- (NACancelable)deferredVisibilityUpdate
{
  return self->_deferredVisibilityUpdate;
}

- (void)setDeferredVisibilityUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_deferredVisibilityUpdate, a3);
}

- (NSMapTable)textFieldToCellMap
{
  return self->_textFieldToCellMap;
}

- (HUGridLayoutOptions)gridLayoutOptions
{
  return self->_gridLayoutOptions;
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (BOOL)shouldUseAlternateCellColor
{
  return self->_shouldUseAlternateCellColor;
}

- (void)setShouldUseAlternateCellColor:(BOOL)a3
{
  self->_shouldUseAlternateCellColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_gridLayoutOptions, 0);
  objc_storeStrong((id *)&self->_textFieldToCellMap, 0);
  objc_storeStrong((id *)&self->_deferredVisibilityUpdate, 0);
  objc_storeStrong((id *)&self->_registeredCellClasses, 0);
  objc_storeStrong((id *)&self->_foregroundUpdateFutures, 0);
  objc_storeStrong((id *)&self->_recentlyRemovedItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_internalItemModuleControllers, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_pendingScrollDestination, 0);
}

@end
