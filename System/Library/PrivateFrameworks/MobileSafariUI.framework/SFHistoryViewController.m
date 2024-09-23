@implementation SFHistoryViewController

- (SFHistoryViewController)initWithHistory:(id)a3
{
  id v4;
  void *v5;
  SFHistoryViewController *v6;
  void *v7;
  SFHistoryViewDataSource *v8;
  SFHistoryViewDataSource *historyDataSource;
  WBSSiriIntelligenceHistorySearch *v10;
  WBSSiriIntelligenceHistorySearch *siriHistorySearch;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableSet *expandedSessionIdentifiers;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableSet *collapsedSessionIdentifiers;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *ignoredSiriSuggestedSitesQueue;
  SFHistoryViewController *v29;
  objc_super v31;

  v4 = a3;
  -[SFHistoryViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)SFHistoryViewController;
  v6 = -[SFHistoryViewController initWithCollectionViewLayout:](&v31, sel_initWithCollectionViewLayout_, v5);

  if (v6)
  {
    WebBookmarksHistoryFolderTitle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHistoryViewController setTitle:](v6, "setTitle:", v7);

    -[SFHistoryViewController setClearsSelectionOnViewWillAppear:](v6, "setClearsSelectionOnViewWillAppear:", 0);
    v8 = -[SFHistoryViewDataSource initWithHistory:]([SFHistoryViewDataSource alloc], "initWithHistory:", v4);
    historyDataSource = v6->_historyDataSource;
    v6->_historyDataSource = v8;

    -[SFHistoryViewDataSource setDelegate:](v6->_historyDataSource, "setDelegate:", v6);
    v10 = (WBSSiriIntelligenceHistorySearch *)objc_alloc_init(MEMORY[0x1E0D8AC88]);
    siriHistorySearch = v6->_siriHistorySearch;
    v6->_siriHistorySearch = v10;

    -[SFHistoryViewController _savedStateDictionary](v6, "_savedStateDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("savedExpandedSections"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = MEMORY[0x1E0C9AA60];
    if (v14)
      v17 = v14;
    else
      v17 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v13, "setWithArray:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    expandedSessionIdentifiers = v6->_expandedSessionIdentifiers;
    v6->_expandedSessionIdentifiers = (NSMutableSet *)v18;

    v20 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("savedCollapsedSections"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = v21;
    else
      v23 = v16;
    objc_msgSend(v20, "setWithArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    collapsedSessionIdentifiers = v6->_collapsedSessionIdentifiers;
    v6->_collapsedSessionIdentifiers = (NSMutableSet *)v24;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.mobilesafari.SFHistoryViewController.IgnoredSiriSuggestedSites", v26);
    ignoredSiriSuggestedSitesQueue = v6->_ignoredSiriSuggestedSitesQueue;
    v6->_ignoredSiriSuggestedSitesQueue = (OS_dispatch_queue *)v27;

    v29 = v6;
  }

  return v6;
}

- (History)history
{
  return -[SFHistoryViewDataSource history](self->_historyDataSource, "history");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  int shouldUseSearchControllerInNavigationItem;
  void *v10;
  UISearchController *v11;
  UISearchController *searchController;
  UISearchController *v13;
  UISearchBar *v14;
  UISearchBar *searchBar;
  UISearchBar *v16;
  UISearchBar *v17;
  void *v18;
  double Width;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  UICollectionViewDiffableDataSource *v27;
  UICollectionViewDiffableDataSource *collectionDataSource;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  objc_super v42;
  CGRect v43;

  v42.receiver = self;
  v42.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController viewDidLoad](&v42, sel_viewDidLoad);
  self->_needsContentOffsetUpdate = 1;
  -[SFHistoryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v3, "setDragDelegate:", self);
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("HistoryCollectionView"));
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[SFHistoryViewController _makeHeaderRegistration](self, "_makeHeaderRegistration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFHistoryViewController _makeHistoryCellRegistration](self, "_makeHistoryCellRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFHistoryViewController _makeSearchBarContainerRegistration](self, "_makeSearchBarContainerRegistration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    shouldUseSearchControllerInNavigationItem = objc_msgSend(WeakRetained, "panelViewControllerShouldUseSearchControllerInNavigationItem:", self);
    self->_shouldUseSearchControllerInNavigationItem = shouldUseSearchControllerInNavigationItem;
  }
  else
  {
    shouldUseSearchControllerInNavigationItem = self->_shouldUseSearchControllerInNavigationItem;
  }
  v32 = WeakRetained;
  if (shouldUseSearchControllerInNavigationItem)
  {
    -[SFHistoryViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    -[UISearchController setObscuresBackgroundDuringPresentation:](v11, "setObscuresBackgroundDuringPresentation:", 0);
    objc_msgSend(v10, "setPreferredSearchBarPlacement:", 2);
    objc_msgSend(v10, "setSearchController:", v11);
    searchController = self->_searchController;
    self->_searchController = v11;
    v13 = v11;

    -[UISearchController searchBar](v13, "searchBar");
    v14 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    searchBar = self->_searchBar;
    self->_searchBar = v14;

  }
  else
  {
    v16 = (UISearchBar *)objc_alloc_init(MEMORY[0x1E0DC3C38]);
    v17 = self->_searchBar;
    self->_searchBar = v16;

    -[SFHistoryViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    Width = CGRectGetWidth(v43);
    -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, 0.0, Width, v20);

    -[UISearchBar setSearchBarStyle:](self->_searchBar, "setSearchBarStyle:", 2);
  }
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v21);

  -[UISearchBar setAccessibilityIdentifier:](self->_searchBar, "setAccessibilityIdentifier:", CFSTR("HistoryCollectionViewSearchBar"));
  v22 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v23 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __38__SFHistoryViewController_viewDidLoad__block_invoke;
  v38[3] = &unk_1E9CF50B0;
  v38[4] = self;
  v24 = v7;
  v39 = v24;
  v25 = v5;
  v40 = v25;
  v26 = v6;
  v41 = v26;
  v27 = (UICollectionViewDiffableDataSource *)objc_msgSend(v22, "initWithCollectionView:cellProvider:", v3, v38);
  collectionDataSource = self->_collectionDataSource;
  self->_collectionDataSource = v27;

  objc_initWeak(&location, self);
  v35[0] = v23;
  v35[1] = 3221225472;
  v35[2] = __38__SFHistoryViewController_viewDidLoad__block_invoke_2;
  v35[3] = &unk_1E9CF9F10;
  objc_copyWeak(&v36, &location);
  -[UICollectionViewDiffableDataSource sectionSnapshotHandlers](self->_collectionDataSource, "sectionSnapshotHandlers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWillCollapseItemHandler:", v35);

  v33[0] = v23;
  v33[1] = 3221225472;
  v33[2] = __38__SFHistoryViewController_viewDidLoad__block_invoke_3;
  v33[3] = &unk_1E9CF9F10;
  objc_copyWeak(&v34, &location);
  -[UICollectionViewDiffableDataSource sectionSnapshotHandlers](self->_collectionDataSource, "sectionSnapshotHandlers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWillExpandItemHandler:", v33);

  -[SFHistoryViewController _toolbarItems](self, "_toolbarItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFHistoryViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v31, 0);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

id __38__SFHistoryViewController_viewDidLoad__block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "section") || objc_msgSend(v8, "row") || *(_BYTE *)(a1[4] + 1104))
  {
    v10 = objc_msgSend(v8, "row");
    v11 = a1 + 7;
    if (!v10)
      v11 = a1 + 6;
  }
  else
  {
    v11 = a1 + 5;
  }
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __38__SFHistoryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[139];
    v6 = v10;
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);

    v8 = (void *)v4[140];
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    objc_msgSend(v4, "_deselectHistoryItemsInSession:", v6);
  }

}

