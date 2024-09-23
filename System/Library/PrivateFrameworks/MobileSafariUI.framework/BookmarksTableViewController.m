@implementation BookmarksTableViewController

- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4
{
  return -[BookmarksTableViewController initWithFolder:inCollection:skipOffset:](self, "initWithFolder:inCollection:skipOffset:", a3, a4, 0);
}

- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4 skipOffset:(unsigned int)a5
{
  return -[BookmarksTableViewController initWithFolder:inCollection:activeSyntheticFolder:showAllSyntheticFolders:skipOffset:](self, "initWithFolder:inCollection:activeSyntheticFolder:showAllSyntheticFolders:skipOffset:", a3, a4, 0, 0, *(_QWORD *)&a5);
}

- (BookmarksTableViewController)initWithFolder:(id)a3 inCollection:(id)a4 activeSyntheticFolder:(id)a5 showAllSyntheticFolders:(BOOL)a6 skipOffset:(unsigned int)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  BookmarksTableViewController *v16;
  BookmarksTableViewController *v17;
  uint64_t v18;
  WebBookmarkList *bookmarkList;
  NSArray *allSyntheticFolders;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  BookmarksTableViewController *v28;
  objc_super v30;
  _QWORD v31[2];
  _QWORD v32[2];

  v8 = a6;
  v32[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BookmarksTableViewController;
  v16 = -[BookmarksTableViewController initWithStyle:](&v30, sel_initWithStyle_, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_folder, a3);
    objc_storeStrong((id *)&v17->_collection, a4);
    v17->_skipOffset = a7;
    if (v15 && !v8)
    {
      objc_msgSend(v15, "bookmarkList");
      v18 = objc_claimAutoreleasedReturnValue();
      bookmarkList = v17->_bookmarkList;
      v17->_bookmarkList = (WebBookmarkList *)v18;

      objc_storeStrong((id *)&v17->_activeSyntheticFolder, a5);
    }
    if (v8)
    {
      allSyntheticFolders = v17->_allSyntheticFolders;
      v17->_allSyntheticFolders = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    -[BookmarksTableViewController traitCollection](v17, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferredContentSizeCategory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[BookmarksTableViewCellLayoutManager sharedManager](BookmarksTableViewCellLayoutManager, "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCurrentContentSizeCategory:", v22);

    -[BookmarksTableViewController _updateTitle](v17, "_updateTitle");
    -[BookmarksTableViewController _recreateBookmarkLists](v17, "_recreateBookmarkLists");
    v32[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)-[BookmarksTableViewController registerForTraitChanges:withTarget:action:](v17, "registerForTraitChanges:withTarget:action:", v24, v17, sel_contentSizeCategoryDidChange);

    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)-[BookmarksTableViewController registerForTraitChanges:withTarget:action:](v17, "registerForTraitChanges:withTarget:action:", v26, v17, sel_updateSeparatorInsetForTraitChange);

    v28 = v17;
  }

  return v17;
}

- (void)setCollection:(id)a3
{
  WebBookmarkCollection *v5;
  WebBookmarkCollection *v6;

  v5 = (WebBookmarkCollection *)a3;
  if (self->_collection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collection, a3);
    -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
    v5 = v6;
  }

}

- (BOOL)_isShowingAllSyntheticFolders
{
  return self->_allSyntheticFolders && -[NSString length](self->_userTypedFilter, "length") == 0;
}

- (void)_updateTitle
{
  SFSyntheticBookmarkFolder *activeSyntheticFolder;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  activeSyntheticFolder = self->_activeSyntheticFolder;
  if (activeSyntheticFolder)
  {
    -[SFSyntheticBookmarkFolder title](activeSyntheticFolder, "title");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_allSyntheticFolders)
      _WBSLocalizedString();
    else
      -[WebBookmark localizedTitle](self->_folder, "localizedTitle");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v4;
  v5 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v7);

  -[BookmarksTableViewController setTitle:](self, "setTitle:", v8);
}

- (BOOL)_inRootFolder
{
  return !self->_activeSyntheticFolder
      && !self->_allSyntheticFolders
      && -[WebBookmark identifier](self->_folder, "identifier") == 0;
}

