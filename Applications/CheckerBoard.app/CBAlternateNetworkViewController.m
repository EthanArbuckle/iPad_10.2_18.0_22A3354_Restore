@implementation CBAlternateNetworkViewController

- (CBAlternateNetworkViewController)initWithScanResult:(id)a3
{
  return -[CBAlternateNetworkViewController initWithScanResult:prepopulatedPassword:prepopulatedSSID:](self, "initWithScanResult:prepopulatedPassword:prepopulatedSSID:", a3, 0, 0);
}

- (CBAlternateNetworkViewController)initWithScanResult:(id)a3 prepopulatedPassword:(id)a4
{
  return -[CBAlternateNetworkViewController initWithScanResult:prepopulatedPassword:prepopulatedSSID:](self, "initWithScanResult:prepopulatedPassword:prepopulatedSSID:", a3, a4, 0);
}

- (CBAlternateNetworkViewController)initWithScanResult:(id)a3 prepopulatedPassword:(id)a4 prepopulatedSSID:(id)a5
{
  id v9;
  id v10;
  id v11;
  CBAlternateNetworkViewController *v12;
  CBAlternateNetworkViewController *v13;
  uint64_t v14;
  NSString *networkName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CBAlternateNetworkViewController;
  v12 = -[CBAlternateNetworkViewController init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    v12->_otherNetworkViewActive = v9 == 0;
    if (v9)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "networkName"));
      networkName = v13->_networkName;
      v13->_networkName = (NSString *)v14;

      objc_storeStrong((id *)&v13->_scanResult, a3);
    }
    if (v11 && !v13->_networkName)
      objc_storeStrong((id *)&v13->_networkName, a5);
    if (v10)
      objc_storeStrong((id *)&v13->_networkPassword, a4);
    v13->_joining = 0;
    v13->_retryJoinAttemptCount = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Alternate Network pane loaded", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CBAlternateNetworkViewController;
  -[CBAlternateNetworkViewController viewDidLoad](&v5, "viewDidLoad");
  -[CBAlternateNetworkViewController _setupNavBar](self, "_setupNavBar");
}

- (void)_setupNavBar
{
  uint64_t v2;
  void *v3;
  unsigned int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v5 = -[CBAlternateNetworkViewController otherNetworkViewActive](self, "otherNetworkViewActive");
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OTHER_NETWORK_PROMPT"), &stru_1000769A0, 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ENCRYPTED_NETWORK_PROMPT"), &stru_1000769A0, 0));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v3));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setPrompt:", v8);

  if ((v6 & 1) == 0)
  {

    v8 = (void *)v2;
  }

  v10 = -[CBAlternateNetworkViewController otherNetworkViewActive](self, "otherNetworkViewActive");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if (v10)
    v13 = CFSTR("OTHER_NETWORK_TITLE");
  else
    v13 = CFSTR("ENCRYPTED_NETWORK_TITLE");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1000769A0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v15, "setTitle:", v14);

  v22 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelTapped:");
  v16 = objc_alloc((Class)UIBarButtonItem);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1000769A0, 0));
  v19 = objc_msgSend(v16, "initWithTitle:style:target:action:", v18, 2, self, "joinTapped:");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v20, "setLeftBarButtonItem:", v22);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setRightBarButtonItem:", v19);

  -[CBAlternateNetworkViewController _enableRightBarButtonItem:](self, "_enableRightBarButtonItem:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  int64_t v27;

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Alternate Network pane will appear", buf, 2u);
  }

  v25.receiver = self;
  v25.super_class = (Class)CBAlternateNetworkViewController;
  -[CBAlternateNetworkViewController viewWillAppear:](&v25, "viewWillAppear:", v3);
  -[CBAlternateNetworkViewController _registerForNotifications](self, "_registerForNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_1000769A0, 0));
  -[CBAlternateNetworkViewController setIndexToSelect:](self, "setIndexToSelect:", -[CBAlternateNetworkViewController indexOfSpecifierID:](self, "indexOfSpecifierID:", v8));

  v9 = CheckerBoardLogHandleForCategory(8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[CBAlternateNetworkViewController indexToSelect](self, "indexToSelect");
    *(_DWORD *)buf = 134217984;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Index to be selected %ld", buf, 0xCu);
  }

  if (-[CBAlternateNetworkViewController indexToSelect](self, "indexToSelect") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OTHER_NETWORK_NAME"), &stru_1000769A0, 0));
    -[CBAlternateNetworkViewController setIndexToSelect:](self, "setIndexToSelect:", -[CBAlternateNetworkViewController indexOfSpecifierID:](self, "indexOfSpecifierID:", v13));

    v14 = CheckerBoardLogHandleForCategory(8);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[CBAlternateNetworkViewController indexToSelect](self, "indexToSelect");
      *(_DWORD *)buf = 134217984;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not found. New index to be selected %ld", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkNameCell](self, "networkNameCell"));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController passwordCell](self, "passwordCell"));
  }
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textField"));
  -[CBAlternateNetworkViewController setCurrentlyActiveTextField:](self, "setCurrentlyActiveTextField:", v19);

  v20 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__table];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController indexPathForIndex:](self, "indexPathForIndex:", -[CBAlternateNetworkViewController indexToSelect](self, "indexToSelect")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cellForRowAtIndexPath:", v21));
  objc_msgSend(v22, "becomeFirstResponder");

  -[CBAlternateNetworkViewController _updateReturnKey](self, "_updateReturnKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));

  if (v23)
  {
    -[CBAlternateNetworkViewController setRequiresPassword:](self, "setRequiresPassword:", &__kCFBooleanTrue);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));
    -[CBAlternateNetworkViewController setPassword:](self, "setPassword:", v24);

  }
}

