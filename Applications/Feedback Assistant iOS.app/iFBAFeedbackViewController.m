@implementation iFBAFeedbackViewController

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)iFBAFeedbackViewController;
  -[iFBAFeedbackViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[iFBAFeedbackViewController hideSpinner](self, "hideSpinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController refreshControl](self, "refreshControl"));
  objc_msgSend(v4, "endRefreshing");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)iFBAFeedbackViewController;
  -[iFBAFeedbackViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[iFBAFeedbackViewController setPendingFollowup:](self, "setPendingFollowup:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)iFBAFeedbackViewController;
  -[iFBAFeedbackViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)iFBAFeedbackViewController;
  -[iFBAFeedbackViewController viewDidLoad](&v18, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setEstimatedSectionFooterHeight:", 0.0);

  -[iFBAFeedbackViewController updateTitleView](self, "updateTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setRowHeight:", UITableViewAutomaticDimension);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setEstimatedRowHeight:", 100.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  -[iFBAFeedbackViewController setObserverTokens:](self, "setObserverTokens:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setLargeTitleDisplayMode:", 2);

  -[iFBAFeedbackViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", 0);
  v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 3.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setTableHeaderView:", v9);

  v11 = objc_alloc_init((Class)UIRefreshControl);
  -[iFBAFeedbackViewController setRefreshControl:](self, "setRefreshControl:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController refreshControl](self, "refreshControl"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_refreshFeedbackContentWithControl:", 4096);

  -[iFBAFeedbackViewController configureKeyboardShortcuts](self, "configureKeyboardShortcuts");
  -[iFBAFeedbackViewController configureActionsMenu](self, "configureActionsMenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier"));
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(FBKAttachmentCell));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v13, v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v17, "registerNib:forCellReuseIdentifier:", v16, v13);

}

- (void)configureKeyboardShortcuts
{
  void *v3;
  uint64_t v4;
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
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("R"), 0x100000, "_refreshFeedbackContentWithControl:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = FBKCommonStrings;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REFRESH_FEEDBACK"), &stru_1000EA660, FBKCommonStrings));
  objc_msgSend(v15, "setDiscoverabilityTitle:", v5);

  -[iFBAFeedbackViewController addKeyCommand:](self, "addKeyCommand:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("R"), 1572864, "reloadAppProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REFRESH"), &stru_1000EA660, v4));
  objc_msgSend(v6, "setDiscoverabilityTitle:", v8);

  -[iFBAFeedbackViewController addKeyCommand:](self, "addKeyCommand:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("C"), 1179648, "copyFeedbackID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COPY_FEEDBACK_ID"), &stru_1000EA660, v4));
  objc_msgSend(v9, "setDiscoverabilityTitle:", v11);

  -[iFBAFeedbackViewController addKeyCommand:](self, "addKeyCommand:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("C"), 1703936, "copyFeedbackIDAndTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("COPY_ID_AND_TITLE"), &stru_1000EA660, v4));
  objc_msgSend(v12, "setDiscoverabilityTitle:", v14);

  -[iFBAFeedbackViewController addKeyCommand:](self, "addKeyCommand:", v12);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController traitCollection](self, "traitCollection", a3));
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  if (v5 == (id)1)
  {
    v7 = 1.0;
    v8 = 1.0;
    v9 = v6;
  }
  else
  {
    v9 = v6;
    v7 = 20.0;
    v8 = 20.0;
  }
  objc_msgSend(v6, "_setSectionContentInset:", 0.0, v7, 0.0, v8);

}

- (void)dealloc
{
  objc_super v3;

  -[iFBAFeedbackViewController resetObserverTokens](self, "resetObserverTokens");
  v3.receiver = self;
  v3.super_class = (Class)iFBAFeedbackViewController;
  -[iFBAFeedbackViewController dealloc](&v3, "dealloc");
}

