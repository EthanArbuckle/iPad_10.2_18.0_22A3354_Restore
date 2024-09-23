@implementation CFXCaptureViewController

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  int IsCTMSupported;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  dispatch_group_t v60;
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
  double v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL8 v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  __int128 v87;
  uint64_t v88;
  JFXPassThroughContainerView *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _OWORD v111[3];
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  objc_super v115;

  v115.receiver = self;
  v115.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController viewDidLoad](&v115, sel_viewDidLoad);
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[CFXCaptureViewController setZoomControlFrame:](self, "setZoomControlFrame:", *MEMORY[0x24BDBF090], v4, v5, v6);
  -[CFXCaptureViewController setZoomSliderFrame:](self, "setZoomSliderFrame:", v3, v4, v5, v6);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    if ((uint64_t)v12 <= 811)
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v10 = (uint64_t)v14 > 811;

    }
    else
    {
      v10 = 1;
    }

  }
  IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
  -[CFXCaptureViewController setIsShowingAnimojiReticle:](self, "setIsShowingAnimojiReticle:", 0);
  -[CFXCaptureViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[CFXCaptureViewController setObservingOrientationChanges:](self, "setObservingOrientationChanges:", 0);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "cam_initialLayoutStyle");

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE14A58]), "initWithLayoutStyle:", v18);
  -[CFXCaptureViewController setFlashButton:](self, "setFlashButton:", v19);

  -[CFXCaptureViewController flashButton](self, "flashButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsAutomaticFlash:", 1);

  -[CFXCaptureViewController flashButton](self, "flashButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reloadData");

  -[CFXCaptureViewController flashButton](self, "flashButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_flashModeDidChange, 4096);

  -[CFXCaptureViewController flashButton](self, "flashButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFlashMode:", 2);

  -[CFXCaptureViewController flashButton](self, "flashButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setExclusiveTouch:", 1);

  if ((IsCTMSupported & 1) != 0)
  {
    v25 = objc_alloc_init(MEMORY[0x24BE14A50]);
    -[CFXCaptureViewController setElapsedTimeView:](self, "setElapsedTimeView:", v25);

    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBackgroundStyle:animated:", 3, 0);

    objc_msgSend(MEMORY[0x24BE72D78], "doneButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController setDoneButton:](self, "setDoneButton:", v27);

    -[CFXCaptureViewController doneButton](self, "doneButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_doneButtonTapped_, 64);
  }
  else
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE14A50]), "initWithLayoutStyle:", v18);
    -[CFXCaptureViewController setElapsedTimeView:](self, "setElapsedTimeView:", v29);

    objc_msgSend(MEMORY[0x24BE72D78], "doneButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController setDoneButton:](self, "setDoneButton:", v30);

    -[CFXCaptureViewController doneButton](self, "doneButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel_doneButtonTapped_, 64);

    -[CFXCaptureViewController flashButton](self, "flashButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController topBar](self, "topBar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFlashButton:", v28);

  }
  -[CFXCaptureViewController doneButton](self, "doneButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController topBar](self, "topBar");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDoneButton:", v33);

  if (v8)
  {
    if (-[CFXCaptureViewController captureMode](self, "captureMode") != 2)
      goto LABEL_18;
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "intrinsicContentSize");
    v37 = v36;
    v39 = v38;

    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", 0.0, 23.0, v37, v39);

    -[CFXCaptureViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubview:", v42);

    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setUserInteractionEnabled:", 0);
  }
  else
  {
    if (IsCTMSupported)
    {
      -[CFXCaptureViewController view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addSubview:", v44);
    }
    else
    {
      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController topBar](self, "topBar");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setElapsedTimeView:", v43);
    }

  }
LABEL_18:
  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  objc_msgSend(MEMORY[0x24BE72D80], "cameraTopBarFrameForReferenceBounds:", v47, v49, v51, v53);
  v55 = v54;
  v57 = v54 + v56;
  -[CFXCaptureViewController topBarContaineHeightConstraint](self, "topBarContaineHeightConstraint");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setConstant:", v57);

  if (v10)
  {
    -[CFXCaptureViewController topBarTopConstraint](self, "topBarTopConstraint");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setConstant:", v55);

  }
  -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", 0);
  v60 = dispatch_group_create();
  -[CFXCaptureViewController setEditingOverlayWithGestureGroup:](self, "setEditingOverlayWithGestureGroup:", v60);

  -[CFXCaptureViewController topBar](self, "topBar");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setOrientation:", 1);

  -[CFXCaptureViewController topBar](self, "topBar");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setVisibilityUpdateDelegate:", self);

  if (!isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
  {
    objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "zoomControlSupported"))
    {
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE14A90]), "initWithLayoutStyle:", v18);
      -[CFXCaptureViewController setZoomControl:](self, "setZoomControl:", v64);

      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setDelegate:", self);

      -[CFXCaptureViewController view](self, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
    }
    else
    {
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE14AA0]), "initWithLayoutStyle:", v18);
      -[CFXCaptureViewController setZoomSlider:](self, "setZoomSlider:", v67);

      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setDelegate:", self);

      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setExclusiveTouch:", 1);

      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v71) = 0;
      objc_msgSend(v70, "setMinimumValue:", v71);

      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v73) = 1.0;
      objc_msgSend(v72, "setMaximumValue:", v73);

      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addTarget:action:forControlEvents:", self, sel_zoomSliderValueDidChange_forEvent_, 4096);

      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setAlpha:", 0.0);

      -[CFXCaptureViewController view](self, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addSubview:", v76);

    -[CFXCaptureViewController updateZoomUIVisibility](self, "updateZoomUIVisibility");
  }
  if (-[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone"))
  {
    -[CFXCaptureViewController cameraControls](self, "cameraControls");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "effectBrowserContentPresenterViewController");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController setEffectBrowserContentPresenterViewController:](self, "setEffectBrowserContentPresenterViewController:", v78);

  }
  else
  {
    -[CFXCaptureViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v79)
      goto LABEL_30;
    -[CFXCaptureViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController jfxAddChildViewController:](self, "jfxAddChildViewController:", v77);
  }

LABEL_30:
  v80 = -[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone");
  -[CFXCaptureViewController cameraControlsContainerView](self, "cameraControlsContainerView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setHidden:", v80);

  -[CFXCaptureViewController setConfiguredForOrientation:](self, "setConfiguredForOrientation:", 0);
  -[CFXCaptureViewController setSwitchedToVideoMode:](self, "setSwitchedToVideoMode:", 0);
  if (IsCTMSupported)
  {
    v82 = MTLCreateSystemDefaultDevice();
    v83 = objc_alloc(MEMORY[0x24BE14A48]);
    v84 = (void *)objc_msgSend(v82, "newCommandQueue");
    v85 = (void *)objc_msgSend(v83, "initWithMetalDevice:commandQueue:", v82, v84);
    -[CFXCaptureViewController setDynamicShutterControl:](self, "setDynamicShutterControl:", v85);

    -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setDelegate:", self);

    v87 = *(_OWORD *)(MEMORY[0x24BE14A18] + 16);
    v111[0] = *MEMORY[0x24BE14A18];
    v111[1] = v87;
    v111[2] = *(_OWORD *)(MEMORY[0x24BE14A18] + 32);
    v88 = *(_QWORD *)(MEMORY[0x24BE14A18] + 64);
    v112 = *(_QWORD *)(MEMORY[0x24BE14A18] + 48);
    v113 = 1;
    v114 = v88;
    -[CFXCaptureViewController setDynamicShutterSettings:](self, "setDynamicShutterSettings:", v111);
    v89 = objc_alloc_init(JFXPassThroughContainerView);
    -[CFXCaptureViewController setBottomControlsContainer:](self, "setBottomControlsContainer:", v89);

    -[CFXCaptureViewController view](self, "view");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addSubview:", v91);

    -[CFXCaptureViewController topBar](self, "topBar");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setHidden:", 1);

    v93 = objc_alloc_init(MEMORY[0x24BE14A38]);
    -[CFXCaptureViewController setControlStatusBar:](self, "setControlStatusBar:", v93);

    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setDelegate:", self);

    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setPrimaryDesiredIndicatorTypes:", &unk_24EE9C560);

    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "flashIndicator");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "addTarget:action:forControlEvents:", self, sel_flashModeDidChange, 4096);

    v98 = *MEMORY[0x24BDF7718];
    v99 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v100 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v101 = *(double *)(MEMORY[0x24BDF7718] + 24);
    -[CFXCaptureViewController doneButton](self, "doneButton");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setTappableEdgeInsets:", v98, v99, v100, v101);

    -[CFXCaptureViewController doneButton](self, "doneButton");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setSecondaryAccessoryControl:", v103);

    -[CFXCaptureViewController view](self, "view");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addSubview:", v106);

    -[CFXCaptureViewController configureCTMUIForCaptureMode](self, "configureCTMUIForCaptureMode");
    v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE14A88]), "initWithFrame:", v3, v4, v5, v6);
    -[CFXCaptureViewController setReticleView:](self, "setReticleView:", v107);

    -[CFXCaptureViewController view](self, "view");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController reticleView](self, "reticleView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "insertSubview:atIndex:", v109, 0);

  }
  v110 = (void *)objc_opt_new();
  -[CFXCaptureViewController setRunOnceAnimatedOverlays:](self, "setRunOnceAnimatedOverlays:", v110);

  -[CFXCaptureViewController setIsExternalCaptureSessionAnExternalCamera:](self, "setIsExternalCaptureSessionAnExternalCamera:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Width;
  double Height;
  double v22;
  double v23;
  void *v24;
  void *v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v26.receiver = self;
  v26.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController viewWillAppear:](&v26, sel_viewWillAppear_, a3);
  -[CFXCaptureViewController updateTopBar](self, "updateTopBar");
  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  v5 = (void *)objc_msgSend(v4, "initWithSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[CFXCaptureViewController setPresentationView:](self, "setPresentationView:", v5);

  -[CFXCaptureViewController presentationView](self, "presentationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  if (-[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone"))
    -[CFXCaptureViewController nonTransformedContainerView](self, "nonTransformedContainerView");
  else
    -[CFXCaptureViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController presentationView](self, "presentationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (!v10)
  {
    +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v27.origin.x = v13;
    v27.origin.y = v15;
    v27.size.width = v17;
    v27.size.height = v19;
    Width = CGRectGetWidth(v27);
    v28.origin.x = v13;
    v28.origin.y = v15;
    v28.size.width = v17;
    v28.size.height = v19;
    Height = CGRectGetHeight(v28);
    v22 = Width >= Height ? Height : Width;
    v23 = Width >= Height ? Width : Height;
    -[CFXCaptureViewController configureUIForWindowOrientation:bounds:](self, "configureUIForWindowOrientation:bounds:", 1, 0.0, 0.0, v22, v23);
    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      if (-[CFXCaptureViewController needsBlackBackgroundForCTMControls](self, "needsBlackBackgroundForCTMControls"))
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v24);

    }
  }
  -[CFXCaptureViewController configureCaptureControlsForOrientationWithAnimation:](self, "configureCaptureControlsForOrientationWithAnimation:", 0);
  -[CFXCaptureViewController configureUIForOrientation](self, "configureUIForOrientation");
  -[CFXCaptureViewController CFX_applyAutoRotationCorrectionToEditorViews](self, "CFX_applyAutoRotationCorrectionToEditorViews");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CFXCaptureViewController runOnceAnimatedOverlays](self, "runOnceAnimatedOverlays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (CGRect)CFX_generateAutoRotationCorrectionFrameWithInterfaceOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  double Width;
  double v23;
  void *v24;
  double Height;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  -[CFXCaptureViewController externalUncroppedPresentationRect](self, "externalUncroppedPresentationRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CFXCaptureViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;

  switch(a3)
  {
    case 2:
      -[CFXCaptureViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      Width = CGRectGetWidth(v37);
      v38.origin.x = v6;
      v38.origin.y = v8;
      v38.size.width = v10;
      v38.size.height = v12;
      v23 = Width - CGRectGetWidth(v38) - v6;

      -[CFXCaptureViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      Height = CGRectGetHeight(v39);
      v40.origin.x = v6;
      v40.origin.y = v8;
      v40.size.width = v10;
      v40.size.height = v12;
      v19 = Height - CGRectGetHeight(v40) - v8;

LABEL_7:
      v8 = v23;
      break;
    case 3:
      -[CFXCaptureViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      v27 = CGRectGetHeight(v41);
      v42.origin.x = v6;
      v42.origin.y = v8;
      v42.size.width = v10;
      v42.size.height = v12;
      v23 = v27 - CGRectGetHeight(v42) - v8;

      v43.origin.x = v6;
      v43.origin.y = v8;
      v43.size.width = v10;
      v43.size.height = v12;
      v28 = CGRectGetHeight(v43);
      v44.origin.x = v6;
      v44.origin.y = v8;
      v44.size.width = v10;
      v44.size.height = v12;
      v12 = CGRectGetWidth(v44);
      v10 = v28;
      v19 = v6;
      goto LABEL_7;
    case 4:
      -[CFXCaptureViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v18 = CGRectGetWidth(v33);
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      v19 = v18 - CGRectGetWidth(v34) - v6 - v16;

      v35.origin.x = v6;
      v35.origin.y = v8;
      v35.size.width = v10;
      v35.size.height = v12;
      v20 = CGRectGetHeight(v35);
      v36.origin.x = v6;
      v36.origin.y = v8;
      v36.size.width = v10;
      v36.size.height = v12;
      v12 = CGRectGetWidth(v36);
      v10 = v20;
      break;
    default:
      v19 = v8;
      v8 = v6;
      break;
  }
  v29 = v8;
  v30 = v19;
  v31 = v10;
  v32 = v12;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)CFX_applyAutoRotationCorrectionToEditorViews
{
  int64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double Width;
  void *v21;
  double Height;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  double v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v74 = *MEMORY[0x24BDAC8D0];
  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
  {
    v3 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
    -[CFXCaptureViewController CFX_generateAutoRotationCorrectionFrameWithInterfaceOrientation:](self, "CFX_generateAutoRotationCorrectionFrameWithInterfaceOrientation:", v3);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = 0.0;
    if (v3 != 1)
    {
      if (v3 == 3)
      {
        v12 = 1.57079633;
      }
      else if (v3 == 4)
      {
        v12 = -1.57079633;
      }
      else
      {
        v12 = 3.14159265;
        if (v3 != 2)
          v12 = 0.0;
      }
    }
    memset(&v65.c, 0, 32);
    if ((unint64_t)(v3 - 3) >= 2)
      v13 = v12;
    else
      v13 = -v12;
    *(_OWORD *)&v65.a = 0uLL;
    CGAffineTransformMakeRotation(&v65, v13);
    JFXLog_viewerUI();
    v14 = objc_claimAutoreleasedReturnValue();
    v59 = v5;
    v60 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      switch(v3)
      {
        case 1:
          v15 = CFSTR("UIInterfaceOrientationPortrait");
          break;
        case 3:
          v15 = CFSTR("UIInterfaceOrientationLandscapeRight");
          break;
        case 4:
          v15 = CFSTR("UIInterfaceOrientationLandscapeLeft");
          break;
        case 2:
          v15 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
          break;
        default:
          v15 = 0;
          break;
      }
      -[CFXCaptureViewController externalUncroppedPresentationRect](self, "externalUncroppedPresentationRect");
      NSStringFromCGRect(v75);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v76.origin.x = v5;
      v76.origin.y = v7;
      v76.size.width = v9;
      v76.size.height = v11;
      NSStringFromCGRect(v76);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v67 = v15;
      v68 = 2048;
      v69 = v13 / 0.0174532925;
      v70 = 2112;
      v71 = v16;
      v72 = 2112;
      v73 = v17;
      _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "Updating editor view frames - orientation: %@, rotation: %f, uncroppedPresentationRect: %@, frame: %@", buf, 0x2Au);

    }
    v18 = v9;
    v58 = v9;

    -[CFXCaptureViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    Width = CGRectGetWidth(v77);

    -[CFXCaptureViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    Height = CGRectGetHeight(v78);

    if (Width >= Height)
      v23 = Height;
    else
      v23 = Width;
    -[CFXCaptureViewController view](self, "view", *(_QWORD *)&v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v25 = CGRectGetWidth(v79);

    -[CFXCaptureViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    v27 = CGRectGetHeight(v80);

    if (v25 < v27)
      v25 = v27;
    v28 = *MEMORY[0x24BDBEFB0];
    v29 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[CFXCaptureViewController liveCaptureContainerContainer](self, "liveCaptureContainerContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBounds:", v28, v29, v23, v25);

    -[CFXCaptureViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "center");
    v33 = v32;
    v35 = v34;
    -[CFXCaptureViewController liveCaptureContainerContainer](self, "liveCaptureContainerContainer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setCenter:", v33, v35);

    v64 = v65;
    -[CFXCaptureViewController liveCaptureContainerContainer](self, "liveCaptureContainerContainer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v64;
    objc_msgSend(v37, "setTransform:", &v63);

    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFrame:", v59, v7, v18, v60);

    -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBounds:", v28, v29, v57, v25);

    -[CFXCaptureViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "center");
    v42 = v41;
    v44 = v43;
    -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setCenter:", v42, v44);

    v62 = v65;
    -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v62;
    objc_msgSend(v46, "setTransform:", &v61);

    -[CFXCaptureViewController effectEditor](self, "effectEditor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", v59, v7, v58, v60);

    -[CFXCaptureViewController presentationRect](self, "presentationRect");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    -[CFXCaptureViewController presentationView](self, "presentationView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

    -[CFXCaptureViewController updateAnimojiTrackingReticleAndLabelLayout](self, "updateAnimojiTrackingReticleAndLabelLayout");
  }
}

- (void)applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  if (v4)
  {
    -[CFXCaptureViewController effectEditor](self, "effectEditor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __94__CFXCaptureViewController_applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator___block_invoke;
    v6[3] = &unk_24EE59A58;
    v6[4] = self;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v6);
  }
  else
  {
    -[CFXCaptureViewController CFX_applyAutoRotationCorrectionToEditorViews](self, "CFX_applyAutoRotationCorrectionToEditorViews");
  }

}

void __94__CFXCaptureViewController_applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "CFX_applyAutoRotationCorrectionToEditorViews");
  objc_msgSend(*(id *)(a1 + 32), "effectEditor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)CFX_adjustOverlaysForCaptureOrientationChanged:(int64_t)a3 oldCaptureOrientation:(int64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  uint64_t v28;
  __objc2_class **v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  CGFloat c;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  __objc2_class *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  NSObject *v55;
  __objc2_class *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  CFXCaptureViewController *v64;
  __int128 v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double angle;
  CGPoint point;
  double CenterPoint;
  double v74;
  void *v75;
  __int128 v76;
  _OWORD v77[8];
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CGFloat v98;
  CGAffineTransform v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  CGAffineTransform v104;
  _BYTE v105[128];
  CGAffineTransform buf;
  uint64_t v107;
  CGPoint v108;
  CGPoint v109;
  CGPoint v110;

  v107 = *MEMORY[0x24BDAC8D0];
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderSize");
  v9 = v8;
  v11 = v10;

  v12 = 0.0;
  angle = 0.0;
  if (a3 != a4)
  {
    v13 = 0.0;
    if (a3 != 1)
    {
      if (a3 == 3)
      {
        v13 = 1.57079633;
      }
      else if (a3 == 4)
      {
        v13 = -1.57079633;
      }
      else
      {
        v13 = 3.14159265;
        if (a3 != 2)
          v13 = 0.0;
      }
    }
    if (a4 != 1)
    {
      if (a4 == 3)
      {
        v12 = 1.57079633;
      }
      else if (a4 == 4)
      {
        v12 = -1.57079633;
      }
      else
      {
        v12 = 3.14159265;
        if (a4 != 2)
          v12 = 0.0;
      }
    }
    angle = v13 - v12;
  }
  JFXLog_viewerUI();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    switch(a3)
    {
      case 1:
        v15 = CFSTR("UIInterfaceOrientationPortrait");
        break;
      case 3:
        v15 = CFSTR("UIInterfaceOrientationLandscapeRight");
        break;
      case 4:
        v15 = CFSTR("UIInterfaceOrientationLandscapeLeft");
        break;
      default:
        v15 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
        if (a3 != 2)
          v15 = 0;
        break;
    }
    switch(a4)
    {
      case 1:
        v16 = CFSTR("UIInterfaceOrientationPortrait");
        break;
      case 3:
        v16 = CFSTR("UIInterfaceOrientationLandscapeRight");
        break;
      case 4:
        v16 = CFSTR("UIInterfaceOrientationLandscapeLeft");
        break;
      default:
        v16 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
        if (a4 != 2)
          v16 = 0;
        break;
    }
    LODWORD(buf.a) = 138412802;
    *(_QWORD *)((char *)&buf.a + 4) = v15;
    WORD2(buf.b) = 2112;
    *(_QWORD *)((char *)&buf.b + 6) = v16;
    HIWORD(buf.c) = 2048;
    buf.d = angle * 180.0 / 3.14159265;
    _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "adjust overlays for capture orientation changed: captureInterfaceOrientation %@ oldCaptureInterfaceOrientation %@ capture rotation angle %f", (uint8_t *)&buf, 0x20u);
  }

  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeRotation(&buf, angle);
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v64 = self;
  -[CFXCaptureViewController composition](self, "composition");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "effects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v100, v105, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v101;
    v70 = *MEMORY[0x24BDBD8B8];
    v68 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
    v69 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
    v22 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    v66 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    v67 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
    __asm { FMOV            V0.2D, #1.0 }
    v65 = _Q0;
    v28 = MEMORY[0x24BDC0D88];
    v29 = off_24EE56000;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v101 != v21)
          objc_enumerationMutation(v18);
        v31 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend(v31, "jtEffect");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "type");

        if (v33 == 2)
        {
          objc_msgSend(v31, "jtEffect");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "trackingProps");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "trackingType");

          if (v36 == 2)
          {
            if (v34)
            {
              objc_msgSend(v34, "topLevelTransform");
            }
            else
            {
              v87 = 0u;
              v88 = 0u;
              v85 = 0u;
              v86 = 0u;
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
            }
            v78 = 0;
            v79 = 0;
            v80 = v65;
            pv_simd_matrix_rotate();
            v77[4] = v93;
            v77[5] = v94;
            v77[6] = v95;
            v77[7] = v96;
            v77[0] = v89;
            v77[1] = v90;
            v77[2] = v91;
            v77[3] = v92;
            objc_msgSend(v34, "setTopLevelTransform:", v77);
          }
          else if (!v36)
          {
            *(_OWORD *)&v104.a = *(_OWORD *)v28;
            v76 = *(_OWORD *)&v104.a;
            v104.c = *(CGFloat *)(v28 + 16);
            c = v104.c;
            objc_msgSend(v34, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v104, 1, 1, 1, 0.0, 0.0, v9, v11);
            CenterPoint = CGRectGetCenterPoint(v38, v39, v40, v41);
            v74 = v42;
            v43 = CGRectGetCenterPoint(0.0, 0.0, v9, v11);
            v45 = v44;
            v99.a = v70;
            v99.b = v69;
            v99.c = v68;
            v99.d = v67;
            v99.tx = v66;
            v99.ty = v22;
            CGAffineTransformTranslate(&v104, &v99, v43, v44);
            v99 = v104;
            CGAffineTransformRotate(&v104, &v99, angle);
            v99 = v104;
            CGAffineTransformTranslate(&v104, &v99, -v43, -v45);
            point = (CGPoint)vaddq_f64(*(float64x2_t *)&v104.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v104.c, v74), *(float64x2_t *)&v104.a, CenterPoint));
            v46 = v29[68];
            v104 = buf;
            *(_OWORD *)&v99.a = v76;
            v99.c = c;
            -[__objc2_class addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](v46, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v34, &v104, &v99, 0, 0.0, 0.0, v9, v11);
            *(_OWORD *)&v104.a = v76;
            v104.c = c;
            objc_msgSend(v34, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v104, 1, 1, 1, 0.0, 0.0, v9, v11);
            v51 = CGRectGetCenterPoint(v47, v48, v49, v50);
            v53 = v52;
            v54 = point.y - v52;
            JFXLog_DebugViewerUI();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v108.x = CenterPoint;
              v108.y = v74;
              NSStringFromCGPoint(v108);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v109.x = v51;
              v109.y = v53;
              NSStringFromCGPoint(v109);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromCGPoint(point);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v110.x = point.x - v51;
              v110.y = v54;
              NSStringFromCGPoint(v110);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v104.a) = 138413058;
              *(_QWORD *)((char *)&v104.a + 4) = v75;
              WORD2(v104.b) = 2112;
              *(_QWORD *)((char *)&v104.b + 6) = v57;
              HIWORD(v104.c) = 2112;
              *(_QWORD *)&v104.d = v58;
              LOWORD(v104.tx) = 2112;
              *(_QWORD *)((char *)&v104.tx + 2) = v59;
              _os_log_debug_impl(&dword_2269A9000, v55, OS_LOG_TYPE_DEBUG, "rotated overlays for capture orientation changed: overlayCenterPoint %@ rotatedCenterPoint %@ targetRotatedCenterPoint %@ translation required %@", (uint8_t *)&v104, 0x2Au);

              v28 = MEMORY[0x24BDC0D88];
              v29 = off_24EE56000;

            }
            memset(&v104, 0, sizeof(v104));
            CGAffineTransformMakeTranslation(&v104, point.x - v51, v54);
            v56 = v29[68];
            v99 = v104;
            v97 = v76;
            v98 = c;
            -[__objc2_class addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](v56, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v34, &v99, &v97, 0, 0.0, 0.0, v9, v11);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v100, v105, 16);
    }
    while (v20);
  }

  CFXLog_action();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXCaptureViewController composition](v64, "composition");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "jtEffects");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("device rotated"), CFSTR("live"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v104.a) = 138543362;
    *(_QWORD *)((char *)&v104.a + 4) = v63;
    _os_log_impl(&dword_2269A9000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v104, 0xCu);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  height = a3.height;
  width = a3.width;
  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
  {
    -[CFXCaptureViewController applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator:](self, "applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator:", v7);
  }
  else
  {
    CFXLog_action();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[CFXCaptureViewController composition](self, "composition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "jtEffects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("device rotated"), CFSTR("live"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2269A9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BE79018], "flushEngine");
  v3.receiver = self;
  v3.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController dealloc](&v3, sel_dealloc);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "destinationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "destinationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController setLiveCaptureViewController:](self, "setLiveCaptureViewController:", v7);

  }
  objc_msgSend(v11, "destinationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v11, "destinationViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController setCameraControls:](self, "setCameraControls:", v10);

  }
}

- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CFXLiveCaptureViewControllerSegue"), a4))
    return !-[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone");
  else
    return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CFXCaptureViewController layoutZoomUI](self, "layoutZoomUI");
  if (-[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone"))
  {
    -[CFXCaptureViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureEffectBrowserContentPresentationForOrientation:", +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation"));

  }
}

- (void)updateTopBar
{
  void *v3;
  void *v4;
  id v5;

  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
  {
    -[CFXCaptureViewController topBar](self, "topBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);
  }
  else
  {
    if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) != 0)
      return;
    -[CFXCaptureViewController topBar](self, "topBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

    -[CFXCaptureViewController topBar](self, "topBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureForMode:animated:", -[CFXCaptureViewController captureMode](self, "captureMode") == 2, 0);

    -[CFXCaptureViewController topBar](self, "topBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", 0);
  }

}

- (void)configureCaptureControlsForOrientationWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    v7 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
    -[CFXCaptureViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cameraControlsViewControllerForCaptureViewController:", self);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "effectButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOrientation:animated:", v7, v3);

    objc_msgSend(v17, "flipButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOrientation:animated:", v7, v3);

    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flashIndicator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOrientation:animated:", v7, v3);

    }
    else
    {
      v13 = -[CFXCaptureViewController captureMode](self, "captureMode");
      -[CFXCaptureViewController flashButton](self, "flashButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if (v13 == 2)
        v15 = 1;
      else
        v15 = v7;
      objc_msgSend(v14, "setOrientation:animated:", v15, v3);
    }

    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setOrientation:animated:", v7, v3);

  }
}

- (void)configureUIForOrientation
{
  int64_t v3;
  id v4;

  v3 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[CFXCaptureViewController configureUIForWindowOrientation:bounds:](self, "configureUIForWindowOrientation:bounds:", v3);

}

- (void)configureUIForWindowOrientation:(int64_t)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  int IsCTMSupported;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  CGFloat v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  CGFloat v59;
  void *v60;
  double v61;
  double v62;
  CGFloat v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  int64_t v76;
  double v77;
  double v78;
  int64_t v79;
  void *v80;
  void *v81;
  int64_t v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  float v101;
  float v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  double v117;
  CGFloat v118;
  double v119;
  void *v120;
  void *v121;
  double v122;
  void *v123;
  double v124;
  unint64_t v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  void *v132;
  double v133;
  unint64_t v134;
  void *v135;
  double v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  float v141;
  double v142;
  void *v143;
  double v144;
  __int128 v145;
  __int128 v146;
  void *v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  double v157;
  double v158;
  __int128 v159;
  void *v160;
  void *v161;
  CGFloat v162;
  double v163;
  void *v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  CGFloat v172;
  double v173;
  double v174;
  double MidX;
  double v176;
  void *v177;
  uint64_t v178;
  double v179;
  double v180;
  void *v181;
  double v182;
  double v183;
  double v184;
  id v185;
  void *v186;
  double v187;
  double v188;
  void *v189;
  uint64_t v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  CGFloat v201;
  void *v202;
  void *v203;
  uint64_t v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  unint64_t v211;
  CGFloat v212;
  CGFloat v213;
  void *v214;
  void *v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  void *v224;
  void *v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  void *v246;
  void *v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  void *v268;
  void *v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  void *v278;
  void *v279;
  void *v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  void *v289;
  void *v290;
  double v291;
  double v292;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  void *v299;
  __int128 v300;
  __int128 v301;
  void *v302;
  __int128 v303;
  void *v304;
  void *v305;
  void *v306;
  uint64_t v307;
  double MaxY;
  void *v309;
  uint64_t v310;
  double v314;
  double v315;
  void *v316;
  void *v317;
  void *v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  void *v327;
  void *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  CGFloat v333;
  CGFloat v334;
  CGFloat rect;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  CGFloat v345;
  double v346;
  double v347;
  double v348;
  unint64_t v349;
  void *v350;
  double v351;
  CGFloat v352;
  _OWORD v353[3];
  __int128 v354;
  __int128 v355;
  __int128 v356;
  _OWORD v357[3];
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  _OWORD v364[3];
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;
  CGRect v387;
  CGRect v388;
  CGRect v389;
  CGRect v390;
  CGRect v391;
  CGRect v392;
  CGRect v393;
  CGRect v394;
  CGRect v395;
  CGRect v396;
  CGRect v397;
  CGRect v398;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[CFXCaptureViewController captureMode](self, "captureMode") == 1)
    return;
  v10 = 0x24BDF6000uLL;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
  objc_msgSend(MEMORY[0x24BE72D80], "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
  v342 = v14;
  v343 = v15;
  v340 = v17;
  v341 = v16;
  objc_msgSend(MEMORY[0x24BE72D80], "reviewScreenControlBarFrameForReferenceBounds:", x, y, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[CFXCaptureViewController delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "cameraControlsViewControllerForCaptureViewController:", self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "bottomBar");
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[CFXCaptureViewController captureMode](self, "captureMode");
  v349 = a3 - 5;
  v351 = y;
  v352 = x;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v30 = v374.origin.x;
    v31 = v374.origin.y;
    v32 = v374.size.width;
    v33 = v374.size.height;
    v34 = CGRectGetWidth(v374);
    v375.origin.x = v30;
    v375.origin.y = v31;
    v375.size.width = v32;
    v375.size.height = v33;
    v35 = v34 / CGRectGetHeight(v375);

    v36 = v35;
    x = v352;
    objc_msgSend(MEMORY[0x24BE72D80], "cameraContentFrameForContentAspectRatio:referenceBounds:", v36, v352, y, width, height);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    -[CFXCaptureViewController captureControlsContainerTopConstraint](self, "captureControlsContainerTopConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = 1144750080;
    objc_msgSend(v45, "setPriority:", v46);

    -[CFXCaptureViewController captureControlsContainerHeightConstraint](self, "captureControlsContainerHeightConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = 1132068864;
    objc_msgSend(v47, "setPriority:", v48);

    if (-[CFXCaptureViewController captureMode](self, "captureMode") == 2)
    {
      -[CFXCaptureViewController view](self, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "frame");
      v346 = v38;
      v50 = height;
      v51 = CGRectGetWidth(v376) * 0.5;

      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "frame");
      v53 = v51 - CGRectGetWidth(v377) * 0.5;
      height = v50;

      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "frame");
      v344 = v55;
      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "frame");
      v57 = v44;
      v58 = v40;
      v59 = CGRectGetWidth(v378);
      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frame");
      v61 = width;
      v62 = v42;
      v63 = CGRectGetHeight(v379);

      v10 = 0x24BDF6000uLL;
      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v53;
      v38 = v346;
      v66 = v59;
      v40 = v58;
      v44 = v57;
      v67 = v63;
      v42 = v62;
      width = v61;
      y = v351;
      x = v352;
      objc_msgSend(v64, "setFrame:", v65, v344, v66, v67);

    }
    v68 = v350;
    goto LABEL_58;
  }
  v345 = v19;
  v333 = v21;
  v334 = v23;
  rect = v25;
  v69 = 0.5625;
  if (!v28)
    v69 = 0.75;
  objc_msgSend(MEMORY[0x24BE72D80], "cameraContentFrameForContentAspectRatio:referenceBounds:", v69, x, y, width, height);
  v347 = v70;
  v338 = v71;
  v73 = v72;
  v75 = v74;
  v76 = a3;
  v77 = height;
  v78 = width;
  if ((unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v79 = -[CFXCaptureViewController captureMode](self, "captureMode", a3);
    v76 = a3;
    v77 = height;
    v78 = width;
    if (!v79)
    {
      v76 = 1;
      v77 = width;
      v78 = height;
    }
  }
  v372 = 0u;
  v373 = 0u;
  v370 = 0u;
  v371 = 0u;
  v368 = 0u;
  v369 = 0u;
  v336 = v75;
  objc_msgSend(MEMORY[0x24BE72D80], "cameraTopBarGeometryForReferenceBounds:forContentSize:withOrientation:", v76, x, y, v78, v77, v73, v75);
  -[CFXCaptureViewController topBar](self, "topBar");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setCenter:", 0.0, 0.0);

  -[CFXCaptureViewController topBar](self, "topBar");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setBounds:", 0.0, 0.0, 0.0, 0.0);

  v82 = -[CFXCaptureViewController captureMode](self, "captureMode");
  if (v349 >= 0xFFFFFFFFFFFFFFFELL && v82 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v83, "userInterfaceIdiom"))
    {
      v84 = 38.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "bounds");
      if ((uint64_t)v86 == 568)
      {
        v84 = 35.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "bounds");
        if ((uint64_t)v88 == 568)
          v84 = 35.0;
        else
          v84 = 38.0;

      }
      v10 = 0x24BDF6000uLL;
    }

    -[CFXCaptureViewController topBar](self, "topBar");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setBounds:", v368, 274.0, v84);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v90, "userInterfaceIdiom"))
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "bounds");
      if ((uint64_t)v92 == 568)
      {

        v10 = 0x24BDF6000;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "bounds");
        v330 = (uint64_t)v94;

        v10 = 0x24BDF6000uLL;
        if (v330 != 568)
          goto LABEL_28;
      }
      v380.origin.x = v19;
      v380.origin.y = v333;
      v380.size.width = v334;
      v380.size.height = rect;
      v95 = CGRectGetHeight(v380);
      v381.origin.x = v342;
      v381.origin.y = v343;
      v381.size.height = v340;
      v381.size.width = v341;
      v96 = *((double *)&v370 + 1) - (v95 - CGRectGetHeight(v381));
      -[CFXCaptureViewController topBar](self, "topBar");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setCenter:", *(double *)&v370, v96);
    }

  }
LABEL_28:
  v365 = v371;
  v366 = v372;
  v367 = v373;
  -[CFXCaptureViewController topBar](self, "topBar");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v364[0] = v365;
  v364[1] = v366;
  v364[2] = v367;
  objc_msgSend(v97, "setTransform:", v364);

  -[CFXCaptureViewController captureControlsContainerTopConstraint](self, "captureControlsContainerTopConstraint");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v98;
  if (v349 >= 0xFFFFFFFFFFFFFFFELL)
    v101 = 750.0;
  else
    v101 = 250.0;
  if (v349 >= 0xFFFFFFFFFFFFFFFELL)
    v102 = 250.0;
  else
    v102 = 750.0;
  *(float *)&v99 = v101;
  objc_msgSend(v98, "setPriority:", v99);

  -[CFXCaptureViewController captureControlsContainerWidthConstraint](self, "captureControlsContainerWidthConstraint");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v104 = v101;
  objc_msgSend(v103, "setPriority:", v104);

  -[CFXCaptureViewController captureControlsContainerHeightConstraint](self, "captureControlsContainerHeightConstraint");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v106 = v102;
  objc_msgSend(v105, "setPriority:", v106);

  -[CFXCaptureViewController view](self, "view");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v349 < 0xFFFFFFFFFFFFFFFELL)
  {
    objc_msgSend(v107, "bounds");
    v109 = CGRectGetHeight(v382) - v343;

    objc_msgSend(*(id *)(v10 + 2504), "currentDevice");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v336;
    v42 = v73;
    if (objc_msgSend(v110, "userInterfaceIdiom"))
    {

      v68 = v350;
LABEL_45:
      if (-[CFXCaptureViewController dockIsMagnified](self, "dockIsMagnified"))
      {
        -[CFXCaptureViewController dockMagnifiedHeightDelta](self, "dockMagnifiedHeightDelta");
        v109 = v109 + v128;
      }
      -[CFXCaptureViewController captureControlsContainerHeightConstraint](self, "captureControlsContainerHeightConstraint");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "setConstant:", v109);

      -[CFXCaptureViewController captureControlsContainerLeadingConstraint](self, "captureControlsContainerLeadingConstraint");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v131) = 1144750080;
      objc_msgSend(v130, "setPriority:", v131);

      -[CFXCaptureViewController captureControlsContainerTrailingConstraint](self, "captureControlsContainerTrailingConstraint");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v133) = 1144750080;
      objc_msgSend(v132, "setPriority:", v133);
      v38 = v347;
      v40 = v338;
      goto LABEL_57;
    }
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "bounds");
    if ((uint64_t)v122 == 568)
    {

      v68 = v350;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v125 = v10;
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "bounds");
      v331 = (uint64_t)v127;

      v10 = v125;
      v68 = v350;
      if (v331 != 568)
        goto LABEL_45;
    }
    v384.origin.x = v345;
    v384.origin.y = v333;
    v384.size.width = v334;
    v384.size.height = rect;
    v109 = CGRectGetHeight(v384);
    goto LABEL_45;
  }
  objc_msgSend(v107, "frame");
  v112 = v111;
  v114 = v113;
  v116 = v115;
  v118 = v117;

  v383.origin.x = v112;
  v383.origin.y = v114;
  v383.size.width = v116;
  v383.size.height = v118;
  v119 = CGRectGetWidth(v383) - v343;
  objc_msgSend(*(id *)(v10 + 2504), "currentDevice");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v120, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "bounds");
    v44 = v336;
    v42 = v73;
    if ((uint64_t)v124 == 568)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v134 = v10;
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "bounds");
      v332 = (uint64_t)v136;

      v10 = v134;
      if (v332 != 568)
        goto LABEL_50;
    }
    v385.origin.x = v345;
    v385.origin.y = v333;
    v385.size.width = v334;
    v385.size.height = rect;
    v119 = CGRectGetHeight(v385);
    goto LABEL_50;
  }

  v44 = v336;
  v42 = v73;
LABEL_50:
  -[CFXCaptureViewController captureControlsContainerWidthConstraint](self, "captureControlsContainerWidthConstraint");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setConstant:", v119);

  -[CFXCaptureViewController captureControlsContainerLeadingConstraint](self, "captureControlsContainerLeadingConstraint");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v138;
  if (a3 == 4)
    *(float *)&v139 = 750.0;
  else
    *(float *)&v139 = 250.0;
  if (a3 == 4)
    v141 = 250.0;
  else
    v141 = 750.0;
  objc_msgSend(v138, "setPriority:", v139);

  -[CFXCaptureViewController captureControlsContainerTrailingConstraint](self, "captureControlsContainerTrailingConstraint");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v142 = v141;
  objc_msgSend(v132, "setPriority:", v142);
  v68 = v350;
  v38 = v347;
  v40 = v338;
  x = v352;
LABEL_57:

