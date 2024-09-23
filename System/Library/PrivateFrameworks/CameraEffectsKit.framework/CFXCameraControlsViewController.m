@implementation CFXCameraControlsViewController

- (CFXCameraControlsViewController)init
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CFXCameraControlsViewController *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF6E00];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storyboardWithName:bundle:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "instantiateViewControllerWithIdentifier:", v4);
  v8 = (CFXCameraControlsViewController *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CFXCameraControlsViewController)initWithDelegate:(id)a3 captureMode:(int64_t)a4
{
  id v6;
  CFXCameraControlsViewController *v7;
  CFXCameraControlsViewController *v8;

  v6 = a3;
  v7 = -[CFXCameraControlsViewController init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_captureMode = a4;
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  id v7;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  uint64_t v26;
  int v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
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
  void *v49;
  void *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)CFXCameraControlsViewController;
  -[CFXCameraControlsViewController viewDidLoad](&v51, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cam_initialLayoutStyle");

  LODWORD(v5) = CFXCaptureCapabilitiesIsCTMSupported();
  v7 = objc_alloc(MEMORY[0x24BE14A40]);
  if ((_DWORD)v5)
  {
    v8 = (void *)objc_msgSend(v7, "initForOverContent");
    -[CFXCameraControlsViewController setEffectButton:](self, "setEffectButton:", v8);
  }
  else
  {
    v9 = (void *)objc_msgSend(v7, "initWithLayoutStyle:", v6);
    -[CFXCameraControlsViewController setEffectButton:](self, "setEffectButton:", v9);

    -[CFXCameraControlsViewController effectButton](self, "effectButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTappableEdgeInsets:", 20.0, 20.0, 20.0, 20.0);

    -[CFXCameraControlsViewController effectButton](self, "effectButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  }

  -[CFXCameraControlsViewController effectButton](self, "effectButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[CFXCameraControlsViewController effectButton](self, "effectButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_effectsButtonTapped_, 64);

  -[CFXCameraControlsViewController effectButton](self, "effectButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExclusiveTouch:", 1);

  objc_msgSend(MEMORY[0x24BE14AB0], "shutterButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCameraControlsViewController setShutterButton:](self, "setShutterButton:", v14);

  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, 80.0, 80.0);

  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel_shutterButtonTapped_, 64);

  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setExclusiveTouch:", 1);

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "userInterfaceIdiom"),
        v18,
        v19 == 1))
  {
    objc_msgSend(MEMORY[0x24BE14A60], "flipButtonOverContent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController setFlipButton:](self, "setFlipButton:", v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE14A60], "flipButtonWithLayoutStyle:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController setFlipButton:](self, "setFlipButton:", v21);

    -[CFXCameraControlsViewController flipButton](self, "flipButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, 60.0, 60.0);
  }

  -[CFXCameraControlsViewController flipButton](self, "flipButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_switchCameraButtonTapped_, 64);

  -[CFXCameraControlsViewController flipButton](self, "flipButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 1;
  objc_msgSend(v23, "setExclusiveTouch:", 1);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceIdiom");
  if (v26)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bounds");
    if ((uint64_t)v28 <= 811)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      v24 = (uint64_t)v29 < 812;
      v27 = 1;
    }
    else
    {
      v27 = 0;
      v24 = 0;
    }
  }
  -[CFXCameraControlsViewController bottomBlackView](self, "bottomBlackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", v24);

  if (v27)
  if (!v26)

  v31 = objc_alloc_init(MEMORY[0x24BE14A20]);
  -[CFXCameraControlsViewController setBottomBar:](self, "setBottomBar:", v31);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "userInterfaceIdiom");

  if (v33)
  {
    -[CFXCameraControlsViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v35);

    -[CFXCameraControlsViewController delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doneButtonForCameraControlsViewController:", self);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDoneButton:", v37);

    -[CFXCameraControlsViewController delegate](self, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "flashButtonForCameraControlsViewController:", self);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFlashButton:", v40);

    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setBackgroundStyle:", 1);
  }
  else
  {
    if (isStreamingMode(-[CFXCameraControlsViewController captureMode](self, "captureMode")))
    {
      -[CFXCameraControlsViewController backgroundView](self, "backgroundView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addSubview:", v43);
    }
    else
    {
      if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) != 0)
        goto LABEL_25;
      -[CFXCameraControlsViewController delegate](self, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "insertCamBottomBar:", v43);
    }

  }
