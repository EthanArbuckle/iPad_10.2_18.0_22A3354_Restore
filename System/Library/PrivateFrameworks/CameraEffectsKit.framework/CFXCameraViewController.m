@implementation CFXCameraViewController

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  +[CFXApplicationState beginMonitoringApplicationState](CFXApplicationState, "beginMonitoringApplicationState");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSuiteNamed:", CFSTR("com.apple.MobileSMS"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE79108];
  v7[0] = &unk_24EE9B9F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);

  +[CFXEffect setupFactoryDelegate](CFXEffect, "setupFactoryDelegate");
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXMediaSettings setProviderDelegate:](JFXMediaSettings, "setProviderDelegate:", v5);

}

+ (void)preheatWithWindow:(id)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5 aspectRatioCrop:(int64_t)a6
{
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  +[JFXOrientationMonitor initializeWithKeyWindow:](JFXOrientationMonitor, "initializeWithKeyWindow:", a3);
  v9 = CFXCanonicalAspectRatioCropForCaptureModeAndDesiredAspectRatioCrop(a4, a6);
  JFXLog_camera();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCFXAspectRatioCrop(a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCFXAspectRatioCrop(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218754;
    v18 = a5;
    v19 = 2048;
    v20 = a4;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, "devicePosition: %ld, captureMode: %ld, aspectRatioCrop: %{public}@, canonicalAspectRatioCrop: %{public}@", (uint8_t *)&v17, 0x2Au);

  }
  v13 = JFXCameraModeForCaptureModeAndAspectRatioCrop(a4, v9);
  +[CFXEffectHostAppDelegate sharedInstance](CFXEffectHostAppDelegate, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColorSpaceDelegate:", 0);

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "prepareCameraForMode:position:completion:", v13, 2, &__block_literal_global_2);

  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOwnerName:", CFSTR("Generated in Camera Effects"));

}

- (CFXCameraViewController)initWithCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 flashMode:(int64_t)a5 aspectRatioCrop:(int64_t)a6
{
  CFXCameraViewController *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  OS_dispatch_queue *externalCaptureSessionInputDeserializationQueue;
  uint64_t v18;
  OS_dispatch_queue *externalCaptureSessionInputProcessingQueue;
  uint64_t v20;
  OS_dispatch_queue *externalCaptureSessionOutputProcessingQueue;
  uint64_t v22;
  JFXThreadSafeDictionary *externalCaptureSessionInputFrameTimestamps;
  JFXRemoteCommandServer *v24;
  JFXRemoteCommandServer *remoteCommandServer;
  CFXThermalPolicyManager *v26;
  CFXThermalPolicyManager *thermalPolicyManager;
  CFXThermalPolicyManager *v28;
  void *v29;
  uint64_t v30;
  JFXMetadataValidator *metadataValidator;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  CFXCameraStreamBufferQueue *v37;
  CFXCameraStreamBufferQueue *outputBufferQueue;
  objc_super v40;
  uint8_t buf[4];
  int64_t v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v40.receiver = self;
  v40.super_class = (Class)CFXCameraViewController;
  v10 = -[CFXCameraViewController initWithNibName:bundle:](&v40, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    v11 = CFXCanonicalAspectRatioCropForCaptureModeAndDesiredAspectRatioCrop(a3, a6);
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v12, &__block_literal_global_11);

    JFXLog_camera();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromCFXAspectRatioCrop(a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCFXAspectRatioCrop(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v42 = a4;
      v43 = 2048;
      v44 = a5;
      v45 = 2048;
      v46 = a3;
      v47 = 2114;
      v48 = v14;
      v49 = 2114;
      v50 = v15;
      _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEFAULT, "devicePosition: %ld, flashMode: %ld, captureMode: %ld, aspectRatioCrop: %{public}@, canonicalAspectRatioCrop: %{public}@", buf, 0x34u);

    }
    v10->_aspectRatioCrop = v11;
    v10->_captureMode = a3;
    v10->_cameraPosition = 2;
    v10->_initialFlashMode = a5;
    v10->_showsViewfinder = 1;
    v10->_usesInternalCaptureSession = 1;
    v10->_cameraControlsShown = 1;
    JFXCreateDispatchQueue(v10, CFSTR("externalCaptureSessionInputDeserializationQueue"), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    externalCaptureSessionInputDeserializationQueue = v10->_externalCaptureSessionInputDeserializationQueue;
    v10->_externalCaptureSessionInputDeserializationQueue = (OS_dispatch_queue *)v16;

    JFXCreateDispatchQueue(v10, CFSTR("externalCaptureSessionInputProcessingQueue "), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    externalCaptureSessionInputProcessingQueue = v10->_externalCaptureSessionInputProcessingQueue;
    v10->_externalCaptureSessionInputProcessingQueue = (OS_dispatch_queue *)v18;

    JFXCreateDispatchQueue(v10, CFSTR("externalCaptureSessionOutputProcessingQueue"), 0);
    v20 = objc_claimAutoreleasedReturnValue();
    externalCaptureSessionOutputProcessingQueue = v10->_externalCaptureSessionOutputProcessingQueue;
    v10->_externalCaptureSessionOutputProcessingQueue = (OS_dispatch_queue *)v20;

    v10->_externalCaptureSessionCameraPosition = 0;
    v10->_externalCaptureSessionCameraPositionSet = 0;
    v22 = objc_opt_new();
    externalCaptureSessionInputFrameTimestamps = v10->_externalCaptureSessionInputFrameTimestamps;
    v10->_externalCaptureSessionInputFrameTimestamps = (JFXThreadSafeDictionary *)v22;

    v24 = -[JFXRemoteCommandServer initWithDelegate:]([JFXRemoteCommandServer alloc], "initWithDelegate:", v10);
    remoteCommandServer = v10->_remoteCommandServer;
    v10->_remoteCommandServer = v24;

    v26 = objc_alloc_init(CFXThermalPolicyManager);
    thermalPolicyManager = v10->_thermalPolicyManager;
    v10->_thermalPolicyManager = v26;

    v28 = v10->_thermalPolicyManager;
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setThermalDelegate:", v28);

    v30 = objc_opt_new();
    metadataValidator = v10->_metadataValidator;
    v10->_metadataValidator = (JFXMetadataValidator *)v30;

    v32 = *MEMORY[0x24BDBF148];
    v33 = *(double *)(MEMORY[0x24BDBF148] + 8);
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrameSize:", v32, v33);

    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRenderSize:", v32, v33);

    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "startTrackingTimeIntervalEventWithName:", CFSTR("activetime"));

    if (isStreamingMode(-[CFXCameraViewController captureMode](v10, "captureMode")))
    {
      v37 = -[CFXCameraStreamBufferQueue initWithMaxCapacity:]([CFXCameraStreamBufferQueue alloc], "initWithMaxCapacity:", 90);
      outputBufferQueue = v10->_outputBufferQueue;
      v10->_outputBufferQueue = v37;

    }
    v10->_isEffectsAnalyticsRunning = 0;
  }
  return v10;
}

uint64_t __88__CFXCameraViewController_initWithCaptureMode_devicePosition_flashMode_aspectRatioCrop___block_invoke()
{
  +[CFXEffect initEffectRegistry](CFXEffect, "initEffectRegistry");
  return +[CFXEffect preWarmShaderCache](CFXEffect, "preWarmShaderCache");
}

- (CFXCameraViewController)initWithCaptureMode:(int64_t)a3
{
  return -[CFXCameraViewController initWithCaptureMode:devicePosition:flashMode:aspectRatioCrop:](self, "initWithCaptureMode:devicePosition:flashMode:aspectRatioCrop:", a3, 2, 0, 0);
}

- (CFXCameraViewController)initWithMode:(int64_t)a3
{
  return -[CFXCameraViewController initWithCaptureMode:devicePosition:flashMode:aspectRatioCrop:](self, "initWithCaptureMode:devicePosition:flashMode:aspectRatioCrop:", a3, 2, 0, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraDidStop");

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllEffectsAnimated:", 0);

  v5 = *MEMORY[0x24BDBF148];
  v6 = *(double *)(MEMORY[0x24BDBF148] + 8);
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrameSize:", v5, v6);

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRenderSize:", v5, v6);

  +[JFXOrientationMonitor uninitialize](JFXOrientationMonitor, "uninitialize");
  v9.receiver = self;
  v9.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController dealloc](&v9, sel_dealloc);
}

