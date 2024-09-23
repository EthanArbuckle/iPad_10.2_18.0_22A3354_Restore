@implementation HUNCCameraPlayerViewController

+ (BOOL)usesSecondGenerationControls
{
  return 0;
}

- (HUNCCameraPlayerViewController)initWithCameraProfile:(id)a3 notificationUUID:(id)a4 clipUUID:(id)a5 imageURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HUNCCameraPlayerViewController *v15;
  NSObject *v16;
  HFCameraAnalyticsCameraPlayerLaunchEvent *v17;
  HFCameraAnalyticsCameraPlayerLaunchEvent *launchEvent;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HFCameraItem *cameraItem;
  HUCameraPlayerAVBehavior *v25;
  HUCameraPlayerAVBehavior *behavior;
  void *v27;
  void *v28;
  void *v29;
  HUCameraBlurViewController *v30;
  HUCameraBlurViewController *blurViewController;
  HUCameraPlayerAccessoryViewController *v32;
  void *v33;
  uint64_t v34;
  HUCameraPlayerAccessoryViewController *accessoryViewController;
  HUCameraPlayerLiveContentViewController *v36;
  void *v37;
  uint64_t v38;
  HUCameraPlayerLiveContentViewController *liveContentViewController;
  HUNCCameraPlayerPlaceholderContentViewController *v40;
  HUNCCameraPlayerPlaceholderContentViewController *placeholderContentViewController;
  uint64_t v42;
  HFItemManager *itemManager;
  void *v44;
  uint64_t v45;
  HUNCCameraPlayerViewController *v46;
  NSObject *v47;
  id v48;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  HUNCCameraPlayerViewController *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)HUNCCameraPlayerViewController;
  v15 = -[HUNCCameraPlayerViewController init](&v51, sel_init);
  if (v15)
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v53 = v15;
      v54 = 2112;
      v55 = v12;
      v56 = 2112;
      v57 = v13;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "(NC) Launching Camera Player <%p> for notificationUUID:%@ clipUUID:%@", buf, 0x20u);
    }

    v17 = (HFCameraAnalyticsCameraPlayerLaunchEvent *)objc_alloc_init(MEMORY[0x1E0D311E0]);
    launchEvent = v15->_launchEvent;
    v15->_launchEvent = v17;

    objc_storeStrong((id *)&v15->_cameraProfile, a3);
    objc_storeStrong((id *)&v15->_notificationUUID, a4);
    objc_storeStrong((id *)&v15->_clipUUID, a5);
    v19 = objc_alloc(MEMORY[0x1E0D31228]);
    objc_msgSend(v11, "accessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_characteristicValueManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "initWithProfile:valueSource:", v11, v22);
    cameraItem = v15->_cameraItem;
    v15->_cameraItem = (HFCameraItem *)v23;

    v25 = -[HUCameraPlayerAVBehavior initWithDelegate:]([HUCameraPlayerAVBehavior alloc], "initWithDelegate:", v15);
    behavior = v15->_behavior;
    v15->_behavior = v25;

    -[HUNCCameraPlayerViewController addBehavior:](v15, "addBehavior:", v15->_behavior);
    -[AVHomeIPCameraBehavior behaviorContext](v15->_behavior, "behaviorContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPlaybackControlsIncludeTransportControls:", 0);

    -[AVHomeIPCameraBehavior behaviorContext](v15->_behavior, "behaviorContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPlaybackControlsIncludeDisplayModeControls:", 0);

    -[AVHomeIPCameraBehavior behaviorContext](v15->_behavior, "behaviorContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setZoomingEnabled:", 0);

    -[HUNCCameraPlayerViewController _setupPlaybackEngine](v15, "_setupPlaybackEngine");
    if (v13)
      -[HUNCCameraPlayerViewController loadCameraClip](v15, "loadCameraClip");
    v30 = objc_alloc_init(HUCameraBlurViewController);
    blurViewController = v15->_blurViewController;
    v15->_blurViewController = v30;

    v32 = [HUCameraPlayerAccessoryViewController alloc];
    -[HUNCCameraPlayerViewController playbackEngine](v15, "playbackEngine");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HUCameraPlayerAccessoryViewController initWithPlaybackEngine:](v32, "initWithPlaybackEngine:", v33);
    accessoryViewController = v15->_accessoryViewController;
    v15->_accessoryViewController = (HUCameraPlayerAccessoryViewController *)v34;

    -[HUCameraPlayerAccessoryViewController setForceLoadingIndicatorToDisplay:](v15->_accessoryViewController, "setForceLoadingIndicatorToDisplay:", 1);
    v36 = [HUCameraPlayerLiveContentViewController alloc];
    -[HUNCCameraPlayerViewController playbackEngine](v15, "playbackEngine");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HUCameraPlayerLiveContentViewController initWithPlaybackEngine:](v36, "initWithPlaybackEngine:", v37);
    liveContentViewController = v15->_liveContentViewController;
    v15->_liveContentViewController = (HUCameraPlayerLiveContentViewController *)v38;

    v40 = -[HUNCCameraPlayerPlaceholderContentViewController initWithImageURL:]([HUNCCameraPlayerPlaceholderContentViewController alloc], "initWithImageURL:", v14);
    placeholderContentViewController = v15->_placeholderContentViewController;
    v15->_placeholderContentViewController = v40;

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:sourceItem:", v15, v15->_cameraItem);
    itemManager = v15->_itemManager;
    v15->_itemManager = (HFItemManager *)v42;

    -[HFItemManager disableExternalUpdatesWithReason:](v15->_itemManager, "disableExternalUpdatesWithReason:", CFSTR("kDisableUpdatesReasonHUNCCameraPlayerViewControllerNotVisible"));
    -[HUNCCameraPlayerViewController setDelegate:](v15, "setDelegate:", v15);
    -[HUNCCameraPlayerViewController setUpdatesNowPlayingInfoCenter:](v15, "setUpdatesNowPlayingInfoCenter:", 0);
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *MEMORY[0x1E0C89690];
    v50 = 0;
    objc_msgSend(v44, "setCategory:error:", v45, &v50);
    v46 = (HUNCCameraPlayerViewController *)v50;

    if (v46)
    {
      HFLogForCategory();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v46;
        _os_log_error_impl(&dword_1B8E1E000, v47, OS_LOG_TYPE_ERROR, "Unable to properly set audio playback session with error: %@", buf, 0xCu);
      }

    }
    -[HUNCCameraPlayerViewController updateVolumeControlVisibility](v15, "updateVolumeControlVisibility", v12);
    v48 = (id)objc_msgSend(MEMORY[0x1E0D311F0], "sharedDecorator");

  }
  return v15;
}

