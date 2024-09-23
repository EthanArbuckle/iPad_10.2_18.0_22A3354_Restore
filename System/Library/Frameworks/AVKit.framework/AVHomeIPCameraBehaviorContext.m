@implementation AVHomeIPCameraBehaviorContext

- (AVHomeIPCameraBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  id v5;
  id v6;
  id WeakRetained;
  AVObservationController *v8;
  AVObservationController *observationController;
  UIView *v10;
  UIView *livePreviewContainerView;
  double v12;
  double v13;
  AVZoomingBehavior *v14;
  AVZoomingBehavior *zoomingBehavior;

  v4 = a3;
  if (self)
  {
    *(_DWORD *)&self->_playbackControlsIncludeTransportControls = 16843008;
    self->_playbackControlsShowsLoadingIndicator = 0;
    v5 = objc_storeWeak((id *)&self->_playerViewController, v4);
    *(_WORD *)&self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = 1;
    v6 = v5;
    objc_msgSend(v4, "setRequiresImmediateAssetInspection:", 1);

    WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);
    objc_msgSend(WeakRetained, "setCanDisplayContentInDetachedWindow:", 0);

    v8 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
    observationController = self->_observationController;
    self->_observationController = v8;

    self->_livePreviewAspectRatio = (CGSize)xmmword_1AC5F8230;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    livePreviewContainerView = self->_livePreviewContainerView;
    self->_livePreviewContainerView = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_livePreviewContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setHidden:](self->_livePreviewContainerView, "setHidden:", 1);
    -[UIView setUserInteractionEnabled:](self->_livePreviewContainerView, "setUserInteractionEnabled:", 0);
    LODWORD(v12) = 1132068864;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_livePreviewContainerView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1132068864;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_livePreviewContainerView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    v14 = objc_alloc_init(AVZoomingBehavior);
    zoomingBehavior = self->_zoomingBehavior;
    self->_zoomingBehavior = v14;

    self->_hasMicrophone = 1;
  }

  return self;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVHomeIPCameraBehaviorContext observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVHomeIPCameraBehaviorContext;
  -[AVHomeIPCameraBehaviorContext dealloc](&v4, sel_dealloc);
}

- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3
{
  self->_playbackControlsIncludeVolumeControls = a3;
  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
}

- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3
{
  self->_playbackControlsIncludeDisplayModeControls = a3;
  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
}

- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3
{
  self->_playbackControlsIncludeTransportControls = a3;
  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
}

- (void)setZoomingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v7 = 136315650;
    v8 = "-[AVHomeIPCameraBehaviorContext setZoomingEnabled:]";
    v10 = "zoomingEnabled";
    v9 = 2080;
    if (v3)
      v6 = "YES";
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  self->_zoomingEnabled = v3;
  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
}

