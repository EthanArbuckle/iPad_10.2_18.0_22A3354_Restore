@implementation PHCarPlayMainInCallViewController

- (PHCarPlayMainInCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHCarPlayMainInCallViewController *v4;
  PHCarPlayMainInCallViewController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  PHCarPlayMainInCallViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _TtC13InCallService16AlertCoordinator *v19;
  _TtP13InCallService24AlertCoordinatorProtocol_ *alertCoordinator;
  _TtC13InCallService16AlertCoordinator *v21;
  NFMPlayCommands *v22;
  NFMPlayCommands *nfmPlayCommands;
  _QWORD block[4];
  PHCarPlayMainInCallViewController *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PHCarPlayMainInCallViewController;
  v4 = -[PHCarPlayMainInCallViewController initWithNibName:bundle:](&v27, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PHCarPlayMainInCallViewController setCurrentMode:](v4, "setCurrentMode:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    -[PHCarPlayMainInCallViewController setCallCenter:](v5, "setCallCenter:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](v5, "callCenter"));
    -[PHCarPlayMainInCallViewController setCallContainer:](v5, "setCallContainer:", v7);

    v8 = objc_alloc_init((Class)CARSessionStatus);
    -[PHCarPlayMainInCallViewController setCarSessionStatus:](v5, "setCarSessionStatus:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController carSessionStatus](v5, "carSessionStatus"));
    objc_msgSend(v9, "setSessionObserver:", v5);

    v10 = dispatch_queue_create("com.apple.calls.incallservice.carplay", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FF968;
    block[3] = &unk_100284898;
    v11 = v5;
    v26 = v11;
    dispatch_async(v10, block);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, "muteStateChangedNotification:", TUCallIsUplinkMutedChangedNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, "hardPauseDigitsStateChangedNotification:", TUCallHardPauseDigitsStateChangedNotification, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, "callStateChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v11, "callStateChangedNotification:", TUCallCenterVideoCallStatusChangedNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, "callModelChangedNotification:", TUCallModelChangedNotification, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v11, "limitedUIChangedNotification:", CARSessionLimitUserInterfacesChangedNotification, 0);

    -[PHCarPlayMainInCallViewController setCanSendTextMessagesBlock:](v11, "setCanSendTextMessagesBlock:", &stru_100287FC0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSDisconnectionConfirmation sharedInstance](PHSOSDisconnectionConfirmation, "sharedInstance"));
    objc_msgSend(v18, "addDelegate:", v11);

    v11->_shouldPresentAlertButton = 0;
    v19 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
    -[AlertCoordinator setDelegate:](v19, "setDelegate:", v11);
    alertCoordinator = v11->_alertCoordinator;
    v11->_alertCoordinator = (_TtP13InCallService24AlertCoordinatorProtocol_ *)v19;
    v21 = v19;

    v22 = (NFMPlayCommands *)objc_alloc_init((Class)NFMPlayCommands);
    nfmPlayCommands = v11->_nfmPlayCommands;
    v11->_nfmPlayCommands = v22;

  }
  return v5;
}