- (void)_recreateBookmarkLists
{
  id WeakRetained;
  WebBookmarkList **p_bookmarkList;
  WebBookmarkList *v5;
  WebBookmarkList *v6;
  NSArray *v7;
  NSArray *allSyntheticFolders;
  objc_class *v9;
  uint64_t v10;
  WebBookmarkList *v11;
  void *v12;
  int v13;
  WebBookmark *v14;
  WebBookmark *favoritesFolder;
  WebBookmarkList *v16;
  WebBookmarkList *bookmarkList;
  void *v18;
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_activeSyntheticFolder)
  {
    if (self->_allSyntheticFolders)
    {
      objc_msgSend(v19, "allSyntheticBookmarkFolders");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      allSyntheticFolders = v7;
      if (!v7)
        allSyntheticFolders = self->_allSyntheticFolders;
      objc_storeStrong((id *)&self->_allSyntheticFolders, allSyntheticFolders);

      objc_msgSend(v19, "perTabGroupBookmarkListForFolderID:filteredUsingString:", 0, self->_userTypedFilter);
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "usesAllowedSitesOnly");

      if (!v13)
      {
        -[WebBookmarkCollection listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:](self->_collection, "listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:", -[WebBookmark identifier](self->_folder, "identifier"), LODWORD(self->_skipOffset), 0, -[NSString length](self->_userTypedFilter, "length") != 0, self->_userTypedFilter);
        v16 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
        bookmarkList = self->_bookmarkList;
        self->_bookmarkList = v16;

        if (-[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
        {
          objc_msgSend(v19, "perTabGroupBookmarkListForFolderID:filteredUsingString:", 0, self->_userTypedFilter);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[WebBookmarkList setShadowBookmarkList:](self->_bookmarkList, "setShadowBookmarkList:", v18);

        }
        -[WebBookmarkCollection favoritesFolder](self->_collection, "favoritesFolder");
        v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v10 = 1072;
        goto LABEL_10;
      }
      -[WebBookmarkCollection webFilterAllowedSitesFolder](self->_collection, "webFilterAllowedSitesFolder");
      v14 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
      favoritesFolder = self->_favoritesFolder;
      self->_favoritesFolder = v14;

      if (-[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
      {
        v11 = self->_bookmarkList;
        self->_bookmarkList = 0;
        goto LABEL_11;
      }
      -[WebBookmarkCollection listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:](self->_collection, "listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:", -[WebBookmark identifier](self->_folder, "identifier"), LODWORD(self->_skipOffset), 0, -[NSString length](self->_userTypedFilter, "length") != 0, self->_userTypedFilter);
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    v10 = 1064;
LABEL_10:
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v9;
LABEL_11:

    goto LABEL_12;
  }
  p_bookmarkList = &self->_bookmarkList;
  objc_msgSend(v19, "perTabGroupBookmarkListForFolderID:filteredUsingString:", -[WebBookmarkList folderID](self->_bookmarkList, "folderID"), self->_userTypedFilter);
  v5 = (WebBookmarkList *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v6 = *p_bookmarkList;
  objc_storeStrong((id *)&self->_bookmarkList, v6);

  -[SFSyntheticBookmarkFolder setBookmarkList:](self->_activeSyntheticFolder, "setBookmarkList:", *p_bookmarkList);
LABEL_12:

}

- (void)reloadBookmarks
{
  void *v3;

  if (!self->_shouldDeferReload)
  {
    -[BookmarksTableViewController _recreateBookmarkLists](self, "_recreateBookmarkLists");
    -[BookmarksTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

    -[BookmarksTableViewController _updateTitle](self, "_updateTitle");
  }
}

- (void)reloadAllSyntheticFolders
{
  if (self->_allSyntheticFolders)
    -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
}

- (int)folderID
{
  if (self->_activeSyntheticFolder)
    return -[WebBookmarkList folderID](self->_bookmarkList, "folderID");
  else
    return -[WebBookmark identifier](self->_folder, "identifier");
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
  -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
}

- (void)setPreviewing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UISearchBar *searchBar;
  id v7;

  if (self->_previewing != a3)
  {
    v3 = a3;
    self->_previewing = a3;
    -[BookmarksTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (!self->_shouldUseSearchControllerInNavigationBar)
    {
      if (v3)
        searchBar = 0;
      else
        searchBar = self->_searchBar;
      objc_msgSend(v5, "setTableHeaderView:", searchBar);
      v5 = v7;
    }
    objc_msgSend(v5, "setShowsVerticalScrollIndicator:", !v3);

  }
}

- (int64_t)minimumNumberOfRows
{
  objc_super v3;

  if (self->_previewing)
    return 3;
  v3.receiver = self;
  v3.super_class = (Class)BookmarksTableViewController;
  return -[SFPopoverSizingTableViewController minimumNumberOfRows](&v3, sel_minimumNumberOfRows);
}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setAllowsSelectionDuringEditing:", 1);
  objc_msgSend(v4, "setCellLayoutMarginsFollowReadableWidth:", 0);
  objc_msgSend(v4, "setDragDelegate:", self);
  objc_msgSend(v4, "setDropDelegate:", self);
  objc_msgSend(v4, "setKeyboardDismissMode:", 1);
  objc_msgSend(v4, "setSpringLoaded:", 1);
  -[BookmarksTableViewController setTableView:](self, "setTableView:", v4);

}

- (void)contentSizeCategoryDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BookmarksTableViewController_contentSizeCategoryDidChange__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__BookmarksTableViewController_contentSizeCategoryDidChange__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  _SFRoundFloatToPixels();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "setFrame:", 0.0, 0.0, 0.0, v2);
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 1131))
  {
    v4 = *(_QWORD *)(v3 + 1096);
    objc_msgSend((id)v3, "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", v4);

  }
}

- (void)updateSeparatorInsetForTraitChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BookmarksTableViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BookmarksTableViewCellLayoutManager sharedManager](BookmarksTableViewCellLayoutManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentContentSizeCategory:", v4);

  -[BookmarksTableViewController updateSeparatorInset](self, "updateSeparatorInset");
  -[BookmarksTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)updateSeparatorInset
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  -[BookmarksTableViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "separatorInsetForBookmarksTableViewController:", self);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = 50.0;
  if (IsAccessibilityCategory)
    v15 = 0.0;
  v16 = v15 + v10;
  -[BookmarksTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSeparatorInsetReference:", IsAccessibilityCategory);

  -[BookmarksTableViewController tableView](self, "tableView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSeparatorInset:", v8, v16, v12, v14);

}

- (BOOL)canCreateNewFolder
{
  return !self->_allSyntheticFolders && self->_activeSyntheticFolder == 0;
}

- (void)viewDidLoad
{
  void *v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  UISearchBar *v10;
  UISearchBar *v11;
  UISearchBar *v12;
  UISearchBar *searchBar;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BookmarksTableViewController;
  -[SFPopoverSizingTableViewController viewDidLoad](&v14, sel_viewDidLoad);
  self->_needsContentOffsetUpdate = 1;
  -[BookmarksTableViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  -[BookmarksTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("BookmarksTable"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_skipOffset)
  {
    objc_msgSend(WeakRetained, "contentInsetForBookmarksTableViewController:", self);
    objc_msgSend(v3, "setContentInset:");
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (self->_shouldUseSearchControllerInNavigationBar)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0DC3C38], "sf_installSearchBarInTableView:includeSeparator:", v3, 0);
    v12 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    searchBar = self->_searchBar;
    self->_searchBar = v12;

    self->_needsInitialContentOffsetUpdateForTableHeaderView = 1;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v5, "panelViewControllerShouldUseSearchControllerInNavigationItem:", self);
  self->_shouldUseSearchControllerInNavigationBar = v6;
  if (!v6)
    goto LABEL_7;
LABEL_5:
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  objc_msgSend(v7, "setObscuresBackgroundDuringPresentation:", 0);
  -[BookmarksTableViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredSearchBarPlacement:", 2);

  -[BookmarksTableViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchController:", v7);

  objc_msgSend(v7, "searchBar");
  v10 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  v11 = self->_searchBar;
  self->_searchBar = v10;

LABEL_8:
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
LABEL_9:
  -[BookmarksTableViewController updateSeparatorInset](self, "updateSeparatorInset");
  if (self->_previewing)
    objc_msgSend(v3, "setTableHeaderView:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BookmarksTableViewController;
  -[SFPopoverSizingTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
  -[BookmarksTableViewController _updateContentOffsetIfNeeded](self, "_updateContentOffsetIfNeeded");
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
  v9.super_class = (Class)BookmarksTableViewController;
  -[SFPopoverSizingTableViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  self->_needsContentOffsetUpdate = 0;
  -[BookmarksTableViewController userActivity](self, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD5868];
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD5868]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "invalidate");
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v6);

    -[BookmarksTableViewController setUserActivity:](self, "setUserActivity:", v8);
    v4 = (void *)v8;
  }
  objc_msgSend(v4, "setNeedsSave:", 1);

}

- (void)willMoveToParentViewController:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BookmarksTableViewController;
  -[SFPopoverSizingTableViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setPinnedPaletteForPanelViewController:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BookmarksTableViewController;
  -[BookmarksTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[UIViewController safari_saveTableViewScrollPosition](self);
  -[BookmarksTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView safari_dismissContextMenu](v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksTableViewControllerWillDisappear:", self);

}

- (void)_updateContentOffsetIfNeeded
{
  void *v3;

  if (!self->_previewing && self->_needsContentOffsetUpdate)
  {
    if (-[UIViewController safari_hasSavedTableViewScrollPosition]((_BOOL8)self)
      && -[UIViewController safari_restoreTableViewScrollPosition](self))
    {
      self->_needsInitialContentOffsetUpdateForTableHeaderView = 0;
    }
    if (self->_needsInitialContentOffsetUpdateForTableHeaderView)
    {
      -[BookmarksTableViewController tableView](self, "tableView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView safari_adjustContentOffsetToTopHidingTableHeaderView](v3);

      self->_needsInitialContentOffsetUpdateForTableHeaderView = 0;
    }
  }
}

- (void)viewDidLayoutSubviews
{
  UISearchBar *searchBar;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BookmarksTableViewController;
  -[SFPopoverSizingTableViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  searchBar = self->_searchBar;
  -[BookmarksTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMargins");
  -[UISearchBar _setOverrideContentInsets:forRectEdges:](searchBar, "_setOverrideContentInsets:forRectEdges:", 10);

}

- (BOOL)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned int v6;

  if (-[BookmarksTableViewController _isShowingAllSyntheticFolders](self, "_isShowingAllSyntheticFolders", a3, a4))
    return -[NSArray count](self->_allSyntheticFolders, "count");
  v6 = -[WebBookmarkList bookmarkCount](self->_bookmarkList, "bookmarkCount");
  if (-[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
  {
    if (!-[NSString length](self->_userTypedFilter, "length"))
      v6 += 2;
  }
  return v6;
}

- (id)_bookmarkAtIndexPath:(id)a3
{
  uint64_t v4;
  WebBookmark *v5;
  WebBookmarkList *bookmarkList;
  uint64_t v7;

  v4 = objc_msgSend(a3, "row");
  if (-[BookmarksTableViewController _isShowingAllSyntheticFolders](self, "_isShowingAllSyntheticFolders"))
    goto LABEL_2;
  if (-[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
  {
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 != 1)
      {
LABEL_11:
        if (-[NSString length](self->_userTypedFilter, "length"))
          v4 = v4;
        else
          v4 = (v4 - 2);
        if (-[WebBookmarkList bookmarkCount](self->_bookmarkList, "bookmarkCount") <= v4)
          goto LABEL_2;
        bookmarkList = self->_bookmarkList;
        v7 = v4;
LABEL_16:
        -[WebBookmarkList bookmarkAtIndex:](bookmarkList, "bookmarkAtIndex:", v7);
        v5 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
    }
    else if (!-[NSString length](self->_userTypedFilter, "length"))
    {
      v5 = self->_favoritesFolder;
      return v5;
    }
    v5 = -[NSString length](self->_userTypedFilter, "length");
    if (!v5)
      return v5;
    goto LABEL_11;
  }
  if (-[WebBookmarkList bookmarkCount](self->_bookmarkList, "bookmarkCount") > v4)
  {
    bookmarkList = self->_bookmarkList;
    v7 = v4;
    goto LABEL_16;
  }
LABEL_2:
  v5 = 0;
  return v5;
}

- (BOOL)_bookmarkAtIndexPathIsFolder:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFolder") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[BookmarksTableViewController _syntheticFolderAtIndexPath:](self, "_syntheticFolderAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  return v6;
}

- (id)_syntheticFolderAtIndexPath:(id)a3
{
  id v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  if (-[BookmarksTableViewController _inRootFolder](self, "_inRootFolder")
    && objc_msgSend(v4, "row") == 1
    && !-[NSString length](self->_userTypedFilter, "length"))
  {
    v10 = objc_alloc(MEMORY[0x1E0CD5610]);
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "initWithBookmarkList:title:", 0, v11);

  }
  else
  {
    v5 = -[NSArray count](self->_allSyntheticFolders, "count");
    v6 = objc_msgSend(v4, "row");
    if (!v5 || ((v7 = v6, !-[NSString length](self->_userTypedFilter, "length")) ? (v8 = v7 >= v5) : (v8 = 1), v8))
    {
      v9 = 0;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_allSyntheticFolders, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (id)bookmarksTableViewCellWithReuseIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;

  v4 = a3;
  -[BookmarksTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v4);
    +[BookmarksTableViewCellLayoutManager sharedManager](BookmarksTableViewCellLayoutManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutManager:", v7);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredSymbolConfiguration:", v8);

  }
  v10 = -[BookmarksTableViewController hasTranslucentAppearance](self, "hasTranslucentAppearance");
  if (v10)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(v6, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v11);

  objc_msgSend(v6, "sf_setUsesVibrantSelection:", v10);
  return v6;
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v5;

  v5 = 0;
  if (!a4 && !self->_shouldUseSearchControllerInNavigationBar)
  {
    objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("BookmarkSpacingHeaderReuseIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("BookmarkSpacingHeaderReuseIdentifier"));
  }
  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if (!self->_shouldUseSearchControllerInNavigationBar)
  {
    if (!a4)
      return 12.0;
    return 0.0;
  }
  if (a4)
    return 0.0;
  result = 12.0;
  if (!self->_previewing)
    return 0.0;
  return result;
}

- (id)_fontForCurrentTraitCollection
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[BookmarksTableViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass");
  v4 = *MEMORY[0x1E0DC4A88];
  if (v3 == 1)
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", v4, *MEMORY[0x1E0DC48D0]);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_tableViewCellForBookmark:(id)a3 syntheticFolder:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  if (v7 || -[BookmarksTableViewController _isShowingAllSyntheticFolders](self, "_isShowingAllSyntheticFolders"))
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "isFolder");
  -[BookmarksTableViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (v8)
    v12 = CFSTR("FolderTableCell");
  else
    v12 = CFSTR("BookmarkTableCell");
  -[BookmarksTableViewController bookmarksTableViewCellWithReuseIdentifier:](self, "bookmarksTableViewCellWithReuseIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v15);

  -[BookmarksTableViewController _fontForCurrentTraitCollection](self, "_fontForCurrentTraitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v16);

  objc_msgSend(v13, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTintColor:", 0);
  if (v8)
  {
    if (v7)
      objc_msgSend(v7, "title");
    else
      objc_msgSend(v6, "localizedTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v24);

    objc_msgSend(v13, "setAccessoryType:", 1);
    objc_msgSend(v13, "setEditingAccessoryType:", 0);
    if (-[BookmarksTableViewController _isShowingAllSyntheticFolders](self, "_isShowingAllSyntheticFolders")
      || (v25 = objc_msgSend(v6, "identifier"),
          v25 != -[WebBookmark identifier](self->_favoritesFolder, "identifier")))
    {
      if (v7)
      {
        if (IsAccessibilityCategory)
        {
LABEL_25:
          objc_msgSend(v17, "setImage:", 0);
LABEL_29:
          v23 = CFSTR("BookmarksSidebarTableFolderCellView");
          goto LABEL_30;
        }
        v28 = (void *)MEMORY[0x1E0DC3870];
        v29 = CFSTR("star.square.on.square");
LABEL_27:
        objc_msgSend(v28, "systemImageNamed:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setImage:", v30);
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "usesAllowedSitesOnly");

      if (!v27)
      {
        if (IsAccessibilityCategory)
        {
          objc_msgSend(v17, "setImage:", 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setImage:", v32);

        }
        if (!-[BookmarksTableViewController isEditing](self, "isEditing"))
          goto LABEL_29;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTextColor:", v33);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTintColor:", v30);
        goto LABEL_28;
      }
    }
    if (IsAccessibilityCategory)
      goto LABEL_25;
    v28 = (void *)MEMORY[0x1E0DC3870];
    v29 = CFSTR("folder");
    goto LABEL_27;
  }
  objc_msgSend(v13, "safari_annotateWithBookmark:", v6);
  objc_msgSend(v13, "setAccessoryType:", 0);
  objc_msgSend(v13, "setEditingAccessoryType:", objc_msgSend(v6, "isEditable"));
  objc_msgSend(v6, "title");
  v18 = (char *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "address");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell safari_setLinkedPageTitle:URL:](v13, v18, (uint64_t)v21);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v17, "setImage:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("book"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v22);

  }
  v23 = CFSTR("BookmarksSidebarTableCellView");
LABEL_30:
  objc_msgSend(v13, "setAccessibilityIdentifier:", v23);

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[BookmarksTableViewController _syntheticFolderAtIndexPath:](self, "_syntheticFolderAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BookmarksTableViewController _tableViewCellForBookmark:syntheticFolder:](self, "_tableViewCellForBookmark:syntheticFolder:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  if (-[BookmarksTableViewController isEditing](self, "isEditing"))
  {
    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEditable"))
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_pushInfoViewControllerForBookmark:(id)a3
{
  objc_class *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CD5660];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithBookmark:inCollection:addingBookmark:", v5, self->_collection, objc_msgSend(v5, "isInserted") ^ 1);

  objc_msgSend(v8, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setPinnedPaletteForPanelViewController:", self);
  -[BookmarksTableViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (id)_newViewControllerForFolder:(id)a3 syntheticFolder:(id)a4 showAllSyntheticFolders:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  BookmarksTableViewController *v10;
  id WeakRetained;
  id v12;
  id v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BookmarksTableViewController initWithFolder:inCollection:activeSyntheticFolder:showAllSyntheticFolders:skipOffset:]([BookmarksTableViewController alloc], "initWithFolder:inCollection:activeSyntheticFolder:showAllSyntheticFolders:skipOffset:", v9, self->_collection, v8, v5, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BookmarksTableViewController setDelegate:](v10, "setDelegate:", WeakRetained);

  v12 = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  -[BookmarksTableViewController setLinkPreviewProvider:](v10, "setLinkPreviewProvider:", v12);

  v13 = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  -[BookmarksTableViewController setNavigationIntentHandler:](v10, "setNavigationIntentHandler:", v13);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD aBlock[5];
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[BookmarksTableViewController isEditing](self, "isEditing")
    || (-[BookmarksTableViewController tableView](self, "tableView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasActiveDrag"),
        v8,
        (v9 & 1) != 0))
  {
    -[BookmarksTableViewController _syntheticFolderAtIndexPath:](self, "_syntheticFolderAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "bookmarkList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[BookmarksTableViewController _newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:](self, "_newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:", 0, v11, v12 == 0);

      -[BookmarksTableViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pushViewController:animated:", v13, 1);

      goto LABEL_21;
    }
    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__BookmarksTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_1E9CF2990;
    aBlock[4] = self;
    v16 = v15;
    v36 = v16;
    v17 = v7;
    v37 = v17;
    v18 = (void (**)(_QWORD))_Block_copy(aBlock);
    v19 = objc_msgSend(v16, "isFolder");
    v20 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        v22 = v20;
        v23 = objc_msgSend(v17, "row");
        v24 = objc_msgSend(v17, "section");
        v25 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v17, "section"));
        *(_DWORD *)buf = 134218496;
        v39 = v23;
        v40 = 2048;
        v41 = v24;
        v42 = 2048;
        v43 = v25;
        _os_log_impl(&dword_1D7CA3000, v22, OS_LOG_TYPE_DEFAULT, "Tap bookmark folder at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);

      }
      if (!objc_msgSend(MEMORY[0x1E0D4EF70], "shouldOpenBookmarkFolderAsTabs"))
      {
        v26 = -[BookmarksTableViewController _newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:](self, "_newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:", v16, 0, 0);
        -[BookmarksTableViewController navigationController](self, "navigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pushViewController:animated:", v26, 1);

        if (-[BookmarksTableViewController isEditing](self, "isEditing"))
          objc_msgSend(v26, "setEditing:animated:", 1, 0);

        goto LABEL_20;
      }
    }
    else
    {
      if (v21)
      {
        v30 = v20;
        v31 = objc_msgSend(v17, "row");
        v32 = objc_msgSend(v17, "section");
        v33 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v17, "section"));
        *(_DWORD *)buf = 134218496;
        v39 = v31;
        v40 = 2048;
        v41 = v32;
        v42 = 2048;
        v43 = v33;
        _os_log_impl(&dword_1D7CA3000, v30, OS_LOG_TYPE_DEFAULT, "Tap bookmark at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "didVisitBookmarksWithOpenLocation:numberOfBookmarksVisited:", 0, 1);

    }
    v18[2](v18);
LABEL_20:

    goto LABEL_21;
  }
  v28 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v28;
    *(_DWORD *)buf = 134218496;
    v39 = objc_msgSend(v7, "row");
    v40 = 2048;
    v41 = objc_msgSend(v7, "section");
    v42 = 2048;
    v43 = objc_msgSend(v6, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
    _os_log_impl(&dword_1D7CA3000, v29, OS_LOG_TYPE_DEFAULT, "Tap to edit bookmark at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);

  }
  -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[BookmarksTableViewController _pushInfoViewControllerForBookmark:](self, "_pushInfoViewControllerForBookmark:", v11);
LABEL_21:

}

void __66__BookmarksTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1144));
  v3 = objc_msgSend(WeakRetained, "bookmarksTableViewShouldDispatchNavigationIntent:forSelectedBookmark:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationIntentWithBookmark:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1160));
      objc_msgSend(v6, "dispatchNavigationIntent:", v5);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 48), 1);

}

- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  void *v5;
  char v6;

  -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFolder");

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  id WeakRetained;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  BookmarksTableViewController *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  BookmarksTableViewController *v24;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "bookmarksTableViewIsReadOnly:", self);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksTableViewController _syntheticFolderAtIndexPath:](self, "_syntheticFolderAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = (void *)MEMORY[0x1E0DC36B8];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v21[3] = &unk_1E9CF2F50;
    v22 = v11;
    v23 = v10;
    v24 = self;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
    v17[3] = &unk_1E9CF2F78;
    v18 = v23;
    v19 = self;
    v20 = v6;
    v14 = v23;
    v15 = v11;
    objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", v20, v21, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = a1[5];
    v4 = (void *)a1[6];
  }
  else
  {
    if (!objc_msgSend((id)a1[5], "isFolder"))
    {
      objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationIntentWithBookmark:", a1[5]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 1152));
      objc_msgSend(v10, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "linkPreviewViewControllerForURL:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    v2 = (void *)a1[4];
    v8 = a1 + 5;
    v3 = a1[5];
    v4 = (void *)v8[1];
    if (!v2)
    {
      v6 = (void *)objc_msgSend(v4, "_newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:", v3, 0, 0);
      goto LABEL_4;
    }
  }
  objc_msgSend(v2, "bookmarkList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:", v3, v2, v5 == 0);

LABEL_4:
  objc_msgSend(v6, "setPreviewing:", 1);
  return v6;
}

id __90__BookmarksTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = *(_QWORD *)(v2 + 1056);
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 1144));
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_contextMenuUsingCollection:tabGroupActionProvider:withUserInfo:handler:", v4, v6, a1[6], a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v7);
  return v8;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BookmarksTableViewController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "previewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __100__BookmarksTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v15[3] = &unk_1E9CF2AF8;
  v16 = v11;
  v17 = self;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v10, "addAnimations:", v15);

}

void __100__BookmarksTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  id v4;
  id *v5;
  uint64_t v6;
  id WeakRetained;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "setPreviewing:", 0);
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

  }
  else
  {
    v5 = *(id **)(a1 + 40);
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained(v5 + 144);
      objc_msgSend(WeakRetained, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      WeakRetained = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tableView:didSelectRowAtIndexPath:", v6);
    }
  }

}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  void *v5;
  id WeakRetained;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[BookmarksTableViewController _bookmarkAtIndexPathIsFolder:](self, "_bookmarkAtIndexPathIsFolder:", v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
    objc_msgSend(WeakRetained, "linkPreviewProviderWillDismissPreview");

  }
  return 0;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[BookmarksTableViewController tableView:willSelectRowAtIndexPath:](self, "tableView:willSelectRowAtIndexPath:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_updateTableViewCellsTextStyleForEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (-[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[BookmarksTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (v3)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v7);

      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v6, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v9);

      if (v3)
    }

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  objc_super v11;

  v4 = a4;
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BookmarksTableViewController;
  -[BookmarksTableViewController setEditing:animated:](&v11, sel_setEditing_animated_);
  -[BookmarksTableViewController _updateTableViewCellsTextStyleForEditing:](self, "_updateTableViewCellsTextStyleForEditing:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "panelViewController:updateToolbarItemsAnimated:", self, v4);
  v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Begin editing bookmarks table view", v10, 2u);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "panelViewControllerDidBeginEditing:", self);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "End editing bookmarks table view", v10, 2u);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "panelViewControllerDidEndEditing:", self);
  }

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int64_t v14;

  v5 = a4;
  if (!self->_skipOffset)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "bookmarksTableViewIsReadOnly:", self);

    if ((v7 & 1) == 0)
    {
      +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isBookmarksAvailable");

      if (v9)
      {
        -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isDeletable") & 1) != 0)
        {
          -[BookmarksTableViewController bookmarksNavigationController](self, "bookmarksNavigationController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

LABEL_12:
            v14 = 1;
            goto LABEL_10;
          }
          -[BookmarksTableViewController bookmarksNavigationController](self, "bookmarksNavigationController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "allowsEditing");

          if (v13)
            goto LABEL_12;
        }
        else
        {

        }
      }
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  BOOL v8;
  void *v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "bookmarksTableViewIsReadOnly:", self);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEditable"))
      v8 = self->_skipOffset == 0;
    else
      v8 = 0;

  }
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  id v7;

  if (a4 == 1)
  {
    v6 = a5;
    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[BookmarksTableViewController _deleteBookmark:atIndexPath:](self, "_deleteBookmark:atIndexPath:", v7, v6);

  }
}