- (void)setLivePreviewActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  AVHomeIPCameraPlayerController *v9;
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
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_livePreviewActive != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v21 = 136315650;
      v22 = "-[AVHomeIPCameraBehaviorContext setLivePreviewActive:]";
      v24 = "livePreviewActive";
      v23 = 2080;
      if (v3)
        v6 = "YES";
      v25 = 2080;
      v26 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v21, 0x20u);
    }

    self->_livePreviewActive = v3;
    if (v3)
    {
      -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playerController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraBehaviorContext setPlayerControllerToRestore:](self, "setPlayerControllerToRestore:", v8);

      v9 = objc_alloc_init(AVHomeIPCameraPlayerController);
      -[AVHomeIPCameraBehaviorContext behavior](self, "behavior");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraPlayerController setDelegate:](v9, "setDelegate:", v10);

      -[AVHomeIPCameraBehaviorContext livePreviewAspectRatio](self, "livePreviewAspectRatio");
      -[AVHomeIPCameraPlayerController setPresentationSize:](v9, "setPresentationSize:");
      -[AVHomeIPCameraBehaviorContext playerControllerToRestore](self, "playerControllerToRestore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraPlayerController setMuted:](v9, "setMuted:", objc_msgSend(v11, "isMuted"));

      -[AVHomeIPCameraBehaviorContext setLivePreviewPlayerController:](self, "setLivePreviewPlayerController:", v9);
      -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPlayerController:", v9);

      -[AVHomeIPCameraBehaviorContext _updatePictureInPictureController](self, "_updatePictureInPictureController");
    }
    else
    {
      -[AVHomeIPCameraBehaviorContext playerControllerToRestore](self, "playerControllerToRestore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playerController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMuted:", objc_msgSend(v15, "isMuted"));

      -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraBehaviorContext playerControllerToRestore](self, "playerControllerToRestore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPlayerController:", v17);

      -[AVHomeIPCameraBehaviorContext setPlayerControllerToRestore:](self, "setPlayerControllerToRestore:", 0);
      -[AVHomeIPCameraBehaviorContext setLivePreviewPlayerController:](self, "setLivePreviewPlayerController:", 0);
      -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
      v9 = (AVHomeIPCameraPlayerController *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraPlayerController playbackControlsController](v9, "playbackControlsController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pictureInPictureController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setControlsStyle:", 0);

    }
    -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
    -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", -[AVHomeIPCameraBehaviorContext isLivePreviewActive](self, "isLivePreviewActive") ^ 1);

  }
}

- (void)setHasMicrophone:(BOOL)a3
{
  if (self->_hasMicrophone != a3)
  {
    self->_hasMicrophone = a3;
    -[AVHomeIPCameraBehaviorContext _updatePictureInPictureController](self, "_updatePictureInPictureController");
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  if (self->_microphoneEnabled != a3)
  {
    self->_microphoneEnabled = a3;
    -[AVHomeIPCameraBehaviorContext _updatePictureInPictureController](self, "_updatePictureInPictureController");
  }
}

- (void)setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground != a3)
  {
    v3 = a3;
    self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVHomeIPCameraBehaviorContext setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:]";
      v10 = "canStartPictureInPictureAutomaticallyWhenEnteringBackground";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    -[AVHomeIPCameraBehaviorContext _updatePictureInPictureController](self, "_updatePictureInPictureController");
  }
}

- (void)setPlaybackControlsIncludePictureInPictureButton:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_playbackControlsIncludePictureInPictureButton != a3)
  {
    v3 = a3;
    self->_playbackControlsIncludePictureInPictureButton = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVHomeIPCameraBehaviorContext setPlaybackControlsIncludePictureInPictureButton:]";
      v10 = "playbackControlsIncludePictureInPictureButton";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
  }
}

- (void)setLivePreviewAspectRatio:(CGSize)a3
{
  double height;
  double width;
  void *v6;

  height = a3.height;
  width = a3.width;
  self->_livePreviewAspectRatio = a3;
  -[AVHomeIPCameraBehaviorContext livePreviewPlayerController](self, "livePreviewPlayerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresentationSize:", width, height);

  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
}

- (void)setBackgroundColor:(id)a3 forContainerOfControlItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadViewIfNeeded");

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loadPlaybackControlsViewIfNeeded");

  v10 = objc_msgSend(v6, "type");
  if (!v10)
  {
    -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "screenModeControls");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v10 == 1)
  {
    -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playbackControlsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "volumeControls");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = v14;
    objc_msgSend(v14, "setBackgroundColor:", v16);

  }
}

- (void)didAddBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBehavior:", v6);

  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
  -[AVHomeIPCameraBehaviorContext observationController](self, "observationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerViewControllerDidChangePlayerControllerNotification"), v8, 0, &__block_literal_global_9648);

  -[AVHomeIPCameraBehaviorContext observationController](self, "observationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlaybackControlsControllsShowsLoadingIndicatorNotification"), 0, 0, &__block_literal_global_13_9649);

  -[AVHomeIPCameraBehaviorContext livePreviewPlayerController](self, "livePreviewPlayerController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v4);

}

