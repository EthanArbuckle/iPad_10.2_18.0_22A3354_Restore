@implementation BookmarksNavigationController

- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4
{
  return (BookmarksNavigationController *)-[BookmarksNavigationController _initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:activeCollection:showsOnlyActiveCollection:](self, "_initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:activeCollection:showsOnlyActiveCollection:", a3, a4, 0, 0, 0, 0);
}

- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 collection:(id)a5 showsOnlyActiveCollection:(BOOL)a6
{
  return (BookmarksNavigationController *)-[BookmarksNavigationController _initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:activeCollection:showsOnlyActiveCollection:](self, "_initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:activeCollection:showsOnlyActiveCollection:", a3, a4, 0, 0, a5, a6);
}

- (BookmarksNavigationController)initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 topBookmark:(id)a5 skipOffset:(unsigned int)a6
{
  return (BookmarksNavigationController *)-[BookmarksNavigationController _initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:activeCollection:showsOnlyActiveCollection:](self, "_initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:activeCollection:showsOnlyActiveCollection:", a3, a4, a5, *(_QWORD *)&a6, 0, 0);
}

- (id)_initWithBookmarksDelegate:(id)a3 linkPreviewProvider:(id)a4 topBookmark:(id)a5 skipOffset:(unsigned int)a6 activeCollection:(id)a7 showsOnlyActiveCollection:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  BookmarksNavigationController *v18;
  BookmarksNavigationController *v19;
  uint64_t v20;
  WebBookmarkReadonlyCollection *readonlyCollection;
  id v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *readonlyCollectionQueue;
  _BOOL4 v25;
  void *v26;
  void *v27;
  int v28;
  BookmarkImporter *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  BookmarksNavigationController *v35;
  unsigned int v37;
  objc_super v38;
  _QWORD v39[3];

  v8 = a8;
  v39[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v38.receiver = self;
  v38.super_class = (Class)BookmarksNavigationController;
  v18 = -[BookmarksNavigationController initWithNavigationBarClass:toolbarClass:](&v38, sel_initWithNavigationBarClass_toolbarClass_, 0, 0);
  v19 = v18;
  if (v18)
  {
    v37 = a6;
    -[BookmarksNavigationController setDelegate:](v18, "setDelegate:", v18);
    -[BookmarksNavigationController _setClipUnderlapWhileTransitioning:](v19, "_setClipUnderlapWhileTransitioning:", 1);
    v19->_prefersHalfHeightSheetPresentationWithLoweredBar = 1;
    objc_storeWeak((id *)&v19->_bookmarksNavigationControllerDelegate, v14);
    objc_storeWeak((id *)&v19->_linkPreviewProvider, v15);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA8]), "initReadonlySafariBookmarkCollection");
    readonlyCollection = v19->_readonlyCollection;
    v19->_readonlyCollection = (WebBookmarkReadonlyCollection *)v20;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mobilesafari.%@.%p"), objc_opt_class(), v19);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = dispatch_queue_create((const char *)objc_msgSend(v22, "UTF8String"), 0);
    readonlyCollectionQueue = v19->_readonlyCollectionQueue;
    v19->_readonlyCollectionQueue = (OS_dispatch_queue *)v23;

    if (v17)
      v25 = v8;
    else
      v25 = 0;
    if (!v16 && !v25)
      v19->_showCollections = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__bookmarkCollectionHasBecomeAvailable_, CFSTR("bookmarkCollectionHasBecomeAvailableNotification"), 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel__keyboardWillShow_, *MEMORY[0x1E0DC4E70], 0);
    -[BookmarksNavigationController _updateBookmarkCollection](v19, "_updateBookmarkCollection");
    objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "usesAllowedSitesOnly");

    -[BookmarksNavigationController setAllowsEditing:](v19, "setAllowsEditing:", v28 ^ 1u);
    v29 = -[BookmarkImporter initWithBookmarkCollection:]([BookmarkImporter alloc], "initWithBookmarkCollection:", v19->_bookmarkCollection);
    -[BookmarkImporter migrateYouTubeBookmarks](v29, "migrateYouTubeBookmarks");
    v19->_contentDirtyFlag = 1;
    -[BookmarksNavigationController _setupCollections](v19, "_setupCollections");
    if (v25)
    {
      -[BookmarksNavigationController setCurrentCollection:](v19, "setCurrentCollection:", v17);
    }
    else if (v19->_showCollections)
    {
      -[BookmarksNavigationController _loadSavedPanelState](v19, "_loadSavedPanelState");
      -[BookmarksNavigationController _restorePanelState](v19, "_restorePanelState");
    }
    else
    {
      v30 = -[BookmarksNavigationController newBookmarksTableViewControllerWithFolder:skipOffset:](v19, "newBookmarksTableViewControllerWithFolder:skipOffset:", v16, v37);
      -[BookmarksNavigationController pushViewController:animated:](v19, "pushViewController:animated:", v30, 0);

    }
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)-[BookmarksNavigationController registerForTraitChanges:withTarget:action:](v19, "registerForTraitChanges:withTarget:action:", v31, v19, sel_anySizeClassDidChange);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)-[BookmarksNavigationController registerForTraitChanges:withTarget:action:](v19, "registerForTraitChanges:withTarget:action:", v33, v19, sel__setContentsDirty);

    v35 = v19;
  }

  return v19;
}

- (void)_keyboardWillShow:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0DC5378];
  -[BookmarksNavigationController sheetPresentationController](self, "sheetPresentationController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedDetentIdentifier:", v4);

  -[BookmarksNavigationController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)_updateBookmarkCollection
{
  WebBookmarkCollection *v3;
  WebBookmarkCollection *v4;
  WebBookmarkCollection *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v3 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
  v4 = self->_bookmarkCollection;
  v5 = v4;
  if (v4)
    v6 = v4 == v3;
  else
    v6 = 0;
  if (!v6)
  {
    objc_storeStrong((id *)&self->_bookmarkCollection, v3);
    if (self->_showCollections)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0DCCC00];
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DCCC00], v5);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__webBookmarksDidReload_, v8, v3);
      v9 = *MEMORY[0x1E0DCCC10];
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DCCC10], v5);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__folderContentsDidChange_, v9, v3);

    }
    +[Application sharedApplication](Application, "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tabGroupManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTabGroupObserver:", self);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[BookmarksNavigationController viewControllers](self, "viewControllers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v17, "setCollection:", v3);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

    -[BookmarksNavigationController reloadViewControllers](self, "reloadViewControllers");
  }

}