- (void)_deleteBookmark:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  char v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  WebBookmarkCollection *collection;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BookmarksTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 134218496;
    v31 = objc_msgSend(v7, "row");
    v32 = 2048;
    v33 = objc_msgSend(v7, "section");
    v34 = 2048;
    v35 = objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
    _os_log_impl(&dword_1D7CA3000, v10, OS_LOG_TYPE_DEFAULT, "Delete bookmark at row: %ld, section: %ld, rows in section: %ld", buf, 0x20u);

  }
  if (objc_msgSend(v6, "isDeletable"))
  {
    objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "hasBookmarksLock") & 1) != 0)
    {
      v12 = 0;
      v13 = 0;
    }
    else if ((objc_msgSend(v11, "lockBookmarks") & 1) != 0)
    {
      v13 = 0;
      v12 = 1;
    }
    else
    {
      +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isInMemoryBookmarkChangeTrackingAvailable");

      if ((v15 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, self);
        objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "didPreventBookmarkActionWithBookmarkType:actionType:", 0, 1);

        -[BookmarksTableViewController tableView](self, "tableView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cellForRowAtIndexPath:", v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setEditing:animated:", 0, 1);

LABEL_17:
        goto LABEL_18;
      }
      v12 = 0;
      v13 = 1;
    }
    v16 = -[WebBookmarkList bookmarkCount](self->_bookmarkList, "bookmarkCount");
    self->_shouldDeferReload = 1;
    if (objc_msgSend(v6, "subtype") == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "tabGroupProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __60__BookmarksTableViewController__deleteBookmark_atIndexPath___block_invoke;
      v26[3] = &unk_1E9CF2FA0;
      v26[4] = self;
      v27 = v7;
      v28 = v16;
      v29 = v12;
      objc_msgSend(v18, "deleteScopedBookmarkWithUUID:completionHandler:", v19, v26);

    }
    else
    {
      collection = self->_collection;
      if ((v13 & 1) != 0)
      {
        -[WebBookmarkCollection deleteBookmarkInMemory:](collection, "deleteBookmarkInMemory:", v6);
        objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "didDeleteBookmarkInMemory");

        v22 = 1;
      }
      else
      {
        v22 = -[WebBookmarkCollection deleteBookmark:](collection, "deleteBookmark:", v6);
      }
      -[BookmarksTableViewController _handleBookmarkItemDeleted:atIndexPath:bookmarkCountBeforeDeletion:lockedDatabase:](self, "_handleBookmarkItemDeleted:atIndexPath:bookmarkCountBeforeDeletion:lockedDatabase:", v22, v7, v16, v12);
    }
    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __60__BookmarksTableViewController__deleteBookmark_atIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBookmarkItemDeleted:atIndexPath:bookmarkCountBeforeDeletion:lockedDatabase:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)_handleBookmarkItemDeleted:(BOOL)a3 atIndexPath:(id)a4 bookmarkCountBeforeDeletion:(unint64_t)a5 lockedDatabase:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v6 = a6;
  v8 = a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[BookmarksTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksTableViewController _recreateBookmarkLists](self, "_recreateBookmarkLists");
  v12 = -[WebBookmarkList bookmarkCount](self->_bookmarkList, "bookmarkCount");
  if (v8)
  {
    v13 = v12;
    if (!objc_msgSend(v10, "row") && -[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadSections:withRowAnimation:", v14, 0);
LABEL_7:

      goto LABEL_9;
    }
    if (a5 - 1 == v13)
    {
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v14, 2);
      goto LABEL_7;
    }
  }
  objc_msgSend(v11, "reloadData");
