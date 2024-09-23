@implementation HUCameraController

- (void)setupTipsObserver
{
  HUCameraController *v2;

  v2 = self;
  HUCameraController.setupTipsObserver()();

}

- (void)tearDownTipsObserver
{
  HUCameraController *v2;

  v2 = self;
  HUCameraController.tearDownTipsObserver()();

}

- (void)changeUnanalyzedCameraClipTipShouldDisplayTo:(BOOL)a3
{
  int v3;
  uint64_t v4;
  HUCameraController *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = qword_1EF207798;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E600);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EF226D50);
  swift_beginAccess();
  sub_1B93ED0F4();
  swift_endAccess();
  if (v7 != v3)
  {
    swift_beginAccess();
    sub_1B93ED100();
    swift_endAccess();
  }

}

- (void)presentTip
{
  HUCameraController *v2;

  v2 = self;
  sub_1B8F3073C();

}

- (void)dismissTip
{
  HUCameraController *v2;

  v2 = self;
  sub_1B8F30B78();

}

- (HUCameraController)initWithConfiguration:(id)a3 cameraDelegate:(id)a4
{
  id v7;
  id v8;
  HUCameraController *v9;
  NSObject *v10;
  HFCameraAnalyticsCameraPlayerLaunchEvent *v11;
  HFCameraAnalyticsCameraPlayerLaunchEvent *launchEvent;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HFCameraItem *cameraItem;
  uint64_t v20;
  NAFuture *ppt_clipsLoadedFuture;
  void *v22;
  void *v23;
  AVPlayerViewController *v24;
  AVPlayerViewController *playerViewController;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HUCameraPlayerAVBehavior *v33;
  HUCameraPlayerAVBehavior *behavior;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HUCameraPlayerLiveContentViewController *v40;
  void *v41;
  uint64_t v42;
  HUCameraPlayerLiveContentViewController *liveContentViewController;
  uint64_t v44;
  HFItemManager *itemManager;
  void *v46;
  void *v47;
  void *v48;
  dispatch_queue_t v49;
  void *v50;
  uint64_t v51;
  HUCameraController *v52;
  NSObject *v53;
  id v55;
  objc_super v56;
  uint8_t buf[4];
  HUCameraController *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HUCameraController;
  v9 = -[HUCameraController init](&v56, sel_init);
  if (v9)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v9;
      v59 = 2112;
      v60 = v7;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@ init with config:%@", buf, 0x16u);
    }

    v11 = (HFCameraAnalyticsCameraPlayerLaunchEvent *)objc_alloc_init(MEMORY[0x1E0D311E0]);
    launchEvent = v9->_launchEvent;
    v9->_launchEvent = v11;

    v9->_applicationIsActive = 1;
    objc_storeWeak((id *)&v9->_cameraDelegate, v8);
    objc_storeStrong((id *)&v9->_playerConfiguration, a3);
    objc_msgSend(v7, "clipUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_needsToFetchClip = v13 != 0;

    v14 = objc_alloc(MEMORY[0x1E0D31228]);
    objc_msgSend(v7, "cameraProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_characteristicValueManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "initWithProfile:valueSource:", v15, v17);
    cameraItem = v9->_cameraItem;
    v9->_cameraItem = (HFCameraItem *)v18;

    v20 = objc_opt_new();
    ppt_clipsLoadedFuture = v9->_ppt_clipsLoadedFuture;
    v9->_ppt_clipsLoadedFuture = (NAFuture *)v20;

    objc_msgSend(v7, "playerViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v24 = v22;
    else
      v24 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E0C8B448]);
    playerViewController = v9->_playerViewController;
    v9->_playerViewController = v24;

    -[AVPlayerViewController setModalPresentationStyle:](v9->_playerViewController, "setModalPresentationStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController view](v9->_playerViewController, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v26);

    if (!-[AVPlayerViewController isReadyForDisplay](v9->_playerViewController, "isReadyForDisplay")
      && !-[HUCameraController isObservingReadyForDisplay](v9, "isObservingReadyForDisplay"))
    {
      -[HUCameraController setObservingReadyForDisplay:](v9, "setObservingReadyForDisplay:", 1);
      -[HUCameraController playerViewController](v9, "playerViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:forKeyPath:options:context:", v9, CFSTR("readyForDisplay"), 0, HUCameraControllerReadyForDisplayContext);

      -[HUCameraController playerViewController](v9, "playerViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObserver:forKeyPath:options:context:", v9, CFSTR("videoBounds"), 0, HUCameraControllerReadyForDisplayContext);

      -[HUCameraController playerViewController](v9, "playerViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "customControlsView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObserver:forKeyPath:options:context:", v9, CFSTR("bounds"), 0, HUCameraControllerReadyForDisplayContext);

      -[HUCameraController volumeControlView](v9, "volumeControlView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObserver:forKeyPath:options:context:", v9, CFSTR("bounds"), 3, HUCameraControllerReadyForDisplayContext);

    }
    v33 = -[HUCameraPlayerAVBehavior initWithDelegate:]([HUCameraPlayerAVBehavior alloc], "initWithDelegate:", v9);
    behavior = v9->_behavior;
    v9->_behavior = v33;

    -[HUCameraController playerViewController](v9, "playerViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addBehavior:", v9->_behavior);

    -[AVHomeIPCameraBehavior behaviorContext](v9->_behavior, "behaviorContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPlaybackControlsIncludeTransportControls:", 0);

    -[AVHomeIPCameraBehavior behaviorContext](v9->_behavior, "behaviorContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPlaybackControlsIncludeDisplayModeControls:", 1);

    -[AVHomeIPCameraBehavior behaviorContext](v9->_behavior, "behaviorContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setZoomingEnabled:", 1);

    -[HUCameraController updatePIPBehaviorForDeviceAndConfiguration](v9, "updatePIPBehaviorForDeviceAndConfiguration");
    -[HUCameraController playerViewController](v9, "playerViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAllowsEnteringFullScreen:", 0);

    -[HUCameraController _setupPlaybackEngine:](v9, "_setupPlaybackEngine:", v7);
    -[HUCameraController _updateRecordedClipInterfaceAvailabilityWithAnimation:](v9, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 0);
    -[HUCameraController loadControlItemsOnInit](v9, "loadControlItemsOnInit");
    -[HUCameraController loadAccessoryViewControllersOnInit](v9, "loadAccessoryViewControllersOnInit");
    v40 = [HUCameraPlayerLiveContentViewController alloc];
    -[HUCameraController playbackEngine](v9, "playbackEngine");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[HUCameraPlayerLiveContentViewController initWithPlaybackEngine:](v40, "initWithPlaybackEngine:", v41);
    liveContentViewController = v9->_liveContentViewController;
    v9->_liveContentViewController = (HUCameraPlayerLiveContentViewController *)v42;

    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:sourceItem:", v9, v9->_cameraItem);
    itemManager = v9->_itemManager;
    v9->_itemManager = (HFItemManager *)v44;

    -[HUCameraController playerViewController](v9, "playerViewController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setDelegate:", v9);

    -[HUCameraController playerViewController](v9, "playerViewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setUpdatesNowPlayingInfoCenter:", 0);

    -[HUCameraController loadTimelapsePlayer](v9, "loadTimelapsePlayer");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:object:", v9, sel_handleShouldDifferentiateWithoutColorDidChange, *MEMORY[0x1E0CEB0B8], 0);
    objc_msgSend(v48, "addObserver:selector:name:object:", v9, sel_handleSceneWillDeactivate_, *MEMORY[0x1E0CEBB68], 0);
    objc_msgSend(v48, "addObserver:selector:name:object:", v9, sel_handleSceneDidActivate_, *MEMORY[0x1E0CEBB40], 0);
    v49 = dispatch_queue_create("com.apple.Home.HUCameraController.AudioSessionQueue", 0);
    -[HUCameraController setAudioSessionQueue:](v9, "setAudioSessionQueue:", v49);

    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x1E0C89690];
    v55 = 0;
    objc_msgSend(v50, "setCategory:error:", v51, &v55);
    v52 = (HUCameraController *)v55;

    if (v52)
    {
      HFLogForCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v52;
        _os_log_error_impl(&dword_1B8E1E000, v53, OS_LOG_TYPE_ERROR, "Unable to properly set audio playback session with error: %@", buf, 0xCu);
      }

    }
    else
    {
      -[HUCameraController enableAudioSession](v9, "enableAudioSession");
    }
    -[HUCameraController updateVolumeControlVisibility](v9, "updateVolumeControlVisibility");
    -[HUCameraController setPipState:](v9, "setPipState:", 0);

  }
  return v9;
}

- (void)loadControlItemsOnInit
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B408]), "initWithTitle:type:", CFSTR("Settings"), 0);
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_settingsImageUsingStandardSymbolConfiguration:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __44__HUCameraController_loadControlItemsOnInit__block_invoke;
  v9 = &unk_1E6F4DD08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setAction:", &v6);
  objc_msgSend(v3, "addObject:", v4, v6, v7, v8, v9);
  -[AVPlayerViewController setCustomControlItems:](self->_playerViewController, "setCustomControlItems:", v3);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __44__HUCameraController_loadControlItemsOnInit__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "presentSettingsViewController");

}

