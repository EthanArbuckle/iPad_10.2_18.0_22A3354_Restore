@implementation FBAInboxItemsViewController

- (FBAInboxItemsViewController)initWithStyle:(int64_t)a3
{
  FBAInboxItemsViewController *v3;
  FBAInboxItemsViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAInboxItemsViewController;
  v3 = -[FBAInboxItemsViewController initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
    -[FBAInboxItemsViewController commonInit](v3, "commonInit");
  return v4;
}

- (FBAInboxItemsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FBAInboxItemsViewController *v4;
  FBAInboxItemsViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBAInboxItemsViewController;
  v4 = -[FBAInboxItemsViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[FBAInboxItemsViewController commonInit](v4, "commonInit");
  return v5;
}

- (FBAInboxItemsViewController)initWithCoder:(id)a3
{
  FBAInboxItemsViewController *v3;
  FBAInboxItemsViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAInboxItemsViewController;
  v3 = -[FBAInboxItemsViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[FBAInboxItemsViewController commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *sortDescriptors;
  NSMutableArray *v7;
  NSMutableArray *sortedInboxItems;
  _QWORD v9[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("mailboxSortDate"), 0));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("ID"), 0));
  v9[1] = v4;
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  sortDescriptors = self->_sortDescriptors;
  self->_sortDescriptors = v5;

  v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sortedInboxItems = self->_sortedInboxItems;
  self->_sortedInboxItems = v7;

  self->_needsUpdate = 0;
  self->_showingSyntheticInbox = 0;
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBAInboxItemsViewController;
  -[FBAInboxItemsViewController awakeFromNib](&v2, "awakeFromNib");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)FBAInboxItemsViewController;
  -[FBATableViewControler viewDidLoad](&v28, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setEstimatedRowHeight:", 60.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setRowHeight:", UITableViewAutomaticDimension);

  v5 = objc_alloc_init((Class)UIRefreshControl);
  -[FBAInboxItemsViewController setRefreshControl:](self, "setRefreshControl:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController refreshControl](self, "refreshControl"));
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "reloadAppProxy", 4096);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("R"), 1572864, "reloadAppProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = FBKCommonStrings;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REFRESH"), &stru_1000EA660, FBKCommonStrings));
  objc_msgSend(v7, "setDiscoverabilityTitle:", v10);

  -[FBAInboxItemsViewController addKeyCommand:](self, "addKeyCommand:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("F"), 0x100000, "beginSearch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_1000EA660, v9));
  objc_msgSend(v11, "setDiscoverabilityTitle:", v13);

  -[FBAInboxItemsViewController addKeyCommand:](self, "addKeyCommand:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v15 = objc_msgSend(v14, "supportsSelection");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
    objc_msgSend(v16, "setAllowsMultipleSelectionDuringEditing:", 1);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v18 = objc_msgSend(v17, "type");

  if (v18 != (id)3)
  {
    v19 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    -[FBAInboxItemsViewController setSearchController:](self, "setSearchController:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    objc_msgSend(v20, "setDelegate:", self);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    objc_msgSend(v21, "setSearchResultsUpdater:", self);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    objc_msgSend(v22, "setObscuresBackgroundDuringPresentation:", 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "searchBar"));
    objc_msgSend(v24, "setDelegate:", self);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    objc_msgSend(v25, "setHidesNavigationBarDuringPresentation:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v27, "setSearchController:", v26);

    -[FBAInboxItemsViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  }
  -[FBAInboxItemsViewController showToolbarWithStatus:animated:](self, "showToolbarWithStatus:animated:", &stru_1000EA660, 0);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setTeam:(id)a3
{
  void *v5;
  void *v6;
  _TtC18Feedback_Assistant16FBAFilterManager *v7;
  _TtC18Feedback_Assistant16FBAFilterManager *filterManager;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_team, a3);
  if (-[FBAInboxItemsViewController showingSyntheticInbox](self, "showingSyntheticInbox"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKContentItem filterGroupsForAll](FBKContentItem, "filterGroupsForAll"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController team](self, "team"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKContentItem filterGroupsForTeam:](FBKContentItem, "filterGroupsForTeam:", v6));

  }
  v7 = -[FBAFilterManager initWithFilterGroups:]([_TtC18Feedback_Assistant16FBAFilterManager alloc], "initWithFilterGroups:", v5);
  filterManager = self->_filterManager;
  self->_filterManager = v7;

  -[FBAFilterManager setFilterDelegate:](self->_filterManager, "setFilterDelegate:", self);
}

- (void)reloadAppProxy
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  objc_msgSend(v2, "reloadApp");

}

- (void)beginRefresh
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController refreshControl](self, "refreshControl"));
  objc_msgSend(v3, "beginRefreshing");

  -[FBAInboxItemsViewController reloadAppProxy](self, "reloadAppProxy");
}