LABEL_9:
  self->_shouldDeferReload = 0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlockBookmarksSoon");

  }
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  void *v24;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "section");
  v11 = objc_msgSend(v9, "section");
  v12 = objc_msgSend(v8, "numberOfRowsInSection:", v10);
  if (v11 >= v10)
  {
    if (v11 <= v10)
      goto LABEL_6;
    v13 = (void *)MEMORY[0x1E0CB36B0];
    v14 = v12 - 1;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB36B0];
    v14 = 0;
  }
  objc_msgSend(v13, "indexPathForRow:inSection:", v14, v10);
  v15 = objc_claimAutoreleasedReturnValue();

  v9 = (id)v15;
LABEL_6:
  v16 = objc_msgSend(v9, "row");
  v17 = v16;
  v18 = v16;
  if (v16 < v12)
  {
    v18 = v16;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v18, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BookmarksTableViewController tableView:canMoveRowAtIndexPath:](self, "tableView:canMoveRowAtIndexPath:", v8, v19);

      if (v20)
        break;
      if (v12 == ++v18)
        goto LABEL_12;
    }
  }
  if (v18 == v12)
  {
LABEL_12:
    if ((v17 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[BookmarksTableViewController tableView:canMoveRowAtIndexPath:](self, "tableView:canMoveRowAtIndexPath:", v8, v21);

        if (v22)
          break;
        if (v17-- <= 0)
        {
          v18 = -1;
          goto LABEL_18;
        }
      }
    }
    v18 = v17;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v18, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "section");
  v10 = objc_msgSend(v8, "section");
  v11 = objc_msgSend(v7, "row");
  v12 = objc_msgSend(v8, "row");

  v13 = -[BookmarksTableViewController _inRootFolder](self, "_inRootFolder");
  if (v13)
    v14 = v12 - 2;
  else
    v14 = v12;
  if (v13)
    v11 -= 2;
  v15 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 134218752;
    v24 = v11;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v14;
    v29 = 2048;
    v30 = v10;
    _os_log_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_DEFAULT, "Move bookmark from row: %ld, section: %ld, to row: %ld, section: %ld", (uint8_t *)&v23, 0x2Au);
  }
  if (self->_activeSyntheticFolder)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v14, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v18, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reorderScopedBookmarkWithUUID:afterBookmarkWithUUID:notify:", v21, v22, 1);

  }
  else
  {
    -[WebBookmarkCollection reorderList:moveBookmarkAtIndex:toIndex:](self->_collection, "reorderList:moveBookmarkAtIndex:toIndex:", self->_bookmarkList, v11, v14);
  }

}