- (void)loadAccessoryViewControllersOnInit
{
  HUCameraBlurViewController *v3;
  HUCameraBlurViewController *blurViewController;
  void *v5;
  void *v6;
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
  HUCameraPlayerAccessoryViewController *v17;
  void *v18;
  HUCameraPlayerAccessoryViewController *v19;
  HUCameraPlayerAccessoryViewController *accessoryViewController;
  HUCameraPlayerPlaceholderContentViewController *v21;
  void *v22;
  HUCameraPlayerPlaceholderContentViewController *v23;
  HUCameraPlayerPlaceholderContentViewController *placeholderContentViewController;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
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
  id v111;

  v3 = objc_alloc_init(HUCameraBlurViewController);
  blurViewController = self->_blurViewController;
  self->_blurViewController = v3;

  -[HUCameraBlurViewController view](self->_blurViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[HUCameraController playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[HUCameraBlurViewController view](self->_blurViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [HUCameraPlayerAccessoryViewController alloc];
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HUCameraPlayerAccessoryViewController initWithPlaybackEngine:](v17, "initWithPlaybackEngine:", v18);
  accessoryViewController = self->_accessoryViewController;
  self->_accessoryViewController = v19;

  v21 = [HUCameraPlayerPlaceholderContentViewController alloc];
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HUCameraPlayerPlaceholderContentViewController initWithPlaybackEngine:](v21, "initWithPlaybackEngine:", v22);
  placeholderContentViewController = self->_placeholderContentViewController;
  self->_placeholderContentViewController = v23;

  -[HUCameraPlayerPlaceholderContentViewController view](self->_placeholderContentViewController, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAutoresizingMask:", 18);

  -[HUCameraController playerViewController](self, "playerViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentOverlayView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[HUCameraPlayerPlaceholderContentViewController view](self->_placeholderContentViewController, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  -[HUCameraController playerViewController](self, "playerViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addChildViewController:", v38);

  -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "didMoveToParentViewController:", v40);

  -[HUCameraController playerViewController](self, "playerViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addChildViewController:", v42);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "didMoveToParentViewController:", v44);

  -[HUCameraController playerViewController](self, "playerViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController blurViewController](self, "blurViewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addChildViewController:", v46);

  -[HUCameraController blurViewController](self, "blurViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "didMoveToParentViewController:", v48);

  -[HUCameraController playerViewController](self, "playerViewController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "contentOverlayView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController blurViewController](self, "blurViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addSubview:", v52);

  -[HUCameraController loadingOverlayView](self, "loadingOverlayView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setLoadingOverlayView:", v53);

  -[HUCameraController playerViewController](self, "playerViewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "contentOverlayView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController loadingOverlayView](self, "loadingOverlayView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", v57);

  -[HUCameraController playerViewController](self, "playerViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "customControlsView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", v61);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bounds");
  objc_msgSend(v66, "constraintEqualToConstant:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController setAccessoryViewWidthConstraint:](self, "setAccessoryViewWidthConstraint:", v70);

  -[HUCameraController accessoryViewWidthConstraint](self, "accessoryViewWidthConstraint");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setActive:", 1);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "view");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bounds");
  objc_msgSend(v74, "constraintEqualToConstant:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController setAccessoryViewHeightConstraint:](self, "setAccessoryViewHeightConstraint:", v78);

  -[HUCameraController accessoryViewHeightConstraint](self, "accessoryViewHeightConstraint");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setActive:", 1);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "centerXAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "customControlsView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "centerXAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setActive:", 1);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "centerYAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "customControlsView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "centerYAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setActive:", 1);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "view");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "customControlsView");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "topAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setActive:", 1);

  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "customControlsView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "bottomAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setActive:", 1);

  -[HUCameraController playerViewController](self, "playerViewController");
  v111 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "contentOverlayView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "view");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addSubview:", v110);

}

- (void)loadTimelapsePlayer
{
  void *v3;
  void *v4;
  void *v5;
  HUCameraTimelapseController *v6;
  void *v7;
  HUCameraTimelapseController *v8;
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

  -[HUCameraController cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clipManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31278], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipManager:", v4);

  v6 = [HUCameraTimelapseController alloc];
  -[HUCameraController cameraProfile](self, "cameraProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUCameraTimelapseController initWithCameraProfile:](v6, "initWithCameraProfile:", v7);
  -[HUCameraController setTimelapseController:](self, "setTimelapseController:", v8);

  -[HUCameraController playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customControlsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController timelapseController](self, "timelapseController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", v13);

  -[HUCameraController playerViewController](self, "playerViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "customControlsView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController timelapseController](self, "timelapseController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSublayer:", v17);

}

- (void)loadDependentViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
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
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  HUCameraRecordingPlayerView *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
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
  _QWORD v73[4];
  uint8_t buf[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[HUCameraController addFooterViewController](self, "addFooterViewController");
  -[HUCameraController configureCalendarContainerViewControllerIfNeeded](self, "configureCalendarContainerViewControllerIfNeeded");
  -[HUCameraController _updateRecordedClipInterfaceAvailabilityWithAnimation:](self, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 0);
  -[HUCameraController addCameraStatusOverlayAndPicker](self, "addCameraStatusOverlayAndPicker");
  -[HUCameraController updatePlaceholderContent](self, "updatePlaceholderContent");
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController updateStateForPlaybackPosition:animated:](self, "updateStateForPlaybackPosition:animated:", v4, 0);

  -[HUCameraController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[HUCameraController playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customControlsView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[HUCameraController cameraProfile](self, "cameraProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "hf_supportsBidirectionalAudio");

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9)
  {
    if (v13)
    {
      -[HUCameraController cameraProfile](self, "cameraProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v75 = v16;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Display microphone control for %@.", buf, 0xCu);

    }
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isMicrophoneEnabled");
    -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTalking:", v18);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v12 = objc_claimAutoreleasedReturnValue();
    v20 = -[NSObject isMicrophoneEnabled](v12, "isMicrophoneEnabled");
    -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTalking:", v20);

  }
  else if (v13)
  {
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accessory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v75 = v24;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Hide microphone control for %@.", buf, 0xCu);

  }
  -[HUCameraController setupConstraintSets](self, "setupConstraintSets");
  -[HUCameraController updateMicrophoneControls](self, "updateMicrophoneControls");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUCameraController accessoryViewController](self, "accessoryViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 1);

    -[HUCameraController blurViewController](self, "blurViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 1);

    -[HUCameraController playerViewController](self, "playerViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController dayLabel](self, "dayLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v31);

    -[HUCameraController playerViewController](self, "playerViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController timeLabel](self, "timeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v34);

    -[HUCameraController demoPlayerView](self, "demoPlayerView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      v36 = (void *)MEMORY[0x1E0D31368];
      -[HUCameraController cameraProfile](self, "cameraProfile");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accessory");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "demoLiveStreamURLForCameraName:", v39);
      v40 = objc_claimAutoreleasedReturnValue();

      v72 = (void *)v40;
      objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", v40);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = objc_alloc_init(MEMORY[0x1E0C8B350]);
      -[HUCameraController setDemoModeQueuePlayer:](self, "setDemoModeQueuePlayer:", v42);
      v71 = (void *)v41;
      objc_msgSend(MEMORY[0x1E0C8B338], "playerLooperWithPlayer:templateItem:", v42, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraController setLooper:](self, "setLooper:", v43);

      v70 = v42;
      v44 = -[HUCameraRecordingPlayerView initWithPlayer:displayingProgressView:]([HUCameraRecordingPlayerView alloc], "initWithPlayer:displayingProgressView:", v42, 0);
      -[HUCameraController setDemoPlayerView:](self, "setDemoPlayerView:", v44);

      -[HUCameraController playerViewController](self, "playerViewController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "contentOverlayView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraController demoPlayerView](self, "demoPlayerView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addSubview:", v47);

      -[HUCameraController demoPlayerView](self, "demoPlayerView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v47) = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
      -[HUCameraController playerViewController](self, "playerViewController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if ((_DWORD)v47)
      {
        objc_msgSend(v50, "safeAreaLayoutGuide");
        v52 = objc_claimAutoreleasedReturnValue();

        v51 = (void *)v52;
      }

      -[HUCameraController playerViewController](self, "playerViewController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "contentOverlayView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v54, "topAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "topAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v68);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v67;
      objc_msgSend(v54, "bottomAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bottomAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v65);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v63;
      objc_msgSend(v54, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v73[2] = v57;
      objc_msgSend(v54, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "trailingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v73[3] = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "activateConstraints:", v61);

    }
  }
  -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "layoutIfNeeded");

}

- (void)addCameraStatusOverlayAndPicker
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  NSObject *v24;
  id v25;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController setCameraPickerButton:](self, "setCameraPickerButton:", v3);

  -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", CFSTR(" "), 0);

  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[HUCameraController playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "customControlsView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "naui_addAutoLayoutSubview:", v20);

  if (-[HUCameraController homeHasMultipleCameraProfiles](self, "homeHasMultipleCameraProfiles"))
  {
    -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContextMenuInteractionEnabled:", 1);

    -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShowsMenuAsPrimaryAction:", 1);

    -[HUCameraController cameraPickerMenu](self, "cameraPickerMenu");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraPickerButton](self, "cameraPickerButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMenu:", v25);

  }
  else
  {
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "Not showing camera picker for single camera", buf, 2u);
    }

  }
}

- (void)loadAuxilliaryViews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[HUCameraController hasRecordedClips](self, "hasRecordedClips"))
  {
    -[HUCameraController dayLabel](self, "dayLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v5 = v4;

    if (v5 < 1.0)
    {
      -[HUCameraController dayLabel](self, "dayLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 1.0);

      -[HUCameraController timeLabel](self, "timeLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", 1.0);

      -[HUCameraController dayLabelBottomConstraint](self, "dayLabelBottomConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConstant:", 120.0);

    }
  }
  -[HUCameraController updatePlaceholderContent](self, "updatePlaceholderContent");
  if (-[HUCameraController shouldAutoPlayOnViewAppearance](self, "shouldAutoPlayOnViewAppearance"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Autoplaying playback engine on viewWillAppear:.", buf, 2u);
    }

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
    {
      -[HUCameraController toggleDemoModeLiveStreamVideo:](self, "toggleDemoModeLiveStreamVideo:", 1);
      -[HUCameraController demoPlayerView](self, "demoPlayerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraController demoPlayerView](self, "demoPlayerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bringSubviewToFront:", v12);

    }
    else
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "play");
    }

  }
  -[HUCameraController setViewVisible:](self, "setViewVisible:", 1);
  -[HUCameraController updateMicrophoneControls](self, "updateMicrophoneControls");
  if (-[HUCameraController needsToFetchClip](self, "needsToFetchClip"))
    -[HUCameraController fetchRequestedClipUsingConfiguration](self, "fetchRequestedClipUsingConfiguration");
  v13 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HUCameraController_loadAuxilliaryViews__block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  dispatch_after(v13, MEMORY[0x1E0C80D38], block);
}

void __41__HUCameraController_loadAuxilliaryViews__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "did attempt to flash", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flashPlaybackControlsWithDuration:", 1.79769313e308);

}

- (void)_setupPlaybackEngine:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31248]);
    -[HUCameraController home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithHome:cameraProfile:", v7, v8);

    -[HUCameraController behavior](self, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipScrubber:", v9);

    -[HUCameraController playerConfiguration](self, "playerConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startingPlaybackDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0D31258];
      -[HUCameraController playerConfiguration](self, "playerConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startingPlaybackDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clipPositionWithDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPlaybackPosition:", v15);

    }
    v16 = objc_alloc_init(MEMORY[0x1E0D31240]);
    -[HUCameraController setPlaybackEngine:](self, "setPlaybackEngine:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0D31250]);
    objc_msgSend(v17, "setPeriodicTimeUpdateInterval:", &unk_1E7043678);
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:withOptions:", self, v17);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateConfiguration:", v5);

    -[HUCameraController cameraProfile](self, "cameraProfile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "hf_supportsRecordingEvents") & 1) != 0)
    {

    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled");

      if ((v21 & 1) == 0)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    -[HUCameraController playerConfiguration](self, "playerConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "clipUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[HUCameraController playerConfiguration](self, "playerConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "clipUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraController displayTimelineForClipUUID:](self, "displayTimelineForClipUUID:", v25);

    }
    else
    {
      -[HUCameraController _reloadClipsWithUpdate:](self, "_reloadClipsWithUpdate:", 1);
    }
    goto LABEL_11;
  }
  objc_msgSend(v26, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController setPlaybackEngine:](self, "setPlaybackEngine:", v5);
LABEL_12:

}

- (id)home
{
  void *v2;
  void *v3;

  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cameraProfile
{
  void *v2;
  void *v3;

  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasRecordedClips
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    return 1;
  -[HUCameraController cameraProfile](self, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_supportsRecordingEvents"))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraClips");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (AVHomeLoadingButtonControlItem)nextControlItem
{
  AVHomeLoadingButtonControlItem *nextControlItem;
  id v4;
  void *v5;
  AVHomeLoadingButtonControlItem *v6;
  AVHomeLoadingButtonControlItem *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  nextControlItem = self->_nextControlItem;
  if (!nextControlItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0C8B418]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraNextText"), CFSTR("HUCameraNextText"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AVHomeLoadingButtonControlItem *)objc_msgSend(v4, "initWithTitle:type:", v5, 1);
    v7 = self->_nextControlItem;
    self->_nextControlItem = v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVHomeLoadingButtonControlItem setTintColor:](self->_nextControlItem, "setTintColor:", v8);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVHomeLoadingButtonControlItem setTitleFont:](self->_nextControlItem, "setTitleFont:", v9);

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__HUCameraController_nextControlItem__block_invoke;
    v11[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v12, &location);
    -[AVHomeLoadingButtonControlItem setAction:](self->_nextControlItem, "setAction:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    nextControlItem = self->_nextControlItem;
  }
  return nextControlItem;
}

void __37__HUCameraController_nextControlItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HUCameraController_nextControlItem__block_invoke_2;
  block[3] = &unk_1E6F4D988;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(WeakRetained, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  objc_msgSend(WeakRetained, "clipScrubberViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __37__HUCameraController_nextControlItem__block_invoke_3;
  v5[3] = &unk_1E6F4D988;
  v5[4] = WeakRetained;
  objc_msgSend(v4, "exportCurrentClipWithCompletion:", v5);

}

void __37__HUCameraController_nextControlItem__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "nextControlItem");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowsLoadingIndicator:", 1);

}

void __37__HUCameraController_nextControlItem__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Handing off export to sharekit.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HUCameraController_nextControlItem__block_invoke_101;
  block[3] = &unk_1E6F4D988;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__HUCameraController_nextControlItem__block_invoke_101(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "nextControlItem");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setShowsLoadingIndicator:", 0);

}

- (void)setViewVisible:(BOOL)a3
{
  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    -[HUCameraController updateCanShowOverlayState](self, "updateCanShowOverlayState");
  }
}

- (void)setEnteringFullScreen:(BOOL)a3
{
  if (self->_enteringFullScreen != a3)
  {
    self->_enteringFullScreen = a3;
    -[HUCameraController updateCanShowOverlayState](self, "updateCanShowOverlayState");
  }
}

- (id)ppt_clipCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_243);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clipCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __44__HUCameraController_ppt_clipCollectionView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)cameraStatusViewConstantForTraitCollection
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;

  -[HUCameraController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hu_hasExtendedWidth");

  if (v5)
    v6 = 0.0;
  else
    v6 = 47.0;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playbackPosition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    v6 = v6 + 10.0;
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasRecordingEvents");

    if (v12)
      return v6 + 47.0;
  }
  return v6;
}

- (void)setupConstraintSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;

  objc_initWeak(&location, self);
  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "volumeControlsAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController setCameraStatusViewTopConstraint:](self, "setCameraStatusViewTopConstraint:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D51A18]);
  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __41__HUCameraController_setupConstraintSets__block_invoke;
  v29[3] = &unk_1E6F5BDB8;
  objc_copyWeak(&v30, &location);
  v13 = (void *)objc_msgSend(v10, "initWithOwningView:constraintBuilder:", v11, v29);
  -[HUCameraController setCameraStatusViewConstraintSet:](self, "setCameraStatusViewConstraintSet:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D51A18]);
  -[HUCameraController playerViewController](self, "playerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v12;
  v27[1] = 3221225472;
  v27[2] = __41__HUCameraController_setupConstraintSets__block_invoke_2;
  v27[3] = &unk_1E6F5BDB8;
  objc_copyWeak(&v28, &location);
  v17 = (void *)objc_msgSend(v14, "initWithOwningView:constraintBuilder:", v16, v27);
  -[HUCameraController setPortraitMicrophoneConstraintSet:](self, "setPortraitMicrophoneConstraintSet:", v17);

  v18 = objc_alloc(MEMORY[0x1E0D51A18]);
  -[HUCameraController playerViewController](self, "playerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  v23 = 3221225472;
  v24 = __41__HUCameraController_setupConstraintSets__block_invoke_3;
  v25 = &unk_1E6F5BDB8;
  objc_copyWeak(&v26, &location);
  v21 = (void *)objc_msgSend(v18, "initWithOwningView:constraintBuilder:", v20, &v22);
  -[HUCameraController setLandscapeMicrophoneConstraintSet:](self, "setLandscapeMicrophoneConstraintSet:", v21, v22, v23, v24, v25);

  -[HUCameraController addFooterConstraints](self, "addFooterConstraints");
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

id __41__HUCameraController_setupConstraintSets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
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

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customControlsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "cameraStatusViewTopConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    objc_msgSend(v3, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToConstant:", 47.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

    objc_msgSend(WeakRetained, "cameraStatusViewTopConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constant");
    v14 = v13;

    if (v14 <= 0.0)
    {
      objc_msgSend(v3, "leadingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unobscuredTopAreaLayoutGuide");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v24);

      objc_msgSend(v3, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unobscuredTopAreaLayoutGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v20);
    }
    else
    {
      objc_msgSend(v3, "centerXAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerXAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v17);

      objc_msgSend(v3, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "animatedUnobscuredCenterAreaLayoutGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v25);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

id __41__HUCameraController_setupConstraintSets__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "portraitMicrophoneControl");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "playerViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "customControlsView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v26 = v6;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  objc_msgSend(WeakRetained, "playbackEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v21, "hasRecordingEvents");
  if (v20
    && (objc_msgSend(WeakRetained, "timeLabel"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "superview"),
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = (void *)v7;
    objc_msgSend(WeakRetained, "portraitMicrophoneControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "timeLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", -16.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "portraitMicrophoneControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "footerViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "portraitMicrophoneOverlapOffset");
    objc_msgSend(v1, "constraintEqualToAnchor:constant:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v11 = 0;
    v10 = 1;
  }
  v28[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  if (v11)
  {

  }
  if (v20)
  {

  }
  return v12;
}

id __41__HUCameraController_setupConstraintSets__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "shouldDisplayLandscapeMicrophoneInLine");
  objc_msgSend(WeakRetained, "landscapeMicrophoneControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "volumeControlsAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v7, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v9, -16.0);
  }
  else
  {
    objc_msgSend(v7, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1132068864;
  objc_msgSend(v10, "setPriority:", v11);
  v12 = objc_msgSend(WeakRetained, "shouldDisplayLandscapeMicrophoneInLine");
  objc_msgSend(WeakRetained, "landscapeMicrophoneControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "volumeControlView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  }
  else
  {
    objc_msgSend(v13, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "volumeControlView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 20.0);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)addFooterConstraints
{
  void *v3;
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
  id v30;

  -[HUCameraController footerViewController](self, "footerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 44.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[HUCameraController footerViewController](self, "footerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customControlsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unobscuredCenterAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HUCameraController footerViewController](self, "footerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "customControlsView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unobscuredCenterAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HUCameraController footerViewController](self, "footerViewController");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "customControlsView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "transportControlsAreaLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUCameraController cameraStatusViewConstraintSet](self, "cameraStatusViewConstraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateIfNeeded");

  -[HUCameraController scrubberConstraintSet](self, "scrubberConstraintSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateIfNeeded");

  -[HUCameraController calendarConstraintSet](self, "calendarConstraintSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateIfNeeded");

  if (-[HUCameraController shouldDisplayMicrophoneControl](self, "shouldDisplayMicrophoneControl"))
  {
    -[HUCameraController portraitMicrophoneConstraintSet](self, "portraitMicrophoneConstraintSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateIfNeeded");

    -[HUCameraController landscapeMicrophoneConstraintSet](self, "landscapeMicrophoneConstraintSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateIfNeeded");

  }
}

- (void)configureClipScrubberViewControllerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUCameraController configureClipScrubberViewController](self, "configureClipScrubberViewController");
    -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackPosition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackEngine:didUpdatePlaybackPosition:", v4, v6);

  }
}

- (void)configureClipScrubberViewController
{
  HUClipScrubberViewController *v3;
  void *v4;
  HUClipScrubberViewController *v5;
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
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HUDiagnosticsCameraPlayerController *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HUDiagnosticsCameraPlayerController *v54;
  id *v55;
  id *v56;
  id *v57;
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
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  id location;
  _QWORD v93[8];

  v93[6] = *MEMORY[0x1E0C80C00];
  v3 = [HUClipScrubberViewController alloc];
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUClipScrubberViewController initWithPlaybackEngine:](v3, "initWithPlaybackEngine:", v4);
  -[HUCameraController setClipScrubberViewController:](self, "setClipScrubberViewController:", v5);

  objc_initWeak(&location, self);
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke;
  v90[3] = &unk_1E6F4DD08;
  v55 = &v91;
  objc_copyWeak(&v91, &location);
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryButtonHandler:", v90);

  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke_2;
  v88[3] = &unk_1E6F4DD08;
  v56 = &v89;
  objc_copyWeak(&v89, &location);
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBeginEditingHandler:", v88);

  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke_4;
  v86[3] = &unk_1E6F4DD08;
  v57 = &v87;
  objc_copyWeak(&v87, &location);
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEndEditingHandler:", v86);

  -[HUCameraController playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customControlsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController dayLabel](self, "dayLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[HUCameraController playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customControlsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController timeLabel](self, "timeLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[HUCameraController playerViewController](self, "playerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addChildViewController:", v16);

  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCameraController playerViewController](self, "playerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "customControlsView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v22);

  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didMoveToParentViewController:", v24);

  -[HUCameraController dayLabel](self, "dayLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v29, 120.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController setDayLabelBottomConstraint:](self, "setDayLabelBottomConstraint:", v30);

  -[HUCameraController dayLabelBottomConstraint](self, "dayLabelBottomConstraint");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v83;
  -[HUCameraController dayLabel](self, "dayLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leftAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "customControlsView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "safeAreaLayoutGuide");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "leftAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v76;
  -[HUCameraController dayLabel](self, "dayLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "rightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "customControlsView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "safeAreaLayoutGuide");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rightAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v69;
  -[HUCameraController timeLabel](self, "timeLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "lastBaselineAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController dayLabel](self, "dayLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "lastBaselineAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, -23.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v64;
  -[HUCameraController timeLabel](self, "timeLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leftAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "customControlsView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "safeAreaLayoutGuide");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leftAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v32;
  -[HUCameraController timeLabel](self, "timeLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerViewController](self, "playerViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "customControlsView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v93[5] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v58);
  v40 = objc_alloc(MEMORY[0x1E0D51A18]);
  -[HUCameraController playerViewController](self, "playerViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke_5;
  v84[3] = &unk_1E6F5BDB8;
  objc_copyWeak(&v85, &location);
  v43 = (void *)objc_msgSend(v40, "initWithOwningView:constraintBuilder:", v42, v84);
  -[HUCameraController setScrubberConstraintSet:](self, "setScrubberConstraintSet:", v43);

  -[HUCameraController scrubberConstraintSet](self, "scrubberConstraintSet");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateIfNeeded");

  -[HUCameraController playerViewController](self, "playerViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "customControlsView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutIfNeeded");

  if (objc_msgSend(MEMORY[0x1E0D31288], "shouldDisplayInternalViews"))
  {
    v47 = [HUDiagnosticsCameraPlayerController alloc];
    -[HUCameraController playerViewController](self, "playerViewController", &v91, &v89, &v87);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dataSource");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "cameraProfile");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[HUDiagnosticsCameraPlayerController initWithCameraPlayerViewController:playbackEngine:clipScrubberDataSource:cameraProfile:](v47, "initWithCameraPlayerViewController:playbackEngine:clipScrubberDataSource:cameraProfile:", v48, v49, v51, v53);
    -[HUCameraController setDiagnosticsController:](self, "setDiagnosticsController:", v54);

  }
  objc_destroyWeak(&v85);

  objc_destroyWeak(v57);
  objc_destroyWeak(v56);
  objc_destroyWeak(v55);
  objc_destroyWeak(&location);
}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentNearbyAccessoriesViewController");

}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cameraStatusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  v4 = objc_alloc(MEMORY[0x1E0C8B408]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraCancelText"), CFSTR("HUCameraCancelText"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:type:", v5, 0);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleFont:", v7);

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __57__HUCameraController_configureClipScrubberViewController__block_invoke_3;
  v25 = &unk_1E6F4DD08;
  objc_copyWeak(&v26, v1);
  objc_msgSend(v6, "setAction:", &v22);
  objc_msgSend(WeakRetained, "behavior", v22, v23, v24, v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behaviorContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaybackControlsIncludeVolumeControls:", 0);

  objc_msgSend(WeakRetained, "behavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "behaviorContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaybackControlsIncludeDisplayModeControls:", 0);

  objc_msgSend(WeakRetained, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behaviorContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "nextControlItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:forContainerOfControlItem:", v14, v15);

  objc_msgSend(WeakRetained, "playerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customControlItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setSavedControlItems:", v17);

  v27[0] = v6;
  objc_msgSend(WeakRetained, "nextControlItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "playerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCustomControlItems:", v19);

  objc_msgSend(WeakRetained, "calendarContainerViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIsEditing:", 1);

  objc_destroyWeak(&v26);
}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clipScrubberViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissEditInterface");

}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissEditInterface");

}

id __57__HUCameraController_configureClipScrubberViewController__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v34[6];

  v34[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clipScrubberViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "clipScrubberViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", 120.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v29;
    objc_msgSend(WeakRetained, "clipScrubberViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "customControlsView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "unobscuredCenterAreaLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v21;
    objc_msgSend(WeakRetained, "clipScrubberViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "customControlsView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transportControlsAreaLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v4;
    objc_msgSend(WeakRetained, "clipScrubberViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customControlsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unobscuredCenterAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v33;
}

- (void)_updateRecordedClipInterfaceAvailabilityWithAnimation:(BOOL)a3
{
  int v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  _QWORD v11[5];
  char v12;
  BOOL v13;
  uint8_t buf[16];

  if (!-[HUCameraController applicationIsActive](self, "applicationIsActive"))
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Application is not active. Bypassing scrubber UI update.";
LABEL_15:
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_16:

    return;
  }
  v5 = -[HUCameraController recordedClipInterfaceAvailable](self, "recordedClipInterfaceAvailable");
  if (-[HUCameraController hasRecordedClips](self, "hasRecordedClips")
    && -[HUCameraController finishedFetchingCameraEvents](self, "finishedFetchingCameraEvents"))
  {
    -[HUCameraController playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isViewLoaded");

  }
  else
  {
    v7 = 0;
  }
  if (!-[HUCameraController finishedFetchingCameraEvents](self, "finishedFetchingCameraEvents"))
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Timeline will not appear until initial clip fetch has been completed.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v5 != v7)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Finished clip prep. Safe to update UI.", buf, 2u);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke;
    v11[3] = &unk_1E6F5D298;
    v11[4] = self;
    v12 = v7;
    v13 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
  }
}

void __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  char v15;
  _QWORD aBlock[5];

  objc_msgSend(*(id *)(a1 + 32), "setRecordedClipInterfaceAvailable:", *(unsigned __int8 *)(a1 + 40));
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "configureClipScrubberViewControllerIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "configureCalendarContainerViewControllerIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "scrubberConstraintSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "calendarConstraintSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "portraitMicrophoneConstraintSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "landscapeMicrophoneConstraintSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "updateViewConstraints");
  }
  objc_msgSend(*(id *)(a1 + 32), "cameraStatusView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateStatusForPlaybackEngine:", v7);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2;
  aBlock[3] = &unk_1E6F4E300;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v9 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateConstraintsIfNeeded");

  if (*(_BYTE *)(a1 + 41))
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3;
    v13[3] = &unk_1E6F5D270;
    v14 = v9;
    v15 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v12, "animateWithDuration:animations:", v13, 0.3);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v9 + 2))(v9, *(unsigned __int8 *)(a1 + 40));
  }

}

void __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((_DWORD)a2)
    v4 = 47.0;
  else
    v4 = 120.0;
  objc_msgSend(*(id *)(a1 + 32), "dayLabelBottomConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  objc_msgSend(*(id *)(a1 + 32), "dayLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "updateCalendarContainerVisibility:", a2);
  objc_msgSend(*(id *)(a1 + 32), "clipScrubberViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", (double)a2);

  objc_msgSend(*(id *)(a1 + 32), "footerViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", a2);

}

uint64_t __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)displayTimelineForClipUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController playerConfiguration](self, "playerConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Fetch clip with UUID:%@", buf, 0xCu);

  }
  -[HUCameraController setNeedsToFetchClip:](self, "setNeedsToFetchClip:", 0);
  objc_initWeak((id *)buf, self);
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HUCameraController_displayTimelineForClipUUID___block_invoke;
  v10[3] = &unk_1E6F5D2C0;
  objc_copyWeak(&v12, (id *)buf);
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "fetchCameraClipForUUID:withCompletion:", v9, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __49__HUCameraController_displayTimelineForClipUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "playerConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clipUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Error fetching clip with UUID:%@ error:%@", (uint8_t *)&v11, 0x16u);

    }
  }
  if (objc_msgSend(v5, "isComplete"))
    objc_msgSend(WeakRetained, "_finishDisplayingTimelineForClip:", v5);
  else
    objc_msgSend(WeakRetained, "_refreshClipCacheAndRefetchForClipUUID:", *(_QWORD *)(a1 + 32));

}

