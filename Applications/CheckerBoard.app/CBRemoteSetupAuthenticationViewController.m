@implementation CBRemoteSetupAuthenticationViewController

- (CBRemoteSetupAuthenticationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  CBRemoteSetupAuthenticationViewController *v5;
  uint64_t v6;
  CBRemoteSetupManager *remoteSetupManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CBRemoteSetupAuthenticationViewController;
  v5 = -[CBRemoteSetupAuthenticationViewController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", a3, a4, a5);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[CBRemoteSetupManager sharedInstance](CBRemoteSetupManager, "sharedInstance"));
    remoteSetupManager = v5->_remoteSetupManager;
    v5->_remoteSetupManager = (CBRemoteSetupManager *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CBRemoteSetupAuthenticationViewController;
  -[CBRemoteSetupAuthenticationViewController viewDidLoad](&v3, "viewDidLoad");
  -[CBRemoteSetupAuthenticationViewController setupView](self, "setupView");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CBRemoteSetupAuthenticationViewController;
  -[CBRemoteSetupAuthenticationViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController remoteSetupManager](self, "remoteSetupManager"));
  v6 = objc_msgSend(v5, "setupState");

  if (v6 == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController remoteSetupManager](self, "remoteSetupManager"));
    objc_msgSend(v7, "restartRemoteSetupBroadcast");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CBRemoteSetupAuthenticationViewController;
  -[CBRemoteSetupAuthenticationViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if (-[CBRemoteSetupAuthenticationViewController passwordType](self, "passwordType") != 2
    && -[CBRemoteSetupAuthenticationViewController passwordType](self, "passwordType") != 8)
  {
    -[CBRemoteSetupAuthenticationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController remoteSetupManager](self, "remoteSetupManager"));
    objc_msgSend(v4, "setupFailed");

  }
}

