@implementation AVMusicAppBehaviorContext

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v4 = a3;
  objc_msgSend(v9, "playerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v9, "playerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avkit_setMusicBehaviorData:", v9);

  }
}

- (void)setBehavior:(id)a3
{
  objc_storeWeak((id *)&self->_behavior, a3);
}

- (AVMusicAppBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  AVMusicAppBehaviorContext *v5;
  AVMusicAppBehaviorContext *v6;
  AVObservationController *v7;
  AVObservationController *observationController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVMusicAppBehaviorContext;
  v5 = -[AVMusicAppBehaviorContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
    v7 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v6);
    observationController = v6->_observationController;
    v6->_observationController = v7;

    v6->_showsSkipItemButtons = 1;
  }

  return v6;
}

- (void)setSkipToPreviousItemButtonEnabled:(BOOL)a3
{
  self->_skipToPreviousItemButtonEnabled = a3;
  -[AVMusicAppBehaviorContext _updateSkipItemButtonsEnabled](self, "_updateSkipItemButtonsEnabled");
}

- (void)setSkipToNextItemButtonEnabled:(BOOL)a3
{
  self->_skipToNextItemButtonEnabled = a3;
  -[AVMusicAppBehaviorContext _updateSkipItemButtonsEnabled](self, "_updateSkipItemButtonsEnabled");
}

- (void)setShowsSkipItemButtons:(BOOL)a3
{
  self->_showsSkipItemButtons = a3;
  -[AVMusicAppBehaviorContext _updateSkipItemButtonsEnabled](self, "_updateSkipItemButtonsEnabled");
}

- (void)didAddBehavior:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
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
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMusicAppBehaviorContext setPlayerController:](self, "setPlayerController:", v5);

  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanPausePlaybackWhenClosingPictureInPicture:", 0);

  -[AVMusicAppBehaviorContext _updatePlaybackControlsInclusion](self, "_updatePlaybackControlsInclusion");
  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerViewControllerDidChangePlayerControllerNotification"), v8, 0, &__block_literal_global_4907);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.scrubbing"), 0, &__block_literal_global_16_4909);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("playerController.player.currentItem"), 1, &__block_literal_global_19_4911);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("playerController.seekToTime");
  v27[1] = CFSTR("playerController.seeking");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v14, 0, &__block_literal_global_25);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMusicAppBehaviorContext playerController](self, "playerController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerDidBeginScanningNotification"), v17, 0, &__block_literal_global_27);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMusicAppBehaviorContext playerController](self, "playerController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerControllerDidEndScanningNotification"), v19, 0, &__block_literal_global_28_4915);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerViewControllerDidEnterFullScreenFromInline"), v21, 0, &__block_literal_global_29);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerViewControllerDidExitFullScreenFromInline"), v23, 0, &__block_literal_global_30);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPictureInPictureControllerUserPlaybackStateDidChangeNotification"), 0, 0, &__block_literal_global_31);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPictureInPictureControllerWillStartNotification"), 0, 0, &__block_literal_global_32);

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPictureInPictureControllerWillStopNotification"), 0, 0, &__block_literal_global_33);

}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (void)_updateSkipItemButtonsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackControlsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");

  if (v6)
  {
    v7 = -[AVMusicAppBehaviorContext isSkipToNextItemButtonEnabled](self, "isSkipToNextItemButtonEnabled");
    v8 = -[AVMusicAppBehaviorContext isSkipToPreviousItemButtonEnabled](self, "isSkipToPreviousItemButtonEnabled");
  }
  else
  {
    v7 = -[AVMusicAppBehaviorContext isSkipToPreviousItemButtonEnabled](self, "isSkipToPreviousItemButtonEnabled");
    v8 = -[AVMusicAppBehaviorContext isSkipToNextItemButtonEnabled](self, "isSkipToNextItemButtonEnabled");
  }
  v9 = v8;
  objc_msgSend(v4, "setStartLeftwardContentTransitionButtonEnabled:", v7);
  objc_msgSend(v4, "setStartRightwardContentTransitionButtonEnabled:", v9);
  objc_msgSend(v4, "setPlaybackControlsIncludeStartContentTransitionButtons:", -[AVMusicAppBehaviorContext showsSkipItemButtons](self, "showsSkipItemButtons"));
  if (-[AVMusicAppBehaviorContext showsSkipItemButtons](self, "showsSkipItemButtons") && (v7 || v9))
  {
    objc_msgSend(v3, "controlsViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSecondaryPlaybackControlsType:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);
    objc_msgSend(v10, "addAction:withTarget:forEvent:", sel_skipToNextItem, WeakRetained, CFSTR("AVChromelessControlsSkipForwardPressedEvent"));

    v12 = objc_loadWeakRetained((id *)&self->_behavior);
    objc_msgSend(v10, "addAction:withTarget:forEvent:", sel_skipToPreviousItem, v12, CFSTR("AVChromelessControlsSkipBackwardPressedEvent"));

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__AVMusicAppBehaviorContext__updateSkipItemButtonsEnabled__block_invoke;
    v13[3] = &unk_1E5BB38A0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "setContentTransitionAction:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v4, "setContentTransitionAction:", 0);
  }

}

