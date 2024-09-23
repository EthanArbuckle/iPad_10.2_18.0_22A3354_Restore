@implementation LUIClassTableViewController

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

        objc_msgSend(v10, "setDelegate:", 0);
        objc_msgSend(v10, "unbindContent");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[LUIClassTableViewController setClassProvider:](self, "setClassProvider:", 0);
  v11.receiver = self;
  v11.super_class = (Class)LUIClassTableViewController;
  -[LUIClassTableViewController dealloc](&v11, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)LUIClassTableViewController;
  -[LUIClassTableViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[LUIClassTableViewController _setTitle](self, "_setTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "localizedCaseInsensitiveCompare:"));
  -[LUIClassTableViewController setSectionTitles:](self, "setSectionTitles:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitlesSortDescriptors](self, "sectionTitlesSortDescriptors"));
  -[LUIClassTableViewController setSortDescriptors:](self, "setSortDescriptors:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mostRecentLoggedInUsersWithCount:", objc_msgSend(v9, "numberOfRecentUsersToShow")));

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)LKUsers), "initWithUsers:", v10);
    -[LUIClassTableViewController setRecentUsers:](self, "setRecentUsers:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "students"));
    -[LUIClassTableViewController setHaveRecentUsersSection:](self, "setHaveRecentUsersSection:", objc_msgSend(v14, "count") != 0);

  }
  else
  {
    -[LUIClassTableViewController setHaveRecentUsersSection:](self, "setHaveRecentUsersSection:", 0);
  }

  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
    -[LUIClassTableViewController _addLongPressGestureRecognizer](self, "_addLongPressGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController privacyView](self, "privacyView"));
  objc_msgSend(v15, "addSubview:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v17, "addSubview:", v18);

  -[LUIClassTableViewController activateLayoutConstraints](self, "activateLayoutConstraints");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController headerView](self, "headerView"));
  objc_msgSend(v3, "layoutSubviews");

  v4.receiver = self;
  v4.super_class = (Class)LUIClassTableViewController;
  -[LUIMajorViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  -[LUIClassTableViewController _checkOpacities](self, "_checkOpacities");
  -[LUIClassTableViewController _checkNeedForScrolling](self, "_checkNeedForScrolling");
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v3 = objc_msgSend(v2, "statusBarStyle");

  return (int64_t)v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  objc_msgSend(v5, "updateRecentUsersViewController:", self);

  v6.receiver = self;
  v6.super_class = (Class)LUIClassTableViewController;
  -[LUIMajorViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
}

- (void)_checkNeedForScrolling
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  _BOOL8 v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "frame");
  v8 = v5 > v7;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setScrollEnabled:", v8);

}

- (void)_checkOpacities
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController headerView](self, "headerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
  objc_msgSend(v7, "convertRect:toView:", v17, v9, v11, v13, v15);
  v19 = v18;

  if (v19 >= (double)(uint64_t)v5)
    objc_msgSend(v6, "setAlpha:", 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "visibleCells"));

  if (v21 && objc_msgSend(v21, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v26), "setAlpha:", 1.0, (_QWORD)v27);
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v24);
    }

  }
}

- (void)_setTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "schoolName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController headerView](self, "headerView"));
  v5 = v4;
  if (v8)
  {
    objc_msgSend(v4, "setTitle:", v8);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SELECT_CLASS_PROMPT"), &stru_100069EB8, 0));
    objc_msgSend(v5, "setTitle:", v7);

  }
}

- (void)_addLongPressGestureRecognizer
{
  void *v3;
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleLongPress:");
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDelaysTouchesBegan:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "addGestureRecognizer:", v4);

}

- (void)setClassProvider:(id)a3 forController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "unbindContent");
  objc_msgSend(v5, "bindContentToObject:withKeyPath:", v6, CFSTR("classes"));

}

- (void)setSortDescriptors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

        objc_msgSend(v12, "setSortDescriptors:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "reloadData");

}

- (id)sortDescriptors
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_alloc_init((Class)NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      v12 = v3;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary", (_QWORD)v18));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortDescriptors"));
        v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v16));

        v11 = (char *)v11 + 1;
        v12 = v3;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v3;
}