- (void)_refreshClipCacheAndRefetchForClipUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HUCameraController cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke;
  v8[3] = &unk_1E6F4EBA0;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "performCloudPullWithCompletion:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accessoryViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForceLoadingIndicatorToDisplay:", 0);

  if (v3)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(NC) Failure to perform cloud pull:%@.", buf, 0xCu);
    }
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject playbackEngine](v6, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke_114;
    v9[3] = &unk_1E6F5D2E8;
    v10 = 0;
    v11 = v6;
    objc_msgSend(v7, "fetchCameraClipForUUID:withCompletion:", v8, v9);

  }
}

void __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "playerConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clipUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error fetching clip with UUID:%@ error:%@", (uint8_t *)&v8, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_finishDisplayingTimelineForClip:", v3);

}

- (void)_finishDisplayingTimelineForClip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUCameraController setFinishedFetchingCameraEvents:](self, "setFinishedFetchingCameraEvents:", 1);
  if (!v4
    || (v5 = (void *)MEMORY[0x1E0D31258],
        objc_msgSend(v4, "dateOfOccurrence"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "clipPositionWithDate:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Unable to find valid playback position for clip.dateOfOccurrence. Falling back to LIVE mode when it should have been playback.", buf, 2u);
    }

    v7 = 0;
  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v10;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Fetch request completed for UUID:%@. Start playback engine at %@ for profile:%@.", buf, 0x20u);

  }
  if (objc_msgSend(v4, "isComplete"))
  {
    -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCurrentTimelineState:", 2);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimelineState:", 2);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateOfOccurrence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updatePlaybackPositionToDate:usingClip:", v16, v4);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "play");

  }
  -[HUCameraController _updateRecordedClipInterfaceAvailabilityWithAnimation:](self, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 1);
  -[HUCameraController displayPlaybackUIWithUpdate:](self, "displayPlaybackUIWithUpdate:", 1);
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Requesting all events from HomeKit for camera profile:%@.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__HUCameraController__finishDisplayingTimelineForClip___block_invoke;
  v21[3] = &unk_1E6F545B8;
  objc_copyWeak(&v22, (id *)buf);
  objc_msgSend(v20, "fetchCameraEventsWithCompletion:", v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

void __55__HUCameraController__finishDisplayingTimelineForClip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 134217984;
    v25 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "HomeKit returned events for camera player (count:%lu).", (uint8_t *)&v24, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "ppt_clipsLoadedFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithResult:", v5);

LABEL_5:
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Finished loading/display of all clips.", (uint8_t *)&v24, 2u);
    }
    goto LABEL_13;
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "cameraProfile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_prettyDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = (uint64_t)v23;
    v26 = 2112;
    v27 = v6;
    _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "Failed to load clips for camera %@ with error %@", (uint8_t *)&v24, 0x16u);

  }
  objc_msgSend(v9, "ppt_clipsLoadedFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finishWithError:", v6);

  if (!v6)
    goto LABEL_5;
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "Bypassing scrubber/calendar updates. Force immediate display of live view.", (uint8_t *)&v24, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPlaybackPosition:", v15);

  objc_msgSend(v9, "footerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 0);

  objc_msgSend(v9, "clipScrubberViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", 0.0);

  objc_msgSend(v9, "calendarContainerViewController");
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject view](v11, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 0.0);

LABEL_13:
}

- (void)fetchRequestedClipUsingConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController playerConfiguration](self, "playerConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clipUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Proceed to fetch clip with UUID:%@", buf, 0xCu);

  }
  -[HUCameraController setNeedsToFetchClip:](self, "setNeedsToFetchClip:", 0);
  objc_initWeak((id *)buf, self);
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cameraProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clipManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clipUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke;
  v11[3] = &unk_1E6F5D310;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v8, "fetchClipWithUUID:completion:", v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke_2;
  block[3] = &unk_1E6F4C7A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
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
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "playerConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clipUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 32);
      v21 = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Error fetching clip with UUID:%@ error:%@", (uint8_t *)&v21, 0x16u);

    }
  }
  v4 = *(void **)(a1 + 40);
  if (!v4
    || (v5 = (void *)MEMORY[0x1E0D31258],
        objc_msgSend(v4, "dateOfOccurrence"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "clipPositionWithDate:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Unable to find valid playback position for clip.dateOfOccurrence. Falling back to LIVE mode when it should have been playback.", (uint8_t *)&v21, 2u);
    }

    v7 = 0;
  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "playerConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clipUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "cameraProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v11;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Proceed to fetch request completed for UUID:%@. Start playback engine at %@ for profile:%@.", (uint8_t *)&v21, 0x20u);

  }
  objc_msgSend(WeakRetained, "clipScrubberViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCurrentTimelineState:", 2);

  objc_msgSend(WeakRetained, "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimelineState:", 2);

  objc_msgSend(WeakRetained, "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dateOfOccurrence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updatePlaybackPositionToDate:usingClip:", v17, *(_QWORD *)(a1 + 40));

  objc_msgSend(WeakRetained, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 1);
  objc_msgSend(WeakRetained, "displayPlaybackUIWithUpdate:", 1);

}

- (void)_reloadClipsWithUpdate:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Requesting events from HomeKit for camera profile:%@.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HUCameraController__reloadClipsWithUpdate___block_invoke;
  v7[3] = &unk_1E6F545B8;
  objc_copyWeak(&v8, (id *)buf);
  objc_msgSend(v6, "fetchCameraEventsWithCompletion:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __45__HUCameraController__reloadClipsWithUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
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
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
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
  int v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v5, "count");
    objc_msgSend(WeakRetained, "cameraProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 134218242;
    v61 = v9;
    v62 = 2112;
    v63 = v10;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit returned %lu events for %@", (uint8_t *)&v60, 0x16u);

  }
  objc_msgSend(WeakRetained, "setFinishedFetchingCameraEvents:", 1);
  if (v5)
  {
    objc_msgSend(WeakRetained, "ppt_clipsLoadedFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithResult:", v5);

  }
  else
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cameraProfile");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "hf_prettyDescription");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138412546;
      v61 = (uint64_t)v59;
      v62 = 2112;
      v63 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_ERROR, "Failed to load events for camera %@ with error %@", (uint8_t *)&v60, 0x16u);

    }
    objc_msgSend(WeakRetained, "ppt_clipsLoadedFuture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "finishWithError:", v6);

    if (v6)
    {
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v60) = 0;
        _os_log_error_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_ERROR, "Bypassing scrubber/calendar updates. Force immediate display of live view.", (uint8_t *)&v60, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "playbackEngine");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPlaybackPosition:", v22);

      objc_msgSend(WeakRetained, "footerViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setHidden:", 0);

      objc_msgSend(WeakRetained, "clipScrubberViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAlpha:", 0.0);

      objc_msgSend(WeakRetained, "calendarContainerViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAlpha:", 0.0);
      goto LABEL_26;
    }
  }
  objc_msgSend(WeakRetained, "playerConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clipUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(WeakRetained, "playerConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startingPlaybackDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
LABEL_31:
      objc_msgSend(WeakRetained, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 1);
      goto LABEL_32;
    }
    objc_msgSend(WeakRetained, "playbackEngine");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cameraEvents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(WeakRetained, "playbackEngine");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "playerConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "startingPlaybackDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "findClipPositionForDate:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v38)
      {
        if (v40)
        {
          objc_msgSend(WeakRetained, "playerConfiguration");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "startingPlaybackDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "clip");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "cameraProfile");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "uniqueIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 138412802;
          v61 = (uint64_t)v42;
          v62 = 2112;
          v63 = v43;
          v64 = 2112;
          v65 = v45;
          _os_log_impl(&dword_1B8E1E000, v39, OS_LOG_TYPE_DEFAULT, "Reload clips with update. Start playback engine at %@ for clip:%@ with profileUUID:%@.", (uint8_t *)&v60, 0x20u);

        }
        objc_msgSend(WeakRetained, "playbackEngine");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "date");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "clip");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "updatePlaybackPositionToDate:usingClip:", v47, v48);

        if (!objc_msgSend(WeakRetained, "lastTimeControlStatusPriorToCameraSwap"))
          goto LABEL_30;
        objc_msgSend(WeakRetained, "playbackEngine");
        v39 = objc_claimAutoreleasedReturnValue();
        -[NSObject play](v39, "play");
      }
      else if (v40)
      {
        objc_msgSend(WeakRetained, "playerConfiguration");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "startingPlaybackDate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "cameraProfile");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "uniqueIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138412546;
        v61 = (uint64_t)v55;
        v62 = 2112;
        v63 = v57;
        _os_log_impl(&dword_1B8E1E000, v39, OS_LOG_TYPE_DEFAULT, "Unable to find clip after date:%@. Default to live stream for profileUUID:%@.", (uint8_t *)&v60, 0x16u);

      }
LABEL_30:

      goto LABEL_31;
    }
    HFLogForCategory();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "playerConfiguration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "startingPlaybackDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cameraProfile");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "uniqueIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138412546;
      v61 = (uint64_t)v51;
      v62 = 2112;
      v63 = v53;
      _os_log_impl(&dword_1B8E1E000, v49, OS_LOG_TYPE_DEFAULT, "Failed to find recordings for startDate:%@. Starting live stream for profileUUID:%@.", (uint8_t *)&v60, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playbackEngine");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPlaybackPosition:", v28);
LABEL_26:

    goto LABEL_32;
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "playerConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clipUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138412290;
    v61 = (uint64_t)v16;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Launching camera with clipUUID:%@. Defer launch until view has been loaded.", (uint8_t *)&v60, 0xCu);

  }
  objc_msgSend(WeakRetained, "playerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isViewLoaded");

  if (v18)
    objc_msgSend(WeakRetained, "fetchRequestedClipUsingConfiguration");
LABEL_32:

}

