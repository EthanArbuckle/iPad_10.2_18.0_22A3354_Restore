@implementation ContinuityCaptureShieldUIViewController

- (ContinuityCaptureShieldUIViewController)initWithSceneSessionRole:(id)a3
{
  id v5;
  ContinuityCaptureShieldUIViewController *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  ContinuityCaptureShieldUIViewController *v17;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ContinuityCaptureShieldUIViewController;
  v6 = -[ContinuityCaptureShieldUIViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  if (v6)
  {
    v7 = sub_100007074();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[ContinuityCaptureShieldUIViewController initWithSceneSessionRole:]";
      v16 = 2048;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_sessionRole, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v6, CFSTR("active"), 3, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v6, CFSTR("activeConfiguration"), 3, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v6, CFSTR("inFaceTime"), 3, 0);

    atomic_store(1u, (unsigned __int8 *)&v6->_observingKVO);
  }

  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  ContinuityCaptureShieldUIViewController *v13;
  __int16 v14;
  const char *v15;

  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[ContinuityCaptureShieldUIViewController dealloc]";
    v12 = 2048;
    v13 = self;
    v14 = 2080;
    v15 = "-[ContinuityCaptureShieldUIViewController dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: <%p> %s", buf, 0x20u);
  }

  v5 = atomic_load((unsigned __int8 *)&self->_observingKVO);
  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("active"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("activeConfiguration"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CFSTR("inFaceTime"), 0);

    atomic_store(0, (unsigned __int8 *)&self->_observingKVO);
  }
  v9.receiver = self;
  v9.super_class = (Class)ContinuityCaptureShieldUIViewController;
  -[ContinuityCaptureShieldUIViewController dealloc](&v9, "dealloc");
}

- (void)loadView
{
  ContinuityCaptureShieldUIContentView *v3;

  v3 = objc_alloc_init(ContinuityCaptureShieldUIContentView);
  -[ContinuityCaptureShieldUIContentView setDelegate:](v3, "setDelegate:", self);
  -[ContinuityCaptureShieldUIViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  ContinuityCaptureShieldUIViewController *v14;

  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ContinuityCaptureShieldUIViewController viewDidLoad]";
    v13 = 2048;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)ContinuityCaptureShieldUIViewController;
  -[ContinuityCaptureShieldUIViewController viewDidLoad](&v10, "viewDidLoad");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
  objc_msgSend(v7, "setOverrideUserInterfaceStyle:", 2);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
  objc_msgSend(v8, "_setOverrideUserInterfaceRenderingMode:", 2);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
  objc_msgSend(v9, "_setOverrideVibrancyTrait:", 2);

  -[ContinuityCaptureShieldUIViewController _updateUI](self, "_updateUI");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  ContinuityCaptureShieldUIViewController *v11;

  v3 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ContinuityCaptureShieldUIViewController viewWillAppear:]";
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ContinuityCaptureShieldUIViewController;
  -[ContinuityCaptureShieldUIViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  -[ContinuityCaptureShieldUIViewController _updateUI](self, "_updateUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  ContinuityCaptureShieldUIViewController *v11;

  v3 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ContinuityCaptureShieldUIViewController viewDidAppear:]";
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ContinuityCaptureShieldUIViewController;
  -[ContinuityCaptureShieldUIViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  ContinuityCaptureShieldUIViewController *v11;

  v3 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ContinuityCaptureShieldUIViewController viewWillDisappear:]";
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ContinuityCaptureShieldUIViewController;
  -[ContinuityCaptureShieldUIViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  ContinuityCaptureShieldUIViewController *v11;

  v3 = a3;
  v5 = sub_100007074();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ContinuityCaptureShieldUIViewController viewDidDisappear:]";
    v10 = 2048;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ContinuityCaptureShieldUIViewController;
  -[ContinuityCaptureShieldUIViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  unsigned int v16;
  objc_super v17;
  _QWORD block[5];
  _QWORD v19[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("active")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    if (objc_msgSend(v13, "BOOLValue"))
    {

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16)
        -[ContinuityCaptureShieldUIViewController tearDownShield](self, "tearDownShield");
    }
  }
  else
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("activeConfiguration")))
    {
      +[ContinuityCaptureShieldUIViewController _refreshUIState](ContinuityCaptureShieldUIViewController, "_refreshUIState");
      +[ContinuityCaptureShieldUIViewController _refreshConnectionType](ContinuityCaptureShieldUIViewController, "_refreshConnectionType");
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000030A8;
      v19[3] = &unk_100018570;
      v19[4] = self;
      v14 = v19;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("inFaceTime")))
      {
        v17.receiver = self;
        v17.super_class = (Class)ContinuityCaptureShieldUIViewController;
        -[ContinuityCaptureShieldUIViewController observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
        goto LABEL_12;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100003168;
      block[3] = &unk_100018570;
      block[4] = self;
      v14 = block;
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
LABEL_12:

}

- (BOOL)_isOnLockScreen
{
  return self->_sessionRole == (NSString *)_UIWindowSceneSessionTypeCoverSheet;
}

- (BOOL)_shouldShowHowToReconnectDialog
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeConfiguration"));

  if (v3)
    v4 = objc_msgSend(v3, "clientDeviceModel") == (id)1;
  else
    v4 = 0;

  return v4;
}

