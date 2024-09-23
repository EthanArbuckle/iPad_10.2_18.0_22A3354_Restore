@implementation LPVisualMediaView

- (LPVisualMediaView)initWithHost:(id)a3
{

  return 0;
}

- (LPVisualMediaView)initWithHost:(id)a3 media:(id)a4 style:(id)a5 posterFrame:(id)a6 posterFrameStyle:(id)a7 configuration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  LPVisualMediaView *v18;
  id *p_isa;
  LPVisualMediaView *v20;
  uint64_t v21;
  LPVisualMediaViewConfiguration *configuration;
  LPVisualMediaViewConfiguration *v23;
  LPVisualMediaViewConfiguration *v24;
  void *v25;
  void *v26;
  void *v27;
  LPVisualMediaView *v28;
  id v30;
  id v31;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v31 = a5;
  v30 = a6;
  v16 = a7;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LPVisualMediaView;
  v18 = -[LPComponentView initWithHost:](&v32, sel_initWithHost_, v14);
  p_isa = (id *)&v18->super.super.super.super.isa;
  v20 = v18;
  if (v18)
  {
    v18->_loggingID = ++initWithHost_media_style_posterFrame_posterFrameStyle_configuration__nextLoggingID;
    objc_storeStrong((id *)&v18->_media, a4);
    objc_storeStrong(p_isa + 54, a5);
    objc_storeStrong(p_isa + 55, a6);
    objc_storeStrong(p_isa + 56, a7);
    v21 = objc_msgSend(v17, "copy", v30, v31);
    configuration = v20->_configuration;
    v20->_configuration = (LPVisualMediaViewConfiguration *)v21;

    if (!v20->_configuration)
    {
      v23 = objc_alloc_init(LPVisualMediaViewConfiguration);
      v24 = v20->_configuration;
      v20->_configuration = v23;

    }
    v20->_showingPlayButton = 1;
    objc_msgSend(v15, "properties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "accessibilityText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPVisualMediaView setAccessibilityLabel:](v20, "setAccessibilityLabel:", v26);

    +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addMediaPlayer:", v20);

    v28 = v20;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeMediaPlayer:", self);

  v4.receiver = self;
  v4.super_class = (Class)LPVisualMediaView;
  -[LPVisualMediaView dealloc](&v4, sel_dealloc);
}

- (LPVisualMediaViewConfiguration)configuration
{
  return (LPVisualMediaViewConfiguration *)(id)-[LPVisualMediaViewConfiguration copy](self->_configuration, "copy");
}

