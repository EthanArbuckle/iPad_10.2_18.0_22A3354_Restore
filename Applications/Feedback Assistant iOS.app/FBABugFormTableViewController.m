@implementation FBABugFormTableViewController

- (FBABugFormTableViewController)initWithCoder:(id)a3
{
  FBABugFormTableViewController *v3;
  FBABugFormTableViewController *v4;
  FBKDraftingController *v5;
  FBKDraftingController *draftingController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBABugFormTableViewController;
  v3 = -[FBABugFormTableViewController initWithCoder:](&v8, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_shouldHideQuestions = 0;
    v3->_attemptedSubmission = 0;
    v5 = (FBKDraftingController *)objc_alloc_init((Class)FBKDraftingController);
    draftingController = v4->_draftingController;
    v4->_draftingController = v5;

    -[FBKDraftingController setDelegate:](v4->_draftingController, "setDelegate:", v4);
    v4->_isUpdatingTable = 0;
    v4->_allowKeyboardDismissalForSnapshot = 0;
  }
  return v4;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBABugFormTableViewController;
  -[FBABugFormTableViewController awakeFromNib](&v7, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController splitViewController](self, "splitViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v4, "setPreferredDisplayMode:", 2);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    -[FBABugFormTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", 414.0, 600.0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  FBABugFormDiffableDataSource *v26;
  void *v27;
  FBABugFormDiffableDataSource *v28;
  void *v29;
  void *v30;
  __CFBundle *MainBundle;
  const __CFURL *v32;
  const __CFURL *v33;
  void *v34;
  void *v35;
  id v36;
  void **v37;
  uint64_t v38;
  id (*v39)(uint64_t, void *, void *, void *);
  void *v40;
  id v41;
  id location;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)FBABugFormTableViewController;
  -[FBABugFormTableViewController viewDidLoad](&v43, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController submitButton](self, "submitButton"));
  objc_msgSend(v3, "setEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftBarButtonItem"));
  objc_msgSend(v5, "setEnabled:", 0);

  -[FBABugFormTableViewController updateTitle](self, "updateTitle");
  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Back"), &stru_1000EA660, 0));
  v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v10, "setBackBarButtonItem:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setRowHeight:", UITableViewAutomaticDimension);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setEstimatedRowHeight:", 80.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setEstimatedSectionFooterHeight:", 0.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setSectionFooterHeight:", UITableViewAutomaticDimension);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController addAttachmentsController](self, "addAttachmentsController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setDropDelegate:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FBADeviceDisplayCell reuseIdentifier](FBADeviceDisplayCell, "reuseIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v17, v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v20, "registerNib:forCellReuseIdentifier:", v19, v17);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v21, v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v24, "registerNib:forCellReuseIdentifier:", v23, v21);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v25, "registerClass:forCellReuseIdentifier:", objc_opt_class(_TtC18Feedback_Assistant21FBAAddAttachmentsCell), CFSTR("AddAttachmentsItem"));

  objc_initWeak(&location, self);
  v26 = [FBABugFormDiffableDataSource alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  v37 = _NSConcreteStackBlock;
  v38 = 3221225472;
  v39 = sub_100008718;
  v40 = &unk_1000E6230;
  objc_copyWeak(&v41, &location);
  v28 = -[FBABugFormDiffableDataSource initWithTableView:cellProvider:](v26, "initWithTableView:cellProvider:", v27, &v37);
  -[FBABugFormTableViewController setDiffableDataSource:](self, "setDiffableDataSource:", v28, v37, v38, v39, v40);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v29, "setThisViewController:", self);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v30, "setDelegate:", self);

  MainBundle = CFBundleGetMainBundle();
  v32 = CFBundleCopyResourceURL(MainBundle, CFSTR("whoosh"), CFSTR("caf"), 0);
  v33 = v32;
  if (v32)
  {
    if (AudioServicesCreateSystemSoundID(v32, &self->_whooshSoundID))
      self->_whooshSoundID = 0;
    CFRelease(v33);
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationController](self, "navigationController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "presentationController"));
  objc_msgSend(v35, "setDelegate:", self);

  v36 = objc_alloc_init((Class)NSMutableDictionary);
  -[FBABugFormTableViewController setCellHeights:](self, "setCellHeights:", v36);

  -[FBABugFormTableViewController registerApplicationNotifications](self, "registerApplicationNotifications");
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FBABugFormTableViewController;
  -[FBABugFormTableViewController viewDidAppear:](&v18, "viewDidAppear:", a3);
  -[FBABugFormTableViewController registerForKeyboardNotifications](self, "registerForKeyboardNotifications");
  -[FBABugFormTableViewController setViewHasBecomeVisible:](self, "setViewHasBecomeVisible:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController pendingFeedbackObject](self, "pendingFeedbackObject"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController pendingFeedbackObject](self, "pendingFeedbackObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController pendingTeam](self, "pendingTeam"));
    objc_msgSend(v5, "loadResponseForFeedbackObject:withTeam:", v6, v7);

    -[FBABugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", 0);
    -[FBABugFormTableViewController setPendingTeam:](self, "setPendingTeam:", 0);
  }
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v10 = FBKDEDHelperNeedsDevicePairing;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100008974;
  v15 = &unk_1000E6300;
  objc_copyWeak(&v16, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v10, 0, v9, &v12));
  -[FBABugFormTableViewController setNotificationObserver:](self, "setNotificationObserver:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBABugFormTableViewController;
  -[FBABugFormTableViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBABugFormTableViewController;
  -[FBABugFormTableViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  -[FBABugFormTableViewController unregisterForKeyboardNotifications](self, "unregisterForKeyboardNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController notificationObserver](self, "notificationObserver"));
  objc_msgSend(v4, "removeObserver:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, FBKDeviceListDidChangeNotification, 0);

}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  if (!v8 || !objc_msgSend(v8, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bugForm"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

    v8 = (id)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setTitle:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBABugFormTableViewController;
  -[FBABugFormTableViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedRow"));
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v6, 0);

}

- (void)_hideDevices
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
  objc_msgSend(v2, "setHidesNotConfiguredDevices:", 1);

}

- (BOOL)hasCandidateStubs
{
  return -[FBABugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount") > 1;
}

- (void)loadNewResponseForBugFormStub:(id)a3 forTeam:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loading new response with Form [%{public}@], team [%{public}@] ", (uint8_t *)&v12, 0x16u);

  }
  if (-[FBABugFormTableViewController viewHasBecomeVisible](self, "viewHasBecomeVisible"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    objc_msgSend(v11, "loadNewResponseForBugFormStub:withTeam:", v6, v7);

  }
  else
  {
    -[FBABugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", v6);
    -[FBABugFormTableViewController setPendingTeam:](self, "setPendingTeam:", v7);
  }

}

- (void)loadNewResponseForSurvey:(id)a3 forTeam:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[FBABugFormTableViewController viewHasBecomeVisible](self, "viewHasBecomeVisible"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    objc_msgSend(v7, "loadNewResponseForBugForm:withTeam:", v8, v6);

    v6 = v7;
  }
  else
  {
    -[FBABugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", v8);
    -[FBABugFormTableViewController setPendingTeam:](self, "setPendingTeam:", v6);
  }

}

- (void)loadDraft:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[FBABugFormTableViewController viewHasBecomeVisible](self, "viewHasBecomeVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    objc_msgSend(v4, "loadFormResponseFromContentItem:", v5);

  }
  else
  {
    -[FBABugFormTableViewController setPendingFeedbackObject:](self, "setPendingFeedbackObject:", v5);
  }

}

- (void)preAttachFiles:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[FBKLaunchAction validateURLSchemeFilePathsDictionary:](FBKLaunchAction, "validateURLSchemeFilePathsDictionary:", a3));
  -[FBABugFormTableViewController setPendingAttachments:](self, "setPendingAttachments:", v4);

}

- (void)postAttachFiles:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKLaunchAction validateURLSchemeFilePathsDictionary:](FBKLaunchAction, "validateURLSchemeFilePathsDictionary:", v4));

  objc_msgSend(v6, "postLaunchAttachLocalFiles:", v5);
}

- (void)setLaunchAction:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_launchAction, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachments"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachments"));
    v7 = objc_msgSend(v6, "copy");
    -[FBABugFormTableViewController preAttachFiles:](self, "preAttachFiles:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "questionAnswerPairs"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "questionAnswerPairs"));
    -[FBABugFormTableViewController setPendingQandA:](self, "setPendingQandA:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "extensions"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "extensions"));
    -[FBABugFormTableViewController setExtensions:](self, "setExtensions:", v11);

  }
}

- (void)close
{
  -[FBABugFormTableViewController closeWithCompletion:](self, "closeWithCompletion:", 0);
}

- (void)closeWithCompletion:(id)a3
{
  -[FBABugFormTableViewController closeWithError:completion:](self, "closeWithError:completion:", 0, a3);
}

