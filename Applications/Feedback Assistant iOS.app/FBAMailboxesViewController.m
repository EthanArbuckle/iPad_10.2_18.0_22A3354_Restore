@implementation FBAMailboxesViewController

- (FBAMailboxesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FBAMailboxesViewController *v4;
  FBAMailboxesViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBAMailboxesViewController;
  v4 = -[FBAMailboxesViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[FBAMailboxesViewController commonInit](v4, "commonInit");
  return v5;
}

- (FBAMailboxesViewController)initWithCoder:(id)a3
{
  FBAMailboxesViewController *v3;
  FBAMailboxesViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBAMailboxesViewController;
  v3 = -[FBAMailboxesViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[FBAMailboxesViewController commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  FBKLaunchAction *delayedUrlAction;
  FBKLaunchAction *pendingLaunchAction;
  NSArray *v9;
  NSArray *teamSortDescriptors;
  NSArray *sortedTeams;
  FBACombinedInbox *v12;
  FBADraftsInbox *v13;
  FBASubmittedInbox *v14;
  NSArray *v15;
  NSArray *inboxes;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSArray *v25;
  NSArray *smartMailboxes;
  uint64_t v27;
  _TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *v28;
  _TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *enhancedLoggingInbox;
  _QWORD v30[4];
  _QWORD v31[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    objc_storeWeak((id *)&self->_data, v6);

    self->_isApplyingSnapshot = 0;
    self->_hasLoadedFormItems = 0;
    self->_hasFinishedFirstLoad = 0;
    self->_hideAllInboxes = 1;
    delayedUrlAction = self->_delayedUrlAction;
    self->_delayedUrlAction = 0;

    pendingLaunchAction = self->_pendingLaunchAction;
    self->_pendingLaunchAction = 0;

    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(+[FBKTeam sortDescriptors](FBKTeam, "sortDescriptors"));
    teamSortDescriptors = self->_teamSortDescriptors;
    self->_teamSortDescriptors = v9;

    sortedTeams = self->_sortedTeams;
    self->_sortedTeams = (NSArray *)&__NSArray0__struct;

    self->_isBatchUIEnabled = 0;
    v12 = objc_alloc_init(FBACombinedInbox);
    v31[0] = v12;
    v13 = objc_alloc_init(FBADraftsInbox);
    v31[1] = v13;
    v14 = objc_alloc_init(FBASubmittedInbox);
    v31[2] = v14;
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3));
    inboxes = self->_inboxes;
    self->_inboxes = v15;

    v18 = (void *)objc_opt_new(_TtC18Feedback_Assistant15FBARecentsInbox, v17);
    v30[0] = v18;
    v20 = (void *)objc_opt_new(_TtC18Feedback_Assistant16FBARequestsInbox, v19);
    v30[1] = v20;
    v22 = (void *)objc_opt_new(_TtC18Feedback_Assistant11FBAAllInbox, v21);
    v30[2] = v22;
    v24 = (void *)objc_opt_new(_TtC18Feedback_Assistant21FBAAnnouncementsInbox, v23);
    v30[3] = v24;
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
    smartMailboxes = self->_smartMailboxes;
    self->_smartMailboxes = v25;

    v28 = (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *)objc_opt_new(_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox, v27);
    enhancedLoggingInbox = self->_enhancedLoggingInbox;
    self->_enhancedLoggingInbox = v28;

  }
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAMailboxesViewController;
  -[FBAMailboxesViewController awakeFromNib](&v5, "awakeFromNib");
  -[FBAMailboxesViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

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
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[4];
  id v85;
  id location;
  objc_super v87;

  v87.receiver = self;
  v87.super_class = (Class)FBAMailboxesViewController;
  -[FBAMailboxesViewController viewDidLoad](&v87, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v5)
  {
    objc_initWeak(&location, self);
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10002B270;
    v84[3] = &unk_1000E7068;
    objc_copyWeak(&v85, &location);
    -[FBAMailboxesViewController shouldShowBatchUIWithCompletion:](self, "shouldShowBatchUIWithCompletion:", v84);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 32.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", FBKSystemImageNameSettings, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton systemButtonWithImage:target:action:](UIButton, "systemButtonWithImage:target:action:", v7, self, "showSettings"));

    objc_msgSend(v8, "setEnabled:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "_setLargeTitleAccessoryView:alignToBaseline:", v8, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topViewController"));
    -[FBAMailboxesViewController setDetailViewController:](self, "setDetailViewController:", v13);

    -[FBAMailboxesViewController showLoadingView](self, "showLoadingView");
    v15 = (void *)objc_opt_new(NSMutableArray, v14);
    -[FBAMailboxesViewController setFbaDataObservers:](self, "setFbaDataObservers:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10002B2D0;
    v83[3] = &unk_1000E7090;
    v83[4] = self;
    v18 = objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", FBKUserDidLogInNotification, 0, v17, v83);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10002B420;
    v82[3] = &unk_1000E7090;
    v82[4] = self;
    v21 = objc_msgSend(v19, "addObserverForName:object:queue:usingBlock:", CFSTR("FBADidDismissLegalAgreementNotification"), 0, v20, v82);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController fbaDataObservers](self, "fbaDataObservers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "notificationCenter"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v67 = v8;
    v26 = FBKDidRefreshContentItemsNotification;
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10002B428;
    v80[3] = &unk_1000E6300;
    objc_copyWeak(&v81, &location);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "addObserverForName:object:queue:usingBlock:", v26, 0, v25, v80));
    objc_msgSend(v22, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController fbaDataObservers](self, "fbaDataObservers"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "notificationCenter"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v32 = FBKDidRefreshFormStubsNotification;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_10002B474;
    v78[3] = &unk_1000E6300;
    objc_copyWeak(&v79, &location);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "addObserverForName:object:queue:usingBlock:", v32, 0, v31, v78));
    objc_msgSend(v28, "addObject:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v36 = FBKUserDidLogOutNotification;
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10002B548;
    v76[3] = &unk_1000E70B8;
    v76[4] = self;
    objc_copyWeak(&v77, &location);
    v37 = objc_msgSend(v34, "addObserverForName:object:queue:usingBlock:", v36, 0, v35, v76);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController fbaDataObservers](self, "fbaDataObservers"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "notificationCenter"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v42 = FBKLocalDataDidChangeNotification;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_10002B5A8;
    v74[3] = &unk_1000E6300;
    objc_copyWeak(&v75, &location);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "addObserverForName:object:queue:usingBlock:", v42, 0, v41, v74));
    objc_msgSend(v38, "addObject:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController fbaDataObservers](self, "fbaDataObservers"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "notificationCenter"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v48 = FBKFormUploadStatusChangeNotification;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10002B5D4;
    v72[3] = &unk_1000E6300;
    objc_copyWeak(&v73, &location);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "addObserverForName:object:queue:usingBlock:", v48, 0, v47, v72));
    objc_msgSend(v44, "addObject:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v52 = FBKUserIsLoggingOutNotification;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10002B600;
    v70[3] = &unk_1000E6300;
    objc_copyWeak(&v71, &location);
    v53 = objc_msgSend(v50, "addObserverForName:object:queue:usingBlock:", v52, 0, v51, v70);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController fbaDataObservers](self, "fbaDataObservers"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "notificationCenter"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v58 = FBKUserNoProgramsNotification;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10002B6D0;
    v68[3] = &unk_1000E6300;
    objc_copyWeak(&v69, &location);
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "addObserverForName:object:queue:usingBlock:", v58, 0, v57, v68));
    objc_msgSend(v54, "addObject:", v59);

    v61 = (void *)objc_opt_new(UIRefreshControl, v60);
    objc_msgSend(v61, "addTarget:action:forControlEvents:", self, "beginPullToRefresh", 4096);
    objc_storeStrong((id *)&self->_refreshControl, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
    objc_msgSend(v62, "setRefreshControl:", v61);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
    objc_msgSend(v63, "setAlwaysBounceVertical:", 1);

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("R"), 1572864, "reloadApp"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("REFRESH"), &stru_1000EA660, FBKCommonStrings));
    objc_msgSend(v64, "setDiscoverabilityTitle:", v66);

    -[FBAMailboxesViewController addKeyCommand:](self, "addKeyCommand:", v64);
    -[FBAMailboxesViewController configureCollectionView](self, "configureCollectionView");

    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v81);

    objc_destroyWeak(&v85);
    objc_destroyWeak(&location);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FBAMailboxesViewController;
  -[FBAMailboxesViewController viewWillAppear:](&v12, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController presentedViewController](self, "presentedViewController"));
  v5 = objc_opt_class(UIAlertController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[FBAMailboxesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForSelectedItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v10, 0);

  -[FBAMailboxesViewController applySnapshot](self, "applySnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBAMailboxesViewController;
  -[FBAMailboxesViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
  v5 = objc_msgSend(v4, "isReloadingContentAndFormItems");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOADING_ELLIPSES"), &stru_1000EA660, 0));
    -[FBAMailboxesViewController resumeSpinnerWithStatus:userInteractionEnabled:](self, "resumeSpinnerWithStatus:userInteractionEnabled:", v7, 1);

  }
  else
  {
    -[FBAMailboxesViewController hideSpinner](self, "hideSpinner");
  }
  -[FBAMailboxesViewController runDelayedUrlActionIfNeeded](self, "runDelayedUrlActionIfNeeded");
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
        objc_msgSend(v10, "reduceToFault:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)FBAMailboxesViewController;
  -[FBAMailboxesViewController didReceiveMemoryWarning](&v11, "didReceiveMemoryWarning");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *fbaDataObservers;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notificationCenter"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController fbaDataObservers](self, "fbaDataObservers"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002BB2C;
  v10[3] = &unk_1000E6CA0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:", self);

  fbaDataObservers = self->_fbaDataObservers;
  self->_fbaDataObservers = 0;

  v9.receiver = self;
  v9.super_class = (Class)FBAMailboxesViewController;
  -[FBAMailboxesViewController dealloc](&v9, "dealloc");
}

- (void)configureCollectionView
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
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setDelegate:", self);

  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController makeCompositionalLayout](self, "makeCompositionalLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setCollectionViewLayout:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(UICollectionViewCell), CFSTR("batch-ui-row"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController headerRegistration](self, "headerRegistration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController footerRegistration](self, "footerRegistration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController listCellRegistration](self, "listCellRegistration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController composeCellRegistration](self, "composeCellRegistration"));
  v13 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController collectionView](self, "collectionView"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002BDF4;
  v24[3] = &unk_1000E70E0;
  v24[4] = self;
  objc_copyWeak(&v27, &location);
  v15 = v11;
  v25 = v15;
  v16 = v12;
  v26 = v16;
  v17 = objc_msgSend(v13, "initWithCollectionView:cellProvider:", v14, v24);
  -[FBAMailboxesViewController setDiffableDataSource:](self, "setDiffableDataSource:", v17);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002C068;
  v21[3] = &unk_1000E7108;
  v18 = v9;
  v22 = v18;
  v19 = v10;
  v23 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v20, "setSupplementaryViewProvider:", v21);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (id)makeCompositionalLayout
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C1C4;
  v6[3] = &unk_1000E7130;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v4 = objc_msgSend(v3, "initWithSectionProvider:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)headerRegistration
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_opt_class(_TtC18Feedback_Assistant21FBATeamListHeaderView);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C7D0;
  v6[3] = &unk_1000E7158;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v3, UICollectionElementKindSectionHeader, v6));
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)footerRegistration
{
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_opt_class(UICollectionViewListCell);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002C974;
  v6[3] = &unk_1000E7180;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v3, UICollectionElementKindSectionFooter, v6));
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (id)listCellRegistration
{
  UICollectionViewCellRegistration *v2;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CB24;
  v4[3] = &unk_1000E71A8;
  v4[4] = self;
  v2 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(UICollectionViewListCell), v4);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)composeCellRegistration
{
  UICollectionViewCellRegistration *v2;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002CDD0;
  v4[3] = &unk_1000E71A8;
  v4[4] = self;
  v2 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(UICollectionViewListCell), v4);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FBAMailboxesViewController *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(v17, "deselectItemAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController diffableDataSource](self, "diffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifierForIndex:", objc_msgSend(v6, "section")));

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("smart-mailbox")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController smartMailboxes](self, "smartMailboxes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    v11 = self;
LABEL_5:
    -[FBAMailboxesViewController performSegueWithIdentifier:sender:](v11, "performSegueWithIdentifier:sender:", CFSTR("FBAInboxItemsPresentation"), v10);

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("enhanced-logging-section")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController enhancedLoggingInbox](self, "enhancedLoggingInbox"));
    v11 = self;
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("batch-ui-section")))
  {
    -[FBAMailboxesViewController showBatchUIWithAction:](self, "showBatchUIWithAction:", 0);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController teamForIndexPath:](self, "teamForIndexPath:", v6));
    v13 = objc_msgSend(v6, "row");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController inboxes](self, "inboxes"));
    v15 = objc_msgSend(v14, "count");

    if (v13 >= v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cellForItemAtIndexPath:", v6));
      -[FBAMailboxesViewController beginBugForTeam:sender:](self, "beginBugForTeam:sender:", v12, v16);

    }
    else
    {
      -[FBAMailboxesViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBAInboxItemsPresentation"), v6);
    }

  }