- (void)setScrollViewScrollsToTop:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[BookmarksTableViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollsToTop:", v3);

}

- (id)currentStateDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[BookmarksTableViewController bookmarksNavigationController](self, "bookmarksNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topmostBookmarksTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "folder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v9 = CFSTR("CurrentFolderUUID");
      v10[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)restoreStateWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("CurrentFolderUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WebBookmarkCollection bookmarkWithUUID:](self->_collection, "bookmarkWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "isFolder"))
    {
      -[WebBookmarkCollection rootBookmark](self->_collection, "rootBookmark");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "identifier");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        if (objc_msgSend(v6, "identifier") == v8)
          break;
        objc_msgSend(v9, "addObject:", v6);
        -[WebBookmarkCollection bookmarkWithID:](self->_collection, "bookmarkWithID:", objc_msgSend(v6, "parentID"));
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      while (v10);
      v11 = objc_msgSend(v6, "identifier") == v8;
      if (v11)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __59__BookmarksTableViewController_restoreStateWithDictionary___block_invoke;
        v13[3] = &unk_1E9CF2FC8;
        v13[4] = self;
        objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __59__BookmarksTableViewController_restoreStateWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newViewControllerForFolder:syntheticFolder:showAllSyntheticFolders:", v4, 0, 0);

  objc_msgSend(v6, "pushViewController:animated:", v5, 0);
}

