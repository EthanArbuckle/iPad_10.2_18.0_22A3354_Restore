@implementation _UIDocumentPickerContainerViewController

- (_UIDocumentPickerContainerViewController)initWithModel:(id)a3
{
  id v4;
  _UIDocumentPickerContainerViewController *v5;
  _UIDocumentPickerContainerViewController *v6;
  void *v7;
  _UIDocumentPickerSortOrderView *v8;
  _UIDocumentPickerSortOrderView *sortView;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentPickerContainerViewController;
  v5 = -[_UIDocumentPickerContainerViewController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIDocumentPickerContainerViewController setModel:](v5, "setModel:", v4);
    if (objc_msgSend(v4, "sortOrder") != 3)
      objc_msgSend(v4, "setSortOrder:", -[_UIDocumentPickerContainerViewController sortOrder](v6, "sortOrder"));
    objc_msgSend(v4, "displayTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainerViewController setTitle:](v6, "setTitle:", v7);

    -[_UIDocumentPickerContainerViewController setEdgesForExtendedLayout:](v6, "setEdgesForExtendedLayout:", 0);
    v8 = objc_alloc_init(_UIDocumentPickerSortOrderView);
    sortView = v6->_sortView;
    v6->_sortView = v8;

    -[_UIDocumentPickerSortOrderView setValue:](v6->_sortView, "setValue:", objc_msgSend(v4, "sortOrder"));
    -[_UIDocumentPickerSortOrderView setListMode:](v6->_sortView, "setListMode:", -[_UIDocumentPickerContainerViewController displayMode](v6, "displayMode"));
    -[_UIDocumentPickerSortOrderView addTarget:action:forControlEvents:](v6->_sortView, "addTarget:action:forControlEvents:", v6, sel__sortOrderViewChanged_, 4096);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_UIDocumentPickerDisplayModeChangedHandler, CFSTR("_UIDocumentPickerDisplayModeChanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }

  return v6;
}

- (void)invalidate
{
  id v2;

  -[_UIDocumentPickerContainerViewController model](self, "model");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopMonitoringChanges");

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("_UIDocumentPickerDisplayModeChanged"), 0);
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerContainerViewController;
  -[_UIDocumentPickerContainerViewController dealloc](&v4, sel_dealloc);
}

- (void)displayModeChanged
{
  -[_UIDocumentPickerContainerViewController ensureChildViewController](self, "ensureChildViewController");
  -[_UIDocumentPickerContainerViewController _updateTraitCollection](self, "_updateTraitCollection");
}

- (void)ensureChildViewController
{
  objc_class *v3;
  int64_t v4;
  void *v5;
  void *v6;
  _UIDocumentPickerContainedViewController *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  int64_t v15;
  id v16;

  v3 = (objc_class *)objc_opt_class();
  v4 = -[_UIDocumentPickerContainerViewController displayMode](self, "displayMode");
  -[_UIDocumentPickerContainerViewController childViewController](self, "childViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIDocumentPickerContainerViewController childViewController](self, "childViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_10;
  }
  else
  {

  }
  v7 = self->_childViewController;
  v8 = [v3 alloc];
  -[_UIDocumentPickerContainerViewController model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithModel:", v9);

  objc_msgSend(v10, "setDisplayMode:", -[_UIDocumentPickerContainerViewController displayMode](self, "displayMode"));
  -[_UIDocumentPickerContainerViewController setChildViewController:](self, "setChildViewController:", v10);
  if (-[_UIDocumentPickerContainedViewController isEditing](v7, "isEditing"))
  {
    -[_UIDocumentPickerContainedViewController setEditing:](self->_childViewController, "setEditing:", 1);
    -[_UIDocumentPickerContainedViewController indexPathsForSelectedItems](v7, "indexPathsForSelectedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerContainedViewController setIndexPathsForSelectedItems:](self->_childViewController, "setIndexPathsForSelectedItems:", v11);

  }
  if (v4 != 3)
  {
    -[_UIDocumentPickerContainerViewController sortView](self, "sortView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortView:", v12);

    -[_UIDocumentPickerContainerViewController setupSearchController](self, "setupSearchController");
  }

LABEL_10:
  v13 = -[_UIDocumentPickerContainerViewController displayMode](self, "displayMode");
  -[_UIDocumentPickerContainerViewController childViewController](self, "childViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayMode:", v13);

  v15 = -[_UIDocumentPickerContainerViewController displayMode](self, "displayMode");
  -[_UIDocumentPickerContainerViewController sortView](self, "sortView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setListMode:", v15);

}

- (void)_updateTraitCollection
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Height;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
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
  objc_super v30;
  _QWORD v31[5];
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v31[4] = *MEMORY[0x24BDAC8D0];
  -[_UIDocumentPickerContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  Height = CGRectGetHeight(v32);
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  if (CGRectGetWidth(v33) >= 500.0
    && (v34.origin.x = v5, v34.origin.y = v7, v34.size.width = v9, v34.size.height = v11, CGRectGetHeight(v34) >= 500.0))
  {
    -[_UIDocumentPickerContainerViewController traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "userInterfaceIdiom") == 0;

  }
  else
  {
    v13 = 1;
  }
  v15 = -[_UIDocumentPickerContainerViewController displayMode](self, "displayMode", 130.0) != 1;
  v16 = (void *)MEMORY[0x24BDF6F30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", Height <= 130.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_traitCollectionWithValue:forTraitNamed:", v17, CFSTR("TightMargins"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDF6F30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_traitCollectionWithValue:forTraitNamed:", v20, CFSTR("CompactIcons"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDF6F30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_traitCollectionWithValue:forTraitNamed:", v23, CFSTR("ListMode"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BDF6F30];
  v30.receiver = self;
  v30.super_class = (Class)_UIDocumentPickerContainerViewController;
  -[_UIDocumentPickerContainerViewController traitCollection](&v30, sel_traitCollection);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  v31[1] = v18;
  v31[2] = v21;
  v31[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "traitCollectionWithTraitsFromCollections:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerContainerViewController parentViewController](self, "parentViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setOverrideTraitCollection:forChildViewController:", v28, self);

}

- (void)setupSearchController
{
  _UIDocumentPickerSearchPaletteView *v3;
  void *v4;
  _UIDocumentPickerSearchPaletteView *v5;
  _UIDocumentPickerSearchPaletteView *searchView;
  _UIDocumentPickerContainedViewController *childViewController;
  void *v8;
  void *v9;
  _UIDocumentPickerSearchPaletteView *v10;
  id v11;

  if (self->_resultsController)
  {
    v3 = [_UIDocumentPickerSearchPaletteView alloc];
    -[_UIDocumentPickerContainerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = -[_UIDocumentPickerSearchPaletteView initWithFrame:resultsController:](v3, "initWithFrame:resultsController:", self->_resultsController, 0.0, 0.0);
    searchView = self->_searchView;
    self->_searchView = v5;

    -[_UIDocumentPickerSearchPaletteView setAutoresizingMask:](self->_searchView, "setAutoresizingMask:", 18);
    childViewController = self->_childViewController;
    -[_UIDocumentPickerSearchPaletteView searchController](self->_searchView, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", childViewController);

    -[_UIDocumentPickerContainedViewController setPinnedHeaderView:animated:](self->_childViewController, "setPinnedHeaderView:animated:", self->_searchView, 0);
    -[_UIDocumentPickerSearchPaletteView searchController](self->_searchView, "searchController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setEnabled:animated:", -[_UIDocumentPickerContainerViewController isEditing](self, "isEditing") ^ 1, 0);

  }
  else
  {
    v10 = self->_searchView;
    self->_searchView = 0;

    -[_UIDocumentPickerContainedViewController setPinnedHeaderView:animated:](self->_childViewController, "setPinnedHeaderView:animated:", 0, 0);
  }
}

- (void)_startSearchWithQueryString:(id)a3 becomeFirstResponder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a4;
  v6 = a3;
  -[_UIDocumentPickerSearchPaletteView searchController](self->_searchView, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "becomeFirstResponder");
  else
    objc_msgSend(v7, "setActive:", 1);
  v10 = (void *)*MEMORY[0x24BDF74F8];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93___UIDocumentPickerContainerViewController__startSearchWithQueryString_becomeFirstResponder___block_invoke;
  v13[3] = &unk_24E43A858;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v10, "_performBlockAfterCATransactionCommits:", v13);

}

- (void)setChildViewController:(id)a3
{
  -[_UIDocumentPickerContainerViewController setChildViewController:animated:](self, "setChildViewController:animated:", a3, 0);
}

- (void)setChildViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIDocumentPickerContainedViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _UIDocumentPickerContainedViewController *v18;
  _UIDocumentPickerContainedViewController *childViewController;
  id v20;
  _QWORD v21[4];
  id v22;
  _UIDocumentPickerContainerViewController *v23;
  _UIDocumentPickerContainedViewController *v24;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, v4);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[_UIDocumentPickerContainerViewController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutoresizingMask:", 18);

  -[_UIDocumentPickerContainerViewController serviceViewController](self, "serviceViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceViewController:", v10);

  -[_UIDocumentPickerContainerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = self->_childViewController;
  v14 = (void *)MEMORY[0x24BDF6F90];
  -[_UIDocumentPickerContainedViewController view](self->_childViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __76___UIDocumentPickerContainerViewController_setChildViewController_animated___block_invoke;
  v21[3] = &unk_24E43B468;
  v17 = v6;
  v22 = v17;
  v23 = self;
  v24 = v13;
  v18 = v13;
  objc_msgSend(v14, "transitionFromView:toView:duration:options:completion:", v15, v16, 5242880, v21, 0.3);

  childViewController = self->_childViewController;
  self->_childViewController = (_UIDocumentPickerContainedViewController *)v17;
  v20 = v17;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerContainerViewController;
  -[_UIDocumentPickerContainerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[_UIDocumentPickerContainerViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[_UIDocumentPickerContainerViewController serviceViewController](self, "serviceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UIDocumentPickerContainerViewController ensureChildViewController](self, "ensureChildViewController");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerContainerViewController;
  -[_UIDocumentPickerContainerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[_UIDocumentPickerContainerViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerContainerViewController;
  -[_UIDocumentPickerContainerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[_UIDocumentPickerContainerViewController _updateTraitCollection](self, "_updateTraitCollection");
}

- (void)_sortOrderViewChanged:(id)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "value");
  if (v4 == -[_UIDocumentPickerContainerViewController sortOrder](self, "sortOrder"))
  {
    -[_UIDocumentPickerContainerViewController setDefaultDisplayMode:](self, "setDefaultDisplayMode:", objc_msgSend(v7, "listMode"));
    -[_UIDocumentPickerContainerViewController displayModeChanged](self, "displayModeChanged");
    -[_UIDocumentPickerContainedViewController scrollSortViewToVisible](self->_childViewController, "scrollSortViewToVisible");
  }
  else
  {
    -[_UIDocumentPickerContainerViewController setSortOrder:](self, "setSortOrder:", objc_msgSend(v7, "value"));
    v5 = objc_msgSend(v7, "value");
    -[_UIDocumentPickerContainerViewController model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortOrder:", v5);

  }
}

- (void)setServiceViewController:(id)a3
{
  id v4;
  void *v5;
  id obj;

  obj = a3;
  -[_UIDocumentPickerContainerViewController serviceViewController](self, "serviceViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_serviceViewController, obj);
    v5 = obj;
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  -[_UIDocumentPickerContainedViewController setEditing:animated:](self->_childViewController, "setEditing:animated:");
  -[_UIDocumentPickerContainerViewController searchView](self, "searchView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setEnabled:animated:", !v5, v4);

}

- (void)setEditing:(BOOL)a3
{
  -[_UIDocumentPickerContainedViewController setEditing:](self->_childViewController, "setEditing:", a3);
}

- (BOOL)isEditing
{
  return -[_UIDocumentPickerContainedViewController isEditing](self->_childViewController, "isEditing");
}

- (void)setIndexPathsForSelectedItems:(id)a3
{
  -[_UIDocumentPickerContainedViewController setIndexPathsForSelectedItems:](self->_childViewController, "setIndexPathsForSelectedItems:", a3);
}

- (NSArray)indexPathsForSelectedItems
{
  return (NSArray *)-[_UIDocumentPickerContainedViewController indexPathsForSelectedItems](self->_childViewController, "indexPathsForSelectedItems");
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[_UIDocumentPickerContainedViewController scrollView](self->_childViewController, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", x, y);

}

- (CGPoint)contentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIDocumentPickerContainedViewController scrollView](self->_childViewController, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
}

- (void)setSortOrder:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v10, "objectForKey:", CFSTR("_UIDocumentPickerSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("sortOrder"));

  objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("_UIDocumentPickerSettings"));
}

- (int)sortOrder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;

  +[_UIDocumentPickerContainerViewController userDefaults](_UIDocumentPickerContainerViewController, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_UIDocumentPickerSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "objectForKey:", CFSTR("sortOrder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  return v9;
}

- (void)setDefaultDisplayMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v11;

  +[_UIDocumentPickerContainerViewController userDefaults](_UIDocumentPickerContainerViewController, "userDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("_UIDocumentPickerSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("listMode"));

  objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("_UIDocumentPickerSettings"));
  objc_msgSend(v11, "synchronize");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("_UIDocumentPickerDisplayModeChanged"), 0, 0, 1u);

}

- (int64_t)defaultDisplayMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;
  int64_t v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v2, "objectForKey:", CFSTR("_UIDocumentPickerSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "objectForKey:", CFSTR("listMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  v11 = v10;

  return v11;
}

- (void)setExplicitDisplayMode:(int64_t)a3
{
  _BOOL8 v3;
  id v4;

  self->_explicitDisplayMode = a3;
  v3 = a3 != 0;
  -[_UIDocumentPickerContainerViewController sortView](self, "sortView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setListModeToggleHidden:", v3);

}

- (int64_t)displayMode
{
  if (self->_explicitDisplayMode)
    return self->_explicitDisplayMode;
  else
    return -[_UIDocumentPickerContainerViewController defaultDisplayMode](self, "defaultDisplayMode");
}

- (_UIDocumentPickerServiceViewController)serviceViewController
{
  return (_UIDocumentPickerServiceViewController *)objc_loadWeakRetained((id *)&self->_serviceViewController);
}

- (_UIDocumentPickerContainerModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (int64_t)explicitDisplayMode
{
  return self->_explicitDisplayMode;
}

- (_UIDocumentSearchListController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_resultsController, a3);
}

- (_UIDocumentPickerContainedViewController)childViewController
{
  return self->_childViewController;
}

- (_UIDocumentPickerSortOrderView)sortView
{
  return self->_sortView;
}

- (void)setSortView:(id)a3
{
  objc_storeStrong((id *)&self->_sortView, a3);
}

- (_UIDocumentPickerSearchPaletteView)searchView
{
  return self->_searchView;
}

- (void)setSearchView:(id)a3
{
  objc_storeStrong((id *)&self->_searchView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchView, 0);
  objc_storeStrong((id *)&self->_sortView, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_serviceViewController);
}

@end
