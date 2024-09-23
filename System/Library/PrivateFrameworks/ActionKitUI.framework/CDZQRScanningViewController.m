@implementation CDZQRScanningViewController

- (CDZQRScanningViewController)initWithMetadataObjectTypes:(id)a3
{
  id v4;
  CDZQRScanningViewController *v5;
  CDZQRScanningViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat height;
  double MidX;
  double v12;
  double v13;
  double MidY;
  double v15;
  void *v16;
  UIButton *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  UIButton *torchButton;
  UIButton *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CDZQRScanningViewController *v34;
  objc_super v36;
  CGSize v37;
  CGRect v38;
  CGRect v39;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CDZQRScanningViewController;
  v5 = -[CDZQRScanningViewController init](&v36, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CDZQRScanningViewController setMetadataObjectTypes:](v5, "setMetadataObjectTypes:", v4);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Scan QR Code"), &stru_24E343BE0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDZQRScanningViewController setTitle:](v6, "setTitle:", v8);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("bolt.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    height = v37.height;
    v37.width = 18.0;
    UIGraphicsBeginImageContextWithOptions(v37, 0, 0.0);
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.width = 18.0;
    v38.size.height = height;
    MidX = CGRectGetMidX(v38);
    objc_msgSend(v9, "size");
    v13 = MidX - v12 * 0.5;
    v39.origin.x = 0.0;
    v39.origin.y = 0.0;
    v39.size.width = 18.0;
    v39.size.height = height;
    MidY = CGRectGetMidY(v39);
    objc_msgSend(v9, "size");
    objc_msgSend(v9, "drawAtPoint:", v13, MidY - v15 * 0.5);
    UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v17, "setImage:forState:", v16, 0);
    -[UIButton addTarget:action:forControlEvents:](v17, "addTarget:action:forControlEvents:", v6, sel_toggleTorch_, 64);
    objc_msgSend(v16, "size");
    v19 = v18;
    objc_msgSend(v16, "size");
    -[UIButton setFrame:](v17, "setFrame:", 0.0, 0.0, v19, v20);
    WFLocalizedString(CFSTR("Flash"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityLabel:](v17, "setAccessibilityLabel:", v21);

    torchButton = v6->_torchButton;
    v6->_torchButton = v17;
    v23 = v17;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v23);
    -[CDZQRScanningViewController navigationItem](v6, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItem:", v24);

    v26 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v26, "setHidden:", 1);
    objc_msgSend(v26, "setTextAlignment:", 1);
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v27);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v28);

    objc_storeWeak((id *)&v6->_cameraUnavailableLabel, v26);
    -[CDZQRScanningViewController view](v6, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v26);

    _NSDictionaryOfVariableBindings(CFSTR("unavailableLabel"), v26, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[unavailableLabel]|"), 0, 0, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v32);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[unavailableLabel]|"), 0, 0, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v33);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v31);
    v34 = v6;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CDZQRScanningViewController setAvSession:](self, "setAvSession:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CDZQRScanningViewController;
  -[CDZQRScanningViewController dealloc](&v3, sel_dealloc);
}

- (void)setAvSession:(id)a3
{
  AVCaptureSession **p_avSession;
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
  id v18;

  v18 = a3;
  p_avSession = &self->_avSession;
  if (self->_avSession)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionRuntimeErrorNotification();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, v7, *p_avSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionWasInterruptedNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v9, *p_avSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionInterruptionEndedNotification();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, v11, *p_avSession);

  }
  objc_storeStrong((id *)&self->_avSession, a3);
  if (*p_avSession)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionRuntimeErrorNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_sessionRuntimeError_, v13, *p_avSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionWasInterruptedNotification();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_sessionWasInterrupted_, v15, *p_avSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    getAVCaptureSessionInterruptionEndedNotification();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_sessionInterruptionEnded_, v17, *p_avSession);

  }
}

