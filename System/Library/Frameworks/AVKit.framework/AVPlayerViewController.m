@implementation AVPlayerViewController

- (int64_t)avkit_contentSourceType
{
  return 0;
}

- (AVPresentationContext)presentationContext
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _transitionController](self, "_transitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPresentationContext *)v3;
}

- (AVTransitionController)_transitionController
{
  AVTransitionController *transitionController;
  AVTransitionController *v4;
  AVTransitionController *v5;

  transitionController = self->_transitionController;
  if (!transitionController)
  {
    v4 = objc_alloc_init(AVTransitionController);
    v5 = self->_transitionController;
    self->_transitionController = v4;

    -[AVTransitionController setDelegate:](self->_transitionController, "setDelegate:", self);
    transitionController = self->_transitionController;
  }
  return transitionController;
}

- (BOOL)hasActiveTransition
{
  void *v4;
  void *v5;
  char v6;

  if ((-[AVPlayerViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || (-[AVPlayerViewController isBeingPresented](self, "isBeingPresented") & 1) != 0)
  {
    return 1;
  }
  -[AVPlayerViewController _transitionControllerIfLoaded](self, "_transitionControllerIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasActiveTransition");

  return v6;
}

- (UIViewController)fullScreenViewController
{
  void *v3;
  void *v4;
  AVPlayerViewController *v5;
  AVPlayerViewController *v6;
  NSObject *v7;
  uint8_t v9[16];

  -[AVPlayerViewController _transitionControllerIfLoaded](self, "_transitionControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
    if (v5 && v5 != self)
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Unexpected value for the transition controller's presentedViewController", v9, 2u);
      }

      v6 = 0;
    }
  }

  return (UIViewController *)v6;
}

- (id)_transitionControllerIfLoaded
{
  return self->_transitionController;
}

- (BOOL)isAudioOnlyContent
{
  void *v2;
  char v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") == 2 && (objc_msgSend(v2, "hasEnabledVideo") & 1) == 0)
    v3 = objc_msgSend(v2, "hasEnabledAudio");
  else
    v3 = 0;
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315906;
    v7 = "-[AVPlayerViewController isAudioOnlyContent]";
    v8 = 2048;
    v9 = objc_msgSend(v2, "status");
    v10 = 1024;
    v11 = objc_msgSend(v2, "hasEnabledVideo");
    v12 = 1024;
    v13 = objc_msgSend(v2, "hasEnabledAudio");
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s .status: %ld .hasEnabledVideo: %d .hasEnabledAudio: %d", (uint8_t *)&v6, 0x22u);
  }

  return v3;
}

- (BOOL)avkit_isVisible
{
  void *v2;
  BOOL v3;
  CGRect v5;

  -[AVPlayerViewController contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v3 = !CGRectIsEmpty(v5);

  return v3;
}

- (void)_updatePlayerLayerLegibleContentInsetsIfNeeded
{
  void *v3;
  double left;
  double top;
  double right;
  double bottom;
  void *v8;
  _BOOL4 pipStartingOrActive;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  -[AVPlayerViewController playerLayerView](self, "playerLayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerLayer");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    top = self->_legibleContentInsets.top;
    left = self->_legibleContentInsets.left;
    bottom = self->_legibleContentInsets.bottom;
    right = self->_legibleContentInsets.right;
    -[AVPlayerViewController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isPlayingOnSecondScreen") & 1) == 0)
    {
      pipStartingOrActive = self->_pipStartingOrActive;

      if (pipStartingOrActive)
      {
LABEL_8:
        objc_msgSend(v26, "setLegibleContentInsets:", top, left, bottom, right);
        goto LABEL_9;
      }
      -[AVPlayerViewController contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v25 = v11;
      v13 = v12;

      -[AVPlayerViewController videoBounds](self, "videoBounds");
      v15 = v14;
      v17 = v16;
      v24 = v18;
      v20 = v19;
      top = top - v16;
      left = left - v14;
      -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentTabPresentationContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "presentationHeight");
      v23 = v13 - v22;
      if (v23 >= v13 - bottom)
        v23 = v13 - bottom;
      bottom = v17 + v20 - v23;
      right = v15 + v24 - (v25 - right);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (__AVPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (CGRect)videoBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoBounds.origin.x;
  y = self->_videoBounds.origin.y;
  width = self->_videoBounds.size.width;
  height = self->_videoBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)updateVideoBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __AVPlayerLayerView *playerLayerView;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[__AVPlayerLayerView videoBounds](self->_playerLayerView, "videoBounds");
    if (v8 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      playerLayerView = self->_playerLayerView;
      -[__AVPlayerLayerView videoBounds](playerLayerView, "videoBounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      -[AVPlayerViewController contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__AVPlayerLayerView convertRect:toView:](playerLayerView, "convertRect:toView:", v19, v12, v14, v16, v18);

      -[AVPlayerViewController contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      UIPointRoundToViewScale();
      v3 = v21;
      v4 = v22;

      -[AVPlayerViewController contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToViewScale();
      v5 = v24;

      -[AVPlayerViewController contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToViewScale();
      v6 = v26;

    }
  }
  -[AVPlayerViewController setVideoBounds:](self, "setVideoBounds:", v3, v4, v5, v6);
  -[AVPlayerViewController _updatePlayerLayerLegibleContentInsetsIfNeeded](self, "_updatePlayerLayerLegibleContentInsetsIfNeeded");
}

- (AVPlayerViewControllerContentView)contentView
{
  return self->_playerViewControllerContentView;
}

- (void)setVideoBounds:(CGRect)a3
{
  self->_videoBounds = a3;
}

uint64_t __67__AVPlayerViewController__startPlayerLayerViewObservationsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateVideoBounds");
}

void __39__AVPlayerViewController__addObservers__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;

  v13 = a2;
  v5 = a4;
  objc_msgSend(v13, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rate");
  v8 = v7;

  if (v8 != 0.0)
  {
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVNowPlayingInfoSkipCommandDirectionKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (v11)
      v12 = 2;
    else
      v12 = 1;
    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v13, v12);
  }

}

void __67__AVPlayerViewController__createPictureInPictureControllerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "playbackControlsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_shouldShowPictureInPictureButton");

  objc_msgSend(v4, "setShowsPictureInPictureButton:", v3);
}

- (void)addBehavior:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController _ensureBehaviorStorage](self, "_ensureBehaviorStorage");
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBehavior:", v4);

}

- (AVBehaviorStorage)_behaviorStorage
{
  -[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls");
  return self->__behaviorStorage;
}

- (CGRect)avkit_videoRectInWindow
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[AVPlayerViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "convertRect:fromView:", v14, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[AVPlayerViewController playerController](self, "playerController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v23, "isPlayingOnExternalScreen");

  if ((v4 & 1) == 0)
  {
    -[AVPlayerViewController avkit_window](self, "avkit_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[__AVPlayerLayerView videoBounds](self->_playerLayerView, "videoBounds");
    objc_msgSend(v24, "convertRect:fromView:", self->_playerLayerView);
    v16 = v25;
    v18 = v26;
    v20 = v27;
    v22 = v28;

  }
  v29 = v16;
  v30 = v18;
  v31 = v20;
  v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_updatePlaybackControlsState
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  _BOOL4 v6;
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
  uint64_t v17;
  uint64_t v18;

  v3 = -[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen");
  v4 = -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline");
  if (-[AVPlayerViewController avkit_isEffectivelyFullScreen](self, "avkit_isEffectivelyFullScreen"))
  {
    -[AVPlayerViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = -[AVPlayerViewController allowsEnteringFullScreen](self, "allowsEnteringFullScreen");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    v6 = 1;
    objc_msgSend(v7, "setShowsDoneButtonWhenFullScreen:", 1);
  }
  else
  {
    -[AVPlayerViewController presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "setShowsDoneButtonWhenFullScreen:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShowsDoneButtonWhenFullScreen:", objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.iBooks")));

    }
  }

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsPlaybackControls:", -[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"));

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsPictureInPictureButton:", -[AVPlayerViewController _shouldShowPictureInPictureButton](self, "_shouldShowPictureInPictureButton"));

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlayerViewControllerHasInvalidViewControllerHierarchy:", -[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController") ^ 1);

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPlayerViewControllerIsPresentingFullScreen:", v4);

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPlayerViewControllerIsPresentedFullScreen:", v3);

  v17 = 2;
  if (v6)
    v17 = 0;
  if (v3)
    v18 = 1;
  else
    v18 = v17;
  -[AVMobileFullscreenController updatePresentationStateTo:](self->_fullscreenController, "updatePresentationStateTo:", v18);
  -[AVPlayerViewController _updateScrubbingGestureEnabledState]((uint64_t)self);
  -[AVPlayerViewController _updateContentOverlayViewSuperview](self, "_updateContentOverlayViewSuperview");
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
}

- (AVPlaybackControlsController)playbackControlsController
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _chromeControlsViewController](self, "_chromeControlsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackControlsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlaybackControlsController *)v3;
}

- (id)_chromeControlsViewController
{
  void *v2;
  void *v3;

  -[AVPlayerViewController controlsViewController](self, "controlsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controlsViewControllerIfChromed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVMobileControlsViewController)controlsViewController
{
  AVMobileControlsViewController *controlsViewController;
  AVMobileControlsViewController *v4;
  AVMobileControlsViewController *v5;

  controlsViewController = self->_controlsViewController;
  if (!controlsViewController)
  {
    -[AVPlayerViewController _createPreferredControlsViewController]((uint64_t)self);
    v4 = (AVMobileControlsViewController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_controlsViewController;
    self->_controlsViewController = v4;

    -[AVPlayerViewController _updateControlsViewControllerInitialState]((uint64_t)self);
    controlsViewController = self->_controlsViewController;
  }
  return controlsViewController;
}

- (void)setShowsPlaybackControls:(BOOL)showsPlaybackControls
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_showsPlaybackControls != showsPlaybackControls)
  {
    v3 = showsPlaybackControls;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v9 = 136315650;
      v10 = "-[AVPlayerViewController setShowsPlaybackControls:]";
      v12 = "showsPlaybackControls";
      v11 = 2080;
      if (v3)
        v6 = "YES";
      v13 = 2080;
      v14 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
    }

    self->_showsPlaybackControls = v3;
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsPlaybackControls:", self->_showsPlaybackControls);

    -[AVPlayerViewController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowsPlaybackControls:", self->_showsPlaybackControls);

    -[AVPlayerViewController _updateContentOverlayViewSuperview](self, "_updateContentOverlayViewSuperview");
    -[AVPlayerViewController _updateAnalysisViewSuperview](self);
    -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
    -[AVPlayerViewController _setupInfoTabViewController]((id *)&self->super.super.super.isa);
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
    -[AVPlayerViewController _updateSecondScreenConnectionReadyToConnect](self, "_updateSecondScreenConnectionReadyToConnect");
    -[AVPlayerViewController _updateEnhanceDialogueEnabled]((id *)&self->super.super.super.isa);
  }
}

- (void)_updateContentOverlayViewSuperview
{
  void *v3;
  id v4;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentOverlayView:", self->_contentOverlayView);

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasCustomPlaybackControls:", -[AVPlayerViewController hasCustomPlaybackControls](self, "hasCustomPlaybackControls"));

}

- (BOOL)hasCustomPlaybackControls
{
  void *v3;
  BOOL v4;
  void *v6;
  void *v7;

  if (!dyld_program_sdk_at_least()
    || -[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls")
    || !-[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen"))
  {
    return 0;
  }
  -[AVPlayerViewController contentTransitioningDelegate](self, "contentTransitioningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[AVPlayerViewController _actualContentOverlayView](self, "_actualContentOverlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "count") != 0;

  }
  return v4;
}

- (BOOL)avkit_isEffectivelyFullScreen
{
  BOOL v3;
  void *v5;
  void *v6;
  void *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  char v32;
  int v33;
  const char *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
  {
    v3 = !-[AVPlayerViewController modalPresentationStyle](self, "modalPresentationStyle")
      || -[AVPlayerViewController modalPresentationStyle](self, "modalPresentationStyle") == 5
      || -[AVPlayerViewController modalPresentationStyle](self, "modalPresentationStyle") == 8;
    -[AVPlayerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AVPlayerViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[AVPlayerViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertRect:fromView:", v18, v11, v13, v15, v17);

      UISizeRoundToScale();
      v20 = v19;
      v22 = v21;
      -[AVPlayerViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");

      UISizeRoundToScale();
      v26 = v25;
      v28 = v27;
      v29 = v22 == v27 && v20 == v25;
      _AVLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 136316162;
        v34 = "-[AVPlayerViewController avkit_isEffectivelyFullScreen]";
        v35 = 2048;
        v36 = v20;
        v37 = 2048;
        v38 = v22;
        v39 = 2048;
        v40 = v26;
        v41 = 2048;
        v42 = v28;
        _os_log_impl(&dword_1AC4B1000, v30, OS_LOG_TYPE_DEFAULT, "%s view size (%f x %f) vs window size (%f x %f)", (uint8_t *)&v33, 0x34u);
      }

    }
    else
    {
      v29 = 0;
    }
    return v3 || v29;
  }
  else if (-[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen")
         || -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline"))
  {
    return 1;
  }
  else
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isCoveringWindow");

    return v32;
  }
}

- (BOOL)_showsWolfControls
{
  return 0;
}

- (UIEdgeInsets)playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  BOOL v13;
  BOOL v14;
  _BOOL4 v15;
  BOOL v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double Width;
  double Height;
  int v26;
  CGFloat x;
  CGFloat y;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  uint64_t v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  UIEdgeInsets result;

  v4 = a3;
  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentDimensions");
  v7 = v6;
  v9 = v8;

  if (-[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen")
    || -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline")
    || -[AVPlayerViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isPlayingOnExternalScreen") & 1) != 0)
    {
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v4, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayCornerRadius");
    if (v12 <= 0.0)
    {
LABEL_40:

      goto LABEL_41;
    }
    v13 = ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || v9 < 0;
    v14 = v13 && (unint64_t)(v9 - 1) >= 0xFFFFFFFFFFFFFLL;
    v15 = !v14;

    v16 = v7 < 0 || ((v7 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    v17 = v16 && (unint64_t)(v7 - 1) > 0xFFFFFFFFFFFFELL;
    if (!v17 && v15)
    {
      objc_msgSend(v4, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v10 = v18;
      }
      else
      {
        -[AVPlayerViewController presentationContext](self, "presentationContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "presentationWindow");
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[AVPlayerViewController presentationContext](self, "presentationContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentTransition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVPlayerViewController presentationContext](self, "presentationContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "hasActiveTransition") & 1) != 0)
      {
        v23 = objc_msgSend(v10, "_windowInterfaceOrientation");
        if (v23 == objc_msgSend(v11, "finalInterfaceOrientation"))
        {
          objc_msgSend(v4, "bounds");
          Width = CGRectGetWidth(v46);
          objc_msgSend(v10, "bounds");
          Height = CGRectGetHeight(v47);

          if (Width != Height)
            goto LABEL_31;
        }
        else
        {

        }
        v26 = 1;
LABEL_34:
        objc_msgSend(v10, "bounds");
        UIRectGetCenter();
        -[AVCacheLargestInscribedRectInBoundingPath getLargestInscribableRectForView:withCenter:aspectRatio:](self->_cacheLargestInscribedRect, "getLargestInscribableRectForView:withCenter:aspectRatio:", v10);
        x = v48.origin.x;
        y = v48.origin.y;
        v29 = v48.size.width;
        v30 = v48.size.height;
        if (CGRectIsNull(v48))
        {
          objc_msgSend(v10, "traitCollection");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "userInterfaceIdiom");

          if (!v32)
          {
            objc_msgSend(v4, "layoutClass");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "unsignedIntegerValue");

          }
        }
        else
        {
          v34 = x;
          v35 = y;
          v36 = v29;
          v37 = v30;
          if (v26)
          {
            CGRectGetMinX(*(CGRect *)&v34);
            v49.origin.x = x;
            v49.origin.y = y;
            v49.size.width = v29;
            v49.size.height = v30;
            CGRectGetMinY(v49);
          }
          else
          {
            CGRectGetMinY(*(CGRect *)&v34);
            v50.origin.x = x;
            v50.origin.y = y;
            v50.size.width = v29;
            v50.size.height = v30;
            CGRectGetMinX(v50);
          }
        }
        goto LABEL_40;
      }

LABEL_31:
      v26 = 0;
      goto LABEL_34;
    }
  }
LABEL_42:
  UIRoundToViewScale();
  v39 = v38;
  UIRoundToViewScale();
  v41 = v40;

  v42 = v39;
  v43 = v41;
  v44 = v39;
  v45 = v41;
  result.right = v45;
  result.bottom = v44;
  result.left = v43;
  result.top = v42;
  return result;
}

- (BOOL)isPresentingFullScreenFromInline
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isPresentedFullScreen
{
  void *v3;
  BOOL v4;

  -[AVPlayerViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !v3
    && -[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController")
    && -[AVPlayerViewController _modalPresentationStyleIsFullScreen](self, "_modalPresentationStyleIsFullScreen");

  return v4;
}

- (BOOL)_isDescendantOfRootViewController
{
  AVPlayerViewController *v2;
  void *v3;
  AVPlayerViewController *v4;
  AVPlayerViewController *v5;
  void *v6;
  void *v7;
  AVPlayerViewController *v8;
  void *v9;
  int v10;

  v2 = self;
  -[AVPlayerViewController parentViewController](v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v2;
  if (v3)
  {
    v5 = v2;
    do
    {
      -[AVPlayerViewController parentViewController](v5, "parentViewController");
      v4 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();

      -[AVPlayerViewController parentViewController](v4, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v4;
    }
    while (v6);
  }
  -[AVPlayerViewController presentingViewController](v4, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    do
    {
      -[AVPlayerViewController presentingViewController](v4, "presentingViewController");
      v8 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();

      -[AVPlayerViewController presentingViewController](v8, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v8;
    }
    while (v9);
    if (v8)
      goto LABEL_7;
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  v8 = v4;
  if (!v4)
    goto LABEL_9;
LABEL_7:
  v10 = -[AVPlayerViewController isEqual:](v8, "isEqual:", v2) ^ 1;
LABEL_10:

  return v10;
}

- (BOOL)_isTransitioningToOrFromFullScreen
{
  char v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if ((-[AVPlayerViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0)
    v3 = 1;
  else
    v3 = -[AVPlayerViewController isBeingPresented](self, "isBeingPresented");
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBeingPresented") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isBeingDismissed") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "presentingViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v9 == 0;

      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v3 | v5;
}

- (uint64_t)_updateControlsVisibilityPolicyAnimated:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  char v8;
  char v9;
  int v10;
  int v11;
  unsigned __int8 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 1176);
    v5 = objc_msgSend(*(id *)(result + 1072), "presentationState");
    objc_msgSend((id)v3, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPlayingOnExternalScreen");

    v8 = objc_msgSend((id)v3, "showsVisualLookup");
    v9 = objc_msgSend((id)v3, "canHidePlaybackControls");
    if ((v8 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      v10 = objc_msgSend((id)v3, "showsPlaybackControls") ^ 1;
      if ((v10 & 1) == 0 && v5 == 2)
        v10 = objc_msgSend((id)v3, "canIncludePlaybackControlsWhenInline") ^ 1;
    }
    if (*(_BYTE *)(v3 + 1006)
      || *(_BYTE *)(v3 + 1008)
      || (objc_msgSend(*(id *)(v3 + 1696), "isInteractionInProgress") & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      v11 = objc_msgSend((id)v3, "showsPlaybackControls") ^ 1;
    }
    v12 = v9 & (v7 ^ 1) | v11;
    v13 = (v10 | v11) == 0;
    v14 = 1;
    if (v13)
      v14 = 2;
    if (((v4 == 1) & v12) != 0)
      v15 = v14;
    else
      v15 = 0;
    return objc_msgSend(*(id *)(v3 + 1168), "updateVisibilityPolicy:animated:", v15, a2);
  }
  return result;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (BOOL)showsVisualLookup
{
  return self->_showsVisualLookup;
}

- (BOOL)canHidePlaybackControls
{
  return self->_canHidePlaybackControls;
}

- (_QWORD)_updateWantsAnalysisButtonVisibleStateIfNeeded
{
  _QWORD *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;

  if (result)
  {
    v1 = result;
    if (result[212])
    {
      result = (_QWORD *)objc_msgSend(result, "allowsVideoFrameAnalysis");
      if ((_DWORD)result)
      {
        v2 = objc_msgSend(v1, "isPresentingDetachedFullScreen");
        v3 = objc_msgSend(v1, "showsAnalysisButtonIfAvailable");
        v4 = v3;
        if ((v2 & 1) == 0)
        {
          if (*((_BYTE *)v1 + 969))
            v5 = v3;
          else
            v5 = 0;
          if (v5 == 1)
          {
            if (v1[147] == 1)
            {
              v4 = 0;
            }
            else
            {
              objc_msgSend(v1, "contentView");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "playbackControlsView");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = objc_msgSend(v7, "showsPlaybackControls");

            }
          }
        }
        return (_QWORD *)objc_msgSend((id)v1[212], "setWantsAnalysisButtonVisible:", v4);
      }
    }
  }
  return result;
}

- (void)_updateSecondScreenConnectionReadyToConnect
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  AVPlayerViewController *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  if (!-[AVPlayerViewController _isReadyToConnectSynchronousChecks](self, "_isReadyToConnectSynchronousChecks"))
  {
    v9 = self;
    v10 = 0;
LABEL_8:
    -[AVPlayerViewController _setSecondScreenConnectionReadyToConnect:](v9, "_setSecondScreenConnectionReadyToConnect:", v10);
    return;
  }
  -[AVPlayerViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1)
  {
    v9 = self;
    v10 = 1;
    goto LABEL_8;
  }
  if (!self->_isUpdatingSecondScreenConnectionReadyToConnect)
  {
    self->_isUpdatingSecondScreenConnectionReadyToConnect = 1;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.avkit.SharedPreferences"));
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECF1C60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    objc_msgSend(v5, "resume");
    objc_initWeak(&location, self);
    objc_msgSend(v5, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke;
    v11[3] = &unk_1E5BB3038;
    objc_copyWeak(&v13, &location);
    v8 = v5;
    v12 = v8;
    objc_msgSend(v7, "extendedDisplayActive:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (BOOL)_isReadyToConnectSynchronousChecks
{
  void *v3;
  void *v4;
  char v5;

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerContentView window](self->_playerViewControllerContentView, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend(v3, "allowsExternalPlayback")
    && objc_msgSend(v3, "externalPlaybackType") != 1
    && (!-[AVPlayerViewController isBeingDismissed](self, "isBeingDismissed")
     || -[AVSecondScreenConnection isReadyToConnect](self->_secondScreenConnection, "isReadyToConnect")))
  {
    v5 = objc_msgSend(v3, "usesExternalPlaybackWhileExternalScreenIsActive");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setSecondScreenConnectionReadyToConnect:(BOOL)a3
{
  AVSecondScreenContentViewConnection *secondScreenConnection;
  _BOOL8 v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  secondScreenConnection = self->_secondScreenConnection;
  if (secondScreenConnection)
  {
    v5 = a3;
    if (-[AVSecondScreenConnection isReadyToConnect](secondScreenConnection, "isReadyToConnect") != a3)
    {
      _AVLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = "NO";
        v8 = 136315650;
        v9 = "-[AVPlayerViewController _setSecondScreenConnectionReadyToConnect:]";
        v11 = "readyToConnect";
        v10 = 2080;
        if (v5)
          v7 = "YES";
        v12 = 2080;
        v13 = v7;
        _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
      }

      -[AVSecondScreenConnection setReadyToConnect:](self->_secondScreenConnection, "setReadyToConnect:", v5);
    }
  }
}

- (BOOL)_shouldShowPictureInPictureButton
{
  return +[AVPictureInPictureController isPictureInPictureSupported](AVPictureInPictureController, "isPictureInPictureSupported")&& -[AVPlayerViewController allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback")&& -[AVPlayerViewController isPictureInPicturePossible](self, "isPictureInPicturePossible")&& -[AVPlayerViewController canShowPictureInPictureButton](self, "canShowPictureInPictureButton");
}

- (BOOL)isPictureInPicturePossible
{
  return -[AVPictureInPictureController isPictureInPicturePossible](self->_pictureInPictureController, "isPictureInPicturePossible");
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (void)_updateContentViewEdgeInsetsForLetterboxedContent
{
  id v3;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:](self, "playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:", v3);
  objc_msgSend(v3, "setEdgeInsetsForLetterboxedContent:");
  objc_msgSend(v3, "setNeedsLayout");

}

- (BOOL)playerViewControllerContentViewIsPlayingOnSecondScreen:(id)a3
{
  return -[AVSecondScreenConnection isActive](self->_secondScreenConnection, "isActive", a3);
}

- (uint64_t)_updateScrubbingGestureEnabledState
{
  id *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (result)
  {
    v1 = (id *)result;
    if (*(_QWORD *)(result + 1176) == 1)
    {
      +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "overVideoScrubbingGestureEnabled");

      if ((_DWORD)v3)
      {
        objc_msgSend(v1[146], "fullscreenController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v4, "presentationState") != 2
          && (objc_msgSend(v1, "actuallyRequiresLinearPlayback") & 1) == 0
          && !-[AVPlayerViewController _contentTabsVisible]((uint64_t)v1);

      }
    }
    else
    {
      v3 = 0;
    }
    return objc_msgSend(v1[142], "setEnabled:", v3);
  }
  return result;
}

- (UIWindow)avkit_window
{
  return (UIWindow *)-[__AVPlayerLayerView window](self->_playerLayerView, "window");
}

- (BOOL)_delegateRespondsTo:(SEL)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 & 1) != 0)
      v12 = CFSTR("does");
    else
      v12 = CFSTR("does NOT");
    NSStringFromSelector(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[AVPlayerViewController _delegateRespondsTo:]";
    v17 = 2114;
    v18 = v10;
    v19 = 2048;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s <%{public}@ %p> %@ respond to %{public}@", (uint8_t *)&v15, 0x34u);

  }
  return v6 & 1;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (uint64_t)_updateControlsViewControllerPerformanceState
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 1160), "scrollingObserver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isScrolling");

    return objc_msgSend(*(id *)(v1 + 1168), "setOptimizeForPerformance:", v3);
  }
  return result;
}

- (void)_ensureBehaviorStorage
{
  AVBehaviorStorage *v3;
  AVBehaviorStorage *behaviorStorage;

  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls") && !self->__behaviorStorage)
  {
    v3 = -[AVBehaviorStorage initWithAVKitOwner:]([AVBehaviorStorage alloc], "initWithAVKitOwner:", self);
    behaviorStorage = self->__behaviorStorage;
    self->__behaviorStorage = v3;

  }
}

- (void)_contentViewDidMoveWindow
{
  -[AVPlayerViewController performInitialSetupIfNeededAndPossible](self, "performInitialSetupIfNeededAndPossible");
  -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
  -[AVPlayerViewController _updateSecondScreenConnectionReadyToConnect](self, "_updateSecondScreenConnectionReadyToConnect");
}

- (void)_setupInterstitialControllerDelegateIfNeeded
{
  id v2;

  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 1472), "interstitialController");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setDelegateManager:", a1);

    }
  }
}

- (AVPictureInPictureController)pictureInPictureController
{
  return self->_pictureInPictureController;
}

void __39__AVPlayerViewController__addObservers__block_invoke_7(uint64_t a1, _QWORD *a2)
{
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](a2, 0);
}

- (void)_updateAudioOnlyIndicatorView
{
  id v3;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsAudioOnlyIndicator:", -[AVPlayerViewController isAudioOnlyContent](self, "isAudioOnlyContent"));

}

- (void)_updateUnsupportedContentIndicatorView
{
  id v3;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsUnsupportedContentIndicator:", -[AVPlayerViewController _isUnsupportedContent](self, "_isUnsupportedContent"));

}

- (BOOL)_isUnsupportedContent
{
  void *v2;
  BOOL v3;

  -[AVPlayerViewController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status") == 3;

  return v3;
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "_hasBegunObservation") & 1) == 0)
  {
    objc_msgSend(v7, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "hasContent") & 1) == 0)
    {
      objc_msgSend(v7, "playerController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "status") != 1)
      {
        objc_msgSend(v7, "playerController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "status");

        if (v6 != 2)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
LABEL_6:
    objc_msgSend(v7, "_addObservers");
    objc_msgSend(v7, "playbackControlsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startUpdatesIfNeeded");

  }
LABEL_7:
  objc_msgSend(v7, "_updateUnsupportedContentIndicatorView");

}

void __39__AVPlayerViewController__addObservers__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateSecondScreenConnectionPlayingState");
  objc_msgSend(v2, "_updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded");

}

- (void)_updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  BOOL v7;

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (v4 == 2)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPlaying");

    if (!v6)
      return;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  self->_playbackBeganAfterPlayerControllerBecameReadyToPlay = v7;
}

- (void)_updateSecondScreenConnectionPlayingState
{
  void *v3;
  _BOOL8 v4;

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timeControlStatus") != 0;

  -[AVSecondScreenConnection setPlaying:](self->_secondScreenConnection, "setPlaying:", v4);
}

- (BOOL)_hasBegunObservation
{
  return self->__hasBegunObservation;
}

- (void)_updateSecondGenerationContentTabsGestureEnablementState
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[146], "controlsViewControllerIfChromeless");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "status") == 2;
    objc_msgSend(v2, "contentTabPanGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)_setUpGestureRecognizersIfNeeded
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  AVCenterTapGestureRecognizer *v7;
  void *v8;
  AVScrubbingGesturePlatformAdapter_iOS *v9;
  AVScrubbingGestureController *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  AVExternalGestureRecognizerPreventer *v22;
  void *v23;
  AVUserInteractionObserverGestureRecognizer *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  AVInteractiveTransitionGestureTracker *v31;
  void *v32;
  uint8_t v33[16];

  objc_msgSend((id)a1, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v33 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Content view should be loaded before attempting to add gesture recognizers to it.", v33, 2u);
    }

  }
  objc_msgSend((id)a1, "_transitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 1176);
  objc_msgSend((id)a1, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 1)
  {
    -[AVPlayerViewController _attachContentTabPanGestureRecognizerIfNeeded]((id *)a1);
    v7 = -[AVCenterTapGestureRecognizer initWithTarget:action:]([AVCenterTapGestureRecognizer alloc], "initWithTarget:action:", a1, sel__togglePlaybackForCenterTapGesture_);
    v8 = *(void **)(a1 + 1728);
    *(_QWORD *)(a1 + 1728) = v7;

    objc_msgSend(*(id *)(a1 + 1728), "setDelegate:", a1);
    objc_msgSend(v6, "addGestureRecognizer:", *(_QWORD *)(a1 + 1728));
    v9 = -[AVScrubbingGesturePlatformAdapter_iOS initWithView:]([AVScrubbingGesturePlatformAdapter_iOS alloc], "initWithView:", v6);
    v10 = -[AVScrubbingGestureController initWithPlatformAdapter:]([AVScrubbingGestureController alloc], "initWithPlatformAdapter:", v9);
    v11 = *(void **)(a1 + 1136);
    *(_QWORD *)(a1 + 1136) = v10;

    objc_msgSend(*(id *)(a1 + 1136), "setDelegate:", a1);
    v12 = *(void **)(a1 + 1136);
    objc_msgSend((id)a1, "playerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlayerController:", v13);

    objc_msgSend(*(id *)(a1 + 1136), "setScrubsHaveMomentum:", 1);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", a1, sel__handleVideoGravityPinchGesture_);
    v15 = *(void **)(a1 + 1304);
    *(_QWORD *)(a1 + 1304) = v14;

    objc_msgSend(v6, "addGestureRecognizer:", *(_QWORD *)(a1 + 1304));
    -[AVPlayerViewController _updateScrubbingGestureEnabledState](a1);

  }
  else
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", a1, sel__handleDoubleTapGesture_);
    v17 = *(void **)(a1 + 1288);
    *(_QWORD *)(a1 + 1288) = v16;

    objc_msgSend(*(id *)(a1 + 1288), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 1288), "setNumberOfTapsRequired:", 2);
    objc_msgSend(v6, "addGestureRecognizer:", *(_QWORD *)(a1 + 1288));
  }

  if (!*(_QWORD *)(a1 + 1280))
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", a1, sel__handleSingleTapGesture_);
    v19 = *(void **)(a1 + 1280);
    *(_QWORD *)(a1 + 1280) = v18;

    objc_msgSend(*(id *)(a1 + 1280), "setDelegate:", a1);
    if (*(_QWORD *)(a1 + 1288))
      objc_msgSend(*(id *)(a1 + 1280), "requireGestureRecognizerToFail:");
    objc_msgSend(v2, "addGestureRecognizer:", *(_QWORD *)(a1 + 1280));
  }
  if (!*(_QWORD *)(a1 + 1296))
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", a1, sel__handleDoubleTapTwoFingersGesture_);
    v21 = *(void **)(a1 + 1296);
    *(_QWORD *)(a1 + 1296) = v20;

    objc_msgSend(*(id *)(a1 + 1296), "setNumberOfTapsRequired:", 2);
    objc_msgSend(*(id *)(a1 + 1296), "setNumberOfTouchesRequired:", 2);
    objc_msgSend(v2, "addGestureRecognizer:", *(_QWORD *)(a1 + 1296));
  }
  if (!*(_QWORD *)(a1 + 1312))
  {
    v22 = -[AVExternalGestureRecognizerPreventer initWithTarget:action:]([AVExternalGestureRecognizerPreventer alloc], "initWithTarget:action:", 0, 0);
    v23 = *(void **)(a1 + 1312);
    *(_QWORD *)(a1 + 1312) = v22;

    objc_msgSend(v2, "addGestureRecognizer:", *(_QWORD *)(a1 + 1312));
  }
  if (!*(_QWORD *)(a1 + 1320))
  {
    v24 = -[AVUserInteractionObserverGestureRecognizer initWithTarget:action:]([AVUserInteractionObserverGestureRecognizer alloc], "initWithTarget:action:", a1, sel__handleUserInteractionObservationRecognizer_);
    v25 = *(void **)(a1 + 1320);
    *(_QWORD *)(a1 + 1320) = v24;

    objc_msgSend(v2, "addGestureRecognizer:", *(_QWORD *)(a1 + 1320));
  }
  if (!*(_QWORD *)(a1 + 1648))
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", a1, sel__handleHoverGestureRecognizer_);
    v27 = *(void **)(a1 + 1648);
    *(_QWORD *)(a1 + 1648) = v26;

    objc_msgSend(*(id *)(a1 + 1648), "setDelegate:", a1);
    objc_msgSend((id)a1, "setHoverGestureRecognizer:", *(_QWORD *)(a1 + 1648));
    objc_msgSend(v2, "addGestureRecognizer:", *(_QWORD *)(a1 + 1648));
  }
  if (!*(_QWORD *)(a1 + 1656))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", a1, sel__handleScrubbingGestureRecognizer_);
    objc_msgSend(v28, "setAllowedScrollTypesMask:", 2);
    objc_msgSend(v28, "_setiOSMacIgnoreScrollDirectionUserPreference:", 1);
    objc_msgSend(v28, "setDelegate:", a1);
    objc_msgSend(v28, "setAllowedTouchTypes:", &unk_1E5BF3F90);
    objc_msgSend((id)a1, "setScrubGestureRecognizer:", v28);
    objc_msgSend(v2, "addGestureRecognizer:", v28);

  }
  if (!*(_QWORD *)(a1 + 1328))
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4240]), "initWithTarget:action:", a1, sel__handleScrubInteruptionGestureRecognizer_);
    v30 = *(void **)(a1 + 1328);
    *(_QWORD *)(a1 + 1328) = v29;

    objc_msgSend(v2, "addGestureRecognizer:", *(_QWORD *)(a1 + 1328));
  }
  objc_msgSend(v4, "setInteractionView:", v2);
  if (!*(_QWORD *)(a1 + 1336))
  {
    v31 = objc_alloc_init(AVInteractiveTransitionGestureTracker);
    v32 = *(void **)(a1 + 1336);
    *(_QWORD *)(a1 + 1336) = v31;

    objc_msgSend(v4, "setInteractiveGestureTracker:", *(_QWORD *)(a1 + 1336));
  }
  -[AVPlayerViewController _updateGesturesEnablementStates](a1);

}

- (void)setScrubGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrubGestureRecognizer, a3);
}

- (void)setHoverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, a3);
}

- (CGAffineTransform)overrideTransformForProminentPlayButton
{
  __int128 v3;

  v3 = *(_OWORD *)&self[25].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[25].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[25].ty;
  return self;
}

- (NSValue)overrideLayoutMarginsWhenEmbeddedInline
{
  return self->_overrideLayoutMarginsWhenEmbeddedInline;
}

- (void)performInitialSetupIfNeededAndPossible
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;

  if (!-[AVPlayerViewController hasPerformedInitialSetup](self, "hasPerformedInitialSetup"))
  {
    -[AVPlayerViewController pictureInPictureActivitySessionIdentifier](self, "pictureInPictureActivitySessionIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();

    if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    {
      -[AVPlayerViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v3 | v5;

      if (v6)
LABEL_11:
        -[AVPlayerViewController _performInitialSetup]((uint64_t)self);
    }
    else
    {
      -[AVPlayerViewControllerContentView scrollingObserver](self->_playerViewControllerContentView, "scrollingObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isScrolling") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        -[AVPlayerViewControllerContentView window](self->_playerViewControllerContentView, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v9 != 0;

      }
      if (v3 || v8)
        goto LABEL_11;
    }
  }
}

- (BOOL)hasPerformedInitialSetup
{
  return self->_hasPerformedInitialSetup;
}

- (NSString)pictureInPictureActivitySessionIdentifier
{
  return self->_pictureInPictureActivitySessionIdentifier;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[AVPlayerViewController viewDidAppear:]";
    v15 = 1024;
    v16 = 2797;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v12.receiver = self;
  v12.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController viewDidAppear:](&v12, sel_viewDidAppear_, v3);
  -[AVPlayerViewControllerContentView scrollingObserver](self->_playerViewControllerContentView, "scrollingObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isScrolling");

  if ((v7 & 1) == 0)
  {
    -[AVPlayerViewController _updateViewControllerPreferencesIfNeeded](self, "_updateViewControllerPreferencesIfNeeded");
    -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
    if (self->_playerShouldAutoplay)
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "autoplay:", 0);

    }
    -[AVPlayerViewController setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:](self, "setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:", 1);
    -[AVPlayerViewController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackControlsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[AVPlayerViewController contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsLayout");

    }
    -[AVPlayerViewController updateVideoBounds](self, "updateVideoBounds");
  }
}