LABEL_25:
  -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setLayoutStyle:", v6);

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    -[CFXCameraControlsViewController effectButton](self, "effectButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setCreativeCameraButton:", v45);

    -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setShutterButton:", v47);

    -[CFXCameraControlsViewController flipButton](self, "flipButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFlipButton:", v49);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  CFXFeedbackController *v6;
  void *v7;
  CFXFeedbackController *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CFXCameraControlsViewController;
  -[CFXCameraControlsViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  v4 = -[CFXCameraControlsViewController captureMode](self, "captureMode") == 2;
  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMode:animated:", v4, 0);

  v6 = [CFXFeedbackController alloc];
  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CFXFeedbackController initWithShutterButton:](v6, "initWithShutterButton:", v7);
  -[CFXCameraControlsViewController setFeedbackController:](self, "setFeedbackController:", v8);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_JFX_orientationMonitorInterfaceOrientationNotification_, CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CFXCameraControlsViewController;
  -[CFXCameraControlsViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {

  }
  else
  {
    -[CFXCameraControlsViewController appStripBackgroundView](self, "appStripBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      -[CFXCameraControlsViewController setAppStripBackgroundView:](self, "setAppStripBackgroundView:", v7);

      v8 = -[CFXCameraControlsViewController captureMode](self, "captureMode");
      if (v8)
      {
        -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "backgroundView");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "backgroundColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCameraControlsViewController appStripBackgroundView](self, "appStripBackgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v9);

      if (v8)
      {

        v9 = v6;
      }

      if (CFXCaptureCapabilitiesIsCTMSupported())
      {
        -[CFXCameraControlsViewController delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "needsBlackBackgroundForCTMControls"))
          objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        else
          objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXCameraControlsViewController appStripBackgroundView](self, "appStripBackgroundView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackgroundColor:", v12);

      }
      -[CFXCameraControlsViewController appStripBackgroundContainerView](self, "appStripBackgroundContainerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCameraControlsViewController appStripBackgroundView](self, "appStripBackgroundView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

      -[CFXCameraControlsViewController configureUIForOrientation](self, "configureUIForOrientation");
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXCameraControlsViewController;
  -[CFXCameraControlsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXCameraControlsViewController;
  -[CFXCameraControlsViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[CFXCameraControlsViewController configureUIForOrientation](self, "configureUIForOrientation");
}

- (void)configureUIForOrientation
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGFloat Width;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  unint64_t v38;
  double Height;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  float v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  id v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  if (-[CFXCameraControlsViewController captureMode](self, "captureMode") != 1)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (!v4)
    {
      +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      v14 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
      objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarFrameForReferenceBounds:", v7, v9, v11, v13);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      if (CFXCaptureCapabilitiesIsCTMSupported())
      {
        -[CFXCameraControlsViewController delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bottomBarCTMControlsFrameForWindowOrientation:bounds:", v14, v7, v9, v11, v13);
        v16 = v24;
        v18 = v25;
        v20 = v26;
        v22 = v27;

      }
      -[CFXCameraControlsViewController CFX_smallPhoneDockHeightAdjustment](self, "CFX_smallPhoneDockHeightAdjustment");
      v29 = v28;
      -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      Width = CGRectGetWidth(v66);

      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0.0;
      if (!objc_msgSend(v32, "userInterfaceIdiom"))
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "bounds");
        v33 = v29;
        if ((uint64_t)v35 != 568)
        {
          objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "bounds");
          if ((uint64_t)v37 == 568)
            v33 = v29;
          else
            v33 = 0.0;

        }
      }
      v38 = v14 - 3;

      v67.origin.x = v16;
      v67.origin.y = v18;
      v67.size.width = v20;
      v67.size.height = v22;
      Height = CGRectGetHeight(v67);
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v40, "userInterfaceIdiom"))
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bounds");
        v43 = v29;
        if ((uint64_t)v42 != 568)
        {
          objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "bounds");
          if ((uint64_t)v45 == 568)
            v43 = v29;
          else
            v43 = 0.0;

        }
        Height = Height - v43;

      }
      v46 = 0.0;
      if (-[CFXCameraControlsViewController dockIsMagnified](self, "dockIsMagnified"))
        v47 = -31.0;
      else
        v47 = 0.0;
      -[CFXCameraControlsViewController appStripBackgroundContainerViewTopConstraint](self, "appStripBackgroundContainerViewTopConstraint");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v48;
      if (v38 >= 2)
        *(float *)&v49 = 250.0;
      else
        *(float *)&v49 = 750.0;
      if (v38 >= 2)
        v51 = 750.0;
      else
        v51 = 250.0;
      objc_msgSend(v48, "setPriority:", v49);

      -[CFXCameraControlsViewController appStripBackgroundContainerViewHeightConstraint](self, "appStripBackgroundContainerViewHeightConstraint");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v53 = v51;
      objc_msgSend(v52, "setPriority:", v53);

      if (v14 == 1)
        v46 = -Height;
      -[CFXCameraControlsViewController appStripBackgroundContainerViewBottomConstraint](self, "appStripBackgroundContainerViewBottomConstraint");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setConstant:", v46);

      -[CFXCameraControlsViewController appStripBackgroundContainerViewLeadingConstraint](self, "appStripBackgroundContainerViewLeadingConstraint");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setConstant:", 0.0);

      -[CFXCameraControlsViewController appStripBackgroundContainerViewTrailingConstraint](self, "appStripBackgroundContainerViewTrailingConstraint");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setConstant:", 0.0);

      if (CFXCaptureCapabilitiesIsCTMSupported())
      {
        -[CFXCameraControlsViewController appStripBackgroundContainerViewLeadingConstraint](self, "appStripBackgroundContainerViewLeadingConstraint");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setActive:", 0);

        -[CFXCameraControlsViewController appStripBackgroundContainerViewTrailingConstraint](self, "appStripBackgroundContainerViewTrailingConstraint");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setActive:", 0);

      }
      if (v38 > 1)
      {
        -[CFXCameraControlsViewController appStripBackgroundContainerViewHeightConstraint](self, "appStripBackgroundContainerViewHeightConstraint");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setConstant:", v33);

        if (-[CFXCameraControlsViewController dockIsMagnified](self, "dockIsMagnified"))
          v33 = v33 + 31.0;
        v64 = 0.0;
        v29 = Width;
      }
      else
      {
        -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "frame");
        v33 = CGRectGetWidth(v68);

        if (v14 == 4)
        {
          -[CFXCameraControlsViewController appStripBackgroundContainerViewLeadingConstraint](self, "appStripBackgroundContainerViewLeadingConstraint");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          v62 = Height;
        }
        else
        {
          -[CFXCameraControlsViewController appStripBackgroundContainerViewTrailingConstraint](self, "appStripBackgroundContainerViewTrailingConstraint");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          v62 = -Height;
        }
        objc_msgSend(v60, "setConstant:", v62);

        v47 = 0.0;
        if (-[CFXCameraControlsViewController dockIsMagnified](self, "dockIsMagnified"))
        {
          v29 = v29 + 31.0;
          if (v14 == 3)
            v64 = -31.0;
          else
            v64 = 0.0;
        }
        else
        {
          v64 = 0.0;
        }
      }
      -[CFXCameraControlsViewController appStripBackgroundView](self, "appStripBackgroundView");
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setFrame:", v64, v47, v29, v33);

    }
  }
}