- (void)setupView
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
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
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  double v48;
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
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD v118[5];
  id v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  _QWORD v122[13];
  _QWORD v123[4];

  -[CBRemoteSetupAuthenticationViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController headerView](self, "headerView"));
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setTitleHyphenationFactor:", v5);

  v6 = objc_alloc_init((Class)UIView);
  -[CBRemoteSetupAuthenticationViewController setContainerView:](self, "setContainerView:", v6);

  if (-[CBRemoteSetupAuthenticationViewController passwordType](self, "passwordType") == 2)
  {
    v7 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[CBRemoteSetupAuthenticationViewController setPinCodeLabel:](self, "setPinCodeLabel:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    objc_msgSend(v8, "setNumberOfLines:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    objc_msgSend(v10, "setFont:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    objc_msgSend(v11, "setTextAlignment:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    LODWORD(v14) = 1148846080;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 1, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pairingCode](self, "pairingCode"));
    objc_msgSend(v15, "setText:", v16);

  }
  else if (-[CBRemoteSetupAuthenticationViewController passwordType](self, "passwordType") == 8)
  {
    v17 = objc_msgSend(objc_alloc((Class)OBButtonTray), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[CBRemoteSetupAuthenticationViewController setButtonTray:](self, "setButtonTray:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v19, "setHidden:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    objc_msgSend(v20, "addSubview:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton"));
    -[CBRemoteSetupAuthenticationViewController setFallbackButton:](self, "setFallbackButton:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController fallbackButton](self, "fallbackButton"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REMOTE_SETUP_AUTH_FALLBACK_PIN"), &stru_1000769A0, 0));
    objc_msgSend(v23, "setTitle:forState:", v25, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController fallbackButton](self, "fallbackButton"));
    objc_msgSend(v26, "addTarget:action:forControlEvents:", self, "didTapFallbackButton", 64);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController fallbackButton](self, "fallbackButton"));
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController fallbackButton](self, "fallbackButton"));
    objc_msgSend(v28, "addButton:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pairingCode](self, "pairingCode"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dataUsingEncoding:", 1));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIQRCodeGenerator")));
    objc_msgSend(v32, "setValue:forKey:", v31, CFSTR("inputMessage"));
    memset(&v121, 0, sizeof(v121));
    CGAffineTransformMakeScale(&v121, 10.0, 10.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "outputImage"));
    v120 = v121;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageByApplyingTransform:", &v120));

    v35 = objc_msgSend(objc_alloc((Class)UIImage), "initWithCIImage:", v34);
    v36 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v35);
    -[CBRemoteSetupAuthenticationViewController setQrCodeView:](self, "setQrCodeView:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    objc_msgSend(v37, "setTag:", 1);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    objc_msgSend(v38, "setUserInteractionEnabled:", 0);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    objc_msgSend(v39, "setContentMode:", 1);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  else
  {
    v41 = CheckerBoardLogHandleForCategory(1);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_100045568(self, v42);

  }
  objc_initWeak((id *)&v121, self);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_10001C7BC;
  v118[3] = &unk_100075B90;
  objc_copyWeak(&v119, (id *)&v121);
  v118[4] = self;
  -[CBRemoteSetupAuthenticationViewController addContentSubView:heightConstraintForLayout:](self, "addContentSubView:heightConstraintForLayout:", v43, v118);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v45 = objc_msgSend(v44, "userInterfaceIdiom");

  if (-[CBRemoteSetupAuthenticationViewController passwordType](self, "passwordType") == 2)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    objc_msgSend(v46, "addSubview:", v47);

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "leadingAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "leadingAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v114));
    v123[0] = v113;
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
    v123[1] = v108;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "lastBaselineAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "topAnchor"));
    v48 = 96.0;
    if (v45 == (id)1)
      v48 = 106.0;
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, v48));
    v123[2] = v103;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "bottomAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController pinCodeLabel](self, "pinCodeLabel"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "bottomAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintGreaterThanOrEqualToAnchor:", v99));
    v123[3] = v98;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v97);
    goto LABEL_14;
  }
  if (-[CBRemoteSetupAuthenticationViewController passwordType](self, "passwordType") == 8)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    objc_msgSend(v49, "addSubview:", v50);

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "bottomAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "bottomAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:constant:", v114, 0.0));
    v122[0] = v113;
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "leadingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "leadingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:constant:", v109, 0.0));
    v122[1] = v108;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "trailingAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "trailingAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, 0.0));
    v122[2] = v103;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "centerXAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "centerXAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
    v122[3] = v98;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController fallbackButton](self, "fallbackButton"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "centerXAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "centerXAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v94));
    v122[4] = v93;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController fallbackButton](self, "fallbackButton"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "bottomAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "bottomAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v89));
    v122[5] = v88;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "leadingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v84));
    v122[6] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "trailingAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v79));
    v122[7] = v78;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "topAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
    v122[8] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "centerXAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "centerXAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
    v122[9] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "widthAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "widthAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
    v122[10] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController buttonTray](self, "buttonTray"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v52));
    v122[11] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController qrCodeView](self, "qrCodeView"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "heightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController containerView](self, "containerView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v57));
    v122[12] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v122, 13));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v59);

LABEL_14:
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController view](self, "view"));
  objc_msgSend(v60, "layoutIfNeeded");

  objc_destroyWeak(&v119);
  objc_destroyWeak((id *)&v121);
}

- (void)didTapFallbackButton
{
  id v3;

  -[CBRemoteSetupAuthenticationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CBRemoteSetupAuthenticationViewController remoteSetupManager](self, "remoteSetupManager"));
  objc_msgSend(v3, "changeDesiredAuthType:", 2);

}

- (NSString)pairingCode
{
  return self->_pairingCode;
}

- (void)setPairingCode:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCode, a3);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (CBRemoteSetupManager)remoteSetupManager
{
  return self->_remoteSetupManager;
}

- (void)setRemoteSetupManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSetupManager, a3);
}

- (OBButtonTray)buttonTray
{
  return self->_buttonTray;
}

- (void)setButtonTray:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTray, a3);
}

- (OBTrayButton)fallbackButton
{
  return self->_fallbackButton;
}

- (void)setFallbackButton:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackButton, a3);
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeLabel, a3);
}

- (UIImageView)qrCodeView
{
  return self->_qrCodeView;
}

- (void)setQrCodeView:(id)a3
{
  objc_storeStrong((id *)&self->_qrCodeView, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_qrCodeView, 0);
  objc_storeStrong((id *)&self->_pinCodeLabel, 0);
  objc_storeStrong((id *)&self->_fallbackButton, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_remoteSetupManager, 0);
  objc_storeStrong((id *)&self->_pairingCode, 0);
}

@end