LABEL_58:
  -[CFXCaptureViewController view](self, "view");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "layoutIfNeeded");

  v372 = 0u;
  v373 = 0u;
  v370 = 0u;
  v371 = 0u;
  v368 = 0u;
  v369 = 0u;
  v348 = width;
  objc_msgSend(MEMORY[0x24BE72D80], "orientedGeometryForFrame:inBounds:orientation:", a3, v38, v40, v42, v44, x, y, width, height);
  v144 = *((double *)&v371 + 1);
  v339 = *(double *)&v371;
  v145 = v372;
  v337 = *(double *)&v372;
  v146 = v369;
  -[CFXCaptureViewController view](self, "view");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "frame");
  v149 = v148;
  v151 = v150;
  v153 = v152;
  v155 = v154;
  -[CFXCaptureViewController liveCaptureContainerContainer](self, "liveCaptureContainerContainer");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setFrame:", v149, v151, v153, v155);

  if ((IsCTMSupported & 1) == 0)
  {
    v157 = *MEMORY[0x24BDBF090];
    v158 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v159 = v370;
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "setCenter:", v159);

    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setBounds:", v157, v158, fabs(v337 * *((double *)&v146 + 1) + v339 * *(double *)&v146), fabs(*((double *)&v145 + 1) * *((double *)&v146 + 1) + v144 * *(double *)&v146));

  }
  v162 = v351;
  v163 = v352;
  if (!-[CFXCaptureViewController configuredForOrientation](self, "configuredForOrientation"))
  {
    v362 = 0u;
    v363 = 0u;
    v360 = 0u;
    v361 = 0u;
    v358 = 0u;
    v359 = 0u;
    objc_msgSend(MEMORY[0x24BE72D80], "orientedGeometryForFrame:inBounds:orientation:", a3, v342, v343, v341, v340, v352, v351, width, height);
    objc_msgSend(*(id *)(v10 + 2504), "currentDevice");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v164, "userInterfaceIdiom"))
      objc_msgSend(v27, "view");
    else
      objc_msgSend(v27, "backgroundView");
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    -[CFXCaptureViewController view](self, "view");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "convertPoint:toView:", v165, v360);
    v168 = v167;
    v170 = v169;

    v357[0] = v361;
    v357[1] = v362;
    v357[2] = v363;
    objc_msgSend(v68, "setTransform:", v357);
    if (IsCTMSupported)
    {
      -[CFXCaptureViewController bottomBarCTMControlsFrameForWindowOrientation:bounds:](self, "bottomBarCTMControlsFrameForWindowOrientation:bounds:", a3, v352, v351, width, height);
      v171 = v386.origin.x;
      v172 = v386.origin.y;
      v173 = v386.size.width;
      v174 = v386.size.height;
      MidX = CGRectGetMidX(v386);
      v387.origin.x = v171;
      v387.origin.y = v172;
      v387.size.width = v173;
      v387.size.height = v174;
      objc_msgSend(v68, "setCenter:", MidX, CGRectGetMidY(v387));
      v176 = v172;
      width = v348;
      objc_msgSend(v68, "setBounds:", v171, v176, v173, v174);
    }
    else
    {
      objc_msgSend(*(id *)(v10 + 2504), "currentDevice");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v177, "userInterfaceIdiom");
      v180 = *((double *)&v360 + 1);
      v179 = *(double *)&v360;
      if (v178)
      {
        v179 = v168;
        v180 = v170;
      }
      objc_msgSend(v68, "setCenter:", v179, v180);

      objc_msgSend(v68, "setBounds:", v358, v359);
      -[CFXCaptureViewController layoutZoomUI](self, "layoutZoomUI");
    }

  }
  -[CFXCaptureViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "configureEffectBrowserContentPresentationForOrientation:", +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation"));

  if (IsCTMSupported)
  {
    if (v349 >= 0xFFFFFFFFFFFFFFFELL)
    {
      v388.origin.x = v352;
      v388.origin.y = v351;
      v388.size.width = width;
      v388.size.height = height;
      v183 = CGRectGetHeight(v388);
      v389.origin.x = v352;
      v389.origin.y = v351;
      v389.size.width = width;
      v389.size.height = height;
      v182 = CGRectGetWidth(v389);
      v184 = 0.0;
      v163 = 0.0;
    }
    else
    {
      v182 = height;
      v183 = width;
      v184 = v351;
    }
    v185 = objc_alloc(MEMORY[0x24BE14A68]);
    -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "intrinsicContentSize");
    v189 = (void *)objc_msgSend(v185, "initWithReferenceBounds:shutterIntrinsicSize:", v163, v184, v183, v182, v187, v188);

    v190 = CFXPreviewAspectRatioForAspectRatioCrop(-[CFXCaptureViewController aspectRatioCrop](self, "aspectRatioCrop"));
    if (!-[CFXCaptureViewController aspectRatioCrop](self, "aspectRatioCrop"))
      v190 = -[CFXCaptureViewController captureMode](self, "captureMode") == 2;
    objc_msgSend(v189, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v190, 1, 0);
    v193 = v192;
    v194 = v191;
    v196 = v195;
    v198 = v197;
    if (v349 >= 0xFFFFFFFFFFFFFFFELL)
    {
      if (a3 == 4)
      {
        v390.origin.x = v352;
        v390.origin.y = v351;
        v390.size.width = width;
        v390.size.height = height;
        v199 = CGRectGetWidth(v390);
        v391.origin.x = v193;
        v391.origin.y = v194;
        v391.size.width = v196;
        v391.size.height = v198;
        v200 = v199 - (v194 + CGRectGetHeight(v391));
      }
      else
      {
        v200 = v191;
      }
      v392.origin.x = v193;
      v392.origin.y = v194;
      v392.size.width = v196;
      v392.size.height = v198;
      v201 = CGRectGetHeight(v392);
      v393.origin.x = v193;
      v393.origin.y = v194;
      v393.size.width = v196;
      v393.size.height = v198;
      v198 = CGRectGetWidth(v393);
      v194 = 0.0;
      v196 = v201;
      v193 = v200;
      v162 = v351;
    }
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "setFrame:", v193, v194, v196, v198);

    if (!-[CFXCaptureViewController configuredForOrientation](self, "configuredForOrientation"))
    {
      -[CFXCaptureViewController reticleView](self, "reticleView");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "setFrame:", v193, v194, v196, v198);

      if (-[CFXCaptureViewController aspectRatioCrop](self, "aspectRatioCrop") == 2)
        v204 = 3;
      else
        v204 = 0;
      objc_msgSend(v189, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v204, 1, 0);
      v208 = v207;
      v210 = v209;
      if (v349 >= 0xFFFFFFFFFFFFFFFELL)
      {
        v212 = v205;
        v213 = v206;
        if (a3 == 4)
        {
          v394.origin.x = v352;
          v394.origin.y = v162;
          v394.size.width = width;
          v394.size.height = height;
          CGRectGetWidth(v394);
          v395.origin.x = v212;
          v395.origin.y = v208;
          v395.size.width = v213;
          v395.size.height = v210;
          CGRectGetHeight(v395);
        }
        v211 = v10;
        v396.origin.x = v212;
        v396.origin.y = v208;
        v396.size.width = v213;
        v396.size.height = v210;
        CGRectGetHeight(v396);
        v397.origin.x = v212;
        v397.origin.y = v208;
        v397.size.width = v213;
        v397.size.height = v210;
        v210 = CGRectGetWidth(v397);
        v208 = 0.0;
      }
      else
      {
        v211 = v10;
      }
      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "setFrame:", 0.0, v210 + v208, width, height - (v210 + v208));

      -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "frameForShutterControl:", v215);
      v217 = v216;
      v219 = v218;
      v221 = v220;
      v223 = v222;

      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController view](self, "view");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "convertRect:fromView:", v225, v217, v219, v221, v223);
      v227 = v226;
      v229 = v228;
      v231 = v230;
      v233 = v232;

      -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "setFrame:", v227, v229, v231, v233);

      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "insertSubview:atIndex:", v236, 0);

      objc_msgSend(v27, "effectButton");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "frameForBottomLeftControl:", v237);
      v239 = v238;
      v241 = v240;
      v243 = v242;
      v245 = v244;

      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController view](self, "view");
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "convertRect:fromView:", v247, v239, v241, v243, v245);
      v249 = v248;
      v251 = v250;
      v253 = v252;
      v255 = v254;

      objc_msgSend(v27, "effectButton");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "setFrame:", v249, v251, v253, v255);

      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "effectButton");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "addSubview:", v258);

      objc_msgSend(v27, "flipButton");
      v259 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "frameForBottomRightControl:", v259);
      v261 = v260;
      v263 = v262;
      v265 = v264;
      v267 = v266;

      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController view](self, "view");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v268, "convertRect:fromView:", v269, v261, v263, v265, v267);
      v271 = v270;
      v273 = v272;
      v275 = v274;
      v277 = v276;

      objc_msgSend(v27, "flipButton");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "setFrame:", v271, v273, v275, v277);

      -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "flipButton");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "addSubview:", v280);

      objc_msgSend(v189, "frameForControlStatusBar");
      v282 = v281;
      v284 = v283;
      v286 = v285;
      v288 = v287;
      -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "setFrame:", v282, v284, v286, v288);

      if (-[CFXCaptureViewController aspectRatioCrop](self, "aspectRatioCrop") == 2)
      {
        -[CFXCaptureViewController bottomControlsContainer](self, "bottomControlsContainer");
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "frame");
        objc_msgSend(v350, "setFrame:");

      }
      -[CFXCaptureViewController layoutZoomUI](self, "layoutZoomUI");
      v10 = v211;
      v68 = v350;
    }
    objc_msgSend(v189, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v190, 1, 0);
    v292 = v291;
    v294 = v293;
    v296 = v295;
    v298 = v297;
    v362 = 0u;
    v363 = 0u;
    v360 = 0u;
    v361 = 0u;
    v358 = 0u;
    v359 = 0u;
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    if (v189)
    {
      objc_msgSend(v189, "geometryForElapsedTimeView:viewportFrame:orientation:", v299, a3, v292, v294, v296, v298);
    }
    else
    {
      v362 = 0u;
      v363 = 0u;
      v360 = 0u;
      v361 = 0u;
      v358 = 0u;
      v359 = 0u;
    }

    v300 = v358;
    v301 = v359;
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v302, "setBounds:", v300, v301);

    v303 = v360;
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "setCenter:", v303);

    v354 = v361;
    v355 = v362;
    v356 = v363;
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    v353[0] = v354;
    v353[1] = v355;
    v353[2] = v356;
    objc_msgSend(v305, "setTransform:", v353);

    objc_msgSend(*(id *)(v10 + 2504), "currentDevice");
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    v307 = objc_msgSend(v306, "userInterfaceIdiom");

    if (!v307)
    {
      objc_msgSend(v189, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, 1, 0);
      MaxY = CGRectGetMaxY(v398);
      -[CFXCaptureViewController view](self, "view");
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v309, "frame");
      if (v349 >= 0xFFFFFFFFFFFFFFFELL)
      {
        v314 = CGRectGetWidth(*(CGRect *)&v310) - MaxY;

        -[CFXCaptureViewController captureControlsContainerWidthConstraint](self, "captureControlsContainerWidthConstraint");
        v316 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v314 = CGRectGetHeight(*(CGRect *)&v310) - MaxY;

        if (-[CFXCaptureViewController dockIsMagnified](self, "dockIsMagnified"))
        {
          -[CFXCaptureViewController dockMagnifiedHeightDelta](self, "dockMagnifiedHeightDelta");
          v314 = v314 + v315;
        }
        -[CFXCaptureViewController captureControlsContainerHeightConstraint](self, "captureControlsContainerHeightConstraint");
        v316 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v317 = v316;
      objc_msgSend(v316, "setConstant:", v314);

    }
  }
  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "frame");
  -[CFXCaptureViewController setPresentationRect:](self, "setPresentationRect:");

  -[CFXCaptureViewController presentationRect](self, "presentationRect");
  v320 = v319;
  v322 = v321;
  v324 = v323;
  v326 = v325;
  -[CFXCaptureViewController presentationView](self, "presentationView");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v327, "setFrame:", v320, v322, v324, v326);

  -[CFXCaptureViewController updateAnimojiTrackingReticleAndLabelLayout](self, "updateAnimojiTrackingReticleAndLabelLayout");
  -[CFXCaptureViewController updateEffectEditorLayout](self, "updateEffectEditorLayout");
  -[CFXCaptureViewController updateFullScreenTextEditorLayout](self, "updateFullScreenTextEditorLayout");
  objc_msgSend(*(id *)(v10 + 2504), "currentDevice");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v329 = objc_msgSend(v328, "userInterfaceIdiom");

  if (!v329)
    -[CFXCaptureViewController setConfiguredForOrientation:](self, "setConfiguredForOrientation:", 1);

}

- (void)applyRotationTransformForPortrait
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  double Width;
  double Height;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGRect v45;
  CGRect v46;

  -[CFXCaptureViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v12;
  v14 = v10;
  v15 = v8;
  v42 = v6;
  if (v3)
  {
    objc_msgSend(v3, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v6 = v17;
    v15 = v18;
    v14 = v19;
    v13 = v20;

  }
  v21 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  v45.origin.x = v6;
  v45.origin.y = v15;
  v45.size.width = v14;
  v45.size.height = v13;
  Width = CGRectGetWidth(v45);
  v46.origin.x = v6;
  v46.origin.y = v15;
  v46.size.width = v14;
  v46.size.height = v13;
  Height = CGRectGetHeight(v46);
  switch(v21)
  {
    case 1:
      v24 = 0.0;
      break;
    case 3:
      v24 = 1.57079633;
      break;
    case 4:
      v24 = -1.57079633;
      break;
    default:
      v24 = 3.14159265;
      if (v21 != 2)
        v24 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v44, -v24);
  -[CFXCaptureViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v44;
  objc_msgSend(v25, "setTransform:", &v43);

  if (Width >= Height)
    v26 = Height;
  else
    v26 = Width;
  if (Width < Height)
    Width = Height;
  -[CFXCaptureViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v26, Width);

  if (v3)
  {
    objc_msgSend(v3, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    objc_msgSend(v3, "jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:", v21, 0.0, 0.0, v26, Width, v29, v30, v31, v32);
    v34 = v33;
    v36 = v35;
    -[CFXCaptureViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCenter:", v34, v36);

  }
  else
  {
    -[UIViewController jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:](self, "jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:", v21, 0.0, 0.0, v26, Width, v42, v8, v10, v12);
    v39 = v38;
    v41 = v40;
    -[CFXCaptureViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCenter:", v39, v41);
  }

}

- (void)setAspectRatioCrop:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  JFXLog_viewerUI();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCFXAspectRatioCrop(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "aspectRatioCrop: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  self->_aspectRatioCrop = a3;
}

- (void)setCaptureMode:(int64_t)a3
{
  _BOOL8 v4;
  id v5;

  self->_captureMode = a3;
  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    v4 = isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode"));
    -[CFXCaptureViewController topBar](self, "topBar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

  }
}

- (UIView)effectsPickerDrawer
{
  void *v3;
  void *v4;

  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCaptureViewController cameraControls](self, "cameraControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectsPickerDrawer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCaptureViewController cameraControls](self, "cameraControls");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectsPickerDrawer:", v4);

}

- (BOOL)livePlayerIsSaturated
{
  void *v2;
  char v3;

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "livePlayerIsSaturated");

  return v3;
}

- (void)willDropCameraFrame
{
  id v2;

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willDropCameraFrame");

}

- (void)setUseLocalCameraViewfinder:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUseLocalCameraViewfinder:", v3);

}

- (BOOL)useLocalCameraViewfinder
{
  void *v3;
  char v4;

  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useLocalCameraViewfinder");

  return v4;
}

- (double)userInterfaceAlpha
{
  void *v2;
  double v3;
  double v4;

  -[CFXCaptureViewController cameraControlsContainerView](self, "cameraControlsContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setUserInterfaceAlpha:(double)a3
{
  id v4;

  -[CFXCaptureViewController cameraControlsContainerView](self, "cameraControlsContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (int64_t)flashMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flashIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "flashMode");

LABEL_6:
    return -[CFXCaptureViewController CFX_captureFlashModeForCAMFlashMode:](self, "CFX_captureFlashModeForCAMFlashMode:", v5);
  }
  -[CFXCaptureViewController flashButton](self, "flashButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");

  if ((v7 & 1) == 0)
  {
    -[CFXCaptureViewController flashButton](self, "flashButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "flashMode");
    goto LABEL_6;
  }
  v5 = 0;
  return -[CFXCaptureViewController CFX_captureFlashModeForCAMFlashMode:](self, "CFX_captureFlashModeForCAMFlashMode:", v5);
}

- (void)setFlashMode:(int64_t)a3
{
  int64_t v5;
  void *v6;

  -[CFXCaptureViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = -[CFXCaptureViewController CFX_camFlashModeForCaptureFlashMode:](self, "CFX_camFlashModeForCaptureFlashMode:", a3);
  -[CFXCaptureViewController flashButton](self, "flashButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFlashMode:", v5);

  -[CFXCaptureViewController flashModeDidChange](self, "flashModeDidChange");
}

- (CFXEffectComposition)composition
{
  void *v2;
  void *v3;

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CFXEffectComposition *)v3;
}

- (int64_t)captureInterfaceOrientationForDisplay
{
  return +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
}

- (void)toggleCTMFlashButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flashIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "flashMode");

  if (v5)
  {
    if (v5 == 1)
    {
      -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flashIndicator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
    }
    else
    {
      if (v5 != 2)
        return;
      -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flashIndicator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
    }
  }
  else
  {
    -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flashIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 2;
  }
  objc_msgSend(v7, "setFlashMode:", v9);

  -[CFXCaptureViewController flashModeDidChange](self, "flashModeDidChange");
}

- (void)setTorchModeForFlashMode:(int64_t)a3
{
  int64_t v3;
  id v4;

  v3 = -[CFXCaptureViewController CFX_captureTorchModeForCAMFlashMode:](self, "CFX_captureTorchModeForCAMFlashMode:", a3);
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureTorchMode:completion:", v3, 0);

}

- (void)flashModeDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (-[CFXCaptureViewController captureMode](self, "captureMode") == 2)
  {
    if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) != 0)
    {
      -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "flashIndicator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "flashMode");

    }
    else
    {
      -[CFXCaptureViewController flashButton](self, "flashButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "flashMode");
    }

    -[CFXCaptureViewController setTorchModeForFlashMode:](self, "setTorchModeForFlashMode:", v5);
  }
}

- (void)cameraDidStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[CFXCaptureViewController observingOrientationChanges](self, "observingOrientationChanges"))
  {
    -[CFXCaptureViewController setObservingOrientationChanges:](self, "setObservingOrientationChanges:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_JFX_orientationMonitorDeviceInterfaceOrientationNotification_, CFSTR("kJFXOrientationMonitorDeviceInterfaceOrientationNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_JFX_orientationMonitorInterfaceOrientationNotification_, CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0);

  }
  -[CFXCaptureViewController configureCaptureControlsForOrientationWithAnimation:](self, "configureCaptureControlsForOrientationWithAnimation:", 1);
  if (-[CFXCaptureViewController captureMode](self, "captureMode") != 1)
  {
    -[CFXCaptureViewController CFX_setFrameAndRenderSizes](self, "CFX_setFrameAndRenderSizes");
    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEnabled:", 1);
    }
    else
    {
      -[CFXCaptureViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cameraControlsViewControllerForCaptureViewController:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setShutterButtonEnabled:", 1);
    }

  }
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startRenderingCameraFrames");

}

- (void)cameraDidStop
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;

  if (-[CFXCaptureViewController observingOrientationChanges](self, "observingOrientationChanges"))
  {
    -[CFXCaptureViewController setObservingOrientationChanges:](self, "setObservingOrientationChanges:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("kJFXOrientationMonitorDeviceInterfaceOrientationNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("kJFXOrientationMonitorInterfaceOrientationNotification"), 0);

  }
  v5 = dispatch_semaphore_create(0);
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__CFXCaptureViewController_cameraDidStop__block_invoke;
  v8[3] = &unk_24EE57B60;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "stopRenderingCameraFrames:", v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __41__CFXCaptureViewController_cameraDidStop__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)effectCompositionDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CFXCaptureViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureViewController:didChangeEffectComposition:", self, v4);

}

- (void)CFX_addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  char v26;
  _OWORD v27[3];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
  objc_msgSend(v6, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renderSize");
  objc_msgSend(v7, "setRenderSize:");

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameSize");
  objc_msgSend(v7, "setPlayableAspectRatio:", aspectRatioForSize(v10, v11));

  objc_msgSend(v7, "setPlayableAspectRatioPreservationMode:", 0);
  objc_msgSend(v7, "renderEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = kDefaultEffectPreviewAnimationRange;
  v27[1] = xmmword_226AB8860;
  v27[2] = xmmword_226AB8870;
  objc_msgSend(v12, "setEffectRange:", v27);

  if (v4
    && +[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v7))
  {
    objc_msgSend(v6, "jtEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    objc_msgSend(v13, "setHidden:", 1);

  }
  else
  {
    v14 = 0;
  }
  JFXLog_core();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = MEMORY[0x2276A20D4]();
    *(_DWORD *)buf = 134349056;
    v29 = v16;
    _os_log_impl(&dword_2269A9000, v15, OS_LOG_TYPE_DEFAULT, "Available memory: %{iec-bytes,public}zu", buf, 0xCu);
  }

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pauseRenderingCameraFrames");

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "flushRenderer");

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "composition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke;
  v23[3] = &unk_24EE5B3D8;
  v23[4] = self;
  v24 = v7;
  v26 = v14;
  v25 = v6;
  v21 = v6;
  v22 = v7;
  objc_msgSend(v20, "addEffect:completion:", v21, v23);

}

void __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeRenderingCameraFrames");

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke_2;
  v14 = &unk_24EE5B3D8;
  v3 = *(id *)(a1 + 40);
  v18 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v16 = v4;
  v17 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], &v11);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "composition", v11, v12, v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectCompositionDidChange:", v6);

  CFXLog_action();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jtEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effect added"), CFSTR("live"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v10;
    _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
}

void __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
  {
    v2 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
    {
      if ((objc_msgSend(v2, "presentFullScreenTextEditorForEffect:insertingEffect:", *(_QWORD *)(a1 + 32), 1) & 1) == 0)
      {
        JFXLog_viewerUI();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Cannot display text editor on insert because its already open", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "cameraViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "composition");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeEffect:completion:", *(_QWORD *)(a1 + 48), 0);

      }
    }
    else if (isStreamingMode(objc_msgSend(v2, "captureMode")))
    {
      objc_msgSend(*(id *)(a1 + 48), "jtEffect");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "enableAnimationForOverlayEffect:", v6);

    }
  }
}

- (void)addEffect:(id)a3
{
  -[CFXCaptureViewController addEffect:allowImmediateTextEditing:](self, "addEffect:allowImmediateTextEditing:", a3, 1);
}

- (void)addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  id v31;
  CFXCaptureViewController *v32;
  id v33;
  uint64_t v34;
  char v35;
  BOOL v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  JFXLog_effects();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "jtEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v8, "type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v9;
    v39 = 2114;
    v40 = v10;
    v41 = 1024;
    v42 = v4;
    _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, allowImmediateTextEditing: %d", buf, 0x1Cu);

  }
  objc_msgSend(v6, "jtEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  if (v12 != 2)
  {
    objc_msgSend(v6, "jtEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke_2;
    v26[3] = &unk_24EE5B428;
    v26[4] = self;
    v27 = v6;
    v28 = v4;
    v19 = v6;
    objc_msgSend(v18, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v26);

    goto LABEL_13;
  }
  v13 = 0x3FD6666666666666;
  if (!-[CFXCaptureViewController CFX_canApplyFaceTracking](self, "CFX_canApplyFaceTracking"))
    goto LABEL_9;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mostRecentARMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "faceAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {

LABEL_9:
    v17 = 0;
    v15 = 0;
    goto LABEL_10;
  }
  v17 = 1;
  v13 = 0x3FE399999999999ALL;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("CFX_CaptureEffectInsertionSize"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "doubleValue");
    v13 = v21;
  }
  objc_msgSend(v6, "jtEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke;
  v29[3] = &unk_24EE5B400;
  v34 = v13;
  v35 = v17;
  v30 = v22;
  v31 = v15;
  v32 = self;
  v33 = v6;
  v36 = v4;
  v23 = v6;
  v24 = v15;
  v25 = v22;
  objc_msgSend(v25, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v29);

LABEL_13:
}

uint64_t __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[3];
  __int128 v26;
  uint64_t v27;

  v2 = *(double *)(a1 + 64);
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  v24 = *MEMORY[0x24BDC0D88];
  v26 = *MEMORY[0x24BDC0D88];
  v7 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v27 = v7;
  +[JFXEffectEditingUtilities nextNormalizedInsertionPointForOverlay:scaleRelativeToCenterSquare:atTime:applyTracking:withARMetadata:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:](JFXEffectEditingUtilities, "nextNormalizedInsertionPointForOverlay:scaleRelativeToCenterSquare:atTime:applyTracking:withARMetadata:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:", v4, &v26, v3, v5, 0, 1, v2, v6);
  v9 = v8;
  v11 = v10;
  v12 = *(double *)(a1 + 64);
  v13 = *(unsigned __int8 *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  if (v16)
    objc_msgSend(v16, "overlayTransformForLocalViewfinder");
  else
    memset(v25, 0, sizeof(v25));
  v17 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frameSize");
  v21 = aspectRatioForSize(v19, v20);
  v26 = v24;
  v27 = v7;
  LODWORD(v23) = 1;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v14, &v26, 1, 1, v13 != 0, 0, v9, v11, v12, 0.0, v15, v25, 0, v23,
    v17,
    v21,
    0);

  return objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:allowImmediateTextEditing:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 73));
}

uint64_t __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_addEffect:allowImmediateTextEditing:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)addOverlayEffect:(id)a3 atNormalizedPlanePoint:(CGPoint)a4 scale:(double)a5 rotationAngle:(double)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  CFXCaptureViewController *v28;
  id v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;
  CGPoint v46;

  y = a4.y;
  x = a4.x;
  v45 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  JFXLog_effects();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "jtEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v13, "type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46.x = x;
    v46.y = y;
    NSStringFromCGPoint(v46);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v36 = v14;
    v37 = 2114;
    v38 = v15;
    v39 = 2114;
    v40 = v16;
    v41 = 2048;
    v42 = a5;
    v43 = 2048;
    v44 = a6;
    _os_log_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, point: %{public}@, scale: %f, rotationAngle: %f", buf, 0x34u);

  }
  if (-[CFXCaptureViewController CFX_canApplyFaceTracking](self, "CFX_canApplyFaceTracking"))
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mostRecentARMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "faceAnchor");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;

    if (v19)
      v19 = v18;

  }
  else
  {
    v19 = 0;
    v20 = 0;
  }
  objc_msgSend(v11, "jtEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __88__CFXCaptureViewController_addOverlayEffect_atNormalizedPlanePoint_scale_rotationAngle___block_invoke;
  v25[3] = &unk_24EE5B450;
  v30 = x;
  v31 = y;
  v32 = a5;
  v33 = a6;
  v34 = v20;
  v26 = v21;
  v27 = v19;
  v28 = self;
  v29 = v11;
  v22 = v11;
  v23 = v19;
  v24 = v21;
  objc_msgSend(v24, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v25);

}

uint64_t __88__CFXCaptureViewController_addOverlayEffect_atNormalizedPlanePoint_scale_rotationAngle___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  double v14;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[3];

  v2 = *(double *)(a1 + 80);
  v3 = *(double *)(a1 + 88);
  v4 = *(unsigned __int8 *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  if (v7)
    objc_msgSend(v7, "overlayTransformForLocalViewfinder");
  else
    memset(v19, 0, sizeof(v19));
  v8 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameSize");
  v12 = aspectRatioForSize(v10, v11);
  v13 = *(double *)(a1 + 64);
  v14 = *(double *)(a1 + 72);
  v17 = *MEMORY[0x24BDC0D88];
  v18 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  LODWORD(v16) = 1;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v5, &v17, 0, 0, v4 != 0, 0, v13, v14, v2, v3, v6, v19, 0, v16,
    v8,
    v12,
    0);

  return objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:allowImmediateTextEditing:", *(_QWORD *)(a1 + 56), 1);
}