- (UITableView)tableView
{
  UITableView *tableView;
  UITableView *v4;
  UITableView *v5;
  UITableView *v6;
  void *v7;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_tableView;
    self->_tableView = v4;

    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    v6 = self->_tableView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITableView setBackgroundView:](self->_tableView, "setBackgroundView:", 0);
    -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    -[UITableView setShowsVerticalScrollIndicator:](self->_tableView, "setShowsVerticalScrollIndicator:", 0);
    -[UITableView setShowsHorizontalScrollIndicator:](self->_tableView, "setShowsHorizontalScrollIndicator:", 0);
    -[UITableView setClipsToBounds:](self->_tableView, "setClipsToBounds:", 1);
    -[UITableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("LUIClassTableView"));
    tableView = self->_tableView;
  }
  return tableView;
}

- (LUIPrivacyView)privacyView
{
  LUIPrivacyView *privacyView;
  LUIPrivacyView *v4;
  LUIPrivacyView *v5;

  privacyView = self->_privacyView;
  if (!privacyView)
  {
    v4 = (LUIPrivacyView *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyView defaultPrivacyView](LUIPrivacyView, "defaultPrivacyView"));
    v5 = self->_privacyView;
    self->_privacyView = v4;

    -[LUIPrivacyView setTranslatesAutoresizingMaskIntoConstraints:](self->_privacyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    privacyView = self->_privacyView;
  }
  return privacyView;
}

- (NSArray)sectionTitles
{
  NSArray *sectionTitles;

  sectionTitles = self->_sectionTitles;
  if (!sectionTitles)
  {
    self->_sectionTitles = (NSArray *)&__NSArray0__struct;

    sectionTitles = self->_sectionTitles;
  }
  return sectionTitles;
}

- (NSMutableDictionary)collectionControllerDictionary
{
  NSMutableDictionary *collectionControllerDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  collectionControllerDictionary = self->_collectionControllerDictionary;
  if (!collectionControllerDictionary)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = self->_collectionControllerDictionary;
    self->_collectionControllerDictionary = v4;

    collectionControllerDictionary = self->_collectionControllerDictionary;
  }
  return collectionControllerDictionary;
}

- (NSDictionary)sectionDictionary
{
  NSDictionary *sectionDictionary;
  NSDictionary *v4;
  NSDictionary *v5;

  sectionDictionary = self->_sectionDictionary;
  if (!sectionDictionary)
  {
    v4 = objc_opt_new(NSDictionary);
    v5 = self->_sectionDictionary;
    self->_sectionDictionary = v4;

    sectionDictionary = self->_sectionDictionary;
  }
  return sectionDictionary;
}

- (NSArray)sectionTitlesSortDescriptors
{
  NSArray *sectionTitlesSortDescriptors;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  void *v8;

  sectionTitlesSortDescriptors = self->_sectionTitlesSortDescriptors;
  if (!sectionTitlesSortDescriptors)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("className"), 1, "localizedStandardCompare:"));
    v8 = v4;
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    v6 = self->_sectionTitlesSortDescriptors;
    self->_sectionTitlesSortDescriptors = v5;

    sectionTitlesSortDescriptors = self->_sectionTitlesSortDescriptors;
  }
  return sectionTitlesSortDescriptors;
}

- (void)activateLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController privacyView](self, "privacyView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPrivacyView bottomCenterConstraintsForPrivacyView:inView:](LUIPrivacyView, "bottomCenterConstraintsForPrivacyView:inView:", v3, v4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableViewConstraints](self, "tableViewConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);

}

- (id)tableViewConstraints
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
  id v14;
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
  _QWORD v25[4];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v23, "fixedWidthForClassTable");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:"));
  v25[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v25[1] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 40.0));
  v25[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v11, "bottomInset");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10));
  v25[3] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));

  return v14;
}

- (BOOL)shouldShowBottomLeftVibrantButton
{
  return 1;
}

- (BOOL)shouldShowBottomRightVibrantButton
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTemporarySessionAllowed");

  return v3;
}