- (BOOL)isParented
{
  BOOL v2;
  void *v3;

  if (self->_fullScreen)
    return 1;
  -[LPVisualMediaView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (void)componentViewDidMoveToWindow
{
  BOOL v3;
  _QWORD block[5];

  if (self->_hasBuilt && !self->_fullScreen)
  {
    if (-[LPVisualMediaView isParented](self, "isParented"))
    {
      -[LPVisualMediaView setPlaying:](self, "setPlaying:", self->_wasPlayingOrWaitingToPlayWhenUnparented);
      return;
    }
    if (self->_playing)
    {
      self->_wasPlayingOrWaitingToPlayWhenUnparented = 1;
    }
    else
    {
      v3 = -[LPVisualMediaView isWaitingForPlayback](self, "isWaitingForPlayback");
      self->_wasPlayingOrWaitingToPlayWhenUnparented = v3;
      if (!v3)
        return;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__LPVisualMediaView_componentViewDidMoveToWindow__block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __49__LPVisualMediaView_componentViewDidMoveToWindow__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isParented");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlaying:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setMuted:", 1);
  }
  return result;
}

- (void)buildSubviewsIfNeeded
{
  void *v3;
  UIView *v4;
  UIView *containerView;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CATextLayer *v10;
  CATextLayer *debugIndicator;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  void *v18;
  UIGestureRecognizer *v19;
  UIGestureRecognizer *tapRecognizer;
  UIGestureRecognizer *v21;
  UIGestureRecognizer *playButtonTapRecognizer;
  void *v23;
  void *v24;

  if (!self->_hasBuilt)
  {
    -[LPVisualMediaView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    -[LPVisualMediaView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0DC3F10], "_lp_createFlippedView");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    containerView = self->_containerView;
    self->_containerView = v4;

    -[LPVisualMediaView addSubview:](self, "addSubview:", self->_containerView);
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");
      -[UIView layer](self->_containerView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderColor:", v7);

      -[UIView layer](self->_containerView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderWidth:", 3.0);

      v10 = (CATextLayer *)objc_alloc_init(MEMORY[0x1E0CD28A0]);
      debugIndicator = self->_debugIndicator;
      self->_debugIndicator = v10;

      +[LPActionDisablingCALayerDelegate shared](LPActionDisablingCALayerDelegate, "shared");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATextLayer setDelegate:](self->_debugIndicator, "setDelegate:", v12);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_loggingID);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATextLayer setString:](self->_debugIndicator, "setString:", v14);

      -[CATextLayer setFont:](self->_debugIndicator, "setFont:", objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 16.0));
      -[CATextLayer setFontSize:](self->_debugIndicator, "setFontSize:", 16.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CATextLayer setForegroundColor:](self->_debugIndicator, "setForegroundColor:", objc_msgSend(v15, "CGColor"));

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CATextLayer setShadowColor:](self->_debugIndicator, "setShadowColor:", objc_msgSend(v16, "CGColor"));

      LODWORD(v17) = 1.0;
      -[CATextLayer setShadowOpacity:](self->_debugIndicator, "setShadowOpacity:", v17);
      -[CATextLayer setShadowRadius:](self->_debugIndicator, "setShadowRadius:", 1.0);
      -[CATextLayer setShadowOffset:](self->_debugIndicator, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      -[UIView _lp_backingScaleFactor](self, "_lp_backingScaleFactor");
      -[CATextLayer setContentsScale:](self->_debugIndicator, "setContentsScale:");
      -[LPVisualMediaView layer](self, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSublayer:", self->_debugIndicator);

    }
    -[LPVisualMediaView _buildVisualMediaPlaceholderView](self, "_buildVisualMediaPlaceholderView");
    if (!-[LPVisualMediaViewConfiguration disablePlayback](self->_configuration, "disablePlayback")
      && !-[LPVisualMediaViewConfiguration disablePlaybackControls](self->_configuration, "disablePlaybackControls"))
    {
      v19 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapRecognized_);
      tapRecognizer = self->_tapRecognizer;
      self->_tapRecognizer = v19;

      -[UIGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", !self->_allowsUserInteractionWithVideoPlayer);
      -[UIView addGestureRecognizer:](self->_containerView, "addGestureRecognizer:", self->_tapRecognizer);
      v21 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapRecognized_);
      playButtonTapRecognizer = self->_playButtonTapRecognizer;
      self->_playButtonTapRecognizer = v21;

      -[UIView addGestureRecognizer:](self->_playButtonContainerView, "addGestureRecognizer:", self->_playButtonTapRecognizer);
    }
    if (!-[LPVisualMediaViewConfiguration disablePlayback](self->_configuration, "disablePlayback"))
    {
      if (-[LPVisualMediaView shouldAutoPlay](self, "shouldAutoPlay"))
      {
        -[LPVisualMediaView _swapVideoPlaceholderForVideoForAutoPlay:](self, "_swapVideoPlaceholderForVideoForAutoPlay:", 1);
        -[LPVisualMediaView setPlaying:](self, "setPlaying:", 1);
      }
      else if (-[LPVisualMediaViewConfiguration allowsLoadingMediaWithAutoPlayDisabled](self->_configuration, "allowsLoadingMediaWithAutoPlayDisabled"))
      {
        -[LPVisualMediaView beginLoadingMediaForPreroll](self, "beginLoadingMediaForPreroll");
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    }
    self->_hasBuilt = 1;
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  _BOOL4 playing;
  id v5;

  v5 = a3;
  playing = self->_playing;
  self->_wasPlayingWhenSuspended = playing;
  if (playing)
    -[LPVisualMediaView setPlaying:](self, "setPlaying:", 0);
  if (self->_fullScreen)
    -[LPVisualMediaView destroyFullScreenViewController](self, "destroyFullScreenViewController");
  else
    -[LPVisualMediaView setMuted:](self, "setMuted:", 1);

}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_wasPlayingWhenSuspended && -[LPVisualMediaView isParented](self, "isParented"))
    -[LPVisualMediaView setPlaying:](self, "setPlaying:", 1);

}

- (BOOL)shouldAutoPlay
{
  return 0;
}