LABEL_6:

}

- (id)makeSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v35;
  FBAMailboxesViewController *v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  void *v48;
  _BYTE v49[128];
  void *v50;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;

  v3 = (void *)objc_opt_new(NSDiffableDataSourceSnapshot, a2);
  if (!-[FBAMailboxesViewController hideAllInboxes](self, "hideAllInboxes"))
  {
    v60 = CFSTR("smart-mailbox");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController smartMailboxes](self, "smartMailboxes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("diffableIdentifier")));
    objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, CFSTR("smart-mailbox"));

    if (-[FBAMailboxesViewController isBatchUIEnabled](self, "isBatchUIEnabled"))
    {
      v59 = CFSTR("batch-ui-section");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
      objc_msgSend(v3, "appendSectionsWithIdentifiers:", v7);

      v58 = CFSTR("batch-ui-row");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
      objc_msgSend(v3, "appendItemsWithIdentifiers:", v8);

    }
    if (-[FBAMailboxesViewController showsEnhancedLoggingSection](self, "showsEnhancedLoggingSection"))
    {
      v57 = CFSTR("enhanced-logging-section");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1));
      objc_msgSend(v3, "appendSectionsWithIdentifiers:", v9);

      v56 = CFSTR("enhanced-logging-row");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
      objc_msgSend(v3, "appendItemsWithIdentifiers:", v10);

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v44;
      v36 = self;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(obj);
          v12 = *(__CFString **)(*((_QWORD *)&v43 + 1) + 8 * v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString ID](v12, "ID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));

          if (!v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

            v16 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v17 = CFSTR("(null)");
              if (v12)
                v17 = v12;
              v52 = v17;
              v53 = 2114;
              v54 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Team [%{public}@] is missing ID, using a placeholder ID [%{public}@].", buf, 0x16u);
            }

          }
          v38 = v11;
          v50 = v14;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
          objc_msgSend(v3, "appendSectionsWithIdentifiers:", v18);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController inboxes](self, "inboxes"));
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v40 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
                if (v12)
                  v25 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "unreadCountForTeam:", v12);
                else
                  v25 = 0;
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "diffableIdentifier"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Team%@-%@-%lu"), v14, v26, v25));

                v48 = v27;
                v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
                objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v28, v14);

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            }
            while (v21);
          }

          v29 = -[__CFString canStartNewFeedback](v12, "canStartNewFeedback");
          v30 = CFSTR("disabled");
          if (v29)
            v30 = CFSTR("enabled");
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Team%@-Compose-%@"), v14, v30));
          v47 = v31;
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
          objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v32, v14);

          v11 = v38 + 1;
          self = v36;
        }
        while ((id)(v38 + 1) != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v37);
    }

  }
  return v3;
}

