@implementation AVPlaybackContentContainerView

- (AVVisualAnalysisView)visualAnalysisView
{
  return self->_visualAnalysisView;
}

- (void)setVideoContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_videoContentFrame;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_videoContentFrame = &self->_videoContentFrame;
  if (!CGRectEqualToRect(self->_videoContentFrame, a3))
  {
    p_videoContentFrame->origin.x = x;
    p_videoContentFrame->origin.y = y;
    p_videoContentFrame->size.width = width;
    p_videoContentFrame->size.height = height;
    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[AVPlaybackContentContainerView window](self, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v14)
        return;
    }
    else
    {

    }
    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", x, y, width, height);

    -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackContentContainerView bounds](self, "bounds");
    objc_msgSend(v16, "setFrame:");

    if (self->_statusBarBackgroundGradientView)
      -[AVStatusBarBackgroundGradientView setFrame:](self->_statusBarBackgroundGradientView, "setFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self));
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  AVStatusBarBackgroundGradientView *v9;
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
  AVPlaybackContentContainerView *v20;
  void *v21;
  void *v22;
  AVPlaybackContentContainerView *v23;
  void *v24;
  void *v25;
  AVPlaybackContentContainerView *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AVPlaybackContentContainerView;
  -[AVPlaybackContentContainerView layoutSubviews](&v28, sel_layoutSubviews);
  -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AVPlaybackContentContainerView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 == v7;

  }
  else
  {
    v8 = 1;
  }

  v9 = self->_statusBarBackgroundGradientView;
  if (v8)
  {
    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutoresizingMask:", 0);

    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AVPlaybackContentContainerView isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen"))
      -[AVPlaybackContentContainerView bounds](self, "bounds");
    else
      -[AVPlaybackContentContainerView videoContentFrame](self, "videoContentFrame");
    objc_msgSend(v12, "setFrame:");

  }
  -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutoresizingMask:", 0);

  -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentContainerView bounds](self, "bounds");
  objc_msgSend(v15, "setFrame:");

  -[AVPlaybackContentContainerView contentOverlayViewSubview](self, "contentOverlayViewSubview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAutoresizingMask:", 0);

  -[AVPlaybackContentContainerView contentOverlayViewSubview](self, "contentOverlayViewSubview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[AVPlaybackContentContainerView contentOverlayViewSubview](self, "contentOverlayViewSubview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackContentContainerView bounds](self, "bounds");
  objc_msgSend(v18, "setFrame:");

  if (v9)
  {
    -[AVStatusBarBackgroundGradientView setAutoresizingMask:](v9, "setAutoresizingMask:", 0);
    -[AVStatusBarBackgroundGradientView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[AVStatusBarBackgroundGradientView setFrame:](v9, "setFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self));
  }
  if (v8)
  {
    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "superview");
    v20 = (AVPlaybackContentContainerView *)objc_claimAutoreleasedReturnValue();

    if (v20 != self)
    {
      -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v21, 0);

    }
  }
  -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "superview");
  v23 = (AVPlaybackContentContainerView *)objc_claimAutoreleasedReturnValue();

  if (v23 != self)
  {
    -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackContentContainerView subviews](self, "subviews");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackContentContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v24, objc_msgSend(v25, "count"));

  }
  if (v9)
  {
    -[AVStatusBarBackgroundGradientView superview](v9, "superview");
    v26 = (AVPlaybackContentContainerView *)objc_claimAutoreleasedReturnValue();

    if (v26 != self)
    {
      -[AVPlaybackContentContainerView subviews](self, "subviews");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlaybackContentContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, objc_msgSend(v27, "count"));

    }
  }
  -[AVPlaybackContentContainerView _updateVisualAnalysisViewFrameIfNeeded](self);

}