- (void)addOverlayEffect:(id)a3 atScreenLocation:(CGPoint)a4 atScreenSize:(CGSize)a5 rotationAngle:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  BOOL v47;
  double v48;
  id v49;
  id v50;
  double v51;
  _QWORD v52[4];
  id v53;
  id v54;
  CFXCaptureViewController *v55;
  id v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  BOOL v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  double v72;
  uint64_t v73;
  CGPoint v74;
  CGSize v75;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v73 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  JFXLog_effects();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "jtEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v14, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v74.x = x;
    v74.y = y;
    NSStringFromCGPoint(v74);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v75.width = width;
    v75.height = height;
    NSStringFromCGSize(v75);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v64 = v15;
    v65 = 2114;
    v66 = v16;
    v67 = 2114;
    v68 = v17;
    v69 = 2114;
    v70 = v18;
    v71 = 2048;
    v72 = a6;
    _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, screenLocation: %{public}@, screenSize: %{public}@, rotationAngle: %f", buf, 0x34u);

  }
  objc_msgSend(v12, "jtEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 == 2)
  {
    v51 = a6;
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uncroppedCameraViewfinderPlaceholderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "frame");
    v24 = v23;
    v26 = v25;
    +[JFXMediaSettings renderSize](JFXMediaSettings, "renderSize");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v22, "convertPoint:fromView:", 0, x, y);
    v33 = CGPointConvertToCoordinateSpace(2uLL, 0, v31, v32, v24, v26, v28, v30);
    objc_msgSend(v22, "convertSize:fromView:", 0, width, height);
    v36 = CGRectMakeWithSizeAndCenterPoint(v28 * (v34 / v24), v30 * (v35 / v26), v33);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    objc_msgSend(v12, "jtEffect");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CFXCaptureViewController CFX_canApplyFaceTracking](self, "CFX_canApplyFaceTracking"))
    {
      +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "mostRecentARMetadata");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "faceAnchor");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = v46 != 0;

      v48 = v51;
      if (v46)
        v46 = v45;

    }
    else
    {
      v47 = 0;
      v46 = 0;
      v48 = v51;
    }
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __89__CFXCaptureViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle___block_invoke;
    v52[3] = &unk_24EE5B478;
    v57 = v36;
    v58 = v38;
    v59 = v40;
    v60 = v42;
    v61 = v48;
    v62 = v47;
    v53 = v43;
    v54 = v46;
    v55 = self;
    v56 = v12;
    v49 = v46;
    v50 = v43;
    objc_msgSend(v50, "loadRenderEffectInBackgroundWithCompletionOnMainQueue:", v52);

  }
}

uint64_t __89__CFXCaptureViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle___block_invoke(uint64_t a1)
{
  double v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _OWORD v20[3];

  v2 = *(double *)(a1 + 96);
  v3 = *(unsigned __int8 *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  if (v6)
    objc_msgSend(v6, "overlayTransformForLocalViewfinder");
  else
    memset(v20, 0, sizeof(v20));
  v7 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameSize");
  v11 = aspectRatioForSize(v9, v10);
  v12 = *(double *)(a1 + 64);
  v13 = *(double *)(a1 + 72);
  v14 = *(double *)(a1 + 80);
  v15 = *(double *)(a1 + 88);
  v18 = *MEMORY[0x24BDC0D88];
  v19 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  LODWORD(v17) = 1;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v5, &v18, v3 != 0, 1, v4, v20, v12, v13, v14, v15, v2, 0, v17, v7, v11,
    0);

  return objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:allowImmediateTextEditing:", *(_QWORD *)(a1 + 56), 1);
}

- (void)removeAllEffectsOfType:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  JFXLog_effects();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "Removing effects - type: %{public}@, animated: %d", buf, 0x12u);

  }
  -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", v4);
  objc_msgSend(v6, "identifier");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == CFSTR("Animoji"))
    -[CFXCaptureViewController removeAnimojiTrackingReticle](self, "removeAnimojiTrackingReticle");
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__CFXCaptureViewController_removeAllEffectsOfType_animated___block_invoke;
  v11[3] = &unk_24EE57B60;
  v11[4] = self;
  objc_msgSend(v10, "removeAllEffectsOfType:completion:", v6, v11);

}

void __60__CFXCaptureViewController_removeAllEffectsOfType_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectCompositionDidChange:", v3);

  CFXLog_action();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effects removed"), CFSTR("live"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)removeAllEffectsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  JFXLog_effects();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_2269A9000, v5, OS_LOG_TYPE_DEFAULT, "Removing all effects - animated: %d", buf, 8u);
  }

  -[CFXCaptureViewController removeAnimojiTrackingReticle](self, "removeAnimojiTrackingReticle");
  -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", v3);
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__CFXCaptureViewController_removeAllEffectsAnimated___block_invoke;
  v7[3] = &unk_24EE57B60;
  v7[4] = self;
  objc_msgSend(v6, "removeAllEffects:", v7);

}

void __53__CFXCaptureViewController_removeAllEffectsAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectCompositionDidChange:", v3);

  CFXLog_action();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effects removed"), CFSTR("live"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)removeEffectsForCameraSwitch
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  JFXLog_effects();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, "Removing face-tracked effects", buf, 2u);
  }

  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Animoji"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController removeAllEffectsOfType:animated:](self, "removeAllEffectsOfType:animated:", v4, 1);

  -[CFXCaptureViewController composition](self, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__CFXCaptureViewController_removeEffectsForCameraSwitch__block_invoke;
  v6[3] = &unk_24EE57B60;
  v6[4] = self;
  objc_msgSend(v5, "removeAllOverlayEffects:", v6);

}

void __56__CFXCaptureViewController_removeEffectsForCameraSwitch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectCompositionDidChange:", v3);

  CFXLog_action();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effects removed"), CFSTR("live"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)liveCaptureSnapshot
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
  void *v13;

  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CFXCaptureViewController liveCaptureContainerContainer](self, "liveCaptureContainerContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v5, v7, v9, v11, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)showLiveCaptureSnapshotBlurred:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double Width;
  void *v26;
  double Height;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  CGRect v38;
  CGRect v39;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
    v11 = objc_alloc(MEMORY[0x24BE14A78]);
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = (void *)objc_msgSend(v11, "initWithView:desiredAspectRatio:", v12, (uint64_t)(v15 / v17));
    -[CFXCaptureViewController setLiveCaptureContainerSnapshot:](self, "setLiveCaptureContainerSnapshot:", v18);

    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "origin");
    v21 = v20;
    v23 = v22;
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    Width = CGRectGetWidth(v38);
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    Height = CGRectGetHeight(v39);
    -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = -v21;
    v31 = -v23;
    if (v10 == 1)
      v30 = 0.0;
    else
      v31 = 0.0;
    objc_msgSend(v28, "setFrame:", v30, v31, Width, Height);

    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v33);

  }
  -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __79__CFXCaptureViewController_showLiveCaptureSnapshotBlurred_animated_completion___block_invoke;
  v36[3] = &unk_24EE59110;
  v37 = v8;
  v35 = v8;
  objc_msgSend(v34, "setBlurred:animated:style:withCompletionBlock:", v6, v5, 0, v36);

}

void __79__CFXCaptureViewController_showLiveCaptureSnapshotBlurred_animated_completion___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (void)saveLiveCaptureSnapshotForReview
{
  void *v3;
  id v4;

  -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    +[CFXPreviewViewController setLiveCaptureSnapshotView:](CFXPreviewViewController, "setLiveCaptureSnapshotView:", v4);

  }
}

- (void)removeLiveCaptureSnapshot
{
  void *v3;
  void *v4;

  -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXCaptureViewController liveCaptureContainerSnapshot](self, "liveCaptureContainerSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[CFXCaptureViewController setLiveCaptureContainerSnapshot:](self, "setLiveCaptureContainerSnapshot:", 0);
  }
}

- (void)setLiveCapturePresentationFrame:(CGRect)a3 withContentRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGRect v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGRect rect;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v46 = *MEMORY[0x24BDAC8D0];
  v13 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  -[CFXCaptureViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34.origin.x = v11;
  v34.origin.y = v10;
  v34.size.width = v9;
  v34.size.height = v8;
  objc_msgSend(v14, "convertRect:fromView:", 0, v11, v10, v9, v8);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v39 = 1.0 - width;
  v47.origin.x = v16;
  v47.origin.y = v18;
  v47.size.width = v20;
  v47.size.height = v22;
  v35 = width;
  v37 = CGRectGetWidth(v47) / width;
  v48.origin.x = v16;
  v48.origin.y = v18;
  v48.size.width = v20;
  v48.size.height = v22;
  v36 = height;
  v41 = v16 - v37 * x;
  rect.origin.x = x;
  v40 = CGRectGetHeight(v48) / height;
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  v23 = CGRectGetWidth(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v24 = 1.0 - height;
  v50.size.width = v39;
  v50.size.height = v24;
  v25 = v23 + v37 * CGRectGetWidth(v50);
  v51.origin.x = v16;
  v51.origin.y = v18;
  v51.size.width = v20;
  v51.size.height = v22;
  v38 = CGRectGetHeight(v51);
  v52.origin.x = x;
  v33 = y;
  v52.origin.y = y;
  v52.size.width = v39;
  v52.size.height = v24;
  v26 = v18 - v40 * y;
  v27 = v38 + v40 * CGRectGetHeight(v52);
  -[CFXCaptureViewController setExternalUncroppedPresentationRect:](self, "setExternalUncroppedPresentationRect:", v41, v26, v25, v27);
  -[CFXCaptureViewController setPresentationRect:](self, "setPresentationRect:", v16, v18, v20, v22);
  JFXLog_viewerUI();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    switch(v13)
    {
      case 1:
        v29 = CFSTR("UIInterfaceOrientationPortrait");
        break;
      case 3:
        v29 = CFSTR("UIInterfaceOrientationLandscapeRight");
        break;
      case 4:
        v29 = CFSTR("UIInterfaceOrientationLandscapeLeft");
        break;
      case 2:
        v29 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
        break;
      default:
        v29 = 0;
        break;
    }
    NSStringFromCGRect(v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53.origin.x = rect.origin.x;
    v53.origin.y = v33;
    v53.size.width = v35;
    v53.size.height = v36;
    NSStringFromCGRect(v53);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54.origin.x = v41;
    v54.origin.y = v26;
    v54.size.width = v25;
    v54.size.height = v27;
    NSStringFromCGRect(v54);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(rect.origin.y) = 138413058;
    *(_QWORD *)((char *)&rect.origin.y + 4) = v29;
    WORD2(rect.size.width) = 2112;
    *(_QWORD *)((char *)&rect.size.width + 6) = v30;
    HIWORD(rect.size.height) = 2112;
    v43 = v31;
    v44 = 2112;
    v45 = v32;
    _os_log_impl(&dword_2269A9000, v28, OS_LOG_TYPE_DEFAULT, "New presentation rect specified - orientation: %@, presentationRect: %@, contentsRect: %@, uncroppedPresentationRect: %@", (uint8_t *)&rect.origin.y, 0x2Au);

  }
  -[CFXCaptureViewController setCaptureContainerUncroppedFrameWasCalculatedWithContentRect:](self, "setCaptureContainerUncroppedFrameWasCalculatedWithContentRect:", 1);
  -[CFXCaptureViewController CFX_applyAutoRotationCorrectionToEditorViews](self, "CFX_applyAutoRotationCorrectionToEditorViews");
}

- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4
{
  -[CFXCaptureViewController setDockIsMagnified:](self, "setDockIsMagnified:", a3);
  -[CFXCaptureViewController setDockMagnifiedHeightDelta:](self, "setDockMagnifiedHeightDelta:", a4);
  -[CFXCaptureViewController configureUIForOrientation](self, "configureUIForOrientation");
}

- (void)updateUIForDevicePosition:(int64_t)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;

  if (a3 == 2)
  {
    if (-[CFXCaptureViewController captureMode](self, "captureMode") != 2)
    {
      objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isFrontFlashSupported");
      goto LABEL_7;
    }
LABEL_5:
    v7 = 1;
    goto LABEL_8;
  }
  if (a3 != 1)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBackFlashSupported");
LABEL_7:
  v7 = v6 ^ 1u;

LABEL_8:
  -[CFXCaptureViewController flashButton](self, "flashButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v7);

  -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flashIndicator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v7);

  if (!isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
    -[CFXCaptureViewController configureZoomControl](self, "configureZoomControl");
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopTrackingTimeIntervalEventWithName:", CFSTR("activefrontcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopTrackingTimeIntervalEventWithName:", CFSTR("activebackcameratime"));

  if (a3)
  {
    if (a3 == 1)
    {
      +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v14 = CFSTR("activebackcameratime");
    }
    else
    {
      if (a3 != 2)
        return;
      +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v14 = CFSTR("activefrontcameratime");
    }
  }
  else
  {
    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v14 = CFSTR("activeexternalcameratime");
  }
  objc_msgSend(v13, "startTrackingTimeIntervalEventWithName:", v14);

}

- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController
{
  void *v3;
  uint64_t v4;
  CFXEffectBrowserContentPresenterViewController *v5;
  CFXEffectBrowserContentPresenterViewController *effectBrowserContentPresenterViewController;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1
    && !self->_effectBrowserContentPresenterViewController
    && -[CFXCaptureViewController captureMode](self, "captureMode") != 1)
  {
    v5 = (CFXEffectBrowserContentPresenterViewController *)objc_opt_new();
    effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
    self->_effectBrowserContentPresenterViewController = v5;

  }
  return self->_effectBrowserContentPresenterViewController;
}

- (void)configureWithControlsViewController:(id)a3
{
  void *v4;
  int64_t v5;
  id v6;

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  v5 = -[CFXCaptureViewController captureMode](self, "captureMode");
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCaptureMode:", v5);

}

- (void)setLiveCaptureViewController:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  -[CFXCaptureViewController setCameraViewController:](self, "setCameraViewController:", a3);
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  if (+[JFXAnimojiEffectRenderer isSupported](JFXAnimojiEffectRenderer, "isSupported"))
  {
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrackingLossDelegate:", self);

  }
  v6 = -[CFXCaptureViewController captureMode](self, "captureMode");
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCaptureMode:", v6);

}

- (void)resign
{
  +[CFXFullScreenTextEditViewController resign](CFXFullScreenTextEditViewController, "resign");
}

- (void)updateZoomUIVisibility
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = -[CFXCaptureViewController CFX_isZoomAllowed](self, "CFX_isZoomAllowed") ^ 1;
  -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[CFXCaptureViewController zoomControl](self, "zoomControl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

}

- (void)updateZoomUIForCapturing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v4 = a4;
  if (-[CFXCaptureViewController captureMode](self, "captureMode", a3) == 2)
  {
    if (v4)
      v6 = 3;
    else
      v6 = 0;
    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldShowZoomDial:animationDuration:", 0, v6);

  }
  if (v4)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__CFXCaptureViewController_updateZoomUIForCapturing_animated___block_invoke;
    v8[3] = &unk_24EE57B60;
    v8[4] = self;
    +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v8, 0, 0.3);
  }
}

uint64_t __62__CFXCaptureViewController_updateZoomUIForCapturing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutZoomUI");
}

- (void)configureZoomControl
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  -[CFXCaptureViewController zoomControl](self, "zoomControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = 0;
  v36 = 0;
  -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v38, &v37, &v36);
  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v37;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v8 = -[CFXCaptureViewController CFX_isZoomAllowed](self, "CFX_isZoomAllowed");
  if (v7 == 1 && v5 == 1)
    v10 = 0;
  else
    v10 = objc_msgSend(v4, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:", v36, v37, 0);
  v11 = v38 <= 7 && v38 == 7;
  v12 = v38 <= 7 && v38 == 6;
  v13 = v38 <= 7 && v38 == 4;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoomFactor");
  v16 = v15;

  if (v8)
  {
    objc_msgSend(v4, "maximumZoomFactorForMode:device:videoConfiguration:", v36, v38, 0);
    v18 = v17;
    objc_msgSend(MEMORY[0x24BE14A98], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0, 1.0);
    v20 = v19;
    objc_msgSend(MEMORY[0x24BE14A98], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0, v18);
    v22 = v21;
    if (v11)
    {
      objc_msgSend(v4, "tripleCameraSwitchOverZoomFactorsForDevicePosition:", v37);
      v24 = v23;
      v26 = v25;
      objc_msgSend(MEMORY[0x24BE14A98], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0);
      v28 = v27;
      objc_msgSend(MEMORY[0x24BE14A98], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0, v26);
      objc_msgSend(v3, "configureForTripleDeviceWithZoomFactor:minimumZoomFactor:displayMinimumZoomFactor:maximumZoomFactor:displayMaximumZoomFactor:switchOverZoomFactor1:displaySwitchOverZoomFactor1:switchOverZoomFactor2:displaySwitchOverZoomFactor2:", v16, 1.0, v20, v18, v22, v24, v28, v26, v29);
    }
    else if (v12 || v13)
    {
      if (v12)
        objc_msgSend(v4, "wideDualCameraSwitchOverZoomFactorForDevicePosition:", v37);
      else
        objc_msgSend(v4, "dualCameraSwitchOverZoomFactorForDevicePosition:", v37);
      v32 = v31;
      objc_msgSend(MEMORY[0x24BE14A98], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0);
      objc_msgSend(v3, "configureForDualDeviceWithZoomFactor:minimumZoomFactor:displayMinimumZoomFactor:maximumZoomFactor:displayMaximumZoomFactor:dualCameraSwitchOverZoomFactor:displayDualCameraSwitchOverZoomFactor:", v16, 1.0, v20, v18, v22, v32, v33);
    }
    else if (v5 == 1)
    {
      objc_msgSend(v3, "configureForZoomSymbolToggle");
      objc_msgSend(v3, "setZoomButtonSymbol:animated:", 1, 0);
    }
    else
    {
      objc_msgSend(v3, "configureForSingleCameraPlusToggleWithZoomFactor:minimumZoomFactor:displayMinimumZoomFactor:maximumZoomFactor:displayMaximumZoomFactor:", v16, 1.0, v20, v18, v21);
    }
  }
  else if (v10)
  {
    switch(v38)
    {
      case 3uLL:
        v30 = 2.0;
        break;
      case 4uLL:
        v34 = v36 == 6;
        v35 = 1.0;
        v30 = 2.0;
        goto LABEL_34;
      case 5uLL:
        v30 = 0.5;
        break;
      case 6uLL:
        v34 = v36 == 6;
        v35 = 0.5;
        v30 = 1.0;
LABEL_34:
        if (!v34)
          v30 = v35;
        break;
      default:
        v30 = 1.0;
        break;
    }
    objc_msgSend(v3, "configureForToggleOnlyWithZoomFactor:displayZoomFactor:", 1.0, v30);
  }

}

- (BOOL)CFX_isZoomAllowed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
    return 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v12, &v11, &v10);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");
  v5 = v11;

  if (v4 == 1 && v5 == 1)
    return 0;
  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isZoomAllowedForMode:device:videoConfiguration:", v10, v12, 0);

  return v8;
}

- (void)CFX_getCaptureDevice:(int64_t *)a3 captureDevicePosition:(int64_t *)a4 captureMode:(int64_t *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cameraPosition");

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cameraType");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CFXCaptureViewController CFX_getCAMCaptureForPosition:type:captureDevice:captureDevicePosition:captureMode:](self, "CFX_getCAMCaptureForPosition:type:captureDevice:captureDevicePosition:captureMode:", v10, v12, a3, a4, a5);
}

- (void)CFX_getCAMCaptureForPosition:(int64_t)a3 type:(id)a4 captureDevice:(int64_t *)a5 captureDevicePosition:(int64_t *)a6 captureMode:(int64_t *)a7
{
  int64_t v12;
  uint64_t *v13;
  id v14;
  void *v15;
  int64_t v16;
  id v17;

  v17 = a4;
  if (CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__onceToken != -1)
    dispatch_once(&CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__onceToken, &__block_literal_global_55);
  v12 = a3 == 2;
  v13 = &CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__frontCameraLookup;
  if (a3 != 2)
    v13 = &CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__backCameraLookup;
  v14 = (id)*v13;
  objc_msgSend(v14, "objectForKeyedSubscript:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  *a5 = v16;
  *a6 = v12;
  *a7 = -[CFXCaptureViewController captureMode](self, "captureMode") != 0;

}

void __110__CFXCaptureViewController_CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDB1A58];
  v10[0] = *MEMORY[0x24BDB1A48];
  v10[1] = v0;
  v11[0] = &unk_24EE9BDE0;
  v11[1] = &unk_24EE9BDF8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__frontCameraLookup;
  CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__frontCameraLookup = v1;

  v3 = *MEMORY[0x24BDB1A28];
  v8[0] = *MEMORY[0x24BDB1A40];
  v8[1] = v3;
  v9[0] = &unk_24EE9BE10;
  v9[1] = &unk_24EE9BE28;
  v4 = *MEMORY[0x24BDB1A50];
  v8[2] = *MEMORY[0x24BDB1A20];
  v8[3] = v4;
  v9[2] = &unk_24EE9BE40;
  v9[3] = &unk_24EE9BE58;
  v5 = *MEMORY[0x24BDB1A30];
  v8[4] = v0;
  v8[5] = v5;
  v9[4] = &unk_24EE9BE70;
  v9[5] = &unk_24EE9BE88;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__backCameraLookup;
  CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__backCameraLookup = v6;

}

- (void)layoutZoomControlRelativeToBottomBarAndPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CFXCaptureViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraControlsViewControllerForCaptureViewController:", self);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE14A98];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cam_initialLayoutStyle");
  objc_msgSend(v11, "bottomBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutZoomControl:forLayoutStyle:bottomBar:previewView:", v4, v8, v9, v10);

}

- (void)layoutZoomSliderRelativeToBottomBarAndPreview
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double Width;
  void *v68;
  uint64_t v69;
  CGFloat Height;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  double v97;
  double v98;
  id v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  -[CFXCaptureViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraControlsViewControllerForCaptureViewController:", self);
  v99 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v99, "bottomBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "backgroundStyle");
  objc_msgSend(v4, "layoutIfNeeded");
  objc_msgSend(v4, "shutterButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v8, "alignmentRectForFrame:");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:toView:", v6, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "zoomControlSupported");

    if ((v27 & 1) == 0)
    {
      -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "superview");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      objc_msgSend(v29, "convertRect:toView:", v6);
      v19 = v31;
      v21 = v32;
      v23 = v33;
      v25 = v34;

    }
  }
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", v6);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v25;
  if (!objc_msgSend(v43, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v44 = v23;
    v45 = v21;
    v46 = v19;
    if ((uint64_t)v48 == 568)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "bounds");
      v51 = (uint64_t)v50;

      if (v51 != 568)
        goto LABEL_10;
    }
    v36 = 0.0;
    *(double *)&v42 = 141.0;
    *(double *)&v40 = 320.0;
    *(double *)&v38 = 427.0;
    goto LABEL_10;
  }
  v44 = v23;
  v45 = v21;
  v46 = v19;

