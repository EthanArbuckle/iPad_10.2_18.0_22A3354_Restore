@implementation UIViewController

- (void)configureForRemoteSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_remoteSetupPresentAuthentication:", CFSTR("CBRemoteSetupAuthenticaitonDisplayNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_remoteSetupRequestAuthentication:", CFSTR("CBRemoteSetupAuthenticationRequestNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_remoteSetupFailed", CFSTR("CBRemoteSetupFailedNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_remoteSetupConfiguring", CFSTR("CBRemoteSetupConfiguringNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_remoteSetupCompleted", CFSTR("CBRemoteSetupCompletedNotification"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_remoteSetupCancelled", CFSTR("CBRemoteSetupCancelledNotification"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBRemoteSetupManager sharedInstance](CBRemoteSetupManager, "sharedInstance"));
  -[UIViewController setRemoteSetupManager:](self, "setRemoteSetupManager:", v9);

  -[UIViewController setRemoteSetupAuthController:](self, "setRemoteSetupAuthController:", 0);
  -[UIViewController setRemoteSetupConfiguringController:](self, "setRemoteSetupConfiguringController:", 0);
  -[UIViewController setRemoteSetupQRCodeScannerController:](self, "setRemoteSetupQRCodeScannerController:", 0);
  -[UIViewController setRemoteSetupQRCodeScanner:](self, "setRemoteSetupQRCodeScanner:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = v10;
  if (!v10
    || (v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("remoteSetupCompleted")), v12 = v14,
                                                                                                (v11 & 1) == 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBRemoteSetupManager sharedInstance](CBRemoteSetupManager, "sharedInstance"));
    objc_msgSend(v13, "startRemoteSetupBroadcast");

    v12 = v14;
  }

}

- (void)unConfigureForRemoteSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBRemoteSetupManager sharedInstance](CBRemoteSetupManager, "sharedInstance"));
  objc_msgSend(v3, "endRemoteSetupBroadcast");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CBRemoteSetupAuthenticaitonDisplayNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CBRemoteSetupFailedNotification"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("CBRemoteSetupConfiguringNotification"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("CBRemoteSetupCompletedNotification"), 0);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("CBRemoteSetupCancelledNotification"), 0);

}

- (void)_remoteSetupPresentAuthentication:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  CBRemoteSetupAuthenticationViewController *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v43 = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote setup is requesting we present authentication with info: %@", (uint8_t *)&v43, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pin")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  if (v11)
    v14 = v9 == 0;
  else
    v14 = 1;
  if (v14)
  {
    v15 = CheckerBoardLogHandleForCategory(1);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000450B4(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToValue:", &off_100078B90))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_PIN_AUTH_TITLE"), &stru_1000769A0, 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = v25;
      v27 = CFSTR("REMOTE_SETUP_PIN_AUTH_DETAIL");
LABEL_16:
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1000769A0, 0));

      v30 = -[CBRemoteSetupAuthenticationViewController initWithTitle:detailText:icon:]([CBRemoteSetupAuthenticationViewController alloc], "initWithTitle:detailText:icon:", v16, v29, 0);
      -[UIViewController setRemoteSetupAuthController:](self, "setRemoteSetupAuthController:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
      objc_msgSend(v31, "setPairingCode:", v11);

      v32 = objc_msgSend(v9, "intValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
      objc_msgSend(v33, "setPasswordType:", v32);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
      -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, 0);

      goto LABEL_20;
    }
    if (objc_msgSend(v9, "isEqualToValue:", &off_100078BA8))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_QR_AUTH_TITLE"), &stru_1000769A0, 0));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = v25;
      v27 = CFSTR("REMOTE_SETUP_QR_AUTH_DETAIL");
      goto LABEL_16;
    }
    v35 = CheckerBoardLogHandleForCategory(1);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10004504C((uint64_t)v9, v36, v37, v38, v39, v40, v41, v42);

    v16 = objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupManager](self, "remoteSetupManager"));
    -[NSObject setupFailed](v16, "setupFailed");
  }
LABEL_20:

}