- (void)loadView
{
  JFXPassThroughContainerView *v3;
  void *v4;
  JFXPassThroughContainerView *v5;

  v3 = [JFXPassThroughContainerView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[JFXPassThroughContainerView initWithFrame:](v3, "initWithFrame:");

  -[CFXCameraViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
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
  CFXCameraControlsViewController *v36;
  void *v37;
  CFXCameraControlsViewController *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CFXEffectBrowserViewController *v52;
  void *v53;
  int64_t v54;
  _BOOL8 v55;
  void *v56;
  void *v57;
  _BOOL8 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
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
  CFXStageManagerWarningViewController *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  _BOOL4 v123;
  BOOL v124;
  objc_super v125;
  _QWORD v126[5];

  v126[4] = *MEMORY[0x24BDAC8D0];
  v125.receiver = self;
  v125.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController viewDidLoad](&v125, sel_viewDidLoad);
  v3 = isStreamingMode(-[CFXCameraViewController captureMode](self, "captureMode"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "userInterfaceIdiom") == 0;

  }
  v124 = v3;
  if ((v3 | !+[JFXOrientationMonitor initialized](JFXOrientationMonitor, "initialized")) == 1)
    +[JFXOrientationMonitor initializeWithViewController:](JFXOrientationMonitor, "initializeWithViewController:", self);
  v6 = (void *)MEMORY[0x24BDF6E00];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storyboardWithName:bundle:", CFSTR("CFXCaptureViewController"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("CFXCaptureViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCameraViewController setCaptureViewController:](self, "setCaptureViewController:", v9);

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  v11 = -[CFXCameraViewController captureMode](self, "captureMode");
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCaptureMode:", v11);

  +[JFXEffectEditingUtilities setStreamingMode:](JFXEffectEditingUtilities, "setStreamingMode:", isStreamingMode(-[CFXCameraViewController captureMode](self, "captureMode")));
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAspectRatioCrop:", -[CFXCameraViewController aspectRatioCrop](self, "aspectRatioCrop"));

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFlashMode:", -[CFXCameraViewController initialFlashMode](self, "initialFlashMode"));

  }
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateUIForDevicePosition:", 2);

  if (v4)
  {
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cameraControls");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "controlsContainerViewTopConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCaptureControlsContainerTopConstraint:", v18);

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cameraControls");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "controlsContainerViewLeadingConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCaptureControlsContainerLeadingConstraint:", v22);

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cameraControls");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "controlsContainerViewTrailingConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCaptureControlsContainerTrailingConstraint:", v26);

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cameraControls");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "controlsContainerViewWidthConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCaptureControlsContainerWidthConstraint:", v30);

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cameraControls");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "controlsContainerViewHeightConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCaptureControlsContainerHeightConstraint:", v34);

  }
  v36 = [CFXCameraControlsViewController alloc];
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[CFXCameraControlsViewController initWithDelegate:captureMode:](v36, "initWithDelegate:captureMode:", v37, -[CFXCameraViewController captureMode](self, "captureMode"));
  -[CFXCameraViewController setCameraControlsViewController:](self, "setCameraControlsViewController:", v38);

  if (-[CFXCameraViewController captureMode](self, "captureMode") == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBackgroundColor:", v39);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "colorWithAlphaComponent:", 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setBackgroundColor:", v40);

  }
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "cameraControls");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v43, "controlsContainerViewWidthConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 0);

    objc_msgSend(v43, "controlsContainerViewHeightConstraint");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 0);

    objc_msgSend(v43, "controlsContainerViewTopConstraint");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = 1144750080;
    objc_msgSend(v46, "setPriority:", v47);

  }
  objc_msgSend(v43, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "controlsContainerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "effectBrowserContentPresenterViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = -[CFXEffectBrowserViewController initWithDelegate:contentPresenter:]([CFXEffectBrowserViewController alloc], "initWithDelegate:contentPresenter:", self, v51);
  -[CFXCameraViewController setEffectBrowserViewController:](self, "setEffectBrowserViewController:", v52);

  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setContentPresenterDelegate:", v51);

  objc_msgSend(v51, "setDelegate:", self);
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    v54 = -[CFXCameraViewController captureMode](self, "captureMode");
    if (v54 == 2)
    {
      -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = 0;
    }
    else
    {
      if (v54)
        goto LABEL_21;
      v55 = -[CFXCameraViewController aspectRatioCrop](self, "aspectRatioCrop") != 1;
      -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56;
      v58 = v55;
    }
    objc_msgSend(v56, "setShowAppIconBorders:", v58);

  }
LABEL_21:
  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addChildViewController:", v61);

  if (v4)
  {
    objc_msgSend(v51, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "insertSubview:belowSubview:", v60, v62);

    objc_msgSend(v43, "setEffectsBrowser:", v60);
  }
  else
  {
    objc_msgSend(v48, "addSubview:", v60);
  }
  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v60, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "userInterfaceIdiom");

  v123 = v4;
  v121 = v48;
  v122 = v43;
  v119 = v51;
  if (v67)
  {
    objc_msgSend(v60, "heightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToConstant:", 44.0);
    v69 = objc_claimAutoreleasedReturnValue();

    v65 = (void *)v69;
  }
  objc_msgSend(v60, "leadingAnchor", MEMORY[0x24BDD1628]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "leadingAnchor");
  v70 = v60;
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v72;
  objc_msgSend(v70, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v75;
  v126[2] = v65;
  v117 = v65;
  v118 = v70;
  objc_msgSend(v70, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v49;
  objc_msgSend(v49, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v126[3] = v78;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v126, 4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "activateConstraints:", v79);

  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "didMoveToParentViewController:", v122);

  -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setEffectsPickerDrawer:", v82);

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController jfxAddChildViewController:constrainRelativeToSafeAreas:](self, "jfxAddChildViewController:constrainRelativeToSafeAreas:", v84, 0);

  if (v123)
  {
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "cameraControls");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController jfxAddChildViewController:constrainRelativeToSafeAreas:](self, "jfxAddChildViewController:constrainRelativeToSafeAreas:", v86, 0);

    v87 = (void *)MEMORY[0x24BDF6E00];
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "storyboardWithName:bundle:", CFSTR("CFXNonTransformedLiveCaptureContainerViewController"), v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "instantiateViewControllerWithIdentifier:", CFSTR("CFXNonTransformedLiveCaptureContainerViewController"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v90, "loadViewIfNeeded");
    -[CFXCameraViewController thermalPolicyManager](self, "thermalPolicyManager");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "liveCaptureViewController");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setThermalPolicyManager:", v91);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "view");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setBackgroundColor:", v93);

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "liveCaptureViewController");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setLiveCaptureViewController:", v96);

    -[UIViewController jfxAddChildViewController:constrainRelativeToSafeAreas:](self, "jfxAddChildViewController:constrainRelativeToSafeAreas:", v90, 0);
    -[CFXCameraViewController view](self, "view");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "view");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "view");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "insertSubview:belowSubview:", v98, v100);

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "liveCaptureContainer");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "removeFromSuperview");

    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "liveCaptureContainerContainer");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "removeFromSuperview");

    objc_msgSend(v90, "liveCaptureContainer");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setLiveCaptureContainer:", v105);

    objc_msgSend(v90, "liveCaptureContainerContainer");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setLiveCaptureContainerContainer:", v107);

    objc_msgSend(v90, "view");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setNonTransformedContainerView:", v109);

  }
  if (-[CFXCameraViewController captureMode](self, "captureMode") == 1)
  {
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "cameraDidStart");

  }
  if (!v124)
  {
    v112 = objc_alloc_init(CFXStageManagerWarningViewController);
    -[CFXCameraViewController setStageManagerWarning:](self, "setStageManagerWarning:", v112);

    -[CFXCameraViewController stageManagerWarning](self, "stageManagerWarning");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setDelegate:", self);

    -[CFXCameraViewController stageManagerWarning](self, "stageManagerWarning");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController jfxAddChildViewController:](self, "jfxAddChildViewController:", v114);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  _QWORD v38[5];
  objc_super v39;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController viewWillTransitionToSize:withTransitionCoordinator:](&v39, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (!isStreamingMode(-[CFXCameraViewController captureMode](self, "captureMode")))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (!v9)
    {
      -[CFXCameraViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nonTransformedContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "indexOfObject:", v13);

      v15 = MEMORY[0x24BDAC760];
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = v14 + 1;
        -[CFXCameraViewController captureViewController](self, "captureViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "liveCaptureSnapshot");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXCameraViewController captureViewController](self, "captureViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "liveCaptureContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "center");
        v37[4] = self;
        v38[0] = v15;
        v38[1] = 3221225472;
        v38[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v38[3] = &unk_24EE57B60;
        v38[4] = self;
        v37[0] = v15;
        v37[1] = 3221225472;
        v37[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v37[3] = &unk_24EE57B60;
        -[UIViewController displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:](self, "displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:", v18, v16, 1, v7, v38, v37);

      }
      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cameraControls");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "effectsPickerSnapshot");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cameraControls");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "effectsPickerCenter");
      v27 = v26;
      v29 = v28;
      -[CFXCameraViewController view](self, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "subviews");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      v34[4] = self;
      v35[0] = v15;
      v35[1] = 3221225472;
      v35[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
      v35[3] = &unk_24EE57AA8;
      v35[4] = self;
      v36 = v23;
      v34[0] = v15;
      v34[1] = 3221225472;
      v34[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
      v34[3] = &unk_24EE57B60;
      v33 = v23;
      -[UIViewController displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:](self, "displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:", v33, v32, 0, v7, v35, v34, v27, v29, width, height);

    }
  }

}

void __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveCaptureContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveCaptureContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

uint64_t __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveCaptureContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v5[3] = &unk_24EE57B60;
  v5[4] = *(_QWORD *)(a1 + 32);
  return +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v5, &__block_literal_global_48, 0.25);
}

void __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liveCaptureContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 32), "setEffectsPickerSnapshotContainerView:", v10);
  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraControls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectsPickerDrawer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

}

uint64_t __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraControls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectsPickerDrawer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "setEffectsPickerSnapshotContainerView:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "userInterfaceIdiom")
    && !isStreamingMode(-[CFXCameraViewController captureMode](self, "captureMode")))
  {
    -[CFXCameraViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applyRotationTransformForPortrait");
  }

}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController willMoveToParentViewController:](&v7, sel_willMoveToParentViewController_, a3);
  if (-[CFXCameraViewController captureMode](self, "captureMode") == 3)
  {
    -[CFXCameraViewController animojiEffectID](self, "animojiEffectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      +[JFXAnimojiEffect animojiIDs](JFXAnimojiEffect, "animojiIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CFXCameraViewController setAnimojiOnlyEffectID:](self, "setAnimojiOnlyEffectID:", v6);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithName:", CFSTR("extensionlaunched"));

}

