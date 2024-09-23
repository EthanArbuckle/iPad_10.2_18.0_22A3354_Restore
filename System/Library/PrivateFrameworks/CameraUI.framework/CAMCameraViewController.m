@implementation CAMCameraViewController

- (void)_commonCAMCameraViewControllerInitializationWithOverrides:(id)a3 usingEmulationMode:(int64_t)a4 initialLayoutStyle:(int64_t)a5 privateOptions:(int64_t)a6
{
  id v10;
  CAMCallStatusMonitor *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CAMMotionController *v15;
  CAMLocationController *v16;
  CAMPowerController *v17;
  CAMProtectionController *v18;
  CAMBurstController *v19;
  CAMPersistenceController *v20;
  CAMLocationController *v21;
  double v22;
  CUCaptureController *v23;
  void *v24;
  CUCaptureController *v25;
  CAMStorageController *v26;
  CAMTimelapseController *v27;
  BOOL v28;
  CAMViewfinderViewController *v29;
  CAMViewfinderViewController *viewfinderViewController;
  CUCaptureController *captureController;
  CUCaptureController *v32;
  CAMTimelapseController *timelapseController;
  CAMTimelapseController *v34;
  CAMPersistenceController *persistenceController;
  CAMPersistenceController *v36;
  CAMMotionController *motionController;
  CAMLocationController *locationController;
  CAMPowerController *powerController;
  CAMBurstController *burstController;
  CAMKeepAliveController *keepAliveController;
  CAMKeepAliveController *v42;
  CAMProtectionController *protectionController;
  CAMProtectionController *v44;
  CAMNebulaDaemonProxyManager *nebulaDaemonProxyManager;
  CAMNebulaDaemonProxyManager *v46;
  NSObject *v47;
  OS_dispatch_queue *v48;
  OS_dispatch_queue *resultProcessingQueue;
  NSObject *v50;
  CAMProtectionController *v51;
  CAMViewfinderViewController *v52;
  CAMBurstController *v53;
  CAMBurstController *v54;
  CAMKeepAliveController *v55;
  CAMStorageController *v56;
  void *v57;
  unint64_t v58;
  CAMPowerController *v59;
  CAMProtectionController *v60;
  int64_t v61;
  CAMLocationController *v62;
  int64_t v63;
  CAMMotionController *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  CAMNebulaDaemonProxyManager *v69;
  void *v70;
  CAMCallStatusMonitor *v71;
  _QWORD block[6];

  v10 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = a5;
  if (objc_msgSend(v68, "hasSystemTelephonyOfAnyKind"))
    v11 = objc_alloc_init(CAMCallStatusMonitor);
  else
    v11 = 0;
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:", v10, a4, -[CAMCallStatusMonitor isCallActive](v11, "isCallActive"), 0);

  objc_msgSend(v12, "captureConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v11;
  if ((a6 & 2) != 0)
  {
    +[CAMCaptureConfiguration tinyConfigurationForConfiguration:preserveFilters:](CAMCaptureConfiguration, "tinyConfigurationForConfiguration:preserveFilters:", v13, objc_msgSend(v12, "preserveEffectFilter"));
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  v65 = a4 - 1;
  objc_msgSend(v12, "conflictingControlConfiguration");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(CAMMotionController);
  v63 = a4;
  v58 = a6;
  if (a6 & 1 | a4)
    v16 = 0;
  else
    v16 = objc_alloc_init(CAMLocationController);
  v17 = objc_alloc_init(CAMPowerController);
  v18 = objc_alloc_init(CAMProtectionController);
  v55 = objc_alloc_init(CAMKeepAliveController);
  v69 = objc_alloc_init(CAMNebulaDaemonProxyManager);
  v19 = -[CAMBurstController initWithProtectionController:powerController:remoteShutterController:]([CAMBurstController alloc], "initWithProtectionController:powerController:remoteShutterController:", v18, v17, 0);
  v20 = -[CAMPersistenceController initWithLocationController:burstController:protectionController:powerController:irisVideoController:]([CAMPersistenceController alloc], "initWithLocationController:burstController:protectionController:powerController:irisVideoController:", v16, v19, v18, v17, 0);
  -[CAMBurstController setPersistenceController:](v19, "setPersistenceController:", v20);
  +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:outputToExternalStorage:](CAMCaptureConfiguration, "captureGraphConfigurationUsingConfiguration:outputToExternalStorage:", v13, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultZoomFactorForGraphConfiguration:captureOrientation:outputToExternalStorage:", v67, -[CAMMotionController captureOrientation](v15, "captureOrientation"), 0);
  v51 = v18;
  v60 = v18;
  v21 = v16;
  v53 = v19;
  v23 = -[CUCaptureController initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:]([CUCaptureController alloc], "initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:", v13, 0, 1, v16, v15, v19, v22, v51, v17, 0, 0);
  v24 = v13;
  v25 = v23;
  v26 = objc_alloc_init(CAMStorageController);
  v27 = 0;
  v28 = v65 >= 2;
  v66 = v12;
  if (v28)
    v27 = -[CAMTimelapseController initWithCaptureController:locationController:motionController:persistenceController:storageController:librarySelectionController:nebulaDaemonProxyManager:]([CAMTimelapseController alloc], "initWithCaptureController:locationController:motionController:persistenceController:storageController:librarySelectionController:nebulaDaemonProxyManager:", v25, v21, v15, v20, v26, 0, v69);
  v56 = v26;
  v57 = v24;
  v29 = -[CAMViewfinderViewController initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:]([CAMViewfinderViewController alloc], "initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:", v25, v24, v70, v21, v15, v27, 0, 0, v17, 0, 0, v71, v26, v63, v61,
          (v58 >> 2) & 1);
  viewfinderViewController = self->_viewfinderViewController;
  self->_viewfinderViewController = v29;
  v52 = v29;

  captureController = self->_captureController;
  self->_captureController = v25;
  v32 = v25;

  timelapseController = self->_timelapseController;
  self->_timelapseController = v27;
  v34 = v27;

  persistenceController = self->_persistenceController;
  self->_persistenceController = v20;
  v36 = v20;

  motionController = self->_motionController;
  self->_motionController = v15;
  v64 = v15;

  locationController = self->_locationController;
  self->_locationController = v21;
  v62 = v21;

  powerController = self->_powerController;
  self->_powerController = v17;
  v59 = v17;

  burstController = self->_burstController;
  self->_burstController = v53;
  v54 = v53;

  keepAliveController = self->_keepAliveController;
  self->_keepAliveController = v55;
  v42 = v55;

  protectionController = self->_protectionController;
  self->_protectionController = v60;
  v44 = v60;

  nebulaDaemonProxyManager = self->_nebulaDaemonProxyManager;
  self->_nebulaDaemonProxyManager = v69;
  v46 = v69;

  -[CAMTimelapseController restoreConfiguration](v34, "restoreConfiguration");
  -[CUCaptureController registerCaptureService:](v32, "registerCaptureService:", v36);
  -[CAMViewfinderViewController setPersistenceBehavior:](v52, "setPersistenceBehavior:", 1);
  -[CAMViewfinderViewController setReviewButtonSource:](v52, "setReviewButtonSource:", self);
  -[CUCaptureController setResultDelegate:](v32, "setResultDelegate:", self);
  -[CAMPersistenceController setResultDelegate:](v36, "setResultDelegate:", self);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera-ui.camera-view-controller.result-queue", v47);
  resultProcessingQueue = self->__resultProcessingQueue;
  self->__resultProcessingQueue = v48;

  v50 = self->__resultProcessingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __138__CAMCameraViewController__commonCAMCameraViewControllerInitializationWithOverrides_usingEmulationMode_initialLayoutStyle_privateOptions___block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(v50, block);
  -[CAMCameraViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, 568.0);
  self->_automaticallyManagesCameraSession = 1;

}

void __138__CAMCameraViewController__commonCAMCameraViewControllerInitializationWithOverrides_usingEmulationMode_initialLayoutStyle_privateOptions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  CAMThumbnailGenerator *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1096);
  *(_QWORD *)(v3 + 1096) = v2;

  v5 = objc_alloc_init(CAMThumbnailGenerator);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1104);
  *(_QWORD *)(v6 + 1104) = v5;

}

- (CAMCameraViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CAMCameraViewController *v4;
  void *v5;
  uint64_t v6;
  CAMCameraViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMCameraViewController;
  v4 = -[CAMCameraViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cam_initialLayoutStyle");

    -[CAMCameraViewController _commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:](v4, "_commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:", 0, 0, v6, 0);
    v7 = v4;
  }

  return v4;
}

- (CAMCameraViewController)initWithCoder:(id)a3
{
  CAMCameraViewController *v3;
  void *v4;
  uint64_t v5;
  CAMCameraViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMCameraViewController;
  v3 = -[CAMCameraViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    -[CAMCameraViewController _commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:](v3, "_commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:", 0, 0, v5, 0);
    v6 = v3;
  }

  return v3;
}

- (CAMCameraViewController)initWithOverrides:(id)a3 usingEmulationMode:(int64_t)a4
{
  id v6;
  CAMCameraViewController *v7;
  void *v8;
  uint64_t v9;
  CAMCameraViewController *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMCameraViewController;
  v7 = -[CAMCameraViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "cam_initialLayoutStyle");

    -[CAMCameraViewController _commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:](v7, "_commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:", v6, a4, v9, 0);
    v10 = v7;
  }

  return v7;
}