void __38__SFHistoryViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[139];
    v6 = v10;
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    v8 = (void *)v4[140];
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "removeObject:", v9);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[SFHistoryViewController _saveViewState](self, "_saveViewState");
  -[SFHistoryViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissMenu");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SFHistoryViewController setEditing:](self, "setEditing:", 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SFHistoryViewController _reconfigureItemsIfNeeded](self, "_reconfigureItemsIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  UISearchBar *searchBar;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[SFHistoryViewController _updateContentOffsetIfNeeded](self, "_updateContentOffsetIfNeeded");
  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    searchBar = self->_searchBar;
    -[SFHistoryViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutMargins");
    -[UISearchBar _setOverrideContentInsets:forRectEdges:](searchBar, "_setOverrideContentInsets:forRectEdges:", 10);

  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setPinnedPaletteForPanelViewController:", self);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  objc_super v14;

  v4 = a4;
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFHistoryViewController;
  -[SFHistoryViewController setEditing:animated:](&v14, sel_setEditing_animated_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "panelViewController:updateToolbarItemsAnimated:", self, v4);
  }
  else
  {
    -[SFHistoryViewController _toolbarItems](self, "_toolbarItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHistoryViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v8, v4);

  }
  v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v10)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Begin editing history items", v13, 2u);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "panelViewControllerDidBeginEditing:", self);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "End editing history items", v13, 2u);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "panelViewControllerDidEndEditing:", self);
  }
  -[SFHistoryViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathsForVisibleItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFHistoryViewController _addIndexPathsOfItemsNeedingReconfiguration:](self, "_addIndexPathsOfItemsNeedingReconfiguration:", v12);

}

- (id)_makeHeaderRegistration
{
  return (id)objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_58);
}

void __50__SFHistoryViewController__makeHeaderRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a2;
  objc_msgSend(v5, "prominentInsetGroupedHeaderConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v9);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3588]);
  objc_msgSend(v10, "setDisplayedState:", 0);
  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessories:", v11);

}

- (id)_makeHistoryCellRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __55__SFHistoryViewController__makeHistoryCellRegistration__block_invoke;
  v8 = &unk_1E9CF9F78;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __55__SFHistoryViewController__makeHistoryCellRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id *WeakRetained;
  id *v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "setAutomaticallyUpdatesContentConfiguration:", 1);
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[History titleForHistoryItem:](History, "titleForHistoryItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setURL:withTitle:", v8, v9);

  v10 = objc_alloc_init(MEMORY[0x1E0DC3580]);
  objc_msgSend(v10, "setDisplayedState:", 1);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessories:", v11);

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("HistoryCollectionViewCell"));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = objc_loadWeakRetained(WeakRetained + 147);
    objc_msgSend(v14, "activeProfileIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_annotateWithHistoryItem:inProfile:", v7, v15);

    objc_msgSend(v6, "safari_updateVisualStateIsSelected:isEditing:", objc_msgSend(v6, "isSelected"), objc_msgSend(v13, "isEditing"));
  }

}