- (void)viewDidLoad
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
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
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
  NSObject *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  objc_super v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  _BOOL4 v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v85.receiver = self;
  v85.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController viewDidLoad](&v85, sel_viewDidLoad);
  -[HUNCCameraPlayerViewController placeholderContentViewController](self, "placeholderContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController addChildViewController:](self, "addChildViewController:", v3);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController addChildViewController:](self, "addChildViewController:", v4);

  -[HUNCCameraPlayerViewController blurViewController](self, "blurViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController addChildViewController:](self, "addChildViewController:", v5);

  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController placeholderContentViewController](self, "placeholderContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "naui_addAutoLayoutSubview:", v8);

  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController blurViewController](self, "blurViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "naui_addAutoLayoutSubview:", v11);

  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v14);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController contentOverlayView](self, "contentOverlayView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[HUNCCameraPlayerViewController blurViewController](self, "blurViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "didMoveToParentViewController:", self);

  -[HUNCCameraPlayerViewController placeholderContentViewController](self, "placeholderContentViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "didMoveToParentViewController:", self);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "didMoveToParentViewController:", self);

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "prefersAudioEnabled") ^ 1;
  -[HUNCCameraPlayerViewController playerController](self, "playerController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setMuted:", v45);

  -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v45) = objc_msgSend(v47, "hf_supportsBidirectionalAudio");

  if ((_DWORD)v45)
  {
    -[HUNCCameraPlayerViewController setHu_playbackControlsAreVisible:](self, "setHu_playbackControlsAreVisible:", 1);
    -[HUNCCameraPlayerViewController customControlsView](self, "customControlsView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "microphoneControl");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v50);

    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "microphoneControl");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addTarget:action:forControlEvents:", self, sel_toggleMicrophoneState, 64);

    HFLogForCategory();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "accessory");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "name");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNCCameraPlayerViewController clipUUID](self, "clipUUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v87 = v56;
      v88 = 1024;
      v89 = v57 != 0;
      _os_log_impl(&dword_1B8E1E000, v53, OS_LOG_TYPE_DEFAULT, "Speaker is supported by camera:%@. Microphone control displayed at top:%{BOOL}d.", buf, 0x12u);

    }
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "isMicrophoneEnabled");
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "microphoneControl");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setTalking:", v59);

    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "microphoneControl");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "leftAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController customControlsView](self, "customControlsView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leftAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, 8.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setActive:", 1);

    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "microphoneControl");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController customControlsView](self, "customControlsView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "safeAreaLayoutGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v73, -8.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    -[HUNCCameraPlayerViewController updateMicrophone](self, "updateMicrophone");
  }
  else
  {
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "microphoneControl");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setAlpha:", 0.0);

    HFLogForCategory();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "accessory");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v87 = v79;
      _os_log_impl(&dword_1B8E1E000, v77, OS_LOG_TYPE_DEFAULT, "Speaker not supported by camera:%@. Will not display microphone control.", buf, 0xCu);

    }
  }
  HFLogForCategory();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v80, OS_LOG_TYPE_DEFAULT, "Notification scrubber viewDidLoad.", buf, 2u);
  }

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setShouldShowLoadingIndicatorForClipPlayback:", 1);

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setCanShowOverlayContent:", 1);

  -[HUNCCameraPlayerViewController customControlsView](self, "customControlsView");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addSubview:", v84);

  -[HUNCCameraPlayerViewController _setupConstraintSets](self, "_setupConstraintSets");
}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  HUNCCameraPlayerViewController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HUNCCameraPlayerViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDisableExternalUpdatesWithReason:", CFSTR("kDisableUpdatesReasonHUNCCameraPlayerViewControllerNotVisible"));

  -[HUNCCameraPlayerViewController clipUUID](self, "clipUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Starting Live Stream since there is no clipUUID.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlaybackPosition:", v10);

    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "play");

    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController _updateStateForPlaybackPosition:animated:](self, "_updateStateForPlaybackPosition:animated:", v13, 1);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  HUNCCameraPlayerViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUNCCameraPlayerViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
  -[HUNCCameraPlayerViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disableExternalUpdatesWithReason:", CFSTR("kDisableUpdatesReasonHUNCCameraPlayerViewControllerNotVisible"));

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  HUNCCameraPlayerViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveCameraSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  if (v5 == 0.0)
    v6 = 1.77777778;
  else
    v6 = v5;

  -[HUNCCameraPlayerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  if (v6 >= 1.0 || v6 <= 0.0)
  {
    -[HUNCCameraPlayerViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[HUNCCameraPlayerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, round(v13 / v6));

  }
  else
  {
    v10 = round(v8 / v6);

    if (-[HUNCCameraPlayerViewController numberOfAssociatedAccessoriesDisplayed](self, "numberOfAssociatedAccessoriesDisplayed"))
    {
      v11 = v10 + -150.0;
    }
    else
    {
      v11 = v10;
    }
    -[HUNCCameraPlayerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6 * v11, round(v11));
  }
}

- (void)_updateRecordedClipInterfaceAvailabilityWithAnimation:(BOOL)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD block[5];
  uint8_t buf[16];

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Finished clip prep. Safe to update UI.", buf, 2u);
  }

  v6 = dispatch_time(0, 200000000);
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  v8 = MEMORY[0x1E0C80D38];
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2;
  v9[3] = &unk_1E6F4D200;
  v9[4] = self;
  v10 = a3;
  dispatch_async(v8, v9);

}