- (void)closeDraftAndDelete:(BOOL)a3 withError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void ***v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void **v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *);
  void *v48;
  id v49;
  id v50;
  unsigned int v51;
  id location;
  uint8_t buf[4];
  unsigned int v54;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ID"));
  v12 = objc_msgSend(v11, "intValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = FBKCommonStrings;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CLOSING_FEEDBACK_EDITOR"), &stru_1000EA660, FBKCommonStrings));
  -[FBABugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rightBarButtonItem"));
  objc_msgSend(v17, "setEnabled:", 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leftBarButtonItem"));
  objc_msgSend(v19, "setEnabled:", 0);

  -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  objc_initWeak(&location, self);
  v45 = _NSConcreteStackBlock;
  v46 = 3221225472;
  v47 = sub_1000098C8;
  v48 = &unk_1000E6350;
  v51 = v12;
  objc_copyWeak(&v50, &location);
  v20 = v9;
  v49 = v20;
  v21 = objc_retainBlock(&v45);
  if (a3)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", v45, v46, v47, v48));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], deleting", buf, 8u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DELETING_DRAFT"), &stru_1000EA660, v14));
    -[FBABugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v24);

    v25 = objc_loadWeakRetained(&location);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "itemFromDraft"));
    LODWORD(v23) = v26 == 0;

    if ((_DWORD)v23)
    {
      v36 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_100098B80(v36, v37, v38, v39, v40, v41, v42, v43);

      ((void (*)(void ***, _QWORD))v21[2])(v21, 0);
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
      v28 = objc_loadWeakRetained(&location);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "itemFromDraft"));
      objc_msgSend(v27, "deleteDraftFromContentItem:completion:", v29, v21);

    }
    v44 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "will delete all sessions for form response [%i]", buf, 8u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    objc_msgSend(v34, "abortAllSessions");
LABEL_19:

    goto LABEL_20;
  }
  if (!v8)
  {
    v31 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", v45, v46, v47, v48));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d], saving", buf, 8u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SAVING_DRAFT"), &stru_1000EA660, v14));
    -[FBABugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    objc_msgSend(v34, "saveFormResponse:completion:", v35, v21);

    goto LABEL_19;
  }
  v30 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", v45, v46, v47, v48));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v54 = v12;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Closing bug form for FR [%d] after error, not saving", buf, 8u);
  }

  ((void (*)(void ***, _QWORD))v21[2])(v21, 0);
LABEL_20:

  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  -[FBABugFormTableViewController closeDraftAndDelete:withError:completion:](self, "closeDraftAndDelete:withError:completion:", objc_msgSend(v8, "isDirty") ^ 1, v7, v6);

}

- (id)itemFromDraft
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formResponse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentItem"));

  return v4;
}

- (id)formStub
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formStub"));

  return v3;
}

- (id)formResponse
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formResponse"));

  return v3;
}

- (id)bugForm
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bugForm"));

  return v3;
}

- (void)draftingControllerDidBeginLoading:(id)a3
{
  void *v4;
  void *v5;

  -[FBABugFormTableViewController updateTitle](self, "updateTitle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOADING_DRAFT"), &stru_1000EA660, FBKCommonStrings));
  -[FBABugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v5);

  -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 1);
}

- (void)draftingControllerDidFinishLoading:(id)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v30;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ID"));
    *(_DWORD *)buf = 67109120;
    v30 = objc_msgSend(v8, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "finished loading draft for form response [%i]", buf, 8u);

  }
  -[FBABugFormTableViewController setHasLoadedFirstDraft:](self, "setHasLoadedFirstDraft:", 1);
  -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", -[FBABugFormTableViewController isCaptiveModeEnabled](self, "isCaptiveModeEnabled"));
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
  if (v5)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100098C18(v5);

    -[FBABugFormTableViewController _handleLoadingError:](self, "_handleLoadingError:", v5);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController pendingQandA](self, "pendingQandA"));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[FBALog currentURLActionActivity](FBALog, "currentURLActionActivity"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A040;
      block[3] = &unk_1000E61B8;
      block[4] = self;
      os_activity_apply(v11, block);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
    v13 = objc_msgSend(v12, "collectsFiles");

    if (v13)
    {
      v14 = objc_alloc((Class)FBKDeviceDiagnosticsController);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController pendingAttachments](self, "pendingAttachments"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController extensions](self, "extensions"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "draftDevices"));
      v21 = objc_msgSend(v14, "initWithDeviceManager:delegate:filerForm:pendingFileUrls:pendingURLExtensions:draftDeviceIds:", v15, self, v16, v17, v18, v20);
      -[FBABugFormTableViewController setDevicesController:](self, "setDevicesController:", v21);

      -[FBABugFormTableViewController setExtensions:](self, "setExtensions:", 0);
    }
    else
    {
      v22 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ID"));
        v25 = objc_msgSend(v24, "intValue");
        *(_DWORD *)buf = 67109120;
        v30 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "bug form [%i] does not collect files", buf, 8u);

      }
      -[FBABugFormTableViewController setDevicesController:](self, "setDevicesController:", 0);
      -[FBABugFormTableViewController _stopSpinner](self, "_stopSpinner");
    }
    -[FBABugFormTableViewController updateTitle](self, "updateTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leftBarButtonItem"));
    objc_msgSend(v27, "setEnabled:", 1);

    -[FBABugFormTableViewController setAttemptedSubmission:](self, "setAttemptedSubmission:", 0);
    -[FBABugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");
    -[FBABugFormTableViewController showQuestions](self, "showQuestions");
    -[FBABugFormTableViewController updateCachedCandidateStubsCount](self, "updateCachedCandidateStubsCount");
  }

}

- (void)_handleLoadingError:(id)a3
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
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftBarButtonItem"));
  objc_msgSend(v6, "setEnabled:", 1);

  -[FBABugFormTableViewController _stopSpinner](self, "_stopSpinner");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GENERIC_DRAFT_LOAD_ERROR_TITLE"), &stru_1000EA660, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("GENERIC_DRAFT_LOAD_ERROR_MESSAGE"), &stru_1000EA660, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A298;
  v16[3] = &unk_1000E61E0;
  v16[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, v16));
  objc_msgSend(v11, "addAction:", v14);

  -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  v15 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100098C9C(v4);

}

- (void)questionVisibilityDidUpdateForDraftingController:(id)a3
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)draftingController:(id)a3 madeVisibilityUpdatesWithSnapshotDiff:(id)a4
{
  id v5;

  -[FBABugFormTableViewController updateUI:](self, "updateUI:", objc_msgSend(a4, "containsAnyAdditionsOrRemovals", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
  objc_msgSend(v5, "reevaluateMatcherPredicates");

}

- (id)questionGroupForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "questionGroupForSectionIdentifier:", v8));

  return v10;
}

- (id)questionsForQuestionGroupInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "questionsForSectionIdentifier:", v8));

  return v10;
}

- (double)_separatorInset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A4D4;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  if (qword_100117F90 != -1)
    dispatch_once(&qword_100117F90, block);
  return *(double *)&qword_100117F98;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 withItemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FBADiffableTableViewCell *v15;
  FBADiffableTableViewCell *v16;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  FBADiffableTableViewCell *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  FBADiffableTableViewCell *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  FBADiffableTableViewCell *v50;
  void *v51;
  unsigned int v52;
  FBADiffableTableViewCell *v53;
  uint64_t v54;
  FBADiffableTableViewCell *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  void *i;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  FBADiffableTableViewCell *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  FBADiffableTableViewCell *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v125;
  FBADiffableTableViewCell *v126;
  void *v127;
  id v128;
  void *v129;
  FBADiffableTableViewCell *v130;
  FBADiffableTableViewCell *v131;
  FBADiffableTableViewCell *v132;
  void *v133;
  void *v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sectionIdentifierForSectionContainingItemIdentifier:", v10));

  if (!v13)
  {
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("FBA UI Exception"), CFSTR("Section Identifier is nil, cannot proceed"));
    v15 = 0;
    goto LABEL_68;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("TeamPicker")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController teamPickerRowIdentifier](self, "teamPickerRowIdentifier"));
    v15 = (FBADiffableTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v14));

    if (!v15)
    {
      v16 = [FBADiffableTableViewCell alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController teamPickerRowIdentifier](self, "teamPickerRowIdentifier"));
      v15 = -[FBADiffableTableViewCell initWithStyle:reuseIdentifier:](v16, "initWithStyle:reuseIdentifier:", 3, v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "teamsMatchingFormID"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
    -[FBADiffableTableViewCell configureForTeam:disclosesMoreTeams:](v15, "configureForTeam:disclosesMoreTeams:", v20, (unint64_t)objc_msgSend(v19, "count") > 1);

    goto LABEL_68;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("FormPicker")))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[FBATopicCell reuseIdentifier](_TtC18Feedback_Assistant12FBATopicCell, "reuseIdentifier"));
    v15 = (FBADiffableTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v21, v9));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
    -[FBADiffableTableViewCell setFormStub:](v15, "setFormStub:", v22);

    -[FBADiffableTableViewCell setDisclosesMoreForms:](v15, "setDisclosesMoreForms:", -[FBABugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount") > 1);
    goto LABEL_68;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("DeviceAttachmentsSectionType")))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "maybeAttachmentWithIdentifier:", v10));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "maybeDeviceWithIdentifier:", v10));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[FBADeviceDisplayCell reuseIdentifier](FBADeviceDisplayCell, "reuseIdentifier"));
      v15 = (FBADiffableTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v27, v9));

      -[FBADiffableTableViewCell updateWithDevice:](v15, "updateWithDevice:", v26);
      -[FBABugFormTableViewController _separatorInset](self, "_separatorInset");
      -[FBADiffableTableViewCell objc_updateWithSeparatorSpacing:](v15, "objc_updateWithSeparatorSpacing:");
