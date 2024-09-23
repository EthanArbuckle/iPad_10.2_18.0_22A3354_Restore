@implementation HSPCCameraScanViewController

- (HSPCCameraScanViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCCameraScanViewController *v9;
  HSPCCameraScanViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HSPCCameraScanViewController;
  v9 = -[HSPCCameraScanViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinator, a3);
    objc_storeStrong((id *)&v10->_config, a4);
  }

  return v10;
}

- (void)setMode:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HSNFCManager *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;

  self->_mode = a3;
  if (a3 == 1)
  {
    v4 = HULocalizedString(CFSTR("HUAddAccessory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[HSPCCameraScanViewController setTitle:](self, "setTitle:", v5);

    v6 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryCameraScannerVCSubtitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[HSPCCameraScanViewController setSubtitle:](self, "setSubtitle:", v7);

    v8 = -[HSNFCManager initWithDelegate:]([HSNFCManager alloc], "initWithDelegate:", self);
    -[HSPCCameraScanViewController setNfcManager:](self, "setNfcManager:", v8);

    v9 = objc_alloc_init((Class)NAFuture);
    -[HSPCCameraScanViewController setNfcAvailableFuture:](self, "setNfcAvailableFuture:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController coordinator](self, "coordinator"));
    v11 = objc_msgSend(v10, "setupSpecificAccessory");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController nfcAvailableFuture](self, "nfcAvailableFuture"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError na_genericError](NSError, "na_genericError"));
      objc_msgSend(v12, "finishWithError:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController nfcManager](self, "nfcManager"));
    v23 = 0;
    v15 = objc_msgSend(v14, "readerSupportedWithError:", &v23);
    v16 = v23;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController nfcAvailableFuture](self, "nfcAvailableFuture"));
    v18 = v17;
    if (v15)
      objc_msgSend(v17, "finishWithNoResult");
    else
      objc_msgSend(v17, "finishWithError:", v16);

    -[HSPCCameraScanViewController addMoreOptionsButtonWithTarget:action:userInfo:](self, "addMoreOptionsButtonWithTarget:action:userInfo:", self, "_onMoreOptionsButton", &__NSDictionary0__struct);
  }
  else
  {
    v19 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCInstructionsCameraTitle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[HSPCCameraScanViewController setTitle:](self, "setTitle:", v20);

    v21 = HULocalizedString(CFSTR("HUProximityCardCameraScannerVCCameraOnlySubtitle"));
    v22 = (id)objc_claimAutoreleasedReturnValue(v21);
    -[HSPCCameraScanViewController setSubtitle:](self, "setSubtitle:", v22);

  }
}

- (void)configureNextViewController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = objc_opt_class(HSPCTroubleshootingTipsViewController, v4);
  v8 = v3;
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setPage:", 1);
}