LABEL_10:
  v95 = *(double *)&v38;
  v96 = *(double *)&v40;
  v97 = *(double *)&v42;
  v98 = v36;
  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bounds");
  objc_msgSend(v52, "convertRect:toView:", v6);
  v93 = v55;
  v94 = v54;
  v91 = v57;
  v92 = v56;

  -[CFXCaptureViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bounds");
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;

  v100.origin.x = v60;
  v100.origin.y = v62;
  v100.size.width = v64;
  v100.size.height = v66;
  Width = CGRectGetWidth(v100);
  v101.origin.x = v60;
  v101.origin.y = v62;
  v101.size.width = v64;
  v101.size.height = v66;
  if (Width > CGRectGetHeight(v101))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "userInterfaceIdiom");

    if (!v69)
    {
      v102.origin.x = v60;
      v102.origin.y = v62;
      v102.size.width = v64;
      v102.size.height = v66;
      Height = CGRectGetHeight(v102);
      v103.origin.x = v60;
      v103.origin.y = v62;
      v103.size.width = v64;
      v103.size.height = v66;
      v66 = CGRectGetWidth(v103);
      v64 = Height;
    }
  }
  objc_msgSend(v6, "frame");
  v71 = CGRectGetWidth(v104);
  objc_msgSend(v6, "frame");
  if (v71 <= CGRectGetHeight(v105))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "userInterfaceIdiom"))
  {

LABEL_16:
    v73 = v46;
    v74 = v45;
    v75 = v44;
    v76 = v90;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v46;
  if (objc_msgSend(v80, "userInterfaceIdiom"))
  {

    v74 = v45;
    v75 = v44;
    v76 = v90;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "bounds");
    v74 = v45;
    v75 = v44;
    v76 = v90;
    if ((uint64_t)v86 == 568)
    {

      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bounds");
    v89 = (uint64_t)v88;

    if (v89 == 568)
      goto LABEL_17;
  }
  objc_msgSend(v4, "frame");
  v97 = v82;
  v98 = v81;
  v95 = v83;
  v96 = v84;
LABEL_17:
  v77 = (void *)MEMORY[0x24BE14AA8];
  -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:", v78, objc_msgSend(v79, "cam_initialLayoutStyle"), v7 == 1, v98, v95, v96, v97, v73, v74, v75, v76, v94, v93, v92, v91, *(_QWORD *)&v60,
    *(_QWORD *)&v62,
    *(_QWORD *)&v64,
    *(_QWORD *)&v66);

}

- (void)layoutZoomControlForCTM
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;

  -[CFXCaptureViewController zoomControl](self, "zoomControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v39 = (id)objc_claimAutoreleasedReturnValue();

  -[CFXCaptureViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraControlsViewControllerForCaptureViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", v39);
  v37 = v8;
  v38 = v7;
  v35 = v10;
  v36 = v9;
  -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  objc_msgSend(v12, "convertRect:toView:", v39);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  objc_msgSend(v22, "convertRect:toView:", v39);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)MEMORY[0x24BE14A98];
  -[CFXCaptureViewController zoomControl](self, "zoomControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:", v33, objc_msgSend(v34, "cam_initialLayoutStyle"), 0, v38, v37, v36, v35, v15, v17, v19, v21, v25, v27, v29, v31);

}

- (void)layoutZoomUI
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int IsCTMSupported;
  int v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  _OWORD v42[3];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGRect v56;
  CGRect v57;

  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBackDualSupported");
  v5 = objc_msgSend(v3, "zoomControlSupported");
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (!v7)
  {
    +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");

    +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
    IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
    if ((v4 | IsCTMSupported) == 1)
    {
      v16 = IsCTMSupported;
      -[CFXCaptureViewController zoomControlFrame](self, "zoomControlFrame");
      v56.origin.x = v17;
      v56.origin.y = v18;
      v56.size.width = v19;
      v56.size.height = v20;
      if (CGRectEqualToRect(*MEMORY[0x24BDBF090], v56))
      {
        if (v16)
        {
          if (v5)
            -[CFXCaptureViewController layoutZoomControlForCTM](self, "layoutZoomControlForCTM");
          else
            -[CFXCaptureViewController layoutZoomSliderRelativeToBottomBarAndPreview](self, "layoutZoomSliderRelativeToBottomBarAndPreview");
        }
        else
        {
          -[CFXCaptureViewController zoomControl](self, "zoomControl");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[CFXCaptureViewController layoutZoomControlRelativeToBottomBarAndPreview:](self, "layoutZoomControlRelativeToBottomBarAndPreview:", v41);

        }
        -[CFXCaptureViewController zoomControl](self, "zoomControl");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "frame");
        -[CFXCaptureViewController setZoomControlFrame:](self, "setZoomControlFrame:");
        goto LABEL_19;
      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v26 = (void *)MEMORY[0x24BE72D80];
      -[CFXCaptureViewController zoomControlFrame](self, "zoomControlFrame");
      objc_msgSend(v26, "orientedGeometryForFrame:inBounds:orientation:", 1);
      v47 = v53;
      v48 = v54;
      v49 = v55;
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v47;
      v46[1] = v48;
      v46[2] = v49;
      objc_msgSend(v27, "setTransform:", v46);

      v29 = *((double *)&v52 + 1);
      v28 = *(double *)&v52;
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCenter:", v28, v29);

      v32 = *((double *)&v50 + 1);
      v31 = *(double *)&v50;
      v34 = *((double *)&v51 + 1);
      v33 = *(double *)&v51;
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CFXCaptureViewController zoomSliderFrame](self, "zoomSliderFrame");
      v57.origin.x = v21;
      v57.origin.y = v22;
      v57.size.width = v23;
      v57.size.height = v24;
      if (CGRectEqualToRect(*MEMORY[0x24BDBF090], v57))
      {
        -[CFXCaptureViewController layoutZoomSliderRelativeToBottomBarAndPreview](self, "layoutZoomSliderRelativeToBottomBarAndPreview");
        -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "frame");
        -[CFXCaptureViewController setZoomSliderFrame:](self, "setZoomSliderFrame:");
LABEL_19:

        goto LABEL_20;
      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v36 = (void *)MEMORY[0x24BE72D80];
      -[CFXCaptureViewController zoomSliderFrame](self, "zoomSliderFrame");
      objc_msgSend(v36, "orientedGeometryForFrame:inBounds:orientation:", 1);
      v43 = v53;
      v44 = v54;
      v45 = v55;
      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v43;
      v42[1] = v44;
      v42[2] = v45;
      objc_msgSend(v37, "setTransform:", v42);

      v39 = *((double *)&v52 + 1);
      v38 = *(double *)&v52;
      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCenter:", v38, v39);

      v32 = *((double *)&v50 + 1);
      v31 = *(double *)&v50;
      v34 = *((double *)&v51 + 1);
      v33 = *(double *)&v51;
      -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v35;
    objc_msgSend(v35, "setBounds:", v31, v32, v33, v34);
    goto LABEL_15;
  }
  if (v5)
  {
    -[CFXCaptureViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9 * 0.5;

    v11 = (void *)MEMORY[0x24BE14A98];
    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:", v12, 1, objc_msgSend(v13, "cam_initialLayoutStyle"), 375.0, 20.5, 0.0, 0.0, -82.5, v10);

LABEL_15:
    goto LABEL_20;
  }
  -[CFXCaptureViewController layoutZoomSliderRelativeToBottomBarAndPreview](self, "layoutZoomSliderRelativeToBottomBarAndPreview");
LABEL_20:

}

- (void)handlePinchGestureRecognizer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (!isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
    -[CFXCaptureViewController CFX_handleZoomPinchGestureRecognizer:](self, "CFX_handleZoomPinchGestureRecognizer:", v11);
  -[CFXCaptureViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXCaptureViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "state");
    objc_msgSend(v11, "scale");
    v9 = v8;
    objc_msgSend(v11, "velocity");
    objc_msgSend(v6, "captureViewController:presentationRectWasPinchedWithState:scale:velocity:", self, v7, v9, v10);

  }
}

- (double)CFX_maxZoomForCamera
{
  void *v2;
  double v3;
  double v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 1;
  v6 = 0;
  -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v8, &v7, &v6);
  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumZoomFactorForMode:device:videoConfiguration:", v6, v8, 0);
  v4 = v3;

  return v4;
}

- (void)zoomSliderValueDidChange:(id)a3 forEvent:(id)a4
{
  float v5;
  long double v6;
  long double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isAutozooming") & 1) == 0)
  {
    objc_msgSend(v10, "value");
    v6 = v5;
    -[CFXCaptureViewController CFX_maxZoomForCamera](self, "CFX_maxZoomForCamera");
    v8 = pow(v7, v6);
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rampToZoom:duration:", v8, 0.25);

  }
}

- (void)zoomSliderDidBeginAutozooming:(id)a3
{
  double v4;
  double v5;
  _BOOL4 v6;
  void *v7;
  double v8;
  id v9;

  v4 = 1.0;
  if ((objc_msgSend(a3, "isMinimumAutozooming") & 1) == 0)
  {
    -[CFXCaptureViewController CFX_maxZoomForCamera](self, "CFX_maxZoomForCamera");
    *(float *)&v5 = v5;
    v4 = *(float *)&v5;
  }
  v6 = -[CFXCaptureViewController isRecording](self, "isRecording");
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v8 = 0.75;
  if (!v6)
    v8 = 1.5;
  objc_msgSend(v7, "rampToZoom:rate:", v4, v8);

}

- (void)zoomSliderDidEndAutozooming:(id)a3
{
  void *v4;
  _QWORD v5[5];

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__CFXCaptureViewController_zoomSliderDidEndAutozooming___block_invoke;
  v5[3] = &unk_24EE5B4C0;
  v5[4] = self;
  objc_msgSend(v4, "stopRampToZoom:", v5);

}

uint64_t __56__CFXCaptureViewController_zoomSliderDidEndAutozooming___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_setZoomSliderFromZoomFactor:");
}

- (void)CFX_setZoomSliderFromZoomFactor:(double)a3
{
  double v5;
  long double v6;
  long double v7;
  double v8;
  id v9;

  -[CFXCaptureViewController CFX_maxZoomForCamera](self, "CFX_maxZoomForCamera");
  v6 = v5;
  v7 = log(a3);
  *(float *)&v7 = v7 / log(v6);
  -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = LODWORD(v7);
  objc_msgSend(v9, "setValue:", v8);

}

- (void)zoomControl:(id)a3 didChangeZoomFactor:(double)a4 interactionType:(int64_t)a5
{
  NSObject *v9;
  void *v10;
  BOOL v12;
  double v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  JFXLog_DebugCapture();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CFXCaptureViewController zoomControl:didChangeZoomFactor:interactionType:].cold.1(a2, v9, a4);

  if (a5 == 1)
  {
    v17 = 0;
    v15 = 0;
    v16 = 0;
    -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v17, &v16, &v15);
    v12 = ((v17 & 0xFFFFFFFFFFFFFFFDLL) == 5 || v17 == 6) && a4 == 1.0;
    v13 = 0.1;
    if (v12)
      v13 = 0.2;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__CFXCaptureViewController_zoomControl_didChangeZoomFactor_interactionType___block_invoke;
    v14[3] = &unk_24EE5A250;
    v14[4] = self;
    *(double *)&v14[5] = a4;
    *(double *)&v14[6] = v13;
    +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v14, 0, 0.15);
  }
  else if (!a5)
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rampToZoom:duration:", a4, 0.25);

  }
}

void __76__CFXCaptureViewController_zoomControl_didChangeZoomFactor_interactionType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutZoomUI");
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rampToZoom:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (BOOL)canToggleBetweenZoomFactorsForZoomControl:(id)a3
{
  BOOL result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 1;
  v5 = 0;
  -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v7, &v6, &v5);
  result = -[CFXCaptureViewController CFX_isZoomAllowed](self, "CFX_isZoomAllowed");
  if (v7 != 9)
    return 0;
  return result;
}

- (void)toggleBetweenZoomFactorsForZoomControl:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[5];
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (!-[CFXCaptureViewController cameraIsFlipping](self, "cameraIsFlipping"))
  {
    -[CFXCaptureViewController setCameraIsFlipping:](self, "setCameraIsFlipping:", 1);
    v10 = 0;
    v11 = 0;
    v9 = 0;
    -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v11, &v10, &v9);
    v5 = objc_msgSend(v4, "zoomButtonSymbol") == 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke;
    v6[3] = &unk_24EE5AC78;
    v8 = v5;
    v6[4] = self;
    v7 = v4;
    -[CFXCaptureViewController showLiveCaptureSnapshotBlurred:animated:completion:](self, "showLiveCaptureSnapshotBlurred:animated:completion:", 1, 1, v6);

  }
}

void __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_2;
  v5[3] = &unk_24EE5AC78;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v6 = v4;
  objc_msgSend(v2, "setFFCZoom:completion:", v3, v5);

}

void __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_3;
  v5[3] = &unk_24EE5AC78;
  v8 = *(_BYTE *)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "executeAfterNextFrameIsRendered:", v5);

}

uint64_t __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setZoomButtonSymbol:animated:", *(unsigned __int8 *)(a1 + 48), 1);
  v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_4;
  v4[3] = &unk_24EE57B60;
  v4[4] = v2;
  return objc_msgSend(v2, "showLiveCaptureSnapshotBlurred:animated:completion:", 0, 1, v4);
}

uint64_t __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeLiveCaptureSnapshot");
  return objc_msgSend(*(id *)(a1 + 32), "setCameraIsFlipping:", 0);
}

- (void)cameraControlsViewControllerEffectsButtonWasTapped:(id)a3
{
  id v4;

  -[CFXCaptureViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureViewControllerEffectsButtonWasTapped:", self);

}

- (void)cameraControlsViewControllerSwitchCameraButtonWasTapped:(id)a3
{
  void *v4;
  void *v5;
  CFXViewfinderFlipTransition *v6;
  void *v7;
  void *v8;
  CFXViewfinderFlipTransition *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD block[6];
  _QWORD v24[5];
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[7];
  _QWORD v28[4];
  NSObject *v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!-[CFXCaptureViewController cameraIsFlipping](self, "cameraIsFlipping", a3))
  {
    -[CFXCaptureViewController setCameraIsFlipping:](self, "setCameraIsFlipping:", 1);
    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 0);
    v6 = [CFXViewfinderFlipTransition alloc];
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CFXViewfinderFlipTransition initWithViewfinderView:](v6, "initWithViewfinderView:", v8);
    -[CFXCaptureViewController setViewfinderFlipTransition:](self, "setViewfinderFlipTransition:", v9);

    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "cameraPosition");

    v12 = v11 == 2;
    if (v11 == 2)
      v13 = 1;
    else
      v13 = 2;
    JFXLog_viewerUI();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v11;
      _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "Starting switch camera transition from: %ld", buf, 0xCu);
    }

    v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    -[CFXCaptureViewController viewfinderFlipTransition](self, "viewfinderFlipTransition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke;
    v28[3] = &unk_24EE57B60;
    v18 = v15;
    v29 = v18;
    objc_msgSend(v16, "performFlipTransitionWithDirection:completionHandler:", v12, v28);

    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopRenderingCameraFrames");

    v20 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
    dispatch_group_enter(v18);
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v13;
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_2;
    v27[3] = &unk_24EE5A308;
    v27[4] = self;
    v27[5] = v13;
    v27[6] = v20;
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_3;
    v24[3] = &unk_24EE5B4E8;
    v24[4] = self;
    v25 = v18;
    v22 = v18;
    objc_msgSend(v21, "switchCameraToPosition:applyFFCZoom:configureLockedCamera:completion:", v13, 1, v27, v24);

    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_4;
    block[3] = &unk_24EE58078;
    block[4] = self;
    block[5] = v13;
    dispatch_group_notify(v22, MEMORY[0x24BDAC9B8], block);

  }
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CFX_getCAMCaptureForPosition:type:captureDevice:captureDevicePosition:captureMode:", v4, v6, &v12, &v11, &v10);

  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultZoomFactorForMode:device:videoConfiguration:captureOrientation:", v10, v12, 0, a1[6]);
  v9 = v8;

  objc_msgSend(v5, "setVideoZoomFactor:", v9);
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "removeEffectsForCameraSwitch");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureViewController:switchedToCameraPosition:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRenderingCameraFrames");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[6];

  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_5;
  v4[3] = &unk_24EE58078;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v3;
  objc_msgSend(v2, "executeAfterNextFrameIsRendered:", v4);

}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomFactor");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "zoomControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomFactor:", v4);

  objc_msgSend(*(id *)(a1 + 32), "updateUIForDevicePosition:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "viewfinderFlipTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_6;
  v8[3] = &unk_24EE58078;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v7;
  objc_msgSend(v6, "completeTransitionToLivePreviewWithCompletionHandler:", v8);

}

uint64_t __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  JFXLog_viewerUI();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 40);
    v10 = 134217984;
    v11 = v3;
    _os_log_impl(&dword_2269A9000, v2, OS_LOG_TYPE_DEFAULT, "Finished switch camera transition to: %ld", (uint8_t *)&v10, 0xCu);
  }

  CFXLog_action();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("camera flipped"), CFSTR("live"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "updateZoomUIVisibility");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "captureViewControllerCameraFlipButtonWasTapped:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "setCameraIsFlipping:", 0);
}

- (void)insertCamBottomBar:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CFXCaptureViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController topBar](self, "topBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:above:", v4, v5);

}

- (CGRect)bottomBarCTMControlsFrameForWindowOrientation:(int64_t)a3 bounds:(CGRect)a4
{
  double height;
  CGFloat width;
  double y;
  double x;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double MaxY;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((unint64_t)(a3 - 3) > 1)
  {
    v9 = a4.size.width;
  }
  else
  {
    v9 = CGRectGetHeight(a4);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    height = CGRectGetWidth(v21);
    x = 0.0;
    y = 0.0;
  }
  v10 = objc_alloc(MEMORY[0x24BE14A68]);
  -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intrinsicContentSize");
  v14 = (void *)objc_msgSend(v10, "initWithReferenceBounds:shutterIntrinsicSize:", x, y, v9, height, v12, v13);

  objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, 1, 0);
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = v9;
  v23.size.height = height;
  v16 = CGRectGetWidth(v23);

  v17 = 0.0;
  v18 = MaxY;
  v19 = v16;
  v20 = height - MaxY;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)liveCaptureViewController:(id)a3 didRenderFrame:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v5 = a4;
  -[CFXCaptureViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureViewController:didRenderFrame:", self, v5);

  if (-[CFXCaptureViewController CFX_isRenderingAnimatedOverlaysThatDontLoop](self, "CFX_isRenderingAnimatedOverlaysThatDontLoop"))
  {
    v7 = (void *)objc_opt_new();
    -[CFXCaptureViewController runOnceAnimatedOverlays](self, "runOnceAnimatedOverlays");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __69__CFXCaptureViewController_liveCaptureViewController_didRenderFrame___block_invoke;
    v14 = &unk_24EE5B510;
    v15 = v5;
    v16 = v7;
    v9 = v7;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v11);

    +[JFXEffectEditingUtilities disableAnimationForEffects:](JFXEffectEditingUtilities, "disableAnimationForEffects:", v9, v11, v12, v13, v14);
    -[CFXCaptureViewController runOnceAnimatedOverlays](self, "runOnceAnimatedOverlays");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsInArray:", v9);

  }
}

void __69__CFXCaptureViewController_liveCaptureViewController_didRenderFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime v9;
  CMTime lhs;
  CMTime v11;
  __int128 v12;
  _OWORD v13[2];
  CMTime time2;
  CMTime time1;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CMTime v19;

  v3 = a2;
  objc_msgSend(v3, "renderEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "effectRange");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  *(_OWORD *)&v19.value = v16;
  v19.epoch = v17;

  time1 = v19;
  *(_OWORD *)&time2.value = CFXEffectPreviewStartAtNextRenderTime;
  time2.epoch = 0;
  if (CMTimeCompare(&time1, &time2))
  {
    memset(&time1, 0, sizeof(time1));
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v6, "requestTime");
    objc_msgSend(v3, "renderEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "effectRange");
    }
    else
    {
      memset(v13, 0, sizeof(v13));
      v12 = 0u;
    }
    time2 = *(CMTime *)((char *)v13 + 8);

    memset(&v11, 0, sizeof(v11));
    lhs = time1;
    v9 = v19;
    CMTimeSubtract(&v11, &lhs, &v9);
    lhs = v11;
    v9 = time2;
    if ((CMTimeCompare(&lhs, &v9) & 0x80000000) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (BOOL)CFX_isRenderingAnimatedOverlaysThatDontLoop
{
  void *v2;
  BOOL v3;

  -[CFXCaptureViewController runOnceAnimatedOverlays](self, "runOnceAnimatedOverlays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)liveCaptureViewController:(id)a3 livePreviewTappedAtNormalizedPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  __int128 v17;
  uint64_t v18;

  y = a4.y;
  x = a4.x;
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCapturing");

  if ((v8 & 1) == 0)
  {
    -[CFXCaptureViewController composition](self, "composition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "jtEffectsForType:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "normalizedMinimumHitTestArea");
      v13 = v12;
      v15 = v14;

      v17 = *MEMORY[0x24BDC0D88];
      v18 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v10, &v17, 1, x, y, v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[CFXCaptureViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v16, 0);

    }
  }
}

- (void)liveCaptureViewController:(id)a3 livePreviewPannedAtNormalizedPoint:(CGPoint)a4 gesture:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  __int128 v39;
  uint64_t v40;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  if (objc_msgSend(v8, "state") == 1)
  {
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCapturing");

    if ((v10 & 1) != 0)
      goto LABEL_49;
  }
  v11 = objc_msgSend(v8, "state");
  if ((unint64_t)(v11 - 3) >= 2)
  {
    if (v11 != 2)
    {
      if (v11 != 1)
        goto LABEL_49;
      CFXLog_DebugEffectEditingUI();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.5();

      if (-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        -[CFXCaptureViewController effectEditor](self, "effectEditor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "editEffect");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "jtEffect");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CFXLog_DebugEffectEditingUI();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

        if (v17)
        {
          CFXLog_DebugEffectEditingUI();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.4();

        }
        if (v15)
          goto LABEL_42;
      }
      -[CFXCaptureViewController composition](self, "composition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "jtEffectsForType:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v20, "count"))
        goto LABEL_37;
      -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "normalizedMinimumHitTestArea");
      v23 = v22;
      v25 = v24;

      v39 = *MEMORY[0x24BDC0D88];
      v40 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v20, &v39, 1, x, y, v23, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v15 = (void *)v26;
        CFXLog_DebugEffectEditingUI();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (!v28)
        {
LABEL_41:

LABEL_42:
          if (objc_msgSend(v15, "type") == 2)
          {
            v36 = -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") | 1;
            -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v36);
            -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v36);
            if (!-[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
              -[CFXCaptureViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v15, 1);
            CFXLog_DebugEffectEditingUI();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.1();

            -[CFXCaptureViewController effectEditor](self, "effectEditor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "handlePanGesture:", v8);

          }
          goto LABEL_49;
        }
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.3();
      }
      else
      {
LABEL_37:
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.2();
        v15 = 0;
      }

      goto LABEL_41;
    }
    if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 1) != 0
      && -[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.7();

      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject handlePanGesture:](v34, "handlePanGesture:", v8);
    }
    else
    {
      CFXLog_DebugEffectEditingUI();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.6();
    }
LABEL_36:

    goto LABEL_49;
  }
  if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 1) == 0
    || !-[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
  {
    CFXLog_DebugEffectEditingUI();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.8();
    goto LABEL_36;
  }
  CFXLog_DebugEffectEditingUI();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.10();

  -[CFXCaptureViewController effectEditor](self, "effectEditor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handlePanGesture:", v8);

  v32 = -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 0xFFFFFFFFFFFFFFFELL;
  -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v32);
  -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v32);
  if (!-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
  {
    CFXLog_DebugEffectEditingUI();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.9();

    -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
  }
LABEL_49:

}