- (void)loadView
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PHCarPlayPhoneCallGalleryView *v9;
  PHCarPlayPhoneCallGalleryView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PHCarPlayInCallButtonsView *v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  PHCarPlayInCallHardPauseButton *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  uint8_t buf[16];
  _QWORD v98[12];
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MPCarPlayInCallViewController loadView", buf, 2u);
  }

  if ((-[PHCarPlayMainInCallViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    v96 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[PHCarPlayMainInCallViewController setView:](self, "setView:", v96);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = objc_alloc_init((Class)UIView);
    -[PHCarPlayMainInCallViewController setFlippyView:](self, "setFlippyView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = [PHCarPlayPhoneCallGalleryView alloc];
    objc_msgSend(v96, "bounds");
    v10 = -[PHCarPlayPhoneCallGalleryView initWithFrame:](v9, "initWithFrame:");
    -[PHCarPlayMainInCallViewController setGalleryView:](self, "setGalleryView:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    objc_msgSend(v12, "setDelegate:", self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    objc_msgSend(v13, "addSubview:", v14);

    v15 = objc_alloc_init(PHCarPlayInCallButtonsView);
    -[PHCarPlayMainInCallViewController setButtonsView:](self, "setButtonsView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    objc_msgSend(v17, "addSubview:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    objc_msgSend(v19, "setDelegate:", self);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    objc_msgSend(v20, "addSubview:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v101 = CFSTR("view");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    v102 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[view]|"), 0, 0, v24));
    objc_msgSend(v22, "addConstraints:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v99 = CFSTR("view");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    v100 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v28));
    objc_msgSend(v26, "addConstraints:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));
    LODWORD(v33) = 1148846080;
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v30, 4, 0, v32, 4, 1.0, 0.0, v33));

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    LODWORD(v35) = 1148846080;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v34, 8, 0, 0, 0, 1.0, 87.0, v35));

    v36 = objc_alloc_init(PHCarPlayInCallHardPauseButton);
    -[PHCarPlayMainInCallViewController setHardPauseButton:](self, "setHardPauseButton:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    objc_msgSend(v37, "setDelegate:", self);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    objc_msgSend(v38, "addSubview:", v39);

    v98[0] = v95;
    v98[1] = v94;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "safeAreaLayoutGuide"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "leftAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leftAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
    v98[2] = v88;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "safeAreaLayoutGuide"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "rightAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "rightAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:", v83));
    v98[3] = v82;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "topAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "safeAreaLayoutGuide"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, 12.0));
    v98[4] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bottomAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, -12.0));
    v98[5] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "safeAreaLayoutGuide"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "leadingAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v66, 12.0));
    v98[6] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController flippyView](self, "flippyView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "trailingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "safeAreaLayoutGuide"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v60, -12.0));
    v98[7] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "safeAreaLayoutGuide"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v54, 12.0));
    v98[8] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "heightAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToConstant:", 28.0));
    v98[9] = v50;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "rightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "safeAreaLayoutGuide"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "rightAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v44, -12.0));
    v98[10] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "widthAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 107.0));
    v98[11] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v49);

  }
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  PHCarPlayMainInCallViewController *v9;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MPCarPlay IN CALL VIEW CONTROLLER DEALLOC %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHSOSDisconnectionConfirmation sharedInstance](PHSOSDisconnectionConfirmation, "sharedInstance"));
  objc_msgSend(v5, "removeDelegate:", self);

  -[PHCarPlayPhoneCallGalleryView setDelegate:](self->_galleryView, "setDelegate:", 0);
  -[PHCarPlayInCallButtonsView setDelegate:](self->_buttonsView, "setDelegate:", 0);
  -[PHCarPlayInCallHardPauseButton setDelegate:](self->_hardPauseButton, "setDelegate:", 0);
  -[NSTimer invalidate](self->_viewUpdateClockTickTimer, "invalidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayMainInCallViewController;
  -[PHCarPlayMainInCallViewController dealloc](&v7, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayMainInCallViewController;
  -[PHCarPlayMainInCallViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController alertCoordinator](self, "alertCoordinator"));
  objc_msgSend(v3, "startMonitoring");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayMainInCallViewController;
  -[PHCarPlayMainInCallViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController viewUpdateClockTickTimer](self, "viewUpdateClockTickTimer"));
  objc_msgSend(v4, "invalidate");

  -[PHCarPlayMainInCallViewController setViewUpdateClockTickTimer:](self, "setViewUpdateClockTickTimer:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "viewUpdateClockTickTimerFired:", 0, 1, 1.0));
  -[PHCarPlayMainInCallViewController setViewUpdateClockTickTimer:](self, "setViewUpdateClockTickTimer:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayMainInCallViewController;
  -[PHCarPlayMainInCallViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController presentedViewController](self, "presentedViewController"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayMainInCallViewController;
  -[PHCarPlayMainInCallViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController viewUpdateClockTickTimer](self, "viewUpdateClockTickTimer"));
  objc_msgSend(v4, "invalidate");

  -[PHCarPlayMainInCallViewController setViewUpdateClockTickTimer:](self, "setViewUpdateClockTickTimer:", 0);
}

- (void)setPrimaryCalls:(id)a3 conferencePhoneCalls:(id)a4 incomingCall:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *j;
  uint64_t v58;
  void *v59;
  unsigned __int8 v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *k;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *m;
  uint64_t v72;
  void *v73;
  unsigned __int8 v74;
  PHCarPlayMainInCallViewController *v75;
  id v76;
  NSObject *v77;
  void *v78;
  id v79;
  void *v80;
  unsigned int v81;
  id v82;
  NSObject *v83;
  void *v84;
  id v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  unsigned __int8 v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  BOOL v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  NSObject *v110;
  id v111;
  NSObject *v112;
  void *v113;
  id v114;
  NSObject *v115;
  void *v116;
  id v117;
  NSObject *v118;
  void *v119;
  id v120;
  id v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v129;
  _QWORD v130[5];
  _QWORD v131[5];
  _QWORD v132[5];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t v145;
  char v146[15];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint8_t v155[128];
  uint8_t buf[4];
  id v157;
  __int16 v158;
  unint64_t v159;
  __int16 v160;
  id v161;

  v7 = a3;
  v129 = (unint64_t)a4;
  v8 = a5;
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v157 = v7;
    v158 = 2112;
    v159 = v129;
    v160 = 2112;
    v161 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "-- CarPlay: Set primary phone calls: %@. \nConference phone calls: %@. \nIncoming phone call: %@", buf, 0x20u);
  }
  v126 = (unint64_t)v8;

  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    *(_DWORD *)buf = 138412802;
    v157 = v13;
    v158 = 2112;
    v159 = (unint64_t)v14;
    v160 = 2112;
    v161 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "-- CarPlay: Existing primary phone calls: %@. \nConference phone calls: %@. \nIncoming phone call: %@", buf, 0x20u);

  }
  if ((-[PHCarPlayMainInCallViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    -[PHCarPlayMainInCallViewController loadView](self, "loadView");
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v147, v155, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v148;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v148 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v21, "originatingUIType") == 10)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "routeController"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pickedRoute"));
          v25 = objc_msgSend(v24, "isSpeaker");

          if ((v25 & 1) == 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "routeController"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "routeForSpeakerEnable"));

            if (!v32)
            {
              v44 = sub_1000C5588();
              v36 = objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                sub_1001AAC64(&v145, v146, v36);
              goto LABEL_27;
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "routeController"));
            objc_msgSend(v42, "pickRoute:", v32);

            v43 = sub_1000C5588();
            v36 = objc_claimAutoreleasedReturnValue(v43);
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
LABEL_27:

              continue;
            }
            *(_WORD *)buf = 0;
            v37 = v36;
            v38 = "-- CarPlay: Routing audio back to speaker";