- (void)_showHowToReconnectDialog
{
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v3 = +[ContinuityCaptureShieldUIViewController _isPad](ContinuityCaptureShieldUIViewController, "_isPad");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("ALERT_DISCONNECTED_TITLE_IPAD");
  else
    v6 = CFSTR("ALERT_DISCONNECTED_TITLE_IPHONE");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100018A18, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = v9;
  if (v3)
    v11 = CFSTR("ALERT_DISCONNECTED_MESSAGE_IPAD");
  else
    v11 = CFSTR("ALERT_DISCONNECTED_MESSAGE_IPHONE");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_100018A18, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v12, 1));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_BUTTON_TITLE_DISCONNECT"), &stru_100018A18, 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000035AC;
  v22[3] = &unk_100018598;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 2, v22));
  objc_msgSend(v13, "addAction:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_BUTTON_TITLE_CANCEL"), &stru_100018A18, 0));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100003684;
  v20[3] = &unk_100018598;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, v20));
  objc_msgSend(v13, "addAction:", v19);

  -[ContinuityCaptureShieldUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (void)_showDedicatedDisconnectDialog
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
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_DEDICATED_TITLE"), &stru_100018A18, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_DEDICATED_MESSAGE"), &stru_100018A18, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v8, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_BUTTON_TITLE_DISCONNECT"), &stru_100018A18, 0));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100003A48;
  v18[3] = &unk_100018598;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 2, v18));
  objc_msgSend(v9, "addAction:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_BUTTON_TITLE_CANCEL"), &stru_100018A18, 0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100003B20;
  v16[3] = &unk_100018598;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 1, v16));
  objc_msgSend(v9, "addAction:", v15);

  -[ContinuityCaptureShieldUIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (void)_updateUIForConnectionType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  v4 = v16;
  if (v16)
  {
    v5 = objc_msgSend(v16, "clientDeviceModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
    if ((unint64_t)v5 >= 2)
    {
      if (v5 == (id)2)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
        v11 = objc_msgSend(v10, "connectionType");

        if (!v11)
        {
          v9 = CFSTR("appletv.fill");
          goto LABEL_15;
        }
        if (v11 == (id)1)
        {
          v12 = CFSTR("appletv_mic");
        }
        else
        {
          if (v11 != (id)2)
            goto LABEL_20;
          v12 = CFSTR("appletv_camera");
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v12));
LABEL_18:
        v14 = v13;
        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));

          objc_msgSend(v6, "setImage:", v15);
        }
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v8 = objc_msgSend(v7, "connectionType");

      if (!v8)
      {
        v9 = CFSTR("video.slash.fill");
        goto LABEL_15;
      }
      if (v8 == (id)1)
      {
        v9 = CFSTR("mic.circle.fill");
        goto LABEL_15;
      }
      if (v8 == (id)2)
      {
        v9 = CFSTR("video.circle.fill");
LABEL_15:
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v9));
        goto LABEL_18;
      }
    }