LABEL_18:

LABEL_67:
      goto LABEL_68;
    }
    if (v24)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier"));
      v15 = (FBADiffableTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v30, v9));

      -[FBADiffableTableViewCell setShowsIcon:](v15, "setShowsIcon:", 0);
      -[FBADiffableTableViewCell setAttachment:](v15, "setAttachment:", v24);
      -[FBABugFormTableViewController _separatorInset](self, "_separatorInset");
      -[FBADiffableTableViewCell objc_updateWithSeparatorSpacing:](v15, "objc_updateWithSeparatorSpacing:");
      -[FBABugFormTableViewController _separatorInset](self, "_separatorInset");
      -[FBADiffableTableViewCell updateSuperviewToAttachmentLabelSpacing:](v15, "updateSuperviewToAttachmentLabelSpacing:");
      goto LABEL_18;
    }
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("FBA UI Exception"), CFSTR("Received unexpected diffable object"));
LABEL_20:
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "visibleQuestionForSectionIdentifier:itemIdentifier:", v13, v10));

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "answerForQuestionID:", v33));

    v35 = objc_msgSend(v24, "answerType");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
    v133 = v34;
    v134 = v24;
    if (v35 == (id)6)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[FBAInformationCell reuseIdentifier](FBAInformationCell, "reuseIdentifier"));
      v15 = (FBADiffableTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dequeueReusableCellWithIdentifier:forIndexPath:", v37, v9));

      v38 = 0;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[FBAQuestionAnswerCell reuseIdentifier](FBAQuestionAnswerCell, "reuseIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dequeueReusableCellWithIdentifier:forIndexPath:", v39, v9));

      v38 = v40;
      -[FBADiffableTableViewCell setQuestion:](v38, "setQuestion:", v24);
      -[FBADiffableTableViewCell setAnswer:](v38, "setAnswer:", v34);
      -[FBADiffableTableViewCell setBugFormEditorDelegate:](v38, "setBugFormEditorDelegate:", self);
      -[FBADiffableTableViewCell setSelectionStyle:](v38, "setSelectionStyle:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "text"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell questionLabel](v38, "questionLabel"));
      objc_msgSend(v41, "setText:", v36);

      if (FBKIsInternalInstall())
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v42 = objc_msgSend(v36, "BOOLForKey:", FBKShowSortOrderForDebugging);

        if (v42)
        {
          v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "text"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sortOrder"));
          v44 = v38;
          v45 = v43;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringValue"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v129, v46));
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell questionLabel](v44, "questionLabel"));
          objc_msgSend(v47, "setText:", v36);

          v38 = v44;
          v24 = v134;

        }
      }
      if (!-[FBABugFormTableViewController attemptedSubmission](self, "attemptedSubmission"))
        goto LABEL_28;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "invalidQuestionIDs"));
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ID"));
      v50 = v38;
      v51 = (void *)v49;
      v52 = objc_msgSend(v48, "containsObject:", v49);

      v38 = v50;
      v24 = v134;

      if (v52)
      {
        v53 = v38;
        v54 = 1;
      }
      else
      {
LABEL_28:
        v53 = v38;
        v54 = 0;
      }
      -[FBADiffableTableViewCell setShowError:](v53, "setShowError:", v54);
      v15 = v38;
      v34 = v133;
    }
    switch((unint64_t)objc_msgSend(v24, "answerType"))
    {
      case 0uLL:
      case 1uLL:
        v55 = v38;
        v130 = v15;
        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "value"));
        if (v56
          && (v57 = (void *)v56,
              v58 = v34,
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "value")),
              v60 = objc_msgSend(v59, "length"),
              v59,
              v57,
              v60))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "value"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
          objc_msgSend(v62, "setText:", v61);

          v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
          objc_msgSend(v64, "setTextColor:", v63);
          v34 = v58;
        }
        else
        {
          v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "placeholder"));
          if (v69
            && (v70 = (void *)v69,
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "placeholder")),
                v72 = objc_msgSend(v71, "length"),
                v71,
                v70,
                v72))
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "placeholder"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stringByTrimmingCharactersInSet:", v74));
            v76 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
            objc_msgSend(v76, "setText:", v75);

          }
          else
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("TEXT_ANSWER_PLACEHOLDER"), &stru_1000EA660, 0));
            v75 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
            objc_msgSend(v75, "setText:", v74);
          }

          v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
          objc_msgSend(v64, "setTextColor:", v63);
          v34 = v133;
        }

        v104 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
        objc_msgSend(v104, "setDelegate:", self);

        v105 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "text"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v55, "answerTextView"));
        objc_msgSend(v107, "setAccessibilityIdentifier:", v106);

        -[FBADiffableTableViewCell hideAccessoryView](v55, "hideAccessoryView");
        v15 = v130;
        v38 = v55;
        goto LABEL_60;
      case 2uLL:
      case 3uLL:
        v131 = v15;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "displayTextForAnswer:", v34));
        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v38, "answerTextView"));
          objc_msgSend(v66, "setText:", v65);

          v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v38, "answerTextView"));
          objc_msgSend(v68, "setTextColor:", v67);
        }
        else
        {
          v98 = v24;
          v99 = v38;
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "allChoices"));
          v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPrompt = YES")));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "filteredArrayUsingPredicate:", v101));

          if (objc_msgSend(v67, "count"))
          {
            v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "firstObject"));
            v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "title"));
          }
          else
          {
            v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("CHOICE_ANSWER_PLACEHOLDER"), &stru_1000EA660, 0));
          }
          v110 = (void *)v103;
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v99, "answerTextView"));
          objc_msgSend(v111, "setText:", v110);

          v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          v113 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v99, "answerTextView"));
          objc_msgSend(v113, "setTextColor:", v112);

          v68 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v99, "answerTextView"));
          objc_msgSend(v68, "setDelegate:", 0);
          v38 = v99;
        }

        v114 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v38, "answerTextView"));
        v115 = v38;
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "text"));
        v117 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v115, "answerTextView"));
        objc_msgSend(v117, "setAccessibilityIdentifier:", v116);

        v38 = v115;
        -[FBADiffableTableViewCell showAccessoryView](v115, "showAccessoryView");

        v15 = v131;
        v34 = v133;