- (void)setContentItem:(id)a3
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *observedUploadTasks;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_contentItem, a3);
  v6 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 5);
  observedUploadTasks = self->_observedUploadTasks;
  self->_observedUploadTasks = v6;

  if (v5)
  {
    -[iFBAFeedbackViewController updateTitleView](self, "updateTitleView");
    -[iFBAFeedbackViewController _refreshFeedbackContent](self, "_refreshFeedbackContent");
  }
  else
  {
    -[iFBAFeedbackViewController updateEverything](self, "updateEverything");
  }
  -[iFBAFeedbackViewController resetObserverTokens](self, "resetObserverTokens");
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController observerTokens](self, "observerTokens"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100044B5C;
  v15 = &unk_1000E6190;
  objc_copyWeak(&v16, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addObjectsDidChangeNotificationObserver:", &v12));
  objc_msgSend(v8, "addObject:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)resetObserverTokens
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController observerTokens](self, "observerTokens", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v9, "removeObserver:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController observerTokens](self, "observerTokens"));
  objc_msgSend(v10, "removeAllObjects");

}

- (void)handleModelChanges:(id)a3
{
  id v4;
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
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  unsigned __int8 v43;
  unsigned __int8 v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  id v64;
  iFBAFeedbackViewController *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  _QWORD v74[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  _BYTE v82[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController observedUploadTasks](self, "observedUploadTasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "feedback"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "feedback"));
    objc_msgSend(v5, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formResponseStub"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "formResponseStub"));

    objc_msgSend(v5, "addObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filePromiseStubs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));

    if (v18)
      objc_msgSend(v5, "addObjectsFromArray:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "feedback"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "feedbackFollowups"));

  if (v21)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "feedback"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "feedbackFollowups"));

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v5, "addObject:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uploadTask"));

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uploadTask"));
            objc_msgSend(v6, "addObject:", v31);

          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "filePromises"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));

          if (v33)
            objc_msgSend(v5, "addObjectsFromArray:", v33);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
      }
      while (v26);
    }

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "contentItem"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "formResponse"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uploadTask"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "contentItem"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "formResponse"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uploadTask"));
    objc_msgSend(v6, "addObject:", v41);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatedObjects"));
  v43 = objc_msgSend(v42, "intersectsSet:", v5);

  if ((v43 & 1) != 0)
  {
    v44 = 1;
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refreshedObjects"));
    v44 = objc_msgSend(v45, "intersectsSet:", v5);

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "insertedObjects"));
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100045490;
  v74[3] = &unk_1000E6D28;
  v74[4] = self;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "ded_selectItemsPassingTest:", v74));

  if (objc_msgSend(v47, "count"))
  {
    v48 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "valueForKeyPath:", CFSTR("ID")));
      *(_DWORD *)buf = 138412290;
      v81 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "inserted FFUs [%@]", buf, 0xCu);

    }
    v44 = 1;
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deletedObjects"));
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100045538;
  v73[3] = &unk_1000E6D28;
  v73[4] = self;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "ded_selectItemsPassingTest:", v73));

  v68 = v51;
  if (objc_msgSend(v51, "count"))
  {
    v52 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "valueForKeyPath:", CFSTR("ID")));
      *(_DWORD *)buf = 138412290;
      v81 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "removed FFUs [%@]", buf, 0xCu);

    }
    v44 = 1;
  }
  v65 = self;
  v66 = v47;
  v54 = objc_opt_class(FBKUploadTask);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v67 = v4;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deletedObjects"));
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v57; j = (char *)j + 1)
      {
        if (*(_QWORD *)v70 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
        if ((objc_opt_isKindOfClass(v60, v54) & 1) != 0)
        {
          v61 = v60;
          if (objc_msgSend(v6, "containsObject:", v61))
          {
            v62 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "taskIdentifier"));
              v64 = objc_msgSend(v63, "unsignedLongValue");
              *(_DWORD *)buf = 134217984;
              v81 = v64;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Deleted upload task [%lu]. Will update view", buf, 0xCu);

            }
            v44 = 1;
          }

        }
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    }
    while (v57);
  }

  if ((v44 & 1) != 0)
    -[iFBAFeedbackViewController updateEverything](v65, "updateEverything");

}

- (id)feedback
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "detailedItem"));

  return v3;
}

- (void)_refreshFeedbackContent
{
  -[iFBAFeedbackViewController _refreshFeedbackContentForced:](self, "_refreshFeedbackContentForced:", 0);
}

- (void)_refreshFeedbackContentWithControl:(id)a3
{
  -[iFBAFeedbackViewController _refreshFeedbackContentForced:](self, "_refreshFeedbackContentForced:", 1);
}

- (void)_refreshFeedbackContentForced:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v3 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100045764;
  v13[3] = &unk_1000E61B8;
  v13[4] = self;
  v5 = objc_retainBlock(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOADING_ELLIPSES"), &stru_1000EA660, 0));
  -[iFBAFeedbackViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v7, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100045A44;
  v11[3] = &unk_1000E7AB8;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "getFeedbackForContentItem:forceRefresh:completion:", v9, v3, v11);

}

- (void)autoLogOutIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  iFBAFeedbackViewController *v37;
  char v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;

  v3 = objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController launchAction](self, "launchAction"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController launchAction](self, "launchAction"));
    v6 = objc_msgSend(v5, "isCaptive");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formResponse"));

      if (v8 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadTask")), v9, v9))
      {
        v10 = 0;
      }
      else
      {
        v11 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ID"));
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
          v14 = (void *)v13;
          if (v13)
            v15 = (const __CFString *)v13;
          else
            v15 = CFSTR("nil");
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadTask"));
          v17 = (void *)v16;
          if (v16)
            v18 = (const __CFString *)v16;
          else
            v18 = CFSTR("nil");
          *(_DWORD *)buf = 138543618;
          v40 = v15;
          v41 = 2114;
          v42 = v18;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Form response [%{public}@] or upload task [%{public}@] is nil, exiting restricted mode.", buf, 0x16u);

        }
        v10 = 1;
      }
      if (objc_msgSend(v8, "serverSideIsComplete"))
      {
        v19 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Server side has marked FR as complete, exiting restricted mode.", buf, 2u);
        }

        v10 = 1;
      }
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadTask"));
      if (v20
        && (v21 = (void *)v20,
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadTask")),
            v23 = objc_msgSend(v22, "localSubmissionStage"),
            v22,
            v21,
            v23 == (id)6))
      {
        v24 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadTask"));
          v26 = (void *)v25;
          v27 = CFSTR("nil");
          if (v25)
            v27 = (const __CFString *)v25;
          *(_DWORD *)buf = 138543362;
          v40 = v27;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Upload task [%{public}@] completed, exiting restricted mode.", buf, 0xCu);

        }
      }
      else if (!v10)
      {
LABEL_28:

        return;
      }
      -[iFBAFeedbackViewController resetObserverTokens](self, "resetObserverTokens");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("UPLOAD_COMPLETE_TITLE"), CFSTR("Upload Complete"), 0));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("UPLOAD_COMPLETE_MESSAGE"), CFSTR("Your diagnostics have been sent to Apple."), 0));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v29, v31, 1));

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController launchAction](self, "launchAction"));
      LOBYTE(v29) = objc_msgSend(v33, "shouldMakeFBAVisible");

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100046124;
      v35[3] = &unk_1000E7638;
      v36 = v32;
      v37 = self;
      v38 = (char)v29;
      v34 = v32;
      -[iFBAFeedbackViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, v35);
      -[iFBAFeedbackViewController setLaunchAction:](self, "setLaunchAction:", 0);

      goto LABEL_28;
    }
  }
}