- (id)_makeSearchBarContainerRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __62__SFHistoryViewController__makeSearchBarContainerRegistration__block_invoke;
  v8 = &unk_1E9CF9FA0;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __62__SFHistoryViewController__makeSearchBarContainerRegistration__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(v5, "setSearchBar:", *((_QWORD *)WeakRetained + 136));

}

- (id)_createCollectionViewLayout
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(v2, "setHeaderMode:", 2);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SFHistoryViewController__createCollectionViewLayout__block_invoke;
  v11[3] = &unk_1E9CF5010;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v2, "setTrailingSwipeActionsConfigurationProvider:", v11);
  v4 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __54__SFHistoryViewController__createCollectionViewLayout__block_invoke_2;
  v8[3] = &unk_1E9CF9FC8;
  objc_copyWeak(&v10, &location);
  v5 = v2;
  v9 = v5;
  v6 = (void *)objc_msgSend(v4, "initWithSectionProvider:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v6;
}

id __54__SFHistoryViewController__createCollectionViewLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_trailingSwipeActionConfigurationForIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __54__SFHistoryViewController__createCollectionViewLayout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 || *((_BYTE *)WeakRetained + 1104))
    {
      objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 1);
      objc_msgSend(v8, "setShowsSeparators:", 0);
      objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_reloadWithSessions:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSOrderedSet *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  NSOrderedSet **p_sessions;
  void *v48;
  void *v49;
  SFHistoryViewController *v50;
  NSOrderedSet *v51;
  id obj;
  id obja;
  _BOOL4 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  void *v67;
  _QWORD v68[3];

  v54 = a4;
  v68[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v51 = self->_sessions;
  objc_storeStrong((id *)&self->_sessions, v5);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    if (-[NSOrderedSet count](self->_sessions, "count")
      || (-[UISearchBar isFirstResponder](self->_searchBar, "isFirstResponder") & 1) != 0
      || (-[UISearchBar text](self->_searchBar, "text"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      +[SFSearchBarContainerCell dataSourceSectionIdentifier](SFSearchBarContainerCell, "dataSourceSectionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendSectionsWithIdentifiers:", v9);

      +[SFSearchBarContainerCell dataSourceItemIdentifier](SFSearchBarContainerCell, "dataSourceItemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:", v11);

    }
  }
  objc_msgSend(v5, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v12);

  -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = self;
  p_sessions = &self->_sessions;
  v48 = v6;
  if (objc_msgSend(v49, "numberOfSections") >= 2 && !self->_shouldUseSearchControllerInNavigationItem
    || objc_msgSend(v49, "numberOfItems") && self->_shouldUseSearchControllerInNavigationItem)
  {
    obj = v5;
    objc_msgSend(v6, "sectionIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v49;
    objc_msgSend(v49, "sectionIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "differenceFromArray:withOptions:", v15, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "sectionIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safari_removalIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectsAtIndexes:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "deleteSectionsWithIdentifiers:", v19);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v46 = v16;
    objc_msgSend(v16, "insertions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v60 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v26 = objc_msgSend(v25, "index");
          v27 = v14;
          v28 = objc_msgSend(v14, "numberOfSections");
          objc_msgSend(v25, "object");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v26 == v28)
          {
            v65 = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "appendSectionsWithIdentifiers:", v31);
          }
          else
          {
            v64 = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "sectionIdentifiers");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectAtIndexedSubscript:", v26);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v31, v33);

          }
          v14 = v27;

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      }
      while (v22);
    }

    self = v50;
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](v50->_collectionDataSource, "applySnapshot:animatingDifferences:", v14, v54);

    v5 = obj;
  }
  else
  {
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_collectionDataSource, "applySnapshot:animatingDifferences:", v6, v54);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obja = v5;
  v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  v35 = v51;
  if (v34)
  {
    v36 = v34;
    v37 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v56 != v37)
          objc_enumerationMutation(obja);
        v39 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        v40 = -[NSOrderedSet indexOfObject:](v35, "indexOfObject:", v39);
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[SFHistoryViewController _reloadItemsInSession:animated:](self, "_reloadItemsInSession:animated:", v39, v54);
          continue;
        }
        -[NSOrderedSet objectAtIndexedSubscript:](v35, "objectAtIndexedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISearchBar text](self->_searchBar, "text");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "length"))
        {

LABEL_34:
          -[SFHistoryViewController _reloadItemsInSession:animated:](self, "_reloadItemsInSession:animated:", v39, v54);
          goto LABEL_35;
        }
        objc_msgSend(v41, "historyItems");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "historyItems");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqualToOrderedSet:", v44);

        v35 = v51;
        self = v50;

        if ((v45 & 1) == 0)
          goto LABEL_34;
LABEL_35:

      }
      v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v36);
  }

  if (-[NSOrderedSet count](*p_sessions, "count"))
    -[SFHistoryViewController _clearExplanationView](self, "_clearExplanationView");
  else
    -[SFHistoryViewController _showExplanationView](self, "_showExplanationView");

}

- (void)_showExplanationView
{
  void *v3;
  uint64_t v4;
  UIView *v5;
  void *v6;
  UIView *explanationView;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_explanationView)
    -[SFHistoryViewController _clearExplanationView](self, "_clearExplanationView");
  -[UISearchBar text](self->_searchBar, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v13);
  -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[SFHistoryViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UIView setFrame:](v5, "setFrame:");

  -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  explanationView = self->_explanationView;
  self->_explanationView = v5;
  v8 = v5;

  -[SFHistoryViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_explanationView);

  -[SFHistoryViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v4)
    objc_msgSend(v11, "setActive:", 0);
  if ((objc_msgSend(v12, "isActive") & 1) == 0)
    objc_msgSend(v10, "setSearchController:", 0);

}