- (void)_applicationSuspended:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlockBookmarksIfNeeded");

}

- (void)_folderContentsDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E0DCCBE8]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[BookmarksNavigationController _reloadFolderContentsForFolderIDIfNeeded:](self, "_reloadFolderContentsForFolderIDIfNeeded:", objc_msgSend(v6, "intValue"));
    v5 = v6;
  }

}

- (void)_reloadFolderContentsForFolderIDIfNeeded:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[BookmarksNavigationController topmostBookmarksTableViewController](self, "topmostBookmarksTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "folderID");

  if (-[BookmarksNavigationController _isVisibleFolderID:](self, "_isVisibleFolderID:", v3))
    -[BookmarksNavigationController _setContentsDirty](self, "_setContentsDirty");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BookmarksNavigationController viewControllers](self, "viewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          if (objc_msgSend(v13, "folderID") == (_DWORD)v3)
          {
            if (v6 == (_DWORD)v3)
              objc_msgSend(v13, "reloadBookmarks");
            else
              -[BookmarksNavigationController reloadViewControllers](self, "reloadViewControllers");

            goto LABEL_18;
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_18:

}

- (BOOL)_isVisibleFolderID:(int)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[BookmarksNavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "folder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "identifier") == a3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)anySizeClassDidChange
{
  void *v3;

  -[BookmarksNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksNavigationController _updateToolbarItemsForViewController:animated:](self, "_updateToolbarItemsForViewController:animated:", v3, 0);

  -[BookmarksNavigationController _setupCollectionSegmentedControlIfNeeded](self, "_setupCollectionSegmentedControlIfNeeded");
  if (-[UISegmentedControl selectedSegmentIndex](self->_collectionSegmentedControl, "selectedSegmentIndex") == -1)
    -[UISegmentedControl setSelectedSegmentIndex:](self->_collectionSegmentedControl, "setSelectedSegmentIndex:", -[NSArray indexOfObject:](self->_topLevelCollections, "indexOfObject:", self->_currentCollection));
}

- (id)topHistoryViewController
{
  void *v2;
  id v3;

  -[BookmarksNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)topBookmarksTableViewController
{
  void *v2;
  id v3;

  -[BookmarksNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)topmostBookmarksTableViewController
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BookmarksNavigationController viewControllers](self, "viewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)topReadingListViewController
{
  void *v2;
  id v3;

  -[BookmarksNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)rootBookmark
{
  void *v2;
  void *v3;
  void *v4;

  -[BookmarksNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setRootBookmark:(id)a3 skipOffset:(unsigned int)a4
{
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = -[BookmarksNavigationController newBookmarksTableViewControllerWithFolder:skipOffset:](self, "newBookmarksTableViewControllerWithFolder:skipOffset:", a3, *(_QWORD *)&a4);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksNavigationController setViewControllers:](self, "setViewControllers:", v6);

}

- (void)setRootBookmarkUUIDString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D8B600]) & 1) != 0)
    {
      -[BookmarksNavigationController _favoritesFolderBasedOnContentRestriction](self, "_favoritesFolderBasedOnContentRestriction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_7;
    }
    else
    {
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarksNavigationController _lastExistingBookmarkWithUUIDs:](self, "_lastExistingBookmarkWithUUIDs:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    -[BookmarksNavigationController setRootBookmark:skipOffset:](self, "setRootBookmark:skipOffset:", v6, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewDidLoad](&v4, sel_viewDidLoad);
  if (self->_showCollections)
  {
    -[BookmarksNavigationController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("Sidebar"));

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
  if (self->_showCollections)
  {
    -[BookmarksNavigationController presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutMargins");
    v6 = v5;
    v8 = v7;

    -[BookmarksNavigationController navigationBar](self, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[UISegmentedControl frame](self->_collectionSegmentedControl, "frame");
    v19 = v18;
    v21.origin.x = v11;
    v21.origin.y = v13;
    v21.size.width = v15;
    v21.size.height = v17;
    -[UISegmentedControl setFrame:](self->_collectionSegmentedControl, "setFrame:", v6, 0.0, CGRectGetWidth(v21) - v6 - v8, v19);
  }
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  if (!self->_contentBorrowed)
  {
    v3.receiver = self;
    v3.super_class = (Class)BookmarksNavigationController;
    -[BookmarksNavigationController _setContentOverlayInsets:](&v3, sel__setContentOverlayInsets_, a3.top, a3.left, a3.bottom, a3.right);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  NSTimer *v4;
  NSTimer *bookmarkSyncTimer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_hasScheduledBookmarkSyncTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__bookmarkSyncTimerDidFire_, 0, 0, 5.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    bookmarkSyncTimer = self->_bookmarkSyncTimer;
    self->_bookmarkSyncTimer = v4;

    self->_hasScheduledBookmarkSyncTimer = 1;
  }
  if (self->_showCollections)
  {
    if (self->_needsReloadSavedState)
    {
      -[BookmarksNavigationController _loadSavedPanelState](self, "_loadSavedPanelState");
      -[BookmarksNavigationController _restorePanelState](self, "_restorePanelState");
    }
    -[BookmarksNavigationController _setupCollectionSegmentedControlIfNeeded](self, "_setupCollectionSegmentedControlIfNeeded");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerViewDidAppear:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (self->_showCollections)
    -[BookmarksNavigationController _savePanelState](self, "_savePanelState");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if (self->_showCollections)
    self->_needsReloadSavedState = 1;
  -[BookmarksNavigationController _clearBookmarkSyncTimer](self, "_clearBookmarkSyncTimer");
  if (self->_isEditing)
  {
    -[BookmarksNavigationController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unlockBookmarksIfNeeded");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerViewDidDisappear:", self);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[BookmarksNavigationController _setContentsDirty](self, "_setContentsDirty");
}

- (void)reloadViewControllers
{
  BookmarksNavigationController *v2;
  NSString *currentCollection;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __objc2_class_ro **p_info;
  uint64_t j;
  void *v39;
  uint64_t v40;
  WebBookmarkCollection *bookmarkCollection;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  BookmarksNavigationController *v46;
  __objc2_class_ro **v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v2 = self;
  v83 = *MEMORY[0x1E0C80C00];
  currentCollection = self->_currentCollection;
  if (!currentCollection
    || -[NSString isEqualToString:](currentCollection, "isEqualToString:", CFSTR("BookmarksCollection")))
  {
    -[BookmarksNavigationController viewControllers](v2, "viewControllers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarksNavigationController topHistoryViewController](v2, "topHistoryViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 || objc_msgSend(v4, "count") == 1)
      {
        objc_msgSend(v5, "reloadBookmarks");
        -[BookmarksNavigationController _reloadSucceeded](v2, "_reloadSucceeded");
      }
      else
      {
        v65 = v5;
        objc_msgSend(v4, "lastObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = v7;
        else
          v8 = 0;
        v9 = v8;

        v66 = v9;
        if (v9)
        {
          objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(v4, "count") - 1);
          v10 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v10;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v4 = v4;
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v77 != v14)
                objc_enumerationMutation(v4);
              v16 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v16, "folder");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "UUID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v18);

              }
            }
            v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
          }
          while (v13);
        }

        -[BookmarksNavigationController _lastExistingBookmarkWithUUIDs:](v2, "_lastExistingBookmarkWithUUIDs:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          WeakRetained = objc_loadWeakRetained((id *)&v2->_bookmarksNavigationControllerDelegate);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(WeakRetained, "containingBookmarkForNavigationController:", v2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = 0;
          }
          -[BookmarksNavigationController _pathForBookmark:startingFromAncestor:](v2, "_pathForBookmark:startingFromAncestor:", v19, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v23;
          if (v23)
          {
            v24 = v23;
            v61 = v21;
            v62 = WeakRetained;
            v63 = v19;
            objc_msgSend(v23, "valueForKey:", CFSTR("UUID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v11, "count");
            v27 = objc_msgSend(v25, "count");
            v60 = v25;
            if (v27 <= v26
              && (v28 = v27,
                  objc_msgSend(v11, "subarrayWithRange:", 0, v27),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30 = objc_msgSend(v25, "isEqualToArray:", v29),
                  v29,
                  v30))
            {
              if (v28 < v26)
              {

                objc_msgSend(v4, "objectAtIndex:", v28 - 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (id)-[BookmarksNavigationController popToViewController:animated:](v2, "popToViewController:animated:", v31, 1);

                objc_msgSend(v4, "subarrayWithRange:", 0, v28);
                v33 = objc_claimAutoreleasedReturnValue();

                v66 = 0;
                v4 = (id)v33;
              }
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v4 = v4;
              v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v73;
                p_info = TabOverviewInterpolatedLocation.info;
                v67 = v4;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v73 != v36)
                      objc_enumerationMutation(v4);
                    v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v40 = v35;
                      bookmarkCollection = v2->_bookmarkCollection;
                      v42 = v39;
                      objc_msgSend(v42, "folder");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "UUID");
                      v44 = v11;
                      v45 = v36;
                      v46 = v2;
                      v47 = p_info;
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WebBookmarkCollection bookmarkWithUUID:](bookmarkCollection, "bookmarkWithUUID:", v48);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "setFolder:", v49);

                      v35 = v40;
                      v4 = v67;

                      p_info = v47;
                      v2 = v46;
                      v36 = v45;
                      v11 = v44;

                    }
                  }
                  v35 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
                }
                while (v35);
              }

              v22 = v66;
              objc_msgSend(v66, "reloadData");
              -[BookmarksNavigationController _reloadSucceeded](v2, "_reloadSucceeded");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = 0u;
              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              v51 = v24;
              v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v69;
                do
                {
                  for (k = 0; k != v53; ++k)
                  {
                    if (*(_QWORD *)v69 != v54)
                      objc_enumerationMutation(v51);
                    v56 = -[BookmarksNavigationController newBookmarksTableViewControllerWithFolder:skipOffset:](v2, "newBookmarksTableViewControllerWithFolder:skipOffset:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k), 0);
                    objc_msgSend(v50, "addObject:", v56);

                  }
                  v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
                }
                while (v53);
              }

              objc_msgSend(v63, "UUID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "lastObject");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = objc_msgSend(v57, "isEqualToString:", v58) ^ 1;

              -[BookmarksNavigationController setViewControllers:animated:](v2, "setViewControllers:animated:", v50, v59);
              -[BookmarksNavigationController _reloadSucceeded](v2, "_reloadSucceeded");

              v22 = v66;
            }

            v6 = 0;
            v5 = v65;
            WeakRetained = v62;
            v19 = v63;
            v21 = v61;
          }
          else
          {
            -[BookmarksNavigationController _reloadFailed](v2, "_reloadFailed");
            v5 = v65;
            v22 = v66;
          }

        }
        else
        {
          -[BookmarksNavigationController _reloadFailed](v2, "_reloadFailed");
          v5 = v65;
          v22 = v66;
        }

      }
    }

  }
}

