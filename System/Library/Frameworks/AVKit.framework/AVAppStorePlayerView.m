@implementation AVAppStorePlayerView

- (AVAppStorePlayerView)initWithFrame:(CGRect)a3
{
  AVAppStorePlayerView *v3;
  id v4;
  uint64_t v5;
  UIView *contentOverlayView;
  NSMutableDictionary *v7;
  NSMutableDictionary *videoGravityForLayoutClassDictionary;
  uint64_t v9;
  AVButton *prominentPlayButton;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  AVLayoutView *v15;
  uint64_t v16;
  AVLayoutView *prominentPlayButtonLayoutView;
  AVMobileChromeControlsStyleSheet *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  AVMobileChromeControlsStyleSheet *styleSheet;
  id v23;
  uint64_t v24;
  UIView *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)AVAppStorePlayerView;
  v3 = -[AVAppStorePlayerView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (AVAppStorePlayerViewDisableVideo_onceToken != -1)
      dispatch_once(&AVAppStorePlayerViewDisableVideo_onceToken, &__block_literal_global_53);
    if (AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[AVAppStorePlayerView bounds](v3, "bounds");
      v5 = objc_msgSend(v4, "initWithFrame:");
      contentOverlayView = v3->_contentOverlayView;
      v3->_contentOverlayView = (UIView *)v5;

      -[AVAppStorePlayerView contentOverlayView](v3, "contentOverlayView");
    }
    else
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      videoGravityForLayoutClassDictionary = v3->_videoGravityForLayoutClassDictionary;
      v3->_videoGravityForLayoutClassDictionary = v7;

      +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Central Play"), 0);
      v9 = objc_claimAutoreleasedReturnValue();
      prominentPlayButton = v3->_prominentPlayButton;
      v3->_prominentPlayButton = (AVButton *)v9;

      -[AVButton setClampsHitRectInsetsWhenContainedInScrollableView:](v3->_prominentPlayButton, "setClampsHitRectInsetsWhenContainedInScrollableView:", 1);
      -[AVButton setImageName:](v3->_prominentPlayButton, "setImageName:", CFSTR("play.fill"));
      v11 = (void *)MEMORY[0x1E0DC1350];
      v12 = *MEMORY[0x1E0DC4AE8];
      -[AVAppStorePlayerView traitCollection](v3, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferredFontForTextStyle:compatibleWithTraitCollection:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVButton setFullScreenFont:](v3->_prominentPlayButton, "setFullScreenFont:", v14);

      -[AVButton addTarget:action:forControlEvents:](v3->_prominentPlayButton, "addTarget:action:forControlEvents:", v3, sel__prominentPlayButtonTouchUpInside_, 64);
      v15 = [AVLayoutView alloc];
      -[AVAppStorePlayerView bounds](v3, "bounds");
      v16 = -[AVLayoutView initWithFrame:](v15, "initWithFrame:");
      prominentPlayButtonLayoutView = v3->_prominentPlayButtonLayoutView;
      v3->_prominentPlayButtonLayoutView = (AVLayoutView *)v16;

      -[AVLayoutView setShapeStyle:](v3->_prominentPlayButtonLayoutView, "setShapeStyle:", 1);
      -[AVView setIgnoresTouches:](v3->_prominentPlayButtonLayoutView, "setIgnoresTouches:", 1);
      v18 = [AVMobileChromeControlsStyleSheet alloc];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[AVMobileChromeControlsStyleSheet initWithTraitCollection:shouldUseCompactFullScreenSize:](v18, "initWithTraitCollection:shouldUseCompactFullScreenSize:", v20, 0);
      styleSheet = v3->_styleSheet;
      v3->_styleSheet = (AVMobileChromeControlsStyleSheet *)v21;

      v23 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[AVAppStorePlayerView bounds](v3, "bounds");
      v24 = objc_msgSend(v23, "initWithFrame:");
      v25 = v3->_contentOverlayView;
      v3->_contentOverlayView = (UIView *)v24;

      -[AVAppStorePlayerView contentOverlayView](v3, "contentOverlayView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAppStorePlayerView addSubview:](v3, "addSubview:", v26);

      -[AVAppStorePlayerView prominentPlayButtonLayoutView](v3, "prominentPlayButtonLayoutView");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAppStorePlayerView addSubview:](v3, "addSubview:", v27);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVAppStorePlayerView observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVAppStorePlayerView;
  -[AVAppStorePlayerView dealloc](&v4, sel_dealloc);
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_showsPlaybackControls = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsPlaybackControls:", v3);

}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_updatesNowPlayingInfoCenter = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdatesNowPlayingInfoCenter:", v3);

}