- (void)displayPlaybackUIWithUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[HUCameraController _updateRecordedClipInterfaceAvailabilityWithAnimation:](self, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 1);
  if (v3)
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController accessoryViewController](self, "accessoryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackEngine:", v5);

    -[HUCameraController updatePlaceholderContent](self, "updatePlaceholderContent");
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackPosition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController updateStateForPlaybackPosition:animated:](self, "updateStateForPlaybackPosition:animated:", v8, 0);

    -[HUCameraController cameraStatusView](self, "cameraStatusView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateStatusForPlaybackEngine:", v10);

    -[HUCameraController updateIndicatorColor](self, "updateIndicatorColor");
    -[HUCameraController cameraStatusViewConstraintSet](self, "cameraStatusViewConstraintSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

  }
  if (-[HUCameraController shouldResumePlaying](self, "shouldResumePlaying"))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "play");

  }
}

- (void)updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD block[5];
  id v8;
  BOOL v9;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest"))
  {
    -[HUCameraController _updateStateForPlaybackPosition:animated:](self, "_updateStateForPlaybackPosition:animated:", v6, v4);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HUCameraController_updateStateForPlaybackPosition_animated___block_invoke;
    block[3] = &unk_1E6F5D338;
    block[4] = self;
    v8 = v6;
    v9 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __62__HUCameraController_updateStateForPlaybackPosition_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStateForPlaybackPosition:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
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
  char v23;
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
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[HUCameraController applicationIsActive](self, "applicationIsActive"))
  {
    v6 = objc_msgSend(v5, "contentType");
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v53 = 138412290;
      v54 = v5;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "updateStateForPlaybackPosition: %@", (uint8_t *)&v53, 0xCu);
    }

    -[HUCameraController cameraStatusViewConstantForTraitCollection](self, "cameraStatusViewConstantForTraitCollection");
    v9 = v8;
    -[HUCameraController cameraStatusViewTopConstraint](self, "cameraStatusViewTopConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constant");
    v12 = v11;

    if (v12 != v9)
    {
      -[HUCameraController cameraStatusViewConstraintSet](self, "cameraStatusViewConstraintSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidate");

      -[HUCameraController cameraStatusViewTopConstraint](self, "cameraStatusViewTopConstraint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setConstant:", v9);

      -[HUCameraController cameraStatusViewConstraintSet](self, "cameraStatusViewConstraintSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "activateIfNeeded");

    }
    -[HUCameraController updateIndicatorColor](self, "updateIndicatorColor");
    if (v6)
    {
      -[HUCameraController liveContentViewController](self, "liveContentViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewIfLoaded");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFromSuperview");

      if (!objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
        goto LABEL_16;
      -[HUCameraController demoPlayerView](self, "demoPlayerView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHidden:", 1);

      -[HUCameraController demoModeQueuePlayer](self, "demoModeQueuePlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pause");
    }
    else
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cameraProfile");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hf_shouldDisableLiveStream");

      if ((v23 & 1) == 0)
      {
        -[HUCameraController behavior](self, "behavior");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "behaviorContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "livePreviewContainerView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUCameraController liveContentViewController](self, "liveContentViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "naui_addAutoLayoutSubview:", v28);

        v29 = (void *)MEMORY[0x1E0CB3718];
        -[HUCameraController liveContentViewController](self, "liveContentViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v31, v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activateConstraints:", v32);

        -[HUCameraController updateLivePreviewAspectRatio](self, "updateLivePreviewAspectRatio");
        -[HUCameraController liveContentViewController](self, "liveContentViewController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "cameraView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setBadgeHidden:", 1);

      }
      if (!objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
      {
LABEL_16:
        v38 = v6 == 0;
        -[HUCameraController behavior](self, "behavior");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "behaviorContext");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setLivePreviewActive:", v38);

        if (v6)
        {
          -[HUCameraController playbackEngine](self, "playbackEngine");
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v38, "player");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v41 = 0;
        }
        -[HUCameraController playerViewController](self, "playerViewController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setPlayer:", v41);

        if (v6)
        {

        }
        -[HUCameraController playerViewController](self, "playerViewController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "player");
        v44 = objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          v45 = (void *)v44;
          -[HUCameraController playerViewController](self, "playerViewController");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "player");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "allowsExternalPlayback");

          if (!v48)
          {
LABEL_25:
            -[HUCameraController playbackEngine](self, "playbackEngine");
            v20 = objc_claimAutoreleasedReturnValue();
            v50 = -[NSObject prefersAudioEnabled](v20, "prefersAudioEnabled") ^ 1;
            -[HUCameraController playerViewController](self, "playerViewController");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "playerController");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setMuted:", v50);

            goto LABEL_26;
          }
          -[HUCameraController playerViewController](self, "playerViewController");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "player");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setAllowsExternalPlayback:", 0);

        }
        goto LABEL_25;
      }
      -[HUCameraController demoPlayerView](self, "demoPlayerView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setHidden:", 0);

      -[HUCameraController demoModeQueuePlayer](self, "demoModeQueuePlayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "play");

      -[HUCameraController liveContentViewController](self, "liveContentViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setHidden:", 1);

    }
    goto LABEL_16;
  }
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v53) = 0;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "Application is not active. Bypassing playback position updates.", (uint8_t *)&v53, 2u);
  }
LABEL_26:

}

- (void)updateStateForScrubbingStatus:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    -[HUCameraController behavior](self, "behavior", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behaviorContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackControlsIncludeDisplayModeControls:", 0);

    -[HUCameraController behavior](self, "behavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "behaviorContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaybackControlsIncludeVolumeControls:", 0);

    -[HUCameraController updateCalendarContainerVisibility:](self, "updateCalendarContainerVisibility:", 0);
  }
}

- (void)removePlaybackHistoryUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[HUCameraController setRecordedClipInterfaceAvailable:](self, "setRecordedClipInterfaceAvailable:", 0);
  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromParentViewController");

  -[HUCameraController setClipScrubberViewController:](self, "setClipScrubberViewController:", 0);
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "engineMode");

  if (!v7)
  {
    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

    -[HUCameraController setCalendarContainerViewController:](self, "setCalendarContainerViewController:", 0);
  }
  -[HUCameraController dayLabel](self, "dayLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[HUCameraController setDayLabel:](self, "setDayLabel:", 0);
  -[HUCameraController timeLabel](self, "timeLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  -[HUCameraController setTimeLabel:](self, "setTimeLabel:", 0);
  -[HUCameraController setDateDisplayController:](self, "setDateDisplayController:", 0);
  -[HUCameraController footerViewController](self, "footerViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);

}

- (void)updateIndicatorColor
{
  void *v3;
  int v4;
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
  id v15;

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLiveStreaming");

  -[HUCameraController cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "hu_indicatorColorForLiveStreaming");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraStatusView](self, "cameraStatusView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStatusColor:", v8);

    -[HUCameraController cameraProfile](self, "cameraProfile");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hu_indicatorImageNameForLiveStreaming");
  }
  else
  {
    objc_msgSend(v6, "hu_indicatorColorForCurrentAccessMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraStatusView](self, "cameraStatusView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStatusColor:", v11);

    -[HUCameraController cameraProfile](self, "cameraProfile");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hu_indicatorImageNameForCurrentAccessMode");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStatusImageName:", v13);

}

- (void)updateCameraStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint8_t buf[16];

  if (-[HUCameraController applicationIsActive](self, "applicationIsActive"))
  {
    -[HUCameraController cameraStatusView](self, "cameraStatusView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateStatusForPlaybackEngine:", v4);

    -[HUCameraController updateIndicatorColor](self, "updateIndicatorColor");
    -[HUCameraController accessoryViewController](self, "accessoryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hu_reloadData");

    -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hu_reloadData");

    -[HUCameraController updatePlayerVolumeSliderState](self, "updatePlayerVolumeSliderState");
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "engineMode");

    if (!v8)
    {
      -[HUCameraController updatePIPBehaviorForDeviceAndConfiguration](self, "updatePIPBehaviorForDeviceAndConfiguration");
      if (-[HUCameraController shouldDisableLiveStreamAfterCameraStatusChange](self, "shouldDisableLiveStreamAfterCameraStatusChange"))
      {
        -[HUCameraController playbackEngine](self, "playbackEngine");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pause");
LABEL_5:

        return;
      }
      if (!-[HUCameraController displayingDetailsViewController](self, "displayingDetailsViewController"))
      {
        -[HUCameraController playbackEngine](self, "playbackEngine");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "timeControlStatus");

        if (!v11)
        {
          if (-[HUCameraController applicationIsActive](self, "applicationIsActive")
            || (-[HUCameraController playbackEngine](self, "playbackEngine"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "isPictureInPictureModeActive"),
                v12,
                v13))
          {
            -[HUCameraController playbackEngine](self, "playbackEngine");
            v14 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "play");
            goto LABEL_5;
          }
        }
      }
    }
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Bypassing camera status update since camera is not active.", buf, 2u);
    }

  }
}

- (BOOL)shouldDisableLiveStreamAfterCameraStatusChange
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[HUCameraController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentAccessMode");

  return !v4 || v4 == 3;
}

- (void)updateCanShowOverlayState
{
  uint64_t v3;
  id v4;

  if (-[HUCameraController isViewVisible](self, "isViewVisible"))
    v3 = -[HUCameraController isEnteringFullScreen](self, "isEnteringFullScreen") ^ 1;
  else
    v3 = 0;
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanShowOverlayContent:", v3);

}

- (void)dismissEditInterface
{
  void *v3;
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
  id v15;

  -[HUCameraController savedControlItems](self, "savedControlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCameraController cameraStatusView](self, "cameraStatusView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsEditing:", 0);

    -[HUCameraController behavior](self, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "behaviorContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaybackControlsIncludeDisplayModeControls:", 1);

    -[HUCameraController behavior](self, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behaviorContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackControlsIncludeVolumeControls:", 1);

    -[HUCameraController behavior](self, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "behaviorContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController nextControlItem](self, "nextControlItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:forContainerOfControlItem:", 0, v12);

    -[HUCameraController savedControlItems](self, "savedControlItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playerViewController](self, "playerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCustomControlItems:", v13);

    -[HUCameraController setSavedControlItems:](self, "setSavedControlItems:", 0);
    -[HUCameraController nextControlItem](self, "nextControlItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowsLoadingIndicator:", 0);

  }
}

- (void)addFooterViewController
{
  void *v3;
  HUCameraPlayerFooterViewController *v4;
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
  id v16;

  -[HUCameraController footerViewController](self, "footerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(HUCameraPlayerFooterViewController);
    -[HUCameraController setFooterViewController:](self, "setFooterViewController:", v4);

    -[HUCameraController playerViewController](self, "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController footerViewController](self, "footerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addChildViewController:", v6);

    -[HUCameraController footerViewController](self, "footerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didMoveToParentViewController:", v8);

    -[HUCameraController footerViewController](self, "footerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUCameraController footerViewController](self, "footerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nearbyAccessoryButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_presentNearbyAccessoriesViewController, 64);

    -[HUCameraController playerViewController](self, "playerViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "customControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController footerViewController](self, "footerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v15);

  }
}

- (void)configureCalendarContainerViewControllerIfNeeded
{
  void *v3;
  HUCalendarScrubberDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUCalendarScrubberDataSource *v10;
  HUCalendarScrubberContainerViewController *v11;
  void *v12;
  HUCalendarScrubberContainerViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;

  -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [HUCalendarScrubberDataSource alloc];
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daysWithClips");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUCalendarScrubberDataSource initWithCameraClipManager:datesWithClips:](v4, "initWithCameraClipManager:datesWithClips:", v7, v9);

    v11 = [HUCalendarScrubberContainerViewController alloc];
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUCalendarScrubberContainerViewController initWithPlaybackEngine:calendarScrubberDataSource:](v11, "initWithPlaybackEngine:calendarScrubberDataSource:", v12, v10);
    -[HUCameraController setCalendarContainerViewController:](self, "setCalendarContainerViewController:", v13);

    -[HUCameraController playerViewController](self, "playerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addChildViewController:", v15);

    -[HUCameraController playerViewController](self, "playerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "customControlsView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "naui_addAutoLayoutSubview:", v19);

    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playerViewController](self, "playerViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didMoveToParentViewController:", v21);

    objc_initWeak(&location, self);
    v22 = objc_alloc(MEMORY[0x1E0D51A18]);
    -[HUCameraController playerViewController](self, "playerViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __70__HUCameraController_configureCalendarContainerViewControllerIfNeeded__block_invoke;
    v32 = &unk_1E6F5BDB8;
    objc_copyWeak(&v33, &location);
    v25 = (void *)objc_msgSend(v22, "initWithOwningView:constraintBuilder:", v24, &v29);
    -[HUCameraController setCalendarConstraintSet:](self, "setCalendarConstraintSet:", v25, v29, v30, v31, v32);

    -[HUCameraController calendarConstraintSet](self, "calendarConstraintSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateIfNeeded");

    -[HUCameraController playerViewController](self, "playerViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "customControlsView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutIfNeeded");

    -[HUCameraController setCalendarScrubberDataSourceFuture:](self, "setCalendarScrubberDataSourceFuture:", 0);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
}

id __70__HUCameraController_configureCalendarContainerViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
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
  uint64_t v68;
  char v69;
  void *v70;
  void *v71;
  char v72;
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
  _QWORD v88[7];

  v88[5] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "calendarContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "calendarContainerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customControlsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unobscuredTopAreaLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = 1148846080;
    v87 = v11;
    objc_msgSend(v11, "setPriority:", v12);
    objc_msgSend(WeakRetained, "calendarContainerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "customControlsView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayModeControlsAreaLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v19, 16.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v21) = 1132068864;
    objc_msgSend(v20, "setPriority:", v21);
    objc_msgSend(WeakRetained, "calendarContainerViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "customControlsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "volumeControlsAreaLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v28, -16.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v30) = 1132068864;
    objc_msgSend(v29, "setPriority:", v30);
    objc_msgSend(WeakRetained, "playerViewController");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "traitCollection");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v83, "hu_hasExtendedWidth");
    objc_msgSend(WeakRetained, "calendarContainerViewController");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "view");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "playerViewController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "customControlsView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v32;
    if ((_DWORD)v22)
      objc_msgSend(v32, "volumeControlsAreaLayoutGuide");
    else
      objc_msgSend(v32, "unobscuredCenterAreaLayoutGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v75;
    objc_msgSend(WeakRetained, "playerViewController");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "traitCollection");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v73, "hu_hasExtendedWidth");
    v35 = (uint64_t)v20;
    v72 = v34;
    if ((v34 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "calendarContainerViewController");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "view");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "playerViewController");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "customControlsView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "displayModeControlsAreaLayoutGuide");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "leadingAnchor");
      v62 = v36;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v80 = v31;
    v86 = v20;
    v66 = (void *)v35;
    v88[1] = v35;
    objc_msgSend(WeakRetained, "playerViewController");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "traitCollection");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v29;
    v69 = objc_msgSend(v70, "hu_hasExtendedWidth");
    if ((v69 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "calendarContainerViewController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "view");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "trailingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "playerViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "customControlsView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "volumeControlsAreaLayoutGuide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "trailingAnchor");
      v55 = v37;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v65 = v29;
    v88[2] = v29;
    objc_msgSend(WeakRetained, "calendarContainerViewController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", 47.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v40;
    objc_msgSend(WeakRetained, "playerViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "traitCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "hu_hasExtendedWidth");
    v44 = v87;
    if ((v43 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "calendarContainerViewController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "centerXAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "playerViewController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "customControlsView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerXAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v45;
      objc_msgSend(v45, "constraintEqualToAnchor:", v27);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v88[4] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 5);
    v68 = objc_claimAutoreleasedReturnValue();
    if ((v43 & 1) == 0)
    {

    }
    if ((v69 & 1) == 0)
    {

    }
    if ((v72 & 1) == 0)
    {

    }
    v33 = (void *)v68;
  }
  else
  {
    v33 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v33;
}

- (void)updateCalendarContainerVisibility:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v3 = a3;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUserScrubbing"))
  {

LABEL_5:
    -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0.0;
    goto LABEL_6;
  }
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasRecordingEvents");

  if ((v7 & 1) == 0)
    goto LABEL_5;
  -[HUCameraController calendarContainerViewController](self, "calendarContainerViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = (double)v3;
LABEL_6:
  objc_msgSend(v8, "setAlpha:", v10);

}

- (id)presentSettingsViewController
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Present settings.", v11, 2u);
  }

  -[HUCameraController setDisplayingDetailsViewController:](self, "setDisplayingDetailsViewController:", 1);
  -[HUCameraController pauseEngineIfNeeded](self, "pauseEngineIfNeeded");
  -[HUCameraController liveContentViewController](self, "liveContentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[HUCameraController setDisplayingDetailsViewController:](self, "setDisplayingDetailsViewController:", 1);
  -[HUCameraController cameraDelegate](self, "cameraDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraItem](self, "cameraItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsViewControllerForCameraItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPresentationDelegate:", self);
  objc_msgSend(v8, "_setIgnoreAppSupportedOrientations:", 1);
  objc_msgSend(v8, "setModalInPresentation:", 1);
  -[HUCameraController presentInternalViewController:](self, "presentInternalViewController:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)presentNearbyAccessoriesViewController
{
  HUNearbyAccessoriesViewController *v3;
  void *v4;
  id v5;
  HUNearbyAccessoriesViewController *v6;

  v3 = [HUNearbyAccessoriesViewController alloc];
  -[HUCameraController cameraItem](self, "cameraItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUNearbyAccessoriesViewController initWithSourceItem:supportsQuickControls:](v3, "initWithSourceItem:supportsQuickControls:", v4, 1);

  -[HUNearbyAccessoriesViewController setPresentationDelegate:](v6, "setPresentationDelegate:", self);
  -[HUNearbyAccessoriesViewController _setIgnoreAppSupportedOrientations:](v6, "_setIgnoreAppSupportedOrientations:", 1);
  v5 = -[HUCameraController presentInternalViewController:](self, "presentInternalViewController:", v6);

}

- (id)presentInternalViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HUCameraController cancelAnyPendingLaunchEventAnalytics](self, "cancelAnyPendingLaunchEventAnalytics");
  -[HUCameraController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsPictureInPicturePlayback:", 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v4);
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "_setIgnoreAppSupportedOrientations:", 1);
  -[HUCameraController playerViewController](self, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForFullScreenPresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hu_presentPreloadableViewController:animated:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)cancelAnyPendingLaunchEventAnalytics
{
  void *v3;

  -[HUCameraController launchEvent](self, "launchEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[HUCameraController setLaunchEvent:](self, "setLaunchEvent:", 0);
}

- (void)_updateCanShowOverlayState
{
  uint64_t v3;
  id v4;

  if (-[HUCameraController isViewVisible](self, "isViewVisible"))
    v3 = -[HUCameraController isEnteringFullScreen](self, "isEnteringFullScreen") ^ 1;
  else
    v3 = 0;
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanShowOverlayContent:", v3);

}

- (BOOL)_shouldAutoPlayOnViewAppearance
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
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

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
    return 1;
  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startingPlaybackDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 0;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    return 0;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentClip");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_dateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startingPlaybackDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "hf_searchResultForDate:", v16);

  return v17 == 1;
}

- (void)updateMicrophoneControls
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  _DWORD v23[2];
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[HUCameraController shouldDisplayMicrophoneControl](self, "shouldDisplayMicrophoneControl"))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isMicrophoneEnabled");
    -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTalking:", v4);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMicrophoneEnabled");
    -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTalking:", v7);

    -[HUCameraController portraitMicrophoneConstraintSet](self, "portraitMicrophoneConstraintSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[HUCameraController landscapeMicrophoneConstraintSet](self, "landscapeMicrophoneConstraintSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[HUCameraController portraitMicrophoneConstraintSet](self, "portraitMicrophoneConstraintSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateIfNeeded");

    -[HUCameraController landscapeMicrophoneConstraintSet](self, "landscapeMicrophoneConstraintSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateIfNeeded");

  }
  -[HUCameraController updateMicrophoneControlVisibility](self, "updateMicrophoneControlVisibility");
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hf_supportsBidirectionalAudio");
    -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alpha");
    v18 = v17 == 0.0;
    -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "alpha");
    v21 = v20 == 0.0;
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 67109888;
    v23[1] = v15;
    v24 = 1024;
    v25 = v18;
    v26 = 1024;
    v27 = v21;
    v28 = 1024;
    v29 = objc_msgSend(v22, "isLiveStreaming");
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Update microphone display: BiDirectionalAudio:%{BOOL}d PortraitControlHidden:%{BOOL}d LandscapeControlHidden:%{BOOL}d LiveStreaming:%{BOOL}d", (uint8_t *)v23, 0x1Au);

  }
}