- (CAMCameraViewController)initWithOverrides:(id)a3 initialLayoutStyle:(int64_t)a4 privateOptions:(int64_t)a5
{
  id v8;
  CAMCameraViewController *v9;
  CAMCameraViewController *v10;
  CAMCameraViewController *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMCameraViewController;
  v9 = -[CAMCameraViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    -[CAMCameraViewController _commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:](v9, "_commonCAMCameraViewControllerInitializationWithOverrides:usingEmulationMode:initialLayoutStyle:privateOptions:", v8, 0, a4, a5);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspendCameraSessionWithCompletion:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CAMCameraViewController;
  -[CAMCameraViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CAMCameraViewControllerContainerView *v3;
  void *v4;
  void *v5;
  CAMCameraViewControllerContainerView *v6;

  v3 = [CAMCameraViewControllerContainerView alloc];
  v6 = -[CAMCameraViewControllerContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewControllerContainerView setViewfinderView:](v6, "setViewfinderView:", v5);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[CAMCameraViewController setView:](self, "setView:", v6);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CAMCameraViewController;
  -[CAMCameraViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMCameraViewController;
  -[CAMCameraViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CAMCameraViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarHidden:", 1);

  if (-[CAMCameraViewController automaticallyManagesCameraSession](self, "automaticallyManagesCameraSession"))
    -[CAMCameraViewController resumeCameraSession](self, "resumeCameraSession");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMCameraViewController;
  -[CAMCameraViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[CAMCameraViewController automaticallyManagesCameraSession](self, "automaticallyManagesCameraSession"))
    -[CAMCameraViewController suspendCameraSession](self, "suspendCameraSession");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CAMCameraViewController;
  -[CAMCameraViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)captureMode
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCaptureMode");

  return v3;
}

- (int64_t)captureDevice
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCaptureDevice");

  return v3;
}

- (void)configureForCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4
{
  id v6;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeToMode:device:animated:", a3, a4, 1);

}

- (int64_t)flashMode
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flashMode");

  return v3;
}

- (void)setFlashMode:(int64_t)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlashMode:", a3);

}

- (int64_t)torchMode
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "torchMode");

  return v3;
}

- (void)setTorchMode:(int64_t)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTorchMode:", a3);

}

- (int64_t)hdrMode
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hdrMode");

  return v3;
}

- (void)setHDRMode:(int64_t)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHDRMode:", a3);

}

- (int64_t)timerDuration
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timerDuration");

  return v3;
}

- (void)setTimerDuration:(int64_t)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimerDuration:", a3);

}

- (int64_t)livePhotoMode
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "livePhotoMode");

  return v3;
}

- (void)setLivePhotoMode:(int64_t)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLivePhotoMode:", a3);

}

- (int64_t)photoModeAspectRatioCrop
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "photoModeAspectRatioCrop");

  return v3;
}

- (void)setPhotoModeAspectRatioCrop:(int64_t)a3
{
  id v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotoModeAspectRatioCrop:", a3);

}

- (BOOL)isCapturingPhoto
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCapturingPhoto");

  return v3;
}

- (BOOL)isCapturingLivePhoto
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCapturingLivePhoto");

  return v3;
}

- (BOOL)isRecording
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRecording");

  return v3;
}

- (BOOL)capturePhoto
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "capturePhoto");

  return v3;
}

- (BOOL)startRecording
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startRecording");

  return v3;
}

- (BOOL)stopRecording
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stopRecording");

  return v3;
}

+ (BOOL)isEmulatingImagePicker
{
  return 0;
}

- (void)suspendCameraSession
{
  void *v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  _QWORD aBlock[5];
  id v9;
  id location;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController cameraSessionDelegate](self, "cameraSessionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);

  v5 = objc_loadWeakRetained(&location);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__CAMCameraViewController_suspendCameraSession__block_invoke;
    aBlock[3] = &unk_1EA328F00;
    objc_copyWeak(&v9, &location);
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    objc_destroyWeak(&v9);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "suspendCameraSessionWithCompletion:", v7);
  objc_destroyWeak(&location);

}

void __47__CAMCameraViewController_suspendCameraSession__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v3, (id *)(a1 + 40));
  pl_dispatch_async();

  objc_destroyWeak(&v3);
}

void __47__CAMCameraViewController_suspendCameraSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cameraViewControllerDidSuspendCameraSession:", *(_QWORD *)(a1 + 32));

}

- (void)resumeCameraSession
{
  void *v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  _QWORD aBlock[5];
  id v9;
  id location;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController cameraSessionDelegate](self, "cameraSessionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);

  v5 = objc_loadWeakRetained(&location);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CAMCameraViewController_resumeCameraSession__block_invoke;
    aBlock[3] = &unk_1EA328F00;
    objc_copyWeak(&v9, &location);
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    objc_destroyWeak(&v9);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "resumeCameraSessionWithCompletion:", v7);
  objc_destroyWeak(&location);

}

void __46__CAMCameraViewController_resumeCameraSession__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v3, (id *)(a1 + 40));
  pl_dispatch_async();

  objc_destroyWeak(&v3);
}

void __46__CAMCameraViewController_resumeCameraSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cameraViewControllerDidResumeCameraSession:", *(_QWORD *)(a1 + 32));

}

- (int64_t)messagesTransitionState
{
  void *v2;
  int64_t v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messagesTransitionState");

  return v3;
}

- (void)setMessagesTransitionState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessagesTransitionState:animated:", a3, v4);

}

- (void)handleVolumeButtonPressed
{
  id v2;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleVolumeButtonPressed");

}

- (void)handleVolumeButtonReleased
{
  id v2;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleVolumeButtonReleased");

}

- (BOOL)isDisablingMultipleCaptureFeatures
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisablingMultipleCaptureFeatures");

  return v3;
}

- (void)setDisablingMultipleCaptureFeatures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisablingMultipleCaptureFeatures:", v3);

}

- (BOOL)isDisablingAdditionalCaptures
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisablingAdditionalCaptures");

  return v3;
}

- (void)setDisablingAdditionalCaptures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisablingAdditionalCaptures:", v3);

}

- (BOOL)isPreventingAdditionalCaptures
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPreventingAdditionalCaptures");

  return v3;
}

- (unint64_t)persistenceBehavior
{
  void *v3;
  unint64_t v4;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMCameraViewController _capturePersistenceBehaviorForViewfinderPersistenceBehavior:](self, "_capturePersistenceBehaviorForViewfinderPersistenceBehavior:", objc_msgSend(v3, "persistenceBehavior"));

  return v4;
}

- (void)setPersistenceBehavior:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersistenceBehavior:", -[CAMCameraViewController _viewfinderPersistenceBehaviorForCapturePersistenceBehavior:](self, "_viewfinderPersistenceBehaviorForCapturePersistenceBehavior:", a3));
  -[CAMCameraViewController keepAliveController](self, "keepAliveController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 1 >= 2)
  {
    if (!a3)
      objc_msgSend(v5, "startKeepAliveSession");
  }
  else
  {
    objc_msgSend(v5, "stopKeepAliveSession");
  }

}

- (BOOL)automaticallyAdjustsApplicationIdleTimer
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "automaticallyAdjustsApplicationIdleTimer");

  return v3;
}

- (void)setAutomaticallyAdjustsApplicationIdleTimer:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticallyAdjustsApplicationIdleTimer:", v3);

}

- (BOOL)isPerformingTileTransition
{
  void *v2;
  char v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPerformingTileTransition");

  return v3;
}

- (void)setPerformingTileTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerformingTileTransition:", v3);

}

- (unint64_t)_viewfinderPersistenceBehaviorForCapturePersistenceBehavior:(unint64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3 == 2)
    return 3;
  else
    return v3;
}

- (unint64_t)_capturePersistenceBehaviorForViewfinderPersistenceBehavior:(unint64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

- (CAMCameraConfigurationDelegate)configurationDelegate
{
  void *v2;
  void *v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMCameraConfigurationDelegate *)v3;
}

- (void)setConfigurationDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfigurationDelegate:", v4);

}

- (id)_resultQueueSafeImageFromSurface:(void *)a3 imageOrientation:(int64_t)a4
{
  void *v6;
  CGImage *v7;
  void *v8;

  if (a3)
  {
    -[CAMCameraViewController _resultQueueThumbnailGenerator](self, "_resultQueueThumbnailGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CGImage *)objc_msgSend(v6, "newBGRAImageInOrientation:usingSurface:", 0, a3);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v7, a4, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_previewImageFromVideoURL:(id)a3
{
  void *v3;
  id v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLPreviewImageAndDurationForVideoAtPath();
  v4 = 0;

  return v4;
}

- (void)_notifyCaptureDelegateOfCompletedCaptureOfPhoto:(id)a3 withProperties:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[CAMCameraViewController captureDelegate](self, "captureDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "cameraViewController:didCapturePhoto:withProperties:error:", self, v11, v8, v9);

}

- (void)_notifyCaptureDelegateOfCompletedCaptureOfLivePhoto:(id)a3 withProperties:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[CAMCameraViewController captureDelegate](self, "captureDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "cameraViewController:didCaptureLivePhoto:withProperties:error:", self, v11, v8, v9);

}

- (void)_notifyCaptureDelegateOfCompletedCaptureOfVideo:(id)a3 withProperties:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerAdjustments"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;
  objc_initWeak(&location, self);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v8, v13);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke;
  v16[3] = &unk_1EA3303A8;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  v15 = v9;
  v17 = v15;
  objc_msgSend(v14, "requestAVAssetWithResultHandler:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke_2;
  v15[3] = &unk_1EA330380;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  v11 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v18 = v11;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

  objc_destroyWeak(&v20);
}

void __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "captureDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "cameraViewController:didCaptureAVAsset:andAudioMix:withProperties:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      v3 = v5;
    }
  }

}

