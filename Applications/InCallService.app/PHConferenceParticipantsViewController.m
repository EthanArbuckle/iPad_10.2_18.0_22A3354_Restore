@implementation PHConferenceParticipantsViewController

- (PHConferenceParticipantsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHConferenceParticipantsViewController *v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *conferenceParticipantCalls;
  uint64_t v8;
  NSMutableArray *remoteParticipantHandles;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHConferenceParticipantsViewController;
  v4 = -[PHConferenceParticipantsViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "callStatusChanged:", TUCallCenterCallStatusChangedNotification, 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "handleCallModelChangedNotification:", TUCallModelChangedNotification, 0);
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    conferenceParticipantCalls = v4->_conferenceParticipantCalls;
    v4->_conferenceParticipantCalls = (NSMutableArray *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    remoteParticipantHandles = v4->_remoteParticipantHandles;
    v4->_remoteParticipantHandles = (NSMutableArray *)v8;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHConferenceParticipantsViewController;
  -[PHConferenceParticipantsViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  UITableView *conferenceTable;
  void *v37;
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v5, v7, v9, v11);
  -[PHConferenceParticipantsViewController setView:](self, "setView:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController view](self, "view"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController view](self, "view"));
  objc_msgSend(v15, "setOpaque:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONFERENCE"), &stru_10028DC20, CFSTR("InCallService")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v18, "setTitle:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController view](self, "view"));
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController navigationController](self, "navigationController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "navigationBar"));
  objc_msgSend(v29, "frame");
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "statusBar"));
  objc_msgSend(v32, "defaultHeight");
  v34 = v31 + v33;

  v35 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", v21, v23 + v34, v25, v27 - v34);
  -[PHConferenceParticipantsViewController setConferenceTable:](self, "setConferenceTable:", v35);

  -[UITableView setDataSource:](self->_conferenceTable, "setDataSource:", self);
  -[UITableView setDelegate:](self->_conferenceTable, "setDelegate:", self);
  conferenceTable = self->_conferenceTable;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](conferenceTable, "setBackgroundColor:", v37);

  -[UITableView setSeparatorStyle:](self->_conferenceTable, "setSeparatorStyle:", 0);
  -[UITableView setRowHeight:](self->_conferenceTable, "setRowHeight:", 100.0);
  -[UITableView setOpaque:](self->_conferenceTable, "setOpaque:", 0);
  -[UITableView setBounces:](self->_conferenceTable, "setBounces:", 0);
  -[UITableView setDelaysContentTouches:](self->_conferenceTable, "setDelaysContentTouches:", 0);
  -[UITableView setCanCancelContentTouches:](self->_conferenceTable, "setCanCancelContentTouches:", 0);
  -[UITableView setRowHeight:](self->_conferenceTable, "setRowHeight:", UITableViewAutomaticDimension);
  v38 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController view](self, "view"));
  objc_msgSend(v38, "addSubview:", self->_conferenceTable);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHConferenceParticipantsViewController;
  -[PHConferenceParticipantsViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostCall"));
  v6 = objc_msgSend(v5, "isConversation");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "frontmostCall"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteParticipantHandles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    v12 = objc_msgSend(v11, "mutableCopy");
    -[PHConferenceParticipantsViewController setRemoteParticipantHandles:](self, "setRemoteParticipantHandles:", v12);

    -[PHConferenceParticipantsViewController setShowingMultiwayParticipants:](self, "setShowingMultiwayParticipants:", 1);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conferenceParticipantCalls"));
    v14 = objc_msgSend(v13, "mutableCopy");
    -[PHConferenceParticipantsViewController setConferenceParticipantCalls:](self, "setConferenceParticipantCalls:", v14);

  }
}

- (void)dismissConferenceView
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController navigationController](self, "navigationController"));
  v2 = objc_msgSend(v3, "popToRootViewControllerAnimated:", 1);

}

- (void)callStatusChanged:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (objc_msgSend(v4, "status") == 6)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Call was disconnected, we'll remove that call and pop %@", (uint8_t *)&v11, 0xCu);
    }

    -[PHConferenceParticipantsViewController removeCall:](self, "removeCall:", v4);
  }
  else
  {
    v7 = objc_msgSend(v4, "status");
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == 4)
    {
      if (v10)
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saw an incoming call, we'll pop", (uint8_t *)&v11, 2u);
      }

      -[PHConferenceParticipantsViewController dismissConferenceView](self, "dismissConferenceView");
    }
    else
    {
      if (v10)
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Saw a call change but won't do anything with it: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }

}

