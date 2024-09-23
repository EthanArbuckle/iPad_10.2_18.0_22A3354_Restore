@implementation iFBAFormResponseDraftViewController

- (iFBAFormResponseDraftViewController)initWithCoder:(id)a3
{
  iFBAFormResponseDraftViewController *v3;
  iFBAFormResponseDraftViewController *v4;
  NSArray *sections;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)iFBAFormResponseDraftViewController;
  v3 = -[iFBAFormResponseDraftViewController initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_suppressUnsolicitedResponse = 0;
    sections = v3->_sections;
    v3->_sections = 0;

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)iFBAFormResponseDraftViewController;
  -[iFBAFormResponseDraftViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setEstimatedSectionFooterHeight:", 0.0);

  -[iFBAFormResponseDraftViewController updateBarButton](self, "updateBarButton");
  -[iFBAFormResponseDraftViewController updateHeader](self, "updateHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setRowHeight:", UITableViewAutomaticDimension);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setEstimatedRowHeight:", 100.0);

  v7 = objc_alloc((Class)UIView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v8, "frame");
  v9 = objc_msgSend(v7, "initWithFrame:", 0.0, 0.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setTableHeaderView:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setLargeTitleDisplayMode:", 2);

  -[iFBAFormResponseDraftViewController configureActionsMenu](self, "configureActionsMenu");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)iFBAFormResponseDraftViewController;
  -[iFBAFormResponseDraftViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItemObserver](self, "contentItemObserver"));
  objc_msgSend(v4, "removeObserver:", v5);

  -[iFBAFormResponseDraftViewController hideSpinner](self, "hideSpinner");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)iFBAFormResponseDraftViewController;
  -[iFBAFormResponseDraftViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (FBKFormResponseStub)responseStub
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formResponseStub"));

  return (FBKFormResponseStub *)v3;
}

- (void)setContentItem:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *contentItemObserver;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[16];

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ID"));
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v7, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Viewing Stub Response Item with ID  [%i]", buf, 8u);

  }
  objc_storeStrong((id *)&self->_contentItem, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItemObserver](self, "contentItemObserver"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItemObserver](self, "contentItemObserver"));
    objc_msgSend(v9, "removeObserver:", v10);

  }
  objc_initWeak((id *)buf, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10001B39C;
  v39[3] = &unk_1000E6328;
  objc_copyWeak(&v40, (id *)buf);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10001B434;
  v37[3] = &unk_1000E6848;
  v37[4] = self;
  v11 = objc_retainBlock(v39);
  v38 = v11;
  v12 = objc_retainBlock(v37);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001B4F8;
  v33[3] = &unk_1000E68C0;
  v33[4] = self;
  objc_copyWeak(&v36, (id *)buf);
  v13 = v12;
  v34 = v13;
  v14 = v11;
  v35 = v14;
  v15 = objc_retainBlock(v33);
  v16 = objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16, "managedObjectContext"));
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10001B984;
  v29 = &unk_1000E68E8;
  v18 = v5;
  v30 = v18;
  objc_copyWeak(&v32, (id *)buf);
  v19 = v15;
  v31 = v19;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addObjectsDidChangeNotificationObserver:", &v26));
  contentItemObserver = self->_contentItemObserver;
  self->_contentItemObserver = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem", v26, v27, v28, v29));
  LOBYTE(v16) = v22 == 0;

  v23 = v14;
  if ((v16 & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("LOADING_ELLIPSES"), &stru_1000EA660, 0));
    -[iFBAFormResponseDraftViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v25, 1);

    -[iFBAFormResponseDraftViewController updateHeader](self, "updateHeader");
    v23 = v19;
  }
  ((void (*)(void))v23[2])();

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

}

- (BOOL)shouldShowStatus
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
  v3 = objc_msgSend(v2, "itemType") == (id)4;

  return v3;
}

- (void)updateContent
{
  void *v3;
  FBARDVSection *v4;
  FBARDVRow *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController responseStub](self, "responseStub"));

  if (v3)
  {
    v4 = -[FBARDVSection initWithTitle:type:]([FBARDVSection alloc], "initWithTitle:type:", 0, 0);
    v5 = -[FBARDVRow initWithTitle:subtitle:object:]([FBARDVRow alloc], "initWithTitle:subtitle:object:", 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBARDVSection rows](v4, "rows"));
    objc_msgSend(v6, "addObject:", v5);

    objc_msgSend(v8, "addObject:", v4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
  -[iFBAFormResponseDraftViewController setSections:](self, "setSections:", v7);

}

- (void)setSuppressUnsolicitedResponse:(BOOL)a3
{
  id v3;

  self->_suppressUnsolicitedResponse = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)updateBarButton
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
  v4 = objc_msgSend(v3, "itemType");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController navigationItem](self, "navigationItem"));
  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController editBarButton](self, "editBarButton"));
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
  else
  {
    objc_msgSend(v6, "setRightBarButtonItem:", 0);
  }

}

- (void)updateHeader
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController responseStub](self, "responseStub"));

  if (v3)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setTitle:", v4);

  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100099B48(v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LOADING_ELLIPSES"), &stru_1000EA660, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (NSDateFormatter)dateFormatter
{
  if (qword_100118008 != -1)
    dispatch_once(&qword_100118008, &stru_1000E6908);
  return (NSDateFormatter *)(id)qword_100118000;
}

- (BOOL)shouldDisplayUnsolicitedFollowup
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  if (-[iFBAFormResponseDraftViewController suppressUnsolicitedResponse](self, "suppressUnsolicitedResponse"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController responseStub](self, "responseStub"));
  v4 = objc_msgSend(v3, "isSubmitted");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController responseStub](self, "responseStub"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "feedback"));
  v7 = objc_msgSend(v6, "allowUnsolicitedFollowup");

  return v7;
}