- (UIView)effectsPickerDrawer
{
  void *v3;
  void *v4;

  -[CFXCameraViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectsPickerDrawer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CFXCameraViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffectsPickerDrawer:", v4);

  if (!v4)
  {
    -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "jfxRemoveFromParentViewController");

      -[CFXCameraViewController setEffectBrowserViewController:](self, "setEffectBrowserViewController:", 0);
    }
  }
}

- (int64_t)effectsState
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  char v9;
  int64_t v10;

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXCameraViewController effectBrowserPresentedAppIdentifier](self, "effectBrowserPresentedAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("com.apple.FunCamera.Filters"));

  v7 = objc_msgSend(v4, "isEmpty");
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sessionRequiresFaceTracking");

  if ((v9 & 1) != 0)
  {
    v10 = 2;
  }
  else if ((v7 ^ 1 | v6) == 1)
  {
    if (objc_msgSend(v4, "requiresFaceTracking"))
      v10 = 2;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setShowsViewfinder:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_showsViewfinder != a3)
  {
    v3 = a3;
    self->_showsViewfinder = a3;
    -[CFXCameraViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUseLocalCameraViewfinder:", v3);

  }
}

- (double)userInterfaceAlpha
{
  void *v3;
  double v4;
  double v5;

  -[CFXCameraViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceAlpha");
  v5 = v4;

  return v5;
}

- (void)setUserInterfaceAlpha:(double)a3
{
  id v5;

  -[CFXCameraViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInterfaceAlpha:", a3);

}

- (void)setUsesInternalCaptureSession:(BOOL)a3
{
  if (self->_usesInternalCaptureSession != a3)
  {
    if (a3)
      -[CFXCameraViewController startCaptureSession](self, "startCaptureSession");
    else
      -[CFXCameraViewController stopCaptureSession](self, "stopCaptureSession");
    self->_usesInternalCaptureSession = a3;
  }
}

- (int64_t)flashMode
{
  void *v3;
  int64_t v4;

  -[CFXCameraViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flashMode");

  return v4;
}

- (int64_t)devicePosition
{
  if (isStreamingMode(-[CFXCameraViewController captureMode](self, "captureMode")))
    return -[CFXCameraViewController externalCaptureSessionCameraPosition](self, "externalCaptureSessionCameraPosition");
  else
    return -[CFXCameraViewController cameraPosition](self, "cameraPosition");
}

- (UIColor)animojiOnlyBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animojiBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setAnimojiOnlyBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimojiBackgroundColor:", v4);

}

- (id)animojiEffectID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jtEffectsForType:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "effectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAnimojiOnlyEffectID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  NSObject *v10;
  CFXCameraViewController *v11;

  v4 = a3;
  if (-[CFXCameraViewController captureMode](self, "captureMode") == 3)
  {
    +[JFXAnimojiEffect createAnimojiEffectForID:](JFXAnimojiEffect, "createAnimojiEffectForID:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Animoji"));
      v6 = objc_claimAutoreleasedReturnValue();
      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "composition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __50__CFXCameraViewController_setAnimojiOnlyEffectID___block_invoke;
      v9[3] = &unk_24EE57AA8;
      v10 = v5;
      v11 = self;
      objc_msgSend(v8, "removeAllEffectsOfType:completion:", v6, v9);

    }
    else
    {
      JFXLog_effects();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CFXCameraViewController setAnimojiOnlyEffectID:].cold.1();
    }

  }
  else
  {
    JFXLog_effects();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CFXCameraViewController setAnimojiOnlyEffectID:].cold.2();
  }

}

void __50__CFXCameraViewController_setAnimojiOnlyEffectID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEffect:", v3);

}

- (void)setExternalCaptureSessionCameraPosition:(int64_t)a3
{
  _BOOL8 v3;
  id v4;

  self->_externalCaptureSessionCameraPosition = a3;
  v3 = a3 == 0;
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsExternalCaptureSessionAnExternalCamera:", v3);

}

- (BOOL)isEffectsPickerHidden
{
  void *v2;
  void *v3;
  char v4;

  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (void)setEffectsPickerHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (void)setTransitionState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  char v21;
  _QWORD v22[5];
  char v23;

  v4 = a4;
  JFXLog_DebugViewerUI();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CFXCameraViewController setTransitionState:animated:].cold.1(v4, a3, v7);

  switch(a3)
  {
    case 0:
      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configureUIForOrientation");

      -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 1.0);

      -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShutterButtonAlpha:", 1.0);

      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeLiveCaptureSnapshot");

      -[CFXCameraViewController setCameraControlsShown:](self, "setCameraControlsShown:", 1);
      break;
    case 1:
      -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShutterButtonAlpha:", 0.0);

      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAnimojiTrackingReticle");
      goto LABEL_13;
    case 2:
      if (v4)
        v15 = 0.25;
      else
        v15 = 0.0;
      v16 = !-[CFXCameraViewController cameraControlsShown](self, "cameraControlsShown");
      if ((v16 & 1) == 0)
      {
        -[CFXCameraViewController captureViewController](self, "captureViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "showLiveCaptureSnapshotBlurred:animated:completion:", 1, 1, 0);

      }
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __55__CFXCameraViewController_setTransitionState_animated___block_invoke;
      v22[3] = &unk_24EE57C98;
      v22[4] = self;
      v23 = v16;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __55__CFXCameraViewController_setTransitionState_animated___block_invoke_2;
      v20[3] = &unk_24EE57D60;
      v20[4] = self;
      v21 = v16;
      +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v22, v20, v15);
      break;
    case 3:
      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "showLiveCaptureSnapshotBlurred:animated:completion:", 0, 0, 0);

      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "saveLiveCaptureSnapshotForReview");

      -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setShutterButtonAlpha:", 0.0);
LABEL_13:

      break;
    default:
      return;
  }
}

void __55__CFXCameraViewController_setTransitionState_animated___block_invoke(uint64_t a1, double a2)
{
  double v2;
  void *v3;
  id v4;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "effectBrowserViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

uint64_t __55__CFXCameraViewController_setTransitionState_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCameraControlsShown:", *(unsigned __int8 *)(a1 + 40));
}