- (void)beginSearch
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationItem](self, "navigationItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchBar"));
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBAInboxItemsViewController;
  -[FBAInboxItemsViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[FBAInboxItemsViewController removeFBAObservers](self, "removeFBAObservers");
}

- (void)removeFBAObservers
{
  void *v3;
  void *v4;
  NSMutableArray *fbaDataObservers;
  NSMutableArray *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationCenter"));

  fbaDataObservers = self->_fbaDataObservers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022654;
  v8[3] = &unk_1000E6CA0;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](fbaDataObservers, "enumerateObjectsUsingBlock:", v8);
  v6 = self->_fbaDataObservers;
  self->_fbaDataObservers = 0;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  UIBarButtonItem *v15;
  void *v16;
  void *v17;
  UIBarButtonItem *destructiveBarButtonItem;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void **v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  FBAInboxItemsViewController *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];

  v47.receiver = self;
  v47.super_class = (Class)FBAInboxItemsViewController;
  -[FBAInboxItemsViewController viewWillAppear:](&v47, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedRows"));

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v44;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
        objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v10, 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setSeparatorInset:", 0.0, 32.0, 0.0, 0.0);

  -[FBAInboxItemsViewController reloadView](self, "reloadView");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v14 = objc_msgSend(v13, "type") == 0;

  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController editButtonItem](self, "editButtonItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v17, "setRightBarButtonItem:", v16);

    v15 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 16, self, "destroySelectedItems:");
  }
  else
  {
    v15 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 14, self, "destroySelectedItems:");
  }
  destructiveBarButtonItem = self->_destructiveBarButtonItem;
  self->_destructiveBarButtonItem = v15;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationController](self, "navigationController"));
  objc_msgSend(v19, "setToolbarHidden:animated:", 0, 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController fbaDataObservers](self, "fbaDataObservers"));
  if (v20)
    -[FBAInboxItemsViewController removeFBAObservers](self, "removeFBAObservers");
  v22 = (void *)objc_opt_new(NSMutableArray, v21);
  -[FBAInboxItemsViewController setFbaDataObservers:](self, "setFbaDataObservers:", v22);

  objc_initWeak(&location, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController fbaDataObservers](self, "fbaDataObservers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "notificationCenter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100022AF8;
  v40[3] = &unk_1000E6300;
  objc_copyWeak(&v41, &location);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25, "addObserverForName:object:queue:usingBlock:", FBKDidReloadAppNotification, 0, v26, v40));
  objc_msgSend(v23, "addObject:", v27);

  v28 = objc_loadWeakRetained(&location);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "inbox"));
  LOBYTE(v25) = objc_msgSend(v29, "type") == (id)4;

  if ((v25 & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController fbaDataObservers](self, "fbaDataObservers"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mainQueueContext"));
    v34 = _NSConcreteStackBlock;
    v35 = 3221225472;
    v36 = sub_100022B58;
    v37 = &unk_1000E6D78;
    objc_copyWeak(&v39, &location);
    v38 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "addObjectsDidChangeNotificationObserver:", &v34));
    objc_msgSend(v30, "addObject:", v33, v34, v35, v36, v37);

    objc_destroyWeak(&v39);
  }
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

