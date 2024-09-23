@implementation STKUSSDViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[STKUSSDSessionAction invalidate](self->_sessionAction, "invalidate");
  -[STKUSSDViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  v4.receiver = self;
  v4.super_class = (Class)STKUSSDViewController;
  -[STKUSSDViewController dealloc](&v4, "dealloc");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (void)viewDidLoad
{
  NSMutableArray *v3;
  NSMutableArray *supplementaryServicesInfo;
  NSNumberFormatter *v5;
  NSNumberFormatter *decimalFormatter;
  NSNumberFormatter *v7;
  void *v8;
  void *v9;
  void *v10;
  UILayoutGuide *v11;
  UILayoutGuide *keyboardGuide;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *keyboardTopConstraint;
  id v19;
  UIView *v20;
  UIView *notifyView;
  UITextView *v22;
  UITextView *textView;
  void *v24;
  void *v25;
  UIActivityIndicatorView *v26;
  UIActivityIndicatorView *activityIndicator;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *textViewHeightConstraint;
  double v31;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *textViewBottomConstraint;
  double v36;
  void *v37;
  NSLayoutConstraint *v38;
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
  objc_super v82;
  _QWORD v83[15];

  v82.receiver = self;
  v82.super_class = (Class)STKUSSDViewController;
  -[STKUSSDViewController viewDidLoad](&v82, "viewDidLoad");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  supplementaryServicesInfo = self->_supplementaryServicesInfo;
  self->_supplementaryServicesInfo = v3;

  v5 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
  decimalFormatter = self->_decimalFormatter;
  self->_decimalFormatter = v5;

  v7 = self->_decimalFormatter;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  -[NSNumberFormatter setLocale:](v7, "setLocale:", v8);

  -[NSNumberFormatter setNumberStyle:](self->_decimalFormatter, "setNumberStyle:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.349019608, 0.349019608, 0.349019608, 1.0));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v81, "addObserver:selector:name:object:", self, "_keyboardWillChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);
  v11 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  keyboardGuide = self->_keyboardGuide;
  self->_keyboardGuide = v11;

  objc_msgSend(v9, "addLayoutGuide:", self->_keyboardGuide);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_keyboardGuide, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  +[TPButton defaultHeight](TPButton, "defaultHeight");
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -v16));
  keyboardTopConstraint = self->_keyboardTopConstraint;
  self->_keyboardTopConstraint = v17;

  v19 = objc_alloc((Class)UIView);
  objc_msgSend(v9, "frame");
  v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
  notifyView = self->_notifyView;
  self->_notifyView = v20;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_notifyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", self->_notifyView);
  v22 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:textContainer:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  textView = self->_textView;
  self->_textView = v22;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UITextView setFont:](self->_textView, "setFont:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v25);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setOpaque:](self->_textView, "setOpaque:", 0);
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", 0);
  -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 1);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 0);
  objc_msgSend(v9, "addSubview:", self->_textView);
  v26 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 1);
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v26;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_notifyView, "addSubview:", self->_activityIndicator);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView heightAnchor](self->_textView, "heightAnchor"));
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 0.0));
  textViewHeightConstraint = self->_textViewHeightConstraint;
  self->_textViewHeightConstraint = v29;

  LODWORD(v31) = 1144750080;
  -[NSLayoutConstraint setPriority:](self->_textViewHeightConstraint, "setPriority:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView bottomAnchor](self->_textView, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_keyboardGuide, "topAnchor"));
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -50.0));
  textViewBottomConstraint = self->_textViewBottomConstraint;
  self->_textViewBottomConstraint = v34;

  LODWORD(v36) = 1144766464;
  -[NSLayoutConstraint setPriority:](self->_textViewBottomConstraint, "setPriority:", v36);
  v83[0] = self->_keyboardTopConstraint;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_keyboardGuide, "widthAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "widthAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
  v83[1] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_keyboardGuide, "bottomAnchor"));
  v37 = v9;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
  v83[2] = v74;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](self->_keyboardGuide, "centerXAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "centerXAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v83[3] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_notifyView, "widthAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "widthAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v83[4] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_notifyView, "heightAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v83[5] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_notifyView, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
  v83[6] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_notifyView, "centerYAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v83[7] = v58;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_textView, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 50.0));
  v38 = self->_textViewHeightConstraint;
  v83[8] = v54;
  v83[9] = v38;
  v83[10] = self->_textViewBottomConstraint;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView widthAnchor](self->_textView, "widthAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -8.0));
  v83[11] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView centerXAnchor](self->_textView, "centerXAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerXAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v39));
  v83[12] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_activityIndicator, "centerXAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_notifyView, "centerXAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  v83[13] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_activityIndicator, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_notifyView, "centerYAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -35.0));
  v83[14] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STKUSSDViewController;
  -[STKUSSDViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000743C;
  v8[3] = &unk_100014438;
  v8[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.3);
  if (!self->_hasReceivedContent)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView text](self->_textView, "text"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PLEASE_WAIT"), &stru_100014540, CFSTR("SIMToolkitUI")));
      -[STKUSSDViewController _updateNotifyText:](self, "_updateNotifyText:", v7);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKUSSDViewController;
  -[STKUSSDViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[STKUSSDViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007500;
  v4[3] = &unk_100014438;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.3);
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKUSSDViewController;
  -[STKUSSDViewController _willAppearInRemoteViewController](&v5, "_willAppearInRemoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "setAllowsMenuButtonDismissal:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "setAllowsAlertStacking:", 1);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  NSXPCConnection *v10;
  NSXPCConnection *connection;
  NSXPCConnection *v12;
  uint64_t v13;
  void *v14;
  NSXPCConnection *v15;
  uint64_t v16;
  void *v17;
  NSXPCConnection *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  STKUSSDSessionAction *sessionAction;
  _OWORD v28[4];
  _QWORD v29[4];
  id v30;
  id location;
  uint8_t buf[4];
  STKUSSDSessionAction *v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
  objc_msgSend(v8, "_setEndpoint:", v9);

  v10 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v8);
  connection = self->_connection;
  self->_connection = v10;

  v12 = self->_connection;
  v13 = STKUSSDHostCommunicationInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSXPCConnection setRemoteObjectInterface:](v12, "setRemoteObjectInterface:", v14);

  v15 = self->_connection;
  v16 = STKUSSDSessionCommunicationInterface();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSXPCConnection setExportedInterface:](v15, "setExportedInterface:", v17);

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v18 = self->_connection;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000078C0;
  v29[3] = &unk_100014488;
  objc_copyWeak(&v30, &location);
  -[NSXPCConnection setInvalidationHandler:](v18, "setInvalidationHandler:", v29);
  -[NSXPCConnection resume](self->_connection, "resume");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
  objc_msgSend(v19, "wakeup");

  memset(v28, 0, sizeof(v28));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions", 0));
  if (objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", v28, v34, 16))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[STKSessionAction _sessionActionFromBSAction:](STKSessionAction, "_sessionActionFromBSAction:", **((_QWORD **)&v28[0] + 1)));
    v22 = objc_opt_class(STKUSSDSessionAction);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
      objc_storeStrong((id *)&self->_sessionAction, v21);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v24 = objc_msgSend(v23, "isInternalInstall");

  if (v24)
  {
    v25 = STKCommonLog();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      sessionAction = self->_sessionAction;
      *(_DWORD *)buf = 138412290;
      v33 = sessionAction;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SessionAction = %@", buf, 0xCu);
    }

  }
  if (v7)
    v7[2](v7);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)clearTimeoutTimer
{
  NSTimer *timeoutTimer;

  -[NSTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

}

- (void)dismiss
{
  _QWORD v3[5];
  _QWORD v4[5];

  -[STKUSSDViewController clearTimeoutTimer](self, "clearTimeoutTimer");
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000079B0;
  v4[3] = &unk_100014438;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000079E4;
  v3[3] = &unk_100014460;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.3);
}