- (int64_t)imageTypeForBottomLeftVibrantButton
{
  return 0;
}

- (int64_t)imageTypeForBottomRightVibrantButton
{
  return 4;
}

- (id)titleForBottomLeftVibrantButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_100069EB8, 0));

  return v3;
}

- (id)titleForBottomRightVibrantButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("GUEST"), &stru_100069EB8, 0));

  return v3;
}

- (void)bottomLeftVibrantButtonTapped:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance", a3));
  v5 = objc_msgSend(v4, "presentUserLimitIsReachedAlertIfNeeded");

  if ((v5 & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController navigationController](self, "navigationController"));
    v6 = objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (void)setRecentUsers:(id)a3
{
  LKUsers *v4;
  LKUsers *v5;
  LKUsers *recentUsers;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  LKUsers *v13;
  LKUsers *v14;
  void *v15;

  v4 = (LKUsers *)a3;
  v5 = v4;
  recentUsers = self->_recentUsers;
  if (recentUsers != v4)
  {
    if (v4)
    {
      v7 = objc_alloc((Class)LKUsers);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LKUsers students](v5, "students"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUISortingSupport sharedInstance](LUISortingSupport, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortDescriptorWithKey:comparatorType:", CFSTR("contact"), 0));
      v15 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v11));
      v13 = (LKUsers *)objc_msgSend(v7, "initWithUsers:", v12);
      v14 = self->_recentUsers;
      self->_recentUsers = v13;

    }
    else
    {
      self->_recentUsers = 0;

    }
  }

}

- (unint64_t)haveRecentUsers
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v3 = objc_msgSend(v2, "haveRecentUsers");

  return v3;
}

- (void)reloadRecentUsersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];

  if (-[LUIClassTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostRecentLoggedInUsersWithCount:", objc_msgSend(v4, "numberOfRecentUsersToShow")));

    if (v5)
      v6 = objc_msgSend(objc_alloc((Class)LKUsers), "initWithUsers:", v5);
    else
      v6 = 0;
    -[LUIClassTableViewController setRecentUsers:](self, "setRecentUsers:", v6);
    if (!-[LUIClassTableViewController haveRecentUsersSection](self, "haveRecentUsersSection"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));

      if (v13)
      {
        v14 = qword_100088F38;
        if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "About to insert Recent Users Section", v26, 2u);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
        objc_msgSend(v15, "beginUpdates");

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection")));
        objc_msgSend(v16, "insertSections:withRowAnimation:", v17, 0);

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
        objc_msgSend(v18, "endUpdates");

        -[LUIClassTableViewController setHaveRecentUsersSection:](self, "setHaveRecentUsersSection:", 1);
      }
      goto LABEL_22;
    }
    v7 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "About to update Recent Users Section", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));

    if (v8)
    {
      v9 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reload Recent Users Section", v27, 2u);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
      objc_msgSend(v10, "beginUpdates");

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection")));
      objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 0);
    }
    else
    {
      -[LUIClassTableViewController setHaveRecentUsersSection:](self, "setHaveRecentUsersSection:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
      v20 = objc_msgSend(v19, "hasStudents");

      v21 = qword_100088F38;
      v22 = os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (v22)
        {
          *(_WORD *)v28 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Pop view controller", v28, 2u);
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController navigationController](self, "navigationController"));
        v25 = objc_msgSend(v24, "popViewControllerAnimated:", 1);
        goto LABEL_21;
      }
      if (v22)
      {
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Delete Recent Users Section", v29, 2u);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
      objc_msgSend(v23, "beginUpdates");

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection")));
      objc_msgSend(v11, "deleteSections:withRowAnimation:", v12, 0);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    objc_msgSend(v24, "endUpdates");
LABEL_21:

LABEL_22:
    -[LUIClassTableViewController _checkNeedForScrolling](self, "_checkNeedForScrolling");

  }
}

- (unint64_t)_recentUsersSection
{
  return 0;
}

- (int64_t)recentUsersCount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "students"));
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = 0;
  }

  return (int64_t)v6;
}