- (void)_registerForNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[CBAlternateNetworkViewController _deregisterNotifications](self, "_deregisterNotifications");
  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering for keyboard and Wi-Fi notifications…", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_keyboardWillPresent:", UIKeyboardWillShowNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_returnKeyTapped:", UIKeyboardReturnKeyPressed, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_handleAssociationEvent:", CFSTR("CBWiFiManagerDidAssociateToOpenNetworkNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_handleAssociationEvent:", CFSTR("CBWiFiManagerDidAssociateToEncryptedNetworkNotification"), 0);

}

- (void)_deregisterNotifications
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deregistering keyboard and Wi-Fi notifications…", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, UIKeyboardReturnKeyPressed, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("CBWiFiManagerDidAssociateToOpenNetworkNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("CBWiFiManagerDidAssociateToEncryptedNetworkNotification"), 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Alternate Network pane will disappear", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)CBAlternateNetworkViewController;
  -[CBAlternateNetworkViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  -[CBAlternateNetworkViewController _cleanUp](self, "_cleanUp");
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  -[CBAlternateNetworkViewController _cleanUp](self, "_cleanUp");
  v5.receiver = self;
  v5.super_class = (Class)CBAlternateNetworkViewController;
  -[CBAlternateNetworkViewController dealloc](&v5, "dealloc");
}

- (void)_cleanUp
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up Alternate View Controller…", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController joinTimer](self, "joinTimer"));
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalidating join timer…", v15, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController joinTimer](self, "joinTimer"));
    objc_msgSend(v8, "invalidate");

    -[CBAlternateNetworkViewController setJoinTimer:](self, "setJoinTimer:", 0);
  }
  v9 = OBJC_IVAR___PSListController__specifiers;
  if (objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "count"))
  {
    v10 = 0;
    v11 = PSTableCellKey;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->PSListController_opaque[v9], "objectAtIndex:", v10));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "propertyForKey:", v11));
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "setCellTarget:", 0);
        objc_msgSend(v14, "setCellAction:", 0);
      }

      ++v10;
    }
    while (v10 < (unint64_t)objc_msgSend(*(id *)&self->PSListController_opaque[v9], "count"));
  }
  -[CBAlternateNetworkViewController loseFocus](self, "loseFocus");
  -[CBAlternateNetworkViewController _deregisterNotifications](self, "_deregisterNotifications");
}

- (void)_keyboardWillPresent:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Keyboard will be presented…", v6, 2u);
  }

  -[CBAlternateNetworkViewController _setReturnKeyEnabled:](self, "_setReturnKeyEnabled:", 0);
}

