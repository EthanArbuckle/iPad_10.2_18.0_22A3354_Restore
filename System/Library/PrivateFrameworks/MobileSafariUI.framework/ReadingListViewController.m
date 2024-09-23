@implementation ReadingListViewController

- (ReadingListViewController)init
{
  ReadingListViewController *v2;
  void *v3;
  uint64_t v4;
  WebBookmarkCollection *collection;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  void *v9;
  uint64_t v10;
  ReadingListLeadImageCache *imageCache;
  uint64_t v12;
  NSMutableSet *visibleBookmarkIDs;
  void *v14;
  id v15;
  void *v16;
  id v17;
  ReadingListViewController *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)ReadingListViewController;
  v2 = -[ReadingListViewController init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_networkIsReachable = objc_msgSend(v3, "isNetworkReachable");
    objc_msgSend(v3, "addNetworkReachableObserver:selector:", v2, sel__networkReachabilityChanged_);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v4 = objc_claimAutoreleasedReturnValue();
    collection = v2->_collection;
    v2->_collection = (WebBookmarkCollection *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__readingListBookmarkDidUpdate_, CFSTR("ReadingListBookmarkDidUpdateNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__webBookmarksDidReload_, *MEMORY[0x1E0DCCC00], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__didAddNewReadingListBookmark, CFSTR("ReadingListBookmarkAddedNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__webBookmarksDidReload_, CFSTR("bookmarkCollectionHasBecomeAvailableNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__readingListBookmarkMetadataDidUpdate_, CFSTR("ReadingListBookmarkMetadataDidUpdateNotification"), 0);
    -[ReadingListViewController _connectSafariFetcherServerProxy](v2, "_connectSafariFetcherServerProxy");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)didReceiveWebBookmarksReadingListFetchingNotification, (CFStringRef)*MEMORY[0x1E0DCCC28], 0, (CFNotificationSuspensionBehavior)1024);
    v2->_loadIconsSynchronously = 1;
    WebBookmarksReadingListFolderTitle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setTitle:](v2, "setTitle:", v8);

    +[Application sharedApplication](Application, "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readingListLeadImageCache");
    v10 = objc_claimAutoreleasedReturnValue();
    imageCache = v2->_imageCache;
    v2->_imageCache = (ReadingListLeadImageCache *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    visibleBookmarkIDs = v2->_visibleBookmarkIDs;
    v2->_visibleBookmarkIDs = (NSMutableSet *)v12;

    v2->_needsContentOffsetAdjustment = 1;
    v21[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[ReadingListViewController registerForTraitChanges:withTarget:action:](v2, "registerForTraitChanges:withTarget:action:", v14, v2, sel_contentSizeCategoryDidChange);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[ReadingListViewController registerForTraitChanges:withTarget:action:](v2, "registerForTraitChanges:withTarget:action:", v16, v2, sel_updateColorSchemeForExplanationView);

    v18 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNetworkReachableObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DCCC28], 0);
  -[ReadingListViewController _disconnectSafariFetcherServerProxy](self, "_disconnectSafariFetcherServerProxy");
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[ReadingListViewController _clearExplanationView](self, "_clearExplanationView");
  v6.receiver = self;
  v6.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)_shouldUseTranslucentAppearance
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(WeakRetained, "panelViewControllerShouldTranslucentAppearance:", self);
  else
    v4 = 0;

  return v4;
}

- (void)_showExplanationView
{
  void *v3;
  void *v4;
  ReadingListContentUnavailableView *v5;
  void *v6;
  void *v7;
  UIView *explanationView;
  ReadingListContentUnavailableView *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  if (!self->_explanationView)
  {
    _WBSLocalizedString();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextToSecondaryTextPadding:", 8.0);
    objc_msgSend(v4, "setText:", v13);
    objc_msgSend(v4, "setSecondaryText:", v3);
    v5 = -[UIContentUnavailableView initWithConfiguration:]([ReadingListContentUnavailableView alloc], "initWithConfiguration:", v4);
    -[ReadingListContentUnavailableView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[ReadingListViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    -[ReadingListContentUnavailableView setFrame:](v5, "setFrame:");

    if (-[ReadingListViewController _shouldUseTranslucentAppearance](self, "_shouldUseTranslucentAppearance"))
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListContentUnavailableView setBackgroundColor:](v5, "setBackgroundColor:", v7);
    explanationView = self->_explanationView;
    self->_explanationView = &v5->super.super;
    v9 = v5;

    -[ReadingListViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_explanationView);

    v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v11);

    -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setHidden:", 1);
  }
}