- (void)setShowsMinimalPlaybackControlsWhenEmbeddedInline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_showsMinimalPlaybackControlsWhenEmbeddedInline = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", v3);

}

- (void)setCanPausePlaybackWhenExitingFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_canPausePlaybackWhenExitingFullScreen = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanPausePlaybackWhenExitingFullScreen:", v3);

}

- (void)setAllowsEnteringFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_allowsEnteringFullScreen = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEnteringFullScreen:", v3);

}

- (void)setVideoGravity:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_videoGravity, a3);
  v5 = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVideoGravity:", v5);

}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  id v4;

  self->_preferredUnobscuredArea = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredUnobscuredArea:", a3);

}

- (void)setPlayerViewControllerDelegate:(id)a3
{
  AVPlayerViewControllerDelegate **p_playerViewControllerDelegate;
  id v5;
  id v6;

  p_playerViewControllerDelegate = &self->_playerViewControllerDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_playerViewControllerDelegate, v5);
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

}

- (void)setPlayer:(id)a3
{
  AVPlayer *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  int v10;
  void *observationController;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AVObservationController *v17;
  AVPlayer *v18;

  v5 = (AVPlayer *)a3;
  if (self->_player != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_player, a3);
    -[AVAppStorePlayerView playerViewController](self, "playerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayer:", v18);

    -[AVAppStorePlayerView observationController](self, "observationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAllObservation");

    -[AVAppStorePlayerView player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rate");
    if (v9 == 0.0)
    {
      if (AVAppStorePlayerViewDisableVideo_onceToken != -1)
        dispatch_once(&AVAppStorePlayerViewDisableVideo_onceToken, &__block_literal_global_53);
      v10 = AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo;

      if (!v10)
      {
        -[AVAppStorePlayerView playerViewController](self, "playerViewController");
        observationController = (void *)objc_claimAutoreleasedReturnValue();
        if (!observationController)
        {
          -[AVAppStorePlayerView playerLayerView](self, "playerLayerView");
          observationController = (void *)objc_claimAutoreleasedReturnValue();
          if (!observationController)
          {
            -[AVAppStorePlayerView player](self, "player");
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
              goto LABEL_9;
            v15 = (void *)v14;
            -[AVAppStorePlayerView observationController](self, "observationController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              goto LABEL_9;
            v17 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", self);
            observationController = self->_observationController;
            self->_observationController = v17;
          }
        }

LABEL_9:
        -[AVAppStorePlayerView observationController](self, "observationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "startObserving:keyPath:observationHandler:", v18, CFSTR("rate"), &__block_literal_global_20);

LABEL_12:
        v5 = v18;
        goto LABEL_13;
      }
    }
    else
    {

    }
    -[AVAppStorePlayerView _makeActualVideoViewWithPlayerIfNeeded:](self, "_makeActualVideoViewWithPlayerIfNeeded:", v18);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)setVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a3;
    -[AVAppStorePlayerView videoGravityForLayoutClassDictionary](self, "videoGravityForLayoutClassDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    -[AVAppStorePlayerView playerViewController](self, "playerViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVideoGravity:forLayoutClass:", v6, a4);

  }
}

- (void)setPlayButtonHandlerForLazyPlayerLoading:(id)a3
{
  id v4;
  void *v5;
  id playButtonHandlerForLazyPlayerLoading;
  id v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  playButtonHandlerForLazyPlayerLoading = self->_playButtonHandlerForLazyPlayerLoading;
  self->_playButtonHandlerForLazyPlayerLoading = v5;

  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayButtonHandlerForLazyPlayerLoading:", v4);

}

- (void)setClipsToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVAppStorePlayerView;
  -[AVAppStorePlayerView setClipsToBounds:](&v7, sel_setClipsToBounds_);
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", v3);

}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAppStorePlayerView;
  -[AVAppStorePlayerView _setContinuousCornerRadius:](&v7, sel__setContinuousCornerRadius_);
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setContinuousCornerRadius:", a3);

}

