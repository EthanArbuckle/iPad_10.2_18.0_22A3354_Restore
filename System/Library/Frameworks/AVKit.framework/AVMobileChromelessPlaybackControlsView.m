@implementation AVMobileChromelessPlaybackControlsView

- (AVMobileChromelessPlaybackControlsView)initWithStyleSheet:(id)a3
{
  id v5;
  AVMobileChromelessPlaybackControlsView *v6;
  AVMobileChromelessPlaybackControlsView *v7;
  uint64_t v8;
  AVMobileChromelessPlaybackControlButton *playPauseButton;
  uint64_t v10;
  AVMobileChromelessPlaybackControlButton *forwardSecondaryButton;
  uint64_t v12;
  AVMobileChromelessPlaybackControlButton *backwardSecondaryButton;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVMobileChromelessPlaybackControlsView;
  v6 = -[AVView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    +[AVMobileChromelessPlaybackControlButton playPauseButtonWithStyleSheet:](AVMobileChromelessPlaybackControlButton, "playPauseButtonWithStyleSheet:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    playPauseButton = v7->_playPauseButton;
    v7->_playPauseButton = (AVMobileChromelessPlaybackControlButton *)v8;

    -[AVMobileChromelessPlaybackControlButton addTarget:action:forControlEvents:](v7->_playPauseButton, "addTarget:action:forControlEvents:", v7, sel_playPauseButtonWasPressed, 64);
    +[AVMobileChromelessPlaybackControlButton forwardSecondaryButtonWithStyleSheet:](AVMobileChromelessPlaybackControlButton, "forwardSecondaryButtonWithStyleSheet:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    forwardSecondaryButton = v7->_forwardSecondaryButton;
    v7->_forwardSecondaryButton = (AVMobileChromelessPlaybackControlButton *)v10;

    -[AVMobileChromelessPlaybackControlButton addTarget:action:forControlEvents:](v7->_forwardSecondaryButton, "addTarget:action:forControlEvents:", v7, sel_forwardSecondaryControlWasPressed, 64);
    +[AVMobileChromelessPlaybackControlButton backwardSecondaryButtonWithStyleSheet:](AVMobileChromelessPlaybackControlButton, "backwardSecondaryButtonWithStyleSheet:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    backwardSecondaryButton = v7->_backwardSecondaryButton;
    v7->_backwardSecondaryButton = (AVMobileChromelessPlaybackControlButton *)v12;

    -[AVMobileChromelessPlaybackControlButton addTarget:action:forControlEvents:](v7->_backwardSecondaryButton, "addTarget:action:forControlEvents:", v7, sel_backwardsSecondaryControlWasPressed, 64);
    -[AVView setIgnoresTouches:](v7, "setIgnoresTouches:", 1);
    v20[0] = v7->_playPauseButton;
    v20[1] = v7->_forwardSecondaryButton;
    v20[2] = v7->_backwardSecondaryButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessPlaybackControlsView _addPlaybackControlViews:](v7, "_addPlaybackControlViews:", v14);

    -[AVMobileChromelessPlaybackControlsView _updateBackwardSecondaryControlIcon](v7, "_updateBackwardSecondaryControlIcon");
    -[AVMobileChromelessPlaybackControlsView _updateForwardSecondaryControlIcon](v7, "_updateForwardSecondaryControlIcon");
    -[AVMobileChromelessPlaybackControlsView _updateExtendedDynamicRangeGain]((uint64_t)v7);
    v7->_backwardSecondaryControlEnabled = 1;
    v7->_forwardSecondaryControlEnabled = 1;
    v7->_showsPlayPauseButton = 1;
    v7->_showsBackwardSecondaryPlaybackButton = 1;
    v7->_showsForwardSecondaryPlaybackButton = 1;
    v19 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)-[AVMobileChromelessPlaybackControlsView registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v15, &__block_literal_global_5945);

  }
  return v7;
}

- (void)setPlayPauseButtonShowsPlayIcon:(BOOL)a3
{
  const __CFString *v4;
  AVMobileChromelessPlaybackControlButton *playPauseButton;
  __CFString *v6;
  void *v7;

  if (self->_playPauseButtonShowsPlayIcon != a3)
  {
    self->_playPauseButtonShowsPlayIcon = a3;
    if (a3)
      v4 = CFSTR("play");
    else
      v4 = CFSTR("pause");
    -[AVMobileChromelessPlaybackControlButton setPlaybackControlButtonIconState:](self->_playPauseButton, "setPlaybackControlButtonIconState:", v4);
    playPauseButton = self->_playPauseButton;
    if (self->_playPauseButtonShowsPlayIcon)
      v6 = CFSTR("Play");
    else
      v6 = CFSTR("Pause");
    AVLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessPlaybackControlButton setAccessibilityLabel:](playPauseButton, "setAccessibilityLabel:", v7);

    -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsPlayPauseButton:(BOOL)a3
{
  if (self->_showsPlayPauseButton != a3)
  {
    self->_showsPlayPauseButton = a3;
    -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsBackwardSecondaryPlaybackButton:(BOOL)a3
{
  if (self->_showsBackwardSecondaryPlaybackButton != a3)
  {
    self->_showsBackwardSecondaryPlaybackButton = a3;
    -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsForwardSecondaryPlaybackButton:(BOOL)a3
{
  if (self->_showsForwardSecondaryPlaybackButton != a3)
  {
    self->_showsForwardSecondaryPlaybackButton = a3;
    -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setForwardSecondaryControlIcon:(unint64_t)a3
{
  if (self->_forwardSecondaryControlIcon != a3)
  {
    self->_forwardSecondaryControlIcon = a3;
    -[AVMobileChromelessPlaybackControlsView _updateForwardSecondaryControlIcon](self, "_updateForwardSecondaryControlIcon");
  }
}

- (void)setBackwardSecondaryControlIcon:(unint64_t)a3
{
  if (self->_backwardSecondaryControlIcon != a3)
  {
    self->_backwardSecondaryControlIcon = a3;
    -[AVMobileChromelessPlaybackControlsView _updateBackwardSecondaryControlIcon](self, "_updateBackwardSecondaryControlIcon");
  }
}

- (void)setForwardSecondaryControlEnabled:(BOOL)a3
{
  if (self->_forwardSecondaryControlEnabled != a3)
  {
    self->_forwardSecondaryControlEnabled = a3;
    -[AVButton setEnabled:](self->_forwardSecondaryButton, "setEnabled:");
  }
}

- (void)setBackwardSecondaryControlEnabled:(BOOL)a3
{
  if (self->_backwardSecondaryControlEnabled != a3)
  {
    self->_backwardSecondaryControlEnabled = a3;
    -[AVButton setEnabled:](self->_backwardSecondaryButton, "setEnabled:");
  }
}

- (void)setStyleSheet:(id)a3
{
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet **p_styleSheet;
  AVMobileChromelessControlsStyleSheet *v7;

  v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    -[AVMobileChromelessPlaybackControlButton setStyleSheet:](self->_playPauseButton, "setStyleSheet:", *p_styleSheet);
    -[AVMobileChromelessPlaybackControlButton setStyleSheet:](self->_forwardSecondaryButton, "setStyleSheet:", *p_styleSheet);
    -[AVMobileChromelessPlaybackControlButton setStyleSheet:](self->_backwardSecondaryButton, "setStyleSheet:", *p_styleSheet);
    -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (double)avkit_extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (void)setAvkit_extendedDynamicRangeGain:(double)a3
{
  if (self->_extendedDynamicRangeGain != a3)
  {
    self->_extendedDynamicRangeGain = a3;
    -[AVMobileChromelessPlaybackControlsView _updateExtendedDynamicRangeGain]((uint64_t)self);
  }
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AVMobileChromelessPlaybackControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[AVMobileChromelessPlaybackControlsView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v4);

  -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessPlaybackControlsView;
  -[AVMobileChromelessPlaybackControlsView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVMobileChromelessPlaybackControlsView _setupPointerInteractionForButton:](self, self->_playPauseButton);
  -[AVMobileChromelessPlaybackControlsView _setupPointerInteractionForButton:](self, self->_backwardSecondaryButton);
  -[AVMobileChromelessPlaybackControlsView _setupPointerInteractionForButton:](self, self->_forwardSecondaryButton);
  -[AVMobileChromelessPlaybackControlsView _setUpShadowAppearance](self, "_setUpShadowAppearance");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMobileChromelessPlaybackControlButton intrinsicContentSize](self->_playPauseButton, "intrinsicContentSize");
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL4 showsPlayPauseButton;
  AVMobileChromelessPlaybackControlButton *playPauseButton;
  double MidX;
  uint64_t v31;
  _BOOL4 showsBackwardSecondaryPlaybackButton;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;

  v42.receiver = self;
  v42.super_class = (Class)AVMobileChromelessPlaybackControlsView;
  -[AVView layoutSubviews](&v42, sel_layoutSubviews);
  -[AVMobileChromelessPlaybackControlsView bounds](self, "bounds");
  v40 = v4;
  v41 = v3;
  v39 = v5;
  v7 = v6;
  -[AVMobileChromelessPlaybackControlButton intrinsicContentSize](self->_forwardSecondaryButton, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;
  -[AVMobileChromelessPlaybackControlButton intrinsicContentSize](self->_backwardSecondaryButton, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;
  -[AVMobileChromelessPlaybackControlButton intrinsicContentSize](self->_playPauseButton, "intrinsicContentSize");
  v17 = v16;
  v19 = v18;
  -[AVMobileChromelessPlaybackControlsView frame](self, "frame");
  v21 = v20 - (v9 + v13 + v17);
  v22 = v21 <= 112.0;
  v23 = fmax(v21 * 0.5, 42.0);
  v24 = fmax(v21 + -200.0, 56.0);
  if (v22)
    v24 = v23;
  if (v24 <= 100.0)
    v25 = v24;
  else
    v25 = 100.0;
  v26 = v7 + v25 * -2.0;
  if (v26 < v17)
  {
    -[AVMobileChromelessPlaybackControlButton setHidden:](self->_playPauseButton, "setHidden:", 1);
LABEL_11:
    v31 = 1;
    -[AVMobileChromelessPlaybackControlButton setHidden:](self->_backwardSecondaryButton, "setHidden:", 1, *(_QWORD *)&v35, *(_QWORD *)&v36);
    goto LABEL_12;
  }
  v37 = v11;
  v38 = v25;
  v35 = v15;
  v36 = v13;
  v27 = v26 - v17;
  showsPlayPauseButton = self->_showsPlayPauseButton;
  if (self->_showsPlayPauseButton)
  {
    -[AVMobileChromelessPlaybackControlButton setFrame:](self->_playPauseButton, "setFrame:", 0.0, 0.0, v17, v19);
    playPauseButton = self->_playPauseButton;
    v43.origin.x = v41;
    v43.origin.y = v39;
    v43.size.width = v7;
    v43.size.height = v40;
    MidX = CGRectGetMidX(v43);
    v44.origin.x = v41;
    v44.origin.y = v39;
    v44.size.width = v7;
    v44.size.height = v40;
    -[AVMobileChromelessPlaybackControlButton setCenter:](playPauseButton, "setCenter:", MidX, CGRectGetMidY(v44));
  }
  -[AVMobileChromelessPlaybackControlButton setHidden:](self->_playPauseButton, "setHidden:", !showsPlayPauseButton);
  if (v27 < v9 + v13)
    goto LABEL_11;
  showsBackwardSecondaryPlaybackButton = self->_showsBackwardSecondaryPlaybackButton;
  if (self->_showsBackwardSecondaryPlaybackButton)
  {
    -[AVMobileChromelessPlaybackControlButton frame](self->_playPauseButton, "frame");
    -[AVMobileChromelessPlaybackControlButton setFrame:](self->_backwardSecondaryButton, "setFrame:", v33 - v38 - v13, (v40 - v35) * 0.5);
  }
  -[AVMobileChromelessPlaybackControlButton setHidden:](self->_backwardSecondaryButton, "setHidden:", !showsBackwardSecondaryPlaybackButton);
  if (self->_showsForwardSecondaryPlaybackButton)
  {
    -[AVMobileChromelessPlaybackControlButton frame](self->_playPauseButton, "frame");
    -[AVMobileChromelessPlaybackControlButton setFrame:](self->_forwardSecondaryButton, "setFrame:", v38 + v9 + v34, (v40 - v37) * 0.5, v9, v37);
    v31 = 0;
  }
  else
  {
    v31 = 1;
  }
LABEL_12:
  -[AVMobileChromelessPlaybackControlButton setHidden:](self->_forwardSecondaryButton, "setHidden:", v31, *(_QWORD *)&v35, *(_QWORD *)&v36);
}

- (void)playPauseButtonWasPressed
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileChromelessPlaybackControlsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileChromelessPlaybackControlsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackControlsViewPlayPauseButtonWasPressed:", self);

  }
}

- (void)backwardsSecondaryControlWasPressed
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileChromelessPlaybackControlsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileChromelessPlaybackControlsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackControlsViewBackwardSecondaryControlWasPressed:", self);

  }
}

- (void)forwardSecondaryControlWasPressed
{
  void *v3;
  char v4;
  id v5;

  -[AVMobileChromelessPlaybackControlsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVMobileChromelessPlaybackControlsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackControlsViewForwardSecondaryControlWasPressed:", self);

  }
}

- (void)_addPlaybackControlViews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AVMobileChromelessPlaybackControlsView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setUpShadowAppearance
{
  void *v3;
  void *v4;
  id v5;

  -[AVMobileChromelessPlaybackControlButton layer](self->_playPauseButton, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessPlaybackControlButton layer](self->_backwardSecondaryButton, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessPlaybackControlButton layer](self->_forwardSecondaryButton, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend(v5, "setShadowRadius:", 8.0);
  objc_msgSend(v3, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend(v3, "setShadowRadius:", 8.0);
  objc_msgSend(v4, "setShadowOffset:", 0.0, 2.0);
  objc_msgSend(v4, "setShadowRadius:", 8.0);
  -[AVMobileChromelessPlaybackControlsView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);

}

- (void)_updateBackwardSecondaryControlIcon
{
  unint64_t backwardSecondaryControlIcon;
  const __CFString *v4;
  __CFString **v5;

  backwardSecondaryControlIcon = self->_backwardSecondaryControlIcon;
  if (!backwardSecondaryControlIcon)
  {
    v4 = CFSTR("Skip Backward");
    v5 = AVMobileImageNameSkipBack10;
    goto LABEL_5;
  }
  if (backwardSecondaryControlIcon == 1)
  {
    v4 = CFSTR("Skip To Previous");
    v5 = AVMobileImageNameStartPreviousContentTransition;
LABEL_5:
    -[AVButton setImageName:](self->_backwardSecondaryButton, "setImageName:", *v5);
    -[AVMobileChromelessPlaybackControlButton setAccessibilityIdentifier:](self->_backwardSecondaryButton, "setAccessibilityIdentifier:", v4);
  }
  -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateForwardSecondaryControlIcon
{
  unint64_t forwardSecondaryControlIcon;
  __CFString *v4;

  forwardSecondaryControlIcon = self->_forwardSecondaryControlIcon;
  if (forwardSecondaryControlIcon <= 2)
  {
    v4 = off_1E5BB1738[forwardSecondaryControlIcon];
    -[AVButton setImageName:](self->_forwardSecondaryButton, "setImageName:", *off_1E5BB1720[forwardSecondaryControlIcon]);
    -[AVMobileChromelessPlaybackControlButton setAccessibilityIdentifier:](self->_forwardSecondaryButton, "setAccessibilityIdentifier:", v4);
  }
  -[AVMobileChromelessPlaybackControlsView setNeedsLayout](self, "setNeedsLayout");
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (BOOL)playPauseButtonShowsPlayIcon
{
  return self->_playPauseButtonShowsPlayIcon;
}

- (BOOL)showsPlayPauseButton
{
  return self->_showsPlayPauseButton;
}

- (BOOL)showsBackwardSecondaryPlaybackButton
{
  return self->_showsBackwardSecondaryPlaybackButton;
}

- (BOOL)showsForwardSecondaryPlaybackButton
{
  return self->_showsForwardSecondaryPlaybackButton;
}

- (BOOL)backwardSecondaryControlEnabled
{
  return self->_backwardSecondaryControlEnabled;
}

- (BOOL)forwardSecondaryControlEnabled
{
  return self->_forwardSecondaryControlEnabled;
}

- (unint64_t)backwardSecondaryControlIcon
{
  return self->_backwardSecondaryControlIcon;
}

- (unint64_t)forwardSecondaryControlIcon
{
  return self->_forwardSecondaryControlIcon;
}

- (AVMobileChromelessPlaybackControlsViewDelegate)delegate
{
  return (AVMobileChromelessPlaybackControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVMobileChromelessPlaybackControlButton)backwardSecondaryButton
{
  return self->_backwardSecondaryButton;
}

- (AVMobileChromelessPlaybackControlButton)forwardSecondaryButton
{
  return self->_forwardSecondaryButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardSecondaryButton, 0);
  objc_storeStrong((id *)&self->_backwardSecondaryButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
}

- (void)_updateShadowAppearanceState
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  id v13;

  if (a1)
  {
    objc_msgSend(a1[58], "layer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[65], "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[66], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");

      v8 = 1050253722;
      v9 = 1041865114;
    }
    else
    {
      v7 = 0;
      v9 = 0;
      v8 = 0;
    }
    objc_msgSend(v13, "setShadowColor:", v7);
    LODWORD(v10) = v9;
    objc_msgSend(v13, "setShadowOpacity:", v10);
    objc_msgSend(v2, "setShadowColor:", v7);
    LODWORD(v11) = v8;
    objc_msgSend(v2, "setShadowOpacity:", v11);
    objc_msgSend(v3, "setShadowColor:", v7);
    LODWORD(v12) = v8;
    objc_msgSend(v3, "setShadowOpacity:", v12);

  }
}

- (void)_setupPointerInteractionForButton:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __76__AVMobileChromelessPlaybackControlsView__setupPointerInteractionForButton___block_invoke;
    v8 = &unk_1E5BB1700;
    objc_copyWeak(&v9, &location);
    v4 = (void *)MEMORY[0x1AF43E9B8](&v5);
    objc_msgSend(v3, "setPointerStyleProvider:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

id __76__AVMobileChromelessPlaybackControlsView__setupPointerInteractionForButton___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  if (WeakRetained)
  {
    objc_msgSend(v3, "pointerTargetView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    v10 = CGRectGetWidth(v24);
    v11 = width;
    v12 = v10 + 10.0 - fmodf(v11, 10.0) + 20.0;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v13 = CGRectGetHeight(v25);
    v14 = height;
    v15 = v13 + 10.0 - fmodf(v14, 10.0) + 20.0;
    if (v12 >= v15)
      v16 = v12;
    else
      v16 = v15;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v17 = CGRectGetMidX(v26) - v16 * 0.5;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v18 = CGRectGetMidY(v27) - v16 * 0.5;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v5);
    v28.origin.x = v17;
    v28.origin.y = v18;
    v28.size.width = v16;
    v28.size.height = v16;
    objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:", v17, v18, v16, v16, CGRectGetHeight(v28) * 0.5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (uint64_t)_updateExtendedDynamicRangeGain
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 520), "setAvkit_extendedDynamicRangeGain:", *(double *)(result + 472));
    objc_msgSend(*(id *)(v1 + 528), "setAvkit_extendedDynamicRangeGain:", *(double *)(v1 + 472));
    return objc_msgSend(*(id *)(v1 + 464), "setAvkit_extendedDynamicRangeGain:", *(double *)(v1 + 472));
  }
  return result;
}

void __61__AVMobileChromelessPlaybackControlsView_initWithStyleSheet___block_invoke(uint64_t a1, id *a2)
{
  -[AVMobileChromelessPlaybackControlsView _updateShadowAppearanceState](a2);
}

@end