- (void)updateEverything
{
  void *v3;
  id v4;

  -[iFBAFeedbackViewController configureActionsMenu](self, "configureActionsMenu");
  -[iFBAFeedbackViewController updateTitleView](self, "updateTitleView");
  -[iFBAFeedbackViewController updateBody](self, "updateBody");
  -[iFBAFeedbackViewController autoLogOutIfNeeded](self, "autoLogOutIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setBackgroundView:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)updateBody
{
  id v3;
  Row *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  Row *v14;
  void *v15;
  Row *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  Row *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  Row *v32;
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
  void *v43;
  void *v44;
  void *v45;
  OSStatus (__cdecl **v46)(SystemSoundID);
  void **p_vtable;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  Row *v58;
  Row *v59;
  unint64_t v60;
  Row *v61;
  void *v62;
  Row *v63;
  void *v64;
  Row *v65;
  Row *v66;
  void *v67;
  uint64_t v68;
  Row *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  void *i;
  void *v82;
  Row *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  unsigned int *v90;
  uint64_t v91;
  uint64_t v92;
  iFBAFeedbackViewController *v93;
  id v94;
  uint64_t v95;
  NSObject *v96;
  void *v97;
  id v98;
  Row *v99;
  Row *v100;
  void *v101;
  void *v102;
  void *v103;
  uint8_t v104;
  _BYTE v105[15];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t v118[128];
  uint8_t buf[4];
  int v120;
  _BYTE v121[128];
  void *v122;
  _BYTE v123[128];
  Row *v124;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
  if (-[iFBAFeedbackViewController showsAssigneeRow](self, "showsAssigneeRow"))
  {
    v4 = -[Row initWithType:]([Row alloc], "initWithType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    -[Row setObject:](v4, "setObject:", v5);

    v7 = (void *)objc_opt_new(Section, v6);
    v124 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v124, 1));
    objc_msgSend(v7, "setRows:", v8);

    objc_msgSend(v3, "addObject:", v7);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "formResponseStub"));

  if (v10)
  {
    v97 = v3;
    v12 = (void *)objc_opt_new(Section, v11);
    objc_msgSend(v12, "setTitle:", 0);
    v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
    v14 = -[Row initWithType:]([Row alloc], "initWithType:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    -[Row setObject:](v14, "setObject:", v15);

    objc_msgSend(v13, "addObject:", v14);
    v16 = -[Row initWithType:]([Row alloc], "initWithType:", 1);
    objc_msgSend(v13, "addObject:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentItem"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "formResponse"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uploadTask"));

    v93 = self;
    if (v20 && objc_msgSend(v20, "localSubmissionStage") != (id)6)
    {
      v32 = -[Row initWithType:]([Row alloc], "initWithType:", 3);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Uploading files…"), &stru_1000EA660, 0));
      -[Row setText:](v32, "setText:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contentItem"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "formResponse"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "uploadTask"));
      -[Row setObject:](v32, "setObject:", v38);

      objc_msgSend(v13, "addObject:", v32);
      v14 = v32;
    }
    else
    {
      v102 = v20;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "formResponseStub"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "visibleFilePromises"));

      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v115;
        do
        {
          v27 = 0;
          v28 = v14;
          do
          {
            if (*(_QWORD *)v115 != v26)
              objc_enumerationMutation(v23);
            v29 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)v27);
            v14 = -[Row initWithType:]([Row alloc], "initWithType:", 5);

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
            -[Row setText:](v14, "setText:", v30);

            -[Row setObject:](v14, "setObject:", v29);
            objc_msgSend(v13, "addObject:", v14);
            v27 = (char *)v27 + 1;
            v28 = v14;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
        }
        while (v25);
      }

      v20 = v102;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v13));
    objc_msgSend(v12, "setRows:", v39);

    objc_msgSend(v97, "addObject:", v12);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](v93, "feedback"));

    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](v93, "feedback"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "validFeedbackFollowups"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("createdAt"), 1));
      v122 = v43;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v122, 1));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "sortedArrayUsingDescriptors:", v44));

    }
    else
    {
      v45 = &__NSArray0__struct;
    }
    v46 = &AudioServicesDisposeSystemSoundID_ptr;
    p_vtable = &OBJC_METACLASS___FBAFFUValidationCellChoices.vtable;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v31 = v45;
    v48 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v111;
      v92 = FBKSystemImageNameValidationNo;
      v90 = (unsigned int *)&v120;
      v91 = FBKSystemImageNameValidationYes;
      v95 = *(_QWORD *)v111;
      v96 = v31;
      do
      {
        v51 = 0;
        v98 = v49;
        do
        {
          if (*(_QWORD *)v111 != v50)
            objc_enumerationMutation(v31);
          v52 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)v51);
          if (objc_msgSend(v52, "type", v90) != (id)1)
          {
            v54 = (void *)objc_opt_new(p_vtable + 342, v53);
            v101 = (void *)objc_opt_new(p_vtable + 342, v55);
            v56 = objc_msgSend(objc_alloc((Class)v46[213]), "initWithCapacity:", 3);
            v57 = objc_msgSend(objc_alloc((Class)v46[213]), "initWithCapacity:", 3);
            v58 = -[Row initWithType:]([Row alloc], "initWithType:", 8);
            -[Row setObject:](v58, "setObject:", v52);
            v100 = v58;
            objc_msgSend(v56, "addObject:", v58);
            v59 = -[Row initWithType:]([Row alloc], "initWithType:", 7);
            -[Row setObject:](v59, "setObject:", v52);
            v99 = v59;
            objc_msgSend(v57, "addObject:", v59);
            v60 = (unint64_t)objc_msgSend(v52, "type");
            if (v60 <= 7)
            {
              v103 = v54;
              if (((1 << v60) & 0x9D) != 0)
              {
                if ((uint64_t)objc_msgSend(v52, "textResponsesCount") >= 1)
                {
                  v61 = -[Row initWithType:]([Row alloc], "initWithType:", 2);
                  -[Row setObject:](v61, "setObject:", v52);
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "textResponsesSummary"));
                  -[Row setText:](v61, "setText:", v62);

                  v54 = v103;
                  objc_msgSend(v57, "addObject:", v61);

                }
                if (objc_msgSend(v52, "type"))
                {
                  v63 = -[Row initWithType:]([Row alloc], "initWithType:", 2);
                  -[Row setObject:](v63, "setObject:", v52);
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "displayText"));
                  -[Row setText:](v63, "setText:", v64);

                  v54 = v103;
                  objc_msgSend(v56, "addObject:", v63);

                }
                if ((objc_msgSend(v52, "isComplete") & 1) == 0 && objc_msgSend(v52, "type"))
                {
                  v65 = -[Row initWithType:]([Row alloc], "initWithType:", 4);
                  -[Row setObject:](v65, "setObject:", v52);
                  objc_msgSend(v56, "addObject:", v65);
                  goto LABEL_47;
                }
                if (objc_msgSend(v52, "type") == (id)4 || objc_msgSend(v52, "type") == (id)7)
                {
                  v65 = (Row *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "validationResponse"));
                  if (v65)
                  {
                    v66 = -[Row initWithType:]([Row alloc], "initWithType:", 6);
                    if (-[Row isValidated](v65, "isValidated"))
                    {
                      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "positiveChoice"));
                      v68 = v91;
                    }
                    else
                    {
                      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "negativeChoice"));
                      v68 = v92;
                    }
                    -[Row setText:](v66, "setText:", v67);

                    v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v68));
                    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "imageWithRenderingMode:", 2));
                    -[Row setObject:](v66, "setObject:", v73);

                    objc_msgSend(v57, "addObject:", v66);
                    v46 = &AudioServicesDisposeSystemSoundID_ptr;
                    p_vtable = (void **)(&OBJC_METACLASS___FBAFFUValidationCellChoices + 24);
                  }
                  else
                  {
                    v66 = (Row *)objc_claimAutoreleasedReturnValue(+[FBALog ffu](FBALog, "ffu"));
                    if (os_log_type_enabled(&v66->super, OS_LOG_TYPE_ERROR))
                      sub_10009B1F8(buf, v52, v90, &v66->super);
                  }

                  v54 = v103;