LABEL_20:

    v4 = v16;
  }

}

- (void)_updateUIForClientInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  id v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  v4 = v41;
  if (v41)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "clientName"));
    v7 = +[ContinuityCaptureShieldUIViewController _isPad](ContinuityCaptureShieldUIViewController, "_isPad");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v9 = objc_msgSend(v8, "uiState");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v11 = objc_msgSend(v10, "isInFaceTime");

    v12 = objc_msgSend(v41, "clientDeviceModel");
    if ((unint64_t)v12 >= 2)
    {
      if (v12 != (id)2)
      {
        v20 = 0;
LABEL_52:

        v4 = v41;
        goto LABEL_53;
      }
      if (!v6 || v9)
      {
        if (!v6 || !v9)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v35 = v34;
          if (v6 || v9)
            v36 = CFSTR("LABEL_CONNECTED_TO_TV");
          else
            v36 = CFSTR("LABEL_CONNECTING_TO_TV");
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", v36, &stru_100018A18, 0));

          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v25 = v32;
          if (v11)
          {
            v37 = CFSTR("SUBTITLE_DESCRIPTION_TV_FACETIME_IPHONE");
            v38 = CFSTR("SUBTITLE_DESCRIPTION_TV_FACETIME_IPAD");
          }
          else
          {
            v37 = CFSTR("SUBTITLE_DESCRIPTION_TV_IPHONE");
            v38 = CFSTR("SUBTITLE_DESCRIPTION_TV_IPAD");
          }
          if (v7)
            v33 = v38;
          else
            v33 = v37;
          goto LABEL_47;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = v16;
        v18 = CFSTR("LABEL_CONNECTED_TO_TV_WITH_NAME");
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = v16;
        v18 = CFSTR("LABEL_CONNECTING_TO_TV_WITH_NAME");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_100018A18, 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v6));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      if (v11)
      {
        v26 = CFSTR("SUBTITLE_DESCRIPTION_TV_FACETIME_WITH_NAME_IPHONE");
        v27 = CFSTR("SUBTITLE_DESCRIPTION_TV_FACETIME_WITH_NAME_IPAD");
      }
      else
      {
        v26 = CFSTR("SUBTITLE_DESCRIPTION_TV_WITH_NAME_IPHONE");
        v27 = CFSTR("SUBTITLE_DESCRIPTION_TV_WITH_NAME_IPAD");
      }
      if (v7)
        v28 = v27;
      else
        v28 = v26;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v28, &stru_100018A18, 0));
      v40 = v6;
      goto LABEL_48;
    }
    if (!v6 || v9)
    {
      if (!v6 || !v9)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v14 = v21;
        if (v6 || v9)
          v22 = CFSTR("LABEL_CONNECTED_TO_MAC");
        else
          v22 = CFSTR("LABEL_CONNECTING_TO_MAC");
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_100018A18, 0));
        goto LABEL_30;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = v13;
      v15 = CFSTR("LABEL_CONNECTED_TO_MAC_WITH_NAME");
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = v13;
      v15 = CFSTR("LABEL_CONNECTING_TO_MAC_WITH_NAME");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_100018A18, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v6));

LABEL_30:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v31 = objc_msgSend(v30, "connectionType");

    if (v31 == (id)1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v32;
      v33 = CFSTR("LABEL_DISCONNECT_DESCRIPTION_MICROPHONE_MAC");
    }
    else if (v31 == (id)2)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v32;
      v33 = CFSTR("LABEL_DISCONNECT_DESCRIPTION_CAMERA_MAC");
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v32;
      if (v7)
        v33 = CFSTR("LABEL_DISCONNECT_IPAD_DESCRIPTION_NONE_MAC");
      else
        v33 = CFSTR("LABEL_DISCONNECT_DESCRIPTION_NONE_MAC");
    }
LABEL_47:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", v33, &stru_100018A18, 0));
LABEL_48:
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v40));

    if (v20)
      objc_msgSend(v5, "setPrimaryText:", v20);
    if (v39)
    {
      objc_msgSend(v5, "setSecondaryText:", v39);

    }
    goto LABEL_52;
  }
