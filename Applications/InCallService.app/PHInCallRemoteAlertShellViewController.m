@implementation PHInCallRemoteAlertShellViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (PHInCallRemoteAlertShellViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHInCallRemoteAlertShellViewController *v6;
  PHInCallRemoteAlertShellViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHInCallRemoteAlertShellViewController;
  v6 = -[PHInCallRemoteAlertShellViewController init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](v7, "pipController"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "pipDidCancelNotification:", CFSTR("PHPIPControllerDidCancelNotification"), v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](v7, "pipController"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, "pipWillCancelNotification:", CFSTR("PHPIPControllerWillCancelNotification"), v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](v7, "pipController"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, "pipControllerDidRequestReturnToFullScreenNotification:", CFSTR("PHPIPControllerDidRequestReturnToFullScreenNotification"), v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](v7, "pipController"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, "pipControllerStateDidChange:", CFSTR("PHPIPControllerStateDidChangeNotification"), v15);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController dealloc](&v4, "dealloc");
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
  _QWORD *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  objc_super v29;
  uint8_t buf[4];
  id v31;

  v29.receiver = self;
  v29.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController viewDidLoad](&v29, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  objc_msgSend(v5, "setOpaque:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "setAllowsGroupBlending:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000BD308;
  v28[3] = &unk_100284898;
  v28[4] = self;
  v10 = objc_retainBlock(v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  if (objc_msgSend(v11, "pipState") == (id)2)
  {
    v12 = -[ICSCallDisplayStyleManager callDisplayStyle](self->_callDisplayStyleManager, "callDisplayStyle");

    if (v12 != 4)
    {
      v13 = sub_1000C5668();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1001AA48C(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_10:
      -[PHInCallRemoteAlertShellViewController setPipFinishedTransitionBlock:](self, "setPipFinishedTransitionBlock:", v10);
      goto LABEL_14;
    }
  }
  else
  {

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  v22 = objc_msgSend(v21, "pipState");

  v23 = sub_1000C5588();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22 == (id)3)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "loadView: Appeared without a root view controller, but the PIP was animating so we'll create a new after a delay", buf, 2u);
    }

    goto LABEL_10;
  }
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
    v27 = objc_msgSend(v26, "pipState");
    *(_DWORD *)buf = 134217984;
    v31 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "loadView: Appeared without a root view controller so we'll create a new one (%ld)", buf, 0xCu);

  }
  ((void (*)(_QWORD *))v10[2])(v10);
LABEL_14:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;

  v17.receiver = self;
  v17.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController viewWillAppear:](&v17, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  if (objc_msgSend(v4, "requestedVCPresentationWithStatusBar"))
  {

LABEL_8:
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = CFSTR("PHSuppressInCallStatusBarForFullscreenUIReason");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "requestedVCPresentationWithStatusBar, do not add status bar suppression %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v6 = objc_msgSend(v5, "callDisplayStyle");

  if (!v6)
    goto LABEL_8;
  v7 = (id)-[PHInCallRemoteAlertShellViewController hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason](self, "hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason");
  if ((v7 & 1) == 0)
  {
    v9 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = CFSTR("PHSuppressInCallStatusBarForFullscreenUIReason");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "add status bar suppression %@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v11, "startSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForFullscreenUIReason"));

    v7 = -[PHInCallRemoteAlertShellViewController setHasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason:](self, "setHasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason:", 1);
  }
LABEL_11:
  if (CPIsInternalDevice(v7, v8))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController hidEventMonitor](self, "hidEventMonitor"));

    if (!v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHHIDEventMonitor HIDEventMonitor](PHHIDEventMonitor, "HIDEventMonitor"));
      -[PHInCallRemoteAlertShellViewController setHidEventMonitor:](self, "setHidEventMonitor:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController hidEventMonitor](self, "hidEventMonitor"));
    objc_msgSend(v16, "start");

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  _BOOL4 v13;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "window: %@, shouldAppearOrDisappear: %d", buf, 0x12u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  _QWORD block[5];
  objc_super v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  void *v19;

  v15.receiver = self;
  v15.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[PHInCallRemoteAlertShellViewController isViewLoaded](self, "isViewLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    *(_DWORD *)buf = 67109378;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self.isViewLoaded: %d, self.view.window: %@", buf, 0x12u);

  }
  +[ICSAriadne trace:](ICSAriadne, "trace:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_rootSheetPresentationController"));
  objc_msgSend(v11, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v12 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD7C8;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  objc_msgSend(v13, "startAllowingRingingCallStatusIndicator");

}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;

  v14.receiver = self;
  v14.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController viewDidDisappear:](&v14, "viewDidDisappear:", a3);
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("PHSuppressInCallStatusBarForFullscreenUIReason");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remove status bar suppression %@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
  objc_msgSend(v6, "stopSuppressingInCallStatusBarForReason:", CFSTR("PHSuppressInCallStatusBarForFullscreenUIReason"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController hidEventMonitor](self, "hidEventMonitor"));
  objc_msgSend(v7, "stop");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audioOrVideoCallWithStatus:", 4));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v11 = objc_msgSend(v10, "callDisplayStyle");

    if (v11 != (id)3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));

      objc_msgSend(v13, "requestPresentationForCall:dialRequest:", v9, 0);
    }
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHInCallContainerControllerProtocol)containerController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController screenSharingContainerViewController](self, "screenSharingContainerViewController"));
  v6 = v5;

  return (PHInCallContainerControllerProtocol *)v6;
}

