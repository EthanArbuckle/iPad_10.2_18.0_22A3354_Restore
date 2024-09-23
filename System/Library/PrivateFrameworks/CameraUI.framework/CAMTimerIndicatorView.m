@implementation CAMTimerIndicatorView

- (CAMTimerIndicatorView)initWithFrame:(CGRect)a3
{
  CAMTimerIndicatorView *v3;
  CAMTimerIndicatorView *v4;
  CAMTimerIndicatorView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTimerIndicatorView;
  v3 = -[CAMTimerIndicatorView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMTimerIndicatorView _commonCAMTimerIndicatorViewInitialization](v3, "_commonCAMTimerIndicatorViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMTimerIndicatorViewInitialization
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *dimmingView;
  UIView *v11;
  void *v12;
  UILabel *v13;
  UILabel *countdownLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;

  -[CAMTimerIndicatorView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_style = 2 * (objc_msgSend(v3, "cam_initialLayoutStyle") == 1);

  -[CAMTimerIndicatorView setAutoresizingMask:](self, "setAutoresizingMask:", 18);
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  dimmingView = self->__dimmingView;
  self->__dimmingView = v9;

  -[UIView setAutoresizingMask:](self->__dimmingView, "setAutoresizingMask:", 18);
  v11 = self->__dimmingView;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  -[UIView setAlpha:](self->__dimmingView, "setAlpha:", 0.0);
  -[CAMTimerIndicatorView addSubview:](self, "addSubview:", self->__dimmingView);
  self->__remainingTicks = 0;
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  countdownLabel = self->__countdownLabel;
  self->__countdownLabel = v13;

  v15 = self->__countdownLabel;
  -[CAMTimerIndicatorView _fontForStyle:](self, "_fontForStyle:", self->_style);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v15, "setFont:", v16);

  v17 = self->__countdownLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v17, "setTextColor:", v18);

  -[UILabel setTextAlignment:](self->__countdownLabel, "setTextAlignment:", 1);
  v19 = self->__countdownLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

  -[UILabel layer](self->__countdownLabel, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.63);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "setShadowColor:", objc_msgSend(v22, "CGColor"));

  -[UILabel layer](self->__countdownLabel, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  -[UILabel layer](self->__countdownLabel, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 1.0;
  objc_msgSend(v24, "setShadowOpacity:", v25);

  -[UILabel layer](self->__countdownLabel, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowRadius:", 2.0);

  -[CAMTimerIndicatorView addSubview:](self, "addSubview:", self->__countdownLabel);
  -[CAMTimerIndicatorView _updateCountdownLabelWithTicksRemaining](self, "_updateCountdownLabelWithTicksRemaining");
}

- (id)_fontForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 2)
    return 0;
  +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", dbl_1DB9A5678[a3], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateCountdownLabelWithTicksRemaining
{
  void *v3;
  void *v4;
  id v5;

  -[UILabel setAlpha:](self->__countdownLabel, "setAlpha:", 0.0);
  CAMTimerCountdownFormatter();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__remainingTicks);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->__countdownLabel, "setText:", v4);
}

- (BOOL)_isPerformingStyleAnimation
{
  return self->__performingStyleAnimation;
}