- (void)applySnapshotAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id buf[2];
  _QWORD v15[5];
  BOOL v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (!v7)
  {
    if (-[FBAMailboxesViewController isApplyingSnapshot](self, "isApplyingSnapshot"))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Already updating UI in mailboxes. Will defer to next run loop", (uint8_t *)buf, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002D944;
      v15[3] = &unk_1000E6680;
      v15[4] = self;
      v16 = v3;
      objc_msgSend(v9, "addOperationWithBlock:", v15);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController makeSnapshot](self, "makeSnapshot"));
      v10 = objc_initWeak(buf, self);
      -[FBAMailboxesViewController setIsApplyingSnapshot:](self, "setIsApplyingSnapshot:", 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController diffableDataSource](self, "diffableDataSource"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10002D954;
      v12[3] = &unk_1000E6328;
      objc_copyWeak(&v13, buf);
      objc_msgSend(v11, "applySnapshot:animatingDifferences:completion:", v9, v3, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }

  }
}

- (void)applySnapshot
{
  -[FBAMailboxesViewController applySnapshotAnimated:](self, "applySnapshotAnimated:", 0);
}

- (BOOL)hasContentItemsToShow
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentItems"));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)updateUI
{
  -[FBAMailboxesViewController updateUIAnimated:](self, "updateUIAnimated:", 0);
}

- (void)updateUIAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  const char *v22;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v22 = "-[FBAMailboxesViewController updateUIAnimated:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "teamsContainingContent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pendingConsents"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pendingConsents"));
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        -[FBAMailboxesViewController showLoadingView](self, "showLoadingView");
        -[FBAMailboxesViewController setHasFinishedFirstLoad:](self, "setHasFinishedFirstLoad:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10002DCA4;
        v20[3] = &unk_1000E61B8;
        v20[4] = self;
        objc_msgSend(v15, "drainAndPresentConsentsWithCompletion:", v20);

        goto LABEL_14;
      }
    }
    else
    {

    }
    if (-[NSObject count](v8, "count"))
    {
      -[FBAMailboxesViewController hideLoadingView](self, "hideLoadingView");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController teamSortDescriptors](self, "teamSortDescriptors"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sortedArrayUsingDescriptors:](v8, "sortedArrayUsingDescriptors:", v16));
      -[FBAMailboxesViewController setSortedTeams:](self, "setSortedTeams:", v17);

      if (-[FBAMailboxesViewController isViewLoaded](self, "isViewLoaded"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));

        if (v19)
          -[FBAMailboxesViewController applySnapshotAnimated:](self, "applySnapshotAnimated:", v3);
      }
    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "user is nil, no teams", buf, 2u);
    }
  }
LABEL_14:

}

- (unint64_t)newFeedbackButtonState
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST")));

  if (v4)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));

  if (v7 && objc_msgSend(v7, "didFetchFormStubs"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "teams", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      v5 = 1;
LABEL_7:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "didFetchFormItems"))
          break;
        if (v10 == (id)++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v10)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v5 = 2;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)createNewFeedback:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
  v5 = objc_msgSend(v4, "count");

  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    -[FBAMailboxesViewController beginBugForTeam:sender:](self, "beginBugForTeam:sender:", v7, v8);

  }
  else
  {
    -[FBAMailboxesViewController beginBugForTeam:sender:](self, "beginBugForTeam:sender:", 0, v8);
  }

}