LABEL_60:
        v24 = v134;
        break;
      case 4uLL:
        v126 = v38;
        v132 = v15;
        v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "values"));
        v78 = v34;
        v127 = v13;
        v128 = v9;
        if (v77
          && (v36 = (void *)v77,
              v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "values")),
              v80 = objc_msgSend(v79, "count"),
              v79,
              v36,
              v80))
        {
          v135 = v8;
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
          v82 = v24;
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ID"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "answerForQuestionID:", v83));

          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "values"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v85, "count")));

          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v125 = v84;
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "values"));
          v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
          if (v88)
          {
            v89 = v88;
            v90 = *(_QWORD *)v137;
            do
            {
              for (i = 0; i != v89; i = (char *)i + 1)
              {
                if (*(_QWORD *)v137 != v90)
                  objc_enumerationMutation(v87);
                v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "displayTextForAnswer:", *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)i)));
                v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("• %@"), v92));
                objc_msgSend(v86, "addObject:", v93);

              }
              v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v136, v140, 16);
            }
            while (v89);
          }

          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "componentsJoinedByString:", CFSTR("\n")));
          v38 = v126;
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v126, "answerTextView"));
          objc_msgSend(v95, "setText:", v94);

          v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v126, "answerTextView"));
          objc_msgSend(v97, "setTextColor:", v96);

          v34 = v133;
          v8 = v135;
          v24 = v82;
          v15 = v132;
        }
        else
        {
          v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "placeholder"));
          if (v108)
          {
            v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "placeholder"));
          }
          else
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CHOICE_ANSWER_PLACEHOLDER"), &stru_1000EA660, 0));
          }
          v34 = v78;
          v118 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v126, "answerTextView"));
          objc_msgSend(v118, "setText:", v109);

          v15 = v132;
          if (!v108)
          {

            v109 = v36;
          }

          v119 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          v120 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v126, "answerTextView"));
          objc_msgSend(v120, "setTextColor:", v119);

          v38 = v126;
          v24 = v134;
        }
        v121 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v38, "answerTextView"));
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "text"));
        v123 = (void *)objc_claimAutoreleasedReturnValue(-[FBADiffableTableViewCell answerTextView](v38, "answerTextView"));
        objc_msgSend(v123, "setAccessibilityIdentifier:", v122);

        -[FBADiffableTableViewCell showAccessoryView](v38, "showAccessoryView");
        v13 = v127;
        v9 = v128;
        break;
      case 6uLL:
        -[FBADiffableTableViewCell setQuestion:](v15, "setQuestion:", v24);
        break;
      default:
        break;
    }
    -[FBADiffableTableViewCell layoutIfNeeded](v15, "layoutIfNeeded");

    goto LABEL_67;
  }
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("AddAttachments")))
    goto LABEL_20;
  v15 = (FBADiffableTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AddAttachmentsItem"), v9));
  if (+[FBAAddAttachmentsCell supportsMenu](_TtC18Feedback_Assistant21FBAAddAttachmentsCell, "supportsMenu"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController addAttachmentsController](self, "addAttachmentsController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "menuForController:", self));
    -[FBADiffableTableViewCell setMenu:](v15, "setMenu:", v29);

  }
  -[FBABugFormTableViewController setAddAttachmentCell:](self, "setAddAttachmentCell:", v15);
LABEL_68:

  return v15;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController cellHeights](self, "cellHeights"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = UITableViewAutomaticDimension;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController cellHeights](self, "cellHeights"));
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
  objc_msgSend(v12, "setObject:forKey:", v11, v7);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char isKindOfClass;
  NSObject *v41;
  void *v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshot"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionIdentifierForSectionContainingItemIdentifier:", v9));

  v13 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v9;
    v57 = 2112;
    v58 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Did select item with identifier [%@] in section [%@]", buf, 0x16u);
  }

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("DeviceAttachmentsSectionType")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "maybeAttachmentWithIdentifier:", v9));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "maybeDeviceWithIdentifier:", v9));

    if (v17)
    {
      -[FBABugFormTableViewController didTapDevice:indexPath:](self, "didTapDevice:indexPath:", v17, v7);
    }
    else if (v15)
    {
      -[FBABugFormTableViewController didTapAttachment:indexPath:](self, "didTapAttachment:indexPath:", v15, v7);
    }
    goto LABEL_27;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("AddAttachments")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController addAttachmentsController](self, "addAttachmentsController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController addAttachmentCell](self, "addAttachmentCell"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sheetForController:selectedIndexPath:sender:", self, v7, v19));

    -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("FormPicker")))
    {
      v20 = objc_msgSend(v12, "isEqualToString:", CFSTR("TeamPicker"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "teamsMatchingFormID"));
        v23 = objc_msgSend(v22, "count");

        if ((unint64_t)v23 < 2)
          goto LABEL_28;
        v17 = objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("Teams"), 0));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject instantiateViewControllerWithIdentifier:](v17, "instantiateViewControllerWithIdentifier:", CFSTR("FBATeamPickerController")));
        objc_msgSend(v24, "setPickerDelegate:", self);
        objc_msgSend(v24, "setShowsDismissButton:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
        objc_msgSend(v24, "setFormStub:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
        objc_msgSend(v24, "setSelectedTeam:", v26);

        v27 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v24);
        objc_msgSend(v27, "setModalPresentationStyle:", 7);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popoverPresentationController"));
        objc_msgSend(v28, "setSourceView:", v15);

        objc_msgSend(v15, "bounds");
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popoverPresentationController"));
        objc_msgSend(v37, "setSourceRect:", v30, v32, v34, v36);

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popoverPresentationController"));
        objc_msgSend(v38, "setPermittedArrowDirections:", 1);

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_10000BAF0;
        v52[3] = &unk_1000E6378;
        v53 = v6;
        v54 = v7;
        -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, v52);

      }
      else
      {
        v39 = objc_opt_class(FBAQuestionAnswerCell);
        isKindOfClass = objc_opt_isKindOfClass(v15, v39);
        v41 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        v17 = v41;
        if ((isKindOfClass & 1) == 0)
        {
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            sub_100098D34((uint64_t)v9, v17, v45, v46, v47, v48, v49, v50);
          goto LABEL_27;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v9;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Tapped on Q&A with identifier [%@]", buf, 0xCu);
        }

        if ((objc_msgSend(v15, "hasKeyboardFocus") & 1) == 0)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
          objc_msgSend(v42, "endEditing:", 1);

        }
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "visibleQuestionForSectionIdentifier:itemIdentifier:", v12, v9));

        v44 = (char *)objc_msgSend(v24, "answerType");
        if ((unint64_t)(v44 - 2) >= 3)
        {
          if ((unint64_t)v44 < 2)
          {
            -[NSObject beginEditingQuestion](v17, "beginEditingQuestion");
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
            objc_msgSend(v51, "deselectRowAtIndexPath:animated:", v7, 1);

          }
        }
        else
        {
          -[FBABugFormTableViewController performSegueWithIdentifier:sender:](self, "performSegueWithIdentifier:sender:", CFSTR("FBABugFormDetailPresentation"), v17);
        }
      }

LABEL_27:
      goto LABEL_28;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    -[FBABugFormTableViewController didPressChangeBugForm:](self, "didPressChangeBugForm:", v15);
  }
LABEL_28:

}

- (BOOL)_tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionIdentifierForSectionContainingItemIdentifier:", v7));

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("DeviceAttachmentsSectionType")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "maybeAttachmentWithIdentifier:", v7));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v14 = v13;
    if (v12)
    {
      if ((objc_msgSend(v13, "canCancelAttachmentCollection:", v12) & 1) != 0)
      {
        v15 = 1;
LABEL_11:

        goto LABEL_12;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
      v15 = objc_msgSend(v17, "canDeleteAttachment:", v12);
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "maybeDeviceWithIdentifier:", v7));

      if (!v16)
      {
        v15 = 0;
        v14 = 0;
        goto LABEL_11;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
      v15 = objc_msgSend(v17, "canRemoveDevice:", v16);
      v14 = (void *)v16;
    }

    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)answerDidChangeForQuestion:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "shouldHaveChoices");
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "role"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "answerForQuestionID:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "values"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(",")));
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Q: [%@] A: [%@]", (uint8_t *)&v18, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_100098D98(v4, self, v7);
  }

  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  objc_msgSend(v14, "validate:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  objc_msgSend(v15, "didChangeAnswerToQuestion:", v4);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v17 = (objc_msgSend(v16, "isDirty") & 1) != 0
     || -[FBABugFormTableViewController isCaptiveModeEnabled](self, "isCaptiveModeEnabled");
  -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", v17);

  -[FBABugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");
}

- (void)editorDidDismissForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifierForVisibleQuestion:hasAttemptedSubmission:", v4, -[FBABugFormTableViewController attemptedSubmission](self, "attemptedSubmission")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItemIdentifier:", v9));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)deviceDiagnosticsController:(id)a3 didFailToAttach:(id)a4 toDevice:(id)a5 error:(id)a6
{
  +[FBAAddAttachmentsController handleErrorAttachingWithAttachment:viewController:devicesDiagnosticsController:error:](_TtC18Feedback_Assistant27FBAAddAttachmentsController, "handleErrorAttachingWithAttachment:viewController:devicesDiagnosticsController:error:", a4, self, a3, a6);
}

- (void)deviceDiagnosticsController:(id)a3 needsSelectionFromDevices:(id)a4 completion:(id)a5
{
  +[FBADevicePickerCoordinator showDevicePickerWithChoices:onViewController:completion:](_TtC18Feedback_Assistant26FBADevicePickerCoordinator, "showDevicePickerWithChoices:onViewController:completion:", a4, self, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didFailToConnectToDevice:(id)a4
{
  +[FBANoBugSessionAlertViewController showInController:forDevice:](_TtC18Feedback_Assistant34FBANoBugSessionAlertViewController, "showInController:forDevice:", self, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevices:(id)a4
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 1, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didAddDevice:(id)a4
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 1, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveDevice:(id)a4
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 1, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateDevice:(id)a4
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0, a4);
}

- (void)deviceDiagnosticsController:(id)a3 didAddAttachment:(id)a4 toDevice:(id)a5
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 1, a4, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didRemoveAttachment:(id)a4 fromDevice:(id)a5
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 1, a4, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didUpdateAttachment:(id)a4 onDevice:(id)a5
{
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0, a4, a5);
}

- (void)deviceDiagnosticsController:(id)a3 didChangeState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STARTING_BUG_SESSIONS"), &stru_1000EA660, FBKCommonStrings));
      -[FBABugFormTableViewController _showSpinnerWithStatus:userInteractionEnabled:](self, "_showSpinnerWithStatus:userInteractionEnabled:", v9, 1);

      break;
    case 1:
      goto LABEL_6;
    case 2:
      v10 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100098EB8(v10, v11, v12, v13, v14, v15, v16, v17);

LABEL_6:
      -[FBABugFormTableViewController _stopSpinner](self, "_stopSpinner");
      break;
    case 3:
      v18 = (uint64_t)objc_msgSend(v6, "filesBeingAttachedCount");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = v19;
      if (v18 < 1)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("COPYING_FILES"), CFSTR("Attaching files"), 0));
      }
      else
      {
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Attaching %d files"), &stru_1000EA660, FBKPluralStrings));

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v18));
        v20 = (void *)v21;
      }

      -[FBABugFormTableViewController _showSpinnerWithStatus:userInteractionEnabled:](self, "_showSpinnerWithStatus:userInteractionEnabled:", v22, 1);
      break;
    default:
      break;
  }
  -[FBABugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");

}