- (void)_clearExplanationView
{
  UIView *explanationView;
  id v4;

  -[UIView removeFromSuperview](self->_explanationView, "removeFromSuperview");
  explanationView = self->_explanationView;
  self->_explanationView = 0;

  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", 0);
  -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (void)loadView
{
  void *v3;
  void *v4;
  char v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PreviewTableViewController *v13;
  PreviewTableViewController *tableViewController;
  void *v15;
  UITableView *v16;
  UITableView *tableView;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("showingAllReadingListBookmarks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;
  self->_showingAllBookmarks = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readingListViewController:updateUnreadFilterShowingAllBookmarks:", self, self->_showingAllBookmarks);
  -[ReadingListViewController _reloadReadingList](self, "_reloadReadingList");
  v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[ReadingListViewController setView:](self, "setView:", v7);

  -[ReadingListViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[ReadingListViewController _unreadFilterButtonTitle](self, "_unreadFilterButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReadingListViewController _unreadFilterBarButtonItem](self, "_unreadFilterBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);

  -[ReadingListViewController _unreadFilterButtonIdentifier](self, "_unreadFilterButtonIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReadingListViewController _unreadFilterBarButtonItem](self, "_unreadFilterBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v11);

  v13 = -[PreviewTableViewController initWithStyle:]([PreviewTableViewController alloc], "initWithStyle:", 2);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v13;

  -[PreviewTableViewController setPreviewDelegate:](self->_tableViewController, "setPreviewDelegate:", self);
  -[ReadingListViewController linkPreviewProvider](self, "linkPreviewProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreviewTableViewController setLinkPreviewProvider:](self->_tableViewController, "setLinkPreviewProvider:", v15);

  -[PreviewTableViewController setViewRespectsSystemMinimumLayoutMargins:](self->_tableViewController, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  -[PreviewTableViewController tableView](self->_tableViewController, "tableView");
  v16 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v16;

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("ReadingListTable"));
  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDragDelegate:](self->_tableView, "setDragDelegate:", self);
  -[UITableView setDropDelegate:](self->_tableView, "setDropDelegate:", self);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ReadingListTableViewCellWithImage"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ReadingListTableViewCellWithoutImage"));
  -[UITableView setAllowsMultipleSelectionDuringEditing:](self->_tableView, "setAllowsMultipleSelectionDuringEditing:", 1);
  +[ReadingListTableViewCell minimumCellHeight](ReadingListTableViewCell, "minimumCellHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[UITableView setSeparatorInsetReference:](self->_tableView, "setSeparatorInsetReference:", 1);
  -[ReadingListViewController addChildViewController:](self, "addChildViewController:", self->_tableViewController);
  -[ReadingListViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_tableView);

  -[ReadingListViewController _updateSearchBar](self, "_updateSearchBar");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[ReadingListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");

  if (self->_deferEnteringEditMode)
  {
    self->_deferEnteringEditMode = 0;
    -[ReadingListViewController setEditing:animated:](self, "setEditing:animated:", 1, 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[ReadingListLeadImageCache clearCache](self->_imageCache, "clearCache");
  -[ReadingListViewController setEditing:](self, "setEditing:", 0);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  -[ReadingListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");

  v4.receiver = self;
  v4.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)viewDidLayoutSubviews
{
  UISearchBar *searchBar;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  searchBar = self->_searchBar;
  -[ReadingListViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  -[UISearchBar _setOverrideContentInsets:forRectEdges:](searchBar, "_setOverrideContentInsets:forRectEdges:", 10);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  id WeakRetained;
  char v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  -[WebBookmarkCollection readingListWithUnreadOnly:](self->_collection, "readingListWithUnreadOnly:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bookmarkCount");

  if (!v6)
    -[ReadingListViewController _showExplanationView](self, "_showExplanationView");
  v11.receiver = self;
  v11.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
  -[ReadingListViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarHidden:animated:", 0, v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
    -[ReadingListViewController bookmarksPanelToolbarItems](self, "bookmarksPanelToolbarItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v10, v3);

  }
}

- (void)contentSizeCategoryDidChange
{
  _QWORD block[5];

  if (!self->_shouldUseSearchControllerInNavigationBar)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ReadingListViewController_contentSizeCategoryDidChange__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __57__ReadingListViewController_contentSizeCategoryDidChange__block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  _SFRoundFloatToPixels();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setFrame:", 0.0, 0.0, 0.0, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "setTableHeaderView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
}

- (void)updateColorSchemeForExplanationView
{
  if (self->_explanationView)
  {
    -[ReadingListViewController _clearExplanationView](self, "_clearExplanationView");
    -[ReadingListViewController _showExplanationView](self, "_showExplanationView");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[ReadingListViewController userActivity](self, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD5900];
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD5900]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "invalidate");
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v6);

    -[ReadingListViewController setUserActivity:](self, "setUserActivity:", v8);
    v4 = (void *)v8;
  }
  objc_msgSend(v4, "setNeedsSave:", 1);

}

- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 1;
}

- (void)_adjustContentOffsetIfNeeded
{
  if (!self->_shouldUseSearchControllerInNavigationBar && self->_needsContentOffsetAdjustment)
  {
    self->_needsContentOffsetAdjustment = 0;
    if (!-[UIViewController safari_hasSavedTableViewScrollPosition]((_BOOL8)self)
      || !-[UIViewController safari_restoreTableViewScrollPosition](self))
    {
      -[UITableView safari_adjustContentOffsetToTopHidingTableHeaderView](self->_tableView);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (-[NSTimer isValid](self->_deletionNotificationTimer, "isValid"))
    -[ReadingListViewController _postChangeNotification](self, "_postChangeNotification");
  -[UIViewController safari_saveTableViewScrollPosition](self);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showingAllBookmarks);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("showingAllReadingListBookmarks"));

  -[ReadingListViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView safari_dismissContextMenu](v7);

  v8.receiver = self;
  v8.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);

}

- (void)willMoveToParentViewController:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setPinnedPaletteForPanelViewController:", self);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  BOOL v8;
  BOOL v9;
  double v10;
  id WeakRetained;
  NSObject *v12;
  _BOOL4 v13;
  uint8_t v14[8];
  _QWORD v15[5];
  objc_super v16;

  v4 = a4;
  v5 = a3;
  -[UITableView window](self->_tableView, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = 1;
  else
    v8 = !v5;
  if (!v8)
    self->_deferEnteringEditMode = 1;
  -[ReadingListViewController _restoreCellSeparator](self, "_restoreCellSeparator");
  v16.receiver = self;
  v16.super_class = (Class)ReadingListViewController;
  -[ReadingListViewController setEditing:animated:](&v16, sel_setEditing_animated_, v5, v4);
  v9 = !v5;
  -[UISearchBar setUserInteractionEnabled:](self->_searchBar, "setUserInteractionEnabled:", v5 ^ 1);
  v10 = 1.0;
  if (v5)
    v10 = 0.5;
  -[UISearchBar setAlpha:](self->_searchBar, "setAlpha:", v10);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__ReadingListViewController_setEditing_animated___block_invoke;
  v15[3] = &unk_1E9CF1900;
  v15[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v15);
  -[PreviewTableViewController setEditing:animated:](self->_tableViewController, "setEditing:animated:", v5, v4);
  -[ReadingListViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", v4);
  -[ReadingListViewController _updateEditingButtonsEnabled](self, "_updateEditingButtonsEnabled");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D7CA3000, v12, OS_LOG_TYPE_DEFAULT, "End editing reading list items", v14, 2u);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "panelViewControllerDidEndEditing:", self);
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D7CA3000, v12, OS_LOG_TYPE_DEFAULT, "Begin editing reading list items", v14, 2u);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "panelViewControllerDidBeginEditing:", self);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __49__ReadingListViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAndScrollToCurrentSelectedItemIfNeeded:", 0);
}

- (void)_updateToolbarItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "panelViewController:updateToolbarItemsAnimated:", self, 1);
  }
  else
  {
    -[ReadingListViewController bookmarksPanelToolbarItems](self, "bookmarksPanelToolbarItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v5, v3);

  }
}

- (id)_bookmarkAtIndexPath:(id)a3
{
  return (id)-[WebBookmarkList bookmarkAtIndex:](self->_readingList, "bookmarkAtIndex:", objc_msgSend(a3, "row"));
}

- (void)_networkReachabilityChanged:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFA300]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_networkIsReachable = objc_msgSend(v5, "BOOLValue");

  -[ReadingListViewController _reloadReadingListAndTable](self, "_reloadReadingListAndTable");
}

- (void)_reloadReadingList
{
  WebBookmarkList *v3;
  WebBookmarkList *readingList;

  -[WebBookmarkCollection readingListWithUnreadOnly:filteredUsingString:](self->_collection, "readingListWithUnreadOnly:filteredUsingString:", !self->_showingAllBookmarks, self->_userTypedFilter);
  v3 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
  readingList = self->_readingList;
  self->_readingList = v3;

}

- (void)_updateSearchBar
{
  int v3;
  UISearchBar *searchBar;
  UITableView **p_tableView;
  void *v6;
  uint64_t v7;
  UISearchBar *v8;
  int v9;
  UISearchBar *v10;
  UISearchBar *v11;
  UISearchBar *v12;
  void *v13;
  void *v14;
  UISearchBar *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;

  v3 = -[WebBookmarkList bookmarkCount](self->_readingList, "bookmarkCount");
  searchBar = self->_searchBar;
  if (v3)
  {
    if (searchBar)
      return;
    p_tableView = &self->_tableView;
    if (!self->_tableView)
      return;
LABEL_8:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_msgSend(WeakRetained, "panelViewControllerShouldUseSearchControllerInNavigationItem:", self);
      self->_shouldUseSearchControllerInNavigationBar = v9;
      if (v9)
      {
LABEL_10:
        v10 = (UISearchBar *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
        -[UISearchBar setObscuresBackgroundDuringPresentation:](v10, "setObscuresBackgroundDuringPresentation:", 0);
        -[UISearchBar searchBar](v10, "searchBar");
        v11 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
        v12 = self->_searchBar;
        self->_searchBar = v11;

        -[ReadingListViewController navigationItem](self, "navigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPreferredSearchBarPlacement:", 2);

        -[ReadingListViewController navigationItem](self, "navigationItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSearchController:", v10);

LABEL_14:
        -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
        v16 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        WebBookmarksReadingListFolderTitle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v19);

        return;
      }
    }
    else if (self->_shouldUseSearchControllerInNavigationBar)
    {
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0DC3C38], "sf_installSearchBarInTableView:includeSeparator:", *p_tableView, 0);
    v15 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    v10 = self->_searchBar;
    self->_searchBar = v15;
    goto LABEL_14;
  }
  -[UISearchBar text](searchBar, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = self->_searchBar;
  if ((v7 != 0) == (v8 == 0))
  {
    p_tableView = &self->_tableView;
    if (self->_tableView)
    {
      if (!v7)
      {
        self->_searchBar = 0;

        -[UITableView setTableHeaderView:](*p_tableView, "setTableHeaderView:", 0);
        -[UITableView _setAllowedNavigationOverlapAmount:](*p_tableView, "_setAllowedNavigationOverlapAmount:", 0.0);
        return;
      }
      goto LABEL_8;
    }
  }
}

