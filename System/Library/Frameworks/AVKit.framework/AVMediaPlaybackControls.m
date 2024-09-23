@implementation AVMediaPlaybackControls

- (AVMediaPlaybackControls)initWithPlayer:(id)a3
{
  id v5;
  AVMediaPlaybackControls *v6;
  AVMediaPlaybackControls *v7;
  AVPlayerController *v8;
  AVPlayerController *playerController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMediaPlaybackControls;
  v6 = -[AVMediaPlaybackControls initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = -[AVPlayerController initWithPlayer:]([AVPlayerController alloc], "initWithPlayer:", v5);
    playerController = v7->_playerController;
    v7->_playerController = v8;

    -[AVMediaPlaybackControls _commonInit]((uint64_t)v7);
  }

  return v7;
}

- (AVMediaPlaybackControls)initWithSource:(id)a3
{
  id v5;
  AVMediaPlaybackControls *v6;
  AVMediaPlaybackControls *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVMediaPlaybackControls;
  v6 = -[AVMediaPlaybackControls initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    -[AVMediaPlaybackControls _commonInit]((uint64_t)v7);
  }

  return v7;
}

- (void)dealloc
{
  AVObservationController *observationController;
  AVPlayerController *playerController;
  objc_super v5;

  if (self)
    -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  observationController = self->_observationController;
  self->_observationController = 0;

  playerController = self->_playerController;
  self->_playerController = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVMediaPlaybackControls;
  -[AVMediaPlaybackControls dealloc](&v5, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  AVObservationController *v4;
  AVObservationController *observationController;
  void *v6;
  void *v7;
  AVMobileChromelessControlsStyleSheet *v8;
  AVMobileChromelessPlaybackControlsView *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVMediaPlaybackControls;
  -[AVMediaPlaybackControls didMoveToWindow](&v10, sel_didMoveToWindow);
  -[AVMediaPlaybackControls window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self)
    {
      if (!self->_observationController)
      {
        v4 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
        observationController = self->_observationController;
        self->_observationController = v4;

      }
      -[AVMediaPlaybackControls _startObservations]((uint64_t)self);
      if (!self->_playbackControlsView)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "traitCollection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = -[AVMobileChromelessControlsStyleSheet initWithTraitCollection:]([AVMobileChromelessControlsStyleSheet alloc], "initWithTraitCollection:", v7);
        v9 = -[AVMobileChromelessPlaybackControlsView initWithStyleSheet:]([AVMobileChromelessPlaybackControlsView alloc], "initWithStyleSheet:", v8);
        -[AVMobileChromelessPlaybackControlsView setAutoresizingMask:](v9, "setAutoresizingMask:", 0);
        -[AVMobileChromelessPlaybackControlsView setDelegate:](v9, "setDelegate:", self);
        -[AVMobileChromelessPlaybackControlsView setShowsPlayPauseButton:](v9, "setShowsPlayPauseButton:", 1);
        -[AVMediaPlaybackControls setPlaybackControlsView:](self, "setPlaybackControlsView:", v9);
        -[AVMediaPlaybackControls addSubview:](self, "addSubview:", self->_playbackControlsView);

      }
    }
    else
    {
      -[AVMediaPlaybackControls _startObservations](0);
    }
    -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](self);
    -[AVMediaPlaybackControls _updateBackwardSecondaryControlIcon]((uint64_t)self);
    -[AVMediaPlaybackControls _updateForwardSecondaryControlIcon]((uint64_t)self);
  }
  else if (self)
  {
    -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMediaPlaybackControls;
  -[AVMediaPlaybackControls layoutSubviews](&v4, sel_layoutSubviews);
  -[AVMediaPlaybackControls playbackControlsView](self, "playbackControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaPlaybackControls bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMobileChromelessPlaybackControlsView intrinsicContentSize](self->_playbackControlsView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPlayer:(id)a3
{
  AVMediaPlaybackControlsSource *source;
  AVPlayerController *v6;
  AVPlayerController *playerController;
  AVPlayer *v8;

  v8 = (AVPlayer *)a3;
  if (self->_player != v8)
  {
    -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
    source = self->_source;
    self->_source = 0;

    objc_storeStrong((id *)&self->_player, a3);
    v6 = -[AVPlayerController initWithPlayer:]([AVPlayerController alloc], "initWithPlayer:", v8);
    playerController = self->_playerController;
    self->_playerController = v6;

    -[AVMediaPlaybackControls _startObservations]((uint64_t)self);
    -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](self);
  }

}

- (void)setSource:(id)a3
{
  AVMediaPlaybackControlsSource *v5;
  AVPlayer *player;
  AVMediaPlaybackControlsSource *v7;

  v5 = (AVMediaPlaybackControlsSource *)a3;
  if (self->_source != v5)
  {
    v7 = v5;
    -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
    player = self->_player;
    self->_player = 0;

    objc_storeStrong((id *)&self->_source, a3);
    -[AVMediaPlaybackControls _startObservations]((uint64_t)self);
    -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](self);
    v5 = v7;
  }

}