- (BOOL)showsSkipItemButtons
{
  return self->_showsSkipItemButtons;
}

- (BOOL)isSkipToPreviousItemButtonEnabled
{
  return self->_skipToPreviousItemButtonEnabled;
}

- (BOOL)isSkipToNextItemButtonEnabled
{
  return self->_skipToNextItemButtonEnabled;
}

- (void)_updatePlaybackControlsInclusion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPresentingFullScreenFromInline");
  if ((v4 & 1) != 0)
  {
    v5 = 1;
LABEL_6:

    goto LABEL_7;
  }
  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresentedFullScreen");

  if ((v7 & 1) == 0)
  {
    -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isPictureInPictureActive") ^ 1;
    goto LABEL_6;
  }
  v5 = 1;
  v4 = 1;
LABEL_7:
  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playbackControlsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaybackControlsIncludeVolumeControls:", v4);

  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playbackControlsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaybackControlsIncludeTransportControls:", v4);

  -[AVMusicAppBehaviorContext playerViewController](self, "playerViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playbackControlsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlaybackControlsIncludeDisplayModeControls:", v5);

}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVMusicAppBehaviorContext observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVMusicAppBehaviorContext;
  -[AVMusicAppBehaviorContext dealloc](&v4, sel_dealloc);
}

- (void)didRemoveBehavior:(id)a3
{
  id v3;

  -[AVMusicAppBehaviorContext observationController](self, "observationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

}

- (void)viewDidLoad
{
  -[AVMusicAppBehaviorContext _updateSkipItemButtonsEnabled](self, "_updateSkipItemButtonsEnabled");
  -[AVMusicAppBehaviorContext _updatePlaybackControlsInclusion](self, "_updatePlaybackControlsInclusion");
}

- (void)playerViewController:(id)a3 didCollectMetricsEvent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v10 = v6;
  switch(a4)
  {
    case 0:
      -[AVMusicAppBehaviorContext behavior](self, "behavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 1;
      goto LABEL_6;
    case 1:
      -[AVMusicAppBehaviorContext behavior](self, "behavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 0;
      goto LABEL_6;
    case 2:
      -[AVMusicAppBehaviorContext behavior](self, "behavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 2;
      goto LABEL_6;
    case 3:
      -[AVMusicAppBehaviorContext behavior](self, "behavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 3;
LABEL_6:
      objc_msgSend(v7, "contextWillHandleUserAction:", v9);

      v6 = v10;
      break;
    default:
      break;
  }

}

- (AVMusicAppBehavior)behavior
{
  return (AVMusicAppBehavior *)objc_loadWeakRetained((id *)&self->_behavior);
}

- (NSNumber)seekTargetTime
{
  return self->_seekTargetTime;
}

- (void)setSeekTargetTime:(id)a3
{
  objc_storeStrong((id *)&self->_seekTargetTime, a3);
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_seekTargetTime, 0);
  objc_destroyWeak((id *)&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

void __58__AVMusicAppBehaviorContext__updateSkipItemButtonsEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "behavior");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "skipToPreviousItem");
      goto LABEL_6;
    }
    if (a2 == 1)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "behavior");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "skipToNextItem");
LABEL_6:

      WeakRetained = v5;
    }
  }

}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePlaybackControlsInclusion");
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePlaybackControlsInclusion");
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v5 = a2;
  objc_msgSend(a4, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVPictureInPictureControllerPlaybackStateIsPlayingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contextWillHandleUserAction:", v7);
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePlaybackControlsInclusion");
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updatePlaybackControlsInclusion");
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVPlayerControllerScanningDirectionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 <= 0)
    v9 = 13;
  else
    v9 = 11;
  objc_msgSend(v5, "behavior");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contextWillHandleUserAction:", v9);
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVPlayerControllerScanningDirectionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 <= 0)
    v9 = 12;
  else
    v9 = 10;
  objc_msgSend(v5, "behavior");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "contextWillHandleUserAction:", v9);
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  int v7;
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
  void *v18;
  char v19;
  id v20;

  v20 = a2;
  v5 = a4;
  objc_msgSend(v20, "playerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSeeking");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "playerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "seekToTime");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSeekTargetTime:", v10);

  }
  objc_msgSend(v5, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("playerController.seeking")))
  {
    objc_msgSend(v20, "playerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v20;
    if (!v14)
      goto LABEL_10;
    objc_msgSend(v20, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "playerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isSeeking"))
      v17 = 6;
    else
      v17 = 7;
    objc_msgSend(v11, "contextWillHandleUserAction:", v17);

  }
  v15 = v20;
LABEL_10:
  objc_msgSend(v15, "playerController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSeeking");

  if ((v19 & 1) == 0)
    objc_msgSend(v20, "setSeekTargetTime:", 0);

}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = a2;
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isScrubbing"))
    v6 = 4;
  else
    v6 = 5;
  objc_msgSend(v3, "contextWillHandleUserAction:", v6);

  objc_msgSend(v2, "playerController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScrubbing:", objc_msgSend(v7, "isScrubbing"));

}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  objc_msgSend(v8, "playerViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v8, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlayerController:", v7);

  }
}

@end