- (void)_reloadReadingListAndTable
{
  if ((-[ReadingListViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[NSMutableSet removeAllObjects](self->_visibleBookmarkIDs, "removeAllObjects");
    -[ReadingListViewController _reloadReadingList](self, "_reloadReadingList");
    -[ReadingListViewController _updateSearchBar](self, "_updateSearchBar");
    if (-[WebBookmarkList bookmarkCount](self->_readingList, "bookmarkCount"))
      -[ReadingListViewController _clearExplanationView](self, "_clearExplanationView");
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)_didChangeUnreadFilter
{
  NSObject *v3;
  const __CFString *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  self->_showingAllBookmarks ^= 1u;
  v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_showingAllBookmarks)
      v4 = CFSTR("all");
    else
      v4 = CFSTR("unread");
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEFAULT, "Toggle show unread reading list items: (showing %{public}@)", (uint8_t *)&v10, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "readingListViewController:updateUnreadFilterShowingAllBookmarks:", self, self->_showingAllBookmarks);
  -[ReadingListViewController _unreadFilterButtonTitle](self, "_unreadFilterButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReadingListViewController _unreadFilterBarButtonItem](self, "_unreadFilterBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  -[ReadingListViewController _unreadFilterButtonIdentifier](self, "_unreadFilterButtonIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReadingListViewController _unreadFilterBarButtonItem](self, "_unreadFilterBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

  -[ReadingListViewController _reloadReadingListAndTable](self, "_reloadReadingListAndTable");
  -[ReadingListViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", 1);

}

- (id)_unreadFilterBarButtonItem
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *cachedUnreadFilterBarButtonButton;
  void *v7;

  if (!self->_cachedUnreadFilterBarButtonButton)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[ReadingListViewController _unreadFilterButtonTitle](self, "_unreadFilterButtonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__didChangeUnreadFilter);
    cachedUnreadFilterBarButtonButton = self->_cachedUnreadFilterBarButtonButton;
    self->_cachedUnreadFilterBarButtonButton = v5;

  }
  -[ReadingListViewController _unreadFilterButtonIdentifier](self, "_unreadFilterButtonIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cachedUnreadFilterBarButtonButton, "setAccessibilityIdentifier:", v7);

  return self->_cachedUnreadFilterBarButtonButton;
}

- (NSArray)bookmarksPanelToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  if (!-[WebBookmarkList bookmarkCount](self->_readingList, "bookmarkCount"))
  {
    -[ReadingListViewController _unreadFilterBarButtonItem](self, "_unreadFilterBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v18;
    goto LABEL_5;
  }
  if (self->_isUsingSwipeAction)
  {
    v17[0] = v3;
    -[ReadingListViewController editButtonItem](self, "editButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v17;
LABEL_5:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[ReadingListViewController _editButtonIdentifier](self, "_editButtonIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReadingListViewController editButtonItem](self, "editButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

  v10 = -[ReadingListViewController isEditing](self, "isEditing");
  if ((v10 & 1) != 0)
  {
    -[ReadingListViewController _deleteBarButtonItem](self, "_deleteBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ReadingListBarDeleteButton"));
  }
  else
  {
    -[ReadingListViewController _unreadFilterBarButtonItem](self, "_unreadFilterBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "_sf_shouldAutomaticallyDownloadReadingListItems") & 1) != 0 || v10 != 1)
  {
    v12 = v3;
  }
  else
  {
    -[ReadingListViewController _saveOfflineBarButtonItem](self, "_saveOfflineBarButtonItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[ReadingListViewController editButtonItem](self, "editButtonItem", v4, v3, v13, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return (NSArray *)v7;
}

- (id)_deleteBarButtonItem
{
  UIBarButtonItem *cachedDeleteBarButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  cachedDeleteBarButtonItem = self->_cachedDeleteBarButtonItem;
  if (!cachedDeleteBarButtonItem)
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v4, 0, self, sel__deleteBookmarks_);
    v6 = self->_cachedDeleteBarButtonItem;
    self->_cachedDeleteBarButtonItem = v5;

    cachedDeleteBarButtonItem = self->_cachedDeleteBarButtonItem;
  }
  return cachedDeleteBarButtonItem;
}

- (void)_deleteBookmarks:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  ReadingListViewController *v15;
  id v16;
  _QWORD aBlock[5];
  id v18;
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Tap delete selected reading list items", buf, 2u);
  }
  -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInMemoryBookmarkChangeTrackingAvailable");

  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__ReadingListViewController__deleteBookmarks___block_invoke;
    aBlock[3] = &unk_1E9CF58F8;
    aBlock[4] = self;
    v18 = v5;
    v9 = _Block_copy(aBlock);

  }
  else
  {
    v9 = 0;
  }
  v11 = v8;
  v12 = 3221225472;
  v13 = __46__ReadingListViewController__deleteBookmarks___block_invoke_2;
  v14 = &unk_1E9CF58F8;
  v15 = self;
  v16 = v5;
  v10 = v5;
  -[ReadingListViewController _readingListItemsAtIndexPaths:lockAndPerformUpdate:performBlockIfLockFailed:](self, "_readingListItemsAtIndexPaths:lockAndPerformUpdate:performBlockIfLockFailed:", v10, &v11, v9);
  -[ReadingListViewController setEditing:](self, "setEditing:", 0, v11, v12, v13, v14, v15);

}

uint64_t __46__ReadingListViewController__deleteBookmarks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 992);
  v5 = *(void **)(v3 + 1008);
  v6 = a2;
  objc_msgSend(v4, "deleteBookmarksInMemory:inFolder:", v6, objc_msgSend(v5, "folderID"));

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didDeleteNumberOfBookmarksInMemory:", objc_msgSend(*(id *)(a1 + 40), "count"));

  return objc_msgSend(*(id *)(a1 + 32), "_updateTableViewByRemovingReadingListItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__ReadingListViewController__deleteBookmarks___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "deleteBookmarks:postChangeNotification:", a2, 0);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_scheduleDelayedChangeNotification");
    return objc_msgSend(*(id *)(a1 + 32), "_updateTableViewByRemovingReadingListItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (id)_saveOfflineBarButtonItem
{
  UIBarButtonItem *cachedSaveOfflineBarButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  cachedSaveOfflineBarButtonItem = self->_cachedSaveOfflineBarButtonItem;
  if (!cachedSaveOfflineBarButtonItem)
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v4, 0, self, sel__saveForOffline_);
    v6 = self->_cachedSaveOfflineBarButtonItem;
    self->_cachedSaveOfflineBarButtonItem = v5;

    cachedSaveOfflineBarButtonItem = self->_cachedSaveOfflineBarButtonItem;
  }
  return cachedSaveOfflineBarButtonItem;
}

- (void)_saveForOffline:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_DEFAULT, "Tap save archives for selected reading list items", buf, 2u);
  }
  -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ReadingListViewController__saveForOffline___block_invoke;
  v7[3] = &unk_1E9CF1C48;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__ReadingListViewController__saveForOffline___block_invoke_3;
  v6[3] = &unk_1E9CF1C48;
  -[ReadingListViewController _readingListItemsAtIndexPaths:lockAndPerformUpdate:performBlockIfLockFailed:](self, "_readingListItemsAtIndexPaths:lockAndPerformUpdate:performBlockIfLockFailed:", v5, v7, v6);
  -[ReadingListViewController setEditing:](self, "setEditing:", 0);

}