- (void)removeAllEffects
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllEffectsAnimated:", 0);

  -[CFXCameraViewController metadataValidator](self, "metadataValidator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  -[CFXCameraViewController setExternalCaptureSessionCameraPosition:](self, "setExternalCaptureSessionCameraPosition:", 0);
  -[CFXCameraViewController effectsInStreamTimer](self, "effectsInStreamTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[CFXCameraViewController setEffectsInStreamTimer:](self, "setEffectsInStreamTimer:", 0);
  CFXLog_action();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jtEffects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("stopped effects in stream"), CFSTR("live"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v10;
    _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v14, 0xCu);

  }
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopTrackingTimeIntervalEventWithName:", CFSTR("activetime"));

  if (-[CFXCameraViewController captureMode](self, "captureMode") == 3)
  {
    +[JFXAnimojiEffect animojiIDs](JFXAnimojiEffect, "animojiIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXCameraViewController setAnimojiOnlyEffectID:](self, "setAnimojiOnlyEffectID:", v13);

  }
}

- (void)renderFrameWithImageData:(id)a3 orientation:(int64_t)a4 presentationRect:(CGRect)a5 contentsRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  CFXCameraViewController *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  int64_t v36;
  _QWORD block[5];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.size.height;
  v11 = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v16 = a3;
  v17 = -[CFXCameraViewController captureMode](self, "captureMode") != 3;
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSkipARProcessingWhenNoFaceDataIsPresent:", v17);

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "composition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEmpty");

  v22 = MEMORY[0x24BDAC760];
  if ((v21 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke;
    block[3] = &unk_24EE57B60;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_msgSend(v16, "timestamp");
  -[CFXCameraViewController noteInputFrameWithTimestamp:](self, "noteInputFrameWithTimestamp:");
  -[CFXCameraViewController externalCaptureSessionInputProcessingQueue](self, "externalCaptureSessionInputProcessingQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v25[1] = 3221225472;
  v25[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61;
  v25[3] = &unk_24EE57DF0;
  v26 = v16;
  v27 = self;
  v28 = v13;
  v29 = v12;
  v30 = v11;
  v31 = v10;
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  v36 = a4;
  v24 = v16;
  dispatch_async(v23, v25);

}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "effectsInStreamTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "effectsInStreamTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFireDate:", v5);

  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_2;
    v6[3] = &__block_descriptor_40_e17_v16__0__NSTimer_8l;
    v6[4] = 0x4014000000000000;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 5.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEffectsInStreamTimer:", v4);

  }
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  JFXLog_camera();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_2269A9000, v2, OS_LOG_TYPE_DEFAULT, "renderFrameWithImageData - effects applied but rendering hasn't been called in at least %lf seconds.", (uint8_t *)&v4, 0xCu);
  }

}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61(uint64_t a1)
{
  uint64_t v1;
  __CVBuffer *v2;
  double Width;
  double Height;
  uint64_t v5;
  double v6;
  uint64_t v7;
  int64_t v8;
  __objc2_class **v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  char v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v41;
  uint64_t i;
  void *v43;
  void *v44;
  CGFloat v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char *v54;
  unsigned int v55;
  uint64_t v56;
  JFXPixelRotationSession *v57;
  NSObject *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  NSObject *v68;
  double v69;
  double v70;
  BOOL v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  __int128 v109;
  id obj;
  __int128 v111;
  double v112;
  CFXEffectComposition *rect2;
  double rect2a;
  uint64_t v115;
  _QWORD v116[4];
  id v117;
  _QWORD block[13];
  __int128 v119;
  uint64_t v120;
  CGAffineTransform v121;
  _OWORD v122[8];
  uint64_t v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
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
  __int128 v145;
  CGAffineTransform v146;
  _BYTE v147[128];
  uint64_t v148;
  CGSize v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;

  v1 = a1;
  v148 = *MEMORY[0x24BDAC8D0];
  v2 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
  Width = (double)CVPixelBufferGetWidth(v2);
  Height = (double)CVPixelBufferGetHeight(v2);
  v5 = objc_msgSend(*(id *)(v1 + 32), "cameraPosition");
  if (v5
    || +[JFXOrientationMonitor isDeviceInterfaceLandscape](JFXOrientationMonitor, "isDeviceInterfaceLandscape"))
  {
    if (Width >= Height)
      v6 = Height;
    else
      v6 = Width;
    if (Width >= Height)
      Height = Width;
    Width = v6;
  }
  v7 = objc_msgSend(*(id *)(v1 + 40), "lastDeviceOrientation");
  v8 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
  v9 = off_24EE56000;
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "renderSize");
  v12 = v11;
  v14 = v13;

  v16 = Width == v12 && Height == v14 && v7 == v8;
  v115 = v1;
  if (!v16)
  {
    v108 = v5;
    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "renderSize");
    v19 = v18;
    v21 = v20;

    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrameSize:", Width, Height);

    +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setRenderSize:", Width, Height);

    JFXLog_DebugCamera();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_4(v1, v24, Width, Height);

    rect2 = objc_alloc_init(CFXEffectComposition);
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    objc_msgSend(*(id *)(v1 + 40), "captureViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "composition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "effects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v27;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v143;
      if (v108)
        v31 = 1;
      else
        v31 = v7 == v8;
      v32 = v31;
      v33 = v21 / Height;
      if (v19 / v21 >= Width / Height)
        v34 = v21;
      else
        v34 = v19;
      if (v19 / v21 >= Width / Height)
        v35 = Height;
      else
        v35 = Width;
      v111 = *MEMORY[0x24BDC0D88];
      v36 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      __asm { FMOV            V2.2D, #1.0 }
      v109 = _Q2;
      v41 = v34 / v35;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v143 != v30)
            objc_enumerationMutation(obj);
          v43 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
          objc_msgSend(v43, "jtEffect");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setRenderSize:", Width, Height);

          v45 = v41;
          if ((v32 & 1) == 0)
          {
            objc_msgSend(v43, "jtEffect", v41);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "type");

            v45 = v33;
            if (v47 == 2)
            {
              objc_msgSend(*(id *)(v115 + 40), "lastDeviceOrientation", v33);
              +[JFXOrientationMonitor deviceOrientation](JFXOrientationMonitor, "deviceOrientation");
              objc_msgSend(v43, "jtEffect");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v48;
              if (v48)
              {
                objc_msgSend(v48, "topLevelTransform");
              }
              else
              {
                v132 = 0u;
                v133 = 0u;
                v130 = 0u;
                v131 = 0u;
                v128 = 0u;
                v129 = 0u;
                v126 = 0u;
                v127 = 0u;
              }
              v123 = 0;
              v124 = 0;
              v125 = v109;
              pv_simd_matrix_rotate();
              v122[4] = v138;
              v122[5] = v139;
              v122[6] = v140;
              v122[7] = v141;
              v122[0] = v134;
              v122[1] = v135;
              v122[2] = v136;
              v122[3] = v137;
              objc_msgSend(v49, "setTopLevelTransform:", v122);

              v45 = v33;
            }
          }
          memset(&v146, 0, sizeof(v146));
          CGAffineTransformMakeScale(&v146, v45, v45);
          objc_msgSend(v43, "jtEffect");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v115 + 40), "captureViewController");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "view");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "frame");
          v121 = v146;
          v119 = v111;
          v120 = v36;
          +[JFXEffectEditingUtilities addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](JFXEffectEditingUtilities, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v50, &v121, &v119, 1);

          -[CFXEffectComposition addEffect:completion:](rect2, "addEffect:completion:", v43, 0);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
      }
      while (v29);
    }

    v1 = v115;
    objc_msgSend(*(id *)(v115 + 40), "captureViewController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setComposition:", rect2);

    if (v108)
    {
      v54 = (char *)&PVCardinalAnglesComplement
          + 4
          * +[JFXRotationTransforms rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", objc_msgSend(*(id *)(v115 + 32), "cameraPosition"), *(_QWORD *)(v115 + 112), 1);
      v9 = off_24EE56000;
    }
    else
    {
      v55 = +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation");
      v9 = off_24EE56000;
      if (v55 > 4)
      {
        v56 = 0;
        goto LABEL_48;
      }
      v54 = (char *)&unk_226AB7080 + 4 * (int)v55;
    }
    v56 = *(unsigned int *)v54;
LABEL_48:
    v57 = -[JFXPixelRotationSession initWithRotation:mirror:]([JFXPixelRotationSession alloc], "initWithRotation:mirror:", v56, 0);
    objc_msgSend(*(id *)(v115 + 40), "setExternalCaptureSessionRotationSession:", v57);

    objc_msgSend(*(id *)(v115 + 40), "setLastDeviceOrientation:", +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));
  }
  if (CGRectIsEmpty(*(CGRect *)(v1 + 48)) || CGRectHasNan())
  {
    JFXLog_camera();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_3();

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bounds");
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;

  }
  else
  {
    v61 = *(double *)(v1 + 48);
    v63 = *(double *)(v1 + 56);
    v65 = *(double *)(v1 + 64);
    v67 = *(double *)(v1 + 72);
  }
  if (CGRectIsEmpty(*(CGRect *)(v1 + 80)) || CGRectHasNan())
  {
    JFXLog_camera();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_2();

    v112 = 0.0;
    rect2a = 1.0;
    v69 = 1.0;
    v70 = 0.0;
  }
  else
  {
    v70 = *(double *)(v1 + 80);
    v112 = *(double *)(v1 + 88);
    v69 = *(double *)(v1 + 96);
    rect2a = *(double *)(v1 + 104);
  }
  objc_msgSend(*(id *)(v1 + 40), "externalPresentationRect");
  v152.origin.x = v61;
  v152.origin.y = v63;
  v152.size.width = v65;
  v152.size.height = v67;
  v71 = CGRectEqualToRect(v150, v152);
  v72 = MEMORY[0x24BDAC760];
  if (!v71
    || (objc_msgSend(*(id *)(v1 + 40), "externalContentRect"),
        v153.origin.x = v70,
        v153.origin.y = v112,
        v153.size.width = v69,
        v153.size.height = rect2a,
        !CGRectEqualToRect(v151, v153)))
  {
    v1 = v115;
    objc_msgSend(*(id *)(v115 + 40), "setExternalPresentationRect:", v61, v63, v65, v67);
    objc_msgSend(*(id *)(v115 + 40), "setExternalContentRect:", v70, v112, v69, rect2a);
    JFXLog_camera();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromCGRect(*(CGRect *)(v115 + 48));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(*(CGRect *)(v115 + 80));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v149.width = Width;
      v149.height = Height;
      NSStringFromCGSize(v149);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v146.a) = 138412802;
      *(_QWORD *)((char *)&v146.a + 4) = v105;
      WORD2(v146.b) = 2112;
      *(_QWORD *)((char *)&v146.b + 6) = v106;
      HIWORD(v146.c) = 2112;
      *(_QWORD *)&v146.d = v107;
      _os_log_debug_impl(&dword_2269A9000, v73, OS_LOG_TYPE_DEBUG, "renderFrameWithImageData presentationRect  %@ contentRect %@ renderSize %@", (uint8_t *)&v146, 0x20u);

    }
    block[0] = v72;
    block[1] = 3221225472;
    block[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_65;
    block[3] = &unk_24EE57DA8;
    block[4] = *(_QWORD *)(v115 + 40);
    *(double *)&block[5] = v61;
    *(double *)&block[6] = v63;
    *(double *)&block[7] = v65;
    *(double *)&block[8] = v67;
    *(double *)&block[9] = v70;
    *(double *)&block[10] = v112;
    *(double *)&block[11] = v69;
    *(double *)&block[12] = rect2a;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  v74 = objc_msgSend(*(id *)(v1 + 32), "captureFramesPerSecond");
  -[__objc2_class sharedInstance](v9[2], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setFrameRate:", v74);

  v76 = objc_msgSend(*(id *)(v1 + 32), "captureFramesPerSecond");
  -[__objc2_class sharedInstance](v9[2], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setTimeScale:", v76);

  objc_msgSend(*(id *)(v1 + 32), "setMirrored:", useMirroredFrontCameraInStreamMode());
  v78 = objc_msgSend(*(id *)(v1 + 32), "cameraPosition");
  if (v78 != objc_msgSend(*(id *)(v1 + 40), "externalCaptureSessionCameraPosition")
    || (objc_msgSend(*(id *)(v1 + 40), "externalCaptureSessionCameraPositionSet") & 1) == 0)
  {
    objc_msgSend(*(id *)(v1 + 40), "setExternalCaptureSessionCameraPositionSet:", 1);
    objc_msgSend(*(id *)(v1 + 40), "captureViewController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "removeEffectsForCameraSwitch");

    CFXLog_action();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v1 + 40), "captureViewController");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "composition");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "jtEffects");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("camera flipped"), CFSTR("live"), v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v146.a) = 138543362;
      *(_QWORD *)((char *)&v146.a + 4) = v84;
      _os_log_impl(&dword_2269A9000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v146, 0xCu);

    }
    v116[0] = v72;
    v116[1] = 3221225472;
    v116[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_66;
    v116[3] = &unk_24EE57B60;
    v117 = *(id *)(v1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v116);
    if ((objc_msgSend(*(id *)(v1 + 40), "isEffectsAnalyticsRunning") & 1) == 0)
    {
      objc_msgSend(*(id *)(v1 + 40), "setIsEffectsAnalyticsRunning:", 1);
      CFXLog_action();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v1 + 40), "captureViewController");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "composition");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "jtEffects");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        +[CFXActionLogging actionLogAsJSONForEvent:atLocation:withEffectStack:](CFXActionLogging, "actionLogAsJSONForEvent:atLocation:withEffectStack:", CFSTR("started effects in stream"), CFSTR("live"), v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v146.a) = 138543362;
        *(_QWORD *)((char *)&v146.a + 4) = v89;
        _os_log_impl(&dword_2269A9000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v146, 0xCu);

      }
      v90 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_68);

    }
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setMostRecentARMetadata:", 0);

    objc_msgSend(*(id *)(v1 + 40), "setExternalCaptureSessionCameraPosition:", objc_msgSend(*(id *)(v1 + 32), "cameraPosition"));
  }
  objc_msgSend(*(id *)(v1 + 32), "faceData");
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v92)
  {
    JFXLog_camera();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_1(v93, v94, v95, v96, v97, v98, v99, v100);

  }
  v101 = *(_QWORD *)(v1 + 112);
  v102 = *(_QWORD *)(v1 + 32);
  objc_msgSend(*(id *)(v1 + 40), "captureViewController");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "composition");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXCameraStreamAdapter notifyExternalImageData:orientation:effectComposition:](CFXCameraStreamAdapter, "notifyExternalImageData:orientation:effectComposition:", v102, v101, v104);

}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_65(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLiveCapturePresentationFrame:withContentRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_66(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v1 = objc_msgSend(*(id *)(a1 + 32), "cameraPosition");
  if (v1 == 2)
  {
    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopTrackingTimeIntervalEventWithName:", CFSTR("activeexternalcameratime"));

    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopTrackingTimeIntervalEventWithName:", CFSTR("activebackcameratime"));

    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTrackingTimeIntervalEventWithName:", CFSTR("activefrontcameratime"));

  }
  else if (v1 != 1)
  {
    if (v1)
      return;
    goto LABEL_7;
  }
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopTrackingTimeIntervalEventWithName:", CFSTR("activeexternalcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopTrackingTimeIntervalEventWithName:", CFSTR("activefrontcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTrackingTimeIntervalEventWithName:", CFSTR("activebackcameratime"));

LABEL_7:
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopTrackingTimeIntervalEventWithName:", CFSTR("activebackcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopTrackingTimeIntervalEventWithName:", CFSTR("activefrontcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTrackingTimeIntervalEventWithName:", CFSTR("activeexternalcameratime"));

}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_67()
{
  id v0;

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "startTrackingTimeIntervalEventWithName:", CFSTR("activetime"));

}