- (void)configureActionsMenu
{
  NSObject *v3;
  void *v4;
  void *v5;
  _TtC18Feedback_Assistant23FBAActionMenuController *v6;
  void *v7;
  void *v8;
  void *v9;
  _TtC18Feedback_Assistant25FBAActionControllerAction *v10;
  void *v11;
  void *v12;
  void *v13;
  _TtC18Feedback_Assistant25FBAActionControllerAction *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  unsigned int v19;

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ID"));
    *(_DWORD *)buf = 67109120;
    v19 = objc_msgSend(v5, "intValue");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "edit button tapped for form response [%i]", buf, 8u);

  }
  v6 = -[FBAActionMenuController initWithTitle:subtitle:actions:]([_TtC18Feedback_Assistant23FBAActionMenuController alloc], "initWithTitle:subtitle:actions:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_DRAFT"), CFSTR("Edit Draft"), CFSTR("CommonStrings")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", FBKImageNameEditDraft));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C11C;
  v17[3] = &unk_1000E6930;
  v17[4] = self;
  -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v8, v9, v17);

  v10 = [_TtC18Feedback_Assistant25FBAActionControllerAction alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT"), CFSTR("Delete Draft"), CFSTR("CommonStrings")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNameDeleteDraft));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001C178;
  v16[3] = &unk_1000E6930;
  v16[4] = self;
  v14 = -[FBAActionControllerAction initWithTitle:image:actionHandler:](v10, "initWithTitle:image:actionHandler:", v12, v13, v16);

  -[FBAActionControllerAction setDestructive:](v14, "setDestructive:", 1);
  -[FBAActionMenuController addAction:](v6, "addAction:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController editBarButton](self, "editBarButton"));
  -[FBAActionMenuController attachToBarButtonItem:](v6, "attachToBarButtonItem:", v15);

}

- (void)deleteDraft:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  iFBAFormResponseDraftViewController *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v6 = a4;
  v24 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, -[iFBAFormResponseDraftViewController objc_preferredAlertStyle](self, "objc_preferredAlertStyle")));
  v8 = objc_msgSend(v7, "preferredStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if (v8 == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT_PROMPT_SHORT"), CFSTR("Are you sure you want to delete this draft?"), CFSTR("CommonStrings")));
    objc_msgSend(v7, "setTitle:", v11);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v12 = CFSTR("CANNOT_UNDO");
    v13 = CFSTR("This cannot be undone.");
  }
  else
  {
    v12 = CFSTR("DELETE_DRAFT_PROMPT_LONG");
    v13 = CFSTR("Are you sure you want to delete this draft? This cannot be undone.");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v12, v13, CFSTR("CommonStrings")));
  objc_msgSend(v7, "setMessage:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT_PROMPT"), CFSTR("Delete Draft"), CFSTR("CommonStrings")));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001C454;
  v27[3] = &unk_1000E63F0;
  v27[4] = self;
  v17 = self;
  v18 = v6;
  v28 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 2, v27));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), CFSTR("Cancel"), CFSTR("CommonStrings")));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001C4D0;
  v25[3] = &unk_1000E63F0;
  v25[4] = v17;
  v26 = v18;
  v22 = v18;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, v25));

  objc_msgSend(v7, "addAction:", v19);
  objc_msgSend(v7, "addAction:", v23);
  objc_msgSend(v24, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController sections](self, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));

  if (objc_msgSend(v6, "sectionType") == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
    -[iFBAFormResponseDraftViewController didTapCloseFeedbackWithItem:atIndexPath:](self, "didTapCloseFeedbackWithItem:atIndexPath:", v7, v8);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController sections](self, "sections", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController sections](self, "sections", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionTitle"));

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController sections](self, "sections", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rows"));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController sections](self, "sections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rows"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  v12 = (char *)objc_msgSend(v9, "sectionType");
  if ((unint64_t)(v12 - 2) < 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v14, v7));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v15, "setTextColor:", v13);

    goto LABEL_6;
  }
  if (v12 == (char *)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v16, v7));

    objc_msgSend(v10, "setSelectionStyle:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v18, "setText:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v20, "setTextColor:", v19);

    objc_msgSend(v10, "setGatherState:", 2);
    objc_msgSend(v10, "setAccessoryType:", 0);
    goto LABEL_8;
  }
  if (!v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FormResponseDetailCell"), v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFormResponseDraftViewController contentItem](self, "contentItem"));
    objc_msgSend(v10, "setContentItem:", v13);
LABEL_6:

  }
LABEL_8:

  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C8FC;
  v4[3] = &unk_1000E69B8;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

- (BOOL)suppressUnsolicitedResponse
{
  return self->_suppressUnsolicitedResponse;
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (iFBAResponseDetailHeaderView)headerView
{
  return (iFBAResponseDetailHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (UIBarButtonItem)editBarButton
{
  return self->_editBarButton;
}

- (void)setEditBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_editBarButton, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSObject)contentItemObserver
{
  return self->_contentItemObserver;
}

- (void)setContentItemObserver:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemObserver, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_editBarButton, 0);
  objc_destroyWeak((id *)&self->_headerView);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