- (id)_exportPropertiesForClientProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelWidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPixelHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (int)objc_msgSend(v4, "shortValue");
  v8 = objc_msgSend(v5, "unsignedIntegerValue");
  v9 = objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0D71978], "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", v8, v9, v7, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_clientPropertiesForStillImageWithURL:(id)a3 captureMode:(int64_t)a4 captureOrientation:(int64_t)a5 previewSurface:(void *)a6 previewOrientation:(int64_t)a7 uniqueIdentifier:(id)a8 savedToPhotoLibrary:(BOOL)a9 captureResult:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v40;
  void *v42;
  void *v43;

  v14 = a3;
  v15 = a8;
  v16 = a10;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "captureDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = a4;
  v20 = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("CAMCameraViewControllerCaptureMode"));

  objc_msgSend(v16, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("CAMCameraViewControllerCaptureError"));

  if (v20)
    objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("CAMCameraViewControllerUniquePersistenceIdentifier"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("CAMCameraViewControllerPhotoURL"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("CAMCameraViewControllerPhotoMetadata"));
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("CAMCameraViewControllerCaptureOrientation"));

  }
  v40 = v14;
  objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v43;
  if (v24)
    objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("CAMCameraViewControllerOrientation"));
  objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0CBCC28]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0CBCC30]);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v27 && v28)
  {
    objc_msgSend(v24, "shortValue");
    v30 = PLIsRotatedExifOrientation();
    if (v30)
      v31 = v27;
    else
      v31 = v29;
    if (v30)
      v27 = v29;
    objc_msgSend(v17, "setObject:forKey:", v27, CFSTR("CAMCameraViewControllerPixelWidth"));
    objc_msgSend(v17, "setObject:forKey:", v31, CFSTR("CAMCameraViewControllerPixelHeight"));
    v29 = v31;
    v25 = v43;
  }
  if (v25)
    objc_msgSend(v17, "setObject:forKey:", v25, CFSTR("CAMCameraViewControllerCaptureDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v32, CFSTR("CAMCameraViewControllerSavedToPhotoLibrary"));

  if (a6)
  {
    -[CAMCameraViewController _resultQueueSafeImageFromSurface:imageOrientation:](self, "_resultQueueSafeImageFromSurface:imageOrientation:", a6, a7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(v17, "setObject:forKey:", v33, CFSTR("CAMCameraViewControllerPreviewImage"));

  }
  if (objc_msgSend((id)objc_opt_class(), "isEmulatingImagePicker"))
  {
    objc_msgSend(v16, "capturePhoto");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "fileDataRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v42 = v20;
      objc_msgSend(v17, "setObject:forKey:", v35, CFSTR("CAMCameraViewControllerFullsizeImageData"));
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v17, "setObject:forKey:", v36, CFSTR("CAMCameraViewControllerFullsizeImage"));

      v20 = v42;
    }

  }
  v37 = (void *)objc_msgSend(v17, "copy");

  return v37;
}

- (id)_clientPropertiesForPhotoProperties:(id)a3 withFilteredImageURL:(id)a4 conversionOutputInfo:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend(a3, "mutableCopy");
  getPAMediaConversionServicePixelWidthKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("CAMCameraViewControllerPixelWidth"));

  getPAMediaConversionServicePixelHeightKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("CAMCameraViewControllerPixelHeight"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("CAMCameraViewControllerPhotoURL"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("CAMCameraViewControllerCaptureError"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1EA3B16C0, CFSTR("CAMCameraViewControllerOrientation"));
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoMetadata"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("CAMCameraViewControllerPhotoMetadata"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoMetadata"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1EA3B16C0, *MEMORY[0x1E0CBCFF0]);

  return v12;
}

- (id)_clientPropertiesForLivePhotoVideoURL:(id)a3 duration:(id *)a4 stillDisplayTime:(id *)a5 error:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  v9 = a3;
  if (v9)
  {
    v10 = (objc_class *)MEMORY[0x1E0C99E08];
    v11 = a6;
    v12 = objc_alloc_init(v10);
    if ((a4->var2 & 1) != 0)
    {
      v17 = *a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds((CMTime *)&v17));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("CAMCameraViewControllerVideoDuration"));

    }
    if ((a5->var2 & 1) != 0)
    {
      v17 = *a5;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("CAMCameraViewControllerLivePhotoStillDisplayTime"));

    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("CAMCameraViewControllerVideoURL"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("CAMCameraViewControllerCaptureError"));

    v15 = (void *)objc_msgSend(v12, "copy");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_clientPropertiesForVideoURL:(id)a3 renderedURL:(id)a4 duration:(id *)a5 size:(CGSize)a6 creationDate:(id)a7 captureOrientation:(int64_t)a8 previewOrientation:(int64_t)a9 adjustments:(id)a10 uniqueIdentifier:(id)a11 savedToPhotoLibrary:(BOOL)a12
{
  double height;
  double width;
  objc_class *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  CMTime time;

  height = a6.height;
  width = a6.width;
  v19 = (objc_class *)MEMORY[0x1E0C99E08];
  v20 = a11;
  v21 = a10;
  v22 = a7;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(v19);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, CFSTR("CAMCameraViewControllerUniquePersistenceIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("CAMCameraViewControllerPixelWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("CAMCameraViewControllerPixelHeight"));

  objc_msgSend(v25, "setObject:forKeyedSubscript:", v22, CFSTR("CAMCameraViewControllerCaptureDate"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, CFSTR("CAMCameraViewControllerAdjustments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v28, CFSTR("CAMCameraViewControllerSavedToPhotoLibrary"));

  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("CAMCameraViewControllerCaptureOrientation"));

  }
  if ((a5->var2 & 1) != 0)
  {
    time = (CMTime)*a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&time));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("CAMCameraViewControllerVideoDuration"));

  }
  if (v23)
    v31 = v23;
  else
    v31 = v24;
  if (v23)
    v32 = v24;
  else
    v32 = 0;
  v33 = v32;
  v34 = v31;
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, CFSTR("CAMCameraViewControllerVideoURL"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, CFSTR("CAMCameraViewControllerUnadjustedVideoURL"));

  -[CAMCameraViewController _previewImageFromVideoURL:](self, "_previewImageFromVideoURL:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("CAMCameraViewControllerPreviewImage"));
  v36 = (void *)objc_msgSend(v25, "copy");

  return v36;
}

- (void)captureController:(id)a3 didGenerateStillImageCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  CAMCameraViewController *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "captureOrientation");
  v10 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", v7, objc_msgSend(v8, "captureDevice"), objc_msgSend(v8, "captureOrientation"));
  objc_msgSend(v8, "persistenceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "captureMode");
  v13 = objc_msgSend(v8, "persistenceOptions");

  if (!v13)
  {
    -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke;
    v15[3] = &unk_1EA3303D0;
    v16 = v7;
    v17 = self;
    v19 = v12;
    v20 = v9;
    v21 = v10;
    v18 = v11;
    dispatch_async(v14, v15);

  }
}

void __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "stillImageFilteredPreviewSurface");
  if (!v2)
    v2 = objc_msgSend(*(id *)(a1 + 32), "stillImageUnfilteredPreviewSurface");
  LOBYTE(v9) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_clientPropertiesForStillImageWithURL:captureMode:captureOrientation:previewSurface:previewOrientation:uniqueIdentifier:savedToPhotoLibrary:captureResult:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), v9, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CAMCameraViewControllerPreviewImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke_2;
  block[3] = &unk_1EA3290F0;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = v4;
  v14 = v3;
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_notifyCaptureDelegateOfCompletedCaptureOfPhoto:withProperties:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);

}