- (void)setClassProviderWithGroupDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
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

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count")
    || (v6 = objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController _fixedClassGroupDictionary](self, "_fixedClassGroupDictionary")),
        v5,
        (v5 = (void *)v6) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v23 = v5;
      -[LUIClassTableViewController setSectionDictionary:](self, "setSectionDictionary:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionDictionary](self, "sectionDictionary"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v11 = objc_msgSend(v10, "copy");
      -[LUIClassTableViewController setSectionTitles:](self, "setSectionTitles:", v11);

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v25;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v16);
            v18 = objc_alloc_init((Class)CATCollectionController);
            objc_msgSend(v18, "setDelegate:", self);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionDictionary](self, "sectionDictionary"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v17));
            -[LUIClassTableViewController setClassProvider:forController:](self, "setClassProvider:forController:", v20, v18);

            v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
            objc_msgSend(v21, "setObject:forKey:", v18, v17);

            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v14);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
      objc_msgSend(v22, "reloadData");

      v5 = v23;
    }
  }

}

- (id)_fixedClassGroupDictionary
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALL_CLASSES_SECTION_LABEL"), &stru_100069EB8, 0));

  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v7 = objc_msgSend(v6, "haveStudentsWithNoClasses");

  if (v7)
  {
    v8 = objc_alloc((Class)LKClasses);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController _allStudentsClass](self, "_allStudentsClass"));
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v11 = objc_msgSend(v8, "initWithClassArray:", v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v4);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, v4);
  }

  return v5;
}

- (id)_allStudentsClass
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "students"));

  v4 = objc_alloc((Class)LKClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ALL_STUDENTS_TITLE"), &stru_100069EB8, 0));
  v7 = objc_msgSend(v4, "initWithStudents:instructors:className:classID:", v3, 0, v6, &off_10006C9E0);

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section")
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers")),
        v9,
        !v9))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController _tableView:classCellForRowAtIndexPath:](self, "_tableView:classCellForRowAtIndexPath:", v6, v7));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController _tableView:recentUserCellForRowAtIndexPath:](self, "_tableView:recentUserCellForRowAtIndexPath:", v6, v7));
  }
  v10 = (void *)v8;

  return v10;
}

