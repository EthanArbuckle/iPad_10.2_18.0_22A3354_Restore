@implementation CEKCinematicSubjectIndicatorView

- (CEKCinematicSubjectIndicatorView)initWithFrame:(CGRect)a3
{
  CEKCinematicSubjectIndicatorView *v3;
  UIView *v4;
  UIView *containerView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImageView *topCrosshairView;
  uint64_t v12;
  UIImageView *leftCrosshairView;
  uint64_t v14;
  UIImageView *bottomCrosshairView;
  uint64_t v16;
  UIImageView *rightCrosshairView;
  void *v18;
  uint64_t v19;
  UIImageView *topLeftCornerView;
  uint64_t v21;
  UIImageView *topRightCornerView;
  uint64_t v23;
  UIImageView *bottomLeftCornerView;
  uint64_t v25;
  UIImageView *bottomRightCornerView;
  CEKCinematicSubjectIndicatorView *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CEKCinematicSubjectIndicatorView;
  v3 = -[CEKCinematicSubjectIndicatorView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v3->__containerView;
    v3->__containerView = v4;

    -[CEKCinematicSubjectIndicatorView addSubview:](v3, "addSubview:", v3->__containerView);
    v6 = (void *)MEMORY[0x1E0DC3870];
    CEKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("CEKSubjectIndicatorCrossHair"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 4.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    topCrosshairView = v3->__topCrosshairView;
    v3->__topCrosshairView = (UIImageView *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    leftCrosshairView = v3->__leftCrosshairView;
    v3->__leftCrosshairView = (UIImageView *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    bottomCrosshairView = v3->__bottomCrosshairView;
    v3->__bottomCrosshairView = (UIImageView *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    rightCrosshairView = v3->__rightCrosshairView;
    v3->__rightCrosshairView = (UIImageView *)v16;

    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__topCrosshairView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__leftCrosshairView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__bottomCrosshairView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__rightCrosshairView);
    objc_msgSend((id)objc_opt_class(), "_cornerImageWithResizableCapInsetsNamed:", CFSTR("CEKCinematicSubjectIndicatorCornerInactiveThin"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
    topLeftCornerView = v3->__topLeftCornerView;
    v3->__topLeftCornerView = (UIImageView *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
    topRightCornerView = v3->__topRightCornerView;
    v3->__topRightCornerView = (UIImageView *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
    bottomLeftCornerView = v3->__bottomLeftCornerView;
    v3->__bottomLeftCornerView = (UIImageView *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
    bottomRightCornerView = v3->__bottomRightCornerView;
    v3->__bottomRightCornerView = (UIImageView *)v25;

    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__topLeftCornerView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__topRightCornerView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__bottomLeftCornerView);
    -[UIView addSubview:](v3->__containerView, "addSubview:", v3->__bottomRightCornerView);
    v3->_shape = 0;
    v3->__crosshairsVisible = 0;
    v3->__activeAnimationToActiveRoundedRectCount = 0;
    v27 = v3;

  }
  return v3;
}

+ (id)_cornerImageWithResizableCapInsetsNamed:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  CEKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "size");
  objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 + -1.0, v7 + -1.0, 0.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setShape:(int64_t)a3
{
  -[CEKCinematicSubjectIndicatorView setShape:animated:](self, "setShape:animated:", a3, 0);
}

- (void)setShape:(int64_t)a3 animated:(BOOL)a4
{
  -[CEKCinematicSubjectIndicatorView setShape:shouldUseCrosshairForAnimation:animated:](self, "setShape:shouldUseCrosshairForAnimation:animated:", a3, 1, a4);
}

- (void)setShape:(int64_t)a3 shouldUseCrosshairForAnimation:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  CEKCinematicSubjectIndicatorView *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  CEKCinematicSubjectIndicatorView *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  CEKCinematicSubjectIndicatorView *v38;

  if (self->_shape != a3)
  {
    v5 = a5;
    v6 = a4;
    -[CEKCinematicSubjectIndicatorView _topCrosshairView](self, "_topCrosshairView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _leftCrosshairView](self, "_leftCrosshairView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _bottomCrosshairView](self, "_bottomCrosshairView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _rightCrosshairView](self, "_rightCrosshairView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAllAnimations");

    -[CEKCinematicSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllAnimations");

    if (v5)
      -[CEKCinematicSubjectIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
    self->_shape = a3;
    if (a3 == 2)
    {
      -[CEKCinematicSubjectIndicatorView set_crosshairsVisible:](self, "set_crosshairsVisible:", 0);
      if (v5)
      {
        -[CEKCinematicSubjectIndicatorView _performAnimationToActiveCorners](self, "_performAnimationToActiveCorners");
        return;
      }
      v27 = self;
      v28 = 0;
    }
    else
    {
      if (a3 != 1)
      {
        if (a3)
          return;
        -[CEKCinematicSubjectIndicatorView set_crosshairsVisible:](self, "set_crosshairsVisible:", 0);
        -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](self, "_updateCornerImageViewsForThickness:duration:delay:", 1, 0.0, 0.0);
        -[CEKCinematicSubjectIndicatorView setNeedsLayout](self, "setNeedsLayout");
        if (!v5)
          return;
        v25 = (void *)MEMORY[0x1E0DC3F10];
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke;
        v37 = &unk_1E70A4B18;
        v38 = self;
        v26 = &v34;
LABEL_19:
        objc_msgSend(v25, "animateWithDuration:delay:options:animations:completion:", 2, v26, 0, 0.2, 0.0, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
        return;
      }
      if (v5)
      {
        if (v6)
        {
          -[CEKCinematicSubjectIndicatorView _performAnimationToActiveRoundedRect](self, "_performAnimationToActiveRoundedRect");
          return;
        }
        -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](self, "_updateCornerImageViewsForThickness:duration:delay:", 1, 0.0, 0.0);
        -[CEKCinematicSubjectIndicatorView setNeedsLayout](self, "setNeedsLayout");
        v25 = (void *)MEMORY[0x1E0DC3F10];
        v29 = MEMORY[0x1E0C809B0];
        v30 = 3221225472;
        v31 = __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke_2;
        v32 = &unk_1E70A4B18;
        v33 = self;
        v26 = &v29;
        goto LABEL_19;
      }
      v27 = self;
      v28 = 1;
    }
    -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](v27, "_updateCornerImageViewsForThickness:duration:delay:", v28, 0.0, 0.0);
    -[CEKCinematicSubjectIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __85__CEKCinematicSubjectIndicatorView_setShape_shouldUseCrosshairForAnimation_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updateCornerImageViewsForThickness:(int64_t)a3 duration:(double)a4 delay:(double)a5
{
  int64_t v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;

  v9 = -[CEKCinematicSubjectIndicatorView shape](self, "shape");
  if (a3 == 2)
  {
    v10 = CFSTR("CEKSubjectIndicatorCornerActiveThick");
    v11 = CFSTR("CEKCinematicSubjectIndicatorCornerInactiveThick");
  }
  else if (a3 == 1)
  {
    v10 = CFSTR("CEKSubjectIndicatorCornerActiveThin");
    v11 = CFSTR("CEKCinematicSubjectIndicatorCornerInactiveThin");
  }
  else
  {
    if (a3)
    {
      v12 = &stru_1E70A5BC0;
      goto LABEL_11;
    }
    v10 = CFSTR("CEKSubjectIndicatorCornerActive");
    v11 = CFSTR("CEKCinematicSubjectIndicatorCornerInactive");
  }
  if (!v9)
    v10 = (__CFString *)v11;
  v12 = v10;
LABEL_11:
  v30 = (__CFString *)v12;
  objc_msgSend((id)objc_opt_class(), "_cornerImageWithResizableCapInsetsNamed:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKCinematicSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimingFunction:", v17);

    objc_msgSend(v16, "setDuration:", a4);
    objc_msgSend(v16, "setBeginTime:", CACurrentMediaTime() + a5);
    objc_msgSend(v16, "setFromValue:", objc_msgSend(objc_retainAutorelease(v15), "CGImage"));
    objc_msgSend(v16, "setToValue:", objc_msgSend(objc_retainAutorelease(v13), "CGImage"));
    objc_msgSend(v16, "setDelegate:", self);
    objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B50]);
    -[CEKCinematicSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAnimation:forKey:", v16, CFSTR("animateContents"));

    -[CEKCinematicSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAnimation:forKey:", v16, CFSTR("animateContents"));

    -[CEKCinematicSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAnimation:forKey:", v16, CFSTR("animateContents"));

    -[CEKCinematicSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAnimation:forKey:", v16, CFSTR("animateContents"));

  }
  -[CEKCinematicSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setImage:", v13);

  -[CEKCinematicSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setImage:", v13);

  -[CEKCinematicSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setImage:", v13);

  -[CEKCinematicSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setImage:", v13);

}

- (void)_performAnimationToActiveCorners
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", v3);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke;
  v6[3] = &unk_1E70A4B18;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.45, 0.0);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_4;
  v5[3] = &unk_1E70A4B18;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, 0.2, 0.0);
  -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](self, "_updateCornerImageViewsForThickness:duration:delay:", 1, 0.2, 0.0);
  -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](self, "_updateCornerImageViewsForThickness:duration:delay:", 0, 0.25, 0.15);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_2;
  v5[3] = &unk_1E70A4B18;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.45);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_3;
  v4[3] = &unk_1E70A4B18;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.45, 0.55);
}

void __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_2(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.1, 1.1);
  objc_msgSend(*(id *)(a1 + 32), "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  objc_msgSend(v3, "setTransform:", &v4);

}

void __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_3(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __68__CEKCinematicSubjectIndicatorView__performAnimationToActiveCorners__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateCornerViews");
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibility");
}

- (void)_performAnimationToActiveRoundedRect
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  -[CEKCinematicSubjectIndicatorView set_activeAnimationToActiveRoundedRectCount:](self, "set_activeAnimationToActiveRoundedRectCount:", -[CEKCinematicSubjectIndicatorView _activeAnimationToActiveRoundedRectCount](self, "_activeAnimationToActiveRoundedRectCount")+ 1);
  -[CEKCinematicSubjectIndicatorView set_crosshairsVisible:](self, "set_crosshairsVisible:", 1);
  -[CEKCinematicSubjectIndicatorView _updateCrossHairViewsWithHeight:](self, "_updateCrossHairViewsWithHeight:", 0.0);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", v3);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke;
  v9[3] = &unk_1E70A4B18;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 2, v9, 0, 0.45, 0.0);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_4;
  v8[3] = &unk_1E70A4B18;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v8, 0, 0.2, 0.0);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_5;
  v7[3] = &unk_1E70A4B18;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v7, 0, 0.15, 0.05);
  v5[4] = self;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_6;
  v6[3] = &unk_1E70A4B18;
  v6[4] = self;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_7;
  v5[3] = &unk_1E70A4B88;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v6, v5, 0.3, 1.3);
  -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](self, "_updateCornerImageViewsForThickness:duration:delay:", 0, 0.15, 0.15);
  -[CEKCinematicSubjectIndicatorView _updateCornerImageViewsForThickness:duration:delay:](self, "_updateCornerImageViewsForThickness:duration:delay:", 1, 0.3, 1.3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_2;
  v5[3] = &unk_1E70A4B18;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.45);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_3;
  v4[3] = &unk_1E70A4B18;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.45, 0.55);
}