- (void)updateMicrophoneControlVisibility
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  if (!-[HUCameraController shouldDisplayMicrophoneControl](self, "shouldDisplayMicrophoneControl"))
  {
    -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v10 = 0.0;
LABEL_6:
    objc_msgSend(v6, "setAlpha:", v10);

    -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
    goto LABEL_7;
  }
  -[HUCameraController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hu_hasExtendedWidth");

  -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    v10 = 1.0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1.0;
LABEL_7:
  v11 = v8;
  objc_msgSend(v8, "setAlpha:", v9);

}

- (BOOL)shouldDisplayMicrophoneControl
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[HUCameraController cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_supportsBidirectionalAudio"))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "engineMode"))
    {
      v5 = 0;
    }
    else
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "timeControlStatus") == 2
        && -[HUCameraController hu_playbackControlsAreVisible](self, "hu_playbackControlsAreVisible");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)toggleMicrophoneState
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v4, "isMicrophoneEnabled") ^ 1;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Toggling microphone state:%{BOOL}d using button.", (uint8_t *)v8, 8u);

  }
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMicrophoneEnabled") ^ 1;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMicrophoneEnabled:", v6);

}

- (double)portraitMicrophoneOverlapOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MaxX;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double result;
  CGRect v38;

  -[HUCameraController footerViewController](self, "footerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController footerViewController](self, "footerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[HUCameraController playerViewController](self, "playerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:toView:", v16, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v38.origin.x = v18;
  v38.origin.y = v20;
  v38.size.width = v22;
  v38.size.height = v24;
  MaxX = CGRectGetMaxX(v38);
  -[HUCameraController playerViewController](self, "playerViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMargins");
  v29 = MaxX + v28;

  -[HUCameraController playerViewController](self, "playerViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = v32;
  -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v36 = v35 * -0.5 + v33 * 0.5;

  result = -60.0;
  if (v29 <= v36)
    return 0.0;
  return result;
}

- (BOOL)shouldDisplayLandscapeMicrophoneInLine
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxX;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  CGRect v35;

  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraStatusView](self, "cameraStatusView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[HUCameraController playerViewController](self, "playerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:toView:", v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  MaxX = CGRectGetMaxX(v35);
  -[HUCameraController volumeControlView](self, "volumeControlView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;

  -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v27 + MaxX + 5.0 + v29 + 16.0;

  -[HUCameraController playerViewController](self, "playerViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  LOBYTE(v4) = v30 < v33;

  return (char)v4;
}

- (void)updateMicrophoneAndSpeakerStatus
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[16];

  if (-[HUCameraController applicationIsActive](self, "applicationIsActive"))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isMicrophoneEnabled");

    -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setTalking:", 1);

      -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTalking:", 1);

      -[HUCameraController playerViewController](self, "playerViewController");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playerController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMuted:", 0);
    }
    else
    {
      objc_msgSend(v5, "setTalking:", 0);

      -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTalking:", 0);

      -[HUCameraController playbackEngine](self, "playbackEngine");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "prefersAudioEnabled") ^ 1;
      -[HUCameraController playerViewController](self, "playerViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "playerController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMuted:", v11);

    }
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Application is not active. Bypassing audio control updates.", buf, 2u);
    }

  }
}

- (void)updatePlayerVolumeSliderState
{
  float v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streamAudioVolume");
  v4 = v3;
  -[HUCameraController playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVolume:", v4);

}

- (void)updateVolumeControlVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[HUCameraController savedControlItems](self, "savedControlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "shouldDisplayVolumeControls");
    -[HUCameraController behavior](self, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behaviorContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackControlsIncludeVolumeControls:", v4);

  }
}

- (BOOL)homeHasMultipleCameraProfiles
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HUCameraController home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_allCameraProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (void)showCamera:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HUCameraPlayerConfiguration *v22;
  void *v23;
  HUCameraPlayerConfiguration *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint8_t buf[4];
  NSObject *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUCameraController cameraItem](self, "cameraItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v59 = v9;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Not switching camera using picker since the selected camera was the same %@.", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetForCameraDismissal");

    objc_msgSend(v4, "cameraProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject clipManager](v8, "clipManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31278], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClipManager:", v12);

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraController cameraProfile](self, "cameraProfile");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "uniqueIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      -[HUCameraController cameraProfile](self, "cameraProfile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v57 = v4;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject accessory](v8, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v59 = v15;
      v60 = 2112;
      v61 = v18;
      v62 = 2112;
      v63 = v19;
      v64 = 2112;
      v65 = v21;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "Change camera picker from %@/%@ to %@/%@.", buf, 0x2Au);

      v4 = v57;
    }

    v22 = [HUCameraPlayerConfiguration alloc];
    -[HUCameraController home](self, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HUCameraPlayerConfiguration initWithHome:cameraProfile:notificationUUID:clipUUID:](v22, "initWithHome:cameraProfile:notificationUUID:clipUUID:", v23, v8, 0, 0);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "playbackPosition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "clipPlaybackDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraPlayerConfiguration setStartingPlaybackDate:](v24, "setStartingPlaybackDate:", v27);

    -[HUCameraController setPlayerConfiguration:](self, "setPlayerConfiguration:", v24);
    HFLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraController playerConfiguration](self, "playerConfiguration");
      v29 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v59 = v29;
      _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "Changing camera using configuration:%@", buf, 0xCu);

    }
    v30 = objc_alloc(MEMORY[0x1E0D31228]);
    -[HUCameraPlayerConfiguration cameraProfile](v24, "cameraProfile");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraPlayerConfiguration home](v24, "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hf_characteristicValueManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v30, "initWithProfile:valueSource:", v31, v33);
    -[HUCameraController setCameraItem:](self, "setCameraItem:", v34);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController setLastTimeControlStatusPriorToCameraSwap:](self, "setLastTimeControlStatusPriorToCameraSwap:", objc_msgSend(v35, "timeControlStatus"));

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pause");

    -[HUCameraController removePlaybackHistoryUI](self, "removePlaybackHistoryUI");
    v37 = objc_alloc(MEMORY[0x1E0D31248]);
    -[HUCameraController home](self, "home");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v37, "initWithHome:cameraProfile:", v38, v39);

    -[HUCameraController behavior](self, "behavior");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setClipScrubber:", v41);

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "updateConfiguration:", v40);

    v43 = objc_alloc(MEMORY[0x1E0D31810]);
    -[HUCameraController cameraItem](self, "cameraItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v43, "initWithDelegate:sourceItem:", self, v44);
    -[HUCameraController setItemManager:](self, "setItemManager:", v45);

    -[NSObject accessory](v8, "accessory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "name");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController cameraStatusView](self, "cameraStatusView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setStatusString:", v47);

    if (-[HUCameraPlayerConfiguration isConfiguredForLiveStream](v24, "isConfiguredForLiveStream"))
    {
      HFLogForCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v8;
        _os_log_impl(&dword_1B8E1E000, v49, OS_LOG_TYPE_DEFAULT, "Updating the live stream for camera profile:%@.", buf, 0xCu);
      }

      -[HUCameraController playbackEngine](self, "playbackEngine");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "updateLiveStreamForCameraProfile:", v8);

      -[HUCameraController playbackEngine](self, "playbackEngine");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "play");

      -[HUCameraController cameraProfile](self, "cameraProfile");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "hf_supportsBidirectionalAudio");

      if (v53)
      {
        -[HUCameraController portraitMicrophoneConstraintSet](self, "portraitMicrophoneConstraintSet");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "activateIfNeeded");

        -[HUCameraController landscapeMicrophoneConstraintSet](self, "landscapeMicrophoneConstraintSet");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "activateIfNeeded");

      }
      -[HUCameraController updateMicrophoneControls](self, "updateMicrophoneControls");
      -[HUCameraController updateVolumeControlVisibility](self, "updateVolumeControlVisibility");
    }
    -[HUCameraController _reloadClipsWithUpdate:](self, "_reloadClipsWithUpdate:", 1);

  }
}

- (id)cameraPickerMenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  HUCameraController *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HUCameraController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "cameraProfiles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_127);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v3;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Camera picker menu contains cameras:%@", buf, 0xCu);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __38__HUCameraController_cameraPickerMenu__block_invoke_128;
  v21 = &unk_1E6F5D3C8;
  v22 = self;
  v23 = v14;
  v15 = v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v18);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E6F60E80, v15, v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __38__HUCameraController_cameraPickerMenu__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

void __38__HUCameraController_cameraPickerMenu__block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraPickerMissingCameraName"), CFSTR("HUCameraPickerMissingCameraName"), 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CEA2A8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__HUCameraController_cameraPickerMenu__block_invoke_2;
  v15[3] = &unk_1E6F5D3A0;
  objc_copyWeak(&v17, &location);
  v9 = v3;
  v16 = v9;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cameraProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setState:", objc_msgSend(v13, "isEqual:", v14));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __38__HUCameraController_cameraPickerMenu__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showCamera:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "cameraPickerMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cameraPickerButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:", v2);

}

- (void)playerViewController:(id)a3 contentViewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  _QWORD v5[5];
  CGSize v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__HUCameraController_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v5[3] = &unk_1E6F5D3F0;
  v5[4] = self;
  v6 = a4;
  objc_msgSend(a5, "animateAlongsideTransition:completion:", v5, 0);
}

uint64_t __101__HUCameraController_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "calendarConstraintSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "cameraStatusViewConstraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "cameraStatusViewConstantForTraitCollection");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "cameraStatusViewTopConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  v7 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "accessoryViewWidthConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  v9 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "accessoryViewHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

  objc_msgSend(*(id *)(a1 + 32), "updateMicrophoneControls");
  objc_msgSend(*(id *)(a1 + 32), "updateVolumeControlVisibility");
  objc_msgSend(*(id *)(a1 + 32), "updatePIPBehaviorForDeviceAndConfiguration");
  return objc_msgSend(*(id *)(a1 + 32), "updateViewConstraints");
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  HUCameraController *v24;
  BOOL v25;
  _QWORD v26[5];
  BOOL v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v6;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "transitioning to visibility %d", buf, 8u);
  }

  -[HUCameraController footerViewController](self, "footerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "loading the auxilliary views.", buf, 2u);
    }

    -[HUCameraController loadDependentViewControllers](self, "loadDependentViewControllers");
    -[HUCameraController loadAuxilliaryViews](self, "loadAuxilliaryViews");
    -[HUCameraController updateViewConstraints](self, "updateViewConstraints");
  }
  -[HUCameraController setHu_playbackControlsAreVisible:](self, "setHu_playbackControlsAreVisible:", v6);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v8;
    v30 = 1024;
    v31 = v6;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Begin visibility transition for %@ visible:%{BOOL}d.", buf, 0x12u);
  }

  if (v6)
  {
    -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "displayMode");

    if (!v15)
    {
      HFLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Display AVKit controls since player is not editing.%@", buf, 0xCu);
      }

      -[HUCameraController behavior](self, "behavior");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "behaviorContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPlaybackControlsIncludeDisplayModeControls:", 1);

      -[HUCameraController behavior](self, "behavior");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "behaviorContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPlaybackControlsIncludeVolumeControls:", 1);

    }
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v26[3] = &unk_1E6F4D200;
  v26[4] = self;
  v27 = v6;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2;
  v22[3] = &unk_1E6F5D418;
  v25 = v6;
  v23 = v8;
  v24 = self;
  v21 = v8;
  objc_msgSend(v9, "addCoordinatedAnimations:completion:", v26, v22);

}

void __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  objc_msgSend(*(id *)(a1 + 32), "updateCalendarContainerVisibility:", *(unsigned __int8 *)(a1 + 40));
  LOBYTE(v2) = *(_BYTE *)(a1 + 40);
  v3 = (double)v2;
  objc_msgSend(*(id *)(a1 + 32), "clipScrubberViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

  if (*(_BYTE *)(a1 + 40))
    v6 = 47.0;
  else
    v6 = 120.0;
  objc_msgSend(*(id *)(a1 + 32), "dayLabelBottomConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  objc_msgSend(*(id *)(a1 + 32), "dayLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "clipScrubberViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 32), "clipScrubberViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userIsScrubbing");

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "clipScrubberViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "dayLabelBottomConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConstant:", 47.0);

      objc_msgSend(*(id *)(a1 + 32), "dayLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "layoutIfNeeded");

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateUnanalyzedCameraClipTip");
  LOBYTE(v19) = *(_BYTE *)(a1 + 40);
  v20 = (double)v19;
  objc_msgSend(*(id *)(a1 + 32), "cameraStatusView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", v20);

  objc_msgSend(*(id *)(a1 + 32), "updateMicrophoneControls");
  objc_msgSend(*(id *)(a1 + 32), "updateVolumeControlVisibility");
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "portraitMicrophoneControl");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "landscapeMicrophoneControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 0.0);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasRecordedClips"))
  {
    v24 = (double)(objc_msgSend(*(id *)(a1 + 32), "isDismissingViewController") ^ 1);
    objc_msgSend(*(id *)(a1 + 32), "dayLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", v24);

    v26 = (double)(objc_msgSend(*(id *)(a1 + 32), "isDismissingViewController") ^ 1);
    objc_msgSend(*(id *)(a1 + 32), "timeLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAlpha:", v26);

    objc_msgSend(*(id *)(a1 + 32), "footerViewController");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidden:", 1);
  }
  else
  {
    v29 = *(_BYTE *)(a1 + 40) == 0;
    objc_msgSend(*(id *)(a1 + 32), "footerViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "setHidden:", v29);

    objc_msgSend(*(id *)(a1 + 32), "clipScrubberViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "cameraProfile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "accessory");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = objc_msgSend(v35, "isReachable");

    if ((v31 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "footerViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "liveButton");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setHidden:", 1);

    }
    objc_msgSend(*(id *)(a1 + 32), "cameraStatusView");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "updateStatusForPlaybackEngine:", v28);
  }

}