LABEL_47:

                }
                if (objc_msgSend(v52, "isUploadingFiles"))
                {
                  v69 = -[Row initWithType:]([Row alloc], "initWithType:", 3);
                  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "uploadTask"));
                  -[Row setObject:](v69, "setObject:", v74);

                  v71 = v57;
LABEL_50:
                  objc_msgSend(v71, "addObject:", v69);
                }
                else if (objc_msgSend(v52, "hasVisibleFiles"))
                {
                  v94 = v56;
                  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "visibleFilePromises"));
                  v76 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController filePromiseSortDescriptors](v93, "filePromiseSortDescriptors"));
                  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "sortedArrayUsingDescriptors:", v76));

                  v108 = 0u;
                  v109 = 0u;
                  v106 = 0u;
                  v107 = 0u;
                  v69 = v77;
                  v78 = -[Row countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
                  if (v78)
                  {
                    v79 = v78;
                    v80 = *(_QWORD *)v107;
                    do
                    {
                      for (i = 0; i != v79; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v107 != v80)
                          objc_enumerationMutation(v69);
                        v82 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
                        v83 = -[Row initWithType:]([Row alloc], "initWithType:", 5);
                        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "filename"));
                        -[Row setText:](v83, "setText:", v84);

                        -[Row setObject:](v83, "setObject:", v82);
                        objc_msgSend(v57, "addObject:", v83);

                      }
                      v79 = -[Row countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
                    }
                    while (v79);
                  }

                  v46 = &AudioServicesDisposeSystemSoundID_ptr;
                  p_vtable = (void **)(&OBJC_METACLASS___FBAFFUValidationCellChoices + 24);
                  v54 = v103;
                  v56 = v94;
                }
                else
                {
                  v69 = (Row *)objc_claimAutoreleasedReturnValue(+[FBALog ffu](FBALog, "ffu"));
                  if (os_log_type_enabled(&v69->super, OS_LOG_TYPE_DEBUG))
                    sub_10009B1BC(&v104, v105, &v69->super);
                }

              }
              else if (((1 << v60) & 0x60) != 0)
              {
                v69 = -[Row initWithType:]([Row alloc], "initWithType:", 2);
                v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "displayText"));
                -[Row setText:](v69, "setText:", v70);

                v54 = v103;
                -[Row setObject:](v69, "setObject:", v52);
                v71 = v56;
                goto LABEL_50;
              }
            }
            objc_msgSend(v54, "setRows:", v56);
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "rows"));
            v86 = objc_msgSend(v85, "count");

            if ((unint64_t)v86 >= 2)
              objc_msgSend(v97, "addObject:", v54);
            objc_msgSend(v101, "setRows:", v57);
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "rows"));
            v88 = objc_msgSend(v87, "count");

            if ((unint64_t)v88 >= 2)
              objc_msgSend(v97, "addObject:", v101);

            v50 = v95;
            v31 = v96;
            v49 = v98;
          }
          v51 = (char *)v51 + 1;
        }
        while (v51 != v49);
        v49 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
      }
      while (v49);
    }

    v3 = v97;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v97));
    -[iFBAFeedbackViewController setModelCache:](v93, "setModelCache:", v89);

  }
  else
  {
    v31 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "deferring rendering until response stub data is available", buf, 2u);
    }
  }

}

- (id)filePromiseSortDescriptors
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController _filePromiseSortDescriptors](self, "_filePromiseSortDescriptors"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKFilePromise displaySortDescriptors](FBKFilePromise, "displaySortDescriptors"));
    -[iFBAFeedbackViewController set_filePromiseSortDescriptors:](self, "set_filePromiseSortDescriptors:", v4);

  }
  return -[iFBAFeedbackViewController _filePromiseSortDescriptors](self, "_filePromiseSortDescriptors");
}