LABEL_26:
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
            goto LABEL_27;
          }
        }
        if (objc_msgSend(v21, "originatingUIType") == 12)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "routeController"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pickedRoute"));
          v29 = objc_msgSend(v28, "isReceiver");

          if ((v29 & 1) == 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "routeController"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "routeForSpeakerDisable"));

            if (v32)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "routeController"));
              objc_msgSend(v34, "pickRoute:", v32);

              v35 = sub_1000C5588();
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v37 = v36;
                v38 = "-- CarPlay: Routing audio back to receiver";
                goto LABEL_26;
              }
              goto LABEL_27;
            }
            v45 = sub_1000C5588();
            v36 = objc_claimAutoreleasedReturnValue(v45);
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              goto LABEL_27;
            *(_WORD *)buf = 0;
            v37 = v36;
            v38 = "[WARN] -- CarPlay: Could not find available route to pick for speaker disable";
            goto LABEL_26;
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v147, v155, 16);
    }
    while (v18);
  }

  v46 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController __sanitizedPrimaryPhoneCallOrdering:](self, "__sanitizedPrimaryPhoneCallOrdering:", v16));
  v47 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
  v48 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
  v49 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
  v50 = (void *)v126;
  if ((objc_msgSend((id)v47, "isEqualToArray:", v46) & 1) == 0 && v46 | v47
    || (objc_msgSend((id)v48, "isEqualToArray:", v129) & 1) == 0 && v129 | v48
    || v49 != v126 && v126 | v49)
  {
    v127 = v49;
    v124 = v48;
    v125 = (void *)v47;
    v51 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v123 = v46;
    v53 = (id)v46;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v142;
      do
      {
        for (j = 0; j != v55; j = (char *)j + 1)
        {
          if (*(_QWORD *)v142 != v56)
            objc_enumerationMutation(v53);
          v58 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)j);
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls", v123));
          v60 = objc_msgSend(v59, "containsObject:", v58);

          if ((v60 & 1) == 0)
            -[NSObject addObject:](v51, "addObject:", v58);
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v141, v154, 16);
      }
      while (v55);
    }

    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v138;
      do
      {
        for (k = 0; k != v63; k = (char *)k + 1)
        {
          if (*(_QWORD *)v138 != v64)
            objc_enumerationMutation(v61);
          v66 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)k);
          if ((objc_msgSend(v53, "containsObject:", v66, v123) & 1) == 0)
            objc_msgSend(v52, "addObject:", v66);
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v137, v153, 16);
      }
      while (v63);
    }

    v135 = 0u;
    v136 = 0u;
    v134 = 0u;
    v133 = 0u;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v134;
      do
      {
        for (m = 0; m != v69; m = (char *)m + 1)
        {
          if (*(_QWORD *)v134 != v70)
            objc_enumerationMutation(v67);
          v72 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)m);
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v129, "arrayByAddingObjectsFromArray:", v53, v123));
          v74 = objc_msgSend(v73, "containsObject:", v72);

          if ((v74 & 1) == 0 && (objc_msgSend(v52, "containsObject:", v72) & 1) == 0)
            objc_msgSend(v52, "addObject:", v72);
        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v133, v152, 16);
      }
      while (v69);
    }

    v75 = self;
    -[PHCarPlayMainInCallViewController setPrimaryCalls:](self, "setPrimaryCalls:", v53);
    -[PHCarPlayMainInCallViewController setConferenceParticipants:](self, "setConferenceParticipants:", v129);
    v50 = (void *)v126;
    -[PHCarPlayMainInCallViewController setIncomingCall:](self, "setIncomingCall:", v126);
    if (-[PHCarPlayMainInCallViewController currentCallStateWarrantsCallWaitingMode](self, "currentCallStateWarrantsCallWaitingMode")&& !-[PHCarPlayMainInCallViewController currentMode](self, "currentMode"))
    {
      v85 = sub_1000C5588();
      v86 = objc_claimAutoreleasedReturnValue(v85);
      v47 = (uint64_t)v125;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "- call waiting - snapping to call waiting mode", buf, 2u);
      }

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "superview"));
      v132[0] = _NSConcreteStackBlock;
      v132[1] = 3221225472;
      v132[2] = sub_10010176C;
      v132[3] = &unk_100284898;
      v132[4] = self;
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_100101814;
      v131[3] = &unk_1002848C0;
      v131[4] = self;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v88, 1048704, v132, v131, 0.5);

      v75 = self;
    }
    else
    {
      v47 = (uint64_t)v125;
      if (-[PHCarPlayMainInCallViewController currentMode](self, "currentMode", v123) == 1)
      {
        v76 = sub_1000C5588();
        v77 = objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "- in call waiting and the call state changed...", buf, 2u);
        }

        v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
        v46 = v123;
        if (v78)
        {

        }
        else if (!v127
               || (v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls")),
                   v90 = objc_msgSend(v89, "containsObject:", v127),
                   v89,
                   (v90 & 1) == 0))
        {
          v91 = sub_1000C5588();
          v92 = objc_claimAutoreleasedReturnValue(v91);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "- ... it was the incoming phone call which went away", buf, 2u);
          }

          v93 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController view](self, "view"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "superview"));
          v130[0] = _NSConcreteStackBlock;
          v130[1] = 3221225472;
          v130[2] = sub_100101828;
          v130[3] = &unk_100284898;
          v130[4] = self;
          +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v94, 2097280, v130, 0, 0.5);

          v75 = self;
        }
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](v75, "primaryCalls"));
        if ((objc_msgSend(v95, "containsObject:", v127) & 1) != 0)
        {
          v96 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](v75, "primaryCalls"));
          v97 = objc_msgSend(v96, "count");
          v98 = objc_msgSend(v125, "count");

          v75 = self;
          if (v97 == v98)
            -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
        }
        else
        {

        }
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](v75, "primaryCalls"));
        if ((objc_msgSend(v99, "containsObject:", v127) & 1) == 0)
          goto LABEL_115;
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](v75, "primaryCalls"));
        v101 = objc_msgSend(v100, "count");
        v102 = objc_msgSend(v125, "count");

        v103 = v101 > v102;
        v47 = (uint64_t)v125;
        v75 = self;
        v50 = (void *)v126;
        if (!v103)
          goto LABEL_121;
        -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
        v105 = v104;
        if (v127)
        {
          v151 = v127;
          v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v151, 1));
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "arrayByExcludingObjectsInArray:", v106));
          v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "lastObject"));
          objc_msgSend(v99, "addPrimaryPhoneCall:animated:", v108, 1);

          v75 = self;
        }
        else
        {
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "lastObject"));
          objc_msgSend(v99, "addPrimaryPhoneCall:animated:", v106, 1);
        }

LABEL_114:
LABEL_115:

        v47 = (uint64_t)v125;
        v50 = (void *)v126;