- (PHPIPController)pipController
{
  PHPIPController *pipController;
  void *v4;
  id v5;
  PHPIPController *v6;
  PHPIPController *v7;

  pipController = self->_pipController;
  if (!pipController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v5 = objc_msgSend(v4, "sceneType");

    if (v5)
      v6 = +[PHPIPController newScreenSharingPIPController](PHPIPController, "newScreenSharingPIPController");
    else
      v6 = (PHPIPController *)objc_claimAutoreleasedReturnValue(+[PHPIPController defaultPIPController](PHPIPController, "defaultPIPController"));
    v7 = self->_pipController;
    self->_pipController = v6;

    pipController = self->_pipController;
  }
  return pipController;
}

- (void)sceneSessionDidChange
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  objc_msgSend(v3, "sceneDidUpdate");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
  objc_msgSend(v4, "sceneDidConnect");

}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (void)_createRootViewController
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  ICSCallDisplayStyleManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  PHInCallRootViewController *v16;
  void *v17;
  PHInCallRootViewController *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  __objc2_class *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  ICSScreenSharingBroadcasterRootViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t v68[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallDisplayStyleManager rootViewController](self->_callDisplayStyleManager, "rootViewController"));

  if (v3)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not creating a new root view controller because one already exists", v68, 2u);
    }
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));

    if (!v7)
    {
      v8 = objc_alloc_init(ICSCallDisplayStyleManager);
      -[ICSCallDisplayStyleManager setCallDisplayStyle:](v8, "setCallDisplayStyle:", +[ICSCallDisplayStyleManager callDisplayStyleToRequestForCurrentState](ICSCallDisplayStyleManager, "callDisplayStyleToRequestForCurrentState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentInCallScene"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentIdentifier"));
      -[ICSCallDisplayStyleManager setSceneSessionIdentifier:](v8, "setSceneSessionIdentifier:", v13);

      -[PHInCallRemoteAlertShellViewController setCallDisplayStyleManager:](self, "setCallDisplayStyleManager:", v8);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v15 = objc_msgSend(v14, "sceneType");

    v6 = 0;
    switch((unint64_t)v15)
    {
      case 0uLL:
      case 5uLL:
        if (self->_inCallRootViewController)
          goto LABEL_16;
        v16 = [PHInCallRootViewController alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v18 = -[PHInCallRootViewController initWithCallDisplayStyleManager:](v16, "initWithCallDisplayStyleManager:", v17);
        -[PHInCallRemoteAlertShellViewController setInCallRootViewController:](self, "setInCallRootViewController:", v18);

        v19 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
        goto LABEL_18;
      case 1uLL:
        if (self->_screenSharingContainerViewController)
          goto LABEL_16;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "delegate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureFlags"));
        v23 = objc_msgSend(v22, "screenSharingDrawToHighlightEnabled");

        if (v23)
          v24 = ICSScreenSharingSpectatorRootViewController;
        else
          v24 = PHScreenSharingContainerViewController;
        v37 = [v24 alloc];
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
        v39 = objc_msgSend(v37, "initWithCallDisplayStyleManager:", v38);
        -[PHInCallRemoteAlertShellViewController setScreenSharingContainerViewController:](self, "setScreenSharingContainerViewController:", v39);

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController screenSharingContainerViewController](self, "screenSharingContainerViewController"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController screenSharingContainerViewController](self, "screenSharingContainerViewController"));
        objc_msgSend(v40, "setPipController:", v33);

        goto LABEL_26;
      case 2uLL:
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "featureFlags"));
        v28 = objc_msgSend(v27, "screenSharingDrawToHighlightEnabled");

        if (!v28)
          goto LABEL_16;
        v29 = objc_alloc_init(ICSScreenSharingBroadcasterRootViewController);
        -[PHInCallRemoteAlertShellViewController setScreenSharingBroadcasterViewController:](self, "setScreenSharingBroadcasterViewController:", v29);

        v19 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController screenSharingBroadcasterViewController](self, "screenSharingBroadcasterViewController"));
        goto LABEL_18;
      case 4uLL:
        if (self->_videoMessageRootViewController)
        {
LABEL_16:
          v6 = 0;
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "delegate"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "activationContext"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "videoMessageURL"));

          v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "delegate"));
          objc_msgSend(v35, "setActivationContext:", 0);

          if (v33)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController makeVideoMessageViewControllerWithURL:](self, "makeVideoMessageViewControllerWithURL:", v33));
            -[PHInCallRemoteAlertShellViewController setVideoMessageRootViewController:](self, "setVideoMessageRootViewController:", v36);

            v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController videoMessageRootViewController](self, "videoMessageRootViewController"));
          }
          else
          {
            v41 = sub_1000C5588();
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              sub_1001AA4BC(v42, v43, v44, v45, v46, v47, v48, v49);

            v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "delegate"));
            objc_msgSend(v51, "dismissVideoMessageSceneSession");

            v6 = 0;
          }