- (void)setBackwardSecondaryControlConfiguration:(id)a3
{
  AVMediaSecondaryPlaybackControlConfiguration *v4;
  AVMediaSecondaryPlaybackControlConfiguration *backwardSecondaryControlConfiguration;

  if (self->_backwardSecondaryControlConfiguration != a3)
  {
    v4 = (AVMediaSecondaryPlaybackControlConfiguration *)objc_msgSend(a3, "copy");
    backwardSecondaryControlConfiguration = self->_backwardSecondaryControlConfiguration;
    self->_backwardSecondaryControlConfiguration = v4;

    -[AVMediaPlaybackControls _updateBackwardSecondaryControlIcon]((uint64_t)self);
  }
}

- (AVMediaSecondaryPlaybackControlConfiguration)backwardSecondaryControlConfiguration
{
  return (AVMediaSecondaryPlaybackControlConfiguration *)(id)-[AVMediaSecondaryPlaybackControlConfiguration copy](self->_backwardSecondaryControlConfiguration, "copy");
}

- (void)setForwardSecondaryControlConfiguration:(id)a3
{
  AVMediaSecondaryPlaybackControlConfiguration *v4;
  AVMediaSecondaryPlaybackControlConfiguration *forwardSecondaryControlConfiguration;

  if (self->_forwardSecondaryControlConfiguration != a3)
  {
    v4 = (AVMediaSecondaryPlaybackControlConfiguration *)objc_msgSend(a3, "copy");
    forwardSecondaryControlConfiguration = self->_forwardSecondaryControlConfiguration;
    self->_forwardSecondaryControlConfiguration = v4;

    -[AVMediaPlaybackControls _updateForwardSecondaryControlIcon]((uint64_t)self);
  }
}

- (AVMediaSecondaryPlaybackControlConfiguration)forwardSecondaryControlConfiguration
{
  return (AVMediaSecondaryPlaybackControlConfiguration *)(id)-[AVMediaSecondaryPlaybackControlConfiguration copy](self->_forwardSecondaryControlConfiguration, "copy");
}

- (void)playbackControlsViewPlayPauseButtonWasPressed:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_player)
  {
    -[AVMediaPlaybackControls playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "togglePlayback:", self);

  }
  -[AVMediaPlaybackControls delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVMediaPlaybackControls delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaPlaybackControlsPlayPauseButtonPressed:", self);

  }
}

- (void)playbackControlsViewBackwardSecondaryControlWasPressed:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_player && !objc_msgSend(v9, "backwardSecondaryControlIcon"))
  {
    -[AVMediaPlaybackControls playerController](self, "playerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTime");
    objc_msgSend(v4, "seekToTime:", v5 + -10.0);

  }
  -[AVMediaPlaybackControls delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AVMediaPlaybackControls delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaPlaybackControlsBackwardSecondaryControlPressed:", self);

  }
}

- (void)playbackControlsViewForwardSecondaryControlWasPressed:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_player)
  {
    if (objc_msgSend(v9, "forwardSecondaryControlIcon"))
    {
      if (objc_msgSend(v9, "forwardSecondaryControlIcon") != 2)
        goto LABEL_7;
      -[AVMediaPlaybackControls playerController](self, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "seekToEnd:", self);
    }
    else
    {
      -[AVMediaPlaybackControls playerController](self, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentTime");
      objc_msgSend(v4, "seekToTime:", v5 + 10.0);
    }

  }
LABEL_7:
  -[AVMediaPlaybackControls delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AVMediaPlaybackControls delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaPlaybackControlsForwardSecondaryControlPressed:", self);

  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVMediaPlaybackControlsSource)source
{
  return self->_source;
}

- (AVMediaPlaybackControlsDelegate)delegate
{
  return (AVMediaPlaybackControlsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVMobileChromelessPlaybackControlsView)playbackControlsView
{
  return self->_playbackControlsView;
}

- (void)setPlaybackControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_playbackControlsView, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playbackControlsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_forwardSecondaryControlConfiguration, 0);
  objc_storeStrong((id *)&self->_backwardSecondaryControlConfiguration, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
}

- (uint64_t)_updateForwardSecondaryControlIcon
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 432);
    v3 = *(void **)(v1 + 464);
    if (v2)
    {
      v4 = objc_msgSend(v2, "type");
      if (v4 == 1)
        v5 = 1;
      else
        v5 = 2 * (v4 == 2);
      objc_msgSend(v3, "setForwardSecondaryControlIcon:", v5);
      objc_msgSend(*(id *)(v1 + 464), "setForwardSecondaryControlEnabled:", objc_msgSend(*(id *)(v1 + 432), "isEnabled"));
      v6 = *(void **)(v1 + 464);
      v7 = 1;
    }
    else
    {
      v6 = *(void **)(v1 + 464);
      v7 = 0;
    }
    return objc_msgSend(v6, "setShowsForwardSecondaryPlaybackButton:", v7);
  }
  return result;
}