LABEL_121:
        -[PHCarPlayMainInCallViewController updateButtonsViewState](v75, "updateButtonsViewState", v123);

        v48 = v124;
        v49 = v127;
        goto LABEL_122;
      }
      if (objc_msgSend(v125, "count") || !objc_msgSend(v53, "count"))
      {
        if (objc_msgSend(v125, "count") == (id)1
          && -[NSObject count](v51, "count") == (id)1
          && !objc_msgSend(v52, "count"))
        {
          v117 = sub_1000C5588();
          v118 = objc_claimAutoreleasedReturnValue(v117);
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "- addition of new call", buf, 2u);
          }

          -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v51, "lastObject"));
          objc_msgSend(v84, "addPrimaryPhoneCall:animated:", v119, 1);

        }
        else
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastObject"));
          v81 = objc_msgSend((id)v129, "containsObject:", v80);

          if (!v81)
          {
            if (objc_msgSend(v52, "count") != (id)1)
            {
              if (objc_msgSend(v53, "count") || (v120 = objc_msgSend((id)v129, "count"), v126) || v120 || !v127)
              {
                v114 = sub_1000C5588();
                v115 = objc_claimAutoreleasedReturnValue(v114);
                v46 = v123;
                if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "- catch-all reload", buf, 2u);
                }

                -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
                v116 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
                objc_msgSend(v116, "reloadPhoneCallData");

              }
              else
              {
                v121 = sub_1000C5588();
                v122 = objc_claimAutoreleasedReturnValue(v121);
                v46 = v123;
                if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "- incoming call was declined, we'll leave the UI as it is to animate out", buf, 2u);
                }

                -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
              }
              goto LABEL_121;
            }
            v111 = sub_1000C5588();
            v112 = objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "- removed calls contains an object, ending it", buf, 2u);
            }

            -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastObject"));
            v46 = v123;
            if (objc_msgSend(v99, "disconnectedReason") == 14)
            {
              -[PHCarPlayMainInCallViewController setFailedCall:](self, "setFailedCall:", v99);
              v113 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
              objc_msgSend(v113, "setButtonsMode:animated:", 6, 1);

              v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
              objc_msgSend(v105, "setIsShowingCallFailure:", 1);
            }
            else
            {
              v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
              objc_msgSend(v105, "endPhoneCall:animated:", v99, 1);
            }
            goto LABEL_114;
          }
          v82 = sub_1000C5588();
          v83 = objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "- a removed call became a conference participant, merging", buf, 2u);
          }

          -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
          objc_msgSend(v84, "mergePrimaryPhoneCallsAnimated:", 1);
        }
      }
      else
      {
        v109 = sub_1000C5588();
        v110 = objc_claimAutoreleasedReturnValue(v109);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "- initial call, reloading view", buf, 2u);
        }

        -[PHCarPlayMainInCallViewController setCurrentMode:](self, "setCurrentMode:", 0);
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
        objc_msgSend(v84, "reloadPhoneCallData");
      }

    }
    v46 = v123;
    goto LABEL_121;
  }
  v79 = sub_1000C5588();
  v51 = objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "-- CarPlay: No change to the phone calls, returning early.", buf, 2u);
  }
LABEL_122:

}

- (id)__sanitizedPrimaryPhoneCallOrdering:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "count") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v6 = objc_msgSend(v5, "isConferenced");

    v4 = v3;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
      v10[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
      v10[1] = v8;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

    }
  }

  return v4;
}

- (id)currentActivePhoneCall
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v4)
  {

LABEL_17:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));

    return v6;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
      v10 = objc_msgSend(v9, "status");
      if (v10 == 4 || v10 == 1)
      {
        v12 = v9;

        v6 = v12;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_17;
  return v6;
}

- (BOOL)isDismissable
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
  if (v3)
  {

    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callToDecline](self, "callToDecline"));

  if (v4)
    return 0;
  return !-[PHCarPlayMainInCallViewController isShowingStickyAlert](self, "isShowingStickyAlert");
}

- (void)setShouldPresentAlertButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_shouldPresentAlertButton != a3)
  {
    v3 = a3;
    self->_shouldPresentAlertButton = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    objc_msgSend(v5, "setIsShowingAlertSubtitle:", v3);

    -[PHCarPlayMainInCallViewController updateButtonsViewState](self, "updateButtonsViewState");
  }
}

- (void)setIsMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
  objc_msgSend(v4, "setMuted:", v3);

}

- (BOOL)isMuted
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));

  LOBYTE(v2) = objc_msgSend(v3, "isUplinkMuted");
  return (char)v2;
}

- (id)primaryPhoneCallsForGalleryView:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;

  v4 = -[PHCarPlayMainInCallViewController currentMode](self, "currentMode", a3);
  v5 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
  v6 = (void *)v5;
  if (v4)
  {
    v11 = v5;
    v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_6;
  }
  if (!v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    goto LABEL_3;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
  v12 = v9;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

LABEL_6:
  if (v8)
    return v8;
  else
    return &__NSArray0__struct;
}

- (id)conferenceParticipantCallsForPhoneCall:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (-[PHCarPlayMainInCallViewController currentMode](self, "currentMode", a3)
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByExcludingObjectsInArray:", v5)),
        v5,
        v4,
        !v6))
  {
    v6 = &__NSArray0__struct;
  }
  return v6;
}

- (id)allConferenceParticipantCalls
{
  void *v3;

  if (-[PHCarPlayMainInCallViewController currentMode](self, "currentMode")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"))) == 0)
  {
    v3 = &__NSArray0__struct;
  }
  return v3;
}

- (id)representativePhoneCallForConferenceForGalleryView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isConferenced"))
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isAddCallAllowed
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[PHCarPlayMainInCallViewController shouldAllowAddContactsAccess](self, "shouldAllowAddContactsAccess");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v5 = objc_msgSend(v4, "isAddCallAllowed");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMergeCallsAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callWithStatus:", 3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callWithStatus:", 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "callWithStatus:", 2));

  v9 = 0;
  if (!v4 && v6 && v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v9 = objc_msgSend(v10, "canGroupCall:withCall:", v6, v8);

  }
  return v9;
}

- (BOOL)isSwapCallsAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callWithStatus:", 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "callWithStatus:", 2));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    v8 = objc_msgSend(v7, "supportsHolding");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isKeypadAllowed
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v5 = objc_msgSend(v4, "supportsDTMF");

  return v5;
}

- (BOOL)isKeypadEnabled
{
  void *v3;
  void *v4;
  unsigned int v5;

  if (-[PHCarPlayMainInCallViewController isKeypadAllowed](self, "isKeypadAllowed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "frontmostAudioOrVideoCall"));
    v5 = objc_msgSend(v4, "isOnHold") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isHoldEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));
  v4 = objc_msgSend(v3, "isOnHold");

  return v4;
}

- (BOOL)isSendToVoicemailAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICSApplicationServices sharedInstance](ICSApplicationServices, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accounts"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingCall"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model"));
    v9 = objc_msgSend(v8, "supportsSendingToVoicemail");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canSendMessage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "incomingCall"));
  if (v4)
  {
    v5 = (void *)v4;

LABEL_4:
    v7 = -[PHCarPlayMainInCallViewController canSendMessageToCall:](self, "canSendMessageToCall:", v5);

    return v7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incomingVideoCall"));

  if (v5)
    goto LABEL_4;
  return 0;
}