- (__AVPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (UIView)contentOverlayViewSubview
{
  return self->_contentOverlayViewSubview;
}

- (AVPlaybackContentContainerView)initWithFrame:(CGRect)a3 playerLayerView:(id)a4 contentOverlayView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  AVPlaybackContentContainerView *v14;
  AVPlaybackContentContainerView *v15;
  void *v16;
  id v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVPlaybackContentContainerView;
  v14 = -[AVPlaybackContentContainerView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    -[AVPlaybackContentContainerView setInsetsLayoutMarginsFromSafeArea:](v14, "setInsetsLayoutMarginsFromSafeArea:", 0);
    v15->_videoContentFrame.origin = (CGPoint)*MEMORY[0x1E0C9D538];
    v15->_videoContentFrame.size.width = width;
    v15->_videoContentFrame.size.height = height;
    objc_storeStrong((id *)&v15->_playerLayerView, a4);
    if (-[AVPlaybackContentContainerView isPlayingOnSecondScreen](v15, "isPlayingOnSecondScreen"))
      -[AVPlaybackContentContainerView bounds](v15, "bounds");
    else
      -[AVPlaybackContentContainerView videoContentFrame](v15, "videoContentFrame");
    objc_msgSend(v12, "setFrame:");
    v16 = v13;
    if (!v13)
    {
      v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
      if (-[AVPlaybackContentContainerView isPlayingOnSecondScreen](v15, "isPlayingOnSecondScreen"))
        -[AVPlaybackContentContainerView bounds](v15, "bounds");
      else
        -[AVPlaybackContentContainerView videoContentFrame](v15, "videoContentFrame");
      v16 = (void *)objc_msgSend(v17, "initWithFrame:");
    }
    objc_storeStrong((id *)&v15->_contentOverlayView, v16);
    if (!v13)

  }
  return v15;
}

- (CGRect)videoContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoContentFrame.origin.x;
  y = self->_videoContentFrame.origin.y;
  width = self->_videoContentFrame.size.width;
  height = self->_videoContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (void)_updateVisualAnalysisViewFrameIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  CGAffineTransform v27;

  if (a1)
  {
    v2 = (void *)a1[53];
    if (v2)
    {
      v26 = v2;
      objc_msgSend(a1, "playerLayerView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "playerController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentDimensions");
      v6 = v5;
      v8 = v7;

      objc_msgSend(a1, "bounds");
      v24 = v9;
      v25 = v10;
      v12 = v11;
      v14 = v13;
      objc_msgSend(a1, "playerLayerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isVideoScaled");
      v17 = *MEMORY[0x1E0C9D648];
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      if (v8 != 0.0 && v6 != 0.0)
      {
        v21 = v12 / v6;
        if (v12 / v6 >= v14 / v8)
          v22 = v12 / v6;
        else
          v22 = v14 / v8;
        if (v12 / v6 >= v14 / v8)
          v21 = v14 / v8;
        if (v16)
          v21 = v22;
        CGAffineTransformMakeScale(&v27, v21, v21);
        v19 = v8 * v27.c + v27.a * v6;
        v20 = v8 * v27.d + v27.b * v6;
        v17 = v24 - (v19 - v12) * 0.5;
        v18 = v25 - (v20 - v14) * 0.5;
      }

      objc_msgSend(a1, "subviews");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "insertSubview:atIndex:", v26, objc_msgSend(v23, "count"));

      objc_msgSend(v26, "setFrame:", v17, v18, v19, v20);
    }
  }
}

