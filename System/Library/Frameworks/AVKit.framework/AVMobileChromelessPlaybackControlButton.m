@implementation AVMobileChromelessPlaybackControlButton

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet *styleSheet;
  void *v7;
  AVMobileChromelessControlsStyleSheet *v8;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  if (self->_styleSheet != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    styleSheet = self->_styleSheet;
    if (self->_playbackControlButtonType)
      -[AVMobileChromelessControlsStyleSheet secondaryPlaybackControlsFont](styleSheet, "secondaryPlaybackControlsFont");
    else
      -[AVMobileChromelessControlsStyleSheet playPauseButtonFont](styleSheet, "playPauseButtonFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setInlineFont:](self, "setInlineFont:", v7);
    -[AVMobileChromelessPlaybackControlButton setNeedsLayout](self, "setNeedsLayout");

    -[AVMobileChromelessPlaybackControlButton setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setPlayPauseButtonMicaPackage:(id)a3
{
  AVMicaPackage *v5;
  AVMicaPackage *v6;

  v5 = (AVMicaPackage *)a3;
  if (self->_playPauseButtonMicaPackage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_playPauseButtonMicaPackage, a3);
    v5 = v6;
    if (v6)
    {
      -[AVMobileChromelessPlaybackControlButton _updateMicaPackage](self, "_updateMicaPackage");
      v5 = v6;
    }
  }

}

- (id)pointerTargetView
{
  UIView *v2;

  if (self->_playbackControlButtonType)
  {
    -[AVMobileChromelessPlaybackControlButton imageView](self, "imageView");
    v2 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_playPauseButtonMicaPackageContainerView;
  }
  return v2;
}

- (void)setPlaybackControlButtonIconState:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_playbackControlButtonIconState, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_playbackControlButtonIconState, a3);
    -[AVMobileChromelessPlaybackControlButton _updateMicaPackage](self, "_updateMicaPackage");
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  UIViewPropertyAnimator *highlightAnimator;
  double v6;
  double v7;
  id v8;
  UIViewPropertyAnimator *v9;
  UIViewPropertyAnimator *v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  id location;
  objc_super v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVMobileChromelessPlaybackControlButton;
  if (-[AVMobileChromelessPlaybackControlButton isHighlighted](&v16, sel_isHighlighted) != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)AVMobileChromelessPlaybackControlButton;
    -[AVButton setHighlighted:](&v15, sel_setHighlighted_, v3);
    if (-[UIViewPropertyAnimator isRunning](self->_highlightAnimator, "isRunning"))
    {
      if (-[UIViewPropertyAnimator isInterruptible](self->_highlightAnimator, "isInterruptible"))
      {
        -[UIViewPropertyAnimator stopAnimation:](self->_highlightAnimator, "stopAnimation:", 1);
        -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_highlightAnimator, "finishAnimationAtPosition:", 2);
        highlightAnimator = self->_highlightAnimator;
        self->_highlightAnimator = 0;

      }
    }
    -[UIViewPropertyAnimator fractionComplete](self->_highlightAnimator, "fractionComplete");
    v7 = v6;
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__AVMobileChromelessPlaybackControlButton_setHighlighted___block_invoke;
    v11[3] = &unk_1E5BB4CC8;
    objc_copyWeak(&v12, &location);
    v13 = v3;
    v9 = (UIViewPropertyAnimator *)objc_msgSend(v8, "initWithDuration:curve:animations:", 2, v11, (1.0 - v7) * 0.2);
    v10 = self->_highlightAnimator;
    self->_highlightAnimator = v9;

    -[UIViewPropertyAnimator startAnimation](self->_highlightAnimator, "startAnimation");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  unint64_t playbackControlButtonType;
  uint64_t v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id location;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessPlaybackControlButton;
  -[AVMobileChromelessPlaybackControlButton didMoveToWindow](&v6, sel_didMoveToWindow);
  -[AVMobileChromelessPlaybackControlButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    playbackControlButtonType = self->_playbackControlButtonType;

    if (!playbackControlButtonType && !self->_playPauseButtonMicaPackage && !self->_isPreparingMicaPackage)
    {
      self->_isPreparingMicaPackage = 1;
      objc_initWeak(&location, self);
      v5 = -[AVMobileChromelessPlaybackControlButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__AVMobileChromelessPlaybackControlButton__setupMicaPackageIfNeeded__block_invoke;
      v7[3] = &unk_1E5BB3EF0;
      objc_copyWeak(&v8, &location);
      +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:](AVMicaPackage, "asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:", CFSTR("PlayPauseGlyph"), v5, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  _BOOL4 IsIdentity;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  UIView *highlightView;
  double MidX;
  void *v25;
  objc_super v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;

  v26.receiver = self;
  v26.super_class = (Class)AVMobileChromelessPlaybackControlButton;
  -[AVButton layoutSubviews](&v26, sel_layoutSubviews);
  if (self)
  {
    if (self->_playPauseButtonMicaPackage)
      -[AVMobileChromelessPlaybackControlButton _updateMicaPackage](self, "_updateMicaPackage");
    -[AVMobileChromelessPlaybackControlButton playPauseButtonMicaPackageContainerView](self, "playPauseButtonMicaPackageContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "transform");
    else
      memset(&v27, 0, sizeof(v27));
    IsIdentity = CGAffineTransformIsIdentity(&v27);

    if (IsIdentity)
    {
      -[AVMobileChromelessPlaybackControlButton bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[AVMobileChromelessPlaybackControlButton playPauseButtonMicaPackageContainerView](self, "playPauseButtonMicaPackageContainerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[AVButton micaPackage](self, "micaPackage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rootLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      UIRectGetCenter();
      objc_msgSend(v16, "setPosition:");

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      -[AVButton micaPackage](self, "micaPackage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rootLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMobileChromelessPlaybackControlButton bounds](self, "bounds");
      UIRectGetCenter();
      objc_msgSend(v18, "setPosition:");

    }
  }
  -[AVMobileChromelessPlaybackControlButton bounds](self, "bounds");
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  highlightView = self->_highlightView;
  MidX = CGRectGetMidX(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  -[UIView setCenter:](highlightView, "setCenter:", MidX, CGRectGetMidY(v29));
  -[UIView layer](self->_highlightView, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerRadius:", height * 0.5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 46.0;
  v3 = 46.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_imageNameForMicaPackageState
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (_imageNameForMicaPackageState_onceToken_9487 != -1)
    dispatch_once(&_imageNameForMicaPackageState_onceToken_9487, &__block_literal_global_9488);
  v3 = (void *)_imageNameForMicaPackageState_imageNamesForStates_9489;
  -[AVMobileChromelessPlaybackControlButton playbackControlButtonIconState](self, "playbackControlButtonIconState");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("pause");
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateMicaPackage
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  BOOL v36;
  void *v37;
  NSObject *v38;
  AVMobileChromelessPlaybackControlButton *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[AVMobileChromelessPlaybackControlButton playPauseButtonMicaPackage](self, "playPauseButtonMicaPackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[UIView avkit_isBeingScrolled](self, "avkit_isBeingScrolled");
  else
    v4 = 0;
  objc_msgSend(v3, "rootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_playPauseButtonMicaPackageContainerView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVMobileChromelessPlaybackControlButton playbackControlButtonIconState](self, "playbackControlButtonIconState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:color:", v8, 0);

  objc_msgSend(v3, "rootLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend(v9, "setOpacity:", v10);

  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v47 = "-[AVMobileChromelessPlaybackControlButton _updateMicaPackage]";
    v48 = 1024;
    v49 = v4;
    v50 = 1024;
    v51 = -[UIView avkit_isBeingScrolled](self, "avkit_isBeingScrolled");
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s : prefers images: %d, isBeingScrolled: %d", buf, 0x18u);
  }

  if (v4 && v6 != v7)
  {
    objc_initWeak((id *)buf, self);
    v12 = (void *)MEMORY[0x1E0DC3870];
    -[AVMobileChromelessPlaybackControlButton _imageNameForMicaPackageState](self, "_imageNameForMicaPackageState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __61__AVMobileChromelessPlaybackControlButton__updateMicaPackage__block_invoke;
    v44[3] = &unk_1E5BB2390;
    objc_copyWeak(&v45, (id *)buf);
    objc_msgSend(v12, "avkit_imageNamed:completion:", v13, v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[AVMobileChromelessPlaybackControlButton imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    objc_msgSend(v3, "rootLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_playPauseButtonMicaPackageContainerView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16 == v17;

    if (!v18)
    {
      _AVLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[AVMobileChromelessPlaybackControlButton _updateMicaPackage]";
        _os_log_impl(&dword_1AC4B1000, v19, OS_LOG_TYPE_DEFAULT, "%s : setting up micaPackage layer.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[AVMobileChromelessPlaybackControlButton layer](self, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCompositingFilter:", 0);

      -[UIView layer](self->_playPauseButtonMicaPackageContainerView, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCompositingFilter:", 0);

      -[UIView layer](self->_playPauseButtonMicaPackageContainerView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rootLayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSublayer:", v23);

      -[AVMobileChromelessPlaybackControlButton addSubview:](self, "addSubview:", self->_playPauseButtonMicaPackageContainerView);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    -[AVMobileChromelessControlsStyleSheet playPauseButtonFont](self->_styleSheet, "playPauseButtonFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pointSize");
    v26 = v25;
    -[AVMobileChromelessControlsStyleSheet playPauseButtonFont](self->_styleSheet, "playPauseButtonFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pointSize");
    objc_msgSend(v3, "setTargetSize:", v26, v28);

    -[AVMobileChromelessPlaybackControlButton bounds](self, "bounds");
    UIRectGetCenter();
    v30 = v29;
    v32 = v31;
    objc_msgSend(v3, "rootLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "position");
    v36 = v32 == v35 && v30 == v34;

    if (!v36)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(v3, "rootLayer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMobileChromelessPlaybackControlButton bounds](self, "bounds");
      UIRectGetCenter();
      objc_msgSend(v37, "setPosition:");

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  -[AVMobileChromelessPlaybackControlButton imageView](self, "imageView");
  v38 = objc_claimAutoreleasedReturnValue();
  -[NSObject superview](v38, "superview");
  v39 = (AVMobileChromelessPlaybackControlButton *)objc_claimAutoreleasedReturnValue();
  if (v39 == self)
  {
    objc_msgSend(v3, "rootLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "superlayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_playPauseButtonMicaPackageContainerView, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v41 == v42;

    if (!v43)
      goto LABEL_21;
    _AVLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v38, OS_LOG_TYPE_ERROR, "Both the imageView and the micaPackage rootLayer are visible in the hierarchy at the same time.", buf, 2u);
    }
  }
  else
  {

  }
LABEL_21:

}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (NSString)playbackControlButtonIconState
{
  return self->_playbackControlButtonIconState;
}

- (AVMicaPackage)playPauseButtonMicaPackage
{
  return self->_playPauseButtonMicaPackage;
}

- (UIView)playPauseButtonMicaPackageContainerView
{
  return self->_playPauseButtonMicaPackageContainerView;
}

- (void)setPlayPauseButtonMicaPackageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButtonMicaPackageContainerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playPauseButtonMicaPackageContainerView, 0);
  objc_storeStrong((id *)&self->_playPauseButtonMicaPackage, 0);
  objc_storeStrong((id *)&self->_playbackControlButtonIconState, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_highlightAnimator, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

void __61__AVMobileChromelessPlaybackControlButton__updateMicaPackage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(WeakRetained, "micaPackage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperlayer");

    objc_msgSend(WeakRetained, "avkit_makeSubtreeDisallowGroupBlending");
    objc_msgSend(WeakRetained, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

    objc_msgSend(WeakRetained, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v11);

    objc_msgSend(WeakRetained, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v3);

    objc_msgSend(WeakRetained, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained(v4);
    objc_msgSend(v14, "bounds");
    objc_msgSend(v13, "setFrame:");

    objc_msgSend(WeakRetained, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentMode:", 4);

    v16 = objc_loadWeakRetained(v4);
    objc_msgSend(v16, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addSubview:", v17);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    _AVLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[AVMobileChromelessPlaybackControlButton _updateMicaPackage]_block_invoke";
      _os_log_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_DEFAULT, "%s : ImageView setup; micaPackage rootLayer removed from superlayer.",
        (uint8_t *)&v19,
        0xCu);
    }

  }
}

void __72__AVMobileChromelessPlaybackControlButton__imageNameForMicaPackageState__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("play");
  v2[1] = CFSTR("pause");
  v3[0] = CFSTR("play.fill");
  v3[1] = CFSTR("pause.fill");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_imageNameForMicaPackageState_imageNamesForStates_9489;
  _imageNameForMicaPackageState_imageNamesForStates_9489 = v0;

}

void __68__AVMobileChromelessPlaybackControlButton__setupMicaPackageIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  _BYTE *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setPlayPauseButtonMicaPackage:", v5);
    v4[1064] = 0;
  }

}

void __58__AVMobileChromelessPlaybackControlButton_setHighlighted___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  __int128 v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  id v8;
  char v9;
  double v10;
  id v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_15;
  memset(&v14, 0, sizeof(v14));
  if (*(_BYTE *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v14, 1.2, 1.2);
    if (WeakRetained[130])
    {
      memset(&v13, 0, sizeof(v13));
      CGAffineTransformMakeScale(&v13, 0.8, 0.8);
LABEL_7:
      objc_msgSend(WeakRetained, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(WeakRetained, "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      objc_msgSend(v5, "setTransform:", &v12);

      goto LABEL_11;
    }
    memset(&v13, 0, sizeof(v13));
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v12.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v12.c = v6;
    *(_OWORD *)&v12.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v13, &v12, 0.8, 0.8);
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 1.4, 1.4);
    if (WeakRetained[130])
    {
      v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v13.c = v3;
      *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      goto LABEL_7;
    }
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v8 = WeakRetained[137];
  v12 = v13;
  objc_msgSend(v8, "setTransform:", &v12);
LABEL_11:
  v9 = objc_msgSend(WeakRetained, "isHovered");
  v10 = 0.0;
  if ((v9 & 1) == 0)
  {
    v10 = 0.2;
    if (!*(_BYTE *)(a1 + 40))
      v10 = 0.0;
  }
  objc_msgSend(WeakRetained[131], "setAlpha:", v10);
  v11 = WeakRetained[131];
  v13 = v14;
  objc_msgSend(v11, "setTransform:", &v13);
LABEL_15:

}

+ (id)playPauseButtonWithStyleSheet:(id)a3
{
  return +[AVMobileChromelessPlaybackControlButton buttonWithAccessibilityIdentifier:withStyleSheet:withPlaybackControlButtonType:](AVMobileChromelessPlaybackControlButton, "buttonWithAccessibilityIdentifier:withStyleSheet:withPlaybackControlButtonType:", CFSTR("Play/Pause"), a3, 0);
}

+ (id)forwardSecondaryButtonWithStyleSheet:(id)a3
{
  return +[AVMobileChromelessPlaybackControlButton buttonWithAccessibilityIdentifier:withStyleSheet:withPlaybackControlButtonType:](AVMobileChromelessPlaybackControlButton, "buttonWithAccessibilityIdentifier:withStyleSheet:withPlaybackControlButtonType:", CFSTR("Forward Secondary Control"), a3, 1);
}

+ (id)backwardSecondaryButtonWithStyleSheet:(id)a3
{
  return +[AVMobileChromelessPlaybackControlButton buttonWithAccessibilityIdentifier:withStyleSheet:withPlaybackControlButtonType:](AVMobileChromelessPlaybackControlButton, "buttonWithAccessibilityIdentifier:withStyleSheet:withPlaybackControlButtonType:", CFSTR("Backward Secondary Control"), a3, 2);
}

+ (AVMobileChromelessPlaybackControlButton)buttonWithAccessibilityIdentifier:(id)a3 withStyleSheet:(id)a4 withPlaybackControlButtonType:(unint64_t)a5
{
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  CGAffineTransform v27;
  CGAffineTransform v28;
  objc_super v29;

  v9 = a4;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___AVMobileChromelessPlaybackControlButton;
  objc_msgSendSuper2(&v29, sel_customHighlightedAnimationButtonWithAccessibilityIdentifier_, a3);
  v10 = objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v10 + 1064) = 0;
  objc_storeStrong((id *)(v10 + 1072), a4);
  *(_QWORD *)(v10 + 1040) = a5;
  if (a5)
  {
    objc_msgSend(v9, "secondaryPlaybackControlsFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "setInlineFont:", v11);

    if (a5 == 2)
      v12 = CFSTR("gobackward.10");
    else
      v12 = CFSTR("goforward.10");
    objc_msgSend((id)v10, "setImageName:", v12);
  }
  else
  {
    objc_msgSend((id)v10, "setImageName:", CFSTR("AVMobileImageNameNoImage"));
    v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v14 = *(void **)(v10 + 1096);
    *(_QWORD *)(v10 + 1096) = v13;

    objc_msgSend(*(id *)(v10 + 1096), "setUserInteractionEnabled:", 0);
    objc_msgSend(*(id *)(v10 + 1096), "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupBlending:", 1);

    objc_msgSend((id)v10, "addSubview:", *(_QWORD *)(v10 + 1096));
    objc_msgSend(v9, "playPauseButtonFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "setInlineFont:", v16);

    objc_msgSend((id)v10, "setPlaybackControlButtonIconState:", CFSTR("pause"));
  }
  v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v18 = *(void **)(v10 + 1048);
  *(_QWORD *)(v10 + 1048) = v17;

  objc_msgSend(*(id *)(v10 + 1048), "setUserInteractionEnabled:", 0);
  v19 = *(void **)(v10 + 1048);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  objc_msgSend(*(id *)(v10 + 1048), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(v10 + 1048), "setFrame:", 0.0, 0.0, 46.0, 46.0);
  objc_msgSend(*(id *)(v10 + 1048), "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v10 + 1048), "frame");
  objc_msgSend(v21, "setCornerRadius:", v22 * 0.5);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "setTintColor:", v23);

  objc_msgSend((id)v10, "setAutoresizingMask:", 0);
  objc_msgSend((id)v10, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentMode:", 1);

  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeScale(&v28, 1.4, 1.4);
  v25 = *(void **)(v10 + 1048);
  v27 = v28;
  objc_msgSend(v25, "setTransform:", &v27);
  objc_msgSend((id)v10, "insertSubview:atIndex:", *(_QWORD *)(v10 + 1048), 0);

  return (AVMobileChromelessPlaybackControlButton *)(id)v10;
}

@end