- (void)reloadView
{
  void *v3;
  id v4;
  void *v5;
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
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));

  if (v22
    && (v4 = objc_msgSend(v22, "row"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController activeInboxSource](self, "activeInboxSource")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4 < v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController itemForIndexPath:](self, "itemForIndexPath:", v22));
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController team](self, "team"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inboxItemsForTeam:withSortDescriptors:", v9, self->_sortDescriptors));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
  -[FBAInboxItemsViewController setSortedInboxItems:](self, "setSortedInboxItems:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayText"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v14, "setTitle:", v13);

  -[FBAInboxItemsViewController updateSearchResults](self, "updateSearchResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v15, "reloadData");

  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController activeInboxSource](self, "activeInboxSource"));
    v17 = objc_msgSend(v16, "indexOfObject:", v7);

    if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
      v19 = objc_msgSend(v18, "type");

      if (v19 != (id)3)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v17, 0));
        objc_msgSend(v20, "selectRowAtIndexPath:animated:scrollPosition:", v21, 0, 0);

      }
    }
  }

}

- (void)clearDetail
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController splitViewController](self, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController storyboard](self, "storyboard"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instantiateViewControllerWithIdentifier:", CFSTR("FBAEmptyStack")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v7, "showDetailViewController:sender:", v8, self);

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[2];

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FBAInboxItemsViewController;
  -[FBAInboxItemsViewController setEditing:animated:](&v18, "setEditing:animated:", a3, a4);
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v19[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController destructiveBarButtonItem](self, "destructiveBarButtonItem"));
    v19[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    -[FBAInboxItemsViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v8, 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController destructiveBarButtonItem](self, "destructiveBarButtonItem"));
    objc_msgSend(v9, "setEnabled:", 0);

    v10 = 0.33;
  }
  else
  {
    -[FBAInboxItemsViewController showToolbarWithStatus:animated:](self, "showToolbarWithStatus:animated:", &stru_1000EA660, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterManager](self, "filterManager"));
    -[FBAInboxItemsViewController filterContentForFilterManager:](self, "filterContentForFilterManager:", v11);

    v10 = 1.0;
    if (self->_needsUpdate)
      -[FBAInboxItemsViewController reloadView](self, "reloadView");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationItem](self, "navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchBar"));
  objc_msgSend(v14, "setUserInteractionEnabled:", !v4);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationItem](self, "navigationItem"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchBar"));
  objc_msgSend(v17, "setAlpha:", v10);

}

- (void)destroyItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController itemForIndexPath:](self, "itemForIndexPath:", v4));
  if (objc_msgSend(v5, "itemType") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController activeInboxSource](self, "activeInboxSource"));
    objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v4, "row"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
    v12 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 100);

    -[FBAInboxItemsViewController destroyDraft:](self, "destroyDraft:", v5);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController currDetailIndexPath](self, "currDetailIndexPath"));
  v10 = objc_msgSend(v9, "row");
  v11 = objc_msgSend(v4, "row");

  if (v10 == v11)
    -[FBAInboxItemsViewController clearDetail](self, "clearDetail");

}

- (void)destroySelectedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = (void *)objc_opt_new(NSMutableArray, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedRows"));

  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v6);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController itemForIndexPath:](self, "itemForIndexPath:", v13));
        if (objc_msgSend(v14, "itemType") == (id)1)
          objc_msgSend(v4, "addObject:", v14);
        else
          objc_msgSend(v7, "removeObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100023A08;
  v26[3] = &unk_1000E6CA0;
  v26[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v15, "beginUpdates");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v16, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 100);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v17, "endUpdates");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController splitViewController](self, "splitViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewControllers"));
  v20 = objc_msgSend(v19, "count");

  if (v20 == (id)2)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController currDetailIndexPath](self, "currDetailIndexPath"));
    v22 = objc_msgSend(v7, "containsObject:", v21);

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController storyboard](self, "storyboard"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "instantiateViewControllerWithIdentifier:", CFSTR("FBAEmptyStack")));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController splitViewController](self, "splitViewController"));
      objc_msgSend(v25, "showDetailViewController:sender:", v24, self);

    }
  }
  -[FBAInboxItemsViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);

}

