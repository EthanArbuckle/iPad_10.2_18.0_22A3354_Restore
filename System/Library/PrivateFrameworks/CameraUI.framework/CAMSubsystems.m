@implementation CAMSubsystems

- (CAMSubsystems)init
{
  return -[CAMSubsystems initWithLaunchOptions:](self, "initWithLaunchOptions:", MEMORY[0x1E0C9AA70]);
}

- (CAMSubsystems)initWithLaunchOptions:(id)a3
{
  id v4;
  CAMSubsystems *v5;
  id v6;
  CAMUserPreferenceOverrides *v7;
  void *v8;
  uint64_t v9;
  CAMMotionController *v10;
  CAMLocationController *v11;
  CAMPowerController *v12;
  CAMProtectionController *v13;
  CAMRemoteShutterController *v14;
  CAMBurstController *v15;
  CAMMotionController *v16;
  double v17;
  CUCaptureController *v18;
  CAMStorageController *v19;
  CAMLibrarySelectionController *v20;
  CAMTimelapseController *v21;
  CAMLibrarySelectionController *v22;
  void *v23;
  uint64_t v24;
  CAMViewfinderViewController *v25;
  CAMViewfinderViewController *viewfinderViewController;
  CAMCameraRollController *cameraRollController;
  CUCaptureController *captureController;
  CAMTimelapseController *timelapseController;
  CAMPersistenceController *persistenceController;
  CAMPersistenceController *v31;
  CAMMotionController *motionController;
  CAMLocationController *locationController;
  CAMPowerController *powerController;
  CAMBurstController *burstController;
  CAMBurstController *v36;
  CAMKeepAliveController *keepAliveController;
  CAMKeepAliveController *v38;
  CAMProtectionController *protectionController;
  CAMProtectionController *v40;
  CAMRemoteShutterController *remoteShutterController;
  CAMRemoteShutterController *v42;
  CAMLibrarySelectionController *librarySelectionController;
  CAMLibrarySelectionController *v44;
  CAMNebulaDaemonProxyManager *nebulaDaemonProxyManager;
  CAMNebulaDaemonProxyManager *v46;
  CAMIrisVideoController *irisVideoController;
  CAMSubsystems *v48;
  CAMRemoteShutterController *v50;
  CAMLocationController *v51;
  CAMPersistenceController *v52;
  CAMMotionController *v53;
  CAMLibrarySelectionController *v54;
  CAMTimelapseController *v55;
  CUCaptureController *v56;
  CAMViewfinderViewController *v57;
  CAMCameraRollController *v58;
  CAMCameraRollController *v59;
  CAMStorageController *v60;
  CAMBurstController *v61;
  CAMKeepAliveController *v62;
  CAMProtectionController *v63;
  void *v64;
  char v65;
  void *v66;
  CAMUserPreferenceOverrides *v67;
  id v68;
  CAMPowerController *v69;
  CAMPowerController *v70;
  CAMRemoteShutterController *v71;
  CAMNebulaDaemonProxyManager *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)CAMSubsystems;
  v5 = -[CAMSubsystems init](&v77, sel_init);
  if (v5)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "hasSystemTelephonyOfAnyKind"))
      v6 = -[CAMCallStatusMonitor initDisabledForLaunch]([CAMCallStatusMonitor alloc], "initDisabledForLaunch");
    else
      v6 = 0;
    v68 = v4;
    v7 = -[CAMUserPreferenceOverrides initWithLaunchOptions:]([CAMUserPreferenceOverrides alloc], "initWithLaunchOptions:", v4);
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v6;
    v67 = v7;
    v65 = objc_msgSend(v8, "readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:", v7, 0, objc_msgSend(v6, "isCallActive"), 0);
    objc_msgSend(v8, "captureConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conflictingControlConfiguration");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(CAMMotionController);
    v11 = objc_alloc_init(CAMLocationController);
    v12 = objc_alloc_init(CAMPowerController);
    v13 = objc_alloc_init(CAMProtectionController);
    v62 = objc_alloc_init(CAMKeepAliveController);
    v58 = objc_alloc_init(CAMCameraRollController);
    v14 = -[CAMRemoteShutterController initWithCaptureConfiguration:motionController:]([CAMRemoteShutterController alloc], "initWithCaptureConfiguration:motionController:", v9, v10);
    v72 = objc_alloc_init(CAMNebulaDaemonProxyManager);
    v15 = -[CAMBurstController initWithProtectionController:powerController:remoteShutterController:]([CAMBurstController alloc], "initWithProtectionController:powerController:remoteShutterController:", v13, v12, v14);
    v52 = -[CAMPersistenceController initWithLocationController:burstController:protectionController:powerController:irisVideoController:]([CAMPersistenceController alloc], "initWithLocationController:burstController:protectionController:powerController:irisVideoController:", v11, v15, v13, v12, 0);
    -[CAMBurstController setPersistenceController:](v15, "setPersistenceController:");
    +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:outputToExternalStorage:](CAMCaptureConfiguration, "captureGraphConfigurationUsingConfiguration:outputToExternalStorage:", v9, 0);
    v66 = v8;
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultZoomFactorForGraphConfiguration:captureOrientation:outputToExternalStorage:", v64, -[CAMMotionController captureOrientation](v10, "captureOrientation"), 0);
    v71 = v14;
    v50 = v14;
    v69 = v12;
    v63 = v13;
    v74 = (void *)v9;
    v16 = v10;
    v61 = v15;
    v18 = -[CUCaptureController initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:]([CUCaptureController alloc], "initWithCaptureConfiguration:zoomFactor:outputToExternalStorage:engineOptions:locationController:motionController:burstController:protectionController:powerController:irisVideoController:remoteShutterController:", v9, 0, 0, v11, v10, v15, v17, v13, v12, 0, v50);
    v19 = objc_alloc_init(CAMStorageController);
    v20 = 0;
    if (objc_msgSend(v76, "librarySelectionSupported"))
      v20 = -[CAMLibrarySelectionController initWithLocationProvider:]([CAMLibrarySelectionController alloc], "initWithLocationProvider:", v11);
    v21 = -[CAMTimelapseController initWithCaptureController:locationController:motionController:persistenceController:storageController:librarySelectionController:nebulaDaemonProxyManager:]([CAMTimelapseController alloc], "initWithCaptureController:locationController:motionController:persistenceController:storageController:librarySelectionController:nebulaDaemonProxyManager:", v18, v11, v10, v52, v19, v20, v72);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v22 = v20;
    v54 = v20;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v19;
    v24 = objc_msgSend(v23, "cam_initialLayoutStyle");

    v25 = -[CAMViewfinderViewController initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:]([CAMViewfinderViewController alloc], "initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:", v18, v74, v73, v11, v16, v21, v62, v71, v69, v58, v22, v75, v19, 0, v24,
            0);
    -[CAMRemoteShutterController setDelegate:](v71, "setDelegate:", v25);
    -[CAMTimelapseController restoreConfiguration](v21, "restoreConfiguration");
    -[CUCaptureController registerCaptureService:](v18, "registerCaptureService:", v52);
    viewfinderViewController = v5->_viewfinderViewController;
    v5->_viewfinderViewController = v25;
    v57 = v25;

    cameraRollController = v5->_cameraRollController;
    v5->_cameraRollController = v58;
    v59 = v58;

    captureController = v5->_captureController;
    v5->_captureController = v18;
    v56 = v18;

    timelapseController = v5->_timelapseController;
    v5->_timelapseController = v21;
    v55 = v21;

    persistenceController = v5->_persistenceController;
    v5->_persistenceController = v52;
    v31 = v52;

    motionController = v5->_motionController;
    v5->_motionController = v16;
    v53 = v16;

    locationController = v5->_locationController;
    v5->_locationController = v11;
    v51 = v11;

    powerController = v5->_powerController;
    v5->_powerController = v69;
    v70 = v69;

    burstController = v5->_burstController;
    v5->_burstController = v61;
    v36 = v61;

    keepAliveController = v5->_keepAliveController;
    v5->_keepAliveController = v62;
    v38 = v62;

    protectionController = v5->_protectionController;
    v5->_protectionController = v63;
    v40 = v63;

    remoteShutterController = v5->_remoteShutterController;
    v5->_remoteShutterController = v71;
    v42 = v71;

    librarySelectionController = v5->_librarySelectionController;
    v5->_librarySelectionController = v54;
    v44 = v54;

    nebulaDaemonProxyManager = v5->_nebulaDaemonProxyManager;
    v5->_nebulaDaemonProxyManager = v72;
    v46 = v72;

    irisVideoController = v5->_irisVideoController;
    v5->_irisVideoController = 0;

    v5->_configuredFromLaunchOptions = v65;
    v48 = v5;

    v4 = v68;
  }

  return v5;
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (CAMCameraRollController)cameraRollController
{
  return self->_cameraRollController;
}