void __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 48);
    v9 = 138412546;
    v10 = v3;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Completed willTransitionToVisibilityOfPlaybackControls:... %@ %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 40), "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hu_hasExtendedWidth") & 1) != 0)
  {

  }
  else
  {
    v7 = *(unsigned __int8 *)(a1 + 48);

    if (!v7)
      return;
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Flashing the playback controls.", (uint8_t *)&v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "playerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flashPlaybackControlsWithDuration:", 1.79769313e308);
  }

}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "beginning full screen presentation", buf, 2u);
  }

  -[HUCameraController setEnteringFullScreen:](self, "setEnteringFullScreen:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__HUCameraController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v7[3] = &unk_1E6F4CB78;
  v7[4] = self;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", 0, v7);

}

uint64_t __99__HUCameraController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "setEnteringFullScreen:", 0);
  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flashPlaybackControlsWithDuration:", 1.79769313e308);

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "beginning full screen presentation. Finished.", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_didBeginPlayerViewControllerPresentation");
}

- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUCameraController setIsDismissingViewController:](self, "setIsDismissingViewController:", 1, a4);
  -[HUCameraController dayLabel](self, "dayLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[HUCameraController timeLabel](self, "timeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[HUCameraController cameraDelegate](self, "cameraDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraProfile](self, "cameraProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetViewForDismissingCameraProfile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  HUCameraController *v16;

  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "ending full screen presentation", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__30;
  v15 = __Block_byref_object_dispose__30;
  v16 = self;
  v9[5] = buf;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v10[3] = &unk_1E6F4CB78;
  v10[4] = v16;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v9[3] = &unk_1E6F5D440;
  v9[4] = v16;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);
  _Block_object_dispose(buf, 8);

}

void __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "accessoryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showingError");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "playerViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

  }
}

void __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "setIsDismissingViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "dayLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "timeLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "playerViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

  }
  else
  {
    objc_msgSend(v5, "_didEndPlayerViewControllerPresentation");
  }
}

- (void)_didBeginPlayerViewControllerPresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D315C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  -[HUCameraController setupTipsObserver](self, "setupTipsObserver");
}

- (void)_didEndPlayerViewControllerPresentation
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D315C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HUCameraController tearDownTipsObserver](self, "tearDownTipsObserver");
  -[HUCameraController cleanUpIdleTimerState](self, "cleanUpIdleTimerState");
  -[HUCameraController cameraDelegate](self, "cameraDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraController cameraProfile](self, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDismissCameraController:forProfile:", self, v4);

}

- (void)setPipState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t pipState;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  if (a3 == 3)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "PIP State: PIP finished", buf, 2u);
    }

    pipState = self->_pipState;
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (pipState == 2)
    {
      if (v8)
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "PIP State: PIP handed back first", v17, 2u);
      }

      -[HUCameraController setShouldResumePlaying:](self, "setShouldResumePlaying:", 1);
      -[HUCameraController _resetStateAfterPIP](self, "_resetStateAfterPIP");
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "PIP State: Starting stream", v16, 2u);
      }

      -[HUCameraController playbackEngine](self, "playbackEngine");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject play](v10, "play");
LABEL_16:

      goto LABEL_17;
    }
    if (v8)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "PIP State: PIP did not hand back first", v15, 2u);
    }

    if (!-[HUCameraController applicationIsActive](self, "applicationIsActive"))
    {
      -[HUCameraController setShouldResumePlaying:](self, "setShouldResumePlaying:", 0);
      -[HUCameraController playerViewController](self, "playerViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "hu_dismissViewControllerAnimated:", 0);

      -[HUCameraController _didEndPlayerViewControllerPresentation](self, "_didEndPlayerViewControllerPresentation");
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "PIP State: App was backgrounded, killing everything", v14, 2u);
      }
      goto LABEL_16;
    }
    -[HUCameraController setShouldResumePlaying:](self, "setShouldResumePlaying:", 1);
    -[HUCameraController _resetStateAfterPIP](self, "_resetStateAfterPIP");
  }
LABEL_17:
  self->_pipState = a3;
}

- (void)_resetStateAfterPIP
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[HUCameraController playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsPictureInPicturePlayback:", 1);

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPictureInPictureModeActive:", 0);

  -[HUCameraController behavior](self, "behavior");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behaviorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMicrophoneEnabled");
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMicrophoneEnabled:", v6);

}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  -[HUCameraController playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerWillStartPictureInPicture.", v14, 2u);
  }

  -[HUCameraController cameraProfile](self, "cameraProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_supportsBidirectionalAudio");

  if (v8)
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMicrophoneEnabled");
    -[HUCameraController behavior](self, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "behaviorContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMicrophoneEnabled:", v10);

  }
  else
  {
    -[HUCameraController behavior](self, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behaviorContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHasMicrophone:", 0);
  }

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "play");

}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerDidStartPictureInPicture.", v6, 2u);
  }

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPictureInPictureModeActive:", 1);

  -[HUCameraController setPipState:](self, "setPipState:", 1);
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "PIP: failedToStartPictureInPictureWithError. ", v7, 2u);
  }

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPictureInPictureModeActive:", 0);

}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[HUCameraController playerViewController](self, "playerViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerWillStopPictureInPicture.", v6, 2u);
  }

}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = !-[HUCameraController applicationIsActive](self, "applicationIsActive");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "PIP: Stop picture in picture. Will dismiss camera:%{BOOL}d.", (uint8_t *)v5, 8u);
  }

  -[HUCameraController setPipState:](self, "setPipState:", 3);
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart.", v5, 2u);
  }

  return 0;
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  HUCameraController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "PIP: restoreUserInterfaceForPictureInPictureStopWithCompletionHandler %@ vs %@", (uint8_t *)&v9, 0x16u);
  }

  -[HUCameraController setPipState:](self, "setPipState:", 2);
  v7[2](v7, 1);

}

- (void)updatePIPBehaviorForDeviceAndConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _DWORD v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "userInterfaceIdiom"))
  {

    goto LABEL_5;
  }
  -[HUCameraController playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hu_hasExtendedWidth");

  if ((v6 & 1) == 0)
  {
LABEL_5:
    -[HUCameraController behavior](self, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "behaviorContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:", 0);

    -[HUCameraController behavior](self, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behaviorContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
    goto LABEL_6;
  }
  -[HUCameraController behavior](self, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behaviorContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:", 1);

  -[HUCameraController behavior](self, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "behaviorContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 0;
LABEL_6:
  objc_msgSend(v10, "setPlaybackControlsIncludePictureInPictureButton:", v12);

  if (-[HUCameraController shouldDisableLiveStreamAfterCameraStatusChange](self, "shouldDisableLiveStreamAfterCameraStatusChange")|| (-[HUCameraController cameraProfile](self, "cameraProfile"), v15 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v15, "accessory"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v17 = objc_msgSend(v16, "isReachable"), v16, v15, (v17 & 1) == 0))
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraController cameraProfile](self, "cameraProfile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = 67109120;
      v27[1] = objc_msgSend(v20, "isReachable");
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "PIP: Unable to display PIP when live stream is disabled. Camera is reachable:%{BOOL}d.", (uint8_t *)v27, 8u);

    }
    -[HUCameraController behavior](self, "behavior");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "behaviorContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:", 0);

    -[HUCameraController behavior](self, "behavior");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "behaviorContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPlaybackControlsIncludePictureInPictureButton:", 0);

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUCameraController behavior](self, "behavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "behaviorContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPlaybackControlsIncludePictureInPictureButton:", 0);

  }
}

- (void)playbackEngine:(id)a3 didUpdateClipPlayer:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[HUCameraController timelapseController](self, "timelapseController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetForNewCamera");

  objc_msgSend(v5, "playbackPosition");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HUCameraController updateStateForPlaybackPosition:animated:](self, "updateStateForPlaybackPosition:animated:", v7, 1);
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
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
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineModeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timelineStateDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeControlStatusDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138413058;
    v37 = v7;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Camera Player didUpdate playbackPosition:%@ engineMode:%@ timelineState:%@ timeControlStatus:%@.", (uint8_t *)&v36, 0x2Au);

  }
  -[HUCameraController updateStateForPlaybackPosition:animated:](self, "updateStateForPlaybackPosition:animated:", v7, 1);
  -[HUCameraController updateBlurWithPlaybackEngine:](self, "updateBlurWithPlaybackEngine:", v6);
  if (objc_msgSend(v6, "engineMode"))
  {
    -[HUCameraController updateCameraPlayerForEventPlaybackPosition:](self, "updateCameraPlayerForEventPlaybackPosition:", v7);
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isScrubbing");

    if (v13)
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "timelineState") == 2)
      {

LABEL_15:
        objc_opt_class();
        -[HUCameraController playbackEngine](self, "playbackEngine");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentClip");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;

        if (!v24)
        {
LABEL_24:
          if (!-[HUCameraController foundCameraClipWithInsufficientAnalysis](self, "foundCameraClipWithInsufficientAnalysis"))
          {
            -[HUCameraController playbackEngine](self, "playbackEngine");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "currentClip");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "hf_hasInsufficientAnalysis");

            if (v32)
              -[HUCameraController setFoundCameraClipWithInsufficientAnalysis:](self, "setFoundCameraClipWithInsufficientAnalysis:", 1);
          }
          goto LABEL_27;
        }
        -[HUCameraController timelapseController](self, "timelapseController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraController playbackEngine](self, "playbackEngine");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "currentClip");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "updateToPlaybackPosition:forHighQualityClip:", v7, v27);

        -[HUCameraController accessoryViewController](self, "accessoryViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setCanShowOverlayContent:", 0);
LABEL_23:

        goto LABEL_24;
      }
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "scrubbingSpeed");

      if (v21 == 2)
        goto LABEL_15;
    }
    else
    {
      if (-[HUCameraController isViewVisible](self, "isViewVisible"))
        v18 = -[HUCameraController isEnteringFullScreen](self, "isEnteringFullScreen") ^ 1;
      else
        v18 = 0;
      -[HUCameraController accessoryViewController](self, "accessoryViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCanShowOverlayContent:", v18);

    }
    -[HUCameraController timelapseController](self, "timelapseController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pauseTimelapseScrubbing");
    goto LABEL_23;
  }
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCanShowOverlayContent:", 1);

  -[HUCameraController displayCurrentTimeAndDate](self, "displayCurrentTimeAndDate");
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "timeControlStatus") == 2)
  {
    v17 = -[HUCameraController hu_playbackControlsAreVisible](self, "hu_playbackControlsAreVisible");

    if (v17)
      -[HUCameraController updateMicrophoneControlVisibility](self, "updateMicrophoneControlVisibility");
  }
  else
  {

  }
  -[HUCameraController timelapseController](self, "timelapseController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hideAllViews");

LABEL_27:
  -[HUCameraController diagnosticsController](self, "diagnosticsController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[HUCameraController diagnosticsController](self, "diagnosticsController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "updateWithPlaybackEngine:", v35);

  }
}

- (void)updateCameraPlayerForEventPlaybackPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  -[HUCameraController cancelLiveTimer](self, "cancelLiveTimer");
  -[HUCameraController portraitMicrophoneControl](self, "portraitMicrophoneControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[HUCameraController landscapeMicrophoneControl](self, "landscapeMicrophoneControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  objc_msgSend(v4, "clipPlaybackDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUCameraController dateDisplayController](self, "dateDisplayController");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateDisplayDateWithDate:forType:](v8, "updateDisplayDateWithDate:forType:", v7, 0);
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Missing date for current position. Unable to update time/date labels.", v9, 2u);
    }
  }

}

- (void)playbackEngine:(id)a3 didUpdateScrubbingStatus:(BOOL)a4
{
  -[HUCameraController updateStateForScrubbingStatus:animated:](self, "updateStateForScrubbingStatus:animated:", a4, 1);
}

- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[HUCameraController applicationIsActive](self, "applicationIsActive"))
  {
    -[HUCameraController updateLivePreviewAspectRatio](self, "updateLivePreviewAspectRatio");
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Application is not active. Bypassing live camera source updates for sourc:%@.", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  HUCameraController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUCameraController launchEvent](self, "launchEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 2 && v7)
  {
    -[HUCameraController playerConfiguration](self, "playerConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startingPlaybackDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Send Clip playback launch event after time control update.", (uint8_t *)&v19, 2u);
      }

      objc_msgSend(v6, "currentClip");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraController launchEvent](self, "launchEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCameraClip:", v12);

      -[HUCameraController launchEvent](self, "launchEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "launchedRecordingWithError:", 0);
    }
    else
    {
      if (v11)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Send Live Stream launch event after time control update.", (uint8_t *)&v19, 2u);
      }

      -[HUCameraController launchEvent](self, "launchEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "launchedStreamWithError:", 0);
    }

    -[HUCameraController setLaunchEvent:](self, "setLaunchEvent:", 0);
  }
  else if (a4 - 1 > 1)
  {
LABEL_17:
    -[HUCameraController footerViewController](self, "footerViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "liveButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", a4 != 2);

    -[HUCameraController updateBlurWithPlaybackEngine:](self, "updateBlurWithPlaybackEngine:", v6);
    -[HUCameraController updateIdleTimer](self, "updateIdleTimer");
    -[HUCameraController updateIndicatorColor](self, "updateIndicatorColor");
    -[HUCameraController updateMicrophoneControls](self, "updateMicrophoneControls");
    -[HUCameraController updateVolumeControlVisibility](self, "updateVolumeControlVisibility");
    if (objc_msgSend(v6, "isLiveStreaming"))
    {
      -[HUCameraController displayCurrentTimeAndDate](self, "displayCurrentTimeAndDate");
      -[HUCameraController startLiveTimer](self, "startLiveTimer");
    }
    else
    {
      -[HUCameraController cancelLiveTimer](self, "cancelLiveTimer");
    }
    goto LABEL_20;
  }
  -[HUCameraController timelapseController](self, "timelapseController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hideAllViews");

  if (!-[HUCameraController displayingDetailsViewController](self, "displayingDetailsViewController"))
    goto LABEL_17;
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = self;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@ Preventing timeControlStatus update while displaying settings", (uint8_t *)&v19, 0xCu);
  }

LABEL_20:
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HUCameraController_playbackEngine_didUpdatePlaybackError___block_invoke;
  block[3] = &unk_1E6F4E020;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__HUCameraController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "launchEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "engineMode"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "engineMode") != 1)
      {
LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "setLaunchEvent:", 0);
        goto LABEL_12;
      }
      HFLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 48);
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Send Clip playback failure launch event for error:%@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "currentClip");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "launchEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCameraClip:", v5);

      objc_msgSend(*(id *)(a1 + 32), "launchEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "launchedRecordingWithError:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Send stream failure launch event for error:%@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "launchEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "launchedStreamWithError:", *(_QWORD *)(a1 + 48));
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "cameraStatusView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateStatusForPlaybackEngine:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "updateIndicatorColor");
  return objc_msgSend(*(id *)(a1 + 32), "updateBlurWithPlaybackEngine:", *(_QWORD *)(a1 + 40));
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  void *v7;
  id v8;

  if (objc_msgSend(a6, "count", a3, a4, a5) && !-[HUCameraController hasRecordedClips](self, "hasRecordedClips"))
  {
    -[HUCameraController removePlaybackHistoryUI](self, "removePlaybackHistoryUI");
    -[HUCameraController dismissEditInterface](self, "dismissEditInterface");
    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaybackPosition:", v8);

  }
  else
  {
    -[HUCameraController _updateRecordedClipInterfaceAvailabilityWithAnimation:](self, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 1);
  }
}