- (id)_favoritesFolderBasedOnContentRestriction
{
  void *v3;
  int v4;
  WebBookmarkCollection *bookmarkCollection;

  objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesAllowedSitesOnly");

  bookmarkCollection = self->_bookmarkCollection;
  if (v4)
    -[WebBookmarkCollection webFilterAllowedSitesFolder](bookmarkCollection, "webFilterAllowedSitesFolder");
  else
    -[WebBookmarkCollection favoritesFolder](bookmarkCollection, "favoritesFolder");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_reloadFailed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerReloadDidFail:", self);

}

- (void)_reloadSucceeded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerDidReload:", self);

}

- (id)_lastExistingBookmarkWithUUIDs:(id)a3
{
  void *v4;
  uint64_t v5;
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[WebBookmarkCollection bookmarkWithUUID:](self->_bookmarkCollection, "bookmarkWithUUID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_pathForBookmark:(id)a3 startingFromAncestor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;

  v6 = a3;
  objc_msgSend(a4, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v6, "identifier"))
  {
    v9 = v6;
    -[WebBookmarkCollection bookmarkWithID:](self->_bookmarkCollection, "bookmarkWithID:", objc_msgSend(v6, "parentID"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v7);

    if ((v11 & 1) != 0)
      break;
    objc_msgSend(v8, "insertObject:atIndex:", v6, 0);
  }
  if (v7
    && (objc_msgSend(v6, "UUID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v7, "isEqualToString:", v12),
        v12,
        !v13))
  {
    v14 = 0;
  }
  else
  {
    v14 = v8;
  }

  return v14;
}

- (void)_updateClearHistoryButton
{
  id v2;

  -[BookmarksNavigationController topHistoryViewController](self, "topHistoryViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateClearHistoryButtonEnabled");

}

- (void)bookmarkSourceContentsChanged:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[History sharedHistory](History, "sharedHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[BookmarksNavigationController _updateClearHistoryButton](self, "_updateClearHistoryButton");
}

- (BOOL)_shouldShowPaletteForViewController:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  char v7;

  v4 = a3;
  if (self->_showCollections && -[NSArray count](self->_topLevelCollections, "count") >= 2)
  {
    -[BookmarksNavigationController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sf_usesSidebarPresentation");

    if ((v7 & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_createToolbarItemsIfNecessary
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *createFolderButtonItem;
  UIBarButtonItem *v7;
  UIBarButtonItem *editButtonItem;
  UIBarButtonItem *v9;
  UIBarButtonItem *editingDoneButtonItem;
  UIBarButtonItem *v11;
  UIBarButtonItem *flexibleSpaceItem;

  if (!self->_createFolderButtonItem)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__didPressNewFolderButton);
    createFolderButtonItem = self->_createFolderButtonItem;
    self->_createFolderButtonItem = v5;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_createFolderButtonItem, "setAccessibilityIdentifier:", CFSTR("BookmarksNewFolderButton"));
    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__didPressEditButton);
    editButtonItem = self->_editButtonItem;
    self->_editButtonItem = v7;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_editButtonItem, "setAccessibilityIdentifier:", CFSTR("BookmarksEditButton"));
    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__didPressEditingDoneButton);
    editingDoneButtonItem = self->_editingDoneButtonItem;
    self->_editingDoneButtonItem = v9;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_editingDoneButtonItem, "setAccessibilityIdentifier:", CFSTR("BookmarksDoneButton"));
    v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    flexibleSpaceItem = self->_flexibleSpaceItem;
    self->_flexibleSpaceItem = v11;

  }
}