- (UIColor)backgroundColor
{
  void *v3;
  void *v4;

  -[CFXCameraControlsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCameraControlsViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CFXCameraControlsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (isStreamingMode(-[CFXCameraControlsViewController captureMode](self, "captureMode"))
    || (objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "userInterfaceIdiom"),
        v4,
        v5 == 1))
  {
    -[CFXCameraControlsViewController backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)updateUIForVideoRecording:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  v5 = (double)!a3;
  -[CFXCameraControlsViewController effectButton](self, "effectButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[CFXCameraControlsViewController flipButton](self, "flipButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (!v9)
  {
    -[CFXCameraControlsViewController bottomBar](self, "bottomBar");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundStyle:", v3);

  }
}

- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4
{
  id v6;

  -[CFXCameraControlsViewController setDockIsMagnified:](self, "setDockIsMagnified:", a3);
  -[CFXCameraControlsViewController setDockMagnifiedHeightDelta:](self, "setDockMagnifiedHeightDelta:", a4);
  -[CFXCameraControlsViewController configureUIForOrientation](self, "configureUIForOrientation");
  -[CFXCameraControlsViewController backgroundView](self, "backgroundView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)setShutterButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setShutterButtonAlpha:(double)a3
{
  id v4;

  -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (CAMBottomBar)bottomBar
{
  return self->_bottomBar;
}

- (void)effectsButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CFXCameraControlsViewController effectButton](self, "effectButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[CFXCameraControlsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CFXCameraControlsViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraControlsViewControllerEffectsButtonWasTapped:", self);

  }
}

- (void)shutterButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (!-[CFXCameraControlsViewController captureMode](self, "captureMode", a3))
    -[CFXCameraControlsViewController setShutterButtonEnabled:](self, "setShutterButtonEnabled:", 0);
  -[CFXCameraControlsViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CFXCameraControlsViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraControlsViewControllerShutterButtonWasTapped:", self);

    if (-[CFXCameraControlsViewController captureMode](self, "captureMode") == 2)
    {
      -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "mode");

      -[CFXCameraControlsViewController shutterButton](self, "shutterButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      if (v7 == 6)
        v9 = 1;
      else
        v9 = 6;
      objc_msgSend(v8, "setMode:animated:", v9, 1);

    }
  }
}

- (void)switchCameraButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[CFXCameraControlsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CFXCameraControlsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraControlsViewControllerSwitchCameraButtonWasTapped:", self);

  }
}