- (void)_clearExplanationView
{
  UIView *explanationView;
  void *v4;
  void *v5;
  UISearchController *searchController;
  id v7;

  -[UIView removeFromSuperview](self->_explanationView, "removeFromSuperview");
  explanationView = self->_explanationView;
  self->_explanationView = 0;

  -[SFHistoryViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    searchController = self->_searchController;
    -[SFHistoryViewController navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchController:", searchController);

  }
}

- (void)_reloadItemsInSession:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItems:", v8);

  objc_msgSend(v6, "historyItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItems:intoParentItem:", v10, v6);

  if (-[SFHistoryViewController _shouldSessionBeExpanded:](self, "_shouldSessionBeExpanded:", v6))
  {
    v13 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandItems:", v11);
  }
  else
  {
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collapseItems:", v11);
  }

  -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:](self->_collectionDataSource, "applySnapshot:toSection:animatingDifferences:", v7, v6, v4);
}

- (BOOL)_shouldSessionBeExpanded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  NSMutableSet *collapsedSessionIdentifiers;
  void *v9;
  NSMutableSet *expandedSessionIdentifiers;
  void *v11;
  void *v12;

  v4 = a3;
  -[UISearchBar text](self->_searchBar, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    collapsedSessionIdentifiers = self->_collapsedSessionIdentifiers;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(collapsedSessionIdentifiers) = -[NSMutableSet containsObject:](collapsedSessionIdentifiers, "containsObject:", v9);

    if ((collapsedSessionIdentifiers & 1) != 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    expandedSessionIdentifiers = self->_expandedSessionIdentifiers;
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(expandedSessionIdentifiers) = -[NSMutableSet containsObject:](expandedSessionIdentifiers, "containsObject:", v11);

    if ((expandedSessionIdentifiers & 1) == 0)
    {
      objc_msgSend(v4, "lastVisitedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v12, "safari_isInToday");

      goto LABEL_7;
    }
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)_addIndexPathsOfItemsNeedingReconfiguration:(id)a3
{
  NSMutableSet *indexPathsOfItemsNeedingReconfiguration;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  indexPathsOfItemsNeedingReconfiguration = self->_indexPathsOfItemsNeedingReconfiguration;
  if (indexPathsOfItemsNeedingReconfiguration)
  {
    -[NSMutableSet addObjectsFromArray:](indexPathsOfItemsNeedingReconfiguration, "addObjectsFromArray:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_indexPathsOfItemsNeedingReconfiguration;
    self->_indexPathsOfItemsNeedingReconfiguration = v5;

  }
  -[SFHistoryViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_reconfigureItemsIfNeeded
{
  void *v3;
  NSMutableSet *indexPathsOfItemsNeedingReconfiguration;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (-[NSMutableSet count](self->_indexPathsOfItemsNeedingReconfiguration, "count"))
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet allObjects](self->_indexPathsOfItemsNeedingReconfiguration, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    indexPathsOfItemsNeedingReconfiguration = self->_indexPathsOfItemsNeedingReconfiguration;
    self->_indexPathsOfItemsNeedingReconfiguration = 0;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SFHistoryViewController__reconfigureItemsIfNeeded__block_invoke;
    v7[3] = &unk_1E9CF9FF0;
    v7[4] = self;
    objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v5);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_collectionDataSource, "applySnapshot:animatingDifferences:", v6, 0);
  }
}

uint64_t __52__SFHistoryViewController__reconfigureItemsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "itemIdentifierForIndexPath:", a2);
}

- (id)_toolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  if (-[SFHistoryViewController isEditing](self, "isEditing"))
  {
    -[SFHistoryViewController _doneBarButtonItem](self, "_doneBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    -[SFHistoryViewController _deleteSelectedBarButtonItem](self, "_deleteSelectedBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    v6 = v10;
  }
  else
  {
    -[SFHistoryViewController _editBarButtonItem](self, "_editBarButtonItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    -[SFHistoryViewController _clearHistoryBarButtonItem](self, "_clearHistoryBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    v6 = v9;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_editBarButtonItem
{
  UIBarButtonItem *editButton;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  editButton = self->_editButton;
  if (!editButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 0, self, sel__toggleEditMode);
    v7 = self->_editButton;
    self->_editButton = v6;

    editButton = self->_editButton;
  }
  return editButton;
}

- (id)_doneBarButtonItem
{
  UIBarButtonItem *doneEditingButton;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  doneEditingButton = self->_doneEditingButton;
  if (!doneEditingButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 0, self, sel__toggleEditMode);
    v7 = self->_doneEditingButton;
    self->_doneEditingButton = v6;

    doneEditingButton = self->_doneEditingButton;
  }
  return doneEditingButton;
}

- (id)_clearHistoryBarButtonItem
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *clearHistoryButton;

  if (!self->_clearHistoryButton)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, 0, 0);
    clearHistoryButton = self->_clearHistoryButton;
    self->_clearHistoryButton = v5;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_clearHistoryButton, "setAccessibilityIdentifier:", CFSTR("ShowClearHistoryOptionsButton"));
    -[SFHistoryViewController _configureClearHistoryButton](self, "_configureClearHistoryButton");
  }
  -[SFHistoryViewController updateClearHistoryButtonEnabled](self, "updateClearHistoryButtonEnabled");
  return self->_clearHistoryButton;
}