- (void)_handleOrientationChange:(int64_t)a3
{
  if (a3)
  {
    -[CAMTimerIndicatorView _setLabelOrientation:](self, "_setLabelOrientation:");
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", self->__countdownLabel, a3, 1);
    -[CAMTimerIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setLabelOrientation:(int64_t)a3
{
  self->__labelOrientation = a3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMTimerIndicatorView;
  -[CAMTimerIndicatorView layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMTimerIndicatorView bounds](self, "bounds");
  -[UIView setFrame:](self->__dimmingView, "setFrame:");
  -[CAMTimerIndicatorView _layoutCountdownLabelForStyle:](self, "_layoutCountdownLabelForStyle:", self->_style);
}

- (void)_layoutCountdownLabelForStyle:(int64_t)a3
{
  if (!-[CAMTimerIndicatorView _isPerformingStyleAnimation](self, "_isPerformingStyleAnimation"))
  {
    if ((unint64_t)a3 >= 2)
    {
      if (a3 == 2)
        -[CAMTimerIndicatorView _layoutCountdownLabelForLargeStyle](self, "_layoutCountdownLabelForLargeStyle");
    }
    else
    {
      -[CAMTimerIndicatorView _layoutCountdownLabelForSmallStyle](self, "_layoutCountdownLabelForSmallStyle");
    }
  }
}

- (void)_layoutCountdownLabelForSmallStyle
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
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
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MaxX;
  CGFloat v26;
  double MaxY;
  CGFloat rect;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[CAMTimerIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UILabel intrinsicContentSize](self->__countdownLabel, "intrinsicContentSize");
  v15 = v13;
  v16 = v14;
  if ((unint64_t)(self->__labelOrientation - 3) > 1)
  {
    rect = v12;
  }
  else
  {
    -[CAMTimerIndicatorView _landscapeSwapBoundsCoordinates:](self, "_landscapeSwapBoundsCoordinates:", v12, v11, v13, v14);
    rect = v17;
    v11 = v18;
    v15 = v19;
    v16 = v20;
  }
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  v21 = v10;
  v22 = v8;
  v23 = v6;
  v24 = v4;
  MaxX = CGRectGetMaxX(v29);
  v30.origin.x = rect;
  v30.origin.y = v11;
  v30.size.width = v15;
  v30.size.height = v16;
  v26 = MaxX - CGRectGetWidth(v30) + -9.0;
  v31.origin.x = v24;
  v31.origin.y = v23;
  v31.size.width = v22;
  v31.size.height = v21;
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = v26;
  v32.origin.y = v11;
  v32.size.width = v15;
  v32.size.height = v16;
  -[UILabel setFrame:](self->__countdownLabel, "setFrame:", v26, MaxY - CGRectGetHeight(v32) + -9.0, v15, v16);
}

- (CAMTimerIndicatorView)initWithCoder:(id)a3
{
  CAMTimerIndicatorView *v3;
  CAMTimerIndicatorView *v4;
  CAMTimerIndicatorView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTimerIndicatorView;
  v3 = -[CAMTimerIndicatorView initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMTimerIndicatorView _commonCAMTimerIndicatorViewInitialization](v3, "_commonCAMTimerIndicatorViewInitialization");
    v5 = v4;
  }

  return v4;
}

- (CGRect)_landscapeSwapBoundsCoordinates:(CGRect)a3
{
  CGFloat width;
  CGFloat x;
  double y;
  double v6;
  double height;
  double v8;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  v6 = x;
  height = a3.size.height;
  v8 = width;
  result.size.height = v8;
  result.size.width = height;
  result.origin.y = v6;
  result.origin.x = y;
  return result;
}

- (void)_layoutCountdownLabelForLargeStyle
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[CAMTimerIndicatorView bounds](self, "bounds");
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UILabel sizeThatFits:](self->__countdownLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  if ((unint64_t)(self->__labelOrientation - 3) <= 1)
    -[CAMTimerIndicatorView _landscapeSwapBoundsCoordinates:](self, "_landscapeSwapBoundsCoordinates:", v3, v4, v5, v6);
  UIRectCenteredIntegralRectScale();
  -[UILabel setFrame:](self->__countdownLabel, "setFrame:");
}

- (void)setStyle:(int64_t)a3
{
  -[CAMTimerIndicatorView setStyle:animated:](self, "setStyle:animated:", a3, 0);
}

- (id)font
{
  return -[UILabel font](self->__countdownLabel, "font");
}

- (void)setFont:(id)a3
{
  -[UILabel setFont:](self->__countdownLabel, "setFont:", a3);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  int64_t style;

  style = self->_style;
  if (style != a3)
  {
    self->_style = a3;
    -[CAMTimerIndicatorView _updateFromChangeToStyle:animated:](self, "_updateFromChangeToStyle:animated:", style, a4);
  }
}