- (id)_behaviorDefinedDestinationURLForRequest:(id)a3 withLocalDestinationURL:(id)a4 linkedDestinationURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "persistenceOptions");
  v11 = objc_msgSend(v9, "temporaryPersistenceOptions");

  if ((unint64_t)(v10 - 1) > 1)
    goto LABEL_6;
  v12 = v7;
  if (v11 >= 2)
  {
    if (v11 == 2)
    {
      v12 = v8;
      goto LABEL_5;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v13 = v12;
LABEL_7:

  return v13;
}

- (void)persistenceController:(id)a3 didGenerateStillImageLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  char v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  char v51;
  BOOL v52;
  BOOL v53;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!objc_msgSend(v11, "conformsToProtocol:", &unk_1F038AF70)
    || (objc_msgSend(v11, "timelapseIdentifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    v13 = -[CAMCameraViewController isDisablingMultipleCaptureFeatures](self, "isDisablingMultipleCaptureFeatures");
    v14 = -[CAMCameraViewController isRecording](self, "isRecording");
    if (!v13 || !v14)
    {
      if (objc_msgSend(v11, "type"))
        v15 = 0;
      else
        v15 = v11;
      v16 = v15;
      objc_msgSend(v9, "localDestinationURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "linkedDestinationURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCameraViewController _behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:](self, "_behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:", v11, v17, v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v11, "captureMode");
      v32 = objc_msgSend(v11, "captureOrientation");
      v31 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", v10, objc_msgSend(v11, "captureDevice"), objc_msgSend(v11, "captureOrientation"));
      objc_msgSend(v9, "localPersistenceUUID");
      v19 = objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v11, "shouldPersistToIncomingDirectory");
      v35 = (void *)v19;
      if (objc_msgSend(v16, "hasAdjustments"))
      {
        objc_msgSend(v16, "adjustmentFilters");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v20, "count") == 0;

      }
      else
      {
        v29 = 0;
      }
      v37 = v16;
      v21 = objc_msgSend(v10, "stillImageFilteredPreviewSurface");
      if (!v21)
        v21 = objc_msgSend(v10, "stillImageUnfilteredPreviewSurface");
      objc_msgSend(v10, "coordinationInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "resultSpecifiers");
      objc_msgSend(v22, "allExpectedResultSpecifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
      block[3] = &unk_1EA330448;
      block[4] = self;
      v39 = v36;
      v40 = v35;
      v47 = v32;
      v48 = v21;
      v49 = v31;
      v46 = v33;
      v51 = v30;
      v41 = v10;
      v42 = v37;
      v43 = v11;
      v52 = v29;
      v50 = v23;
      v44 = v9;
      v45 = v24;
      v53 = v13;
      v34 = v24;
      v26 = v37;
      v27 = v35;
      v28 = v36;
      dispatch_async(v25, block);

    }
  }

}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  CFAbsoluteTime Current;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  CFAbsoluteTime v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  LOBYTE(v47) = *(_BYTE *)(a1 + 136);
  objc_msgSend(*(id *)(a1 + 32), "_clientPropertiesForStillImageWithURL:captureMode:captureOrientation:previewSurface:previewOrientation:uniqueIdentifier:savedToPhotoLibrary:captureResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 48), v47, *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_exportPropertiesForClientProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "wantsSemanticSceneFilter"))
  {
    v4 = (void *)MEMORY[0x1E0D750D8];
    objc_msgSend(*(id *)(a1 + 56), "capturePhoto");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privateClientMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v4, "deserializedMetadataFromPrivateClientMetadata:error:", v6, &v64);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v64;

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_cold_1(a1, (uint64_t)v8, v9);

    }
    v10 = objc_msgSend(MEMORY[0x1E0D75260], "semanticEnhanceSceneForCameraMetadata:ignoreCameraSetting:", v7, 1);
    v12 = v11;
    objc_msgSend(v7, "setSemanticEnhanceScene:", v10);
    objc_msgSend(v7, "setSemanticEnhanceSceneConfidence:", v12);
    v13 = (unint64_t)(v10 - 1) < 0xFFFFFFFFFFFFFFFELL;
    v14 = (void *)MEMORY[0x1E0D717C0];
    objc_msgSend(*(id *)(a1 + 80), "adjustmentsData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:applySemanticEnhance:assetType:", v15, v7, v3, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D717C0];
    objc_msgSend(*(id *)(a1 + 80), "adjustmentsData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetAdjustmentsFromCameraAdjustmentData:exportProperties:", v18, v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v13) = 0;
  }
  v19 = objc_msgSend(*(id *)(a1 + 56), "isExpectingPairedVideo");
  if (*(_BYTE *)(a1 + 137))
    v20 = 1;
  else
    v20 = v13;
  if (!v16)
    v20 = 0;
  v21 = v20 & v19 ^ 1;
  if (!*(_BYTE *)(a1 + 137))
    v21 = 1;
  v22 = v20 & v21;
  if (*(_BYTE *)(a1 + 137))
    v23 = 0;
  else
    v23 = v20;
  v24 = *(_QWORD *)(a1 + 128);
  if ((v23 & 1) != 0)
  {
    v25 = 0;
    v26 = 1;
  }
  else
  {
    v26 = 0;
    v24 |= 2uLL;
    v25 = v20 & v21;
  }
  objc_msgSend(*(id *)(a1 + 32), "_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:captureTimeExpectedResultSpecifiers:isExpectingPairedVideo:isDisablingMultipleCaptures:isGeneratingFilteredMedia:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), v19, *(unsigned __int8 *)(a1 + 138), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if ((v23 & 1) == 0)
    objc_msgSend(v27, "updatePhotoProperties:assetAdjustments:forResultSpecifiers:", v2, v16, *(_QWORD *)(a1 + 128));
  if (v22)
  {
    v51 = v26;
    v53 = v2;
    objc_msgSend(*(id *)(a1 + 72), "persistenceUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 128);
    if ((v30 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v30 & 1) == 0)
      {
LABEL_29:
        v52 = v3;
        if (!-[__CFString length](v31, "length"))
        {

          v31 = CFSTR("None");
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("persistenceUUID %@; %@ still image"), v29, v31);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)*MEMORY[0x1E0D74A78];
        objc_msgSend(*(id *)(a1 + 40), "pathExtension");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByAppendingPathExtension:", v35);
        v36 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "URLByDeletingPathExtension");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)v36;
        objc_msgSend(v37, "URLByAppendingPathExtension:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(getPAMediaConversionServiceResourceURLCollectionClass(), "collectionWithMainResourceURL:", *(_QWORD *)(a1 + 40));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(getPAMediaConversionServiceResourceURLCollectionClass(), "collectionWithMainResourceURL:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)v33;
        objc_msgSend(*(id *)(a1 + 32), "_mediaConversionOptionsForAdjustments:mediaType:description:", v16, 1, v33);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v66 = v29;
          v67 = 2114;
          v68 = v31;
          _os_log_impl(&dword_1DB760000, v41, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Rendering image for specifier %{public}@", buf, 0x16u);
        }

        objc_msgSend(v28, "delayForcedDispatchForPhotoResultSpecifiers:", v24);
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(*(id *)(a1 + 32), "_imageConversionClient");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_149;
        v54[3] = &unk_1EA330420;
        v60 = Current;
        v54[4] = *(_QWORD *)(a1 + 32);
        v55 = v29;
        v56 = v38;
        v61 = *(_QWORD *)(a1 + 128);
        v57 = v53;
        v63 = v51;
        v58 = v16;
        v59 = v28;
        v62 = v24;
        v44 = v38;
        v45 = v29;
        v2 = v53;
        v46 = v45;
        objc_msgSend(v43, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v48, v39, v40, v54);

        v3 = v52;
        goto LABEL_34;
      }
    }
    else
    {
      v31 = &stru_1EA3325A0;
      if ((v30 & 1) == 0)
        goto LABEL_29;
    }
    -[__CFString stringByAppendingString:](v31, "stringByAppendingString:", CFSTR("HDR"));
    v32 = objc_claimAutoreleasedReturnValue();

    v31 = (__CFString *)v32;
    goto LABEL_29;
  }
LABEL_34:

}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_149(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  CFAbsoluteTime v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  CFAbsoluteTime v28;
  uint64_t v29;
  char v30;

  v7 = a3;
  v8 = a4;
  v9 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "_resultProcessingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2;
  block[3] = &unk_1EA3303F8;
  v18 = v8;
  v26 = a2;
  v19 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 88);
  v28 = v9;
  v12 = *(_QWORD *)(a1 + 32);
  v20 = v11;
  v21 = v12;
  v22 = *(id *)(a1 + 56);
  v23 = v7;
  v30 = *(_BYTE *)(a1 + 104);
  v24 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 96);
  v25 = v13;
  v29 = v14;
  v15 = v7;
  v16 = v8;
  dispatch_async(v10, block);

}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 96) == 1)
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 104);
    if ((v4 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v4 & 1) == 0)
      {
LABEL_15:
        if (!-[__CFString length](v5, "length"))
        {

          v5 = CFSTR("None");
        }
        v9 = *(_QWORD *)(a1 + 112);
        v10 = 138543874;
        v11 = v3;
        v12 = 2114;
        v13 = v5;
        v14 = 2048;
        v15 = v9;
        _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Finished rendering image for specifier %{public}@ (took %.3f seconds)", (uint8_t *)&v10, 0x20u);

        goto LABEL_9;
      }
    }
    else
    {
      v5 = &stru_1EA3325A0;
      if ((v4 & 1) == 0)
        goto LABEL_15;
    }
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("HDR"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v8;
    goto LABEL_15;
  }
  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2_cold_1(a1);
LABEL_9:

  objc_msgSend(*(id *)(a1 + 56), "_clientPropertiesForPhotoProperties:withFilteredImageURL:conversionOutputInfo:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 128))
    v7 = 0;
  else
    v7 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 88), "updatePhotoProperties:assetAdjustments:forResultSpecifiers:", v6, v7, *(_QWORD *)(a1 + 120));

}

- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  if (objc_msgSend(v12, "isCTMVideo"))
  {
    -[CAMCameraViewController _handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:](self, "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:", v13, v9, v12);
  }
  else if (v12)
  {
    -[CAMCameraViewController _handleLivePhotoVideoLocalPersistenceResult:forCaptureResult:fromRequest:](self, "_handleLivePhotoVideoLocalPersistenceResult:forCaptureResult:fromRequest:", v13, v9, v12);
  }
  else
  {
    -[CAMCameraViewController _handleVideoLocalPersistenceResult:forCaptureResult:fromRequest:](self, "_handleVideoLocalPersistenceResult:forCaptureResult:fromRequest:", v13, v9, v10);
  }

}