- (void)playbackControlsViewNeedsUpdateStatusBarAppearance:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[AVPlayerViewController _activeViewControllerForContentView](self, "_activeViewControllerForContentView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__AVPlayerViewController_playbackControlsViewNeedsUpdateStatusBarAppearance___block_invoke;
    v7[3] = &unk_1E5BB2130;
    v7[4] = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v7, 0);

  }
  else
  {
    -[AVPlayerViewController _updateViewControllerPreferencesIfNeeded](self, "_updateViewControllerPreferencesIfNeeded");
  }

}

- (void)_updateViewControllerPreferencesIfNeeded
{
  id v2;

  -[AVPlayerViewController _activeViewControllerForContentView](self, "_activeViewControllerForContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avkit_setNeedsUpdatePreferencesIfNeeded");

}

- (id)_activeViewControllerForContentView
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayerViewController *v6;
  uint64_t v7;
  void *v8;
  AVPlayerViewController *v9;

  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedFullScreenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (AVPlayerViewController *)v7;
    else
      v9 = self;
    v6 = v9;

  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int64_t v5;
  AVPlayerViewControllerContentView *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  -[AVPlayerViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAnimated"))
    v5 = 1;
  else
    v5 = 2;
  self->_playerViewControllerAnimated = v5;

  if (!self->_controlsViewControllerHasBeenSetUp)
  {
    v6 = self->_playerViewControllerContentView;
    -[AVPlayerViewController controlsViewController](self, "controlsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController addChildViewController:](self, "addChildViewController:", v7);
    -[AVPlayerViewControllerContentView setControlsViewController:](v6, "setControlsViewController:", v7);

    objc_msgSend(v7, "didMoveToParentViewController:", self);
    self->_controlsViewControllerHasBeenSetUp = 1;

  }
  -[AVPlayerViewControllerContentView scrollingObserver](self->_playerViewControllerContentView, "scrollingObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScrolling");

  if ((v9 & 1) == 0)
  {
    -[AVPlayerViewController transitionCoordinator](self, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__AVPlayerViewController_viewWillAppear___block_invoke;
    v12[3] = &unk_1E5BB2130;
    v12[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__AVPlayerViewController_viewWillAppear___block_invoke_2;
    v11[3] = &unk_1E5BB2130;
    objc_msgSend(v10, "animateAlongsideTransition:completion:", v12, v11);

    -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
  }
  -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
}

- (void)loadView
{
  NSObject *v3;
  AVPlaybackContentContainerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  AVPlaybackContentContainerView *v9;
  void *v10;
  AVPlaybackContentContainerView *v11;
  AVPlaybackContentContainerView *v12;
  void *v13;
  void *v14;
  AVPlayerViewControllerContentView *v15;
  id v16;
  void *v17;
  AVPlayerViewControllerContentView *v18;
  void *v19;
  void *v20;
  id v21;
  AVPlayerView *v22;
  void *v23;
  AVPlayerView *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, void *);
  void *v30;
  AVPlaybackContentContainerView *v31;
  uint64_t *v32;
  __int128 *p_buf;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  __AVPlayerLayerView *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[AVPlayerViewController loadView]";
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s Attempt to load view when view was already loaded.", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    kdebug_trace();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__8165;
    v44 = __Block_byref_object_dispose__8166;
    v45 = self->_playerLayerView;
    v34 = 0;
    v35 = (id *)&v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__8165;
    v38 = __Block_byref_object_dispose__8166;
    v39 = 0;
    v4 = [AVPlaybackContentContainerView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[AVPlaybackContentContainerView initWithFrame:playerLayerView:contentOverlayView:](v4, "initWithFrame:playerLayerView:contentOverlayView:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __34__AVPlayerViewController_loadView__block_invoke;
    v30 = &unk_1E5BB1920;
    v32 = &v34;
    v11 = v9;
    v31 = v11;
    p_buf = &buf;
    objc_msgSend(v10, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_makePlaybackContentContainerWithFrame_activeContentView_, &unk_1EECA27A0, &v27);

    if (v35[5])
      v12 = (AVPlaybackContentContainerView *)v35[5];
    else
      v12 = v11;
    objc_storeStrong(v35 + 5, v12);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setPixelBufferAttributes:", self->_pixelBufferAttributes, v27, v28, v29, v30);
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    -[AVPlayerViewController playerController](self, "playerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlayerController:", v14);

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setVideoGravity:", self->_videoGravity);
    v15 = [AVPlayerViewControllerContentView alloc];
    v16 = v35[5];
    -[AVPlayerViewController _targetVideoGravitiesForLayoutClass](self, "_targetVideoGravitiesForLayoutClass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AVPlayerViewControllerContentView initWithFrame:playbackContentContainerView:targetVideoGravities:](v15, "initWithFrame:playbackContentContainerView:targetVideoGravities:", v16, v17, v5, v6, v7, v8);

    -[AVPlayerViewControllerContentView setDelegate:](v18, "setDelegate:", self);
    -[AVPlayerViewControllerContentView setWantsBackdropView:](v18, "setWantsBackdropView:", self->_controlsGeneration != 1);
    -[AVPlayerViewControllerContentView setShowsPlaybackControls:](v18, "setShowsPlaybackControls:", -[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"));
    -[AVPlayerViewControllerContentView setCanAutomaticallyZoomLetterboxVideos:](v18, "setCanAutomaticallyZoomLetterboxVideos:", !self->_hasClientSetVideoGravity);
    -[AVPlayerViewControllerContentView scrollingObserver](v18, "scrollingObserver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addDelegate:", self);

    -[AVPlayerViewControllerContentView setOverrideUserInterfaceStyle:](v18, "setOverrideUserInterfaceStyle:", -[AVPlayerViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    objc_storeStrong((id *)&self->_playerViewControllerContentView, v18);
    v40 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)-[AVPlayerViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v20, &__block_literal_global_221);

    v22 = [AVPlayerView alloc];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "avkit_possibleWindowForControllingOverallAppearance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v24 = -[AVPlayerView initWithFrame:contentView:](v22, "initWithFrame:contentView:", v18, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    objc_storeStrong((id *)&self->_playerViewControllerView, v24);
    -[AVPresentationContainerView appearanceProxy](v24, "appearanceProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActualView:", v35[5]);

    -[AVPlayerView setAutoresizingMask:](v24, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationContainerView setBackgroundColor:](v24, "setBackgroundColor:", v26);

    -[AVPlayerViewController setView:](self, "setView:", v24);
    if (!self->_playerLayerView)
      -[AVPlayerViewController setPlayerLayerView:](self, "setPlayerLayerView:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    self->_controlsViewControllerHasBeenSetUp = 0;
    kdebug_trace();

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&buf, 8);

  }
}

- (NSMutableDictionary)_targetVideoGravitiesForLayoutClass
{
  NSMutableDictionary *targetVideoGravitiesForLayoutClass;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  targetVideoGravitiesForLayoutClass = self->__targetVideoGravitiesForLayoutClass;
  if (!targetVideoGravitiesForLayoutClass)
  {
    -[AVPlayerViewController videoGravity](self, "videoGravity");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = (void *)*MEMORY[0x1E0C8A6D8];
    if (v4)
      v6 = (void *)v4;
    v7 = v6;

    v12[0] = &unk_1E5BF3720;
    v12[1] = &unk_1E5BF3738;
    v13[0] = v7;
    v13[1] = v7;
    v12[2] = &unk_1E5BF3750;
    v13[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
    v10 = self->__targetVideoGravitiesForLayoutClass;
    self->__targetVideoGravitiesForLayoutClass = v9;

    targetVideoGravitiesForLayoutClass = self->__targetVideoGravitiesForLayoutClass;
  }
  return targetVideoGravitiesForLayoutClass;
}

- (void)setView:(id)a3
{
  objc_super v3;

  if (self->_playerViewControllerView == a3)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController setView:](&v3, sel_setView_);
  }
  else
  {
    NSLog(CFSTR("*** AVPlayerViewController: Setting a view is not supported."), a2);
  }
}

- (void)playbackControlsView:(id)a3 animateAlongsideVisibilityAnimationsWithAnimationCoordinator:(id)a4 appearingViews:(id)a5 disappearingViews:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v9 = a4;
  v10 = a6;
  v11 = a5;
  -[AVPlayerViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playbackControlsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "animateAlongsideVisibilityAnimationsWithAnimationCoordinator:appearingViews:disappearingViews:", v9, v11, v10);

  -[AVPlayerViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "playbackControlsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playbackControlsContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v11, "containsObject:", v16);
  v18 = objc_msgSend(v10, "containsObject:", v16);

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator_)&& v17 | v18)
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playerViewController:willTransitionToVisibilityOfPlaybackControls:withAnimationCoordinator:", self, v17, v9);

  }
  v20[4] = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke;
  v21[3] = &unk_1E5BB4CA0;
  v21[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2;
  v20[3] = &unk_1E5BB3010;
  objc_msgSend(v9, "addCoordinatedAnimations:completion:", v21, v20);

}

- (void)setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_shouldUseNetworkingResourcesForLiveStreamingWhilePaused != a3)
  {
    v3 = a3;
    self->_shouldUseNetworkingResourcesForLiveStreamingWhilePaused = a3;
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "startUsingNetworkResourcesForLiveStreamingWhilePaused");
    else
      objc_msgSend(v4, "stopUsingNetworkResourcesForLiveStreamingWhilePaused");

  }
}

- (uint64_t)_updateGesturesEnablementStates
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    -[AVPlayerViewController _updateSecondGenerationControlsGestureEnablementStates](result);
    objc_msgSend(*(id *)(v1 + 1336), "setEnabled:", !-[AVPlayerViewController _contentTabsVisible](v1));
    return objc_msgSend(*(id *)(v1 + 1296), "setEnabled:", !-[AVPlayerViewController _contentTabsVisible](v1));
  }
  return result;
}

- (BOOL)_contentTabsVisible
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 1168), "controlsViewControllerIfChromeless");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentTabPresentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "state"))
      v4 = objc_msgSend(v3, "state") == 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_updateSecondGenerationControlsGestureEnablementStates
{
  _BOOL8 v2;

  -[AVPlayerViewController _updateSecondGenerationContentTabsGestureEnablementState]((id *)a1);
  -[AVPlayerViewController _updateTapThroughGestureRecognizerEnablementState](a1);
  v2 = *(_QWORD *)(a1 + 1176) == 1 && !-[AVPlayerViewController _contentTabsVisible](a1);
  objc_msgSend(*(id *)(a1 + 1304), "setEnabled:", v2);
  return -[AVPlayerViewController _updateScrubbingGestureEnabledState](a1);
}

- (void)_addObservers
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char *v34;
  _QWORD v35[3];
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[AVPlayerViewController _addObservers]";
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", buf, 0xCu);
    }

  }
  -[AVPlayerViewController playerController](self, "playerController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject status](v4, "status"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasContent");

    if ((v6 & 1) != 0)
      goto LABEL_10;
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v34;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "The player controller should have content before calling %@.", buf, 0xCu);

    }
  }

LABEL_10:
  if (-[AVPlayerViewController _hasBegunObservation](self, "_hasBegunObservation"))
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "It's an error to repeatedly add observers.", buf, 2u);
    }

  }
  -[AVPlayerViewController set_hasBegunObservation:](self, "set_hasBegunObservation:", 1);
  -[AVPlayerViewController _observationController](self, "_observationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)MEMORY[0x1E0D47E48];
  v36 = *MEMORY[0x1E0D47E48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttribute:forKey:error:", v10, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *v9, 0, 0, &__block_literal_global_335);
  objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB88], 0, 0, &__block_literal_global_336);
  v12 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.player.currentItem"), 1, &__block_literal_global_340);
  -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](self->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVVolumeControllerVolumeChangedNotification"), 0, 0, &__block_literal_global_341);
  v13 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.player.muted"), 0, &__block_literal_global_344);
  objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVNowPlayingInfoControllerDidReceiveSkipCommandEventNotification"), 0, 0, &__block_literal_global_345);
  objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPictureInPictureControllerUserPlaybackStateDidChangeNotification"), 0, 0, &__block_literal_global_346);
  objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVNowPlayingInfoControllerDidReceiveStopCommandEventNotification"), 0, 0, &__block_literal_global_347);
  objc_msgSend(v8, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerPlaybackDidEndNotification"), 0, 0, &__block_literal_global_349);
  v14 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.contentDimensions"), 1, &__block_literal_global_353);
  v15 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.playingOnExternalScreen"), 0, &__block_literal_global_357);
  v16 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.externalPlaybackType"), 0, &__block_literal_global_359);
  v17 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.externalPlaybackAirPlayDeviceLocalizedName"), 0, &__block_literal_global_363);
  v35[0] = CFSTR("playerController.hasEnabledAudio");
  v35[1] = CFSTR("playerController.hasEnabledVideo");
  v35[2] = CFSTR("playerController.status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v8, "startObserving:keyPaths:observationHandler:", self, v18, &__block_literal_global_372);

  v20 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.status"), 1, &__block_literal_global_374);
  v21 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.defaultPlaybackRate"), 1, &__block_literal_global_378);
  -[AVPlayerViewController playerController](self, "playerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
    v23 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.timeControlStatus"), 0, &__block_literal_global_383);
  v24 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.allowsExternalPlayback"), 0, &__block_literal_global_386);
  v25 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.scrubbing"), 0, &__block_literal_global_389);
  v26 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.playingOnSecondScreen"), 0, &__block_literal_global_392);
  v27 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("contentView.playbackContentContainerView.bounds"), 1, &__block_literal_global_395);
  -[AVPlayerViewController playerController](self, "playerController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
    v30 = -[AVObservationController startObserving:keyPath:includeInitialValue:observationHandler:](self->_observationController, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.usesExternalPlaybackWhileExternalScreenIsActive"), 0, &__block_literal_global_401);
  -[AVPlayerViewController _updateUnsupportedContentIndicatorView](self, "_updateUnsupportedContentIndicatorView");
  -[AVPlayerViewController _updateAudioOnlyIndicatorView](self, "_updateAudioOnlyIndicatorView");
  -[AVPlayerViewController _updateExternalPlaybackIndicatorView](self, "_updateExternalPlaybackIndicatorView");
  -[AVPlayerViewController _updateSecondScreenConnectionPlayingState](self, "_updateSecondScreenConnectionPlayingState");
  -[AVPlayerViewController _updateSecondScreenConnectionReadyToConnect](self, "_updateSecondScreenConnectionReadyToConnect");
  -[AVPlayerViewController _updateContentViewEdgeInsetsForLetterboxedContent](self, "_updateContentViewEdgeInsetsForLetterboxedContent");
  -[AVPlayerViewController _updatePlayerLayerLegibleContentInsetsIfNeeded](self, "_updatePlayerLayerLegibleContentInsetsIfNeeded");
  -[AVPlayerViewController _updateSmartSubtitlesEnablementIfNeeded]((id *)&self->super.super.super.isa);
  v31 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.rate"), 1, &__block_literal_global_404);
  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    -[AVPlayerViewController _createPictureInPictureControllerIfNeeded](self, "_createPictureInPictureControllerIfNeeded");
  if (self->_controlsGeneration != 1)
  {
    v32 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerLayerView.videoGravity"), 1, &__block_literal_global_405);
    v33 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerLayerView.frame"), 1, &__block_literal_global_408);
  }
  -[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls");

}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateExternalPlaybackIndicatorView");
}

- (void)_updateExternalPlaybackIndicatorView
{
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
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "externalPlaybackType");

  if (v4 == 1)
  {
    AVLocalizedString(CFSTR("EXTERNAL_PLAYBACK_INDICATOR_VIEW_AIRPLAY_TITLE"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "externalPlaybackAirPlayDeviceLocalizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      AVLocalizedString(CFSTR("This video is playing on “%@”"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController playerController](self, "playerController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "externalPlaybackAirPlayDeviceLocalizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isPlayingOnExternalScreen"))
    {

    }
    else
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPlayingOnSecondScreen");

      if (!v14)
      {
        v18 = 0;
        v11 = 0;
        v15 = 0;
        goto LABEL_10;
      }
    }
    AVLocalizedString(CFSTR("EXTERNAL_PLAYBACK_INDICATOR_VIEW_TV_OUT_TITLE"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    AVLocalizedString(CFSTR("EXTERNAL_PLAYBACK_INDICATOR_VIEW_TV_OUT_SUBTITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = 1;
LABEL_10:
  -[AVPlayerViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExternalPlaybackIndicatorTitle:subtitle:", v18, v11);

  -[AVPlayerViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowsExternalPlaybackIndicator:", v15);

}

- (void)setCanPausePlaybackWhenExitingFullScreen:(BOOL)a3
{
  self->_canPausePlaybackWhenExitingFullScreen = a3;
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setCanToggleVideoGravityWhenEmbeddedInline:(BOOL)a3
{
  self->_canToggleVideoGravityWhenEmbeddedInline = a3;
}

- (void)setSpeeds:(NSArray *)speeds
{
  void *v4;
  NSArray *v5;

  v5 = speeds;
  if (-[NSArray count](v5, "count"))
  {
    +[AVPlaybackSpeedCollection collectionWithSpeeds:](AVPlaybackSpeedCollection, "collectionWithSpeeds:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[AVPlayerViewController setPlaybackSpeedCollection:](self, "setPlaybackSpeedCollection:", v4);

}

- (void)setPlaybackSpeedCollection:(id)a3
{
  AVPlaybackSpeedCollection *v5;
  AVPlaybackSpeedCollection **p_playbackSpeedCollection;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (AVPlaybackSpeedCollection *)a3;
  p_playbackSpeedCollection = &self->_playbackSpeedCollection;
  if (self->_playbackSpeedCollection != v5)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[AVPlaybackSpeedCollection internalDescription](v5, "internalDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[AVPlayerViewController setPlaybackSpeedCollection:]";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s New playback speed collection set: %@", (uint8_t *)&v10, 0x16u);

    }
    -[AVPlaybackSpeedCollection setDelegate:](*p_playbackSpeedCollection, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
    -[AVPlaybackSpeedCollection setDelegate:](*p_playbackSpeedCollection, "setDelegate:", self);
    -[AVMobileControlsViewController setPlaybackSpeedCollection:](self->_controlsViewController, "setPlaybackSpeedCollection:", v5);
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaybackSpeedCollection:", v5);

    -[AVPlayerViewController _updateDefaultPlaybackRateIfNeeded](self, "_updateDefaultPlaybackRateIfNeeded");
  }

}

- (BOOL)canIncludePlaybackControlsWhenInline
{
  return self->_canIncludePlaybackControlsWhenInline;
}

void __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "avkit_needsUpdateBackdropCaptureViewHidden");

}

- (uint64_t)_updateControlsViewControllerInitialState
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    -[AVPlayerViewController _updateShowsAnalysisControl](result);
    objc_msgSend(v1, "_updateIncludedControls");
    -[AVPlayerViewController _updateExcludedControls]((uint64_t)v1);
    -[AVPlayerViewController _updatePrefersFullScreenStyleForEmbeddedMode]((uint64_t)v1);
    objc_msgSend(v1, "_updateCustomControlsViewStateWithVisibleControlsSet:", 0);
    return -[AVPlayerViewController _updateControlsViewControllerPerformanceState]((uint64_t)v1);
  }
  return result;
}

- (void)_updateIncludedControls
{
  uint64_t p_playbackControlsIncludeTransportControls;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self)
  {
    p_playbackControlsIncludeTransportControls = (uint64_t)&self->_playbackControlsIncludeTransportControls;
    v3 = 72;
    if (self->_controlsGeneration != 1)
      v3 = 0;
    v4 = 57;
    if (self->_controlsGeneration == 1)
      v4 = 121;
  }
  else
  {
    v3 = 0;
    p_playbackControlsIncludeTransportControls = 1010;
    v4 = 57;
  }
  if (*(_BYTE *)p_playbackControlsIncludeTransportControls)
    v5 = v4;
  else
    v5 = v3;
  if (self->_playbackControlsIncludeDisplayModeControls)
    v5 |= 4uLL;
  if (self->_playbackControlsIncludeVolumeControls)
    v6 = v5 | 2;
  else
    v6 = v5;
  -[AVMobileControlsViewController setIncludedControls:](self->_controlsViewController, "setIncludedControls:", v6);
}

- (void)_updateExcludedControls
{
  id v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1168), "controlsViewControllerIfChromeless");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setExcludedControls:", objc_msgSend(*(id *)(a1 + 1448), "excludedControls"));
    -[AVPlayerViewController _updateTapThroughGestureRecognizerEnablementState](a1);

  }
}

- (uint64_t)_updateTapThroughGestureRecognizerEnablementState
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 1176);
  v3 = objc_msgSend(*(id *)(a1 + 1448), "excludedControls");
  if (v2 == 1)
    v4 = ((v3 & 1) == 0) & ~-[AVPlayerViewController _contentTabsVisible](a1);
  else
    v4 = 0;
  return objc_msgSend(*(id *)(a1 + 1728), "setEnabled:", v4);
}

- (void)_updateCustomControlsViewStateWithVisibleControlsSet:(unint64_t)a3
{
  _BOOL8 v4;

  v4 = (a3 & 0x31) != 0;
  -[AVPlayerViewControllerCustomControlsView setAreVolumeControlsVisible:](self->_customControlsView, "setAreVolumeControlsVisible:", (a3 >> 1) & 1);
  -[AVPlayerViewControllerCustomControlsView setAreTransportControlsVisible:](self->_customControlsView, "setAreTransportControlsVisible:", v4);
}

- (void)_updateAnalysisViewImageAnalysis
{
  id v2;

  if (a1)
  {
    -[AVPlayerViewController _currentAnalysis]((uint64_t)a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "allowsVideoFrameAnalysis"))
      objc_msgSend(a1[212], "setAnalysis:", v2);

  }
}

- (uint64_t)_updateVisualAnalysisViewHiddenState
{
  id *v1;
  void *v2;
  int v3;

  if (result)
  {
    v1 = (id *)result;
    objc_msgSend(*(id *)(result + 1160), "scrollingObserver");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isScrolling");

    return objc_msgSend(v1[212], "setHidden:", objc_msgSend(v1, "allowsVideoFrameAnalysis") ^ 1 | v3);
  }
  return result;
}

- (void)setAllowsVideoFrameAnalysis:(BOOL)allowsVideoFrameAnalysis
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = allowsVideoFrameAnalysis;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualAnalysisSupported");

  if (v6)
  {
    if (self->_allowsVideoFrameAnalysis != v3)
    {
      self->_allowsVideoFrameAnalysis = v3;
      -[AVPlayerViewController _setUpVideoFrameVisualAnalyzerIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
      -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
      -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](self);
      -[AVPlayerViewController _updateShowsAnalysisControl]((uint64_t)self);
      -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updateVisualAnalysisViewHiddenState]((uint64_t)self);
    }
  }
  else
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Video frame analysis is not supported on this device or platform.", v8, 2u);
    }

    self->_allowsVideoFrameAnalysis = 0;
  }
}

- (void)_setUpVideoFrameVisualAnalyzerIfNeeded
{
  void *v2;
  AVVideoFrameVisualAnalyzer *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a1
    && objc_msgSend((id)a1, "allowsVideoFrameAnalysis")
    && objc_msgSend((id)a1, "hasPerformedInitialSetup"))
  {
    objc_msgSend((id)a1, "playerLayerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "playerLayer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v3 = -[AVVideoFrameVisualAnalyzer initWithPlayerController:playerLayer:]([AVVideoFrameVisualAnalyzer alloc], "initWithPlayerController:playerLayer:", *(_QWORD *)(a1 + 1472), v6);
    v4 = *(void **)(a1 + 1128);
    *(_QWORD *)(a1 + 1128) = v3;

    objc_msgSend(*(id *)(a1 + 1128), "setDelegate:", a1);
    -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes](a1);
    if (*(_QWORD *)(a1 + 1456) == 1)
      v5 = 30;
    else
      v5 = *(_QWORD *)(a1 + 1456);
    objc_msgSend(*(id *)(a1 + 1128), "setVideoFrameAnalysisTypes:", v5);
    -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded](a1);

  }
}

- (void)_updateShowsAnalysisControl
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v10;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1168), "controlsViewControllerIfChromeless");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 1176);
    v3 = objc_msgSend((id)a1, "allowsVideoFrameAnalysis");
    v4 = objc_msgSend((id)a1, "showsAnalysisButtonIfAvailable");
    v5 = *(void **)(a1 + 1696);
    v6 = objc_msgSend(v5, "hasProminentText");
    v7 = v10;
    if (v3)
    {
      if (v2 == 1 && v5 != 0 && v10 != 0)
      {
        objc_msgSend(v10, "setShowsAnalysisControl:", v4 & v6);
        v7 = v10;
      }
    }

  }
}

- (BOOL)allowsVideoFrameAnalysis
{
  return self->_allowsVideoFrameAnalysis;
}

- (BOOL)showsAnalysisButtonIfAvailable
{
  return self->_showsAnalysisButtonIfAvailable;
}

- (_QWORD)_updateAnalysisButtonBottomInsetIfNeeded
{
  _QWORD *v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (result)
  {
    v1 = result;
    if (result[212])
    {
      result = (_QWORD *)objc_msgSend(result, "allowsVideoFrameAnalysis");
      if ((_DWORD)result)
      {
        v2 = 8.0;
        if (v1[147] != 1)
        {
          objc_msgSend(v1, "contentView");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "contentView");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "playbackControlsView");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v5, "showsPlaybackControls"))
          {
            v6 = (id)v1[212];
            objc_msgSend(v5, "transportControlsContainerView");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "frame");
            v21 = v8;
            objc_msgSend(v6, "bounds");
            objc_msgSend(v3, "convertRect:fromView:", v6);
            v10 = v9;
            v12 = v11;
            v14 = v13;
            v16 = v15;

            objc_msgSend(v7, "bounds");
            objc_msgSend(v3, "convertRect:fromView:", v7);
            x = v22.origin.x;
            y = v22.origin.y;
            width = v22.size.width;
            v25.size.height = v22.size.height + v21 - CGRectGetMaxY(v22);
            v23.origin.x = v10;
            v23.origin.y = v12;
            v23.size.width = v14;
            v23.size.height = v16;
            v25.origin.x = x;
            v25.origin.y = y;
            v25.size.width = width;
            v24 = CGRectIntersection(v23, v25);
            height = v24.size.height;
            if (CGRectEqualToRect(v24, *MEMORY[0x1E0C9D628]))
              v2 = 8.0;
            else
              v2 = height + 8.0;

          }
        }
        return (_QWORD *)objc_msgSend((id)v1[212], "setAnalysisButtonBottomInset:", v2);
      }
    }
  }
  return result;
}

- (void)_updateDefaultPlaybackRateIfNeeded
{
  void *v3;
  void *v4;
  float v5;
  float defaultLinearPlaybackRate;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[AVPlayerViewController playbackSpeedCollection](self, "playbackSpeedCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedSpeed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rate");
  defaultLinearPlaybackRate = v5;

  if (-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback")
    || (-[AVPlayerViewController playbackSpeedCollection](self, "playbackSpeedCollection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    defaultLinearPlaybackRate = self->_defaultLinearPlaybackRate;
  }
  -[AVPlayerViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultPlaybackRate");
  v10 = v9;
  v11 = defaultLinearPlaybackRate;

  if (v10 != v11)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDefaultPlaybackRate:", v11);

  }
}

- (void)_updateActivePlaybackSpeedIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  AVPlaybackSpeed *v11;
  uint64_t v12;
  AVPlaybackSpeed *i;
  void *v14;
  float v15;
  void *v16;
  AVPlaybackSpeed *v17;
  double v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController playbackSpeedCollection](self, "playbackSpeedCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultPlaybackRate");
    v6 = v5;

    objc_msgSend(v3, "activeSpeed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rate");
    v9 = v8;

    if (v6 != v9)
    {
      if (v6 == 0.0)
      {
        objc_msgSend(v3, "speeds");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVPlaybackSpeedCollection defaultSpeedFromList:](AVPlaybackSpeedCollection, "defaultSpeedFromList:", v19);
        v11 = (AVPlaybackSpeed *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_16;
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v3, "speeds", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (AVPlaybackSpeed *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v11; i = (AVPlaybackSpeed *)((char *)i + 1))
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v14, "rate");
              if (v6 == v15)
              {
                v11 = v14;
                goto LABEL_14;
              }
            }
            v11 = (AVPlaybackSpeed *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_14:

        if (v11)
          goto LABEL_16;
      }
      AVLocalizedString(CFSTR("Active Speed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [AVPlaybackSpeed alloc];
      *(float *)&v18 = v6;
      v11 = -[AVPlaybackSpeed initWithRate:localizedName:synthesized:](v17, "initWithRate:localizedName:synthesized:", v16, 1, v18);

LABEL_16:
      objc_msgSend(v3, "setActiveSpeed:", v11);

    }
  }

}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (AVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  NSObject *v5;
  AVPlayerViewController *v6;
  AVPlayerViewController *v7;
  uint64_t v8;
  __int128 v9;
  NSValue *overrideLayoutMarginsWhenEmbeddedInline;
  uint64_t v11;
  AVRoutingConfiguration *routingConfiguration;
  uint64_t v13;
  AVPlayerViewControllerConfiguration *configuration;
  void *v15;
  int v16;
  uint64_t v17;
  NSArray *infoViewActions;
  uint64_t v19;
  AVCacheLargestInscribedRectInBoundingPath *cacheLargestInscribedRect;
  void *v21;
  AVObservationController *v22;
  AVObservationController *observationController;
  void *v24;
  uint64_t v25;
  AVPlaybackSpeedCollection *playbackSpeedCollection;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[AVPlayerViewController initWithNibName:bundle:]";
    v37 = 1024;
    v38 = 452;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v34.receiver = self;
  v34.super_class = (Class)AVPlayerViewController;
  v6 = -[AVPlayerViewController initWithNibName:bundle:](&v34, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_playerShouldAutoplay = 0;
    v6->_showsPlaybackControls = 1;
    v6->_videoGravity = 1;
    v6->_allowsPictureInPicturePlayback = dyld_program_sdk_at_least();
    v7->_wantsDetachedFullscreenPresentation = 0;
    v7->_canDisplayContentInDetachedWindow = 0;
    v7->_showsAnalysisButtonIfAvailable = 1;
    v7->_allowsEnteringFullScreen = 1;
    v7->_updatesNowPlayingInfoCenter = 1;
    v7->_canHidePlaybackControls = 1;
    v7->_canPausePlaybackWhenExitingFullScreen = 1;
    v7->_canPausePlaybackWhenClosingPictureInPicture = 1;
    v7->_canShowPictureInPictureButton = 1;
    v7->_canIncludePlaybackControlsWhenInline = 1;
    v7->_controlsGeneration = objc_msgSend((id)objc_opt_class(), "usesSecondGenerationControls");
    v7->_playbackControlsShouldControlSystemVolume = 1;
    v7->_showsAudioLanguageMenu = 1;
    v8 = MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v7->_overrideTransformForProminentPlayButton.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v7->_overrideTransformForProminentPlayButton.c = v9;
    *(_OWORD *)&v7->_overrideTransformForProminentPlayButton.tx = *(_OWORD *)(v8 + 32);
    overrideLayoutMarginsWhenEmbeddedInline = v7->_overrideLayoutMarginsWhenEmbeddedInline;
    v7->_overrideLayoutMarginsWhenEmbeddedInline = 0;

    v7->_canToggleVideoGravityWhenEmbeddedInline = 1;
    v7->_defaultLinearPlaybackRate = 1.0;
    v7->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = 1;
    +[AVRoutingConfiguration defaultConfiguration](AVRoutingConfiguration, "defaultConfiguration");
    v11 = objc_claimAutoreleasedReturnValue();
    routingConfiguration = v7->_routingConfiguration;
    v7->_routingConfiguration = (AVRoutingConfiguration *)v11;

    +[AVPlayerViewControllerConfiguration defaultConfiguration](AVPlayerViewControllerConfiguration, "defaultConfiguration");
    v13 = objc_claimAutoreleasedReturnValue();
    configuration = v7->_configuration;
    v7->_configuration = (AVPlayerViewControllerConfiguration *)v13;

    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "quickLookModernPlayerControlsEnabled");

    if (v16)
    {
      -[AVPlayerViewController setPrefersDeviceUserInterfaceStyle:](v7, "setPrefersDeviceUserInterfaceStyle:", 1);
      -[AVPlayerViewControllerConfiguration setPrefersFullScreenStyleForEmbeddedMode:](v7->_configuration, "setPrefersFullScreenStyleForEmbeddedMode:", 1);
    }
    -[AVPlayerViewController _defaultInfoViewActions](v7, "_defaultInfoViewActions");
    v17 = objc_claimAutoreleasedReturnValue();
    infoViewActions = v7->_infoViewActions;
    v7->_infoViewActions = (NSArray *)v17;

    v19 = objc_opt_new();
    cacheLargestInscribedRect = v7->_cacheLargestInscribedRect;
    v7->_cacheLargestInscribedRect = (AVCacheLargestInscribedRectInBoundingPath *)v19;

    v7->_playbackControlsIncludeTransportControls = 1;
    v7->_playbackControlsIncludeDisplayModeControls = 1;
    v7->_playbackControlsIncludeVolumeControls = 1;
    v7->_allowInfoMetadataSubpanel = 1;
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_allowsVideoFrameAnalysis = objc_msgSend(v21, "visualAnalysisEnabled");

    v22 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v7);
    observationController = v7->_observationController;
    v7->_observationController = v22;

    v7->_videoFrameAnalysisTypes = 0;
    +[AVPlaybackSpeed systemDefaultSpeeds](AVPlaybackSpeed, "systemDefaultSpeeds");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVPlaybackSpeedCollection collectionWithSpeeds:](AVPlaybackSpeedCollection, "collectionWithSpeeds:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    playbackSpeedCollection = v7->_playbackSpeedCollection;
    v7->_playbackSpeedCollection = (AVPlaybackSpeedCollection *)v25;

    -[AVPlaybackSpeedCollection setDelegate:](v7->_playbackSpeedCollection, "setDelegate:", v7);
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v27, "extendedVisualAnalysisEnabled");

    if ((_DWORD)v24)
      v28 = 1;
    else
      v28 = 2;
    v7->_videoFrameAnalysisTypes = v28;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.podcasts"));

    if (v31)
      v7->_wantsDetachedFullscreenPresentation = 0;
    v7->_playerViewControllerAnimated = 0;
    v7->_playerLayerViewObservationsHasBeenSetup = 0;
    -[AVObservationController startObservingNotificationForName:object:notificationCenter:observationHandler:](v7->_observationController, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5230], v7, 0, &__block_literal_global_8245);
    -[AVPlayerViewController _avkitPreferredTransitioningDelegate](v7, "_avkitPreferredTransitioningDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v32);

    v7->_isUpdatingSecondScreenConnectionReadyToConnect = 0;
    v7->_preferredPlaybackControlsSupplementalSubtitleDisplayOption = 2;
  }
  return v7;
}

- (void)_setupInfoTabViewController
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  AVInfoTabCoordinator *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  if (a1)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isTVApp");

    if (v3)
    {
      v4 = objc_msgSend(a1, "showsPlaybackControls");
      objc_msgSend(a1, "playerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activePlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentItem");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v7 = a1[214];
      if (v19)
        v8 = v7 == 0;
      else
        v8 = 0;
      if (v8)
        v9 = 0;
      else
        v9 = v7;
      if (v8)
      {
        if (v4)
        {
          v10 = [AVInfoTabCoordinator alloc];
          objc_msgSend(a1, "infoViewActions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[AVInfoTabCoordinator initWithPlayerItem:actions:](v10, "initWithPlayerItem:actions:", v19, v11);
          v13 = a1[215];
          a1[215] = (id)v12;

          objc_msgSend(a1[215], "infoTabViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setInfoTabViewController:", v9);
          -[AVPlayerViewController _updateInfoTabViewControllerIfNeeded](a1);
          objc_msgSend(a1, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "frame");
          v16 = v15;
          v18 = v17;

          -[AVPlayerViewController _updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:]((uint64_t)a1, v16, v18);
        }
      }

    }
  }
}