- (void)liveCaptureViewController:(id)a3 livePreviewPinchedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v35;
  NSObject *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  if (objc_msgSend(v8, "state") == 1)
  {
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCapturing");

    if (v10)
      goto LABEL_45;
  }
  v11 = objc_msgSend(v8, "state");
  if ((unint64_t)(v11 - 3) < 2)
  {
    if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 2) != 0
      && -[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.8();

      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handlePinchGesture:", v8);

      v32 = -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 0xFFFFFFFFFFFFFFFDLL;
      -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v32);
      -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v32);
      if (!-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        CFXLog_DebugEffectEditingUI();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.7();

        -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
      }
    }
  }
  else
  {
    if (v11 != 2)
    {
      if (v11 != 1)
        goto LABEL_44;
      CFXLog_DebugEffectEditingUI();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.5();

      if (-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        -[CFXCaptureViewController effectEditor](self, "effectEditor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "editEffect");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "jtEffect");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CFXLog_DebugEffectEditingUI();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

        if (v17)
        {
          CFXLog_DebugEffectEditingUI();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.4();

        }
        if (v15)
          goto LABEL_37;
      }
      -[CFXCaptureViewController composition](self, "composition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "jtEffectsForType:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v20, "count"))
        goto LABEL_32;
      -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "normalizedMinimumHitTestArea");
      v23 = v22;
      v25 = v24;

      v38 = *MEMORY[0x24BDC0D88];
      v39 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v20, &v38, 1, x, y, v23, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v15 = (void *)v26;
        CFXLog_DebugEffectEditingUI();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (!v28)
        {
LABEL_36:

LABEL_37:
          if (objc_msgSend(v15, "type") == 2)
          {
            v35 = -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") | 2;
            -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v35);
            -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v35);
            if (!-[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
              -[CFXCaptureViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v15, 1);
            CFXLog_DebugEffectEditingUI();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.1();

            -[CFXCaptureViewController effectEditor](self, "effectEditor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handlePinchGesture:", v8);

          }
LABEL_43:

          goto LABEL_44;
        }
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.3();
      }
      else
      {
LABEL_32:
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.2();
        v15 = 0;
      }

      goto LABEL_36;
    }
    if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 2) != 0
      && -[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.6();

      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handlePinchGesture:", v8);
      goto LABEL_43;
    }
  }
LABEL_44:
  if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 2) == 0)
LABEL_45:
    -[CFXCaptureViewController handlePinchGestureRecognizer:](self, "handlePinchGestureRecognizer:", v8);

}

- (void)liveCaptureViewController:(id)a3 livePreviewRotatedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  __int128 v39;
  uint64_t v40;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  if (objc_msgSend(v8, "state") == 1)
  {
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCapturing");

    if ((v10 & 1) != 0)
      goto LABEL_44;
  }
  v11 = objc_msgSend(v8, "state");
  if ((unint64_t)(v11 - 3) < 2)
  {
    if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 4) != 0
      && -[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.8();

      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleRotateGesture:", v8);

      v32 = -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 0xFFFFFFFFFFFFFFFBLL;
      -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v32);
      -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v32);
      if (!-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        CFXLog_DebugEffectEditingUI();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.7();

        -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
      }
    }
  }
  else
  {
    if (v11 != 2)
    {
      if (v11 != 1)
        goto LABEL_44;
      CFXLog_DebugEffectEditingUI();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.5();

      if (-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
      {
        -[CFXCaptureViewController effectEditor](self, "effectEditor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "editEffect");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "jtEffect");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CFXLog_DebugEffectEditingUI();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

        if (v17)
        {
          CFXLog_DebugEffectEditingUI();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.4();

        }
        if (v15)
          goto LABEL_37;
      }
      -[CFXCaptureViewController composition](self, "composition");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "jtEffectsForType:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v20, "count"))
        goto LABEL_32;
      -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "normalizedMinimumHitTestArea");
      v23 = v22;
      v25 = v24;

      v39 = *MEMORY[0x24BDC0D88];
      v40 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v20, &v39, 1, x, y, v23, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v15 = (void *)v26;
        CFXLog_DebugEffectEditingUI();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (!v28)
        {
LABEL_36:

LABEL_37:
          if (objc_msgSend(v15, "type") == 2)
          {
            v36 = -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") | 4;
            -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v36);
            -[CFXCaptureViewController setAppliedDirectOverlayEditingGestures:](self, "setAppliedDirectOverlayEditingGestures:", v36);
            if (!-[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
              -[CFXCaptureViewController displayEffectEditorForEffect:forMode:](self, "displayEffectEditorForEffect:forMode:", v15, 1);
            CFXLog_DebugEffectEditingUI();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.1();

            -[CFXCaptureViewController effectEditor](self, "effectEditor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "handleRotateGesture:", v8);

          }
          goto LABEL_44;
        }
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.3();
      }
      else
      {
LABEL_32:
        CFXLog_DebugEffectEditingUI();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.2();
        v15 = 0;
      }

      goto LABEL_36;
    }
    if ((-[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures") & 4) != 0
      && -[CFXCaptureViewController isEditingEffect](self, "isEditingEffect"))
    {
      CFXLog_DebugEffectEditingUI();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.6();

      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleRotateGesture:", v8);

    }
  }
LABEL_44:

}

- (void)liveCaptureViewController:(id)a3 livePreviewDoubleTappedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5
{
  void *v6;
  char v7;
  id v8;

  -[CFXCaptureViewController delegate](self, "delegate", a3, a5, a4.x, a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CFXCaptureViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "captureViewControllerPresentationRectWasDoubleTapped:", self);

  }
}

- (void)setupAnimojiFaceReticleForTrackingLoss
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CFXCaptureViewController_setupAnimojiFaceReticleForTrackingLoss__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __66__CFXCaptureViewController_setupAnimojiFaceReticleForTrackingLoss__block_invoke(uint64_t a1)
{
  CFXFaceReticleView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double CenterPoint;
  double v12;
  double v13;
  void *v14;
  void *v15;

  if ((objc_msgSend(*(id *)(a1 + 32), "isShowingAnimojiReticle") & 1) == 0)
  {
    v2 = -[CFXFaceReticleView initWithFrame:reticleType:]([CFXFaceReticleView alloc], "initWithFrame:reticleType:", 1, 0.0, 0.0, 180.0, 180.0);
    objc_msgSend(*(id *)(a1 + 32), "setAnimojiTrackingLossReticle:", v2);

    objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);

    objc_msgSend(*(id *)(a1 + 32), "presentationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    objc_msgSend(*(id *)(a1 + 32), "presentationView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    CenterPoint = CGRectGetCenterPoint(v7, v8, v9, v10);
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCenter:", CenterPoint, v13);

    objc_msgSend(*(id *)(a1 + 32), "animojiReticleFacePromptView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(*(id *)(a1 + 32), "setupFaceInViewPromptLabel");
  }
}

- (void)setupFaceInViewPromptLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
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
  _QWORD v63[4];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[CFXCaptureViewController setAnimojiReticleFacePromptView:](self, "setAnimojiReticleFacePromptView:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", 2.0);

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.0);

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithSize:", 0.0, 0.0);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = objc_alloc_init(MEMORY[0x24BDF6758]);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.75);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShadowColor:", v14);

  objc_msgSend(v13, "setShadowOffset:", 0.0, 0.0);
  v59 = v13;
  objc_msgSend(v13, "setShadowBlurRadius:", 3.0);
  v15 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v15, "setAlignment:", 1);
  v60 = v15;
  objc_msgSend(v15, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDF7790], 14.0, *MEMORY[0x24BDF7888]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v62, *MEMORY[0x24BDF6600]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v61, *MEMORY[0x24BDF65F8]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDF6628]);
  v58 = v12;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDF6640]);
  v17 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("BRING_FACE_INTO_VIEW_PROMPT_DISPLAY Name"), &stru_24EE5C428, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v17, "initWithString:attributes:", v19, v16);

  objc_msgSend(v11, "setAttributedText:", v57);
  objc_msgSend(v11, "sizeToFit");
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v11);

  -[CFXCaptureViewController presentationView](self, "presentationView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController presentationView](self, "presentationView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController setFacePromptLabelYConstraint:](self, "setFacePromptLabelYConstraint:", v28);

  v29 = (void *)MEMORY[0x24BDD1628];
  -[CFXCaptureViewController facePromptLabelYConstraint](self, "facePromptLabelYConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v30;
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController presentationView](self, "presentationView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v36);

  v37 = v11;
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v48 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v11, "leftAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leftAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 10.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v53;
  objc_msgSend(v11, "rightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "rightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, -10.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v47;
  v52 = v11;
  objc_msgSend(v11, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 3.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v41;
  objc_msgSend(v37, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, -3.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v46);

  -[CFXCaptureViewController updateAnimojiTrackingReticleAndLabelLayout](self, "updateAnimojiTrackingReticleAndLabelLayout");
}

- (void)showAnimojiFaceReticleForTrackingLoss
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CFXCaptureViewController_showAnimojiFaceReticleForTrackingLoss__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __65__CFXCaptureViewController_showAnimojiFaceReticleForTrackingLoss__block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isShowingAnimojiReticle") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsShowingAnimojiReticle:", 1);
    objc_msgSend(*(id *)(a1 + 32), "fadeInFaceInViewPromptLabel");
    objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "showAndAnimateAnimojiFaceReticle");

  }
}

- (void)hideAnimojiFaceReticleForTrackingGain
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isShowingAnimojiReticle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsShowingAnimojiReticle:", 0);
    objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke_2;
    v4[3] = &unk_24EE57B60;
    v5 = v2;
    v3 = v2;
    objc_msgSend(v3, "hideAnimojiFaceReticleAnimatedWithCompletion:", v4);
    objc_msgSend(*(id *)(a1 + 32), "fadeOutFaceInViewPromptLabel");

  }
}

uint64_t __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (BOOL)shouldShowAnimojiFaceReticle
{
  int v3;
  void *v4;

  if (-[CFXCaptureViewController isShowingAnimojiReticle](self, "isShowingAnimojiReticle"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isCapturing") ^ 1;

  }
  return v3;
}

- (void)fadeInFaceInViewPromptLabel
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__CFXCaptureViewController_fadeInFaceInViewPromptLabel__block_invoke;
  v5[3] = &unk_24EE57B60;
  v5[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithDuration:curve:animations:", 0, v5, 0.5);
  objc_msgSend(v4, "startAnimationAfterDelay:", 0.5);

}

void __55__CFXCaptureViewController_fadeInFaceInViewPromptLabel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "animojiReticleFacePromptView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)fadeOutFaceInViewPromptLabel
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__CFXCaptureViewController_fadeOutFaceInViewPromptLabel__block_invoke;
  v5[3] = &unk_24EE57B60;
  v5[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithDuration:curve:animations:", 0, v5, 0.2);
  objc_msgSend(v4, "startAnimation");

}

void __56__CFXCaptureViewController_fadeOutFaceInViewPromptLabel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "animojiReticleFacePromptView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)removeAnimojiTrackingReticle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CFXCaptureViewController_removeAnimojiTrackingReticle__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __56__CFXCaptureViewController_removeAnimojiTrackingReticle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "animojiReticleFacePromptView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "animojiTrackingLossReticle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "animojiReticleFacePromptView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setAnimojiTrackingLossReticle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAnimojiReticleFacePromptView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsShowingAnimojiReticle:", 0);
}

- (void)updateAnimojiTrackingReticleAndLabelLayout
{
  int64_t v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double CenterPoint;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v3 = -[CFXCaptureViewController captureMode](self, "captureMode");
  v4 = (unint64_t)(+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation")- 3) < 2;
  v5 = v3 == 2 && v4;
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom") == 1;

  }
  else
  {
    v7 = 0;
  }
  -[CFXCaptureViewController animojiTrackingLossReticle](self, "animojiTrackingLossReticle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CFXCaptureViewController presentationView](self, "presentationView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    CenterPoint = CGRectGetCenterPoint(v10, v11, v12, v13);
    v16 = v15;
    -[CFXCaptureViewController animojiTrackingLossReticle](self, "animojiTrackingLossReticle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCenter:", CenterPoint, v16);

  }
  if (v5 || v7)
  {
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19 + 23.0 + 10.0;
    -[CFXCaptureViewController facePromptLabelYConstraint](self, "facePromptLabelYConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConstant:", v20);

  }
  else
  {
    -[CFXCaptureViewController facePromptLabelYConstraint](self, "facePromptLabelYConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", 10.0);
  }

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNeedsUpdateConstraints");

  -[CFXCaptureViewController animojiReticleFacePromptView](self, "animojiReticleFacePromptView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateConstraintsIfNeeded");

}

- (CGRect)CFX_cameraViewFinderUncroppedFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  if (-[CFXCaptureViewController captureContainerUncroppedFrameWasCalculatedWithContentRect](self, "captureContainerUncroppedFrameWasCalculatedWithContentRect"))
  {
    -[CFXCaptureViewController externalUncroppedPresentationRect](self, "externalUncroppedPresentationRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renderSize");
    v14 = v13;
    v16 = v15;

    objc_msgSend(v11, "frame");
    v4 = CGRectFillRectToAspectInRect(v17, v18, v19, v20, 0.0, 0.0, v14, v16);
    v6 = v21;
    v8 = v22;
    v10 = v23;

  }
  v24 = v4;
  v25 = v6;
  v26 = v8;
  v27 = v10;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)displayEffectEditorForEffect:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  JFXPassThroughContainerView *v16;
  void *v17;
  JFXPassThroughContainerView *v18;
  void *v19;
  void *v20;
  void *v21;
  CFXEffectEditorView *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t v35[16];

  v6 = a3;
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCapturing");

  if ((v8 & 1) == 0)
  {
    -[CFXCaptureViewController effectEditor](self, "effectEditor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "mode") == a4)
      {
        -[CFXCaptureViewController effectEditor](self, "effectEditor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "editEffect");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v6);

        if ((v13 & 1) != 0)
          goto LABEL_18;
      }
      else
      {

      }
      -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
    }
    if (a4
      || !+[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v6))
    {
      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = [JFXPassThroughContainerView alloc];
      -[CFXCaptureViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      v18 = -[JFXPassThroughContainerView initWithFrame:](v16, "initWithFrame:");
      -[CFXCaptureViewController setEffectEditorContainerView:](self, "setEffectEditorContainerView:", v18);

      if (-[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone"))
      {
        -[CFXCaptureViewController nonTransformedContainerView](self, "nonTransformedContainerView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", v20);
      }
      else
      {
        -[CFXCaptureViewController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXCaptureViewController topBar](self, "topBar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "insertSubview:belowSubview:", v20, v21);

      }
      v22 = -[CFXEffectEditorView initWithMode:delegate:]([CFXEffectEditorView alloc], "initWithMode:delegate:", a4, self);
      -[CFXCaptureViewController setEffectEditor:](self, "setEffectEditor:", v22);

      -[CFXCaptureViewController CFX_cameraViewFinderUncroppedFrame](self, "CFX_cameraViewFinderUncroppedFrame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

      -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v33);

      -[CFXCaptureViewController CFX_applyAutoRotationCorrectionToEditorViews](self, "CFX_applyAutoRotationCorrectionToEditorViews");
      -[CFXCaptureViewController effectEditor](self, "effectEditor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "beginEditingEffect:", v15);

    }
    else if (!-[CFXCaptureViewController presentFullScreenTextEditorForEffect:insertingEffect:](self, "presentFullScreenTextEditorForEffect:insertingEffect:", v6, 0))
    {
      JFXLog_viewerUI();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "Request to display text editor for edit ignored because already open", v35, 2u);
      }

    }
  }
LABEL_18:

}

- (void)updateEffectEditorLayout
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

  -[CFXCaptureViewController effectEditor](self, "effectEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXCaptureViewController CFX_cameraViewFinderUncroppedFrame](self, "CFX_cameraViewFinderUncroppedFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CFXCaptureViewController effectEditor](self, "effectEditor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    -[CFXCaptureViewController CFX_applyAutoRotationCorrectionToEditorViews](self, "CFX_applyAutoRotationCorrectionToEditorViews");
  }
}

- (void)removeEffectEditorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id location;

  v3 = a3;
  -[CFXCaptureViewController effectEditor](self, "effectEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CFXCaptureViewController effectEditor](self, "effectEditor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v6);

    -[CFXCaptureViewController effectEditorContainerView](self, "effectEditorContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v7);

    -[CFXCaptureViewController setEffectEditor:](self, "setEffectEditor:", 0);
    -[CFXCaptureViewController setEffectEditorContainerView:](self, "setEffectEditorContainerView:", 0);
    v8 = objc_loadWeakRetained(&location);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __55__CFXCaptureViewController_removeEffectEditorAnimated___block_invoke;
    v9[3] = &unk_24EE5B538;
    objc_copyWeak(&v10, &location);
    objc_copyWeak(&v11, &from);
    objc_msgSend(v8, "endEditingAnimated:withCompletionBlock:", v3, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __55__CFXCaptureViewController_removeEffectEditorAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeFromSuperview");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "removeFromSuperview");

}

- (BOOL)isEditingEffect
{
  void *v2;
  BOOL v3;

  -[CFXCaptureViewController effectEditor](self, "effectEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)presentFullScreenTextEditorForEffect:(id)a3 insertingEffect:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a4;
  v6 = a3;
  -[CFXCaptureViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController CFX_cameraViewFinderUncroppedFrame](self, "CFX_cameraViewFinderUncroppedFrame");
  objc_msgSend(v7, "convertRect:toView:", 0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (-[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone"))
  {
    -[CFXCaptureViewController cameraControls](self, "cameraControls");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController CFX_cameraViewFinderUncroppedFrame](self, "CFX_cameraViewFinderUncroppedFrame");
    objc_msgSend(v17, "convertRect:toView:", 0);
    v9 = v18;
    v11 = v19;
    v13 = v20;
    v15 = v21;

  }
  +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[CFXCaptureViewController isMessagesOnPhone](self, "isMessagesOnPhone");
  v24 = self;
  if (v23)
  {
    -[CFXCaptureViewController cameraControls](self, "cameraControls");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = +[CFXFullScreenTextEditViewController displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:](CFXFullScreenTextEditViewController, "displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:", v22, v24, self, v4, v9, v11, v13, v15);
  if (v23)

  -[CFXCaptureViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CFXCaptureViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController effectBrowserContentPresenterViewController](self, "effectBrowserContentPresenterViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bringSubviewToFront:", v29);

  }
  return v25;
}

- (void)updateFullScreenTextEditorLayout
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

  if (+[CFXFullScreenTextEditViewController isFullScreenTextEditorPresented](CFXFullScreenTextEditViewController, "isFullScreenTextEditorPresented"))
  {
    -[CFXCaptureViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController CFX_cameraViewFinderUncroppedFrame](self, "CFX_cameraViewFinderUncroppedFrame");
    objc_msgSend(v3, "convertRect:toView:", 0);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    +[CFXFullScreenTextEditViewController notifyCameraViewWindowFrameChanged:](CFXFullScreenTextEditViewController, "notifyCameraViewWindowFrameChanged:", v5, v7, v9, v11);
  }
}

- (BOOL)shouldUseFaceTracking
{
  void *v2;
  char v3;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceTrackingEnabled");

  return v3;
}

- (BOOL)isFaceTrackingDataAvailable
{
  _BOOL4 v2;

  v2 = -[CFXCaptureViewController shouldUseFaceTracking](self, "shouldUseFaceTracking");
  if (v2)
    LOBYTE(v2) = +[JFXEffectEditingUtilities isFaceTrackingDataAvailable](JFXEffectEditingUtilities, "isFaceTrackingDataAvailable");
  return v2;
}

- (void)enableAnimationForOverlayEffect:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "forceDisableLooping") & 1) == 0)
  {
    v5 = *MEMORY[0x24BE79408];
    v19[0] = *MEMORY[0x24BE79468];
    v19[1] = v5;
    v6 = *MEMORY[0x24BE79418];
    v19[2] = *MEMORY[0x24BE79410];
    v19[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("CFX_DisableFaceTimeAnimationLooping"));

    objc_msgSend(v4, "effectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "containsObject:", v10);

    if (!v11 || v9)
    {
      objc_msgSend(v4, "setForceDisableLooping:", 1);
      v18 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFXEffectPreviewStartAtNextRenderTime;
      v16 = 0;
      +[JFXEffectEditingUtilities enableAnimationForEffects:animationStartTime:](JFXEffectEditingUtilities, "enableAnimationForEffects:animationStartTime:", v13, &v15);

      -[CFXCaptureViewController runOnceAnimatedOverlays](self, "runOnceAnimatedOverlays");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v4);

    }
    else
    {
      objc_msgSend(v4, "setForceDisableLooping:", 0);
      v17 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFXEffectPreviewStartAtNextRenderTime;
      v16 = 0;
      +[JFXEffectEditingUtilities enableAnimationForEffects:animationStartTime:](JFXEffectEditingUtilities, "enableAnimationForEffects:animationStartTime:", v12, &v15);

      objc_msgSend(v4, "setParameter:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE795A0]);
    }

  }
}

- (BOOL)passThroughContainerView:(id)a3 shouldHandleTouchWithinView:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  __int128 v33;
  uint64_t v34;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode"))
    && -[CFXCaptureViewController appliedDirectOverlayEditingGestures](self, "appliedDirectOverlayEditingGestures"))
  {
    v9 = 1;
  }
  else if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode"))
         && (-[CFXCaptureViewController cameraViewController](self, "cameraViewController"),
             v10 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v10, "containerView"),
             v11 = (id)objc_claimAutoreleasedReturnValue(),
             v11,
             v10,
             v11 == v8))
  {
    -[CFXCaptureViewController composition](self, "composition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "jtEffectsForType:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertPoint:fromView:", v17, x, y);
      v19 = v18;
      v21 = v20;

      -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = 44.0 / v23;
      v26 = 44.0 / v25;

      -[CFXCaptureViewController liveCaptureContainer](self, "liveCaptureContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v33 = *MEMORY[0x24BDC0D88];
      v34 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v15, &v33, 1, v19, v21, v28, v29, v30, v31, v24, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v32 != 0;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    -[CFXCaptureViewController view](self, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v12 != v8;

  }
  return v9;
}

- (void)updateControlVisibilityAnimated:(BOOL)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {

  }
  else
  {
    v5 = -[CFXCaptureViewController captureMode](self, "captureMode");

    if (v5 == 2)
    {
      -[CFXCaptureViewController flashButton](self, "flashButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isExpanded");

      -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", v7);

      -[CFXCaptureViewController doneButton](self, "doneButton");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", v7);
      goto LABEL_8;
    }
  }
  if (-[CFXCaptureViewController captureMode](self, "captureMode") == 2)
  {
    -[CFXCaptureViewController topBar](self, "topBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldHideElapsedTimeViewForGraphConfiguration:", 0);
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v10);

  }
  -[CFXCaptureViewController topBar](self, "topBar");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "shouldHideDoneButtonForGraphConfiguration:", 0);
  -[CFXCaptureViewController doneButton](self, "doneButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12);

LABEL_8:
}