- (BOOL)shouldDisplayChangeButton
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  BOOL result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
  v4 = objc_msgSend(v3, "role");

  result = 0;
  if (v4 != (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[FBABugFormTableViewController hasCandidateStubs](self, "hasCandidateStubs");

      if ((v7 & 1) != 0)
        return 1;
    }
  }
  return result;
}

- (void)didPressChangeBugForm:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController view](self, "view"));
  objc_msgSend(v4, "endEditing:", 1);

  if (-[FBABugFormTableViewController shouldDisplayChangeButton](self, "shouldDisplayChangeButton"))
    -[FBABugFormTableViewController _showFormPickerWithSender:](self, "_showFormPickerWithSender:", v5);

}

- (void)_changeToBugFormStub:(id)a3 force:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "teamFormStubMatchingFromFormStub:", v9));

  if (!v6)
    v6 = v9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredTeamForStubPreferringTeam:", v7));
  -[FBABugFormTableViewController _changeToBugFormStub:withTeam:force:](self, "_changeToBugFormStub:withTeam:force:", v6, v8, 1);

}

- (void)_changeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5
{
  -[FBABugFormTableViewController _reallyChangeToBugFormStub:withTeam:force:](self, "_reallyChangeToBugFormStub:withTeam:force:", a3, a4, a5);
}

- (void)_reallyChangeToBugFormStub:(id)a3 withTeam:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  id v39;
  _QWORD v40[5];
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  unsigned int v47;
  uint8_t buf[4];
  unsigned int v49;
  __int16 v50;
  unsigned int v51;

  v8 = a3;
  v9 = a4;
  -[FBABugFormTableViewController setPendingStub:](self, "setPendingStub:", 0);
  if (a5
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ID")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ID")),
        v13 = objc_msgSend(v11, "isEqual:", v12),
        v12,
        v11,
        v10,
        (v13 & 1) == 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ID"));
    v16 = objc_msgSend(v15, "intValue");

    -[FBABugFormTableViewController hideQuestions](self, "hideQuestions");
    v17 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ID"));
      v20 = objc_msgSend(v19, "intValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ID"));
      *(_DWORD *)buf = 67109376;
      v49 = v20;
      v50 = 1024;
      v51 = objc_msgSend(v21, "intValue");
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Form Swap: changing from form [%i] to form [%i]", buf, 0xEu);

    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10000C7C0;
    v44[3] = &unk_1000E63C8;
    v44[4] = self;
    v47 = v16;
    v45 = v8;
    v46 = v9;
    v22 = objc_retainBlock(v44);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    v24 = objc_msgSend(v23, "isDirty");

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("PROMPT_DELETE_DRAFT")));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v38, 0, 1));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v39 = v9;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT_CHOICE"), &stru_1000EA660, 0));
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10000CC98;
      v42[3] = &unk_1000E63F0;
      v42[4] = self;
      v29 = v22;
      v43 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 2, v42));

      objc_msgSend(v26, "addAction:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SAVE_DRAFT_CHOICE"), &stru_1000EA660, 0));
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10000CD80;
      v40[3] = &unk_1000E63F0;
      v40[4] = self;
      v41 = v29;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 0, v40));

      v9 = v39;
      objc_msgSend(v26, "addAction:", v33);
      -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);

    }
    else
    {
      v34 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "ID"));
        v37 = objc_msgSend(v36, "intValue");
        *(_DWORD *)buf = 67109120;
        v49 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "_changeToBugForm, deleting the unused FR %d", buf, 8u);

      }
      ((void (*)(_QWORD *, uint64_t))v22[2])(v22, 1);
    }

  }
}

- (void)_showFormPickerWithSender:(id)a3
{
  id v4;
  NSObject *v5;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v6;
  void *v7;
  _TtC18Feedback_Assistant26FBABugFormPickerController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint8_t v14[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing Form Picker from draft view", v14, 2u);
  }

  v6 = [_TtC18Feedback_Assistant26FBABugFormPickerController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController candidateFormStubsPredicate](self, "candidateFormStubsPredicate"));
  v8 = -[FBABugFormPickerController initWithStubsPredicate:](v6, "initWithStubsPredicate:", v7);

  -[FBABugFormPickerController setPickerDelegate:](v8, "setPickerDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
  -[FBABugFormPickerController setCurrentSelection:](v8, "setCurrentSelection:", v9);

  -[FBABugFormPickerController setContext:](v8, "setContext:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
  -[FBABugFormPickerController setTeam:](v8, "setTeam:", v10);

  v11 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
  objc_msgSend(v11, "setModalPresentationStyle:", 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "popoverPresentationController"));
  objc_msgSend(v12, "setPermittedArrowDirections:", 1);
  if (v4)
  {
    v13 = objc_opt_class(UIBarButtonItem);
    if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
    {
      objc_msgSend(v12, "setBarButtonItem:", v4);
    }
    else
    {
      objc_msgSend(v12, "setSourceView:", v4);
      objc_msgSend(v4, "bounds");
      objc_msgSend(v12, "setSourceRect:");
    }
  }
  -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)bugFormPicker:(id)a3 didSelectBugFormStub:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController presentedViewController](self, "presentedViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));

  if (v8 == v9)
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000D13C;
    v10[3] = &unk_1000E6418;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    -[FBABugFormTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)bugFormPickerDidCancel:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10009901C(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForSelectedRow"));
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v14, 1);

}

- (void)teamPicker:(id)a3 didSelectTeam:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D2FC;
  v9[3] = &unk_1000E62D8;
  v8 = v7;
  v10 = v8;
  objc_copyWeak(&v11, &location);
  -[FBABugFormTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)beginPresubmissionCheck:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  os_activity_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void ***v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void **v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  FBABugFormTableViewController *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD block[4];
  id v51;
  FBABugFormTableViewController *v52;
  id v53;
  os_activity_t v54;

  -[FBABugFormTableViewController setAttemptedSubmission:](self, "setAttemptedSubmission:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v5 = objc_msgSend(v4, "validate:", 0);

  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController submitButton](self, "submitButton"));
  objc_msgSend(v6, "setEnabled:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unreachableDevicesInPlay"));

  if ((v5 & 1) == 0)
  {
    -[FBABugFormTableViewController updateSubmitButtonState](self, "updateSubmitButtonState");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("MISSING_ANSWERS_TITLE"), &stru_1000EA660, 0));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("MISSING_ANSWERS_MESSAGE"), &stru_1000EA660, 0));
    v20 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v22, v24, 1));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, 0));
    v27 = v26;
    v28 = 0;
LABEL_7:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, v28, v43, v44, v45, v46, v47));
    objc_msgSend(v20, "addAction:", v29);

    -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
  if (!objc_msgSend(v11, "collectsFiles") || !objc_msgSend(v10, "count"))
  {

LABEL_10:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
    if ((objc_msgSend(v30, "collectsFiles") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
      v32 = objc_msgSend(v31, "hasUnmetRequirementAttachments");

      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("MISSING_REQ_FILES"), &stru_1000EA660, 0));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("MISSING_REQ_FILES_MESSAGE"), &stru_1000EA660, 0));
        v20 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v34, v36, 1));

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("GATHER_AND_SUBMIT"), &stru_1000EA660, 0));
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10000E3BC;
        v49[3] = &unk_1000E61E0;
        v49[4] = self;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v38, 0, v49));
        objc_msgSend(v20, "addAction:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SUBMIT_WO_FILES"), &stru_1000EA660, 0));
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10000E484;
        v48[3] = &unk_1000E61E0;
        v48[4] = self;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v41, 0, v48));
        objc_msgSend(v20, "addAction:", v42);

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("BACK_TO_DRAFT"), &stru_1000EA660, 0));
        v43 = _NSConcreteStackBlock;
        v44 = 3221225472;
        v45 = sub_10000E5F8;
        v46 = &unk_1000E61E0;
        v47 = self;
        v28 = &v43;
        v27 = v26;
        goto LABEL_7;
      }
    }
    else
    {

    }
    -[FBABugFormTableViewController checkLegalAndSubmit](self, "checkLegalAndSubmit");
    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "matcherPredicates"));
  v14 = objc_msgSend(v13, "count");

  if (!v14)
    goto LABEL_10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOT_REACHABLE_SUBMIT_MESSAGE_NO_DEVICE_NAME"), &stru_1000EA660, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16));

  v18 = _os_activity_create((void *)&_mh_execute_header, "Submission on non reachable device", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DA34;
  block[3] = &unk_1000E6468;
  v51 = v10;
  v52 = self;
  v53 = v17;
  v54 = v18;
  v19 = v18;
  v20 = v17;
  os_activity_apply(v19, block);

LABEL_8:
LABEL_15:

}

