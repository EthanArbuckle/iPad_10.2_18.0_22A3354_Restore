@implementation MediaControlsParentContainerView

- (MediaControlsParentContainerView)initWithFrame:(CGRect)a3
{
  MediaControlsParentContainerView *v3;
  MediaControlsContainerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  MediaControlsContainerView *containerView;
  uint64_t v11;
  UIView *mediaControlsRoutingPickerView;
  MediaControlsSeparatorView *v13;
  MediaControlsSeparatorView *topDividerView;
  MediaControlsSeparatorView *v15;
  MediaControlsSeparatorView *bottomDividerView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MediaControlsParentContainerView;
  v3 = -[MediaControlsParentContainerView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MediaControlsContainerView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[MediaControlsContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    containerView = v3->_containerView;
    v3->_containerView = (MediaControlsContainerView *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    mediaControlsRoutingPickerView = v3->_mediaControlsRoutingPickerView;
    v3->_mediaControlsRoutingPickerView = (UIView *)v11;

    v13 = -[MediaControlsSeparatorView initWithFrame:]([MediaControlsSeparatorView alloc], "initWithFrame:", v5, v6, v7, v8);
    topDividerView = v3->_topDividerView;
    v3->_topDividerView = v13;

    v15 = -[MediaControlsSeparatorView initWithFrame:]([MediaControlsSeparatorView alloc], "initWithFrame:", v5, v6, v7, v8);
    bottomDividerView = v3->_bottomDividerView;
    v3->_bottomDividerView = v15;

    v3->_routingViewControllerAnimationCount = 0;
    -[MediaControlsParentContainerView containerView](v3, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsParentContainerView addSubview:](v3, "addSubview:", v17);

    -[MediaControlsParentContainerView mediaControlsRoutingPickerView](v3, "mediaControlsRoutingPickerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsParentContainerView addSubview:](v3, "addSubview:", v18);

    -[MediaControlsParentContainerView topDividerView](v3, "topDividerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsParentContainerView addSubview:](v3, "addSubview:", v19);

    -[MediaControlsParentContainerView bottomDividerView](v3, "bottomDividerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsParentContainerView addSubview:](v3, "addSubview:", v20);

    -[MediaControlsParentContainerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if (v22 == 1)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v3, sel_handleHoverGestureRecognizer_);
      -[MediaControlsParentContainerView addGestureRecognizer:](v3, "addGestureRecognizer:", v23);

    }
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
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
  int64_t v14;
  unint64_t style;
  BOOL v16;
  uint64_t v17;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double MinY;
  double Width;
  void *v47;
  CGFloat v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v53.receiver = self;
  v53.super_class = (Class)MediaControlsParentContainerView;
  -[MediaControlsParentContainerView layoutSubviews](&v53, sel_layoutSubviews);
  -[MediaControlsParentContainerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  MPFloatGetSafeScaleForValue();
  v5 = v4;
  -[MediaControlsParentContainerView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[MediaControlsParentContainerView selectedMode](self, "selectedMode");
  style = self->_style;
  v16 = style > 5;
  v17 = (1 << style) & 0x29;
  if (v16 || v17 == 0)
  {
    -[MediaControlsParentContainerView containerView](self, "containerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v7, v9, v11, v13);

    -[MediaControlsParentContainerView mediaControlsRoutingPickerView](self, "mediaControlsRoutingPickerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v39 = v7;
    v40 = v9;
    v41 = v11;
    v42 = v13;
  }
  else
  {
    v19 = v7 + 0.0;
    if (v14 != 1)
      v19 = v7;
    v51 = v19;
    UIRectIntegralWithScale();
    v21 = v20;
    v23 = v22;
    v52 = v5;
    v25 = v24;
    v27 = v26;
    -[MediaControlsParentContainerView containerView](self, "containerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    UIRectIntegralWithScale();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[MediaControlsParentContainerView mediaControlsRoutingPickerView](self, "mediaControlsRoutingPickerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v39 = v30;
    v5 = v52;
    v40 = v32;
    v41 = v34;
    v42 = v36;
  }
  objc_msgSend(v37, "setFrame:", v39, v40, v41, v42, *(_QWORD *)&v51);

  if (v5 >= 1.0)
    v44 = 1.0 / v5;
  else
    v44 = 1.0;
  -[MediaControlsParentContainerView bounds](self, "bounds");
  MinY = CGRectGetMinY(v54);
  -[MediaControlsParentContainerView bounds](self, "bounds");
  Width = CGRectGetWidth(v55);
  -[MediaControlsParentContainerView topDividerView](self, "topDividerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", 0.0, MinY, Width, v44);

  -[MediaControlsParentContainerView bounds](self, "bounds");
  v48 = CGRectGetMaxY(v56) - v44;
  -[MediaControlsParentContainerView bounds](self, "bounds");
  v49 = CGRectGetWidth(v57);
  -[MediaControlsParentContainerView bottomDividerView](self, "bottomDividerView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", 0.0, v48, v49, v44);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsParentContainerView;
  -[MediaControlsParentContainerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MediaControlsParentContainerView _updateTimeControlVisibility:](self, "_updateTimeControlVisibility:", CFSTR("didMoveToWindow"));
}

- (void)setStyle:(int64_t)a3
{
  void *v5;

  -[MediaControlsParentContainerView containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", a3);

  if (self->_style != a3)
  {
    self->_style = a3;
    -[MediaControlsParentContainerView _updateRoutingPickerVisibilityAnimated:](self, "_updateRoutingPickerVisibilityAnimated:", 0);
    -[MediaControlsParentContainerView _updateTimeControlVisibility:](self, "_updateTimeControlVisibility:", CFSTR("setStyle"));
    -[MediaControlsParentContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelectedMode:(int64_t)a3
{
  -[MediaControlsParentContainerView setSelectedMode:animated:](self, "setSelectedMode:animated:", a3, 0);
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_selectedMode != a3)
  {
    v4 = a4;
    self->_selectedMode = a3;
    -[MediaControlsParentContainerView _updateTimeControlVisibility:](self, "_updateTimeControlVisibility:", CFSTR("setSelectedMode"));
    -[MediaControlsParentContainerView _toggleRoutingPickerAnimated:](self, "_toggleRoutingPickerAnimated:", v4);
  }
}

- (MediaControlsTransportStackView)transportStackView
{
  return -[MediaControlsContainerView transportStackView](self->_containerView, "transportStackView");
}

- (void)setTransportStackView:(id)a3
{
  -[MediaControlsContainerView setTransportStackView:](self->_containerView, "setTransportStackView:", a3);
}

- (MediaControlsTimeControl)timeControl
{
  return -[MediaControlsContainerView timeControl](self->_containerView, "timeControl");
}

- (void)setTimeControl:(id)a3
{
  -[MediaControlsContainerView setTimeControl:](self->_containerView, "setTimeControl:", a3);
}

- (void)_updateRoutingPickerVisibilityAnimated:(BOOL)a3
{
  int64_t v5;
  void *v6;
  double v7;
  id v8;

  v5 = -[MediaControlsParentContainerView selectedMode](self, "selectedMode");
  if (!a3)
  {
    -[MediaControlsParentContainerView mediaControlsRoutingPickerView](self, "mediaControlsRoutingPickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v5 != 1);

  }
  if (v5 == 1)
    v7 = 0.0;
  else
    v7 = 1.0;
  -[MediaControlsParentContainerView containerView](self, "containerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)_updateTimeControlVisibility:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[MediaControlsParentContainerView _isInAWindow](self, "_isInAWindow") & 1) != 0)
  {
    v5 = !-[MediaControlsParentContainerView selectedMode](self, "selectedMode")
      && (!-[MediaControlsParentContainerView style](self, "style")
       || -[MediaControlsParentContainerView style](self, "style") == 4)
      || -[MediaControlsParentContainerView style](self, "style") == 3;
    -[MediaControlsParentContainerView containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
  }
  else
  {
    -[MediaControlsParentContainerView containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "setTimeControlOnScreen:", v8);

  if (-[MediaControlsParentContainerView style](self, "style") == 3)
  {
    _MRLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[MediaControlsParentContainerView containerView](self, "containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v4;
      v13 = 1024;
      v14 = objc_msgSend(v10, "isTimeControlOnScreen");
      v15 = 1024;
      v16 = -[MediaControlsParentContainerView _isInAWindow](self, "_isInAWindow");
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "MediaControlsCoverSheet _updateTimeControlVisibility Reason: %{public}@ timeControlOnScreen: %{BOOL}u _isInAWindow:%{BOOL}u", (uint8_t *)&v11, 0x18u);

    }
  }

}

- (void)_toggleRoutingPickerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD);
  int64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD v19[5];
  _QWORD aBlock[5];
  BOOL v21;
  _QWORD v22[5];

  v3 = a3;
  v5 = -[MediaControlsParentContainerView selectedMode](self, "selectedMode");
  v6 = MEMORY[0x1E0C809B0];
  if (v5 == 1)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke;
    v22[3] = &unk_1E5818C88;
    v22[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v22);
    -[UIView setHidden:](self->_mediaControlsRoutingPickerView, "setHidden:", 0);
  }
  aBlock[0] = v6;
  aBlock[1] = 3221225472;
  aBlock[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_2;
  aBlock[3] = &unk_1E5818D00;
  aBlock[4] = self;
  v21 = v3;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_3;
  v19[3] = &unk_1E5818C88;
  v19[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(v19);
  if (v3)
  {
    v9 = -[MediaControlsParentContainerView selectedMode](self, "selectedMode");
    v10 = objc_alloc(MEMORY[0x1E0CC2370]);
    if (v9 == 1)
    {
      v11 = 500.0;
      v12 = 1000.0;
      v13 = 3.0;
    }
    else
    {
      v11 = 300.0;
      v12 = 36.0;
      v13 = 2.0;
    }
    v14 = (void *)objc_msgSend(v10, "initWithMass:stiffness:damping:initialVelocity:", v13, v11, v12, 0.0, 0.0);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
    objc_msgSend(v14, "setSpringCubicTimingParameters:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2368]), "initWithDuration:timingParameters:", v14, 1.0);
    objc_msgSend(v16, "addAnimations:", v7);
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_4;
    v17[3] = &unk_1E58192C8;
    v18 = v8;
    objc_msgSend(v16, "addCompletion:", v17);
    objc_msgSend(v16, "startAnimation");

  }
  else
  {
    v7[2](v7);
    v8[2](v8);
  }

}

uint64_t __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setInitialFrameForRoutingView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
}

uint64_t __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_2(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 464);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_updateRoutingPickerVisibilityAnimated:", *(unsigned __int8 *)(a1 + 40));
}

_QWORD *__65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_3(uint64_t a1)
{
  _QWORD *result;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 464);
  result = *(_QWORD **)(a1 + 32);
  if (!result[58])
    return (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setHidden:", objc_msgSend(result, "selectedMode") != 1);
  return result;
}

uint64_t __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setInitialFrameForRoutingView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[MediaControlsParentContainerView traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");

  -[MediaControlsParentContainerView bounds](self, "bounds");
  UIRectIntegralWithScale();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MediaControlsParentContainerView mediaControlsRoutingPickerView](self, "mediaControlsRoutingPickerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (UIView)routingView
{
  return self->_mediaControlsRoutingPickerView;
}

- (void)setRoutingView:(id)a3
{
  UIView *v5;
  UIView **p_mediaControlsRoutingPickerView;
  UIView *mediaControlsRoutingPickerView;
  int64_t v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_mediaControlsRoutingPickerView = &self->_mediaControlsRoutingPickerView;
  mediaControlsRoutingPickerView = self->_mediaControlsRoutingPickerView;
  if (mediaControlsRoutingPickerView != v5)
  {
    v9 = v5;
    if (-[UIView isDescendantOfView:](mediaControlsRoutingPickerView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_mediaControlsRoutingPickerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_mediaControlsRoutingPickerView, a3);
    -[MediaControlsParentContainerView addSubview:](self, "addSubview:", *p_mediaControlsRoutingPickerView);
    -[MediaControlsParentContainerView _updateRoutingPickerVisibilityAnimated:](self, "_updateRoutingPickerVisibilityAnimated:", 0);
    v8 = -[MediaControlsParentContainerView selectedMode](self, "selectedMode");
    v5 = v9;
    if (v8 == 1)
    {
      -[MediaControlsParentContainerView layoutIfNeeded](self, "layoutIfNeeded");
      -[MediaControlsParentContainerView setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)handleHoverGestureRecognizer:(id)a3
{
  if (self->_style == 3)
    -[MediaControlsParentContainerView setClipsToBounds:](self, "setClipsToBounds:", (unint64_t)(objc_msgSend(a3, "state") - 3) < 0xFFFFFFFFFFFFFFFELL);
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (MediaControlsContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (MediaControlsSeparatorView)topDividerView
{
  return self->_topDividerView;
}

- (void)setTopDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_topDividerView, a3);
}

- (MediaControlsSeparatorView)bottomDividerView
{
  return self->_bottomDividerView;
}

- (void)setBottomDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomDividerView, a3);
}

- (UIView)mediaControlsRoutingPickerView
{
  return self->_mediaControlsRoutingPickerView;
}

- (void)setMediaControlsRoutingPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlsRoutingPickerView, a3);
}

- (int64_t)routingViewControllerAnimationCount
{
  return self->_routingViewControllerAnimationCount;
}

- (void)setRoutingViewControllerAnimationCount:(int64_t)a3
{
  self->_routingViewControllerAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControlsRoutingPickerView, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