- (id)_defaultInfoViewActions
{
  UIAction *playFromBeginningAction;
  AVPlayerViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  playFromBeginningAction = self->_playFromBeginningAction;
  if (!playFromBeginningAction)
  {
    v3 = self;
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    AVLocalizedString(CFSTR("START_PLAYBACK_FROM_BEGINNING"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __49__AVPlayerViewController__defaultInfoViewActions__block_invoke;
    v13 = &unk_1E5BB3918;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, &v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v3 = (AVPlayerViewController *)((char *)v3 + 1064);
    isa = v3->super.super.super.isa;
    v3->super.super.super.isa = (Class)v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    playFromBeginningAction = (UIAction *)v3->super.super.super.isa;
  }
  v16[0] = playFromBeginningAction;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)usesSecondGenerationControls
{
  void *v2;
  char v3;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secondGenerationPlayerEnabled");

  return v3;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (uint64_t)_performInitialSetup
{
  id *v1;
  NSObject *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint8_t v11[16];

  if (result)
  {
    v1 = (id *)result;
    kdebug_trace();
    if (objc_msgSend(v1, "hasPerformedInitialSetup"))
    {
      _AVLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_ERROR, "Already performed initial setup.", v11, 2u);
      }

    }
    objc_msgSend(v1, "setHasPerformedInitialSetup:", 1);
    v3 = objc_msgSend(v1, "_showsWolfControls");
    objc_msgSend(v1, "_startPlayerLayerViewObservationsIfNeeded");
    v4 = v1[187];
    if (v3)
    {
      v5 = (id)objc_msgSend(v4, "startObserving:keyPath:includeInitialValue:observationHandler:", v1, CFSTR("playerController.status"), 1, &__block_literal_global_425);
      objc_msgSend(v1, "_behaviorStorage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_viewDidLoad, &unk_1EECA27A0, &__block_literal_global_426);

      v7 = (id)objc_msgSend(v1, "keyCommands");
    }
    else
    {
      v8 = (id)objc_msgSend(v4, "startObserving:keyPath:includeInitialValue:observationHandler:", v1, CFSTR("playerController.status"), 1, &__block_literal_global_427);
      objc_msgSend(v1[187], "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVSecondScreenConnectionActiveDidChangeNotification"), 0, 0, &__block_literal_global_428);
      objc_msgSend(v1[187], "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5228], v1, 0, &__block_literal_global_429);
      objc_msgSend(v1[187], "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5218], v1, 0, &__block_literal_global_430);
      objc_msgSend(v1, "_behaviorStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_viewDidLoad, &unk_1EECA27A0, &__block_literal_global_431);

      v10 = (id)objc_msgSend(v1, "keyCommands");
      -[AVPlayerViewController _setUpGestureRecognizersIfNeeded]((uint64_t)v1);
      -[AVPlayerViewController _setUpVideoFrameVisualAnalyzerIfNeeded]((uint64_t)v1);
      -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)v1);
      objc_msgSend(v1, "_setUpSecondScreenConnectionIfNeeded");
      -[AVPlayerViewController _setUpEnhanceDialogueControllerIfNeeded](v1);
      -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)v1);
      -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)v1, 0);
    }
    return kdebug_trace();
  }
  return result;
}

- (void)_setUpVisualAnalysisViewIfNeeded
{
  uint64_t v2;
  void *v3;
  int v4;
  AVVisualAnalysisView *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 1696))
    {
      -[AVPlayerViewController _currentAnalysis](a1);
      v2 = objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        v3 = (void *)v2;
        v4 = objc_msgSend((id)a1, "hasPerformedInitialSetup");

        if (v4)
        {
          objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("analysisView"));
          v5 = [AVVisualAnalysisView alloc];
          v6 = -[AVVisualAnalysisView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          v7 = *(void **)(a1 + 1696);
          *(_QWORD *)(a1 + 1696) = v6;

          objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("analysisView"));
          objc_msgSend(*(id *)(a1 + 1696), "setDelegate:", a1);
          -[AVPlayerViewController _updateAnalysisViewSuperview]((_QWORD *)a1);
          -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)a1);
          -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded]((_QWORD *)a1);
          -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded]((_QWORD *)a1);
          -[AVPlayerViewController _updateVisualAnalysisViewHiddenState](a1);
          -[AVPlayerViewController _updateShowsAnalysisControl](a1);
          -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes](a1);
          if (*(_QWORD *)(a1 + 1456) == 1)
            v8 = 30;
          else
            v8 = *(_QWORD *)(a1 + 1456);
          objc_msgSend(*(id *)(a1 + 1128), "setVideoFrameAnalysisTypes:", v8);
        }
      }
    }
  }
}

- (id)_currentAnalysis
{
  id v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = *(id *)(a1 + 1040);
    v3 = *(void **)(a1 + 1488);
    if (v3)
    {
      v4 = v3;

      v2 = v4;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setHasPerformedInitialSetup:(BOOL)a3
{
  self->_hasPerformedInitialSetup = a3;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *localizedDiscoverabilityTitleForKeyCommandLocalizationKey;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *);
  void *v21;
  AVPlayerViewController *v22;
  id v23;

  if (!-[AVPlayerViewController canControlPlayback](self, "canControlPlayback"))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController _localizedDiscoverabilityTitleForKeyCommandLocalizationKey](self, "_localizedDiscoverabilityTitleForKeyCommandLocalizationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    localizedDiscoverabilityTitleForKeyCommandLocalizationKey = self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey;
    self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey = v5;

  }
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __37__AVPlayerViewController_keyCommands__block_invoke;
  v21 = &unk_1E5BB19B0;
  v22 = self;
  v7 = v3;
  v23 = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1AF43E9B8](&v18);
  ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD, char *, _QWORD, const __CFString *, const __CFString *, uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *), void *, AVPlayerViewController *))v8)[2](v8, CFSTR(" "), 0, 0, sel__handlePlayPauseKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_PLAY_PAUSE"), CFSTR("Play/Pause keyboard command discoverability title"), v18, v19, v20, v21, v22);
  -[AVPlayerViewController _volumeController](self, "_volumeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentRouteHasVolumeControl");

  if (v10)
  {
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, _QWORD, uint64_t, char *, char *, const __CFString *, const __CFString *))v8[2])(v8, *MEMORY[0x1E0DC4E30], 0, 1, sel__handleVolumeUpKeyPressedCommand_, sel__handleVolumeUpKeyReleasedCommand_, CFSTR("KEYBOARD_DISCOVERABILITY_VOLUME_UP"), CFSTR("Volume up keyboard command discoverability title"));
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, _QWORD, uint64_t, char *, char *, const __CFString *, const __CFString *))v8[2])(v8, *MEMORY[0x1E0DC4D90], 0, 1, sel__handleVolumeDownKeyPressedCommand_, sel__handleVolumeDownKeyReleasedCommand_, CFSTR("KEYBOARD_DISCOVERABILITY_VOLUME_DOWN"), CFSTR("Volume down keyboard command discoverability title"));
  }
  -[AVPlayerViewController playerController](self, "playerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback")
    && objc_msgSend(v11, "canSeek"))
  {
    v12 = *MEMORY[0x1E0DC4E10];
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, _QWORD, uint64_t, char *, _QWORD, const __CFString *, const __CFString *))v8[2])(v8, *MEMORY[0x1E0DC4E10], 0, 1, sel__handleSkipBack15SecondsKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_SKIP_BACK_15"), CFSTR("Skip back 15 seconds keyboard command discoverability title"));
    v13 = *MEMORY[0x1E0DC4E28];
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, _QWORD, uint64_t, char *, _QWORD, const __CFString *, const __CFString *))v8[2])(v8, *MEMORY[0x1E0DC4E28], 0, 1, sel__handleSkipAhead15SecondsKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_SKIP_AHEAD_15"), CFSTR("Skip ahead 15 seconds keyboard command discoverability title"));
    if (objc_msgSend(v11, "canSeekToBeginning"))
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t, uint64_t, uint64_t, char *, _QWORD, const __CFString *, const __CFString *))v8[2])(v8, v12, 0x80000, 1, sel__handleGoToBeginningKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_GO_TO_BEGINNING"), CFSTR("Go to beginning keyboard command discoverability title"));
    if (objc_msgSend(v11, "canScanBackward"))
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t, _QWORD, uint64_t, char *, char *, const __CFString *, const __CFString *))v8[2])(v8, v12, 0, 1, sel__handleRewindKeyPressedCommand_, sel__handleRewindKeyReleasedCommand_, CFSTR("KEYBOARD_DISCOVERABILITY_REWIND"), CFSTR("Rewind keyboard command discoverability title"));
    if (objc_msgSend(v11, "canScanForward"))
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t, _QWORD, uint64_t, char *, char *, const __CFString *, const __CFString *))v8[2])(v8, v13, 0, 1, sel__handleFastForwardKeyPressedCommand_, sel__handleFastForwardKeyReleasedCommand_, CFSTR("KEYBOARD_DISCOVERABILITY_FAST_FORWARD"), CFSTR("Fast forward keyboard command discoverability title"));
    if (objc_msgSend(v11, "canSeekFrameBackward"))
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t, uint64_t, uint64_t, char *, _QWORD, const __CFString *, const __CFString *))v8[2])(v8, v12, 0x20000, 1, sel__handleShowPreviousFrameKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_SHOW_PREVIOUS_FRAME"), CFSTR("Show previous frame keyboard command discoverability title"));
    if (objc_msgSend(v11, "canSeekFrameForward"))
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t, uint64_t, uint64_t, char *, _QWORD, const __CFString *, const __CFString *))v8[2])(v8, v13, 0x20000, 1, sel__handleShowNextFrameKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_SHOW_NEXT_FRAME"), CFSTR("Show next frame keyboard command discoverability title"));
  }
  -[AVPlayerViewController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCoveringWindow");

  if (v15)
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, _QWORD, _QWORD, char *, _QWORD, const __CFString *, const __CFString *))v8[2])(v8, *MEMORY[0x1E0DC4DA0], 0, 0, sel__handleExitFullScreenKeyCommand_, 0, CFSTR("KEYBOARD_DISCOVERABILITY_EXIT_FULLSCREEN"), CFSTR("Exit full screen keyboard command discoverability title"));
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (BOOL)canControlPlayback
{
  return -[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls")
      || -[AVPlayerViewController hasCustomPlaybackControls](self, "hasCustomPlaybackControls");
}

- (void)_updateStatusBarGradientViewVisibility
{
  void *v2;
  _BOOL8 v3;
  id v4;

  if (a1 && *(_QWORD *)(a1 + 1176) != 1)
  {
    objc_msgSend((id)a1, "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {

    }
    else if ((objc_msgSend((id)a1, "isPresentingFullScreenFromInline") & 1) == 0)
    {
      goto LABEL_8;
    }
    if (!*(_BYTE *)(a1 + 1008))
    {
      v3 = *(_BYTE *)(a1 + 1009) == 0;
      goto LABEL_10;
    }
LABEL_8:
    v3 = 0;
LABEL_10:
    objc_msgSend(*(id *)(a1 + 1160), "playbackContentContainerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:", v3);

  }
}

- (void)_setUpSecondScreenConnectionIfNeeded
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  AVSecondScreenContentViewConnection *v6;
  void *v7;
  void *v8;
  void *v9;
  AVSecondScreenContentViewConnection *secondScreenConnection;
  uint64_t v11;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackContentContainerView");
  v11 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v11;
  if (v11)
  {
    if (!self->_secondScreenConnection)
    {
      v5 = -[AVPlayerViewController hasPerformedInitialSetup](self, "hasPerformedInitialSetup");
      v4 = (void *)v11;
      if (v5)
      {
        v6 = -[AVSecondScreenContentViewConnection initWithContentView:]([AVSecondScreenContentViewConnection alloc], "initWithContentView:", v11);
        -[AVPlayerViewController player](self, "player");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVSecondScreenConnection setDebugInfoPlayer:](v6, "setDebugInfoPlayer:", v7);

        -[AVPlayerViewController player](self, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVSecondScreenConnection setPlayer:](v6, "setPlayer:", v8);

        -[AVSecondScreenConnection setRequiresTVOutScreen:](v6, "setRequiresTVOutScreen:", 1);
        -[AVSecondScreenContentViewConnection startUpdates](v6, "startUpdates");
        +[AVSecondScreenController sharedInstance](AVSecondScreenController, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addConnection:", v6);

        secondScreenConnection = self->_secondScreenConnection;
        self->_secondScreenConnection = v6;

        -[AVPlayerViewController _updateSecondScreenConnectionPlayingState](self, "_updateSecondScreenConnectionPlayingState");
        -[AVPlayerViewController _updateSecondScreenConnectionReadyToConnect](self, "_updateSecondScreenConnectionReadyToConnect");
        v4 = (void *)v11;
      }
    }
  }

}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  AVPlayerController *v6;
  void *v7;
  NSObject *v8;
  AVSecondScreenContentViewConnection *secondScreenConnection;
  void *v10;
  AVSecondScreenContentViewConnection *v11;
  void *v12;
  AVSmartSubtitlesController *smartSubtitlesController;
  AVSmartSubtitlesController *v14;
  AVSmartSubtitlesController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __AVPlayerLayerView *v23;
  void *v24;
  __AVPlayerLayerView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  AVObservationController *v35;
  AVObservationController *pipActivitySessionObservationController;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  const char *v41;
  __int16 v42;
  AVPlayerController *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = (AVPlayerController *)a3;
  v6 = self->_playerController;
  if (v6 != v5)
  {
    -[AVNowPlayingInfoController stopNowPlayingUpdatesForPlayerController:](self->_nowPlayingInfoController, "stopNowPlayingUpdatesForPlayerController:", v6);
    -[AVPlayerViewController volumeAnimator](self, "volumeAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "restoreVolumeIfNeeded");

    -[AVPlayerViewController setVolumeAnimator:](self, "setVolumeAnimator:", 0);
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 136315394;
      v41 = "-[AVPlayerViewController setPlayerController:]";
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v40, 0x16u);
    }

    -[AVPlayerController setPlayingOnSecondScreen:](v5, "setPlayingOnSecondScreen:", -[AVPlayerController isPlayingOnSecondScreen](v6, "isPlayingOnSecondScreen"));
    secondScreenConnection = self->_secondScreenConnection;
    -[AVPlayerViewController player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection setDebugInfoPlayer:](secondScreenConnection, "setDebugInfoPlayer:", v10);

    v11 = self->_secondScreenConnection;
    -[AVPlayerViewController player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSecondScreenConnection setPlayer:](v11, "setPlayer:", v12);

    objc_storeStrong((id *)&self->_playerController, a3);
    smartSubtitlesController = self->_smartSubtitlesController;
    if (!smartSubtitlesController)
    {
      v14 = objc_alloc_init(AVSmartSubtitlesController);
      v15 = self->_smartSubtitlesController;
      self->_smartSubtitlesController = v14;

      -[AVSmartSubtitlesController setDelegate:](self->_smartSubtitlesController, "setDelegate:", self);
      smartSubtitlesController = self->_smartSubtitlesController;
    }
    -[AVPlayerViewController playerController](self, "playerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVSmartSubtitlesController setPlayerController:](smartSubtitlesController, "setPlayerController:", v16);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AVPlayerController setInternalDelegate:](self->_playerController, "setInternalDelegate:", self);
      -[AVPlayerController setInternalDelegate:](v6, "setInternalDelegate:", 0);
    }
    -[AVPlayerViewController player](self, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController player](v5, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != v18)
    {
      -[AVPlayerController player](v5, "player");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController setPlayer:](self, "setPlayer:", v19);

    }
    -[AVPlayerViewController _updateActivePlaybackSpeedIfNeeded](self, "_updateActivePlaybackSpeedIfNeeded");
    v20 = 0x1EEC7D000uLL;
    v21 = 0x1EEC7D000uLL;
    if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    {
      v22 = 0x1EEC7D000uLL;
      if (v5 && !self->_playerLayerView)
      {
        v23 = [__AVPlayerLayerView alloc];
        -[AVPlayerViewController contentView](self, "contentView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        v25 = -[__AVPlayerLayerView initWithFrame:](v23, "initWithFrame:");

        -[__AVPlayerLayerView setPixelBufferAttributes:](v25, "setPixelBufferAttributes:", self->_pixelBufferAttributes);
        -[AVPlayerViewController contentView](self, "contentView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "layoutClass");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[AVPlayerViewController _targetVideoGravitiesForLayoutClass](self, "_targetVideoGravitiesForLayoutClass");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVPlayerViewController contentView](self, "contentView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "layoutClass");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = 0x1EEC7D000;
          v20 = 0x1EEC7D000;

          v21 = 0x1EEC7D000;
        }
        else
        {
          -[AVPlayerViewController videoGravity](self, "videoGravity");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }

        -[__AVPlayerLayerView setVideoGravity:](v25, "setVideoGravity:", AVVideoGravityFromString(v31));
        -[AVPlayerViewController setPlayerLayerView:](self, "setPlayerLayerView:", v25);

      }
      -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPlayerController:", v5);

      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v22 + 3980)), "setPlayerController:", v5);
      -[AVPictureInPictureController setPlayerController:](self->_pictureInPictureController, "setPlayerController:", v5);
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v20 + 4008)), "setPlayerController:", v5);
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v21 + 4040)), "setPlayerController:", v5);
      -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
      -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
    }
    if (-[AVPlayerViewController shouldUseNetworkingResourcesForLiveStreamingWhilePaused](self, "shouldUseNetworkingResourcesForLiveStreamingWhilePaused"))
    {
      -[AVPlayerController stopUsingNetworkResourcesForLiveStreamingWhilePaused](v6, "stopUsingNetworkResourcesForLiveStreamingWhilePaused");
      -[AVPlayerController startUsingNetworkResourcesForLiveStreamingWhilePaused](v5, "startUsingNetworkResourcesForLiveStreamingWhilePaused");
    }
    -[AVPlayerController pipActivitySessionIdentifier](v5, "pipActivitySessionIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController setPictureInPictureActivitySessionIdentifier:](self, "setPictureInPictureActivitySessionIdentifier:", v33);

    -[AVPlayerViewController _pipActivitySessionObservationController](self, "_pipActivitySessionObservationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stopAllObservation");

    if (v5)
    {
      v35 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
      pipActivitySessionObservationController = self->__pipActivitySessionObservationController;
      self->__pipActivitySessionObservationController = v35;

      -[AVPlayerViewController _pipActivitySessionObservationController](self, "_pipActivitySessionObservationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification"), v5, 0, &__block_literal_global_121_8188);

    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v20 + 4008)), "setPlayerController:", v5);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v21 + 4040)), "setPlayerController:", v5);
    -[AVScrubbingGestureController setPlayerController:](self->_scrubbingGestureController, "setPlayerController:", v5);
    -[AVEnhanceDialogueController setPlayerController:](self->_enhanceDialogueController, "setPlayerController:", v5);
    -[AVPlayerViewController _setUpVideoFrameVisualAnalyzerIfNeeded]((uint64_t)self);
    -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
    -[AVPlayerViewController _updateNowPlayingInfoController](self, "_updateNowPlayingInfoController");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "postNotificationName:object:", CFSTR("AVPlayerViewControllerDidChangePlayerControllerNotification"), self);

    -[AVPlayerController interstitialController](v6, "interstitialController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setDelegateManager:", 0);

    -[AVPlayerViewController _setupInterstitialControllerDelegateIfNeeded]((uint64_t)self);
  }

}

- (AVPlayer)player
{
  return self->_player;
}

- (void)_updateVisualAnalyzerEnabledStateIfNeeded
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  char v6;
  char v7;
  char v8;
  _BOOL8 v9;
  id v10;

  if (a1)
  {
    v2 = *(void **)(a1 + 1128);
    if (v2)
    {
      v3 = v2;
      objc_msgSend((id)a1, "playerController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 1160), "scrollingObserver");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isScrolling");

      v6 = objc_msgSend((id)a1, "isPictureInPictureActive");
      v7 = objc_msgSend(v10, "isPlayingOnSecondScreen");
      v8 = objc_msgSend(v10, "isPlayingOnExternalScreen");
      if ((v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || (v9 = *(_BYTE *)(a1 + 1407) != 0, v5))
        v9 = 0;
      objc_msgSend(v3, "setEnabled:", v9);

    }
  }
}

- (AVObservationController)_pipActivitySessionObservationController
{
  return self->__pipActivitySessionObservationController;
}

- (void)_updateNowPlayingInfoController
{
  AVNowPlayingInfoController *v3;
  _BOOL4 v4;
  void *v5;
  AVNowPlayingInfoController *nowPlayingInfoController;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  v3 = self->_nowPlayingInfoController;
  v4 = -[AVPlayerViewController _wantsNowPlayingInfoCenter:](self, "_wantsNowPlayingInfoCenter:", 0);
  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
    {
      -[AVNowPlayingInfoController startNowPlayingUpdatesForPlayerController:afterDelay:](v3, "startNowPlayingUpdatesForPlayerController:afterDelay:", v5, 1.0);
    }
    else
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__AVPlayerViewController__updateNowPlayingInfoController__block_invoke;
      v7[3] = &unk_1E5BB1D58;
      objc_copyWeak(&v8, &location);
      objc_copyWeak(&v9, &from);
      +[AVNowPlayingInfoController sharedNowPlayingInfoControllerWithCompletion:](AVNowPlayingInfoController, "sharedNowPlayingInfoControllerWithCompletion:", v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[AVNowPlayingInfoController stopNowPlayingUpdatesForPlayerController:](v3, "stopNowPlayingUpdatesForPlayerController:", v5);
    nowPlayingInfoController = self->_nowPlayingInfoController;
    self->_nowPlayingInfoController = 0;

  }
}

- (void)setPlayerLayerView:(id)a3
{
  __AVPlayerLayerView *v5;
  __AVPlayerLayerView *playerLayerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  AVVideoFrameVisualAnalyzer *videoFrameVisualAnalyzer;
  void *v18;
  __AVPlayerLayerView *v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (__AVPlayerLayerView *)a3;
  playerLayerView = self->_playerLayerView;
  v19 = v5;
  if (playerLayerView != v5)
  {
    -[__AVPlayerLayerView removeFromSuperview](playerLayerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_playerLayerView, a3);
    -[AVPlayerViewController _updatePlayerLayerLegibleContentInsetsIfNeeded](self, "_updatePlayerLayerLegibleContentInsetsIfNeeded");
    -[AVPlayerViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackContentContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayerLayerView:", v19);

    -[AVPlayerViewController contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackContentContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "playerLayerView");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v10 && v12 && v13)
    {
      _AVLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[AVPlayerViewController _updatePlayerLayerPlayerControllerIfNeeded]";
        _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "%s - setting the player controller on the contentView's playerLayerView.", buf, 0xCu);
      }

      -[AVPlayerViewController playerController](self, "playerController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPlayerController:", v16);

    }
    videoFrameVisualAnalyzer = self->_videoFrameVisualAnalyzer;
    -[__AVPlayerLayerView playerLayer](v19, "playerLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVideoFrameVisualAnalyzer setPlayerLayer:](videoFrameVisualAnalyzer, "setPlayerLayer:", v18);

    -[AVPlayerViewController _startPlayerLayerViewObservationsIfNeeded](self, "_startPlayerLayerViewObservationsIfNeeded");
  }

}

- (void)_startPlayerLayerViewObservationsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  if (!self->_playerLayerViewObservationsHasBeenSetup)
  {
    self->_playerLayerViewObservationsHasBeenSetup = 1;
    -[AVPlayerViewController _observationController](self, "_observationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController playerLayerView](self, "playerLayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerLayerView.readyForDisplay"), objc_msgSend(v4, "isReadyForDisplay"), &__block_literal_global_549);

    -[AVPlayerViewController _observationController](self, "_observationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController playerLayerView](self, "playerLayerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerLayerView.videoBounds"), objc_msgSend(v6, "isReadyForDisplay"), &__block_literal_global_552);

  }
}

- (AVObservationController)_observationController
{
  return self->_observationController;
}

- (AVPlayerControllerVolumeAnimator)volumeAnimator
{
  return self->_volumeAnimator;
}

- (BOOL)shouldUseNetworkingResourcesForLiveStreamingWhilePaused
{
  return self->_shouldUseNetworkingResourcesForLiveStreamingWhilePaused;
}

- (void)setVolumeAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeAnimator, a3);
}

- (void)setPictureInPictureActivitySessionIdentifier:(id)a3
{
  NSString *v4;
  NSString *pictureInPictureActivitySessionIdentifier;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  pictureInPictureActivitySessionIdentifier = self->_pictureInPictureActivitySessionIdentifier;
  self->_pictureInPictureActivitySessionIdentifier = v4;

  if (v6)
    -[AVPlayerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[AVPictureInPictureController setActivitySessionIdentifier:](self->_pictureInPictureController, "setActivitySessionIdentifier:", v6);

}

- (void)_updatePlayerControllerInspectionState
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;

  if (a1)
  {
    objc_msgSend((id)a1, "playerController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v2 = *(id *)(a1 + 1160);
    if (*(_BYTE *)(a1 + 1006))
      goto LABEL_8;
    if ((objc_msgSend((id)a1, "requiresImmediateAssetInspection") & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v2, "window");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_6;
    v4 = (void *)v3;
    objc_msgSend(v2, "scrollingObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isScrolling");

    if ((v6 & 1) == 0)
    {
LABEL_8:
      if ((objc_msgSend(v8, "isInspectionSuspended") & 1) != 0)
      {
        v7 = 0;
        goto LABEL_10;
      }
    }
    else
    {
LABEL_6:
      if ((objc_msgSend(v8, "isInspectionSuspended") & 1) == 0)
      {
        v7 = 1;
LABEL_10:
        objc_msgSend(v8, "setInspectionSuspended:", v7);
        objc_msgSend((id)a1, "_updateNowPlayingInfoController");
      }
    }

  }
}

- (BOOL)requiresImmediateAssetInspection
{
  return self->_requiresImmediateAssetInspection;
}

- (void)setPlayer:(AVPlayer *)player
{
  AVPlayer *v5;
  AVPlayer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  AVPlayer *v14;
  AVPlayerController *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  AVPlayer *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = player;
  -[AVPlayerViewController player](self, "player");
  v6 = (AVPlayer *)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[AVPlayerViewController setPlayer:]";
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_player, player);
    if (v5)
    {
      -[AVPlayer dispatchQueue](v5, "dispatchQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C80D38];

      if (v8 != v9)
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99750];
        _AVMethodProem(self);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "raise:format:", v11, CFSTR("%@ only supports AVPlayer instances that have been initialized with the main queue as the dispatch queue for serializing key-value observations."), v12);

      }
    }
    -[AVPlayerViewController playerController](self, "playerController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "player");
    v14 = (AVPlayer *)objc_claimAutoreleasedReturnValue();

    if (v14 != v5)
    {
      kdebug_trace();
      v15 = -[AVPlayerController initWithPlayer:]([AVPlayerController alloc], "initWithPlayer:", v5);
      -[AVPlayerController setHandlesAudioSessionInterruptions:](v15, "setHandlesAudioSessionInterruptions:", 1);
      if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
        -[AVPlayerController setShouldLoadVisualMediaSelectionOptions:](v15, "setShouldLoadVisualMediaSelectionOptions:", 1);
      else
        -[AVPlayerController setInspectionSuspended:](v15, "setInspectionSuspended:", -[AVPlayerViewController requiresImmediateAssetInspection](self, "requiresImmediateAssetInspection") ^ 1);
      -[AVPlayerViewController playerController](self, "playerController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AVPlayerViewController playerController](self, "playerController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AVPlayerViewController playerController](self, "playerController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_opt_respondsToSelector();

          if ((v19 & 1) == 0)
          {
LABEL_18:
            kdebug_trace();
            -[AVPlayerViewController setPlayerController:](self, "setPlayerController:", v15);
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "postNotificationName:object:", CFSTR("AVPlayerViewControllerDidChangePlayerControllerNotification"), self);

            goto LABEL_19;
          }
          -[AVPictureInPictureController pictureInPictureViewController](self->_pictureInPictureController, "pictureInPictureViewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "pictureInPicturePlayerLayerView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "playerLayer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[AVPlayerViewController playerController](self, "playerController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "endReducingResourcesForPictureInPicturePlayerLayer:", v16);

          if (-[AVPictureInPictureController wantsResourceReduction](self->_pictureInPictureController, "wantsResourceReduction"))
          {
            -[AVPlayerController beginReducingResourcesForPictureInPicturePlayerLayer:](v15, "beginReducingResourcesForPictureInPicturePlayerLayer:", v16);
          }
        }
        else
        {

        }
      }

      goto LABEL_18;
    }
  }
LABEL_19:

}

- (BOOL)updatesNowPlayingInfoCenter
{
  return self->_updatesNowPlayingInfoCenter;
}

- (AVLayerVideoGravity)videoGravity
{
  int64_t videoGravity;

  if (self->_playerLayerView)
    videoGravity = -[__AVPlayerLayerView videoGravity](self->_playerLayerView, "videoGravity");
  else
    videoGravity = self->_videoGravity;
  NSStringFromVideoGravity(videoGravity);
  return (AVLayerVideoGravity)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_canPausePlaybackWhenClosingPictureInPicture != a3)
  {
    v3 = a3;
    self->_canPausePlaybackWhenClosingPictureInPicture = a3;
    if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
      -[AVPictureInPictureController setCanPausePlaybackWhenClosingPictureInPicture:](self->_pictureInPictureController, "setCanPausePlaybackWhenClosingPictureInPicture:", v3);
  }
}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_preferredUnobscuredArea != a3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPreferredUnobscuredArea:]";
      v9 = 2048;
      v10 = a3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v7, 0x16u);
    }

    self->_preferredUnobscuredArea = a3;
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredUnobscuredArea:", a3);

  }
}

- (void)setAllowsEnteringFullScreen:(BOOL)a3
{
  _BOOL8 v3;
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
  if (self->_allowsEnteringFullScreen != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController setAllowsEnteringFullScreen:]";
      v10 = "allowsEnteringFullScreen";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_allowsEnteringFullScreen = v3;
    if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    {
      -[AVMobileControlsViewController setShowsFullScreenControl:](self->_controlsViewController, "setShowsFullScreenControl:", v3);
      -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
    }
  }
}

- (AVMobileChromelessControlsViewController)_createPreferredControlsViewController
{
  AVMobileChromelessControlsViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  AVMobileChromelessControlsViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (AVMobileChromelessControlsViewController *)0;
  if (*(_QWORD *)(a1 + 1176) == 1)
  {
    -[AVPlayerViewController _setUpEnhanceDialogueControllerIfNeeded]((id *)a1);
    v2 = objc_alloc_init(AVMobileChromelessControlsViewController);
    objc_msgSend((id)a1, "_fullScreenController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessControlsViewController setFullscreenController:](v2, "setFullscreenController:", v3);

    -[AVMobileChromelessControlsViewController setEnhanceDialogueController:](v2, "setEnhanceDialogueController:", *(_QWORD *)(a1 + 1144));
    -[AVMobileChromelessControlsViewController setRequiresLinearPlayback:](v2, "setRequiresLinearPlayback:", *(unsigned __int8 *)(a1 + 971));
    -[AVMobileControlsViewController addAction:withTarget:forEvent:](v2, "addAction:withTarget:forEvent:", sel__volumeButtonWasPressedEvent_, a1, CFSTR("AVChromelessControlsVolumeButtonPressedEvent"));
    -[AVMobileControlsViewController addAction:withTarget:forEvent:](v2, "addAction:withTarget:forEvent:", sel__playPauseButtonWasPressedEvent_, a1, CFSTR("AVChromelessControlsPlayPauseButtonPressedEvent"));
    -[AVMobileControlsViewController addAction:withTarget:forEvent:](v2, "addAction:withTarget:forEvent:", sel__copySubjectMenuItemPressedEvent_, a1, CFSTR("AVChromelessControlsCopySubjectMenuItemPressedEvent"));
    -[AVMobileControlsViewController addAction:withTarget:forEvent:](v2, "addAction:withTarget:forEvent:", sel__visualLookupMenuItemPressedEvent_, a1, CFSTR("AVChromelessControlsVisualLookupMenuItemPressedEvent"));
    -[AVMobileControlsViewController addAction:withTarget:forEvent:](v2, "addAction:withTarget:forEvent:", sel_doneButtonTapped_, a1, CFSTR("AVChromelessControlsDoneButtonPressedEvent"));
  }
  else
  {
    v2 = -[AVMobileChromeControlsViewController initWithPlayerViewController:]([AVMobileChromeControlsViewController alloc], "initWithPlayerViewController:", a1);
    objc_msgSend((id)a1, "overrideTransformForProminentPlayButton");
    -[AVMobileChromelessControlsViewController setTransformForProminentPlayButton:](v2, "setTransformForProminentPlayButton:", &v11);
    objc_msgSend((id)a1, "overrideLayoutMarginsWhenEmbeddedInline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessControlsViewController setEmbeddedInlineLayoutMargins:](v2, "setEmbeddedInlineLayoutMargins:", v4);

    -[AVMobileChromelessControlsViewController playbackControlsController](v2, "playbackControlsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaybackSpeedCollection:", *(_QWORD *)(a1 + 1688));

    -[AVMobileChromelessControlsViewController playbackControlsController](v2, "playbackControlsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredUnobscuredArea:", objc_msgSend((id)a1, "preferredUnobscuredArea"));

    -[AVMobileChromelessControlsViewController playbackControlsController](v2, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", *(unsigned __int8 *)(a1 + 1368));

  }
  -[AVMobileChromelessControlsViewController setControlItems:](v2, "setControlItems:", *(_QWORD *)(a1 + 1736));
  -[AVMobileControlsViewController setDelegate:](v2, "setDelegate:", a1);
  -[AVMobileControlsViewController setPipController:](v2, "setPipController:", *(_QWORD *)(a1 + 1504));
  -[AVMobileChromelessControlsViewController setPlayerController:](v2, "setPlayerController:", *(_QWORD *)(a1 + 1472));
  -[AVMobileChromelessControlsViewController setPlaybackSpeedCollection:](v2, "setPlaybackSpeedCollection:", *(_QWORD *)(a1 + 1688));
  -[AVMobileChromelessControlsViewController setRoutingConfiguration:](v2, "setRoutingConfiguration:", *(_QWORD *)(a1 + 1032));
  -[AVMobileChromelessControlsViewController setShowsFullScreenControl:](v2, "setShowsFullScreenControl:", objc_msgSend((id)a1, "allowsEnteringFullScreen"));
  -[AVMobileChromelessControlsViewController setTransportBarCustomMenuItems:](v2, "setTransportBarCustomMenuItems:", *(_QWORD *)(a1 + 1552));
  objc_msgSend((id)a1, "_volumeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessControlsViewController setVolumeController:](v2, "setVolumeController:", v8);

  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AVPlayerViewController _createPreferredControlsViewController]";
    v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s Created AVMobileControlsViewController: %@", buf, 0x16u);
  }

  return v2;
}

- (BOOL)allowsEnteringFullScreen
{
  return self->_allowsEnteringFullScreen;
}

- (id)_volumeController
{
  AVVolumeController *volumeController;

  volumeController = self->_volumeController;
  if (!volumeController)
  {
    -[AVPlayerViewController _updateVolumeController](self, "_updateVolumeController");
    volumeController = self->_volumeController;
  }
  return volumeController;
}

- (void)_updateVolumeController
{
  void *v3;
  AVVolumeController *volumeController;

  if (!self->_playbackControlsShouldControlSystemVolume
    || (+[AVSystemVolumeController volumeController](AVSystemVolumeController, "volumeController"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[AVPlayerVolumeController volumeController](AVPlayerVolumeController, "volumeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlayerController:", self->_playerController);
  }
  volumeController = self->_volumeController;
  self->_volumeController = (AVVolumeController *)v3;

}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, a3);
  v5 = a3;
  -[AVPlayerViewController _chromeControlsViewController](self, "_chromeControlsViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEmbeddedInlineLayoutMargins:", v5);

}

- (id)_fullScreenController
{
  AVMobileFullscreenController *fullscreenController;
  AVMobileFullscreenController *v4;
  AVMobileFullscreenController *v5;

  fullscreenController = self->_fullscreenController;
  if (!fullscreenController)
  {
    v4 = -[AVMobileFullscreenController initWithPlayerViewController:]([AVMobileFullscreenController alloc], "initWithPlayerViewController:", self);
    v5 = self->_fullscreenController;
    self->_fullscreenController = v4;

    fullscreenController = self->_fullscreenController;
  }
  return fullscreenController;
}

- (BOOL)isPictureInPictureActive
{
  return -[AVPictureInPictureController isPictureInPictureActive](self->_pictureInPictureController, "isPictureInPictureActive");
}

- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_showsMinimalPlaybackControlsWhenEmbeddedInline != a3)
  {
    v3 = a3;
    self->_showsMinimalPlaybackControlsWhenEmbeddedInline = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPlayerViewController setShowsMinimalPlaybackControlsWhenEmbeddedInline:]";
      v11 = "showsMinimalPlaybackControlsWhenEmbeddedInline";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", v3);

  }
}

void __67__AVPlayerViewController__startPlayerLayerViewObservationsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a4, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReadyForDisplay:", objc_msgSend(v6, "BOOLValue"));

}

- (void)setReadyForDisplay:(BOOL)a3
{
  self->_readyForDisplay = a3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController viewDidLoad](&v5, sel_viewDidLoad);
  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGen1Delegate:", v4);

  }
  kdebug_trace();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
}

- (UIView)customContentTransitioningInfoPanel
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customContentTransitioningInfoPanel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)_newsWidgetPlayerBehaviorContext
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behaviorContextOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setControlsGeneration:(int64_t)a3
{
  NSObject *v4;
  AVMobileControlsViewController *controlsViewController;
  void *v6;
  AVMobileControlsViewController *v7;
  AVMobileControlsViewController *v8;
  NSObject *v9;
  AVMobileControlsViewController *v10;
  int v11;
  const char *v12;
  __int16 v13;
  AVMobileControlsViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_controlsGeneration != a3)
  {
    self->_controlsGeneration = a3;
    if (self->_controlsViewController)
    {
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        controlsViewController = self->_controlsViewController;
        v11 = 136315394;
        v12 = "-[AVPlayerViewController _updateControlsViewController]";
        v13 = 2112;
        v14 = controlsViewController;
        _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Removing from AVPlayerViewController hierarchy, AVMobileControlsViewController: %@", (uint8_t *)&v11, 0x16u);
      }

      -[AVMobileControlsViewController willMoveToParentViewController:](self->_controlsViewController, "willMoveToParentViewController:", 0);
      -[AVMobileControlsViewController view](self->_controlsViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");

      -[AVMobileControlsViewController removeFromParentViewController](self->_controlsViewController, "removeFromParentViewController");
      -[AVPlayerViewController _createPreferredControlsViewController]((uint64_t)self);
      v7 = (AVMobileControlsViewController *)objc_claimAutoreleasedReturnValue();
      v8 = self->_controlsViewController;
      self->_controlsViewController = v7;

      _AVLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_controlsViewController;
        v11 = 136315394;
        v12 = "-[AVPlayerViewController _updateControlsViewController]";
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s Updated AVMobileControlsViewController to: %@", (uint8_t *)&v11, 0x16u);
      }

      -[AVPlayerViewControllerContentView setControlsViewController:](self->_playerViewControllerContentView, "setControlsViewController:", self->_controlsViewController);
      -[AVPlayerViewController _setUpGestureRecognizersIfNeeded]((uint64_t)self);
      -[UITapGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:", self->_controlsGeneration == 0);
      -[AVPlayerViewController _updateSecondGenerationControlsGestureEnablementStates]((uint64_t)self);
      -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);
      -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
      -[AVPlayerViewController _updateControlsViewControllerInitialState]((uint64_t)self);
    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
  NSObject *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AVPlayerViewController flashPlaybackControlsWithDuration:]";
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %f", buf, 0x16u);
  }

  v6 = 2.0;
  if (a3 <= 2.0)
  {
    _AVMethodProem(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("*** Warning: Called %@ with a duration of %@. Ignoring the duration as it is too short."), v7, v8);

  }
  else
  {
    v6 = a3;
  }
  -[AVPlayerViewController controlsViewController](self, "controlsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flashControlsWithDuration:", v6);

}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)updatesNowPlayingInfoCenter
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
  if (self->_updatesNowPlayingInfoCenter != updatesNowPlayingInfoCenter)
  {
    v3 = updatesNowPlayingInfoCenter;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController setUpdatesNowPlayingInfoCenter:]";
      v10 = "updatesNowPlayingInfoCenter";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_updatesNowPlayingInfoCenter = v3;
    -[AVPlayerViewController _updateNowPlayingInfoController](self, "_updateNowPlayingInfoController");
  }
}

- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3
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
  if (self->_playbackControlsIncludeVolumeControls != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPlaybackControlsIncludeVolumeControls:]";
      v10 = "playbackControlsIncludeVolumeControls";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsIncludeVolumeControls = v3;
    -[AVPlayerViewController _updateIncludedControls](self, "_updateIncludedControls");
  }
}

- (void)setVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __AVPlayerLayerView *playerLayerView;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[AVPlayerViewController setVideoGravity:forLayoutClass:]";
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ layoutClass: %ld", (uint8_t *)&v16, 0x20u);
  }

  -[AVPlayerViewController _targetVideoGravitiesForLayoutClass](self, "_targetVideoGravitiesForLayoutClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  -[AVPlayerViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTargetVideoGravity:forLayoutClass:", v6, a4);

  -[AVPlayerViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    playerLayerView = self->_playerLayerView;
    -[AVPlayerViewController contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(playerLayerView) = -[__AVPlayerLayerView isDescendantOfView:](playerLayerView, "isDescendantOfView:", v15);

    if ((playerLayerView & 1) == 0)
      -[__AVPlayerLayerView setVideoGravity:](self->_playerLayerView, "setVideoGravity:", AVVideoGravityFromString(v6));
  }
  else
  {

  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Did receive stop command notification.", v13, 2u);
  }

  objc_msgSend(v6, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "playbackControlsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nowPlayingInfoControllerIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    objc_msgSend(v5, "fullScreenViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v5, "_transitionFromFullScreenWithReason:animated:completionHandler:", 3, 1, 0);
    else
      objc_msgSend(v5, "_transitionFromFullScreenAnimated:completionHandler:", 1, 0);
  }

}

void __39__AVPlayerViewController__addObservers__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;

  v2 = a2;
  -[AVPlayerViewController _setupInfoTabViewController](v2);
  -[AVPlayerViewController _updateInfoTabViewControllerIfNeeded](v2);

}

void __39__AVPlayerViewController__addObservers__block_invoke_16(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](v2);
  objc_msgSend(v2, "updateVideoBounds");

}

void __39__AVPlayerViewController__addObservers__block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  _QWORD *v5;
  void *v6;
  int v7;
  _QWORD *v8;

  v8 = a2;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isTVApp"))
  {

  }
  else
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAVKitTester");

    v5 = v8;
    if (!v4)
      goto LABEL_6;
  }
  objc_msgSend(v8, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "coordinatedPlaybackActive");

  v5 = v8;
  if (v7)
  {
    objc_msgSend(v8, "_updateSelectedPlaybackSpeedIfPlayerControllerRateChanges");
    v5 = v8;
  }
LABEL_6:
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v5, 0);

}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSecondScreenConnectionReadyToConnect");
}

- (BOOL)canStartPictureInPictureAutomaticallyWhenEnteringBackground
{
  return self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground;
}

- (CGSize)videoDisplaySize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  -[AVPlayerViewController secondScreenConnectionDisplaySize](self, "secondScreenConnectionDisplaySize");
  v4 = v3;
  v6 = v5;
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = *MEMORY[0x1E0C9D820] == v3 && v7 == v6;
  if (v8
    && (-[AVPlayerViewController playerController](self, "playerController", *MEMORY[0x1E0C9D820], v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "externalPlaybackType"),
        v9,
        v10 != 1))
  {
    -[__AVPlayerLayerView videoDisplaySize](self->_playerLayerView, "videoDisplaySize");
  }
  else
  {
    v11 = v4;
    v12 = v6;
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)set_hasBegunObservation:(BOOL)a3
{
  self->__hasBegunObservation = a3;
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  void *v4;
  NSString *v5;

  v5 = videoGravity;
  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
  {
    self->_hasClientSetVideoGravity = 1;
    -[AVPlayerViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCanAutomaticallyZoomLetterboxVideos:", 0);

    self->_videoGravity = AVVideoGravityFromString(v5);
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v5, 0);
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v5, 1);
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v5, 2);
  }

}

- (void)setLegibleContentInsets:(UIEdgeInsets)a3
{
  if (self->_legibleContentInsets.left != a3.left
    || self->_legibleContentInsets.top != a3.top
    || self->_legibleContentInsets.right != a3.right
    || self->_legibleContentInsets.bottom != a3.bottom)
  {
    self->_legibleContentInsets = a3;
    -[AVPlayerViewController _updatePlayerLayerLegibleContentInsetsIfNeeded](self, "_updatePlayerLayerLegibleContentInsetsIfNeeded");
  }
}

- (void)setExitsFullScreenWhenPlaybackEnds:(BOOL)exitsFullScreenWhenPlaybackEnds
{
  self->_exitsFullScreenWhenPlaybackEnds = exitsFullScreenWhenPlaybackEnds;
}

- (void)setCustomControlItems:(id)a3
{
  NSArray *v4;
  NSArray *customControlItems;
  AVMobileControlsViewController *controlsViewController;
  id v7;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_customControlItems, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    customControlItems = self->_customControlItems;
    self->_customControlItems = v4;

    controlsViewController = self->_controlsViewController;
    if (controlsViewController)
      -[AVMobileControlsViewController setControlItems:](controlsViewController, "setControlItems:", v7);
  }

}

- (void)setCanIncludePlaybackControlsWhenInline:(BOOL)a3
{
  void *v4;

  if (self->_canIncludePlaybackControlsWhenInline != a3)
  {
    self->_canIncludePlaybackControlsWhenInline = a3;
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCanIncludePlaybackControlsWhenInline:", -[AVPlayerViewController canIncludePlaybackControlsWhenInline](self, "canIncludePlaybackControlsWhenInline"));

    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
  }
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)allowsPictureInPicturePlayback
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  _BYTE v8[24];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_allowsPictureInPicturePlayback != allowsPictureInPicturePlayback)
  {
    v3 = allowsPictureInPicturePlayback;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      *(_DWORD *)v8 = 136315650;
      *(_QWORD *)&v8[4] = "-[AVPlayerViewController setAllowsPictureInPicturePlayback:]";
      *(_QWORD *)&v8[14] = "allowsPictureInPicturePlayback";
      *(_WORD *)&v8[12] = 2080;
      if (v3)
        v6 = "YES";
      *(_WORD *)&v8[22] = 2080;
      v9 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v8, 0x20u);
    }

    self->_allowsPictureInPicturePlayback = v3;
    if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
      -[AVPictureInPictureController setAllowsPictureInPicturePlayback:](self->_pictureInPictureController, "setAllowsPictureInPicturePlayback:", v3);
    }
    if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground_, *(_OWORD *)v8, *(_QWORD *)&v8[16]))
    {
      -[AVPlayerViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController setCanStartPictureInPictureAutomaticallyFromInline:](self, "setCanStartPictureInPictureAutomaticallyFromInline:", objc_msgSend(v7, "playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground:", self));

    }
    if (-[AVPlayerViewController isPictureInPictureActive](self, "isPictureInPictureActive"))
    {
      if (!v3)
        -[AVPlayerViewController stopPictureInPicture](self, "stopPictureInPicture");
    }
  }
}

- (void)setAllowInfoMetadataSubpanel:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[AVPlayerViewController setAllowInfoMetadataSubpanel:]";
    v11 = 1024;
    v12 = 2517;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v9, 0x12u);
  }

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isTVApp"))
  {

  }
  else
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isArtemisApp");

    if ((v8 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error: setAllowInfoMetadataSubpanel is only available on the TV app and the Artemis app."));
  }
  if (self->_allowInfoMetadataSubpanel != v3)
  {
    self->_allowInfoMetadataSubpanel = v3;
    if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
      -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)self);
  }
}

- (CGSize)secondScreenConnectionDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_secondScreenConnectionDisplaySize.width;
  height = self->_secondScreenConnectionDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  unsigned int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AVPlayerViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (-[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline"))
    goto LABEL_7;
  -[AVPlayerViewController navigationController](self, "navigationController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[AVPlayerViewController navigationController](self, "navigationController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isNavigationBarHidden"),
        v10,
        v9,
        (v11 & 1) != 0))
  {
LABEL_7:
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isBeingDismissed") & 1) != 0)
    {
      -[AVPlayerViewController presentationContext](self, "presentationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rotatableWindowViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
    if ((objc_msgSend(v7, "isCounterRotatingContentView") & 1) != 0)
    {
      v15 = 1;
      goto LABEL_16;
    }
    v16 = -[AVPlayerViewController _controlsViewControllerPrefersStatusBarHidden](self, "_controlsViewControllerPrefersStatusBarHidden");
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)AVPlayerViewController;
    v16 = -[AVPlayerViewController prefersStatusBarHidden](&v22, sel_prefersStatusBarHidden);
  }
  v15 = v16;
LABEL_16:
  _AVLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = "NO";
    *(_DWORD *)buf = 136315650;
    v24 = "-[AVPlayerViewController prefersStatusBarHidden]";
    v26 = "prefersStatusBarHidden";
    v25 = 2080;
    if (v15)
      v18 = "YES";
    v27 = 2080;
    v28 = v18;
    _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  if (self->_currentPrefersStatusBarHidden != v15)
  {
    self->_currentPrefersStatusBarHidden = v15;
    _AVLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = "NO";
      *(_DWORD *)buf = 136315650;
      v24 = "-[AVPlayerViewController prefersStatusBarHidden]";
      v26 = "prefersStatusBarHidden";
      v25 = 2080;
      if (v15)
        v20 = "YES";
      v27 = 2080;
      v28 = v20;
      _os_log_impl(&dword_1AC4B1000, v19, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
    }

  }
  return v15;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  -[AVPlayerViewController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDismissing") & 1) != 0)
  {
    -[AVPlayerViewController presentationContext](self, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rotatableWindowViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 0;
  }
  else
  {

  }
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[AVPlayerViewController viewIfLoaded](self, "viewIfLoaded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowScene");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[AVPlayerViewController prefersStatusBarHidden](self, "prefersStatusBarHidden"))
  {
    objc_msgSend(v12, "statusBarManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "statusBarStyle");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)canStartPictureInPictureAutomaticallyFromInline
{
  return self->_canStartPictureInPictureAutomaticallyFromInline;
}

- (BOOL)canPausePlaybackWhenClosingPictureInPicture
{
  return self->_canPausePlaybackWhenClosingPictureInPicture;
}

- (BOOL)avkit_wantsManagedSecondScreenPlayback
{
  return 0;
}

- (id)avkit_pictureInPictureViewController
{
  AVPictureInPictureViewController *v3;
  void *v4;
  AVPictureInPictureViewController *v5;

  v3 = [AVPictureInPictureViewController alloc];
  -[__AVPlayerLayerView pictureInPicturePlayerLayerView](self->_playerLayerView, "pictureInPicturePlayerLayerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:](v3, "initWithPictureInPicturePlayerLayerView:", v4);

  return v5;
}

- (BOOL)allowInfoMetadataSubpanel
{
  return self->_allowInfoMetadataSubpanel;
}

- (void)_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground
{
  _BOOL4 v3;
  _BOOL8 v4;

  v3 = -[AVPlayerViewController canStartPictureInPictureAutomaticallyWhenEnteringBackground](self, "canStartPictureInPictureAutomaticallyWhenEnteringBackground");
  v4 = !self->_disallowsAutomaticPictureInPictureStart && v3;
  -[AVPictureInPictureController setCanStartAutomaticallyWhenEnteringBackground:](self->_pictureInPictureController, "setCanStartAutomaticallyWhenEnteringBackground:", v4);
}

- (void)_updateInfoTabViewControllerIfNeeded
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isTVApp");

    if (v3)
    {
      objc_msgSend(a1, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activePlayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentItem");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[215], "setPlayerItem:", v6);
      -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)a1);

    }
  }
}

- (void)_updateCustomInfoViewControllersIfNeeded
{
  id v2;
  id v3;
  int v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v9;
  id v10;

  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v10 = (id)objc_msgSend(v2, "initWithArray:", MEMORY[0x1E0C9AA60]);
    v3 = *(id *)(a1 + 1712);
    v4 = objc_msgSend((id)a1, "allowInfoMetadataSubpanel");
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTVApp");

    if (v3)
      v7 = v4 == 0;
    else
      v7 = 1;
    if (!v7 && v6 != 0)
      objc_msgSend(v10, "addObject:", v3);
    objc_msgSend(v10, "addObjectsFromArray:", *(_QWORD *)(a1 + 1376));
    objc_msgSend(*(id *)(a1 + 1168), "controlsViewControllerIfChromeless");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCustomInfoViewControllers:", v10);

  }
}

- (int64_t)_preferredModalPresentationStyle
{
  if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    return -2;
  else
    return 0;
}

- (void)_createPictureInPictureControllerIfNeeded
{
  void *v3;
  char v4;
  AVPictureInPictureController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  AVPictureInPictureController *pictureInPictureController;

  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls") && !self->_pictureInPictureController)
  {
    if (+[AVPictureInPictureController isPictureInPictureSupported](AVPictureInPictureController, "isPictureInPictureSupported"))
    {
      if (-[AVPlayerViewController _hasBegunObservation](self, "_hasBegunObservation"))
      {
        -[AVTransitionController presentationContext](self->_transitionController, "presentationContext");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "isPresenting");

        if ((v4 & 1) == 0)
        {
          v5 = -[AVPictureInPictureController initWithSource:]([AVPictureInPictureController alloc], "initWithSource:", self);
          -[AVPictureInPictureController setRequiresLinearPlayback:](v5, "setRequiresLinearPlayback:", -[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"));
          -[AVPictureInPictureController setAllowsPictureInPicturePlayback:](v5, "setAllowsPictureInPicturePlayback:", -[AVPlayerViewController allowsPictureInPicturePlayback](self, "allowsPictureInPicturePlayback"));
          -[AVPictureInPictureController setRetainsSourceDuringPictureInPicturePlayback:](v5, "setRetainsSourceDuringPictureInPicturePlayback:", 1);
          -[AVPictureInPictureController setCanPausePlaybackWhenClosingPictureInPicture:](v5, "setCanPausePlaybackWhenClosingPictureInPicture:", -[AVPlayerViewController canPausePlaybackWhenClosingPictureInPicture](self, "canPausePlaybackWhenClosingPictureInPicture"));
          if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground_))
          {
            -[AVPlayerViewController delegate](self, "delegate");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVPlayerViewController setCanStartPictureInPictureAutomaticallyFromInline:](self, "setCanStartPictureInPictureAutomaticallyFromInline:", objc_msgSend(v6, "playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground:", self));

          }
          -[AVPictureInPictureController setCanStartPictureInPictureAutomaticallyFromInline:](v5, "setCanStartPictureInPictureAutomaticallyFromInline:", -[AVPlayerViewController canStartPictureInPictureAutomaticallyFromInline](self, "canStartPictureInPictureAutomaticallyFromInline"));
          -[AVPictureInPictureController setDelegate:](v5, "setDelegate:", self);
          -[AVPlayerViewController playerController](self, "playerController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVPictureInPictureController setPlayerController:](v5, "setPlayerController:", v7);

          -[AVPlayerViewController pictureInPictureActivitySessionIdentifier](self, "pictureInPictureActivitySessionIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVPictureInPictureController setActivitySessionIdentifier:](v5, "setActivitySessionIdentifier:", v8);

          -[AVMobileControlsViewController setPipController:](self->_controlsViewController, "setPipController:", v5);
          -[AVPlayerViewController _observationController](self, "_observationController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("pictureInPictureController.pictureInPicturePossible"), 1, &__block_literal_global_474);

          -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setPictureInPictureController:", v5);

          -[AVPlayerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pictureInPictureController"));
          pictureInPictureController = self->_pictureInPictureController;
          self->_pictureInPictureController = v5;

          -[AVPlayerViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pictureInPictureController"));
          -[AVPlayerViewController _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground](self, "_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground");
        }
      }
    }
  }
}

- (void)_attachContentTabPanGestureRecognizerIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "contentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[146], "controlsViewControllerIfChromeless");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentTabPanGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v6, "gestureRecognizers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "containsObject:", v3);

      if ((v5 & 1) == 0)
        objc_msgSend(v6, "addGestureRecognizer:", v3);
    }

  }
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVSecondScreenContentViewConnection *secondScreenConnection;
  objc_super v14;
  _QWORD v15[6];
  _QWORD v16[5];
  id v17;
  _BYTE buf[32];
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[AVPlayerViewController dealloc]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 561;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  -[AVNowPlayingInfoController stopNowPlayingUpdatesForPlayerController:](self->_nowPlayingInfoController, "stopNowPlayingUpdatesForPlayerController:", self->_playerController);
  if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
  {
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isBeingDismissed");

      if ((v7 & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__8165;
        v19 = __Block_byref_object_dispose__8166;
        -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v16[0] = 0;
        v16[1] = v16;
        v16[2] = 0x3032000000;
        v16[3] = __Block_byref_object_copy__8165;
        v16[4] = __Block_byref_object_dispose__8166;
        -[AVPlayerViewController _transitionController](self, "_transitionController");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        -[AVPlayerViewController _transitionController](self, "_transitionController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __33__AVPlayerViewController_dealloc__block_invoke;
        v15[3] = &unk_1E5BB1848;
        v15[4] = v16;
        v15[5] = buf;
        objc_msgSend(v8, "beginFullScreenDismissalOfViewController:animated:isInteractive:completion:", v9, 0, 0, v15);

        NSLog(CFSTR("*** Warning: %@ was deallocated while its contents were being presented full screen. ***"), self);
        _Block_object_dispose(v16, 8);

        _Block_object_dispose(buf, 8);
      }
    }
    else
    {

    }
    -[AVPlaybackControlsController setPlayerController:](self->_playbackControlsController, "setPlayerController:", 0);
    -[__AVPlayerLayerView setPlayerController:](self->_playerLayerView, "setPlayerController:", 0);
  }
  -[AVPictureInPictureController invalidate](self->_pictureInPictureController, "invalidate");
  -[AVPlayerViewController _observationController](self, "_observationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopAllObservation");

  -[AVPlayerViewController _pipActivitySessionObservationController](self, "_pipActivitySessionObservationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopAllObservation");

  if (self->_secondScreenConnection)
  {
    +[AVSecondScreenController sharedInstance](AVSecondScreenController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeConnection:", self->_secondScreenConnection);

    secondScreenConnection = self->_secondScreenConnection;
    self->_secondScreenConnection = 0;

  }
  v14.receiver = self;
  v14.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController dealloc](&v14, sel_dealloc);
}

- (AVPlayerViewController)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  AVPlayerController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  char v17;
  uint64_t v18;
  char v19;
  int v20;
  int v21;
  char v22;
  char v23;
  void *v24;
  char v25;
  char v26;
  int v27;
  void *v28;
  int v29;
  int v30;
  uint64_t v31;
  _OWORD *v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  AVObservationController *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[AVPlayerViewController initWithCoder:]";
    v52 = 1024;
    v53 = 613;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v49.receiver = self;
  v49.super_class = (Class)AVPlayerViewController;
  v6 = -[AVPlayerViewController initWithCoder:](&v49, sel_initWithCoder_, v4);
  if (v6)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVPlayerAssetFilename")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVPlayerAssetFilename"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLForMovieResource:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = 0;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithURL:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[AVPlayerController initWithPlayer:]([AVPlayerController alloc], "initWithPlayer:", v10);
        v12 = (void *)*((_QWORD *)v6 + 184);
        *((_QWORD *)v6 + 184) = v11;

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*((id *)v6 + 184), "setInternalDelegate:", v6);
        v10 = v10;
        v7 = (void *)*((_QWORD *)v6 + 180);
        *((_QWORD *)v6 + 180) = v10;
        goto LABEL_12;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_13:
    +[AVPlaybackSpeed systemDefaultSpeeds](AVPlaybackSpeed, "systemDefaultSpeeds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVPlaybackSpeedCollection collectionWithSpeeds:](AVPlaybackSpeedCollection, "collectionWithSpeeds:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v6 + 211);
    *((_QWORD *)v6 + 211) = v14;

    objc_msgSend(*((id *)v6 + 211), "setDelegate:", v6);
    v16 = objc_msgSend(v4, "containsValueForKey:", CFSTR("AVPlayerShouldAutoplay"));
    if (v16)
      LOBYTE(v16) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVPlayerShouldAutoplay"));
    v6[968] = v16;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVShowsPlaybackControls")))
      v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVShowsPlaybackControls"));
    else
      v17 = 1;
    v6[969] = v17;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVVideoLayerGravity")))
      v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AVVideoLayerGravity"));
    else
      v18 = 1;
    *((_QWORD *)v6 + 122) = v18;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVAllowsPictureInPicturePlayback")))
      v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVAllowsPictureInPicturePlayback"));
    else
      v19 = dyld_program_sdk_at_least();
    v6[984] = v19;
    v20 = objc_msgSend(v4, "containsValueForKey:", CFSTR("AVWantsDetachedFullscreenPresentation"));
    if (v20)
      LOBYTE(v20) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVWantsDetachedFullscreenPresentation"));
    v6[1431] = v20;
    v21 = objc_msgSend(v4, "containsValueForKey:", CFSTR("AVCanDisplayContentInDetachedWindow"));
    if (v21)
      LOBYTE(v21) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVCanDisplayContentInDetachedWindow"));
    v6[1002] = v21;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVCanStartPictureInPictureAutomaticallyWhenEnteringBackground")))v22 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVCanStartPictureInPictureAutomaticallyWhenEnteringBackground"));
    else
      v22 = 1;
    v6[1005] = v22;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVAllowsVideoFrameVisualAnalysis")))
    {
      v23 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVAllowsVideoFrameVisualAnalysis"));
    }
    else
    {
      +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "visualAnalysisEnabled");

    }
    v6[1407] = v23;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVShowsAnalysisButtonIfAvailable")))
      v25 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVShowsAnalysisButtonIfAvailable"));
    else
      v25 = 1;
    v6[1429] = v25;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AVAllowsEnteringFullScreen")))
      v26 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVAllowsEnteringFullScreen"));
    else
      v26 = 1;
    v6[1428] = v26;
    v27 = objc_msgSend(v4, "containsValueForKey:", CFSTR("AVShowsVisualLookup"));
    if (v27)
      LOBYTE(v27) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AVShowsVisualLookup"));
    v6[1424] = v27;
    *((_QWORD *)v6 + 182) = 0;
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "extendedVisualAnalysisEnabled");

    v30 = objc_msgSend(v4, "containsValueForKey:", CFSTR("AVVideoFrameAnalysisTypes"));
    if (v29)
      v31 = 1;
    else
      v31 = 2;
    *((_QWORD *)v6 + 182) = v31;
    if (v30)
      *((_QWORD *)v6 + 182) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AVVideoFrameAnalysisTypes"));
    v6[1403] = 1;
    v6[1430] = 1;
    v6[1003] = 1;
    *((_QWORD *)v6 + 147) = objc_msgSend((id)objc_opt_class(), "usesSecondGenerationControls");
    v6[1257] = 1;
    v6[1402] = 1;
    v6[986] = 1;
    v6[1401] = 1;
    v6[1000] = 1;
    v32 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v6 + 1240) = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v33 = v32[1];
    *(_OWORD *)(v6 + 1208) = *v32;
    *(_OWORD *)(v6 + 1224) = v33;
    v6[1256] = 1;
    *((_DWORD *)v6 + 318) = 1065353216;
    +[AVRoutingConfiguration defaultConfiguration](AVRoutingConfiguration, "defaultConfiguration");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)*((_QWORD *)v6 + 129);
    *((_QWORD *)v6 + 129) = v34;

    +[AVPlayerViewControllerConfiguration defaultConfiguration](AVPlayerViewControllerConfiguration, "defaultConfiguration");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v6 + 181);
    *((_QWORD *)v6 + 181) = v36;

    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "quickLookModernPlayerControlsEnabled");

    if (v39)
    {
      objc_msgSend(v6, "setPrefersDeviceUserInterfaceStyle:", 1);
      objc_msgSend(*((id *)v6 + 181), "setPrefersFullScreenStyleForEmbeddedMode:", 1);
    }
    objc_msgSend(v6, "_defaultInfoViewActions");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v6 + 185);
    *((_QWORD *)v6 + 185) = v40;

    v6[1404] = 1;
    v6[1010] = 1;
    v6[1011] = 1;
    v6[1012] = 1;
    *((_QWORD *)v6 + 169) = 0;
    v6[1345] = 0;
    v42 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v6);
    v43 = (void *)*((_QWORD *)v6 + 187);
    *((_QWORD *)v6 + 187) = v42;

    objc_msgSend(*((id *)v6 + 187), "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5230], v6, 0, &__block_literal_global_81_8232);
    objc_msgSend(*((id *)v6 + 187), "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5220], v6, 0, &__block_literal_global_82_8233);
    objc_msgSend(v6, "_avkitPreferredTransitioningDelegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTransitioningDelegate:", v44);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bundleIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.podcasts"));

    if (v47)
      v6[1431] = 0;
    v6[1425] = 0;

  }
  return (AVPlayerViewController *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t videoGravity;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVPlayerViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v9 = "-[AVPlayerViewController encodeWithCoder:]";
    v10 = 1024;
    v11 = 756;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsPlaybackControls, CFSTR("AVShowsPlaybackControls"));
  if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
    videoGravity = -[__AVPlayerLayerView videoGravity](self->_playerLayerView, "videoGravity");
  else
    videoGravity = self->_videoGravity;
  objc_msgSend(v4, "encodeInteger:forKey:", videoGravity, CFSTR("AVVideoLayerGravity"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsPictureInPicturePlayback, CFSTR("AVAllowsPictureInPicturePlayback"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground, CFSTR("AVCanStartPictureInPictureAutomaticallyWhenEnteringBackground"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsVideoFrameAnalysis, CFSTR("AVAllowsVideoFrameVisualAnalysis"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsAnalysisButtonIfAvailable, CFSTR("AVShowsAnalysisButtonIfAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsEnteringFullScreen, CFSTR("AVAllowsEnteringFullScreen"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_videoFrameAnalysisTypes, CFSTR("AVVideoFrameAnalysisTypes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsVisualLookup, CFSTR("AVShowsVisualLookup"));

}

- (int64_t)overrideUserInterfaceStyle
{
  objc_super v4;

  if (!-[AVPlayerViewController prefersDeviceUserInterfaceStyle](self, "prefersDeviceUserInterfaceStyle"))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  return -[AVPlayerViewController overrideUserInterfaceStyle](&v4, sel_overrideUserInterfaceStyle);
}

- (void)setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption != a3)
  {
    self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVPlayerViewController setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:]";
      v8 = 2048;
      v9 = a3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v6, 0x16u);
    }

    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](self, 0);
  }
}

- (void)setRequiresImmediateAssetInspection:(BOOL)a3
{
  if (self->_requiresImmediateAssetInspection != a3)
  {
    self->_requiresImmediateAssetInspection = a3;
    -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
  }
}

- (void)setConfiguration:(id)a3
{
  AVPlayerViewControllerConfiguration *v4;
  AVPlayerViewControllerConfiguration *configuration;

  if (self->_configuration != a3)
  {
    v4 = (AVPlayerViewControllerConfiguration *)objc_msgSend(a3, "copy");
    configuration = self->_configuration;
    self->_configuration = v4;

    -[AVPlayerViewController _updateExcludedControls]((uint64_t)self);
    -[AVPlayerViewController _updatePrefersFullScreenStyleForEmbeddedMode]((uint64_t)self);
  }
}

- (AVPlayerViewControllerConfiguration)configuration
{
  return (AVPlayerViewControllerConfiguration *)(id)-[AVPlayerViewControllerConfiguration copy](self->_configuration, "copy");
}

- (void)setPrefersDeviceUserInterfaceStyle:(BOOL)a3
{
  id v4;

  if (self->_prefersDeviceUserInterfaceStyle != a3)
  {
    self->_prefersDeviceUserInterfaceStyle = a3;
    -[AVPlayerViewController contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOverrideUserInterfaceStyle:", -[AVPlayerViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));

  }
}

- (void)setShowsAudioLanguageMenu:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_showsAudioLanguageMenu != a3)
  {
    v3 = a3;
    self->_showsAudioLanguageMenu = a3;
    -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowsAudioTrackSelectionMenu:", v3);
    -[AVPlayerViewController _updateEnhanceDialogueEnabled]((id *)&self->super.super.super.isa);

  }
}

- (void)setVideoFrameAnalysisTypes:(AVVideoFrameAnalysisType)videoFrameAnalysisTypes
{
  void *v5;
  int v6;
  unint64_t v7;

  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "extendedVisualAnalysisEnabled");

  if (v6)
  {
    if (self->_videoFrameAnalysisTypes != videoFrameAnalysisTypes)
    {
      self->_videoFrameAnalysisTypes = videoFrameAnalysisTypes;
      -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes]((uint64_t)self);
      if (self->_videoFrameAnalysisTypes == 1)
        v7 = 30;
      else
        v7 = self->_videoFrameAnalysisTypes;
      -[AVVideoFrameVisualAnalyzer setVideoFrameAnalysisTypes:](self->_videoFrameVisualAnalyzer, "setVideoFrameAnalysisTypes:", v7);
    }
  }
  else
  {
    self->_videoFrameAnalysisTypes = 2;
  }
}

- (AVVideoFrameAnalysisType)videoFrameAnalysisTypes
{
  return self->_videoFrameAnalysisTypes;
}

- (UIAction)toggleLookupAction
{
  UIAction *toggleLookupAction;

  toggleLookupAction = self->_toggleLookupAction;
  if (!toggleLookupAction)
  {
    -[AVPlayerViewController _setupToggleVisualLookupActionIfNeeded]((uint64_t)self);
    toggleLookupAction = self->_toggleLookupAction;
  }
  return toggleLookupAction;
}

- (double)videoDisplayScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double result;

  -[__AVPlayerLayerView traitCollection](self->_playerLayerView, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[AVPlayerViewController secondScreenConnectionDisplaySize](self, "secondScreenConnectionDisplaySize");
  if (*MEMORY[0x1E0C9D820] != v7 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v6)
  {
    -[AVSecondScreenConnection videoDisplayScale](self->_secondScreenConnection, "videoDisplayScale");
    v5 = v9;
  }
  result = 1.0;
  if (v5 >= 1.0)
    return v5;
  return result;
}

- (UIView)contentOverlayView
{
  AVTouchIgnoringView *v3;
  UIView *contentOverlayView;

  -[AVPlayerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (!self->_contentOverlayView)
  {
    v3 = objc_alloc_init(AVTouchIgnoringView);
    -[AVTouchIgnoringView setAutoresizingMask:](v3, "setAutoresizingMask:", 0);
    contentOverlayView = self->_contentOverlayView;
    self->_contentOverlayView = &v3->super;

  }
  -[AVPlayerViewController _updateContentOverlayViewSuperview](self, "_updateContentOverlayViewSuperview");
  return self->_contentOverlayView;
}

- (void)setShowsAnalysisButtonIfAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;

  v3 = a3;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualAnalysisSupported");

  if (v6)
  {
    if (self->_showsAnalysisButtonIfAvailable != v3)
    {
      self->_showsAnalysisButtonIfAvailable = v3;
      -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
    }
  }
  else
  {
    self->_showsAnalysisButtonIfAvailable = 0;
  }
}

- (NSArray)speeds
{
  return -[AVPlaybackSpeedCollection speeds](self->_playbackSpeedCollection, "speeds");
}

- (AVPlaybackSpeed)selectedSpeed
{
  return -[AVPlaybackSpeedCollection selectedSpeed](self->_playbackSpeedCollection, "selectedSpeed");
}

- (void)selectSpeed:(AVPlaybackSpeed *)speed
{
  -[AVPlaybackSpeedCollection selectSpeed:](self->_playbackSpeedCollection, "selectSpeed:", speed);
}

- (void)setShowsTimecodes:(BOOL)showsTimecodes
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = showsTimecodes;
  v14 = *MEMORY[0x1E0C80C00];
  self->_showsTimecodes = showsTimecodes;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "YES";
    v7 = !self->_showsTimecodes;
    v8 = 136315650;
    v9 = "-[AVPlayerViewController setShowsTimecodes:]";
    v11 = "_showsTimecodes";
    v10 = 2080;
    if (v7)
      v6 = "NO";
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

  -[AVPlaybackControlsController setShowsTimecodes:](self->_playbackControlsController, "setShowsTimecodes:", v3);
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *overrideParentApplicationDisplayIdentifier;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_overrideParentApplicationDisplayIdentifier, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    overrideParentApplicationDisplayIdentifier = self->_overrideParentApplicationDisplayIdentifier;
    self->_overrideParentApplicationDisplayIdentifier = v5;

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__AVPlayerViewController_setOverrideParentApplicationDisplayIdentifier___block_invoke;
    v7[3] = &unk_1E5BB18D0;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    +[AVNowPlayingInfoController sharedNowPlayingInfoControllerWithCompletion:](AVNowPlayingInfoController, "sharedNowPlayingInfoControllerWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (NSDictionary)pixelBufferAttributes
{
  NSDictionary *v3;

  if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[__AVPlayerLayerView pixelBufferAttributes](self->_playerLayerView, "pixelBufferAttributes");
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_pixelBufferAttributes;
  }
  return v3;
}

- (void)setPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes
{
  NSDictionary *v4;
  NSDictionary *v5;

  v5 = pixelBufferAttributes;
  if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[__AVPlayerLayerView setPixelBufferAttributes:](self->_playerLayerView, "setPixelBufferAttributes:", v5);
  }
  else
  {
    v4 = (NSDictionary *)-[NSDictionary copy](v5, "copy");

    v5 = self->_pixelBufferAttributes;
    self->_pixelBufferAttributes = v4;
  }

}

- (id)interactiveContentOverlayView
{
  void *v3;
  void *v4;

  -[AVPlayerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveContentOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AVPlayerViewControllerCustomControlsView)customControlsView
{
  AVPlayerViewControllerCustomControlsView *v3;
  AVPlayerViewControllerCustomControlsView *customControlsView;

  if (!self->_customControlsView)
  {
    v3 = objc_alloc_init(AVPlayerViewControllerCustomControlsView);
    customControlsView = self->_customControlsView;
    self->_customControlsView = v3;

    -[AVPlayerViewControllerCustomControlsView setTranslatesAutoresizingMaskIntoConstraints:](self->_customControlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AVPlayerViewControllerCustomControlsView setEdgesInsettingLayoutMarginsFromSafeArea:](self->_customControlsView, "setEdgesInsettingLayoutMarginsFromSafeArea:", 0);
    -[AVPlayerViewController _updateCustomControlsViewStateWithVisibleControlsSet:](self, "_updateCustomControlsViewStateWithVisibleControlsSet:", 0);
  }
  -[AVPlayerViewController _updateCustomControlsViewSuperViewIfNeeded](self, "_updateCustomControlsViewSuperViewIfNeeded");
  return self->_customControlsView;
}

- (void)_updateCustomControlsViewSuperViewIfNeeded
{
  id v3;

  if (self->_customControlsView)
  {
    -[AVPlayerViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[AVPlayerViewController contentView](self, "contentView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCustomControlsView:", self->_customControlsView);

  }
}

- (void)setCanHidePlaybackControls:(BOOL)a3
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
  if (self->_canHidePlaybackControls != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController setCanHidePlaybackControls:]";
      v10 = "canHidePlaybackControls";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_canHidePlaybackControls = v3;
    -[AVPlayerViewController _updatePlaybackControlsCanHideStateIfNeeded](self, "_updatePlaybackControlsCanHideStateIfNeeded");
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
  }
}

- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline
{
  return self->_showsMinimalPlaybackControlsWhenEmbeddedInline;
}

- (BOOL)actuallyRequiresLinearPlayback
{
  return self->_actuallyRequiresLinearPlayback;
}

- (void)setActuallyRequiresLinearPlayback:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE v11[24];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_actuallyRequiresLinearPlayback != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      *(_DWORD *)v11 = 136315650;
      *(_QWORD *)&v11[4] = "-[AVPlayerViewController setActuallyRequiresLinearPlayback:]";
      *(_QWORD *)&v11[14] = "actuallyRequiresLinearPlayback";
      *(_WORD *)&v11[12] = 2080;
      if (v3)
        v6 = "YES";
      *(_WORD *)&v11[22] = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v11, 0x20u);
    }

    self->_actuallyRequiresLinearPlayback = v3;
    if (!-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    {
      -[AVMobileControlsViewController setRequiresLinearPlayback:](self->_controlsViewController, "setRequiresLinearPlayback:", v3);
      -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRequiresLinearPlayback:", v3);

      -[AVPlayerViewController playerController](self, "playerController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTouchBarRequiresLinearPlayback:", v3);

      -[AVPictureInPictureController setRequiresLinearPlayback:](self->_pictureInPictureController, "setRequiresLinearPlayback:", v3);
    }
    if (v3)
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endScanningForward:", self);

      -[AVPlayerViewController playerController](self, "playerController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endScanningBackward:", self);

    }
    self->_defaultLinearPlaybackRate = 1.0;
    -[AVPlayerViewController _updateDefaultPlaybackRateIfNeeded](self, "_updateDefaultPlaybackRateIfNeeded", *(_OWORD *)v11, *(_QWORD *)&v11[16]);
    -[AVPlayerViewController _updateScrubbingGestureEnabledState]((uint64_t)self);
  }
}