- (BOOL)showsAssigneeRow
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "singleTeam"));
  if (objc_msgSend(v4, "teamType"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    if ((objc_msgSend(v5, "isOrphaned") & 1) != 0)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assignee"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originator"));
      v6 = objc_msgSend(v8, "isEqual:", v10) ^ 1;

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)updateTitleView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "feedbackIDString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setTitle:", v3);

}

- (NSDateFormatter)sectionDateFormatter
{
  if (qword_100118158[0] != -1)
    dispatch_once(qword_100118158, &stru_1000E7AD8);
  return (NSDateFormatter *)(id)qword_100118150;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;

  v25 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FBAFollowupResponsePresentation"));
  if (v6)
  {

LABEL_4:
    v9 = v6 ^ 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "destinationViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
    objc_msgSend(v11, "setIsUnsolicited:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController pendingFollowup](self, "pendingFollowup"));
    objc_msgSend(v11, "setFollowup:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController feedback](self, "feedback"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentItem"));
    objc_msgSend(v11, "setContentItem:", v14);
LABEL_5:

    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("FBAUnsolicitedFollowupResponsePresentation"));

  if (v8)
    goto LABEL_4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("PromoteSingleFeedbackPresentation"));

  if (v16)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "destinationViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentationController"));
    objc_msgSend(v17, "setDelegate:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
    objc_msgSend(v11, "setPickerDelegate:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "singleTeam"));
    objc_msgSend(v11, "setSelectedTeam:", v19);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "user"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeTeams"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[FBKTeam sortDescriptors](FBKTeam, "sortDescriptors"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortedArrayUsingDescriptors:", v21));
    objc_msgSend(v11, "setTeams:", v22);

    goto LABEL_5;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("AssignSingleFeedbackPresentation"));

  if (!v24)
    goto LABEL_7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "destinationViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));
  objc_msgSend(v11, "setParticipantDelegate:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  objc_msgSend(v11, "configureWithContentItem:", v13);
LABEL_6:

LABEL_7:
}

- (void)beginFileDownloadForFilePromise:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v4 = a3;
  if (!-[iFBAFeedbackViewController fileDownloadInProgress](self, "fileDownloadInProgress"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v6 = objc_msgSend(v5, "canDownloadFiles");

    if ((_DWORD)v6 && objc_msgSend(v4, "downloadState") == (id)2)
    {
      -[iFBAFeedbackViewController setFileDownloadInProgress:](self, "setFileDownloadInProgress:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FILE_DOWNLOAD_PREPARING"), &stru_1000EA660, FBKCommonStrings));
      -[iFBAFeedbackViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v8, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100047610;
      v17[3] = &unk_1000E7B68;
      v17[4] = self;
      objc_msgSend(v9, "getFileDownloadURLForFilePromise:completion:", v4, v17);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = FBKCommonStrings;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FILE_DOWNLOAD_UNAVAILABLE_TITLE"), &stru_1000EA660, FBKCommonStrings));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController localizedErrorStringForMaybeFilePromise:downloadPermission:](self, "localizedErrorStringForMaybeFilePromise:downloadPermission:", v4, v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, v11));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, &stru_1000E7AF8));
      objc_msgSend(v9, "addAction:", v16);

      -[iFBAFeedbackViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    }

  }
}

- (id)localizedErrorStringForMaybeFilePromise:(id)a3 downloadPermission:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = FBKCommonStrings;
    v11 = CFSTR("FILE_DOWNLOAD_UNAVAILABLE_MESSAGE");
LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v11, &stru_1000EA660, v10));

    goto LABEL_7;
  }
  if (!a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = FBKCommonStrings;
    v11 = CFSTR("FILE_DOWNLOAD_UNAVAILABLE_TEAM_FORBIDDEN");
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDownloadErrorString"));
LABEL_7:

  return v7;
}

- (void)configureActionsMenu
{
  _TtC18Feedback_Assistant23FBAActionMenuController *v3;
  void *v4;
  void *v5;
  _TtC18Feedback_Assistant23FBAActionMenuController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[6];

  v3 = [_TtC18Feedback_Assistant23FBAActionMenuController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedbackIDString"));
  v6 = -[FBAActionMenuController initWithTitle:subtitle:actions:](v3, "initWithTitle:subtitle:actions:", v5, 0, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  LODWORD(v5) = objc_msgSend(v7, "allowUnsolicitedFollowup");

  if ((_DWORD)v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UNSOLICITED_FOLLOWUP_ACTION"), &stru_1000EA660, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNameAddFollowup));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100047F78;
    v52[3] = &unk_1000E6930;
    v52[4] = self;
    -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v9, v10, v52);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v12 = objc_msgSend(v11, "itemType");

  if (v12 == (id)4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("COPY_FEEDBACK_ID"), &stru_1000EA660, FBKCommonStrings));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNameCopyFeedbackID));
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100047FE8;
    v51[3] = &unk_1000E6930;
    v51[4] = self;
    -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v14, v15, v51);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v17 = objc_msgSend(v16, "itemType");

  if (v17 == (id)4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("COPY_ID_AND_TITLE"), &stru_1000EA660, FBKCommonStrings));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNameCopyFeedbackIDAndTitle));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100047FF0;
    v50[3] = &unk_1000E6930;
    v50[4] = self;
    -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v19, v20, v50);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "user"));
  v23 = objc_msgSend(v22, "hasManagedTeams");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v25 = objc_msgSend(v24, "canPromoteFeedback");

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PROMOTE_FEEDBACK"), &stru_1000EA660, FBKCommonStrings));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNamePromoteFeedback));
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100047FF8;
      v49[3] = &unk_1000E6930;
      v49[4] = self;
      -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v27, v28, v49);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v30 = objc_msgSend(v29, "canDemoteFeedback");

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("DEMOTE_FEEDBACK"), &stru_1000EA660, FBKCommonStrings));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", FBKImageNameDemoteFeedback));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100048258;
      v48[3] = &unk_1000E6930;
      v48[4] = self;
      -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v32, v33, v48);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v35 = objc_msgSend(v34, "canReassignFeedback");

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ASSIGN_TO_TEAMMATE"), &stru_1000EA660, FBKCommonStrings));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", FBKSystemImageNameReassignFeedback));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100048260;
      v47[3] = &unk_1000E6930;
      v47[4] = self;
      -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v37, v38, v47);

    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v40 = objc_msgSend(v39, "canCloseFeedback");

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("CLOSE_FEEDBACK_BUTTON"), &stru_1000EA660, FBKCommonStrings));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", FBKImageNameCloseFeedback));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100048278;
    v46[3] = &unk_1000E6930;
    v46[4] = self;
    -[FBAActionMenuController addActionWithTitle:image:actionHandler:](v6, "addActionWithTitle:image:actionHandler:", v42, v43, v46);

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController navigationItem](self, "navigationItem"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "rightBarButtonItem"));
  -[FBAActionMenuController attachToBarButtonItem:](v6, "attachToBarButtonItem:", v45);

}