uint64_t __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flashPlaybackControlsWithDuration:", 1.79769313e308);
}

void __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  HUNCCameraScrubberViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUNCCameraScrubberViewController *v9;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[5];

  objc_msgSend(*(id *)(a1 + 32), "notificationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "miniScrubberViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = [HUNCCameraScrubberViewController alloc];
      objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentClip");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentClip");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateOfOccurrence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HUNCCameraScrubberViewController initWithPlaybackEngine:currentClip:startDate:](v4, "initWithPlaybackEngine:currentClip:startDate:", v5, v6, v8);
      objc_msgSend(*(id *)(a1 + 32), "setMiniScrubberViewController:", v9);

      objc_msgSend(*(id *)(a1 + 32), "liveButtonView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "liveButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_toggleLive, 64);

      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "miniScrubberViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addChildViewController:", v13);

      objc_msgSend(*(id *)(a1 + 32), "customControlsView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "miniScrubberViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "naui_addAutoLayoutSubview:", v16);

      objc_msgSend(*(id *)(a1 + 32), "customControlsView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "liveButtonView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bringSubviewToFront:", v18);

      objc_msgSend(*(id *)(a1 + 32), "miniScrubberViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "scrubberConstraintSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "invalidate");

  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3;
  aBlock[3] = &unk_1E6F4E300;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v22 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateConstraintsIfNeeded");

  if (*(_BYTE *)(a1 + 40))
  {
    v24 = (void *)MEMORY[0x1E0CEABB0];
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_4;
    v25[3] = &unk_1E6F4D9B0;
    v26 = v22;
    objc_msgSend(v24, "animateWithDuration:animations:", v25, 0.3);

  }
  else
  {
    (*((void (**)(void *, uint64_t))v22 + 2))(v22, 1);
  }

}