- (void)setRequiresLinearPlayback:(BOOL)requiresLinearPlayback
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
  if (self->_requiresLinearPlayback != requiresLinearPlayback)
  {
    v3 = requiresLinearPlayback;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController setRequiresLinearPlayback:]";
      v10 = "requiresLinearPlayback";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_requiresLinearPlayback = v3;
    -[AVPlayerViewController _updateActuallyRequiresLinearPlayback](self, "_updateActuallyRequiresLinearPlayback");
  }
}

- (void)_updateActuallyRequiresLinearPlayback
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;

  v3 = -[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback");
  -[AVPlayerViewController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
    {
      v3 = 1;
    }
    else
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "interstitialController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "requiresLinearPlayback");

      v3 = v8 | v3;
    }
  }
  -[AVPlayerViewController setActuallyRequiresLinearPlayback:](self, "setActuallyRequiresLinearPlayback:", v3);
}

- (BOOL)volumeControlsCanShowSlider
{
  void *v2;
  char v3;

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "volumeControlsCanShowSlider");

  return v3;
}

- (void)setVolumeControlsCanShowSlider:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v8 = 136315650;
    v9 = "-[AVPlayerViewController setVolumeControlsCanShowSlider:]";
    v11 = "volumeControlsCanShowSlider";
    v10 = 2080;
    if (v3)
      v6 = "YES";
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVolumeControlsCanShowSlider:", v3);

}

- (void)setEntersFullScreenWhenPlaybackBegins:(BOOL)entersFullScreenWhenPlaybackBegins
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_entersFullScreenWhenPlaybackBegins != entersFullScreenWhenPlaybackBegins)
  {
    v3 = entersFullScreenWhenPlaybackBegins;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPlayerViewController setEntersFullScreenWhenPlaybackBegins:]";
      v11 = "entersFullScreenWhenPlaybackBegins";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_entersFullScreenWhenPlaybackBegins = v3;
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEntersFullScreenWhenPlaybackBegins:", v3);

  }
}

- (void)setInfoViewActions:(NSArray *)infoViewActions
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSArray *v18;
  NSArray *v19;
  id obj;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_infoViewActions != infoViewActions)
  {
    v3 = (void *)-[NSArray copy](infoViewActions, "copy");
    if (!v3)
    {
      -[AVPlayerViewController _defaultInfoViewActions](self, "_defaultInfoViewActions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[AVPlayerViewController controlsViewController](self, "controlsViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "controlsViewControllerIfChromeless");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v9, "title");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "image");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __45__AVPlayerViewController_setInfoViewActions___block_invoke;
          v22[3] = &unk_1E5BB18F8;
          v22[4] = v9;
          v23 = v11;
          v16 = v11;
          objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v14, v15, v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSArray addObject:](v4, "addObject:", v17);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }

    v18 = self->_infoViewActions;
    self->_infoViewActions = v4;
    v19 = v4;

    -[AVInfoTabCoordinator setActions:](self->_infoTabCoordinator, "setActions:", self->_infoViewActions);
  }
}

- (id)playButtonHandlerForLazyPlayerLoading
{
  void *v2;
  void *v3;

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playButtonHandlerForLazyPlayerLoading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayButtonHandlerForLazyPlayerLoading:", v4);

}

- (UIViewController)viewControllerForFullScreenPresentation
{
  void *v2;
  void *v3;

  -[AVPlayerViewController contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3F20], "_viewControllerForFullScreenPresentationFromView:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (UIViewController *)v3;
}

- (void)setHoveringOverPlaybackControl:(BOOL)a3
{
  if (self->_hoveringOverPlaybackControl != a3)
  {
    self->_hoveringOverPlaybackControl = a3;
    -[AVPlayerViewController _updatePlaybackControlsCanHideStateIfNeeded](self, "_updatePlaybackControlsCanHideStateIfNeeded");
  }
}

- (void)setDefaultPlaybackRate:(double)a3
{
  id v4;

  -[AVPlayerViewController playerController](self, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultPlaybackRate:", a3);

}

- (NSArray)customInfoViewControllers
{
  return self->_customInfoViewControllers;
}

- (void)setCustomInfoViewControllers:(NSArray *)customInfoViewControllers
{
  NSArray *v5;
  NSArray *v6;

  v5 = customInfoViewControllers;
  if (self->_customInfoViewControllers != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customInfoViewControllers, customInfoViewControllers);
    -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)self);
    -[AVPlayerViewController _attachContentTabPanGestureRecognizerIfNeeded]((id *)&self->super.super.super.isa);
    v5 = v6;
  }

}

- (void)setImageAnalysis:(id)a3
{
  VKCImageAnalysis **p_imageAnalysis;
  VKCImageAnalysis *v6;
  void *v7;
  char v8;
  VKCImageAnalysis *v9;

  p_imageAnalysis = &self->_imageAnalysis;
  v6 = (VKCImageAnalysis *)a3;
  v9 = v6;
  if (*p_imageAnalysis == v6)
    goto LABEL_5;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "visualAnalysisSupported");

  if ((v8 & 1) == 0)
  {
    v6 = *p_imageAnalysis;
LABEL_5:
    *p_imageAnalysis = 0;

    goto LABEL_6;
  }
  objc_storeStrong((id *)&self->_imageAnalysis, a3);
  -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)self);
  -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
LABEL_6:

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  self->_playerViewControllerAnimated = 0;
  -[AVPlayerViewController setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:](self, "setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[AVPlayerViewController viewWillDisappear:]";
    v9 = 1024;
    v10 = 2847;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerViewController;
  -[AVPlayerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
  {
    v12.receiver = self;
    v12.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  }
  else
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController viewIfLoaded](self, "viewIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isDescendantOfView:", v9);

    if (v10)
      -[AVPlayerViewController _contentViewWillTransitionToSize:withTransitionCoordinator:](self, "_contentViewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    v11.receiver = self;
    v11.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
    -[AVPlayerViewController _updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:]((uint64_t)self, width, height);
  }

}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (BOOL)modalPresentationCapturesStatusBarAppearance
{
  void *v4;
  char v5;

  if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
    return 0;
  if (-[AVPlayerViewController _modalPresentationStyleIsFullScreen](self, "_modalPresentationStyleIsFullScreen"))
    return 1;
  -[AVPlayerViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCoveringWindow");

  return v5;
}

- (id)transitioningDelegate
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  if (-[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls"))
  {
    v9.receiver = self;
    v9.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController transitioningDelegate](&v9, sel_transitioningDelegate);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerViewController;
    -[AVPlayerViewController transitioningDelegate](&v8, sel_transitioningDelegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[AVPlayerViewController _avkitPreferredTransitioningDelegate](self, "_avkitPreferredTransitioningDelegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    return v7;
  }
}

- (void)setTransportBarCustomMenuItems:(NSArray *)transportBarCustomMenuItems
{
  NSArray *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  AVMobileControlsViewController *controlsViewController;
  NSArray *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = transportBarCustomMenuItems;
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _AVLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              goto LABEL_16;
            objc_msgSend(v10, "description");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v26 = "-[AVPlayerViewController setTransportBarCustomMenuItems:]";
            v27 = 2112;
            v28 = v15;
            v16 = v14;
            v17 = "%s Unsupported subclass of UIMenuElement. Only UIAction and UIMenu types are supported. Skipping: %@.";
            goto LABEL_15;
          }
        }
        objc_msgSend(v10, "title");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "image");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = objc_msgSend(v10, "copy");
            -[NSArray addObject:](v4, "addObject:", v14);
            goto LABEL_16;
          }
        }
        _AVLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v26 = "-[AVPlayerViewController setTransportBarCustomMenuItems:]";
          v27 = 2112;
          v28 = v15;
          v16 = v14;
          v17 = "%s Unsupported custom menu item. Skipping %@. UIMenuElements must have both a title and an image.";
LABEL_15:
          _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

        }
LABEL_16:

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  controlsViewController = self->_controlsViewController;
  if (controlsViewController)
    -[AVMobileControlsViewController setTransportBarCustomMenuItems:](controlsViewController, "setTransportBarCustomMenuItems:", v4);
  v19 = self->_transportBarCustomMenuItems;
  self->_transportBarCustomMenuItems = v4;

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_handleDoubleTapGesture:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat width;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  AVPlayerViewController *v51;
  uint64_t v52;
  CGSize v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v52 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v46 = 136315650;
    v47 = "-[AVPlayerViewController _handleDoubleTapGesture:]";
    v48 = 1024;
    v49 = 3271;
    v50 = 2048;
    v51 = self;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v46, 0x1Cu);
  }

  v5 = -[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen")
    || -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline")
    || -[AVPlayerViewController canToggleVideoGravityWhenEmbeddedInline](self, "canToggleVideoGravityWhenEmbeddedInline");
  -[AVPlayerViewController playerController](self, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentDimensions");
  v8 = v7;
  v10 = v9;

  if (v5)
  {
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "showsVideoGravityButton"))
    {
      v13 = 0;
      goto LABEL_22;
    }
    -[AVPlayerViewController playerController](self, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if ((objc_msgSend(v12, "isExternalPlaybackActive") & 1) != 0)
    {
LABEL_21:

      goto LABEL_22;
    }

    v13 = 0;
    if (v10 > 0.0 && v8 > 0.0)
    {
      -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
      }
      else
      {
        -[AVPlayerViewController view](self, "view");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v17;

      objc_msgSend(v11, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v53.width = v8;
      v53.height = v10;
      v58.origin.x = v19;
      v58.origin.y = v21;
      v58.size.width = v23;
      v58.size.height = v25;
      v54 = AVMakeRectWithAspectRatioInsideRect(v53, v58);
      width = v54.size.width;
      height = v54.size.height;
      UIPointRoundToViewScale();
      x = v55.origin.x;
      y = v55.origin.y;
      v55.size.width = width;
      v55.size.height = height;
      CGRectGetWidth(v55);
      UIRoundToViewScale();
      v31 = v30;
      v56.origin.x = x;
      v56.origin.y = y;
      v56.size.width = v31;
      v56.size.height = height;
      CGRectGetHeight(v56);
      UIRoundToViewScale();
      v33 = v32;
      -[AVPlayerViewController traitCollection](self, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayCornerRadius");
      v35 = v34;

      if (v35 > 0.0)
      {
        -[AVPlayerViewController contentView](self, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isCoveringWindow") & 1) != 0)
        {
          v13 = 1;
          goto LABEL_21;
        }
      }
      objc_msgSend(v11, "bounds");
      v59.origin.x = v36;
      v59.origin.y = v37;
      v59.size.width = v38;
      v59.size.height = v39;
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = v31;
      v57.size.height = v33;
      v13 = !CGRectEqualToRect(v57, v59);
      if (v35 > 0.0)
        goto LABEL_21;
LABEL_22:

    }
  }
  else
  {
    v13 = 0;
  }
  if (!-[AVPictureInPictureController isPictureInPictureActive](self->_pictureInPictureController, "isPictureInPictureActive")&& v13)
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutClass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      if (-[__AVPlayerLayerView isVideoScaled](self->_playerLayerView, "isVideoScaled"))
        v42 = 1;
      else
        v42 = 2;
      NSStringFromVideoGravity(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController contentView](self, "contentView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "layoutClass");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v43, objc_msgSend(v45, "unsignedIntegerValue"));

    }
  }
}

- (void)_handleSingleTapGesture:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  AVPlayerViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[AVPlayerViewController _handleSingleTapGesture:]";
    v10 = 1024;
    v11 = 3309;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v8, 0x1Cu);
  }

  if (-[AVPlayerViewController _canEnterFullScreen](self, "_canEnterFullScreen")
    && (-[AVPlayerViewController playbackControlsController](self, "playbackControlsController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "entersFullScreenWhenTapped"),
        v5,
        v6))
  {
    -[AVPlayerViewController _transitionToFullScreenAnimated:interactive:completionHandler:](self, "_transitionToFullScreenAnimated:interactive:completionHandler:", 1, 0, 0);
  }
  else
  {
    if (-[AVPlayerViewController showsVisualLookup](self, "showsVisualLookup"))
      -[AVPlayerViewController setShowsVisualLookup:](self, "setShowsVisualLookup:", 0);
    -[AVPlayerViewController controlsViewController](self, "controlsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toggleVisibility:", self);

  }
}

- (void)_handleUserInteractionObservationRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[AVPlayerViewController _beginTrackingUserInteraction](self, "_beginTrackingUserInteraction");
  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    -[AVPlayerViewController _endTrackingUserInteraction](self, "_endTrackingUserInteraction");
  }

}

- (void)_togglePlaybackForCenterTapGesture:(id)a3
{
  id v4;

  -[AVPlayerViewController _handlePlaybackToggleNotificationForMetricsCollectionEvent](self, "_handlePlaybackToggleNotificationForMetricsCollectionEvent", a3);
  -[AVPlayerViewController playerController](self, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "togglePlayback:", self);

}

- (void)_handleVideoGravityPinchGesture:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  id v10;
  UIPinchGestureRecognizer *v11;

  v11 = self->_videoGravityPinchGestureRecognizer;
  -[AVPlayerViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6)
  {
    -[UIPinchGestureRecognizer scale](v11, "scale");
    v8 = v7;
    if (fabs(v7 + -1.0) >= 0.1)
    {
      v9 = (id)*MEMORY[0x1E0C8A6D8];
      if (v8 > 1.0)
      {
        v10 = (id)*MEMORY[0x1E0C8A6E0];

        v9 = v10;
      }
      -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v9, v6);

    }
  }

}

- (void)_handlePlayPauseKeyCommand:(id)a3
{
  -[AVPlayerViewController togglePlayback:](self, "togglePlayback:", self);
}

- (void)_handleSkipBack15SecondsKeyCommand:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  id v8;

  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback", a3))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    -[AVPlayerViewController playerController](self, "playerController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v8, "seekByTimeInterval:toleranceBefore:toleranceAfter:", -15.0, 0.5, 0.5);
    }
    else
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentTime");
      objc_msgSend(v8, "seekToTime:", v7 + -15.0);

    }
  }
}

- (void)_handleSkipAhead15SecondsKeyCommand:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  id v8;

  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback", a3))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    -[AVPlayerViewController playerController](self, "playerController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v8, "seekByTimeInterval:toleranceBefore:toleranceAfter:", 15.0, 0.5, 0.5);
    }
    else
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentTime");
      objc_msgSend(v8, "seekToTime:", v7 + 15.0);

    }
  }
}

- (void)_handleShowNextFrameKeyCommand:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seekFrameForward:", v5);

  }
}

- (void)_handleGoToBeginningKeyCommand:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seekToBeginning:", v5);

  }
}

- (void)_handleShowPreviousFrameKeyCommand:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seekFrameBackward:", v5);

  }
}

- (void)_handleVolumeUpKeyPressedCommand:(id)a3
{
  float v3;
  double v4;
  double v5;
  id v6;

  -[AVPlayerViewController _volumeController](self, "_volumeController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginChangingVolume");
  objc_msgSend(v6, "volume");
  v5 = v3;
  v4 = v5 + 0.0625;
  LODWORD(v5) = 1.0;
  if (v4 <= 1.0)
  {
    objc_msgSend(v6, "volume", v5);
    *(float *)&v5 = *(float *)&v5 + 0.0625;
  }
  objc_msgSend(v6, "setTargetVolume:", v5);

}

- (void)_handleVolumeUpKeyReleasedCommand:(id)a3
{
  id v3;

  -[AVPlayerViewController _volumeController](self, "_volumeController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endChangingVolume");

}

- (void)_handleVolumeDownKeyPressedCommand:(id)a3
{
  float v3;
  double v4;
  double v5;
  id v6;

  -[AVPlayerViewController _volumeController](self, "_volumeController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginChangingVolume");
  objc_msgSend(v6, "volume");
  v5 = v3;
  v4 = v5 + -0.0625;
  LODWORD(v5) = 0;
  if (v4 >= 0.0)
  {
    objc_msgSend(v6, "volume", v5);
    *(float *)&v5 = *(float *)&v5 + -0.0625;
  }
  objc_msgSend(v6, "setTargetVolume:", v5);

}

- (void)_handleVolumeDownKeyReleasedCommand:(id)a3
{
  id v3;

  -[AVPlayerViewController _volumeController](self, "_volumeController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endChangingVolume");

}

- (void)_handleRewindKeyPressedCommand:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginScanningBackward:", v5);

  }
}

- (void)_handleRewindKeyReleasedCommand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endScanningBackward:", v4);

}

- (void)_handleFastForwardKeyPressedCommand:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginScanningForward:", v5);

  }
}

- (void)_handleFastForwardKeyReleasedCommand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endScanningForward:", v4);

}

- (void)_didBeginPlayingOnSecondScreen
{
  void *v3;
  void *v4;
  id v5;

  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackContentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPlayingOnSecondScreen:", 1);
  objc_msgSend(v5, "setPlayingOnSecondScreen:", 1);

}

- (void)_didEndPlayingOnSecondScreen
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__AVPlayerViewController__didEndPlayingOnSecondScreen__block_invoke;
  v2[3] = &unk_1E5BB4CA0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (void)setShowsVisualLookup:(BOOL)a3
{
  if (self->_showsVisualLookup != a3)
  {
    self->_showsVisualLookup = a3;
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
    -[AVPlayerViewController _updateVisualAnalysisViewActiveInteractionTypes]((uint64_t)self);
    -[UIAction setState:](self->_toggleLookupAction, "setState:", self->_showsVisualLookup);
  }
}

- (void)setInfoTabViewController:(id)a3
{
  void *v5;
  int v6;
  id *p_infoTabViewController;
  UIViewController *infoTabViewController;
  UIViewController *v9;
  UIViewController *v10;

  v10 = (UIViewController *)a3;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTVApp");

  p_infoTabViewController = (id *)&self->_infoTabViewController;
  infoTabViewController = self->_infoTabViewController;
  if (!v6)
  {
    *p_infoTabViewController = 0;

    goto LABEL_5;
  }
  v9 = v10;
  if (infoTabViewController != v10)
  {
    objc_storeStrong(p_infoTabViewController, a3);
    -[AVPlayerViewController _updateCustomInfoViewControllersIfNeeded]((uint64_t)self);
LABEL_5:
    v9 = v10;
  }

}

- (void)setCanStartPictureInPictureAutomaticallyFromInline:(BOOL)canStartPictureInPictureAutomaticallyFromInline
{
  self->_canStartPictureInPictureAutomaticallyFromInline = canStartPictureInPictureAutomaticallyFromInline;
  -[AVPictureInPictureController setCanStartPictureInPictureAutomaticallyFromInline:](self->_pictureInPictureController, "setCanStartPictureInPictureAutomaticallyFromInline:");
}

- (void)_updateDefaultLinearPlaybackRateIfNeeded
{
  void *v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPlaybackRate");
  if (v4 != self->_defaultLinearPlaybackRate)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "defaultPlaybackRate");
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "setDefaultPlaybackRate called during linear playback. Updating default linear playback rate to %f", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v3, "defaultPlaybackRate");
    *(float *)&v7 = v7;
    self->_defaultLinearPlaybackRate = *(float *)&v7;
  }

}

- (void)_updateSelectedPlaybackSpeedIfPlayerControllerRateChanges
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  float v14;
  AVPlaybackSpeed *v15;
  void *v16;
  AVPlaybackSpeed *v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController playbackSpeedCollection](self, "playbackSpeedCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rate");
  v6 = v5;
  if (v5 >= 0.1 && v5 < 4.0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "speeds", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
LABEL_8:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_msgSend(v13, "rate");
        if (v6 == v14)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
      v15 = v13;

      if (v15)
        goto LABEL_17;
    }
    else
    {
LABEL_14:

    }
    AVLocalizedString(CFSTR("Active Speed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [AVPlaybackSpeed alloc];
    objc_msgSend(v3, "defaultPlaybackRate");
    *(float *)&v18 = v18;
    v15 = -[AVPlaybackSpeed initWithRate:localizedName:synthesized:](v17, "initWithRate:localizedName:synthesized:", v16, 1, v18);

LABEL_17:
    objc_msgSend(v4, "setActiveSpeed:", v15);

  }
}

- (void)_resetVisualAnalysisViewSelectionIfNeeded
{
  _BOOL4 allowsVideoFrameAnalysis;
  void *v4;
  AVVisualAnalysisView *analysisView;
  void *v8;

  allowsVideoFrameAnalysis = self->_allowsVideoFrameAnalysis;
  -[AVPlayerViewController _currentAnalysis]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  analysisView = self->_analysisView;
  if (allowsVideoFrameAnalysis && v4 != 0 && analysisView != 0)
  {
    v8 = v4;
    -[AVVisualAnalysisView resetSelection](analysisView, "resetSelection");
    v4 = v8;
  }

}

- (BOOL)analysisInteractionInProgress
{
  void *v2;
  char v3;

  -[AVPlayerViewController analysisView](self, "analysisView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractionInProgress");

  return v3;
}

- (double)_availableSpaceForContentTabWithVideoDodgingForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  AVPlayerViewControllerContentView *v9;
  uint64_t v10;
  void *v11;
  double v12;
  BOOL v13;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  float v25;
  float v26;
  CGRect v29;

  height = a3.height;
  width = a3.width;
  -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_playerViewControllerContentView;
    -[AVPlayerViewController playerLayerView](self, "playerLayerView");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = NAN;
    if (!v7)
      goto LABEL_29;
    v13 = !v8 || v9 == 0;
    if (v13 || v10 == 0)
      goto LABEL_29;
    objc_msgSend(v7, "contentDimensions");
    v17 = v16;
    v12 = NAN;
    if (v16 <= 0.0)
      goto LABEL_29;
    v18 = v15;
    if (v15 <= 0.0)
      goto LABEL_29;
    if (width <= height)
      v19 = 1;
    else
      v19 = 2;
    -[AVPlayerViewControllerContentView targetVideoGravities](v9, "targetVideoGravities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 == (void *)*MEMORY[0x1E0C8A6D0])
    {
      v23 = height;
    }
    else
    {
      v23 = height;
      if (v22 != (void *)*MEMORY[0x1E0C8A6E0])
      {
        if (v22 != (void *)*MEMORY[0x1E0C8A6D8])
        {
          v12 = NAN;
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
        v23 = width / (v18 / v17);
      }
    }
    objc_msgSend(v6, "unobscuredContentArea");
    v24 = height - (v23 + CGRectGetMinY(v29) + 40.0);
    v25 = v24;
    v26 = v23;
    if (vabds_f32(v25, v26) < 0.00000011921 || v25 < v26)
      v12 = NAN;
    else
      v12 = v24;
    goto LABEL_28;
  }
  v12 = NAN;
LABEL_30:

  return v12;
}

- (void)_chromelessControlsViewController:(id)a3 willBeginContentTabTransitionWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "state") == 2)
  {
    objc_msgSend(v7, "transitionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController _updateGesturesEnablementStates]((uint64_t)self);
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke;
    v15[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v16, &location);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_2;
    v13[3] = &unk_1E5BB4688;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "addCoordinatedAnimations:completion:", v15, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    -[AVPlayerViewControllerContentView setNeedsLayout](self->_playerViewControllerContentView, "setNeedsLayout");
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_3;
    v11[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v12, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_copySubjectMenuItemPressedEvent:(id)a3
{
  if (-[AVVisualAnalysisView hasSubjectToCopy](self->_analysisView, "hasSubjectToCopy", a3))
    -[AVVisualAnalysisView copySubject](self->_analysisView, "copySubject");
}

- (BOOL)_controlsViewControllerPrefersStatusBarHidden
{
  void *v3;
  char v4;
  unint64_t v5;
  BOOL v6;

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersStatusBarHidden");

  if (self && self->_controlsGeneration == 1)
  {
    v5 = -[AVMobileControlsViewController visibileControls](self->_controlsViewController, "visibileControls");
    if (v5)
      v6 = v5 == 2;
    else
      v6 = 1;
    if (v6)
      return 1;
    else
      return v5 == 1 && -[AVPlayerController isScrubbing](self->_playerController, "isScrubbing");
  }
  return v4;
}

- (void)_playPauseButtonWasPressedEvent:(id)a3
{
  -[AVPlayerViewController _enterFullScreenWhenPlayingIfNeeded](self, "_enterFullScreenWhenPlayingIfNeeded", a3);
  -[AVPlayerViewController _handlePlaybackToggleNotificationForMetricsCollectionEvent](self, "_handlePlaybackToggleNotificationForMetricsCollectionEvent");
}

- (void)_setContentViewOnSelf
{
  AVPlayerViewController *v3;

  -[AVMobileControlsViewController parentViewController](self->_controlsViewController, "parentViewController");
  v3 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[AVPlayerView setContentView:](self->_playerViewControllerView, "setContentView:", self->_playerViewControllerContentView);
  }
  else
  {
    -[AVMobileControlsViewController willMoveToParentViewController:](self->_controlsViewController, "willMoveToParentViewController:", 0);
    -[AVMobileControlsViewController removeFromParentViewController](self->_controlsViewController, "removeFromParentViewController");
    -[AVPlayerView setContentView:](self->_playerViewControllerView, "setContentView:", self->_playerViewControllerContentView);
    -[AVPlayerViewController addChildViewController:](self, "addChildViewController:", self->_controlsViewController);
    -[AVMobileControlsViewController didMoveToParentViewController:](self->_controlsViewController, "didMoveToParentViewController:", self);
  }
}

- (void)_visualLookupMenuItemPressedEvent:(id)a3
{
  -[AVPlayerViewController setShowsVisualLookup:](self, "setShowsVisualLookup:", !self->_showsVisualLookup);
  -[UIAction setState:](self->_toggleLookupAction, "setState:", self->_showsVisualLookup);
}

- (BOOL)_shouldEnterFullScreenAfterPlaybackBegins
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController");
  -[AVPlayerViewController _chromeControlsViewController](self, "_chromeControlsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return -[AVPlayerViewController entersFullScreenWhenPlaybackBegins](self, "entersFullScreenWhenPlaybackBegins")
        && v3
        && !self->_playbackBeganAfterPlayerControllerBecameReadyToPlay;
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldEnterFullScreenWhenPlaybackBegins");

  return v6;
}

- (void)_volumeButtonWasPressedEvent:(id)a3
{
  uint64_t v4;
  id v5;

  -[AVPlayerViewController playerController](self, "playerController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isMuted"))
    v4 = 3;
  else
    v4 = 2;
  -[AVPlayerViewController _notifyOfMetricsCollectionEvent:](self, "_notifyOfMetricsCollectionEvent:", v4);

}

- (BOOL)_wantsNowPlayingInfoCenter:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5
    && (objc_msgSend(v5, "isInspectionSuspended") & 1) == 0
    && -[AVPlayerViewController updatesNowPlayingInfoCenter](self, "updatesNowPlayingInfoCenter");
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[AVPlayerViewController _wantsNowPlayingInfoCenter:]";
    v12 = 1024;
    v13 = v3;
    v14 = 1024;
    v15 = v7;
    v16 = 1024;
    v17 = 1;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s isRecheck? %d, wants? %d, experienceWants? %d", (uint8_t *)&v10, 0x1Eu);
  }

  return v7;
}

- (void)_beginTrackingUserInteraction
{
  id v3;

  -[AVPlayerViewController _setNumberOfTrackedUserInteractions:](self, "_setNumberOfTrackedUserInteractions:", -[AVPlayerViewController _numberOfTrackedUserInteractions](self, "_numberOfTrackedUserInteractions") + 1);
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginUserInteraction");

}

- (void)_endTrackingUserInteraction
{
  id v3;

  -[AVPlayerViewController _setNumberOfTrackedUserInteractions:](self, "_setNumberOfTrackedUserInteractions:", -[AVPlayerViewController _numberOfTrackedUserInteractions](self, "_numberOfTrackedUserInteractions") - 1);
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endUserInteraction");

}

- (BOOL)_isTrackingUserInteraction
{
  return -[AVPlayerViewController _numberOfTrackedUserInteractions](self, "_numberOfTrackedUserInteractions") > 0;
}

- (BOOL)_isTrackingUserInteractionWithInteractiveView
{
  void *v4;
  char v5;

  if (!-[AVPlayerViewController _isTrackingUserInteraction](self, "_isTrackingUserInteraction")
    || -[AVPlayerViewController isContentTransitionInteractive](self, "isContentTransitionInteractive"))
  {
    return 0;
  }
  -[AVPlayerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "avkit_isAncestorOfViewPassingTest:", &__block_literal_global_528);

  return v5;
}

- (void)_togglePictureInPicture
{
  BOOL v3;
  AVPictureInPictureController *pictureInPictureController;

  if (-[AVPlayerViewController isPictureInPicturePossible](self, "isPictureInPicturePossible"))
  {
    v3 = -[AVPictureInPictureController isPictureInPictureActive](self->_pictureInPictureController, "isPictureInPictureActive");
    pictureInPictureController = self->_pictureInPictureController;
    if (v3)
      -[AVPictureInPictureController stopPictureInPicture](pictureInPictureController, "stopPictureInPicture");
    else
      -[AVPictureInPictureController startPictureInPicture](pictureInPictureController, "startPictureInPicture");
  }
}

- (void)_mediaSelectionDoneButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVPlayerViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVPlayerViewController _mediaSelectionDoneButtonTapped:]";
    v12 = 1024;
    v13 = 5809;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__AVPlayerViewController__mediaSelectionDoneButtonTapped___block_invoke;
  v8[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

- (void)_notifyOfMetricsCollectionEvent:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__AVPlayerViewController__notifyOfMetricsCollectionEvent___block_invoke;
  v7[3] = &unk_1E5BB1DC0;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v5, "enumerateAllBehaviorContextsConformingToProtocol:usingBlock:", &unk_1EECABA10, v7);

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_metricsCollectionEventOccured_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerViewController:metricsCollectionEventOccured:", self, a3);

  }
}

- (void)_contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__AVPlayerViewController__contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E5BB1DE8;
  v14 = width;
  v15 = height;
  v11 = v7;
  v13 = v11;
  objc_msgSend((id)v8, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_contentViewWillTransitionToSize_withCoordinator_, &unk_1EECA27A0, v12);

  -[AVPlayerViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerViewController:contentViewWillTransitionToSize:withTransitionCoordinator:", self, v11, width, height);

  }
}

- (void)_enterFullScreenWhenPlayingIfNeeded
{
  void *v3;
  char v4;

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  if ((v4 & 1) == 0)
  {
    if (-[AVPlayerViewController _shouldEnterFullScreenAfterPlaybackBegins](self, "_shouldEnterFullScreenAfterPlaybackBegins"))
    {
      -[AVPlayerViewController _transitionToFullScreenAnimated:interactive:completionHandler:](self, "_transitionToFullScreenAnimated:interactive:completionHandler:", 1, 0, 0);
    }
  }
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  char v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 2)
    {
      if (v4 == 1 && self)
        -[AVMobileControlsViewController didBeginIndirectUserInteraction](self->_controlsViewController, "didBeginIndirectUserInteraction");
      goto LABEL_21;
    }
    v5 = v14;
    if (self)
    {
      -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (!-[AVMobileControlsViewController visibileControls](self->_controlsViewController, "visibileControls"))
          goto LABEL_20;
LABEL_18:
        -[AVMobileControlsViewController didBeginIndirectUserInteraction](self->_controlsViewController, "didBeginIndirectUserInteraction");
        goto LABEL_20;
      }
      -[AVPlayerViewController contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playbackControlsView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "transportControlsContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "volumeControls");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screenModeControls");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[AVPlayerViewController _hoverGestureRecognizer:hasCursorOverView:](self, "_hoverGestureRecognizer:hasCursorOverView:", v5, v9)|| -[AVPlayerViewController _hoverGestureRecognizer:hasCursorOverView:](self, "_hoverGestureRecognizer:hasCursorOverView:", v5, v10)|| -[AVPlayerViewController _hoverGestureRecognizer:hasCursorOverView:](self, "_hoverGestureRecognizer:hasCursorOverView:", v5, v11);
      -[AVPlayerViewController setHoveringOverPlaybackControl:](self, "setHoveringOverPlaybackControl:", v12);
      if (!-[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"))
      {

        goto LABEL_20;
      }
      v13 = objc_msgSend(v8, "showsPlaybackControls");

      if ((v13 & 1) == 0)
        goto LABEL_18;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (self)
  {
    -[AVPlayerViewController setHoveringOverPlaybackControl:](self, "setHoveringOverPlaybackControl:", 0);
    -[AVMobileControlsViewController didEndIndirectUserInteraction](self->_controlsViewController, "didEndIndirectUserInteraction");
  }
LABEL_21:

}

- (void)_handlePlaybackToggleNotificationForMetricsCollectionEvent
{
  id v3;

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController _notifyOfMetricsCollectionEvent:](self, "_notifyOfMetricsCollectionEvent:", objc_msgSend(v3, "isPlaying"));

}

- (void)_handleScrubbingGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSTimer *scrubGestureMomentumTimer;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSTimer *v16;
  NSTimer *v17;
  _QWORD v18[5];
  id v19;
  id location;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[AVPlayerViewController requiresLinearPlayback](self, "requiresLinearPlayback"))
  {
    if (objc_msgSend(v4, "state") == 1)
    {
      -[AVPlayerViewController playerController](self, "playerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isScrubbing");

      if (v6)
      {
        -[NSTimer invalidate](self->_scrubGestureMomentumTimer, "invalidate");
        scrubGestureMomentumTimer = self->_scrubGestureMomentumTimer;
        self->_scrubGestureMomentumTimer = 0;

      }
      -[AVPlayerViewController _beginScrubGestureIfNeeded](self, "_beginScrubGestureIfNeeded");
    }
    else if (objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 3)
    {
      -[AVPlayerViewController contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "velocityInView:", v8);
      v10 = v9;

      -[AVPlayerViewController _applyNonlinearScaleToScrubGestureVelocity:](self, "_applyNonlinearScaleToScrubGestureVelocity:", v10);
      v12 = v11;
      -[AVPlayerViewController _seekForScrubGestureWithVelocity:](self, "_seekForScrubGestureWithVelocity:");
      if (objc_msgSend(v4, "state") == 3)
      {
        v21 = 0;
        v22 = &v21;
        v23 = 0x2020000000;
        v24 = v12;
        objc_initWeak(&location, self);
        _AVLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v22[3];
          *(_DWORD *)buf = 134217984;
          v26 = v14;
          _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "Scrub gesture will transition to momentum phase with remaining velocity %f.", buf, 0xCu);
        }

        v15 = (void *)MEMORY[0x1E0C99E88];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __60__AVPlayerViewController__handleScrubbingGestureRecognizer___block_invoke;
        v18[3] = &unk_1E5BB1E10;
        objc_copyWeak(&v19, &location);
        v18[4] = &v21;
        objc_msgSend(v15, "scheduledTimerWithTimeInterval:repeats:block:", 1, v18, 0.016);
        v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        v17 = self->_scrubGestureMomentumTimer;
        self->_scrubGestureMomentumTimer = v16;

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        _Block_object_dispose(&v21, 8);
      }
    }
    else
    {
      -[AVPlayerViewController _endScrubGestureIfActive](self, "_endScrubGestureIfActive");
    }
  }

}

- (double)_applyNonlinearScaleToScrubGestureVelocity:(double)a3
{
  double v3;
  double v4;
  double v5;

  if (a3 > 0.0)
  {
    v3 = pow(a3, 1.3);
    v4 = 0.035;
    return v3 * v4;
  }
  v5 = 0.0;
  if (a3 < 0.0)
  {
    v3 = pow(-a3, 1.3);
    v4 = -0.035;
    return v3 * v4;
  }
  return v5;
}

- (double)_seekDistanceForScrubGestureWithVelocity:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[AVPlayerViewController playerController](self, "playerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentDurationWithinEndTimes");
  v6 = pow(v5 / 1000.0, 0.75) / 400.0 * a3;

  return v6;
}

- (void)_seekForScrubGestureWithVelocity:(double)a3
{
  void *v5;
  void *v6;
  char v7;
  int v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v12 = v5;
  if (a3 < 0.0 && (v7 = objc_msgSend(v5, "canSeekFrameBackward"), v6 = v12, (v7 & 1) != 0)
    || a3 > 0.0 && (v8 = objc_msgSend(v6, "canSeekFrameForward"), v6 = v12, v8))
  {
    -[AVPlayerViewController _seekDistanceForScrubGestureWithVelocity:](self, "_seekDistanceForScrubGestureWithVelocity:", a3);
    v10 = v9;
    objc_msgSend(v12, "seekToTime");
    objc_msgSend(v12, "seekToTime:toleranceBefore:toleranceAfter:", v10 + v11, 0.0, 0.0);
    v6 = v12;
  }

}

- (BOOL)_shouldPausePlaybackWhenExitingFullscreen
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  if (-[AVPlayerViewController canPausePlaybackWhenExitingFullScreen](self, "canPausePlaybackWhenExitingFullScreen")
    && !-[AVPlayerViewController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isExternalPlaybackActive");

    -[AVPlayerViewController _transitionController](self, "_transitionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v8, "presentationContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v9, "allowsPausingWhenTransitionCompletes");

      goto LABEL_5;
    }
  }
  else
  {
    -[AVPlayerViewController _transitionController](self, "_transitionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = 0;
LABEL_5:

  return v4;
}

- (void)_endScrubGestureIfActive
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSTimer *scrubGestureMomentumTimer;
  NSObject *v9;
  uint8_t v10[16];

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrubbing");

  if (v4)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endScrubbing:", self);

    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endUserInteraction");

    -[AVPlayerViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endPlaybackSuspension");

    -[NSTimer invalidate](self->_scrubGestureMomentumTimer, "invalidate");
    scrubGestureMomentumTimer = self->_scrubGestureMomentumTimer;
    self->_scrubGestureMomentumTimer = 0;

    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "Scrub gesture did end.", v10, 2u);
    }

  }
}