- (void)copyFeedbackID
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedbackIDString"));
  objc_msgSend(v5, "setString:", v4);

}

- (void)copyFeedbackIDAndTitle
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedbackIDAndTitleString"));
  objc_msgSend(v5, "setString:", v4);

}

- (void)reloadAppProxy
{
  void *v2;
  unsigned __int8 v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController launchAction](self, "launchAction"));
  v3 = objc_msgSend(v2, "isCaptive");

  if ((v3 & 1) == 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[FBADraftManager sharedInstance](FBADraftManager, "sharedInstance"));
    objc_msgSend(v4, "reloadApp");

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  const __CFString *v12;
  iFBAFeedbackViewController *v13;
  iFBAFeedbackViewController *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v17, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rows"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v17, "row")));

  if (objc_msgSend(v8, "type") == (id)4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
    v10 = objc_msgSend(v9, "canRespond");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
      -[iFBAFeedbackViewController setPendingFollowup:](self, "setPendingFollowup:", v11);

      v12 = CFSTR("FBAFollowupResponsePresentation");
      v13 = self;
      v14 = self;
LABEL_8:
      -[iFBAFeedbackViewController performSegueWithIdentifier:sender:](v13, "performSegueWithIdentifier:sender:", v12, v14);
      goto LABEL_9;
    }
  }
  if (objc_msgSend(v8, "type") == (id)5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
    -[iFBAFeedbackViewController beginFileDownloadForFilePromise:](self, "beginFileDownloadForFilePromise:", v15);

  }
  else if (-[iFBAFeedbackViewController rowShouldPresentAssigneePicker:](self, "rowShouldPresentAssigneePicker:", v8))
  {
    v12 = CFSTR("AssignSingleFeedbackPresentation");
    v13 = self;
    v14 = 0;
    goto LABEL_8;
  }
LABEL_9:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v17, 1);

}

- (BOOL)rowShouldPresentAssigneePicker:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v6 = objc_msgSend(v5, "canReassignFeedback");

  if (v6)
  {
    if (!objc_msgSend(v4, "type"))
    {
      isKindOfClass = 1;
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "type") == (id)7 && !-[iFBAFeedbackViewController showsAssigneeRow](self, "showsAssigneeRow"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      v9 = objc_opt_class(FBKContentItem);
      isKindOfClass = objc_opt_isKindOfClass(v8, v9);

      goto LABEL_8;
    }
  }
  isKindOfClass = 0;
LABEL_8:

  return isKindOfClass & 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rows"));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  char *v8;
  double v9;
  double v10;
  objc_super v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache"));
  v8 = (char *)objc_msgSend(v7, "count") - 1;

  v9 = 3.0;
  if (v8 == (char *)a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)iFBAFeedbackViewController;
    -[iFBAFeedbackViewController tableView:heightForFooterInSection:](&v12, "tableView:heightForFooterInSection:", v6, a4);
    v9 = v10;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 3.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rows"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row")));

  switch((unint64_t)objc_msgSend(v11, "type"))
  {
    case 0uLL:
    case 7uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ResponseHeaderCell"), v7));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      if (v12)
      {
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
        v15 = objc_opt_class(FBKFeedbackFollowup);
        isKindOfClass = objc_opt_isKindOfClass(v14, v15);

        if ((isKindOfClass & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
          objc_msgSend(v10, "configureForFollowup:", v17);
          goto LABEL_26;
        }
      }
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      if (v22)
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
        v25 = objc_opt_class(FBKContentItem);
        v26 = objc_opt_isKindOfClass(v24, v25);

        if ((v26 & 1) != 0)
        {
          v27 = objc_msgSend(v11, "type");
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
          if (v27)
            objc_msgSend(v10, "configureForContentItem:", v17);
          else
            objc_msgSend(v10, "configureAssigneeForContentItem:", v17);
          goto LABEL_26;
        }
      }
      break;
    case 1uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FormResponseDetailCell"), v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
      objc_msgSend(v10, "setContentItem:", v17);
      goto LABEL_26;
    case 2uLL:
    case 0xAuLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PromptOnlyTextCell"), v7));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "promptLabel"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "font"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString linkedAttributedFromString:withFont:](NSMutableAttributedString, "linkedAttributedFromString:withFont:", v18, v20));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "promptLabel"));
      objc_msgSend(v21, "setAttributedText:", v17);

      goto LABEL_26;
    case 3uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("UploadProgressCell"), v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      objc_msgSend(v10, "setObservedTask:", v17);
      objc_msgSend(v10, "setSelectionStyle:", 0);
      objc_msgSend(v10, "layoutIfNeeded");
      goto LABEL_26;
    case 4uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RespondActionCell"), v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      if (objc_msgSend(v17, "canRespond"))
        v28 = objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
      else
        v28 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v44 = (void *)v28;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      objc_msgSend(v45, "setTextColor:", v44);

      if (objc_msgSend(v17, "canRespond"))
        v46 = 3;
      else
        v46 = 0;
      objc_msgSend(v10, "setSelectionStyle:", v46);
      goto LABEL_26;
    case 5uLL:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[FBKAttachmentCell reuseIdentifier](FBKAttachmentCell, "reuseIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v29, v7));

      v30 = objc_msgSend(objc_alloc((Class)FBKAttachment), "initWithCollectorIdentifier:deviceUUID:", CFSTR("ffu-no-collector-id"), CFSTR("no-device"));
      objc_msgSend(v30, "setState:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
      objc_msgSend(v30, "setPlaceholderText:", v31);

      objc_msgSend(v10, "setSelectionStyle:", 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      v33 = objc_msgSend(v32, "downloadState");
      if (v32 && v33 == (id)3)
      {
        v34 = 7;
      }
      else
      {
        v34 = 6;
        if (v32 && v33)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor", 6));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachmentDisplayName"));
          objc_msgSend(v49, "setTextColor:", v48);

          v34 = (uint64_t)objc_msgSend(v30, "state");
        }
      }
      objc_msgSend(v30, "setState:", v34);
      objc_msgSend(v30, "setAttachmentType:", 6);
      objc_msgSend(v10, "setAttachment:", v30);
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageView"));
      objc_msgSend(v51, "setTintColor:", v50);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
      objc_msgSend(v52, "separatorInset");
      objc_msgSend(v10, "updateContentInsetWithValue:", v53);

      break;
    case 6uLL:
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ValidationCell"), v7));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      objc_msgSend(v37, "setText:", v36);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      objc_msgSend(v39, "setTextColor:", v38);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageView"));
      objc_msgSend(v41, "setImage:", v40);
      goto LABEL_20;
    case 8uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ResponseHeaderCell"), v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      objc_msgSend(v10, "configureForAppleFeedbackWithFollowup:", v17);