LABEL_26:

        }
        break;
      case 6uLL:
        v19 = objc_alloc_init((Class)UIViewController);
LABEL_18:
        v6 = v19;
        break;
      default:
        break;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    -[NSObject setRootViewController:](v5, "setRootViewController:", v6);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  objc_msgSend(v52, "bounds");
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v61, "setFrame:", v54, v56, v58, v60);

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v62, "setAutoresizingMask:", 18);

  objc_msgSend(v6, "willMoveToParentViewController:", self);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v63, "addSubview:", v64);

  -[PHInCallRemoteAlertShellViewController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "didMoveToParentViewController:", self);
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController containerController](self, "containerController"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "pipSourceProvider"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  objc_msgSend(v67, "setSourceProvider:", v66);

}

- (void)stopPIPAndStealViewController
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping PIP and restoring its view controller", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  v6 = objc_msgSend(v5, "isPreparedToAnimateToFullScreen");

  if (v6)
  {
    -[PHInCallRemoteAlertShellViewController _stealViewControllerFromPIP](self, "_stealViewControllerFromPIP");
  }
  else
  {
    objc_initWeak(buf, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BE318;
    v8[3] = &unk_100285F88;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v7, "manuallyStopPIPWithCompletion:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)_stealViewControllerFromPIP
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BE40C;
  v4[3] = &unk_100287580;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "stopPIPAndStealViewController:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handlePiPEndedAndShouldBePresentedFullScreen:(BOOL)a3 transitionIsComplete:(BOOL)a4 viewControllerToSteal:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PHInCallRemoteAlertShellViewController *v13;
  PHInCallRemoteAlertShellViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;

  v5 = a3;
  v7 = a5;
  if (!v7)
    goto LABEL_22;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
  if (v8)
  {

    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallRootViewControllerProtocol))
  {
LABEL_6:
    v9 = sub_1000C5668();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "View controller stolen from PIP is not an InCallRootViewController: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  -[PHInCallRemoteAlertShellViewController setInCallRootViewController:](self, "setInCallRootViewController:", v7);
LABEL_8:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController containerController](self, "containerController"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentViewControllerForRestoringPiP"));
  v12 = (void *)v11;
  if (v11)
    v13 = (PHInCallRemoteAlertShellViewController *)v11;
  else
    v13 = self;
  v14 = v13;

  objc_msgSend(v7, "willMoveToParentViewController:", v14);
  -[PHInCallRemoteAlertShellViewController addChildViewController:](v14, "addChildViewController:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](v14, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v15, "addSubview:", v16);

  objc_msgSend(v7, "didMoveToParentViewController:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController containerController](self, "containerController"));
  objc_msgSend(v17, "handlePIPViewControllerRestoredAfterPIPStopped:", v7);

  objc_msgSend(v7, "viewWillAppear:", 1);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "viewWillAppear:", 1);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v20);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v23, "setWhitePointAdaptivityStyle:", -[PHInCallRemoteAlertShellViewController preferredWhitePointAdaptivityStyle](self, "preferredWhitePointAdaptivityStyle"));

  -[PHInCallRemoteAlertShellViewController requestScreenTimeShieldIfNecessary](self, "requestScreenTimeShieldIfNecessary");
  -[PHInCallRemoteAlertShellViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PHInCallRemoteAlertShellViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  if (v5)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
    v25 = objc_msgSend(v24, "callDisplayStyle");

    if (v25 == (id)4)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000BE75C;
      v26[3] = &unk_100284898;
      v26[4] = self;
      TUDispatchMainIfNecessary(v26);
    }
  }