- (id)_deleteSelectedBarButtonItem
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *deleteItemsButton;
  void *v7;

  if (!self->_deleteItemsButton)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__deleteCurrentlySelectedItems);
    deleteItemsButton = self->_deleteItemsButton;
    self->_deleteItemsButton = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](self->_deleteItemsButton, "setTintColor:", v7);

  }
  -[SFHistoryViewController _updateDeleteSelectedItemsButtonEnabled](self, "_updateDeleteSelectedItemsButtonEnabled");
  return self->_deleteItemsButton;
}

- (void)_configureClearHistoryButton
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](self->_clearHistoryButton, "setTintColor:", v3);

  -[UIBarButtonItem setTarget:](self->_clearHistoryButton, "setTarget:", self);
  -[UIBarButtonItem setAction:](self->_clearHistoryButton, "setAction:", sel__showClearHistoryMenu_);
}

- (void)_showClearHistoryMenu:(id)a3
{
  SafariClearBrowsingDataController *clearBrowsingDataController;
  SafariClearBrowsingDataController *v5;
  SafariClearBrowsingDataController *v6;
  id WeakRetained;

  clearBrowsingDataController = self->_clearBrowsingDataController;
  if (!clearBrowsingDataController)
  {
    v5 = objc_alloc_init(SafariClearBrowsingDataController);
    v6 = self->_clearBrowsingDataController;
    self->_clearBrowsingDataController = v5;

    WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    -[SafariClearBrowsingDataController setTabGroupProvider:](self->_clearBrowsingDataController, "setTabGroupProvider:", WeakRetained);

    clearBrowsingDataController = self->_clearBrowsingDataController;
  }
  -[SafariClearBrowsingDataController showClearHistoryMenuFromViewController:](clearBrowsingDataController, "showClearHistoryMenuFromViewController:", self);
}

- (void)updateClearHistoryButtonEnabled
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke;
  v3[3] = &unk_1E9CF89E0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "determineIfPrivateBrowsingIsAvailableWithCompletionHandler:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke_2;
  v3[3] = &unk_1E9CF4B30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __58__SFHistoryViewController_updateClearHistoryButtonEnabled__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  BOOL v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (objc_msgSend(WeakRetained[128], "count"))
      v3 = *(_BYTE *)(a1 + 40) != 0;
    else
      v3 = 0;
    *((_BYTE *)v4 + 1033) = v3;
    objc_msgSend(v4[132], "setEnabled:");
    WeakRetained = v4;
  }

}

- (void)_updateDeleteSelectedItemsButtonEnabled
{
  void *v3;
  _BOOL8 allowClearingHistory;
  id v5;

  -[SFHistoryViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    allowClearingHistory = self->_allowClearingHistory;
  else
    allowClearingHistory = 0;
  -[UIBarButtonItem setEnabled:](self->_deleteItemsButton, "setEnabled:", allowClearingHistory);

}

- (id)_clearHistoryText
{
  void *v2;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isCloudHistoryEnabled");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_toggleEditMode
{
  -[SFHistoryViewController setEditing:animated:](self, "setEditing:animated:", -[SFHistoryViewController isEditing](self, "isEditing") ^ 1, 1);
}

- (void)_deleteCurrentlySelectedItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SFHistoryViewDataSource *historyDataSource;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];

  -[SFHistoryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke;
  v11[3] = &unk_1E9CF9FF0;
  v11[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFHistoryViewController _removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:](self, "_removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:", v6);
  objc_initWeak(&location, self);
  historyDataSource = self->_historyDataSource;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke_2;
  v8[3] = &unk_1E9CF25A0;
  objc_copyWeak(&v9, &location);
  -[SFHistoryViewDataSource deleteHistoryItems:completionHandler:](historyDataSource, "deleteHistoryItems:completionHandler:", v6, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

uint64_t __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "itemIdentifierForIndexPath:", a2);
}

void __56__SFHistoryViewController__deleteCurrentlySelectedItems__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDeleteSelectedItemsButtonEnabled");

}

- (id)_trailingSwipeActionConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_allowClearingHistory)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke;
    aBlock[3] = &unk_1E9CFA018;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    v5 = _Block_copy(aBlock);
    v6 = (void *)MEMORY[0x1E0DC36C8];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextualActionWithStyle:title:handler:", 1, v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v9);

    v10 = (void *)MEMORY[0x1E0DC3D08];
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithActions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 126), "itemIdentifierForIndexPath:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "historyItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "_removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:", v10);
    v11 = (void *)v7[127];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2;
    v12[3] = &unk_1E9CF1950;
    v13 = v5;
    objc_msgSend(v11, "deleteHistoryItems:completionHandler:", v10, v12);

  }
}

uint64_t __73__SFHistoryViewController__trailingSwipeActionConfigurationForIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:(id)a3
{
  id v4;
  NSObject *ignoredSiriSuggestedSitesQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SFHistoryViewController *v9;

  v4 = a3;
  ignoredSiriSuggestedSitesQueue = self->_ignoredSiriSuggestedSitesQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__SFHistoryViewController__removeIgnoredSiriSuggestedSiteRecordsForHistoryItems___block_invoke;
  v7[3] = &unk_1E9CF1830;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(ignoredSiriSuggestedSitesQueue, v7);

}