- (int64_t)currentCallState
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (char *)objc_msgSend(v2, "bottomBarCallState");

  if ((unint64_t)(v3 - 2) >= 3)
    return 1;
  else
    return (int64_t)v3;
}

- (BOOL)shouldAllowAddContactsAccess
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
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController carSessionStatus](self, "carSessionStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screens"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController carSessionStatus](self, "carSessionStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSession"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "limitUserInterfaces"));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (((unint64_t)objc_msgSend(v7, "limitedUIElements") & 4) != 0)
    v12 = v11 ^ 1;
  else
    v12 = 1;

  return v12;
}

- (void)sessionDidConnect:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10010248C;
  v3[3] = &unk_100284898;
  v3[4] = self;
  TUGuaranteeExecutionOnMainThreadAsync(v3, a2, a3);
}

- (void)_sendMessageResponse:(id)a3 toCall:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void (*v21)(void *, id, void *);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  objc_msgSend(v7, "addListenerID:capabilities:", v9, (kFZListenerCapChats | kFZListenerCapAccounts));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v10, "_setBlocksConnectionAtResume:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "handle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));

  if (objc_msgSend(v12, "destinationIdIsPhoneNumber"))
  {
    v13 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage(0);
    if (!v13)
    {
      v14 = TUActiveCountryCode();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }
    v15 = TUNetworkCountryCode();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = TUNumberToDial(v12, v16, v13, 0, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);

  }
  else
  {
    v18 = v12;
  }
  if (qword_1002DCCC8[0] != -1)
    dispatch_once(qword_1002DCCC8, &stru_100287FE0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
  objc_msgSend(v19, "_forceSuspended");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
  objc_msgSend(v20, "_forceResumed");

  v21 = (void (*)(void *, id, void *))off_1002DCCC0;
  v26 = v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localSenderIdentity"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accountUUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
  v21(v22, v6, v25);

}

- (void)inCallButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  id v42;
  PHCarPlayMainInCallViewController *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  uint8_t buf[16];

  v4 = a3;
  if (!objc_msgSend(v4, "inCallButtonType"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    objc_msgSend(v8, "disconnectCurrentCallAndActivateHeld");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "callWithStatus:", 2));

    if (v10)
    {
LABEL_16:

      goto LABEL_17;
    }
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting delegate for dismissal since there are no held calls", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController delegate](self, "delegate"));
    objc_msgSend(v13, "dismissalRequestedFromInCallViewController:", self);
LABEL_8:

    goto LABEL_16;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 1)
  {
    objc_msgSend(v4, "setToggledOn:", objc_msgSend(v4, "toggledOn") ^ 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frontmostAudioOrVideoCall"));

    objc_msgSend(v6, "setUplinkMuted:", objc_msgSend(v4, "toggledOn"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    objc_msgSend(v7, "setMuted:", objc_msgSend(v4, "toggledOn"));

LABEL_11:
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "callWithStatus:", 2));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "callWithStatus:", 1));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    objc_msgSend(v17, "groupCall:withOtherCall:", v6, v16);

    goto LABEL_11;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
    objc_msgSend(v10, "ungroupCall:", v19);
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 6)
  {
    v20 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    -[NSObject swapCalls](v20, "swapCalls");
LABEL_20:

    goto LABEL_17;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController delegate](self, "delegate"));
    objc_msgSend(v10, "presentAddCallViewControllerRequestedFromInCallViewController:", self);
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 8)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));

    if (!v21)
      goto LABEL_17;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    v23 = objc_msgSend(v22, "status");

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    v10 = v24;
    if (v23 == 4)
    {
      if (objc_msgSend(v24, "isVideo"))
        v25 = 4;
      else
        v25 = 0;
      -[PHCarPlayMainInCallViewController answerIncomingCallWithBehavior:](self, "answerIncomingCallWithBehavior:", v25);
      goto LABEL_16;
    }
    if ((objc_msgSend(v24, "isConversation") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
      v39 = objc_msgSend(v38, "status");

      if (v39 == 3)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeConversationForCall:", v13));
        -[PHCarPlayMainInCallViewController answerIncomingConversation:](self, "answerIncomingConversation:", v40);

        goto LABEL_8;
      }
    }
    else
    {

    }
    v42 = sub_1000C5588();
    v20 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ignoring Answer command", buf, 2u);
    }
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 4)
    goto LABEL_39;
  if (objc_msgSend(v4, "inCallButtonType") == 9)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));

    if (!v26)
      goto LABEL_17;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    -[PHCarPlayMainInCallViewController setCallToDecline:](self, "setCallToDecline:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController replyWithMessageStore](self, "replyWithMessageStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "cannedReplyActionSheetOptions"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CARPLAY_REPLY_WITH_MESSAGE_TITLE"), &stru_10028DC20, CFSTR("PHCarPlay")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController _alertControllerWithTitle:message:](UIAlertController, "_alertControllerWithTitle:message:", v30, 0));

    objc_msgSend(v13, "setPreferredStyle:", 0);
    objc_msgSend(v13, "setModalPresentationStyle:", 7);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CARPLAY_REPLY_TEXT_MESSAGE_TITLE"), &stru_10028DC20, CFSTR("PHCarPlay")));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100103014;
    v55[3] = &unk_100284898;
    v55[4] = self;
    objc_msgSend(v13, "_addActionWithTitle:style:handler:", v32, 0, v55);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100103084;
    v54[3] = &unk_100284898;
    v54[4] = self;
    objc_msgSend(v13, "_addActionWithTitle:style:handler:", v33, 0, v54);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1001030F4;
    v53[3] = &unk_100284898;
    v53[4] = self;
    objc_msgSend(v13, "_addActionWithTitle:style:handler:", v34, 0, v53);

    v35 = TelephonyUIBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("General")));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100103164;
    v52[3] = &unk_100284898;
    v52[4] = self;
    objc_msgSend(v13, "_addActionWithTitle:style:handler:", v37, 1, v52);

    -[PHCarPlayMainInCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 13
    || objc_msgSend(v4, "inCallButtonType") == 16)
  {
LABEL_39:
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));

    if (!v41)
      goto LABEL_17;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    objc_msgSend(v10, "disconnectCall:withReason:", v18, 2);
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 10)
  {
    v43 = self;
    v44 = 0;
LABEL_50:
    -[PHCarPlayMainInCallViewController answerIncomingCallWithBehavior:](v43, "answerIncomingCallWithBehavior:", v44);
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 11)
  {
    v43 = self;
    v44 = 2;
    goto LABEL_50;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 12)
  {
    v43 = self;
    v44 = 1;
    goto LABEL_50;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController delegate](self, "delegate"));
    objc_msgSend(v10, "presentKeypadViewControllerRequestedFromInCallViewController:", self);
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 14)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "dialRequestForRedial"));
    v48 = objc_msgSend(v45, "dialWithRequest:", v47);

    -[PHCarPlayMainInCallViewController setFailedCall:](self, "setFailedCall:", 0);
    v20 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    -[NSObject setIsShowingCallFailure:](v20, "setIsShowingCallFailure:", 0);
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 15)
  {
    -[PHCarPlayMainInCallViewController setFailedCall:](self, "setFailedCall:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    objc_msgSend(v49, "setIsShowingCallFailure:", 0);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v51 = objc_msgSend(v50, "currentCallCount");

    if (v51)
    {
      -[PHCarPlayMainInCallViewController updateButtonsViewState](self, "updateButtonsViewState");
      goto LABEL_17;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController delegate](self, "delegate"));
    objc_msgSend(v10, "dismissalRequestedFromInCallViewController:", self);
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 17)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "frontmostAudioOrVideoCall"));
    objc_msgSend(v10, "unholdCall:", v19);
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "inCallButtonType") == 18)
    -[PHCarPlayMainInCallViewController _handleAlertButtonPressed](self, "_handleAlertButtonPressed");