- (void)destroyDraft:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  objc_msgSend(v4, "deleteDraftFromContentItem:dismissViewOnCompletion:", v3, 0);

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;

  v21 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedRow"));

  -[FBAInboxItemsViewController setCurrDetailIndexPath:](self, "setCurrDetailIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController itemForIndexPath:](self, "itemForIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "destinationViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  LODWORD(v9) = objc_msgSend(v11, "isEqualToString:", CFSTR("FBAResponseDetailPresentation"));

  if ((_DWORD)v9)
    goto LABEL_6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("FBAFollowupDetailPresentation"));

  if (v13)
    goto LABEL_6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("FBASurveyDetailPresentation"));

  if (!v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("FBAAnnouncementDetailPresentation"));

    if (!v20)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v10, "setContentItem:", v7);
    goto LABEL_7;
  }
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController team](self, "team"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "teamForItemPreferringTeam:", v17));
  objc_msgSend(v16, "setTeam:", v18);

  objc_msgSend(v16, "setContentItem:", v7);
LABEL_7:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  __CFString **v28;
  __CFString *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController itemForIndexPath:](self, "itemForIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
  v10 = objc_msgSend(v9, "isActive");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchBar"));
    objc_msgSend(v12, "resignFirstResponder");

  }
  if (objc_msgSend(v6, "isEditing"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathsForSelectedRows"));
    v15 = -[NSObject count](v14, "count") != 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController destructiveBarButtonItem](self, "destructiveBarButtonItem"));
    objc_msgSend(v16, "setEnabled:", v15);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
    v18 = objc_msgSend(v17, "type");

    if (v18 == (id)3)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "formResponse"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uploadTask"));
      v21 = objc_msgSend(v20, "localSubmissionStage");

      v22 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDescription"));
        v30 = 138543618;
        v31 = v23;
        v32 = 1024;
        LODWORD(v33) = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "did tap on outbox cell for item [%{public}@] upload task stage [%u]", (uint8_t *)&v30, 0x12u);

      }
      goto LABEL_11;
    }
    v24 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDescription"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updatedAt"));
      v30 = 138543618;
      v31 = v25;
      v32 = 2114;
      v33 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Selected Inbox Item [%{public}@] updated at: [%{public}@]", (uint8_t *)&v30, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    v27 = objc_msgSend(v8, "itemType");
    v28 = &off_1000E7970;
    switch((unint64_t)v27)
    {
      case 0uLL:
        v14 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_10009A0D4(v14);
        break;
      case 1uLL:
      case 5uLL:
        goto LABEL_20;
      case 2uLL:
        v28 = &off_1000E7980;
        goto LABEL_20;
      case 3uLL:
        v28 = &off_1000E7988;
        goto LABEL_20;
      case 4uLL:
        v28 = &off_1000E7978;
LABEL_20:
        v29 = *v28;
        if (!v29)
          goto LABEL_6;
        v14 = v29;
        -[FBAInboxItemsViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", v29, v13);
        break;
      default:
        goto LABEL_6;
    }
  }