- (void)_handleLivePhotoVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  BOOL v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "coordinationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "resultSpecifiers");
  objc_msgSend(v11, "allExpectedResultSpecifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CAMCameraViewController isDisablingMultipleCaptureFeatures](self, "isDisablingMultipleCaptureFeatures");
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__CAMCameraViewController__handleLivePhotoVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
  block[3] = &unk_1EA330470;
  block[4] = self;
  v21 = v10;
  v26 = v14;
  v22 = v13;
  v23 = v8;
  v24 = v9;
  v25 = v12;
  v16 = v9;
  v17 = v8;
  v18 = v13;
  v19 = v10;
  dispatch_async(v15, block);

}

void __100__CAMCameraViewController__handleLivePhotoVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:captureTimeExpectedResultSpecifiers:isExpectingPairedVideo:isDisablingMultipleCaptures:isGeneratingFilteredMedia:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 80), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "localDestinationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "linkedDestinationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0uLL;
  v22 = 0;
  v8 = *(void **)(a1 + 56);
  if (v8 && (objc_msgSend(v8, "duration"), v9 = *(void **)(a1 + 56), v19 = 0uLL, v20 = 0, v9))
  {
    objc_msgSend(v9, "stillDisplayTime");
  }
  else
  {
    v19 = 0uLL;
    v20 = 0;
  }
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;
  v18 = v22;
  v15 = v19;
  v16 = v20;
  objc_msgSend(v10, "_clientPropertiesForLivePhotoVideoURL:duration:stillDisplayTime:error:", v7, &v17, &v15, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "adjustmentFilters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[CAMEffectFilterManager isDepthEffectInFilters:](CAMEffectFilterManager, "isDepthEffectInFilters:", v13);

  objc_msgSend(v2, "updateVideoProperties:forResultSpecifiers:wantsDepthRenderedForStill:", v12, *(_QWORD *)(a1 + 72), v14);
}

- (void)_handleCTMVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  CAMCameraViewController *v26;
  BOOL v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "localDestinationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "linkedDestinationURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController _behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:](self, "_behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hasAdjustments"))
  {
    objc_msgSend(v8, "adjustmentsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

  }
  else
  {
    v15 = 0;
  }
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
  v21[3] = &unk_1EA3304C0;
  v22 = v10;
  v23 = v9;
  v27 = v15;
  v24 = v8;
  v25 = v13;
  v26 = self;
  v17 = v13;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  dispatch_async(v16, v21);

}

void __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
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
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  double v37;
  double v38;
  CMTime time;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[CAMOrientationUtilities videoTrackOrientationForVideoRequest:](CAMOrientationUtilities, "videoTrackOrientationForVideoRequest:", *(_QWORD *)(a1 + 32));
  v2 = PLExifOrientationFromImageOrientation();
  objc_msgSend(*(id *)(a1 + 40), "dimensions");
  CAMSizeForDimensions();
  v5 = v3;
  v6 = v4;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "persistenceUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("persistenceUUID %@; CTM Video"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D71978];
    v10 = *(void **)(a1 + 48);
    if (v10)
      objc_msgSend(v10, "duration");
    else
      memset(&time, 0, sizeof(time));
    objc_msgSend(v9, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)v5, (unint64_t)v6, v2, CMTimeGetSeconds(&time));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D717C0];
    objc_msgSend(*(id *)(a1 + 48), "adjustmentsData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetAdjustmentsFromCameraAdjustmentData:exportProperties:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C99E98];
    v16 = (void *)MEMORY[0x1E0D73148];
    objc_msgSend(*(id *)(a1 + 56), "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filteredVideoPathForRecordedLivePhotoVideoPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "_mediaConversionOptionsForAdjustments:mediaType:description:", v14, 2, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v7;
      _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Rendering CTM video", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 64), "_videoConversionClient");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_157;
    v28[3] = &unk_1EA330498;
    v29 = v7;
    v30 = v19;
    v23 = *(_QWORD *)(a1 + 56);
    v31 = *(_QWORD *)(a1 + 64);
    v32 = *(id *)(a1 + 48);
    v33 = *(id *)(a1 + 40);
    v34 = *(id *)(a1 + 32);
    v37 = v5;
    v38 = v6;
    v35 = *(id *)(a1 + 56);
    v36 = v14;
    v24 = v14;
    v25 = v19;
    v26 = v7;
    v27 = (id)objc_msgSend(v22, "convertVideoAtSourceURL:toDestinationURL:options:completionHandler:", v23, v25, v20, v28);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:size:videoURL:renderedToURL:renderedAdjustments:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, 0, v3, v4);
  }
}

void __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_157(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.camera", "Camera");
  v10 = v9;
  if (a2 != 1 || v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      CAMPAMediaConversionNameForJobStatus(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      v22 = 138544130;
      v23 = v19;
      v24 = 2114;
      v25 = v20;
      v26 = 2114;
      v27 = v21;
      v28 = 2114;
      v29 = v8;
      _os_log_error_impl(&dword_1DB760000, v10, OS_LOG_TYPE_ERROR, "CVC %{public}@: Media conversion status %{public}@ writing filtered video at %{public}@ -- %{public}@", (uint8_t *)&v22, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 48), "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:size:videoURL:renderedToURL:renderedAdjustments:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), 0, 0, *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v22 = 138543362;
      v23 = v11;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Finished rendering CTM video", (uint8_t *)&v22, 0xCu);
    }

    getPAMediaConversionServicePixelWidthKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    getPAMediaConversionServicePixelHeightKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "doubleValue");
    v17 = v16;
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(*(id *)(a1 + 48), "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:size:videoURL:renderedToURL:renderedAdjustments:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), v17, v18);

  }
}

- (void)_handleCTMVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5 size:(CGSize)a6 videoURL:(id)a7 renderedToURL:(id)a8 renderedAdjustments:(id)a9
{
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[3];

  height = a6.height;
  width = a6.width;
  v17 = a3;
  v31 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v17)
    objc_msgSend(v17, "duration");
  else
    memset(v32, 0, sizeof(v32));
  objc_msgSend(v17, "creationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v18, "captureOrientation");
  v24 = +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", v18);
  objc_msgSend(v17, "localPersistenceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v18, "shouldPersistToIncomingDirectory");
  -[CAMCameraViewController _clientPropertiesForVideoURL:renderedURL:duration:size:creationDate:captureOrientation:previewOrientation:adjustments:uniqueIdentifier:savedToPhotoLibrary:](self, "_clientPropertiesForVideoURL:renderedURL:duration:size:creationDate:captureOrientation:previewOrientation:adjustments:uniqueIdentifier:savedToPhotoLibrary:", v19, v20, v32, v22, v23, v24, width, height, v21, v25, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v27 = v20;
  else
    v27 = v19;
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController _notifyCaptureDelegateOfCompletedCaptureOfVideo:withProperties:error:](self, "_notifyCaptureDelegateOfCompletedCaptureOfVideo:withProperties:error:", v28, v26, v29);

}

- (void)_handleVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  id v27;
  CAMCameraViewController *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  BOOL v35;
  char v36;
  uint8_t buf[16];
  uint64_t v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "localDestinationURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "linkedDestinationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCameraViewController _behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:](self, "_behaviorDefinedDestinationURLForRequest:withLocalDestinationURL:linkedDestinationURL:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    memset(buf, 0, sizeof(buf));
    v38 = 0;
    objc_msgSend(v8, "duration");
    objc_msgSend(v8, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v10, "captureOrientation");
    objc_msgSend(v8, "localPersistenceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "shouldPersistToIncomingDirectory");
    v17 = v9;
    v18 = objc_msgSend(v10, "captureMode") == 2;
    -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__CAMCameraViewController__handleVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
    block[3] = &unk_1EA3304E8;
    v26 = v13;
    v35 = v18;
    v9 = v17;
    v33 = *(_OWORD *)buf;
    v34 = v38;
    v27 = v10;
    v28 = self;
    v32 = v24;
    v29 = v14;
    v30 = v15;
    v36 = v16;
    v31 = v17;
    v20 = v15;
    v21 = v14;
    v22 = v13;
    dispatch_async(v19, block);

  }
  else
  {
    v23 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "Received nil for CAMVideoLocalPersistenceResult, possibly due to nebulad timeout", buf, 2u);
    }

  }
}