- (void)JFX_orientationMonitorDeviceInterfaceOrientationNotification:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[CFXCaptureViewController configureCaptureControlsForOrientationWithAnimation:](self, "configureCaptureControlsForOrientationWithAnimation:", 1);
  v5 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kJFXOrientationMonitorDeviceInterfaceOrientationPreviousOrientationUserInfoKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (-[CFXCaptureViewController captureMode](self, "captureMode") == 1
    && !-[CFXCaptureViewController isExternalCaptureSessionAnExternalCamera](self, "isExternalCaptureSessionAnExternalCamera"))
  {
    -[CFXCaptureViewController CFX_adjustOverlaysForCaptureOrientationChanged:oldCaptureOrientation:](self, "CFX_adjustOverlaysForCaptureOrientationChanged:oldCaptureOrientation:", v5, v8);
  }
}

- (void)JFX_orientationMonitorInterfaceOrientationNotification:(id)a3
{
  if (-[CFXCaptureViewController captureMode](self, "captureMode", a3) != 1)
    -[CFXCaptureViewController CFX_setFrameAndRenderSizes](self, "CFX_setFrameAndRenderSizes");
  -[CFXCaptureViewController configureUIForOrientation](self, "configureUIForOrientation");
}

- (void)doneButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CFXLog_action();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXCaptureViewController composition](self, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("canceled camera session"), CFSTR("live"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);

  }
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopRenderingCameraFrames");

  -[CFXCaptureViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CFXCaptureViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "captureViewControllerDoneButtonWasTapped:", self);

  }
}

- (void)CFX_setFrameAndRenderSizes
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  CFXEffectComposition *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  CFXCaptureViewController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE buf[24];
  _BYTE v35[128];
  uint64_t v36;
  CGSize v37;
  CGSize v38;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cameraMode");

  -[CFXCaptureViewController captureMode](self, "captureMode");
  v6 = JFXUncroppedFrameSizeForCameraModeAndOrientation(v5, v3);
  v8 = v7;
  v9 = JFXCroppedFrameSizeForCameraModeAndOrientation(v5, v3);
  v11 = v10;
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRenderSize:", v9, v11);

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrameSize:", v6, v8);

  JFXLog_camera();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v37.width = v6;
    v37.height = v8;
    NSStringFromCGSize(v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38.width = v9;
    v38.height = v11;
    NSStringFromCGSize(v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "frameSize: %{public}@, renderSize: %{public}@", buf, 0x16u);

  }
  v17 = objc_alloc_init(CFXEffectComposition);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = self;
  -[CFXCaptureViewController composition](self, "composition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "effects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    v23 = MEMORY[0x24BDC0D88];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v25, "jtEffect");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v25, "jtEffect");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)buf = *(_OWORD *)v23;
          *(_QWORD *)&buf[16] = *(_QWORD *)(v23 + 16);
          objc_msgSend(v28, "updateRenderSizeMaintainingAppearance:withComponentTime:", buf, v9, v11);

        }
        -[CFXEffectComposition addEffect:completion:](v17, "addEffect:completion:", v25, 0);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v21);
  }

  -[CFXCaptureViewController setComposition:](v29, "setComposition:", v17);
}

- (BOOL)isMessagesOnPhone
{
  BOOL v2;
  void *v3;

  if (-[CFXCaptureViewController captureMode](self, "captureMode") == 1)
    return 0;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == 0;

  return v2;
}

- (void)CFX_toggleCaptureUI
{
  void *v3;
  void *v4;
  int v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  -[CFXCaptureViewController cameraControls](self, "cameraControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    if (v5)
      v6 = isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode"));
    else
      v6 = 1;
    -[CFXCaptureViewController topBar](self, "topBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6);

  }
  -[CFXCaptureViewController cameraControls](self, "cameraControls");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v5 ^ 1u);

}

- (int64_t)CFX_captureFlashModeForCAMFlashMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (int64_t)CFX_captureTorchModeForCAMFlashMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (int64_t)CFX_camFlashModeForCaptureFlashMode:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (void)CFX_handleZoomPinchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v10 = 0;
  v11 = 0;
  v9 = 0;
  -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", &v11, &v10, &v9);
  if (v10 == 1)
  {
    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CFXCaptureViewController canToggleBetweenZoomFactorsForZoomControl:](self, "canToggleBetweenZoomFactorsForZoomControl:", v5);

    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCapturing");

    if (v6 && (v8 & 1) == 0)
      -[CFXCaptureViewController CFX_performFrontCameraZoomWithPinchGestureRecognizer:](self, "CFX_performFrontCameraZoomWithPinchGestureRecognizer:", v4);
  }
  else if (!v10)
  {
    -[CFXCaptureViewController CFX_performBackCameraZoomWithPinchGestureRecognizer:](self, "CFX_performBackCameraZoomWithPinchGestureRecognizer:", v4);
  }

}

- (void)CFX_performBackCameraZoomWithPinchGestureRecognizer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "state");
  if ((unint64_t)(v4 - 3) < 3)
  {
    -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
LABEL_6:
    objc_msgSend(v5, "setVisibilityTimerSuspended:", v7);
LABEL_13:

    goto LABEL_14;
  }
  if (v4 == 2)
  {
    -[CFXCaptureViewController zoomFactorAtPinchStart](self, "zoomFactorAtPinchStart");
    v11 = v10;
    objc_msgSend(v17, "scale");
    v13 = v11 * v12;
    -[CFXCaptureViewController CFX_maxZoomForCamera](self, "CFX_maxZoomForCamera");
    if (v13 <= v14)
      v14 = v13;
    if (v14 >= 1.0)
      v15 = v14;
    else
      v15 = 1.0;
    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setZoomFactor:", v15);

    -[CFXCaptureViewController CFX_setZoomSliderFromZoomFactor:](self, "CFX_setZoomSliderFromZoomFactor:", v15);
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setZoomFactor:", v15);
    goto LABEL_13;
  }
  if (v4 == 1)
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "zoomFactor");
    -[CFXCaptureViewController setZoomFactorAtPinchStart:](self, "setZoomFactorAtPinchStart:");

    -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "makeVisibleAnimated:", 0);

    -[CFXCaptureViewController zoomSlider](self, "zoomSlider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
    goto LABEL_6;
  }
LABEL_14:

}

- (void)CFX_performFrontCameraZoomWithPinchGestureRecognizer:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  void *v7;
  _BOOL4 v8;
  double v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "state") == 1;
  v5 = v13;
  if (v4)
  {
    objc_msgSend(v13, "scale");
    if (v6 >= 1.0)
    {
      v8 = 0;
    }
    else
    {
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "zoomButtonSymbol") == 1;

    }
    objc_msgSend(v13, "scale");
    if (v9 <= 1.0)
    {
      v11 = 0;
    }
    else
    {
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "zoomButtonSymbol") == 0;

    }
    v5 = v13;
    if (v8 || v11)
    {
      -[CFXCaptureViewController zoomControl](self, "zoomControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController toggleBetweenZoomFactorsForZoomControl:](self, "toggleBetweenZoomFactorsForZoomControl:", v12);

      v5 = v13;
    }
  }

}

- (void)completedVideoRecordWithURL:(id)a3 metadataURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  CFXCaptureViewController *v15;

  v6 = a3;
  v7 = a4;
  -[CFXCaptureViewController composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jtEffects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke;
  v12[3] = &unk_24EE5B560;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  +[CFXClip createClipWithLocalURL:effectStack:isVideo:maximumImageDimension:completionHandler:](CFXClip, "createClipWithLocalURL:effectStack:isVideo:maximumImageDimension:completionHandler:", v11, v9, 1, 0, v12);

}

void __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke_2;
  v7[3] = &unk_24EE5AA48;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFXMediaItem *v8;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraPosition");

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cameraMode");

  v8 = -[CFXMediaItem initWithCameraMode:clip:assetMediaURL:assetMetadataURL:cameraPosition:]([CFXMediaItem alloc], "initWithCameraMode:clip:assetMediaURL:assetMetadataURL:cameraPosition:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  objc_msgSend(*(id *)(a1 + 56), "cameraViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopRenderingCameraFrames");

  objc_msgSend(*(id *)(a1 + 56), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "captureViewController:didCaptureMediaItem:", *(_QWORD *)(a1 + 56), v8);

  if (CFXCaptureCapabilitiesIsCTMSupported()
    && objc_msgSend(*(id *)(a1 + 56), "switchedToVideoMode"))
  {
    objc_msgSend(*(id *)(a1 + 56), "setCaptureMode:", 0);
    objc_msgSend(*(id *)(a1 + 56), "setSwitchedToVideoMode:", 0);
    objc_msgSend(*(id *)(a1 + 56), "configureCTMUIForCaptureMode");
  }

}

- (CGAffineTransform)overlayTransformForLocalViewfinder
{
  CGAffineTransform *result;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  result = -[CFXCaptureViewController captureMode](self, "captureMode");
  if (result == (CGAffineTransform *)1)
  {
    v5 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
    if (v5 > 4)
      v6 = 0;
    else
      v6 = qword_226AB7950[v5];
    return CGAffineTransformMakeRotation(retstr, PVCardinalAnglesDouble_0[v6]);
  }
  else
  {
    v7 = MEMORY[0x24BDBD8B8];
    v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  }
  return result;
}

- (void)updateUIForVideoRecording:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[CFXCaptureViewController setIsRecording:](self, "setIsRecording:");
  v5 = (double)!v3;
  -[CFXCaptureViewController flashButton](self, "flashButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[CFXCaptureViewController doneButton](self, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flashIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v5);

}

- (void)CFX_hideAppStripUpperBackgroundView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if ((uint64_t)v6 == 568)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v9 = (uint64_t)v8;

      if (v9 != 568)
        return;
    }
    -[CFXCaptureViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cameraControlsViewControllerForCaptureViewController:", self);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "appStripBackgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v3);

  }
}

- (void)startVideoRecording
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
  -[CFXCaptureViewController removeAnimojiTrackingReticle](self, "removeAnimojiTrackingReticle");
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startVideoRecordingWithFlashMode:", -[CFXCaptureViewController flashMode](self, "flashMode"));

  -[CFXCaptureViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXCaptureViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captureViewControllerDidStartVideoRecording:", self);

  }
  -[CFXCaptureViewController CFX_hideAppStripUpperBackgroundView:](self, "CFX_hideAppStripUpperBackgroundView:", 1);
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundStyle:animated:", 1, 1);

    v16 = 0;
    *(_QWORD *)buf = 0;
    v15 = 0;
    -[CFXCaptureViewController CFX_getCaptureDevice:captureDevicePosition:captureMode:](self, "CFX_getCaptureDevice:captureDevicePosition:captureMode:", buf, &v16, &v15);
    v9 = v16 != 1;
    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", v9);

  }
  CFXLog_action();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXCaptureViewController composition](self, "composition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jtEffects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("started video capture"), CFSTR("live"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
}

- (void)stopVideoRecording:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  CFXCaptureViewController *v13;
  id v14;

  v4 = a3;
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __47__CFXCaptureViewController_stopVideoRecording___block_invoke;
  v12 = &unk_24EE58118;
  v13 = self;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "stopVideoRecording:", &v9);

  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView", v9, v10, v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundStyle:animated:", 3, 1);

    -[CFXCaptureViewController zoomControl](self, "zoomControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 1);

  }
}

void __47__CFXCaptureViewController_stopVideoRecording___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2;
  v10[3] = &unk_24EE594E8;
  v11 = v5;
  v12 = v6;
  v7 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    JFXLog_core();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2_cold_1(a1, v2, v3);

    objc_msgSend(*(id *)(a1 + 48), "completedVideoRecordWithURL:metadataURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captureViewControllerDidStopVideoRecording:", *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 48), "CFX_hideAppStripUpperBackgroundView:", 0);
  CFXLog_action();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jtEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("finished video capture"), CFSTR("live"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_2269A9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v12, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)JFX_capturePhoto
{
  void *v3;
  int64_t v4;
  _QWORD v5[5];

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CFXCaptureViewController flashMode](self, "flashMode");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke;
  v5[3] = &unk_24EE5B5D8;
  v5[4] = self;
  objc_msgSend(v3, "capturePhotoWithFlashMode:completion:", v4, v5);

}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2;
  v25[3] = &unk_24EE5B588;
  v25[4] = *(_QWORD *)(a1 + 32);
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x2276A1F6C](v25);
  if (!v7 || v9)
  {
    JFXLog_camera();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_cold_1(v9, v15);

    v11[2](v11, 0);
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_123;
    block[3] = &unk_24EE594E8;
    v13 = v7;
    v14 = *(_QWORD *)(a1 + 32);
    v21 = v13;
    v22 = v14;
    v23 = v8;
    v24 = v11;
    dispatch_async(v12, block);

  }
  CFXLog_action();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "jtEffects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("taken photo"), CFSTR("live"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v19;
    _os_log_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_3;
  v5[3] = &unk_24EE57AA8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRenderingCameraFrames");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "captureViewController:didCaptureMediaItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_123(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cameraMode");

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cameraPosition");

  v6 = a1[4];
  objc_msgSend(a1[5], "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jtEffects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2_124;
  v9[3] = &unk_24EE5B5B0;
  v13 = v3;
  v10 = a1[4];
  v11 = a1[6];
  v14 = v5;
  v12 = a1[7];
  +[CFXClip createClipWithLocalURL:effectStack:isVideo:maximumImageDimension:completionHandler:](CFXClip, "createClipWithLocalURL:effectStack:isVideo:maximumImageDimension:completionHandler:", v6, v8, 0, 0, v9);

}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2_124(_QWORD *a1, void *a2)
{
  id v3;
  CFXMediaItem *v4;

  v3 = a2;
  v4 = -[CFXMediaItem initWithCameraMode:clip:assetMediaURL:assetMetadataURL:cameraPosition:]([CFXMediaItem alloc], "initWithCameraMode:clip:assetMediaURL:assetMetadataURL:cameraPosition:", a1[7], v3, a1[4], a1[5], a1[8]);

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)CFX_respondToShutterPress
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 0);
  -[CFXCaptureViewController removeAnimojiTrackingReticle](self, "removeAnimojiTrackingReticle");
  -[CFXCaptureViewController editingOverlayWithGestureGroup](self, "editingOverlayWithGestureGroup");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_group_notify(v3, MEMORY[0x24BDAC9B8], block);

}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD inCompletionBlock[5];
  void *v20;
  _QWORD v21[4];
  void *v22;
  _QWORD v23[5];
  char v24;

  v2 = objc_msgSend(*(id *)(a1 + 32), "captureMode");
  v3 = *(void **)(a1 + 32);
  if (v2 == 2)
  {
    objc_msgSend(v3, "cameraViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCapturing");

    v6 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_2;
    v23[3] = &unk_24EE57C98;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v5;
    v7 = (void *)MEMORY[0x2276A1F6C](v23);
    v8 = v5 ^ 1;
    objc_msgSend(*(id *)(a1 + 32), "controlStatusBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flashIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", (double)v8);

    objc_msgSend(*(id *)(a1 + 32), "flashButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", (double)v8);

    objc_msgSend(*(id *)(a1 + 32), "doneButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", (double)v8);

    if ((v8 & 1) != 0)
    {
      inCompletionBlock[0] = v6;
      inCompletionBlock[1] = 3221225472;
      inCompletionBlock[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_6;
      inCompletionBlock[3] = &unk_24EE580A0;
      inCompletionBlock[4] = *(_QWORD *)(a1 + 32);
      v20 = v7;
      v18 = v7;
      AudioServicesPlaySystemSoundWithCompletion(0x45Du, inCompletionBlock);
      v17 = v20;
    }
    else
    {
      v13 = *(void **)(a1 + 32);
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_4;
      v21[3] = &unk_24EE580C8;
      v22 = v7;
      v14 = v7;
      objc_msgSend(v13, "stopVideoRecording:", v21);
      objc_msgSend(*(id *)(a1 + 32), "elapsedTimeView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resetTimer");

      objc_msgSend(*(id *)(a1 + 32), "elapsedTimeView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endTimer");

      v17 = v22;
    }

  }
  else
  {
    objc_msgSend(v3, "JFX_capturePhoto");
  }
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[5];
  char v4;

  v2 = dispatch_time(0, 100000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_3;
  v3[3] = &unk_24EE57C98;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);
}

uint64_t __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateZoomUIForCapturing:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_4(uint64_t a1)
{
  _QWORD inCompletionBlock[4];
  id v2;

  inCompletionBlock[0] = MEMORY[0x24BDAC760];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_5;
  inCompletionBlock[3] = &unk_24EE580C8;
  v2 = *(id *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, inCompletionBlock);

}

uint64_t __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_6(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_7;
  v2[3] = &unk_24EE580A0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_7(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "startVideoRecording");
  objc_msgSend(*(id *)(a1 + 32), "elapsedTimeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)configureCTMUIForCaptureMode
{
  int64_t v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v9[72];
  _OWORD v10[4];
  _BOOL8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BOOL8 v16;

  v3 = -[CFXCaptureViewController captureMode](self, "captureMode");
  v4 = v3 == 2;
  v5 = v3 != 2;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CFXCaptureViewController dynamicShutterSettings](self, "dynamicShutterSettings");
  -[CFXCaptureViewController elapsedTimeView](self, "elapsedTimeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  *(_QWORD *)&v12 = v4;
  *((_QWORD *)&v12 + 1) = v5;
  v16 = v4;
  v11 = v4;
  v10[2] = v14;
  v10[3] = v15;
  v10[0] = v12;
  v10[1] = v13;
  -[CFXCaptureViewController setDynamicShutterSettings:](self, "setDynamicShutterSettings:", v10);
  -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController dynamicShutterSettings](self, "dynamicShutterSettings");
  objc_msgSend(v7, "setSettings:animated:", v9, 0);

  -[CFXCaptureViewController dynamicShutterControl](self, "dynamicShutterControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetAnimated:", 0);

}

- (void)returnCTMUIToPhotoMode
{
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    if (-[CFXCaptureViewController switchedToVideoMode](self, "switchedToVideoMode"))
    {
      -[CFXCaptureViewController setCaptureMode:](self, "setCaptureMode:", 0);
      -[CFXCaptureViewController setSwitchedToVideoMode:](self, "setSwitchedToVideoMode:", 0);
      -[CFXCaptureViewController configureCTMUIForCaptureMode](self, "configureCTMUIForCaptureMode");
    }
  }
}

- (BOOL)needsBlackBackgroundForCTMControls
{
  return !-[CFXCaptureViewController captureMode](self, "captureMode")
      && -[CFXCaptureViewController aspectRatioCrop](self, "aspectRatioCrop") != 1;
}

- (void)dynamicShutterControlStopLockedRecording
{
  void *v3;
  void *v4;
  id v5;

  -[CFXCaptureViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraControlsViewControllerForCaptureViewController:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "flipButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[CFXCaptureViewController CFX_respondToShutterPress](self, "CFX_respondToShutterPress");
}

- (void)dynamicShutterControlDidShortPress:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[CFXCaptureViewController captureMode](self, "captureMode"))
    objc_msgSend(v4, "setEnabled:", 0);
  -[CFXCaptureViewController CFX_respondToShutterPress](self, "CFX_respondToShutterPress");

}

- (void)dynamicShutterControlDidStart:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CFXCaptureViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraControlsViewControllerForCaptureViewController:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "flipButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  if (!-[CFXCaptureViewController captureMode](self, "captureMode"))
  {
    -[CFXCaptureViewController setCaptureMode:](self, "setCaptureMode:", 2);
    -[CFXCaptureViewController setSwitchedToVideoMode:](self, "setSwitchedToVideoMode:", 1);
  }
  -[CFXCaptureViewController controlStatusBar](self, "controlStatusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flashIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController setTorchModeForFlashMode:](self, "setTorchModeForFlashMode:", objc_msgSend(v7, "flashMode"));

  -[CFXCaptureViewController CFX_respondToShutterPress](self, "CFX_respondToShutterPress");
}

- (void)controlStatusBar:(id)a3 didCreateIndicatorForType:(unint64_t)a4
{
  id v4;

  if (!a4)
  {
    objc_msgSend(a3, "flashIndicator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFlashMode:", 2);

  }
}

- (void)controlStatusBar:(id)a3 didReceiveTapInIndicatorForType:(unint64_t)a4
{
  if (!a4)
    -[CFXCaptureViewController toggleCTMFlashButton](self, "toggleCTMFlashButton", a3);
}

- (CFXCaptureViewControllerDelegate)delegate
{
  return (CFXCaptureViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CFXControlsViewController)cameraControls
{
  return self->_cameraControls;
}

- (void)setCameraControls:(id)a3
{
  objc_storeStrong((id *)&self->_cameraControls, a3);
}

- (void)setEffectBrowserContentPresenterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, a3);
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setComposition:(id)a3
{
  objc_storeStrong((id *)&self->_composition, a3);
}

- (UIView)nonTransformedContainerView
{
  return self->_nonTransformedContainerView;
}

- (void)setNonTransformedContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_nonTransformedContainerView, a3);
}

- (NSLayoutConstraint)captureControlsContainerHeightConstraint
{
  return self->_captureControlsContainerHeightConstraint;
}

- (void)setCaptureControlsContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captureControlsContainerHeightConstraint, a3);
}

- (NSLayoutConstraint)captureControlsContainerWidthConstraint
{
  return self->_captureControlsContainerWidthConstraint;
}

- (void)setCaptureControlsContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captureControlsContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)captureControlsContainerTrailingConstraint
{
  return self->_captureControlsContainerTrailingConstraint;
}

- (void)setCaptureControlsContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captureControlsContainerTrailingConstraint, a3);
}

- (NSLayoutConstraint)captureControlsContainerLeadingConstraint
{
  return self->_captureControlsContainerLeadingConstraint;
}

- (void)setCaptureControlsContainerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captureControlsContainerLeadingConstraint, a3);
}

- (NSLayoutConstraint)captureControlsContainerTopConstraint
{
  return self->_captureControlsContainerTopConstraint;
}

- (void)setCaptureControlsContainerTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captureControlsContainerTopConstraint, a3);
}

- (UIView)liveCaptureContainer
{
  return self->_liveCaptureContainer;
}

- (void)setLiveCaptureContainer:(id)a3
{
  objc_storeStrong((id *)&self->_liveCaptureContainer, a3);
}

- (UIView)liveCaptureContainerContainer
{
  return self->_liveCaptureContainerContainer;
}

- (void)setLiveCaptureContainerContainer:(id)a3
{
  objc_storeStrong((id *)&self->_liveCaptureContainerContainer, a3);
}

- (UIView)cameraControlsContainerView
{
  return self->_cameraControlsContainerView;
}

- (void)setCameraControlsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraControlsContainerView, a3);
}

- (NSLayoutConstraint)topBarTopConstraint
{
  return self->_topBarTopConstraint;
}

- (void)setTopBarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topBarTopConstraint, a3);
}

- (NSLayoutConstraint)topBarContaineHeightConstraint
{
  return self->_topBarContaineHeightConstraint;
}

- (void)setTopBarContaineHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topBarContaineHeightConstraint, a3);
}

- (CAMTopBar)topBar
{
  return self->_topBar;
}