- (id)_toolbarItemsForViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  UIBarButtonItem *flexibleSpaceItem;
  void *v8;
  UIBarButtonItem **p_createFolderButtonItem;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *editButtonItem;
  UIBarButtonItem *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *createFolderButtonItem;
  UIBarButtonItem *v21;
  UIBarButtonItem *editingDoneButtonItem;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BookmarksNavigationController _createToolbarItemsIfNecessary](self, "_createToolbarItemsIfNecessary");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBookmarksAvailable");

    if (v6)
    {
      if (self->_isEditing && objc_msgSend(v4, "canCreateNewFolder"))
      {
        flexibleSpaceItem = self->_flexibleSpaceItem;
        createFolderButtonItem = self->_createFolderButtonItem;
        v21 = flexibleSpaceItem;
        editingDoneButtonItem = self->_editingDoneButtonItem;
        v8 = (void *)MEMORY[0x1E0C99D20];
        p_createFolderButtonItem = &createFolderButtonItem;
        v10 = 3;
      }
      else
      {
        if (objc_msgSend(v4, "isEditing"))
        {
          v13 = self->_editingDoneButtonItem;
          v18 = self->_flexibleSpaceItem;
          v19 = v13;
          v8 = (void *)MEMORY[0x1E0C99D20];
          p_createFolderButtonItem = &v18;
        }
        else
        {
          editButtonItem = self->_editButtonItem;
          v16 = self->_flexibleSpaceItem;
          v17 = editButtonItem;
          v8 = (void *)MEMORY[0x1E0C99D20];
          p_createFolderButtonItem = &v16;
        }
        v10 = 2;
      }
      objc_msgSend(v8, "arrayWithObjects:count:", p_createFolderButtonItem, v10, v16, v17, v18, v19, createFolderButtonItem, v21, editingDoneButtonItem, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "bookmarksPanelToolbarItems");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v12 = (void *)v11;
    goto LABEL_15;
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_15:

  return v12;
}

- (void)_updateToolbarItemsForViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (self->_allowsEditing && !self->_importHandler)
  {
    v8 = v6;
    -[BookmarksNavigationController _toolbarItemsForViewController:](self, "_toolbarItemsForViewController:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setToolbarItems:animated:", v7, v4);

    v6 = v8;
  }

}

