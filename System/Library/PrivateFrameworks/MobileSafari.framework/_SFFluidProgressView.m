@implementation _SFFluidProgressView

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[9];

  -[_SFFluidProgressView bounds](self, "bounds");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___SFFluidProgressView_layoutSubviews__block_invoke;
  v7[3] = &unk_1E21E2AC0;
  v7[4] = self;
  v7[5] = v3;
  v7[6] = v4;
  v7[7] = v5;
  v7[8] = v6;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
}

- (CGRect)_progressBarBoundsForValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[UIView bounds](self->_clippingView, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v10 = -a3;
  if (v9)
    v10 = 0.0;
  v11 = v6;
  v12 = a3;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (double)defaultHeight
{
  if (defaultHeight_onceToken != -1)
    dispatch_once(&defaultHeight_onceToken, &__block_literal_global_46);
  return *(double *)&defaultHeight_height;
}

- (_SFFluidProgressView)initWithFrame:(CGRect)a3
{
  _SFFluidProgressView *v3;
  _SFFluidProgressView *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  UIColor *progressBarFillColor;
  UIView *v9;
  UIView *progressBar;
  double v11;
  double v12;
  void *v13;
  UIView *v14;
  UIView *clippingView;
  void *v16;
  _SFFluidProgressView *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_SFFluidProgressView;
  v3 = -[_SFFluidProgressView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SFFluidProgressView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFFluidProgressView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[_SFFluidProgressView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v6 = -[UIView _sf_usesLeftToRightLayout](v4, "_sf_usesLeftToRightLayout");
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v7 = objc_claimAutoreleasedReturnValue();
    progressBarFillColor = v4->_progressBarFillColor;
    v4->_progressBarFillColor = (UIColor *)v7;

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    progressBar = v4->_progressBar;
    v4->_progressBar = v9;

    if (v6)
      v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    else
      v11 = 0.0;
    if (v6)
      v12 = *MEMORY[0x1E0C9D538];
    else
      v12 = 1.0;
    -[UIView layer](v4->_progressBar, "layer", *MEMORY[0x1E0C9D538]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAnchorPoint:", v12, v11);

    -[UIView setBackgroundColor:](v4->_progressBar, "setBackgroundColor:", v4->_progressBarFillColor);
    -[UIView setAccessibilityIdentifier:](v4->_progressBar, "setAccessibilityIdentifier:", CFSTR("FluidProgressView"));
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    clippingView = v4->_clippingView;
    v4->_clippingView = v14;

    -[UIView setClipsToBounds:](v4->_clippingView, "setClipsToBounds:", 1);
    -[UIView layer](v4->_clippingView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPoint:", v12, v11);

    -[UIView addSubview:](v4->_clippingView, "addSubview:", v4->_progressBar);
    -[_SFFluidProgressView addSubview:](v4, "addSubview:", v4->_clippingView);
    v17 = v4;
  }

  return v4;
}

- (void)setAlignsToTop:(BOOL)a3
{
  self->_alignsToTop = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setProgressBarFillColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_progressBarFillColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_progressBarFillColor, a3);
    -[UIView setBackgroundColor:](self->_progressBar, "setBackgroundColor:", self->_progressBarFillColor);
    v5 = v6;
  }

}

- (void)setProgressToCurrentPositionForState:(id)a3
{
  WBSFluidProgressState **p_state;
  id v5;
  uint64_t v6;
  id WeakRetained;

  p_state = &self->_state;
  v5 = a3;
  objc_storeWeak((id *)p_state, v5);
  objc_msgSend(v5, "fluidProgressValue");
  -[_SFFluidProgressView _progressBarBoundsForValue:](self, "_progressBarBoundsForValue:");
  -[UIView setBounds:](self->_clippingView, "setBounds:");
  v6 = objc_msgSend(v5, "fluidProgressAnimationPhase");

  if (v6 != 5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "fluidProgressViewWillShowProgress:", self);

  }
}

- (BOOL)isShowingProgress
{
  return !-[UIView isHidden](self->_clippingView, "isHidden");
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_SFFluidProgressView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }
}