- (void)_beginBugForTeam:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bugFormStubs"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[FBAMailboxesViewController presentNonParticipantView](self, "presentNonParticipantView");
  v11 = DEDDevicePlatformiOS;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBKGroupedDevice currentGroupedDevice](FBKGroupedDevice, "currentGroupedDevice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "build"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "forms"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBKBugFormStub bugFormStubsMatchingBuild:forPlatform:withStubs:](FBKBugFormStub, "bugFormStubsMatchingBuild:forPlatform:withStubs:", v13, v11, v14));

  if (objc_msgSend(v15, "count") == (id)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
    v17 = (_TtC18Feedback_Assistant26FBABugFormPickerController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "preferredTeamForStubPreferringTeam:", v26));
    -[FBAMailboxesViewController tryLaunchingDraft:orStub:forTeam:withSender:](self, "tryLaunchingDraft:orStub:forTeam:withSender:", 0, v16, v17, v6);
  }
  else
  {
    if (v26)
      v18 = objc_claimAutoreleasedReturnValue(+[FBKBugFormStub predicateForTeam:](FBKBugFormStub, "predicateForTeam:", v26));
    else
      v18 = objc_claimAutoreleasedReturnValue(+[FBKBugFormStub predicateForAllStubs](FBKBugFormStub, "predicateForAllStubs"));
    v16 = (void *)v18;
    v17 = -[FBABugFormPickerController initWithStubsPredicate:]([_TtC18Feedback_Assistant26FBABugFormPickerController alloc], "initWithStubsPredicate:", v18);
    -[FBABugFormPickerController setPickerDelegate:](v17, "setPickerDelegate:", self);
    -[FBABugFormPickerController setTeam:](v17, "setTeam:", v26);
    v19 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v17);
    objc_msgSend(v19, "setModalPresentationStyle:", 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction"));
      objc_msgSend(v19, "setModalInPresentation:", objc_msgSend(v21, "isCaptive"));

    }
    else
    {
      objc_msgSend(v19, "setModalInPresentation:", 0);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "popoverPresentationController"));
    objc_msgSend(v22, "setPermittedArrowDirections:", 2);
    v23 = objc_opt_class(UIBarButtonItem);
    if ((objc_opt_isKindOfClass(v6, v23) & 1) != 0)
    {
      objc_msgSend(v22, "setBarButtonItem:", v6);
    }
    else
    {
      objc_msgSend(v22, "setSourceView:", v6);
      objc_msgSend(v6, "bounds");
      objc_msgSend(v22, "setSourceRect:");
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormPickerController view](v17, "view"));
    objc_msgSend(v25, "setTintColor:", v24);

    -[FBAMailboxesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
  }

}

- (void)beginBugForTeam:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
  v10 = objc_msgSend(v9, "hasForms");

  if ((v10 & 1) == 0)
    -[FBAMailboxesViewController presentNonParticipantView](self, "presentNonParticipantView");
  if (v6
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "forms")),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v12 == (id)1))
  {
    v13 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v18 = 138412290;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Launching new draft for 1 team [%@] with one form", (uint8_t *)&v18, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "forms"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
    -[FBAMailboxesViewController tryLaunchingDraft:orStub:forTeam:withSender:](self, "tryLaunchingDraft:orStub:forTeam:withSender:", 0, v16, v6, v7);

  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Launching new draft. Will show form picker ", (uint8_t *)&v18, 2u);
    }

    -[FBAMailboxesViewController _beginBugForTeam:sender:](self, "_beginBugForTeam:sender:", v6, v7);
  }

}

- (void)tryLaunchingDraft:(id)a3 orStub:(id)a4 forTeam:(id)a5 withSender:(id)a6
{
  -[FBAMailboxesViewController tryLaunchingDraft:orStub:orBugForm:forTeam:withSender:](self, "tryLaunchingDraft:orStub:orBugForm:forTeam:withSender:", a3, a4, 0, a5, a6);
}

- (void)tryLaunchingDraft:(id)a3 orStub:(id)a4 orBugForm:(id)a5 forTeam:(id)a6 withSender:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FBAMailboxesViewController *v17;
  unint64_t v18;
  id v19;
  unint64_t v20;
  id v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  FBAMailboxesViewController *v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10002E5DC;
  v34[4] = sub_10002E5EC;
  v17 = self;
  v35 = v17;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002E5F4;
  v28[3] = &unk_1000E71F8;
  v28[4] = v17;
  v18 = (unint64_t)v13;
  v29 = (id)v18;
  v19 = v12;
  v30 = v19;
  v20 = (unint64_t)v14;
  v31 = (id)v20;
  v21 = v15;
  v32 = v21;
  v33 = v34;
  v22 = objc_retainBlock(v28);
  v23 = v22;
  if (v19)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](v17, "data"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002E740;
    v26[3] = &unk_1000E7220;
    v27 = v23;
    objc_msgSend(v24, "bugFormFromForDraftItem:withCompletion:", v19, v26);

    v25 = v27;
  }
  else
  {
    if (v18 | v20)
    {
      ((void (*)(_QWORD *))v22[2])(v22);
      goto LABEL_7;
    }
    v25 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_10009A3BC();
  }

LABEL_7:
  _Block_object_dispose(v34, 8);

}

- (void)beginPullToRefresh
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E7C8;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  -[FBAMailboxesViewController reloadApp](self, "reloadApp");
}

- (void)reloadApp
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reloading", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOADING_ELLIPSES"), &stru_1000EA660, 0));
  -[FBAMailboxesViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v5, 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E908;
  v7[3] = &unk_1000E7248;
  v7[4] = self;
  objc_msgSend(v6, "reloadAllContentWithCompletion:", v7);

}

- (void)didReloadApp
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did reload", buf, 2u);
  }

  -[FBAMailboxesViewController updateUI](self, "updateUI");
  -[FBAMailboxesViewController hideSpinner](self, "hideSpinner");
  -[FBAMailboxesViewController runDelayedUrlActionIfNeeded](self, "runDelayedUrlActionIfNeeded");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EADC;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  if (qword_100118110 != -1)
    dispatch_once(&qword_100118110, block);
}

- (BOOL)showsEnhancedLoggingSection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FBKEnhancedLoggingPersistence sharedInstance](FBKEnhancedLoggingPersistence, "sharedInstance"));
  v3 = objc_msgSend(v2, "hasLoggingSessions");

  return v3;
}

- (id)teamForSection:(int64_t)a3
{
  unsigned int v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = -[FBAMailboxesViewController showsEnhancedLoggingSection](self, "showsEnhancedLoggingSection");
  v6 = -2;
  if (!v5)
    v6 = -1;
  v7 = v6 + a3 - -[FBAMailboxesViewController isBatchUIEnabled](self, "isBatchUIEnabled");
  if (v7 < 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams")),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7 >= (unint64_t)v9))
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v7));

  }
  return v11;
}

- (int64_t)sectionForTeam:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t result;
  unsigned int v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = -[FBAMailboxesViewController showsEnhancedLoggingSection](self, "showsEnhancedLoggingSection");
    return (int64_t)v6 + v8 + -[FBAMailboxesViewController isBatchUIEnabled](self, "isBatchUIEnabled") + 1;
  }
  return result;
}

- (id)teamForIndexPath:(id)a3
{
  return -[FBAMailboxesViewController teamForSection:](self, "teamForSection:", objc_msgSend(a3, "section"));
}

- (void)beginFeedbackForSurvey:(id)a3 forTeam:(id)a4
{
  -[FBAMailboxesViewController tryLaunchingDraft:orStub:orBugForm:forTeam:withSender:](self, "tryLaunchingDraft:orStub:orBugForm:forTeam:withSender:", 0, 0, a3, a4, 0);
}

- (void)beginFeedbackWithDraftItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleTeam"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController composeFeedbackToolbarItem](self, "composeFeedbackToolbarItem"));
  -[FBAMailboxesViewController tryLaunchingDraft:orStub:forTeam:withSender:](self, "tryLaunchingDraft:orStub:forTeam:withSender:", v4, 0, v6, v5);

}

- (void)respondToUrlAction:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "launchesFeedback"))
  {
    -[FBAMailboxesViewController launchFeedbackDraftWithUrlAction:](self, "launchFeedbackDraftWithUrlAction:", v4);
  }
  else if (objc_msgSend(v4, "launchesSurvey"))
  {
    -[FBAMailboxesViewController launchSurveyWithUrlAction:](self, "launchSurveyWithUrlAction:", v4);
  }
  else if (objc_msgSend(v4, "launchesInbox"))
  {
    -[FBAMailboxesViewController launchInboxWithLaunchAction:](self, "launchInboxWithLaunchAction:", v4);
  }
  else if (objc_msgSend(v4, "launchesBatchUI"))
  {
    -[FBAMailboxesViewController showBatchUIWithAction:](self, "showBatchUIWithAction:", v4);
  }
  else
  {
    -[FBAMailboxesViewController showItemWithUrlAction:](self, "showItemWithUrlAction:", v4);
  }

}

- (void)runDelayedUrlActionIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int v13;
  NSObject *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10009A45C(self, v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
    v6 = objc_msgSend(v5, "showsItem");

    v7 = objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
    v8 = v7;
    if (v6)
    {
      -[FBAMailboxesViewController showItemWithUrlAction:](self, "showItemWithUrlAction:", v7);
LABEL_18:

      return;
    }
    if (-[NSObject launchesFeedback](v7, "launchesFeedback"))
    {
      v9 = -[FBAMailboxesViewController newFeedbackButtonState](self, "newFeedbackButtonState");

      if (v9 == 2)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
        -[FBAMailboxesViewController launchFeedbackDraftWithUrlAction:](self, "launchFeedbackDraftWithUrlAction:", v8);
        goto LABEL_18;
      }
    }
    else
    {

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
    v11 = objc_msgSend(v10, "launchesSurvey");

    v12 = objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
    v8 = v12;
    if (v11)
    {
      -[FBAMailboxesViewController launchSurveyWithUrlAction:](self, "launchSurveyWithUrlAction:", v12);
    }
    else
    {
      v13 = -[NSObject launchesInbox](v12, "launchesInbox");

      v14 = objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
      v8 = v14;
      if (v13)
      {
        -[FBAMailboxesViewController launchInboxWithLaunchAction:](self, "launchInboxWithLaunchAction:", v14);
      }
      else
      {
        v15 = -[NSObject launchesBatchUI](v14, "launchesBatchUI");

        if (v15)
        {
          v8 = objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController delayedUrlAction](self, "delayedUrlAction"));
          -[FBAMailboxesViewController showBatchUIWithAction:](self, "showBatchUIWithAction:", v8);
        }
        else
        {
          v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            sub_10009A3E8(v8, v16, v17);
        }
      }
    }
    goto LABEL_18;
  }
}

- (BOOL)canLaunchFeedbackDraft
{
  void *v3;
  void *v4;
  uint64_t v5;
  int isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topMostController"));

  v5 = objc_opt_class(iFBALegalViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  if (-[FBAMailboxesViewController isViewLoaded](self, "isViewLoaded"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
      if ((objc_msgSend(v9, "isRefreshingForms") & 1) != 0)
        LOBYTE(v10) = 0;
      else
        v10 = -[FBAMailboxesViewController hasLoadedFormItems](self, "hasLoadedFormItems") & (isKindOfClass ^ 1);

    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)canLaunchSurveyDraft
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (!-[FBAMailboxesViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  if (v4 && -[FBAMailboxesViewController hasFinishedFirstLoad](self, "hasFinishedFirstLoad"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentItems"));
    v8 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canShowItems
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[FBAMailboxesViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = v4 != 0;

  return v5;
}

- (BOOL)canShowBatchUIWithAction:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = -[FBAMailboxesViewController isViewLoaded](self, "isViewLoaded");
  if (v4)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
      if (v7)
        v8 = -[FBAMailboxesViewController hasFinishedFirstLoad](self, "hasFinishedFirstLoad");
      else
        v8 = 0;
      goto LABEL_9;
    }
  }
  else if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = v7 != 0;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (void)showItemWithUrlAction:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  FBAMailboxesViewController *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  id v32;

  v4 = a3;
  v5 = -[FBAMailboxesViewController canShowItems](self, "canShowItems");
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Executing show url action [%{public}@]", buf, 0xCu);
    }

    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", 0);
    if ((objc_msgSend(v4, "isFFUAction") & 1) != 0
      || (objc_msgSend(v4, "isShowContentItemAction") & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentItems"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10002F648;
      v29[3] = &unk_1000E6E10;
      v11 = v4;
      v30 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ded_findWithBlock:", v29));

      if (v12)
      {
        if (objc_msgSend(v11, "isShowContentItemAction"))
        {
          -[FBAMailboxesViewController setPendingItemToShow:](self, "setPendingItemToShow:", v12);
          -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController inboxes](self, "inboxes"));
          v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", &stru_1000E7288);

          if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "singleTeam"));
            v20 = -[FBAMailboxesViewController sectionForTeam:](self, "sectionForTeam:", v19);

            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v14, v20));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
            LOBYTE(v20) = objc_msgSend(v22, "isCollapsed");

            if ((v20 & 1) == 0)
              -[FBAMailboxesViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBAInboxItemsPresentation"), v21);
            -[FBAMailboxesViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBAFollowupDetailPresentation"), self);

            goto LABEL_21;
          }
          v15 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_10009A538();
        }
        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10002F700;
          v28[3] = &unk_1000E61B8;
          v28[4] = self;
          v17 = objc_retainBlock(v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10002F88C;
          v23[3] = &unk_1000E7320;
          v24 = v11;
          v27 = v17;
          v25 = v12;
          v26 = self;
          v15 = v17;
          objc_msgSend(v18, "getFeedbackForContentItem:completion:", v25, v23);

        }
      }
      else
      {
        v15 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10009A4D8();
      }

LABEL_21:
      goto LABEL_22;
    }
    v16 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10009A564();

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Delaying show url action [%{public}@]", buf, 0xCu);
    }

    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", v4);
  }
LABEL_22:

}