- (void)_setEditingFromToolbarButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v3 = a3;
  -[BookmarksNavigationController topReadingListViewController](self, "topReadingListViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if ((objc_msgSend(v5, "lockBookmarks") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D4EBD8], "showLockedDatabaseAlertForAction:fromViewController:", 0, self);
        objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "didPreventBookmarkActionWithBookmarkType:actionType:", 0, 2);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(v5, "unlockBookmarksSoon");
      -[BookmarksNavigationController navigationBar](self, "navigationBar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNeedsLayout");

    }
    -[BookmarksNavigationController topBookmarksTableViewController](self, "topBookmarksTableViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isEditing = v3;
    objc_msgSend(v7, "setEditing:animated:", v3, 1);
    -[UISegmentedControl setEnabled:](self->_collectionSegmentedControl, "setEnabled:", v3 ^ 1);
    -[BookmarksNavigationController setDoneButtonHidden:](self, "setDoneButtonHidden:", v3);
    if (self->_isEditing
      || (-[BookmarksNavigationController viewControllers](self, "viewControllers"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v10 >= 2))
    {
      objc_msgSend(v7, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidesBackButton:", v3);

    }
    goto LABEL_10;
  }
  objc_msgSend(v12, "setEditing:animated:", objc_msgSend(v12, "isEditing") ^ 1, 0);
LABEL_11:

}

- (void)_didPressEditingDoneButton
{
  -[BookmarksNavigationController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", 0);
}

- (void)_didPressEditButton
{
  -[BookmarksNavigationController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", 1);
}

- (void)toggleEditBookmarks
{
  -[BookmarksNavigationController _setEditingFromToolbarButton:](self, "_setEditingFromToolbarButton:", !self->_isEditing);
}

- (void)_didPressNewFolderButton
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[BookmarksNavigationController topBookmarksTableViewController](self, "topBookmarksTableViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DCCB98]);
  v4 = objc_msgSend(v8, "folderID");
  -[WebBookmarkCollection configuration](self->_bookmarkCollection, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initFolderWithParentID:collectionType:", v4, objc_msgSend(v5, "collectionType"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5660]), "initWithBookmark:inCollection:addingBookmark:", v6, self->_bookmarkCollection, 0);
  objc_msgSend(v7, "setDelegate:", self);
  -[BookmarksNavigationController setPinnedPaletteForPanelViewController:](self, "setPinnedPaletteForPanelViewController:", v7);
  -[BookmarksNavigationController pushViewController:animated:](self, "pushViewController:animated:", v7, 1);

}

- (BOOL)rebaseOnDescendentBookmark:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  BOOL v14;
  BookmarksNavigationController *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BookmarksNavigationController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
  {

    goto LABEL_16;
  }
  v8 = v7;
  v16 = self;
  LOBYTE(v9) = 0;
  v10 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "folderID");
        if (!(v9 & 1 | (v13 == objc_msgSend(v4, "identifier"))))
          goto LABEL_8;
      }
      else if ((v9 & 1) == 0)
      {
LABEL_8:
        v9 = 0;
        continue;
      }
      objc_msgSend(v5, "addObject:", v12);
      v9 = 1;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v8);

  if (!v9)
  {
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  -[BookmarksNavigationController setViewControllers:](v16, "setViewControllers:", v5);
  v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)rebaseOnAncestorBookmark:(id)a3 skipOffset:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  WebBookmarkCollection *bookmarkCollection;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  int v23;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[BookmarksNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BookmarksNavigationController viewControllers](self, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    bookmarkCollection = self->_bookmarkCollection;
    -[BookmarksNavigationController viewControllers](self, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmarkCollection bookmarkWithID:](bookmarkCollection, "bookmarkWithID:", objc_msgSend(v14, "folderID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v13) = objc_msgSend(v15, "identifier");
    if ((_DWORD)v13 == objc_msgSend(v6, "identifier"))
    {
      v16 = -[BookmarksNavigationController newBookmarksTableViewControllerWithFolder:skipOffset:](self, "newBookmarksTableViewControllerWithFolder:skipOffset:", v6, v4);
      objc_msgSend(v11, "replaceObjectAtIndex:withObject:", 0, v16);
LABEL_4:
      -[BookmarksNavigationController setViewControllers:](self, "setViewControllers:", v11);

      v17 = 1;
    }
    else
    {
      while (1)
      {
        v18 = objc_msgSend(v15, "identifier");
        -[WebBookmarkCollection rootBookmark](self->_bookmarkCollection, "rootBookmark");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "identifier");

        if (v18 == v20)
          break;
        v21 = v15;
        -[WebBookmarkCollection bookmarkWithID:](self->_bookmarkCollection, "bookmarkWithID:", objc_msgSend(v15, "parentID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v21) = objc_msgSend(v15, "identifier");
        if ((_DWORD)v21 == objc_msgSend(v6, "identifier"))
          v22 = v4;
        else
          v22 = 0;
        v16 = -[BookmarksNavigationController newBookmarksTableViewControllerWithFolder:skipOffset:](self, "newBookmarksTableViewControllerWithFolder:skipOffset:", v15, v22);
        objc_msgSend(v11, "insertObject:atIndex:", v16, 0);
        v23 = objc_msgSend(v15, "identifier");
        if (v23 == objc_msgSend(v6, "identifier"))
          goto LABEL_4;

      }
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_setupCollections
{
  void *v3;
  void *v4;
  int v5;
  NSArray *v6;
  NSArray *topLevelCollections;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("BookmarksCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReadingListAvailable");

  if (v5)
    objc_msgSend(v3, "addObject:", CFSTR("ReadingListCollection"));
  objc_msgSend(v3, "addObject:", CFSTR("HistoryCollection"));
  v6 = (NSArray *)objc_msgSend(v3, "copy");

  topLevelCollections = self->_topLevelCollections;
  self->_topLevelCollections = v6;

}

- (void)_setupCollectionSegmentedControlIfNeeded
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  UISegmentedControl *v10;
  UISegmentedControl *collectionSegmentedControl;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_collectionSegmentedControl)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_topLevelCollections;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          -[BookmarksNavigationController _segmentedControlItemForCollection:](self, "_segmentedControlItemForCollection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v3);
    collectionSegmentedControl = self->_collectionSegmentedControl;
    self->_collectionSegmentedControl = v10;

    -[UISegmentedControl setAccessibilityIdentifier:](self->_collectionSegmentedControl, "setAccessibilityIdentifier:", CFSTR("BookmarksSegmentedControl"));
    -[UISegmentedControl setSpringLoaded:](self->_collectionSegmentedControl, "setSpringLoaded:", 1);
    -[UISegmentedControl addTarget:action:forControlEvents:](self->_collectionSegmentedControl, "addTarget:action:forControlEvents:", self, sel__selectedCollectionChanged_, 4096);

  }
}

- (void)_doneButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerDidPressDoneButton:", self);

}

- (id)_segmentedControlItemForCollection:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BookmarksCollection")) & 1) != 0)
  {
    v4 = CFSTR("book");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReadingListCollection")) & 1) != 0)
  {
    v4 = CFSTR("eyeglasses");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HistoryCollection")))
  {
    v4 = CFSTR("clock");
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, v6, v3, &__block_literal_global_6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_selectedCollectionChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[NSArray objectAtIndex:](self->_topLevelCollections, "objectAtIndex:", objc_msgSend(a3, "selectedSegmentIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Tap %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[BookmarksNavigationController setCurrentCollection:](self, "setCurrentCollection:", v4);

}

- (id)newBookmarksTableViewControllerWithFolder:(id)a3 skipOffset:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  BookmarksTableViewController *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[BookmarksTableViewController initWithFolder:inCollection:skipOffset:]([BookmarksTableViewController alloc], "initWithFolder:inCollection:skipOffset:", v6, self->_bookmarkCollection, v4);

  -[BookmarksTableViewController setDelegate:](v7, "setDelegate:", self);
  -[BookmarksNavigationController linkPreviewProvider](self, "linkPreviewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksTableViewController setLinkPreviewProvider:](v7, "setLinkPreviewProvider:", v8);

  -[BookmarksTableViewController setNavigationIntentHandler:](v7, "setNavigationIntentHandler:", self);
  return v7;
}

- (id)newRootViewControllerForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ReadingListViewController *v7;
  void *v8;

  v4 = a3;
  -[BookmarksNavigationController linkPreviewProvider](self, "linkPreviewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BookmarksCollection")))
  {
    -[WebBookmarkCollection rootBookmark](self->_bookmarkCollection, "rootBookmark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BookmarksNavigationController newBookmarksTableViewControllerWithFolder:skipOffset:](self, "newBookmarksTableViewControllerWithFolder:skipOffset:", v6, 0);

  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("HistoryCollection")))
  {
    -[BookmarksNavigationController makeHistoryViewController](self, "makeHistoryViewController");
    v7 = (ReadingListViewController *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ReadingListCollection")))
  {
    v7 = objc_alloc_init(ReadingListViewController);
    -[ReadingListViewController setDelegate:](v7, "setDelegate:", self);
    -[ReadingListViewController setLinkPreviewProvider:](v7, "setLinkPreviewProvider:", v5);
    -[ReadingListViewController setNavigationIntentHandler:](v7, "setNavigationIntentHandler:", self);
    -[BookmarksNavigationController tabGroupProvider](self, "tabGroupProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setTabGroupProvider:](v7, "setTabGroupProvider:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)makeHistoryViewController
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFHistoryViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[BookmarksNavigationController linkPreviewProvider](self, "linkPreviewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksNavigationController tabGroupProvider](self, "tabGroupProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasMultipleProfiles");
  +[Application sharedApplication](Application, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "historyController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "historyForProfileIdentifier:loadIfNeeded:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SFHistoryViewController initWithHistory:]([SFHistoryViewController alloc], "initWithHistory:", v10);
  -[SFHistoryViewController setDelegate:](v11, "setDelegate:", self);
  -[SFHistoryViewController setLinkPreviewProvider:](v11, "setLinkPreviewProvider:", v3);
  -[SFHistoryViewController setNavigationIntentHandler:](v11, "setNavigationIntentHandler:", self);
  -[BookmarksNavigationController tabGroupProvider](self, "tabGroupProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFHistoryViewController setTabGroupProvider:](v11, "setTabGroupProvider:", v12);

  if (v6)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHistoryViewController setTitle:](v11, "setTitle:", v16);

  }
  return v11;
}

- (void)setCurrentCollection:(id)a3
{
  id v5;
  NSString **p_currentCollection;
  id v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_currentCollection = &self->_currentCollection;
  if ((objc_msgSend(v5, "isEqualToString:", self->_currentCollection) & 1) == 0)
  {
    if (*p_currentCollection)
      -[BookmarksNavigationController _savePanelState](self, "_savePanelState");
    v7 = -[BookmarksNavigationController newRootViewControllerForCollection:](self, "newRootViewControllerForCollection:", v5);
    objc_storeStrong((id *)&self->_currentCollection, a3);
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BookmarksNavigationController setViewControllers:](self, "setViewControllers:", v8);

    -[BookmarksNavigationController _restoreCurrentCollectionState](self, "_restoreCurrentCollectionState");
    -[UISegmentedControl setSelectedSegmentIndex:](self->_collectionSegmentedControl, "setSelectedSegmentIndex:", -[NSArray indexOfObject:](self->_topLevelCollections, "indexOfObject:", *p_currentCollection));
    -[BookmarksNavigationController _updateToolbarVisibility](self, "_updateToolbarVisibility");

  }
}

- (void)_updateToolbarVisibility
{
  _BOOL8 v3;

  if (self->_importHandler)
  {
    if ((-[BookmarksNavigationController isToolbarHidden](self, "isToolbarHidden") & 1) != 0)
      return;
    v3 = 1;
  }
  else
  {
    v3 = !self->_allowsEditing;
    if (-[BookmarksNavigationController isToolbarHidden](self, "isToolbarHidden") == v3)
      return;
  }
  -[BookmarksNavigationController setToolbarHidden:](self, "setToolbarHidden:", v3);
}

- (void)_loadSavedPanelState
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *savedCollectionState;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  if (!-[BookmarksNavigationController _createSavedPanelStateForTesting](self, "_createSavedPanelStateForTesting"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryForKey:", CFSTR("BookmarksPanelSavedState"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
    savedCollectionState = self->_savedCollectionState;
    self->_savedCollectionState = v4;

    if (!self->_savedCollectionState)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = self->_savedCollectionState;
      self->_savedCollectionState = v6;

    }
  }
}

- (void)_savePanelState
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSMutableDictionary setObject:forKey:](self->_savedCollectionState, "setObject:forKey:", self->_currentCollection, CFSTR("CurrentCollection"));
  v3 = self->_currentCollection;
  -[BookmarksNavigationController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currentStateDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[NSMutableDictionary setObject:forKey:](self->_savedCollectionState, "setObject:forKey:", v6, v3);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", self->_savedCollectionState, CFSTR("BookmarksPanelSavedState"));

}

- (void)_restorePanelState
{
  uint64_t v3;
  NSArray *topLevelCollections;
  void *v5;
  uint64_t v6;
  BookmarksNavigationController *v7;
  id v8;

  if (!-[NSMutableDictionary count](self->_savedCollectionState, "count"))
  {
    -[NSArray objectAtIndex:](self->_topLevelCollections, "objectAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = self;
    v8 = (id)v6;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKey:](self->_savedCollectionState, "objectForKey:", CFSTR("CurrentCollection"));
  v3 = objc_claimAutoreleasedReturnValue();
  topLevelCollections = self->_topLevelCollections;
  v8 = (id)v3;
  if (v3)
  {
    if (-[NSArray indexOfObject:](topLevelCollections, "indexOfObject:", v3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      topLevelCollections = self->_topLevelCollections;
      goto LABEL_5;
    }
    v7 = self;
    v6 = (uint64_t)v8;
LABEL_8:
    -[BookmarksNavigationController setCurrentCollection:](v7, "setCurrentCollection:", v6);
    goto LABEL_9;
  }
LABEL_5:
  -[NSArray objectAtIndex:](topLevelCollections, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BookmarksNavigationController setCurrentCollection:](self, "setCurrentCollection:", v5);

LABEL_9:
}

- (void)_restoreCurrentCollectionState
{
  void *v3;
  void *v4;
  id v5;

  -[BookmarksNavigationController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_savedCollectionState, "objectForKey:", self->_currentCollection);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "restoreStateWithDictionary:", v4);

}

+ (NSString)test_savedStateCollection
{
  return (NSString *)(id)_test_savedStateCollection;
}

+ (void)test_setSavedStateCollection:(id)a3
{
  objc_storeStrong((id *)&_test_savedStateCollection, a3);
}

- (BOOL)_createSavedPanelStateForTesting
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (_test_savedStateCollection)
    objc_msgSend(v3, "setObject:forKey:", _test_savedStateCollection, CFSTR("CurrentCollection"));
  v5 = objc_msgSend(v4, "count");
  if (v5)
    objc_storeStrong((id *)&self->_savedCollectionState, v4);

  return v5 != 0;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v5 = a5;
  v13 = a4;
  -[BookmarksNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackButtonTitle:", v9);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[BookmarksNavigationController _updateClearHistoryButton](self, "_updateClearHistoryButton");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v13, "updateSeparatorInset");
  -[BookmarksNavigationController _updateDoneButtonItemForViewController:](self, "_updateDoneButtonItemForViewController:", v13);
  -[BookmarksNavigationController _updateToolbarItemsForViewController:animated:](self, "_updateToolbarItemsForViewController:animated:", v13, v5);
  -[BookmarksNavigationController _updateToolbarVisibility](self, "_updateToolbarVisibility");
  -[BookmarksNavigationController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sf_usesSidebarPresentation");

  if (v12)
    objc_msgSend(v13, "setEdgesForExtendedLayout:", 0);

}

- (void)_updateDoneButtonItemForViewController:(id)a3
{
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  int v7;
  void *v8;
  id WeakRetained;
  UIBarButtonItem *v10;
  UIBarButtonItem *doneButtonItem;
  UIBarButtonItem *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || v5 == self->_doneButtonItem)
  {
    if (self->_doneButtonHidden)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      -[BookmarksNavigationController traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "sf_usesSidebarPresentation") & 1) != 0
        || !objc_msgSend(v13, "safari_wantsDoneButtonInModalBookmarksPanel"))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
        v7 = objc_opt_respondsToSelector() ^ 1;

      }
    }
    if (!self->_doneButtonItem)
    {
      v10 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", self->_importHandler != 0, self, sel__doneButtonPressed);
      doneButtonItem = self->_doneButtonItem;
      self->_doneButtonItem = v10;

      -[UIBarButtonItem setAccessibilityIdentifier:](self->_doneButtonItem, "setAccessibilityIdentifier:", CFSTR("Done"));
    }
    if (!((v6 != 0) | v7 & 1))
    {
      v12 = self->_doneButtonItem;
      goto LABEL_16;
    }
    if (v6 != 0 && (v7 & 1) != 0)
    {
      v12 = 0;
LABEL_16:
      objc_msgSend(v4, "setRightBarButtonItem:animated:", v12, 1);
    }
  }

}

- (void)setDoneButtonHidden:(BOOL)a3
{
  id v4;

  if (self->_doneButtonHidden != a3)
  {
    self->_doneButtonHidden = a3;
    -[BookmarksNavigationController topViewController](self, "topViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BookmarksNavigationController _updateDoneButtonItemForViewController:](self, "_updateDoneButtonItemForViewController:", v4);

  }
}

- (void)_bookmarkSyncTimerDidFire:(id)a3
{
  -[WebBookmarkCollection _postBookmarksChangedSyncNotification](self->_bookmarkCollection, "_postBookmarksChangedSyncNotification", a3);
  -[BookmarksNavigationController _clearBookmarkSyncTimer](self, "_clearBookmarkSyncTimer");
}

- (void)_clearBookmarkSyncTimer
{
  NSTimer *bookmarkSyncTimer;

  -[NSTimer invalidate](self->_bookmarkSyncTimer, "invalidate");
  bookmarkSyncTimer = self->_bookmarkSyncTimer;
  self->_bookmarkSyncTimer = 0;

}

- (void)setAllowsEditing:(BOOL)a3
{
  id v4;

  if (self->_allowsEditing != a3)
  {
    self->_allowsEditing = a3;
    -[BookmarksNavigationController topViewController](self, "topViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BookmarksNavigationController _updateToolbarItemsForViewController:animated:](self, "_updateToolbarItemsForViewController:animated:", v4, 0);

  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  void *v6;
  id v7;

  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[BookmarksNavigationController topViewController](self, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setTableSeparatorInset:(UIEdgeInsets)a3
{
  void *v6;
  id v7;

  if (a3.left != self->_tableSeparatorInset.left
    || a3.top != self->_tableSeparatorInset.top
    || a3.right != self->_tableSeparatorInset.right
    || a3.bottom != self->_tableSeparatorInset.bottom)
  {
    self->_tableSeparatorInset = a3;
    -[BookmarksNavigationController topViewController](self, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "updateSeparatorInset");
    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)_setContentsDirty
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerContentDidBecomeDirty:", self);

}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return self->_prefersHalfHeightSheetPresentationWithLoweredBar;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabGroupManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTabGroupObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)BookmarksNavigationController;
  -[BookmarksNavigationController dealloc](&v6, sel_dealloc);
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  _SFNavigationIntentHandling **p_navigationIntentHandler;
  id v6;
  id v7;
  id WeakRetained;

  p_navigationIntentHandler = &self->_navigationIntentHandler;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  objc_msgSend(WeakRetained, "handleNavigationIntent:completion:", v7, v6);

}

- (void)dispatchNavigationIntent:(id)a3
{
  _SFNavigationIntentHandling **p_navigationIntentHandler;
  id v4;
  id WeakRetained;

  p_navigationIntentHandler = &self->_navigationIntentHandler;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v4);

}

- (void)panelViewController:(id)a3 updateToolbarItemsAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[BookmarksNavigationController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[BookmarksNavigationController _updateToolbarItemsForViewController:animated:](self, "_updateToolbarItemsForViewController:animated:", v8, v4);
    v7 = v8;
  }

}

- (void)setPinnedPaletteForPanelViewController:(id)a3
{
  _UINavigationBarPalette *palette;
  void *v5;
  double Width;
  CGFloat v7;
  void *v8;
  _UINavigationBarPalette *v9;
  _UINavigationBarPalette *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  v12 = a3;
  if (-[BookmarksNavigationController _shouldShowPaletteForViewController:](self, "_shouldShowPaletteForViewController:"))
  {
    -[BookmarksNavigationController _setupCollectionSegmentedControlIfNeeded](self, "_setupCollectionSegmentedControlIfNeeded");
    palette = self->_palette;
    if (!palette)
    {
      -[BookmarksNavigationController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      Width = CGRectGetWidth(v13);
      -[UISegmentedControl bounds](self->_collectionSegmentedControl, "bounds");
      v7 = CGRectGetHeight(v14) + 12.0;

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, Width, v7);
      objc_msgSend(v8, "addSubview:", self->_collectionSegmentedControl);
      v9 = (_UINavigationBarPalette *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4290]), "initWithContentView:", v8);
      v10 = self->_palette;
      self->_palette = v9;

      palette = self->_palette;
    }
    objc_msgSend(v12, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setBottomPalette:", palette);

  }
}

- (void)panelViewControllerDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_swipeActionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swipedIndexPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v7 = 1;
  }
  -[BookmarksNavigationController setDoneButtonHidden:](self, "setDoneButtonHidden:", v7);

}