- (void)_remoteSetupRequestAuthentication:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  CBQRCodeScanner *v12;
  void *v13;
  CBRemoteSetupQRCodeScanViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CBRemoteSetupQRCodeScanViewController *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  id v46;

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote setup wants us to answer authenticiation with info: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));

  if ((objc_msgSend(v8, "isEqualToValue:", &off_100078BA8) & 1) != 0)
  {
    v9 = CFSTR("REMOTE_SETUP_QR_SCAN_DETAIL");
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToValue:", &off_100078B90) & 1) == 0)
    {
      v33 = CheckerBoardLogHandleForCategory(1);
      v25 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100045114((uint64_t)v8, v25, v34, v35, v36, v37, v38, v39);
      goto LABEL_15;
    }
    v9 = CFSTR("REMOTE_SETUP_ACC_SCAN_DETAIL");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScannerController](self, "remoteSetupQRCodeScannerController"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScannerController](self, "remoteSetupQRCodeScannerController"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100007358;
    v44[3] = &unk_1000753E8;
    v44[4] = self;
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v44);

    -[UIViewController setRemoteSetupQRCodeScannerController:](self, "setRemoteSetupQRCodeScannerController:", 0);
  }
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000073BC;
  v43[3] = &unk_100075410;
  v43[4] = self;
  v12 = -[CBQRCodeScanner initWithScanCompletion:]([CBQRCodeScanner alloc], "initWithScanCompletion:", v43);
  -[UIViewController setRemoteSetupQRCodeScanner:](self, "setRemoteSetupQRCodeScanner:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScanner](self, "remoteSetupQRCodeScanner"));
  if (!v13)
  {
    v24 = CheckerBoardLogHandleForCategory(1);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000450E4(v25, v26, v27, v28, v29, v30, v31, v32);
LABEL_15:

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupManager](self, "remoteSetupManager"));
    objc_msgSend(v40, "setupFailed");

    goto LABEL_16;
  }
  v14 = [CBRemoteSetupQRCodeScanViewController alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v41 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_QR_SCAN_TITLE"), &stru_1000769A0, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v9, &stru_1000769A0, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupManager](self, "remoteSetupManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScanner](self, "remoteSetupQRCodeScanner"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "captureSession"));
  v22 = -[CBRemoteSetupQRCodeScanViewController initWithTitle:detailText:icon:remoteSetupManager:captureSession:](v14, "initWithTitle:detailText:icon:remoteSetupManager:captureSession:", v16, v18, 0, v19, v21);
  -[UIViewController setRemoteSetupQRCodeScannerController:](self, "setRemoteSetupQRCodeScannerController:", v22);

  v4 = v41;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScannerController](self, "remoteSetupQRCodeScannerController"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000074CC;
  v42[3] = &unk_1000753E8;
  v42[4] = self;
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, v42);

LABEL_16:
}

- (void)_remoteSetupConfiguring
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  CBRemoteSetupConfiguringViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CBRemoteSetupConfiguringViewController *v12;
  void *v13;
  uint8_t v14[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote setup is now configuring", v14, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    -[UIViewController setRemoteSetupAuthController:](self, "setRemoteSetupAuthController:", 0);
  }
  v7 = [CBRemoteSetupConfiguringViewController alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_CONFIGURING_TITLE"), &stru_1000769A0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_CONFIGURING_DETAIL"), &stru_1000769A0, 0));
  v12 = -[CBRemoteSetupConfiguringViewController initWithTitle:detailText:icon:](v7, "initWithTitle:detailText:icon:", v9, v11, 0);
  -[UIViewController setRemoteSetupConfiguringController:](self, "setRemoteSetupConfiguringController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupConfiguringController](self, "remoteSetupConfiguringController"));
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)_remoteSetupCompleted
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote setup complete. Leaving breadcrumb prior to restart.", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", 1, CFSTR("remoteSetupCompleted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupManager](self, "remoteSetupManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteLocaleCode"));

  if (v7)
  {
    v8 = CheckerBoardLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Applying language from remote setup", v15, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBLocationController sharedLocationController](CBLocationController, "sharedLocationController"));
    objc_msgSend(v10, "selectLanguage:restartAfterCompletion:", v7, 0);

  }
  v11 = CheckerBoardLogHandleForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Restarting CheckerBoard to complete remote setup.", v14, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](FBSystemService, "sharedInstance"));
  objc_msgSend(v13, "exitAndRelaunch:", 1);

}

- (void)_clearRemoteSetupUX
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupConfiguringController](self, "remoteSetupConfiguringController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupConfiguringController](self, "remoteSetupConfiguringController"));
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    -[UIViewController setRemoteSetupConfiguringController:](self, "setRemoteSetupConfiguringController:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupAuthController](self, "remoteSetupAuthController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    -[UIViewController setRemoteSetupAuthController:](self, "setRemoteSetupAuthController:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScannerController](self, "remoteSetupQRCodeScannerController"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController remoteSetupQRCodeScannerController](self, "remoteSetupQRCodeScannerController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007A08;
    v9[3] = &unk_1000753E8;
    v9[4] = self;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v9);

    -[UIViewController setRemoteSetupQRCodeScannerController:](self, "setRemoteSetupQRCodeScannerController:", 0);
  }
}

- (void)_remoteSetupCancelled
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote setup cancelled.", v5, 2u);
  }

  -[UIViewController _clearRemoteSetupUX](self, "_clearRemoteSetupUX");
}

- (void)_remoteSetupFailed
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote setup failed. Restarting broadcast after alert.", buf, 2u);
  }

  -[UIViewController _clearRemoteSetupUX](self, "_clearRemoteSetupUX");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_FAILED_TITLE"), &stru_1000769A0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_FAILED_DETAIL"), &stru_1000769A0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_1000769A0, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100007CB4;
  v13[3] = &unk_100075438;
  v13[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, v13));
  objc_msgSend(v9, "addAction:", v12);

  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

@end