void __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3(uint64_t a1, unsigned int a2)
{
  double v2;
  void *v3;
  id v4;

  v2 = (double)a2;
  objc_msgSend(*(id *)(a1 + 32), "miniScrubberViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

uint64_t __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)home
{
  void *v2;
  void *v3;
  void *v4;

  -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setupConstraintSets
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
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
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
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v19 = (void *)MEMORY[0x1E0CB3718];
  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController customControlsView](self, "customControlsView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "transportControlsAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v26;
  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 44.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v23;
  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "liveButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v5;
  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController customControlsView](self, "customControlsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, -8.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D51A18]);
  -[HUNCCameraPlayerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke;
  v34[3] = &unk_1E6F5BDB8;
  objc_copyWeak(&v35, &location);
  v15 = (void *)objc_msgSend(v12, "initWithOwningView:constraintBuilder:", v13, v34);
  -[HUNCCameraPlayerViewController setStaticConstraintSet:](self, "setStaticConstraintSet:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D51A18]);
  -[HUNCCameraPlayerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke_2;
  v32[3] = &unk_1E6F5BDB8;
  objc_copyWeak(&v33, &location);
  v18 = (void *)objc_msgSend(v16, "initWithOwningView:constraintBuilder:", v17, v32);
  -[HUNCCameraPlayerViewController setScrubberConstraintSet:](self, "setScrubberConstraintSet:", v18);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

id __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke(uint64_t a1)
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
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(WeakRetained, "placeholderContentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(WeakRetained, "blurViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentOverlayView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_arrayByFlattening");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke_2(uint64_t a1)
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
  void *v13;
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
  id v29;
  _QWORD v30[6];

  v30[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "miniScrubberViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "miniScrubberViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "customControlsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, -6.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    objc_msgSend(WeakRetained, "miniScrubberViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "customControlsView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transportControlsAreaLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leftAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v16;
    objc_msgSend(WeakRetained, "miniScrubberViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "liveButtonView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v9;
    objc_msgSend(WeakRetained, "miniScrubberViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 47.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = (id)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HUNCCameraPlayerViewController staticConstraintSet](self, "staticConstraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateIfNeeded");

  -[HUNCCameraPlayerViewController scrubberConstraintSet](self, "scrubberConstraintSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateIfNeeded");

  v5.receiver = self;
  v5.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController updateViewConstraints](&v5, sel_updateViewConstraints);
}

- (void)reloadAfterNotificationUpdate
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNCCameraPlayerViewController currentClip](self, "currentClip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(NC) reloading after Notification Update for currentClip:%@.", (uint8_t *)&v5, 0xCu);

  }
  -[HUNCCameraPlayerViewController loadCameraClip](self, "loadCameraClip");
}

- (void)reloadForCurrentClip
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceLoadingIndicatorToDisplay:", 0);

  -[HUNCCameraPlayerViewController currentClip](self, "currentClip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      -[HUNCCameraPlayerViewController currentClip](self, "currentClip");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNCCameraPlayerViewController playbackStartDateFromSignificantEvent](self, "playbackStartDateFromSignificantEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(NC) reloading for currentClip:%@ at start position:%@.", (uint8_t *)&v18, 0x16u);

    }
    -[HUNCCameraPlayerViewController currentClip](self, "currentClip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isComplete");

    v11 = (void *)MEMORY[0x1E0D31258];
    if (v10)
    {
      -[HUNCCameraPlayerViewController playbackStartDateFromSignificantEvent](self, "playbackStartDateFromSignificantEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clipPositionWithDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPlaybackPosition:", v13);

      -[HUNCCameraPlayerViewController _updateRecordedClipInterfaceAvailabilityWithAnimation:](self, "_updateRecordedClipInterfaceAvailabilityWithAnimation:", 1);
      return;
    }
    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPlaybackPosition:", v15);

  }
  else
  {
    if (v6)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(NC) reloading while missing clip. Starting Live Stream.", (uint8_t *)&v18, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPlaybackPosition:", v15);

    -[HUNCCameraPlayerViewController _updateStateForPlaybackPosition:animated:](self, "_updateStateForPlaybackPosition:animated:", v15, 1);
  }

}

- (void)loadCameraClip
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HUNCCameraPlayerViewController notificationUUID](self, "notificationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(NC) Perform cloud pull:%@.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke;
    v8[3] = &unk_1E6F5BE08;
    v8[4] = self;
    v9 = v3;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v7, "performCloudPullWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "HUNCCameraPlayer loading with request for clip without notificationUUID. Should this be possible?", buf, 2u);
    }

    -[HUNCCameraPlayerViewController reloadForCurrentClip](self, "reloadForCurrentClip");
  }

}

void __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceLoadingIndicatorToDisplay:", 0);

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(NC) Failure to perform cloud pull:%@.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(NC) cloud pull complete. Fetch clip using notificationUUID:%@.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke_37;
    v10[3] = &unk_1E6F5BDE0;
    v11 = v9;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "fetchCameraClipForNotificationUUID:withCompletion:", v11, v10);

    objc_destroyWeak(&v13);
    v6 = v11;
  }

}