void __91__CAMCameraViewController__handleVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  double height;
  void *v15;
  float v16;
  void *v17;
  float v18;
  id v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  CGRect v41;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalSize");
  v6 = v5;
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v4, "preferredTransform");
    v9 = *((double *)&v37 + 1);
    v10 = *(double *)&v37;
    v11 = *((double *)&v38 + 1);
    v12 = *(double *)&v38;
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    v11 = 0.0;
    v9 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
  }
  v40.size.width = v8 * v12 + v10 * v6;
  v40.size.height = v8 * v11 + v9 * v6;
  v40.origin.x = 0.0;
  v40.origin.y = 0.0;
  v41 = CGRectStandardize(v40);
  width = v41.size.width;
  height = v41.size.height;
  v15 = (void *)MEMORY[0x1E0D75308];
  objc_msgSend(v4, "nominalFrameRate", v41.origin.x, v41.origin.y);
  objc_msgSend(v15, "defaultSlowMotionRateForNominalFrameRate:");
  v17 = 0;
  if (*(_BYTE *)(a1 + 112))
  {
    v18 = v16;
    if (v16 > 0.0 && v16 < 1.0)
    {
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      v31 = *(_OWORD *)(a1 + 88);
      *(_QWORD *)&v32 = *(_QWORD *)(a1 + 104);
      objc_msgSend(MEMORY[0x1E0D75308], "defaultSlowMotionTimeRangeForDuration:", &v31);
      v20 = objc_alloc(MEMORY[0x1E0D75308]);
      v31 = v34;
      v32 = v35;
      v33 = v36;
      v17 = (void *)objc_msgSend(v20, "initWithSlowMotionTimeRange:rate:", &v31, COERCE_DOUBLE(__PAIR64__(DWORD1(v36), LODWORD(v18))));
    }
  }
  v21 = +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", *(_QWORD *)(a1 + 40));
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(a1 + 48);
  v24 = *(_QWORD *)(a1 + 56);
  v25 = *(_QWORD *)(a1 + 80);
  v26 = *(_QWORD *)(a1 + 64);
  v27 = *(_BYTE *)(a1 + 113);
  v34 = *(_OWORD *)(a1 + 88);
  *(_QWORD *)&v35 = *(_QWORD *)(a1 + 104);
  LOBYTE(v30) = v27;
  objc_msgSend(v23, "_clientPropertiesForVideoURL:renderedURL:duration:size:creationDate:captureOrientation:previewOrientation:adjustments:uniqueIdentifier:savedToPhotoLibrary:", v22, 0, &v34, v24, v25, v21, width, height, v17, v26, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_notifyCaptureDelegateOfCompletedCaptureOfVideo:withProperties:error:", v2, v28, v29);

}

- (void)persistenceController:(id)a3 didCompleteAllLocalPersistenceForRequest:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__CAMCameraViewController_persistenceController_didCompleteAllLocalPersistenceForRequest___block_invoke;
    v9[3] = &unk_1EA328A40;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

uint64_t __90__CAMCameraViewController_persistenceController_didCompleteAllLocalPersistenceForRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resultQueue_forceCompletionIfPossibleForRequest:", *(_QWORD *)(a1 + 40));
}

- (void)_resultQueue_forceCompletionIfPossibleForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  v4 = a3;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((objc_msgSend(v4, "isCTMVideo") & 1) == 0)
  {
    -[CAMCameraViewController _resultQueue_getStillImageResultCoordinatorForRequest:](self, "_resultQueue_getStillImageResultCoordinatorForRequest:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "forceRemainingDispatchesIfPossible");
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMCameraViewController _resultQueue_removeStillImageResultCoordinatorForIdentifier:](self, "_resultQueue_removeStillImageResultCoordinatorForIdentifier:", v8);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__CAMCameraViewController__resultQueue_forceCompletionIfPossibleForRequest___block_invoke;
      block[3] = &unk_1EA328868;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
}

void __76__CAMCameraViewController__resultQueue_forceCompletionIfPossibleForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2D50];
  v5[0] = CFSTR("Capture failed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CAMCameraViewControllerErrorDomain"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_notifyCaptureDelegateOfCompletedCaptureOfPhoto:withProperties:error:", 0, 0, v3);

}

- (id)_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:(id)a3 captureTimeExpectedResultSpecifiers:(id)a4 isExpectingPairedVideo:(BOOL)a5 isDisablingMultipleCaptures:(BOOL)a6 isGeneratingFilteredMedia:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  CAMCVCStillImageResultCoordinator *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  _BOOL4 v29;
  unsigned int v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(v12, "persistenceUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController _resultQueueStillImageResultCoordinators](self, "_resultQueueStillImageResultCoordinators");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v15);
  v17 = (CAMCVCStillImageResultCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = v13;
    v19 = v18;
    if (v7)
    {
      v29 = v8;
      v30 = v9;
      v31 = v12;
      v20 = (void *)objc_msgSend(v18, "mutableCopy");
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v21 = v19;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v33 != v24)
              objc_enumerationMutation(v21);
            v26 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "unsignedIntegerValue");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26 | 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v27);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v23);
      }

      v12 = v31;
      v8 = v29;
      v9 = v30;
    }
    else
    {
      v20 = v18;
    }
    v17 = -[CAMCVCStillImageResultCoordinator initWithDelegate:identifier:allExpectedResultSpecifiers:isExpectingPairedVideo:allowMultipleCaptures:shouldReturnFilteredPhotosAsSingleAsset:]([CAMCVCStillImageResultCoordinator alloc], "initWithDelegate:identifier:allExpectedResultSpecifiers:isExpectingPairedVideo:allowMultipleCaptures:shouldReturnFilteredPhotosAsSingleAsset:", self, v15, v20, v9, !v8, 1);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v15);

  }
  return v17;
}

- (id)_resultQueue_getStillImageResultCoordinatorForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "persistenceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCameraViewController _resultQueueStillImageResultCoordinators](self, "_resultQueueStillImageResultCoordinators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_resultQueue_removeStillImageResultCoordinatorForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CAMCameraViewController _resultQueueStillImageResultCoordinators](self, "_resultQueueStillImageResultCoordinators");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)stillImagePersistenceCoordinator:(id)a3 requestsDispatchForResultSpecifiers:(unint64_t)a4 photoProperties:(id)a5 videoProperties:(id)a6 unfilteredPhotoProperties:(id)a7 unfilteredVideoProperties:(id)a8 assetAdjustments:(id)a9 error:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;

  v26 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v21 = a9;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  v23 = objc_msgSend(v26, "isExpectingPairedVideo");
  if (v21 && (_DWORD)v23)
  {
    if (v18)
      v24 = v18;
    else
      v24 = v16;
    if (v19)
      v25 = v19;
    else
      v25 = v17;
    -[CAMCameraViewController _renderLivePhotoWithCoordinator:specifiers:photoProperties:videoProperties:adjustments:](self, "_renderLivePhotoWithCoordinator:specifiers:photoProperties:videoProperties:adjustments:", v26, a4, v24, v25, v21, v23);
  }
  else
  {
    -[CAMCameraViewController _handlePhotoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:attemptPairingVideo:error:](self, "_handlePhotoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:attemptPairingVideo:error:", v16, v17, v18, v19, v21, v23, v20);
  }

}

- (void)_handlePhotoProperties:(id)a3 videoProperties:(id)a4 unfilteredPhotoProperties:(id)a5 unfilteredVideoProperties:(id)a6 assetAdjustments:(id)a7 attemptPairingVideo:(BOOL)a8 error:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 *v25;
  void *v26;
  os_log_t v27;
  double Current;
  void *v29;
  void *v30;
  id v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  _QWORD block[4];
  id v43;
  CAMCameraViewController *v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  uint64_t v49;
  id v50;
  uint8_t buf[16];
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  _QWORD v55[5];

  v9 = a8;
  v55[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v40 = a6;
  v17 = a9;
  v18 = a7;
  v19 = a5;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoURL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("CAMCameraViewControllerUnadjustedPhotoURL"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("CAMCameraViewControllerAdjustments"));

  if (v9)
  {
    if (v21 && v41)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerLivePhotoStillDisplayTime"));
      v24 = objc_claimAutoreleasedReturnValue();
      memset(buf, 0, sizeof(buf));
      v52 = 0;
      v25 = (__int128 *)MEMORY[0x1E0CA2E18];
      v39 = v24;
      if (v24)
      {
        -[NSObject CMTimeValue](v24, "CMTimeValue");
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E18];
        v52 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      }
      Current = CFAbsoluteTimeGetCurrent();
      v29 = (void *)MEMORY[0x1E0CD1608];
      v55[0] = v21;
      v55[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *v25;
      v54 = *((_QWORD *)v25 + 2);
      v48 = *(_OWORD *)buf;
      v49 = v52;
      v50 = 0;
      objc_msgSend(v29, "livePhotoWithResourceFileURLs:pairingIdentifier:videoDuration:photoTime:error:", v30, 0, &v53, &v48, &v50);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v50;

      v32 = CFAbsoluteTimeGetCurrent();
      v33 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v53) = 134217984;
        *(double *)((char *)&v53 + 4) = v32 - Current;
        _os_log_impl(&dword_1DB760000, v33, OS_LOG_TYPE_DEFAULT, "CAMCameraViewController: Finished loading live photo via livePhotoWithResourceFileURLs (took %.3f seconds)", (uint8_t *)&v53, 0xCu);
      }

      if (!v26 || v31)
      {
        v34 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v53) = 138543362;
          *(_QWORD *)((char *)&v53 + 4) = v31;
          _os_log_impl(&dword_1DB760000, v34, OS_LOG_TYPE_DEFAULT, "CAMCameraViewController: attempted to create a live photo but failed – falling back to a normal photo (%{public}@)", (uint8_t *)&v53, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v22, "addEntriesFromDictionary:", v16);
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
        v34 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("CAMCameraViewControllerUnadjustedVideoURL"));
      }

      v27 = v39;