LABEL_17:

}

- (void)answerIncomingConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v9 = objc_msgSend(objc_alloc((Class)TUJoinConversationRequest), "initWithConversation:", v4);

  objc_msgSend(v9, "setVideoEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueProxyIdentifierUUID"));
  objc_msgSend(v9, "setUUID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = objc_msgSend(v7, "joinConversationWithConversationRequest:", v9);

}

- (void)answerIncomingCallWithBehavior:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = objc_alloc((Class)TUAnswerRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
  v8 = objc_msgSend(v5, "initWithCall:", v6);

  objc_msgSend(v8, "setSourceIdentifier:", TUCallSourceIdentifierCarPlay);
  objc_msgSend(v8, "setBehavior:", a3);
  objc_msgSend(v8, "setDowngradeToAudio:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
  objc_msgSend(v7, "answerWithRequest:", v8);

}

- (id)replyWithMessageStore
{
  TUReplyWithMessageStore *replyWithMessageStore;
  TUReplyWithMessageStore *v4;
  TUReplyWithMessageStore *v5;

  replyWithMessageStore = self->_replyWithMessageStore;
  if (!replyWithMessageStore)
  {
    v4 = (TUReplyWithMessageStore *)objc_alloc_init((Class)TUReplyWithMessageStore);
    v5 = self->_replyWithMessageStore;
    self->_replyWithMessageStore = v4;

    replyWithMessageStore = self->_replyWithMessageStore;
  }
  return replyWithMessageStore;
}

- (void)handleAlertControllerSendMessageResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callToDecline](self, "callToDecline"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callToDecline](self, "callToDecline"));
      -[PHCarPlayMainInCallViewController _sendMessageResponse:toCall:](self, "_sendMessageResponse:toCall:", v9, v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
      objc_msgSend(v6, "disconnectCall:withReason:", v7, 4);

    }
  }
  -[PHCarPlayMainInCallViewController setCallToDecline:](self, "setCallToDecline:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController delegate](self, "delegate"));
  objc_msgSend(v8, "dismissalRequestedFromInCallViewController:", self);

}

- (BOOL)areIncomingCallOptionsAllowed
{
  return 1;
}

- (BOOL)canSendMessageToCall:(id)a3
{
  return objc_msgSend(a3, "isMessagingAllowed");
}

- (void)updateButtonsViewState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  unsigned int v41;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    v8 = objc_msgSend(v7, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
    v42 = 138413058;
    v43 = v5;
    v44 = 2112;
    v45 = v6;
    v46 = 2048;
    v47 = v8;
    v48 = 2048;
    v49 = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "-- CarPlay - updateButtonsViewState: self.failedCall=%@; self.incomingPhoneCall=%@; [self.primaryPhoneCalls count]"
      "=%ld; [self.conferenceParticipants count]=%ld",
      (uint8_t *)&v42,
      0x2Au);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v12 = v11;
    v13 = 6;
LABEL_5:
    v14 = 1;