- (void)_returnKeyTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  CBAlternateNetworkViewController *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Return key tapped before main thread", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000343F4;
  block[3] = &unk_1000753E8;
  block[4] = self;
  v6 = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_handleAssociationEvent:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000346BC;
  v4[3] = &unk_1000754E8;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_networkJoinRetryTimerFired:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint8_t buf[4];
  unint64_t v32;

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network Join Retry timeout fired…", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController joinTimer](self, "joinTimer"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController joinTimer](self, "joinTimer"));
    objc_msgSend(v7, "invalidate");

    -[CBAlternateNetworkViewController setJoinTimer:](self, "setJoinTimer:", 0);
  }
  if (-[CBAlternateNetworkViewController retryJoinAttemptCount](self, "retryJoinAttemptCount") > 4)
  {
    v11 = CheckerBoardLogHandleForCategory(8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100045D0C(v12, v13, v14, v15, v16, v17, v18, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FAILED_NETWORK_PROMPT"), &stru_1000769A0, 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v24, "setPrompt:", v23);

    -[CBAlternateNetworkViewController _enableUI:](self, "_enableUI:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_JOIN_TITLE"), &stru_1000769A0, 0));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN_MESSAGE"), &stru_1000769A0, 0));
    -[CBAlternateNetworkViewController _presentFailedAssociationAlertWithTitle:message:](self, "_presentFailedAssociationAlertWithTitle:message:", v28, v30);

  }
  else
  {
    -[CBAlternateNetworkViewController setRetryJoinAttemptCount:](self, "setRetryJoinAttemptCount:", (char *)-[CBAlternateNetworkViewController retryJoinAttemptCount](self, "retryJoinAttemptCount") + 1);
    v8 = CheckerBoardLogHandleForCategory(8);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[CBAlternateNetworkViewController retryJoinAttemptCount](self, "retryJoinAttemptCount");
      *(_DWORD *)buf = 134217984;
      v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Join Retry Attempt [#%lu]", buf, 0xCu);
    }

    -[CBAlternateNetworkViewController _joinTapped](self, "_joinTapped");
  }
}

- (void)cancelTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancel tapped", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("Wifi"), objc_msgSend(&off_100078D88, "integerValue"), 0));
  -[CBAlternateNetworkViewController _checkoutAndPostAssociationCompletedNotificationWithError:](self, "_checkoutAndPostAssociationCompletedNotificationWithError:", v6);

}

- (void)joinTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Joined tapped", v6, 2u);
  }

  -[CBAlternateNetworkViewController setRetryJoinAttemptCount:](self, "setRetryJoinAttemptCount:", 0);
  -[CBAlternateNetworkViewController _joinTapped](self, "_joinTapped");
}

- (void)_joinTapped
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preparing to join network…", buf, 2u);
  }

  if (!-[CBAlternateNetworkViewController joining](self, "joining"))
  {
    -[CBAlternateNetworkViewController setJoining:](self, "setJoining:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("JOINING_NETWORK_PROMPT"), &stru_1000769A0, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v11, "setPrompt:", v10);

    -[CBAlternateNetworkViewController _enableUI:](self, "_enableUI:", 0);
    v12 = CheckerBoardLogHandleForCategory(8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dismissing the keyboard…", v27, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController currentlyActiveTextField](self, "currentlyActiveTextField"));
    objc_msgSend(v14, "resignFirstResponder");

    v6 = objc_claimAutoreleasedReturnValue(+[CBWiFiManager sharedInstance](CBWiFiManager, "sharedInstance"));
    if (-[CBAlternateNetworkViewController otherNetworkViewActive](self, "otherNetworkViewActive"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkRequiresPassword](self, "networkRequiresPassword"));
      v16 = objc_msgSend(v15, "BOOLValue");

      v17 = CheckerBoardLogHandleForCategory(8);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if ((v16 & 1) == 0)
      {
        if (v19)
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Network is [non-]hidden and open", v26, 2u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
        -[NSObject associateToHiddenUnencryptedNetworkWithName:](v6, "associateToHiddenUnencryptedNetworkWithName:", v20);
        goto LABEL_20;
      }
      if (v19)
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Network is [non-]hidden and encrypted", v25, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));
      -[NSObject associateToHiddenEncryptedNetworkWithName:password:](v6, "associateToHiddenEncryptedNetworkWithName:password:", v20, v21);
    }
    else
    {
      v22 = CheckerBoardLogHandleForCategory(8);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Network is non-hidden and encrypted", v24, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController scanResult](self, "scanResult"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));
      -[NSObject associateToEncryptedNetworkWithScanResult:password:](v6, "associateToEncryptedNetworkWithScanResult:password:", v20, v21);
    }

LABEL_20:
    goto LABEL_21;
  }
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We are already in the middle of an association…", v28, 2u);
  }