LABEL_22:
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController _willAppearInRemoteViewController:](&v13, "_willAppearInRemoteViewController:", v4);
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHInCallRemoteAlertShellViewController preferredWhitePointAdaptivityStyle](self, "preferredWhitePointAdaptivityStyle")));
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting WhitePointAdaptivityStyle to : %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "setWhitePointAdaptivityStyle:", -[PHInCallRemoteAlertShellViewController preferredWhitePointAdaptivityStyle](self, "preferredWhitePointAdaptivityStyle"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v9, "setAllowsControlCenter:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v11 = objc_opt_respondsToSelector(v10, "_willAppearInRemoteViewController:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v12, "_willAppearInRemoteViewController:", v4);

  }
}

- (void)requestScreenTimeShieldIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;

  v3 = objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pendingRestrictedScreenTimeRequest](self, "pendingRestrictedScreenTimeRequest"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController")), v5, v4, v5))
  {
    v6 = sub_1000C57B8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pendingRestrictedScreenTimeRequest](self, "pendingRestrictedScreenTimeRequest"));
      v14 = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will request screen time alert for request %@", (uint8_t *)&v14, 0xCu);

    }
    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHScreenTimeAlertAssertionReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pendingRestrictedScreenTimeRequest](self, "pendingRestrictedScreenTimeRequest"));
    objc_msgSend(v9, "forceUpdateCallControllerForFilteredRequest:", v10);

    -[PHInCallRemoteAlertShellViewController setPendingRestrictedScreenTimeRequest:](self, "setPendingRestrictedScreenTimeRequest:", 0);
  }
  else
  {
    v11 = sub_1000C57B8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pendingRestrictedScreenTimeRequest](self, "pendingRestrictedScreenTimeRequest"));
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not requesting screen time shield for filtered request: %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)noteActivatedForCustomReason:(id)a3 withUserInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  void *v17;
  unsigned int v18;
  __CFString **v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activated for reason: %@, userInfo: %@", (uint8_t *)&v23, 0x16u);
  }

  if (!objc_msgSend(v6, "isEqualToString:", SBUIRemoteAlertActivationReasonActivatingForUILock))
  {
    if (objc_msgSend(v6, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithClicks))
    {
      v15 = SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen;
    }
    else
    {
      v16 = objc_msgSend(v6, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithKappa);
      v15 = SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen;
      if ((v16 & 1) == 0
        && (objc_msgSend(v6, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen) & 1) == 0&& !objc_msgSend(v6, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithVolumeLockHold))
      {
        if (objc_msgSend(v6, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForScreenTime))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController requestFromAlertActivationContextUserInfo:](self, "requestFromAlertActivationContextUserInfo:", v7));
          -[PHInCallRemoteAlertShellViewController setPendingRestrictedScreenTimeRequest:](self, "setPendingRestrictedScreenTimeRequest:", v22);

          -[PHInCallRemoteAlertShellViewController requestScreenTimeShieldIfNecessary](self, "requestScreenTimeShieldIfNecessary");
        }
        goto LABEL_17;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v17, "disconnectAllCalls");

    v18 = objc_msgSend(v6, "isEqualToString:", v15);
    v19 = off_100287118;
    if (!v18)
      v19 = off_1002870D0;
    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", *v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v20, "setCurrentAlertButtonAction:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v21, "forceUpdateCallControllerForSOS");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v14, "dismissScreenTimeAlertHostIfNeeded");
    goto LABEL_16;
  }
  v10 = sub_1000C5588();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notified that we were activated for ending all calls and locking", (uint8_t *)&v23, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v13 = objc_opt_respondsToSelector(v12, "handleActivationForEndAndLock");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v14, "handleActivationForEndAndLock");