LABEL_6:
LABEL_11:

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  if (objc_msgSend(a3, "isEditing"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForSelectedRows"));
    v6 = objc_msgSend(v5, "count") != 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController destructiveBarButtonItem](self, "destructiveBarButtonItem"));
    objc_msgSend(v7, "setEnabled:", v6);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox", a3, a4));
  v5 = objc_msgSend(v4, "supportsSelection");

  return v5;
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox", a3, a4));
  v5 = objc_msgSend(v4, "supportsSelection");

  return v5;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[FBAInboxItemsViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  int64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox", a3, a4));
  v5 = objc_msgSend(v4, "supportsDeletion");

  return v5;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v9 = objc_msgSend(v8, "type") == 0;

  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1000EA660, 0));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100024328;
    v16[3] = &unk_1000E6DA0;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v12, v16));

    v20 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v14));

    objc_destroyWeak(&v18);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", &__NSArray0__struct));
  }
  objc_destroyWeak(&location);

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController activeInboxSource](self, "activeInboxSource", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v9 = objc_msgSend(v8, "type");
  v10 = CFSTR("FBAMailboxItemCell");
  if (v9 == (id)3)
    v10 = CFSTR("FBAOutboxItemCell");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController itemForIndexPath:](self, "itemForIndexPath:", v6));

  v14 = objc_opt_class(FBKEnhancedLoggingSessionInformation);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    v15 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentItem"));

    if (v16)
      objc_msgSend(v12, "updateWithItem:showingTeamName:", v15, -[FBAInboxItemsViewController showingSyntheticInbox](self, "showingSyntheticInbox"));
    else
      objc_msgSend(v12, "updateWithEnhancedLoggingSession:", v15);

  }
  else
  {
    objc_msgSend(v12, "updateWithItem:showingTeamName:", v13, -[FBAInboxItemsViewController showingSyntheticInbox](self, "showingSyntheticInbox"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController inbox](self, "inbox"));
  v18 = objc_msgSend(v17, "type");

  if (v18 == (id)3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formResponse"));

    if (v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formResponse"));
      objc_msgSend(v12, "setObservedResponse:", v20);
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10009A114(v13, v20);
    }

  }
  objc_msgSend(v12, "layoutIfNeeded");

  return v12;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *searchResultItems;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));

    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    v9 = objc_msgSend(v7, "length");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000247A4;
    v22[3] = &unk_1000E6DC8;
    v23 = v8;
    v10 = v8;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController sortedInboxItems](self, "sortedInboxItems"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v11));
    v14 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
    searchResultItems = self->_searchResultItems;
    self->_searchResultItems = v14;

  }
  else
  {
    v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController sortedInboxItems](self, "sortedInboxItems"));
    v17 = self->_searchResultItems;
    self->_searchResultItems = v16;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterManager](self, "filterManager"));
  v19 = objc_msgSend(v18, "active");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterManager](self, "filterManager"));
    -[FBAInboxItemsViewController filterContentForFilterManager:](self, "filterContentForFilterManager:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v21, "reloadData");

}

- (void)didDismissSearchController:(id)a3
{
  -[FBAInboxItemsViewController setSearchResultItems:](self, "setSearchResultItems:", 0);
  -[FBAInboxItemsViewController reloadView](self, "reloadView");
  -[FBAInboxItemsViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)updateSearchResults
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchController](self, "searchController"));
  -[FBAInboxItemsViewController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", v3);

}

- (id)activeInboxSource
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filteredInboxItems](self, "filteredInboxItems"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filteredInboxItems](self, "filteredInboxItems"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterSource](self, "filterSource"));
  return v4;
}

- (id)filterSource
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchResultItems](self, "searchResultItems"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController searchResultItems](self, "searchResultItems"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController sortedInboxItems](self, "sortedInboxItems"));
  return v4;
}

- (id)itemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController activeInboxSource](self, "activeInboxSource"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  return v7;
}

- (unint64_t)newFeedbackButtonState
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController team](self, "team"));
  v3 = objc_msgSend(v2, "canStartNewFeedback");

  if (v3)
    return 2;
  else
    return 1;
}

- (void)createNewFeedback:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController team](self, "team"));
  objc_msgSend(v6, "beginFeedbackForTeam:sender:", v5, v4);

}

- (id)leftToolbarItem
{
  void *v3;
  unsigned int v4;
  BOOL v5;
  const __CFString *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterManager](self, "filterManager"));
  v4 = objc_msgSend(v3, "active");

  v5 = v4 == 0;
  if (v4)
    v6 = CFSTR("DISABLE_FILTER");
  else
    v6 = CFSTR("ENABLE_FILTER");
  v7 = &FBKSystemImageNameFilterActive;
  if (v5)
    v7 = &FBKSystemImageNameFilterInactive;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", *v7));
  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v8, 0, self, "toggleFiltering");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v6, &stru_1000EA660, FBKCommonStrings));
  objc_msgSend(v9, "setAccessibilityLabel:", v11);

  return v9;
}

- (void)toggleFiltering
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterManager](self, "filterManager"));
  objc_msgSend(v2, "toggleActive");

}