- (void)panelViewControllerDidEndEditing:(id)a3
{
  -[BookmarksNavigationController setDoneButtonHidden:](self, "setDoneButtonHidden:", 0);
}

- (UIEdgeInsets)separatorInsetForBookmarksTableViewController:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tableSeparatorInset.top;
  left = self->_tableSeparatorInset.left;
  bottom = self->_tableSeparatorInset.bottom;
  right = self->_tableSeparatorInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)contentInsetForBookmarksTableViewController:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)bookmarksTableViewShouldDispatchNavigationIntent:(id)a3 forSelectedBookmark:(id)a4
{
  void (**importHandler)(id, id, id);

  importHandler = (void (**)(id, id, id))self->_importHandler;
  if (importHandler)
    importHandler[2](self->_importHandler, a4, a3);
  return importHandler == 0;
}

- (BOOL)bookmarksTableViewIsReadOnly:(id)a3
{
  return self->_importHandler != 0;
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (TabGroupProvider *)v3;
}

- (id)readingListViewControllerCurrentReadingListItem:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "bookmarksNavigationControllerCurrentContinuousReadingItem:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)readingListViewController:(id)a3 updateUnreadFilterShowingAllBookmarks:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationController:updateReadingListUnreadFilterShowingAllBookmarks:", self, v4);

}