- (void)handleCallModelChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
    v9 = objc_msgSend(v8, "indexOfObject:", v7);

    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = sub_1000C5588();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping table row reload, did not find a call in the conference participants list that matches (%@).", buf, 0xCu);
      }
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceTable](self, "conferenceTable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0));
      v14 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      -[NSObject reloadRowsAtIndexPaths:withRowAnimation:](v11, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 0);

    }
  }

}

- (void)removeCall:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  dispatch_time_t v13;
  _QWORD block[5];
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceTable](self, "conferenceTable"));
    v15 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v9, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 2);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
    v12 = objc_msgSend(v11, "count");

    if ((unint64_t)v12 <= 1)
    {
      v13 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007D8D8;
      block[3] = &unk_100284898;
      block[4] = self;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
    }

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  if (-[PHConferenceParticipantsViewController isShowingMultiwayParticipants](self, "isShowingMultiwayParticipants", a3, a4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController remoteParticipantHandles](self, "remoteParticipantHandles"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "count");

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  PHConferenceParticipantCell *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  v6 = objc_alloc_init(PHConferenceParticipantCell);
  -[PHConferenceParticipantCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  -[PHConferenceParticipantCell setDelegate:](v6, "setDelegate:", self);
  if (-[PHConferenceParticipantsViewController isShowingMultiwayParticipants](self, "isShowingMultiwayParticipants"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController remoteParticipantHandles](self, "remoteParticipantHandles"));
    v8 = objc_msgSend(v5, "row");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
    -[PHConferenceParticipantCell setRepresentedHandle:](v6, "setRepresentedHandle:", v9);
    -[PHConferenceParticipantCell setPrivateButtonHidden:](v6, "setPrivateButtonHidden:", 1);
    -[PHConferenceParticipantCell setEndButtonHidden:](v6, "setEndButtonHidden:", 1);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
    v11 = objc_msgSend(v5, "row");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
    -[PHConferenceParticipantCell setRepresentedCall:](v6, "setRepresentedCall:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "provider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "prioritizedSenderIdentities"));
    v14 = objc_msgSend(v13, "count");

    if ((unint64_t)v14 >= 2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localSenderIdentity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedShortName"));
      -[PHConferenceParticipantCell setLocalizedSenderIdentity:](v6, "setLocalizedSenderIdentity:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));
    if ((objc_msgSend(v17, "supportsUngrouping") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentCallGroups"));
      -[PHConferenceParticipantCell setPrivateButtonEnabled:](v6, "setPrivateButtonEnabled:", objc_msgSend(v19, "count") == (id)1);

    }
    else
    {
      -[PHConferenceParticipantCell setPrivateButtonEnabled:](v6, "setPrivateButtonEnabled:", 0);
    }

  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 95.0;
}

- (void)conferenceParticipantCellRequestedEndCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceTable](self, "conferenceTable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row")));

  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "End call requested for %@", (uint8_t *)&v12, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v11, "disconnectCall:", v8);

}

- (void)conferenceParticipantCellRequestedTakeCallPrivate:(id)a3
{
  UITableView *conferenceTable;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  void *v15;

  conferenceTable = self->_conferenceTable;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView visibleCells](conferenceTable, "visibleCells"));
  v7 = objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v5);
  objc_msgSend(v7, "makeObjectsPerformSelector:", "makeHeld");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForCell:](self->_conferenceTable, "indexPathForCell:", v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController conferenceParticipantCalls](self, "conferenceParticipantCalls"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "row")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v11, "ungroupCall:", v10);

  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Take call private requested for %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(UIApp, "setIgnoresInteractionEvents:", 1);
  -[PHConferenceParticipantsViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "dismissAfterPrivate", 0, 0.5);

}

- (void)dismissAfterPrivate
{
  id v3;
  id v4;

  objc_msgSend(UIApp, "setIgnoresInteractionEvents:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHConferenceParticipantsViewController navigationController](self, "navigationController"));
  v3 = objc_msgSend(v4, "popToRootViewControllerAnimated:", 1);

}

- (NSMutableArray)conferenceParticipantCalls
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConferenceParticipantCalls:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)remoteParticipantHandles
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoteParticipantHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (UITableView)conferenceTable
{
  return (UITableView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConferenceTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isShowingMultiwayParticipants
{
  return self->_showingMultiwayParticipants;
}

- (void)setShowingMultiwayParticipants:(BOOL)a3
{
  self->_showingMultiwayParticipants = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferenceTable, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_conferenceParticipantCalls, 0);
}

@end