- (void)startCaptureSession
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  char v15;
  char v16;

  if (!-[CFXCameraViewController usesInternalCaptureSession](self, "usesInternalCaptureSession"))
  {
    v10 = (void *)MEMORY[0x24BDBCE88];
    v11 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called on %@ not configured to run internally; see usesInternalCaptureSession"),
      "-[CFXCameraViewController startCaptureSession]",
      self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v13));
  }
  -[CFXCameraViewController setCapturingFunCamMedia:](self, "setCapturingFunCamMedia:", 0);
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cameraSessionRunning");

  -[CFXCameraViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__CFXCameraViewController_startCaptureSession__block_invoke;
  v14[3] = &unk_24EE57E18;
  v15 = v4;
  v14[4] = self;
  v16 = v6 & 1;
  v7 = MEMORY[0x2276A1F6C](v14);
  v8 = (void *)v7;
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startCameraSession:", v8);

  }
}

void __46__CFXCameraViewController_startCaptureSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "captureMode") == 2)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "initialFlashMode") == 2)
        v3 = 2;
      else
        v3 = objc_msgSend(*(id *)(a1 + 32), "initialFlashMode") == 1;
      +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCaptureTorchMode:completion:", v3, 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "captureViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraDidStart");

  }
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraViewControllerDidStartCaptureSession:", *(_QWORD *)(a1 + 32));

  }
}

- (void)stopCaptureSession
{
  void *v3;
  _QWORD v4[5];

  if (-[CFXCameraViewController usesInternalCaptureSession](self, "usesInternalCaptureSession"))
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __45__CFXCameraViewController_stopCaptureSession__block_invoke;
    v4[3] = &unk_24EE57B60;
    v4[4] = self;
    objc_msgSend(v3, "stopCameraSession:", v4);

  }
}

void __45__CFXCameraViewController_stopCaptureSession__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__CFXCameraViewController_stopCaptureSession__block_invoke_2;
    block[3] = &unk_24EE57B60;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __45__CFXCameraViewController_stopCaptureSession__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "capturingFunCamMedia") & 1) == 0)
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "prepareCameraForMode:position:completion:", 0, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "JFX_exitAnalytics");
    objc_msgSend(*(id *)(a1 + 32), "setIsEffectsAnalyticsRunning:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cameraDidStop");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cameraViewControllerDidStopCaptureSession:", *(_QWORD *)(a1 + 32));

}

- (void)resign
{
  id v2;

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resign");

}

- (void)renderFrameWithImageDataArchive:(id)a3 imagePixelBuffer:(__CVBuffer *)a4 depthPixelBuffer:(__CVBuffer *)a5 orientation:(int64_t)a6 presentationRect:(CGRect)a7 contentsRect:(CGRect)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  CFXCameraViewController *v27;
  __CVBuffer *v28;
  __CVBuffer *v29;
  int64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v12 = a7.size.height;
  v13 = a7.size.width;
  v14 = a7.origin.y;
  v15 = a7.origin.x;
  v20 = a3;
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "livePlayerIsSaturated");

  if (v22)
  {
    -[CFXCameraViewController captureViewController](self, "captureViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "willDropCameraFrame");

    kdebug_trace();
  }
  else
  {
    CVPixelBufferRetain(a4);
    CVPixelBufferRetain(a5);
    -[CFXCameraViewController externalCaptureSessionInputDeserializationQueue](self, "externalCaptureSessionInputDeserializationQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke;
    block[3] = &unk_24EE57E40;
    v28 = a4;
    v29 = a5;
    v26 = v20;
    v27 = self;
    v30 = a6;
    v31 = v15;
    v32 = v14;
    v33 = v13;
    v34 = v12;
    v35 = x;
    v36 = y;
    v37 = width;
    v38 = height;
    dispatch_async(v24, block);

  }
}

void __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke(uint64_t a1)
{
  CMTimeEpoch v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  Float64 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BufferWithTimestamp *v14;
  uint64_t v15;
  BufferWithTimestamp *v16;
  void *v17;
  int v18;
  NSObject *v19;
  __int128 v20;
  CMTime v21;
  CMTime time;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v20 = *MEMORY[0x24BDC0D88];
  *(_OWORD *)&time.value = *MEMORY[0x24BDC0D88];
  v2 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  time.epoch = v2;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v6, *(_QWORD *)(a1 + 32), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "timestamp");
    CMTimeMakeWithSeconds(&v21, v8, 1000000000);
    time = v21;
    CMTimeGetSeconds(&time);
    kdebug_trace();
    objc_msgSend(v7, "setPixelBuffer:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v7, "depthData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 56);

      if (v10)
      {
        objc_msgSend(v7, "depthData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "depthDataByReplacingDepthDataMapWithPixelBuffer:error:", *(_QWORD *)(a1 + 56), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDepthData:", v12);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "metadataValidator", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "validateARImageData:", v7);

    v14 = [BufferWithTimestamp alloc];
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v7, "timestamp");
    v16 = -[BufferWithTimestamp initWithBuffer:timstamp:](v14, "initWithBuffer:timstamp:", v15);
    objc_msgSend(*(id *)(a1 + 40), "outputBufferQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "enqueue:", v16);

    if (v18)
    {
      CVPixelBufferRetain(*(CVPixelBufferRef *)(a1 + 48));
    }
    else
    {
      JFXLog_camera();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke_cold_1();

    }
    objc_msgSend(*(id *)(a1 + 40), "renderFrameWithImageData:orientation:presentationRect:contentsRect:", v7, *(_QWORD *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));

  }
  else
  {
    *(_OWORD *)&time.value = v20;
    time.epoch = v2;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));

}

- (void)effectBrowserViewController:(id)a3 didDropOverlayEffect:(id)a4 atScreenLocation:(CGPoint)a5 atScreenSize:(CGSize)a6 rotationAngle:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v13 = a4;
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:", v13, x, y, width, height, a7);

}

- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "startTrackingPickerWithIdentifier:", v7);
  }
  else
  {
    -[CFXCameraViewController effectBrowserPresentedAppIdentifier](self, "effectBrowserPresentedAppIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopTrackingPickerWithIdentifier:", v10);

  }
  -[CFXCameraViewController setEffectBrowserPresentedAppIdentifier:](self, "setEffectBrowserPresentedAppIdentifier:", v7);
  if ((objc_msgSend(v7, "isEqual:", CFSTR("com.apple.FunCamera.Filters")) & 1) == 0)
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSessionRequiresFaceTracking:", v7 != 0);

  }
  v12 = -[CFXCameraViewController effectsState](self, "effectsState");
  JFXLog_pickerUI();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = v12;
    _os_log_impl(&dword_2269A9000, v13, OS_LOG_TYPE_DEFAULT, "The effect browser has changed - effectsState: %ld", (uint8_t *)&v17, 0xCu);
  }

  -[CFXCameraViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[CFXCameraViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cameraViewController:didChangeEffectsState:", self, v12);

  }
}