- (void)launchInboxWithLaunchAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;

  v4 = a3;
  if (-[FBAMailboxesViewController canShowItems](self, "canShowItems"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    if (!v6)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10009A728();
      goto LABEL_14;
    }
    if (!-[FBAMailboxesViewController userIsEnrolledInAnySeedingProgram](self, "userIsEnrolledInAnySeedingProgram"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v9 = -[FBAMailboxesViewController sectionForTeam:](self, "sectionForTeam:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController inboxes](self, "inboxes"));
      v11 = objc_msgSend(v10, "indexOfObjectPassingTest:", &stru_1000E7340);

      if (v11 != (id)0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, v9));
        -[FBAMailboxesViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBAInboxItemsPresentation"), v12);

        goto LABEL_15;
      }
      v14 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10009A754();
LABEL_14:

    }
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138543362;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Delaying inbox action [%{public}@]", (uint8_t *)&v15, 0xCu);
    }

    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", v4);
  }
LABEL_15:

}

- (void)launchSurveyWithUrlAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;

  v4 = a3;
  if (-[FBAMailboxesViewController canLaunchSurveyDraft](self, "canLaunchSurveyDraft"))
  {
    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", 0);
    v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Executing launch url action [%{public}@]", buf, 0xCu);
    }

    if ((objc_msgSend(v4, "launchesSurvey") & 1) != 0)
    {
      -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentItems"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100030110;
      v21[3] = &unk_1000E6E10;
      v9 = v4;
      v22 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ded_findWithBlock:", v21));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultTeam"));

      v13 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found survey content item without reload", buf, 2u);
        }

        -[FBAMailboxesViewController reallyLaunchSurveyWithUrlAction:team:surveyItem:](self, "reallyLaunchSurveyWithUrlAction:team:surveyItem:", v9, v12, v10);
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Targeted survey not found. Will load content items", buf, 2u);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000301A8;
        v18[3] = &unk_1000E7368;
        v18[4] = self;
        v19 = v9;
        v20 = v12;
        objc_msgSend(v17, "reloadItems:completion:", v20, v18);

      }
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_10009A7D0(v16);

    }
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Delaying survey launch url action [%{public}@]", buf, 0xCu);
    }

    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", v4);
  }

}

- (void)reallyLaunchSurveyWithUrlAction:(id)a3 team:(id)a4 surveyItem:(id)a5
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
  FBAMailboxesViewController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100030484;
  v15[3] = &unk_1000E7390;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v11, "refreshSurveyFromContentItem:forTeam:completion:", v13, v12, v15);

}

- (void)showTargetedSurveyLoadErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SURVEY_LOAD_ERROR_TITLE"), &stru_1000EA660, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SURVEY_LOAD_ERROR_MESSAGE"), &stru_1000EA660, 0));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, &stru_1000E73B0));
  objc_msgSend(v10, "addAction:", v9);

  -[FBAMailboxesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)showTargetedFeedbackLoadErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("GENERIC_DRAFT_LOAD_ERROR_TITLE"), &stru_1000EA660, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GENERIC_DRAFT_LOAD_ERROR_MESSAGE"), &stru_1000EA660, 0));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, &stru_1000E73D0));
  objc_msgSend(v10, "addAction:", v9);

  -[FBAMailboxesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)launchFeedbackDraftWithUrlAction:(id)a3
{
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  FBAMailboxesViewController *v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;

  v4 = a3;
  v5 = -[FBAMailboxesViewController canLaunchFeedbackDraft](self, "canLaunchFeedbackDraft");
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      v48 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Executing launch url action [%{public}@]", buf, 0xCu);
    }

    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultTeam"));

    if (!objc_msgSend(v4, "launchesFeedback"))
      goto LABEL_33;
    -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formIdentifier"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bugFormStubs"));
      objc_msgSend(v4, "findExactMatchFormStubAndTeamWithFormStubs:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exactMatchFormStub"));
      if (v14)
      {
        v15 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exactMatchFormStub"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ID"));
          v19 = objc_msgSend(v18, "intValue");
          *(_DWORD *)buf = 138543618;
          v48 = v16;
          v49 = 1024;
          LODWORD(v50) = v19;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "URL Action with formIdentifier [%{public}@] matched formStub [%i]", buf, 0x12u);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exactMatchFormStub"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "teamForExactMatchFormStub"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController composeFeedbackToolbarItem](self, "composeFeedbackToolbarItem"));
        -[FBAMailboxesViewController tryLaunchingDraft:orStub:forTeam:withSender:](self, "tryLaunchingDraft:orStub:forTeam:withSender:", 0, v20, v21, v22);

        goto LABEL_32;
      }
      v34 = objc_msgSend(v4, "comesFromFeedbackd");
      v35 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formIdentifier"));
          *(_DWORD *)buf = 138543362;
          v48 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Form with identifier [%{public}@] not found. Will fetch by tat", buf, 0xCu);

        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formIdentifier"));
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100030E40;
        v44[3] = &unk_1000E6608;
        v45 = v4;
        v46 = self;
        objc_msgSend(v38, "fetchFormItemByTat:completion:", v39, v44);

        v20 = v45;
        goto LABEL_32;
      }
      if (!v36)
      {
LABEL_27:

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController composeFeedbackToolbarItem](self, "composeFeedbackToolbarItem"));
        -[FBAMailboxesViewController _beginBugForTeam:sender:](self, "_beginBugForTeam:sender:", v9, v20);
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      v48 = v4;
      v40 = "Could not find form with identifier from Launch Action [%{public}@]. Will show picker";
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bugFormID"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentUser"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uniqueFormStubsWithPreferredTeam:", v9));

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100030F70;
        v42[3] = &unk_1000E73F8;
        v26 = v4;
        v43 = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ded_findWithBlock:", v42));
        v28 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ID"));
            v31 = objc_msgSend(v30, "intValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v48) = v31;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "URL Action matched one form item [%i]", buf, 8u);

          }
          objc_msgSend(v26, "setExactMatchFormStub:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "exactMatchFormStub"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController composeFeedbackToolbarItem](self, "composeFeedbackToolbarItem"));
          -[FBAMailboxesViewController tryLaunchingDraft:orStub:forTeam:withSender:](self, "tryLaunchingDraft:orStub:forTeam:withSender:", 0, v32, v9, v33);

        }
        else
        {
          if (v29)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bugFormID"));
            *(_DWORD *)buf = 138543618;
            v48 = v41;
            v49 = 2114;
            v50 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Could not find form with formID [%{public}@] from Launch Action [%{public}@]. Will show picker", buf, 0x16u);

          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController composeFeedbackToolbarItem](self, "composeFeedbackToolbarItem"));
          -[FBAMailboxesViewController _beginBugForTeam:sender:](self, "_beginBugForTeam:sender:", v9, v32);
        }

        goto LABEL_32;
      }
      v35 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_DWORD *)buf = 138543362;
      v48 = v4;
      v40 = "Launch Action [%{public}@] will show picker";
    }
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
    goto LABEL_27;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138543362;
    v48 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Delaying launch url action [%{public}@]", buf, 0xCu);
  }

  -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", v4);
LABEL_34:

}