- (void)_beginScrubGestureIfNeeded
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[AVPlayerViewController playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrubbing");

  if ((v4 & 1) == 0)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "Scrub gesture will begin.", v9, 2u);
    }

    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginUserInteraction");

    -[AVPlayerViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginPlaybackSuspension");

    -[AVPlayerViewController playerController](self, "playerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginScrubbing:", self);

  }
}

- (BOOL)_hoverGestureRecognizer:(id)a3 hasCursorOverView:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGPoint v19;
  CGRect v20;

  v5 = a4;
  objc_msgSend(a3, "locationInView:", v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v20.origin.x = v11;
  v20.origin.y = v13;
  v20.size.width = v15;
  v20.size.height = v17;
  v19.x = v7;
  v19.y = v9;
  return CGRectContainsPoint(v20, v19);
}

- (void)_updatePlaybackControlsCanHideStateIfNeeded
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;

  v3 = -[AVPlayerViewController canHidePlaybackControls](self, "canHidePlaybackControls");
  v4 = v3 & ~-[AVPlayerViewController isHoveringOverPlaybackControl](self, "isHoveringOverPlaybackControl");
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanHidePlaybackControls:", v4);

}

- (void)showFullScreenPresentationFromView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AVPlayerViewController showFullScreenPresentationFromView:completion:]";
    v19 = 1024;
    v20 = 6395;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v9 = (void *)objc_msgSend(v6, "copy");
  -[AVPlayerViewController transitioningDelegate](self, "transitioningDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController _avkitPreferredTransitioningDelegate](self, "_avkitPreferredTransitioningDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
  {
    -[AVPlayerViewController _avkitPreferredTransitioningDelegate](self, "_avkitPreferredTransitioningDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController setTransitioningDelegate:](self, "setTransitioningDelegate:", v12);

  }
  -[AVPlayerViewController _transitionController](self, "_transitionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__AVPlayerViewController_showFullScreenPresentationFromView_completion___block_invoke;
  v15[3] = &unk_1E5BB1E80;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  objc_msgSend(v13, "beginFullScreenPresentationOfViewController:fromView:isInteractive:completion:", self, v7, 0, v15);

}

- (void)enterFullScreenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVPlayerViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[AVPlayerViewController enterFullScreenWithCompletion:]";
    v11 = 1024;
    v12 = 6436;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__AVPlayerViewController_enterFullScreenWithCompletion___block_invoke;
  v7[3] = &unk_1E5BB1E58;
  v8 = v4;
  v6 = v4;
  -[AVPlayerViewController enterFullScreenAnimated:completionHandler:](self, "enterFullScreenAnimated:completionHandler:", 1, v7);

}

- (void)exitFullScreenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVPlayerViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[AVPlayerViewController exitFullScreenWithCompletion:]";
    v11 = 1024;
    v12 = 6493;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__AVPlayerViewController_exitFullScreenWithCompletion___block_invoke;
  v7[3] = &unk_1E5BB1E58;
  v8 = v4;
  v6 = v4;
  -[AVPlayerViewController exitFullScreenAnimated:completionHandler:](self, "exitFullScreenAnimated:completionHandler:", 1, v7);

}

- (void)_transitionFromFullScreenWithReason:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v5 = a4;
  v11 = a5;
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_shouldExitFullScreenWithReason_)&& (-[AVPlayerViewController delegate](self, "delegate"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "playerViewController:shouldExitFullScreenWithReason:", self, a3), v8, !v9))
  {
    v10 = v11;
    if (!v11)
      goto LABEL_5;
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }
  else
  {
    -[AVPlayerViewController _transitionFromFullScreenAnimated:completionHandler:](self, "_transitionFromFullScreenAnimated:completionHandler:", v5, v11);
  }
  v10 = v11;
LABEL_5:

}

- (BOOL)_canEnterFullScreen
{
  void *v3;
  _BOOL4 v4;

  if (-[AVPlayerViewController allowsEnteringFullScreen](self, "allowsEnteringFullScreen"))
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isCoveringWindow") & 1) != 0
      || -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline")
      || -[AVPlayerViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v4 = !-[AVPlayerViewController isPictureInPictureActive](self, "isPictureInPictureActive");
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_transitionToFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint64_t v21;
  _QWORD v22[2];

  v5 = a4;
  v6 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD, void *))a5;
  if (!-[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController"))
    NSLog(CFSTR("*** Warning: %@ is trying to enter full screen, but is not in its view's window's view controller hierarchy. This results in undefined behavior."), self);
  if (-[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline")
    || -[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen")
    || -[AVPlayerViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
  {
    if (!v8)
      return;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v10 = (void *)MEMORY[0x1E0CB3940];
    _AVMethodProem(self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid call of %@!"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("AVKitErrorDomain"), 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v14);

    v15 = v8;
  }
  else
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    objc_msgSend(WeakRetained, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__AVPlayerViewController__transitionToFullScreenAnimated_interactive_completionHandler___block_invoke;
    v18[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", v6, v18);

    v15 = (void *)objc_msgSend(v8, "copy");
    if (-[AVPlayerViewController wantsDetachedFullscreenPresentation](self, "wantsDetachedFullscreenPresentation")
      && -[AVPlayerViewController canDisplayContentInDetachedWindow](self, "canDisplayContentInDetachedWindow"))
    {
      -[AVPlayerViewController _transitionToDetachedFullScreenCompletionHandler:](self, "_transitionToDetachedFullScreenCompletionHandler:", v15);
    }
    else
    {
      -[AVPlayerViewController _transitionToAttachedFullScreenAnimated:interactive:completionHandler:](self, "_transitionToAttachedFullScreenAnimated:interactive:completionHandler:", v6, v5, v15);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

- (void)_transitionToAttachedFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  AVFullScreenViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v5 = a4;
  v7 = a5;
  -[AVPlayerViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canAutomaticallyZoomLetterboxVideos");

  if ((v9 & 1) == 0)
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCanAutomaticallyZoomLetterboxVideos:", 1);

    v11 = *MEMORY[0x1E0C8A6D8];
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", *MEMORY[0x1E0C8A6D8], 1);
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v11, 2);
  }
  v12 = objc_alloc_init(AVFullScreenViewController);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.SafariViewService")) & 1) != 0)
  {
    v15 = 5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.WebSheet")))
      v15 = 5;
    else
      v15 = 0;

  }
  -[AVFullScreenViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", v15);
  -[AVPlayerViewController _transitionController](self, "_transitionController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVFullScreenViewController setTransitioningDelegate:](v12, "setTransitioningDelegate:", v18);

  -[AVFullScreenViewController setDelegate:](v12, "setDelegate:", self);
  self->_fullscreenTransitionInProgress = 1;
  -[AVPlayerViewController _transitionController](self, "_transitionController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__AVPlayerViewController__transitionToAttachedFullScreenAnimated_interactive_completionHandler___block_invoke;
  v22[3] = &unk_1E5BB1E80;
  v22[4] = self;
  v23 = v7;
  v21 = v7;
  objc_msgSend(v19, "beginFullScreenPresentationOfViewController:fromView:isInteractive:completion:", v12, v20, v5, v22);

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);

}

- (void)_transitionToDetachedFullScreenCompletionHandler:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "Detached fullscreen is only available on Mac Catalyst.", v4, 2u);
  }

}

- (void)_transitionFromFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  -[AVPlayerViewController _transitionFromFullScreenAnimated:interactive:completionHandler:](self, "_transitionFromFullScreenAnimated:interactive:completionHandler:", a3, 0, a4);
}

- (void)_transitionFromFullScreenAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  _QWORD v24[2];

  v5 = a4;
  v6 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!-[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController"))
    NSLog(CFSTR("*** Warning: %@ is trying to exit full screen, but is not in its view's window's view controller hierarchy. This results in undefined behavior."), self);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v8, "copy");

  -[AVPlayerViewController _resetVisualAnalysisViewSelectionIfNeeded](self, "_resetVisualAnalysisViewSelectionIfNeeded");
  if ((-[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline")
     || -[AVPlayerViewController isPresentedFullScreen](self, "isPresentedFullScreen"))
    && !-[AVPlayerViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
  {
    if (-[AVPlayerViewController isPresentingDetachedFullScreen](self, "isPresentingDetachedFullScreen"))
      -[AVPlayerViewController _transitionFromDetachedFullScreenPresentationToInlineAnimated:completionHandler:](self, "_transitionFromDetachedFullScreenPresentationToInlineAnimated:completionHandler:", v6, v9);
    else
      -[AVPlayerViewController _transitionFromFullScreenPresentationToInlineAnimated:interactive:completionHandler:](self, "_transitionFromFullScreenPresentationToInlineAnimated:interactive:completionHandler:", v6, v5, v9);
  }
  else
  {
    -[AVPlayerViewController presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || v5
      || -[AVPlayerViewController _isTransitioningToOrFromFullScreen](self, "_isTransitioningToOrFromFullScreen"))
    {

    }
    else
    {
      -[AVPlayerViewController presentingViewController](self, "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentedViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isBeingDismissed");

      if ((v19 & 1) == 0)
      {
        -[AVPlayerViewController presentingViewController](self, "presentingViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __90__AVPlayerViewController__transitionFromFullScreenAnimated_interactive_completionHandler___block_invoke;
        v21[3] = &unk_1E5BB4610;
        v22 = v9;
        objc_msgSend(v20, "dismissViewControllerAnimated:completion:", v6, v21);

        goto LABEL_17;
      }
    }
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v12 = (void *)MEMORY[0x1E0CB3940];
      _AVMethodProem(self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Invalid call of %@!"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("AVKitErrorDomain"), 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v16);

    }
  }
LABEL_17:

}

- (void)_transitionFromFullScreenPresentationToInlineAnimated:(BOOL)a3 interactive:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  AVPlayerViewController *v11;
  AVPlayerViewController *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v11 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = self;
  }
  v12 = v11;

  self->_fullscreenTransitionInProgress = 1;
  -[AVPlayerViewController _transitionController](self, "_transitionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__AVPlayerViewController__transitionFromFullScreenPresentationToInlineAnimated_interactive_completionHandler___block_invoke;
  v15[3] = &unk_1E5BB1E80;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v13, "beginFullScreenDismissalOfViewController:animated:isInteractive:completion:", v12, v6, v5, v15);

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);

}

- (void)_transitionFromDetachedFullScreenPresentationToInlineAnimated:(BOOL)a3 completionHandler:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Detached fullscreen is only available on Mac Catalyst.", v5, 2u);
  }

}

- (void)controlsViewController:(id)a3 willBeginUpdatingVisibleControlsTo:(unint64_t)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a5;
  -[AVPlayerViewController _updateCustomControlsViewStateWithVisibleControlsSet:](self, "_updateCustomControlsViewStateWithVisibleControlsSet:", a4);
  if (-[AVPlayerViewControllerCustomControlsView needsUpdateConstraints](self->_customControlsView, "needsUpdateConstraints"))
  {
    -[AVPlayerViewControllerCustomControlsView updateConstraintsIfNeeded](self->_customControlsView, "updateConstraintsIfNeeded");
    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __109__AVPlayerViewController_controlsViewController_willBeginUpdatingVisibleControlsTo_withAnimationCoordinator___block_invoke;
    v14 = &unk_1E5BB4A40;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "addCoordinatedAnimations:completion:", &v11, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if ((a4 != 0) == (-[AVMobileControlsViewController visibileControls](self->_controlsViewController, "visibileControls", v11, v12, v13, v14) == 0)&& -[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerViewController:willTransitionToVisibilityOfPlaybackControls:withAnimationCoordinator:", self, a4 != 0, v9);

  }
}

- (void)controlsViewControllerDidUpdateLayoutGuides:(id)a3
{
  id v3;

  -[AVPlayerViewController contentView](self, "contentView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCustomControlsViewLayoutGuides");

}

- (id)controlsViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_displayNameForMediaSelectionOption_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerViewController:displayNameForMediaSelectionOption:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($175F2685EF764341F5DD80B75CC65478)chromelessControlsViewController:(id)a3 contentTabPresentationInfoWithPreferredHeight:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v19;
  double v20;
  unint64_t v21;
  $175F2685EF764341F5DD80B75CC65478 result;

  v6 = a3;
  -[AVPlayerViewController playerLayerView](self, "playerLayerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v7 && v8)
  {
    v10 = 0.0;
    if (self->_playerViewControllerContentView)
    {
      objc_msgSend(v8, "bounds");
      v12 = v11;
      -[AVPlayerViewController _availableSpaceForContentTabWithVideoDodgingForSize:](self, "_availableSpaceForContentTabWithVideoDodgingForSize:", v13, v11);
      v15 = v14;
      v16 = v12 * 0.5;
      if (vabds_f32(v15, v16) >= 0.00000011921 && v15 >= v16 || v14 < a4)
        a4 = v14;
      v9 = 1;
      v19 = v12 * 0.75;
      if (a4 < v12 * 0.75)
        v19 = a4;
      v10 = v19;
    }
  }
  else
  {
    v10 = 0.0;
  }
  -[AVPlayerViewController updateVideoBounds](self, "updateVideoBounds");

  v20 = v10;
  v21 = v9;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void)chromelessControlsViewControllerDidPressLiveTextButton:(id)a3
{
  -[AVVisualAnalysisView setHighlightsInteractableAreas:](self->_analysisView, "setHighlightsInteractableAreas:", -[AVVisualAnalysisView highlightsInteractableAreas](self->_analysisView, "highlightsInteractableAreas", a3) ^ 1);
}

- (void)chromelessControlsViewControllerDidPressSkipBackButton:(id)a3
{
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](self, 1);
}

- (void)chromelessControlsViewControllerDidPressSkipForwardButton:(id)a3
{
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](self, 2);
}

- (BOOL)observesMediaSelectionForSmartSubtitlesController:(id)a3
{
  int64_t preferredPlaybackControlsSupplementalSubtitleDisplayOption;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  preferredPlaybackControlsSupplementalSubtitleDisplayOption = self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption;
  if (preferredPlaybackControlsSupplementalSubtitleDisplayOption)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[AVPlayerViewController observesMediaSelectionForSmartSubtitlesController:]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s AVPlaybackControlsSupplementalSubtitleDisplayOption enabled", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    -[AVPlayerViewController _updateSupplementalSubtitlesIfNecessary]((uint64_t)self);
  }
  return preferredPlaybackControlsSupplementalSubtitleDisplayOption != 0;
}

- (void)videoFrameVisualAnalyzerDidFinishAnalyzingVideoFrame:(id)a3 withAnalysis:(id)a4
{
  objc_storeStrong((id *)&self->_currentInternalImageAnalysis, a4);
  -[AVPlayerViewController _setUpVisualAnalysisViewIfNeeded]((uint64_t)self);
  -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
}

- (void)videoFrameVisualAnalyzerFailedAnalyzingVideoFrame:(id)a3 withError:(id)a4
{
  VKCImageAnalysis *currentInternalImageAnalysis;

  currentInternalImageAnalysis = self->_currentInternalImageAnalysis;
  self->_currentInternalImageAnalysis = 0;

  -[AVPlayerViewController _updateAnalysisViewImageAnalysis]((id *)&self->super.super.super.isa);
}

- (void)visualAnalysisViewDidPressAnalysisButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self && self->_controlsGeneration == 1)
    -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
  -[AVControlsViewController toggleVisibility:](self->_controlsViewController, "toggleVisibility:", self);
  -[AVPlayerViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackContentContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", objc_msgSend(v6, "highlightsInteractableAreas"));

}

- (void)visualAnalysisView:(id)a3 prepareForCalloutAction:(SEL)a4 completion:(id)a5
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v6 = a5;
  -[AVPlayerViewController _notifyDelegateOfAnalysisCalloutAction](self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AVPlayerViewController_visualAnalysisView_prepareForCalloutAction_completion___block_invoke;
  block[3] = &unk_1E5BB4610;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)visualAnalysisViewDidBeginInteraction:(BOOL)a3
{
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 1);
}

- (void)visualAnalysisViewDidUpdateSubjectAvailability:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "subjectLiftGestureEnabled");

  if ((v6 & 1) == 0)
    objc_msgSend(v4, "setShowsCopySubjectControl:", objc_msgSend(v7, "hasSubjectToCopy"));

}

- (void)visualAnalysisViewDidUpdateVisualLookupAvailability:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "extendedVisualAnalysisEnabled");

  if (v5)
  {
    v6 = objc_msgSend(v8, "hasVisualLookupResults");
    -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShowsVisualLookupControl:", v6);
    -[AVPlayerViewController _setupToggleVisualLookupActionIfNeeded]((uint64_t)self);
    -[UIAction setState:](self->_toggleLookupAction, "setState:", self->_showsVisualLookup);
    -[UIAction setAttributes:](self->_toggleLookupAction, "setAttributes:", -[UIAction attributes](self->_toggleLookupAction, "attributes") & 0xFFFFFFFFFFFFFFFELL | -[AVVisualAnalysisView hasVisualLookupResults](self->_analysisView, "hasVisualLookupResults") ^ 1);

  }
}

- (BOOL)shouldBeginTouchInteractionForVisualAnalysisView:(id)a3
{
  AVMobileControlsViewController *controlsViewController;

  controlsViewController = self->_controlsViewController;
  return !controlsViewController
      || -[AVMobileControlsViewController visibileControls](controlsViewController, "visibileControls", a3) == 0;
}

- (id)transitionController:(id)a3 configurationForPresentedViewController:(id)a4 presentingViewController:(id)a5
{
  id v8;
  AVPlayerViewController *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = (AVPlayerViewController *)a4;
  v10 = a5;
  if (v9 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v11 = 1;
  else
    v11 = 2;
  +[AVPresentationConfiguration configurationWithTransitionStyle:transitionDuration:](AVPresentationConfiguration, "configurationWithTransitionStyle:transitionDuration:", v11, 0.4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)transitionController:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;

  v7 = a4;
  v8 = a5;
  -[AVPlayerViewController presentationContext](self, "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_3;
  -[AVPlayerViewController presentationContext](self, "presentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitioningDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController _avkitPreferredTransitioningDelegate](self, "_avkitPreferredTransitioningDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
  {
LABEL_3:
    if (!-[AVPlayerViewController _isTrackingUserInteractionWithInteractiveView](self, "_isTrackingUserInteractionWithInteractiveView"))
    {
      objc_msgSend(v7, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController contentView](self, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {
        -[AVPlayerViewController _actualContentOverlayView](self, "_actualContentOverlayView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isDescendantOfView:", v18) & 1) == 0)
        {
          -[AVPlayerViewController contentView](self, "contentView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isViewDescendantOfPlaybackControlsSubview:", v20))
          {
            objc_msgSend(v8, "view");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVPlayerViewController contentView](self, "contentView");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "playbackControlsView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "prominentPlayButtonContainerView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            isKindOfClass = objc_msgSend(v21, "isDescendantOfView:", v23);

          }
          else
          {
            isKindOfClass = 1;
          }

          goto LABEL_17;
        }
        isKindOfClass = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          isKindOfClass = 0;
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v8, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
LABEL_17:

          goto LABEL_18;
        }
        isKindOfClass = 1;
      }
LABEL_18:

      goto LABEL_19;
    }
  }
  isKindOfClass = 0;
LABEL_20:

  return isKindOfClass & 1;
}

- (void)transitionController:(id)a3 willBeginPresentingViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  AVPlayerViewController *v32;
  id v33;

  v6 = a3;
  v7 = a4;
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[AVPresentationContainerView setWantsAppearanceConfigValues:](self->_playerViewControllerView, "setWantsAppearanceConfigValues:", 1);
    -[AVPresentationContainerView appearanceProxy](self->_playerViewControllerView, "appearanceProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActualView:", 0);

    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[AVPlayerViewController presentationContext](self, "presentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsSecondWindowPresentations:", -[AVPlayerViewController wasInitializedUsingWebKitSPI](self, "wasInitializedUsingWebKitSPI") ^ 1);

  }
  objc_msgSend(v6, "presentationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AVPlayerViewController controlsViewController](self, "controlsViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v16 = v15;
    v18 = v17;
    -[AVPlayerViewController transitionCoordinator](self, "transitionCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewWillTransitionToSize:withTransitionCoordinator:", v19, v16, v18);

  }
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isInteractive"))
  {
    objc_msgSend(v20, "setPlayerViewControllerIsBeingTransitionedWithResizing:", 1);
  }
  else
  {
    objc_msgSend(v6, "presentationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sourceView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPlayerViewControllerIsBeingTransitionedWithResizing:", v23 != 0);

  }
  objc_msgSend(v7, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __81__AVPlayerViewController_transitionController_willBeginPresentingViewController___block_invoke;
  v31 = &unk_1E5BB1EA8;
  v32 = self;
  v25 = v7;
  v33 = v25;
  objc_msgSend(v24, "animateAlongsideTransition:completion:", 0, &v28);

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator_, v28, v29, v30, v31, v32))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transitionCoordinator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "playerViewController:willBeginFullScreenPresentationWithAnimationCoordinator:", self, v27);

  }
}

- (void)transitionController:(id)a3 willBeginDismissingViewController:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  AVPlayerControllerVolumeAnimator *v9;
  void *v10;
  AVPlayerControllerVolumeAnimator *v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  AVPlayerControllerVolumeAnimator *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  AVPlayerControllerVolumeAnimator *v32;
  id v33;
  BOOL v34;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = -[AVPlayerViewController _shouldPausePlaybackWhenExitingFullscreen](self, "_shouldPausePlaybackWhenExitingFullscreen");
  v9 = [AVPlayerControllerVolumeAnimator alloc];
  -[AVPlayerViewController playerController](self, "playerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVPlayerControllerVolumeAnimator initWithPlayerController:](v9, "initWithPlayerController:", v10);

  if (!v8)
  {
    if (!-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition_))goto LABEL_8;
LABEL_6:
    -[AVPlayerViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition:", self);

    if ((v14 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = -[AVPlayerControllerVolumeAnimator canAnimateVolumeTowardsZero](v11, "canAnimateVolumeTowardsZero");
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerShouldMuteVolumeForFullScreenDismissalTransition_))
  {
    goto LABEL_6;
  }
  if (v12)
LABEL_7:
    -[AVPlayerViewController setVolumeAnimator:](self, "setVolumeAnimator:", v11);
LABEL_8:
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isInteractive"))
  {
    objc_msgSend(v15, "setPlayerViewControllerIsBeingTransitionedWithResizing:", 1);
  }
  else
  {
    objc_msgSend(v6, "presentationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sourceView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPlayerViewControllerIsBeingTransitionedWithResizing:", v18 != 0);

  }
  objc_msgSend(v6, "presentationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sourceView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AVPlayerViewController controlsViewController](self, "controlsViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v23 = v22;
    v25 = v24;
    -[AVPlayerViewController transitionCoordinator](self, "transitionCoordinator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewWillTransitionToSize:withTransitionCoordinator:", v26, v23, v25);

  }
  objc_initWeak(&location, self);
  objc_msgSend(v7, "transitionCoordinator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke;
  v31[3] = &unk_1E5BB1ED0;
  objc_copyWeak(&v33, &location);
  v34 = v8;
  v31[4] = self;
  v28 = v11;
  v32 = v28;
  objc_msgSend(v27, "animateAlongsideTransition:completion:", 0, v31);

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionCoordinator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "playerViewController:willEndFullScreenPresentationWithAnimationCoordinator:", self, v30);

  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

- (id)transitionController:(id)a3 targetViewForDismissingViewController:(id)a4
{
  AVPlayerViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint8_t v14[16];

  v6 = (AVPlayerViewController *)a4;
  objc_msgSend(a3, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    if (-[AVPlayerViewController _delegateRespondsTo:](v6, "_delegateRespondsTo:", sel_playerViewController_targetViewForDismissalAnimationWithProposedTargetView_))
    {
      -[AVPlayerViewController delegate](v6, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playerViewController:targetViewForDismissalAnimationWithProposedTargetView:", v6, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }
  else
  {
    -[AVPlayerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      _AVLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_ERROR, "Target view should be our own view when the full screen view controller is being transitioned!", v14, 2u);
      }

    }
  }

  return v8;
}

- (void)transitionController:(id)a3 prepareForFinishingInteractiveTransition:(id)a4
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void (**v9)(void);

  v9 = (void (**)(void))a4;
  if (!-[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline"))
    goto LABEL_5;
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isBeingPresented") & 1) != 0
    || -[AVPlayerViewController isPictureInPictureActive](self, "isPictureInPictureActive"))
  {

LABEL_5:
    -[AVPlayerViewController setFinishPreparingForInteractiveDismissalHandler:](self, "setFinishPreparingForInteractiveDismissalHandler:", 0);
    v9[2]();
    goto LABEL_6;
  }
  v6 = -[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_shouldExitFullScreenWithReason_);

  if (!v6)
    goto LABEL_5;
  -[AVPlayerViewController setFinishPreparingForInteractiveDismissalHandler:](self, "setFinishPreparingForInteractiveDismissalHandler:", v9);
  -[AVPlayerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "playerViewController:shouldExitFullScreenWithReason:", self, 2);

  if (v8)
    goto LABEL_5;
LABEL_6:

}

- (void)transitionControllerBeginInteractivePresentationTransition:(id)a3
{
  void *v4;
  void *v5;

  -[AVPlayerViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[AVPlayerViewController _transitionToFullScreenAnimated:interactive:completionHandler:](self, "_transitionToFullScreenAnimated:interactive:completionHandler:", 1, 1, &__block_literal_global_591);
}

- (void)transitionControllerBeginInteractiveDismissalTransition:(id)a3
{
  -[AVPlayerViewController _transitionFromFullScreenAnimated:interactive:completionHandler:](self, "_transitionFromFullScreenAnimated:interactive:completionHandler:", 1, 1, &__block_literal_global_592);
}

- (BOOL)transitionControllerCanBeginInteractiveDismissalTransition:(id)a3
{
  id *p_isa;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v14;

  p_isa = (id *)&self->super.super.super.isa;
  if (-[AVPlayerViewController canControlPlayback](self, "canControlPlayback", a3))
  {
    if (objc_msgSend(p_isa, "isPresentingFullScreenFromInline"))
    {
      objc_msgSend(p_isa, "contentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "windowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "interfaceOrientation");

      if ((objc_msgSend(p_isa, "_isTransitioningToOrFromFullScreen") & 1) == 0)
      {
        objc_msgSend(p_isa, "presentationContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "presentingTransition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "presenterSupportsOrientation:", v7) & 1) == 0
          && !+[AVPresentationContext supportsInteractiveCounterRotationDismissals](AVPresentationContext, "supportsInteractiveCounterRotationDismissals"))
        {
          v11 = 0;
          goto LABEL_15;
        }
        p_isa = (id *)objc_loadWeakRetained(p_isa + 137);
        objc_msgSend(p_isa, "presentedViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

LABEL_7:
LABEL_15:

        goto LABEL_16;
      }
    }
    else if ((objc_msgSend(p_isa, "_isTransitioningToOrFromFullScreen") & 1) == 0
           && objc_msgSend(p_isa, "_isDescendantOfRootViewController"))
    {
      objc_msgSend(p_isa, "presentedViewController");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v8 = (void *)v12;
        v11 = 0;
LABEL_16:

        return v11;
      }
      objc_msgSend(p_isa, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentedViewController");
      v14 = objc_claimAutoreleasedReturnValue();
      if ((id *)v14 == p_isa)
      {
        v11 = objc_msgSend(p_isa, "_modalPresentationStyleIsFullScreen");
        v8 = 0;
      }
      else
      {
        v8 = 0;
        v11 = 0;
        p_isa = (id *)v14;
      }
      goto LABEL_7;
    }
  }
  return 0;
}

- (BOOL)transitionControllerCanBeginInteractivePresentationTransition:(id)a3
{
  void *v4;
  BOOL v5;

  if (!-[AVPlayerViewController canControlPlayback](self, "canControlPlayback", a3)
    || !-[AVPlayerViewController _canEnterFullScreen](self, "_canEnterFullScreen"))
  {
    return 0;
  }
  -[AVPlayerViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[AVPlayerViewController _isDescendantOfRootViewController](self, "_isDescendantOfRootViewController");
  else
    v5 = 0;

  return v5;
}

- (id)transitionControllerPresentedViewBackgroundColor:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v15;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v22;

  v6 = a3;
  objc_msgSend(v6, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "hasActiveTransition"))
    goto LABEL_29;
  objc_msgSend(v6, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "wasInitiallyInteractive");
  if ((v9 & 1) != 0)
  {
    if (-[AVPlayerViewController _isUnsupportedContent](self, "_isUnsupportedContent"))
      goto LABEL_28;
  }
  else
  {
    objc_msgSend(v6, "presentationContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sourceView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || -[AVPlayerViewController _isUnsupportedContent](self, "_isUnsupportedContent"))
      goto LABEL_27;
  }
  -[AVPlayerViewController playerController](self, "playerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentDimensions");
  v15 = ((v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v12 >= 0
     || (unint64_t)(v12 - 1) < 0xFFFFFFFFFFFFFLL;
  v17 = (v11 < 0 || ((v11 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
     && (unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFELL;
  if (v17 || !v15)
  {
LABEL_26:

    if ((v9 & 1) != 0)
    {
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
LABEL_27:

    goto LABEL_28;
  }
  -[AVPlayerViewController playerController](self, "playerController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isPlayingOnExternalScreen") & 1) != 0)
  {

    goto LABEL_26;
  }
  v22 = -[AVPlayerViewController isPictureInPictureActive](self, "isPictureInPictureActive");

  if ((v9 & 1) == 0)
  {

  }
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v20 = (void *)v19;

  return v20;
}

- (id)transitionControllerBackgroundViewBackgroundColor:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "wasInitiallyInteractive");
  if ((v7 & 1) != 0
    || (objc_msgSend(v5, "presentationContext"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "sourceView"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v8;
}

- (void)transitionController:(id)a3 transitionWillComplete:(BOOL)a4 continueBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  AVPlayerViewController *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, _QWORD);
  id v24;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  if (!-[AVPlayerViewController wantsDetachedFullscreenPresentation](self, "wantsDetachedFullscreenPresentation")
    || !-[AVPlayerViewController canDisplayContentInDetachedWindow](self, "canDisplayContentInDetachedWindow"))
  {
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_9:
      -[AVPlayerViewController _setContentViewOnSelf](self, "_setContentViewOnSelf");
      goto LABEL_10;
    }
    v11 = (void *)v10;
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isBeingPresented") && !v6)
    {

      goto LABEL_9;
    }
    -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isBeingDismissed");

    if (v14 && v6)
      goto LABEL_9;
  }
LABEL_10:
  if (!v6)
  {
LABEL_18:
    v9[2](v9, 0);
    goto LABEL_19;
  }
  objc_msgSend(v8, "presentationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isDismissing")
    || (-[AVPlayerViewController player](self, "player"), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  v17 = (void *)v16;
  objc_msgSend(v8, "presentationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "wasInitiallyInteractive") & 1) == 0)
  {

    goto LABEL_17;
  }
  objc_msgSend(v8, "presentationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentedViewController");
  v20 = (AVPlayerViewController *)objc_claimAutoreleasedReturnValue();

  if (v20 != self)
    goto LABEL_18;
  objc_initWeak(&location, self);
  -[AVPlayerViewController player](self, "player");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__AVPlayerViewController_transitionController_transitionWillComplete_continueBlock___block_invoke;
  v22[3] = &unk_1E5BB1F58;
  objc_copyWeak(&v24, &location);
  v23 = v9;
  +[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:](AVDismissalExpanseCoordinator, "coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:", v21, 1, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_19:
  self->_fullscreenTransitionInProgress = 0;
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)self);

}

- (void)transitionController:(id)a3 animationProgressDidChange:(float)a4
{
  double v4;
  id v5;

  v4 = 1.0 - a4;
  -[AVPlayerViewController volumeAnimator](self, "volumeAnimator", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProgressTowardsZero:", 1.0 - v4 * v4);

}

- (BOOL)_modalPresentationStyleIsFullScreen
{
  return !-[AVPlayerViewController modalPresentationStyle](self, "modalPresentationStyle")
      || -[AVPlayerViewController modalPresentationStyle](self, "modalPresentationStyle") == 5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  AVPlayerViewControllerCustomControlsView *v15;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (self)
  {
    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "tapGestureRecognizersCanReceiveTouches");

      if ((v10 & 1) == 0)
      {
LABEL_11:
        LOBYTE(self) = 0;
        goto LABEL_12;
      }
    }
    else if (!-[AVPlayerViewController hasCustomPlaybackControls](self, "hasCustomPlaybackControls")
           && !-[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls"))
    {
      goto LABEL_11;
    }
    objc_msgSend(v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v12);
    objc_msgSend(v11, "hitTest:withEvent:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVMobileControlsViewController viewIfLoaded](self->_controlsViewController, "viewIfLoaded");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_customControlsView;
    if ((objc_msgSend(v13, "isDescendantOfView:", v14) & 1) != 0
      || (objc_msgSend(v13, "isDescendantOfView:", v15) & 1) != 0)
    {
      LOBYTE(self) = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v6, "numberOfTapsRequired") >= 2)
      {
        -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(self) = objc_msgSend(v17, "entersFullScreenWhenTapped") ^ 1;

      }
      else
      {
        LOBYTE(self) = 1;
      }
    }

  }
LABEL_12:

  return (char)self;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a3;
  -[AVPlayerViewController scrubGestureRecognizer](self, "scrubGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = -[AVPlayerViewController showsPlaybackControls](self, "showsPlaybackControls");
    if (v6)
    {
      -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "showsProminentPlayButton");

      if ((v8 & 1) != 0)
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        -[AVPlayerViewController scrubGestureRecognizer](self, "scrubGestureRecognizer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlayerViewController contentView](self, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "velocityInView:", v10);
        v12 = v11;
        v14 = v13;

        v15 = fabs(v14);
        LOBYTE(v6) = fabs(v12) > v15 + v15;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  AVCenterTapGestureRecognizer *v6;
  id v7;
  char isKindOfClass;

  v6 = (AVCenterTapGestureRecognizer *)a3;
  v7 = a4;
  if ((AVCenterTapGestureRecognizer *)self->_singleTapGestureRecognizer == v6
    || self->_tapThroughGestureRecognizer == v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = -[AVScrubbingGestureController state](self->_scrubbingGestureController, "state") != 3;
      goto LABEL_10;
    }
LABEL_9:
    isKindOfClass = 0;
    goto LABEL_10;
  }
  if ((AVCenterTapGestureRecognizer *)self->_videoGravityPinchGestureRecognizer != v6)
    goto LABEL_9;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
LABEL_10:

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIHoverGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  char isKindOfClass;

  v6 = (UIHoverGestureRecognizer *)a3;
  v7 = (UITapGestureRecognizer *)a4;
  v8 = v7;
  if (self->_hoverGestureRecognizer == v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      isKindOfClass = 1;
      goto LABEL_10;
    }
LABEL_8:
    isKindOfClass = 0;
    goto LABEL_10;
  }
  if ((UIHoverGestureRecognizer *)self->_scrubGestureRecognizer == v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_10;
  }
  if ((UIHoverGestureRecognizer *)self->_tapThroughGestureRecognizer != v6)
    goto LABEL_8;
  isKindOfClass = self->_singleTapGestureRecognizer == v7;
LABEL_10:

  return isKindOfClass & 1;
}

- (void)avkit_startRoutingVideoToPictureInPictureViewController:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "loadViewIfNeeded");
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlayerViewController videoBounds](self, "videoBounds");
  objc_msgSend(v5, "setFrame:");

  -[__AVPlayerLayerView startRoutingVideoToPictureInPicturePlayerLayerView](self->_playerLayerView, "startRoutingVideoToPictureInPicturePlayerLayerView");
}

- (void)avkit_stopRoutingVideoToPictureInPictureViewController:(id)a3
{
  -[__AVPlayerLayerView stopRoutingVideoToPictureInPicturePlayerLayerView](self->_playerLayerView, "stopRoutingVideoToPictureInPicturePlayerLayerView", a3);
}

- (void)avkit_beginReducingResourcesForPictureInPictureViewController:(id)a3 playerController:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AVPlayerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerViewControllerBeginReducingResourcesForPictureInPicture:", self);
LABEL_5:

    goto LABEL_6;
  }
  -[AVPlayerViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pictureInPicturePlayerLayerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginReducingResourcesForPictureInPicturePlayerLayer:", v11);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)avkit_endReducingResourcesForPictureInPictureViewController:(id)a3 playerController:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[AVPlayerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerViewControllerEndReducingResourcesForPictureInPicture:", self);
LABEL_5:

    goto LABEL_6;
  }
  -[AVPlayerViewController playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AVPlayerViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pictureInPicturePlayerLayerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endReducingResourcesForPictureInPicturePlayerLayer:", v11);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pictureInPicturePlayerLayerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[AVPlayerViewController avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:]";
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s Disabling legible display for picture in picture player layer", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v3, "pictureInPicturePlayerLayerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playerLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLegibleDisplayEnabled:", 0);

  }
}

- (void)pictureInPictureControllerWillStartPictureInPicture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[5];

  v4 = a3;
  self->_pipStartingOrActive = 1;
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke;
  v20[3] = &unk_1E5BB1F80;
  v20[4] = self;
  objc_msgSend(v5, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_willStartPictureInPictureWithViewController_, &unk_1EECA27A0, v20);

  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_2;
  v17[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v17);

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerWillStartPictureInPicture_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerViewControllerWillStartPictureInPicture:", self);

  }
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v12 = v6;
  v13 = 3221225472;
  v14 = __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_3;
  v15 = &unk_1E5BB4A40;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v10, "animateWithDuration:animations:", &v12, 0.2);
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPictureInPictureActive:", 1);

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)pictureInPictureControllerDidStartPictureInPicture:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  BOOL v14;
  void (**v15)(_QWORD);
  void *v16;
  int v17;
  void *v18;
  int v19;
  _QWORD v20[4];
  id v21[2];
  BOOL v22;
  id location;
  _QWORD v24[5];

  v4 = a3;
  v5 = *MEMORY[0x1E0DC4878];
  v6 = (id *)MEMORY[0x1E0DC4730];
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)*MEMORY[0x1E0DC4730];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke;
  v24[3] = &__block_descriptor_40_e5_v8__0l;
  v24[4] = v5;
  v9 = (void *)objc_msgSend(v8, "beginBackgroundTaskWithExpirationHandler:", v24);
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerDidStartPictureInPicture_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerViewControllerDidStartPictureInPicture:", self);

  }
  if (!-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart_))
  {
    v14 = -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline");
    goto LABEL_9;
  }
  -[AVPlayerViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:", self);

  v13 = -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline");
  v14 = v13;
  if (v12)
  {
LABEL_9:
    objc_initWeak(&location, self);
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_2;
    v20[3] = &unk_1E5BB1FD0;
    objc_copyWeak(v21, &location);
    v22 = v14;
    v21[1] = v9;
    v15 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v20);
    -[AVTransitionController presentationContext](self->_transitionController, "presentationContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isPresenting");

    if (v17)
    {
      -[AVPlayerViewController setDismissForPIPStartAfterPresentationHandler:](self, "setDismissForPIPStartAfterPresentationHandler:", v15);
    }
    else
    {
      -[AVTransitionController presentationContext](self->_transitionController, "presentationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isDismissing");

      if (v19)
        objc_msgSend(*v6, "endBackgroundTask:", v9);
      else
        v15[2](v15);
    }

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
    goto LABEL_15;
  }
  if (v13)
    -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
  objc_msgSend(*v6, "endBackgroundTask:", v9);