- (void)setPlayerLayerView:(id)a3
{
  __AVPlayerLayerView *v5;
  __AVPlayerLayerView *playerLayerView;
  void *v7;
  __AVPlayerLayerView *v8;

  v5 = (__AVPlayerLayerView *)a3;
  playerLayerView = self->_playerLayerView;
  if (playerLayerView != v5)
  {
    v8 = v5;
    if (playerLayerView)
    {
      -[__AVPlayerLayerView superview](playerLayerView, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        -[__AVPlayerLayerView removeFromSuperview](self->_playerLayerView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_playerLayerView, a3);
    -[AVPlaybackContentContainerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3
{
  void *v4;

  if (self->_canShowStatusBarBackgroundGradientWhenStatusBarVisible != a3)
  {
    self->_canShowStatusBarBackgroundGradientWhenStatusBarVisible = a3;
    if (a3)
    {
      -[AVPlaybackContentContainerView statusBarBackgroundGradientView](self, "statusBarBackgroundGradientView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self));

    }
    -[AVPlaybackContentContainerView _updateStatusBarBackgroundGradientViewAlpha](self, "_updateStatusBarBackgroundGradientViewAlpha");
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackContentContainerView;
  -[AVPlaybackContentContainerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVPlaybackContentContainerView _updateStatusBarBackgroundGradientViewAlpha](self, "_updateStatusBarBackgroundGradientViewAlpha");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackContentContainerView;
  -[AVPlaybackContentContainerView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[AVPlaybackContentContainerView _updateStatusBarBackgroundGradientViewAlpha](self, "_updateStatusBarBackgroundGradientViewAlpha");
}

- (void)_updateStatusBarBackgroundGradientViewAlpha
{
  void *v2;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id *v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  _BOOL4 v37;
  AVStatusBarBackgroundGradientView *v38;
  AVStatusBarBackgroundGradientView *statusBarBackgroundGradientView;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];

  if (!-[AVPlaybackContentContainerView canShowStatusBarBackgroundGradientWhenStatusBarVisible](self, "canShowStatusBarBackgroundGradientWhenStatusBarVisible")&& !self->_statusBarBackgroundGradientView)
  {
    return;
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __77__AVPlaybackContentContainerView__updateStatusBarBackgroundGradientViewAlpha__block_invoke;
  v44[3] = &unk_1E5BB4CA0;
  v44[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v44);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nativeBounds");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nativeBounds");
  v9 = v8;

  if (v6 >= v9)
    v10 = v6;
  else
    v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;

  if (v13 >= v16)
    v17 = v13;
  else
    v17 = v16;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  v21 = v20;

  v22 = (id *)MEMORY[0x1E0DC4730];
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "_isClassic"))
    v23 = objc_msgSend(*v22, "_classicMode") != 5;
  else
    v23 = 0;
  v24 = 0.0;
  if (-[AVPlaybackContentContainerView canShowStatusBarBackgroundGradientWhenStatusBarVisible](self, "canShowStatusBarBackgroundGradientWhenStatusBarVisible"))
  {
    -[AVPlaybackContentContainerView window](self, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "windowScene");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "statusBarManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v27, "isStatusBarHidden"))
    {
      v28 = v17 * v21;
      if (v23)
      {
        -[AVPlaybackContentContainerView traitCollection](self, "traitCollection");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "displayCornerRadius");
        if (v29 != 0.0 || v10 != v28)
        {
LABEL_21:

          goto LABEL_22;
        }
LABEL_19:
        -[AVPlaybackContentContainerView window](self, "window");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "screen");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 == v32)
        {
          -[AVPlaybackContentContainerView window](self, "window");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "windowLevel");
          if (v35 >= *MEMORY[0x1E0DC5638])
          {
            v37 = 0;
          }
          else
          {
            -[AVPlaybackContentContainerView window](self, "window");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "windowScene");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "statusBarManager");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v36, "statusBarStyle") == 1;

            v37 = v40;
          }

          if (v23)
          {

            if (!v37)
              goto LABEL_23;
          }
          else
          {

            if (!v37)
              goto LABEL_23;
          }
          if (self->_statusBarBackgroundGradientView)
          {
            v24 = 0.4;
          }
          else
          {
            v38 = -[AVStatusBarBackgroundGradientView initWithFrame:]([AVStatusBarBackgroundGradientView alloc], "initWithFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self));
            statusBarBackgroundGradientView = self->_statusBarBackgroundGradientView;
            self->_statusBarBackgroundGradientView = v38;

            v24 = 0.4;
            -[AVStatusBarBackgroundGradientView setAlpha:](self->_statusBarBackgroundGradientView, "setAlpha:", 0.4);
            -[AVStatusBarBackgroundGradientView setUserInteractionEnabled:](self->_statusBarBackgroundGradientView, "setUserInteractionEnabled:", 0);
          }
          goto LABEL_23;
        }

        if (!v23)
          goto LABEL_22;
        goto LABEL_21;
      }
      if (v10 == v28)
        goto LABEL_19;
    }
LABEL_22:

  }
LABEL_23:
  if (-[AVPlaybackContentContainerView canShowStatusBarBackgroundGradientWhenStatusBarVisible](self, "canShowStatusBarBackgroundGradientWhenStatusBarVisible"))
  {
    if (!-[AVPlaybackContentContainerView isObservingStatusBarHidden](self, "isObservingStatusBarHidden"))
    {
      -[AVPlaybackContentContainerView setObservingStatusBarHidden:](self, "setObservingStatusBarHidden:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__updateStatusBarBackgroundGradientViewAlpha, *MEMORY[0x1E0DC5730], *v22);

    }
  }
  -[AVPlaybackContentContainerView statusBarBackgroundGradientView](self, "statusBarBackgroundGradientView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlpha:", v24);

}

- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible
{
  return self->_canShowStatusBarBackgroundGradientWhenStatusBarVisible;
}