LABEL_53:

}

- (void)_updateUIForUIState
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInFaceTime");

  objc_msgSend(v9, "setInFaceTimeSession:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v5 = objc_msgSend(v4, "isDedicatedSession");

  objc_msgSend(v9, "setIsDedicatedSession:", v5);
  objc_msgSend(v9, "setInPlacementStep:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v7 = objc_msgSend(v6, "uiState");

  if (v7 == (id)4)
  {
    v7 = 0;
LABEL_6:
    objc_msgSend(v9, "setPauseButtonState:", v7);
    v8 = v9;
    goto LABEL_7;
  }
  if (v7 == (id)2)
    goto LABEL_6;
  v8 = v9;
  if (v7 == (id)1)
    goto LABEL_6;
LABEL_7:

}

- (void)_updateUIForPlacementStep
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  NSString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
    v6 = objc_msgSend(v4, "clientDeviceModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientName"));
    v8 = +[ContinuityCaptureShieldUIViewController _isPad](ContinuityCaptureShieldUIViewController, "_isPad");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v10 = objc_msgSend(v9, "uiState");

    if (v10 == (id)5)
    {
      if (v6 == (id)2)
      {
        objc_msgSend(v5, "setInPlacementStep:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = v11;
        if (v8)
          v13 = CFSTR("LABEL_PLACE_DEVICE_TO_CONTINUE_IPAD");
        else
          v13 = CFSTR("LABEL_PLACE_DEVICE_TO_CONTINUE_IPHONE");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_100018A18, 0));
        v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = v16;
        if (v7)
        {
          if (v8)
            v18 = CFSTR("SUBTITLE_DESCRIPTION_PLACEMENT_WITH_NAME_IPAD");
          else
            v18 = CFSTR("SUBTITLE_DESCRIPTION_PLACEMENT_WITH_NAME_IPHONE");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_100018A18, 0));
          v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v7);
        }
        else
        {
          if (v8)
            v21 = CFSTR("SUBTITLE_DESCRIPTION_PLACEMENT_IPAD");
          else
            v21 = CFSTR("SUBTITLE_DESCRIPTION_PLACEMENT_IPHONE");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v21, &stru_100018A18, 0));
          v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v25);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(v20);

        objc_msgSend(v5, "setPrimaryText:", v15);
        objc_msgSend(v5, "setSecondaryText:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("tv.and.mediabox.fill")));
        objc_msgSend(v5, "setImage:", v23);

      }
      else
      {
        v24 = sub_100007074();
        v15 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10000BCDC();
      }

    }
  }

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  ContinuityCaptureShieldUIViewController *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  unsigned int v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    v5 = sub_100007074();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v8 = objc_msgSend(v7, "uiState");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v10 = objc_msgSend(v9, "connectionType");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientName"));
      v15 = 136316674;
      v16 = "-[ContinuityCaptureShieldUIViewController _updateUI]";
      v17 = 2112;
      v18 = self;
      v19 = 2080;
      v20 = "-[ContinuityCaptureShieldUIViewController _updateUI]";
      v21 = 1024;
      v22 = v8;
      v23 = 1024;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 1024;
      v28 = objc_msgSend(v4, "compositeState");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:  %@ %s uiState %d connectionType %d clientName %@ compositeState %x", (uint8_t *)&v15, 0x3Cu);

    }
    if (!self->_terminated)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v13 = objc_msgSend(v12, "uiState");

      if (v13 == (id)5)
      {
        -[ContinuityCaptureShieldUIViewController _updateUIForPlacementStep](self, "_updateUIForPlacementStep");
      }
      else
      {
        -[ContinuityCaptureShieldUIViewController _updateUIForConnectionType](self, "_updateUIForConnectionType");
        -[ContinuityCaptureShieldUIViewController _updateUIForClientInformation](self, "_updateUIForClientInformation");
        -[ContinuityCaptureShieldUIViewController _updateUIForUIState](self, "_updateUIForUIState");
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance](ContinuityCaptureShieldUIBackgroundActivityManager, "sharedInstance"));
      objc_msgSend(v14, "updateState:", objc_msgSend(v4, "compositeState"));

    }
  }

}