void __81__SFHistoryViewController__removeIgnoredSiriSuggestedSiteRecordsForHistoryItems___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "safari_mapObjectsUsingBlock:", &__block_literal_global_113_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1176));
  objc_msgSend(WeakRetained, "activeProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userVisibleQueryFromSearchURL:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          objc_msgSend(v14, "removeIgnoredSiriSuggestedSitesInProfile:query:", v5, v13);
        }
        else
        {
          objc_msgSend(v11, "host");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeIgnoredSiriSuggestedSitesInProfile:visitedURLHost:", v5, v16);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

uint64_t __81__SFHistoryViewController__removeIgnoredSiriSuggestedSiteRecordsForHistoryItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

- (id)_previewMenuForHistoryItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
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
  id *v32;
  id *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  id v45;
  id location;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];

  v49[3] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safari_mapObjectsUsingBlock:", &__block_literal_global_117_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_2;
  v47[3] = &unk_1E9CF3058;
  v11 = v6;
  v48 = v11;
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  objc_initWeak(&location, self);
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_3;
  aBlock[3] = &unk_1E9CF6DE0;
  v32 = &v45;
  objc_copyWeak(&v45, &location);
  v13 = v11;
  v44 = v13;
  v14 = _Block_copy(aBlock);
  v15 = (void *)MEMORY[0x1E0DC3428];
  v41[0] = v10;
  v41[1] = 3221225472;
  v41[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_5;
  v41[3] = &unk_1E9CF1950;
  v16 = v14;
  v42 = v16;
  objc_msgSend(v15, "_sf_openInNewTabActionWithHandler:", v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  if (objc_msgSend(v13, "count") == 1)
  {
    -[SFHistoryViewController tabGroupProvider](self, "tabGroupProvider", &v45);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v10;
    v39[1] = 3221225472;
    v39[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_6;
    v39[3] = &unk_1E9CF1950;
    v40 = v16;
    objc_msgSend(v18, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v19, 0, v39);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

  }
  if (self->_allowClearingHistory)
  {
    v21 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v10;
    v36[1] = 3221225472;
    v36[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_7;
    v36[3] = &unk_1E9CF8600;
    objc_copyWeak(&v38, &location);
    v37 = v35;
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, v23, 0, v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setAttributes:", 2);
    objc_msgSend(v34, "addObject:", v24);

    objc_destroyWeak(&v38);
  }
  v25 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v4, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v26;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v27;
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "menuWithTitle:children:", &stru_1E9CFDBB0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);

  return v30;
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

void __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setURLs:", v1);

}

void __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id *WeakRetained;
  _QWORD v14[4];
  id v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredTabOrder:", a2);
    objc_msgSend(v4, "setPrefersOpenInNewTab:", 1);
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(void **)(a1 + 32);
    if (v5 < 2)
    {
      objc_msgSend(v6, "firstObject", WeakRetained);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationIntentWithURL:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_4;
      v14[3] = &unk_1E9CF55B8;
      v7 = v4;
      v15 = v7;
      objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v14, WeakRetained);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationIntentWithMultipleIntents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v15;
    }

    v11 = objc_loadWeakRetained(WeakRetained + 145);
    objc_msgSend(v11, "dispatchNavigationIntent:", v9);

    if (objc_msgSend(v9, "shouldOrderToForeground"))
    {
      v12 = objc_loadWeakRetained(WeakRetained + 147);
      objc_msgSend(v12, "removeSingleBlankTabFromActiveTabGroup");

    }
  }

}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "navigationIntentWithHistoryURL:", a2);
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SFHistoryViewController__previewMenuForHistoryItems___block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeIgnoredSiriSuggestedSiteRecordsForHistoryItems:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3[127], "deleteHistoryItems:completionHandler:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v3;
  }

}

- (void)_deselectHistoryItemsInSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SFHistoryViewController isEditing](self, "isEditing"))
  {
    -[SFHistoryViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__SFHistoryViewController__deselectHistoryItemsInSession___block_invoke;
    v17[3] = &unk_1E9CFA080;
    v17[4] = self;
    v18 = v4;
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v5, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), 0, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v10);
    }

    -[SFHistoryViewController _updateDeleteSelectedItemsButtonEnabled](self, "_updateDeleteSelectedItemsButtonEnabled");
  }

}