- (void)checkLegalAndSubmit
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", FBKSuppressPrivacyNoticePreferencesKey);

  if ((v4 & 1) != 0)
  {
    -[FBABugFormTableViewController submit](self, "submit");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SUBMISSION_PII_TITLE"), &stru_1000EA660, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SUBMISSION_PII_MESSAGE"), &stru_1000EA660, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, 0));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E950;
    v17[3] = &unk_1000E61E0;
    v17[4] = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v17));
    objc_msgSend(v9, "addAction:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SUBMIT_BUTTON"), &stru_1000EA660, 0));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000E99C;
    v16[3] = &unk_1000E61E0;
    v16[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v16));
    objc_msgSend(v9, "addAction:", v15);

    -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
}

- (void)submit
{
  NSObject *v3;
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
  id v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FBABugFormTableViewController *v25;
  id v26;
  uint8_t *v27;
  unsigned int v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t *v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ID"));
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v5, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting submit for FR %d", buf, 8u);

  }
  -[FBABugFormTableViewController unregisterApplicationNotifications](self, "unregisterApplicationNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUBMITTING_FEEDBACK"), &stru_1000EA660, FBKCommonStrings));
  -[FBABugFormTableViewController showSpinnerWithStatus:](self, "showSpinnerWithStatus:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ID"));

  *(_QWORD *)buf = 0;
  v34 = buf;
  v35 = 0x2020000000;
  v36 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000ED44;
  v29[3] = &unk_1000E6490;
  v13 = v10;
  v30 = v13;
  v14 = v8;
  v31 = v14;
  v32 = buf;
  v15 = objc_msgSend(v11, "beginBackgroundTaskWithName:expirationHandler:", v12, v29);

  *((_QWORD *)v34 + 3) = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  objc_msgSend(v17, "setIsSubmitting:", 1);

  -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v18 = -[FBABugFormTableViewController whooshSoundID](self, "whooshSoundID");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000EDBC;
  v23[3] = &unk_1000E6530;
  v21 = v14;
  v27 = buf;
  v24 = v21;
  v25 = self;
  v28 = v18;
  v22 = v16;
  v26 = v22;
  objc_msgSend(v19, "beginSubmissionForFormResponse:withCollector:completion:", v20, v22, v23);

  _Block_object_dispose(buf, 8);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _DWORD v41[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("FBABugFormDetailPresentation"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "question"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "answerForQuestionID:", v14));
    objc_msgSend(v11, "setAnswer:", v15);

    objc_msgSend(v11, "setQuestion:", v12);
    objc_msgSend(v11, "setDelegate:", self);
    v16 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ID"));
      v41[0] = 67109120;
      v41[1] = objc_msgSend(v17, "unsignedIntValue");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "will show choices for question [%u]", (uint8_t *)v41, 8u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController traitCollection](self, "traitCollection"));
    v19 = objc_msgSend(v18, "horizontalSizeClass");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
    v21 = v20;
    if (v19 == (id)1)
      v22 = 4;
    else
      v22 = 7;
    objc_msgSend(v20, "setModalPresentationStyle:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
    objc_msgSend(v23, "setTransitioningDelegate:", self);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "popoverPresentationController"));

    if (v25)
    {
      v26 = v7;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popoverPresentationController"));
      objc_msgSend(v28, "setSourceView:", v26);

      objc_msgSend(v26, "bounds");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "popoverPresentationController"));
      objc_msgSend(v38, "setSourceRect:", v30, v32, v34, v36);

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationViewController"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "popoverPresentationController"));
      objc_msgSend(v40, "setPermittedArrowDirections:", 0);

    }
  }

}

- (void)didTapDevice:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100099328((uint64_t)v6, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)didTapAttachment:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v17 = 138543362;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tapped on attachment [%{public}@]", (uint8_t *)&v17, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController view](self, "view"));
  objc_msgSend(v10, "endEditing:", 1);

  if (objc_msgSend(v6, "canStartGathering"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "answersDictionary"));
    objc_msgSend(v11, "gatherAttachment:answers:", v6, v13);

    -[FBABugFormTableViewController updateUI:canDismissKeyboard:withCompletion:](self, "updateUI:canDismissKeyboard:withCompletion:", 0, 1, 0);
  }
  else if (objc_msgSend(v6, "isReadyToDisplayContents"))
  {
    v14 = objc_claimAutoreleasedReturnValue(+[FBALog attachHandle](FBALog, "attachHandle"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
      v17 = 138543362;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Will show attachment contents for [%{public}@]", (uint8_t *)&v17, 0xCu);

    }
    -[FBABugFormTableViewController presentAttachment:fromIndexPath:](self, "presentAttachment:fromIndexPath:", v6, v7);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)registerApplicationNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "saveFormForResigningActive:", UIApplicationWillResignActiveNotification, 0);

  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v7 = FBKDidRefreshFormStubsNotification;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FC40;
  v11[3] = &unk_1000E6300;
  objc_copyWeak(&v12, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v7, 0, v6, v11));
  -[FBABugFormTableViewController setDidRefreshFormStubsNotificationObserver:](self, "setDidRefreshFormStubsNotificationObserver:", v8);

  v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Registered for application state notifications", v10, 2u);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)unregisterApplicationNotifications
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unregistering for application state notifications", v9, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationWillResignActiveNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController didRefreshFormStubsNotificationObserver](self, "didRefreshFormStubsNotificationObserver"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notificationCenter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController didRefreshFormStubsNotificationObserver](self, "didRefreshFormStubsNotificationObserver"));
    objc_msgSend(v7, "removeObserver:", v8);

  }
}

- (void)saveFormForResigningActive:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = _os_activity_create((void *)&_mh_execute_header, "Resign Active Save", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FDF8;
  block[3] = &unk_1000E61B8;
  block[4] = self;
  os_activity_apply(v4, block);

}

- (void)registerForKeyboardNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "keyboardWasShown:", UIKeyboardDidShowNotification, 0);

}

- (void)unregisterForKeyboardNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);

}

- (void)keyboardWasShown:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[FBABugFormTableViewController setKeyboardHeight:](self, "setKeyboardHeight:", v6);
}

- (id)alertControllerForDismissWithLaunchAction:(id)a3
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
  void *v13;
  void *v14;
  _QWORD v16[5];
  char v17;
  char v18;
  _QWORD v19[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SAVE_DRAFT_CHOICE"), &stru_1000EA660, 0));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000102A8;
  v19[3] = &unk_1000E61E0;
  v19[4] = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v19));

  LOBYTE(v6) = objc_msgSend(v4, "isCaptive");
  LOBYTE(v7) = objc_msgSend(v4, "shouldMakeFBAVisible");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT_CHOICE"), &stru_1000EA660, 0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000102BC;
  v16[3] = &unk_1000E6578;
  v17 = (char)v6;
  v16[4] = self;
  v18 = (char)v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 2, v16));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, &stru_1000E65B8));

  objc_msgSend(v5, "addAction:", v11);
  if (!v4 || (objc_msgSend(v4, "isCaptive") & 1) == 0)
    objc_msgSend(v5, "addAction:", v8);
  objc_msgSend(v5, "addAction:", v14);

  return v5;
}

- (void)dismiss:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  if (objc_msgSend(v4, "isDirty"))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController launchAction](self, "launchAction"));
    v6 = objc_msgSend(v5, "isCaptive");

    if (!v6)
    {
      -[FBABugFormTableViewController closeDraftAndDelete:withError:completion:](self, "closeDraftAndDelete:withError:completion:", 1, 0, 0);
      goto LABEL_6;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController launchAction](self, "launchAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController alertControllerForDismissWithLaunchAction:](self, "alertControllerForDismissWithLaunchAction:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "popoverPresentationController"));
  objc_msgSend(v9, "setBarButtonItem:", v10);

  -[FBABugFormTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
LABEL_6:

}

- (void)hideQuestions
{
  -[FBABugFormTableViewController setShouldHideQuestions:](self, "setShouldHideQuestions:", 1);
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)showQuestions
{
  -[FBABugFormTableViewController setShouldHideQuestions:](self, "setShouldHideQuestions:", 0);
  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)_showSpinnerWithStatus:(id)a3 userInteractionEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ID"));
    v10 = 134218242;
    v11 = objc_msgSend(v9, "integerValue");
    v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "feedback editor for form [%li] change to state [%{public}@]", (uint8_t *)&v10, 0x16u);

  }
  -[FBABugFormTableViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v6, v4);

}