LABEL_16:

  }
LABEL_17:

}

- (id)requestFromAlertActivationContextUserInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", SOSRemoteAlertActivationContextUserInfoRequestURLStringKey));
  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc((Class)TUDialRequest), "initWithURL:", v6);
      if (!v7)
      {
        v8 = objc_msgSend(objc_alloc((Class)TUJoinConversationRequest), "initWithURL:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "conversationManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "remoteMembers"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationLink"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeConversationWithRemoteMembers:andLink:", v11, v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeRemoteParticipants"));
        if (objc_msgSend(v14, "count"))
          v15 = v13;
        else
          v15 = v8;
        v7 = v15;

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)noteActivatedForActivityContinuationWithIdentifier:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;

  v3 = a3;
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activated for activity continuation with identifier: %@", buf, 0xCu);
  }

  +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHDismissalReasonWaitingForHandoff"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BF084;
  v7[3] = &unk_1002875A8;
  v8 = v3;
  v6 = v3;
  +[NSUserActivity _fetchUserActivityWithUUID:completionHandler:](NSUserActivity, "_fetchUserActivityWithUUID:completionHandler:", v6, v7);

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleDeviceLockEventWithSourceType:(int64_t)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v8 = objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol);

  if (v8)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v10, "handleDeviceLockEventWithSourceType:resultHandler:", a3, v6);

  }
  else
  {
    v9 = sub_1000C56D8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHInCallRemoteAlertShellViewController does not have a child VC that can handle button events", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);

  }
}

- (void)handleLockButtonPressed
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v4 = objc_opt_respondsToSelector(v3, "handleLockButtonPressed");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v5, "handleLockButtonPressed");

  }
}

- (void)handleVolumeUpButtonPressed
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol);

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v5, "handleVolumeUpButtonPressed");

  }
}

- (void)handleVolumeDownButtonPressed
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol);

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v5, "handleVolumeDownButtonPressed");

  }
}

- (void)handleHeadsetButtonPressed
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol);

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v5, "handleHeadsetButtonPressed");

  }
}

- (void)handleHeadsetButtonLongPressed
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol);

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v5, "handleHeadsetButtonLongPressed");

  }
}