- (CUCaptureController)captureController
{
  return self->_captureController;
}

- (CAMTimelapseController)timelapseController
{
  return self->_timelapseController;
}

- (CAMPersistenceController)persistenceController
{
  return self->_persistenceController;
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

- (CAMLibrarySelectionController)librarySelectionController
{
  return self->_librarySelectionController;
}

- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager
{
  return self->_nebulaDaemonProxyManager;
}

- (CAMIrisVideoController)irisVideoController
{
  return self->_irisVideoController;
}

- (BOOL)isConfiguredFromLaunchOptions
{
  return self->_configuredFromLaunchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisVideoController, 0);
  objc_storeStrong((id *)&self->_nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->_librarySelectionController, 0);
  objc_storeStrong((id *)&self->_remoteShutterController, 0);
  objc_storeStrong((id *)&self->_protectionController, 0);
  objc_storeStrong((id *)&self->_keepAliveController, 0);
  objc_storeStrong((id *)&self->_burstController, 0);
  objc_storeStrong((id *)&self->_powerController, 0);
  objc_storeStrong((id *)&self->_locationController, 0);
  objc_storeStrong((id *)&self->_motionController, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_timelapseController, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_cameraRollController, 0);
  objc_storeStrong((id *)&self->_viewfinderViewController, 0);
}

@end
