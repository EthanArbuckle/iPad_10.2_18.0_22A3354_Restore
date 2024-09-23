@implementation CAMStageLightOverlayView

- (CAMStageLightOverlayView)initWithFrame:(CGRect)a3
{
  CAMStageLightOverlayView *v3;
  CAMStageLightOverlayView *v4;
  id v5;
  uint64_t v6;
  UIView *tintView;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIImageView *vignetteView;
  CAGradientLayer *v15;
  CAGradientLayer *gradientLayer;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CAGradientLayer *v25;
  void *v26;
  uint64_t v27;
  CAShapeLayer *circleLayer;
  void *v29;
  CAMStageLightOverlayView *v30;
  objc_super v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)CAMStageLightOverlayView;
  v3 = -[CAMStageLightOverlayView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_visible = 1;
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    tintView = v4->__tintView;
    v4->__tintView = (UIView *)v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->__tintView, "setBackgroundColor:", v8);

    -[CAMStageLightOverlayView addSubview:](v4, "addSubview:", v4->__tintView);
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    v10 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("CAMStageLightOverlayVignette"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "initWithImage:", v12);
    vignetteView = v4->__vignetteView;
    v4->__vignetteView = (UIImageView *)v13;

    -[CAMStageLightOverlayView addSubview:](v4, "addSubview:", v4->__vignetteView);
    v15 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    gradientLayer = v4->__gradientLayer;
    v4->__gradientLayer = v15;

    -[CAGradientLayer setType:](v4->__gradientLayer, "setType:", *MEMORY[0x1E0CD2F58]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35[0] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35[1] = objc_msgSend(v18, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35[2] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v4->__gradientLayer, "setColors:", v20);

    v33[0] = CFSTR("locations");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v21;
    v33[1] = CFSTR("startPoint");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v22;
    v33[2] = CFSTR("endPoint");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setActions:](v4->__gradientLayer, "setActions:", v24);

    v25 = v4->__gradientLayer;
    -[CAMStageLightOverlayView layer](v4, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMask:", v25);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v27 = objc_claimAutoreleasedReturnValue();
    circleLayer = v4->__circleLayer;
    v4->__circleLayer = (CAShapeLayer *)v27;

    -[CAMStageLightOverlayView layer](v4, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSublayer:", v4->__circleLayer);

    -[CAMStageLightOverlayView _updateShadowViewsAnimated:](v4, "_updateShadowViewsAnimated:", 0);
    v30 = v4;
  }

  return v4;
}

- (void)setVisible:(BOOL)a3
{
  -[CAMStageLightOverlayView setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  double v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_visible != a3)
  {
    self->_visible = a3;
    v5 = 0.4;
    if (!a3)
      v5 = 0.25;
    if (!a4)
      v5 = 0.0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__CAMStageLightOverlayView_setVisible_animated___block_invoke;
    v6[3] = &unk_1EA328908;
    v6[4] = self;
    v7 = a3;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v6, v5);
    -[CAMStageLightOverlayView _updateAnimatorState](self, "_updateAnimatorState");
  }
}

uint64_t __48__CAMStageLightOverlayView_setVisible_animated___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

- (void)setActive:(BOOL)a3
{
  -[CAMStageLightOverlayView setActive:animated:](self, "setActive:animated:", a3, 0);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[CAMStageLightOverlayView _updateShadowViewsAnimated:](self, "_updateShadowViewsAnimated:", a4);
    -[CAMStageLightOverlayView _updateAnimatorState](self, "_updateAnimatorState");
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMStageLightOverlayView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMStageLightOverlayView _circleFrameForOrientation:](self, "_circleFrameForOrientation:", -[CAMStageLightOverlayView orientation](self, "orientation"));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CAMStageLightOverlayView _animator](self, "_animator");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCircleBaseFrame:animated:", v4, v7, v9, v11, v13);

  }
}

- (void)setBottomContentInset:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  if (self->_bottomContentInset != a3)
  {
    self->_bottomContentInset = a3;
    -[CAMStageLightOverlayView _circleFrameForOrientation:](self, "_circleFrameForOrientation:", -[CAMStageLightOverlayView orientation](self, "orientation"));
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CAMStageLightOverlayView _animator](self, "_animator");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCircleBaseFrame:animated:", 1, v5, v7, v9, v11);

  }
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_viewportFrame;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(a3, self->_viewportFrame))
  {
    p_viewportFrame->origin.x = x;
    p_viewportFrame->origin.y = y;
    p_viewportFrame->size.width = width;
    p_viewportFrame->size.height = height;
    -[CAMStageLightOverlayView _animator](self, "_animator");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMStageLightOverlayView _circleFrameForOrientation:](self, "_circleFrameForOrientation:", -[CAMStageLightOverlayView orientation](self, "orientation"));
    objc_msgSend(v9, "setCircleBaseFrame:animated:", 1);

  }
}

- (void)_updateShadowViewsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v5 = -[CAMStageLightOverlayView isActive](self, "isActive");
  v6 = 0.3;
  if (!v3)
    v6 = 0.0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __55__CAMStageLightOverlayView__updateShadowViewsAnimated___block_invoke;
  v8[3] = &unk_1EA328908;
  v8[1] = 3221225472;
  if (v5)
    v7 = 0x20000;
  else
    v7 = 0x10000;
  v8[4] = self;
  v9 = v5;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", v7, v8, 0, v6);
}