- (CDZQRScanningViewController)init
{
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CDZQRScanningViewController *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v3 = (id *)getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5322;
  v15 = getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5322;
  if (!getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5322)
  {
    v4 = AVFoundationLibrary_5304();
    v3 = (id *)dlsym(v4, "AVMetadataObjectTypeQRCode");
    v13[3] = (uint64_t)v3;
    getAVMetadataObjectTypeQRCodeSymbolLoc_ptr_5322 = (uint64_t)v3;
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeQRCode(void)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("CDZQRScanningViewController.m"), 35, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v16[0] = *v3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = v16[0];
  objc_msgSend(v5, "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CDZQRScanningViewController initWithMetadataObjectTypes:](self, "initWithMetadataObjectTypes:", v7);
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDZQRScanningViewController;
  -[CDZQRScanningViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDZQRScanningViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[5];
  _QWORD v41[4];
  id v42;
  objc_super v43;
  id location;
  uint64_t p_location;
  uint64_t v46;
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v43.receiver = self;
  v43.super_class = (Class)CDZQRScanningViewController;
  -[CDZQRScanningViewController viewWillAppear:](&v43, sel_viewWillAppear_, a3);
  -[CDZQRScanningViewController cancelBlock](self, "cancelBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelItemSelected_);
    -[CDZQRScanningViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  }
  else
  {
    -[CDZQRScanningViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeftBarButtonItem:", 0);
  }

  -[CDZQRScanningViewController setLastCapturedString:](self, "setLastCapturedString:", 0);
  -[CDZQRScanningViewController cancelBlock](self, "cancelBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = (void *)v7;
    -[CDZQRScanningViewController errorBlock](self, "errorBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_initWeak(&location, self);
      v41[0] = v8;
      v41[1] = 3221225472;
      v41[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke;
      v41[3] = &unk_24E343930;
      objc_copyWeak(&v42, &location);
      -[CDZQRScanningViewController setErrorBlock:](self, "setErrorBlock:", v41);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v11 = (void *)getAVCaptureSessionClass_softClass_5312;
  v52 = getAVCaptureSessionClass_softClass_5312;
  if (!getAVCaptureSessionClass_softClass_5312)
  {
    location = v8;
    p_location = 3221225472;
    v46 = (uint64_t)__getAVCaptureSessionClass_block_invoke_5313;
    v47 = &unk_24E343A50;
    v48 = &v49;
    __getAVCaptureSessionClass_block_invoke_5313((uint64_t)&location);
    v11 = (void *)v50[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v49, 8);
  v13 = objc_alloc_init(v12);
  -[CDZQRScanningViewController setAvSession:](self, "setAvSession:", v13);

  dispatch_get_global_queue(-32768, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_24E343958;
  block[4] = self;
  dispatch_async(v14, block);

  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v15 = (void *)getAVCaptureVideoPreviewLayerClass_softClass;
  v52 = getAVCaptureVideoPreviewLayerClass_softClass;
  if (!getAVCaptureVideoPreviewLayerClass_softClass)
  {
    location = v8;
    p_location = 3221225472;
    v46 = (uint64_t)__getAVCaptureVideoPreviewLayerClass_block_invoke;
    v47 = &unk_24E343A50;
    v48 = &v49;
    __getAVCaptureVideoPreviewLayerClass_block_invoke((uint64_t)&location);
    v15 = (void *)v50[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v49, 8);
  -[CDZQRScanningViewController avSession](self, "avSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layerWithSession:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDZQRScanningViewController setPreviewLayer:](self, "setPreviewLayer:", v18);

  location = 0;
  p_location = (uint64_t)&location;
  v46 = 0x2020000000;
  v19 = (id *)getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
  v47 = (void *)getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr;
  if (!getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr)
  {
    v20 = AVFoundationLibrary_5304();
    v19 = (id *)dlsym(v20, "AVLayerVideoGravityResizeAspectFill");
    *(_QWORD *)(p_location + 24) = v19;
    getAVLayerVideoGravityResizeAspectFillSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&location, 8);
  if (v19)
  {
    v21 = *v19;
    -[CDZQRScanningViewController previewLayer](self, "previewLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setVideoGravity:", v21);

    -[CDZQRScanningViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CDZQRScanningViewController previewLayer](self, "previewLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    -[CDZQRScanningViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDZQRScanningViewController previewLayer](self, "previewLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "insertSublayer:atIndex:", v35, 0);

    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleFocusTap_);
    -[CDZQRScanningViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addGestureRecognizer:", v36);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVLayerVideoGravity getAVLayerVideoGravityResizeAspectFill(void)");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("CDZQRScanningViewController.m"), 37, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDZQRScanningViewController;
  -[CDZQRScanningViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CDZQRScanningViewController previewLayer](self, "previewLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[CDZQRScanningViewController setPreviewLayer:](self, "setPreviewLayer:", 0);
  -[CDZQRScanningViewController avSession](self, "avSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRunning");

  -[CDZQRScanningViewController setAvSession:](self, "setAvSession:", 0);
  -[CDZQRScanningViewController setCaptureDevice:](self, "setCaptureDevice:", 0);
}

- (void)viewDidLayoutSubviews
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
  void *v12;
  double MidX;
  double MidY;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v23.receiver = self;
  v23.super_class = (Class)CDZQRScanningViewController;
  -[CDZQRScanningViewController viewDidLayoutSubviews](&v23, sel_viewDidLayoutSubviews);
  -[CDZQRScanningViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CDZQRScanningViewController previewLayer](self, "previewLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", v5, v7, v9, v11);

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  MidY = CGRectGetMidY(v25);
  -[CDZQRScanningViewController previewLayer](self, "previewLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPosition:", MidX, MidY);

  -[CDZQRScanningViewController previewLayer](self, "previewLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isVideoOrientationSupported");

  if (v18)
  {
    v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD3C8], "performSelector:", sel_sharedApplication), "statusBarOrientation");
    if ((unint64_t)(v19 - 2) >= 3)
      v20 = 1;
    else
      v20 = v19;
    -[CDZQRScanningViewController previewLayer](self, "previewLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setVideoOrientation:", v20);

  }
}

- (void)cancelItemSelected:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  -[CDZQRScanningViewController avSession](self, "avSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopRunning");

  -[CDZQRScanningViewController cancelBlock](self, "cancelBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CDZQRScanningViewController cancelBlock](self, "cancelBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void)toggleTorch:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[CDZQRScanningViewController captureDevice](self, "captureDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTorchActive");

  if (v5)
  {
    -[CDZQRScanningViewController turnTorchOff](self, "turnTorchOff");
    -[CDZQRScanningViewController torchButton](self, "torchButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 0;
  }
  else
  {
    -[CDZQRScanningViewController turnTorchOn](self, "turnTorchOn");
    -[CDZQRScanningViewController torchButton](self, "torchButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 1;
  }
  objc_msgSend(v6, "setSelected:", v7);

}

- (void)handleFocusTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v4 = a3;
  -[CDZQRScanningViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CDZQRScanningViewController previewLayer](self, "previewLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "captureDevicePointOfInterestForPoint:", v7, v9);
  v12 = v11;
  v14 = v13;

  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  LODWORD(v5) = objc_msgSend(v15, "lockForConfiguration:", &v18);
  v16 = v18;
  v17 = v16;
  if ((_DWORD)v5)
  {
    if (objc_msgSend(v15, "isFocusPointOfInterestSupported")
      && objc_msgSend(v15, "isFocusModeSupported:", 1))
    {
      objc_msgSend(v15, "setFocusMode:", 1);
      objc_msgSend(v15, "setFocusPointOfInterest:", v12, v14);
    }
    if (objc_msgSend(v15, "isExposurePointOfInterestSupported")
      && objc_msgSend(v15, "isExposureModeSupported:", 1))
    {
      objc_msgSend(v15, "setExposureMode:", 1);
      objc_msgSend(v15, "setExposurePointOfInterest:", v12, v14);
    }
    objc_msgSend(v15, "unlockForConfiguration");
  }
  else
  {
    NSLog(CFSTR("Capture device configuration error: %@"), v16);
  }

}

- (void)turnTorchOn
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  id v9;

  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "hasTorch"))
    goto LABEL_8;
  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTorchAvailable") & 1) == 0)
    goto LABEL_7;
  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTorchModeSupported:", 1) & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lockForConfiguration:", 0);

  if (!v6)
    return;
  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0.25;
  objc_msgSend(v7, "setTorchModeOnWithLevel:error:", 0, v8);

  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlockForConfiguration");
LABEL_8:

}

- (void)turnTorchOff
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[CDZQRScanningViewController captureDevice](self, "captureDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasTorch"))
  {
    -[CDZQRScanningViewController captureDevice](self, "captureDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isTorchModeSupported:", 0) & 1) != 0)
    {
      -[CDZQRScanningViewController captureDevice](self, "captureDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "lockForConfiguration:", 0);

      if (!v5)
        return;
      -[CDZQRScanningViewController captureDevice](self, "captureDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTorchMode:", 0);

      -[CDZQRScanningViewController captureDevice](self, "captureDevice");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unlockForConfiguration");
    }
    else
    {

    }
  }

}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  char v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
      -[CDZQRScanningViewController metadataObjectTypes](self, "metadataObjectTypes", (_QWORD)v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObject:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v7 = v10;
    objc_msgSend(v7, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CDZQRScanningViewController lastCapturedString](self, "lastCapturedString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v14);

      if ((v17 & 1) == 0)
      {
        -[CDZQRScanningViewController setLastCapturedString:](self, "setLastCapturedString:", v14);
        -[CDZQRScanningViewController avSession](self, "avSession");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stopRunning");

        -[CDZQRScanningViewController resultBlock](self, "resultBlock");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[CDZQRScanningViewController resultBlock](self, "resultBlock");
          v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v15)[2](v15, v7);
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
    v15 = (void (**)(_QWORD, _QWORD))v6;
LABEL_14:

  }
}

- (void)sessionRuntimeError:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v6 = (_QWORD *)getAVCaptureSessionErrorKeySymbolLoc_ptr;
  v16 = getAVCaptureSessionErrorKeySymbolLoc_ptr;
  if (!getAVCaptureSessionErrorKeySymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary_5304();
    v6 = dlsym(v7, "AVCaptureSessionErrorKey");
    v14[3] = (uint64_t)v6;
    getAVCaptureSessionErrorKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v13, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CDZQRScanningViewController errorBlock](self, "errorBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CDZQRScanningViewController errorBlock](self, "errorBlock");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v8);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVCaptureSessionErrorKey(void)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("CDZQRScanningViewController.m"), 38, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v6 = (_QWORD *)getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr;
  v20 = getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr;
  if (!getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary_5304();
    v6 = dlsym(v7, "AVCaptureSessionInterruptionReasonKey");
    v18[3] = (uint64_t)v6;
    getAVCaptureSessionInterruptionReasonKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v17, 8);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (v9 == 4)
      v10 = CFSTR("Camera Unavailable in Multitasking");
    else
      v10 = CFSTR("Camera Unavailable");
    -[CDZQRScanningViewController cameraUnavailableLabel](self, "cameraUnavailableLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[CDZQRScanningViewController cameraUnavailableLabel](self, "cameraUnavailableLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);

    -[CDZQRScanningViewController cameraUnavailableLabel](self, "cameraUnavailableLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__CDZQRScanningViewController_sessionWasInterrupted___block_invoke;
    v16[3] = &unk_24E343958;
    v16[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v16, 0.25);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVCaptureSessionInterruptionReasonKey(void)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("CDZQRScanningViewController.m"), 39, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  void *v4;
  char v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[CDZQRScanningViewController cameraUnavailableLabel](self, "cameraUnavailableLabel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    v6[4] = self;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke;
    v7[3] = &unk_24E343958;
    v7[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke_2;
    v6[3] = &unk_24E343980;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v7, v6, 0.25);
  }
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (NSArray)metadataObjectTypes
{
  return self->_metadataObjectTypes;
}

- (void)setMetadataObjectTypes:(id)a3
{
  objc_storeStrong((id *)&self->_metadataObjectTypes, a3);
}

- (AVCaptureSession)avSession
{
  return self->_avSession;
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_captureDevice, a3);
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewLayer, a3);
}

- (UIButton)torchButton
{
  return self->_torchButton;
}

- (void)setTorchButton:(id)a3
{
  objc_storeStrong((id *)&self->_torchButton, a3);
}

- (UILabel)cameraUnavailableLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_cameraUnavailableLabel);
}

- (void)setCameraUnavailableLabel:(id)a3
{
  objc_storeWeak((id *)&self->_cameraUnavailableLabel, a3);
}

- (NSString)lastCapturedString
{
  return self->_lastCapturedString;
}

- (void)setLastCapturedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCapturedString, 0);
  objc_destroyWeak((id *)&self->_cameraUnavailableLabel);
  objc_storeStrong((id *)&self->_torchButton, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_avSession, 0);
  objc_storeStrong((id *)&self->_metadataObjectTypes, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

void __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cameraUnavailableLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setOpacity:", v3);

}