- (void)_pullConversation:(id)a3 deviceHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void **v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  ContinuityCaptureShieldUIViewController *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100004A28;
  v25[3] = &unk_1000185E8;
  v11 = v8;
  v26 = v11;
  v12 = v9;
  v27 = v12;
  objc_copyWeak(&v29, &location);
  v13 = v10;
  v28 = v13;
  v14 = objc_retainBlock(v25);
  if (-[ContinuityCaptureShieldUIViewController _isOnLockScreen](self, "_isOnLockScreen"))
  {
    v15 = sub_100007074();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[ContinuityCaptureShieldUIViewController _pullConversation:deviceHandle:completion:]";
      v33 = 2112;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: %@ pull conversation back to phone selected on lock screen. Removing shield from lock screen then pulling conversation", buf, 0x16u);
    }

    v17 = (void *)objc_opt_new(SBSLockScreenService);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100004B90;
    v23 = &unk_100018610;
    v24 = v14;
    objc_msgSend(v17, "lockDeviceAnimated:withCompletion:", 0, &v20);
    objc_msgSend(v17, "invalidate", v20, v21, v22, v23);

  }
  else
  {
    v18 = sub_100007074();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[ContinuityCaptureShieldUIViewController _pullConversation:deviceHandle:completion:]";
      v33 = 2112;
      v34 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: %@ pull conversation back to phone", buf, 0x16u);
    }

    ((void (*)(_QWORD *))v14[2])(v14);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)contentViewDidSelectPauseButton:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v4 = objc_msgSend(v3, "uiState");

  if (v4 == (id)1)
  {
    objc_msgSend(v6, "setPauseButtonState:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
    objc_msgSend(v5, "pauseSessionForEvent:", 0);
  }
  else
  {
    objc_msgSend(v6, "setPauseButtonState:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
    objc_msgSend(v5, "resumeStreamingForEvent:", 0);
  }

}

- (void)contentViewDidSelectDisconnectButton:(id)a3
{
  void *v4;
  unsigned int v5;

  self->_disconnectReason = 2;
  if (-[ContinuityCaptureShieldUIViewController _shouldShowHowToReconnectDialog](self, "_shouldShowHowToReconnectDialog", a3))
  {
    self->_pendingDisconnectDialogue = 1;
    -[ContinuityCaptureShieldUIViewController _showHowToReconnectDialog](self, "_showHowToReconnectDialog");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v5 = objc_msgSend(v4, "isDedicatedSession");

    if (v5)
    {
      self->_pendingDisconnectDialogue = 1;
      -[ContinuityCaptureShieldUIViewController _showDedicatedDisconnectDialog](self, "_showDedicatedDisconnectDialog");
    }
    else
    {
      -[ContinuityCaptureShieldUIViewController _disconnectSession](self, "_disconnectSession");
    }
  }
}

- (void)_disconnectFaceTimeIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  ContinuityCaptureShieldUIViewController *v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v4 = objc_msgSend(v3, "isInFaceTime");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeConversations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bs_firstObjectPassingTest:", &stru_100018650));

    v9 = sub_100007074();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
        v16 = 136315650;
        v17 = "-[ContinuityCaptureShieldUIViewController _disconnectFaceTimeIfNecessary]";
        v18 = 2112;
        v19 = self;
        v20 = 2112;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@ - Disconnect pressed, leaving conversation: %@", (uint8_t *)&v16, 0x20u);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "conversationManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
      objc_msgSend(v14, "leaveConversationWithUUID:", v15);

    }
    else
    {
      if (v11)
      {
        v16 = 136315394;
        v17 = "-[ContinuityCaptureShieldUIViewController _disconnectFaceTimeIfNecessary]";
        v18 = 2112;
        v19 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@ - Disconnect pressed, but not in active conversation. Disconnecting all calls", (uint8_t *)&v16, 0x16u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      objc_msgSend(v13, "disconnectAllCalls");
    }

  }
}