- (void)layoutComponentView
{
  LPVisualMediaView *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MidX;
  double MidY;
  void *v12;
  UIImageView *muteButtonView;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
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
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[LPVisualMediaView buildSubviewsIfNeeded](self, "buildSubviewsIfNeeded");
  -[UIView superview](self->_containerView, "superview");
  v3 = (LPVisualMediaView *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    -[LPVisualMediaView bounds](self, "bounds");
    -[UIView setFrame:](self->_containerView, "setFrame:");
  }
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_playbackView, "setFrame:");
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_videoPlaceholderView, "setFrame:");
  -[LPVisualMediaView bounds](self, "bounds");
  v42 = CGRectInset(v41, 10.0, 10.0);
  -[CATextLayer setFrame:](self->_debugIndicator, "setFrame:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  -[LPVisualMediaViewStyle playButton](self->_style, "playButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asSize");
  v7 = v6;
  v9 = v8;

  -[UIView setBounds:](self->_playButtonContainerView, "setBounds:", 0.0, 0.0, v7, v9);
  -[UIView bounds](self->_containerView, "bounds");
  MidX = CGRectGetMidX(v43);
  -[UIView bounds](self->_containerView, "bounds");
  MidY = CGRectGetMidY(v44);
  -[UIView layer](self->_playButtonContainerView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", MidX, MidY);

  -[UIView setBounds:](self->_playButtonView, "setBounds:", 0.0, 0.0, v7, v9);
  -[UIView frame](self->_playButtonView, "frame");
  -[UIView setFrame:](self->_playButtonView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  muteButtonView = self->_muteButtonView;
  if (muteButtonView)
  {
    -[UIImageView image](muteButtonView, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPResources muteButton](LPResources, "muteButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "platformImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_muteButtonView, "setImage:", v16);

    -[UIImageView intrinsicContentSize](self->_muteButtonView, "intrinsicContentSize");
    v18 = v17;
    v20 = v19;
    +[LPResources unmuteButton](LPResources, "unmuteButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "platformImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_muteButtonView, "setImage:", v22);

    -[UIImageView intrinsicContentSize](self->_muteButtonView, "intrinsicContentSize");
    v24 = v23;
    v26 = v25;
    -[UIImageView setImage:](self->_muteButtonView, "setImage:", v14);
    -[LPVisualMediaViewStyle muteButtonPadding](self->_style, "muteButtonPadding");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    v36 = -[UIView _lp_isLTR](self->_muteButtonContainerView, "_lp_isLTR");
    v37 = fmax(v18, v24);
    v38 = 0.0;
    if (v36)
    {
      -[UIView bounds](self->_containerView, "bounds", 0.0);
      v38 = v39 - (v35 + v37 + v31);
    }
    v40 = fmax(v20, v26);
    -[UIView setFrame:](self->_muteButtonContainerView, "setFrame:", v38, 0.0, v35 + v37 + v31, v33 + v40 + v29);
    -[UIImageView setFrame:](self->_muteButtonView, "setFrame:", v31, v29, v37, v40);

  }
  -[UIView bounds](self->_containerView, "bounds");
  -[UIView setFrame:](self->_pulsingLoadView, "setFrame:");
  -[LPVisualMediaView updatePlayButtonVisibility](self, "updatePlayButtonVisibility");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  LPImage *posterFrame;
  double *v7;
  LPVideo *video;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  CGSize result;

  height = a3.height;
  width = a3.width;
  posterFrame = self->_posterFrame;
  if (posterFrame)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    posterFrame = self->_posterFrame;
LABEL_7:
    -[LPImage platformImage](posterFrame, "platformImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    sizeFittingInsideSizeMaintainingAspectRatio(v13, v14, width, height);
    width = v15;
    v11 = v16;

    goto LABEL_8;
  }
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x3010000000;
  v7 = (double *)MEMORY[0x1E0C9D820];
  v29 = &unk_1A0D74BC9;
  v30 = *MEMORY[0x1E0C9D820];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  video = self->_video;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__LPVisualMediaView_sizeThatFits___block_invoke;
  v21[3] = &unk_1E44A81A8;
  v21[5] = &v26;
  v21[6] = &v22;
  v21[4] = self;
  -[LPVideo _intrinsicSizeWithCompletionHandler:](video, "_intrinsicSizeWithCompletionHandler:", v21);
  *((_BYTE *)v23 + 24) = 0;
  v9 = v27[4];
  v10 = v27[5];
  if (v9 == *v7 && v10 == v7[1])
  {
    v11 = width * 0.75;
  }
  else
  {
    sizeFittingInsideSizeMaintainingAspectRatio(v9, v10, width, height);
    width = v19;
    v11 = v20;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
LABEL_8:
  v17 = width;
  v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

void __34__LPVisualMediaView_sizeThatFits___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentViewDidChangeIntrinsicContentSize:", *(_QWORD *)(a1 + 32));

  }
}

- (id)_createPulsingLoadIndicator
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[LPVisualMediaViewStyle pulsingLoadIndicatorColor](self->_style, "pulsingLoadIndicatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_lp_setBackgroundColor:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CD2710]);
  objc_msgSend(v5, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v5, "setFromValue:", &unk_1E44EEA20);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[LPVisualMediaViewStyle pulsingLoadIndicatorMaximumOpacity](self->_style, "pulsingLoadIndicatorMaximumOpacity");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v7);

  -[LPVisualMediaViewStyle pulsingLoadIndicatorDuration](self->_style, "pulsingLoadIndicatorDuration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  -[LPVisualMediaViewStyle pulsingLoadIndicatorTimingFunction](self->_style, "pulsingLoadIndicatorTimingFunction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v8);

  LODWORD(v9) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v9);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setAutoreverses:", 1);
  objc_msgSend(v3, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v5, CFSTR("fade"));

  return v3;
}