- (void)handleDoubleHeightStatusBarTap
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
  v4 = objc_opt_respondsToSelector(v3, "handleDoubleHeightStatusBarTap");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _childViewController](self, "_childViewController"));
    objc_msgSend(v5, "handleDoubleHeightStatusBarTap");

  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[PHInCallRemoteAlertShellViewController preferredWhitePointAdaptivityStyle](self, "preferredWhitePointAdaptivityStyle")));
    *(_DWORD *)buf = 138412290;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting WhitePointAdaptivityStyle to : %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setWhitePointAdaptivityStyle:", -[PHInCallRemoteAlertShellViewController preferredWhitePointAdaptivityStyle](self, "preferredWhitePointAdaptivityStyle"));

  v12.receiver = self;
  v12.super_class = (Class)PHInCallRemoteAlertShellViewController;
  -[PHInCallRemoteAlertShellViewController configureWithContext:completion:](&v12, "configureWithContext:completion:", v7, v6);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "context: %@", (uint8_t *)&v16, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
  -[PHInCallRemoteAlertShellViewController handleButtonActions:](self, "handleButtonActions:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  -[PHInCallRemoteAlertShellViewController noteActivatedForCustomReason:withUserInfo:](self, "noteActivatedForCustomReason:withUserInfo:", v11, v12);

  if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v13, "prepareForDeviceLock");

  }
  if (v7)
  {
    v14 = sub_1000C5588();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Calling completion block", (uint8_t *)&v16, 2u);
    }

    v7[2](v7);
  }

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  __int128 v8;
  id v9;
  _UNKNOWN **v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  __int128 v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  _QWORD v48[3];
  _BYTE v49[128];

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "buttonActions: %@", buf, 0xCu);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v7)
  {
    v9 = v7;
    v10 = CNKTranscriptionViewComposerFactory_ptr;
    v11 = *(_QWORD *)v44;
    *(_QWORD *)&v8 = 67109378;
    v41 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v14 = sub_1000C5588();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48[0] = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handling current SBUIRemoteAlertButtonAction: %@", buf, 0xCu);
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
        objc_msgSend(v16, "setCurrentAlertButtonAction:", v13);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[176], "sharedInstance"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "incomingCall"));
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[176], "sharedInstance"));
          v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "incomingVideoCall"));

        }
        v22 = +[PHSOSViewController isSOSDismissalAssertionActive](PHSOSViewController, "isSOSDismissalAssertionActive");
        if ((v22 & 1) != 0 || v20 && (objc_msgSend(v20, "shouldSuppressRingtone") & 1) == 0)
        {
          v23 = sub_1000C5588();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v41;
            LODWORD(v48[0]) = v22;
            WORD2(v48[0]) = 2112;
            *(_QWORD *)((char *)v48 + 6) = v20;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "dismissalAssertions contains PHSOSCallAssertionReason: %d; incomingCall = %@\n"
              "Sending response that we have handled all events",
              buf,
              0x12u);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
          objc_msgSend(v25, "setCurrentAlertButtonAction:", 0);

        }
        v26 = objc_msgSend(v13, "events", v41);
        v27 = sub_1000C5588();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48[0] = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[alertAction events]: %ld", buf, 0xCu);
        }

        if ((v26 & 1) != 0)
        {
          v29 = sub_1000C5588();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventLockButton", buf, 2u);
          }

          -[PHInCallRemoteAlertShellViewController handleLockButtonPressed](self, "handleLockButtonPressed");
          if ((v26 & 2) == 0)
          {
LABEL_23:
            if ((v26 & 4) == 0)
              goto LABEL_24;
            goto LABEL_34;
          }
        }
        else if ((v26 & 2) == 0)
        {
          goto LABEL_23;
        }
        v31 = sub_1000C5588();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventVolumeUpButton", buf, 2u);
        }

        -[PHInCallRemoteAlertShellViewController handleVolumeUpButtonPressed](self, "handleVolumeUpButtonPressed");
        if ((v26 & 4) == 0)
        {
LABEL_24:
          if ((v26 & 8) == 0)
            goto LABEL_25;
          goto LABEL_37;
        }
LABEL_34:
        v33 = sub_1000C5588();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventVolumeDownButton", buf, 2u);
        }

        -[PHInCallRemoteAlertShellViewController handleVolumeDownButtonPressed](self, "handleVolumeDownButtonPressed");
        if ((v26 & 8) == 0)
        {
LABEL_25:
          if ((v26 & 0x20) == 0)
            goto LABEL_26;
          goto LABEL_40;
        }
LABEL_37:
        v35 = sub_1000C5588();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventHeadsetButton", buf, 2u);
        }

        -[PHInCallRemoteAlertShellViewController handleHeadsetButtonPressed](self, "handleHeadsetButtonPressed");
        if ((v26 & 0x20) == 0)
        {
LABEL_26:
          if ((v26 & 0x10) == 0)
            goto LABEL_46;
LABEL_43:
          v39 = sub_1000C5588();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventHomeButton", buf, 2u);
          }

          -[PHInCallRemoteAlertShellViewController handleHomeButtonPressed](self, "handleHomeButtonPressed");
          goto LABEL_46;
        }
LABEL_40:
        v37 = sub_1000C5588();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventHeadsetButtonLongPress", buf, 2u);
        }

        -[PHInCallRemoteAlertShellViewController handleHeadsetButtonLongPressed](self, "handleHeadsetButtonLongPressed");
        if ((v26 & 0x10) != 0)
          goto LABEL_43;
LABEL_46:

        v10 = CNKTranscriptionViewComposerFactory_ptr;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v9);
  }

}