- (void)readingListViewController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  id v8;

  v5 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksNavigationController:setBookmark:asRead:", self, v8, v5);

}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id v3;

  -[BookmarksNavigationController topmostBookmarksTableViewController](self, "topmostBookmarksTableViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadAllSyntheticFolders");

}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  id v4;

  -[BookmarksNavigationController topmostBookmarksTableViewController](self, "topmostBookmarksTableViewController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadAllSyntheticFolders");

}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  id v4;

  -[BookmarksNavigationController topmostBookmarksTableViewController](self, "topmostBookmarksTableViewController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadAllSyntheticFolders");

}

- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4
{
  -[BookmarksNavigationController _reloadFolderContentsForFolderIDIfNeeded:](self, "_reloadFolderContentsForFolderIDIfNeeded:", objc_msgSend(a4, "folderID", a3));
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (BookmarksNavigationControllerDelegate)bookmarksNavigationControllerDelegate
{
  return (BookmarksNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_bookmarksNavigationControllerDelegate);
}

- (void)setBookmarksNavigationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bookmarksNavigationControllerDelegate, a3);
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

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)tableSeparatorInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tableSeparatorInset.top;
  left = self->_tableSeparatorInset.left;
  bottom = self->_tableSeparatorInset.bottom;
  right = self->_tableSeparatorInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hasTranslucentAppearance
{
  return self->_hasTranslucentAppearance;
}