- (void)_disconnectSession
{
  id v3;
  NSObject *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  ContinuityCaptureShieldUIViewController *v12;
  __int16 v13;
  const char *v14;

  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[ContinuityCaptureShieldUIViewController _disconnectSession]";
    v11 = 2112;
    v12 = self;
    v13 = 2080;
    v14 = "-[ContinuityCaptureShieldUIViewController _disconnectSession]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:  %@ %s", buf, 0x20u);
  }

  -[ContinuityCaptureShieldUIViewController _disconnectFaceTimeIfNecessary](self, "_disconnectFaceTimeIfNecessary");
  self->_pendingDisconnectDialogue = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
  objc_msgSend(v5, "disconnectSession");

  objc_initWeak((id *)buf, self);
  v6 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005090;
  block[3] = &unk_100018678;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)contentViewDidSelectFaceTimeButton:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  _BYTE location[12];
  __int16 v24;
  ContinuityCaptureShieldUIViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeConversations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bs_firstObjectPassingTest:", &stru_100018698));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "neighborhoodActivityConduit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeSplitSessionTV"));

  if (v11 && v14)
  {
    objc_initWeak((id *)location, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000053F0;
    v18[3] = &unk_1000186C0;
    objc_copyWeak(&v22, (id *)location);
    v19 = v11;
    v20 = v14;
    v21 = v7;
    objc_msgSend(v15, "prepareForPullConversation:", v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v16 = sub_100007074();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[ContinuityCaptureShieldUIViewController contentViewDidSelectFaceTimeButton:completion:]";
      v24 = 2112;
      v25 = self;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: %@ facetime button tapped but deviceHandle=%@ and conversation=%@", location, 0x2Au);
    }

    v7[2](v7);
  }

}

- (void)contentViewDidSelectSkipButton:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  ContinuityCaptureShieldUIViewController *v10;

  v4 = sub_100007074();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ContinuityCaptureShieldUIViewController contentViewDidSelectSkipButton:]";
    v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:  %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCClientCCD sharedInstance](CMContinuityCaptureXPCClientCCD, "sharedInstance"));
  objc_msgSend(v6, "skipPlacementStep");

}

- (void)contentViewDidSelectFavoritesButton:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  ContinuityCaptureShieldUIViewController *v17;

  v4 = sub_100007074();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[ContinuityCaptureShieldUIViewController contentViewDidSelectFavoritesButton:]";
    v16 = 2112;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:  %@", buf, 0x16u);
  }

  v12[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v12[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("mobilephone-favorites://")));
  v9 = objc_msgSend(v7, "openSensitiveURL:withOptions:", v8, v6);

  if ((v9 & 1) == 0)
  {
    v10 = sub_100007074();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10000BE94();

  }
}