LABEL_21:

}

- (void)textFieldDidChange:(id)a3
{
  -[CBAlternateNetworkViewController setCurrentlyActiveTextField:](self, "setCurrentlyActiveTextField:", a3);
  -[CBAlternateNetworkViewController _updateReturnKey](self, "_updateReturnKey");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  void *v21;

  v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(_QWORD *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    if (-[CBAlternateNetworkViewController otherNetworkViewActive](self, "otherNetworkViewActive"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController _securitySpecifier](self, "_securitySpecifier"));
      v21 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      -[CBAlternateNetworkViewController setHiddenNetworkWithNoPasswordGroup:](self, "setHiddenNetworkWithNoPasswordGroup:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController _securitySpecifier](self, "_securitySpecifier"));
      v20[0] = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController _passwordSpecifier](self, "_passwordSpecifier"));
      v20[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
      -[CBAlternateNetworkViewController setHiddenNetworkWithPasswordGroup:](self, "setHiddenNetworkWithPasswordGroup:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController hiddenNetworkWithNoPasswordGroup](self, "hiddenNetworkWithNoPasswordGroup"));
      -[CBAlternateNetworkViewController setCurrentSecurityGroup:](self, "setCurrentSecurityGroup:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController _networkNameSpecifier](self, "_networkNameSpecifier"));
      v19[0] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController _groupSeparatorSpecifier](self, "_groupSeparatorSpecifier"));
      v19[1] = v11;
      v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
      v13 = *(void **)&self->PSListController_opaque[v3];
      *(_QWORD *)&self->PSListController_opaque[v3] = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController currentSecurityGroup](self, "currentSecurityGroup"));
      -[CBAlternateNetworkViewController addSpecifiersFromArray:](self, "addSpecifiersFromArray:", v14);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController _passwordSpecifier](self, "_passwordSpecifier"));
      v18 = v14;
      v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      v16 = *(void **)&self->PSListController_opaque[v3];
      *(_QWORD *)&self->PSListController_opaque[v3] = v15;

    }
  }
  return *(id *)&self->PSListController_opaque[v3];
}

- (id)_networkNameSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OTHER_NETWORK_NAME"), &stru_1000769A0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PSTextFieldSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSTextFieldSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, "setName:", "name", 0, 8, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OTHER_NETWORK_PLACEHOLDER"), &stru_1000769A0, 0));
  objc_msgSend(v5, "setPlaceholder:", v7);

  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(CBEditableTableCell, v8), PSCellClassKey);
  return v5;
}

- (id)_groupSeparatorSpecifier
{
  return +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
}

- (id)_securitySpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PASSWORD_REQUIRED"), &stru_1000769A0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, "setRequiresPassword:", "requiresPassword", 0, 6, 0));

  return v5;
}

- (id)_passwordSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_1000769A0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, "setPassword:", "password", 0, 12, 0));

  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(CBEditableTableCell, v6), PSCellClassKey);
  return v5;
}

- (void)setName:(id)a3
{
  -[CBAlternateNetworkViewController setNetworkName:](self, "setNetworkName:", a3);
}

- (id)name
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
  v3 = v2;
  if (!v2)
    v2 = &stru_1000769A0;
  v4 = v2;

  return v4;
}