- (void)didRemoveBehavior:(id)a3
{
  void *v3;
  id v4;

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackControlsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVolumeControlsForContentWithNoAudio:", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
  -[AVHomeIPCameraBehaviorContext _updatePictureInPictureController](self, "_updatePictureInPictureController");
  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVideoGravityButton:", 0);

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackControlsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsVolumeControlsForContentWithNoAudio:", 1);

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentOverlayViewPlacement:", 1);

}

- (void)willStartPictureInPictureWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v10);

  -[AVHomeIPCameraBehaviorContext _updatePictureInPictureController](self, "_updatePictureInPictureController");
}

- (void)didStopPictureInPicture
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

  -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behaviorContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerLayerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "behaviorContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerLayerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v14);

  -[AVHomeIPCameraBehaviorContext _updatePlaybackControlsControllerAndZoomingBehavior](self, "_updatePlaybackControlsControllerAndZoomingBehavior");
}

- (void)beginScrubbing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginScrubbing");

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackControlsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForcePlaybackControlsHidden:", 1);

}

- (void)scrubToTime:(double)a3 resolution:(double)a4
{
  void *v6;
  id v7;

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playbackControlsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrubToTime:resolution:", a3, a4);

}

- (void)endScrubbing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForcePlaybackControlsHidden:", 0);

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackControlsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endScrubbing");

}

- (void)_updatePlaybackControlsControllerAndZoomingBehavior
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPlaybackControlsIncludeDisplayModeControls:", -[AVHomeIPCameraBehaviorContext playbackControlsIncludeDisplayModeControls](self, "playbackControlsIncludeDisplayModeControls"));
  objc_msgSend(v33, "setPlaybackControlsIncludeVolumeControls:", -[AVHomeIPCameraBehaviorContext playbackControlsIncludeVolumeControls](self, "playbackControlsIncludeVolumeControls"));
  objc_msgSend(v33, "setPlaybackControlsIncludeTransportControls:", -[AVHomeIPCameraBehaviorContext playbackControlsIncludeTransportControls](self, "playbackControlsIncludeTransportControls"));
  objc_msgSend(v33, "playbackControlsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsVideoGravityButton:", 0);

  objc_msgSend(v33, "setCanShowPictureInPictureButton:", -[AVHomeIPCameraBehaviorContext playbackControlsIncludePictureInPictureButton](self, "playbackControlsIncludePictureInPictureButton"));
  -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPictureInPictureActive") & 1) == 0)
    {
      -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "behaviorContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activeContentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playerLayerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_7;
      -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "behaviorContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeContentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playerLayerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v15);

      v16 = (void *)MEMORY[0x1E0CB3718];
      -[AVHomeIPCameraBehaviorContext livePreviewContainerView](self, "livePreviewContainerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "behaviorContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeContentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "playerLayerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateConstraints:", v20);

    }
  }

LABEL_7:
  if (-[AVHomeIPCameraBehaviorContext isLivePreviewActive](self, "isLivePreviewActive"))
  {
    -[AVHomeIPCameraBehaviorContext livePreviewAspectRatio](self, "livePreviewAspectRatio");
    v22 = v21;
    v24 = v23;
  }
  else
  {
    -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "playerController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentDimensions");
    v22 = v27;
    v24 = v28;

  }
  if (v22 > 0.0 && v24 > 0.0)
  {
    -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "behaviorContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContentAspectRatio:", v22, v24);

  }
  -[AVHomeIPCameraBehaviorContext zoomingBehavior](self, "zoomingBehavior");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "behaviorContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setZoomingEnabled:", -[AVHomeIPCameraBehaviorContext isZoomingEnabled](self, "isZoomingEnabled"));

}