- (id)selectedBookmarks
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BookmarksTableViewController tableView](self, "tableView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)safari_tableViewScrollPositionSaveIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%i"), CFSTR("BookmarksCollection"), -[BookmarksTableViewController folderID](self, "folderID"));
}

- (BOOL)hasTranslucentAppearance
{
  char v3;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BookmarksTableViewController;
  if (-[SFPopoverSizingTableViewController hasTranslucentAppearance](&v6, sel_hasTranslucentAppearance))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "panelViewControllerShouldTranslucentAppearance:", self);
  else
    v3 = 0;

  return v3;
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)bookmark:(id)a3 didProduceNavigationIntent:(id)a4 userInfo:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  id v12;

  v6 = a4;
  objc_msgSend(v6, "navigationIntents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v7)
    v8 = objc_msgSend(v7, "count");
  else
    v8 = 1;
  if (objc_msgSend(v6, "policy") == 2)
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didVisitBookmarksWithOpenLocation:numberOfBookmarksVisited:", v9, v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v6);

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

    -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
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
  self->_userTypedFilter = (NSString *)&stru_1E9CFDBB0;

  -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
}

- (id)_dragItemsAtIndexPath:(id)a3 includingFolders:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "bookmarksTableViewIsReadOnly:", self);

  if ((v8 & 1) != 0
    || objc_msgSend(v6, "row") <= 1 && -[BookmarksTableViewController _inRootFolder](self, "_inRootFolder"))
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (!objc_msgSend(v10, "isFolder") || v4))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "_sf_initWithBookmark:", v11);
      v14[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v9;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[BookmarksTableViewController _dragItemsAtIndexPath:includingFolders:](self, "_dragItemsAtIndexPath:includingFolders:", a5, 1);
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return -[BookmarksTableViewController _dragItemsAtIndexPath:includingFolders:](self, "_dragItemsAtIndexPath:includingFolders:", a5, 0, a6.x, a6.y);
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartDragWithDragContentType:", 8);

}