- (id)_childViewController
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController childViewControllers](self, "childViewControllers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (v4 != (id)1)
      NSLog(CFSTR("InCall view controller shell expects to only have one child view controller, but it has found more than one..."));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController childViewControllers](self, "childViewControllers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController childViewControllers](self, "childViewControllers"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  if ((objc_opt_respondsToSelector(v7, "willAnimateRotationToInterfaceOrientation:duration:") & 1) != 0)
    objc_msgSend(v7, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController childViewControllers](self, "childViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  if ((objc_opt_respondsToSelector(v5, "shouldAutorotateToInterfaceOrientation:") & 1) != 0)
    v6 = objc_msgSend(v5, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTimeAudio](PHUIConfiguration, "canAutoRotateInCallUIForFaceTimeAudio")&& +[PHUIConfiguration canAutoRotateInCallUIForFaceTime](PHUIConfiguration, "canAutoRotateInCallUIForFaceTime"))
  {
    return 30;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v5 = objc_msgSend(v4, "sceneType");

  if (v5 != (id)1)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "featureFlags"));
  v9 = objc_msgSend(v8, "screenSharingDrawToHighlightEnabled");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController childViewControllers](self, "childViewControllers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

    v12 = objc_msgSend(v11, "supportedInterfaceOrientations");
    return (unint64_t)v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureFlags"));
  v16 = objc_msgSend(v15, "supportsScreenSharing");

  if ((v16 & 1) != 0)
    return 26;
LABEL_9:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController callDisplayStyleManager](self, "callDisplayStyleManager"));
  v18 = objc_msgSend(v17, "callDisplayStyle");

  if (v18 == (id)3)
    return 24;
  else
    return 2;
}

- (void)pipWillCancelNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = sub_1000C5668();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PiP will cancel: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipFinishedCancellationBlock](self, "pipFinishedCancellationBlock"));

  if (v8)
  {
    v9 = sub_1000C5668();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001AA5BC(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000C03B8;
    v17[3] = &unk_100285F88;
    objc_copyWeak(&v18, (id *)buf);
    -[PHInCallRemoteAlertShellViewController setPipFinishedCancellationBlock:](self, "setPipFinishedCancellationBlock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

}

- (void)pipDidCancelNotification:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  NSObject *v11;
  void (**v12)(void);
  int v13;
  void *v14;

  v4 = sub_1000C5668();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PiP did cancel: %@", (uint8_t *)&v13, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  if (objc_msgSend(v7, "pipState"))
  {

    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipFinishedTransitionBlock](self, "pipFinishedTransitionBlock"));

  if (!v10)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipFinishedCancellationBlock](self, "pipFinishedCancellationBlock"));

    if (v8)
    {
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipFinishedCancellationBlock](self, "pipFinishedCancellationBlock"));
      v9[2]();

      -[PHInCallRemoteAlertShellViewController setPipFinishedCancellationBlock:](self, "setPipFinishedCancellationBlock:", 0);
    }
    return;
  }
  v11 = sub_1000C5668();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PIP state did change and we have a pending transition block - we'll run that block now", (uint8_t *)&v13, 2u);
  }
  v12 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipFinishedTransitionBlock](self, "pipFinishedTransitionBlock"));
  v12[2]();

  -[PHInCallRemoteAlertShellViewController setPipFinishedTransitionBlock:](self, "setPipFinishedTransitionBlock:", 0);
}

- (void)pipControllerDidRequestReturnToFullScreenNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  PHInCallRemoteAlertShellViewController *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = sub_1000C5668();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is handling notification %@", (uint8_t *)&v18, 0x16u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowForTransitionAnimation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    -[PHInCallRemoteAlertShellViewController stopPIPAndStealViewController](self, "stopPIPAndStealViewController");
  }
  else
  {
    v11 = sub_1000C5668();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1001AA5EC((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)pipControllerStateDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController", a3));
  v5 = objc_msgSend(v4, "pipState");

  if (v5 == (id)2)
  {
    -[PHInCallRemoteAlertShellViewController showPIPPlaceholderView](self, "showPIPPlaceholderView");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipController](self, "pipController"));
    v7 = objc_msgSend(v6, "pipState");

    if (v7 == (id)3)
      -[PHInCallRemoteAlertShellViewController removePIPPlaceholderView](self, "removePIPPlaceholderView");
  }
}

- (void)showPIPPlaceholderView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v3 = objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview")),
        v6,
        v5,
        v4,
        !v6))
  {
    v7 = sub_1000C5668();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up PIP placeholder view to show in app switcher while calls is PIPped", v16, 2u);
    }
    v8 = objc_alloc_init((Class)AVPictureInPictureIndicatorView);
    -[PHInCallRemoteAlertShellViewController setPipPlaceholderView:](self, "setPipPlaceholderView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PIP_PLACEHOLDER_MESSAGE"), &stru_10028DC20, CFSTR("InCallService")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
    objc_msgSend(v11, "setCustomMessage:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
    objc_msgSend(v13, "setBackgroundColor:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
    objc_msgSend(v14, "addSubview:", v15);

    -[PHInCallRemoteAlertShellViewController constrainPIPPlaceholderFullScreen](self, "constrainPIPPlaceholderFullScreen");
  }
}