LABEL_6:
    objc_msgSend(v11, "setButtonsMode:animated:", v13, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    objc_msgSend(v15, "setHidden:", 1);

LABEL_7:
    -[PHCarPlayMainInCallViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    return;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    if (objc_msgSend(v17, "status") == 3)
    {

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
      v24 = objc_msgSend(v23, "status");

      if (v24 != 4)
        goto LABEL_7;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    if ((objc_msgSend(v25, "isConversation") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
      v27 = objc_msgSend(v26, "status");

      if (v27 == 3)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
        v12 = v11;
LABEL_23:
        v13 = 3;
        goto LABEL_5;
      }
    }
    else
    {

    }
    v28 = -[PHCarPlayMainInCallViewController currentCallStateWarrantsCallWaitingMode](self, "currentCallStateWarrantsCallWaitingMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v12 = v11;
    if (v28)
    {
      v13 = 5;
      v14 = 0;
      goto LABEL_6;
    }
    goto LABEL_23;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
  if (objc_msgSend(v18, "count") != (id)1)
  {

LABEL_25:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    v30 = objc_msgSend(v29, "count");

    if ((unint64_t)v30 < 2)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
      v35 = objc_msgSend(v34, "count");

      if (!v35)
        goto LABEL_7;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
      v32 = v31;
      v33 = 4;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
      v32 = v31;
      v33 = 2;
    }
LABEL_29:
    objc_msgSend(v31, "setButtonsMode:animated:", v33, 1);

    -[PHCarPlayMainInCallViewController updateHardPauseButtonState](self, "updateHardPauseButtonState");
    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController conferenceParticipants](self, "conferenceParticipants"));
  v20 = objc_msgSend(v19, "count");

  if (v20)
    goto LABEL_25;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
  if (objc_msgSend(v22, "status") == 5)
  {

    return;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
  v38 = objc_msgSend(v37, "status");

  if (v38 != 6)
  {
    if (-[PHCarPlayMainInCallViewController _shouldPresentAlertUI](self, "_shouldPresentAlertUI"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
      v32 = v31;
      v33 = 7;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
      v41 = objc_msgSend(v40, "isOnHold");

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
      v32 = v31;
      v33 = v41 != 0;
    }
    goto LABEL_29;
  }
}

- (void)viewUpdateClockTickTimerFired:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("MPCarPlayInCallViewControllerUpdateClockTickNotification"), 0, 0);

}

- (void)muteStateChangedNotification:(id)a3
{
  -[PHCarPlayMainInCallViewController setIsMuted:](self, "setIsMuted:", -[PHCarPlayMainInCallViewController isMuted](self, "isMuted", a3));
}

- (void)callStateChangedNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v5 = objc_msgSend(v4, "currentAudioAndVideoCallCount");

  if (v5)
    -[PHCarPlayMainInCallViewController updateButtonsViewState](self, "updateButtonsViewState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
  v7 = objc_msgSend(v6, "status");
  if (v7 == 6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "callUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController redialedCallUUID](self, "redialedCallUUID"));
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialRequestForRedial"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
      v13 = objc_msgSend(v12, "dialWithRequest:", v11);

      -[PHCarPlayMainInCallViewController setRedialedCallUUID:](self, "setRedialedCallUUID:", 0);
    }
  }
  else if ((v7 & 0xFFFFFFFD) == 1)
  {
    +[PHInCallRootViewController releaseDismissalAssertionForReason:](PHInCallRootViewController, "releaseDismissalAssertionForReason:", CFSTR("PHRedialCallAssertionReason"));
  }

}

- (void)limitedUIChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Limited UI changed %@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100103ABC;
  v9[3] = &unk_100284898;
  v9[4] = self;
  TUGuaranteeExecutionOnMainThreadAsync(v9, v7, v8);

}

- (BOOL)currentCallStateWarrantsCallWaitingMode
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController incomingCall](self, "incomingCall"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)callForHardPauseState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callContainer](self, "callContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));

  return v3;
}

- (void)hardPauseButtonDidSendHardPauseDigits:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callForHardPauseState](self, "callForHardPauseState", a3));
  objc_msgSend(v3, "sendHardPauseDigits");

}

- (void)updateHardPauseButtonState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callForHardPauseState](self, "callForHardPauseState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hardPauseDigitsDisplayString"));
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callForHardPauseState](self, "callForHardPauseState"));
  objc_msgSend(v7, "setHidden:", objc_msgSend(v6, "hardPauseDigitsState") != 2);

}

- (id)preferredFocusEnvironments
{
  void *v3;
  unsigned int v4;
  void *v5;
  void **v6;
  void *v7;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController buttonsView](self, "buttonsView"));
    v10 = v5;
    v6 = &v10;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController hardPauseButton](self, "hardPauseButton"));
    v9 = v5;
    v6 = &v9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1));

  return v7;
}

- (void)cleanAlertUIInCarPlay
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController presentedViewController](self, "presentedViewController"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController presentedViewController](self, "presentedViewController"));
    objc_opt_class(ICSCarPlayAlertViewController, v6);
    isKindOfClass = objc_opt_isKindOfClass(v5, v7);

    if ((isKindOfClass & 1) != 0)
    {
      v9 = sub_1000C5588();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dismiss Carplay Alert UI", v11, 2u);
      }

      -[PHCarPlayMainInCallViewController setShowingStickyAlert:](self, "setShowingStickyAlert:", 0);
    }
  }
}

- (BOOL)_shouldPresentAlertUI
{
  PHCarPlayMainInCallViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  LOBYTE(v2) = objc_msgSend(v4, "canDisplayAlertUI:", -[PHCarPlayMainInCallViewController shouldPresentAlertButton](v2, "shouldPresentAlertButton"));
  return (char)v2;
}

- (void)_handleAlertButtonPressed
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay alert button pressed", buf, 2u);
  }

  -[PHCarPlayMainInCallViewController _presentAlertForEmergencyCallFailure](self, "_presentAlertForEmergencyCallFailure");
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Since CarPlay alert button pressed, invoking alert", v8, 2u);
  }

  -[PHCarPlayMainInCallViewController setShowingStickyAlert:](self, "setShowingStickyAlert:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController alertCoordinator](self, "alertCoordinator"));
  objc_msgSend(v7, "invokeAlertWithRequestUnlock:automaticallyInvoked:", 0, 0);

}

- (void)_presentAlertForEmergencyCallFailure
{
  ICSCarPlayAlertViewController *v3;

  v3 = objc_alloc_init(ICSCarPlayAlertViewController);
  -[ICSCarPlayAlertViewController setDelegate:](v3, "setDelegate:", self);
  -[PHCarPlayMainInCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)alertWillInvoke
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PHAlertDisconnectingCallsNotification"), 0);

}

- (void)setShowingStickyAlert:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_showingStickyAlert != a3)
  {
    self->_showingStickyAlert = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callPassingTest:", &stru_100288000));
      -[PHCarPlayMainInCallViewController setEmergencyCallBeforePresentingStickyAlert:](self, "setEmergencyCallBeforePresentingStickyAlert:", v5);

      v9 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      objc_msgSend(v6, "setShouldIgnoreCarPlayAssertionInvalidations:", 1);

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      objc_msgSend(v8, "setShouldIgnoreCarPlayAssertionInvalidations:", 0);

      v9 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController delegate](self, "delegate"));
      objc_msgSend(v9, "dismissalRequestedFromInCallViewController:", self);
    }

  }
}

- (void)shouldPlaySound
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Playing ping my phone", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController nfmPlayCommands](self, "nfmPlayCommands"));
  objc_msgSend(v5, "playFindLocallySound");

}