- (void)setRequiresPassword:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CBAlternateNetworkViewController setNetworkRequiresPassword:](self, "setNetworkRequiresPassword:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkRequiresPassword](self, "networkRequiresPassword"));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController currentSecurityGroup](self, "currentSecurityGroup"));
  -[CBAlternateNetworkViewController removeContiguousSpecifiers:](self, "removeContiguousSpecifiers:", v6);

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController hiddenNetworkWithPasswordGroup](self, "hiddenNetworkWithPasswordGroup"));
    -[CBAlternateNetworkViewController addSpecifiersFromArray:](self, "addSpecifiersFromArray:", v7);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController hiddenNetworkWithPasswordGroup](self, "hiddenNetworkWithPasswordGroup"));
    -[CBAlternateNetworkViewController setCurrentSecurityGroup:](self, "setCurrentSecurityGroup:", v10);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController hiddenNetworkWithNoPasswordGroup](self, "hiddenNetworkWithNoPasswordGroup"));
    -[CBAlternateNetworkViewController addSpecifiersFromArray:](self, "addSpecifiersFromArray:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController hiddenNetworkWithNoPasswordGroup](self, "hiddenNetworkWithNoPasswordGroup"));
    -[CBAlternateNetworkViewController setCurrentSecurityGroup:](self, "setCurrentSecurityGroup:", v9);

    -[CBAlternateNetworkViewController setNetworkPassword:](self, "setNetworkPassword:", 0);
  }
}

- (id)requiresPassword
{
  _UNKNOWN **v2;
  void *v3;
  _UNKNOWN **v4;

  v2 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkRequiresPassword](self, "networkRequiresPassword"));
  v3 = v2;
  if (!v2)
    v2 = &off_100078DA0;
  v4 = v2;

  return v4;
}

- (void)setPassword:(id)a3
{
  -[CBAlternateNetworkViewController setNetworkPassword:](self, "setNetworkPassword:", a3);
}

- (id)password
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));
  v3 = v2;
  if (!v2)
    v2 = &stru_1000769A0;
  v4 = v2;

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CBAlternateNetworkViewController;
  v6 = a4;
  v7 = -[CBAlternateNetworkViewController tableView:cellForRowAtIndexPath:](&v24, "tableView:cellForRowAtIndexPath:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[CBAlternateNetworkViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v24.receiver, v24.super_class);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "objectAtIndex:", v9));
  v12 = objc_opt_class(CBEditableTableCell, v11);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textField"));
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "textFieldDidChange:", 0x20000);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OTHER_NETWORK_NAME"), &stru_1000769A0, 0));
    v18 = objc_msgSend(v15, "isEqualToString:", v17);

    if (v18)
    {
      -[CBAlternateNetworkViewController setNetworkNameCell:](self, "setNetworkNameCell:", v8);
      v19 = 32;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_1000769A0, 0));
      v22 = objc_msgSend(v15, "isEqualToString:", v21);

      if (!v22)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[CBAlternateNetworkViewController setPasswordCell:](self, "setPasswordCell:", v8);
      v19 = 100;
    }
    objc_msgSend(v14, "setAutocorrectionType:", 1);
    objc_msgSend(v14, "setAutocapitalizationType:", 0);
    objc_msgSend(v8, "setCharacterLimit:", v19);
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)_enableLeftBarButtonItem:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disabled");
    if (v3)
      v7 = CFSTR("enabled");
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Left bar button is %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftBarButtonItem"));
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)_enableRightBarButtonItem:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disabled");
    if (v3)
      v7 = CFSTR("enabled");
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Right bar button is %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController navigationItem](self, "navigationItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rightBarButtonItem"));
  objc_msgSend(v9, "setEnabled:", v3);

}

- (void)_setReturnKeyEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];

  v3 = a3;
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling return key %d", (uint8_t *)v7, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"));
  objc_msgSend(v6, "setReturnKeyEnabled:", v3);

}

