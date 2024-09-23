@implementation AVTurboModePlaybackControlsPlaceholderView

- (AVTurboModePlaybackControlsPlaceholderView)initWithFrame:(CGRect)a3 styleSheet:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AVTurboModePlaybackControlsPlaceholderView *v11;
  AVTurboModePlaybackControlsPlaceholderView *v12;
  AVTouchIgnoringView *v13;
  uint64_t v14;
  UIView *contentView;
  AVObservationController *v16;
  AVObservationController *observationController;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  v11 = -[AVTurboModePlaybackControlsPlaceholderView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_styleSheet, a4);
    v13 = [AVTouchIgnoringView alloc];
    v14 = -[AVTouchIgnoringView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    contentView = v12->_contentView;
    v12->_contentView = (UIView *)v14;

    v16 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v12);
    observationController = v12->_observationController;
    v12->_observationController = v16;

    -[AVTurboModePlaybackControlsPlaceholderView addSubview:](v12, "addSubview:", v12->_contentView);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVTurboModePlaybackControlsPlaceholderView observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  v4.receiver = self;
  v4.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  -[AVTurboModePlaybackControlsPlaceholderView dealloc](&v4, sel_dealloc);
}

- (BOOL)hasVisibleControls
{
  BOOL v3;
  void *v4;

  if ((-[AVTurboModePlaybackControlsPlaceholderView isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[AVTurboModePlaybackControlsPlaceholderView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v4, "isHidden") & 1) == 0
    && -[AVTurboModePlaybackControlsPlaceholderView includedControlType](self, "includedControlType") != 0;

  return v3;
}

- (void)setPlayerController:(id)a3
{
  AVPlayerController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  AVPlayerController *v11;

  v5 = (AVPlayerController *)a3;
  v11 = v5;
  if (self->_playerController != v5)
  {
    objc_storeStrong((id *)&self->_playerController, a3);
    -[AVTurboModePlaybackControlsPlaceholderView observationController](self, "observationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAllObservation");

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AVTurboModePlaybackControlsPlaceholderView observationController](self, "observationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v7, "startObserving:keyPath:includeInitialValue:observationHandler:", v11, CFSTR("timeControlStatus"), 1, &__block_literal_global_12405);

        -[AVTurboModePlaybackControlsPlaceholderView observationController](self, "observationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", v11, CFSTR("muted"), 1, &__block_literal_global_11_12407);

LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
    }
    -[AVTurboModePlaybackControlsPlaceholderView setIncludedControlType:](self, "setIncludedControlType:", 1);
    v5 = v11;
  }
  if (!v5)
  {
    -[AVTurboModePlaybackControlsPlaceholderView setIncludedControlType:](self, "setIncludedControlType:", 1);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setPreferredUnobscuredArea:(int64_t)a3
{
  if (self->_preferredUnobscuredArea != a3)
  {
    self->_preferredUnobscuredArea = a3;
    -[AVTurboModePlaybackControlsPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIncludedControlType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (self->_includedControlType != a3)
  {
    self->_includedControlType = a3;
    if (a3)
    {
      if (a3 == 2)
      {
        -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", 1);

        -[AVTurboModePlaybackControlsPlaceholderView _makeVolumeButtonAndContainerIfNeeded](self, "_makeVolumeButtonAndContainerIfNeeded");
        -[AVTurboModePlaybackControlsPlaceholderView volumeButtonContainer](self, "volumeButtonContainer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 1)
        {
LABEL_10:
          -[UIView avkit_needsUpdateBackdropCaptureViewHidden](self, "avkit_needsUpdateBackdropCaptureViewHidden");
          return;
        }
        -[AVTurboModePlaybackControlsPlaceholderView volumeButtonContainer](self, "volumeButtonContainer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setHidden:", 1);

        -[AVTurboModePlaybackControlsPlaceholderView _makeProminentPlayButtonAndContainerIfNeeded](self, "_makeProminentPlayButtonAndContainerIfNeeded");
        -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v5;
      v8 = 0;
    }
    else
    {
      -[AVTurboModePlaybackControlsPlaceholderView volumeButtonContainer](self, "volumeButtonContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);

      -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = 1;
    }
    objc_msgSend(v5, "setHidden:", v8);

    goto LABEL_10;
  }
}

- (void)setOverrideTransformForProminentPlayButton:(CGAffineTransform *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  BOOL v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform t1;

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = *(_OWORD *)&a3->tx;
  v8 = CGAffineTransformEqualToTransform(&t1, &v13);

  if (!v8)
  {
    v10 = *(_OWORD *)&a3->c;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c = v10;
    *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tx = v9;
    -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.c;
    *(_OWORD *)&v13.a = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.a;
    *(_OWORD *)&v13.c = v12;
    *(_OWORD *)&v13.tx = *(_OWORD *)&self->_overrideTransformForProminentPlayButton.tx;
    objc_msgSend(v11, "setTransform:", &v13);

    -[AVTurboModePlaybackControlsPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverrideLayoutMarginsWhenEmbeddedInline:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSValue isEqualToValue:](self->_overrideLayoutMarginsWhenEmbeddedInline, "isEqualToValue:"))
  {
    objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, a3);
    -[AVTurboModePlaybackControlsPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setVolumeButtonMicaPackageStateName:(id)a3
{
  NSString *v4;
  NSString *volumeButtonMicaPackageStateName;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_volumeButtonMicaPackageStateName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    volumeButtonMicaPackageStateName = self->_volumeButtonMicaPackageStateName;
    self->_volumeButtonMicaPackageStateName = v4;

    -[AVTurboModePlaybackControlsPlaceholderView volumeButton](self, "volumeButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMicaPackageStateName:", v7);

  }
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  -[AVTurboModePlaybackControlsPlaceholderView setHidden:](&v4, sel_setHidden_, a3);
  -[UIView avkit_needsUpdateBackdropCaptureViewHidden](self, "avkit_needsUpdateBackdropCaptureViewHidden");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
  -[AVTurboModePlaybackControlsPlaceholderView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVTurboModePlaybackControlsPlaceholderView _updateFramesAndHitRectInsets](self, "_updateFramesAndHitRectInsets");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView avkit_hitTestControlForPoint:withEvent:](self, "avkit_hitTestControlForPoint:withEvent:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AVTurboModePlaybackControlsPlaceholderView;
    -[AVTurboModePlaybackControlsPlaceholderView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)_updateFramesAndHitRectInsets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  void *v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[AVTurboModePlaybackControlsPlaceholderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView _frameForIncludedViewType:](self, "_frameForIncludedViewType:", 1);
  objc_msgSend(v4, "setFrame:");

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v9 = -CGRectGetMinY(v19);
  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11 = -CGRectGetMinX(v20);
  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v13 = -CGRectGetMinY(v21);
  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  objc_msgSend(v7, "setHitRectInsets:", v9, v11, v13, -CGRectGetMinX(v22));

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClampsHitRectInsetsWhenContainedInScrollableView:", 1);

  -[AVTurboModePlaybackControlsPlaceholderView volumeButtonContainer](self, "volumeButtonContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView _frameForIncludedViewType:](self, "_frameForIncludedViewType:", 2);
  objc_msgSend(v16, "setFrame:");

  -[AVTurboModePlaybackControlsPlaceholderView volumeButton](self, "volumeButton");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView volumeButtonContainer](self, "volumeButtonContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  objc_msgSend(v18, "setFrame:");

}

- (CGRect)_frameForIncludedViewType:(int64_t)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  CGFloat v58;
  double MidX;
  double v60;
  double MidY;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGAffineTransform v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect result;

  if (a3 == 1)
  {
    -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "standardPaddingInline");
    v41 = v40;
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "standardPaddingInline");
    v44 = v43;
    v85.origin.x = v32;
    v85.origin.y = v34;
    v85.size.width = v36;
    v85.size.height = v38;
    v86 = CGRectInset(v85, v41, v44);
    x = v86.origin.x;
    y = v86.origin.y;
    width = v86.size.width;
    height = v86.size.height;

    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    v49 = CGRectGetWidth(v87);
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    v50 = CGRectGetHeight(v88);
    if (v49 >= v50)
      v49 = v50;
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "maximumProminentPlayButtonDimension");
    v53 = v52;

    if (v49 < v53)
      v53 = v49;
    v89.origin.x = x;
    v89.origin.y = y;
    v89.size.width = v53;
    v89.size.height = height;
    v54 = CGRectGetHeight(v89);
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "minimumProminentPlayButtonDimension");
    v57 = v56;

    if (v54 < v57)
      v53 = 0.0;
    v90.origin.x = x;
    v90.origin.y = y;
    v90.size.width = v53;
    v90.size.height = height;
    v58 = CGRectGetWidth(v90);
    -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
    MidX = CGRectGetMidX(v91);
    v92.origin.x = x;
    v92.origin.y = y;
    v92.size.width = v53;
    v92.size.height = v58;
    v60 = MidX - CGRectGetWidth(v92) * 0.5;
    -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
    MidY = CGRectGetMidY(v93);
    v94.origin.x = v60;
    v94.origin.y = y;
    v94.size.width = v53;
    v94.size.height = v58;
    v62 = MidY - CGRectGetHeight(v94) * 0.5;
    -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63)
      objc_msgSend(v63, "transform");
    else
      memset(&v80, 0, sizeof(v80));
    v96.origin.x = v60;
    v96.origin.y = v62;
    v96.size.width = v53;
    v96.size.height = v58;
    CGRectApplyAffineTransform(v96, &v80);
    goto LABEL_32;
  }
  if (a3 != 2)
    goto LABEL_33;
  -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "standardPaddingInline");
  v14 = v13;
  -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "standardPaddingInline");
  v17 = v16;
  v81.origin.x = v5;
  v81.origin.y = v7;
  v81.size.width = v9;
  v81.size.height = v11;
  v82 = CGRectInset(v81, v14, v17);
  v18 = v82.origin.x;
  v19 = v82.origin.y;
  v20 = v82.size.width;
  v21 = v82.size.height;

  v83.origin.x = v18;
  v83.origin.y = v19;
  v83.size.width = v20;
  v83.size.height = v21;
  v22 = CGRectGetWidth(v83);
  -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "defaultItemInlineSize");
  if (v22 >= v24)
  {
    v84.origin.x = v18;
    v84.origin.y = v19;
    v84.size.width = v20;
    v84.size.height = v21;
    v25 = CGRectGetHeight(v84);
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "defaultItemInlineSize");
    v28 = v27;

    if (v25 < v28)
      goto LABEL_7;
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "defaultItemInlineSize");
  }