- (void)_updateFromChangeToStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  UILabel *countdownLabel;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;
  _QWORD v36[7];
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  __int128 v58;
  _QWORD v59[4];
  __int128 v60;
  __int128 v61;

  v4 = a4;
  -[CAMTimerIndicatorView _fontForStyle:](self, "_fontForStyle:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimerIndicatorView _fontForStyle:](self, "_fontForStyle:", self->_style);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointSize");
  v10 = v9;
  objc_msgSend(v7, "pointSize");
  if (v10 <= v11)
    v12 = v7;
  else
    v12 = v8;
  v13 = v12;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x4010000000;
  v59[3] = "";
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v60 = *MEMORY[0x1E0C9D628];
  v61 = v14;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3010000000;
  v57[3] = "";
  v58 = *MEMORY[0x1E0C9D538];
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x5010000000;
  v53[3] = "";
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v54 = *MEMORY[0x1E0C9BAA8];
  v55 = v15;
  v56 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UILabel intrinsicContentSize](self->__countdownLabel, "intrinsicContentSize");
  v17 = v16;
  v19 = v18;
  -[UILabel setFont:](self->__countdownLabel, "setFont:", v8);
  -[UILabel intrinsicContentSize](self->__countdownLabel, "intrinsicContentSize");
  v21 = v20;
  v23 = v22;
  -[CAMTimerIndicatorView setNeedsLayout](self, "setNeedsLayout");
  if (v4)
  {
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    countdownLabel = self->__countdownLabel;
    if (countdownLabel)
      -[UILabel transform](countdownLabel, "transform");
    v25 = (void *)MEMORY[0x1E0DC3F10];
    v26 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v42 = v50;
    v37[1] = 3221225472;
    v37[2] = __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke;
    v37[3] = &unk_1EA32B4D8;
    v37[4] = self;
    v39 = v57;
    v40 = v59;
    v41 = v53;
    v43 = v51;
    v44 = v52;
    v45 = v17;
    v46 = v19;
    v47 = v21;
    v48 = v23;
    v49 = v13 != v8;
    v38 = v13;
    objc_msgSend(v25, "performWithoutAnimation:", v37);
    -[CAMTimerIndicatorView _setPerformingStyleAnimation:](self, "_setPerformingStyleAnimation:", 1);
    -[CAMTimerIndicatorView _transitionDimmingViewFromStyle:](self, "_transitionDimmingViewFromStyle:", a3);
    v27 = (void *)MEMORY[0x1E0DC3F10];
    v36[0] = v26;
    v36[1] = 3221225472;
    v36[2] = __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_2;
    v36[3] = &unk_1EA32B500;
    v36[4] = self;
    v36[5] = v53;
    v36[6] = v57;
    v29[0] = v26;
    v29[1] = 3221225472;
    v29[2] = __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_3;
    v29[3] = &unk_1EA32B528;
    v35 = v13 != v8;
    v29[4] = self;
    v28 = v8;
    v32 = v50;
    v33 = v51;
    v34 = v52;
    v30 = v28;
    v31 = v59;
    objc_msgSend(v27, "animateWithDuration:animations:completion:", v36, v29, 0.3);

  }
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

}

CGAffineTransform *__59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke(uint64_t a1)
{
  double v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  double v28;
  double v29;
  CGFloat v30;
  __int128 v31;
  CGAffineTransform *result;
  _OWORD *v33;
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  CGFloat v38;
  __int128 v39;
  void *v40;
  CGAffineTransform v41;
  CGAffineTransform v42;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "center");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "center");
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "bounds");
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v18 + 32) = v15;
  *(_QWORD *)(v18 + 40) = v17;
  v19 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v19[4] = v20;
  v19[5] = v21;
  v19[6] = v22;
  v19[7] = v23;
  v24 = *(_OWORD **)(*(_QWORD *)(a1 + 64) + 8);
  v25 = (_OWORD *)(a1 + 72);
  v26 = *(_OWORD *)(a1 + 72);
  v27 = *(_OWORD *)(a1 + 104);
  v24[3] = *(_OWORD *)(a1 + 88);
  v24[4] = v27;
  v24[2] = v26;
  if (*(_BYTE *)(a1 + 152))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setFont:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setCenter:", v3, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setBounds:", v7, v9, v11, v13);
    v28 = *(double *)(a1 + 144);
    v29 = *(double *)(a1 + 128);
    v30 = *(double *)(a1 + 136) / *(double *)(a1 + 120);
    v31 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&v41.a = *v25;
    *(_OWORD *)&v41.c = v31;
    *(_OWORD *)&v41.tx = *(_OWORD *)(a1 + 104);
    memset(&v42, 0, sizeof(v42));
    result = CGAffineTransformScale(&v42, &v41, v30, v28 / v29);
    v33 = *(_OWORD **)(*(_QWORD *)(a1 + 64) + 8);
    v35 = *(_OWORD *)&v42.c;
    v34 = *(_OWORD *)&v42.tx;
    v33[2] = *(_OWORD *)&v42.a;
    v33[3] = v35;
    v33[4] = v34;
  }
  else
  {
    v36 = *(double *)(a1 + 120);
    v37 = *(double *)(a1 + 136);
    v38 = *(double *)(a1 + 128) / *(double *)(a1 + 144);
    v39 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&v41.a = *v25;
    *(_OWORD *)&v41.c = v39;
    *(_OWORD *)&v41.tx = *(_OWORD *)(a1 + 104);
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformScale(&v42, &v41, v36 / v37, v38);
    v40 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
    v41 = v42;
    objc_msgSend(v40, "setTransform:", &v41);
    return (CGAffineTransform *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setCenter:", v3, v5);
  }
  return result;
}