LABEL_15:
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);

}

- (void)pictureInPictureController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_pipStartingOrActive = 0;
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[AVPlayerViewController pictureInPictureController:failedToStartPictureInPictureWithError:]";
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to start PIP with error: '%@'", buf, 0x16u);

  }
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_failedToStartPictureInPictureWithError_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerViewController:failedToStartPictureInPictureWithError:", self, v7);

  }
  objc_initWeak((id *)buf, self);
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__AVPlayerViewController_pictureInPictureController_failedToStartPictureInPictureWithError___block_invoke;
  v13[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v11, "animateWithDuration:animations:", v13, 0.2);
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPictureInPictureActive:", 0);

  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)pictureInPictureControllerWillStopPictureInPicture:(id)a3
{
  id v4;

  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerWillStopPictureInPicture_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerViewControllerWillStopPictureInPicture:", self);

  }
}

- (void)pictureInPictureControllerDidStopPictureInPicture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  self->_pipStartingOrActive = 0;
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewControllerDidStopPictureInPicture_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerViewControllerDidStopPictureInPicture:", self);

  }
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_didStopPictureInPicture, &unk_1EECA27A0, &__block_literal_global_619);

  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __76__AVPlayerViewController_pictureInPictureControllerDidStopPictureInPicture___block_invoke_2;
  v12 = &unk_1E5BB4A40;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "animateWithDuration:animations:", &v9, 0.2);
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPictureInPictureActive:", 0);

  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)self, 0);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)pictureInPictureController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler_))
  {
    -[AVPlayerViewController _transitionController](self, "_transitionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDismissing");

    _AVLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
        _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s PIP stopping, pending restore of user interface presentation will start after dismissal transition completes", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v6);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E5BB2018;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, (id *)buf);
      v18 = v7;
      -[AVPlayerViewController setPendingRestoreUserInterfaceForPictureInPictureStopHandler:](self, "setPendingRestoreUserInterfaceForPictureInPictureStopHandler:", v17);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
        _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s PIP stopping, restore user interface starting", buf, 0xCu);
      }

      -[AVPlayerViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke_622;
      v15[3] = &unk_1E5BB2500;
      v16 = v7;
      objc_msgSend(v14, "playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:", self, v15);

    }
  }
  else
  {
    _AVLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
      _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s PIP stopping, client did not implement restore user interface on stop delegate, call back to Pegasus and assume client is restore ready.", buf, 0xCu);
    }

    if (v7)
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

- (void)pictureInPictureControllerDidSkipBackwardInPictureInPicture:(id)a3
{
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](self, 1);
}

- (void)pictureInPictureControllerDidSkipForwardInPictureInPicture:(id)a3
{
  -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](self, 2);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return 0;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v3;

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPopoverIsBeingPresented:", 1);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPopoverIsBeingPresented:", 0);

}

- (void)playbackControlsViewDidToggleControlsVisibility:(id)a3
{
  -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](self);
  -[AVPlayerViewController _updateWantsAnalysisButtonVisibleStateIfNeeded](self);
}

- (void)scrollingObserverDidChangeScrollingState:(id)a3
{
  -[AVPlayerViewController performInitialSetupIfNeededAndPossible](self, "performInitialSetupIfNeededAndPossible", a3);
  -[AVPlayerViewController _updateControlsViewControllerPerformanceState]((uint64_t)self);
  -[AVPlayerViewController _updatePlayerControllerInspectionState]((uint64_t)self);
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)self);
  -[AVPlayerViewController _updateVisualAnalysisViewHiddenState]((uint64_t)self);
}

- (id)scrubbingGestureConfigurationForGestureController:(id)a3
{
  return 0;
}

- (void)scrubbingGestureControllerStateDidChange:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "state") == 2)
  {
    objc_msgSend(v16, "platformAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v16, "platformAdapter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMobileControlsViewController controlsViewControllerIfChromeless](self->_controlsViewController, "controlsViewControllerIfChromeless");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutMargins");
      v10 = v9;
      v12 = v11;

      objc_msgSend(v7, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v15 = v14 - v10 - v12;

      objc_msgSend(v6, "setScrubbingWidth:", v15);
    }
  }

}

- (void)fullScreenViewControllerWillBeginFullScreenPresentation:(id)a3
{
  id v4;

  -[AVPlayerView setContentView:](self->_playerViewControllerView, "setContentView:", 0);
  -[AVPlayerViewController setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:](self, "setShouldUseNetworkingResourcesForLiveStreamingWhilePaused:", 1);
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_willEnterFullScreen, &unk_1EECA27A0, &__block_literal_global_628);

}

- (void)fullScreenViewControllerWillEndFullScreenPresentation:(id)a3
{
  id v4;

  -[AVPlayerViewController _setContentViewOnSelf](self, "_setContentViewOnSelf", a3);
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateAllBehaviorContextsImplementingSelector:forProtocol:usingBlock:", sel_willExitFullScreen, &unk_1EECA27A0, &__block_literal_global_630);

}

- (void)fullScreenViewControllerWillAttachContentView:(id)a3
{
  -[AVMobileControlsViewController willMoveToParentViewController:](self->_controlsViewController, "willMoveToParentViewController:", 0);
  -[AVMobileControlsViewController removeFromParentViewController](self->_controlsViewController, "removeFromParentViewController");
}

- (void)fullScreenViewControllerDidAttachContentView:(id)a3
{
  objc_msgSend(a3, "addChildViewController:", self->_controlsViewController);
}

- (id)playbackContainerViewForFullScreenViewController:(id)a3
{
  void *v3;
  void *v4;

  -[AVPlayerViewController contentView](self, "contentView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackContentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fullScreenViewController:(id)a3 viewWillTransitionToSize:(CGSize)a4 coordinator:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v12 = a5;
  v9 = a3;
  -[AVPlayerViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewIfLoaded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isDescendantOfView:", v11);
  if ((_DWORD)v9)
    -[AVPlayerViewController _contentViewWillTransitionToSize:withTransitionCoordinator:](self, "_contentViewWillTransitionToSize:withTransitionCoordinator:", v12, width, height);

}

- (BOOL)playerControllerCanRestorePlaybackRateAfterAudioSessionDeactivation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  -[AVPlayerViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "activationState") == 1)
  {
    objc_msgSend(v5, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uiSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deactivationReasons");

    v9 = (v8 & 0xFFFFFFFFFFFFFFAFLL) == 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)playerControllerDidUpdateIsPlayingHDRContent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  -[AVPlayerViewController controlsViewController](self, "controlsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlsViewControllerIfChromeless");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v4, "isPlayingHDRContent");
  v6 = 0.0;
  if ((_DWORD)v5)
    v6 = 3.0;
  objc_msgSend(v7, "setExtendedDynamicRangeGain:", v6);

}

- (void)playbackSpeedCollection:(id)a3 selectedPlaybackSpeedDidChangeTo:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "internalDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[AVPlayerViewController playbackSpeedCollection:selectedPlaybackSpeedDidChangeTo:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s New playback speed selected: %@", (uint8_t *)&v8, 0x16u);

  }
  -[AVPlayerViewController _updateDefaultPlaybackRateIfNeeded](self, "_updateDefaultPlaybackRateIfNeeded");

}

- (void)didPresentInterstitialGroup:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AVPlayerViewController _updateActuallyRequiresLinearPlayback](self, "_updateActuallyRequiresLinearPlayback");
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_didPresentInterstitialTimeRange_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerViewController:didPresentInterstitialTimeRange:", self, v5);

  }
}

- (void)willPresentInterstitialGroup:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AVPlayerViewController _updateActuallyRequiresLinearPlayback](self, "_updateActuallyRequiresLinearPlayback");
  if (-[AVPlayerViewController _delegateRespondsTo:](self, "_delegateRespondsTo:", sel_playerViewController_willPresentInterstitialTimeRange_))
  {
    -[AVPlayerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerViewController:willPresentInterstitialTimeRange:", self, v5);

  }
}

- (id)scrubGestureConfigurationSettings
{
  return 0;
}

- (BOOL)prefersDeviceUserInterfaceStyle
{
  return self->_prefersDeviceUserInterfaceStyle;
}

- (BOOL)showsAudioLanguageMenu
{
  return self->_showsAudioLanguageMenu;
}

- (NSArray)infoViewActions
{
  return self->_infoViewActions;
}

- (BOOL)isHoveringOverPlaybackControl
{
  return self->_hoveringOverPlaybackControl;
}

- (UIEdgeInsets)legibleContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_legibleContentInsets.top;
  left = self->_legibleContentInsets.left;
  bottom = self->_legibleContentInsets.bottom;
  right = self->_legibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (VKCImageAnalysis)imageAnalysis
{
  return self->_imageAnalysis;
}

- (BOOL)showsTimecodes
{
  return self->_showsTimecodes;
}

- (BOOL)isReadyForDisplay
{
  return self->_readyForDisplay;
}

- (BOOL)entersFullScreenWhenPlaybackBegins
{
  return self->_entersFullScreenWhenPlaybackBegins;
}

- (BOOL)exitsFullScreenWhenPlaybackEnds
{
  return self->_exitsFullScreenWhenPlaybackEnds;
}

- (BOOL)appliesPreferredDisplayCriteriaAutomatically
{
  return self->_appliesPreferredDisplayCriteriaAutomatically;
}

- (void)setAppliesPreferredDisplayCriteriaAutomatically:(BOOL)appliesPreferredDisplayCriteriaAutomatically
{
  self->_appliesPreferredDisplayCriteriaAutomatically = appliesPreferredDisplayCriteriaAutomatically;
}

- (UILayoutGuide)unobscuredContentGuide
{
  return self->_unobscuredContentGuide;
}

- (NSArray)allowedSubtitleOptionLanguages
{
  return self->_allowedSubtitleOptionLanguages;
}

- (void)setAllowedSubtitleOptionLanguages:(NSArray *)allowedSubtitleOptionLanguages
{
  objc_setProperty_nonatomic_copy(self, a2, allowedSubtitleOptionLanguages, 1528);
}

- (BOOL)requiresFullSubtitles
{
  return self->_requiresFullSubtitles;
}

- (void)setRequiresFullSubtitles:(BOOL)requiresFullSubtitles
{
  self->_requiresFullSubtitles = requiresFullSubtitles;
}

- (AVPlayerViewControllerSkippingBehavior)skippingBehavior
{
  return self->_skippingBehavior;
}

- (void)setSkippingBehavior:(AVPlayerViewControllerSkippingBehavior)skippingBehavior
{
  self->_skippingBehavior = skippingBehavior;
}

- (BOOL)isSkipForwardEnabled
{
  return self->_skipForwardEnabled;
}

- (void)setSkipForwardEnabled:(BOOL)skipForwardEnabled
{
  self->_skipForwardEnabled = skipForwardEnabled;
}

- (BOOL)isSkipBackwardEnabled
{
  return self->_skipBackwardEnabled;
}

- (void)setSkipBackwardEnabled:(BOOL)skipBackwardEnabled
{
  self->_skipBackwardEnabled = skipBackwardEnabled;
}

- (BOOL)playbackControlsIncludeTransportBar
{
  return self->_playbackControlsIncludeTransportBar;
}

- (void)setPlaybackControlsIncludeTransportBar:(BOOL)playbackControlsIncludeTransportBar
{
  self->_playbackControlsIncludeTransportBar = playbackControlsIncludeTransportBar;
}

- (BOOL)playbackControlsIncludeInfoViews
{
  return self->_playbackControlsIncludeInfoViews;
}

- (void)setPlaybackControlsIncludeInfoViews:(BOOL)playbackControlsIncludeInfoViews
{
  self->_playbackControlsIncludeInfoViews = playbackControlsIncludeInfoViews;
}

- (BOOL)transportBarIncludesTitleView
{
  return self->_transportBarIncludesTitleView;
}

- (void)setTransportBarIncludesTitleView:(BOOL)transportBarIncludesTitleView
{
  self->_transportBarIncludesTitleView = transportBarIncludesTitleView;
}

- (UIViewController)customOverlayViewController
{
  return self->_customOverlayViewController;
}

- (void)setCustomOverlayViewController:(UIViewController *)customOverlayViewController
{
  objc_storeStrong((id *)&self->_customOverlayViewController, customOverlayViewController);
}

- (NSArray)transportBarCustomMenuItems
{
  return self->_transportBarCustomMenuItems;
}

- (BOOL)requiresMonoscopicViewingMode
{
  return self->_requiresMonoscopicViewingMode;
}

- (void)setRequiresMonoscopicViewingMode:(BOOL)requiresMonoscopicViewingMode
{
  self->_requiresMonoscopicViewingMode = requiresMonoscopicViewingMode;
}

- (NSArray)contextualActions
{
  return self->_contextualActions;
}

- (void)setContextualActions:(NSArray *)contextualActions
{
  objc_setProperty_nonatomic_copy(self, a2, contextualActions, 1560);
}

- (UIView)contextualActionsInfoView
{
  return self->_contextualActionsInfoView;
}

- (UIImage)contextualActionsPreviewImage
{
  return self->_contextualActionsPreviewImage;
}

- (void)setContextualActionsPreviewImage:(UIImage *)contextualActionsPreviewImage
{
  objc_setProperty_nonatomic_copy(self, a2, contextualActionsPreviewImage, 1576);
}

- (AVGroupExperienceCoordinator)groupExperienceCoordinator
{
  return self->_groupExperienceCoordinator;
}

- (BOOL)canBeginTrimming
{
  return self->_canBeginTrimming;
}

- (AVContentOverlayView)_actualContentOverlayView
{
  return self->__actualContentOverlayView;
}

- (id)finishPreparingForInteractiveDismissalHandler
{
  return self->_finishPreparingForInteractiveDismissalHandler;
}

- (void)setFinishPreparingForInteractiveDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1608);
}

- (id)dismissForPIPStartAfterPresentationHandler
{
  return self->_dismissForPIPStartAfterPresentationHandler;
}

- (void)setDismissForPIPStartAfterPresentationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1616);
}

- (id)pendingRestoreUserInterfaceForPictureInPictureStopHandler
{
  return self->_pendingRestoreUserInterfaceForPictureInPictureStopHandler;
}

- (void)setPendingRestoreUserInterfaceForPictureInPictureStopHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1624);
}

- (id)interactiveDismissalCompletionHandler
{
  return self->_interactiveDismissalCompletionHandler;
}

- (void)setInteractiveDismissalCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1632);
}

- (int64_t)_numberOfTrackedUserInteractions
{
  return self->__numberOfTrackedUserInteractions;
}

- (void)_setNumberOfTrackedUserInteractions:(int64_t)a3
{
  self->__numberOfTrackedUserInteractions = a3;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (UIPanGestureRecognizer)scrubGestureRecognizer
{
  return self->_scrubGestureRecognizer;
}

- (NSMutableDictionary)_localizedDiscoverabilityTitleForKeyCommandLocalizationKey
{
  return self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey;
}

- (void)setSecondScreenConnectionDisplaySize:(CGSize)a3
{
  self->_secondScreenConnectionDisplaySize = a3;
}

- (BOOL)wasInitializedUsingWebKitSPI
{
  return self->_wasInitializedUsingWebKitSPI;
}

- (void)setWasInitializedUsingWebKitSPI:(BOOL)a3
{
  self->_wasInitializedUsingWebKitSPI = a3;
}

- (AVVisualAnalysisView)analysisView
{
  return self->_analysisView;
}

- (void)setAnalysisView:(id)a3
{
  objc_storeStrong((id *)&self->_analysisView, a3);
}

- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect
{
  return self->_cacheLargestInscribedRect;
}

- (void)setCacheLargestInscribedRect:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, a3);
}

- (BOOL)isUpdatingSecondScreenConnectionReadyToConnect
{
  return self->_isUpdatingSecondScreenConnectionReadyToConnect;
}

- (void)setIsUpdatingSecondScreenConnectionReadyToConnect:(BOOL)a3
{
  self->_isUpdatingSecondScreenConnectionReadyToConnect = a3;
}

- (UIViewController)infoTabViewController
{
  return self->_infoTabViewController;
}

- (AVInfoTabCoordinator)infoTabCoordinator
{
  return self->_infoTabCoordinator;
}

- (void)setInfoTabCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_infoTabCoordinator, a3);
}

- (AVCenterTapGestureRecognizer)tapThroughGestureRecognizer
{
  return self->_tapThroughGestureRecognizer;
}

- (void)setTapThroughGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapThroughGestureRecognizer, a3);
}

- (BOOL)isAtLiveEdge
{
  return self->_atLiveEdge;
}

- (BOOL)canPausePlaybackWhenExitingFullScreen
{
  return self->_canPausePlaybackWhenExitingFullScreen;
}

- (NSArray)customControlItems
{
  return self->_customControlItems;
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (NSString)infoHint
{
  return self->_infoHint;
}

- (void)setInfoHint:(id)a3
{
  objc_storeStrong((id *)&self->_infoHint, a3);
}

- (BOOL)wantsDetachedFullscreenPresentation
{
  return self->_wantsDetachedFullscreenPresentation;
}

- (void)setWantsDetachedFullscreenPresentation:(BOOL)a3
{
  self->_wantsDetachedFullscreenPresentation = a3;
}

- (BOOL)titleMetadataIncludesProResBadge
{
  return self->_titleMetadataIncludesProResBadge;
}

- (void)setTitleMetadataIncludesProResBadge:(BOOL)a3
{
  self->_titleMetadataIncludesProResBadge = a3;
}

- (BOOL)titleMetadataIncludesHDRBadge
{
  return self->_titleMetadataIncludesHDRBadge;
}

- (void)setTitleMetadataIncludesHDRBadge:(BOOL)a3
{
  self->_titleMetadataIncludesHDRBadge = a3;
}

- (AVPlayerViewControllerPlaybackDelegate)privateDelegate
{
  return self->_privateDelegate;
}

- (void)setPrivateDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_privateDelegate, a3);
}

- (UIEdgeInsets)_clientLegibleContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__clientLegibleContentInsets.top;
  left = self->__clientLegibleContentInsets.left;
  bottom = self->__clientLegibleContentInsets.bottom;
  right = self->__clientLegibleContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setClientLegibleContentInsets:(UIEdgeInsets)a3
{
  self->__clientLegibleContentInsets = a3;
}

- (UIMenuElement)transportBarCustomAudioMenu
{
  return self->_transportBarCustomAudioMenu;
}

- (void)setTransportBarCustomAudioMenu:(id)a3
{
  objc_storeStrong((id *)&self->_transportBarCustomAudioMenu, a3);
}

- (BOOL)playbackControlsIncludeFullScreenLoadingSpinner
{
  return self->_playbackControlsIncludeFullScreenLoadingSpinner;
}

- (void)setPlaybackControlsIncludeFullScreenLoadingSpinner:(BOOL)a3
{
  self->_playbackControlsIncludeFullScreenLoadingSpinner = a3;
}

- (int64_t)preferredPlaybackControlsSupplementalSubtitleDisplayOption
{
  return self->_preferredPlaybackControlsSupplementalSubtitleDisplayOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportBarCustomAudioMenu, 0);
  objc_storeStrong((id *)&self->_privateDelegate, 0);
  objc_storeStrong((id *)&self->_infoHint, 0);
  objc_storeStrong((id *)&self->_pictureInPictureActivitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_customControlItems, 0);
  objc_storeStrong((id *)&self->_tapThroughGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_infoTabCoordinator, 0);
  objc_storeStrong((id *)&self->_infoTabViewController, 0);
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, 0);
  objc_storeStrong((id *)&self->_analysisView, 0);
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_volumeAnimator, 0);
  objc_storeStrong((id *)&self->__localizedDiscoverabilityTitleForKeyCommandLocalizationKey, 0);
  objc_storeStrong((id *)&self->_scrubGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong(&self->_interactiveDismissalCompletionHandler, 0);
  objc_storeStrong(&self->_pendingRestoreUserInterfaceForPictureInPictureStopHandler, 0);
  objc_storeStrong(&self->_dismissForPIPStartAfterPresentationHandler, 0);
  objc_storeStrong(&self->_finishPreparingForInteractiveDismissalHandler, 0);
  objc_storeStrong((id *)&self->__pipActivitySessionObservationController, 0);
  objc_storeStrong((id *)&self->__actualContentOverlayView, 0);
  objc_storeStrong((id *)&self->_groupExperienceCoordinator, 0);
  objc_storeStrong((id *)&self->_contextualActionsPreviewImage, 0);
  objc_storeStrong((id *)&self->_contextualActionsInfoView, 0);
  objc_storeStrong((id *)&self->_contextualActions, 0);
  objc_storeStrong((id *)&self->_transportBarCustomMenuItems, 0);
  objc_storeStrong((id *)&self->_customOverlayViewController, 0);
  objc_storeStrong((id *)&self->_allowedSubtitleOptionLanguages, 0);
  objc_storeStrong((id *)&self->_unobscuredContentGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pictureInPictureController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_imageAnalysis, 0);
  objc_storeStrong((id *)&self->_infoViewActions, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->__targetVideoGravitiesForLayoutClass, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_smartSubtitlesController, 0);
  objc_storeStrong((id *)&self->_customInfoViewControllers, 0);
  objc_storeStrong((id *)&self->_interactiveTransitionGestureTracker, 0);
  objc_storeStrong((id *)&self->_scrubInterruptionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userInteractionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_externalGestureRecognizerPreventer, 0);
  objc_storeStrong((id *)&self->_videoGravityPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapTwoFingersGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrubGestureMomentumTimer, 0);
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_customControlsView, 0);
  objc_storeStrong((id *)&self->_controlsViewController, 0);
  objc_storeStrong((id *)&self->_playerViewControllerContentView, 0);
  objc_storeStrong((id *)&self->_playerViewControllerView, 0);
  objc_storeStrong((id *)&self->_enhanceDialogueController, 0);
  objc_storeStrong((id *)&self->_scrubbingGestureController, 0);
  objc_storeStrong((id *)&self->_videoFrameVisualAnalyzer, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_playbackControlsController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_destroyWeak((id *)&self->_mediaSelectionPopoverPresentationController);
  objc_storeStrong((id *)&self->_nowPlayingInfoController, 0);
  objc_storeStrong((id *)&self->_secondScreenConnection, 0);
  objc_storeStrong((id *)&self->_fullscreenController, 0);
  objc_storeStrong((id *)&self->_playFromBeginningAction, 0);
  objc_storeStrong((id *)&self->_toggleLookupAction, 0);
  objc_storeStrong((id *)&self->_copySubjectAction, 0);
  objc_storeStrong((id *)&self->_currentInternalImageAnalysis, 0);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->__behaviorStorage, 0);
  objc_storeStrong((id *)&self->_pixelBufferAttributes, 0);
}

uint64_t __80__AVPlayerViewController_fullScreenViewControllerWillEndFullScreenPresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willExitFullScreen");
}

uint64_t __82__AVPlayerViewController_fullScreenViewControllerWillBeginFullScreenPresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willEnterFullScreen");
}

void __141__AVPlayerViewController_playbackControlsView_animateAlongsideVisibilityAnimationsWithAnimationCoordinator_appearingViews_disappearingViews___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "avkit_needsUpdateBackdropCaptureViewHidden");

}

uint64_t __77__AVPlayerViewController_playbackControlsViewNeedsUpdateStatusBarAppearance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerPreferencesIfNeeded");
}

- (void)_updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:(_QWORD *)a1
{
  uint64_t v4;
  float v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  float v13;
  id v14;

  if (!a1)
    return;
  -[AVPlayerViewController _updateSupplementalSubtitlesIfNecessary]((uint64_t)a1);
  v4 = a1[174];
  if (!v4)
    return;
  if (a2 == 2)
  {
    if ((v4 & 0xA) == 0)
      return;
    v7 = (void *)a1[173];
    v8 = 10.0;
    goto LABEL_14;
  }
  if (a2 == 1)
  {
    if ((v4 & 0xA) == 0)
      return;
    v7 = (void *)a1[173];
    v8 = -10.0;
LABEL_14:
    objc_msgSend(v7, "userRequestedSeekWithTimeInterval:", v8);
    return;
  }
  if (a2)
    return;
  objc_msgSend(a1, "player");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rate");
  if (v5 == 0.0)
  {

    return;
  }
  v6 = a1[174];
  if ((v6 & 4) != 0)
  {

  }
  else
  {

    if ((v6 & 2) == 0)
      return;
  }
  v9 = (void *)a1[173];
  objc_msgSend(a1, "_volumeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isMuted") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v10, "volume");
    v12 = v13 <= 0.0;
  }

  objc_msgSend(v9, "updatePlayerVolumeToPlayerMuted:", v12);
}

- (void)_updateSupplementalSubtitlesIfNecessary
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 1392))
    {
      if ((objc_msgSend(*(id *)(a1 + 1384), "smartSubtitlesActive") & 1) != 0
        || (objc_msgSend((id)a1, "playerController"),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            v3 = objc_msgSend(v2, "subtitlesActive"),
            v2,
            (v3 & 1) == 0))
      {
        _AVLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v6 = 136315394;
          v7 = "-[AVPlayerViewController _updateSupplementalSubtitlesIfNecessary]";
          v8 = 2112;
          v9 = a1;
          _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSubtitleBehaviorUserSelectedAndPreferredLanguage subtitles active AVPVC %@", (uint8_t *)&v6, 0x16u);
        }

        objc_msgSend((id)a1, "playerController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setCurrentAssetMediaOption:", 0);

      }
    }
  }
}

void __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v2, "pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

uint64_t __118__AVPlayerViewController_pictureInPictureController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke_622(uint64_t result, int a2)
{
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("NO");
      if (a2)
        v5 = CFSTR("YES");
      v6 = 136315394;
      v7 = "-[AVPlayerViewController pictureInPictureController:restoreUserInterfaceForPictureInPictureStopWithCompletion"
           "Handler:]_block_invoke";
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s PIP restore underway, client reported restore is ready: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 32) + 16))();
  }
  return result;
}

void __76__AVPlayerViewController_pictureInPictureControllerDidStopPictureInPicture___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[210], "setBackgroundColor:", 0);
    WeakRetained = v2;
  }

}

uint64_t __76__AVPlayerViewController_pictureInPictureControllerDidStopPictureInPicture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStopPictureInPicture");
}

void __92__AVPlayerViewController_pictureInPictureController_failedToStartPictureInPictureWithError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[210], "setBackgroundColor:", 0);
    WeakRetained = v2;
  }

}

uint64_t __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 32));
}

void __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[6];
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isPresentingFullScreenFromInline") & 1) != 0
    || objc_msgSend(WeakRetained, "isPresentedFullScreen"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_3;
    v4[3] = &unk_1E5BB1FA8;
    v5 = *(_BYTE *)(a1 + 48);
    v3 = *(_QWORD *)(a1 + 40);
    v4[4] = WeakRetained;
    v4[5] = v3;
    objc_msgSend(WeakRetained, "_transitionFromFullScreenWithReason:animated:completionHandler:", 4, 1, v4);
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __77__AVPlayerViewController_pictureInPictureControllerDidStartPictureInPicture___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackControlsState");
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

void __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1504);
  v3 = a2;
  objc_msgSend(v2, "pictureInPictureViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willStartPictureInPictureWithViewController:", v4);

}

void __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackControlsController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPopoverIsBeingPresented:", 0);

}

void __78__AVPlayerViewController_pictureInPictureControllerWillStartPictureInPicture___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[210];
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", v3);

    WeakRetained = v4;
  }

}

void __84__AVPlayerViewController_transitionController_transitionWillComplete_continueBlock___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (a2)
    {
      objc_msgSend(WeakRetained, "fullScreenViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachContentView");

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v6;
  }

}

void __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  id v19;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((objc_msgSend(v3, "isCancelled") & 1) != 0)
    {
      objc_msgSend(WeakRetained, "volumeAnimator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "restoreVolumeIfNeeded");

      objc_msgSend(WeakRetained, "setVolumeAnimator:", 0);
      objc_msgSend(WeakRetained[142], "reset");
    }
    else
    {
      objc_msgSend(WeakRetained[144], "setWantsAppearanceConfigValues:", 0);
      objc_msgSend(WeakRetained[144], "appearanceProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playbackContentContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActualView:", v8);

      if (*(_BYTE *)(a1 + 56))
      {
        objc_msgSend(WeakRetained, "playerController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        objc_msgSend(WeakRetained, "playerController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if ((v10 & 1) != 0)
          objc_msgSend(v11, "pauseForAllCoordinatedPlaybackParticipants:", 0);
        else
          objc_msgSend(v11, "setPlaying:", 0);

      }
      objc_msgSend(*(id *)(a1 + 32), "_setContentViewOnSelf");
      objc_msgSend(WeakRetained, "_notifyOfMetricsCollectionEvent:", 5);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke_2;
      v17 = &unk_1E5BB45E8;
      v18 = *(id *)(a1 + 40);
      objc_copyWeak(&v19, (id *)(a1 + 48));
      dispatch_async(MEMORY[0x1E0C80D38], &v14);
      objc_destroyWeak(&v19);

    }
    objc_msgSend(WeakRetained[188], "contentSourceVideoRectInWindowChanged", v14, v15, v16, v17);
    objc_msgSend(WeakRetained, "_updatePlaybackControlsState");
    objc_msgSend(WeakRetained, "playbackControlsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlayerViewControllerIsBeingTransitionedWithResizing:", 0);

  }
}

void __81__AVPlayerViewController_transitionController_willBeginDismissingViewController___block_invoke_2(id *a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = a1;
  objc_msgSend(a1[4], "restoreVolumeIfNeeded");
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "setVolumeAnimator:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "pendingRestoreUserInterfaceForPictureInPictureStopHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setPendingRestoreUserInterfaceForPictureInPictureStopHandler:", 0);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

uint64_t __81__AVPlayerViewController_transitionController_willBeginPresentingViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD);

  v3 = a2;
  v4 = objc_msgSend(v3, "isCancelled");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_setContentViewOnSelf");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "setWantsAppearanceConfigValues:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "appearanceProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackContentContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActualView:", v8);

  }
  else
  {
    objc_msgSend(v5, "_notifyOfMetricsCollectionEvent:", 4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1504), "contentSourceVideoRectInWindowChanged");
  objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackControlsState");
  objc_msgSend(*(id *)(a1 + 32), "playbackControlsController");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setPlayerViewControllerIsBeingTransitionedWithResizing:", 0);

  LOBYTE(v9) = objc_msgSend(v3, "isCancelled");
  if ((v9 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setNeedsUpdateOfSupportedInterfaceOrientations");
  objc_msgSend(*(id *)(a1 + 32), "dismissForPIPStartAfterPresentationHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissForPIPStartAfterPresentationHandler");
    v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDismissForPIPStartAfterPresentationHandler:", 0);
    v11[2](v11);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_createPictureInPictureControllerIfNeeded");
}

- (void)_notifyDelegateOfAnalysisCalloutAction
{
  void *v2;
  char v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(a1, "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playerViewControllerWillPerformAnalysisCalloutAction:", a1);

    }
  }
}

- (void)_setupToggleVisualLookupActionIfNeeded
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (a1)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "extendedVisualAnalysisEnabled");

    if (v3)
    {
      objc_initWeak(&location, (id)a1);
      v4 = (void *)MEMORY[0x1E0DC3428];
      AVLocalizedString(CFSTR("OVERFLOW_MENU_VISUAL_LOOKUP"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("info.circle.and.sparkles"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __64__AVPlayerViewController__setupToggleVisualLookupActionIfNeeded__block_invoke;
      v12 = &unk_1E5BB3918;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, &v9);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 1056);
      *(_QWORD *)(a1 + 1056) = v7;

      objc_msgSend(*(id *)(a1 + 1056), "setAttributes:", objc_msgSend(*(id *)(a1 + 1056), "attributes") & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(*(id *)(a1 + 1696), "hasVisualLookupResults", v9, v10, v11, v12) ^ 1);
      objc_msgSend(*(id *)(a1 + 1056), "setState:", *(unsigned __int8 *)(a1 + 1424));
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __64__AVPlayerViewController__setupToggleVisualLookupActionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_visualLookupMenuItemPressedEvent:", 0);

}

uint64_t __80__AVPlayerViewController_visualAnalysisView_prepareForCalloutAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateAnalysisViewSuperview
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackContentContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeContentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisualAnalysisView:", a1[212]);

  }
}

- (uint64_t)_updateVisualAnalysisViewActiveInteractionTypes
{
  uint64_t v1;

  if (result)
  {
    if (*(_QWORD *)(result + 1456) == 1)
      v1 = 30;
    else
      v1 = *(_QWORD *)(result + 1456);
    if ((v1 & 8) != 0 && !*(_BYTE *)(result + 1424))
      v1 &= ~8uLL;
    return objc_msgSend(*(id *)(result + 1696), "setAnalysisTypes:", v1);
  }
  return result;
}

void __109__AVPlayerViewController_controlsViewController_willBeginUpdatingVisibleControlsTo_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[148], "layoutIfNeeded");
    WeakRetained = v2;
  }

}

void __110__AVPlayerViewController__transitionFromFullScreenPresentationToInlineAnimated_interactive_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "interactiveDismissalCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "interactiveDismissalCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, a2, 0);

    objc_msgSend(*(id *)(a1 + 32), "setInteractiveDismissalCompletionHandler:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("AVPlayerViewControllerDidExitFullScreenFromInline"), *(_QWORD *)(a1 + 32));

}

uint64_t __90__AVPlayerViewController__transitionFromFullScreenAnimated_interactive_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __96__AVPlayerViewController__transitionToAttachedFullScreenAnimated_interactive_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008) = 0;
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:](*(_QWORD *)(a1 + 32), 0);
  -[AVPlayerViewController _updateStatusBarGradientViewVisibility](*(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, a2, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("AVPlayerViewControllerDidEnterFullScreenFromInline"), *(_QWORD *)(a1 + 32));

}

void __88__AVPlayerViewController__transitionToFullScreenAnimated_interactive_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackControlsController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPopoverIsBeingPresented:", 0);

}

void __55__AVPlayerViewController_exitFullScreenWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    v9 = 136315650;
    v10 = "-[AVPlayerViewController exitFullScreenWithCompletion:]_block_invoke";
    v12 = "success";
    v11 = 2080;
    if (a2)
      v5 = "YES";
    v13 = 2080;
    v14 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v6, v7);
  }
}

void __56__AVPlayerViewController_enterFullScreenWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    v9 = 136315650;
    v10 = "-[AVPlayerViewController enterFullScreenWithCompletion:]_block_invoke";
    v12 = "success";
    v11 = 2080;
    if (a2)
      v5 = "YES";
    v13 = 2080;
    v14 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v6, v7);
  }
}

void __72__AVPlayerViewController_showFullScreenPresentationFromView_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AVPlayerViewControllerDidEnterFullScreenFromInline"), *(_QWORD *)(a1 + 32));

}

void __60__AVPlayerViewController__handleScrubbingGestureRecognizer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                * 0.9;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_seekForScrubGestureWithVelocity:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    WeakRetained = v3;
    if (fabs(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) <= 0.45)
    {
      objc_msgSend(v3, "_endScrubGestureIfActive");
      WeakRetained = v3;
    }
  }

}

uint64_t __85__AVPlayerViewController__contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentViewWillTransitionToSize:withCoordinator:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __58__AVPlayerViewController__notifyOfMetricsCollectionEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "playerViewController:didCollectMetricsEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __58__AVPlayerViewController__mediaSelectionDoneButtonTapped___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackControlsController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPopoverIsBeingPresented:", 0);

}

uint64_t __71__AVPlayerViewController__isTrackingUserInteractionWithInteractiveView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isTracking");
  else
    v3 = 0;

  return v3;
}

void __49__AVPlayerViewController__defaultInfoViewActions__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "canSeekToBeginning") && !v3[970])
      objc_msgSend(v2, "seekToBeginning:", 0);

    WeakRetained = v3;
  }

}

void __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[145], "setNeedsLayout");
    objc_msgSend(v2[145], "layoutIfNeeded");
    objc_msgSend(v2, "updateVideoBounds");
    WeakRetained = v2;
  }

}

void __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_2(uint64_t a1, char a2)
{
  id *WeakRetained;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if ((a2 & 1) != 0)
      objc_msgSend(WeakRetained, "_updatePlayerLayerLegibleContentInsetsIfNeeded");
    else
      objc_msgSend(WeakRetained[145], "setNeedsLayout");
    -[AVPlayerViewController _updateGesturesEnablementStates]((uint64_t)v4);
    objc_msgSend(v4, "updateVideoBounds");
    WeakRetained = v4;
  }

}