- (id)_tableView:(id)a3 recentUserCellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  LUIUserTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (LUIUserTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("LUIUserTableViewCell")));
  if (!v8)
    v8 = -[LUIUserTableViewCell initWithStyle:reuseIdentifier:]([LUIUserTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("LUIUserTableViewCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "students"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  -[LUIUserTableViewCell setUserInfo:](v8, "setUserInfo:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contactForUser:isInstructor:", v11, 0));
  -[LUIUserTableViewCell setContact:](v8, "setContact:", v13);

  -[LUIUserTableViewCell setAlpha:](v8, "setAlpha:", 1.0);
  -[LUIUserTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
  v14 = -[LUIClassTableViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, objc_msgSend(v6, "section"));

  v15 = (id)(v14 - 1);
  v16 = objc_msgSend(v6, "row");

  -[LUIUserTableViewCell setSeparatorViewHidden:](v8, "setSeparatorViewHidden:", v15 == v16);
  return v8;
}

- (id)_tableView:(id)a3 classCellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  LUIClassTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (LUIClassTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("LUIClassTableViewCell")));
  if (!v8)
    v8 = -[LUIClassTableViewCell initWithStyle:reuseIdentifier:]([LUIClassTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("LUIClassTableViewCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", (_BYTE *)objc_msgSend(v6, "section")- (_BYTE *)-[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

  -[LUIClassTableViewCell setAlpha:](v8, "setAlpha:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrangedObjectAtIndex:", objc_msgSend(v6, "row")));
  -[LUIClassTableViewCell setClassInfo:](v8, "setClassInfo:", v13);

  -[LUIClassTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
  v14 = -[LUIClassTableViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, objc_msgSend(v6, "section"));

  v15 = (id)(v14 - 1);
  v16 = objc_msgSend(v6, "row");

  -[LUIClassTableViewCell setSeparatorViewHidden:](v8, "setSeparatorViewHidden:", v15 == v16);
  return v8;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  objc_msgSend(v4, "setAlpha:", 0.5);

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  objc_msgSend(v4, "setAlpha:", 1.0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
  if (v8
    && (v9 = (void *)v8,
        v10 = objc_msgSend(v7, "section"),
        v11 = -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection"),
        v9,
        v10 == (id)v11))
  {
    v12 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "A user is selected from Recent Users section", buf, 2u);
    }
    -[LUIClassTableViewController _tableView:didSelectUserRowAtIndexPath:](self, "_tableView:didSelectUserRowAtIndexPath:", v6, v7);
  }
  else
  {
    v13 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "A class is selected.", v14, 2u);
    }
    -[LUIClassTableViewController _tableView:didSelectClassRowAtIndexPath:](self, "_tableView:didSelectClassRowAtIndexPath:", v6, v7);
  }

}

- (void)_tableView:(id)a3 didSelectUserRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  -[LUIClassTableViewController setProgressView:](self, "setProgressView:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  objc_msgSend(v5, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  objc_msgSend(v5, "startLoginFlowForUser:", v6);

}

- (void)_tableView:(id)a3 didSelectClassRowAtIndexPath:(id)a4
{
  void *v5;
  LUIClassUserGridViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  v6 = -[LUIClassUserGridViewController initWithNibName:bundle:]([LUIClassUserGridViewController alloc], "initWithNibName:bundle:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "classInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "students"));
  -[LUIUserGridViewController setUsers:](v6, "setUsers:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "className"));
  -[LUIUserGridViewController setHeaderTitle:](v6, "setHeaderTitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "classID"));
  -[LUIClassUserGridViewController setClassID:](v6, "setClassID:", v10);

  -[LUIClassUserGridViewController setEnableEnglishLocaleNaming:](v6, "setEnableEnglishLocaleNaming:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "classFooterButtonTitle"));
  -[LUIUserGridViewController setFooterButtonTitle:](v6, "setFooterButtonTitle:", v12);

  v13 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Switching into class view...", v15, 2u);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController navigationController](self, "navigationController"));
  objc_msgSend(v14, "pushViewController:animated:", v6, 1);

}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  CGRect v43;
  CGRect v44;

  v6 = a3;
  if (-[LUIClassTableViewController haveCellsInSection:](self, "haveCellsInSection:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController view](self, "view"));
    objc_msgSend(v7, "layoutIfNeeded");

    v8 = objc_alloc((Class)UIView);
    objc_msgSend(v6, "bounds");
    v10 = v9;
    -[LUIClassTableViewController headerHeight](self, "headerHeight");
    v12 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v12, "setBackgroundColor:", v13);

    v14 = objc_alloc((Class)UIView);
    objc_msgSend(v6, "bounds");
    v16 = v15 + -30.0;
    -[LUIClassTableViewController headerHeight](self, "headerHeight");
    v18 = objc_msgSend(v14, "initWithFrame:", 15.0, 0.0, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "chevronColor"));
    objc_msgSend(v18, "setBackgroundColor:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
    objc_msgSend(v21, "setCornerRadius:", 3.0);

    objc_msgSend(v12, "addSubview:", v18);
    v22 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController titleForSection:](self, "titleForSection:", a4));
    objc_msgSend(v22, "setText:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "overallTextColor"));
    objc_msgSend(v22, "setTextColor:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v22, "setFont:", v26);

    objc_msgSend(v22, "sizeToFit");
    objc_msgSend(v22, "setTextAlignment:", 0);
    objc_msgSend(v22, "frame");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v36 = objc_msgSend(v35, "userInterfaceLayoutDirection");

    v37 = 30.0;
    if (v36 == (id)1)
    {
      objc_msgSend(v18, "frame");
      v38 = CGRectGetWidth(v43) + -15.0;
      v44.origin.x = v28;
      v44.origin.y = v30;
      v44.size.width = v32;
      v44.size.height = v34;
      v37 = v38 - CGRectGetWidth(v44);
    }
    -[LUIClassTableViewController headerHeight](self, "headerHeight");
    v40 = v39;
    objc_msgSend(v22, "size");
    objc_msgSend(v22, "setFrame:", v37, (v40 - v41) * 0.5, v32, v34);
    objc_msgSend(v12, "addSubview:", v22);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)UIView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

- (id)viewForFooterInTableView:(id)a3
{
  return objc_opt_new(UIView);
}

- (double)heightForFooterInTableView:(id)a3
{
  return 60.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if (!-[LUIClassTableViewController haveCellsInSection:](self, "haveCellsInSection:", a4))
    return 0.0;
  -[LUIClassTableViewController headerHeight](self, "headerHeight");
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  unsigned int v4;
  double result;

  v4 = -[LUIClassTableViewController haveCellsInSection:](self, "haveCellsInSection:", a4);
  result = 0.0;
  if (v4)
    return 10.0;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers", a3)
    && -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection") == a4)
  {
    return -[LUIClassTableViewController recentUsersCount](self, "recentUsersCount");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a4 - -[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  v10 = objc_msgSend(v9, "numberOfArrangedObjects");
  return (int64_t)v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  objc_msgSend(v5, "singleLineCellHeightForTable:", v4);
  v7 = v6;

  return v7;
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGRect v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController headerView](self, "headerView"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController headerView](self, "headerView"));
    objc_msgSend(v4, "bounds");
    objc_msgSend(v6, "sizeThatFits:", CGRectGetWidth(v10), 3.40282347e38);
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (LUIPaneHeaderView)headerView
{
  LUIPaneHeaderView *headerView;
  LUIPaneHeaderView *v4;
  LUIPaneHeaderView *v5;
  LUIPaneHeaderView *v6;
  void *v7;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = -[LUIPaneHeaderView initWithFrame:]([LUIPaneHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_headerView;
    self->_headerView = v4;

    -[LUIPaneHeaderView setAutoresizingMask:](self->_headerView, "setAutoresizingMask:", 2);
    v6 = self->_headerView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LUIPaneHeaderView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    headerView = self->_headerView;
  }
  return headerView;
}

- (id)titleForSection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers")
    && -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection") == a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RECENT_USERS_SECTION_LABEL"), &stru_100069EB8, 0));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3 - -[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers")));
  }
  v7 = (void *)v6;

  return v7;
}

- (double)headerHeight
{
  double result;
  void *v4;
  double v5;
  double v6;

  result = self->_headerHeight;
  if (result == 0.0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v4, "languageAwareOutsets");
    self->_headerHeight = v6 + v5 + 22.0;

    return self->_headerHeight;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles", a3));
  v5 = (char *)objc_msgSend(v4, "count");

  v6 = objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController recentUsers](self, "recentUsers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "students"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
      ++v5;
  }
  return (int64_t)v5;
}

- (BOOL)haveCellsInSection:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers")
    && -[LUIClassTableViewController _recentUsersSection](self, "_recentUsersSection") == a3)
  {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController sectionTitles](self, "sectionTitles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a3 - -[LUIClassTableViewController haveRecentUsers](self, "haveRecentUsers")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController collectionControllerDictionary](self, "collectionControllerDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  v5 = objc_msgSend(v9, "numberOfArrangedObjects") != 0;
  return v5;
}