- (void)playbackEngine:(id)a3 didUpdateMicrophoneEnabled:(BOOL)a4
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v5, "isMicrophoneEnabled");
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Playback engine did update microphone enabled:%{BOOL}d.", (uint8_t *)v7, 8u);
  }

  -[HUCameraController updateMicrophoneAndSpeakerStatus](self, "updateMicrophoneAndSpeakerStatus");
}

- (void)pauseEngineIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "engineMode"))
  {

  }
  else
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMicrophoneEnabled");

    if (v5)
      -[HUCameraController toggleMicrophoneState](self, "toggleMicrophoneState");
  }
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pause");

}

- (void)updateBlurWithPlaybackEngine:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[HUCameraController blurViewController](self, "blurViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HUCameraController_updateBlurWithPlaybackEngine___block_invoke;
  v6[3] = &unk_1E6F4E300;
  v6[4] = self;
  objc_msgSend(v5, "updateBlurWithPlaybackEngine:completionHandler:", v4, v6);

}

void __51__HUCameraController_updateBlurWithPlaybackEngine___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behaviorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isZoomingEnabled");

  if (v6 == a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "behavior");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behaviorContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZoomingEnabled:", a2 ^ 1u);

  }
}

- (double)currentScrubberResolutionForBehavior:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentScrubberResolution");
  v5 = v4;

  return v5;
}

- (void)playbackControlsDidToggleMuted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[HUCameraController cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hf_supportsBidirectionalAudio") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMicrophoneEnabled");

  if ((v7 & 1) == 0)
  {
LABEL_5:
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrefersAudioEnabled:", !v3);

  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "streamAudioVolume");
      v14 = 134217984;
      v15 = v11;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Forcing volume update to %.02f.", (uint8_t *)&v14, 0xCu);

    }
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "streamAudioVolume");
    objc_msgSend(v12, "setStreamAudioVolume:");

  }
}

- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUCameraController accessoryViewController](self, "accessoryViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowLoadingIndicatorForClipPlayback:", v3);

}

- (void)pictureInPictureDidToggleMicrophone
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMicrophoneEnabled") ^ 1;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMicrophoneEnabled:", v4);

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMicrophoneEnabled");
  -[HUCameraController behavior](self, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behaviorContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMicrophoneEnabled:", v7);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67109120;
    v12[1] = objc_msgSend(v11, "isMicrophoneEnabled");
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Toggled microphone state on: %{BOOL}d.", (uint8_t *)v12, 8u);

  }
}

- (void)playbackControlsDidChangePlayerVolume:(float)a3
{
  double v4;
  id v5;

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setStreamAudioVolume:", v4);

}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  int v9;
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
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t v25[16];

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2578B8))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = objc_msgSend(v8, "requiresPresentingViewControllerDismissal");

  if (!v9
    || (-[HUCameraController playerViewController](self, "playerViewController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "presentingViewController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    -[HUCameraController setDisplayingDetailsViewController:](self, "setDisplayingDetailsViewController:", 0);
    -[HUCameraController liveContentViewController](self, "liveContentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

    -[HUCameraController playerViewController](self, "playerViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsPictureInPicturePlayback:", 1);

    if (-[HUCameraController hasRecordedClips](self, "hasRecordedClips"))
    {
      -[HUCameraController footerViewController](self, "footerViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 1);
    }
    else
    {
      -[HUCameraController removePlaybackHistoryUI](self, "removePlaybackHistoryUI");
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "Restarting the live stream after finished presentation.", v25, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPlaybackPosition:", v18);
    }

    -[HUCameraController playbackEngine](self, "playbackEngine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "engineMode"))
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "timeControlStatus");

      if (v23)
        goto LABEL_15;
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "play");
    }

LABEL_15:
    -[HUCameraController playerViewController](self, "playerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hu_dismissViewControllerAnimated:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[HUCameraController playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hu_dismissViewControllerAnimated:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v14;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a4;
  -[HUCameraController cameraItem](self, "cameraItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    -[HUCameraController updateCameraStatus](self, "updateCameraStatus");
}

- (void)toggleDemoModeLiveStreamVideo:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = !a3;
  -[HUCameraController demoPlayerView](self, "demoPlayerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  -[HUCameraController demoModeQueuePlayer](self, "demoModeQueuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "pause");
  else
    objc_msgSend(v6, "play");

}

- (void)displayCurrentTimeAndDate
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraController dateDisplayController](self, "dateDisplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateDisplayDateWithDate:forType:", v4, 1);

}

- (void)startLiveTimer
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[HUCameraController liveTimer](self, "liveTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0C99E88];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __36__HUCameraController_startLiveTimer__block_invoke;
    v9 = &unk_1E6F53298;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v6, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController setLiveTimer:](self, "setLiveTimer:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __36__HUCameraController_startLiveTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayCurrentTimeAndDate");

}

- (void)cancelLiveTimer
{
  void *v3;
  void *v4;

  -[HUCameraController liveTimer](self, "liveTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCameraController liveTimer](self, "liveTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[HUCameraController setLiveTimer:](self, "setLiveTimer:", 0);
  }
}

- (HUCameraMicrophoneControl)portraitMicrophoneControl
{
  HUCameraMicrophoneControl *portraitMicrophoneControl;
  HUCameraMicrophoneControl *v4;
  HUCameraMicrophoneControl *v5;

  portraitMicrophoneControl = self->_portraitMicrophoneControl;
  if (!portraitMicrophoneControl)
  {
    v4 = -[HUCameraMicrophoneControl initWithFrame:]([HUCameraMicrophoneControl alloc], "initWithFrame:", 0.0, 0.0, 90.0, 44.0);
    -[HUCameraMicrophoneControl setAlpha:](v4, "setAlpha:", 0.0);
    -[HUCameraMicrophoneControl addTarget:action:forEvents:](v4, "addTarget:action:forEvents:", self, sel_toggleMicrophoneState, 64);
    v5 = self->_portraitMicrophoneControl;
    self->_portraitMicrophoneControl = v4;

    portraitMicrophoneControl = self->_portraitMicrophoneControl;
  }
  return portraitMicrophoneControl;
}

- (HUCameraMicrophoneControl)landscapeMicrophoneControl
{
  HUCameraMicrophoneControl *landscapeMicrophoneControl;
  HUCameraMicrophoneControl *v4;
  HUCameraMicrophoneControl *v5;

  landscapeMicrophoneControl = self->_landscapeMicrophoneControl;
  if (!landscapeMicrophoneControl)
  {
    v4 = -[HUCameraMicrophoneControl initWithFrame:]([HUCameraMicrophoneControl alloc], "initWithFrame:", 0.0, 0.0, 90.0, 44.0);
    -[HUCameraMicrophoneControl setAlpha:](v4, "setAlpha:", 0.0);
    -[HUCameraMicrophoneControl addTarget:action:forEvents:](v4, "addTarget:action:forEvents:", self, sel_toggleMicrophoneState, 64);
    v5 = self->_landscapeMicrophoneControl;
    self->_landscapeMicrophoneControl = v4;

    landscapeMicrophoneControl = self->_landscapeMicrophoneControl;
  }
  return landscapeMicrophoneControl;
}

- (UILabel)dayLabel
{
  UILabel *dayLabel;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *v7;

  dayLabel = self->_dayLabel;
  if (!dayLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "monospacedDigitSystemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
    -[UILabel setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v7 = self->_dayLabel;
    self->_dayLabel = v4;

    dayLabel = self->_dayLabel;
  }
  return dayLabel;
}

- (UILabel)timeLabel
{
  UILabel *timeLabel;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *v7;

  timeLabel = self->_timeLabel;
  if (!timeLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "monospacedDigitSystemFontOfSize:weight:", 18.0, *MEMORY[0x1E0CEB5F8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    -[UILabel setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
    v7 = self->_timeLabel;
    self->_timeLabel = v4;

    timeLabel = self->_timeLabel;
  }
  return timeLabel;
}

- (HUCameraDateDisplayController)dateDisplayController
{
  HUCameraDateDisplayController *dateDisplayController;
  HUCameraDateDisplayController *v4;
  void *v5;
  void *v6;
  HUCameraDateDisplayController *v7;
  HUCameraDateDisplayController *v8;

  dateDisplayController = self->_dateDisplayController;
  if (!dateDisplayController)
  {
    v4 = [HUCameraDateDisplayController alloc];
    -[HUCameraController dayLabel](self, "dayLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController timeLabel](self, "timeLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUCameraDateDisplayController initWithDayOfWeekLabel:timeLabel:](v4, "initWithDayOfWeekLabel:timeLabel:", v5, v6);

    v8 = self->_dateDisplayController;
    self->_dateDisplayController = v7;

    dateDisplayController = self->_dateDisplayController;
  }
  return dateDisplayController;
}

- (UIView)volumeControlView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HUCameraController playerViewController](self, "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeControlsAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v5;
}

- (UIView)loadingOverlayView
{
  UIView *loadingOverlayView;
  id v4;
  UIView *v5;
  void *v6;
  UIView *v7;

  loadingOverlayView = self->_loadingOverlayView;
  if (!loadingOverlayView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView setAlpha:](v5, "setAlpha:", 0.0);
    v7 = self->_loadingOverlayView;
    self->_loadingOverlayView = v5;

    loadingOverlayView = self->_loadingOverlayView;
  }
  return loadingOverlayView;
}

- (HUCameraStatusOverlayView)cameraStatusView
{
  HUCameraStatusOverlayView *cameraStatusView;
  HUCameraStatusOverlayView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUCameraStatusOverlayView *v14;

  cameraStatusView = self->_cameraStatusView;
  if (!cameraStatusView)
  {
    v4 = objc_alloc_init(HUCameraStatusOverlayView);
    -[HUCameraController cameraProfile](self, "cameraProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView setStatusString:](v4, "setStatusString:", v7);

    -[HUCameraController cameraProfile](self, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hu_indicatorColorForCurrentAccessMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView setStatusColor:](v4, "setStatusColor:", v10);

    -[HUCameraController cameraProfile](self, "cameraProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hu_indicatorImageNameForCurrentAccessMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraStatusOverlayView setStatusImageName:](v4, "setStatusImageName:", v13);

    -[HUCameraStatusOverlayView setIsDisplayingForSingleCamera:](v4, "setIsDisplayingForSingleCamera:", -[HUCameraController homeHasMultipleCameraProfiles](self, "homeHasMultipleCameraProfiles") ^ 1);
    v14 = self->_cameraStatusView;
    self->_cameraStatusView = v4;

    cameraStatusView = self->_cameraStatusView;
  }
  return cameraStatusView;
}

- (void)handleSceneDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Camera player - Scene did become active.", buf, 2u);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlayerViewController view](self->_playerViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", v9) & 1) != 0)
  {
    -[HUCameraController setApplicationIsActive:](self, "setApplicationIsActive:", 1);
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPictureInPictureModeActive");

    if (v11)
    {
      -[HUCameraController playerViewController](self, "playerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAllowsPictureInPicturePlayback:", 0);

      -[HUCameraController playbackEngine](self, "playbackEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPictureInPictureModeActive:", 0);

    }
    v14 = -[HUCameraController shouldResumePlaying](self, "shouldResumePlaying");
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Camera Player scene did become active. Resuming clip playback because shouldResumePlaying is true", v20, 2u);
      }

      -[HUCameraController setShouldResumePlaying:](self, "setShouldResumePlaying:", 0);
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "play");
    }
    else
    {
      if (v16)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Camera Player scene did become active. Pausing clip playback because shouldResumePlaying is false", v19, 2u);
      }

      -[HUCameraController playbackEngine](self, "playbackEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pause");
    }

    -[HUCameraController enableAudioSession](self, "enableAudioSession");
  }
  else
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Camera player - Active scene mismatch, returning early.", v21, 2u);
    }

  }
}

- (void)handleSceneWillDeactivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134217984;
    v19 = objc_msgSend(v6, "timeControlStatus");
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Camera player - Scene did deactivate, time control status %lu", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlayerViewController view](self->_playerViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqual:", v10) & 1) != 0)
  {
    -[HUCameraController setApplicationIsActive:](self, "setApplicationIsActive:", 0);
    -[HUCameraController playbackEngine](self, "playbackEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "timeControlStatus") == 2)
    {

    }
    else
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "timeControlStatus");

      if (v14 != 1)
      {
        HFLogForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "Camera Player scene deactivate, not pausing playback.", (uint8_t *)&v18, 2u);
        }

        goto LABEL_18;
      }
    }
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Camera Player scene deactivate, pausing playback.", (uint8_t *)&v18, 2u);
    }

    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPhone"))
    {
      -[HUCameraController playbackEngine](self, "playbackEngine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pause");

      -[HUCameraController setShouldResumePlaying:](self, "setShouldResumePlaying:", 1);
    }
LABEL_18:
    -[HUCameraController disableAudioSession](self, "disableAudioSession");
    goto LABEL_19;
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Camera player - Non-active scene mismatch, returning early.", (uint8_t *)&v18, 2u);
  }

LABEL_19:
}

- (void)updateIdleTimer
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timeControlStatus");

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4 == 2;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Should disable idle timer:%{BOOL}d", (uint8_t *)v7, 8u);
  }

  +[HUApplicationManager sharedInstance](HUApplicationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdleTimerDisabled:forRequester:", v4 == 2, self);

}

- (void)executionEnvironmentDidBecomeOccluded:(id)a3
{
  -[HUCameraController handleSceneWillDeactivate:](self, "handleSceneWillDeactivate:", 0);
}

- (void)executionEnvironmentDidBecomeVisible:(id)a3
{
  -[HUCameraController handleSceneDidActivate:](self, "handleSceneDidActivate:", 0);
}

- (void)networkDidBecomeUnavailable
{
  void *v3;
  int v4;
  id v5;
  _QWORD block[5];

  -[HUCameraController cameraItem](self, "cameraItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isReachable") & 1) != 0)
  {

  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0D319D0], "isInAirplaneMode");

    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__HUCameraController_networkDidBecomeUnavailable__block_invoke;
      block[3] = &unk_1E6F4D988;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __49__HUCameraController_networkDidBecomeUnavailable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayAirplaneModeAlert");
}

- (void)updateUnanalyzedCameraClipTip
{
  void *v3;
  void *v4;
  double v5;
  _BOOL8 v6;

  if (-[HUCameraController foundCameraClipWithInsufficientAnalysis](self, "foundCameraClipWithInsufficientAnalysis"))
  {
    -[HUCameraController clipScrubberViewController](self, "clipScrubberViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5 == 1.0;

  }
  else
  {
    v6 = 0;
  }
  -[HUCameraController changeUnanalyzedCameraClipTipShouldDisplayTo:](self, "changeUnanalyzedCameraClipTipShouldDisplayTo:", v6);
}

- (void)updateLivePreviewAspectRatio
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveCameraSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  if (v5 == 0.0)
    v6 = 1.77777778;
  else
    v6 = v5;

  -[HUCameraController behavior](self, "behavior");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behaviorContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLivePreviewAspectRatio:", v6, 1.0);

}

- (void)updatePlaceholderContent
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled"))
  {
    -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCameraPlayerHasContentToShow:", 0);

    -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);
  }
  else
  {
    -[HUCameraController playerViewController](self, "playerViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isReadyForDisplay");
    -[HUCameraController placeholderContentViewController](self, "placeholderContentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCameraPlayerHasContentToShow:", v5);
  }

}

- (void)_displayAirplaneModeAlert
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id buf[2];

  -[HUCameraController airplaneAlertController](self, "airplaneAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Displaying airplane alert.", (uint8_t *)buf, 2u);
    }

    HULocalizedWiFiString(CFSTR("HUCameraErrorAlertAirplaneModeTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraErrorAlertAirplaneModeMessage"), CFSTR("HUCameraErrorAlertAirplaneModeMessage"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraController setAirplaneAlertController:](self, "setAirplaneAlertController:", v7);
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraErrorAlertActionSettings"), CFSTR("HUCameraErrorAlertActionSettings"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(buf, self);
    v9 = (void *)MEMORY[0x1E0CEA2E0];
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__HUCameraController__displayAirplaneModeAlert__block_invoke;
    v21[3] = &unk_1E6F56E30;
    objc_copyWeak(&v22, buf);
    objc_msgSend(v9, "actionWithTitle:style:handler:", v8, 0, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);
    _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CEA2E0];
    v16 = v10;
    v17 = 3221225472;
    v18 = __47__HUCameraController__displayAirplaneModeAlert__block_invoke_2;
    v19 = &unk_1E6F56E30;
    objc_copyWeak(&v20, buf);
    objc_msgSend(v13, "actionWithTitle:style:handler:", v12, 0, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14, v16, v17, v18, v19);
    -[HUCameraController playerViewController](self, "playerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v7, 1, 0);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);

  }
}