- (void)setTopBar:(id)a3
{
  objc_storeStrong((id *)&self->_topBar, a3);
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

- (void)setElapsedTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeView, a3);
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (void)setFlashButton:(id)a3
{
  objc_storeStrong((id *)&self->_flashButton, a3);
}

- (CFXViewfinderFlipTransition)viewfinderFlipTransition
{
  return self->_viewfinderFlipTransition;
}

- (void)setViewfinderFlipTransition:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderFlipTransition, a3);
}

- (CAMSnapshotView)liveCaptureContainerSnapshot
{
  return self->_liveCaptureContainerSnapshot;
}

- (void)setLiveCaptureContainerSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_liveCaptureContainerSnapshot, a3);
}

- (CAMZoomControl)zoomControl
{
  return self->_zoomControl;
}

- (void)setZoomControl:(id)a3
{
  objc_storeStrong((id *)&self->_zoomControl, a3);
}

- (CAMZoomSlider)zoomSlider
{
  return self->_zoomSlider;
}

- (void)setZoomSlider:(id)a3
{
  objc_storeStrong((id *)&self->_zoomSlider, a3);
}

- (double)zoomFactorAtPinchStart
{
  return self->_zoomFactorAtPinchStart;
}

- (void)setZoomFactorAtPinchStart:(double)a3
{
  self->_zoomFactorAtPinchStart = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)observingOrientationChanges
{
  return self->_observingOrientationChanges;
}

- (void)setObservingOrientationChanges:(BOOL)a3
{
  self->_observingOrientationChanges = a3;
}

- (unint64_t)appliedDirectOverlayEditingGestures
{
  return self->_appliedDirectOverlayEditingGestures;
}

- (void)setAppliedDirectOverlayEditingGestures:(unint64_t)a3
{
  self->_appliedDirectOverlayEditingGestures = a3;
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

- (CGRect)zoomControlFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_zoomControlFrame.origin.x;
  y = self->_zoomControlFrame.origin.y;
  width = self->_zoomControlFrame.size.width;
  height = self->_zoomControlFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setZoomControlFrame:(CGRect)a3
{
  self->_zoomControlFrame = a3;
}

- (CGRect)zoomSliderFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_zoomSliderFrame.origin.x;
  y = self->_zoomSliderFrame.origin.y;
  width = self->_zoomSliderFrame.size.width;
  height = self->_zoomSliderFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setZoomSliderFrame:(CGRect)a3
{
  self->_zoomSliderFrame = a3;
}

- (BOOL)captureContainerUncroppedFrameWasCalculatedWithContentRect
{
  return self->_captureContainerUncroppedFrameWasCalculatedWithContentRect;
}

- (void)setCaptureContainerUncroppedFrameWasCalculatedWithContentRect:(BOOL)a3
{
  self->_captureContainerUncroppedFrameWasCalculatedWithContentRect = a3;
}

- (BOOL)cameraIsFlipping
{
  return self->_cameraIsFlipping;
}

- (void)setCameraIsFlipping:(BOOL)a3
{
  self->_cameraIsFlipping = a3;
}

- (JFXPassThroughContainerView)effectEditorContainerView
{
  return self->_effectEditorContainerView;
}

- (void)setEffectEditorContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_effectEditorContainerView, a3);
}

- (CGRect)presentationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationRect.origin.x;
  y = self->_presentationRect.origin.y;
  width = self->_presentationRect.size.width;
  height = self->_presentationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  self->_presentationRect = a3;
}

- (CGRect)externalUncroppedPresentationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_externalUncroppedPresentationRect.origin.x;
  y = self->_externalUncroppedPresentationRect.origin.y;
  width = self->_externalUncroppedPresentationRect.size.width;
  height = self->_externalUncroppedPresentationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExternalUncroppedPresentationRect:(CGRect)a3
{
  self->_externalUncroppedPresentationRect = a3;
}

- (BOOL)configuredForOrientation
{
  return self->_configuredForOrientation;
}

- (void)setConfiguredForOrientation:(BOOL)a3
{
  self->_configuredForOrientation = a3;
}

- (CFXFaceReticleView)animojiTrackingLossReticle
{
  return self->_animojiTrackingLossReticle;
}

- (void)setAnimojiTrackingLossReticle:(id)a3
{
  objc_storeStrong((id *)&self->_animojiTrackingLossReticle, a3);
}

- (UIView)animojiReticleFacePromptView
{
  return self->_animojiReticleFacePromptView;
}

- (void)setAnimojiReticleFacePromptView:(id)a3
{
  objc_storeStrong((id *)&self->_animojiReticleFacePromptView, a3);
}

- (BOOL)isShowingAnimojiReticle
{
  return self->_isShowingAnimojiReticle;
}

- (void)setIsShowingAnimojiReticle:(BOOL)a3
{
  self->_isShowingAnimojiReticle = a3;
}

- (NSLayoutConstraint)facePromptLabelYConstraint
{
  return self->_facePromptLabelYConstraint;
}

- (void)setFacePromptLabelYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_facePromptLabelYConstraint, a3);
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationView, a3);
}

- (CAMViewfinderReticleView)reticleView
{
  return self->_reticleView;
}

- (void)setReticleView:(id)a3
{
  objc_storeStrong((id *)&self->_reticleView, a3);
}

- (UIView)bottomControlsContainer
{
  return self->_bottomControlsContainer;
}

- (void)setBottomControlsContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControlsContainer, a3);
}

- (CAMDynamicShutterControl)dynamicShutterControl
{
  return self->_dynamicShutterControl;
}

- (void)setDynamicShutterControl:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicShutterControl, a3);
}

- (CAMControlStatusBar)controlStatusBar
{
  return self->_controlStatusBar;
}

- (void)setControlStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_controlStatusBar, a3);
}

- ($76EADD4ED24426C67044446678BAA581)dynamicShutterSettings
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[20].var6;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[20].var4;
  *(_OWORD *)&retstr->var6 = v3;
  retstr->var8 = self[20].var8;
  v4 = *(_OWORD *)&self[20].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[20].var0;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (void)setDynamicShutterSettings:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_dynamicShutterSettings.tapBehavior = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var4;
  v3 = *(_OWORD *)&a3->var6;
  v5 = *(_OWORD *)&a3->var2;
  self->_dynamicShutterSettings.idleColor = a3->var8;
  *(_OWORD *)&self->_dynamicShutterSettings.allowsZoom = v4;
  *(_OWORD *)&self->_dynamicShutterSettings.ringStyle = v3;
  *(_OWORD *)&self->_dynamicShutterSettings.dragRightBehavior = v5;
}

- (BOOL)switchedToVideoMode
{
  return self->_switchedToVideoMode;
}

- (void)setSwitchedToVideoMode:(BOOL)a3
{
  self->_switchedToVideoMode = a3;
}

- (JFXThreadSafeArray)runOnceAnimatedOverlays
{
  return self->_runOnceAnimatedOverlays;
}

- (void)setRunOnceAnimatedOverlays:(id)a3
{
  objc_storeStrong((id *)&self->_runOnceAnimatedOverlays, a3);
}

- (CFXLiveCaptureViewController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraViewController, a3);
}

- (OS_dispatch_group)editingOverlayWithGestureGroup
{
  return self->_editingOverlayWithGestureGroup;
}

- (void)setEditingOverlayWithGestureGroup:(id)a3
{
  objc_storeStrong((id *)&self->_editingOverlayWithGestureGroup, a3);
}

- (BOOL)isExternalCaptureSessionAnExternalCamera
{
  return self->_isExternalCaptureSessionAnExternalCamera;
}

- (void)setIsExternalCaptureSessionAnExternalCamera:(BOOL)a3
{
  self->_isExternalCaptureSessionAnExternalCamera = a3;
}

- (CFXEffectEditorView)effectEditor
{
  return self->_effectEditor;
}

- (void)setEffectEditor:(id)a3
{
  objc_storeStrong((id *)&self->_effectEditor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectEditor, 0);
  objc_storeStrong((id *)&self->_editingOverlayWithGestureGroup, 0);
  objc_storeStrong((id *)&self->_cameraViewController, 0);
  objc_storeStrong((id *)&self->_runOnceAnimatedOverlays, 0);
  objc_storeStrong((id *)&self->_controlStatusBar, 0);
  objc_storeStrong((id *)&self->_dynamicShutterControl, 0);
  objc_storeStrong((id *)&self->_bottomControlsContainer, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong((id *)&self->_facePromptLabelYConstraint, 0);
  objc_storeStrong((id *)&self->_animojiReticleFacePromptView, 0);
  objc_storeStrong((id *)&self->_animojiTrackingLossReticle, 0);
  objc_storeStrong((id *)&self->_effectEditorContainerView, 0);
  objc_storeStrong((id *)&self->_zoomSlider, 0);
  objc_storeStrong((id *)&self->_zoomControl, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainerSnapshot, 0);
  objc_storeStrong((id *)&self->_viewfinderFlipTransition, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_topBarContaineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_cameraControlsContainerView, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainerContainer, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainer, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_nonTransformedContainerView, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, 0);
  objc_storeStrong((id *)&self->_cameraControls, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)effectEditorViewDidBeginEditing:(id)a3
{
  NSObject *v3;

  -[CFXCaptureViewController editingOverlayWithGestureGroup](self, "editingOverlayWithGestureGroup", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v3);

}

- (void)effectEditorViewDidEndEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CFXCaptureViewController effectEditor](self, "effectEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[CFXCaptureViewController removeEffectEditorAnimated:](self, "removeEffectEditorAnimated:", 1);
  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
  {
    -[CFXCaptureViewController composition](self, "composition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jtEffectsForType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          -[CFXCaptureViewController enableAnimationForOverlayEffect:](self, "enableAnimationForOverlayEffect:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  -[CFXCaptureViewController editingOverlayWithGestureGroup](self, "editingOverlayWithGestureGroup", (_QWORD)v14);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v13);

}

- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[CFXCaptureViewController composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jtEffectsForType:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v7, "bounds");
    v11 = 44.0 / v10;
    v13 = 44.0 / v12;
    objc_msgSend(v7, "bounds");
    v21 = *MEMORY[0x24BDC0D88];
    v22 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v9, &v21, 1, x, y, v14, v15, v16, v17, v11, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  BOOL v23;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[2];

  y = a4.y;
  x = a4.x;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "jtEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v14 = 44.0 / v13;
    v27[0] = v12;
    v16 = 44.0 / v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v17, &v25, 1, x, y, v18, v19, v20, v21, v14, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v22 != 0;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  objc_msgSend(a4, "jtEffect");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v7, v6);

}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  JFXLog_effects();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "jtEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v7, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "Removing effect - type: %{public}@, name: %{public}@", buf, 0x16u);

  }
  -[CFXCaptureViewController composition](self, "composition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didRemoveEffect___block_invoke;
  v11[3] = &unk_24EE57B60;
  v11[4] = self;
  objc_msgSend(v10, "removeEffect:completion:", v5, v11);

}

void __85__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didRemoveEffect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectCompositionDidChange:", v3);

  CFXLog_action();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jtEffects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effect removed"), CFSTR("live"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2269A9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  uint64_t v20;
  CGPoint result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.y;
  v11 = a5.x;
  objc_msgSend(a4, "jtEffect", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDC0D88];
  v20 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  +[JFXEffectEditingUtilities spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:](JFXEffectEditingUtilities, "spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:", v12, &v19, v11, v10, x, y, width, height);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)effectEditorView:(id)a3 didMoveEffect:(id)a4 withTouchPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  __int128 v33;
  _QWORD block[4];
  id v35;
  id v36;
  __int128 v37;
  uint64_t v38;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mostRecentARMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "jtEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "type") == 2
    && -[CFXCaptureViewController shouldUseFaceTracking](self, "shouldUseFaceTracking"))
  {
    objc_msgSend(v12, "faceAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v10, "jtEffect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trackingProps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "trackingType");

      objc_msgSend(v9, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      objc_msgSend(v12, "faceAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
      v28 = objc_msgSend(v15, "playableAspectRatio");
      v29 = objc_msgSend(v15, "playableAspectRatioPreservationMode");
      v37 = *MEMORY[0x24BDC0D88];
      v33 = v37;
      v38 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v30 = v38;
      v31 = +[JFXEffectEditingUtilities trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v37, v17, v26, 0, 1, v27, x, y, v19, v21, v23, v25, v28, v29);

      v32 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
      v37 = v33;
      v38 = v30;
      if (+[JFXEffectEditingUtilities makeOverlayTrackedMaintainingAppearance:atTime:newTrackingType:arMetadata:playableInterfaceOrientation:](JFXEffectEditingUtilities, "makeOverlayTrackedMaintainingAppearance:atTime:newTrackingType:arMetadata:playableInterfaceOrientation:", v15, &v37, v31, v12, v32))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __98__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke;
        block[3] = &unk_24EE57AA8;
        v35 = v9;
        v36 = v15;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
  }
  else
  {

  }
}

void __98__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "trackingProps");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyEffectTrackingDidChangeToType:", objc_msgSend(v2, "trackingType"));

}

- (void)effectEditorView:(id)a3 didTransformEffect:(id)a4 transform:(CGAffineTransform *)a5 relativeToBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[3];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&a5->c;
  v15[0] = *(_OWORD *)&a5->a;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a5->tx;
  v13 = *MEMORY[0x24BDC0D88];
  v14 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  +[JFXEffectEditingUtilities addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](JFXEffectEditingUtilities, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v11, v15, &v13, 1, x, y, width, height);

}

- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  uint64_t v26;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  objc_msgSend(v9, "jtEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "jtEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v12, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v25, 1, 1, 1, x, y, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  uint64_t v26;
  CGRect result;

  v6 = a5;
  v8 = a4;
  objc_msgSend(v8, "jtEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "jtEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "normalizedMinimumHitTestArea");
    v25 = *MEMORY[0x24BDC0D88];
    v26 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v11, "hitAreaBoundingFrameAtTime:forcePosterFrame:includeDropShadow:adjustForMinimumSize:normalizedMinimumSize:relativeTo:basisOrigin:", &v25, 1, 1, v6, 1);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  void *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = *MEMORY[0x24BDC0D88];
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeButtonRelativeBoundsIsViewSpace
{
  return 0;
}

- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  __int128 v11;
  int64_t v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const __CFString *v25;
  const __CFString *v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  uint64_t v30;
  CGPoint result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v28.c = v11;
  *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v12 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
  v13 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  if (-[CFXCaptureViewController captureMode](self, "captureMode") == 1)
    -[CFXCaptureViewController overlayTransformForLocalViewfinder](self, "overlayTransformForLocalViewfinder");
  if (v12 != v13)
  {
    v14 = 0.0;
    v15 = 0.0;
    if (v12 != 1)
    {
      if (v12 == 3)
      {
        v15 = 1.57079633;
      }
      else if (v12 == 4)
      {
        v15 = -1.57079633;
      }
      else
      {
        v15 = 3.14159265;
        if (v12 != 2)
          v15 = 0.0;
      }
    }
    if (v13 != 1)
    {
      if (v13 == 3)
      {
        v14 = 1.57079633;
      }
      else if (v13 == 4)
      {
        v14 = -1.57079633;
      }
      else
      {
        v14 = 3.14159265;
        if (v13 != 2)
          v14 = 0.0;
      }
    }
    v16 = v15 - v14;
    JFXLog_viewerUI();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      switch(v12)
      {
        case 1:
          v25 = CFSTR("UIInterfaceOrientationPortrait");
          break;
        case 3:
          v25 = CFSTR("UIInterfaceOrientationLandscapeRight");
          break;
        case 4:
          v25 = CFSTR("UIInterfaceOrientationLandscapeLeft");
          break;
        default:
          v25 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
          if (v12 != 2)
            v25 = 0;
          break;
      }
      switch(v13)
      {
        case 1:
          v26 = CFSTR("UIInterfaceOrientationPortrait");
          break;
        case 3:
          v26 = CFSTR("UIInterfaceOrientationLandscapeRight");
          break;
        case 4:
          v26 = CFSTR("UIInterfaceOrientationLandscapeLeft");
          break;
        default:
          v26 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
          if (v13 != 2)
            v26 = 0;
          break;
      }
      LODWORD(v29.a) = 138412802;
      *(_QWORD *)((char *)&v29.a + 4) = v25;
      WORD2(v29.b) = 2112;
      *(_QWORD *)((char *)&v29.b + 6) = v26;
      HIWORD(v29.c) = 2048;
      v29.d = v16;
      _os_log_debug_impl(&dword_2269A9000, v17, OS_LOG_TYPE_DEBUG, "removeButtonPositionForEffect deviceOrientation %@ windowInterfaceOrientation %@ rotation %f", (uint8_t *)&v29, 0x20u);
    }

    v27 = v28;
    CGAffineTransformRotate(&v29, &v27, v16);
    v28 = v29;
  }
  objc_msgSend(v10, "jtEffect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v27.a = *MEMORY[0x24BDC0D88];
  v27.c = *(CGFloat *)(MEMORY[0x24BDC0D88] + 16);
  v29 = v28;
  +[JFXEffectEditingUtilities removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:](JFXEffectEditingUtilities, "removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:", v18, &v27, &v29, x, y, width, height);
  v20 = v19;
  v22 = v21;

  v23 = v20;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  __int128 v12;
  uint64_t v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  objc_msgSend(a4, "jtEffect", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDC0D88];
  v13 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v10 = +[JFXEffectEditingUtilities newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:](JFXEffectEditingUtilities, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:", v9, &v12, 0, x, y, width, height);

  return v10;
}

- (id)effectEditorView:(id)a3 textForEffect:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities textForEffect:](JFXEffectEditingUtilities, "textForEffect:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4
{
  id v4;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities beginTextEditingForEffect:](JFXEffectEditingUtilities, "beginTextEditingForEffect:", v4);

}

- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "jtEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectToDefaultTextIfEmpty:](JFXEffectEditingUtilities, "updateEffectToDefaultTextIfEmpty:", v6);

  objc_msgSend(v5, "jtEffect");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[JFXEffectEditingUtilities endTextEditingForEffect:](JFXEffectEditingUtilities, "endTextEditingForEffect:", v7);
}

- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[JFXEffectEditingUtilities canEditTextForEffect:](JFXEffectEditingUtilities, "canEditTextForEffect:", v4);

  return v5;
}

- (BOOL)effectEditorView:(id)a3 presentCustomTextEditingUI:(id)a4
{
  void *v5;
  _QWORD block[5];

  objc_msgSend(a4, "jtEffect", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCaptureViewController presentFullScreenTextEditorForEffect:insertingEffect:](self, "presentFullScreenTextEditorForEffect:insertingEffect:", v5, 0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return 1;
}

uint64_t __96__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEffectEditorAnimated:", 1);
}

- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[JFXEffectEditingUtilities maximumTextLengthForEffect:](JFXEffectEditingUtilities, "maximumTextLengthForEffect:", v4);

  return v5;
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4
{
  void *v4;
  int v5;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  return v5 == 2
      && +[JFXEffectEditingUtilities isFaceTrackingDataAvailable](JFXEffectEditingUtilities, "isFaceTrackingDataAvailable");
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v4 = a4;
  objc_msgSend(v4, "jtEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "jtEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCurrentlyTracking");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)fullScreenTextEditViewController:(id)a3 shouldDisableEditingAnimationForEffect:(id)a4
{
  CGAffineTransform v5[2];

  memset(&v5[1], 0, sizeof(CGAffineTransform));
  -[CFXCaptureViewController overlayTransformForLocalViewfinder](self, "overlayTransformForLocalViewfinder", a3, a4);
  v5[0] = v5[1];
  return !CGAffineTransformIsIdentity(v5);
}

- (void)fullScreenTextEditViewController:(id)a3 didBeginAnimationBeforeEditingEffect:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  objc_msgSend(a4, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeAfterNextFrameIsRendered:", v7);

}

- (void)fullScreenTextEditViewController:(id)a3 didBeginEditingEffect:(id)a4
{
  id v4;

  objc_msgSend(a4, "jtEffect", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)fullScreenTextEditViewController:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4 updatedText:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  objc_msgSend(a4, "jtEffect");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v7, v6);

}

- (void)fullScreenTextEditViewController:(id)a3 didFinishAnimationAfterEditingEffect:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  objc_msgSend(a4, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeAfterNextFrameIsRendered:", v7);

}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingEffect:(id)a4 withUpdatedText:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  objc_msgSend(v13, "jtEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v8, v7);

  objc_msgSend(v13, "jtEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  if (isStreamingMode(-[CFXCaptureViewController captureMode](self, "captureMode")))
  {
    objc_msgSend(v13, "jtEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    if (v11 == 2)
    {
      objc_msgSend(v13, "jtEffect");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCaptureViewController enableAnimationForOverlayEffect:](self, "enableAnimationForOverlayEffect:", v12);

    }
  }

}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  JFXLog_effects();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "jtEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v7, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "Removing effect - type: %{public}@, name: %{public}@", buf, 0x16u);

  }
  -[CFXCaptureViewController composition](self, "composition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __118__CFXCaptureViewController_EffectEditingAdditions__fullScreenTextEditViewController_didFinishEditingByRemovingEffect___block_invoke;
  v15[3] = &unk_24EE57B60;
  v15[4] = self;
  objc_msgSend(v10, "removeEffect:completion:", v5, v15);

  CFXLog_action();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXCaptureViewController composition](self, "composition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jtEffects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("effect removed"), CFSTR("live"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v14;
    _os_log_impl(&dword_2269A9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

  }
}

void __118__CFXCaptureViewController_EffectEditingAdditions__fullScreenTextEditViewController_didFinishEditingByRemovingEffect___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "composition");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "effectCompositionDidChange:", v2);

}

- (int64_t)faceTrackingInterfaceOrientationForfullScreenTextEditViewController:(id)a3
{
  return +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation", a3);
}

- (void)CFX_executeBlockAfterNextFrameRendered:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXCaptureViewController cameraViewController](self, "cameraViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterNextFrameIsRendered:", v7);

}

void __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cameraViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_2;
  v3[3] = &unk_24EE580C8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "executeAfterNextFrameIsRendered:", v3);

}

void __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_3;
  block[3] = &unk_24EE580C8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)zoomControl:(const char *)a1 didChangeZoomFactor:(NSObject *)a2 interactionType:(double)a3 .cold.1(const char *a1, NSObject *a2, double a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 2048;
  v8 = a3;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "---- %@: actualZoomFactor=%.3f", v6, 0x16u);

}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture begin - apply pan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "capture direct pan gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "capture direct pan gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture changed - ignored because not currently editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture changed - apply pan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture finished - ignored because not currently editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pan gesture finished - apply pan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture begin - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture changed - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct pinch gesture finished - apply pinch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct rotate gesture begin - apply rotate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct rotated gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "capture direct rotated gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, v0, v1, "capture direct rotated gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct rotate gesture begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct rotate gesture changed - apply rotate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct rotate gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_2269A9000, v0, v1, "capture direct rotate gesture finished - apply rotate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = &stru_24EE5C428;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = &stru_24EE5C428;
  else
    v6 = CFSTR("(ONLY)");
  v7 = *a2;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\nmetadata written to: %@"), v5);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  *(_DWORD *)buf = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = v4;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "successful video %@ written to %@%@", buf, 0x20u);
  if (v5)

}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "failed to take still: %@{public}", v4, 0xCu);

}

@end