void __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v26 = v6;
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v33 = v5;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "HUNCCameraPlayer loaded with clip:%@ for notificationUUID:%@.", buf, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "dateOfOccurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPlaybackStartDateFromSignificantEvent:", v11);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v5, "significantEvents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v17, "uniqueIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v19)
          {
            objc_msgSend(v17, "dateOfOccurrence");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "setPlaybackStartDateFromSignificantEvent:", v20);

            goto LABEL_14;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(WeakRetained, "setCurrentClip:", v5);
    HFLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "currentClip");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "playbackStartDateFromSignificantEvent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v22;
      v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "HUNCCameraPlayer loaded with currentClip:%@ at start position:%@.", buf, 0x16u);

    }
    v7 = v26;
    if (objc_msgSend(v5, "isComplete"))
      objc_msgSend(WeakRetained, "reloadForCurrentClip");

  }
  else if (v6)
  {
    HFLogForCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v33 = v25;
      v34 = 2112;
      v35 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "HUNCCameraPlayer unable to locate clip for notificationUUID:%@ with error:%@.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "reloadForCurrentClip");
  }

}

- (void)_setupPlaybackEngine
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
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0D31248]);
  -[HUNCCameraPlayerViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "initWithHome:cameraProfile:", v4, v5);

  -[HUNCCameraPlayerViewController behavior](self, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClipScrubber:", v6);

  -[HUNCCameraPlayerViewController notificationUUID](self, "notificationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNotificationUUID:", v7);

  -[HUNCCameraPlayerViewController clipUUID](self, "clipUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNotificationClipUUID:", v8);

  -[HUNCCameraPlayerViewController clipUUID](self, "clipUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0D31258];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clipPositionWithDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaybackPosition:", v12);

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31240]), "initWithConfiguration:", v14);
  -[HUNCCameraPlayerViewController setPlaybackEngine:](self, "setPlaybackEngine:", v13);

  -[HUNCCameraPlayerViewController addPlaybackEngineObservation](self, "addPlaybackEngineObservation");
}

- (void)addPlaybackEngineObservation
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D31250]);
  objc_msgSend(v4, "setPeriodicTimeUpdateInterval:", &unk_1E7043628);
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:withOptions:", self, v4);

}

- (void)_updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
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
  uint64_t v27;
  void *v28;
  id v29;

  v5 = objc_msgSend(a3, "contentType");
  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForceLoadingIndicatorToDisplay:", 0);

  if (v5)
  {
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");
  }
  else
  {
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cameraProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hf_shouldDisableLiveStream");

    if ((v11 & 1) != 0)
      goto LABEL_6;
    -[HUNCCameraPlayerViewController behavior](self, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "behaviorContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "livePreviewContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "naui_addAutoLayoutSubview:", v15);

    v16 = (void *)MEMORY[0x1E0CB3718];
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v19);

    -[HUNCCameraPlayerViewController _updateLivePreviewAspectRatio](self, "_updateLivePreviewAspectRatio");
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cameraView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBadgeHidden:", 1);

  }
LABEL_6:
  -[HUNCCameraPlayerViewController behavior](self, "behavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "behaviorContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLivePreviewActive:", v5 == 0);

  if (v5)
  {
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "player");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNCCameraPlayerViewController setPlayer:](self, "setPlayer:", v24);

  }
  else
  {
    -[HUNCCameraPlayerViewController setPlayer:](self, "setPlayer:", 0);
  }
  -[HUNCCameraPlayerViewController player](self, "player");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HUNCCameraPlayerViewController player](self, "player");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAllowsExternalPlayback:", 0);

  }
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v29, "prefersAudioEnabled") ^ 1;
  -[HUNCCameraPlayerViewController playerController](self, "playerController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMuted:", v27);

}

- (void)_updateStateForScrubbingStatus:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[HUNCCameraPlayerViewController behavior](self, "behavior", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behaviorContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackControlsIncludeDisplayModeControls:", 0);

    -[HUNCCameraPlayerViewController behavior](self, "behavior");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behaviorContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaybackControlsIncludeVolumeControls:", 0);

  }
}

- (void)_updateLivePreviewAspectRatio
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveCameraSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  if (v5 == 0.0)
    v6 = 1.77777778;
  else
    v6 = v5;

  -[HUNCCameraPlayerViewController behavior](self, "behavior");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behaviorContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLivePreviewAspectRatio:", v6, 1.0);

}

- (void)_updatePlayerVolumeSliderState
{
  float v3;
  double v4;
  void *v5;
  id v6;

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "streamAudioVolume");
  v4 = v3;
  -[HUNCCameraPlayerViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVolume:", v4);

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
  uint64_t v15;

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31258], "livePosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
    return 1;
  -[HUNCCameraPlayerViewController playbackStartDateFromSignificantEvent](self, "playbackStartDateFromSignificantEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentClip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    return 0;
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentClip");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController playbackStartDateFromSignificantEvent](self, "playbackStartDateFromSignificantEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "hf_searchResultForDate:", v14);

  return v15 == 1;
}