- (uint64_t)_updateBackwardSecondaryControlIcon
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 424);
    v3 = *(void **)(v1 + 464);
    if (v2)
    {
      v4 = objc_msgSend(v2, "type");
      if (v4 == 1)
        v5 = 1;
      else
        v5 = 2 * (v4 == 2);
      objc_msgSend(v3, "setBackwardSecondaryControlIcon:", v5);
      objc_msgSend(*(id *)(v1 + 464), "setBackwardSecondaryControlEnabled:", objc_msgSend(*(id *)(v1 + 424), "isEnabled"));
      v6 = *(void **)(v1 + 464);
      v7 = 1;
    }
    else
    {
      v6 = *(void **)(v1 + 464);
      v7 = 0;
    }
    return objc_msgSend(v6, "setShowsBackwardSecondaryPlaybackButton:", v7);
  }
  return result;
}

- (void)_startObservations
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 440))
    {
      v2 = *(void **)(a1 + 416);
      v6[0] = CFSTR("playerController.rate");
      v6[1] = CFSTR("playerController.timeControlStatus");
      v6[2] = CFSTR("playerController.playbackSuspended");
      v6[3] = CFSTR("playerController.suspendedRate");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)objc_msgSend(v2, "startObserving:keyPaths:observationHandler:", a1, v3, &__block_literal_global_3535);

    }
    else if (*(_QWORD *)(a1 + 448))
    {
      v5 = (id)objc_msgSend(*(id *)(a1 + 416), "startObserving:keyPath:observationHandler:", a1, CFSTR("source.playing"), &__block_literal_global_45);
    }
  }
}

- (void)_updatePlayPauseButtonIcon
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  int v8;
  id v9;

  if (a1)
  {
    if (a1[55])
    {
      objc_msgSend(a1, "playerController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "timeControlStatus"))
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(v2, "rate");
        v3 = v6 == 0.0;
      }
      if (objc_msgSend(v2, "avkit_isAVPlayerControllerOrSubclass"))
      {
        objc_msgSend(v2, "suspendedRate");
        v8 = objc_msgSend(v2, "isPlaybackSuspended") ^ 1 | (v7 == 0.0);
      }
      else
      {
        v8 = 1;
      }
      v5 = v3 & v8;

    }
    else
    {
      v4 = (void *)a1[56];
      if (v4)
        v5 = objc_msgSend(v4, "isPlaying") ^ 1;
      else
        v5 = 1;
    }
    objc_msgSend(a1, "playbackControlsView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayPauseButtonShowsPlayIcon:", v5);

  }
}

void __45__AVMediaPlaybackControls__startObservations__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](a2);
}

void __45__AVMediaPlaybackControls__startObservations__block_invoke(uint64_t a1, _QWORD *a2)
{
  -[AVMediaPlaybackControls _updatePlayPauseButtonIcon](a2);
}

- (void)_commonInit
{
  AVMediaSecondaryPlaybackControlConfiguration *v2;
  void *v3;
  AVMediaSecondaryPlaybackControlConfiguration *v4;
  void *v5;

  v2 = objc_alloc_init(AVMediaSecondaryPlaybackControlConfiguration);
  v3 = *(void **)(a1 + 424);
  *(_QWORD *)(a1 + 424) = v2;

  v4 = objc_alloc_init(AVMediaSecondaryPlaybackControlConfiguration);
  v5 = *(void **)(a1 + 432);
  *(_QWORD *)(a1 + 432) = v4;

}

@end