- (double)CFX_smallPhoneDockHeightAdjustment
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BE72D80], "cameraBottomBarFrameForReferenceBounds:", v4, v6, v8, v10);
  v12 = v11;
  objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarFrameForReferenceBounds:", v4, v6, v8, v10);
  return v12 - v13;
}

- (CAMCreativeCameraButton)effectButton
{
  return self->_effectButton;
}

- (void)setEffectButton:(id)a3
{
  objc_storeStrong((id *)&self->_effectButton, a3);
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
  objc_storeStrong((id *)&self->_flipButton, a3);
}

- (CFXCameraControlsViewControllerDelegate)delegate
{
  return (CFXCameraControlsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)appStripBackgroundView
{
  return self->_appStripBackgroundView;
}

- (void)setAppStripBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_appStripBackgroundView, a3);
}

- (UIView)backgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (UIView)effectButtonContainerPad
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_effectButtonContainerPad);
}

- (void)setEffectButtonContainerPad:(id)a3
{
  objc_storeWeak((id *)&self->_effectButtonContainerPad, a3);
}

- (UIView)shutterButtonContainerPad
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_shutterButtonContainerPad);
}

- (void)setShutterButtonContainerPad:(id)a3
{
  objc_storeWeak((id *)&self->_shutterButtonContainerPad, a3);
}