void __45__ReadingListViewController__saveForOffline___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_26);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "saveArchivesForReadingListBookmarks:", v3);

}

uint64_t __45__ReadingListViewController__saveForOffline___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldArchive") ^ 1;
}

void __45__ReadingListViewController__saveForOffline___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didPreventBookmarkActionWithBookmarkType:actionType:", 2, 2);

}

- (void)_updateEditingButtonsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[ReadingListViewController _deleteBarButtonItem](self, "_deleteBarButtonItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ReadingListViewController _saveOfflineBarButtonItem](self, "_saveOfflineBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ReadingListViewController isEditing](self, "isEditing") & 1) != 0)
  {
    -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", objc_msgSend(v4, "count") != 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__ReadingListViewController__updateEditingButtonsEnabled__block_invoke;
    v7[3] = &unk_1E9CF5960;
    v7[4] = self;
    objc_msgSend(v4, "safari_firstObjectPassingTest:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", v5 != 0);

  }
  else
  {
    objc_msgSend(v6, "setEnabled:", 0);
    objc_msgSend(v3, "setEnabled:", 0);
  }

}

uint64_t __57__ReadingListViewController__updateEditingButtonsEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_bookmarkAtIndexPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldArchive") ^ 1;

  return v3;
}

- (id)_unreadFilterButtonTitle
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_unreadFilterButtonIdentifier
{
  if (self->_showingAllBookmarks)
    return CFSTR("ReadingListShowUnreadButton");
  else
    return CFSTR("ReadingListShowAllButton");
}

- (id)_editButtonIdentifier
{
  if (-[ReadingListViewController isEditing](self, "isEditing"))
    return CFSTR("ReadingListDoneButton");
  else
    return CFSTR("ReadingListEditButton");
}

- (void)_scheduleDelayedChangeNotification
{
  NSTimer *v3;
  NSTimer *deletionNotificationTimer;

  if (-[NSTimer isValid](self->_deletionNotificationTimer, "isValid"))
    -[NSTimer invalidate](self->_deletionNotificationTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__postChangeNotification, 0, 0, 10.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  deletionNotificationTimer = self->_deletionNotificationTimer;
  self->_deletionNotificationTimer = v3;

}

- (void)_postChangeNotification
{
  NSTimer *deletionNotificationTimer;

  -[NSTimer invalidate](self->_deletionNotificationTimer, "invalidate");
  deletionNotificationTimer = self->_deletionNotificationTimer;
  self->_deletionNotificationTimer = 0;

  -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self->_collection, "_postBookmarksChangedSyncNotification");
}

- (void)_connectSafariFetcherServerProxy
{
  void *v3;
  int v4;
  SafariFetcherServerProxy *v5;
  SafariFetcherServerProxy *safariFetcherServerProxy;

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOfflineReadingListAvailable");

  if (v4)
  {
    if (!self->_safariFetcherServerProxy)
    {
      v5 = (SafariFetcherServerProxy *)objc_alloc_init(MEMORY[0x1E0DCCB10]);
      safariFetcherServerProxy = self->_safariFetcherServerProxy;
      self->_safariFetcherServerProxy = v5;

      -[SafariFetcherServerProxy setDelegate:](self->_safariFetcherServerProxy, "setDelegate:", self);
    }
  }
}

- (void)_disconnectSafariFetcherServerProxy
{
  SafariFetcherServerProxy *safariFetcherServerProxy;
  SafariFetcherServerProxy *v4;

  safariFetcherServerProxy = self->_safariFetcherServerProxy;
  if (safariFetcherServerProxy)
  {
    -[SafariFetcherServerProxy setDelegate:](safariFetcherServerProxy, "setDelegate:", 0);
    v4 = self->_safariFetcherServerProxy;
    self->_safariFetcherServerProxy = 0;

  }
}

- (void)_webBookmarksDidReload:(id)a3
{
  WebBookmarkCollection *v4;
  WebBookmarkCollection *collection;

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection", a3);
  v4 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
  collection = self->_collection;
  self->_collection = v4;

  -[ReadingListViewController _reloadReadingListAndTable](self, "_reloadReadingListAndTable");
}

- (void)_readingListBookmarkMetadataDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *visibleBookmarkIDs;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ReadingListViewController _updateTableViewByComputingDifference](self, "_updateTableViewByComputingDifference");
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BookmarkWithUpdatedMetadataKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    visibleBookmarkIDs = self->_visibleBookmarkIDs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(visibleBookmarkIDs) = -[NSMutableSet containsObject:](visibleBookmarkIDs, "containsObject:", v8);

    if ((_DWORD)visibleBookmarkIDs)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[UITableView visibleCells](self->_tableView, "visibleCells", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "bookmarkID");
            if (v15 == objc_msgSend(v6, "identifier"))
            {
              objc_msgSend(v14, "setBookmark:", v6);
              -[ReadingListViewController _setIconForBookmark:cell:synchronously:](self, "_setIconForBookmark:cell:synchronously:", v6, v14, self->_loadIconsSynchronously);

              goto LABEL_13;
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

}

- (id)_currentReadingListBookmark
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "readingListViewControllerCurrentReadingListItem:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readingListBookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateAndScrollToCurrentSelectedItemIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  UITableView *tableView;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v3 = a3;
  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[ReadingListViewController isEditing](self, "isEditing") & 1) == 0)
  {
    -[ReadingListViewController _restoreCellSeparator](self, "_restoreCellSeparator");
    -[UITableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController _currentReadingListBookmark](self, "_currentReadingListBookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[WebBookmarkList bookmarkArray](self->_readingList, "bookmarkArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObject:", v6);

      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "row");
        if (v12 <= objc_msgSend(v10, "row"))
        {
          tableView = self->_tableView;
          v16 = v3;
          v15 = v9;
        }
        else
        {
          v13 = objc_msgSend(v9, "row");
          if (v13 >= objc_msgSend(v11, "row"))
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v9, "row") - 1, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setSeparatorStyle:", 0);

            if (v3)
              v19 = 3;
            else
              v19 = 0;
            -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", v9, 1, v19);

            goto LABEL_14;
          }
          tableView = self->_tableView;
          v15 = v9;
          v16 = 0;
        }
        -[UITableView selectRowAtIndexPath:animated:scrollPosition:](tableView, "selectRowAtIndexPath:animated:scrollPosition:", v15, 1, v16);
LABEL_14:

      }
    }
    else
    {
      -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v20, 0);
    }

  }
}

- (void)_restoreCellSeparator
{
  void *v3;
  UITableViewCellSeparatorStyle v4;
  void *v5;
  id v6;

  -[UITableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "row"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v6, "row") - 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[UITableView separatorStyle](self->_tableView, "separatorStyle");
    -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSeparatorStyle:", v4);

  }
}

- (id)_URLForRowAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationIntentWithBookmark:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[WebBookmarkList bookmarkCount](self->_readingList, "bookmarkCount", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ReadingListTableViewCellWithImage"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setBookmark:", v8);
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBookmark:isArchiving:", v8, objc_msgSend(v10, "isEqualToString:", self->_archivingBookmarkUUID));

  objc_msgSend(v9, "safari_annotateWithReadingListItem:", v8);
  if (-[ReadingListViewController _shouldUseTranslucentAppearance](self, "_shouldUseTranslucentAppearance"))
    objc_msgSend(v9, "setUsesVibrantEffect:", 1);

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;

  if (self->_shouldUseSearchControllerInNavigationBar)
    return 0;
  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("ReadingListSpacingHeaderReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("ReadingListSpacingHeaderReuseIdentifier"));
  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 0.0;
  if (!self->_shouldUseSearchControllerInNavigationBar)
    return 12.0;
  return result;
}