- (void)showSpinnerWithStatus:(id)a3
{
  -[FBABugFormTableViewController _showSpinnerWithStatus:userInteractionEnabled:](self, "_showSpinnerWithStatus:userInteractionEnabled:", a3, 0);
}

- (void)_stopSpinner
{
  -[FBABugFormTableViewController hideSpinner](self, "hideSpinner");
  -[FBABugFormTableViewController _showInternalToolbarIfNeeded](self, "_showInternalToolbarIfNeeded");
}

- (void)_showInternalToolbarIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = (id)objc_opt_new(NSMutableArray, a2);
  if (FBKIsInternalInstall())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", FBKShowsAutoFillButton);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationController](self, "navigationController"));
      objc_msgSend(v5, "setToolbarHidden:animated:", 0, 1);

      v6 = objc_alloc((Class)UIBarButtonItem);
      v7 = sub_10002575C(CFSTR("Fill in all answers"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, self, "fillInAnswers");

      objc_msgSend(v12, "addObject:", v9);
      v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      objc_msgSend(v12, "addObject:", v10);

    }
    if (objc_msgSend(v12, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v12));
      -[FBABugFormTableViewController setToolbarItems:](self, "setToolbarItems:", v11);

    }
  }

}

- (void)updateSubmitButtonState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
    if (objc_msgSend(v5, "state"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
      v7 = objc_msgSend(v6, "state");

      if (v7 != (id)3)
        goto LABEL_4;
    }
    else
    {

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController submitButton](self, "submitButton"));
    v14 = v12;
    v13 = 0;
LABEL_9:
    objc_msgSend(v12, "setEnabled:", v13);
    goto LABEL_10;
  }
LABEL_4:
  if (!self->_attemptedSubmission)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController submitButton](self, "submitButton"));
    v14 = v12;
    v13 = 1;
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  v9 = objc_msgSend(v8, "validate:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController submitButton](self, "submitButton"));
  objc_msgSend(v10, "setEnabled:", v9);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leftBarButtonItem"));
  objc_msgSend(v11, "setEnabled:", 1);

LABEL_10:
}

- (BOOL)hasFileArea
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "questionGroups"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "isFileCollectionGroup") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)shouldShowFormPicker
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldShowTeamPicker
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = -[FBABugFormTableViewController shouldShowFormPicker](self, "shouldShowFormPicker");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));
    v5 = objc_msgSend(v4, "hasManagedTeams");

    LOBYTE(v2) = v5;
  }
  return v2;
}

- (NSString)teamPickerRowIdentifier
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(FBKTeam);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "teamsMatchingFormID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%i"), v5, v7, (unint64_t)objc_msgSend(v9, "count") > 1));

  return (NSString *)v10;
}

- (NSString)topicPickerRowIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formStub](self, "formStub"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1000EA660;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lu"), v6, -[FBABugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount")));

  return (NSString *)v7;
}

- (BOOL)shouldShowForm
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[FBABugFormTableViewController shouldHideQuestions](self, "shouldHideQuestions"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  if ((objc_msgSend(v4, "isLoading") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController formResponse](self, "formResponse"));
    v3 = v5 != 0;

  }
  return v3;
}

- (BOOL)shouldShowAttachments
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[FBABugFormTableViewController shouldShowForm](self, "shouldShowForm");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController bugForm](self, "bugForm"));
    v5 = objc_msgSend(v4, "collectsFiles");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (_TtC18Feedback_Assistant27FBAAddAttachmentsController)addAttachmentsController
{
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *addAttachmentsController;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v4;
  _TtC18Feedback_Assistant27FBAAddAttachmentsController *v5;

  addAttachmentsController = self->_addAttachmentsController;
  if (!addAttachmentsController)
  {
    v4 = -[FBAAddAttachmentsController initWithDelegate:]([_TtC18Feedback_Assistant27FBAAddAttachmentsController alloc], "initWithDelegate:", self);
    v5 = self->_addAttachmentsController;
    self->_addAttachmentsController = v4;

    addAttachmentsController = self->_addAttachmentsController;
  }
  return addAttachmentsController;
}

- (void)updateCachedCandidateStubsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController candidateFormStubsPredicate](self, "candidateFormStubsPredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController currentTeam](self, "currentTeam"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bugFormStubsForPickerWithPredicate:team:", v5, v6));
  -[FBABugFormTableViewController setCachedCandidateStubsCount:](self, "setCachedCandidateStubsCount:", objc_msgSend(v7, "count"));

  v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = -[FBABugFormTableViewController cachedCandidateStubsCount](self, "cachedCandidateStubsCount");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Draft has [%lu] candidate stubs", (uint8_t *)&v9, 0xCu);
  }

  -[FBABugFormTableViewController updateUI:](self, "updateUI:", 0);
}

- (void)fillInAnswers
{
  id v3;

  -[FBABugFormTableViewController setAttemptedSubmission:](self, "setAttemptedSubmission:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
  objc_msgSend(v3, "automaticallyFillInAllAnswers");

}

- (id)currentTeam
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController itemFromDraft](self, "itemFromDraft"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "singleTeam"));

  return v3;
}

- (void)textViewDidBeginEditing:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
  if (v4)
  {
    do
    {
      v5 = objc_opt_class(FBAQuestionAnswerCell);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

      v4 = (void *)v6;
    }
    while (v6);
  }
  v7 = objc_opt_class(FBAQuestionAnswerCell);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    objc_msgSend(v4, "setShowError:", 0);
    -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftBarButtonItem"));
  -[FBABugFormTableViewController setCancelBarButtonItem:](self, "setCancelBarButtonItem:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rightBarButtonItem"));
  -[FBABugFormTableViewController setSubmitBarButtonItem:](self, "setSubmitBarButtonItem:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setLeftBarButtonItem:animated:", 0, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v15, "resignFirstResponder");
  objc_msgSend(v13, "setRightBarButtonItem:animated:", v14, 1);

  -[FBABugFormTableViewController _resizeAndScrollTableAfterTextChangeInTextView:](self, "_resizeAndScrollTableAfterTextChangeInTextView:", v15);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "superviewWithClass:", objc_opt_class(FBAQuestionAnswerCell));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "question"));
  v13 = objc_msgSend(v12, "answerType");

  if (!v13)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("\n")) & 1) != 0)
    {
      v14 = 0;
      goto LABEL_3;
    }
    if (objc_msgSend(v9, "containsString:", CFSTR("\n")))
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "beginningOfDocument"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v17, location));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "positionFromPosition:offset:", v18, length));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textRangeFromPosition:toPosition:", v18, v19));
      objc_msgSend(v8, "replaceRange:withText:", v20, v16);

      v14 = 0;
      v9 = (id)v16;
      goto LABEL_3;
    }
  }
  v14 = 1;
LABEL_3:

  return v14;
}

- (void)_resizeAndScrollTableAfterTextChangeInTextView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id buf[2];
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (-[FBABugFormTableViewController isUpdatingTable](self, "isUpdatingTable"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Is updating table, will resize cell later", (uint8_t *)buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001143C;
    v16[3] = &unk_1000E6378;
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v6, "addOperationWithBlock:", v16);

  }
  else
  {
    v7 = objc_initWeak(buf, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController diffableDataSource](self, "diffableDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));

    WeakRetained = objc_loadWeakRetained(buf);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "diffableDataSource"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100011448;
    v12[3] = &unk_1000E62D8;
    v13 = v4;
    objc_copyWeak(&v14, buf);
    objc_msgSend(v11, "applySnapshot:animatingDifferences:completion:", v9, 0, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }

}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "superview"));
  if (v4)
  {
    while (1)
    {
      v14 = (id)v4;
      v5 = objc_opt_class(FBAQuestionAnswerCell);
      if ((objc_opt_isKindOfClass(v14, v5) & 1) != 0)
        break;
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));

      v4 = v6;
      if (!v6)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v14 = 0;
  }
  v7 = objc_opt_class(FBAQuestionAnswerCell);
  if ((objc_opt_isKindOfClass(v14, v7) & 1) != 0)
  {
    objc_msgSend(v14, "endEditingQuestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController draftingController](self, "draftingController"));
    v9 = (objc_msgSend(v8, "isDirty") & 1) != 0
      || -[FBABugFormTableViewController isCaptiveModeEnabled](self, "isCaptiveModeEnabled");
    -[FBABugFormTableViewController setModalInPresentation:](self, "setModalInPresentation:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController cancelBarButtonItem](self, "cancelBarButtonItem"));
  objc_msgSend(v10, "setLeftBarButtonItem:animated:", v11, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController navigationItem](self, "navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController submitBarButtonItem](self, "submitBarButtonItem"));
  objc_msgSend(v12, "setRightBarButtonItem:animated:", v13, 0);

  -[FBABugFormTableViewController setCancelBarButtonItem:](self, "setCancelBarButtonItem:", 0);
  -[FBABugFormTableViewController setSubmitBarButtonItem:](self, "setSubmitBarButtonItem:", 0);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  FBAPartialPresentationController *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double height;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  FBABugFormTableViewController *v56;
  void *v57;
  NSAttributedStringKey v58;
  void *v59;
  NSAttributedStringKey v60;
  void *v61;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
    goto LABEL_6;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
  v12 = objc_opt_class(FBABugFormDetailTableViewController);
  isKindOfClass = objc_opt_isKindOfClass(v11, v12);

  if ((isKindOfClass & 1) == 0)
  {

LABEL_6:
    v15 = 0;
    goto LABEL_9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
  v15 = -[FBAPartialPresentationController initWithPresentedViewController:presentingViewController:]([FBAPartialPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v10, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windows"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "question"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "text"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController view](self, "view"));
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v60 = NSFontAttributeName;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  v61 = v28;
  v56 = self;
  v57 = (void *)v22;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
  v30 = (void *)v22;
  v31 = v14;
  objc_msgSend(v30, "boundingRectWithSize:options:attributes:context:", 1, v29, 0, v25, v27);
  v33 = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "question"));
  v35 = objc_msgSend(v34, "answerType");

  if (v35 == (id)4)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CHECKBOX_FOOTER_TITLE"), &stru_1000EA660, 0));

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController view](v56, "view"));
    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v58 = NSFontAttributeName;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v59 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
    objc_msgSend(v37, "boundingRectWithSize:options:attributes:context:", 1, v44, 0, v40, v42);
    height = v45;

  }
  else
  {
    height = CGRectZero.size.height;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "tableView"));
  objc_msgSend(v47, "rectForSection:", 0);
  v49 = height + v33 + v48;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "tableView"));
  objc_msgSend(v50, "estimatedRowHeight");
  v52 = v49 + v51 * 0.5;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
  objc_msgSend(v53, "bounds");
  -[FBAPartialPresentationController setHeight:](v15, "setHeight:", v20 + v52 + v54);