- (void)setAlignToTop:(BOOL)a3
{
  if (self->_alignsToTop != a3)
  {
    self->_alignsToTop = a3;
    -[_SFFluidProgressView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setProgressAnimationSuppressed:(BOOL)a3 duringFluidProgressState:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  v9 = v8;
  if (self->_progressAnimationSuppressed != v6)
  {
    self->_progressAnimationSuppressed = v6;
    if (v8)
    {
      if (objc_msgSend(v8, "fluidProgressAnimationPhase") != 5)
      {
        if (v5)
        {
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __89___SFFluidProgressView_setProgressAnimationSuppressed_duringFluidProgressState_animated___block_invoke;
          v10[3] = &unk_1E21E2B38;
          v10[4] = self;
          v11 = v6;
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331652, v10, 0, 0.4, 0.0);
        }
        else
        {
          -[UIView setAlpha:](self->_clippingView, "setAlpha:", (double)!v6);
        }
      }
    }
  }

}

- (void)_finishProgressBarWithDuration:(double)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke;
  v4[3] = &unk_1E21E2050;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke_2;
  v3[3] = &unk_1E21E2190;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331652, v4, v3, a3, 0.0);
}

- (void)fluidProgressController:(id)a3 startFluidProgressBar:(id)a4 animateFillFade:(BOOL)a5
{
  _BOOL4 v5;
  id WeakRetained;
  UIView *clippingView;
  double v9;
  _QWORD v10[5];

  v5 = a5;
  objc_storeWeak((id *)&self->_state, a4);
  -[UIView setHidden:](self->_clippingView, "setHidden:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fluidProgressViewWillShowProgress:", self);

  clippingView = self->_clippingView;
  -[_SFFluidProgressView _progressBarBoundsForValue:](self, "_progressBarBoundsForValue:", 0.0);
  -[UIView setBounds:](clippingView, "setBounds:");
  v9 = 0.25;
  if (!v5)
    v9 = 0.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86___SFFluidProgressView_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke;
  v10[3] = &unk_1E21E2050;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331652, v10, 0, v9, 0.0);
}

- (void)_animateUsingDefaultTiming:(BOOL)a3 stepAnimationTime:(double)a4 options:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, a6, a7, a4);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", a5 | 0x3000000, a6, a7, a4, 0.0);
}

- (void)fluidProgressController:(id)a3 updateFluidProgressBar:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);
  double v18;
  _QWORD v19[5];
  id v20;
  BOOL v21;

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = objc_msgSend(v7, "fluidProgressAnimationPhase");
  if (self->_progressAnimationSuppressed)
  {
    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    v10 = v9 == 4;
    objc_msgSend(v7, "nextFluidProgressAnimation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isFluidProgressStalled"))
      v12 = 0;
    else
      v12 = 196608;
    -[_SFFluidProgressView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0.0;
    v19[0] = MEMORY[0x1E0C809B0];
    if (!v13)
      v14 = 0.25;
    v19[1] = 3221225472;
    v19[2] = __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke;
    v19[3] = &unk_1E21E22A8;
    v19[4] = self;
    v20 = v11;
    v21 = v10;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_2;
    v16[3] = &unk_1E21E60C0;
    v18 = v14;
    v17 = v8;
    v15 = v11;
    -[_SFFluidProgressView _animateUsingDefaultTiming:stepAnimationTime:options:animations:completion:](self, "_animateUsingDefaultTiming:stepAnimationTime:options:animations:completion:", v10, v12, v19, v16, 0.25);

  }
}

- (void)fluidProgressControllerFinishProgressBar:(id)a3 animateFillFade:(BOOL)a4
{
  _BOOL4 v4;
  double v6;

  v4 = a4;
  objc_storeWeak((id *)&self->_state, 0);
  v6 = 0.4;
  if (!v4)
    v6 = 0.0;
  -[_SFFluidProgressView _finishProgressBarWithDuration:](self, "_finishProgressBarWithDuration:", v6);
}

- (void)fluidProgressController:(id)a3 setProgressToCurrentPosition:(id)a4
{
  UIView *clippingView;

  clippingView = self->_clippingView;
  objc_msgSend(a4, "fluidProgressValue", a3);
  -[_SFFluidProgressView _progressBarBoundsForValue:](self, "_progressBarBoundsForValue:");
  -[UIView setBounds:](clippingView, "setBounds:");
}

- (void)fluidProgressController:(id)a3 suppressProgressAnimation:(BOOL)a4 duringFluidProgressState:(id)a5 animated:(BOOL)a6
{
  -[_SFFluidProgressView setProgressAnimationSuppressed:duringFluidProgressState:animated:](self, "setProgressAnimationSuppressed:duringFluidProgressState:animated:", a4, a5, a6);
}

- (BOOL)progressAnimationSuppressed
{
  return self->_progressAnimationSuppressed;
}

- (void)setProgressAnimationSuppressed:(BOOL)a3
{
  self->_progressAnimationSuppressed = a3;
}

- (_SFFluidProgressViewDelegate)delegate
{
  return (_SFFluidProgressViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIColor)progressBarFillColor
{
  return self->_progressBarFillColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)alignsToTop
{
  return self->_alignsToTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarFillColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_state);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
}

@end