- (void)_moveToNextViewController
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController commitConfiguration](self, "commitConfiguration"));
  -[HSPCCameraScanViewController handleButtonDirectiveFuture:](self, "handleButtonDirectiveFuture:", v3);

}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8BA8);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  HSCameraInstructionsView *v17;
  void *v18;
  HSCameraInstructionsView *v19;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  void *v41;
  _QWORD v42[4];
  _QWORD v43[4];

  v40.receiver = self;
  v40.super_class = (Class)HSPCCameraScanViewController;
  -[HSPCCameraScanViewController viewDidLoad](&v40, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainContentGuide"));

  v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HSPCCameraScanViewController setCameraContainerView:](self, "setCameraContainerView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setCornerRadius:", 14.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", v5);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v34));
  v43[0] = v32;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v43[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v39 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v43[2] = v13;
  v38 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 180.0));
  v43[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  if ((id)-[HSPCCameraScanViewController mode](self, "mode") == (id)1)
  {
    v17 = [HSCameraInstructionsView alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController nfcAvailableFuture](self, "nfcAvailableFuture"));
    v19 = -[HSCameraInstructionsView initWithNFCStartFuture:](v17, "initWithNFCStartFuture:", v18);

    -[HSCameraInstructionsView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HSPCCameraScanViewController setCameraInstructionsView:](self, "setCameraInstructionsView:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController contentView](self, "contentView"));
    objc_msgSend(v20, "addSubview:", v19);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView topAnchor](v19, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v21));
    v42[0] = v22;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView leadingAnchor](v19, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v35));
    v42[1] = v31;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView trailingAnchor](v19, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v42[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView bottomAnchor](v19, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    v42[3] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    v30 = v33;
  }
  else
  {
    v19 = (HSCameraInstructionsView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSCameraInstructionsView constraintEqualToAnchor:](v19, "constraintEqualToAnchor:", v30));
    v41 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCCameraScanViewController;
  -[HSPCCameraScanViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[HSPCCameraScanViewController _startReaders](self, "_startReaders");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCCameraScanViewController;
  -[HSPCCameraScanViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[HSPCCameraScanViewController _handleOverrideSetupCodeIfNeeded](self, "_handleOverrideSetupCodeIfNeeded");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSPCCameraScanViewController;
  -[HSPCCameraScanViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  -[HSPCCameraScanViewController _stopReaders](self, "_stopReaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController delayedSetupCodeHandler](self, "delayedSetupCodeHandler"));
  objc_msgSend(v4, "cancel");

}

- (void)_loadCameraReader
{
  uint64_t v3;
  NSObject *v4;
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
  unint64_t v16;
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
  double v29;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[16];
  _QWORD v50[4];
  _QWORD v51[2];

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading the CRCameraReader", buf, 2u);
  }

  v5 = objc_alloc_init((Class)CRCameraReader);
  -[HSPCCameraScanViewController setCameraReader:](self, "setCameraReader:", v5);

  v51[0] = CROutputTypeHomeKitCode;
  v51[1] = CROutputTypeQRCode;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v7, "setOutputObjectTypes:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v9, "willMoveToParentViewController:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  -[HSPCCameraScanViewController addChildViewController:](self, "addChildViewController:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v11, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v14, "didMoveToParentViewController:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v16 = (unint64_t)objc_msgSend(v15, "userInterfaceIdiom");

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
    objc_msgSend(v17, "toggleCamera");

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v50[0] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v50[1] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v20));
  v50[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v50[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  v29 = PRXProminentButtonCornerRadius;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layer"));
  objc_msgSend(v32, "setCornerRadius:", v29);

}

- (void)_unloadCameraReader
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
  void *v13;
  uint8_t v14[16];

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unloading the CRCameraReader", v14, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v8, "setDelegate:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v9, "willMoveToParentViewController:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v10, "removeFromParentViewController");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "removeFromSuperview");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v13, "didMoveToParentViewController:", 0);

  -[HSPCCameraScanViewController setCameraReader:](self, "setCameraReader:", 0);
  -[HSPCCameraScanViewController setCameraReaderIsRunning:](self, "setCameraReaderIsRunning:", 0);
}

- (void)_startReaders
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController nfcManager](self, "nfcManager"));
  v4 = objc_msgSend(v3, "start");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_cameraWasInterrupted:", AVCaptureSessionWasInterruptedNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  if (!v6)
    -[HSPCCameraScanViewController _loadCameraReader](self, "_loadCameraReader");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
  objc_msgSend(v7, "start");

  -[HSPCCameraScanViewController setCameraReaderIsRunning:](self, "setCameraReaderIsRunning:", 1);
}

- (void)_stopReaders
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController nfcManager](self, "nfcManager"));
  objc_msgSend(v3, "stop");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, AVCaptureSessionWasInterruptedNotification, 0);

  v5 = -[HSPCCameraScanViewController cameraReaderIsRunning](self, "cameraReaderIsRunning");
  v6 = HFLogForCategory(58);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "The camera view disappeared, but the camera is still running. Cancelling the cameraReader", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
    objc_msgSend(v9, "cancel");

  }
  else
  {
    if (v8)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "The camera view disappeared and the camera is not running. Removing it from the view hierarchy so it can be recreated if it's needed again", v10, 2u);
    }

    -[HSPCCameraScanViewController _unloadCameraReader](self, "_unloadCameraReader");
  }
}