uint64_t __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _OWORD *v4;
  __int128 v5;
  _OWORD v7[3];

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 440);
  v4 = *(_OWORD **)(v2 + 8);
  v5 = v4[3];
  v7[0] = v4[2];
  v7[1] = v5;
  v7[2] = v4[4];
  objc_msgSend(v3, "setTransform:", v7);
  return objc_msgSend(*(id *)(a1[4] + 440), "setCenter:", *(double *)(*(_QWORD *)(a1[6] + 8) + 32), *(double *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setFont:", *(_QWORD *)(a1 + 40));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
    v3 = *(_OWORD *)(a1 + 72);
    v5[0] = *(_OWORD *)(a1 + 56);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 88);
    objc_msgSend(v2, "setTransform:", v5);
    if (!CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setBounds:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  }
  objc_msgSend(*(id *)(a1 + 32), "_setPerformingStyleAnimation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_handleOrientationChange:", objc_msgSend(*(id *)(a1 + 32), "_deferredLabelOrientation"));
  objc_msgSend(*(id *)(a1 + 32), "_setDeferredOrientation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)startCountdownWithAnimationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->__animationDelegate, a3);
  -[CAMTimerIndicatorView _addDecrementAnimationForTick:](self, "_addDecrementAnimationForTick:", self->__remainingTicks);
  -[CAMTimerIndicatorView _addDimmingAnimationForTick:](self, "_addDimmingAnimationForTick:", self->__remainingTicks);
}

- (void)stopCountdown
{
  -[CAMTimerIndicatorView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
}

- (void)decrement
{
  --self->__remainingTicks;
  -[CAMTimerIndicatorView _updateCountdownLabelWithTicksRemaining](self, "_updateCountdownLabelWithTicksRemaining");
  -[CAMTimerIndicatorView _addDecrementAnimationForTick:](self, "_addDecrementAnimationForTick:", self->__remainingTicks);
  -[CAMTimerIndicatorView _addDimmingAnimationForTick:](self, "_addDimmingAnimationForTick:", self->__remainingTicks);
}

- (void)resetWithNumberOfTicks:(int64_t)a3
{
  CAMAnimationDelegate *animationDelegate;

  animationDelegate = self->__animationDelegate;
  self->__animationDelegate = 0;

  -[CAMTimerIndicatorView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  self->__startingTicks = a3;
  self->__remainingTicks = a3;
  -[CAMTimerIndicatorView _updateCountdownLabelWithTicksRemaining](self, "_updateCountdownLabelWithTicksRemaining");
  -[CAMTimerIndicatorView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_decrementAnimationForTick:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->__remainingTicks == 1)
  {
    objc_msgSend(v5, "setValues:", &unk_1EA3B33E0);
    objc_msgSend(v6, "setKeyTimes:", &unk_1EA3B33F8);
    objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  }
  else
  {
    objc_msgSend(v5, "setValues:", &unk_1EA3B33B0);
    objc_msgSend(v6, "setKeyTimes:", &unk_1EA3B33C8);
  }
  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "setDuration:", 1.0);
  objc_msgSend(v6, "setBeginTime:", CACurrentMediaTime() + (float)(self->__remainingTicks - a3));
  return v6;
}

- (void)_addDecrementAnimationForTick:(int64_t)a3
{
  void *v4;
  id v5;

  -[CAMTimerIndicatorView _decrementAnimationForTick:](self, "_decrementAnimationForTick:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self->__animationDelegate);
  -[UILabel layer](self->__countdownLabel, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("decrement"));

}

- (id)_finalDimmingAnimation
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", &unk_1EA3B18E0);
  objc_msgSend(v2, "setToValue:", &unk_1EA3B18B0);
  objc_msgSend(v2, "setDuration:", 0.35);
  objc_msgSend(v2, "setBeginTime:", CACurrentMediaTime() + 0.65);
  return v2;
}

- (void)_transitionDimmingViewFromStyle:(int64_t)a3
{
  _QWORD v3[5];

  if (a3 == 2)
  {
    if (!self->_style)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __57__CAMTimerIndicatorView__transitionDimmingViewFromStyle___block_invoke;
      v3[3] = &unk_1EA328868;
      v3[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v3, 0, 0.3, 0.0);
    }
  }
  else if (!a3 && self->_style == 2)
  {
    -[CAMTimerIndicatorView _addDimmingAnimationForTick:](self, "_addDimmingAnimationForTick:", self->__remainingTicks);
  }
}

uint64_t __57__CAMTimerIndicatorView__transitionDimmingViewFromStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

- (id)_dimmingAnimationForTick:(int64_t)a3
{
  float v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  int64_t startingTicks;
  int64_t remainingTicks;
  int64_t v11;
  double v12;
  float v13;
  float v14;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = 0.6 / (float)self->__startingTicks;
  -[UIView layer](self->__dimmingView, "layer", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "opacity");
  v8 = v7;

  startingTicks = self->__startingTicks;
  remainingTicks = self->__remainingTicks;
  if (remainingTicks <= 1)
    v11 = 1;
  else
    v11 = self->__remainingTicks;
  if (remainingTicks == 1)
    v12 = 0.65;
  else
    v12 = 1.0;
  v13 = v4 * (float)((startingTicks - remainingTicks) & ~((startingTicks - remainingTicks) >> 63));
  v14 = v4 * (float)(startingTicks - v11 + 1);
  if (startingTicks == remainingTicks || (float)(v8 - v13) == 0.00000011921)
    v8 = v13;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  *(float *)&v20 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValues:", v22);

  objc_msgSend(v17, "setKeyTimes:", &unk_1EA3B3410);
  objc_msgSend(v17, "setDuration:", v12);
  objc_msgSend(v17, "setBeginTime:", CACurrentMediaTime());
  if (remainingTicks != 1)
  {
    objc_msgSend(v17, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  }
  return v17;
}

- (void)_addDimmingAnimationForTick:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_style)
  {
    -[CAMTimerIndicatorView _dimmingAnimationForTick:](self, "_dimmingAnimationForTick:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->__dimmingView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAnimation:forKey:", v7, CFSTR("dimming"));

    if (self->__remainingTicks == 1)
    {
      -[CAMTimerIndicatorView _finalDimmingAnimation](self, "_finalDimmingAnimation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self->__dimmingView, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAnimation:forKey:", v5, CFSTR("finalDimming"));

    }
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (-[CAMTimerIndicatorView _isPerformingStyleAnimation](self, "_isPerformingStyleAnimation", a3, a4))
    -[CAMTimerIndicatorView _setDeferredOrientation:](self, "_setDeferredOrientation:", a3);
  else
    -[CAMTimerIndicatorView _handleOrientationChange:](self, "_handleOrientationChange:", a3);
}

- (int64_t)style
{
  return self->_style;
}

- (UIView)_dimmingView
{
  return self->__dimmingView;
}

- (UILabel)_countdownLabel
{
  return self->__countdownLabel;
}

- (int64_t)_startingTicks
{
  return self->__startingTicks;
}

- (int64_t)_remainingTicks
{
  return self->__remainingTicks;
}

- (int64_t)_labelOrientation
{
  return self->__labelOrientation;
}

- (CAMAnimationDelegate)_animationDelegate
{
  return self->__animationDelegate;
}

- (void)_setPerformingStyleAnimation:(BOOL)a3
{
  self->__performingStyleAnimation = a3;
}

- (int64_t)_deferredLabelOrientation
{
  return self->__deferredLabelOrientation;
}

- (void)_setDeferredOrientation:(int64_t)a3
{
  self->__deferredLabelOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animationDelegate, 0);
  objc_storeStrong((id *)&self->__countdownLabel, 0);
  objc_storeStrong((id *)&self->__dimmingView, 0);
}

@end