- (void)shouldCallAgain
{
  unsigned int v3;
  id v4;
  NSObject *v5;
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
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _DWORD v21[2];
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v3 = -[PHCarPlayMainInCallViewController _shouldPresentAlertUI](self, "_shouldPresentAlertUI");
  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueProxyIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController emergencyCallBeforePresentingStickyAlert](self, "emergencyCallBeforePresentingStickyAlert"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueProxyIdentifier"));
    v21[0] = 67109634;
    v21[1] = v3;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Carplay call again button pressed, shouldReconnect: %d failedCall: %@ emergencyCallBeforePresentingStickyAlert: %@", (uint8_t *)v21, 0x1Cu);

  }
  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController primaryCalls](self, "primaryCalls"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "callUUID"));
    -[PHCarPlayMainInCallViewController setRedialedCallUUID:](self, "setRedialedCallUUID:", v12);

    +[PHInCallRootViewController obtainDismissalAssertionForReason:](PHInCallRootViewController, "obtainDismissalAssertionForReason:", CFSTR("PHRedialCallAssertionReason"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    objc_msgSend(v13, "disconnectCall:withReason:", v11, 34);
LABEL_12:

    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
  if (v14)
  {

LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
    if (v16)
      v17 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController failedCall](self, "failedCall"));
    else
      v17 = objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController emergencyCallBeforePresentingStickyAlert](self, "emergencyCallBeforePresentingStickyAlert"));
    v11 = (void *)v17;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dialRequestForRedial"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController callCenter](self, "callCenter"));
    v19 = objc_msgSend(v18, "dialWithRequest:", v13);

    -[PHCarPlayMainInCallViewController setFailedCall:](self, "setFailedCall:", 0);
    -[PHCarPlayMainInCallViewController setEmergencyCallBeforePresentingStickyAlert:](self, "setEmergencyCallBeforePresentingStickyAlert:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController galleryView](self, "galleryView"));
    objc_msgSend(v20, "setIsShowingCallFailure:", 0);

    goto LABEL_12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayMainInCallViewController emergencyCallBeforePresentingStickyAlert](self, "emergencyCallBeforePresentingStickyAlert"));

  if (v15)
    goto LABEL_8;
LABEL_13:
  -[PHCarPlayMainInCallViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[PHCarPlayMainInCallViewController updateButtonsViewState](self, "updateButtonsViewState");
}

- (void)alertViewWillDismiss
{
  -[PHCarPlayMainInCallViewController setShowingStickyAlert:](self, "setShowingStickyAlert:", 0);
  -[PHCarPlayMainInCallViewController setEmergencyCallBeforePresentingStickyAlert:](self, "setEmergencyCallBeforePresentingStickyAlert:", 0);
}

- (void)presentDisconnectionAlert:(id)a3
{
  -[PHCarPlayMainInCallViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (BOOL)isShowSOSConfirmationSupported
{
  return 1;
}

- (MPCarPlayInCallViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MPCarPlayInCallViewControllerDelegate *)a3;
}

- (NSArray)primaryCalls
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrimaryCalls:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)conferenceParticipants
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConferenceParticipants:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (TUCall)incomingCall
{
  return (TUCall *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncomingCall:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIView)flippyView
{
  return (UIView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFlippyView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PHCarPlayPhoneCallGalleryView)galleryView
{
  return (PHCarPlayPhoneCallGalleryView *)objc_getProperty(self, a2, 64, 1);
}

- (void)setGalleryView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PHCarPlayInCallButtonsView)buttonsView
{
  return (PHCarPlayInCallButtonsView *)objc_getProperty(self, a2, 72, 1);
}

- (void)setButtonsView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PHCarPlayInCallHardPauseButton)hardPauseButton
{
  return (PHCarPlayInCallHardPauseButton *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHardPauseButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSTimer)viewUpdateClockTickTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setViewUpdateClockTickTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (TUCall)callToDecline
{
  return (TUCall *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCallToDecline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unsigned)currentMode
{
  return self->_currentMode;
}

- (void)setCurrentMode:(unsigned __int16)a3
{
  self->_currentMode = a3;
}

- (TUCall)failedCall
{
  return (TUCall *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFailedCall:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CARSessionStatus)carSessionStatus
{
  return (CARSessionStatus *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCarSessionStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)redialedCallUUID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRedialedCallUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (_TtP13InCallService24AlertCoordinatorProtocol_)alertCoordinator
{
  return self->_alertCoordinator;
}

- (void)setAlertCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_alertCoordinator, a3);
}

- (NFMPlayCommands)nfmPlayCommands
{
  return self->_nfmPlayCommands;
}

- (void)setNfmPlayCommands:(id)a3
{
  objc_storeStrong((id *)&self->_nfmPlayCommands, a3);
}

- (BOOL)shouldPresentAlertButton
{
  return self->_shouldPresentAlertButton;
}

- (BOOL)isShowingStickyAlert
{
  return self->_showingStickyAlert;
}

- (TUCall)emergencyCallBeforePresentingStickyAlert
{
  return self->_emergencyCallBeforePresentingStickyAlert;
}

- (void)setEmergencyCallBeforePresentingStickyAlert:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyCallBeforePresentingStickyAlert, a3);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (TUCallContainerPrivate)callContainer
{
  return self->_callContainer;
}

- (void)setCallContainer:(id)a3
{
  objc_storeStrong((id *)&self->_callContainer, a3);
}

- (id)canSendTextMessagesBlock
{
  return self->_canSendTextMessagesBlock;
}

- (void)setCanSendTextMessagesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canSendTextMessagesBlock, 0);
  objc_storeStrong((id *)&self->_callContainer, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_emergencyCallBeforePresentingStickyAlert, 0);
  objc_storeStrong((id *)&self->_nfmPlayCommands, 0);
  objc_storeStrong((id *)&self->_alertCoordinator, 0);
  objc_storeStrong((id *)&self->_redialedCallUUID, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_failedCall, 0);
  objc_storeStrong((id *)&self->_callToDecline, 0);
  objc_storeStrong((id *)&self->_viewUpdateClockTickTimer, 0);
  objc_storeStrong((id *)&self->_hardPauseButton, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
  objc_storeStrong((id *)&self->_galleryView, 0);
  objc_storeStrong((id *)&self->_flippyView, 0);
  objc_storeStrong((id *)&self->_incomingCall, 0);
  objc_storeStrong((id *)&self->_conferenceParticipants, 0);
  objc_storeStrong((id *)&self->_primaryCalls, 0);
  objc_storeStrong((id *)&self->_replyWithMessageStore, 0);
}

@end