- (void)_cameraWasInterrupted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AVCaptureSessionInterruptionReasonKey));

  }
  else
  {
    v7 = 0;
  }

  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notified that the camera was interrupted with reason: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v7 && objc_msgSend(v7, "intValue") == 4)
    -[HSPCCameraScanViewController _addInterruptionLabel](self, "_addInterruptionLabel");

}

- (void)_addInterruptionLabel
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  _QWORD v37[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)UILabel);
    -[HSPCCameraScanViewController setInterruptionLabel:](self, "setInterruptionLabel:", v4);

    v5 = sub_100005FEC();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v8, "setNumberOfLines:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v9, "setLineBreakMode:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v10, "setTextAlignment:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v12, "setTextColor:", v11);

    v13 = sub_1000593D8(CFSTR("HSSetupCodeInterruptionLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v16, "sizeToFit");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    objc_msgSend(v18, "addSubview:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "readableContentGuide"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
    v33 = v21;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
    v37[0] = v32;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v37[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController interruptionLabel](self, "interruptionLabel"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraContainerView](self, "cameraContainerView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    v37[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  }
}

- (void)_handleSetupCode:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v4 = a3;
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup code %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController delayedSetupCodeHandler](self, "delayedSetupCodeHandler"));
  objc_msgSend(v7, "cancel");

  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10005BBF4;
  v14 = &unk_1000A30A0;
  objc_copyWeak(&v16, (id *)buf);
  v9 = v4;
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "afterDelay:performBlock:", &v11, 0.5));
  -[HSPCCameraScanViewController setDelayedSetupCodeHandler:](self, "setDelayedSetupCodeHandler:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (void)_updatePairingErrorWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;

  v4 = a3;
  v5 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryHostVCUnsupportedSetupPayloadAlertTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryHostVCUnsupportedSetupPayloadAlertMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:title:description:](NSError, "hf_errorWithCode:title:description:", 62, v6, v8));

  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupCode"));
    v11 = HFLogForCategory(58);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupPayloadURL"));
      v33 = 138412546;
      v34 = v10;
      v35 = 2112;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "handleSetupAccessoryPayload:, code %@ url %@", (uint8_t *)&v33, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupPayloadURL"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController coordinator](self, "coordinator"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "discoveredAccessory"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController coordinator](self, "coordinator"));
      v18 = v17;
      if (v16)
        v19 = objc_msgSend(v17, "didReceiveSetupCode:fromViewController:", v10, self);
      else
        objc_msgSend(v17, "updateSetupAccessoryDescriptionWithPayload:", v4);
LABEL_22:

      goto LABEL_23;
    }
    v18 = objc_msgSend(objc_alloc((Class)HFSetupAccessoryResult), "initWithPayload:", v4);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "error"));
    if (v22)
    {
      v23 = (void *)v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "error"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "domain"));
      if ((objc_msgSend(v25, "isEqualToString:", HFErrorDomain) & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "error"));
        v27 = objc_msgSend(v26, "code");

        if (v27 == (id)22)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "error"));
          v29 = 1;
LABEL_17:
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController config](self, "config"));
          objc_msgSend(v30, "setPairingError:", v28);

          if (v29)
          v31 = HFLogForCategory(58);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_10006132C(v18, v32);

          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    v29 = 0;
    v28 = v9;
    goto LABEL_17;
  }
  v20 = HFLogForCategory(58);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "handleSetupAccessoryPayload: got nil payload.", (uint8_t *)&v33, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController config](self, "config"));
  objc_msgSend(v10, "setPairingError:", v9);
LABEL_23:

}