- (void)startTimeoutTimerIfNecessary
{
  NSTimer *v3;
  NSTimer *timeoutTimer;

  if (!self->_timeoutTimer)
  {
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_displayDidTimeout", 0, 0, 1.5));
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v3;

  }
}

- (void)setAllowsResponse:(BOOL)a3
{
  if (self->_allowsResponse != a3)
  {
    self->_allowsResponse = a3;
    -[STKUSSDViewController _setupResponseBar](self, "_setupResponseBar");
  }
}

- (void)_cancelClicked:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController sessionAction](self, "sessionAction", a3));
  objc_msgSend(v4, "sendResponse:", 1);

  -[STKUSSDViewController dismiss](self, "dismiss");
}

- (void)_okayClicked:(id)a3
{
  void *v4;
  void *v5;

  if (self->_allowsResponse)
  {
    -[USSDReplyField endEditing:](self->_responseField, "endEditing:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController sessionAction](self, "sessionAction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField text](self->_responseField, "text"));
    objc_msgSend(v4, "sendSuccessWithResponse:", v5);

  }
  -[STKUSSDViewController dismiss](self, "dismiss", a3);
}

- (void)_replyClicked:(id)a3
{
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
  _QWORD v18[3];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "_textDidChangeNotification:", UITextFieldTextDidChangeNotification, self->_responseField);
  -[UIView removeFromSuperview](self->_notifyView, "removeFromSuperview");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController _replyView](self, "_replyView"));
  objc_msgSend(v4, "addSubview:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v18[0] = v13;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_keyboardGuide, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v18[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v18[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  -[USSDReplyField becomeFirstResponder](self->_responseField, "becomeFirstResponder");
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MinY;
  void *v15;
  void *v16;
  double MaxY;
  double v18;
  CGRect v19;
  CGRect v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  MinY = CGRectGetMinY(v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "safeAreaLayoutGuide"));
  objc_msgSend(v16, "layoutFrame");
  MaxY = CGRectGetMaxY(v20);

  -[NSLayoutConstraint setConstant:](self->_keyboardTopConstraint, "setConstant:", -(MaxY - MinY));
  v18 = -93.0;
  if (!self->_replyView)
    v18 = -50.0;
  -[NSLayoutConstraint setConstant:](self->_textViewBottomConstraint, "setConstant:", v18);
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STKUSSDViewController;
  -[STKUSSDViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  -[UITextView bounds](self->_textView, "bounds");
  v4 = v3;
  -[UITextView contentSize](self->_textView, "contentSize");
  v6 = v5;
  -[UITextView zoomScale](self->_textView, "zoomScale");
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", 0.0, -fmax((v4 - v6 * v7) * 0.5, 0.0));
}