- (void)_startPlaybackWatchdogTimer
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5[2];
  id location;

  v2 = (void *)(self->_playbackWatchdogTimerID + 1);
  self->_playbackWatchdogTimerID = (unint64_t)v2;
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__LPVisualMediaView__startPlaybackWatchdogTimer__block_invoke;
  block[3] = &unk_1E44A81D0;
  objc_copyWeak(v5, &location);
  v5[1] = v2;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __48__LPVisualMediaView__startPlaybackWatchdogTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_QWORD *)WeakRetained + 73) == *(_QWORD *)(a1 + 40) && *((_BYTE *)WeakRetained + 598))
    objc_msgSend(WeakRetained, "resetToPlaceholderView");

}

- (void)_swapVideoPlaceholderForVideoForAutoPlay:(BOOL)a3
{
  UIView *v5;
  UIView *playbackView;
  UIView *v7;
  UIView *pulsingLoadView;
  LPFullScreenVideoController *v9;
  LPFullScreenVideoController *fullScreenController;

  -[LPVisualMediaView createVideoPlayerView](self, "createVideoPlayerView");
  v5 = (UIView *)objc_claimAutoreleasedReturnValue();
  playbackView = self->_playbackView;
  self->_playbackView = v5;

  self->_waitingForPlaybackDueToAutoPlay |= a3;
  -[UIView _lp_insertSubview:belowSubview:](self->_containerView, "_lp_insertSubview:belowSubview:", self->_playbackView, self->_videoPlaceholderView);
  if (!a3)
  {
    -[LPVisualMediaView _createPulsingLoadIndicator](self, "_createPulsingLoadIndicator");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    pulsingLoadView = self->_pulsingLoadView;
    self->_pulsingLoadView = v7;

    -[UIView _lp_insertSubview:aboveSubview:](self->_containerView, "_lp_insertSubview:aboveSubview:", self->_pulsingLoadView, self->_videoPlaceholderView);
  }
  -[LPVisualMediaView _startPlaybackWatchdogTimer](self, "_startPlaybackWatchdogTimer");
  if (-[LPVisualMediaView shouldShowMuteButton](self, "shouldShowMuteButton")
    && !-[LPVisualMediaViewConfiguration disablePlaybackControls](self->_configuration, "disablePlaybackControls"))
  {
    -[LPVisualMediaView showMuteButton](self, "showMuteButton");
  }
  -[LPVisualMediaView createFullScreenVideoViewController](self, "createFullScreenVideoViewController");
  v9 = (LPFullScreenVideoController *)objc_claimAutoreleasedReturnValue();
  fullScreenController = self->_fullScreenController;
  self->_fullScreenController = v9;

  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)hasMuteControl
{
  return -[LPVideo hasAudio](self->_video, "hasAudio");
}

- (void)setWaitingForPlayback:(BOOL)a3
{
  if (self->_waitingForPlayback != a3)
  {
    self->_waitingForPlayback = a3;
    if (!a3)
    {
      -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
      self->_waitingForPlaybackDueToAutoPlay = 0;
    }
  }
}

- (unint64_t)lastInteractionTimestamp
{
  return self->_lastInteractionTimestamp;
}

- (double)unobscuredAreaFraction
{
  BOOL IsEmpty;
  double result;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[LPVisualMediaView bounds](self, "bounds");
  IsEmpty = CGRectIsEmpty(v18);
  result = 0.0;
  if (!IsEmpty)
  {
    -[LPVisualMediaView window](self, "window", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[LPVisualMediaView bounds](self, "bounds");
    -[LPVisualMediaView convertRect:toView:](self, "convertRect:toView:", 0);
    v21.origin.x = v7;
    v21.origin.y = v9;
    v21.size.width = v11;
    v21.size.height = v13;
    v20 = CGRectIntersection(v19, v21);
    v14 = v20.size.width * v20.size.height;
    -[LPVisualMediaView bounds](self, "bounds", v20.origin.x, v20.origin.y);
    v16 = v15;
    -[LPVisualMediaView bounds](self, "bounds");
    return v14 / (v16 * v17);
  }
  return result;
}

- (void)userInteractedWithVideoView
{
  self->_lastInteractionTimestamp = mach_absolute_time();
}

- (id)createVideoPlayerView
{
  abort();
}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)createFullScreenVideoViewController
{
  return 0;
}

- (BOOL)usesCustomFullScreenImplementation
{
  return 0;
}