- (id)_iconForUUID:(id)a3 iconData:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[ReadingListLeadImageCache loadImageSynchronouslyForIconUUID:](self->_imageCache, "loadImageSynchronouslyForIconUUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!v7)
      goto LABEL_7;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v8;
}

- (void)_setIconForBookmark:(id)a3 cell:(id)a4 synchronously:(BOOL)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  int v23;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "bookmarkID");
  if (v10 == objc_msgSend(v8, "identifier"))
  {
    objc_msgSend(v9, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v8, "readingListIconUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "iconData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "identifier");
      if (a5)
      {
        -[ReadingListViewController _iconForUUID:iconData:](self, "_iconForUUID:iconData:", v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v9, "setReadingListIcon:", v16);

      }
      else
      {
        v17 = v15;
        dispatch_get_global_queue(0, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke;
        block[3] = &unk_1E9CF59B0;
        block[4] = self;
        v20 = v13;
        v21 = v14;
        v22 = v9;
        v23 = v17;
        dispatch_async(v18, block);

      }
    }
  }

}

void __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "_iconForUUID:iconData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke_2;
    block[3] = &unk_1E9CF5988;
    v4 = *(id *)(a1 + 56);
    v6 = *(_DWORD *)(a1 + 64);
    v5 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __68__ReadingListViewController__setIconForBookmark_cell_synchronously___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "bookmarkID");
  if ((_DWORD)result == *(_DWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setReadingListIcon:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  }
  return result;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_isUsingSwipeAction = 1;
  -[ReadingListViewController setEditing:](self, "setEditing:", 1, a4);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_isUsingSwipeAction = 0;
  -[ReadingListViewController setEditing:](self, "setEditing:", 0, a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSMutableSet *visibleBookmarkIDs;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  visibleBookmarkIDs = self->_visibleBookmarkIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](visibleBookmarkIDs, "addObject:", v12);

  -[ReadingListViewController _fetchMetadataIfNeededForBookmark:](self, "_fetchMetadataIfNeededForBookmark:", v10);
  -[ReadingListViewController _setIconForBookmark:cell:synchronously:](self, "_setIconForBookmark:cell:synchronously:", v10, v8, self->_loadIconsSynchronously);
  -[ReadingListViewController _currentReadingListBookmark](self, "_currentReadingListBookmark");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToBookmark:", v10))
  {
    if ((objc_msgSend(v8, "isSelected") & 1) == 0
      && (-[ReadingListViewController isEditing](self, "isEditing") & 1) == 0)
    {
      objc_msgSend(v17, "selectRowAtIndexPath:animated:scrollPosition:", v9, 1, 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v9, "row") + 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "row");
    if (v15 < -[WebBookmarkList bookmarkCount](self->_readingList, "bookmarkCount"))
    {
      -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToBookmark:", v16))
        objc_msgSend(v8, "setSeparatorStyle:", 0);

    }
  }

}

- (void)_fetchMetadataIfNeededForBookmark:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_sf_shouldAutomaticallyDownloadReadingListItems");

  if ((v4 & 1) == 0)
  {
    if (+[ReadingListMetadataFetcher shouldFetchMetadataForBookmark:](ReadingListMetadataFetcher, "shouldFetchMetadataForBookmark:", v6))
    {
      +[ReadingListMetadataFetcher sharedMetadataFetcher](ReadingListMetadataFetcher, "sharedMetadataFetcher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fetchMetadataForReadingListBookmark:withProvider:", v6, 0);
LABEL_6:

      goto LABEL_7;
    }
    if (+[ReadingListMetadataFetcher shouldFetchThumbnailForBookmark:](ReadingListMetadataFetcher, "shouldFetchThumbnailForBookmark:", v6))
    {
      +[ReadingListMetadataFetcher sharedMetadataFetcher](ReadingListMetadataFetcher, "sharedMetadataFetcher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fetchThumbnailForReadingListBookmark:withProvider:", v6, 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  NSMutableSet *visibleBookmarkIDs;
  id v6;

  visibleBookmarkIDs = self->_visibleBookmarkIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a4, "bookmarkID", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](visibleBookmarkIDs, "removeObject:", v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[ReadingListViewController isEditing](self, "isEditing");
  v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      v17 = 134218240;
      v18 = objc_msgSend(v7, "row");
      v19 = 2048;
      v20 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
      _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Tap to select reading list item at row %ld, number of rows: %ld", (uint8_t *)&v17, 0x16u);

    }
    -[ReadingListViewController _updateEditingButtonsEnabled](self, "_updateEditingButtonsEnabled");
  }
  else
  {
    if (v10)
    {
      v12 = v9;
      v17 = 134218240;
      v18 = objc_msgSend(v7, "row");
      v19 = 2048;
      v20 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
      _os_log_impl(&dword_1D7CA3000, v12, OS_LOG_TYPE_DEFAULT, "Tap reading list item at row %ld, number of rows: %ld", (uint8_t *)&v17, 0x16u);

    }
    -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "navigationIntentWithBookmark:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setShouldDismissSidebarOnLoad:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
    objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v15);

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[ReadingListViewController isEditing](self, "isEditing"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = 134218240;
      v11 = objc_msgSend(v7, "row");
      v12 = 2048;
      v13 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
      _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Tap to deselect editing reading list item at row %ld, number of rows: %ld", (uint8_t *)&v10, 0x16u);

    }
    -[ReadingListViewController _updateEditingButtonsEnabled](self, "_updateEditingButtonsEnabled");
  }

}

- (id)tableView:(id)a3 trailingSwipeActionsForRowAtIndexPath:(id)a4
{
  return -[ReadingListViewController _createActions:forRowAtIndexPath:allowingNewlineInTitles:withBlock:](self, "_createActions:forRowAtIndexPath:allowingNewlineInTitles:withBlock:", &unk_1E9D628E0, a4, 1, &__block_literal_global_140);
}

id __77__ReadingListViewController_tableView_trailingSwipeActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v8 = a6;
  v9 = (void *)MEMORY[0x1E0DC3D00];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__ReadingListViewController_tableView_trailingSwipeActionsForRowAtIndexPath___block_invoke_2;
  v13[3] = &unk_1E9CF5A18;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "swipeActionWithStyle:title:handler:", a5, a2, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __77__ReadingListViewController_tableView_trailingSwipeActionsForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)tableView:(id)a3 leadingSwipeActionsForRowAtIndexPath:(id)a4
{
  return -[ReadingListViewController _createActions:forRowAtIndexPath:allowingNewlineInTitles:withBlock:](self, "_createActions:forRowAtIndexPath:allowingNewlineInTitles:withBlock:", &unk_1E9D628F8, a4, 1, &__block_literal_global_146_0);
}

id __76__ReadingListViewController_tableView_leadingSwipeActionsForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, void *a6)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a6;
  v9 = (void *)MEMORY[0x1E0DC3D00];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__ReadingListViewController_tableView_leadingSwipeActionsForRowAtIndexPath___block_invoke_2;
  v14[3] = &unk_1E9CF5A18;
  v15 = v8;
  v10 = v8;
  objc_msgSend(v9, "swipeActionWithStyle:title:handler:", a5, a2, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v12);

  return v11;
}