- (void)dismissCoalescingSession
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    v5 = STKCommonLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received dismiss coalescing session action.", v7, 2u);
    }

  }
  -[STKUSSDViewController dismiss](self, "dismiss");
}

- (void)sessionDidReceiveString:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  STKUSSDViewController *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008044;
  v5[3] = &unk_1000144B0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)sessionDidReceiveErrorCode:(int64_t)a3 string:(id)a4
{
  id v4;
  _QWORD block[4];
  id v6;
  STKUSSDViewController *v7;
  int64_t v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000081A0;
  block[3] = &unk_1000144D8;
  v7 = self;
  v8 = a3;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)sessionDidTerminate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000083C0;
  block[3] = &unk_100014438;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionWantsResponse:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008494;
  v3[3] = &unk_100014500;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)sessionDidReceiveSupplementaryServicesEvent:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000853C;
  v4[3] = &unk_1000144B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  NSUInteger length;
  id v7;
  void *v8;
  id v9;
  BOOL v10;

  length = a5.length;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v9 = objc_msgSend(v8, "length");

  v10 = (unint64_t)v9 < 0xB6 || length >= (unint64_t)objc_msgSend(v7, "length");
  return v10;
}

- (id)_replyView
{
  UIView *replyView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *v14;
  id v15;
  UIImage *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  USSDReplyField *v28;
  double y;
  double width;
  double height;
  USSDReplyField *v32;
  USSDReplyField *responseField;
  USSDReplyField *v34;
  void *v35;
  USSDReplyField *v36;
  void *v37;
  USSDReplyField *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  UITextView *v47;
  UITextView *charsRemainingView;
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
  id v88;
  void *v89;
  id v90;
  void *v91;
  _QWORD v92[11];

  replyView = self->_replyView;
  if (!replyView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKUSSDViewController view](self, "view"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v6, v8, v10, v12);
    v14 = self->_replyView;
    self->_replyView = v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_replyView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STKUSSDViewController _setupResponseBar](self, "_setupResponseBar");
    v15 = objc_alloc_init((Class)UINavigationBar);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setBarStyle:", 1);
    v91 = v15;
    objc_msgSend(v15, "setTranslucent:", 1);
    v16 = objc_opt_new(UIImage);
    objc_msgSend(v15, "setBackgroundImage:forBarMetrics:", v16, 0);

    v17 = objc_alloc((Class)UINavigationItem);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v20 = objc_msgSend(v17, "initWithTitle:", v19);

    v21 = objc_alloc((Class)UIBarButtonItem);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v90 = objc_msgSend(v21, "initWithTitle:style:target:action:", v23, 0, self, "_cancelClicked:");

    objc_msgSend(v20, "setLeftBarButtonItem:", v90);
    v24 = objc_alloc((Class)UIBarButtonItem);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v88 = objc_msgSend(v24, "initWithTitle:style:target:action:", v26, 0, self, "_okayClicked:");

    v89 = v20;
    objc_msgSend(v20, "setRightBarButtonItem:", v88);
    v27 = v15;
    objc_msgSend(v15, "pushNavigationItem:animated:", v20, 0);
    -[UIView addSubview:](self->_replyView, "addSubview:", v15);
    v28 = [USSDReplyField alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v32 = -[USSDReplyField initWithFrame:](v28, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    responseField = self->_responseField;
    self->_responseField = v32;

    -[USSDReplyField _setLayoutDebuggingIdentifier:](self->_responseField, "_setLayoutDebuggingIdentifier:", CFSTR("_responseField"));
    -[USSDReplyField setTranslatesAutoresizingMaskIntoConstraints:](self->_responseField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v34 = self->_responseField;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[USSDReplyField setFont:](v34, "setFont:", v35);

    -[USSDReplyField setBorderStyle:](self->_responseField, "setBorderStyle:", 1);
    v36 = self->_responseField;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[USSDReplyField setTextColor:](v36, "setTextColor:", v37);

    v38 = self->_responseField;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[USSDReplyField setInsertionPointColor:](v38, "setInsertionPointColor:", v39);

    -[USSDReplyField setDelegate:](self->_responseField, "setDelegate:", self);
    -[USSDReplyField setKeyboardAppearance:](self->_responseField, "setKeyboardAppearance:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField layer](self->_responseField, "layer"));
    objc_msgSend(v40, "setCornerRadius:", 8.0);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField layer](self->_responseField, "layer"));
    objc_msgSend(v41, "setMasksToBounds:", 1);

    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v43 = objc_msgSend(v42, "CGColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField layer](self->_responseField, "layer"));
    objc_msgSend(v44, "setBorderColor:", v43);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField layer](self->_responseField, "layer"));
    objc_msgSend(v45, "setBorderWidth:", 1.0);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField textInputTraits](self->_responseField, "textInputTraits"));
    objc_msgSend(v87, "setAcceptsFloatingKeyboard:", 0);
    objc_msgSend(v87, "setAcceptsSplitKeyboard:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v87, "setInsertionPointColor:", v46);

    objc_msgSend(v87, "setKeyboardAppearance:", 1);
    objc_msgSend(v87, "setAutocorrectionType:", 1);
    objc_msgSend(v87, "setTextLoupeVisibility:", 1);
    objc_msgSend(v87, "setLearnsCorrections:", 0);
    -[UIView addSubview:](self->_replyView, "addSubview:", self->_responseField);
    v47 = (UITextView *)objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    charsRemainingView = self->_charsRemainingView;
    self->_charsRemainingView = v47;

    -[UITextView _setLayoutDebuggingIdentifier:](self->_charsRemainingView, "_setLayoutDebuggingIdentifier:", CFSTR("_charsRemainingView"));
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_charsRemainingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
    -[UITextView setFont:](self->_charsRemainingView, "setFont:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UITextView setTextColor:](self->_charsRemainingView, "setTextColor:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextView setBackgroundColor:](self->_charsRemainingView, "setBackgroundColor:", v51);

    -[UITextView setTextAlignment:](self->_charsRemainingView, "setTextAlignment:", 1);
    -[UITextView setUserInteractionEnabled:](self->_charsRemainingView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_replyView, "addSubview:", self->_charsRemainingView);
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_replyView, "safeAreaLayoutGuide"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "topAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
    v92[0] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "widthAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_replyView, "widthAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
    v92[1] = v80;
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerXAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_replyView, "centerXAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v78));
    v92[2] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField leadingAnchor](self->_responseField, "leadingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_replyView, "leadingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, 4.0));
    v92[3] = v74;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField bottomAnchor](self->_responseField, "bottomAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_replyView, "safeAreaLayoutGuide"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -30.0));
    v92[4] = v70;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField widthAnchor](self->_responseField, "widthAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_replyView, "widthAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, -8.0));
    v92[5] = v67;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField heightAnchor](self->_responseField, "heightAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToConstant:", 38.0));
    v92[6] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView leadingAnchor](self->_charsRemainingView, "leadingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_replyView, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 4.0));
    v92[7] = v62;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView topAnchor](self->_charsRemainingView, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField bottomAnchor](self->_responseField, "bottomAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
    v92[8] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView heightAnchor](self->_charsRemainingView, "heightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToConstant:", 28.0));
    v92[9] = v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView widthAnchor](self->_charsRemainingView, "widthAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_replyView, "widthAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, -8.0));
    v92[10] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 11));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v60);

    -[STKUSSDViewController _updateCharsRemaining](self, "_updateCharsRemaining");
    replyView = self->_replyView;
  }
  return replyView;
}