LABEL_9:
  return v15;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController presentedViewController](self, "presentedViewController"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v10, "horizontalSizeClass");

    if (v8 != v9)
      -[FBABugFormTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }

}

- (BOOL)isReadyForDropSessionFromController:(id)a3 tableView:(id)a4 dropSessionDidUpdate:(id)a5 withDestinationIndexPath:(id)a6
{
  _BOOL4 v7;

  v7 = -[FBABugFormTableViewController hasFileArea](self, "hasFileArea", a3, a4, a5, a6);
  if (v7)
    LOBYTE(v7) = -[FBABugFormTableViewController shouldShowForm](self, "shouldShowForm");
  return v7;
}

- (void)attachmentsAlert:(id)a3 needsDeviceDiagnosticsController:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController devicesController](self, "devicesController"));
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)attachmentsAlertDidSelectOption:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController view](self, "view", a3));
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011BA0;
  v5[3] = &unk_1000E61B8;
  v5[4] = self;
  objc_msgSend(v4, "addOperationWithBlock:", v5);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[FBABugFormTableViewController closeWithCompletion:](self, "closeWithCompletion:", 0);
}

- (BOOL)isCaptiveModeEnabled
{
  FBABugFormTableViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBABugFormTableViewController launchAction](self, "launchAction"));
  LOBYTE(v2) = -[FBABugFormTableViewController isCaptiveModeEnabledForLaunchAction:](v2, "isCaptiveModeEnabledForLaunchAction:", v3);

  return (char)v2;
}

- (BOOL)isCaptiveModeEnabledForLaunchAction:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isCaptive");
  else
    return 0;
}

- (NSDictionary)pendingQandA
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingQandA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)extensions
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSPredicate)candidateFormStubsPredicate
{
  return self->_candidateFormStubsPredicate;
}

- (void)setCandidateFormStubsPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_candidateFormStubsPredicate, a3);
}

- (FBKDraftingController)draftingController
{
  return self->_draftingController;
}

- (void)setDraftingController:(id)a3
{
  objc_storeStrong((id *)&self->_draftingController, a3);
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (FBKDeviceDiagnosticsController)devicesController
{
  return self->_devicesController;
}

- (void)setDevicesController:(id)a3
{
  objc_storeStrong((id *)&self->_devicesController, a3);
}

- (UIBarButtonItem)submitButton
{
  return (UIBarButtonItem *)objc_loadWeakRetained((id *)&self->_submitButton);
}

- (void)setSubmitButton:(id)a3
{
  objc_storeWeak((id *)&self->_submitButton, a3);
}

- (BOOL)attemptedSubmission
{
  return self->_attemptedSubmission;
}

- (void)setAttemptedSubmission:(BOOL)a3
{
  self->_attemptedSubmission = a3;
}

- (NSDictionary)pendingAttachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPendingAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)whooshSoundID
{
  return self->_whooshSoundID;
}

- (void)setWhooshSoundID:(unsigned int)a3
{
  self->_whooshSoundID = a3;
}

- (BOOL)hasLoadedFirstDraft
{
  return self->_hasLoadedFirstDraft;
}

- (void)setHasLoadedFirstDraft:(BOOL)a3
{
  self->_hasLoadedFirstDraft = a3;
}

- (BOOL)isEstablishingBugSession
{
  return self->_isEstablishingBugSession;
}

- (void)setIsEstablishingBugSession:(BOOL)a3
{
  self->_isEstablishingBugSession = a3;
}

- (unint64_t)cachedCandidateStubsCount
{
  return self->_cachedCandidateStubsCount;
}

- (void)setCachedCandidateStubsCount:(unint64_t)a3
{
  self->_cachedCandidateStubsCount = a3;
}

- (id)didRefreshFormStubsNotificationObserver
{
  return self->_didRefreshFormStubsNotificationObserver;
}

- (void)setDidRefreshFormStubsNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_didRefreshFormStubsNotificationObserver, a3);
}

- (BOOL)isUpdatingTable
{
  return self->_isUpdatingTable;
}

- (void)setIsUpdatingTable:(BOOL)a3
{
  self->_isUpdatingTable = a3;
}

- (BOOL)allowKeyboardDismissalForSnapshot
{
  return self->_allowKeyboardDismissalForSnapshot;
}

- (void)setAllowKeyboardDismissalForSnapshot:(BOOL)a3
{
  self->_allowKeyboardDismissalForSnapshot = a3;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  return self->_cancelBarButtonItem;
}

- (void)setCancelBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, a3);
}

- (UIBarButtonItem)submitBarButtonItem
{
  return self->_submitBarButtonItem;
}

- (void)setSubmitBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_submitBarButtonItem, a3);
}

- (BOOL)shouldHideQuestions
{
  return self->_shouldHideQuestions;
}

- (void)setShouldHideQuestions:(BOOL)a3
{
  self->_shouldHideQuestions = a3;
}

- (id)notificationObserver
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setNotificationObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (NSMutableDictionary)cellHeights
{
  return self->_cellHeights;
}

- (void)setCellHeights:(id)a3
{
  objc_storeStrong((id *)&self->_cellHeights, a3);
}

- (FBKBugFormStub)pendingStub
{
  return self->_pendingStub;
}

- (void)setPendingStub:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStub, a3);
}

- (FBKManagedFeedbackObject)pendingFeedbackObject
{
  return self->_pendingFeedbackObject;
}

- (void)setPendingFeedbackObject:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFeedbackObject, a3);
}

- (FBKTeam)pendingTeam
{
  return self->_pendingTeam;
}

- (void)setPendingTeam:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTeam, a3);
}

- (BOOL)viewHasBecomeVisible
{
  return self->_viewHasBecomeVisible;
}

- (void)setViewHasBecomeVisible:(BOOL)a3
{
  self->_viewHasBecomeVisible = a3;
}

- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)addAttachmentCell
{
  return (_TtC18Feedback_Assistant21FBAAddAttachmentsCell *)objc_loadWeakRetained((id *)&self->_addAttachmentCell);
}

- (void)setAddAttachmentCell:(id)a3
{
  objc_storeWeak((id *)&self->_addAttachmentCell, a3);
}

- (FBABugFormDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void)setAddAttachmentsController:(id)a3
{
  objc_storeStrong((id *)&self->_addAttachmentsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAttachmentsController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_addAttachmentCell);
  objc_storeStrong((id *)&self->_pendingTeam, 0);
  objc_storeStrong((id *)&self->_pendingFeedbackObject, 0);
  objc_storeStrong((id *)&self->_pendingStub, 0);
  objc_storeStrong((id *)&self->_cellHeights, 0);
  objc_storeStrong(&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_submitBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong(&self->_didRefreshFormStubsNotificationObserver, 0);
  objc_storeStrong((id *)&self->_pendingAttachments, 0);
  objc_destroyWeak((id *)&self->_submitButton);
  objc_storeStrong((id *)&self->_devicesController, 0);
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_draftingController, 0);
  objc_storeStrong((id *)&self->_candidateFormStubsPredicate, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_pendingQandA, 0);
}

@end