LABEL_7:
  -[AVTurboModePlaybackControlsPlaceholderView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[AVTurboModePlaybackControlsPlaceholderView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UIEdgeInsetsValue");
  }
  else
  {
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "standardPaddingInline");
  }

  -[AVTurboModePlaybackControlsPlaceholderView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    -[AVTurboModePlaybackControlsPlaceholderView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "UIEdgeInsetsValue");
  }
  else
  {
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "standardPaddingInline");
  }

  -[AVTurboModePlaybackControlsPlaceholderView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    -[AVTurboModePlaybackControlsPlaceholderView overrideLayoutMarginsWhenEmbeddedInline](self, "overrideLayoutMarginsWhenEmbeddedInline");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "UIEdgeInsetsValue");
  }
  else
  {
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "standardPaddingInline");
  }

  if (-[AVTurboModePlaybackControlsPlaceholderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 1)
  {
    -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
    CGRectGetMaxX(v95);
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "defaultItemInlineSize");

  }
  if (-[AVTurboModePlaybackControlsPlaceholderView preferredUnobscuredArea](self, "preferredUnobscuredArea") == 1)
  {
    -[AVTurboModePlaybackControlsPlaceholderView bounds](self, "bounds");
    CGRectGetMaxY(v97);
    -[AVTurboModePlaybackControlsPlaceholderView styleSheet](self, "styleSheet");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "defaultItemInlineSize");