- (void)effectBrowserViewController:(id)a3 didRemoveAllEffectsOfType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllEffectsOfType:animated:", v5, 1);

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("Animoji"));
  if ((_DWORD)v5)
  {
    +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didSelectEffectOfType:effectIsNone:", CFSTR("Animoji"), 1);

  }
}

- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  id v12;

  v5 = a4;
  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEffect:", v5);

  objc_msgSend(v5, "jtEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  v9 = CFSTR("Filter");
  if (v8 != 1)
    v9 = 0;
  v10 = v9;
  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isNone");

  objc_msgSend(v12, "didSelectEffectOfType:effectIsNone:", v10, v11);
}

- (id)selectedFilterIdentifierForEffectBrowserViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CFXCameraViewController captureViewController](self, "captureViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jtEffectsForType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CFXCameraViewController captureViewController](self, "captureViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jtEffectsForType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[CFXCameraViewController devicePosition](self, "devicePosition", a3);
  if (v3)
  {
    if (v3 != 1)
    {
      v7 = 0;
      return v7;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("HIDE_MEMOJI_BACK_CAMERA_PROMPT_DISPLAY Name");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("HIDE_MEMOJI_EXTERNAL_CAMERA_PROMPT_DISPLAY Name");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24EE5C428, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4
{
  _BOOL8 v6;
  void *v7;
  double v8;
  id v9;

  v6 = a4 > 50.0;
  -[CFXCameraViewController captureViewController](self, "captureViewController", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4 + -44.0;
  objc_msgSend(v7, "updateUIForDockMagnify:dockHeightDelta:", v6, v8);

  -[CFXCameraViewController cameraControlsViewController](self, "cameraControlsViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateUIForDockMagnify:dockHeightDelta:", v6, v8);

}

- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 1 && -[CFXCameraViewController captureMode](self, "captureMode") != 1;

  return v5;
}

- (BOOL)shouldRotateCellsForDeviceOrientation
{
  return -[CFXCameraViewController captureMode](self, "captureMode") == 1;
}

- (BOOL)allowLandscapeForEffectBrowserViewController:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
    v5 = 0;
  else
    v5 = -[CFXCameraViewController captureMode](self, "captureMode") != 1;

  return v5;
}

- (void)effectBrowserViewController:(id)a3 filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, CGSize, __n128))a5 + 2))(a5, 0, 0, a4, *(__n128 *)&a4.height);
}

- (double)effectBrowserViewController:(id)a3 screenTopBarHeightForWindowBounds:(CGRect)a4 orientation:(int64_t)a5
{
  CGRect v6;

  objc_msgSend(MEMORY[0x24BE72D80], "cameraTopBarFrameForReferenceBounds:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return CGRectGetHeight(v6);
}

- (void)captureViewController:(id)a3 didCaptureMediaItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[5];

  v5 = a4;
  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideBrowserAnimated:completion:", 0, 0);

  if (!v5)
  {
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __69__CFXCameraViewController_captureViewController_didCaptureMediaItem___block_invoke;
    v10[3] = &unk_24EE57B60;
    v10[4] = self;
    objc_msgSend(v9, "stopCameraSession:", v10);
    goto LABEL_5;
  }
  -[CFXCameraViewController setCapturingFunCamMedia:](self, "setCapturingFunCamMedia:", 1);
  -[CFXCameraViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CFXCameraViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cameraViewController:didCaptureMediaItem:", self, v5);
LABEL_5:

  }
}

uint64_t __69__CFXCameraViewController_captureViewController_didCaptureMediaItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startCaptureSession");
}

- (void)captureViewController:(id)a3 didChangeEffectComposition:(id)a4
{
  int64_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = -[CFXCameraViewController effectsState](self, "effectsState", a3, a4);
  JFXLog_effects();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v5;
    _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "The effect composition has changed - effectsState: %ld", (uint8_t *)&v10, 0xCu);
  }

  -[CFXCameraViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CFXCameraViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cameraViewController:didChangeEffectsState:", self, v5);

  }
}

- (void)captureViewController:(id)a3 didRenderFrame:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[CFXCameraViewController externalCaptureSessionOutputProcessingQueue](self, "externalCaptureSessionOutputProcessingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke;
  v8[3] = &unk_24EE57AA8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  double Seconds;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CVBuffer *v22;
  CFXFrame *v23;
  void *v24;
  NSObject *v25;
  CFXFrame *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  CMTime v34[2];
  CMTime v35;
  CMTime v36;
  __int128 v37;
  uint64_t v38;
  _QWORD v39[3];
  __int128 v40;
  uint64_t v41;
  _QWORD v42[3];
  CMTime time;
  CMTime v44;
  uint8_t v45[4];
  _DWORD v46[7];

  *(_QWORD *)&v46[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    goto LABEL_29;
  v4 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "timestamp");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(*(id *)(a1 + 32), "outputBufferQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "outputBufferQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
LABEL_13:

    }
    else
    {
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 32), "outputBufferQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "headBufferTimestamp");
        v11 = vabdd_f64(Seconds, v10);

        if (v11 <= 0.0001)
          break;
        objc_msgSend(*(id *)(a1 + 32), "outputBufferQueue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dequeue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cameraViewController:didDropFrame:", *(_QWORD *)(a1 + 32), objc_msgSend(v13, "pixelBuffer"));

        }
        CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v13, "pixelBuffer"));
        JFXLog_camera();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_2(v45, v13, v46, v17);

        objc_msgSend(*(id *)(a1 + 32), "outputBufferQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v8, "count") <= 1)
          goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "outputBufferQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dequeue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "pixelBuffer");

    objc_msgSend(*(id *)(a1 + 32), "externalCaptureSessionRotationSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (__CVBuffer *)objc_msgSend(v21, "createRotatedPixelBuffer:using:", objc_msgSend(*(id *)(a1 + 40), "pixelBuffer"), v20);

    v23 = [CFXFrame alloc];
    v24 = *(void **)(a1 + 40);
    if (v24)
      objc_msgSend(v24, "timestamp");
    else
      memset(v42, 0, sizeof(v42));
    v26 = -[CFXFrame initWithPixelBuffer:timestamp:](v23, "initWithPixelBuffer:timestamp:", v22, v42);
    CVPixelBufferRelease(v22);
    v28 = *(void **)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    if (v27)
    {
      objc_msgSend(v27, "timestamp");
      if (v28)
      {
LABEL_22:
        objc_msgSend(v28, "noteOutputFrameWithTimestamp:", v39);
LABEL_25:
        v37 = v40;
        v38 = v41;
        -[CFXFrame setLatency:](v26, "setLatency:", &v37);
        if (v26)
        {
          -[CFXFrame timestamp](v26, "timestamp");
          -[CFXFrame latency](v26, "latency");
        }
        else
        {
          memset(&v36, 0, sizeof(v36));
          memset(&v35, 0, sizeof(v35));
        }
        JFXAutomationLogFrameMetrics(CFSTR("jfx_rendered"), &v36, &v35);
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "cameraViewController:didRenderFrame:", *(_QWORD *)(a1 + 32), v26);

LABEL_29:
        objc_msgSend(*(id *)(a1 + 32), "captureViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "composition");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEmpty");

        v33 = *(void **)(a1 + 40);
        if (v32)
        {
          if (v33)
            objc_msgSend(v33, "timestamp");
          else
            memset(&v34[1], 0, sizeof(CMTime));
          v44 = v34[1];
          CMTimeGetSeconds(&v44);
        }
        else
        {
          if (v33)
            objc_msgSend(v33, "timestamp");
          else
            memset(v34, 0, 24);
          v44 = v34[0];
          CMTimeGetSeconds(&v44);
        }
        kdebug_trace();
        return;
      }
    }
    else
    {
      memset(v39, 0, sizeof(v39));
      if (v28)
        goto LABEL_22;
    }
    v40 = 0uLL;
    v41 = 0;
    goto LABEL_25;
  }
  JFXLog_camera();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_1();

}

- (void)captureViewControllerDoneButtonWasTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CFXCameraViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CFXCameraViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXCameraViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cameraViewControllerDoneButtonWasTapped:", self);

    }
  }
}

- (void)captureViewControllerEffectsButtonWasTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CFXCameraViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CFXCameraViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CFXCameraViewController delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cameraViewControllerEffectsButtonWasTapped:", self);

    }
  }
}

- (void)captureViewControllerPresentationRectWasDoubleTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CFXCameraViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CFXCameraViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraViewControllerPresentationRectWasDoubleTapped:", self);

  }
}

- (void)captureViewController:(id)a3 presentationRectWasPinchedWithState:(int64_t)a4 scale:(double)a5 velocity:(double)a6
{
  void *v10;
  char v11;
  id v12;

  -[CFXCameraViewController delegate](self, "delegate", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CFXCameraViewController delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cameraViewController:presentationRectWasPinchedWithState:scale:velocity:", self, a4, a5, a6);

  }
}

- (void)captureViewControllerDidStartVideoRecording:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideBrowserAnimated:completion:", 1, 0);

  }
  -[CFXCameraViewController updateUIForVideoRecording:](self, "updateUIForVideoRecording:", 1);
}

- (void)captureViewControllerDidStopVideoRecording:(id)a3
{
  -[CFXCameraViewController updateUIForVideoRecording:](self, "updateUIForVideoRecording:", 0);
}