- (void)_noteDidReceiveContent:(id)a3
{
  UIActivityIndicatorView *activityIndicator;
  id v5;

  self->_hasReceivedContent = 1;
  activityIndicator = self->_activityIndicator;
  v5 = a3;
  -[UIActivityIndicatorView stopAnimating](activityIndicator, "stopAnimating");
  -[STKUSSDViewController _updateNotifyText:](self, "_updateNotifyText:", v5);

  -[STKUSSDViewController _setupResponseBar](self, "_setupResponseBar");
}

- (void)_displayDidTimeout
{
  -[STKUSSDSessionAction sendResponse:](self->_sessionAction, "sendResponse:", 2);
  -[STKUSSDViewController dismiss](self, "dismiss");
}

- (void)_setupResponseBar
{
  TPButton *replyButton;
  id v4;
  void *v5;
  void *v6;
  double y;
  double width;
  double height;
  TPButton *v10;
  TPButton *dismissButton;
  TPButton *v12;
  void *v13;
  TPButton *v14;
  void *v15;
  unsigned int v16;
  char **v17;
  id v18;
  void *v19;
  void *v20;
  TPButton *v21;
  TPButton *v22;
  TPButton *v23;
  void *v24;
  TPButton *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
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
  double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];
  _QWORD v62[3];

  -[TPButton removeFromSuperview](self->_replyButton, "removeFromSuperview");
  -[TPButton removeFromSuperview](self->_dismissButton, "removeFromSuperview");
  replyButton = self->_replyButton;
  self->_replyButton = 0;

  v4 = objc_alloc((Class)TPButton);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISMISS_ALERT"), &stru_100014540, CFSTR("SIMToolkitUI")));
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (TPButton *)objc_msgSend(v4, "initWithTitle:icon:color:frame:", v6, 0, 6, CGRectZero.origin.x, y, width, height);
  dismissButton = self->_dismissButton;
  self->_dismissButton = v10;

  -[TPButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = self->_dismissButton;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[TPButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

  v14 = self->_dismissButton;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[TPButton setTitleColor:forState:](v14, "setTitleColor:forState:", v15, 4);

  -[UIView addSubview:](self->_notifyView, "addSubview:", self->_dismissButton);
  v16 = -[STKUSSDViewController allowsResponse](self, "allowsResponse");
  v17 = &selRef__cancelClicked_;
  if (!v16)
    v17 = &selRef__okayClicked_;
  -[TPButton addTarget:action:forEvents:](self->_dismissButton, "addTarget:action:forEvents:", self, *v17, 64);
  if (-[STKUSSDViewController allowsResponse](self, "allowsResponse"))
  {
    v18 = objc_alloc((Class)TPButton);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_100014540, CFSTR("SIMToolkitUI")));
    v21 = (TPButton *)objc_msgSend(v18, "initWithTitle:icon:color:frame:", v20, 0, 15, CGRectZero.origin.x, y, width, height);
    v22 = self->_replyButton;
    self->_replyButton = v21;

    -[TPButton setTranslatesAutoresizingMaskIntoConstraints:](self->_replyButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = self->_replyButton;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[TPButton setTitleColor:forState:](v23, "setTitleColor:forState:", v24, 0);

    v25 = self->_replyButton;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[TPButton setTitleColor:forState:](v25, "setTitleColor:forState:", v26, 4);

    -[TPButton addTarget:action:forEvents:](self->_replyButton, "addTarget:action:forEvents:", self, "_replyClicked:", 64);
    -[UIView addSubview:](self->_notifyView, "addSubview:", self->_replyButton);
  }
  +[TPButton defaultHeight](TPButton, "defaultHeight");
  v28 = v27;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton heightAnchor](self->_dismissButton, "heightAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", v28));
  v62[0] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton bottomAnchor](self->_dismissButton, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView safeAreaLayoutGuide](self->_notifyView, "safeAreaLayoutGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, -8.0));
  v62[1] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton leadingAnchor](self->_dismissButton, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_notifyView, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 16.0));
  v62[2] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  if (-[STKUSSDViewController allowsResponse](self, "allowsResponse"))
  {
    +[TPSuperBottomBar defaultInterButtonSpacing](TPSuperBottomBar, "defaultInterButtonSpacing");
    v39 = v38;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton widthAnchor](self->_dismissButton, "widthAnchor"));
    v56 = objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_notifyView, "widthAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:multiplier:constant:", v56, 0.5, -16.0 - v39 * 0.5));
    v61[0] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton widthAnchor](self->_replyButton, "widthAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton widthAnchor](self->_dismissButton, "widthAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v59));
    v61[1] = v57;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton heightAnchor](self->_replyButton, "heightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", v28));
    v61[2] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton centerYAnchor](self->_replyButton, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton centerYAnchor](self->_dismissButton, "centerYAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
    v61[3] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton leadingAnchor](self->_replyButton, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton trailingAnchor](self->_dismissButton, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, v39));
    v61[4] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v49);

    v50 = v55;
    v51 = (void *)v56;

  }
  else
  {
    +[TPSuperBottomBar defaultSideMarginForSingleButton](TPSuperBottomBar, "defaultSideMarginForSingleButton");
    v53 = v52;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TPButton widthAnchor](self->_dismissButton, "widthAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_notifyView, "widthAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, v53 * -2.0));
    v60 = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);
  }

}