- (void)resetToPlaceholderView
{
  UIView *v3;
  UIView *videoPlaceholderView;
  UIView *playbackView;
  UIView *pulsingLoadView;
  UIImageView *muteButtonView;
  UIView *muteButtonContainerView;
  id v9;

  -[LPVisualMediaView didChangePlayingState:](self, "didChangePlayingState:", 0);
  -[LPVisualMediaView _createPosterFrameView](self, "_createPosterFrameView");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  videoPlaceholderView = self->_videoPlaceholderView;
  self->_videoPlaceholderView = v3;

  -[UIView _lp_insertSubview:belowSubview:](self->_containerView, "_lp_insertSubview:belowSubview:", self->_videoPlaceholderView, self->_playButtonContainerView);
  -[UIView removeFromSuperview](self->_playbackView, "removeFromSuperview");
  playbackView = self->_playbackView;
  self->_playbackView = 0;

  -[UIView removeFromSuperview](self->_pulsingLoadView, "removeFromSuperview");
  pulsingLoadView = self->_pulsingLoadView;
  self->_pulsingLoadView = 0;

  -[UIImageView removeFromSuperview](self->_muteButtonView, "removeFromSuperview");
  muteButtonView = self->_muteButtonView;
  self->_muteButtonView = 0;

  -[UIView removeFromSuperview](self->_muteButtonContainerView, "removeFromSuperview");
  muteButtonContainerView = self->_muteButtonContainerView;
  self->_muteButtonContainerView = 0;

  -[LPVisualMediaView destroyFullScreenViewController](self, "destroyFullScreenViewController");
  self->_wasPlayingWhenSuspended = 0;
  self->_wasPlayingOrWaitingToPlayWhenUnparented = 0;
  self->_waitingForPlayback = 0;
  self->_playing = 0;
  self->_fullScreen = 0;
  -[LPVisualMediaView setHidden:](self, "setHidden:", 0);
  -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
  -[LPComponentView host](self, "host");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentViewDidChangeMediaState:", self);

}

- (void)removePlaceholderViews
{
  UIView *videoPlaceholderView;
  UIView *pulsingLoadView;

  -[UIView removeFromSuperview](self->_videoPlaceholderView, "removeFromSuperview");
  videoPlaceholderView = self->_videoPlaceholderView;
  self->_videoPlaceholderView = 0;

  -[UIView removeFromSuperview](self->_pulsingLoadView, "removeFromSuperview");
  pulsingLoadView = self->_pulsingLoadView;
  self->_pulsingLoadView = 0;

}

- (void)didChangePlayingState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (self->_playing != a3)
  {
    v3 = a3;
    if (a3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__LPVisualMediaView_didChangePlayingState___block_invoke;
      v7[3] = &unk_1E44A7CE8;
      v7[4] = self;
      -[LPVisualMediaView prepareForDisplayWithCompletionHandler:](self, "prepareForDisplayWithCompletionHandler:", v7);
    }
    self->_playing = v3;
    -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");
    +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaPlayer:didChangePlayingState:", self, v3);

    -[LPComponentView host](self, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentViewDidChangeMediaState:", self);

  }
}

uint64_t __43__LPVisualMediaView_didChangePlayingState___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "removePlaceholderViews");
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 574))
    *(_BYTE *)(v3 + 574) = 1;
  return result;
}

- (void)didEncounterPlaybackError
{
  self->_waitingForPlayback = 0;
  -[LPVisualMediaView removePlaceholderViews](self, "removePlaceholderViews");
}

- (void)didEncounterPossiblyTransientPlaybackError
{
  self->_waitingForPlayback = 0;
  -[LPVisualMediaView resetToPlaceholderView](self, "resetToPlaceholderView");
}

- (void)updateMuteButtonWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIImageView *muteButtonView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = a3;
  if (-[LPVisualMediaView isMuted](self, "isMuted"))
    +[LPResources muteButton](LPResources, "muteButton");
  else
    +[LPResources unmuteButton](LPResources, "unmuteButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platformImage");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  muteButtonView = self->_muteButtonView;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CE86F8], "replaceDownUpTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setSymbolImage:withContentTransition:](muteButtonView, "setSymbolImage:withContentTransition:", v13, v7);

  }
  else
  {
    -[UIImageView setImage:](self->_muteButtonView, "setImage:", v13);
  }
  -[LPVisualMedia properties](self->_video, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_overlappingControlsColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[UIImageView _lp_setTintColor:](self->_muteButtonView, "_lp_setTintColor:", v12);
}

- (void)didChangeMutedState:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[LPVisualMediaView updateMuteButtonWithAnimation:](self, "updateMuteButtonWithAnimation:", 1);
  +[LPMediaPlaybackManager shared](LPMediaPlaybackManager, "shared");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaPlayer:didChangeMutedState:", self, v3);

}