- (int64_t)_tableView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (BOOL)tableView:(id)a3 canHandleDropSession:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  BOOL v8;

  v5 = a4;
  if (self->_skipOffset
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v7 = objc_msgSend(WeakRetained, "bookmarksTableViewIsReadOnly:", self),
        WeakRetained,
        (v7 & 1) != 0))
  {
    v8 = 0;
  }
  else if (-[BookmarksTableViewController isEditing](self, "isEditing"))
  {
    v8 = objc_msgSend(MEMORY[0x1E0DCCB98], "_sf_operationForDropSession:destinationSubtype:", v5, self->_activeSyntheticFolder != 0) == 3;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E0DCCB98], "_sf_operationForDropSession:destinationSubtype:", a4, self->_activeSyntheticFolder != 0);
  if (v10 > 1)
  {
    v12 = v10;
    if (v9
      && (v13 = objc_msgSend(v9, "row"), v13 <= objc_msgSend(v8, "numberOfRowsInSection:", objc_msgSend(v9, "section"))))
    {
      -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isFolder");

      if (v16)
        v14 = 3;
      else
        v14 = 1;
    }
    else
    {
      v14 = 0;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D70]), "initWithDropOperation:intent:", v12, v14);
  }
  else
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D70]), "initWithDropOperation:", 1);
  }
  v17 = (void *)v11;

  return v17;
}

- (void)_moveBookmarks:(id)a3 toFolderID:(int)a4 toIndex:(unsigned int)a5 shouldReorder:(BOOL)a6 isAddingBookmark:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  WebBookmarkCollection *collection;
  WebBookmarkList *bookmarkList;
  void *v19;
  id v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v7 = a7;
  v9 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[WebBookmarkCollection dropBookmarks:inFolderWithID:presentingViewController:isAddingBookmark:](self->_collection, v11, v9, self, v7);
  if (a6)
  {
    -[BookmarksTableViewController _recreateBookmarkLists](self, "_recreateBookmarkLists");
    if (self->_bookmarkList)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v20 = v11;
      objc_msgSend(v11, "reverseObjectEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            collection = self->_collection;
            bookmarkList = self->_bookmarkList;
            -[WebBookmarkList bookmarkArray](bookmarkList, "bookmarkArray");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[WebBookmarkCollection reorderList:moveBookmarkAtIndex:toIndex:](collection, "reorderList:moveBookmarkAtIndex:toIndex:", bookmarkList, objc_msgSend(v19, "indexOfObject:", v16), a5);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

      v11 = v20;
    }
  }
  else
  {
    -[BookmarksTableViewController reloadBookmarks](self, "reloadBookmarks");
  }

}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  WebBookmark *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  WebBookmark *folder;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  int v31;
  int v32;
  BOOL v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "session");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksTableViewController _bookmarkAtIndexPath:](self, "_bookmarkAtIndexPath:", v7);
  v8 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
  if (-[WebBookmark isFolder](v8, "isFolder")
    && (objc_msgSend(v5, "proposal"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "intent"),
        v9,
        v10 == 2))
  {
    v11 = (void *)v6;
    v12 = 1;
    folder = v8;
  }
  else
  {
    v11 = (void *)v6;
    v12 = 0;
    folder = self->_folder;
  }
  HIDWORD(v29) = -[WebBookmark identifier](folder, "identifier");
  objc_msgSend(v5, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dragItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_sf_localBookmark");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v7, "row");
  v19 = 0;
  if (v7 && (v12 & 1) == 0)
    v19 = -[WebBookmarkList bookmarkCount](self->_bookmarkList, "bookmarkCount") > v18;
  objc_msgSend(v5, "proposal");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "operation");

  if (v21 == 2)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__BookmarksTableViewController_tableView_performDropWithCoordinator___block_invoke;
    v30[3] = &unk_1E9CF2FF0;
    v30[4] = self;
    v31 = HIDWORD(v29);
    v32 = v18;
    v33 = v19;
    v23 = v11;
    objc_msgSend(MEMORY[0x1E0DCCB98], "_sf_webBookmarksFromDropSession:completionHandler:", v11, v30);
  }
  else
  {
    v22 = v21 == 3;
    v23 = v11;
    if (v22)
    {
      v24 = HIDWORD(v29);
      if (objc_msgSend(v17, "parentID") == HIDWORD(v29))
      {
        v25 = v23;
        -[BookmarksTableViewController tableView](self, "tableView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "hasActiveDrag"))
        {

        }
        else
        {
          -[WebBookmarkList bookmarkArray](self->_bookmarkList, "bookmarkArray");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v29) = objc_msgSend(v27, "indexOfObject:", v17) < (unint64_t)v18;

          v18 = v18 - (v29 & 1);
        }
        v23 = v25;
        v24 = HIDWORD(v29);
      }
      v34[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1, v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarksTableViewController _moveBookmarks:toFolderID:toIndex:shouldReorder:isAddingBookmark:](self, "_moveBookmarks:toFolderID:toIndex:shouldReorder:isAddingBookmark:", v28, v24, v18, v19, 0);

    }
  }

}

void __69__BookmarksTableViewController_tableView_performDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_moveBookmarks:toFolderID:toIndex:shouldReorder:isAddingBookmark:", v3, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned __int8 *)(a1 + 48), 1);

}

- (int64_t)_tableView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  double v4;

  objc_msgSend(a3, "adjustedContentInset");
  if (v4 > 0.0)
    -[BookmarksTableViewController _updateContentOffsetIfNeeded](self, "_updateContentOffsetIfNeeded");
}

- (void)updateUserActivityState:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  WebBookmarksRootBookmarkTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  objc_msgSend(v4, "setEligibleForSearch:", 1);
  objc_msgSend(v4, "setEligibleForPrediction:", 1);

}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (WebBookmark)folder
{
  return self->_folder;
}

- (BookmarksTableViewControllerDelegate)delegate
{
  return (BookmarksTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_userTypedFilter, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_allSyntheticFolders, 0);
  objc_storeStrong((id *)&self->_activeSyntheticFolder, 0);
  objc_storeStrong((id *)&self->_favoritesFolder, 0);
  objc_storeStrong((id *)&self->_bookmarkList, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