- (void)footerButtonPressed:(id)a3
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController navigationController](self, "navigationController", a3));
  v3 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));

  if (v5 && objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController headerView](self, "headerView"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), "setAlpha:", 1.0);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "frame");
    v72 = v14 + -1.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    objc_msgSend(v15, "frame");
    v73 = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    objc_msgSend(v17, "frame");
    v71 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    objc_msgSend(v19, "frame");
    v70 = v20;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    objc_msgSend(v8, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "superview"));
    objc_msgSend(v21, "convertRect:toView:", v31, v23, v25, v27, v29);
    v69 = v32;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "indexPathForCell:", v6));
    objc_msgSend(v33, "rectForRowAtIndexPath:", v35);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "indexPathForCell:", v7));
    objc_msgSend(v44, "rectForRowAtIndexPath:", v46);
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "superview"));
    objc_msgSend(v55, "convertRect:toView:", v57, v37, v39, v41, v43);
    v59 = v58;

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "superview"));
    objc_msgSend(v60, "convertRect:toView:", v62, v48, v50, v52, v54);
    v64 = v63;
    v65 = (double)(uint64_t)v72;

    v66 = (double)(uint64_t)v73;
    objc_msgSend(v8, "frame");
    v68 = v67;
    if (v6)
      objc_msgSend(v6, "setAlpha:", (v66 - (v59 + -30.0)) / v65 * -1.4 + 1.0);
    if (v7)
      objc_msgSend(v7, "setAlpha:", -(v64 + v65 + 30.0 - (double)(uint64_t)(v71 + v70)) / v65 * 1.4 + 1.0);
    if (v8)
      objc_msgSend(v8, "setAlpha:", -(v66 - v69) / v68 * 1.4 + 1.0);

  }
}