LABEL_21:

      goto LABEL_22;
    }
    v26 = 0;
    if (v21 && !v41)
    {
      v27 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v27, OS_LOG_TYPE_DEFAULT, "CAMCameraViewController: missing video for live photo – falling back to a normal photo", buf, 2u);
      }
      v26 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v26 = 0;
  }
LABEL_22:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __161__CAMCameraViewController__handlePhotoProperties_videoProperties_unfilteredPhotoProperties_unfilteredVideoProperties_assetAdjustments_attemptPairingVideo_error___block_invoke;
  block[3] = &unk_1EA32EAF8;
  v43 = v26;
  v44 = self;
  v45 = v22;
  v46 = v17;
  v47 = v15;
  v35 = v15;
  v36 = v17;
  v37 = v22;
  v38 = v26;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __161__CAMCameraViewController__handlePhotoProperties_videoProperties_unfilteredPhotoProperties_unfilteredVideoProperties_assetAdjustments_attemptPairingVideo_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyCaptureDelegateOfCompletedCaptureOfLivePhoto:withProperties:error:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPreviewImage"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_notifyCaptureDelegateOfCompletedCaptureOfPhoto:withProperties:error:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

- (PAImageConversionServiceClient)_imageConversionClient
{
  PAImageConversionServiceClient *imageConversionClient;
  void *v4;
  objc_class *v5;
  PAImageConversionServiceClient *v6;
  PAImageConversionServiceClient *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  imageConversionClient = self->__imageConversionClient;
  if (!imageConversionClient)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getPAImageConversionServiceClientClass_softClass;
    v13 = getPAImageConversionServiceClientClass_softClass;
    if (!getPAImageConversionServiceClientClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPAImageConversionServiceClientClass_block_invoke;
      v9[3] = &unk_1EA329140;
      v9[4] = &v10;
      __getPAImageConversionServiceClientClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (PAImageConversionServiceClient *)objc_alloc_init(v5);
    v7 = self->__imageConversionClient;
    self->__imageConversionClient = v6;

    imageConversionClient = self->__imageConversionClient;
  }
  return imageConversionClient;
}

- (PAVideoConversionServiceClient)_videoConversionClient
{
  PAVideoConversionServiceClient *videoConversionClient;
  void *v4;
  objc_class *v5;
  PAVideoConversionServiceClient *v6;
  PAVideoConversionServiceClient *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  videoConversionClient = self->__videoConversionClient;
  if (!videoConversionClient)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getPAVideoConversionServiceClientClass_softClass;
    v13 = getPAVideoConversionServiceClientClass_softClass;
    if (!getPAVideoConversionServiceClientClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPAVideoConversionServiceClientClass_block_invoke;
      v9[3] = &unk_1EA329140;
      v9[4] = &v10;
      __getPAVideoConversionServiceClientClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (PAVideoConversionServiceClient *)objc_alloc_init(v5);
    v7 = self->__videoConversionClient;
    self->__videoConversionClient = v6;

    videoConversionClient = self->__videoConversionClient;
  }
  return videoConversionClient;
}

- (id)_mediaConversionOptionsForAdjustments:(id)a3 mediaType:(int64_t)a4 description:(id)a5
{
  id v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  id v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[6];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[2];
  id v54;
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a5;
  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x2020000000;
  v8 = (id *)getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr;
  v39 = (void *)getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr)
  {
    v9 = (void *)MediaConversionServiceLibrary();
    v8 = (id *)dlsym(v9, "PAMediaConversionServiceAdjustmentDataKey");
    *(_QWORD *)(v37 + 24) = v8;
    getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v36, 8);
  if (!v8)
    goto LABEL_22;
  v10 = *v8;
  v53[0] = v10;
  objc_msgSend(v7, "adjustmentData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v11;
  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x2020000000;
  v12 = (id *)getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr;
  v39 = (void *)getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr)
  {
    v13 = (void *)MediaConversionServiceLibrary();
    v12 = (id *)dlsym(v13, "PAMediaConversionServiceAdjustmentFormatIdentifierKey");
    *(_QWORD *)(v37 + 24) = v12;
    getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v36, 8);
  if (!v12)
    goto LABEL_22;
  v14 = *v12;
  v53[1] = v14;
  objc_msgSend(v7, "adjustmentFormatIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v15;
  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x2020000000;
  v16 = (id *)getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr;
  v39 = (void *)getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr)
  {
    v17 = (void *)MediaConversionServiceLibrary();
    v16 = (id *)dlsym(v17, "PAMediaConversionServiceAdjustmentFormatVersionKey");
    *(_QWORD *)(v37 + 24) = v16;
    getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v36, 8);
  if (!v16)
    goto LABEL_22;
  v54 = *v16;
  v18 = v54;
  objc_msgSend(v7, "adjustmentFormatVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v53, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2050000000;
    v27 = (void *)getPAMediaConversionServiceImageMetadataPolicyClass_softClass;
    v44 = getPAMediaConversionServiceImageMetadataPolicyClass_softClass;
    if (!getPAMediaConversionServiceImageMetadataPolicyClass_softClass)
    {
      v36 = MEMORY[0x1E0C809B0];
      v37 = 3221225472;
      v38 = (uint64_t)__getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke;
      v39 = &unk_1EA329140;
      v40 = &v41;
      __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke((uint64_t)&v36);
      v27 = (void *)v42[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v41, 8);
    objc_msgSend(v28, "standardPolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    getPAMediaConversionServiceOptionAdjustmentInformationKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v21;
    v50[0] = v34;
    getPAMediaConversionServiceOptionApplyOrientationTransformKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v22;
    v50[1] = MEMORY[0x1E0C9AAB0];
    v36 = 0;
    v37 = (uint64_t)&v36;
    v38 = 0x2020000000;
    v29 = (id *)getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr;
    v39 = (void *)getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr;
    if (!getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr)
    {
      v30 = (void *)MediaConversionServiceLibrary();
      v29 = (id *)dlsym(v30, "PAMediaConversionServiceOptionMetadataPolicyKey");
      *(_QWORD *)(v37 + 24) = v29;
      getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(&v36, 8);
    if (v29)
    {
      v46 = *v29;
      v50[2] = v20;
      v23 = v46;
      getPAMediaConversionServiceOptionRequestReasonKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v24;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CAMCameraViewController: %@"), v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50[3] = v25;
      getPAMediaConversionServiceOptionJobPriorityKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v31;
      v50[4] = &unk_1EA3B16D8;
      getPAMediaConversionServiceOptionScaleFactorKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v32;
      v50[5] = &unk_1EA3B16C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v45, 6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
LABEL_22:
    -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:].cold.1();
    __break(1u);
  }
  if (a4 != 2)
  {
    v26 = 0;
    goto LABEL_21;
  }
  getPAMediaConversionServiceOptionAdjustmentInformationKey();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v20;
  v52[0] = v34;
  getPAMediaConversionServiceOptionApplyOrientationTransformKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v21;
  v52[1] = MEMORY[0x1E0C9AAB0];
  getPAMediaConversionServiceOptionRequestReasonKey();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v22;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CAMCameraViewController: %@"), v35);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v52[2] = v23;
  getPAMediaConversionServiceOptionJobPriorityKey();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v24;
  v52[3] = &unk_1EA3B16D8;
  getPAMediaConversionServiceOptionScaleFactorKey();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v25;
  v52[4] = &unk_1EA3B16C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_21:
  return v26;
}

- (void)_renderLivePhotoWithCoordinator:(id)a3 specifiers:(unint64_t)a4 photoProperties:(id)a5 videoProperties:(id)a6 adjustments:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  const __CFString *v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  CFAbsoluteTime Current;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  __CFString *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  CFAbsoluteTime v64;
  unint64_t v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  __CFString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v54 = a7;
  -[CAMCameraViewController _resultProcessingQueue](self, "_resultProcessingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  v48 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerPhotoURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0D74A78];
  objc_msgSend(v16, "pathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathExtension:", v18);
  v19 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "URLByDeletingPathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v19;
  objc_msgSend(v20, "URLByAppendingPathExtension:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = v16;
  objc_msgSend(getPAMediaConversionServiceResourceURLCollectionClass(), "collectionWithMainResourceURL:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getPAMediaConversionServiceResourceURLCollectionClass(), "collectionWithMainResourceURL:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v14;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = a4;
  v49 = v24;
  v50 = v22;
  if (v24)
  {
    v25 = v24;
    v26 = (void *)MEMORY[0x1E0C99E98];
    v27 = (void *)MEMORY[0x1E0D73148];
    objc_msgSend(v24, "path");
    a4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "filteredVideoPathForRecordedLivePhotoVideoPath:", a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fileURLWithPath:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = v53;
    getPAMediaConversionResourceRoleVideoComplement();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setResourceURL:forRole:", v25, v30);

    getPAMediaConversionResourceRoleVideoComplement();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v23;
    objc_msgSend(v23, "setResourceURL:forRole:", v29, v31);

    v33 = CFSTR("live photo");
  }
  else
  {
    v32 = v23;
    v29 = 0;
    v33 = CFSTR("photo (live photo fallback)");
  }
  objc_msgSend(v12, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 2) != 0)
  {
    objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v35 = &stru_1EA3325A0;
  if ((a4 & 1) != 0)
  {
LABEL_8:
    -[__CFString stringByAppendingString:](v35, "stringByAppendingString:", CFSTR("HDR"));
    v36 = objc_claimAutoreleasedReturnValue();

    v35 = (__CFString *)v36;
  }
LABEL_9:
  if (!-[__CFString length](v35, "length"))
  {

    v35 = CFSTR("None");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("coordinator %@; %@ %@"), v34, v35, v33);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCameraViewController _mediaConversionOptionsForAdjustments:mediaType:description:](self, "_mediaConversionOptionsForAdjustments:mediaType:description:", v54, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v67 = v34;
    v68 = 2114;
    v69 = v33;
    v70 = 2114;
    v71 = v35;
    _os_log_impl(&dword_1DB760000, v37, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Rendering %{public}@ for specifier %{public}@", buf, 0x20u);
  }

  Current = CFAbsoluteTimeGetCurrent();
  -[CAMCameraViewController _imageConversionClient](self, "_imageConversionClient");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke;
  v56[3] = &unk_1EA330498;
  v64 = Current;
  v56[4] = self;
  v57 = v34;
  v58 = (__CFString *)v33;
  v59 = v48;
  v65 = v53;
  v60 = v47;
  v61 = v29;
  v62 = v21;
  v63 = v54;
  v55 = v54;
  v40 = v21;
  v41 = v29;
  v42 = v47;
  v43 = v48;
  v44 = v34;
  objc_msgSend(v39, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v50, v32, v45, v56);

}

void __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  CFAbsoluteTime v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  CFAbsoluteTime v30;

  v7 = a3;
  v8 = a4;
  v9 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "_resultProcessingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2;
  block[3] = &unk_1EA330510;
  v18 = v8;
  v28 = a2;
  v19 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v20 = v11;
  v21 = v12;
  v22 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 104);
  v23 = v13;
  v29 = v14;
  v30 = v9;
  v24 = *(id *)(a1 + 72);
  v25 = *(id *)(a1 + 80);
  v26 = v7;
  v27 = *(id *)(a1 + 88);
  v15 = v7;
  v16 = v8;
  dispatch_async(v10, block);

}

void __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 112) == 1)
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v4 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 120);
    if ((v5 & 2) != 0)
    {
      objc_msgSend(&stru_1EA3325A0, "stringByAppendingString:", CFSTR("Filtered"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v5 & 1) == 0)
      {
LABEL_12:
        if (!-[__CFString length](v6, "length"))
        {

          v6 = CFSTR("None");
        }
        v9 = *(_QWORD *)(a1 + 128);
        *(_DWORD *)buf = 138544130;
        v20 = v4;
        v21 = 2114;
        v22 = v3;
        v23 = 2114;
        v24 = v6;
        v25 = 2048;
        v26 = v9;
        _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Finished rendering %{public}@ for specifier %{public}@ (took %.3f seconds)", buf, 0x2Au);

LABEL_15:
        objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerVideoDuration"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", CFSTR("CAMCameraViewControllerLivePhotoStillDisplayTime"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = *(void **)(a1 + 56);
        v14 = *(_QWORD *)(a1 + 80);
        if (v10)
        {
          objc_msgSend(v10, "CMTimeValue");
          if (v12)
          {
LABEL_17:
            objc_msgSend(v12, "CMTimeValue");
LABEL_20:
            objc_msgSend(v13, "_clientPropertiesForLivePhotoVideoURL:duration:stillDisplayTime:error:", v14, v18, v17, *(_QWORD *)(a1 + 32));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "_clientPropertiesForPhotoProperties:withFilteredImageURL:conversionOutputInfo:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 32));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "_handlePhotoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:attemptPairingVideo:error:", v16, v15, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104), 1, *(_QWORD *)(a1 + 32));

            return;
          }
        }
        else
        {
          memset(v18, 0, sizeof(v18));
          if (v11)
            goto LABEL_17;
        }
        memset(v17, 0, sizeof(v17));
        goto LABEL_20;
      }
    }
    else
    {
      v6 = &stru_1EA3325A0;
      if ((v5 & 1) == 0)
        goto LABEL_12;
    }
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("HDR"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v8;
    goto LABEL_12;
  }
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 56), "_handlePhotoProperties:videoProperties:unfilteredPhotoProperties:unfilteredVideoProperties:assetAdjustments:attemptPairingVideo:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, 0, 0, 1, 0);
}