void __56__CDZQRScanningViewController_sessionInterruptionEnded___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cameraUnavailableLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

void __53__CDZQRScanningViewController_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cameraUnavailableLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0.5;
  objc_msgSend(v4, "setOpacity:", v3);

}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void (**v3)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancelBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "avSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopRunning");

    objc_msgSend(WeakRetained, "cancelBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  char v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD block[5];
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  v55 = &v54;
  v56 = 0x2050000000;
  v2 = (void *)getAVCaptureDeviceClass_softClass;
  v57 = getAVCaptureDeviceClass_softClass;
  if (!getAVCaptureDeviceClass_softClass)
  {
    v49 = MEMORY[0x24BDAC760];
    v50 = 3221225472;
    v51 = (uint64_t)__getAVCaptureDeviceClass_block_invoke;
    v52 = &unk_24E343A50;
    v53 = &v54;
    __getAVCaptureDeviceClass_block_invoke((uint64_t)&v49);
    v2 = (void *)v55[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v54, 8);
  v49 = 0;
  v50 = (uint64_t)&v49;
  v51 = 0x2020000000;
  v4 = (id *)getAVMediaTypeVideoSymbolLoc_ptr_5315;
  v52 = (void *)getAVMediaTypeVideoSymbolLoc_ptr_5315;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_5315)
  {
    v5 = AVFoundationLibrary_5304();
    v4 = (id *)dlsym(v5, "AVMediaTypeVideo");
    *(_QWORD *)(v50 + 24) = v4;
    getAVMediaTypeVideoSymbolLoc_ptr_5315 = (uint64_t)v4;
  }
  _Block_object_dispose(&v49, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("CDZQRScanningViewController.m"), 36, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v6 = *v4;
  objc_msgSend(v3, "defaultDeviceWithMediaType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCaptureDevice:", v7);

  objc_msgSend(*(id *)(a1 + 32), "captureDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isLowLightBoostSupported"))
  {
    objc_msgSend(*(id *)(a1 + 32), "captureDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "lockForConfiguration:", 0);

    if (!v10)
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 32), "captureDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutomaticallyEnablesLowLightBoostWhenAvailable:", 1);

    objc_msgSend(*(id *)(a1 + 32), "captureDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlockForConfiguration");
  }

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "avSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginConfiguration");

  v54 = 0;
  v55 = &v54;
  v56 = 0x2050000000;
  v13 = (void *)getAVCaptureDeviceInputClass_softClass_5317;
  v57 = getAVCaptureDeviceInputClass_softClass_5317;
  if (!getAVCaptureDeviceInputClass_softClass_5317)
  {
    v49 = MEMORY[0x24BDAC760];
    v50 = 3221225472;
    v51 = (uint64_t)__getAVCaptureDeviceInputClass_block_invoke_5318;
    v52 = &unk_24E343A50;
    v53 = &v54;
    __getAVCaptureDeviceInputClass_block_invoke_5318((uint64_t)&v49);
    v13 = (void *)v55[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v54, 8);
  objc_msgSend(*(id *)(a1 + 32), "captureDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v14, "deviceInputWithDevice:error:", v15, &v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v48;

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "avSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addInput:", v16);

    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v18 = (void *)getAVCaptureMetadataOutputClass_softClass;
    v57 = getAVCaptureMetadataOutputClass_softClass;
    if (!getAVCaptureMetadataOutputClass_softClass)
    {
      v49 = MEMORY[0x24BDAC760];
      v50 = 3221225472;
      v51 = (uint64_t)__getAVCaptureMetadataOutputClass_block_invoke;
      v52 = &unk_24E343A50;
      v53 = &v54;
      __getAVCaptureMetadataOutputClass_block_invoke((uint64_t)&v49);
      v18 = (void *)v55[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v54, 8);
    v20 = objc_alloc_init(v19);
    objc_msgSend(*(id *)(a1 + 32), "avSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addOutput:", v20);

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "metadataObjectTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v43 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v20, "availableMetadataObjectTypes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "containsObject:", v26);

          if ((v28 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "errorBlock");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              v41[0] = MEMORY[0x24BDAC760];
              v41[1] = 3221225472;
              v41[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_4;
              v41[3] = &unk_24E3439C0;
              v41[4] = *(_QWORD *)(a1 + 32);
              v41[5] = v26;
              dispatch_async(MEMORY[0x24BDAC9B8], v41);
            }

            goto LABEL_27;
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        if (v23)
          continue;
        break;
      }
    }

    v30 = *(void **)(a1 + 32);
    v29 = (id *)(a1 + 32);
    objc_msgSend(v30, "metadataObjectTypes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMetadataObjectTypes:", v31);

    objc_msgSend(v20, "setMetadataObjectsDelegate:queue:", *v29, MEMORY[0x24BDAC9B8]);
    objc_msgSend(*v29, "avSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "commitConfiguration");

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_5;
    block[3] = &unk_24E343958;
    block[4] = *v29;
    v33 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

LABEL_27:
  }
  else
  {
    NSLog(CFSTR("QRScanningViewController: Error getting input device: %@"), v39);
    objc_msgSend(*(id *)(a1 + 32), "avSession");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "commitConfiguration");

    objc_msgSend(*(id *)(a1 + 32), "errorBlock");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __46__CDZQRScanningViewController_viewWillAppear___block_invoke_3;
      v46[3] = &unk_24E3439C0;
      v46[4] = *(_QWORD *)(a1 + 32);
      v47 = v39;
      dispatch_async(MEMORY[0x24BDAC9B8], v46);

    }
  }

}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "avSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRunning");

  objc_msgSend(*(id *)(a1 + 32), "errorBlock");
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(a1 + 40));

}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "avSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRunning");

  objc_msgSend(*(id *)(a1 + 32), "errorBlock");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to scan object of type %@"), *(_QWORD *)(a1 + 40), *MEMORY[0x24BDD0FC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.cdzombak.qrscanningviewcontroller"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v7);

}

void __46__CDZQRScanningViewController_viewWillAppear___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "previewLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVideoOrientationSupported");

  if (v4)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD3C8], "performSelector:", sel_sharedApplication), "statusBarOrientation");
    if ((unint64_t)(v5 - 2) >= 3)
      v6 = 1;
    else
      v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "previewLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVideoOrientation:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "avSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startRunning");

}

@end