uint64_t __76__ReadingListViewController_tableView_leadingSwipeActionsForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[ReadingListViewController setEditing:](self, "setEditing:", 1, a4);
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return -[PreviewTableViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](self->_tableViewController, "tableView:contextMenuConfigurationForRowAtIndexPath:point:", a3, a4, a5.x, a5.y);
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return -[PreviewTableViewController tableView:previewForHighlightingContextMenuWithConfiguration:](self->_tableViewController, "tableView:previewForHighlightingContextMenuWithConfiguration:", a3, a4);
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  -[PreviewTableViewController tableView:willPerformPreviewActionForMenuWithConfiguration:animator:](self->_tableViewController, "tableView:willPerformPreviewActionForMenuWithConfiguration:animator:", a3, a4, a5);
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return -[PreviewTableViewController tableView:previewForDismissingContextMenuWithConfiguration:](self->_tableViewController, "tableView:previewForDismissingContextMenuWithConfiguration:", a3, a4);
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)_readingListItemAtIndexPath:(id)a3 lockAndPerformUpdates:(id)a4 performBlockIfLockFailed:(id)a5
{
  _QWORD *v8;
  void *v9;
  void (*v10)(void);
  _QWORD *v11;

  v11 = a4;
  v8 = a5;
  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "isLockedSync") & 1) != 0)
  {
    v10 = (void (*)(void))v11[2];
LABEL_7:
    v10();
    goto LABEL_8;
  }
  if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync") & 1) != 0)
  {
    ((void (*)(_QWORD *, void *))v11[2])(v11, v9);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
  }
  else if (v8)
  {
    v10 = (void (*)(void))v8[2];
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_readingListItemsAtIndexPaths:(id)a3 lockAndPerformUpdate:(id)a4 performBlockIfLockFailed:(id)a5
{
  _QWORD *v8;
  void *v9;
  void (*v10)(void);
  _QWORD *v11;
  _QWORD v12[5];

  v11 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__ReadingListViewController__readingListItemsAtIndexPaths_lockAndPerformUpdate_performBlockIfLockFailed___block_invoke;
  v12[3] = &unk_1E9CF5A60;
  v12[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "isLockedSync") & 1) != 0)
  {
    v10 = (void (*)(void))v11[2];
LABEL_7:
    v10();
    goto LABEL_8;
  }
  if ((objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync") & 1) != 0)
  {
    ((void (*)(_QWORD *, void *))v11[2])(v11, v9);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
  }
  else if (v8)
  {
    v10 = (void (*)(void))v8[2];
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __105__ReadingListViewController__readingListItemsAtIndexPaths_lockAndPerformUpdate_performBlockIfLockFailed___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bookmarkAtIndexPath:", a2);
}

- (void)_updateTableViewByComputingDifference
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  WebBookmarkList *v7;
  _QWORD v8[4];
  id v9;
  ReadingListViewController *v10;
  id v11;

  v7 = self->_readingList;
  -[ReadingListViewController _reloadReadingList](self, "_reloadReadingList");
  -[ReadingListViewController _updateSearchBar](self, "_updateSearchBar");
  -[WebBookmarkList differenceFromList:withOptions:](self->_readingList, "differenceFromList:withOptions:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasChanges"))
  {
    -[ReadingListViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__ReadingListViewController__updateTableViewByComputingDifference__block_invoke_2;
    v8[3] = &unk_1E9CF4FA0;
    v10 = self;
    v11 = &__block_literal_global_149;
    v9 = v3;
    objc_msgSend(v4, "performBatchUpdates:completion:", v8, 0);

    -[UIViewController safari_saveTableViewScrollPosition](self);
    LODWORD(v4) = -[WebBookmarkList bookmarkCount](v7, "bookmarkCount") != 0;
    if (((v4 ^ (-[WebBookmarkList bookmarkCount](self->_readingList, "bookmarkCount") == 0)) & 1) == 0)
      -[ReadingListViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", 1);
    -[WebBookmarkCollection readingListWithUnreadOnly:](self->_collection, "readingListWithUnreadOnly:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bookmarkCount");

    if (v6)
      -[ReadingListViewController _clearExplanationView](self, "_clearExplanationView");
    else
      -[ReadingListViewController _showExplanationView](self, "_showExplanationView");

  }
}

id __66__ReadingListViewController__updateTableViewByComputingDifference__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "associatedIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v2, "index"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __66__ReadingListViewController__updateTableViewByComputingDifference__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "insertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", *(_QWORD *)(v1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(v1 + 40), "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(*(_QWORD *)(v1 + 40) + 1064))
      v6 = 5;
    else
      v6 = 1;
    objc_msgSend(v4, "insertRowsAtIndexPaths:withRowAnimation:", v3, v6);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 1144), "numberOfSections")
      && objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 1144), "numberOfRowsInSection:", 0)
      && objc_msgSend(v3, "containsObject:", v7))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 1144), "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 1, 1);
    }

  }
  v23 = v3;
  objc_msgSend(*(id *)(v1 + 32), "removals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", *(_QWORD *)(v1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 1144), "deleteRowsAtIndexPaths:withRowAnimation:", v9, 2);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(v1 + 32), "insertions", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "associatedIndex");
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v1;
          v18 = *(void **)(*(_QWORD *)(v1 + 40) + 1144);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v16, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v15, "index"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18;
          v1 = v17;
          objc_msgSend(v21, "moveRowAtIndexPath:toIndexPath:", v19, v20);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

}

- (void)_updateTableViewByRemovingReadingListItemAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ReadingListViewController _updateTableViewByRemovingReadingListItemsAtIndexPaths:](self, "_updateTableViewByRemovingReadingListItemsAtIndexPaths:", v6, v7, v8);
}

- (void)_readingListItemAtIndexPathDelete:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInMemoryBookmarkChangeTrackingAvailable");

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke;
    aBlock[3] = &unk_1E9CF5AC8;
    aBlock[4] = self;
    v13 = v4;
    v8 = _Block_copy(aBlock);

  }
  else
  {
    v8 = 0;
  }
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke_2;
  v10[3] = &unk_1E9CF5AC8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[ReadingListViewController _readingListItemAtIndexPath:lockAndPerformUpdates:performBlockIfLockFailed:](self, "_readingListItemAtIndexPath:lockAndPerformUpdates:performBlockIfLockFailed:", v9, v10, v8);

}

uint64_t __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "deleteBookmarkInMemory:", a2);
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDeleteBookmarkInMemory");

  return objc_msgSend(*(id *)(a1 + 32), "_updateTableViewByRemovingReadingListItemAtIndexPath:", *(_QWORD *)(a1 + 40));
}

void __63__ReadingListViewController__readingListItemAtIndexPathDelete___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "deleteBookmark:postChangeNotification:", v3, 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_scheduleDelayedChangeNotification");
    objc_msgSend(*(id *)(a1 + 32), "_updateTableViewByRemovingReadingListItemAtIndexPath:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(v3, "isMarkedAsRead") & 1) == 0)
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReadingListWidgetNeedsReload");

      v5 = WBS_LOG_CHANNEL_PREFIXWidgets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Requested widget update because of item deletion", v6, 2u);
      }
    }
  }

}