- (void)_handleSetupURLString:(id)a3 afterDelay:(double)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v6 = a3;
  v7 = HFLogForCategory(58);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received setup URL string: %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController delayedSetupCodeHandler](self, "delayedSetupCodeHandler"));
  objc_msgSend(v9, "cancel");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController coordinator](self, "coordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "discoveredAccessory"));
  objc_msgSend(v11, "setRawSetupPayloadString:", v6);

  objc_initWeak((id *)buf, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_10005C2A8;
  v18 = &unk_1000A3798;
  v13 = v6;
  v19 = v13;
  objc_copyWeak(&v20, (id *)buf);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "afterDelay:performBlock:", &v15, a4));
  -[HSPCCameraScanViewController setDelayedSetupCodeHandler:](self, "setDelayedSetupCodeHandler:", v14, v15, v16, v17, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)_handleOverrideSetupCodeIfNeeded
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  int v41;
  void *v42;

  v3 = HFForceCameraQRCodeURLString(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4)
  {
    v5 = HFLogForCategory(58);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      v9 = HFForceCameraQRCodeURLString(v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v41 = 138412290;
      v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "HFForceCameraQRCodeURLString is set to: %@", (uint8_t *)&v41, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController cameraReader](self, "cameraReader"));
    v13 = HFForceCameraQRCodeURLString(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[HSPCCameraScanViewController cameraReader:shouldReturnQRCode:](self, "cameraReader:shouldReturnQRCode:", v11, v14);

    v16 = HFLogForCategory(58);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v18)
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "The HFForceCameraQRCodeURLString was determined to not be a valid HomeKit QR code, so doing nothing", (uint8_t *)&v41, 2u);
      }
      goto LABEL_19;
    }
    if (v18)
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "The HFForceCameraQRCodeURLString was validated, so proceeding as if we had just scanned this a QR code with this payload.", (uint8_t *)&v41, 2u);
    }

    v21 = HFForceCameraQRCodeURLString(v19, v20);
    v17 = objc_claimAutoreleasedReturnValue(v21);
    v22 = 0.5;
  }
  else
  {
    v23 = HFForceCameraLegacyCodeURLString();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (v24)
    {
      v25 = HFLogForCategory(58);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        v29 = HFForceCameraQRCodeURLString(v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v41 = 138412290;
        v42 = v30;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "HFForceCameraLegacyCodeURLString is set to: %@, so proceeding as if we had just scanned this legacy code.", (uint8_t *)&v41, 0xCu);

      }
      v31 = HFForceCameraLegacyCodeURLString();
      v17 = objc_claimAutoreleasedReturnValue(v31);
      -[HSPCCameraScanViewController _handleSetupCode:](self, "_handleSetupCode:", v17);
      goto LABEL_19;
    }
    v32 = HFForceNFCURLString();
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    if (!v33)
      return;
    v34 = HFLogForCategory(58);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v36)
    {
      v38 = HFForceCameraQRCodeURLString(v36, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v41 = 138412290;
      v42 = v39;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "HFForceNFCURLString is set to: %@, so proceeding as if we had just scanned an NFC tag with this payload.", (uint8_t *)&v41, 0xCu);

    }
    v40 = HFForceNFCURLString();
    v17 = objc_claimAutoreleasedReturnValue(v40);
    v22 = 0.0;
  }
  -[HSPCCameraScanViewController _handleSetupURLString:afterDelay:](self, "_handleSetupURLString:afterDelay:", v17, v22);
LABEL_19:

}

- (BOOL)_isValidSetupPayloadURLString:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v21;
  id v22;

  v4 = a3;
  if (!v4)
  {
    v12 = HFLogForCategory(58);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v11 = "Read nil string";
      v13 = v10;
      v14 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v21, v14);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if ((+[HMAccessorySetupCoordinator isSetupPayloadURLString:](HMAccessorySetupCoordinator, "isSetupPayloadURLString:", v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCCameraScanViewController config](self, "config"));
    v6 = objc_msgSend(v5, "isSetupInitiatedByOtherMatterEcosystem");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:](HMAccessorySetupCoordinator, "communicationProtocolForSetupPayloadURLString:", v4));
      v8 = objc_msgSend(v7, "integerValue");

      if (v8 == (id)2)
      {
        v19 = HFLogForCategory(58);
        v10 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v4;
          v18 = "Read CHIP/Matter setup URL string in PEA setup: %@";
          goto LABEL_19;
        }