- (void)showBatchUIWithAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  FBAMailboxesViewController *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v27 = "-[FBAMailboxesViewController showBatchUIWithAction:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  if (-[FBAMailboxesViewController canShowBatchUIWithAction:](self, "canShowBatchUIWithAction:", v4))
  {
    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (!v9)
      objc_msgSend(v7, "blockLandscapeOrientations:", 1);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100031238;
    v23 = &unk_1000E6378;
    v24 = self;
    v25 = v7;
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController batchEvaluationViewControllerWithUseNavigationStack:showsCloseButton:onDismiss:](self, "batchEvaluationViewControllerWithUseNavigationStack:showsCloseButton:onDismiss:", 1, 1, &v20));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController", v20, v21, v22, v23, v24));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;

    objc_msgSend(v11, "setPreferredContentSize:", v15 * 0.95, v17 * 0.95);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v18, "presentViewController:animated:completion:", v11, 1, 0);

  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Delaying batch UI url action", buf, 2u);
    }

    -[FBAMailboxesViewController setDelayedUrlAction:](self, "setDelayedUrlAction:", v4);
  }

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  id v38;

  v38 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("FBAInboxItemsPresentation")))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "destinationViewController"));
    v9 = objc_opt_class(FBAInbox);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      v10 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentUser"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainQueueContext"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v12, v14));

      objc_msgSend(v8, "setShowingSyntheticInbox:", 1);
LABEL_15:
      objc_msgSend(v8, "setInbox:", v10);
      objc_msgSend(v8, "setTeam:", v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
      v36 = objc_msgSend(v35, "isCollapsed");

      if ((v36 & 1) == 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController splitViewController](self, "splitViewController"));
        objc_msgSend(v37, "dismissSecondaryOrShowEmptyViewControllerAnimated:", 1);

      }
      -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", 0);

      goto LABEL_18;
    }
    v18 = objc_opt_class(NSIndexPath);
    if ((objc_opt_isKindOfClass(v6, v18) & 1) == 0)
    {
      v15 = 0;
      v10 = 0;
      goto LABEL_15;
    }
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController inboxes](self, "inboxes"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v19, "row")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController teamForIndexPath:](self, "teamForIndexPath:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction"));
    if (objc_msgSend(v21, "launchesInbox"))
    {

    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction"));
      v32 = objc_msgSend(v31, "isShowContentItemAction");

      if (!v32)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    v33 = objc_msgSend(v15, "canStartNewFeedback") ^ 1;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));
    objc_msgSend(v34, "setHidesBackButton:", v33);

    goto LABEL_14;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("FBAFollowupResponsePresentation")))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "destinationViewController"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingFollowupToShow](self, "pendingFollowupToShow"));
    objc_msgSend(v10, "setFollowup:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingItemToShow](self, "pendingItemToShow"));
    objc_msgSend(v10, "setContentItem:", v17);

    -[FBAMailboxesViewController setPendingFollowupToShow:](self, "setPendingFollowupToShow:", 0);
    -[FBAMailboxesViewController setPendingItemToShow:](self, "setPendingItemToShow:", 0);
    -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", 0);
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("FBAFollowupDetailPresentation")))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "destinationViewController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewControllers"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", 0));

    v8 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingItemToShow](self, "pendingItemToShow"));
    objc_msgSend(v8, "setContentItem:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController data](self, "data"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentUser"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bugFormStubs"));
    v29 = objc_msgSend(v28, "count") == 0;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationItem"));

    objc_msgSend(v30, "setHidesBackButton:", v29);
    -[FBAMailboxesViewController setPendingItemToShow:](self, "setPendingItemToShow:", 0);
    -[FBAMailboxesViewController setPendingLaunchAction:](self, "setPendingLaunchAction:", 0);
LABEL_19:

  }
}

- (void)showSettings
{
  -[FBAMailboxesViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBASettingsPresentation"), self);
}

- (void)showLoadingView
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing main loading view", v5, 2u);
  }

  -[FBAMailboxesViewController setHideAllInboxes:](self, "setHideAllInboxes:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration loadingConfiguration](UIContentUnavailableConfiguration, "loadingConfiguration"));
  -[FBAMailboxesViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);

}

- (void)hideLoadingView
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "inboxLiteMode");

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will not show content items in main view", v6, 2u);
    }

  }
  else
  {
    -[FBAMailboxesViewController setHideAllInboxes:](self, "setHideAllInboxes:", 0);
    -[FBAMailboxesViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
  }
}

- (void)setFBAPreferencesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136446466;
    v9 = "-[FBAMailboxesViewController setFBAPreferencesEnabled:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}s: %i", (uint8_t *)&v8, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController navigationItem](self, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_largeTitleAccessoryView"));
  objc_msgSend(v7, "setEnabled:", v3);

}

- (BOOL)userIsEnrolledInAnySeedingProgram
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController sortedTeams](self, "sortedTeams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = objc_msgSend(v3, "canStartNewFeedback");

  return v4;
}

- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  -[FBAMailboxesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "team"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredTeamForStubPreferringTeam:", v8));
  v10 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortDescription"));
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Did pick Form [%{public}@], preferred team [%{public}@] ", (uint8_t *)&v13, 0x16u);

  }
  -[FBAMailboxesViewController tryLaunchingDraft:orStub:forTeam:withSender:](self, "tryLaunchingDraft:orStub:forTeam:withSender:", 0, v6, v9, 0);

}

- (void)bugFormPickerDidCancel:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v4 = objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction"));
    v7 = objc_msgSend(v6, "isCaptive");

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Bug form picker cancelled, exiting restricted mode.", v10, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAMailboxesViewController pendingLaunchAction](self, "pendingLaunchAction"));
      +[iFBKUtils exitCaptiveModeRemovingFromHomeScreen:](iFBKUtils, "exitCaptiveModeRemovingFromHomeScreen:", objc_msgSend(v9, "shouldMakeFBAVisible"));

    }
  }
}

- (FBAResponseSummaryViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_detailViewController, a3);
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (void)setIsApplyingSnapshot:(BOOL)a3
{
  self->_isApplyingSnapshot = a3;
}

- (BOOL)isBatchUIEnabled
{
  return self->_isBatchUIEnabled;
}

- (void)setIsBatchUIEnabled:(BOOL)a3
{
  self->_isBatchUIEnabled = a3;
}

- (NSArray)inboxes
{
  return self->_inboxes;
}

- (void)setInboxes:(id)a3
{
  objc_storeStrong((id *)&self->_inboxes, a3);
}

- (NSArray)smartMailboxes
{
  return self->_smartMailboxes;
}

- (void)setSmartMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_smartMailboxes, a3);
}

- (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox)enhancedLoggingInbox
{
  return self->_enhancedLoggingInbox;
}