- (id)_createActions:(id)a3 forRowAtIndexPath:(id)a4 allowingNewlineInTitles:(BOOL)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v10 = a4;
  v11 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__ReadingListViewController__createActions_forRowAtIndexPath_allowingNewlineInTitles_withBlock___block_invoke;
  v16[3] = &unk_1E9CF5AF0;
  v16[4] = self;
  v17 = v10;
  v19 = a5;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __96__ReadingListViewController__createActions_forRowAtIndexPath_allowingNewlineInTitles_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createAction:forRowAtIndexPath:allowingNewlineInTitle:withBlock:", objc_msgSend(a2, "integerValue"), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)_createAction:(int64_t)a3 forRowAtIndexPath:(id)a4 allowingNewlineInTitle:(BOOL)a5 withBlock:(id)a6
{
  id v9;
  void (**v10)(id, id, const __CFString *, void *, uint64_t, _QWORD *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD aBlock[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id location;
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, id, const __CFString *, void *, uint64_t, _QWORD *))a6;
  objc_initWeak(&location, self);
  if (a3 == 1)
  {
    _WBSLocalizedString();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke;
    v64[3] = &unk_1E9CF1BF8;
    objc_copyWeak(&v66, &location);
    v65 = v9;
    v10[2](v10, v11, CFSTR("DeleteReadingListItem"), v12, 1, v64);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v66);
    goto LABEL_20;
  }
  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (a3 != 4)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_sf_shouldAutomaticallyDownloadReadingListItems");

      if ((v16 & 1) == 0)
      {
        if (objc_msgSend(v11, "shouldArchive"))
        {
          _WBSLocalizedString();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("icloud.slash"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_164;
          v61[3] = &unk_1E9CF1BF8;
          objc_copyWeak(&v63, &location);
          v62 = v9;
          v10[2](v10, v34, CFSTR("DontSaveReadingListItem"), v35, 0, v61);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_destroyWeak(&v63);
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isNetworkReachable");

        if (v32)
        {
          _WBSLocalizedString();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("icloud.and.arrow.down"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3;
          v58[3] = &unk_1E9CF1BF8;
          objc_copyWeak(&v60, &location);
          v59 = v9;
          v10[2](v10, v36, CFSTR("SaveOfflineReadingListItem"), v37, 0, v58);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_destroyWeak(&v60);
          goto LABEL_20;
        }
      }
    }
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_200;
    aBlock[3] = &unk_1E9CF5B40;
    objc_copyWeak(&v51, &location);
    v49 = v9;
    v11 = v11;
    v50 = v11;
    v41 = _Block_copy(aBlock);
    if (a3 == 16)
    {
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v17;
      v42[1] = 3221225472;
      v42[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_4;
      v42[3] = &unk_1E9CF1900;
      v43 = v11;
      v10[2](v10, v18, CFSTR("CopyReadingListItem"), v27, 0, v42);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a3 != 8)
      {
        v13 = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0DC3428], "_sf_openInNewTabActionWithHandler:", &__block_literal_global_204);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "image");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v17;
      v46[1] = 3221225472;
      v46[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_207;
      v46[3] = &unk_1E9CF1950;
      v21 = v41;
      v47 = v21;
      v10[2](v10, v19, CFSTR("OpenInNewTabReadingListItem"), v20, 0, v46);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "address");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
      v44[0] = v17;
      v44[1] = 3221225472;
      v44[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_209;
      v44[3] = &unk_1E9CF1950;
      v45 = v21;
      objc_msgSend(WeakRetained, "openInTabGroupMenuWithNewTabGroupName:URL:descendantCount:handler:", 0, v22, 0, v44);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0DC39D0];
      v68[0] = v40;
      v68[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v47;
    }

LABEL_14:
    objc_destroyWeak(&v51);
    goto LABEL_20;
  }
  objc_msgSend(v14, "dateLastViewed");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_186;
    v55[3] = &unk_1E9CF1BF8;
    objc_copyWeak(&v57, &location);
    v56 = v9;
    v10[2](v10, v29, CFSTR("MarkUnreadReadingListItem"), v30, 0, v55);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v57);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_199;
    v52[3] = &unk_1E9CF1BF8;
    objc_copyWeak(&v54, &location);
    v53 = v9;
    v10[2](v10, v29, CFSTR("MarkReadReadingListItem"), v33, 0, v52);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v54);
  }
LABEL_20:

  objc_destroyWeak(&location);
  return v13;
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = objc_msgSend(v4, "row");
      objc_msgSend(WeakRetained, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      v9 = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = v8;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Tap delete reading list item at row %ld, number of rows: %ld", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(WeakRetained, "_readingListItemAtIndexPathDelete:", *(_QWORD *)(a1 + 32));
  }

}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_164(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = objc_msgSend(v4, "row");
      objc_msgSend(WeakRetained, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      *(_DWORD *)buf = 134218240;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Tap delete archive of reading list item at row %ld, number of rows: %ld", buf, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 32);
    v10[4] = WeakRetained;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_165;
    v11[3] = &unk_1E9CF5B18;
    v11[4] = WeakRetained;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2;
    v10[3] = &unk_1E9CF5B18;
    objc_msgSend(WeakRetained, "_readingListItemAtIndexPath:lockAndPerformUpdates:performBlockIfLockFailed:", v9, v11, v10);
  }

}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_165(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "deleteArchiveForReadingListBookmarkWithID:", objc_msgSend(a2, "identifier"));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadReadingListAndTable");
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didPreventBookmarkActionWithBookmarkType:actionType:", 2, 2);

}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = objc_msgSend(v4, "row");
      objc_msgSend(WeakRetained, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      *(_DWORD *)buf = 134218240;
      v13 = v6;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Tap save archive of reading list item at row %ld, number of rows: %ld", buf, 0x16u);

    }
    v9 = *(_QWORD *)(a1 + 32);
    v10[4] = WeakRetained;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_172;
    v11[3] = &unk_1E9CF5B18;
    v11[4] = WeakRetained;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_173;
    v10[3] = &unk_1E9CF5B18;
    objc_msgSend(WeakRetained, "_readingListItemAtIndexPath:lockAndPerformUpdates:performBlockIfLockFailed:", v9, v11, v10);
  }

}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_172(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "saveArchiveForReadingListBookmarkWithID:", objc_msgSend(a2, "identifier"));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadReadingListAndTable");
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_173(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didPreventBookmarkActionWithBookmarkType:actionType:", 2, 2);

}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_186(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = objc_msgSend(v4, "row");
      objc_msgSend(WeakRetained, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      v10 = 134218240;
      v11 = v6;
      v12 = 2048;
      v13 = v8;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Tap mark unread on reading list item at row %ld, number of rows: %ld", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(WeakRetained, "_readingListItemAtIndexPath:setUnread:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didManuallyMarkReadingListItemAsRead:", 0);

  }
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_199(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      v6 = objc_msgSend(v4, "row");
      objc_msgSend(WeakRetained, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      v10 = 134218240;
      v11 = v6;
      v12 = 2048;
      v13 = v8;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Tap mark read on reading list item at row %ld, number of rows: %ld", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(WeakRetained, "_readingListItemAtIndexPath:setUnread:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didManuallyMarkReadingListItemAsRead:", 1);

  }
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_200(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      v8 = objc_msgSend(v6, "row");
      objc_msgSend(WeakRetained, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfRowsInSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
      v15 = 134218240;
      v16 = v8;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_DEFAULT, "Tap open in new tab on reading list item at row %ld, number of rows: %ld", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrefersOpenInNewTab:", 1);
    objc_msgSend(v11, "setPreferredTabOrder:", a2);
    objc_msgSend(v11, "navigationIntentWithBookmark:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained(WeakRetained + 141);
    objc_msgSend(v13, "dispatchNavigationIntent:", v12);

    if (objc_msgSend(v12, "shouldOrderToForeground"))
    {
      v14 = objc_loadWeakRetained(WeakRetained + 142);
      objc_msgSend(v14, "removeSingleBlankTabFromActiveTabGroup");

    }
  }

}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_2_207(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_3_209(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__ReadingListViewController__createAction_forRowAtIndexPath_allowingNewlineInTitle_withBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    objc_msgSend(v2, "setURL:", v1);
  else
    objc_msgSend(v2, "setString:", v4);

}

- (void)_readingListItemAtIndexPath:(id)a3 setUnread:(BOOL)a4
{
  int v4;
  void *v6;
  void *v7;
  int v8;
  id WeakRetained;
  _BOOL4 showingAllBookmarks;
  id v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateLastViewed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  if (v8 == v4)
  {
    if ((v4 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "readingListViewController:setBookmark:asRead:", self, v6, 0);

    }
    else
    {
      showingAllBookmarks = self->_showingAllBookmarks;
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "readingListViewController:setBookmark:asRead:", self, v6, 1);

      if (!showingAllBookmarks)
      {
        -[ReadingListViewController _updateTableViewByRemovingReadingListItemAtIndexPath:](self, "_updateTableViewByRemovingReadingListItemAtIndexPath:", v12);
        goto LABEL_6;
      }
    }
  }
  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", 0, 1);
LABEL_6:

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_loadIconsSynchronously = 0;
}

- (id)currentStateDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)restoreStateWithDictionary:(id)a3
{
  return 0;
}

- (void)bookmarksServerProxyDidFinishFetching:(id)a3
{
  if (self->_archivingBookmarkUUID)
    -[ReadingListViewController bookmarksServerProxy:didStopFetchingReadingListItem:](self, "bookmarksServerProxy:didStopFetchingReadingListItem:", self->_safariFetcherServerProxy);
  -[ReadingListViewController _disconnectSafariFetcherServerProxy](self, "_disconnectSafariFetcherServerProxy", a3);
}

- (void)bookmarksServerProxyConnectionInvalidated:(id)a3
{
  if (self->_safariFetcherServerProxy == a3)
  {
    -[ReadingListViewController _disconnectSafariFetcherServerProxy](self, "_disconnectSafariFetcherServerProxy");
    -[ReadingListViewController _connectSafariFetcherServerProxy](self, "_connectSafariFetcherServerProxy");
  }
}

- (void)bookmarksServerProxy:(id)a3 didStartFetchingReadingListItem:(id)a4
{
  SafariFetcherServerProxy *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  SafariFetcherServerProxy *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (SafariFetcherServerProxy *)a3;
  v7 = a4;
  if (v7
    && self->_safariFetcherServerProxy == v6
    && !-[NSString isEqualToString:](self->_archivingBookmarkUUID, "isEqualToString:", v7))
  {
    if (self->_archivingBookmarkUUID)
      -[ReadingListViewController bookmarksServerProxy:didStopFetchingReadingListItem:](self, "bookmarksServerProxy:didStopFetchingReadingListItem:", self->_safariFetcherServerProxy);
    -[WebBookmarkCollection bookmarkWithUUID:](self->_collection, "bookmarkWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v20 = v6;
      objc_storeStrong((id *)&self->_archivingBookmarkUUID, a4);
      -[UITableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows");
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        v19 = v8;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v7);

            if (v17)
            {
              -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v19;
              objc_msgSend(v18, "setBookmark:isArchiving:", v19, 1);

              goto LABEL_17;
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          v8 = v19;
          if (v11)
            continue;
          break;
        }
      }
LABEL_17:

      v6 = v20;
    }

  }
}

- (void)bookmarksServerProxy:(id)a3 didStopFetchingReadingListItem:(id)a4
{
  SafariFetcherServerProxy *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSString *archivingBookmarkUUID;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (SafariFetcherServerProxy *)a3;
  v7 = a4;
  if (self->_safariFetcherServerProxy == v6 && self->_archivingBookmarkUUID)
  {
    -[WebBookmarkCollection bookmarkWithUUID:](self->_collection, "bookmarkWithUUID:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v20 = v7;
      -[UITableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows");
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        v19 = v8;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "UUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", self->_archivingBookmarkUUID);

            if (v16)
            {
              -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v19;
              objc_msgSend(v17, "setBookmark:isArchiving:", v19, 0);

              goto LABEL_14;
            }

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v8 = v19;
          if (v10)
            continue;
          break;
        }
      }
LABEL_14:

      archivingBookmarkUUID = self->_archivingBookmarkUUID;
      self->_archivingBookmarkUUID = 0;

      -[ReadingListViewController _reloadReadingListAndTable](self, "_reloadReadingListAndTable");
      v7 = v20;
    }

  }
}

