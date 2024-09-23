@implementation SFClearHistoryViewController

- (SFClearHistoryViewController)initWithTabGroupManager:(id)a3 activeProfileIdentifier:(id)a4
{
  id v6;
  id v7;
  SFClearHistoryViewController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *profiles;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  NSIndexPath *currentlySelectedTimeframeIndex;
  void *v30;
  char v31;
  uint64_t v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  NSIndexPath *currentlySelectedProfileIndex;
  void *v37;
  SFTableViewDiffableDataSource *v38;
  void *v39;
  uint64_t v40;
  SFTableViewDiffableDataSource *dataSource;
  SFClearHistoryViewController *v42;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  SFClearHistoryViewController *v50;
  _QWORD v51[4];
  id v52;
  id location;
  objc_super v54;

  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)SFClearHistoryViewController;
  v8 = -[SFClearHistoryViewController initWithStyle:](&v54, sel_initWithStyle_, 2);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC1448]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
    -[SFClearHistoryViewController navigationItem](v8, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLeftBarButtonItem:", v12);

    v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v46 = v7;
    v15 = (void *)MEMORY[0x1E0DC3428];
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke;
    v51[3] = &unk_1E21E3138;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v15, "actionWithHandler:", v51);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithBarButtonSystemItem:primaryAction:", 24, v16);
    -[SFClearHistoryViewController navigationItem](v8, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

    objc_msgSend(v6, "profiles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    profiles = v8->_profiles;
    v8->_profiles = (NSArray *)v20;

    objc_storeStrong((id *)&v8->_activeProfileIdentifier, a4);
    if (objc_msgSend(v6, "hasMultipleProfiles"))
      v22 = -[NSArray count](v8->_profiles, "count") + 1;
    else
      v22 = 0;
    v8->_numberOfProfileRows = v22;
    objc_msgSend(v6, "tabCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allNamedTabGroupsUnsorted");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v23;
    v8->_areTabGroupsInUse = objc_msgSend(v24, "count") != 0;

    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringForKey:", CFSTR("ClearHistoryLastSelectedTimeFrame"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = +[SFClearHistoryUtilities clearHistoryTimeFrameItemTypeFromString:](SFClearHistoryUtilities, "clearHistoryTimeFrameItemTypeFromString:", v26);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v27, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    currentlySelectedTimeframeIndex = v8->_currentlySelectedTimeframeIndex;
    v8->_currentlySelectedTimeframeIndex = (NSIndexPath *)v28;

    if (v8->_numberOfProfileRows)
    {
      if (v8->_activeProfileIdentifier
        && (objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults", v23),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v31 = objc_msgSend(v30, "BOOLForKey:", CFSTR("ClearHistoryLastSelectedAllProfiles")),
            v30,
            (v31 & 1) == 0))
      {
        v33 = v8->_profiles;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_2;
        v49[3] = &unk_1E21E5DD0;
        v50 = v8;
        v34 = -[NSArray indexOfObjectPassingTest:](v33, "indexOfObjectPassingTest:", v49);
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
          v32 = 0;
        else
          v32 = v34 + 1;

      }
      else
      {
        v32 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v32, 1, v44);
      v35 = objc_claimAutoreleasedReturnValue();
      currentlySelectedProfileIndex = v8->_currentlySelectedProfileIndex;
      v8->_currentlySelectedProfileIndex = (NSIndexPath *)v35;

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults", v44);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_closeAllTabsToggleEnabled = objc_msgSend(v37, "BOOLForKey:", CFSTR("ClearHistoryLastEnabledCloseAllTabs"));

    v38 = [SFTableViewDiffableDataSource alloc];
    -[SFClearHistoryViewController tableView](v8, "tableView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_3;
    v47[3] = &unk_1E21E5DF8;
    objc_copyWeak(&v48, &location);
    v40 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v38, "initWithTableView:cellProvider:", v39, v47);
    dataSource = v8->_dataSource;
    v8->_dataSource = (SFTableViewDiffableDataSource *)v40;

    -[SFTableViewDiffableDataSource setDelegate:](v8->_dataSource, "setDelegate:", v8);
    v7 = v46;
    v42 = v8;
    objc_destroyWeak(&v48);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

id __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_cellForIdentifier:indexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFClearHistoryViewController;
  -[SFClearHistoryViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SFClearHistoryViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("toggleCell"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("actionCell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFClearHistoryViewController;
  -[SFClearHistoryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFClearHistoryViewController _reloadDataAnimatingDifferences:](self, "_reloadDataAnimatingDifferences:", 0);
}

- (void)_reloadDataAnimatingDifferences:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  -[SFClearHistoryViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFClearHistoryViewController _profileIdentifiersToBeClearedWithCurrentSelection](self, "_profileIdentifiersToBeClearedWithCurrentSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cachedTabCount = objc_msgSend(v5, "clearHistoryViewController:numberOfTabsToBeClosedForProfilesWithIdentifiers:", self, v6);

  v7 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E2245DE0);
  objc_msgSend(v7, "appendItemsWithIdentifiers:", &unk_1E2245DF8);
  if (self->_numberOfProfileRows)
  {
    objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E2245E10);
    objc_msgSend(v7, "appendItemsWithIdentifiers:", &unk_1E2245E28);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = self->_profiles;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendItemsWithIdentifiers:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v10);
    }

  }
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E2245E40);
  objc_msgSend(v7, "appendItemsWithIdentifiers:", &unk_1E2245E58);
  objc_msgSend(v7, "appendSectionsWithIdentifiers:", &unk_1E2245E70);
  objc_msgSend(v7, "appendItemsWithIdentifiers:", &unk_1E2245E88);
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v7, v3);
  -[SFClearHistoryViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

  -[SFClearHistoryViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

  -[SFClearHistoryViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sheetPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "invalidateDetents");
  v19 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
  objc_msgSend(v19, "defaultContentConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentConfiguration:", v20);

  objc_msgSend(v19, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__SFClearHistoryViewController__reloadDataAnimatingDifferences___block_invoke;
  v25[3] = &unk_1E21E5E20;
  v25[4] = self;
  v25[5] = v21;
  objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", 0, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v22;
  objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDetents:", v24);

}

double __64__SFClearHistoryViewController__reloadDataAnimatingDifferences___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5 + *(double *)(a1 + 40);
  objc_msgSend(v3, "maximumDetentValue");
  if (v6 >= v7)
  {
    objc_msgSend(v3, "maximumDetentValue");
    v10 = v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentSize");
    v10 = v9 + *(double *)(a1 + 40);

  }
  return v10;
}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[UITableViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  switch(v9)
  {
    case 0:
      -[SFClearHistoryViewController _cellForTimeFrameItemIdentifier:indexPath:](self, "_cellForTimeFrameItemIdentifier:indexPath:", v6, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[SFClearHistoryViewController _cellForProfileItemIdentifier:indexPath:](self, "_cellForProfileItemIdentifier:indexPath:", v6, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[SFClearHistoryViewController _cellForAdditionalOptionsItemIdentifier:indexPath:](self, "_cellForAdditionalOptionsItemIdentifier:indexPath:", v6, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[SFClearHistoryViewController _cellForActionItemIdentifier:indexPath:](self, "_cellForActionItemIdentifier:indexPath:", v6, v7);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = (void *)v10;
      break;
    default:
      -[SFClearHistoryViewController tableView](self, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v12;
}

- (id)_cellForTimeFrameItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  -[SFClearHistoryViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "integerValue");
  switch(v10)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v11);

      break;
    default:
      break;
  }
  if (objc_msgSend(v6, "isEqual:", self->_currentlySelectedTimeframeIndex))
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v9, "setAccessoryType:", v13);

  return v9;
}

- (id)_cellForProfileItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[SFClearHistoryViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_currentlySelectedProfileIndex))
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v9, "setAccessoryType:", v10);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", objc_msgSend(v6, "row") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

  }
  else
  {
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);
  }

  return v9;
}

- (id)_cellForAdditionalOptionsItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  if (objc_msgSend(a3, "integerValue") == 5)
  {
    -[SFClearHistoryViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("toggleCell"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    objc_msgSend(v8, "setSelectionStyle:", 0);
    v11 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v11, "setOn:", self->_closeAllTabsToggleEnabled);
    objc_msgSend(v11, "setEnabled:", self->_cachedTabCount != 0);
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("CloseAllTabsSwitch"));
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_toggleSwitchChanged_, 4096);
    objc_msgSend(v8, "setAccessoryView:", v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_cellForActionItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
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
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a3, "integerValue") == 6)
  {
    -[SFClearHistoryViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("actionCell"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3520], "borderedProminentButtonConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInsets");
    objc_msgSend(v9, "setContentInsets:", v10 + 8.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBaseForegroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBaseBackgroundColor:", v12);

    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v16);
    objc_msgSend(v9, "setAttributedTitle:", v17);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("ClearHistoryButton"));
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_submitButtonTapped_, 64);
    objc_msgSend(v8, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v20);

    v21 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v8, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v23);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)toggleSwitchChanged:(id)a3
{
  self->_closeAllTabsToggleEnabled = objc_msgSend(a3, "isOn");
}

- (id)_profileIdentifiersToBeClearedWithCurrentSelection
{
  void *v3;
  void *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D89E20]);
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", self->_currentlySelectedProfileIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", -[NSIndexPath row](self->_currentlySelectedProfileIndex, "row") - 1);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