uint64_t __58__SFHistoryViewController__deselectHistoryItemsInSession___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "itemIdentifierForIndexPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "historyItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFHistoryViewController isEditing](self, "isEditing");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v9)
  {
    if ((isKindOfClass & 1) == 0)
      objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 0);
    -[SFHistoryViewController _updateDeleteSelectedItemsButtonEnabled](self, "_updateDeleteSelectedItemsButtonEnabled");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHistoryViewController _addIndexPathsOfItemsNeedingReconfiguration:](self, "_addIndexPathsOfItemsNeedingReconfiguration:", v11);

  }
  else
  {
    if ((isKindOfClass & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0D4EF70];
      v13 = v8;
      objc_msgSend(v12, "builder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "navigationIntentWithHistoryURL:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setShouldDismissSidebarOnLoad:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
      objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v16);

    }
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1);
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[SFHistoryViewController isEditing](self, "isEditing"))
  {
    -[SFHistoryViewController _updateDeleteSelectedItemsButtonEnabled](self, "_updateDeleteSelectedItemsButtonEnabled");
    v7[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHistoryViewController _addIndexPathsOfItemsNeedingReconfiguration:](self, "_addIndexPathsOfItemsNeedingReconfiguration:", v6);

  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  UICollectionViewDiffableDataSource *collectionDataSource;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  char v27;
  id location;
  _QWORD v29[5];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v8, "count");
    v10 = MEMORY[0x1E0C809B0];
    if (v9 == 1)
    {
      collectionDataSource = self->_collectionDataSource;
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](collectionDataSource, "itemIdentifierForIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v13, "historyItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
      }

    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
      v29[3] = &unk_1E9CF9FF0;
      v29[4] = self;
      objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = 0;
    }
    if (objc_msgSend(v16, "count"))
    {
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x1E0DC36B8];
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_2;
      v24[3] = &unk_1E9CFA0A8;
      objc_copyWeak(&v26, &location);
      v27 = isKindOfClass & 1;
      v19 = v16;
      v25 = v19;
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_3;
      v21[3] = &unk_1E9CF5800;
      objc_copyWeak(&v23, &location);
      v22 = v19;
      objc_msgSend(v18, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v24, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "itemIdentifierForIndexPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && !*(_BYTE *)(a1 + 48))
  {
    v5 = objc_loadWeakRetained(WeakRetained + 146);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "linkPreviewViewControllerForURL:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __93__SFHistoryViewController_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_previewMenuForHistoryItems:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(v10, "previewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__SFHistoryViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v13[3] = &unk_1E9CF1BF8;
  objc_copyWeak(&v15, &location);
  v12 = v11;
  v14 = v12;
  objc_msgSend(v10, "addAnimations:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __100__SFHistoryViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 146);
    objc_msgSend(v3, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id WeakRetained;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFHistoryViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
      objc_msgSend(WeakRetained, "linkPreviewProviderWillDismissPreview");

    }
  }

  return 0;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB36C8];
    v7 = v5;
    v8 = [v6 alloc];
    objc_msgSend(v7, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v8, "initWithObject:", v9);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v10);
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartDragWithDragContentType:", 11);

}

- (void)historyViewDataSource:(id)a3 didComputeSessions:(id)a4
{
  -[SFHistoryViewController _reloadWithSessions:animated:](self, "_reloadWithSessions:animated:", a4, self->_hasLoadedHistory);
  -[SFHistoryViewController updateClearHistoryButtonEnabled](self, "updateClearHistoryButtonEnabled");
  self->_hasLoadedHistory = 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id *v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SFHistoryViewDataSource *v13;
  WBSSiriIntelligenceHistorySearch *siriHistorySearch;
  id v15;
  SFHistoryViewDataSource *v16;
  id *v17;
  _QWORD v18[4];
  SFHistoryViewDataSource *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a4;
  +[History lowercaseStringTrimmedForHistorySearch:](History, "lowercaseStringTrimmedForHistorySearch:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AD78]), "initWithString:", v7);
  v9 = objc_msgSend(v7, "length");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3880];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke;
    v21[3] = &unk_1E9CFA0D0;
    v17 = &v22;
    v22 = v8;
    v4 = &v23;
    v23 = v6;
    objc_msgSend(v11, "predicateWithBlock:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = self->_historyDataSource;
  siriHistorySearch = self->_siriHistorySearch;
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_2;
  v18[3] = &unk_1E9CFA0F8;
  v19 = v13;
  v20 = v12;
  v15 = v12;
  v16 = v13;
  -[WBSSiriIntelligenceHistorySearch findURLStringsForHistoryItemsContainingString:completionHandler:](siriHistorySearch, "findURLStringsForHistoryItemsContainingString:completionHandler:", v7, v18);

  if (v9)
  {

  }
}

BOOL __51__SFHistoryViewController_searchBar_textDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[History historyItemURL:matchesFilter:](History, "historyItemURL:matchesFilter:", v4, *(_QWORD *)(a1 + 32)))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[History historyItemTitle:matchesFilterString:](History, "historyItemTitle:matchesFilterString:", v6, *(_QWORD *)(a1 + 40))|| +[History filterString:matchesHistoryItemAnywhereInTitleOrURL:](History, "filterString:matchesHistoryItemAnywhereInTitleOrURL:", *(_QWORD *)(a1 + 32), v3);

  }
  return v5;
}

void __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_3;
  block[3] = &unk_1E9CF2990;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x1E0CB3880];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_4;
    v11 = &unk_1E9CF3118;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v2, "predicateWithBlock:", &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3528];
    v5 = *(void **)(a1 + 40);
    v13[0] = *(_QWORD *)(a1 + 48);
    v13[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2, v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orPredicateWithSubpredicates:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterUsingPredicate:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "filterUsingPredicate:", *(_QWORD *)(a1 + 48));
  }
}

uint64_t __51__SFHistoryViewController_searchBar_textDidChange___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "urlString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[SFHistoryViewDataSource filterUsingPredicate:](self->_historyDataSource, "filterUsingPredicate:", 0);
}

- (BOOL)restoreStateWithDictionary:(id)a3
{
  return 0;
}

- (id)currentStateDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 1;
}