void __55__CAMStageLightOverlayView__updateShadowViewsAnimated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
    v2 = 0.75;
  else
    v2 = 0.6;
  objc_msgSend(*(id *)(a1 + 32), "_tintView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_vignetteView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)_updateAnimatorState
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = -[CAMStageLightOverlayView isVisible](self, "isVisible");
  v4 = -[CAMStageLightOverlayView isActive](self, "isActive");
  v5 = 1;
  if (v4)
    v5 = 2;
  if (v3)
    v6 = v5;
  else
    v6 = 0;
  -[CAMStageLightOverlayView _animator](self, "_animator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setState:", v6);

}

+ (BOOL)_useLargeLayoutForViewportSize:(CGSize)a3
{
  return a3.height >= 834.0 && a3.width >= 834.0;
}

+ (double)_circleDiameterForViewportSize:(CGSize)a3 orientation:(int64_t)a4 screenScale:(double)a5
{
  double result;

  objc_msgSend(a1, "_useLargeLayoutForViewportSize:");
  UIRoundToScale();
  return result;
}

+ (CGRect)circleFrameForViewport:(CGRect)a3 orientation:(int64_t)a4 bottomContentInset:(double)a5 screenScale:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "_useLargeLayoutForViewportSize:", a3.size.width, a3.size.height);
  UIRectGetCenter();
  objc_msgSend((id)objc_opt_class(), "_circleDiameterForViewportSize:orientation:screenScale:", a4, width, height, a6);
  v17.origin.x = x + 0.0;
  v17.origin.y = y + 0.0;
  v17.size.height = height - (a5 + 0.0);
  v17.size.width = width;
  CGRectGetMaxY(v17);
  UIRectCenteredAboutPointScale();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_circleFrameForOrientation:(int64_t)a3
{
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
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect result;

  -[CAMStageLightOverlayView viewportFrame](self, "viewportFrame");
  if (CGRectEqualToRect(v23, *MEMORY[0x1E0C9D648]))
    -[CAMStageLightOverlayView bounds](self, "bounds");
  else
    -[CAMStageLightOverlayView viewportFrame](self, "viewportFrame");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  -[CAMStageLightOverlayView window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  v17 = (void *)objc_opt_class();
  -[CAMStageLightOverlayView bottomContentInset](self, "bottomContentInset");
  objc_msgSend(v17, "circleFrameForViewport:orientation:bottomContentInset:screenScale:", a3, v9, v10, v11, v12, v18, v16);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
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
  void *v11;
  void *v12;
  void *v13;
  CAMStageLightAnimator *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CAMStageLightAnimator *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CAMStageLightOverlayView;
  -[CAMStageLightOverlayView layoutSubviews](&v25, sel_layoutSubviews);
  -[CAMStageLightOverlayView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMStageLightOverlayView _tintView](self, "_tintView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStageLightOverlayView _vignetteView](self, "_vignetteView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
  -[CAMStageLightOverlayView _gradientLayer](self, "_gradientLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v13, "setPosition:");
  -[CAMStageLightOverlayView _animator](self, "_animator");
  v14 = (CAMStageLightAnimator *)objc_claimAutoreleasedReturnValue();
  -[CAMStageLightOverlayView _circleFrameForOrientation:](self, "_circleFrameForOrientation:", -[CAMStageLightOverlayView orientation](self, "orientation"));
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  if (v14)
  {
    -[CAMStageLightAnimator setCircleBaseFrame:](v14, "setCircleBaseFrame:", v15, v16, v17, v18);
  }
  else
  {
    v23 = [CAMStageLightAnimator alloc];
    -[CAMStageLightOverlayView _circleLayer](self, "_circleLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CAMStageLightAnimator initWithGradientLayer:circleLayer:](v23, "initWithGradientLayer:circleLayer:", v13, v24);

    -[CAMStageLightAnimator setCircleBaseFrame:](v14, "setCircleBaseFrame:", v19, v20, v21, v22);
    -[CAMStageLightOverlayView _setAnimator:](self, "_setAnimator:", v14);
    -[CAMStageLightOverlayView _updateAnimatorState](self, "_updateAnimatorState");
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewportFrame.origin.x;
  y = self->_viewportFrame.origin.y;
  width = self->_viewportFrame.size.width;
  height = self->_viewportFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (UIView)_tintView
{
  return self->__tintView;
}

- (UIImageView)_vignetteView
{
  return self->__vignetteView;
}

- (CAShapeLayer)_circleLayer
{
  return self->__circleLayer;
}

- (unint64_t)_activeTimerID
{
  return self->__activeTimerID;
}

- (void)_setActiveTimerID:(unint64_t)a3
{
  self->__activeTimerID = a3;
}

- (CAGradientLayer)_gradientLayer
{
  return self->__gradientLayer;
}

- (CAMStageLightAnimator)_animator
{
  return self->__animator;
}

- (void)_setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->__animator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__gradientLayer, 0);
  objc_storeStrong((id *)&self->__circleLayer, 0);
  objc_storeStrong((id *)&self->__vignetteView, 0);
  objc_storeStrong((id *)&self->__tintView, 0);
}

@end