- (void)filterContentForFilterManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  FBAInboxItemsViewController *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "active"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterSource](self, "filterSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "predicate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v5));
    v7 = objc_msgSend(v6, "mutableCopy");
    -[FBAInboxItemsViewController setFilteredInboxItems:](self, "setFilteredInboxItems:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FILTERED_BY_PROMPT"), &stru_1000EA660, FBKCommonStrings));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userDescription"));
  }
  else
  {
    -[FBAInboxItemsViewController setFilteredInboxItems:](self, "setFilteredInboxItems:", 0);
    v10 = 0;
    v9 = &stru_1000EA660;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationController](self, "navigationController"));
  v12 = (FBAInboxItemsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));

  if (v12 == self)
    -[FBAInboxItemsViewController showToolbarWithStatus:subtitle:animated:](self, "showToolbarWithStatus:subtitle:animated:", v9, v10, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController tableView](self, "tableView"));
  objc_msgSend(v13, "reloadData");

}

- (void)didTapSubtitleAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v9;

  v9 = -[FBAFilterPickerController initWithStyle:]([_TtC18Feedback_Assistant25FBAFilterPickerController alloc], "initWithStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController filterManager](self, "filterManager"));
  -[FBAFilterPickerController setFilterManager:](v9, "setFilterManager:", v4);

  v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v9);
  objc_msgSend(v5, "setModalPresentationStyle:", 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInboxItemsViewController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toolbar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentationController"));
  objc_msgSend(v8, "setSourceView:", v7);

  -[FBAInboxItemsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (FBAInbox)inbox
{
  return self->_inbox;
}

- (void)setInbox:(id)a3
{
  objc_storeStrong((id *)&self->_inbox, a3);
}

- (FBKTeam)team
{
  return self->_team;
}

- (BOOL)showingSyntheticInbox
{
  return self->_showingSyntheticInbox;
}

- (void)setShowingSyntheticInbox:(BOOL)a3
{
  self->_showingSyntheticInbox = a3;
}

- (NSMutableArray)fbaDataObservers
{
  return self->_fbaDataObservers;
}

- (void)setFbaDataObservers:(id)a3
{
  objc_storeStrong((id *)&self->_fbaDataObservers, a3);
}

- (id)defaultCenterObserver
{
  return self->_defaultCenterObserver;
}

- (void)setDefaultCenterObserver:(id)a3
{
  objc_storeStrong(&self->_defaultCenterObserver, a3);
}

- (NSMutableArray)sortedInboxItems
{
  return self->_sortedInboxItems;
}

- (void)setSortedInboxItems:(id)a3
{
  objc_storeStrong((id *)&self->_sortedInboxItems, a3);
}

- (NSMutableArray)filteredInboxItems
{
  return self->_filteredInboxItems;
}

- (void)setFilteredInboxItems:(id)a3
{
  objc_storeStrong((id *)&self->_filteredInboxItems, a3);
}

- (NSMutableArray)searchResultItems
{
  return self->_searchResultItems;
}

- (void)setSearchResultItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultItems, a3);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (UIBarButtonItem)destructiveBarButtonItem
{
  return self->_destructiveBarButtonItem;
}

- (void)setDestructiveBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_destructiveBarButtonItem, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NSIndexPath)currDetailIndexPath
{
  return self->_currDetailIndexPath;
}

- (void)setCurrDetailIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_currDetailIndexPath, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (_TtC18Feedback_Assistant16FBAFilterManager)filterManager
{
  return self->_filterManager;
}

- (void)setFilterManager:(id)a3
{
  objc_storeStrong((id *)&self->_filterManager, a3);
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_filterManager, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_currDetailIndexPath, 0);
  objc_storeStrong((id *)&self->_destructiveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_searchResultItems, 0);
  objc_storeStrong((id *)&self->_filteredInboxItems, 0);
  objc_storeStrong((id *)&self->_sortedInboxItems, 0);
  objc_storeStrong(&self->_defaultCenterObserver, 0);
  objc_storeStrong((id *)&self->_fbaDataObservers, 0);
  objc_storeStrong((id *)&self->_team, 0);
  objc_storeStrong((id *)&self->_inbox, 0);
}

@end