- (void)captureViewControllerCameraFlipButtonWasTapped:(id)a3
{
  id v3;

  -[CFXCameraViewController effectBrowserViewController](self, "effectBrowserViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshEffectBrowserForCameraFlip");

}

- (void)captureViewController:(id)a3 switchedToCameraPosition:(int64_t)a4
{
  -[CFXCameraViewController setCameraPosition:](self, "setCameraPosition:", a4);
}

- (void)remoteCommandServer:(id)a3 didReceiveAddShapeCommandWithIdentifier:(id)a4
{
  -[CFXCameraViewController CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:](self, "CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:", CFSTR("Shapes"), a4, 0);
}

- (void)remoteCommandServer:(id)a3 didReceiveAddStickerCommandWithIdentifier:(id)a4 offset:(CGPoint)a5 scale:(double)a6 rotation:(double)a7
{
  double y;
  double x;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  int v27;
  CFXCameraViewController *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  _BYTE v41[128];
  uint64_t v42;
  CGPoint v43;

  y = a5.y;
  x = a5.x;
  v42 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("EmojiStickers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
  v16 = v14;
  if (v15)
  {
    if (v14)
    {
LABEL_3:
      +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", v16, v13);
      v17 = objc_claimAutoreleasedReturnValue();
      JFXLog_automation();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject localizedTitle](v17, "localizedTitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v43.x = x;
        v43.y = y;
        NSStringFromCGPoint(v43);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v34 = v19;
        v35 = 2114;
        v36 = v20;
        v37 = 2048;
        v38 = a6;
        v39 = 2048;
        v40 = a7;
        _os_log_impl(&dword_2269A9000, v18, OS_LOG_TYPE_DEFAULT, "Adding Emoji Sticker effect - name: %{public}@, offset: %{public}@, scale: %f, rotation: %f", buf, 0x2Au);

      }
      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addOverlayEffect:atNormalizedPlanePoint:scale:rotationAngle:", v17, x, y, a6, a7);

      goto LABEL_20;
    }
  }
  else
  {

    objc_msgSend(v13, "effects");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v16)
    {
      v28 = self;
      v23 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v22);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v25, "localizedTitle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", v14);

          if (v27)
          {
            objc_msgSend(v25, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        v16 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v16)
          continue;
        break;
      }
LABEL_16:
      self = v28;
    }

    if (v16)
      goto LABEL_3;
  }
  JFXLog_automation();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[CFXCameraViewController remoteCommandServer:didReceiveAddStickerCommandWithIdentifier:offset:scale:rotation:].cold.1();
LABEL_20:

}

- (void)remoteCommandServer:(id)a3 didReceiveAddStickerCommandWithData:(id)a4 offset:(CGPoint)a5 scale:(double)a6 rotation:(double)a7
{
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CFXCameraViewController *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
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
  _QWORD v46[3];
  CGPoint v47;

  y = a5.y;
  x = a5.x;
  v46[1] = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("CommanderAvatar_%@.png"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "writeToURL:atomically:", v20, 0))
    {
      v45 = *MEMORY[0x24BE79650];
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v22 = objc_claimAutoreleasedReturnValue();

      +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "createEffectForType:fromID:withProperties:", 2, *MEMORY[0x24BE79468], v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      JFXLog_automation();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v25, "jtEffect");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromJFXEffectType(objc_msgSend(v31, "type"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedTitle");
        v32 = self;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v47.x = x;
        v47.y = y;
        NSStringFromCGPoint(v47);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v34 = v27;
        v35 = 2114;
        v36 = v28;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v29;
        v41 = 2048;
        v42 = a6;
        v43 = 2048;
        v44 = a7;
        _os_log_impl(&dword_2269A9000, v26, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, url: %{public}@, offset: %{public}@, scale: %f, rotation: %f", buf, 0x3Eu);

        self = v32;
      }

      -[CFXCameraViewController captureViewController](self, "captureViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addOverlayEffect:atNormalizedPlanePoint:scale:rotationAngle:", v25, x, y, a6, a7);

    }
    else
    {
      JFXLog_automation();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CFXCameraViewController remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:].cold.2();
    }

  }
  else
  {
    JFXLog_automation();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CFXCameraViewController remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:].cold.1(v16);
  }

}

- (void)remoteCommandServer:(id)a3 didReceiveAddTextCommandWithIdentifier:(id)a4 string:(id)a5
{
  -[CFXCameraViewController CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:](self, "CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:", CFSTR("Text"), a4, a5);
}

- (void)remoteCommandServer:(id)a3 didReceiveRemoveEffectsCommandWithTypeIdentifiers:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  JFXLog_automation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_2269A9000, v6, OS_LOG_TYPE_DEFAULT, "Removing effects - types: %{public}@", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXCameraViewController captureViewController](self, "captureViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeAllEffectsOfType:animated:", v12, 1);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)remoteCommandServer:(id)a3 didReceiveSetAnimojiCommandWithIdentifier:(id)a4
{
  -[CFXCameraViewController CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:](self, "CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:", CFSTR("Animoji"), a4, 0);
}

- (void)remoteCommandServer:(id)a3 didReceiveSetMemojiCommandWithContentsOfFile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[JFXAnimojiEffect createMemojiEffectWithContentsOfFile:identifier:](JFXAnimojiEffect, "createMemojiEffectWithContentsOfFile:identifier:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  JFXLog_automation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_2269A9000, v10, OS_LOG_TYPE_DEFAULT, "Adding Memoji at path: %{public}@, identifier: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEffect:allowImmediateTextEditing:", v9, 1);

}

- (void)remoteCommandServer:(id)a3 didReceiveSetFilterCommandWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  CFXCameraViewController *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Filter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
  v9 = v7;
  if (v8)
  {
    if (v7)
    {
LABEL_3:
      -[CFXCameraViewController CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:](self, "CFX_automationAddEffectWithEffectTypeIdentifier:identifier:string:", CFSTR("Filter"), v9, 0);
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(v6, "effects");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v9 = v7;
    if (v11)
    {
      v12 = v11;
      v19 = self;
      v20 = v6;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "localizedTitle", v19, v20, (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

          if (v17)
          {
            objc_msgSend(v15, "identifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
      v9 = v7;
LABEL_14:
      self = v19;
      v6 = v20;
    }

    if (v9)
      goto LABEL_3;
  }
  JFXLog_automation();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[CFXCameraViewController remoteCommandServer:didReceiveSetFilterCommandWithIdentifier:].cold.1();

LABEL_19:
}

- (void)CFX_automationAddEffectWithEffectTypeIdentifier:(id)a3 identifier:(id)a4 string:(id)a5
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  CFXCameraViewController *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CFXEffect effectWithIdentifier:forEffectType:](CFXEffect, "effectWithIdentifier:forEffectType:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (CFSTR("Text") == v8)
  {
    objc_msgSend(v12, "jtEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[JFXEffectEditingUtilities updateEffectText:newText:](JFXEffectEditingUtilities, "updateEffectText:newText:", v14, v10);
  }
  else
  {
    if (CFSTR("Animoji") != v8)
      goto LABEL_6;
    +[JFXAnimojiEffect createAnimojiEffectForID:](JFXAnimojiEffect, "createAnimojiEffectForID:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CFXEffect effectWithJTEffect:](CFXEffect, "effectWithJTEffect:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }

LABEL_6:
  JFXLog_automation();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "jtEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromJFXEffectType(objc_msgSend(v17, "type"));
    v23 = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedTitle");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    *(_DWORD *)buf = 138544130;
    v21 = &stru_24EE5C428;
    v25 = v18;
    if (v10)
      v21 = v10;
    v26 = 2114;
    v27 = v19;
    v28 = 2114;
    v29 = v9;
    v30 = 2114;
    v31 = v21;
    _os_log_impl(&dword_2269A9000, v16, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, identifier: %{public}@, string: %{public}@", buf, 0x2Au);

    self = v23;
  }

  -[CFXCameraViewController captureViewController](self, "captureViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addEffect:allowImmediateTextEditing:", v13, CFSTR("Text") != v8);

}

- (void)stageManagerWarningDoneButtonWasTapped:(id)a3
{
  void *v4;
  id v5;

  -[CFXCameraViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CFXCameraViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraViewControllerDoneButtonWasTapped:", self);

  }
}

- (void)JFX_exitAnalytics
{
  void *v2;
  void *v3;
  id v4;

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopTrackingTimeIntervalEventWithName:", CFSTR("activefrontcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopTrackingTimeIntervalEventWithName:", CFSTR("activebackcameratime"));

  +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopTrackingTimeIntervalEventWithName:", CFSTR("activetime"));

}

- (void)noteInputFrameWithTimestamp:(double)a3
{
  void *v4;
  void *v5;
  OpaqueCMClock *HostTimeClock;
  void *v7;
  void *v8;
  CMTime v9;
  CMTime v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v10, 0, sizeof(v10));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v10, HostTimeClock);
  v9 = v10;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXCameraViewController externalCaptureSessionInputFrameTimestamps](self, "externalCaptureSessionInputFrameTimestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v5);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)noteOutputFrameWithTimestamp:(SEL)a3
{
  OpaqueCMClock *HostTimeClock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v15;
  CMTime lhs;
  CMTime time;
  CMTime v18;

  memset(&v18, 0, sizeof(v18));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v18, HostTimeClock);
  time = *(CMTime *)a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&time, 0, sizeof(time));
  -[CFXCameraViewController externalCaptureSessionInputFrameTimestamps](self, "externalCaptureSessionInputFrameTimestamps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "CMTimeValue");
  else
    memset(&time, 0, sizeof(time));

  -[CFXCameraViewController externalCaptureSessionInputFrameTimestamps](self, "externalCaptureSessionInputFrameTimestamps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v9);

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  lhs = v18;
  v15 = time;
  CMTimeSubtract((CMTime *)retstr, &lhs, &v15);

  return result;
}

- (void)updateUIForVideoRecording:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__CFXCameraViewController_updateUIForVideoRecording___block_invoke;
  v3[3] = &unk_24EE57C98;
  v3[4] = self;
  v4 = a3;
  +[JTAnimation performAnimation:duration:completion:](JTAnimation, "performAnimation:duration:completion:", v3, 0, 0.25);
}

void __53__CFXCameraViewController_updateUIForVideoRecording___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "captureViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUIForVideoRecording:", *(unsigned __int8 *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "cameraControlsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateUIForVideoRecording:", *(unsigned __int8 *)(a1 + 40));

  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "effectBrowserViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (CFXCameraViewControllerDelegate)delegate
{
  return (CFXCameraViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showsViewfinder
{
  return self->_showsViewfinder;
}

- (BOOL)usesInternalCaptureSession
{
  return self->_usesInternalCaptureSession;
}

- (NSString)animojiOnlyEffectID
{
  return self->_animojiOnlyEffectID;
}

- (CFXCaptureViewController)captureViewController
{
  return self->_captureViewController;
}

- (void)setCaptureViewController:(id)a3
{
  objc_storeStrong((id *)&self->_captureViewController, a3);
}

- (CFXEffectBrowserViewController)effectBrowserViewController
{
  return self->_effectBrowserViewController;
}

- (void)setEffectBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserViewController, a3);
}

- (CFXCameraControlsViewController)cameraControlsViewController
{
  return self->_cameraControlsViewController;
}

- (void)setCameraControlsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraControlsViewController, a3);
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (int64_t)initialFlashMode
{
  return self->_initialFlashMode;
}

- (void)setInitialFlashMode:(int64_t)a3
{
  self->_initialFlashMode = a3;
}

- (BOOL)cameraControlsShown
{
  return self->_cameraControlsShown;
}

- (void)setCameraControlsShown:(BOOL)a3
{
  self->_cameraControlsShown = a3;
}

- (BOOL)capturingFunCamMedia
{
  return self->_capturingFunCamMedia;
}

- (void)setCapturingFunCamMedia:(BOOL)a3
{
  self->_capturingFunCamMedia = a3;
}

- (NSString)effectBrowserPresentedAppIdentifier
{
  return self->_effectBrowserPresentedAppIdentifier;
}

- (void)setEffectBrowserPresentedAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_effectBrowserPresentedAppIdentifier, a3);
}