- (AVPlaybackContentContainerView)initWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  AVPlaybackContentContainerView *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "playerLayerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AVPlaybackContentContainerView initWithFrame:playerLayerView:contentOverlayView:](self, "initWithFrame:playerLayerView:contentOverlayView:", v10, v11, x, y, width, height);
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5730], *MEMORY[0x1E0DC4730]);

  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackContentContainerView;
  -[AVPlaybackContentContainerView dealloc](&v4, sel_dealloc);
}

- (void)setVisualAnalysisView:(id)a3
{
  AVVisualAnalysisView *v5;
  AVVisualAnalysisView *visualAnalysisView;
  AVVisualAnalysisView *v7;

  v5 = (AVVisualAnalysisView *)a3;
  visualAnalysisView = self->_visualAnalysisView;
  if (visualAnalysisView != v5)
  {
    v7 = v5;
    -[AVVisualAnalysisView removeFromSuperview](visualAnalysisView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_visualAnalysisView, a3);
    -[AVPlaybackContentContainerView _updateVisualAnalysisViewFrameIfNeeded](self);
    v5 = v7;
  }

}

- (void)setContentOverlayViewSubview:(id)a3
{
  UIView *v5;
  UIView *contentOverlayViewSubview;
  UIView *v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  contentOverlayViewSubview = self->_contentOverlayViewSubview;
  if (contentOverlayViewSubview != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](contentOverlayViewSubview, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentOverlayViewSubview, a3);
    v5 = v9;
    if (v9)
    {
      -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();

      v5 = v9;
      if (v7 != v9)
      {
        -[AVPlaybackContentContainerView contentOverlayView](self, "contentOverlayView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", v9);

        -[AVPlaybackContentContainerView setNeedsLayout](self, "setNeedsLayout");
        -[AVPlaybackContentContainerView layoutIfNeeded](self, "layoutIfNeeded");
        v5 = v9;
      }
    }
  }

}

- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVideoGravity:", a3);

  if (v4)
  {
    -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avkit_removeAllSublayerTransformAnimations");

  }
  -[AVPlaybackContentContainerView _updateVisualAnalysisViewFrameIfNeeded](self);
}

- (void)removeAllSublayerTransformAnimations
{
  void *v2;
  id v3;

  -[AVPlaybackContentContainerView playerLayerView](self, "playerLayerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avkit_removeAllSublayerTransformAnimations");

}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  self->_playingOnSecondScreen = a3;
}

- (AVStatusBarBackgroundGradientView)statusBarBackgroundGradientView
{
  return self->_statusBarBackgroundGradientView;
}

- (BOOL)isObservingStatusBarHidden
{
  return self->_observingStatusBarHidden;
}

- (void)setObservingStatusBarHidden:(BOOL)a3
{
  self->_observingStatusBarHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundGradientView, 0);
  objc_storeStrong((id *)&self->_contentOverlayViewSubview, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);
  objc_storeStrong((id *)&self->_visualAnalysisView, 0);
}

void __77__AVPlaybackContentContainerView__updateStatusBarBackgroundGradientViewAlpha__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "statusBarBackgroundGradientView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](*(void **)(a1 + 32)));

}

- (double)_frameForStatusBarBackgroundGradientView
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (!a1)
    return 0.0;
  if (objc_msgSend(a1, "isPlayingOnSecondScreen"))
    objc_msgSend(a1, "bounds");
  else
    objc_msgSend(a1, "videoContentFrame");
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v30 = v5;
  objc_msgSend(a1, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBarManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusBarFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(a1, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:toView:", a1, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  if ((objc_msgSend(a1, "isPlayingOnSecondScreen") & 1) == 0)
  {
    if (objc_msgSend(a1, "canShowStatusBarBackgroundGradientWhenStatusBarVisible"))
    {
      v31.origin.x = v22;
      v31.origin.y = v24;
      v31.size.width = v26;
      v31.size.height = v28;
      v33.origin.x = v6;
      v33.origin.y = v7;
      v33.size.width = v8;
      v33.size.height = v30;
      if (CGRectIntersectsRect(v31, v33))
      {
        v32.origin.x = v6;
        v32.origin.y = v7;
        v32.size.width = v8;
        v32.size.height = v30;
        CGRectGetHeight(v32);
      }
    }
  }
  return v6;
}

@end