- (void)updatePlayButtonVisibility
{
  _BOOL4 playing;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;

  playing = self->_playing;
  v4 = !self->_playing;
  if (-[LPVisualMediaView shouldAutoPlay](self, "shouldAutoPlay"))
  {
    v5 = -[LPVisualMediaView hasEverPlayed](self, "hasEverPlayed");
    v4 = !playing && v5;
  }
  v6 = -[LPVisualMediaView isWaitingForPlayback](self, "isWaitingForPlayback");
  if (!self->_wasPlayingWhenSuspended
    || (objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "applicationState"),
        v7,
        v8 != 2))
  {
    v9 = v4 & ~v6;
    if (self->_showingPlayButton == v9)
      return;
    if (v9)
    {
      -[LPVisualMediaView showPlayButtonAnimated:](self, "showPlayButtonAnimated:", 1);
      return;
    }
    goto LABEL_12;
  }
  if (self->_showingPlayButton)
LABEL_12:
    -[LPVisualMediaView hidePlayButtonAnimated:](self, "hidePlayButtonAnimated:", !self->_waitingForPlaybackDueToAutoPlay);
}

- (void)showPlayButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  self->_showingPlayButton = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__LPVisualMediaView_showPlayButtonAnimated___block_invoke;
  aBlock[3] = &unk_1E44A7CE8;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x20000, v4, 0, 0.2, 0.0);
  else
    (*((void (**)(void *))v4 + 2))(v4);

}

uint64_t __44__LPVisualMediaView_showPlayButtonAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v8[0] = *MEMORY[0x1E0CD2610];
  v8[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v8[3] = v6;
  objc_msgSend(v2, "setTransform:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "_lp_setOpacity:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "_lp_setOpacity:", 1.0);
}

- (void)hidePlayButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void (**v7)(void *, uint64_t);
  _QWORD v8[5];
  _QWORD aBlock[5];

  v3 = a3;
  self->_showingPlayButton = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke;
  aBlock[3] = &unk_1E44A7CE8;
  aBlock[4] = self;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke_2;
  v8[3] = &unk_1E44A81F8;
  v8[4] = self;
  v7 = (void (**)(void *, uint64_t))_Block_copy(v8);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v6, v7, 0.2);
  }
  else
  {
    v6[2](v6);
    v7[2](v7, 1);
  }

}

uint64_t __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  CATransform3D v4;
  CATransform3D v5;

  CATransform3DMakeScale(&v5, 0.4, 0.4, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "_lp_setOpacity:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "_lp_setOpacity:", 0.0);
}

uint64_t __44__LPVisualMediaView_hidePlayButtonAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setHidden:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 572) == 0);
}

- (void)showMuteButton
{
  UIView *v3;
  UIView *muteButtonContainerView;
  UIImageView *v5;
  UIImageView *muteButtonView;
  void *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  id v11;
  id v12;

  if (!self->_muteButtonView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    muteButtonContainerView = self->_muteButtonContainerView;
    self->_muteButtonContainerView = v3;

    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    muteButtonView = self->_muteButtonView;
    self->_muteButtonView = v5;

    +[LPResources muteButton](LPResources, "muteButton");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "platformImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_muteButtonView, "setImage:", v7);

    -[UIImageView setContentMode:](self->_muteButtonView, "setContentMode:", 1);
    -[UIView addSubview:](self->_muteButtonContainerView, "addSubview:", self->_muteButtonView);
    -[LPVisualMediaView updateMuteButtonWithAnimation:](self, "updateMuteButtonWithAnimation:", 0);
    v8 = self->_muteButtonContainerView;
    -[LPVisualMediaViewStyle muteButtonOpacity](self->_style, "muteButtonOpacity");
    -[UIView _lp_setOpacity:](v8, "_lp_setOpacity:");
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__muteButtonHighlightLongPressRecognized_);
    objc_msgSend(v12, "setMinimumPressDuration:", 0.001);
    objc_msgSend(v12, "setDelegate:", self);
    -[UIView addGestureRecognizer:](self->_muteButtonContainerView, "addGestureRecognizer:", v12);
    v9 = self->_muteButtonContainerView;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__muteButtonTapRecognized_);
    -[UIView addGestureRecognizer:](v9, "addGestureRecognizer:", v10);

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_muteButtonContainerView);
    -[UIView setUserInteractionEnabled:](self->_muteButtonContainerView, "setUserInteractionEnabled:", !self->_allowsUserInteractionWithVideoPlayer);
    -[UIView setHidden:](self->_muteButtonContainerView, "setHidden:", self->_allowsUserInteractionWithVideoPlayer);
    -[UIView _lp_setNeedsLayout](self, "_lp_setNeedsLayout");

  }
}

- (void)hideMuteButton
{
  -[UIView _lp_setOpacity:](self->_muteButtonContainerView, "_lp_setOpacity:", 0.0);
}