- (void)_enableUI:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Enabling UI (%d)", (uint8_t *)v10, 8u);
  }

  objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table], "setUserInteractionEnabled:", v3);
  -[CBAlternateNetworkViewController _enableLeftBarButtonItem:](self, "_enableLeftBarButtonItem:", v3);
  if (v3)
  {
    -[CBAlternateNetworkViewController _updateReturnKey](self, "_updateReturnKey");
    v7 = CheckerBoardLogHandleForCategory(8);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "I'm bringing keyboard back", (uint8_t *)v10, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController currentlyActiveTextField](self, "currentlyActiveTextField"));
    objc_msgSend(v9, "becomeFirstResponder");

  }
  else
  {
    -[CBAlternateNetworkViewController _enableRightBarButtonItem:](self, "_enableRightBarButtonItem:", 0);
    -[CBAlternateNetworkViewController _setReturnKeyEnabled:](self, "_setReturnKeyEnabled:", 0);
  }
}

- (void)_updateReturnKey
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t v21[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating [Return] key…", v21, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkNameCell](self, "networkNameCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textField"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController passwordCell](self, "passwordCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textField"));

  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
    -[CBAlternateNetworkViewController setName:](self, "setName:", v9);

  }
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
    -[CBAlternateNetworkViewController setPassword:](self, "setPassword:", v10);

  }
  v11 = -[CBAlternateNetworkViewController _canAttemptJoin](self, "_canAttemptJoin");
  if (-[CBAlternateNetworkViewController otherNetworkViewActive](self, "otherNetworkViewActive"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController currentlyActiveTextField](self, "currentlyActiveTextField"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textInputTraits"));
      if (objc_msgSend(v14, "returnKeyType"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController scanResult](self, "scanResult"));
        if (objc_msgSend(v15, "isSecure"))
          v16 = -[CBAlternateNetworkViewController _passwordIsValid](self, "_passwordIsValid");
        else
          v16 = 1;

      }
      else
      {
        v16 = 1;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = -[CBAlternateNetworkViewController _passwordIsValid](self, "_passwordIsValid");
  }
  -[CBAlternateNetworkViewController _enableRightBarButtonItem:](self, "_enableRightBarButtonItem:", v11);
  -[CBAlternateNetworkViewController _setReturnKeyEnabled:](self, "_setReturnKeyEnabled:", v11 | v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textInputTraits"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController scanResult](self, "scanResult"));
  if (objc_msgSend(v18, "isSecure"))
    v19 = 0;
  else
    v19 = 3;
  objc_msgSend(v17, "setReturnKeyType:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textInputTraits"));
  objc_msgSend(v20, "setReturnKeyType:", 3);

}

- (void)_presentFailedAssociationAlertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v6 = a4;
  v7 = a3;
  v8 = CheckerBoardLogHandleForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Presenting failed association alert", v14, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v6, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_1000769A0, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, 0));
  objc_msgSend(v10, "addAction:", v13);

  -[CBAlternateNetworkViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)_checkoutAndPostAssociationCompletedNotificationWithError:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a3;
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking out Alternate Network View Controller…", v9, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("CBWiFiManagerErrorKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CBWiFiNetworkAssociationCompletedNotification"), 0, v7);

}

- (BOOL)_canAttemptJoin
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v8[2];

  if (-[CBAlternateNetworkViewController otherNetworkViewActive](self, "otherNetworkViewActive"))
  {
    if (-[CBAlternateNetworkViewController _networkNameIsValid](self, "_networkNameIsValid"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController scanResult](self, "scanResult"));
      if (objc_msgSend(v3, "isSecure"))
        v4 = -[CBAlternateNetworkViewController _passwordIsValid](self, "_passwordIsValid");
      else
        v4 = 1;

    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = -[CBAlternateNetworkViewController _passwordIsValid](self, "_passwordIsValid");
  }
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Allowing join %d", (uint8_t *)v8, 8u);
  }

  return v4;
}

- (BOOL)_networkNameIsValid
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  _DWORD v8[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkName](self, "networkName"));
  v3 = objc_msgSend(v2, "length");

  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (unint64_t)v3 - 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v6 < 0x20;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network name is valid %d", (uint8_t *)v8, 8u);
  }

  return v6 < 0x20;
}