void __101__AVPlayerViewController__chromelessControlsViewController_willBeginContentTabTransitionWithContext___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlayerLayerLegibleContentInsetsIfNeeded");

  v3 = objc_loadWeakRetained(v1);
  -[AVPlayerViewController _updateGesturesEnablementStates]((uint64_t)v3);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "updateVideoBounds");

}

void __57__AVPlayerViewController__updateNowPlayingInfoController__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "playerController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_wantsNowPlayingInfoCenter:", 1))
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 40));

      if (v6 == v7)
      {
        objc_storeStrong(v5 + 136, a2);
        objc_msgSend(v8, "startNowPlayingUpdatesForPlayerController:afterDelay:", v6, 1.0);
        -[AVPlayerViewController _updateNowPlayingInfoControllerSuspendedState](v5);
      }
    }

  }
}

- (id)_updateNowPlayingInfoControllerSuspendedState
{
  id *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isScrubbing");

    return (id *)objc_msgSend(v1[136], "setSuspended:", v3);
  }
  return result;
}

void __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  char v9;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke_2;
  v7 = &unk_1E5BB4CC8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v9 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], &v4);
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
}

void __69__AVPlayerViewController__updateSecondScreenConnectionReadyToConnect__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
      v3 = 0;
    else
      v3 = objc_msgSend(WeakRetained, "_isReadyToConnectSynchronousChecks");
    objc_msgSend(v4, "_setSecondScreenConnectionReadyToConnect:", v3);
    objc_msgSend(v4, "setIsUpdatingSecondScreenConnectionReadyToConnect:", 0);
    WeakRetained = v4;
  }

}

- (void)_updateSmartSubtitlesEnablementIfNeeded
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "playerController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "externalPlaybackType") == 1)
    {
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315138;
        v5 = "-[AVPlayerViewController _updateSmartSubtitlesEnablementIfNeeded]";
        _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s Airplay is active disable automatic subtitles", (uint8_t *)&v4, 0xCu);
      }

      objc_msgSend(a1[173], "userRequestedSmartSubtitlesHiddenIfActive");
    }
    else
    {
      -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](a1, 0);
    }

  }
}

void __39__AVPlayerViewController__addObservers__block_invoke_17(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  -[AVPlayerViewController _updateAnalysisButtonBottomInsetIfNeeded](v2);
  objc_msgSend(v2, "updateVideoBounds");

}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateVideoBounds");
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePlayerLayerLegibleContentInsetsIfNeeded");
}

void __39__AVPlayerViewController__addObservers__block_invoke_11(uint64_t a1, void *a2)
{
  id *v2;

  v2 = a2;
  -[AVPlayerViewController _updateNowPlayingInfoControllerSuspendedState](v2);
  objc_msgSend(v2, "_updateViewControllerPreferencesIfNeeded");

}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateSecondScreenConnectionReadyToConnect");
}

void __39__AVPlayerViewController__addObservers__block_invoke_8_377(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "requiresLinearPlayback"))
    objc_msgSend(v2, "_updateDefaultLinearPlaybackRateIfNeeded");
  else
    objc_msgSend(v2, "_updateActivePlaybackSpeedIfNeeded");

}

void __39__AVPlayerViewController__addObservers__block_invoke_7_373(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateUnsupportedContentIndicatorView");
  objc_msgSend(v2, "_updateAudioOnlyIndicatorView");
  objc_msgSend(v2, "_updatePlaybackBeganAfterPlayerControllerBecameReadyToPlayIfNeeded");
  -[AVPlayerViewController _updateSecondGenerationContentTabsGestureEnablementState]((id *)v2);

}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_6_370(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateAudioOnlyIndicatorView");
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke_5_362(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateExternalPlaybackIndicatorView");
}

void __39__AVPlayerViewController__addObservers__block_invoke_4_358(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateExternalPlaybackIndicatorView");
  -[AVPlayerViewController _updateSmartSubtitlesEnablementIfNeeded]((id *)v2);
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)v2);
  objc_msgSend(v2, "_updateSecondScreenConnectionReadyToConnect");

}

void __39__AVPlayerViewController__addObservers__block_invoke_3_356(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updateExternalPlaybackIndicatorView");
  -[AVPlayerViewController _updateVisualAnalyzerEnabledStateIfNeeded]((uint64_t)v2);
  objc_msgSend(v2, "_updateSecondScreenConnectionReadyToConnect");
  objc_msgSend(v2, "_updateContentViewEdgeInsetsForLetterboxedContent");
  -[AVPlayerViewController _updateControlsVisibilityPolicyAnimated:]((uint64_t)v2, 1);

}

void __39__AVPlayerViewController__addObservers__block_invoke_2_352(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackContentContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "visualAnalysisView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isHidden") & 1) == 0)
    objc_msgSend(v4, "setNeedsLayout");
  objc_msgSend(v7, "_updateContentViewEdgeInsetsForLetterboxedContent");
  objc_msgSend(v2, "setNeedsLayout");

}

void __39__AVPlayerViewController__addObservers__block_invoke_348(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6 || !objc_msgSend(v9, "exitsFullScreenWhenPlaybackEnds"))
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v9, "_isTrackingUserInteraction");

  v8 = v9;
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v9, "_transitionFromFullScreenAnimated:completionHandler:", 1, 0);
LABEL_6:
    v8 = v9;
  }

}

void __39__AVPlayerViewController__addObservers__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD *v9;

  v9 = a2;
  v5 = a4;
  objc_msgSend(v5, "oldValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v8, "BOOLValue");
  if (v7 != (_DWORD)v5)
    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v9, 0);

}

void __39__AVPlayerViewController__addObservers__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;

  v8 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_volumeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    -[AVPlayerViewController _updatePlayerControllerLegibleOptionsForSmartSubtitleDisplayType:](v8, 0);

}

- (void)_updateInfoTabViewControllerPreferredContentSizeIfNeededToFitSize:(double)a3
{
  void *v6;
  int v7;
  void *v8;

  if (a1)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isTVApp");

    if (v7)
    {
      v8 = *(void **)(a1 + 1712);
      if (v8)
        objc_msgSend(v8, "setPreferredContentSize:", a2, dbl_1AC5F8220[a2 > a3]);
    }
  }
}

uint64_t __39__AVPlayerViewController__addObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateExternalPlaybackIndicatorView");
}

void __54__AVPlayerViewController__didEndPlayingOnSecondScreen__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackContentContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayingOnSecondScreen:", 0);

  objc_msgSend(v4, "setPlayingOnSecondScreen:", 0);
  objc_msgSend(v2, "addPlaybackContentContainerViewIfNeeded");

}

void __37__AVPlayerViewController_keyCommands__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v15 = a2;
  v16 = a7;
  v17 = a8;
  objc_msgSend(*(id *)(a1 + 32), "_localizedDiscoverabilityTitleForKeyCommandLocalizationKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:upAction:discoverabilityTitle:", v15, a3, a5, a6, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v15, a3, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDiscoverabilityTitle:", v19);
    }
    objc_msgSend(v20, "setWantsPriorityOverSystemBehavior:", a4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __37__AVPlayerViewController_keyCommands__block_invoke_2;
    v21[3] = &unk_1E5BB1988;
    objc_copyWeak(&v23, &location);
    v22 = v16;
    AVAsynchronousLocalizedString(v22, v17, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

void __37__AVPlayerViewController_keyCommands__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_localizedDiscoverabilityTitleForKeyCommandLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

}

uint64_t __41__AVPlayerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerPreferencesIfNeeded");
}

uint64_t __41__AVPlayerViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateViewControllerPreferencesIfNeeded");
}

void __34__AVPlayerViewController_loadView__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[16];

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Expected only one context for AVPlayerViewControllerBehaviorContext. This is fine, but probably means AVPlayerViewControllerBehaviorContext needs to be refactored", v15, 2u);
    }

  }
  objc_msgSend(v3, "makePlaybackContentContainerWithFrame:activeContentView:", a1[4], *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  if (v9)
  {
    v10 = v9;
    v11 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v10;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "activeContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerLayerView");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __34__AVPlayerViewController_loadView__block_invoke_219(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "overrideUserInterfaceStyle");

  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", v3);
}

- (id)_setUpEnhanceDialogueControllerIfNeeded
{
  id *v1;
  AVEnhanceDialogueController *v2;
  id v3;
  id v4;
  void *v5;

  if (!result[143])
  {
    v1 = result;
    v2 = objc_alloc_init(AVEnhanceDialogueController);
    v3 = v1[143];
    v1[143] = v2;

    v4 = v1[143];
    objc_msgSend(v1, "playerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayerController:", v5);

    return -[AVPlayerViewController _updateEnhanceDialogueEnabled](v1);
  }
  return result;
}

- (id)_updateEnhanceDialogueEnabled
{
  id *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(result, "showsPlaybackControls")
      && objc_msgSend(v1, "playbackControlsIncludeTransportControls"))
    {
      v2 = objc_msgSend(v1, "showsAudioLanguageMenu");
    }
    else
    {
      v2 = 0;
    }
    return (id *)objc_msgSend(v1[143], "setEnabled:", v2);
  }
  return result;
}

uint64_t __46__AVPlayerViewController__performInitialSetup__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "viewDidLoad");
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_7(uint64_t a1, void *a2)
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__AVPlayerViewController__performInitialSetup__block_invoke_8;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_8(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1009] = 0;
    v2 = WeakRetained;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_5(uint64_t a1, void *a2)
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__AVPlayerViewController__performInitialSetup__block_invoke_6;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_6(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1009] = 0;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)WeakRetained);
    objc_msgSend(WeakRetained, "_createPictureInPictureControllerIfNeeded");
  }

}

void __46__AVPlayerViewController__performInitialSetup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  int v7;
  id *v8;

  v8 = a2;
  v5 = v8[135];
  objc_msgSend(a4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    if (objc_msgSend(v5, "isActive"))
      objc_msgSend(v8, "_didBeginPlayingOnSecondScreen");
    else
      objc_msgSend(v8, "_didEndPlayingOnSecondScreen");
  }

}

uint64_t __46__AVPlayerViewController__performInitialSetup__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "viewDidLoad");
}

void __46__AVPlayerViewController__performInitialSetup__block_invoke(uint64_t a1, void *a2)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v2 = objc_msgSend(v8, "_hasBegunObservation");
  v3 = v8;
  if ((v2 & 1) == 0)
  {
    objc_msgSend(v8, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasContent") & 1) == 0)
    {
      objc_msgSend(v8, "playerController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "status") != 1)
      {
        objc_msgSend(v8, "playerController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "status");

        v3 = v8;
        if (v7 != 2)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
    v3 = v8;
LABEL_6:
    objc_msgSend(v3, "_addObservers");
    v3 = v8;
  }
LABEL_7:

}

void __45__AVPlayerViewController_setInfoViewActions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performWithSender:target:", v3, 0);

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AVPlayerViewController_setInfoViewActions___block_invoke_2;
    block[3] = &unk_1E5BB4CA0;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __45__AVPlayerViewController_setInfoViewActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissCustomInfoViewControllerAnimated:", 1);
}

void __72__AVPlayerViewController_setOverrideParentApplicationDisplayIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(v4, "setOverrideParentApplicationDisplayIdentifier:", *(_QWORD *)(a1 + 32));

}

void __46__AVPlayerViewController_setPlayerController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "playerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pipActivitySessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPictureInPictureActivitySessionIdentifier:", v3);

}

- (void)_updatePrefersFullScreenStyleForEmbeddedMode
{
  id v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 1168), "controlsViewControllerIfChromeless");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPrefersFullScreenStyleForEmbeddedMode:", objc_msgSend(*(id *)(a1 + 1448), "prefersFullScreenStyleForEmbeddedMode"));

  }
}

void __40__AVPlayerViewController_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)v2 + 1009) = 1;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)v2);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerViewController_initWithCoder___block_invoke_4;
  block[3] = &unk_1E5BB4CA0;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __40__AVPlayerViewController_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v2;
  _BYTE *v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  -[AVPlayerViewController _avkitWillBeginPresentationTransition](v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVPlayerViewController_initWithCoder___block_invoke_2;
  block[3] = &unk_1E5BB4CA0;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_avkitWillBeginPresentationTransition
{
  id v2;

  if (a1)
  {
    objc_msgSend(a1, "controlsViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "autoHideInterval");
    objc_msgSend(v2, "flashControlsWithDuration:");
    a1[1009] = 1;
    -[AVPlayerViewController _updateStatusBarGradientViewVisibility]((uint64_t)a1);

  }
}

void __40__AVPlayerViewController_initWithCoder___block_invoke_2(uint64_t a1)
{
  -[AVPlayerViewController _avkitDidBeginPresentationTransition](*(_QWORD **)(a1 + 32));
}

- (void)_avkitDidBeginPresentationTransition
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    if (a1[169] == 2
      || (objc_msgSend(a1, "transitioningDelegate"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(a1, "_transitionController"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v2,
          v2 != v3))
    {
      objc_msgSend(a1, "_transitionController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ensurePresentationControllerWithPresentingViewController:presentedViewController:", v4, a1);

    }
  }
}

void __33__AVPlayerViewController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __49__AVPlayerViewController_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v2;
  _QWORD v3[4];
  id v4;
  id location;

  v2 = a2;
  -[AVPlayerViewController _avkitWillBeginPresentationTransition](v2);
  objc_initWeak(&location, v2);

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__AVPlayerViewController_initWithNibName_bundle___block_invoke_2;
  v3[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__AVPlayerViewController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[AVPlayerViewController _avkitDidBeginPresentationTransition](WeakRetained);
    WeakRetained = v2;
  }

}

+ (id)keyPathsForValuesAffectingVideoGravity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("playerLayerView.videoGravity"));
}

+ (id)keyPathsForValuesAffectingVideoDisplaySize
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E5BF3F78);
}

+ (id)keyPathsForValuesAffectingSpeeds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playbackSpeedCollection.speeds"), 0);
}

+ (id)keyPathsForValuesAffectingSelectedSpeed
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playbackSpeedCollection.selectedSpeed"), 0);
}

+ (id)keyPathsForValuesAffectingPixelBufferAttributes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_playerLayerView.pixelBufferAttributes"));
}

+ (id)keyPathsForValuesAffectingPictureInPictureActive
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("pictureInPictureController.pictureInPictureActive"));
}

+ (id)keyPathsForValuesAffectingTransportBarCustomMenuItems
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("playbackControlsController.transportBarCustomMenuItems"));
}

+ (id)keyPathsForValuesAffectingToggleLookupAction
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("analysisView.hasVisualLookupResults"));
}

+ (id)keyPathsForValuesAffectingAnalysisInteractionInProgress
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("analysisView.interactionInProgress"));
}

- (double)defaultPlaybackRate
{
  void *v2;
  double v3;
  double v4;

  -[AVPlayerViewController playerController](self, "playerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultPlaybackRate");
  v4 = v3;

  return v4;
}

- (void)setEntersFullScreenWhenTapped:(BOOL)a3
{
  _BOOL8 v3;
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
    v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setEntersFullScreenWhenTapped:]";
    v10 = "entersFullScreenWhenTapped";
    v9 = 2080;
    if (v3)
      v6 = "YES";
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  -[AVPlayerViewController setShowsMinimalPlaybackControlsWhenEmbeddedInline:](self, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", v3);
}

- (BOOL)playbackControlsIncludeTransportControls
{
  return self->_playbackControlsIncludeTransportControls;
}

- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3
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
  if (self->_playbackControlsIncludeTransportControls != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPlaybackControlsIncludeTransportControls:]";
      v10 = "playbackControlsIncludeTransportControls";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsIncludeTransportControls = v3;
    -[AVPlayerViewController _updateIncludedControls](self, "_updateIncludedControls");
    -[AVPlayerViewController _updateEnhanceDialogueEnabled]((id *)&self->super.super.super.isa);
  }
}

- (BOOL)playbackControlsIncludeDisplayModeControls
{
  return self->_playbackControlsIncludeDisplayModeControls;
}

- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3
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
  if (self->_playbackControlsIncludeDisplayModeControls != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController(DeprecationsAndToBeRemoved) setPlaybackControlsIncludeDisplayModeControls:]";
      v10 = "playbackControlsIncludeDisplayModeControls";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsIncludeDisplayModeControls = v3;
    -[AVPlayerViewController _updateIncludedControls](self, "_updateIncludedControls");
  }
}

- (BOOL)playbackControlsIncludeVolumeControls
{
  return self->_playbackControlsIncludeVolumeControls;
}

- (AVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v4;
  AVPlayerViewController *v5;
  AVPlayerViewController *v6;
  uint64_t v7;
  AVRoutingConfiguration *routingConfiguration;
  uint64_t v9;
  AVPlayerViewControllerConfiguration *configuration;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  NSArray *infoViewActions;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AVPlayerViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    -[AVPlayerViewController setWasInitializedUsingWebKitSPI:](v5, "setWasInitializedUsingWebKitSPI:", 1);
    -[AVPlayerViewController setCanDisplayContentInDetachedWindow:](v6, "setCanDisplayContentInDetachedWindow:", 0);
    -[AVPlayerViewController setPlayerLayerView:](v6, "setPlayerLayerView:", v4);
    +[AVRoutingConfiguration defaultConfiguration](AVRoutingConfiguration, "defaultConfiguration");
    v7 = objc_claimAutoreleasedReturnValue();
    routingConfiguration = v6->_routingConfiguration;
    v6->_routingConfiguration = (AVRoutingConfiguration *)v7;

    +[AVPlayerViewControllerConfiguration defaultConfiguration](AVPlayerViewControllerConfiguration, "defaultConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    configuration = v6->_configuration;
    v6->_configuration = (AVPlayerViewControllerConfiguration *)v9;

    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "quickLookModernPlayerControlsEnabled");

    if (v12)
    {
      -[AVPlayerViewController setPrefersDeviceUserInterfaceStyle:](v6, "setPrefersDeviceUserInterfaceStyle:", 1);
      -[AVPlayerViewControllerConfiguration setPrefersFullScreenStyleForEmbeddedMode:](v6->_configuration, "setPrefersFullScreenStyleForEmbeddedMode:", 1);
    }
    v6->_canIncludePlaybackControlsWhenInline = 0;
    v6->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = 1;
    v6->_showsAnalysisButtonIfAvailable = 1;
    v6->_allowInfoMetadataSubpanel = 1;
    v6->_playbackControlsIncludeTransportControls = 1;
    v6->_playbackControlsIncludeDisplayModeControls = 1;
    v6->_playbackControlsIncludeVolumeControls = 1;
    v6->_controlsGeneration = objc_msgSend((id)objc_opt_class(), "usesSecondGenerationControls");
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_allowsVideoFrameAnalysis = objc_msgSend(v13, "visualAnalysisEnabled");

    v6->_videoFrameAnalysisTypes = 0;
    -[AVPlayerViewController _defaultInfoViewActions](v6, "_defaultInfoViewActions");
    v14 = objc_claimAutoreleasedReturnValue();
    infoViewActions = v6->_infoViewActions;
    v6->_infoViewActions = (NSArray *)v14;

    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "extendedVisualAnalysisEnabled");

    if (v17)
      v18 = 1;
    else
      v18 = 2;
    v6->_videoFrameAnalysisTypes = v18;
    _AVLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      v22 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) initWithPlayerLayerView:]";
      v23 = 1024;
      v24 = 8647;
      _os_log_impl(&dword_1AC4B1000, v19, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v21, 0x12u);
    }

  }
  return v6;
}

- (BOOL)showsExitFullScreenButton
{
  return 0;
}

- (BOOL)playbackControlsShouldControlSystemVolume
{
  return self->_playbackControlsShouldControlSystemVolume;
}

- (void)setPlaybackControlsShouldControlSystemVolume:(BOOL)a3
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
  if (self->_playbackControlsShouldControlSystemVolume != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) setPlaybackControlsShouldControlSystemVolume:]";
      v10 = "playbackControlsShouldControlSystemVolume";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_playbackControlsShouldControlSystemVolume = v3;
    -[AVPlayerViewController _updateVolumeController](self, "_updateVolumeController");
    -[AVMobileControlsViewController setVolumeController:](self->_controlsViewController, "setVolumeController:", self->_volumeController);
  }
}

- (void)enterFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  AVPlayerViewController *v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) enterFullScreenAnimated:completionHandler:]";
    v31 = 1024;
    v32 = 8678;
    v33 = 2048;
    v34 = self;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  if (-[AVPlayerViewController isViewLoaded](self, "isViewLoaded")
    && (-[AVPlayerViewController view](self, "view"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "superview"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    -[AVPlayerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "needsLayout");

    if (!v12)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __103__AVPlayerViewController_AVPlayerViewController_WebKitOnly__enterFullScreenAnimated_completionHandler___block_invoke;
      v23[3] = &unk_1E5BB1E58;
      v24 = v6;
      -[AVPlayerViewController _transitionToFullScreenAnimated:interactive:completionHandler:](self, "_transitionToFullScreenAnimated:interactive:completionHandler:", v4, 0, v23);
      v15 = v24;
      goto LABEL_12;
    }
    if (v6)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)MEMORY[0x1E0CB3940];
      _AVMethodProem(self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("View may not need layout when you call %@!"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v16;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v28;
      v19 = &v27;
LABEL_10:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("AVKitErrorDomain"), 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v22);

LABEL_12:
    }
  }
  else if (v6)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    _AVMethodProem(self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("View needs to be loaded before you can call %@!"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v16;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v26;
    v19 = &v25;
    goto LABEL_10;
  }

}

- (void)exitFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD);
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(id, _QWORD, void *);
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  AVPlayerViewController *v39;
  uint64_t v40;

  v4 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v35 = "-[AVPlayerViewController(AVPlayerViewController_WebKitOnly) exitFullScreenAnimated:completionHandler:]";
    v36 = 1024;
    v37 = 8705;
    v38 = 2048;
    v39 = self;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  -[AVPlayerViewController finishPreparingForInteractiveDismissalHandler](self, "finishPreparingForInteractiveDismissalHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void (**)(_QWORD))objc_msgSend(v8, "copy");

  -[AVPlayerViewController setFinishPreparingForInteractiveDismissalHandler:](self, "setFinishPreparingForInteractiveDismissalHandler:", 0);
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isBeingDismissed");

  if (v11 && v9)
  {
    -[AVPlayerViewController setInteractiveDismissalCompletionHandler:](self, "setInteractiveDismissalCompletionHandler:", v6);
    v9[2](v9);
    goto LABEL_18;
  }
  if (!-[AVPlayerViewController isViewLoaded](self, "isViewLoaded"))
    goto LABEL_15;
  -[AVPlayerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 && !-[AVPlayerViewController isPresentingDetachedFullScreen](self, "isPresentingDetachedFullScreen"))
  {

    goto LABEL_15;
  }
  v14 = -[AVPlayerViewController isPresentingFullScreenFromInline](self, "isPresentingFullScreenFromInline");

  if (!v14)
  {
LABEL_15:
    if (!v6)
      goto LABEL_18;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v25 = (void *)MEMORY[0x1E0CB3940];
    _AVMethodProem(self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("View needs to be loaded before you can call %@!"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v31;
    v24 = &v30;
LABEL_17:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("AVKitErrorDomain"), 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v27);

    goto LABEL_18;
  }
  -[AVPlayerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "needsLayout");

  if (!v17)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __102__AVPlayerViewController_AVPlayerViewController_WebKitOnly__exitFullScreenAnimated_completionHandler___block_invoke;
    v28[3] = &unk_1E5BB1E58;
    v29 = v6;
    -[AVPlayerViewController _transitionFromFullScreenAnimated:completionHandler:](self, "_transitionFromFullScreenAnimated:completionHandler:", v4, v28);

    goto LABEL_18;
  }
  if (v6)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v19 = (void *)MEMORY[0x1E0CB3940];
    _AVMethodProem(self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("View may not need layout when you call %@!"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v21;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v33;
    v24 = &v32;
    goto LABEL_17;
  }
LABEL_18:

}

- (void)startPictureInPicture
{
  -[AVPictureInPictureController startPictureInPicture](self->_pictureInPictureController, "startPictureInPicture");
}

- (void)stopPictureInPicture
{
  -[AVPictureInPictureController stopPictureInPictureEvenWhenInBackground](self->_pictureInPictureController, "stopPictureInPictureEvenWhenInBackground");
}

- (BOOL)isPictureInPictureSuspended
{
  return -[AVPictureInPictureController isPictureInPictureSuspended](self->_pictureInPictureController, "isPictureInPictureSuspended");
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  return -[AVPictureInPictureController pictureInPictureWasStartedWhenEnteringBackground](self->_pictureInPictureController, "pictureInPictureWasStartedWhenEnteringBackground");
}

- (void)setWebKitOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  AVRoutingConfiguration *v5;
  AVRoutingConfiguration *routingConfiguration;

  +[AVRoutingConfiguration configurationWithOutputContextID:sharingPolicy:](AVRoutingConfiguration, "configurationWithOutputContextID:sharingPolicy:", a4, a3);
  v5 = (AVRoutingConfiguration *)objc_claimAutoreleasedReturnValue();
  routingConfiguration = self->_routingConfiguration;
  self->_routingConfiguration = v5;

  -[AVMobileControlsViewController setRoutingConfiguration:](self->_controlsViewController, "setRoutingConfiguration:", self->_routingConfiguration);
}

uint64_t __102__AVPlayerViewController_AVPlayerViewController_WebKitOnly__exitFullScreenAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __103__AVPlayerViewController_AVPlayerViewController_WebKitOnly__enterFullScreenAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)canToggleVideoGravityWhenEmbeddedInline
{
  return self->_canToggleVideoGravityWhenEmbeddedInline;
}

- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  CGAffineTransform *p_overrideTransformForProminentPlayButton;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform t1;

  p_overrideTransformForProminentPlayButton = &self->_overrideTransformForProminentPlayButton;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_overrideTransformForProminentPlayButton->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_overrideTransformForProminentPlayButton->tx = v9;
    *(_OWORD *)&p_overrideTransformForProminentPlayButton->a = v8;
    -[AVPlayerViewController _chromeControlsViewController](self, "_chromeControlsViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&p_overrideTransformForProminentPlayButton->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_overrideTransformForProminentPlayButton->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_overrideTransformForProminentPlayButton->tx;
    objc_msgSend(v10, "setTransformForProminentPlayButton:", &t1);

  }
}

- (UIView)iAdPrerollView
{
  void *v2;
  void *v3;

  -[AVPlayerViewController contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iAdPreRollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)canDisplayContentInDetachedWindow
{
  return self->_canDisplayContentInDetachedWindow;
}

- (void)setCanDisplayContentInDetachedWindow:(BOOL)a3
{
  self->_canDisplayContentInDetachedWindow = a3;
}

- (BOOL)isPresentingDetachedFullScreen
{
  return 0;
}

- (BOOL)isPresentingFullWindow
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v3 = -[AVPlayerViewController _showsWolfControls](self, "_showsWolfControls");
  if (v3)
  {
    -[AVPlayerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVPlayerViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[AVPlayerViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "convertRect:fromView:", v17, v10, v12, v14, v16);

      UIPointRoundToScale();
      UISizeRoundToScale();
      v19 = v18;
      v21 = v20;
      -[AVPlayerViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      v27 = v26;

      LOBYTE(v3) = v21 == v27 && v19 == v25;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)setCanShowPictureInPictureButton:(BOOL)a3
{
  if (self->_canShowPictureInPictureButton != a3)
  {
    self->_canShowPictureInPictureButton = a3;
    -[AVPlayerViewController _updatePlaybackControlsState](self, "_updatePlaybackControlsState");
  }
}

- (BOOL)canShowPictureInPictureButton
{
  return self->_canShowPictureInPictureButton;
}

- (void)activeContentViewDidChange
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
  id v14;

  -[AVPlayerViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackContentContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerLayerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videoGravity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController setVideoGravity:](self, "setVideoGravity:", v8);

  -[AVPlayerViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playbackContentContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playerLayerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController setPlayerLayerView:](self, "setPlayerLayerView:", v12);

  -[__AVPlayerLayerView playerLayer](self->_playerLayerView, "playerLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController setPlayer:](self, "setPlayer:", v13);

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
      v8 = "-[AVPlayerViewController(AVPlayerViewControllerInternal) setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:]";
      v10 = "canStartPictureInPictureAutomaticallyWhenEnteringBackground";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    -[AVPlayerViewController _updatePiPControllerCanStartAutomaticallyWhenEnteringBackground](self, "_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground");
  }
}

- (int64_t)controlsGeneration
{
  return self->_controlsGeneration;
}

- (void)doneButtonTapped:(id)a3
{
  -[AVPlayerViewController exitFullscreen:](self, "exitFullscreen:", self);
}

- (void)videoGravityButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  AVPlayerViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) videoGravityButtonTapped:]";
    v17 = 1024;
    v18 = 8925;
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v15, 0x1Cu);
  }

  -[AVPlayerViewController videoGravity](self, "videoGravity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C8A6D8];
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8A6D8]);
  v8 = (void *)*MEMORY[0x1E0C8A6E0];
  if (!v7)
    v8 = v6;
  v9 = v8;
  -[AVPlayerViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12)
  {
    -[AVPlayerViewController contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerViewController setVideoGravity:forLayoutClass:](self, "setVideoGravity:forLayoutClass:", v9, objc_msgSend(v14, "unsignedIntegerValue"));

  }
}

- (void)togglePlayback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController _playPauseButtonWasPressedEvent:](self, "_playPauseButtonWasPressedEvent:", v4);
  -[AVPlayerViewController playerController](self, "playerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "togglePlayback:", v4);

}

- (void)mediaSelectionButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  AVMediaSelectionViewController *v6;
  void *v7;
  AVMediaSelectionViewController *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  AVPlayerViewController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315650;
    v22 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) mediaSelectionButtonTapped:]";
    v23 = 1024;
    v24 = 8944;
    v25 = 2048;
    v26 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v21, 0x1Cu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = [AVMediaSelectionViewController alloc];
    -[AVPlayerViewController playerController](self, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVMediaSelectionViewController initWithPlayerController:doneButtonTarget:doneButtonAction:](v6, "initWithPlayerController:doneButtonTarget:doneButtonAction:", v7, self, sel__mediaSelectionDoneButtonTapped_);

    -[AVMediaSelectionViewController popoverPresentationController](v8, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_mediaSelectionPopoverPresentationController, v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setBackgroundColor:", v11);

    v12 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    objc_msgSend(v12, "setDelegate:", self);

    v13 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    objc_msgSend(v13, "setPermittedArrowDirections:", 15);

    v14 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    objc_msgSend(v4, "bounds");
    objc_msgSend(v14, "setSourceRect:");

    v15 = objc_loadWeakRetained((id *)&self->_mediaSelectionPopoverPresentationController);
    objc_msgSend(v15, "setSourceView:", v4);

    -[AVPlayerViewController parentViewController](self, "parentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[AVMediaSelectionViewController _setIgnoreAppSupportedOrientations:](v8, "_setIgnoreAppSupportedOrientations:", 0);
    }
    else
    {
      -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMediaSelectionViewController _setIgnoreAppSupportedOrientations:](v8, "_setIgnoreAppSupportedOrientations:", v17 == 0);

    }
    -[AVMediaSelectionViewController mediaSelectionTableViewController](v8, "mediaSelectionTableViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setIgnoreAppSupportedOrientations:", -[AVMediaSelectionViewController _ignoreAppSupportedOrientations](v8, "_ignoreAppSupportedOrientations"));

    -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPopoverIsBeingPresented:", 1);

    -[AVPlayerViewController _activeViewControllerForContentView](self, "_activeViewControllerForContentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (void)enterFullScreen:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVPlayerViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) enterFullScreen:]";
    v7 = 1024;
    v8 = 8966;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v5, 0x1Cu);
  }

  -[AVPlayerViewController _transitionToFullScreenAnimated:interactive:completionHandler:](self, "_transitionToFullScreenAnimated:interactive:completionHandler:", 1, 0, 0);
}

- (void)pictureInPictureButtonTapped:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVPlayerViewController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) pictureInPictureButtonTapped:]";
    v7 = 1024;
    v8 = 8982;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v5, 0x1Cu);
  }

  -[AVPlayerViewController _togglePictureInPicture](self, "_togglePictureInPicture");
}

- (void)toggleMuted:(id)a3
{
  id v4;

  -[AVPlayerViewController _volumeButtonWasPressedEvent:](self, "_volumeButtonWasPressedEvent:", a3);
  -[AVPlayerViewController playbackControlsController](self, "playbackControlsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleMuted");

}

- (void)exitFullscreen:(id)a3
{
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  _BOOL4 v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVPlayerViewController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[AVPlayerViewController(AVPlaybackControlsViewControllerActions) exitFullscreen:]";
    v14 = 1024;
    v15 = 8995;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke;
  v10[3] = &unk_1E5BB4688;
  objc_copyWeak(&v11, (id *)buf);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF43E9B8](v10);
  -[AVPlayerViewController fullScreenViewController](self, "fullScreenViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    -[AVPlayerViewController player](self, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:](AVDismissalExpanseCoordinator, "coordinateDismissalWithExpanseSessionForPlayer:cancellable:dismissalBlock:", v9, 1, v6);

  }
  else
  {
    v6[2](v6, 0);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  _BYTE *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && (a2 & 1) == 0)
  {
    WeakRetained[1004] = 1;
    objc_msgSend(WeakRetained, "_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground");
    objc_msgSend(v5, "_transitionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      v9 = objc_msgSend(v5, "isPresentingDetachedFullScreen");

      if ((v9 & 1) == 0)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_3;
        v11[3] = &unk_1E5BB2080;
        v10 = &v12;
        objc_copyWeak(&v12, v3);
        objc_msgSend(v5, "_transitionFromFullScreenAnimated:completionHandler:", 1, v11);
        goto LABEL_7;
      }
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_2;
    v13[3] = &unk_1E5BB2080;
    v10 = &v14;
    objc_copyWeak(&v14, v3);
    objc_msgSend(v5, "_transitionFromFullScreenWithReason:animated:completionHandler:", 0, 1, v13);
LABEL_7:
    objc_destroyWeak(v10);
  }

}

void __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1004] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground");
    WeakRetained = v2;
  }

}

void __82__AVPlayerViewController_AVPlaybackControlsViewControllerActions__exitFullscreen___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1004] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updatePiPControllerCanStartAutomaticallyWhenEnteringBackground");
    WeakRetained = v2;
  }

}

+ (id)keyPathsForValuesAffectingPictureInPicturePossible
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("pictureInPictureController.pictureInPicturePossible"));
}

+ (id)keyPathsForValuesAffectingPictureInPictureSuspended
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("pictureInPictureController.pictureInPictureSuspended"));
}

+ (id)keyPathsForValuesAffectingPictureInPictureWasStartedWhenEnteringBackground
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("pictureInPictureController.pictureInPictureWasStartedWhenEnteringBackground"));
}

+ (void)setUsesSecondGenerationControls:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(a1, "usesSecondGenerationControls") != a3)
  {
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSecondGenerationPlayerEnabled:", v3);

  }
}

- (int64_t)activeContentTransitionType
{
  void *v2;
  int64_t v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeContentTransitionType");

  return v3;
}

- (void)setCustomContentTransitioningInfoPanel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomContentTransitioningInfoPanel:", v4);

}

- (BOOL)isStartPreviousContentTransitionButtonEnabled
{
  void *v2;
  char v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStartPreviousContentTransitionButtonEnabled");

  return v3;
}

- (void)setStartPreviousContentTransitionButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartPreviousContentTransitionButtonEnabled:", v3);

}

- (BOOL)isStartNextContentTransitionButtonEnabled
{
  void *v2;
  char v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStartNextContentTransitionButtonEnabled");

  return v3;
}

- (void)setStartNextContentTransitionButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartNextContentTransitionButtonEnabled:", v3);

}

- (UIView)contentTransitioningOverlayView
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentTransitioningOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isContentTransitionInteractive
{
  void *v2;
  char v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentTransitionInteractive");

  return v3;
}

- (AVPlayer)contentTransitioningPlayer
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentTransitioningPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayer *)v3;
}

- (AVPlayerViewControllerContentTransitioning_NewsOnly)contentTransitioningDelegate
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _newsWidgetPlayerLegacyBehavior](self, "_newsWidgetPlayerLegacyBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayerViewControllerContentTransitioning_NewsOnly *)v3;
}

- (void)setContentTransitioningDelegate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  AVNewsWidgetPlayerLegacyBehavior *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVPlayerViewController contentTransitioningDelegate](self, "contentTransitioningDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[AVPlayerViewController(AVPlayerViewController_NewsOnly) setContentTransitioningDelegate:]";
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
    }

    -[AVPlayerViewController _newsWidgetPlayerLegacyBehavior](self, "_newsWidgetPlayerLegacyBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[AVPlayerViewController removeBehavior:](self, "removeBehavior:", v7);
    if (v4)
    {
      v8 = objc_alloc_init(AVNewsWidgetPlayerLegacyBehavior);
      -[AVPlayerViewController addBehavior:](self, "addBehavior:", v8);

      -[AVPlayerViewController _newsWidgetPlayerLegacyBehavior](self, "_newsWidgetPlayerLegacyBehavior");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLegacyDelegate:", v4);

    }
  }

}

- (void)startContentTransition:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  AVPlayerViewController *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = -[AVPlayerViewController activeContentTransitionType](self, "activeContentTransitionType");
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Warning: Attempted to start content transition on a %@, which was already transitioning. Ignoring.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = (AVPlayerViewController *)"-[AVPlayerViewController(AVPlayerViewController_NewsOnly) startContentTransition:]";
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %ld", (uint8_t *)&v8, 0x16u);
    }

    -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject startContentTransition:](v7, "startContentTransition:", a3);
  }

}

- (void)setVideoGravityForTransitioningContent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController _newsWidgetPlayerBehaviorContext](self, "_newsWidgetPlayerBehaviorContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVideoGravityForTransitioningContent:", v4);

}

- (id)_newsWidgetPlayerLegacyBehavior
{
  void *v2;
  void *v3;

  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behaviorOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)removeBehavior:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBehavior:", v4);

}

- (NSArray)behaviors
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[AVPlayerViewController _behaviorStorage](self, "_behaviorStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

@end