- (void)setEnhancedLoggingInbox:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedLoggingInbox, a3);
}

- (NSArray)sortedTeams
{
  return self->_sortedTeams;
}

- (void)setSortedTeams:(id)a3
{
  objc_storeStrong((id *)&self->_sortedTeams, a3);
}

- (NSArray)teamSortDescriptors
{
  return self->_teamSortDescriptors;
}

- (void)setTeamSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_teamSortDescriptors, a3);
}

- (BOOL)showsFormsCount
{
  return self->_showsFormsCount;
}

- (void)setShowsFormsCount:(BOOL)a3
{
  self->_showsFormsCount = a3;
}

- (NSMutableArray)fbaDataObservers
{
  return self->_fbaDataObservers;
}

- (void)setFbaDataObservers:(id)a3
{
  objc_storeStrong((id *)&self->_fbaDataObservers, a3);
}

- (FBKLaunchAction)delayedUrlAction
{
  return self->_delayedUrlAction;
}

- (void)setDelayedUrlAction:(id)a3
{
  objc_storeStrong((id *)&self->_delayedUrlAction, a3);
}

- (FBKContentItem)pendingItemToShow
{
  return self->_pendingItemToShow;
}

- (void)setPendingItemToShow:(id)a3
{
  objc_storeStrong((id *)&self->_pendingItemToShow, a3);
}

- (FBKFeedbackFollowup)pendingFollowupToShow
{
  return self->_pendingFollowupToShow;
}

- (void)setPendingFollowupToShow:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFollowupToShow, a3);
}

- (BOOL)hideAllInboxes
{
  return self->_hideAllInboxes;
}

- (void)setHideAllInboxes:(BOOL)a3
{
  self->_hideAllInboxes = a3;
}

- (BOOL)hasLoadedFormItems
{
  return self->_hasLoadedFormItems;
}

- (void)setHasLoadedFormItems:(BOOL)a3
{
  self->_hasLoadedFormItems = a3;
}

- (BOOL)hasFinishedFirstLoad
{
  return self->_hasFinishedFirstLoad;
}

- (void)setHasFinishedFirstLoad:(BOOL)a3
{
  self->_hasFinishedFirstLoad = a3;
}

- (FBKLaunchAction)pendingLaunchAction
{
  return self->_pendingLaunchAction;
}

- (void)setPendingLaunchAction:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLaunchAction, a3);
}

- (FBKData)data
{
  return (FBKData *)objc_loadWeakRetained((id *)&self->_data);
}

- (void)setData:(id)a3
{
  objc_storeWeak((id *)&self->_data, a3);
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControl, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_destroyWeak((id *)&self->_data);
  objc_storeStrong((id *)&self->_pendingLaunchAction, 0);
  objc_storeStrong((id *)&self->_pendingFollowupToShow, 0);
  objc_storeStrong((id *)&self->_pendingItemToShow, 0);
  objc_storeStrong((id *)&self->_delayedUrlAction, 0);
  objc_storeStrong((id *)&self->_fbaDataObservers, 0);
  objc_storeStrong((id *)&self->_teamSortDescriptors, 0);
  objc_storeStrong((id *)&self->_sortedTeams, 0);
  objc_storeStrong((id *)&self->_enhancedLoggingInbox, 0);
  objc_storeStrong((id *)&self->_smartMailboxes, 0);
  objc_storeStrong((id *)&self->_inboxes, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
}

- (id)batchUICellWithCollectionView:(id)a3 indexPath:(id)a4 reuseIdentifier:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  FBAMailboxesViewController *v16;
  id v17;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100053618(v15, (uint64_t)v12);

  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

- (void)presentNonParticipantView
{
  FBAMailboxesViewController *v2;

  v2 = self;
  sub_100053A3C();

}

- (void)launchNewDraftViewControllerWithBugFormStub:(id)a3 draftItem:(id)a4 surveyBugForm:(id)a5 launchAction:(id)a6 team:(id)a7 completion:(id)a8
{
  uint64_t (*v13)();
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FBAMailboxesViewController *v21;

  v13 = (uint64_t (*)())_Block_copy(a8);
  if (v13)
  {
    v14 = swift_allocObject(&unk_1000E8580, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = sub_100055908;
  }
  else
  {
    v14 = 0;
  }
  v19 = a3;
  v18 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21 = self;
  sub_100053C28(a3, a4, a5, a6, (uint64_t)a7, (uint64_t)v13, v14);
  sub_10005565C((uint64_t)v13, v14);

}

- (void)controllerWillFinishSubmission:(id)a3
{
  sub_1000548E8(self, (uint64_t)a2, a3, (SEL *)&selRef_resetViewControllers);
}

- (void)controllerWillResignFirstActive:(id)a3
{
  sub_1000548E8(self, (uint64_t)a2, a3, (SEL *)&selRef_saveDraftIfNeeded);
}

- (void)controller:(id)a3 didFinishSubmissionWithError:(id)a4
{
  id v6;
  FBAMailboxesViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  _sSo26FBAMailboxesViewControllerC18Feedback_AssistantE10controller_28didFinishSubmissionWithErrorySo015FBKBugFormTablebC0C_s0K0_pSgtF_0(v6);

}

- (void)controller:(id)a3 didFailToLoadDraftWithError:(id)a4
{
  id v6;
  FBAMailboxesViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  _sSo26FBAMailboxesViewControllerC18Feedback_AssistantE10controller_27didFailToLoadDraftWithErrorySo015FBKBugFormTablebC0C_s0M0_ptF_0();

}

- (void)controller:(id)a3 didRequestDismissalWithSavedDraft:(BOOL)a4
{
  id v5;
  FBAMailboxesViewController *v6;

  v5 = a3;
  v6 = self;
  _sSo26FBAMailboxesViewControllerC18Feedback_AssistantE10controller_33didRequestDismissalWithSavedDraftySo015FBKBugFormTablebC0C_SbtF_0(v5);

}

- (id)batchEvaluationViewControllerWithUseNavigationStack:(BOOL)a3 showsCloseButton:(BOOL)a4 onDismiss:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  FBAMailboxesViewController *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1000E8558, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for ScoreController(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = self;
  v12 = swift_retain(v9);
  v13 = ScoreController.init()(v12);
  v14 = objc_allocWithZone((Class)type metadata accessor for BatchEvaluationViewController(0));
  v15 = (void *)BatchEvaluationViewController.init(scoreController:useNavigationStack:showsCloseButton:onDismiss:)(v13, v6, v5, sub_100055654, v9);

  swift_release(v9);
  return v15;
}

- (void)shouldShowBatchUIWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  FBAMailboxesViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1000E8530, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  type metadata accessor for BatchEvaluationViewController(0);
  v6 = self;
  static BatchEvaluationViewController.shouldShowBatchUI(completion:)(sub_100055640, v5);

  swift_release(v5);
}

@end