- (void)handleReviewButtonReleased:(id)a3
{
  void *v4;
  id v5;

  -[CAMCameraViewController presentationDelegate](self, "presentationDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "cameraViewControllerRequestedDismissal:", self);
  }
  else
  {
    -[CAMCameraViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)reviewButton
{
  CAMReviewButton *reviewButton;
  CAMReviewButton *v4;
  CAMReviewButton *v5;
  CAMReviewButton *v6;

  reviewButton = self->__reviewButton;
  if (!reviewButton)
  {
    v4 = [CAMReviewButton alloc];
    v5 = -[CAMReviewButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->__reviewButton;
    self->__reviewButton = v5;

    -[CAMReviewButton addTarget:action:forControlEvents:](self->__reviewButton, "addTarget:action:forControlEvents:", self, sel_handleReviewButtonReleased_, 64);
    reviewButton = self->__reviewButton;
  }
  return reviewButton;
}

- (CAMCreativeCameraDelegate)creativeCameraDelegate
{
  void *v2;
  void *v3;

  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creativeCameraDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMCreativeCameraDelegate *)v3;
}

- (void)setCreativeCameraDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMCameraViewController viewfinderViewController](self, "viewfinderViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCreativeCameraDelegate:", v4);

}

- (CAMCameraCaptureDelegate)captureDelegate
{
  return (CAMCameraCaptureDelegate *)objc_loadWeakRetained((id *)&self->_captureDelegate);
}

- (void)setCaptureDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_captureDelegate, a3);
}

- (CUCaptureController)captureController
{
  return self->_captureController;
}

- (CAMTimelapseController)timelapseController
{
  return self->_timelapseController;
}

- (CAMMotionController)motionController
{
  return self->_motionController;
}

- (CAMLocationController)locationController
{
  return self->_locationController;
}

- (CAMPowerController)powerController
{
  return self->_powerController;
}

- (CAMBurstController)burstController
{
  return self->_burstController;
}

- (CAMKeepAliveController)keepAliveController
{
  return self->_keepAliveController;
}

- (CAMProtectionController)protectionController
{
  return self->_protectionController;
}

- (CAMRemoteShutterController)remoteShutterController
{
  return self->_remoteShutterController;
}

- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager
{
  return self->_nebulaDaemonProxyManager;
}

- (CAMReviewButton)_reviewButton
{
  return self->__reviewButton;
}

- (OS_dispatch_queue)_resultProcessingQueue
{
  return self->__resultProcessingQueue;
}

- (NSMutableDictionary)_resultQueueStillImageResultCoordinators
{
  return self->__resultQueueStillImageResultCoordinators;
}

- (CAMThumbnailGenerator)_resultQueueThumbnailGenerator
{
  return self->__resultQueueThumbnailGenerator;
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (CAMCameraViewControllerPresentationDelegate)presentationDelegate
{
  return (CAMCameraViewControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)automaticallyManagesCameraSession
{
  return self->_automaticallyManagesCameraSession;
}

- (void)setAutomaticallyManagesCameraSession:(BOOL)a3
{
  self->_automaticallyManagesCameraSession = a3;
}

- (CAMCameraViewControllerCameraSessionDelegate)cameraSessionDelegate
{
  return (CAMCameraViewControllerCameraSessionDelegate *)objc_loadWeakRetained((id *)&self->_cameraSessionDelegate);
}

- (void)setCameraSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cameraSessionDelegate, a3);
}

- (CAMPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_destroyWeak((id *)&self->_cameraSessionDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_viewfinderViewController, 0);
  objc_storeStrong((id *)&self->__resultQueueThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__resultQueueStillImageResultCoordinators, 0);
  objc_storeStrong((id *)&self->__resultProcessingQueue, 0);
  objc_storeStrong((id *)&self->__reviewButton, 0);
  objc_storeStrong((id *)&self->_nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->_remoteShutterController, 0);
  objc_storeStrong((id *)&self->_protectionController, 0);
  objc_storeStrong((id *)&self->_keepAliveController, 0);
  objc_storeStrong((id *)&self->_burstController, 0);
  objc_storeStrong((id *)&self->_powerController, 0);
  objc_storeStrong((id *)&self->_locationController, 0);
  objc_storeStrong((id *)&self->_motionController, 0);
  objc_storeStrong((id *)&self->_timelapseController, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_destroyWeak((id *)&self->_captureDelegate);
  objc_storeStrong((id *)&self->__videoConversionClient, 0);
  objc_storeStrong((id *)&self->__imageConversionClient, 0);
}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 72), "persistenceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "CVC %{public}@: Failed to deserialize PFCameraMetadata: %{public}@", (uint8_t *)&v6, 0x16u);

}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  CAMPAMediaConversionNameForJobStatus(*(_QWORD *)(a1 + 96));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_1DB760000, v2, v3, "CVC %{public}@: Media conversion status %{public}@ rendering image to %{public}@ -- %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_6();
}

void __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  CAMPAMediaConversionNameForJobStatus(*(_QWORD *)(a1 + 112));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_1DB760000, v2, v3, "CVC %{public}@: Media conversion status %{public}@ writing filtered %{public}@ -- %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_6();
}

@end