LABEL_20:
        v16 = 1;
        goto LABEL_21;
      }
      if (v8 == (id)1)
      {
        v9 = HFLogForCategory(58);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v4;
          v11 = "Read HAP setup URL string in PEA setup, ignoring %@";
LABEL_12:
          v13 = v10;
          v14 = 12;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    v17 = HFLogForCategory(58);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v4;
      v18 = "Read setup URL string: %@";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0xCu);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  v15 = HFLogForCategory(58);
  v10 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v4;
    v11 = "Read string that is not setup URL: %@";
    goto LABEL_12;
  }
LABEL_14:
  v16 = 0;
LABEL_21:

  return v16;
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cameraReader:%@ didFailWithError:%@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CC00;
  block[3] = &unk_1000A10A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)cameraReaderDidCancel:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cameraReaderDidCancel:%@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CDC0;
  block[3] = &unk_1000A10A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)cameraReaderDidEnd:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v5 = HFLogForCategory(58);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cameraReaderDidEnd:%@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CEE4;
  block[3] = &unk_1000A10A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HSPCCameraScanViewController *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cameraReader:%@ didRecognizeObjects:%@", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005D01C;
  v11[3] = &unk_1000A0F18;
  v12 = v7;
  v13 = self;
  v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

- (BOOL)cameraReader:(id)a3 shouldReturnQRCode:(id)a4
{
  return -[HSPCCameraScanViewController _isValidSetupPayloadURLString:](self, "_isValidSetupPayloadURLString:", a4);
}

- (BOOL)nfcManager:(id)a3 shouldReturnPayloadString:(id)a4
{
  return -[HSPCCameraScanViewController _isValidSetupPayloadURLString:](self, "_isValidSetupPayloadURLString:", a4);
}

- (void)nfcManager:(id)a3 didRecognizePayloadString:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  HSPCCameraScanViewController *v11;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D278;
  block[3] = &unk_1000A1558;
  v9 = a3;
  v10 = a4;
  v11 = self;
  v6 = v10;
  v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (UIView)cameraContainerView
{
  return self->_cameraContainerView;
}

- (void)setCameraContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraContainerView, a3);
}

- (HSNFCManager)nfcManager
{
  return self->_nfcManager;
}

- (void)setNfcManager:(id)a3
{
  objc_storeStrong((id *)&self->_nfcManager, a3);
}

- (NAFuture)nfcAvailableFuture
{
  return self->_nfcAvailableFuture;
}

- (void)setNfcAvailableFuture:(id)a3
{
  objc_storeStrong((id *)&self->_nfcAvailableFuture, a3);
}

- (UILabel)interruptionLabel
{
  return self->_interruptionLabel;
}

- (void)setInterruptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_interruptionLabel, a3);
}

- (NACancelable)delayedSetupCodeHandler
{
  return self->_delayedSetupCodeHandler;
}

- (void)setDelayedSetupCodeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_delayedSetupCodeHandler, a3);
}

- (HSCameraInstructionsView)cameraInstructionsView
{
  return self->_cameraInstructionsView;
}

- (void)setCameraInstructionsView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInstructionsView, a3);
}

- (CRCameraReader)cameraReader
{
  return self->_cameraReader;
}

- (void)setCameraReader:(id)a3
{
  objc_storeStrong((id *)&self->_cameraReader, a3);
}

- (BOOL)cameraReaderIsRunning
{
  return self->_cameraReaderIsRunning;
}

- (void)setCameraReaderIsRunning:(BOOL)a3
{
  self->_cameraReaderIsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraReader, 0);
  objc_storeStrong((id *)&self->_cameraInstructionsView, 0);
  objc_storeStrong((id *)&self->_delayedSetupCodeHandler, 0);
  objc_storeStrong((id *)&self->_interruptionLabel, 0);
  objc_storeStrong((id *)&self->_nfcAvailableFuture, 0);
  objc_storeStrong((id *)&self->_nfcManager, 0);
  objc_storeStrong((id *)&self->_cameraContainerView, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