- (UIView)flipButtonContainerPad
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_flipButtonContainerPad);
}

- (void)setFlipButtonContainerPad:(id)a3
{
  objc_storeWeak((id *)&self->_flipButtonContainerPad, a3);
}

- (UIView)bottomBlackView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_bottomBlackView);
}

- (void)setBottomBlackView:(id)a3
{
  objc_storeWeak((id *)&self->_bottomBlackView, a3);
}

- (UIView)appStripBackgroundContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerView);
}

- (void)setAppStripBackgroundContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_appStripBackgroundContainerView, a3);
}

- (NSLayoutConstraint)backgroundViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_backgroundViewHeightConstraint);
}

- (void)setBackgroundViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundViewHeightConstraint, a3);
}

- (NSLayoutConstraint)bottomBlackViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomBlackViewHeightConstraint);
}

- (void)setBottomBlackViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomBlackViewHeightConstraint, a3);
}

- (NSLayoutConstraint)bottomBlackViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomBlackViewTopConstraint);
}

- (void)setBottomBlackViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomBlackViewTopConstraint, a3);
}

- (NSLayoutConstraint)bottomBlackViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomBlackViewWidthConstraint);
}

- (void)setBottomBlackViewWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomBlackViewWidthConstraint, a3);
}

- (NSLayoutConstraint)bottomBlackViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomBlackViewTrailingConstraint);
}

- (void)setBottomBlackViewTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomBlackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)appStripBackgroundContainerViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewTopConstraint);
}

- (void)setAppStripBackgroundContainerViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_appStripBackgroundContainerViewTopConstraint, a3);
}

- (NSLayoutConstraint)appStripBackgroundContainerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewBottomConstraint);
}

- (void)setAppStripBackgroundContainerViewBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_appStripBackgroundContainerViewBottomConstraint, a3);
}

- (NSLayoutConstraint)appStripBackgroundContainerViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewHeightConstraint);
}

- (void)setAppStripBackgroundContainerViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_appStripBackgroundContainerViewHeightConstraint, a3);
}

- (NSLayoutConstraint)appStripBackgroundContainerViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewLeadingConstraint);
}

- (void)setAppStripBackgroundContainerViewLeadingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_appStripBackgroundContainerViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)appStripBackgroundContainerViewTrailingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_appStripBackgroundContainerViewTrailingConstraint);
}

- (void)setAppStripBackgroundContainerViewTrailingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_appStripBackgroundContainerViewTrailingConstraint, a3);
}

- (CFXFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackController, a3);
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
}

- (void)setBottomBar:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBar, a3);
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)setShutterButton:(id)a3
{
  objc_storeStrong((id *)&self->_shutterButton, a3);
}

- (BOOL)dockIsMagnified
{
  return self->_dockIsMagnified;
}

- (void)setDockIsMagnified:(BOOL)a3
{
  self->_dockIsMagnified = a3;
}

- (double)dockMagnifiedHeightDelta
{
  return self->_dockMagnifiedHeightDelta;
}

- (void)setDockMagnifiedHeightDelta:(double)a3
{
  self->_dockMagnifiedHeightDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewHeightConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewBottomConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerViewTopConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewWidthConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewTopConstraint);
  objc_destroyWeak((id *)&self->_bottomBlackViewHeightConstraint);
  objc_destroyWeak((id *)&self->_backgroundViewHeightConstraint);
  objc_destroyWeak((id *)&self->_appStripBackgroundContainerView);
  objc_destroyWeak((id *)&self->_bottomBlackView);
  objc_destroyWeak((id *)&self->_flipButtonContainerPad);
  objc_destroyWeak((id *)&self->_shutterButtonContainerPad);
  objc_destroyWeak((id *)&self->_effectButtonContainerPad);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_appStripBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_effectButton, 0);
}

@end