LABEL_26:

      break;
    case 9uLL:
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController tableView](self, "tableView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dequeueReusableCellWithIdentifier:", CFSTR("StatusTextCell")));

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributedStringRepresentation"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
      objc_msgSend(v43, "setAttributedText:", v41);

LABEL_20:
      objc_msgSend(v10, "setSelectionStyle:", 0);
      break;
    default:
      break;
  }

  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048ED8;
  v4[3] = &unk_1000E69B8;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
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
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController modelCache](self, "modelCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rows"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row")));

  if (objc_msgSend(v11, "type") == (id)5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "object"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v14 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "canDeleteFiles"))
      {
        objc_initWeak(&location, self);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ATTACHMENT_DELETION_BUTTON_TITLE"), &stru_1000EA660, CFSTR("CommonStrings")));
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100049244;
        v22[3] = &unk_1000E6DA0;
        objc_copyWeak(&v24, &location);
        v23 = v12;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v16, v22));

        v26 = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v18));

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10009B270();

    }
    v19 = 0;
    goto LABEL_10;
  }
  v19 = 0;
LABEL_11:

  return v19;
}

- (void)_deleteFilePromise:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[iFBAFeedbackViewController showAttachmentDeletionSpinner](self, "showAttachmentDeletionSpinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004947C;
  v11[3] = &unk_1000E7BF8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "deleteFilePromiseWithUUID:object:completion:", v9, v7, v11);

}