- (void)constrainPIPPlaceholderFullScreen
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v25[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v25[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)removePIPPlaceholderView
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = sub_1000C5668();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing PIP placeholder view", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController pipPlaceholderView](self, "pipPlaceholderView"));
  objc_msgSend(v4, "removeFromSuperview");

  -[PHInCallRemoteAlertShellViewController setPipPlaceholderView:](self, "setPipPlaceholderView:", 0);
}

- (void)showKeypadIfPossible
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
    objc_msgSend(v4, "showKeypadIfPossible");

  }
}

- (BOOL)isShowingHUD
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
  v3 = objc_msgSend(v2, "isShowingHUD");

  return v3;
}

- (BOOL)isMicIndicatorVisible
{
  void *v4;
  unsigned __int8 v5;

  if (-[PHInCallRemoteAlertShellViewController isShowingHUD](self, "isShowingHUD"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallRemoteAlertShellViewController inCallRootViewController](self, "inCallRootViewController"));
  v5 = objc_msgSend(v4, "isShowing6UP");

  return v5;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (void)setCallDisplayStyleManager:(id)a3
{
  objc_storeStrong((id *)&self->_callDisplayStyleManager, a3);
}

- (void)setPipController:(id)a3
{
  objc_storeStrong((id *)&self->_pipController, a3);
}

- (PHHIDEventMonitor)hidEventMonitor
{
  return self->_hidEventMonitor;
}

- (void)setHidEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_hidEventMonitor, a3);
}

- (PHInCallRootViewController)inCallRootViewController
{
  return self->_inCallRootViewController;
}

- (void)setInCallRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inCallRootViewController, a3);
}

- (ICSScreenSharingContainerViewControllerProtocol)screenSharingContainerViewController
{
  return self->_screenSharingContainerViewController;
}

- (void)setScreenSharingContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screenSharingContainerViewController, a3);
}

- (UIViewController)screenSharingBroadcasterViewController
{
  return self->_screenSharingBroadcasterViewController;
}

- (void)setScreenSharingBroadcasterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screenSharingBroadcasterViewController, a3);
}

- (ICSVideoMessageRootViewController)videoMessageRootViewController
{
  return self->_videoMessageRootViewController;
}

- (void)setVideoMessageRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_videoMessageRootViewController, a3);
}

- (id)pipFinishedTransitionBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPipFinishedTransitionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)pipFinishedCancellationBlock
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setPipFinishedCancellationBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (TUFilteredRequest)pendingRestrictedScreenTimeRequest
{
  return self->_pendingRestrictedScreenTimeRequest;
}

- (void)setPendingRestrictedScreenTimeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestrictedScreenTimeRequest, a3);
}

- (AVPictureInPictureIndicatorView)pipPlaceholderView
{
  return self->_pipPlaceholderView;
}

- (void)setPipPlaceholderView:(id)a3
{
  objc_storeStrong((id *)&self->_pipPlaceholderView, a3);
}

- (BOOL)hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason
{
  return self->_hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason;
}

- (void)setHasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason:(BOOL)a3
{
  self->_hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipPlaceholderView, 0);
  objc_storeStrong((id *)&self->_pendingRestrictedScreenTimeRequest, 0);
  objc_storeStrong(&self->_pipFinishedCancellationBlock, 0);
  objc_storeStrong(&self->_pipFinishedTransitionBlock, 0);
  objc_storeStrong((id *)&self->_videoMessageRootViewController, 0);
  objc_storeStrong((id *)&self->_screenSharingBroadcasterViewController, 0);
  objc_storeStrong((id *)&self->_screenSharingContainerViewController, 0);
  objc_storeStrong((id *)&self->_inCallRootViewController, 0);
  objc_storeStrong((id *)&self->_hidEventMonitor, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
}

- (id)makeVideoMessageViewControllerWithURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  PHInCallRemoteAlertShellViewController *v10;
  id v11;
  uint64_t v13;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  v11 = sub_100149EEC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v11;
}

@end