- (void)_updatePictureInPictureController
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
  id v13;

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pictureInPictureController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setControlsStyle:", -[AVHomeIPCameraBehaviorContext isLivePreviewActive](self, "isLivePreviewActive"));

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playbackControlsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pictureInPictureController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pictureInPictureViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldShowAlternateActionButtonImage:", -[AVHomeIPCameraBehaviorContext hasMicrophone](self, "hasMicrophone"));

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playbackControlsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pictureInPictureController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMicrophoneEnabled:", -[AVHomeIPCameraBehaviorContext isMicrophoneEnabled](self, "isMicrophoneEnabled"));

  -[AVHomeIPCameraBehaviorContext playerViewController](self, "playerViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:", -[AVHomeIPCameraBehaviorContext canStartPictureInPictureAutomaticallyWhenEnteringBackground](self, "canStartPictureInPictureAutomaticallyWhenEnteringBackground"));

}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (AVHomeIPCameraBehavior)behavior
{
  return (AVHomeIPCameraBehavior *)objc_loadWeakRetained((id *)&self->_behavior);
}

- (void)setBehavior:(id)a3
{
  objc_storeWeak((id *)&self->_behavior, a3);
}

- (BOOL)playbackControlsIncludeTransportControls
{
  return self->_playbackControlsIncludeTransportControls;
}

- (BOOL)playbackControlsIncludeDisplayModeControls
{
  return self->_playbackControlsIncludeDisplayModeControls;
}

- (BOOL)playbackControlsIncludeVolumeControls
{
  return self->_playbackControlsIncludeVolumeControls;
}

- (BOOL)isZoomingEnabled
{
  return self->_zoomingEnabled;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (UIView)livePreviewContainerView
{
  return self->_livePreviewContainerView;
}

- (BOOL)isLivePreviewActive
{
  return self->_livePreviewActive;
}

- (BOOL)hasMicrophone
{
  return self->_hasMicrophone;
}

- (BOOL)canStartPictureInPictureAutomaticallyWhenEnteringBackground
{
  return self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground;
}

- (BOOL)playbackControlsIncludePictureInPictureButton
{
  return self->_playbackControlsIncludePictureInPictureButton;
}

- (CGSize)livePreviewAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_livePreviewAspectRatio.width;
  height = self->_livePreviewAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (AVZoomingBehavior)zoomingBehavior
{
  return self->_zoomingBehavior;
}

- (void)setZoomingBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_zoomingBehavior, a3);
}

- (AVHomeIPCameraPlayerController)livePreviewPlayerController
{
  return (AVHomeIPCameraPlayerController *)objc_loadWeakRetained((id *)&self->_livePreviewPlayerController);
}

- (void)setLivePreviewPlayerController:(id)a3
{
  objc_storeWeak((id *)&self->_livePreviewPlayerController, a3);
}

- (AVPlayerController)playerControllerToRestore
{
  return self->_playerControllerToRestore;
}

- (void)setPlayerControllerToRestore:(id)a3
{
  objc_storeStrong((id *)&self->_playerControllerToRestore, a3);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setObservationController:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (BOOL)playbackControlsShowsLoadingIndicator
{
  return self->_playbackControlsShowsLoadingIndicator;
}

- (void)setPlaybackControlsShowsLoadingIndicator:(BOOL)a3
{
  self->_playbackControlsShowsLoadingIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_playerControllerToRestore, 0);
  objc_destroyWeak((id *)&self->_livePreviewPlayerController);
  objc_storeStrong((id *)&self->_zoomingBehavior, 0);
  objc_storeStrong((id *)&self->_livePreviewContainerView, 0);
  objc_destroyWeak((id *)&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

void __48__AVHomeIPCameraBehaviorContext_didAddBehavior___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVPlaybackControlsControllerShowsLoadingIndicatorValueKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v5, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playbackControlsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v11)
  {

LABEL_5:
    v13 = v14;
    goto LABEL_6;
  }
  v12 = objc_msgSend(v14, "playbackControlsShowsLoadingIndicator");

  v13 = v14;
  if ((_DWORD)v8 != v12)
  {
    objc_msgSend(v14, "setPlaybackControlsShowsLoadingIndicator:", v8);
    objc_msgSend(v14, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackControlsDidUpdateVisibilityOfLoadingIndicator:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

void __48__AVHomeIPCameraBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "setLivePreviewActive:", 0);

}

@end