- (void)_updateContentOffsetIfNeeded
{
  void *v3;
  void *v4;

  if (self->_needsContentOffsetUpdate && self->_hasLoadedHistory)
  {
    self->_needsContentOffsetUpdate = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("SavedCollectionViewScrollState-HistoryView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[SFHistoryViewController _restoreScrollPositionIfNeeded](self, "_restoreScrollPositionIfNeeded");
    else
      -[SFHistoryViewController _adjustContentOffsetHidingSearchBar](self, "_adjustContentOffsetHidingSearchBar");
  }
}

- (void)_saveViewState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MaxY;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MinY;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[6];
  _QWORD v50[8];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v50[6] = *MEMORY[0x1E0C80C00];
  -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");

  if (v4)
  {
    -[SFHistoryViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v51.origin.x = v12;
    v51.origin.y = v14;
    v51.size.width = v16;
    v51.size.height = v18;
    MaxY = CGRectGetMaxY(v51);
    objc_msgSend(v5, "frame");
    if (MaxY >= CGRectGetMaxY(v52))
    {
      objc_msgSend(v5, "contentOffset");
      v25 = v24;
      v27 = v26;
      objc_msgSend(v5, "indexPathsForVisibleItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sortedArrayUsingSelector:", sel_compare_);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v53.origin.x = v32;
      v53.origin.y = v34;
      v53.size.width = v36;
      v53.size.height = v38;
      v54 = CGRectOffset(v53, -v25, -v27);
      MinY = CGRectGetMinY(v54);
      objc_msgSend(v5, "adjustedContentInset");
      v41 = MinY - v40;
      v49[0] = CFSTR("TopVisibleCellSection");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "section"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v21;
      v49[1] = CFSTR("TopVisibleCellRow");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "row"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v22;
      v49[2] = CFSTR("TopVisibleCellOffset");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v42;
      v49[3] = CFSTR("savedExpandedSections");
      -[NSMutableSet allObjects](self->_expandedSessionIdentifiers, "allObjects");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v50[3] = v43;
      v49[4] = CFSTR("savedCollapsedSections");
      -[NSMutableSet allObjects](self->_collapsedSessionIdentifiers, "allObjects");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50[4] = v44;
      v49[5] = CFSTR("Timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v50[5] = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[NSMutableSet allObjects](self->_expandedSessionIdentifiers, "allObjects", CFSTR("savedExpandedSections"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v20;
      v47[1] = CFSTR("savedCollapsedSections");
      -[NSMutableSet allObjects](self->_collapsedSessionIdentifiers, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v21;
      v47[2] = CFSTR("Timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKey:", v23, CFSTR("SavedCollectionViewScrollState-HistoryView"));

  }
}

- (id)_savedStateDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SavedCollectionViewScrollState-HistoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Timestamp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 <= 480.0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("SavedCollectionViewScrollState-HistoryView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("SavedCollectionViewScrollState-HistoryView"));
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_restoreScrollPositionIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  -[SFHistoryViewController _savedStateDictionary](self, "_savedStateDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TopVisibleCellRow"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("TopVisibleCellSection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "section");
    if (v10 >= objc_msgSend(v9, "numberOfSections"))
      goto LABEL_5;
    v11 = objc_msgSend(v8, "row");
    objc_msgSend(v9, "sectionIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "numberOfItemsInSection:", v13);

    if (v11 >= v14)
    {
LABEL_5:
      -[SFHistoryViewController _adjustContentOffsetHidingSearchBar](self, "_adjustContentOffsetHidingSearchBar");
    }
    else
    {
      -[SFHistoryViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 1, 0);
      objc_msgSend(v15, "contentOffset");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v24, "objectForKey:", CFSTR("TopVisibleCellOffset"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v19 - v21;

      objc_msgSend(v15, "setContentOffset:animated:", 0, v17, v22);
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObjectForKey:", CFSTR("SavedCollectionViewScrollState-HistoryView"));

    }
  }
  else
  {
    -[SFHistoryViewController _adjustContentOffsetHidingSearchBar](self, "_adjustContentOffsetHidingSearchBar");
  }

}

- (void)_adjustContentOffsetHidingSearchBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "numberOfItems"))
    {
      objc_msgSend(v7, "itemIdentifiers");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_156_0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFHistoryViewController collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 1, 0);

    }
  }
}

uint64_t __62__SFHistoryViewController__adjustContentOffsetHidingSearchBar__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    +[SFSearchBarContainerCell dataSourceSectionIdentifier](SFSearchBarContainerCell, "dataSourceSectionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      +[SFSearchBarContainerCell dataSourceItemIdentifier](SFSearchBarContainerCell, "dataSourceItemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isEqualToString:", v6) ^ 1;

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  void *v8;
  double v9;
  double v10;
  CGFloat Height;
  double v12;
  double v13;
  CGRect v14;

  if (!self->_shouldUseSearchControllerInNavigationItem)
  {
    y = a5->y;
    -[SFHistoryViewController collectionView](self, "collectionView", a3, a4.x, a4.y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustedContentInset");
    v10 = v9;

    -[UISearchBar bounds](self->_searchBar, "bounds");
    Height = CGRectGetHeight(v14);
    v12 = Height * 0.5 - v10;
    v13 = fmax(y, Height - v10);
    if (y < v12)
      v13 = -v10;
    a5->y = v13;
  }
}

- (BookmarksPanelViewControllerDelegate)delegate
{
  return (BookmarksPanelViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (void)setTabGroupProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabGroupProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indexPathsOfItemsNeedingReconfiguration, 0);
  objc_storeStrong((id *)&self->_ignoredSiriSuggestedSitesQueue, 0);
  objc_storeStrong((id *)&self->_clearBrowsingDataController, 0);
  objc_storeStrong((id *)&self->_collapsedSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandedSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_siriHistorySearch, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_deleteItemsButton, 0);
  objc_storeStrong((id *)&self->_doneEditingButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clearHistoryButton, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_historyDataSource, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
}

@end