- (BOOL)_passwordIsValid
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  _DWORD v18[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController networkPassword](self, "networkPassword"));
  v5 = (char *)objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invertedSet"));

  v8 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController scanResult](self, "scanResult"));
  if (objc_msgSend(v9, "isWPA"))
  {

LABEL_4:
    v13 = v5 == (char *)64 && v8 == (id)0x7FFFFFFFFFFFFFFFLL;
    v14 = (unint64_t)(v5 - 8) < 0x38 || v13;
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlternateNetworkViewController scanResult](self, "scanResult"));
  v11 = objc_msgSend(v10, "isWPA2");

  if (v11)
    goto LABEL_4;
  v14 = v5 != 0;
LABEL_14:
  v15 = CheckerBoardLogHandleForCategory(8);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Password is valid %d", (uint8_t *)v18, 8u);
  }

  return v14;
}

- (BOOL)otherNetworkViewActive
{
  return self->_otherNetworkViewActive;
}

- (void)setOtherNetworkViewActive:(BOOL)a3
{
  self->_otherNetworkViewActive = a3;
}

- (NSArray)hiddenNetworkWithNoPasswordGroup
{
  return self->_hiddenNetworkWithNoPasswordGroup;
}

- (void)setHiddenNetworkWithNoPasswordGroup:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenNetworkWithNoPasswordGroup, a3);
}

- (NSArray)hiddenNetworkWithPasswordGroup
{
  return self->_hiddenNetworkWithPasswordGroup;
}

- (void)setHiddenNetworkWithPasswordGroup:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenNetworkWithPasswordGroup, a3);
}

- (NSArray)currentSecurityGroup
{
  return self->_currentSecurityGroup;
}

- (void)setCurrentSecurityGroup:(id)a3
{
  objc_storeStrong((id *)&self->_currentSecurityGroup, a3);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (NSNumber)networkRequiresPassword
{
  return self->_networkRequiresPassword;
}

- (void)setNetworkRequiresPassword:(id)a3
{
  objc_storeStrong((id *)&self->_networkRequiresPassword, a3);
}

- (NSString)networkPassword
{
  return self->_networkPassword;
}

- (void)setNetworkPassword:(id)a3
{
  objc_storeStrong((id *)&self->_networkPassword, a3);
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
  objc_storeStrong((id *)&self->_scanResult, a3);
}

- (UITextField)currentlyActiveTextField
{
  return self->_currentlyActiveTextField;
}

- (void)setCurrentlyActiveTextField:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyActiveTextField, a3);
}

- (PSEditableTableCell)networkNameCell
{
  return self->_networkNameCell;
}

- (void)setNetworkNameCell:(id)a3
{
  objc_storeStrong((id *)&self->_networkNameCell, a3);
}

- (PSEditableTableCell)passwordCell
{
  return self->_passwordCell;
}

- (void)setPasswordCell:(id)a3
{
  objc_storeStrong((id *)&self->_passwordCell, a3);
}

- (int64_t)indexToSelect
{
  return self->_indexToSelect;
}

- (void)setIndexToSelect:(int64_t)a3
{
  self->_indexToSelect = a3;
}

- (BOOL)joining
{
  return self->_joining;
}

- (void)setJoining:(BOOL)a3
{
  self->_joining = a3;
}

- (unint64_t)retryJoinAttemptCount
{
  return self->_retryJoinAttemptCount;
}

- (void)setRetryJoinAttemptCount:(unint64_t)a3
{
  self->_retryJoinAttemptCount = a3;
}

- (NSTimer)joinTimer
{
  return self->_joinTimer;
}

- (void)setJoinTimer:(id)a3
{
  objc_storeStrong((id *)&self->_joinTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinTimer, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_networkNameCell, 0);
  objc_storeStrong((id *)&self->_currentlyActiveTextField, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong((id *)&self->_networkPassword, 0);
  objc_storeStrong((id *)&self->_networkRequiresPassword, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_currentSecurityGroup, 0);
  objc_storeStrong((id *)&self->_hiddenNetworkWithPasswordGroup, 0);
  objc_storeStrong((id *)&self->_hiddenNetworkWithNoPasswordGroup, 0);
}

@end