+ (BOOL)_refreshUIState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  _BOOL4 v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  if (!v4)
  {
    v13 = 0;
    goto LABEL_18;
  }
  v5 = objc_msgSend(v4, "compositeState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v7 = objc_msgSend(v6, "uiState");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placementStepSkipped"));
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v11 = v10;
    v12 = 5;
    goto LABEL_15;
  }
  if ((v5 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v11 = v10;
    v12 = 2;
    goto LABEL_15;
  }
  if ((v5 & 8) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v11 = v10;
    v12 = 0;
    goto LABEL_15;
  }
  if ((v5 & 0x10) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v11 = v10;
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v11 = v10;
  if (!v5)
  {
LABEL_14:
    v12 = 4;
    goto LABEL_15;
  }
  v12 = 1;
LABEL_15:
  objc_msgSend(v10, "setUiState:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v15 = objc_msgSend(v14, "uiState");
  v13 = v7 != v15;

  v16 = sub_100007074();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v7 != v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v21 = 136316162;
    v22 = "+[ContinuityCaptureShieldUIViewController _refreshUIState]";
    v23 = 2112;
    v24 = a1;
    v25 = 1024;
    v26 = (int)v7;
    v27 = 1024;
    v28 = objc_msgSend(v19, "uiState");
    v29 = 1024;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: %@ updated uiState (%d -> %d) refresh %d", (uint8_t *)&v21, 0x28u);

  }
LABEL_18:

  return v13;
}

+ (BOOL)_refreshConnectionType
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  _BOOL4 v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConfiguration"));

  if (v4)
  {
    v5 = objc_msgSend(v4, "compositeState");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v7 = objc_msgSend(v6, "connectionType");

    if ((v5 & 6) == 2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v9 = v8;
      v10 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v9 = v8;
      if ((v5 & 4) != 0)
        v10 = 2;
      else
        v10 = 0;
    }
    objc_msgSend(v8, "setConnectionType:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
    v13 = objc_msgSend(v12, "connectionType");
    v11 = v7 != v13;

    v14 = sub_100007074();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v7 != v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
      v19 = 136316162;
      v20 = "+[ContinuityCaptureShieldUIViewController _refreshConnectionType]";
      v21 = 2112;
      v22 = a1;
      v23 = 1024;
      v24 = (int)v7;
      v25 = 1024;
      v26 = objc_msgSend(v17, "connectionType");
      v27 = 1024;
      v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ updated connectionType (%d -> %d) refresh %d", (uint8_t *)&v19, 0x28u);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_isPad
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

- (void)tearDownShield
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005BD0;
  v2[3] = &unk_100018678;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_tearDownShield
{
  id v3;
  NSObject *v4;
  const char *v5;
  _BOOL4 pendingDisconnectDialogue;
  id v7;
  _BOOL4 v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  ContinuityCaptureShieldUIViewController *v29;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_terminated)
  {
    v3 = sub_100007074();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
      v28 = 2112;
      v29 = self;
      v5 = "%s: %@ termination in progress";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x16u);
    }
  }
  else
  {
    pendingDisconnectDialogue = self->_pendingDisconnectDialogue;
    v7 = sub_100007074();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (pendingDisconnectDialogue)
    {
      if (v8)
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
        v28 = 2112;
        v29 = self;
        v5 = "%s: %@ skip shield teardown since we have pending user dialogue for disconnect";
        goto LABEL_7;
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
        v28 = 2112;
        v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %@ Tearing down shieldUI", buf, 0x16u);
      }

      self->_terminated = 1;
      v9 = atomic_load((unsigned __int8 *)&self->_observingKVO);
      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
        objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, CFSTR("active"), 0);

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
        objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("activeConfiguration"), 0);

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUIStateTracker sharedInstance](CMContinuityCaptureUIStateTracker, "sharedInstance"));
        objc_msgSend(v12, "removeObserver:forKeyPath:context:", self, CFSTR("inFaceTime"), 0);

        atomic_store(0, (unsigned __int8 *)&self->_observingKVO);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance](ContinuityCaptureShieldUIBackgroundActivityManager, "sharedInstance"));
      objc_msgSend(v13, "updateState:", 16);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUIViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "windowScene"));
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_FBSScene"));

      v17 = objc_msgSend(objc_alloc((Class)UIDestroySceneAction), "initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:userOriginatedRequest:callbackQueue:completion:", 0, 1, 1, 0, &_dispatch_main_q, &stru_100018700);
      if (-[ContinuityCaptureShieldUIViewController _isOnLockScreen](self, "_isOnLockScreen"))
      {
        if (self->_disconnectReason != 1)
        {
          v18 = (void *)objc_opt_new(SBSLockScreenService);
          objc_msgSend(v18, "lockDeviceAnimated:withCompletion:", 1, 0);
          objc_msgSend(v18, "invalidate");

        }
        v19 = dispatch_time(0, 2000000000);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100006114;
        v23[3] = &unk_100018728;
        v24 = v4;
        v25 = v17;
        dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v23);

        v20 = v24;
      }
      else
      {
        v21 = sub_100007074();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
          v28 = 2112;
          v29 = (ContinuityCaptureShieldUIViewController *)v4;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: destroy scene: %@ in unlock mode", buf, 0x16u);
        }

        v20 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v17));
        -[NSObject sendActions:](v4, "sendActions:", v20);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRole, 0);
}

@end