- (void)_confirmFilePromiseDeletionWithStub:(id)a3 deletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_ATTACHMENT_ALERT_TITLE"), &stru_1000EA660, CFSTR("CommonStrings")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_ATTACHMENT_ALERT_MESSAGE"), &stru_1000EA660, CFSTR("CommonStrings")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_1000EA660, 0));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004971C;
  v21[3] = &unk_1000E7520;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  v15 = v7;
  v16 = v6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 2, v21));

  objc_msgSend(v12, "addAction:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, &stru_1000E7C18));

  objc_msgSend(v12, "addAction:", v20);
  -[iFBAFeedbackViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)showAttachmentDeletionSpinner
{
  void *v3;
  id v4;

  -[iFBAFeedbackViewController setAttachmentsBeingDeletedCount:](self, "setAttachmentsBeingDeletedCount:", (char *)-[iFBAFeedbackViewController attachmentsBeingDeletedCount](self, "attachmentsBeingDeletedCount") + 1);
  if ((id)-[iFBAFeedbackViewController attachmentsBeingDeletedCount](self, "attachmentsBeingDeletedCount") == (id)1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DELETING_ATTACHMENT_STATUS_ELLIPSIS"), &stru_1000EA660, FBKCommonStrings));
    -[iFBAFeedbackViewController showSpinnerWithStatus:userInteractionEnabled:](self, "showSpinnerWithStatus:userInteractionEnabled:", v3, 1);

  }
}

- (void)hideAttachmentDeletionSpinner
{
  -[iFBAFeedbackViewController setAttachmentsBeingDeletedCount:](self, "setAttachmentsBeingDeletedCount:", (char *)-[iFBAFeedbackViewController attachmentsBeingDeletedCount](self, "attachmentsBeingDeletedCount") - 1);
  -[iFBAFeedbackViewController attachmentsBeingDeletedCount](self, "attachmentsBeingDeletedCount");
  if (!-[iFBAFeedbackViewController attachmentsBeingDeletedCount](self, "attachmentsBeingDeletedCount"))
    -[iFBAFeedbackViewController hideSpinner](self, "hideSpinner");
}

- (void)showAttachmentDeletionErrorAlert
{
  -[iFBAFeedbackViewController showAttachmentDeletionErrorAlertWithError:](self, "showAttachmentDeletionErrorAlertWithError:", 0);
}

- (void)showAttachmentDeletionErrorAlertWithError:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", FBKSSeedPortalRequestDetails));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", FBKSSeedPortalRequestDetailMessage));

  if (v15 && objc_msgSend(v15, "length"))
  {
    v6 = FBKCommonStrings;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = FBKCommonStrings;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNEXPECTED_SERVER_DATA_ERROR_RECOVERY"), &stru_1000EA660, FBKCommonStrings));

    v15 = (id)v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ATTACHMENT_DELETION_ERROR_ALERT_TITLE"), &stru_1000EA660, v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v15, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000EA660, v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, 0));

  objc_msgSend(v11, "addAction:", v14);
  -[iFBAFeedbackViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)teamPicker:(id)a3 didSelectTeam:(id)a4
{
  -[iFBAFeedbackViewController promoteIndividualFeedbackToTeam:](self, "promoteIndividualFeedbackToTeam:", a4);
}

- (void)promoteIndividualFeedbackToTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
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
  iFBAFeedbackViewController *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
  id v31;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "singleTeam"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NO OP: Target team for move is the current team.", buf, 2u);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = FBKCommonStrings;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PROMOTE_FEEDBACK_ASSIGN_WARNING_SINGLE_TEAM"), &stru_1000EA660, FBKCommonStrings));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12, 0));
    v8 = objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v13, -[iFBAFeedbackViewController objc_preferredAlertStyle](self, "objc_preferredAlertStyle")));

    if (-[NSObject preferredStyle](v8, "preferredStyle") == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PROMOTE_FEEDBACK_TITLE_SINGLE_TEAM"), &stru_1000EA660, v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "feedbackIDString"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v17, v18, 0));
      -[NSObject setTitle:](v8, "setTitle:", v19);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PROMOTE_FEEDBACK"), &stru_1000EA660, v10));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100049E98;
    v30[3] = &unk_1000E64B8;
    v30[4] = self;
    v31 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 2, v30));
    -[NSObject addAction:](v8, "addAction:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, v10));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004A1A4;
    v29[3] = &unk_1000E61E0;
    v29[4] = self;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, v29));
    -[NSObject addAction:](v8, "addAction:", v25);

    v26 = self;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController presentedViewController](v26, "presentedViewController"));

    if (v27)
    {
      v28 = objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController presentedViewController](v26, "presentedViewController"));

      v26 = (iFBAFeedbackViewController *)v28;
    }
    -[iFBAFeedbackViewController presentViewController:animated:completion:](v26, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)demoteIndividualFeedbackToOriginator
{
  void *v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  iFBAFeedbackViewController *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = FBKCommonStrings;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEMOTE_FEEDBACK_ASSIGN_WARNING"), &stru_1000EA660, FBKCommonStrings));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "singleTeam"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v9, -[iFBAFeedbackViewController objc_preferredAlertStyle](self, "objc_preferredAlertStyle")));

  if (objc_msgSend(v10, "preferredStyle") == (id)1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DEMOTE_FEEDBACK_TITLE"), &stru_1000EA660, v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "feedbackIDString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "singleTeam"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v16, 0));
    objc_msgSend(v10, "setTitle:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DEMOTE_FEEDBACK"), &stru_1000EA660, v4));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10004A514;
  v29[3] = &unk_1000E61E0;
  v29[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 2, v29));
  objc_msgSend(v10, "addAction:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, v4));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004A820;
  v28[3] = &unk_1000E61E0;
  v28[4] = self;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, v28));
  objc_msgSend(v10, "addAction:", v23);

  v24 = self;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController presentedViewController](v24, "presentedViewController"));

  if (v25)
  {
    v26 = objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController presentedViewController](v24, "presentedViewController"));

    v24 = (iFBAFeedbackViewController *)v26;
  }
  -[iFBAFeedbackViewController presentViewController:animated:completion:](v24, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)participantController:(id)a3 didSelectParticipant:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void *v15;
  uint8_t buf[4];
  id v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assignee"));
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteID"));
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v11, "unsignedIntegerValue");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tried to assign content item [%lu] to assignee.", buf, 0xCu);

    }
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAFeedbackViewController contentItem](self, "contentItem"));
    v15 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004A9E4;
    v14[3] = &unk_1000E7248;
    v14[4] = self;
    -[NSObject assignFeedback:toParticipant:completion:](v9, "assignFeedback:toParticipant:completion:", v13, v5, v14);

  }
}

- (FBKContentItem)contentItem
{
  return self->_contentItem;
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (void)setLaunchAction:(id)a3
{
  objc_storeStrong((id *)&self->_launchAction, a3);
}

- (NSDateFormatter)headerDateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 32, 1);
}

- (FBKFeedbackFollowup)pendingFollowup
{
  return (FBKFeedbackFollowup *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingFollowup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)modelCache
{
  return self->_modelCache;
}

- (void)setModelCache:(id)a3
{
  objc_storeStrong((id *)&self->_modelCache, a3);
}

- (NSMutableArray)observerTokens
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setObserverTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)fileDownloadInProgress
{
  return self->_fileDownloadInProgress;
}

- (void)setFileDownloadInProgress:(BOOL)a3
{
  self->_fileDownloadInProgress = a3;
}

- (NSMutableSet)observedUploadTasks
{
  return self->_observedUploadTasks;
}

- (void)setObservedUploadTasks:(id)a3
{
  objc_storeStrong((id *)&self->_observedUploadTasks, a3);
}

- (unint64_t)attachmentsBeingDeletedCount
{
  return self->_attachmentsBeingDeletedCount;
}

- (void)setAttachmentsBeingDeletedCount:(unint64_t)a3
{
  self->_attachmentsBeingDeletedCount = a3;
}

- (NSArray)_filePromiseSortDescriptors
{
  return self->__filePromiseSortDescriptors;
}

- (void)set_filePromiseSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->__filePromiseSortDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__filePromiseSortDescriptors, 0);
  objc_storeStrong((id *)&self->_observedUploadTasks, 0);
  objc_storeStrong((id *)&self->_observerTokens, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_pendingFollowup, 0);
  objc_storeStrong((id *)&self->_headerDateFormatter, 0);
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
