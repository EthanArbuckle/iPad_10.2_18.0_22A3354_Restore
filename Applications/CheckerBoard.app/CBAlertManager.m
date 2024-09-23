@implementation CBAlertManager

+ (id)sharedInstance
{
  if (qword_10008BDB8 != -1)
    dispatch_once(&qword_10008BDB8, &stru_100075EC8);
  return (id)qword_10008BDB0;
}

- (id)_init
{
  CBAlertManager *v2;
  CBAlertManager *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CBAlertManager;
  v2 = -[CBAlertManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_powerDownVisible = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_dismissWiFiPicker", CFSTR("CBNetworkViewControllerWillDismissFromDoneButtonNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBDebugInfoViewController CBDebugInfoViewDismissButtonPressedNotification](CBDebugInfoViewController, "CBDebugInfoViewDismissButtonPressedNotification"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "_dismissDebugInfo", v6, 0);

  }
  return v3;
}

- (void)showMenuSheetWithOptions:(unint64_t)a3 completion:(id)a4 response:(id)a5
{
  char v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  const __CFString *v24;
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
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[16];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (-[CBAlertManager _alertNotVisible](self, "_alertNotVisible")
    && -[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 1)
    && -[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 2))
  {
    v10 = CheckerBoardLogHandleForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Presenting menu sheet…", buf, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v13 = (unint64_t)objc_msgSend(v12, "userInterfaceIdiom");

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, (v13 & 0xFFFFFFFFFFFFFFFBLL) == 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EXIT_DIAGNOSTICS"), &stru_1000769A0, 0));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100025128;
    v48[3] = &unk_100075EF0;
    v48[4] = self;
    v17 = v9;
    v49 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 2, v48));
    objc_msgSend(v14, "addAction:", v18);

    if ((v6 & 1) != 0 && !-[CBAlertManager wiFiPickerVisible](self, "wiFiPickerVisible"))
    {
      v21 = MGGetBoolAnswer(CFSTR("wapi"), v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = v22;
      if (v21)
        v24 = CFSTR("WLAN_SETTINGS");
      else
        v24 = CFSTR("WIFI_SETTINGS");
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_1000769A0, 0));

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000251B0;
      v46[3] = &unk_100075EF0;
      v46[4] = self;
      v47 = v17;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 0, v46));
      objc_msgSend(v14, "addAction:", v26);

    }
    if ((v6 & 2) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SHUT_DOWN"), &stru_1000769A0, 0));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100025238;
      v44[3] = &unk_100075EF0;
      v44[4] = self;
      v45 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 0, v44));
      objc_msgSend(v14, "addAction:", v29);

    }
    if ((v6 & 4) != 0 && !-[CBAlertManager debugInfoVisible](self, "debugInfoVisible"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("[Internal Only] CheckerBoard Debug 🐜"), &stru_1000769A0, 0));
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000252C0;
      v42[3] = &unk_100075EF0;
      v42[4] = self;
      v43 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v31, 0, v42));
      objc_msgSend(v14, "addAction:", v32);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000769A0, 0));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100025348;
    v40[3] = &unk_100075EF0;
    v40[4] = self;
    v41 = v17;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v34, 1, v40));
    objc_msgSend(v14, "addAction:", v35);

    -[CBAlertManager setAlertVisible:](self, "setAlertVisible:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000253D0;
    v38[3] = &unk_100075AE0;
    v39 = v8;
    v37 = objc_msgSend(v36, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v14, 2, 0, 0, 1, v38);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)showExitConfirmationWithCompletion:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
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
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[CBAlertManager _alertNotVisible](self, "_alertNotVisible"))
  {
    v8 = CheckerBoardLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Presenting exit CheckerBoard confirmation alert…", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v11 = (unint64_t)objc_msgSend(v10, "userInterfaceIdiom");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ARE_YOU_SURE"), &stru_1000769A0, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, 0, (v11 & 0xFFFFFFFFFFFFFFFBLL) == 1));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EXIT_DIAGNOSTICS"), &stru_1000769A0, 0));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100025784;
    v28[3] = &unk_100075EF0;
    v28[4] = self;
    v17 = v7;
    v29 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 2, v28));
    objc_msgSend(v14, "addAction:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000769A0, 0));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000257B8;
    v26[3] = &unk_100075EF0;
    v26[4] = self;
    v27 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 1, v26));
    objc_msgSend(v14, "addAction:", v21);

    -[CBAlertManager setAlertVisible:](self, "setAlertVisible:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000257EC;
    v24[3] = &unk_100075AE0;
    v25 = v6;
    v23 = objc_msgSend(v22, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v14, 2, 0, 0, 1, v24);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)showWiFiPickerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  CBNetworkViewController *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  if (-[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 0))
  {
    v5 = CheckerBoardLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting Wi-Fi picker…", buf, 2u);
    }

    v7 = -[CBNetworkViewController initWithSetupPresentationTheme:]([CBNetworkViewController alloc], "initWithSetupPresentationTheme:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBNetworkViewController view](v7, "view"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
    -[CBAlertManager setWiFiPickerVisible:](self, "setWiFiPickerVisible:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100025A20;
    v13[3] = &unk_100075AE0;
    v14 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v10, 2, 0, 1, 1, v13));
    -[CBAlertManager setWiFiPickerWindow:](self, "setWiFiPickerWindow:", v12);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)showThermalWarningWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  CBTemperatureWarningViewController *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  if (-[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 1))
  {
    v5 = CheckerBoardLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting thermal warning UI…", buf, 2u);
    }

    v7 = objc_alloc_init(CBTemperatureWarningViewController);
    -[CBTemperatureWarningViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 5);
    -[CBTemperatureWarningViewController setModalTransitionStyle:](v7, "setModalTransitionStyle:", 2);
    v8 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlertManager _pointImageOfColor:](self, "_pointImageOfColor:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationBar"));
    objc_msgSend(v11, "setBackgroundImage:forBarMetrics:", v10, 0);

    -[CBAlertManager setThermalWarningVisible:](self, "setThermalWarningVisible:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100025C8C;
    v14[3] = &unk_100075AE0;
    v15 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v8, 2, 0, 0, 1, v14));
    -[CBAlertManager setThermalWarningWindow:](self, "setThermalWarningWindow:", v13);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)showPowerDownWithCompletion:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 2))
  {
    v8 = CheckerBoardLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Presenting power down UI…", buf, 2u);
    }

    -[CBAlertManager setPowerDownResponse:](self, "setPowerDownResponse:", v7);
    v10 = +[SBUIPowerDownViewControllerFactory newPowerDownViewController](SBUIPowerDownViewControllerFactory, "newPowerDownViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v12, "setBackgroundColor:", v11);

    objc_msgSend(v10, "setPowerDownDelegate:", self);
    objc_msgSend(v10, "setModalPresentationStyle:", 5);
    objc_msgSend(v10, "setModalTransitionStyle:", 2);
    -[CBAlertManager setPowerDownVisible:](self, "setPowerDownVisible:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100025EDC;
    v15[3] = &unk_100075AE0;
    v16 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v10, 2, 0, 0, 1, v15));
    -[CBAlertManager setPowerDownWindow:](self, "setPowerDownWindow:", v14);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)showDebugInfoWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  CBDebugInfoViewController *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  if (-[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 3))
  {
    v5 = CheckerBoardLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting debug info UI...", buf, 2u);
    }

    v7 = objc_alloc_init(CBDebugInfoViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBDebugInfoViewController view](v7, "view"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
    -[CBAlertManager setDebugInfoVisible:](self, "setDebugInfoVisible:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBWindowManager sharedInstance](CBWindowManager, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100026108;
    v13[3] = &unk_100075AE0;
    v14 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:", v10, 2, 0, 1, 1, v13));
    -[CBAlertManager setDebugInfoWindow:](self, "setDebugInfoWindow:", v12);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)dismissThermalWarningWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (void (**)(_QWORD))a3;
  if (-[CBAlertManager _modalNotVisible:](self, "_modalNotVisible:", 1))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    v5 = CheckerBoardLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dismissing thermal warning.", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlertManager thermalWarningWindow](self, "thermalWarningWindow"));
    objc_msgSend(v7, "dismissViewControllerAnimated:", 1);

    -[CBAlertManager setThermalWarningVisible:](self, "setThermalWarningVisible:", 0);
    -[CBAlertManager setThermalWarningWindow:](self, "setThermalWarningWindow:", 0);
  }

}