- (void)toggleLive
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Toggle live using button", v6, 2u);
  }

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowLoadingIndicatorForClipPlayback:", 1);

  -[HUNCCameraPlayerViewController updateMicrophone](self, "updateMicrophone");
  -[HUNCCameraPlayerViewController miniScrubberViewController](self, "miniScrubberViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleLive");

}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  _BOOL4 v12;
  uint64_t v13;

  v5 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[HUNCCameraPlayerViewController setHu_playbackControlsAreVisible:](self, "setHu_playbackControlsAreVisible:", v5);
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Transitioning visibility of playback controls:%{BOOL}d", buf, 8u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __125__HUNCCameraPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v9[3] = &unk_1E6F4D200;
  v9[4] = self;
  v10 = v5;
  objc_msgSend(v7, "addCoordinatedAnimations:completion:", v9, 0);

}

void __125__HUNCCameraPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  unint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "miniScrubberViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrubbing");

  if ((v3 & 1) == 0)
  {
    LOBYTE(v4) = *(_BYTE *)(a1 + 40);
    v5 = (double)v4;
    objc_msgSend(*(id *)(a1 + 32), "miniScrubberViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v5);

  }
  LOBYTE(v4) = *(_BYTE *)(a1 + 40);
  v8 = (double)v4;
  objc_msgSend(*(id *)(a1 + 32), "liveButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  v10 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v10, "updateMicrophoneVisibility");
    objc_msgSend(*(id *)(a1 + 32), "updateVolumeControlVisibility");
  }
  else
  {
    objc_msgSend(v10, "liveContentViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "microphoneControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 0.0);

  }
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  -[HUNCCameraPlayerViewController _updateStateForPlaybackPosition:animated:](self, "_updateStateForPlaybackPosition:animated:", a4, 1);
  -[HUNCCameraPlayerViewController updateMicrophone](self, "updateMicrophone");
}

- (void)playbackEngine:(id)a3 didUpdateScrubbingStatus:(BOOL)a4
{
  -[HUNCCameraPlayerViewController _updateStateForScrubbingStatus:animated:](self, "_updateStateForScrubbingStatus:animated:", a4, 1);
}

- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4
{
  -[HUNCCameraPlayerViewController _updateLivePreviewAspectRatio](self, "_updateLivePreviewAspectRatio", a3, a4);
  -[HUNCCameraPlayerViewController updateMicrophone](self, "updateMicrophone");
  -[HUNCCameraPlayerViewController updateVolumeControlVisibility](self, "updateVolumeControlVisibility");
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUNCCameraPlayerViewController updateMicrophone](self, "updateMicrophone");
  -[HUNCCameraPlayerViewController updateVolumeControlVisibility](self, "updateVolumeControlVisibility");
  -[HUNCCameraPlayerViewController launchEvent](self, "launchEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 2 && v7)
  {
    -[HUNCCameraPlayerViewController clipUUID](self, "clipUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Send Clip playback launch event after time control update.", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(v6, "currentClip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNCCameraPlayerViewController launchEvent](self, "launchEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCameraClip:", v11);

      -[HUNCCameraPlayerViewController launchEvent](self, "launchEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "launchedRecordingWithError:", 0);
    }
    else
    {
      if (v10)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Send Live Stream launch event after time control update.", (uint8_t *)&v20, 2u);
      }

      -[HUNCCameraPlayerViewController launchEvent](self, "launchEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "launchedStreamWithError:", 0);
    }

    -[HUNCCameraPlayerViewController setLaunchEvent:](self, "setLaunchEvent:", 0);
    goto LABEL_15;
  }
  if (a4 == 2)
  {
LABEL_15:
    -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShouldShowLoadingIndicatorForClipPlayback:", 0);

    -[HUNCCameraPlayerViewController placeholderContentViewController](self, "placeholderContentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1;
    goto LABEL_16;
  }
  if (a4 == 1 && objc_msgSend(v6, "engineMode") == 1)
  {
    -[HUNCCameraPlayerViewController placeholderContentViewController](self, "placeholderContentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 0;
LABEL_16:
    objc_msgSend(v15, "setHidden:", v17);

  }
  -[HUNCCameraPlayerViewController updateLiveButton](self, "updateLiveButton");
  HFLogForCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134218242;
    v21 = a4;
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEBUG, "Updated timecontrol status:%lu for %@", (uint8_t *)&v20, 0x16u);
  }

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
  block[2] = __72__HUNCCameraPlayerViewController_playbackEngine_didUpdatePlaybackError___block_invoke;
  block[3] = &unk_1E6F4E020;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__HUNCCameraPlayerViewController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
        return;
      }
      HFLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 48);
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(NC) Send Clip playback failure launch event for error:%@", (uint8_t *)&v10, 0xCu);
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
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "(NC) Send stream failure launch event for error:%@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "launchEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "launchedStreamWithError:", *(_QWORD *)(a1 + 48));
    }

    goto LABEL_11;
  }
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[16];

  v7 = objc_opt_class();
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cameraEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