- (void)setHasTranslucentAppearance:(BOOL)a3
{
  self->_hasTranslucentAppearance = a3;
}

- (BOOL)isContentBorrowed
{
  return self->_contentBorrowed;
}

- (void)setContentBorrowed:(BOOL)a3
{
  self->_contentBorrowed = a3;
}

- (BOOL)prefersHalfHeightSheetPresentationWithLoweredBar
{
  return self->_prefersHalfHeightSheetPresentationWithLoweredBar;
}

- (void)setPrefersHalfHeightSheetPresentationWithLoweredBar:(BOOL)a3
{
  self->_prefersHalfHeightSheetPresentationWithLoweredBar = a3;
}

- (NSString)currentCollection
{
  return self->_currentCollection;
}

- (id)importHandler
{
  return self->_importHandler;
}

- (void)setImportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1568);
}

- (BOOL)doneButtonHidden
{
  return self->_doneButtonHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_importHandler, 0);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_bookmarksNavigationControllerDelegate);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_savedCollectionState, 0);
  objc_storeStrong((id *)&self->_currentCollection, 0);
  objc_storeStrong((id *)&self->_topLevelCollections, 0);
  objc_storeStrong((id *)&self->_collectionSegmentedControl, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_editingDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_createFolderButtonItem, 0);
  objc_storeStrong((id *)&self->_bookmarkSyncTimer, 0);
  objc_storeStrong((id *)&self->_readonlyCollectionQueue, 0);
  objc_storeStrong((id *)&self->_readonlyCollection, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
}

@end