- (void)powerDownViewRequestCancel:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint8_t v8[16];

  v4 = CheckerBoardLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power down request canceled - dismissing power down UI.", v8, 2u);
  }

  -[CBAlertManager setPowerDownVisible:](self, "setPowerDownVisible:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlertManager powerDownWindow](self, "powerDownWindow"));
  objc_msgSend(v6, "dismissViewControllerAnimated:", 1);

  -[CBAlertManager setPowerDownWindow:](self, "setPowerDownWindow:", 0);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CBAlertManager powerDownResponse](self, "powerDownResponse"));
  v7[2](v7, 1);

}

- (void)powerDownViewRequestPowerDown:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v7[16];

  v4 = CheckerBoardLogHandleForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power down requested.", v7, 2u);
  }

  -[CBAlertManager setPowerDownVisible:](self, "setPowerDownVisible:", 0);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CBAlertManager powerDownResponse](self, "powerDownResponse"));
  v6[2](v6, 0);

}

- (id)_pointImageOfColor:(id)a3
{
  id v3;
  UIImage *ImageFromCurrentImageContext;
  void *v5;
  CGSize v7;
  CGRect v8;

  v3 = a3;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  objc_msgSend(v3, "set");

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v5;
}

- (void)_dismissWiFiPicker
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing Wi-Fi picker.", v6, 2u);
  }

  -[CBAlertManager setWiFiPickerVisible:](self, "setWiFiPickerVisible:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlertManager wiFiPickerWindow](self, "wiFiPickerWindow"));
  objc_msgSend(v5, "dismissViewControllerAnimated:", 1);

  -[CBAlertManager setWiFiPickerWindow:](self, "setWiFiPickerWindow:", 0);
}