LABEL_32:

  }
LABEL_33:
  UIPointRoundToViewScale();
  v71 = v70;
  v73 = v72;
  UISizeRoundToViewScale();
  v75 = v74;
  v77 = v76;
  v78 = v71;
  v79 = v73;
  result.size.height = v77;
  result.size.width = v75;
  result.origin.y = v79;
  result.origin.x = v78;
  return result;
}

- (void)_makeVolumeButtonAndContainerIfNeeded
{
  void *v3;
  UIView *v4;
  UIView *volumeButtonContainer;

  -[AVTurboModePlaybackControlsPlaceholderView volumeButtonContainer](self, "volumeButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVTurboModePlaybackControlsPlaceholderView _makeVolumeButtonAndContainer](self, "_makeVolumeButtonAndContainer");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    volumeButtonContainer = self->_volumeButtonContainer;
    self->_volumeButtonContainer = v4;

  }
}

- (id)_makeVolumeButtonAndContainer
{
  AVLayoutView *v3;
  AVLayoutView *v4;
  AVVolumeButtonControl *v5;
  AVVolumeButtonControl *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = [AVLayoutView alloc];
  -[AVTurboModePlaybackControlsPlaceholderView _frameForIncludedViewType:](self, "_frameForIncludedViewType:", 2);
  v4 = -[AVLayoutView initWithFrame:](v3, "initWithFrame:");
  v5 = [AVVolumeButtonControl alloc];
  -[AVLayoutView bounds](v4, "bounds");
  v6 = -[AVVolumeButtonControl initWithFrame:](v5, "initWithFrame:");
  -[AVLayoutView addSubview:](v4, "addSubview:", v6);
  -[AVTurboModePlaybackControlsPlaceholderView setVolumeButtonContainer:](self, "setVolumeButtonContainer:", v4);
  -[AVTurboModePlaybackControlsPlaceholderView setVolumeButton:](self, "setVolumeButton:", v6);
  -[AVTurboModePlaybackControlsPlaceholderView volumeButton](self, "volumeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView volumeButtonMicaPackageStateName](self, "volumeButtonMicaPackageStateName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMicaPackageStateName:", v8);

  -[AVTurboModePlaybackControlsPlaceholderView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v4);

  return v4;
}

- (void)_makeProminentPlayButtonAndContainerIfNeeded
{
  void *v3;
  UIView *v4;
  UIView *prominentPlayButtonContainer;

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButtonContainer](self, "prominentPlayButtonContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVTurboModePlaybackControlsPlaceholderView _makeProminentPlayButtonAndContainer](self, "_makeProminentPlayButtonAndContainer");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    prominentPlayButtonContainer = self->_prominentPlayButtonContainer;
    self->_prominentPlayButtonContainer = v4;

  }
}