void __47__HUCameraController__displayAirplaneModeAlert__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAirplaneAlertController:", 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_wifiSettingsURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "openURL:", v1);

}

void __47__HUCameraController__displayAirplaneModeAlert__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAirplaneAlertController:", 0);

}

- (BOOL)shouldAutoPlayOnViewAppearance
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
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

  -[HUCameraController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
    return 1;
  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startingPlaybackDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 0;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentClip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    return 0;
  -[HUCameraController playbackEngine](self, "playbackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentClip");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_dateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraController playerConfiguration](self, "playerConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startingPlaybackDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "hf_searchResultForDate:", v16);

  return v17 == 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((void *)HUCameraControllerReadyForDisplayContext == a6)
  {
    v12 = a4;
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "observed value :%@", buf, 0xCu);
    }

    -[HUCameraController volumeControlView](self, "volumeControlView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      -[HUCameraController updateMicrophoneControls](self, "updateMicrophoneControls");
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("videoBounds")) & 1) != 0
           || objc_msgSend(v10, "isEqual:", CFSTR("bounds")))
    {
      -[HUCameraController playerViewController](self, "playerViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "videoBounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      if (v22 > 1.0 && v24 > 1.0)
      {
        -[HUCameraController timelapseController](self, "timelapseController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "updateVideoBounds:", v18, v20, v22, v24);

        objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setVideoSize:", v22, v24);

      }
    }
    else
    {
      -[HUCameraController updatePlaceholderContent](self, "updatePlaceholderContent");
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)HUCameraController;
    v11 = a4;
    -[HUCameraController observeValueForKeyPath:ofObject:change:context:](&v27, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);

  }
}

- (void)cleanUpIdleTimerState
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Re-enabling the idle timer for camera player dismissal.", v5, 2u);
  }

  +[HUApplicationManager sharedInstance](HUApplicationManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerDisabled:forRequester:", 0, self);

}

- (void)cleanUpConstraintSets
{
  -[HUCameraController setCameraStatusViewTopConstraint:](self, "setCameraStatusViewTopConstraint:", 0);
  -[HUCameraController setCameraStatusViewConstraintSet:](self, "setCameraStatusViewConstraintSet:", 0);
  -[HUCameraController setScrubberConstraintSet:](self, "setScrubberConstraintSet:", 0);
  -[HUCameraController setPortraitMicrophoneConstraintSet:](self, "setPortraitMicrophoneConstraintSet:", 0);
  -[HUCameraController setLandscapeMicrophoneConstraintSet:](self, "setLandscapeMicrophoneConstraintSet:", 0);
  -[HUCameraController setCalendarConstraintSet:](self, "setCalendarConstraintSet:", 0);
}

- (void)enableAudioSession
{
  NSObject *v2;

  -[HUCameraController audioSessionQueue](self, "audioSessionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_220);

}

void __40__HUCameraController_enableAudioSession__block_invoke()
{
  void *v0;
  id v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v0, "setActive:error:", 1, &v4);
  v1 = v4;

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Error enabling audio session: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Enabled audio session", buf, 2u);
  }

}

- (void)disableAudioSession
{
  NSObject *v2;

  -[HUCameraController audioSessionQueue](self, "audioSessionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_221_0);

}

void __41__HUCameraController_disableAudioSession__block_invoke()
{
  void *v0;
  id v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v0, "setActive:withOptions:error:", 0, 1, &v4);
  v1 = v4;

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Error disabling audio session: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Disabled audio session", buf, 2u);
  }

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  HUCameraController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ dealloc", buf, 0xCu);
  }

  -[HUCameraController disableAudioSession](self, "disableAudioSession");
  -[HUCameraController playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[HUCameraController cleanUpConstraintSets](self, "cleanUpConstraintSets");
  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetForCameraDismissal");

  objc_msgSend(MEMORY[0x1E0D31278], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipManager:", 0);

  if (-[HUCameraController isObservingReadyForDisplay](self, "isObservingReadyForDisplay"))
  {
    -[HUCameraController playerViewController](self, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("readyForDisplay"));

    -[HUCameraController playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("videoBounds"));

    -[HUCameraController volumeControlView](self, "volumeControlView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

    -[HUCameraController playerViewController](self, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "customControlsView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  }
  v12.receiver = self;
  v12.super_class = (Class)HUCameraController;
  -[HUCameraController dealloc](&v12, sel_dealloc);
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeStrong((id *)&self->_playbackEngine, a3);
}

- (HUCameraControllerDelegate)cameraDelegate
{
  return (HUCameraControllerDelegate *)objc_loadWeakRetained((id *)&self->_cameraDelegate);
}

- (void)setCameraDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cameraDelegate, a3);
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (HFCameraItem)cameraItem
{
  return self->_cameraItem;
}

- (void)setCameraItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItem, a3);
}

- (HUCameraPlayerConfiguration)playerConfiguration
{
  return self->_playerConfiguration;
}

- (void)setPlayerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_playerConfiguration, a3);
}

- (void)setCameraStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStatusView, a3);
}

- (HUCameraPlayerAVBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (UIButton)cameraPickerButton
{
  return self->_cameraPickerButton;
}

- (void)setCameraPickerButton:(id)a3
{
  objc_storeStrong((id *)&self->_cameraPickerButton, a3);
}

- (NSArray)savedControlItems
{
  return self->_savedControlItems;
}

- (void)setSavedControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_savedControlItems, a3);
}

- (void)setNextControlItem:(id)a3
{
  objc_storeStrong((id *)&self->_nextControlItem, a3);
}

- (HUCalendarScrubberContainerViewController)calendarContainerViewController
{
  return self->_calendarContainerViewController;
}

- (void)setCalendarContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_calendarContainerViewController, a3);
}

- (HUCameraPlayerAccessoryViewController)accessoryViewController
{
  return self->_accessoryViewController;
}

- (void)setAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewController, a3);
}

- (HUCameraPlayerFooterViewController)footerViewController
{
  return self->_footerViewController;
}

- (void)setFooterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewController, a3);
}

- (HUCameraPlayerLiveContentViewController)liveContentViewController
{
  return self->_liveContentViewController;
}

- (void)setLiveContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_liveContentViewController, a3);
}

- (HUClipScrubberViewController)clipScrubberViewController
{
  return self->_clipScrubberViewController;
}

- (void)setClipScrubberViewController:(id)a3
{
  objc_storeStrong((id *)&self->_clipScrubberViewController, a3);
}

- (HUCameraPlayerPlaceholderContentViewController)placeholderContentViewController
{
  return self->_placeholderContentViewController;
}

- (void)setPlaceholderContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderContentViewController, a3);
}

- (HUCameraBlurViewController)blurViewController
{
  return self->_blurViewController;
}

- (void)setBlurViewController:(id)a3
{
  objc_storeStrong((id *)&self->_blurViewController, a3);
}

- (BOOL)recordedClipInterfaceAvailable
{
  return self->_recordedClipInterfaceAvailable;
}

- (void)setRecordedClipInterfaceAvailable:(BOOL)a3
{
  self->_recordedClipInterfaceAvailable = a3;
}

- (BOOL)isEnteringFullScreen
{
  return self->_enteringFullScreen;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (BOOL)isObservingReadyForDisplay
{
  return self->_observingReadyForDisplay;
}

- (void)setObservingReadyForDisplay:(BOOL)a3
{
  self->_observingReadyForDisplay = a3;
}

- (BOOL)applicationIsActive
{
  return self->_applicationIsActive;
}

- (void)setApplicationIsActive:(BOOL)a3
{
  self->_applicationIsActive = a3;
}

- (NAUILayoutConstraintSet)cameraStatusViewConstraintSet
{
  return self->_cameraStatusViewConstraintSet;
}

- (void)setCameraStatusViewConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStatusViewConstraintSet, a3);
}

- (NAUILayoutConstraintSet)scrubberConstraintSet
{
  return self->_scrubberConstraintSet;
}

- (void)setScrubberConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberConstraintSet, a3);
}

- (NAUILayoutConstraintSet)calendarConstraintSet
{
  return self->_calendarConstraintSet;
}

- (void)setCalendarConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_calendarConstraintSet, a3);
}

- (NAUILayoutConstraintSet)portraitMicrophoneConstraintSet
{
  return self->_portraitMicrophoneConstraintSet;
}

- (void)setPortraitMicrophoneConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_portraitMicrophoneConstraintSet, a3);
}

- (NAUILayoutConstraintSet)landscapeMicrophoneConstraintSet
{
  return self->_landscapeMicrophoneConstraintSet;
}

- (void)setLandscapeMicrophoneConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeMicrophoneConstraintSet, a3);
}

- (NSLayoutConstraint)cameraStatusViewTopConstraint
{
  return self->_cameraStatusViewTopConstraint;
}

- (void)setCameraStatusViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStatusViewTopConstraint, a3);
}

- (NSLayoutConstraint)dayLabelBottomConstraint
{
  return self->_dayLabelBottomConstraint;
}

- (void)setDayLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dayLabelBottomConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewWidthConstraint
{
  return self->_accessoryViewWidthConstraint;
}

- (void)setAccessoryViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewWidthConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewHeightConstraint
{
  return self->_accessoryViewHeightConstraint;
}

- (void)setAccessoryViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, a3);
}

- (HUCameraRecordingPlayerView)demoPlayerView
{
  return self->_demoPlayerView;
}

- (void)setDemoPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_demoPlayerView, a3);
}

- (AVPlayerLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
  objc_storeStrong((id *)&self->_looper, a3);
}

- (AVQueuePlayer)demoModeQueuePlayer
{
  return (AVQueuePlayer *)objc_loadWeakRetained((id *)&self->_demoModeQueuePlayer);
}

- (void)setDemoModeQueuePlayer:(id)a3
{
  objc_storeWeak((id *)&self->_demoModeQueuePlayer, a3);
}

- (UIAlertController)airplaneAlertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_airplaneAlertController);
}

- (void)setAirplaneAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_airplaneAlertController, a3);
}

- (HUCameraTimelapseController)timelapseController
{
  return self->_timelapseController;
}

- (void)setTimelapseController:(id)a3
{
  objc_storeStrong((id *)&self->_timelapseController, a3);
}

- (AVPlayerLayer)timelapsePlayerLayer
{
  return self->_timelapsePlayerLayer;
}

- (void)setTimelapsePlayerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_timelapsePlayerLayer, a3);
}

- (BOOL)shouldResumePlaying
{
  return self->_shouldResumePlaying;
}

- (void)setShouldResumePlaying:(BOOL)a3
{
  self->_shouldResumePlaying = a3;
}

- (void)setDayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dayLabel, a3);
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (void)setDateDisplayController:(id)a3
{
  objc_storeStrong((id *)&self->_dateDisplayController, a3);
}

- (void)setLoadingOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingOverlayView, a3);
}

- (NSTimer)liveTimer
{
  return self->_liveTimer;
}

- (void)setLiveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_liveTimer, a3);
}

- (NAFuture)ppt_clipsLoadedFuture
{
  return self->_ppt_clipsLoadedFuture;
}

- (void)setPpt_clipsLoadedFuture:(id)a3
{
  objc_storeStrong((id *)&self->_ppt_clipsLoadedFuture, a3);
}

- (void)setPortraitMicrophoneControl:(id)a3
{
  objc_storeStrong((id *)&self->_portraitMicrophoneControl, a3);
}

- (void)setLandscapeMicrophoneControl:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeMicrophoneControl, a3);
}

- (BOOL)hu_playbackControlsAreVisible
{
  return self->_hu_playbackControlsAreVisible;
}

- (void)setHu_playbackControlsAreVisible:(BOOL)a3
{
  self->_hu_playbackControlsAreVisible = a3;
}

- (BOOL)displayingDetailsViewController
{
  return self->_displayingDetailsViewController;
}

- (void)setDisplayingDetailsViewController:(BOOL)a3
{
  self->_displayingDetailsViewController = a3;
}

- (BOOL)needsToFetchClip
{
  return self->_needsToFetchClip;
}

- (void)setNeedsToFetchClip:(BOOL)a3
{
  self->_needsToFetchClip = a3;
}

- (BOOL)finishedFetchingCameraEvents
{
  return self->_finishedFetchingCameraEvents;
}

- (void)setFinishedFetchingCameraEvents:(BOOL)a3
{
  self->_finishedFetchingCameraEvents = a3;
}

- (HUDiagnosticsCameraPlayerController)diagnosticsController
{
  return self->_diagnosticsController;
}

- (void)setDiagnosticsController:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsController, a3);
}

- (HFCameraAnalyticsCameraPlayerLaunchEvent)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_launchEvent, a3);
}

- (BOOL)isDismissingViewController
{
  return self->_isDismissingViewController;
}

- (void)setIsDismissingViewController:(BOOL)a3
{
  self->_isDismissingViewController = a3;
}

- (unint64_t)pipState
{
  return self->_pipState;
}

- (OS_dispatch_queue)audioSessionQueue
{
  return self->_audioSessionQueue;
}

- (void)setAudioSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionQueue, a3);
}

- (BOOL)foundCameraClipWithInsufficientAnalysis
{
  return self->_foundCameraClipWithInsufficientAnalysis;
}

- (void)setFoundCameraClipWithInsufficientAnalysis:(BOOL)a3
{
  self->_foundCameraClipWithInsufficientAnalysis = a3;
}

- (NAFuture)calendarScrubberDataSourceFuture
{
  return self->_calendarScrubberDataSourceFuture;
}

- (void)setCalendarScrubberDataSourceFuture:(id)a3
{
  objc_storeStrong((id *)&self->_calendarScrubberDataSourceFuture, a3);
}

- (UIViewController)tipPopoverController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_tipPopoverController);
}

- (void)setTipPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->_tipPopoverController, a3);
}

- (id)tipsObserver
{
  return self->_tipsObserver;
}

- (void)setTipsObserver:(id)a3
{
  objc_storeStrong(&self->_tipsObserver, a3);
}

- (unint64_t)lastTimeControlStatusPriorToCameraSwap
{
  return self->_lastTimeControlStatusPriorToCameraSwap;
}

- (void)setLastTimeControlStatusPriorToCameraSwap:(unint64_t)a3
{
  self->_lastTimeControlStatusPriorToCameraSwap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tipsObserver, 0);
  objc_destroyWeak((id *)&self->_tipPopoverController);
  objc_storeStrong((id *)&self->_calendarScrubberDataSourceFuture, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_launchEvent, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_landscapeMicrophoneControl, 0);
  objc_storeStrong((id *)&self->_portraitMicrophoneControl, 0);
  objc_storeStrong((id *)&self->_ppt_clipsLoadedFuture, 0);
  objc_storeStrong((id *)&self->_liveTimer, 0);
  objc_storeStrong((id *)&self->_loadingOverlayView, 0);
  objc_storeStrong((id *)&self->_dateDisplayController, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_timelapsePlayerLayer, 0);
  objc_storeStrong((id *)&self->_timelapseController, 0);
  objc_destroyWeak((id *)&self->_airplaneAlertController);
  objc_destroyWeak((id *)&self->_demoModeQueuePlayer);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_storeStrong((id *)&self->_demoPlayerView, 0);
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_dayLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_cameraStatusViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeMicrophoneConstraintSet, 0);
  objc_storeStrong((id *)&self->_portraitMicrophoneConstraintSet, 0);
  objc_storeStrong((id *)&self->_calendarConstraintSet, 0);
  objc_storeStrong((id *)&self->_scrubberConstraintSet, 0);
  objc_storeStrong((id *)&self->_cameraStatusViewConstraintSet, 0);
  objc_storeStrong((id *)&self->_blurViewController, 0);
  objc_storeStrong((id *)&self->_placeholderContentViewController, 0);
  objc_storeStrong((id *)&self->_clipScrubberViewController, 0);
  objc_storeStrong((id *)&self->_liveContentViewController, 0);
  objc_storeStrong((id *)&self->_footerViewController, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_calendarContainerViewController, 0);
  objc_storeStrong((id *)&self->_nextControlItem, 0);
  objc_storeStrong((id *)&self->_savedControlItems, 0);
  objc_storeStrong((id *)&self->_cameraPickerButton, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_cameraStatusView, 0);
  objc_storeStrong((id *)&self->_playerConfiguration, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_destroyWeak((id *)&self->_cameraDelegate);
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