void __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_2(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.1, 1.1);
  objc_msgSend(*(id *)(a1 + 32), "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  objc_msgSend(v3, "setTransform:", &v4);

}

void __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_3(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v5.c = v2;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v6, &v5, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCornerViews");
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCrossHairViewsWithHeight:", 14.0);
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCrossHairViewsWithHeight:", 0.0);
}

uint64_t __72__CEKCinematicSubjectIndicatorView__performAnimationToActiveRoundedRect__block_invoke_7(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "set_activeAnimationToActiveRoundedRectCount:", objc_msgSend(*(id *)(a1 + 32), "_activeAnimationToActiveRoundedRectCount") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "_activeAnimationToActiveRoundedRectCount");
  if (!(_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "set_crosshairsVisible:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)CEKCinematicSubjectIndicatorView;
  -[CEKCinematicSubjectIndicatorView layoutSubviews](&v15, sel_layoutSubviews);
  -[CEKCinematicSubjectIndicatorView bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  CGRectGetMidX(v16);
  UIRoundToViewScale();
  v8 = v7;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGRectGetMidY(v17);
  UIRoundToViewScale();
  v10 = v9;
  -[CEKCinematicSubjectIndicatorView _containerView](self, "_containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", x + -3.0, y + -3.0, width + 6.0, height + 6.0);
  objc_msgSend(v11, "setCenter:", v8, v10);
  -[CEKCinematicSubjectIndicatorView _updateCornerViews](self, "_updateCornerViews");
  -[CEKCinematicSubjectIndicatorView _topCrosshairView](self, "_topCrosshairView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  -[CEKCinematicSubjectIndicatorView _updateCrossHairViewsWithHeight:](self, "_updateCrossHairViewsWithHeight:", v14);

  -[CEKCinematicSubjectIndicatorView _updateVisibility](self, "_updateVisibility");
}

- (void)_updateCornerViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;

  -[CEKCinematicSubjectIndicatorView bounds](self, "bounds");
  v4 = v3 + 6.0;
  v6 = v5 + 6.0;
  -[CEKCinematicSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = -[CEKCinematicSubjectIndicatorView shape](self, "shape");
  if (v13 < 2)
  {
    UIRoundToViewScale();
    v15 = v14;
    UIRoundToViewScale();
    v17 = v16;
    v18 = 0.0;
    v19 = v16;
    v20 = v15;
LABEL_15:
    v23 = 0.0;
    goto LABEL_16;
  }
  if (v13 == 2)
  {
    if (v4 >= v6)
      v21 = v6;
    else
      v21 = v4;
    v22 = v21 * 0.5;
    if (v12 >= v22)
      v19 = v22;
    else
      v19 = v12;
    if (v10 >= v22)
      v20 = v22;
    else
      v20 = v10;
    v15 = v4 - v20;
    v17 = v6 - v19;
    v18 = 0.0;
    goto LABEL_15;
  }
  v15 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = v17;
  v23 = *MEMORY[0x1E0C9D648];
LABEL_16:
  -[CEKCinematicSubjectIndicatorView _topLeftCornerView](self, "_topLeftCornerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v23, v18, v20, v19);

  -[CEKCinematicSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v15, v18, v20, v19);

  -[CEKCinematicSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v23, v17, v20, v19);

  -[CEKCinematicSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v15, v17, v20, v19);

  CGAffineTransformMakeScale(&v36, -1.0, 1.0);
  -[CEKCinematicSubjectIndicatorView _topRightCornerView](self, "_topRightCornerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v36;
  objc_msgSend(v28, "setTransform:", &v35);

  CGAffineTransformMakeScale(&v34, 1.0, -1.0);
  -[CEKCinematicSubjectIndicatorView _bottomLeftCornerView](self, "_bottomLeftCornerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v34;
  objc_msgSend(v29, "setTransform:", &v33);

  CGAffineTransformMakeScale(&v32, -1.0, -1.0);
  -[CEKCinematicSubjectIndicatorView _bottomRightCornerView](self, "_bottomRightCornerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v32;
  objc_msgSend(v30, "setTransform:", &v31);

}

- (void)_updateCrossHairViewsWithHeight:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;

  -[CEKCinematicSubjectIndicatorView bounds](self, "bounds");
  -[CEKCinematicSubjectIndicatorView _topCrosshairView](self, "_topCrosshairView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  UIRoundToViewScale();
  UIRoundToViewScale();
  UIRoundToViewScale();
  UIRoundToViewScale();
  -[CEKCinematicSubjectIndicatorView _topCrosshairView](self, "_topCrosshairView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v8, a3);

  -[CEKCinematicSubjectIndicatorView _bottomCrosshairView](self, "_bottomCrosshairView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v8, a3);

  -[CEKCinematicSubjectIndicatorView _leftCrosshairView](self, "_leftCrosshairView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, a3);

  -[CEKCinematicSubjectIndicatorView _rightCrosshairView](self, "_rightCrosshairView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v8, a3);

  UIRectGetCenter();
  v14 = v13;
  v16 = v15;
  -[CEKCinematicSubjectIndicatorView _topCrosshairView](self, "_topCrosshairView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", v14, v16);

  UIRectGetCenter();
  v19 = v18;
  v21 = v20;
  -[CEKCinematicSubjectIndicatorView _bottomCrosshairView](self, "_bottomCrosshairView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v19, v21);

  UIRectGetCenter();
  v24 = v23;
  v26 = v25;
  -[CEKCinematicSubjectIndicatorView _leftCrosshairView](self, "_leftCrosshairView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCenter:", v24, v26);

  UIRectGetCenter();
  v29 = v28;
  v31 = v30;
  -[CEKCinematicSubjectIndicatorView _rightCrosshairView](self, "_rightCrosshairView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v29, v31);

  CGAffineTransformMakeRotation(&v41, 3.14159265);
  -[CEKCinematicSubjectIndicatorView _bottomCrosshairView](self, "_bottomCrosshairView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v41;
  objc_msgSend(v33, "setTransform:", &v40);

  CGAffineTransformMakeRotation(&v39, 4.71238898);
  -[CEKCinematicSubjectIndicatorView _leftCrosshairView](self, "_leftCrosshairView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v39;
  objc_msgSend(v34, "setTransform:", &v38);

  CGAffineTransformMakeRotation(&v37, 1.57079633);
  -[CEKCinematicSubjectIndicatorView _rightCrosshairView](self, "_rightCrosshairView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v37;
  objc_msgSend(v35, "setTransform:", &v36);

}

- (void)_updateVisibility
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CEKCinematicSubjectIndicatorView _crosshairsVisible](self, "_crosshairsVisible") ^ 1;
  -[CEKCinematicSubjectIndicatorView _topCrosshairView](self, "_topCrosshairView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  -[CEKCinematicSubjectIndicatorView _bottomCrosshairView](self, "_bottomCrosshairView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[CEKCinematicSubjectIndicatorView _leftCrosshairView](self, "_leftCrosshairView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

  -[CEKCinematicSubjectIndicatorView _rightCrosshairView](self, "_rightCrosshairView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3);

}

+ (CGRect)minimumSuggestedBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 50.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 50.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)shape
{
  return self->_shape;
}

- (UIImageView)_topLeftCornerView
{
  return self->__topLeftCornerView;
}

- (UIImageView)_topRightCornerView
{
  return self->__topRightCornerView;
}

- (UIImageView)_bottomLeftCornerView
{
  return self->__bottomLeftCornerView;
}

- (UIImageView)_bottomRightCornerView
{
  return self->__bottomRightCornerView;
}

- (UIImageView)_topCrosshairView
{
  return self->__topCrosshairView;
}

- (UIImageView)_leftCrosshairView
{
  return self->__leftCrosshairView;
}

- (UIImageView)_bottomCrosshairView
{
  return self->__bottomCrosshairView;
}

- (UIImageView)_rightCrosshairView
{
  return self->__rightCrosshairView;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (BOOL)_crosshairsVisible
{
  return self->__crosshairsVisible;
}

- (void)set_crosshairsVisible:(BOOL)a3
{
  self->__crosshairsVisible = a3;
}

- (int)_activeAnimationToActiveRoundedRectCount
{
  return self->__activeAnimationToActiveRoundedRectCount;
}

- (void)set_activeAnimationToActiveRoundedRectCount:(int)a3
{
  self->__activeAnimationToActiveRoundedRectCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->__rightCrosshairView, 0);
  objc_storeStrong((id *)&self->__bottomCrosshairView, 0);
  objc_storeStrong((id *)&self->__leftCrosshairView, 0);
  objc_storeStrong((id *)&self->__topCrosshairView, 0);
  objc_storeStrong((id *)&self->__bottomRightCornerView, 0);
  objc_storeStrong((id *)&self->__bottomLeftCornerView, 0);
  objc_storeStrong((id *)&self->__topRightCornerView, 0);
  objc_storeStrong((id *)&self->__topLeftCornerView, 0);
}

@end