- (id)_makeProminentPlayButtonAndContainer
{
  AVLayoutView *v3;
  AVLayoutView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = [AVLayoutView alloc];
  -[AVTurboModePlaybackControlsPlaceholderView _frameForIncludedViewType:](self, "_frameForIncludedViewType:", 1);
  v4 = -[AVLayoutView initWithFrame:](v3, "initWithFrame:");
  -[AVLayoutView setShapeStyle:](v4, "setShapeStyle:", 1);
  +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("Central Play"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageName:", CFSTR("play.fill"));
  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4AE8];
  -[AVTurboModePlaybackControlsPlaceholderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInlineFont:", v9);

  objc_msgSend(v5, "setTintEffectStyle:", 0);
  -[AVLayoutView bounds](v4, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[AVLayoutView addSubview:](v4, "addSubview:", v5);
  -[AVTurboModePlaybackControlsPlaceholderView setProminentPlayButtonContainer:](self, "setProminentPlayButtonContainer:", v4);
  -[AVView setIgnoresTouches:](v4, "setIgnoresTouches:", 1);
  -[AVTurboModePlaybackControlsPlaceholderView setProminentPlayButton:](self, "setProminentPlayButton:", v5);
  -[AVTurboModePlaybackControlsPlaceholderView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v4);

  -[AVTurboModePlaybackControlsPlaceholderView prominentPlayButton](self, "prominentPlayButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderView overrideTransformForProminentPlayButton](self, "overrideTransformForProminentPlayButton");
  objc_msgSend(v11, "setTransform:", &v13);

  return v4;
}

- (AVMobileChromeControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)setStyleSheet:(id)a3
{
  objc_storeStrong((id *)&self->_styleSheet, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (int64_t)preferredUnobscuredArea
{
  return self->_preferredUnobscuredArea;
}

- (int64_t)includedControlType
{
  return self->_includedControlType;
}

- (NSString)volumeButtonMicaPackageStateName
{
  return self->_volumeButtonMicaPackageStateName;
}

- (CGAffineTransform)overrideTransformForProminentPlayButton
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].c;
  return self;
}

- (NSValue)overrideLayoutMarginsWhenEmbeddedInline
{
  return self->_overrideLayoutMarginsWhenEmbeddedInline;
}

- (AVVolumeButtonControl)volumeButton
{
  return (AVVolumeButtonControl *)objc_loadWeakRetained((id *)&self->_volumeButton);
}

- (void)setVolumeButton:(id)a3
{
  objc_storeWeak((id *)&self->_volumeButton, a3);
}

- (UIView)prominentPlayButtonContainer
{
  return self->_prominentPlayButtonContainer;
}

- (void)setProminentPlayButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_prominentPlayButtonContainer, a3);
}

- (AVButton)prominentPlayButton
{
  return (AVButton *)objc_loadWeakRetained((id *)&self->_prominentPlayButton);
}

- (void)setProminentPlayButton:(id)a3
{
  objc_storeWeak((id *)&self->_prominentPlayButton, a3);
}

- (UIView)volumeButtonContainer
{
  return self->_volumeButtonContainer;
}

- (void)setVolumeButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonContainer, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_volumeButtonContainer, 0);
  objc_destroyWeak((id *)&self->_prominentPlayButton);
  objc_storeStrong((id *)&self->_prominentPlayButtonContainer, 0);
  objc_destroyWeak((id *)&self->_volumeButton);
  objc_storeStrong((id *)&self->_overrideLayoutMarginsWhenEmbeddedInline, 0);
  objc_storeStrong((id *)&self->_volumeButtonMicaPackageStateName, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
}

void __66__AVTurboModePlaybackControlsPlaceholderView_setPlayerController___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  const __CFString *v6;
  id v7;

  v5 = a2;
  objc_msgSend(a4, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue"))
    v6 = CFSTR("mute");
  else
    v6 = CFSTR("half");
  objc_msgSend(v5, "setVolumeButtonMicaPackageStateName:", v6);

}

void __66__AVTurboModePlaybackControlsPlaceholderView_setPlayerController___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(a4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 2)
    v7 = 2;
  else
    v7 = 1;
  objc_msgSend(v8, "setIncludedControlType:", v7);

}

@end