LABEL_12:
      goto LABEL_13;
    }
    if (objc_msgSend(v4, "integerValue") == 4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = self->_profiles;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "identifier", (_QWORD)v13);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }
      goto LABEL_12;
    }
  }
LABEL_13:

  return v3;
}

- (void)submitButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", self->_currentlySelectedTimeframeIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  +[SFClearHistoryUtilities clearHistoryTimeFrameStringFromItemType:](SFClearHistoryUtilities, "clearHistoryTimeFrameStringFromItemType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("ClearHistoryLastSelectedTimeFrame"));

  v31 = v6;
  switch(v7)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3600.0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v11 = (void *)MEMORY[0x1E0C99D68];
      v12 = 0;
      goto LABEL_5;
    case 2:
      v11 = (void *)MEMORY[0x1E0C99D68];
      v12 = 1;
LABEL_5:
      objc_msgSend(v11, "safari_dateOfMidnightNumberOfDaysAgo:", v12);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (void *)v10;

      v4 = v13;
      break;
    default:
      break;
  }
  v14 = (id)*MEMORY[0x1E0D89E20];
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", self->_currentlySelectedProfileIndex);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v30 = v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v5;
    -[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", -[NSIndexPath row](self->_currentlySelectedProfileIndex, "row") - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v17;
LABEL_12:
    v29 = v8;
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("ClearHistoryLastSelectedAllProfiles"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("profile: %@"), v15);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v15, "integerValue") != 4)
    goto LABEL_19;
  v29 = v8;
  v30 = v5;
  v26 = -[NSArray count](self->_profiles, "count") > 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v28, CFSTR("ClearHistoryLastSelectedAllProfiles"));

  v20 = CFSTR("All profiles");
LABEL_13:
  v21 = WBS_LOG_CHANNEL_PREFIXProfiles();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (self->_closeAllTabsToggleEnabled)
      v22 = MEMORY[0x1E0C9AAB0];
    else
      v22 = MEMORY[0x1E0C9AAA0];
    *(_DWORD *)buf = 138412546;
    v33 = v20;
    v34 = 2112;
    v35 = v22;
    _os_log_impl(&dword_18B7B2000, v21, OS_LOG_TYPE_INFO, "Clearing history for %@; closeAllTabs: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_closeAllTabsToggleEnabled);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("ClearHistoryLastEnabledCloseAllTabs"));

  -[SFClearHistoryViewController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  objc_msgSend(v25, "clearHistoryViewController:clearHistoryVisitsAddedAfterDate:beforeDate:profileIdentifier:clearAllProfiles:closeAllTabs:", self, v4);

  -[SFClearHistoryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = v31;
  v8 = v29;
LABEL_19:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int *v10;
  id *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  if (!v9)
  {
    v10 = &OBJC_IVAR___SFClearHistoryViewController__currentlySelectedTimeframeIndex;
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    v10 = &OBJC_IVAR___SFClearHistoryViewController__currentlySelectedProfileIndex;
LABEL_5:
    v11 = (id *)((char *)&self->super.super.super.super.isa + *v10);
    objc_msgSend(v13, "cellForRowAtIndexPath:", *v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessoryType:", 0);
    objc_msgSend(v7, "setAccessoryType:", 3);
    objc_storeStrong(v11, a4);

  }
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "sectionIdentifierForIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "integerValue") > 2)
  {
    v5 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4
{
  void *v5;
  unint64_t cachedTabCount;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "sectionIdentifierForIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue") == 2)
  {
    cachedTabCount = self->_cachedTabCount;
    if (self->_areTabGroupsInUse)
    {
      if (cachedTabCount)
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
LABEL_8:
        _WBSLocalizedString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringWithFormat:", v9, self->_cachedTabCount);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    else if (cachedTabCount)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      goto LABEL_8;
    }
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (SFClearHistoryViewControllerDelegate)delegate
{
  return (SFClearHistoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentlySelectedProfileIndex, 0);
  objc_storeStrong((id *)&self->_currentlySelectedTimeframeIndex, 0);
}

@end