- (void)layoutSubviews
{
  void *v3;
  AVAppStorePlayerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double Width;
  void *v16;
  double Height;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v57.receiver = self;
  v57.super_class = (Class)AVAppStorePlayerView;
  -[AVAppStorePlayerView layoutSubviews](&v57, sel_layoutSubviews);
  -[AVAppStorePlayerView contentOverlayView](self, "contentOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (AVAppStorePlayerView *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[AVAppStorePlayerView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AVAppStorePlayerView contentOverlayView](self, "contentOverlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[AVAppStorePlayerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutFrame");
    Width = CGRectGetWidth(v58);

    -[AVAppStorePlayerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutFrame");
    Height = CGRectGetHeight(v59);

    -[AVAppStorePlayerView styleSheet](self, "styleSheet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultItemInlineSize");
    v20 = v19;

    if (v20 < Width)
      v20 = Width;
    -[AVAppStorePlayerView styleSheet](self, "styleSheet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "maximumProminentPlayButtonDimension");
    v23 = v22;

    if (v20 >= v23)
      v20 = v23;
    -[AVAppStorePlayerView styleSheet](self, "styleSheet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "minimumProminentPlayButtonDimension");
    v26 = v25;

    if (v26 >= Height)
      Height = v26;
    -[AVAppStorePlayerView styleSheet](self, "styleSheet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "maximumProminentPlayButtonDimension");
    v29 = v28;

    if (Height >= v29)
      v30 = v29;
    else
      v30 = Height;
    if (v20 >= v30)
      v31 = v30;
    else
      v31 = v20;
    -[AVAppStorePlayerView bounds](self, "bounds");
    v32 = (CGRectGetWidth(v60) - v31) * 0.5;
    -[AVAppStorePlayerView bounds](self, "bounds");
    v33 = CGRectGetMinX(v61) + v32;
    -[AVAppStorePlayerView bounds](self, "bounds");
    v34 = (CGRectGetHeight(v62) - v31) * 0.5;
    -[AVAppStorePlayerView bounds](self, "bounds");
    v35 = v34 + CGRectGetMinY(v63);
    -[AVAppStorePlayerView prominentPlayButtonLayoutView](self, "prominentPlayButtonLayoutView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFrame:", v33, v35, v31, v31);

    -[AVAppStorePlayerView prominentPlayButton](self, "prominentPlayButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setExtrinsicContentSize:", v31, v31);

  }
  -[AVAppStorePlayerView bounds](self, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  -[AVAppStorePlayerView playerLayerView](self, "playerLayerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  -[AVAppStorePlayerView bounds](self, "bounds");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFrame:", v48, v50, v52, v54);

}

- (void)_makeActualVideoViewWithPlayerIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  AVObservationController *observationController;
  void *v7;
  id v8;

  v8 = a3;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (-[AVAppStorePlayerView playerLayerView](self, "playerLayerView"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_3:

    goto LABEL_4;
  }
  if (AVAppStorePlayerViewDisableVideo_onceToken != -1)
    dispatch_once(&AVAppStorePlayerViewDisableVideo_onceToken, &__block_literal_global_53);
  if (!AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo)
  {
    if (AVAppStorePlayerViewUsePlayerLayerOnly_onceToken != -1)
      dispatch_once(&AVAppStorePlayerViewUsePlayerLayerOnly_onceToken, &__block_literal_global_2);
    if (AVAppStorePlayerViewUsePlayerLayerOnly_AVAppStorePlayerViewUsePlayerLayerOnly)
    {
      -[AVAppStorePlayerView _makePlayerLayerViewWithPlayer:](self, "_makePlayerLayerViewWithPlayer:", v8);
      -[AVAppStorePlayerView playerLayerView](self, "playerLayerView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAppStorePlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0);
    }
    else
    {
      -[AVAppStorePlayerView _makePlayerViewControllerWithPlayer:](self, "_makePlayerViewControllerWithPlayer:", v8);
      -[AVAppStorePlayerView playerViewController](self, "playerViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAppStorePlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);

    }
    goto LABEL_3;
  }
LABEL_4:
  -[AVAppStorePlayerView observationController](self, "observationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAllObservation");

  observationController = self->_observationController;
  self->_observationController = 0;

}

- (void)_makePlayerLayerViewWithPlayer:(id)a3
{
  id v4;
  AVAppStorePlayerLayerView *v5;
  AVAppStorePlayerLayerView *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = [AVAppStorePlayerLayerView alloc];
  -[AVAppStorePlayerView bounds](self, "bounds");
  v6 = -[AVAppStorePlayerLayerView initWithFrame:](v5, "initWithFrame:");
  -[AVAppStorePlayerView setPlayerLayerView:](self, "setPlayerLayerView:", v6);

  -[AVAppStorePlayerView playerLayerView](self, "playerLayerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayer:", v4);

}

- (void)_makePlayerViewControllerWithPlayer:(id)a3
{
  AVPlayerViewController *v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
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
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = -[AVPlayerViewController initWithNibName:bundle:]([AVPlayerViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[AVAppStorePlayerView setPlayerViewController:](self, "setPlayerViewController:", v4);

  v5 = -[AVAppStorePlayerView showsPlaybackControls](self, "showsPlaybackControls");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsPlaybackControls:", v5);

  v7 = -[AVAppStorePlayerView updatesNowPlayingInfoCenter](self, "updatesNowPlayingInfoCenter");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdatesNowPlayingInfoCenter:", v7);

  v9 = -[AVAppStorePlayerView showsMinimalPlaybackControlsWhenEmbeddedInline](self, "showsMinimalPlaybackControlsWhenEmbeddedInline");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowsMinimalPlaybackControlsWhenEmbeddedInline:", v9);

  v11 = -[AVAppStorePlayerView canPausePlaybackWhenExitingFullScreen](self, "canPausePlaybackWhenExitingFullScreen");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCanPausePlaybackWhenExitingFullScreen:", v11);

  v13 = -[AVAppStorePlayerView allowsEnteringFullScreen](self, "allowsEnteringFullScreen");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsEnteringFullScreen:", v13);

  -[AVAppStorePlayerView videoGravity](self, "videoGravity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVideoGravity:", v15);

  -[AVAppStorePlayerView playerViewControllerDelegate](self, "playerViewControllerDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", v17);

  -[AVAppStorePlayerView playButtonHandlerForLazyPlayerLoading](self, "playButtonHandlerForLazyPlayerLoading");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPlayButtonHandlerForLazyPlayerLoading:", v19);

  v21 = -[AVAppStorePlayerView clipsToBounds](self, "clipsToBounds");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClipsToBounds:", v21);

  -[AVAppStorePlayerView _continuousCornerRadius](self, "_continuousCornerRadius");
  v25 = v24;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_setContinuousCornerRadius:", v25);

  -[AVAppStorePlayerView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "maskedCorners");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMaskedCorners:", v29);

  v33 = -[AVAppStorePlayerView preferredUnobscuredArea](self, "preferredUnobscuredArea");
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPreferredUnobscuredArea:", v33);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[AVAppStorePlayerView videoGravityForLayoutClassDictionary](self, "videoGravityForLayoutClassDictionary", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "allKeys");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v68 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        v42 = objc_msgSend(v41, "unsignedIntegerValue");
        -[AVAppStorePlayerView videoGravityForLayoutClassDictionary](self, "videoGravityForLayoutClassDictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        -[AVAppStorePlayerView playerViewController](self, "playerViewController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setVideoGravity:forLayoutClass:", v44, v42);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v38);
  }

  -[AVAppStorePlayerView bounds](self, "bounds");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v47, v49, v51, v53);

  -[AVAppStorePlayerView player](self, "player");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setPlayer:", v56);

  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "contentOverlayView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView contentOverlayView](self, "contentOverlayView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addSubview:", v60);

  -[AVAppStorePlayerView contentOverlayView](self, "contentOverlayView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v62 = (void *)MEMORY[0x1E0CB3718];
  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "contentOverlayView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView contentOverlayView](self, "contentOverlayView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "avkit_constraintsFromCenterAndDimensionAnchorsToCenterAndDimensionAnchorsOfItem:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v66);

}

- (void)_prominentPlayButtonTouchUpInside:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[AVAppStorePlayerView player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAppStorePlayerView _makeActualVideoViewWithPlayerIfNeeded:](self, "_makeActualVideoViewWithPlayerIfNeeded:", v5);

  -[AVAppStorePlayerView playerViewController](self, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playButtonHandlerForLazyPlayerLoading");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVAppStorePlayerView playerViewController](self, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playButtonHandlerForLazyPlayerLoading");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke;
  v13[3] = &unk_1E5BB4CA0;
  v14 = v4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke_2;
  v12[3] = &unk_1E5BB3010;
  v11 = v4;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 196608, v13, v12, 0.2, 0.0);

}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (BOOL)updatesNowPlayingInfoCenter
{
  return self->_updatesNowPlayingInfoCenter;
}

- (BOOL)showsMinimalPlaybackControlsWhenEmbeddedInline
{
  return self->_showsMinimalPlaybackControlsWhenEmbeddedInline;
}

- (BOOL)canPausePlaybackWhenExitingFullScreen
{
  return self->_canPausePlaybackWhenExitingFullScreen;
}

- (BOOL)allowsEnteringFullScreen
{
  return self->_allowsEnteringFullScreen;
}

- (NSString)videoGravity
{
  return self->_videoGravity;
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (AVPlayer)player
{
  return self->_player;
}

- (id)playButtonHandlerForLazyPlayerLoading
{
  return self->_playButtonHandlerForLazyPlayerLoading;
}

- (AVPlayerViewControllerDelegate)playerViewControllerDelegate
{
  return (AVPlayerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_playerViewControllerDelegate);
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playerViewController, a3);
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (AVButton)prominentPlayButton
{
  return self->_prominentPlayButton;
}

- (void)setProminentPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_prominentPlayButton, a3);
}

- (AVLayoutView)prominentPlayButtonLayoutView
{
  return self->_prominentPlayButtonLayoutView;
}

- (void)setProminentPlayButtonLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_prominentPlayButtonLayoutView, a3);
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setStyleSheet:(id)a3
{
  objc_storeStrong((id *)&self->_styleSheet, a3);
}

- (AVAppStorePlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (void)setPlayerLayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayerView, a3);
}

- (NSMutableDictionary)videoGravityForLayoutClassDictionary
{
  return self->_videoGravityForLayoutClassDictionary;
}

- (void)setVideoGravityForLayoutClassDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_videoGravityForLayoutClassDictionary, a3);
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_videoGravityForLayoutClassDictionary, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_prominentPlayButtonLayoutView, 0);
  objc_storeStrong((id *)&self->_prominentPlayButton, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_playerViewControllerDelegate);
  objc_storeStrong(&self->_playButtonHandlerForLazyPlayerLoading, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_videoGravity, 0);
}

uint64_t __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58__AVAppStorePlayerView__prominentPlayButtonTouchUpInside___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "prominentPlayButtonLayoutView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setProminentPlayButtonLayoutView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "prominentPlayButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setProminentPlayButton:", 0);
}

void __34__AVAppStorePlayerView_setPlayer___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  float v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  if (v4 != 0.0)
  {
    objc_msgSend(v6, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_makeActualVideoViewWithPlayerIfNeeded:", v5);

  }
}

@end