- (void)_dismissDebugInfo
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = CheckerBoardLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing Debug Info view", v6, 2u);
  }

  -[CBAlertManager setDebugInfoVisible:](self, "setDebugInfoVisible:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAlertManager debugInfoWindow](self, "debugInfoWindow"));
  objc_msgSend(v5, "dismissViewControllerAnimated:", 1);

  -[CBAlertManager setDebugInfoWindow:](self, "setDebugInfoWindow:", 0);
}

- (BOOL)_alertNotVisible
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];

  if (-[CBAlertManager alertVisible](self, "alertVisible"))
  {
    v3 = CheckerBoardLogHandleForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "An alert is already visible.", v6, 2u);
    }

  }
  return !-[CBAlertManager alertVisible](self, "alertVisible");
}

- (BOOL)_modalNotVisible:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  unint64_t v8;

  if (!a3)
  {
    if (-[CBAlertManager wiFiPickerVisible](self, "wiFiPickerVisible"))
      goto LABEL_9;
    return 1;
  }
  if (a3 == 2)
  {
    if (-[CBAlertManager powerDownVisible](self, "powerDownVisible"))
      goto LABEL_9;
    return 1;
  }
  if (a3 != 1 || !-[CBAlertManager thermalWarningVisible](self, "thermalWarningVisible"))
    return 1;
LABEL_9:
  v5 = CheckerBoardLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Modal (%ld) is already visible.", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)powerDownVisible
{
  return self->_powerDownVisible;
}

- (void)setPowerDownVisible:(BOOL)a3
{
  self->_powerDownVisible = a3;
}

- (BOOL)alertVisible
{
  return self->_alertVisible;
}

- (void)setAlertVisible:(BOOL)a3
{
  self->_alertVisible = a3;
}

- (BOOL)wiFiPickerVisible
{
  return self->_wiFiPickerVisible;
}

- (void)setWiFiPickerVisible:(BOOL)a3
{
  self->_wiFiPickerVisible = a3;
}

- (BOOL)thermalWarningVisible
{
  return self->_thermalWarningVisible;
}

- (void)setThermalWarningVisible:(BOOL)a3
{
  self->_thermalWarningVisible = a3;
}

- (BOOL)debugInfoVisible
{
  return self->_debugInfoVisible;
}

- (void)setDebugInfoVisible:(BOOL)a3
{
  self->_debugInfoVisible = a3;
}

- (CBWindow)wiFiPickerWindow
{
  return self->_wiFiPickerWindow;
}

- (void)setWiFiPickerWindow:(id)a3
{
  objc_storeStrong((id *)&self->_wiFiPickerWindow, a3);
}

- (CBWindow)thermalWarningWindow
{
  return self->_thermalWarningWindow;
}

- (void)setThermalWarningWindow:(id)a3
{
  objc_storeStrong((id *)&self->_thermalWarningWindow, a3);
}

- (CBWindow)powerDownWindow
{
  return self->_powerDownWindow;
}

- (void)setPowerDownWindow:(id)a3
{
  objc_storeStrong((id *)&self->_powerDownWindow, a3);
}

- (CBWindow)debugInfoWindow
{
  return self->_debugInfoWindow;
}

- (void)setDebugInfoWindow:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfoWindow, a3);
}

- (id)powerDownResponse
{
  return self->_powerDownResponse;
}

- (void)setPowerDownResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_powerDownResponse, 0);
  objc_storeStrong((id *)&self->_debugInfoWindow, 0);
  objc_storeStrong((id *)&self->_powerDownWindow, 0);
  objc_storeStrong((id *)&self->_thermalWarningWindow, 0);
  objc_storeStrong((id *)&self->_wiFiPickerWindow, 0);
}

@end