LABEL_7:
    v12 = 0;
  }

  -[HUNCCameraPlayerViewController setCurrentClip:](self, "setCurrentClip:", v12);
  -[HUNCCameraPlayerViewController playbackStartDateFromSignificantEvent](self, "playbackStartDateFromSignificantEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HUNCCameraPlayerViewController reloadForCurrentClip](self, "reloadForCurrentClip");
  }
  else
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEBUG, "No playback start date. Waiting until fetch complete.", buf, 2u);
    }

  }
}

- (double)currentScrubberResolutionForBehavior:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[HUNCCameraPlayerViewController miniScrubberViewController](self, "miniScrubberViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentScrubberResolution");
  v5 = v4;

  return v5;
}

- (void)playbackControlsDidToggleMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersAudioEnabled:", v3);

}

- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowLoadingIndicatorForClipPlayback:", v3);

}

- (void)playbackControlsDidChangePlayerVolume:(float)a3
{
  double v4;
  id v5;

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setStreamAudioVolume:", v4);

}

- (void)_updateCameraStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[HUNCCameraPlayerViewController accessoryViewController](self, "accessoryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hu_reloadData");

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "engineMode");

  if (!v5)
  {
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "play");

  }
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUNCCameraPlayerViewController cameraItem](self, "cameraItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_debug_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEBUG, "Updated camera itemManager:%@ for item:%@", (uint8_t *)&v11, 0x16u);
    }

    -[HUNCCameraPlayerViewController _updateCameraStatus](self, "_updateCameraStatus");
  }

}

- (void)updateMicrophone
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  _BOOL4 v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_supportsBidirectionalAudio");

  if (v4)
  {
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMicrophoneEnabled");
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "microphoneControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTalking:", v6);

    -[HUNCCameraPlayerViewController updateMicrophoneVisibility](self, "updateMicrophoneVisibility");
  }
  else
  {
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "microphoneControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.0);

  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hf_supportsBidirectionalAudio");
    -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "microphoneControl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alpha");
    v17 = v16 == 0.0;
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = 67109632;
    v19[1] = v13;
    v20 = 1024;
    v21 = v17;
    v22 = 1024;
    v23 = objc_msgSend(v18, "isLiveStreamPlaying");
    _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "MicrophoneDisplay: BiDirectionalAudio:%{BOOL}d PortraitHidden:%{BOOL}d LiveStreaming:%{BOOL}d", (uint8_t *)v19, 0x14u);

  }
}

- (void)updateMicrophoneVisibility
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v3 = -[HUNCCameraPlayerViewController shouldDisplayMicrophoneControl](self, "shouldDisplayMicrophoneControl");
  -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "microphoneControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.0;
  if (v3)
    v6 = 1.0;
  objc_msgSend(v4, "setAlpha:", v6);

}

- (BOOL)shouldDisplayMicrophoneControl
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HUNCCameraPlayerViewController cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hf_supportsBidirectionalAudio"))
  {
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isLiveStreamPlaying"))
      v5 = -[HUNCCameraPlayerViewController hu_playbackControlsAreVisible](self, "hu_playbackControlsAreVisible");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)toggleMicrophoneState
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMicrophoneEnabled") ^ 1;
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMicrophoneEnabled:", v4);

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 67109120;
    v16[1] = objc_msgSend(v7, "isMicrophoneEnabled");
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Toggled microphone state:%{BOOL}d.", (uint8_t *)v16, 8u);

  }
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMicrophoneEnabled");

  -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "microphoneControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "setTalking:", 1);

    -[HUNCCameraPlayerViewController playerController](self, "playerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMuted:", 0);
  }
  else
  {
    objc_msgSend(v11, "setTalking:", 0);

    -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "prefersAudioEnabled") ^ 1;
    -[HUNCCameraPlayerViewController playerController](self, "playerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMuted:", v14);

  }
}

- (void)updateVolumeControlVisibility
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "shouldDisplayVolumeControls");
  -[HUNCCameraPlayerViewController behavior](self, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behaviorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackControlsIncludeVolumeControls:", v3);

}

- (void)updateLiveButton
{
  void *v3;
  id v4;

  -[HUNCCameraPlayerViewController liveButtonView](self, "liveButtonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDisplayForStreaming:", objc_msgSend(v3, "isLiveStreamPlaying"));

}