- (void)_updateCharsRemaining
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  UITextView *charsRemainingView;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[USSDReplyField text](self->_responseField, "text"));
  v4 = (int)(182 - objc_msgSend(v3, "length"));

  v5 = v4 & ~(v4 >> 63);
  charsRemainingView = self->_charsRemainingView;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CHARS_REMAINING"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5));
  -[UITextView setText:](charsRemainingView, "setText:", v8);

}

- (void)_updateNotifyText:(id)a3
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *displayText;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  void *v19;
  NSLayoutConstraint *textViewHeightConstraint;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v7 = objc_msgSend(v6, "isInternalInstall");

  if (v7)
  {
    v8 = STKCommonLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Update text: %{public}@", buf, 0xCu);
    }

  }
  objc_storeStrong((id *)&self->_displayText, a3);
  if (self->_displayText)
    displayText = (__CFString *)self->_displayText;
  else
    displayText = &stru_100014540;
  v11 = -[__CFString mutableCopy](displayText, "mutableCopy");
  if (-[NSMutableArray count](self->_supplementaryServicesInfo, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = self->_supplementaryServicesInfo;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "length", (_QWORD)v24))
            objc_msgSend(v11, "appendString:", CFSTR("\n\n"));
          v18 = sub_1000099B8(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          objc_msgSend(v11, "appendString:", v19);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

  }
  -[UITextView setText:](self->_textView, "setText:", v11, (_QWORD)v24);
  -[UIView bounds](self->_notifyView, "bounds");
  textViewHeightConstraint = self->_textViewHeightConstraint;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v21, v22);
  -[NSLayoutConstraint setConstant:](textViewHeightConstraint, "setConstant:", v23);

}

- (STKUSSDSessionAction)sessionAction
{
  return self->_sessionAction;
}

- (BOOL)allowsResponse
{
  return self->_allowsResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decimalFormatter, 0);
  objc_storeStrong((id *)&self->_textViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardTopConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardGuide, 0);
  objc_storeStrong((id *)&self->_responseField, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_charsRemainingView, 0);
  objc_storeStrong((id *)&self->_replyView, 0);
  objc_storeStrong((id *)&self->_notifyView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_replyButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_supplementaryServicesInfo, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionAction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