- (void)handleLongPress:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  if (objc_msgSend(v4, "state") == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController tableView](self, "tableView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForRowAtIndexPath:", v11));

      v14 = objc_opt_class(LUIUserTableViewCell);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        v15 = v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserInfoController sharedController](LUIUserInfoController, "sharedController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));

        objc_msgSend(v16, "presentUserInfoForUser:", v17);
      }

    }
    else
    {
      v18 = qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
        sub_10003CA48(v18);
    }

  }
}

- (void)update
{
  -[LUIClassTableViewController reloadRecentUsersIfNeeded](self, "reloadRecentUsersIfNeeded");
}

- (void)presentPasscodeViewControllerForUser:(id)a3 passcodeViewDidAppearAction:(id)a4 passcodeCanceledAction:(id)a5 passcodeEnteredAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[LUIClassTableViewController navigationController](self, "navigationController"));
  +[LUIUserLoginPasswordViewController presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:](LUIUserLoginPasswordViewController, "presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:", v14, v13, v12, v11, v10);

}

- (LKClassProviding)classProvider
{
  return self->_classProvider;
}

- (void)setClassProvider:(id)a3
{
  objc_storeStrong((id *)&self->_classProvider, a3);
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setSectionDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDictionary, a3);
}

- (void)setSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitles, a3);
}

- (NSMutableArray)localUsersByName
{
  return self->_localUsersByName;
}

- (void)setLocalUsersByName:(id)a3
{
  objc_storeStrong((id *)&self->_localUsersByName, a3);
}

- (LKUsers)recentUsers
{
  return self->_recentUsers;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setPrivacyView:(id)a3
{
  objc_storeStrong((id *)&self->_privacyView, a3);
}

- (UIImage)initialMonogramImage
{
  return self->_initialMonogramImage;
}

- (void)setInitialMonogramImage:(id)a3
{
  objc_storeStrong((id *)&self->_initialMonogramImage, a3);
}

- (void)setCollectionControllerDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_collectionControllerDictionary, a3);
}

- (void)setSectionTitlesSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitlesSortDescriptors, a3);
}

- (LUIProgressAnimationProtocol)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (BOOL)firstUpdate
{
  return self->_firstUpdate;
}

- (void)setFirstUpdate:(BOOL)a3
{
  self->_firstUpdate = a3;
}

- (BOOL)haveRecentUsersSection
{
  return self->_haveRecentUsersSection;
}

- (void)setHaveRecentUsersSection:(BOOL)a3
{
  self->_haveRecentUsersSection = a3;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)sectionHeaderLeftSidePadding
{
  return self->_sectionHeaderLeftSidePadding;
}

- (void)setSectionHeaderLeftSidePadding:(double)a3
{
  self->_sectionHeaderLeftSidePadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_sectionTitlesSortDescriptors, 0);
  objc_storeStrong((id *)&self->_collectionControllerDictionary, 0);
  objc_storeStrong((id *)&self->_initialMonogramImage, 0);
  objc_storeStrong((id *)&self->_privacyView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_recentUsers, 0);
  objc_storeStrong((id *)&self->_localUsersByName, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_sectionDictionary, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_classProvider, 0);
}

@end