- (HUCameraLiveButtonView)liveButtonView
{
  HUCameraLiveButtonView *liveButtonView;
  HUCameraLiveButtonView *v4;
  HUCameraLiveButtonView *v5;

  liveButtonView = self->_liveButtonView;
  if (!liveButtonView)
  {
    v4 = objc_alloc_init(HUCameraLiveButtonView);
    -[HUCameraLiveButtonView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_liveButtonView;
    self->_liveButtonView = v4;

    liveButtonView = self->_liveButtonView;
  }
  return liveButtonView;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  HUNCCameraPlayerViewController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  -[HUNCCameraPlayerViewController playbackEngine](self, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[HUNCCameraPlayerViewController miniScrubberViewController](self, "miniScrubberViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[HUNCCameraPlayerViewController miniScrubberViewController](self, "miniScrubberViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNCCameraPlayerViewController removeChildViewController:](self, "removeChildViewController:", v8);

  -[HUNCCameraPlayerViewController setMiniScrubberViewController:](self, "setMiniScrubberViewController:", 0);
  -[HUNCCameraPlayerViewController setDelegate:](self, "setDelegate:", 0);
  -[HUNCCameraPlayerViewController setPlaybackEngine:](self, "setPlaybackEngine:", 0);
  -[HUNCCameraPlayerViewController liveContentViewController](self, "liveContentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[HUNCCameraPlayerViewController setLiveContentViewController:](self, "setLiveContentViewController:", 0);
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = self;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  v13.receiver = self;
  v13.super_class = (Class)HUNCCameraPlayerViewController;
  -[HUNCCameraPlayerViewController dealloc](&v13, sel_dealloc);
}

- (unint64_t)numberOfAssociatedAccessoriesDisplayed
{
  return self->_numberOfAssociatedAccessoriesDisplayed;
}

- (void)setNumberOfAssociatedAccessoriesDisplayed:(unint64_t)a3
{
  self->_numberOfAssociatedAccessoriesDisplayed = a3;
}

- (void)setLiveButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_liveButtonView, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
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

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeStrong((id *)&self->_playbackEngine, a3);
}

- (HUCameraPlayerAVBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

- (HUCameraPlayerLiveContentViewController)liveContentViewController
{
  return self->_liveContentViewController;
}

- (void)setLiveContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_liveContentViewController, a3);
}

- (HUNCCameraScrubberViewController)miniScrubberViewController
{
  return self->_miniScrubberViewController;
}

- (void)setMiniScrubberViewController:(id)a3
{
  objc_storeStrong((id *)&self->_miniScrubberViewController, a3);
}

- (HUCameraPlayerAccessoryViewController)accessoryViewController
{
  return self->_accessoryViewController;
}

- (void)setAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewController, a3);
}

- (HUNCCameraPlayerPlaceholderContentViewController)placeholderContentViewController
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

- (NAUILayoutConstraintSet)staticConstraintSet
{
  return self->_staticConstraintSet;
}

- (void)setStaticConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraintSet, a3);
}

- (NAUILayoutConstraintSet)scrubberConstraintSet
{
  return self->_scrubberConstraintSet;
}

- (void)setScrubberConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_scrubberConstraintSet, a3);
}

- (HMCameraClip)currentClip
{
  return (HMCameraClip *)objc_loadWeakRetained((id *)&self->_currentClip);
}

- (void)setCurrentClip:(id)a3
{
  objc_storeWeak((id *)&self->_currentClip, a3);
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUUID, a3);
}

- (NSUUID)clipUUID
{
  return self->_clipUUID;
}

- (void)setClipUUID:(id)a3
{
  objc_storeStrong((id *)&self->_clipUUID, a3);
}

- (NSDate)playbackStartDateFromSignificantEvent
{
  return self->_playbackStartDateFromSignificantEvent;
}

- (void)setPlaybackStartDateFromSignificantEvent:(id)a3
{
  objc_storeStrong((id *)&self->_playbackStartDateFromSignificantEvent, a3);
}

- (BOOL)hu_playbackControlsAreVisible
{
  return self->_hu_playbackControlsAreVisible;
}

- (void)setHu_playbackControlsAreVisible:(BOOL)a3
{
  self->_hu_playbackControlsAreVisible = a3;
}

- (HFCameraAnalyticsCameraPlayerLaunchEvent)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_launchEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchEvent, 0);
  objc_storeStrong((id *)&self->_playbackStartDateFromSignificantEvent, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_destroyWeak((id *)&self->_currentClip);
  objc_storeStrong((id *)&self->_scrubberConstraintSet, 0);
  objc_storeStrong((id *)&self->_staticConstraintSet, 0);
  objc_storeStrong((id *)&self->_blurViewController, 0);
  objc_storeStrong((id *)&self->_placeholderContentViewController, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_miniScrubberViewController, 0);
  objc_storeStrong((id *)&self->_liveContentViewController, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_liveButtonView, 0);
}

@end