- (void)fadeInMuteButton
{
  UIView *muteButtonContainerView;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  muteButtonContainerView = self->_muteButtonContainerView;
  -[LPVisualMediaViewStyle muteButtonOpacity](self->_style, "muteButtonOpacity");
  -[UIView _lp_setOpacity:](muteButtonContainerView, "_lp_setOpacity:");
  objc_msgSend(MEMORY[0x1E0CD2848], "_lp_springWithMass:stiffness:damping:", 2.0, 100.0, 50.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v7, "setFromValue:", &unk_1E44EEA20);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[LPVisualMediaViewStyle muteButtonOpacity](self->_style, "muteButtonOpacity");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v5);

  -[UIView layer](self->_muteButtonContainerView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v7, CFSTR("fadeIn"));

}

- (BOOL)shouldShowMuteButton
{
  return 0;
}

- (BOOL)isMuted
{
  return 0;
}

- (id)_createPosterFrameView
{
  LPImageView *v3;
  void *v4;
  LPImageView *v5;
  void *v6;

  if (self->_posterFrame)
  {
    v3 = [LPImageView alloc];
    -[LPComponentView host](self, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[LPImageView initWithHost:image:properties:style:](v3, "initWithHost:image:properties:style:", v4, self->_posterFrame, 0, self->_posterFrameStyle);

  }
  else
  {
    v5 = (LPImageView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _lp_setBackgroundColor:](v5, "_lp_setBackgroundColor:", v6);

  return v5;
}

- (void)setAllowsUserInteractionWithVideoPlayer:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;

  v3 = a3;
  self->_allowsUserInteractionWithVideoPlayer = a3;
  v5 = !a3;
  -[UIView setUserInteractionEnabled:](self->_muteButtonContainerView, "setUserInteractionEnabled:", v5);
  -[UIView setHidden:](self->_muteButtonContainerView, "setHidden:", v3);
  -[UIGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", v5);
}

- (id)playButtonImage
{
  return +[LPResources playButton](LPResources, "playButton");
}

- (void)_buildVisualMediaPlaceholderView
{
  void *v3;
  UIView *v4;
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
  UIView *v18;
  void *v19;
  UIView *v20;
  UIView *videoPlaceholderView;
  UIView *playButtonContainerView;
  UIView *v23;
  UIView *playButtonView;
  id v25;

  -[LPVisualMediaView playButtonImage](self, "playButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platformImage");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[UIView addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_tapRecognized_, 0x2000);
  objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  objc_msgSend(v5, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVisualEffect:", v7);

  -[LPVisualMediaViewStyle playButton](self->_style, "playButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseForegroundColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseBackgroundColor:", v11);

  v12 = (void *)MEMORY[0x1E0DC3888];
  -[LPVisualMediaViewStyle playButton](self->_style, "playButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "width");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  objc_msgSend(v12, "configurationWithPointSize:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v16);
  -[UIView setPreferredBehavioralStyle:](v4, "setPreferredBehavioralStyle:", 1);
  -[UIView setConfiguration:](v4, "setConfiguration:", v5);
  -[UIView setContentMode:](v4, "setContentMode:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](v4, "setTintColor:", v17);

  v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  if (-[LPVisualMediaViewConfiguration disablePlayback](self->_configuration, "disablePlayback")
    || -[LPVisualMediaViewConfiguration disablePlaybackControls](self->_configuration, "disablePlaybackControls"))
  {
    -[LPVisualMediaViewStyle playButton](self->_style, "playButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "disabledOpacity");
    -[UIView setAlpha:](v4, "setAlpha:");

  }
  -[UIView addSubview:](v18, "addSubview:", v4);
  -[LPVisualMediaView _createPosterFrameView](self, "_createPosterFrameView");
  v20 = (UIView *)objc_claimAutoreleasedReturnValue();
  videoPlaceholderView = self->_videoPlaceholderView;
  self->_videoPlaceholderView = v20;

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_videoPlaceholderView);
  -[UIView addSubview:](self->_containerView, "addSubview:", v18);
  playButtonContainerView = self->_playButtonContainerView;
  self->_playButtonContainerView = v18;
  v23 = v18;

  playButtonView = self->_playButtonView;
  self->_playButtonView = v4;

}

- (BOOL)shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:(id)a3
{
  UIView *v4;

  objc_msgSend(a3, "view");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 != self->_muteButtonContainerView;

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)swapVideoPlaceholderForPlaybackIfNeeded
{
  if (!self->_playbackView)
    -[LPVisualMediaView _swapVideoPlaceholderForVideoForAutoPlay:](self, "_swapVideoPlaceholderForVideoForAutoPlay:", 0);
}

- (void)tapRecognized:(id)a3
{
  -[LPVisualMediaView userInteractedWithVideoView](self, "userInteractedWithVideoView", a3);
  if (self->_playbackView)
  {
    if (!self->_fullScreen && (self->_playing || self->_waitingForPlayback))
    {
      -[LPVisualMediaView enterFullScreen](self, "enterFullScreen");
      return;
    }
  }
  else
  {
    -[LPVisualMediaView swapVideoPlaceholderForPlaybackIfNeeded](self, "swapVideoPlaceholderForPlaybackIfNeeded");
  }
  -[LPVisualMediaView setPlaying:](self, "setPlaying:", !self->_playing);
}

- (void)destroyFullScreenViewController
{
  LPFullScreenVideoController *fullScreenController;

  -[LPFullScreenVideoController dismiss](self->_fullScreenController, "dismiss");
  fullScreenController = self->_fullScreenController;
  self->_fullScreenController = 0;

}

- (void)recreateFullScreenViewControllerIfNeeded
{
  LPFullScreenVideoController *v3;
  LPFullScreenVideoController *fullScreenController;

  if (!self->_fullScreenController)
  {
    -[LPVisualMediaView createFullScreenVideoViewController](self, "createFullScreenVideoViewController");
    v3 = (LPFullScreenVideoController *)objc_claimAutoreleasedReturnValue();
    fullScreenController = self->_fullScreenController;
    self->_fullScreenController = v3;

  }
}

- (void)enterFullScreen
{
  if (-[LPVisualMediaView usesCustomFullScreenImplementation](self, "usesCustomFullScreenImplementation"))
  {
    -[LPVisualMediaView enterCustomFullScreen](self, "enterCustomFullScreen");
  }
  else
  {
    self->_fullScreen = 1;
    -[LPVisualMediaView recreateFullScreenViewControllerIfNeeded](self, "recreateFullScreenViewControllerIfNeeded");
    -[LPFullScreenVideoController present](self->_fullScreenController, "present");
  }
}

- (void)fullScreenVideoDidPresent
{
  -[LPVisualMediaView setMuted:](self, "setMuted:", 0);
  -[LPVisualMediaView setPlaying:](self, "setPlaying:", 1);
  -[LPVisualMediaView setHidden:](self, "setHidden:", 1);
}

- (void)fullScreenVideoWillDismiss
{
  -[LPVisualMediaView setMuted:](self, "setMuted:", 1);
  -[LPVisualMediaView setHidden:](self, "setHidden:", 0);
  -[LPVisualMediaView hideMuteButton](self, "hideMuteButton");
}

- (void)fullScreenVideoDidDismiss
{
  -[LPVisualMediaView fadeInMuteButton](self, "fadeInMuteButton");
  self->_fullScreen = 0;
}

- (void)_muteButtonHighlightLongPressRecognized:(id)a3
{
  uint64_t v4;
  UIView *muteButtonContainerView;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    muteButtonContainerView = self->_muteButtonContainerView;
    -[LPVisualMediaViewStyle muteButtonOpacity](self->_style, "muteButtonOpacity");
LABEL_5:
    -[UIView _lp_setOpacity:](muteButtonContainerView, "_lp_setOpacity:");
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    muteButtonContainerView = self->_muteButtonContainerView;
    -[LPVisualMediaViewStyle muteButtonHighlightedOpacity](self->_style, "muteButtonHighlightedOpacity");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_muteButtonTapRecognized:(id)a3
{
  -[LPVisualMediaView userInteractedWithVideoView](self, "userInteractedWithVideoView", a3);
  -[LPVisualMediaView setMuted:](self, "setMuted:", -[LPVisualMediaView isMuted](self, "isMuted") ^ 1);
}

- (BOOL)isActive
{
  return !-[LPVisualMediaView isMuted](self, "isMuted");
}

- (void)setActive:(BOOL)a3
{
  -[LPVisualMediaView setMuted:](self, "setMuted:", !a3);
}

- (BOOL)usesSharedAudioSession
{
  return self->_usesSharedAudioSession;
}

- (BOOL)allowsUserInteractionWithVideoPlayer
{
  return self->_allowsUserInteractionWithVideoPlayer;
}

- (BOOL)isWaitingForPlayback
{
  return self->_waitingForPlayback;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (BOOL)hasEverPlayed
{
  return self->_hasEverPlayed;
}

- (void)setHasEverPlayed:(BOOL)a3
{
  self->_hasEverPlayed = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (LPVisualMedia)media
{
  return self->_media;
}

- (UIView)playbackView
{
  return self->_playbackView;
}

- (unsigned)loggingID
{
  return self->_loggingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_fullScreenController, 0);
  objc_storeStrong((id *)&self->_playButtonTapRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_debugIndicator, 0);
  objc_storeStrong((id *)&self->_playbackView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_pulsingLoadView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_videoPlaceholderView, 0);
  objc_storeStrong((id *)&self->_muteButtonView, 0);
  objc_storeStrong((id *)&self->_muteButtonContainerView, 0);
  objc_storeStrong((id *)&self->_playButtonView, 0);
  objc_storeStrong((id *)&self->_playButtonContainerView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_posterFrameStyle, 0);
  objc_storeStrong((id *)&self->_posterFrame, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_video, 0);
}

@end