- (id)safari_tableViewForScrollPositionSaving
{
  return self->_tableView;
}

- (id)safari_tableViewScrollPositionSaveIdentifier
{
  return CFSTR("ReadingListCollection");
}

- (id)previewTableViewController:(id)a3 URLForRowAtIndexPath:(id)a4
{
  return -[ReadingListViewController _URLForRowAtIndexPath:](self, "_URLForRowAtIndexPath:", a4);
}

- (id)previewTableViewController:(id)a3 menuForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  -[ReadingListViewController _createActions:forRowAtIndexPath:allowingNewlineInTitles:withBlock:](self, "_createActions:forRowAtIndexPath:allowingNewlineInTitles:withBlock:", &unk_1E9D62910, a4, 0, &__block_literal_global_226);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__ReadingListViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5, void *a6)
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0DC3428];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__ReadingListViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2;
  v16[3] = &unk_1E9CF5BA8;
  v17 = v10;
  v12 = v10;
  v13 = a3;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", a2, a4, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", v13);

  if (a5)
    objc_msgSend(v14, "setAttributes:", 2);

  return v14;
}

uint64_t __78__ReadingListViewController_previewTableViewController_menuForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  NSString *v6;
  NSString *userTypedFilter;
  NSString *v8;
  NSString *v9;
  id v10;

  v10 = a3;
  v6 = (NSString *)a4;
  userTypedFilter = self->_userTypedFilter;
  if (userTypedFilter != v6 && !-[NSString isEqualToString:](userTypedFilter, "isEqualToString:", v6))
  {
    v8 = (NSString *)-[NSString copy](v6, "copy");
    v9 = self->_userTypedFilter;
    self->_userTypedFilter = v8;

    -[ReadingListViewController _reloadReadingListAndTable](self, "_reloadReadingListAndTable");
  }

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  NSString *userTypedFilter;

  userTypedFilter = self->_userTypedFilter;
  self->_userTypedFilter = 0;

  -[ReadingListViewController _reloadReadingListAndTable](self, "_reloadReadingListAndTable");
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0DC3758];
  v7 = a5;
  v8 = [v6 alloc];
  -[ReadingListViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "_sf_initWithBookmark:", v9);
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartDragWithDragContentType:", 9);

}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  if ((-[ReadingListViewController isEditing](self, "isEditing") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(MEMORY[0x1E0C99E98], "_sf_canCreateURLsFromDropSession:", v5);

  return v6;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D70]), "initWithDropOperation:dropLocation:", -[WebBookmarkCollection dropOperationForReadingListDropSession:]((uint64_t)self->_collection, a4), 2);
}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  WebBookmarkCollection *collection;
  void *v6;
  id v7;

  collection = self->_collection;
  objc_msgSend(a4, "session", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection dropDragItemsInReadingList:updatingController:]((uint64_t)collection, v6, self);

}

- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (void)updateUserActivityState:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  WebBookmarksReadingListFolderTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  objc_msgSend(v4, "setEligibleForSearch:", 1);
  objc_msgSend(v4, "setEligibleForPrediction:", 1);

}

- (BOOL)showingAllBookmarks
{
  return self->_showingAllBookmarks;
}

- (ReadingListViewControllerDelegate)delegate
{
  return (ReadingListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (void)setTabGroupProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabGroupProvider, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visibleBookmarkIDs, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_userTypedFilter, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_deletionNotificationTimer, 0);
  objc_storeStrong((id *)&self->_archivingBookmarkUUID, 0);
  objc_storeStrong((id *)&self->_safariFetcherServerProxy, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_cachedSaveOfflineBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cachedDeleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cachedUnreadFilterBarButtonButton, 0);
}

@end