- (JFXRemoteCommandServer)remoteCommandServer
{
  return self->_remoteCommandServer;
}

- (void)setRemoteCommandServer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCommandServer, a3);
}

- (UIView)effectsPickerSnapshotContainerView
{
  return self->_effectsPickerSnapshotContainerView;
}

- (void)setEffectsPickerSnapshotContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_effectsPickerSnapshotContainerView, a3);
}

- (OS_dispatch_queue)externalCaptureSessionInputDeserializationQueue
{
  return self->_externalCaptureSessionInputDeserializationQueue;
}

- (OS_dispatch_queue)externalCaptureSessionInputProcessingQueue
{
  return self->_externalCaptureSessionInputProcessingQueue;
}

- (OS_dispatch_queue)externalCaptureSessionOutputProcessingQueue
{
  return self->_externalCaptureSessionOutputProcessingQueue;
}

- (JFXPixelRotationSession)externalCaptureSessionRotationSession
{
  return self->_externalCaptureSessionRotationSession;
}

- (void)setExternalCaptureSessionRotationSession:(id)a3
{
  objc_storeStrong((id *)&self->_externalCaptureSessionRotationSession, a3);
}

- (int64_t)lastDeviceOrientation
{
  return self->_lastDeviceOrientation;
}

- (void)setLastDeviceOrientation:(int64_t)a3
{
  self->_lastDeviceOrientation = a3;
}

- (int64_t)externalCaptureSessionCameraPosition
{
  return self->_externalCaptureSessionCameraPosition;
}

- (BOOL)externalCaptureSessionCameraPositionSet
{
  return self->_externalCaptureSessionCameraPositionSet;
}

- (void)setExternalCaptureSessionCameraPositionSet:(BOOL)a3
{
  self->_externalCaptureSessionCameraPositionSet = a3;
}

- (JFXThreadSafeDictionary)externalCaptureSessionInputFrameTimestamps
{
  return self->_externalCaptureSessionInputFrameTimestamps;
}

- (void)setExternalCaptureSessionInputFrameTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_externalCaptureSessionInputFrameTimestamps, a3);
}

- (CGRect)externalPresentationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_externalPresentationRect.origin.x;
  y = self->_externalPresentationRect.origin.y;
  width = self->_externalPresentationRect.size.width;
  height = self->_externalPresentationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExternalPresentationRect:(CGRect)a3
{
  self->_externalPresentationRect = a3;
}

- (CGRect)externalContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_externalContentRect.origin.x;
  y = self->_externalContentRect.origin.y;
  width = self->_externalContentRect.size.width;
  height = self->_externalContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExternalContentRect:(CGRect)a3
{
  self->_externalContentRect = a3;
}

- (NSTimer)effectsInStreamTimer
{
  return self->_effectsInStreamTimer;
}

- (void)setEffectsInStreamTimer:(id)a3
{
  objc_storeStrong((id *)&self->_effectsInStreamTimer, a3);
}

- (CFXThermalPolicyManager)thermalPolicyManager
{
  return self->_thermalPolicyManager;
}

- (void)setThermalPolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_thermalPolicyManager, a3);
}

- (JFXMetadataValidator)metadataValidator
{
  return self->_metadataValidator;
}

- (void)setMetadataValidator:(id)a3
{
  objc_storeStrong((id *)&self->_metadataValidator, a3);
}

- (CFXCameraStreamBufferQueue)outputBufferQueue
{
  return self->_outputBufferQueue;
}

- (void)setOutputBufferQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputBufferQueue, a3);
}

- (CFXStageManagerWarningViewController)stageManagerWarning
{
  return self->_stageManagerWarning;
}

- (void)setStageManagerWarning:(id)a3
{
  objc_storeStrong((id *)&self->_stageManagerWarning, a3);
}

- (BOOL)isEffectsAnalyticsRunning
{
  return self->_isEffectsAnalyticsRunning;
}

- (void)setIsEffectsAnalyticsRunning:(BOOL)a3
{
  self->_isEffectsAnalyticsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageManagerWarning, 0);
  objc_storeStrong((id *)&self->_outputBufferQueue, 0);
  objc_storeStrong((id *)&self->_metadataValidator, 0);
  objc_storeStrong((id *)&self->_thermalPolicyManager, 0);
  objc_storeStrong((id *)&self->_effectsInStreamTimer, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionInputFrameTimestamps, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionRotationSession, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionOutputProcessingQueue, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionInputProcessingQueue, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionInputDeserializationQueue, 0);
  objc_storeStrong((id *)&self->_effectsPickerSnapshotContainerView, 0);
  objc_storeStrong((id *)&self->_remoteCommandServer, 0);
  objc_storeStrong((id *)&self->_effectBrowserPresentedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraControlsViewController, 0);
  objc_storeStrong((id *)&self->_effectBrowserViewController, 0);
  objc_storeStrong((id *)&self->_captureViewController, 0);
  objc_storeStrong((id *)&self->_animojiOnlyEffectID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAnimojiOnlyEffectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, v0, v1, "Invalid effect id %@, must be an Animoji efffect!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setAnimojiOnlyEffectID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Trying to set animoji effect externally in non-animoji-only mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setTransitionState:(os_log_t)log animated:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a2;
  v5 = 1024;
  v6 = a1 & 1;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "transitionState: %ld, animated: %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "invalid contents rect, falling back to 0 0 1 1", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "invalid presentation rect, falling back to main screen bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_61_cold_4(uint64_t a1, NSObject *a2, CGFloat a3, CGFloat a4)
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  CGSize v18;

  v17 = *MEMORY[0x24BDAC8D0];
  NSStringFromCGRect(*(CGRect *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(*(CGRect *)(a1 + 80));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.width = a3;
  v18.height = a4;
  NSStringFromCGSize(v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v8;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "renderFrameWithImageData presentationRect  %@ contentRect %@ renderSize %@", (uint8_t *)&v11, 0x20u);

}

void __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Failed to enqueue output buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Out of order frame arrived", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  uint64_t v7;

  objc_msgSend(a2, "timestamp");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_2269A9000, a4, OS_LOG_TYPE_ERROR, "Frame dropped, timestamp: %f", a1, 0xCu);
}

- (void)remoteCommandServer:didReceiveAddStickerCommandWithIdentifier:offset:scale:rotation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, v0, v1, "Adding Emoji Sticker failed - identifier: %{public}@, reason: The sticker asset does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)remoteCommandServer:(NSObject *)a1 didReceiveAddStickerCommandWithData:offset:scale:rotation:.cold.1(NSObject *a1)
{
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSStringFromJFXEffectType(2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_2269A9000, a1, OS_LOG_TYPE_ERROR, "Adding effect failed - type: %{public}@, reason: No sticker data", v3, 0xCu);

}

- (void)remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2269A9000, v0, v1, "Saving sticker image failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)remoteCommandServer:didReceiveSetFilterCommandWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2269A9000, v0, v1, "Set Filter failed - identifier: %{public}@, reason: The Filter does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
