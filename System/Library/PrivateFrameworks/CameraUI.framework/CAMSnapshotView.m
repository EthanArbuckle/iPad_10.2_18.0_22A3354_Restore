@implementation CAMSnapshotView

- (CAMSnapshotView)initWithView:(id)a3 desiredAspectRatio:(int64_t)a4
{
  id v6;
  void *v7;
  CAMSnapshotView *v8;
  CAMSnapshotView *v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIView *snapshotView;
  UIView *v29;
  CAMSnapshotView *v30;
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v36.receiver = self;
  v36.super_class = (Class)CAMSnapshotView;
  v8 = -[CAMSnapshotView initWithFrame:](&v36, sel_initWithFrame_);
  v9 = v8;
  if (v8)
  {
    v8->_desiredAspectRatio = a4;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->__supportsBlur = objc_msgSend(v10, "_graphicsQuality") == 100;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSnapshotView setBackgroundColor:](v9, "setBackgroundColor:", v11);

    -[CAMSnapshotView setOpaque:](v9, "setOpaque:", 1);
    -[CAMSnapshotView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "center");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v6, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    if (v6)
      objc_msgSend(v6, "transform");
    -[CAMSnapshotView layer](v9, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupOpacity:", 0);

    -[CAMSnapshotView layer](v9, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShouldRasterize:", 1);

    -[CAMSnapshotView layer](v9, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPreloadsCache:", 1);

    objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
    v27 = objc_claimAutoreleasedReturnValue();
    snapshotView = v9->_snapshotView;
    v9->_snapshotView = (UIView *)v27;

    -[UIView setClipsToBounds:](v9->_snapshotView, "setClipsToBounds:", 1);
    -[UIView setCenter:](v9->_snapshotView, "setCenter:", v13, v15);
    -[UIView setBounds:](v9->_snapshotView, "setBounds:", v17, v19, v21, v23);
    v29 = v9->_snapshotView;
    v32[0] = v33;
    v32[1] = v34;
    v32[2] = v35;
    -[UIView setTransform:](v29, "setTransform:", v32);
    -[CAMSnapshotView addSubview:](v9, "addSubview:", v9->_snapshotView);
    v30 = v9;
  }

  return v9;
}

- (void)setBlurred:(BOOL)a3 animated:(BOOL)a4 style:(int64_t)a5 withCompletionBlock:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v10;
  id v11;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  if (a5 == 2 || self->_blurred != v8)
  {
    v11 = v10;
    self->_blurred = v8;
    -[CAMSnapshotView _setBlurStyleForEffectAnimationFactory:](self, "_setBlurStyleForEffectAnimationFactory:", a5);
    if (self->__supportsBlur)
    {
      if (v8)
        -[CAMSnapshotView _applySnapshotBlurForStyle:animated:withCompletionBlock:](self, "_applySnapshotBlurForStyle:animated:withCompletionBlock:", a5, v7, v11);
      else
        -[CAMSnapshotView _removeSnapshotBlurForStyle:animated:withCompletionBlock:](self, "_removeSnapshotBlurForStyle:animated:withCompletionBlock:", a5, v7, v11);
    }
    else if (v8)
    {
      -[CAMSnapshotView _applyLowQualityBlurForStyle:animated:withCompletionBlock:](self, "_applyLowQualityBlurForStyle:animated:withCompletionBlock:", a5, v7, v11);
    }
    else
    {
      -[CAMSnapshotView _removeLowQualityBlurForStyle:animated:withCompletionBlock:](self, "_removeLowQualityBlurForStyle:animated:withCompletionBlock:", a5, v7, v11);
    }
    goto LABEL_12;
  }
  if (v10)
  {
    v11 = v10;
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
LABEL_12:
    v10 = v11;
  }

}

- (void)_setBlurStyleForEffectAnimationFactory:(int64_t)a3
{
  self->__blurStyleForEffectAnimationFactory = a3;
}

- (void)_applySnapshotBlurForStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;

  v5 = a4;
  v8 = a5;
  -[CAMSnapshotView setAlpha:](self, "setAlpha:", 1.0);
  -[UIView bounds](self->_snapshotView, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
  objc_msgSend(v17, "setClipsToBounds:", 1);
  UIRectGetCenter();
  objc_msgSend(v17, "setCenter:");
  objc_msgSend(v17, "setBounds:", v10, v12, v14, v16);
  objc_msgSend(v17, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_snapshotView, "addSubview:", v17);
  -[CAMSnapshotView _setBlurView:](self, "_setBlurView:", v17);
  v38 = 0;
  v39 = 0;
  v36 = 0.0;
  v37 = 0.0;
  v34 = 0;
  v35 = 0;
  v32 = 0;
  v33 = 0;
  -[CAMSnapshotView _prepareForApplyingBlurForStyle:applying:inputRadiusAmount:inputRadiusDuration:inputRadiusDelay:inputRadiusTimingFunction:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:](self, "_prepareForApplyingBlurForStyle:applying:inputRadiusAmount:inputRadiusDuration:inputRadiusDelay:inputRadiusTimingFunction:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:", a3, 1, &v39, &v37, &v36, &v33, &v38, &v35, &v34, &v32);
  v18 = v33;
  v19 = v32;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 25.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v23 = v36;
    v22 = v37;
    v24 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __75__CAMSnapshotView__applySnapshotBlurForStyle_animated_withCompletionBlock___block_invoke;
    v29[3] = &unk_1EA328A40;
    v30 = v17;
    v31 = v20;
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __75__CAMSnapshotView__applySnapshotBlurForStyle_animated_withCompletionBlock___block_invoke_2;
    v27[3] = &unk_1EA32A6A8;
    v28 = v8;
    objc_msgSend(v21, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v29, v27, v22, v23);

  }
  else
  {
    objc_msgSend(v17, "setEffect:", v20);
  }
  -[CAMSnapshotView layer](self, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 1.0;
  objc_msgSend(v25, "setOpacity:", v26);

  if (v8 && (!v5 || !self->__blurView))
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);

}

- (void)_setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->__blurView, a3);
}

uint64_t __75__CAMSnapshotView__applySnapshotBlurForStyle_animated_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEffect:", *(_QWORD *)(a1 + 40));
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;

  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")))
    return 0;
  v16 = 0;
  v17 = 0.0;
  v15 = 0.0;
  v13 = 0;
  v14 = 0.0;
  v12 = 0;
  v10 = 0;
  v11 = 0;
  -[CAMSnapshotView _prepareForApplyingBlurForStyle:applying:inputRadiusAmount:inputRadiusDuration:inputRadiusDelay:inputRadiusTimingFunction:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:](self, "_prepareForApplyingBlurForStyle:applying:inputRadiusAmount:inputRadiusDuration:inputRadiusDelay:inputRadiusTimingFunction:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:", -[CAMSnapshotView _blurStyleForEffectAnimationFactory](self, "_blurStyleForEffectAnimationFactory"), 1, &v17, &v15, &v14, &v11, &v16, &v13, &v12, &v10);
  v5 = v11;
  v6 = v10;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v8);

  objc_msgSend(v7, "setBeginTime:", v14);
  objc_msgSend(v7, "setDuration:", v15);
  objc_msgSend(v7, "setTimingFunction:", v5);

  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  return v7;
}

- (void)removeInflightBlurAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CAMSnapshotView _blurView](self, "_blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSnapshotView removeAllAnimationsOnLayer:recursively:shouldLog:](self, "removeAllAnimationsOnLayer:recursively:shouldLog:", v4, 1, 1);

  -[CAMSnapshotView _lowQualityBlurView](self, "_lowQualityBlurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSnapshotView _removeAnimationOnView:forKey:](self, "_removeAnimationOnView:forKey:", v5, CFSTR("inputRadiusAnimation"));

  -[CAMSnapshotView _dimmingView](self, "_dimmingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSnapshotView _removeAnimationOnView:forKey:](self, "_removeAnimationOnView:forKey:", v6, CFSTR("opacityAnimation"));

  -[CAMSnapshotView _removeAnimationOnView:forKey:](self, "_removeAnimationOnView:forKey:", self, CFSTR("containerOpacityAnimation"));
}

- (UIVisualEffectView)_blurView
{
  return self->__blurView;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)_removeAnimationOnView:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Removing animation for key %{public}@ from view %{public}@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(v7, "removeAnimationForKey:", v6);
  }

}

- (UIView)_lowQualityBlurView
{
  return self->__lowQualityBlurView;
}

- (UIView)_dimmingView
{
  return self->__dimmingView;
}

- (void)prepareForResumingUsingCrossfade
{
  void *v3;
  UIView *snapshotView;
  id v5;

  -[CAMSnapshotView snapshotView](self, "snapshotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  snapshotView = self->_snapshotView;
  self->_snapshotView = 0;

  -[CAMSnapshotView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldRasterize:", 0);

}

- (int64_t)desiredAspectRatio
{
  return self->_desiredAspectRatio;
}

- (void)setBlurred:(BOOL)a3
{
  -[CAMSnapshotView setBlurred:animated:style:withCompletionBlock:](self, "setBlurred:animated:style:withCompletionBlock:", a3, 0, 0, 0);
}

- (void)setDimmed:(BOOL)a3
{
  -[CAMSnapshotView setDimmed:animated:withCompletionBlock:](self, "setDimmed:animated:withCompletionBlock:", a3, 0, 0);
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (self->_dimmed != v6)
  {
    self->_dimmed = v6;
    v10 = v8;
    if (v6)
      -[CAMSnapshotView _applySnapshotDimAnimated:withCompletionBlock:](self, "_applySnapshotDimAnimated:withCompletionBlock:", v5, v8);
    else
      -[CAMSnapshotView _removeSnapshotDimAnimated:withCompletionBlock:](self, "_removeSnapshotDimAnimated:withCompletionBlock:", v5, v8);
    v9 = v10;
  }

}

- (void)fadeOutAnimatedWithStyle:(int64_t)a3 completion:(id)a4
{
  -[CAMSnapshotView _removeSnapshotBlurForStyle:animated:withCompletionBlock:](self, "_removeSnapshotBlurForStyle:animated:withCompletionBlock:", a3, 1, a4);
}

- (void)_prepareForApplyingBlurForStyle:(int64_t)a3 applying:(BOOL)a4 inputRadiusAmount:(double *)a5 inputRadiusDuration:(double *)a6 inputRadiusDelay:(double *)a7 inputRadiusTimingFunction:(id *)a8 opacityAmount:(double *)a9 opacityDuration:(double *)a10 opacityDelay:(double *)a11 opacityTimingFunction:(id *)a12
{
  double v12;
  _BOOL4 v17;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;

  v17 = a4;
  v20 = 1.0;
  if (!a4)
  {
    UIAnimationDragCoefficient();
    v20 = v21;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v28 = 50.0;
      if (!v17)
        v28 = 0.0;
      *a5 = v28;
      v29 = 0.3801;
      if (v17)
        v29 = 0.5;
      *a6 = v29 * v20;
      if (v17)
        v30 = 1.0;
      else
        v30 = 0.0;
      -[UIView layer](self->_snapshotView, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      *a7 = v32 + v20 * 0.0667;

      LODWORD(v33) = 1036831949;
      LODWORD(v34) = 0.25;
      LODWORD(v35) = 0.25;
      LODWORD(v36) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v34, v33, v35, v36);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      *a9 = v30;
      *a10 = v20 * 0.2862;
      -[CAMSnapshotView layer](self, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      *a11 = v38 + v20 * 0.0939;

      goto LABEL_25;
    }
    if (a3)
      return;
  }
  v22 = 25.0;
  if (!v17)
    v22 = 0.0;
  *a5 = v22;
  v23 = 0.3331;
  HIDWORD(v24) = 1071359459;
  if (v17)
    v23 = 0.432;
  *a6 = v23 * v20;
  *a7 = 0.0;
  v25 = 1.0;
  if (v17)
    v26 = 1.0;
  else
    v26 = 0.0;
  LODWORD(v25) = 991345561;
  LODWORD(v24) = 1057634019;
  LODWORD(v12) = 1064732459;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", COERCE_DOUBLE(1044401829), v25, v24, v12);
  *a8 = (id)objc_claimAutoreleasedReturnValue();
  *a9 = v26;
  v27 = 0.3;
  if (a3 == 2 && !v17)
    -[CAMSnapshotView _resumeFadeInDuration](self, "_resumeFadeInDuration", 0.3);
  *a10 = v20 * v27;
  *a11 = 0.0;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  *a12 = (id)objc_claimAutoreleasedReturnValue();
}

- (double)_resumeFadeInDuration
{
  double Current;
  void *v3;
  double v4;
  double v5;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_launchTime");
  v5 = Current - v4;

  if (v5 > 0.517)
    return 0.267;
  if (v5 >= 0.083)
    return (v5 + -0.083) * 0.193548387 + 0.183;
  return 0.183;
}

uint64_t __75__CAMSnapshotView__applySnapshotBlurForStyle_animated_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeSnapshotBlurForStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CAMAnimationDelegate *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  id v24;
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;

  v5 = a4;
  v8 = a5;
  v30 = 0.0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  v26 = 0.0;
  v27 = 0.0;
  v24 = 0;
  v25 = 0;
  -[CAMSnapshotView _prepareForApplyingBlurForStyle:applying:inputRadiusAmount:inputRadiusDuration:inputRadiusDelay:inputRadiusTimingFunction:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:](self, "_prepareForApplyingBlurForStyle:applying:inputRadiusAmount:inputRadiusDuration:inputRadiusDelay:inputRadiusTimingFunction:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:", a3, 0, &v31, &v29, &v28, &v25, &v30, &v27, &v26, &v24);
  v9 = v25;
  v10 = v24;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSnapshotView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("opacity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", v14);

    objc_msgSend(v11, "setDuration:", v27);
    objc_msgSend(v11, "setBeginTime:", v26);
    objc_msgSend(v11, "setTimingFunction:", v10);
    objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    v15 = objc_alloc_init(CAMAnimationDelegate);
    -[CAMSnapshotView _blurView](self, "_blurView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v16);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__CAMSnapshotView__removeSnapshotBlurForStyle_animated_withCompletionBlock___block_invoke;
    v20[3] = &unk_1EA32CD90;
    objc_copyWeak(&v22, &location);
    v21 = v8;
    -[CAMAnimationDelegate setCompletion:](v15, "setCompletion:", v20);
    objc_msgSend(v11, "setDelegate:", v15);
    -[CAMSnapshotView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAnimation:forKey:", v11, CFSTR("containerOpacityAnimation"));

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  -[CAMSnapshotView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 0;
  objc_msgSend(v18, "setOpacity:", v19);

  if (v8 && !v5)
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);

}

uint64_t __76__CAMSnapshotView__removeSnapshotBlurForStyle_animated_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeFromSuperview");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_setupLowQualityBlurOnSnapshot
{
  id v3;
  UIView *v4;
  UIView *lowQualityBlurView;
  UIView *v6;
  void *v7;

  if (!self->__lowQualityBlurView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[CAMSnapshotView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    lowQualityBlurView = self->__lowQualityBlurView;
    self->__lowQualityBlurView = v4;

    v6 = self->__lowQualityBlurView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView setAlpha:](self->__lowQualityBlurView, "setAlpha:", 0.0);
    -[CAMSnapshotView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->__lowQualityBlurView, self->_snapshotView);
  }
}

- (void)_prepareForApplyingLowQualityBlurForStyle:(int64_t)a3 applying:(BOOL)a4 opacityAmount:(double *)a5 opacityDuration:(double *)a6 opacityDelay:(double *)a7 opacityTimingFunction:(id *)a8 targetView:(id *)a9
{
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  void *v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;

  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v20 = 0.0;
      if (a4)
        v20 = 1.0;
      *a5 = v20;
      if (a4)
        v21 = 0.03335;
      else
        v21 = 0.04695;
      UIAnimationDragCoefficient();
      *a6 = v22 * 0.25;
      -[UIView layer](self->_snapshotView, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v25 = v24;
      UIAnimationDragCoefficient();
      *a7 = v25 + v21 * v26;

      LODWORD(v27) = 1036831949;
      LODWORD(v28) = 0.25;
      LODWORD(v29) = 0.25;
      LODWORD(v30) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v28, v27, v29, v30);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (a3)
      return;
  }
  v14 = 0.0;
  if (a4)
    v14 = 1.0;
  *a5 = v14;
  UIAnimationDragCoefficient();
  HIDWORD(v18) = 1070638039;
  v19 = v17 * 0.26;
  *a6 = v19;
  *a7 = 0.0;
  if (a4)
  {
    LODWORD(v19) = 1048747128;
    LODWORD(v18) = 1012482169;
    LODWORD(v15) = 1061330040;
    LODWORD(v16) = 1046863382;
  }
  else
  {
    LODWORD(v18) = 1036831949;
    LODWORD(v19) = 0.25;
    LODWORD(v15) = 0.25;
    LODWORD(v16) = 1.0;
  }
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v18, v15, v16);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a8 = v31;

LABEL_16:
  -[CAMSnapshotView _lowQualityBlurView](self, "_lowQualityBlurView");
  *a9 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)_applyLowQualityBlurForStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, uint64_t);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CAMAnimationDelegate *v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;

  v5 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  -[CAMSnapshotView _setupLowQualityBlurOnSnapshot](self, "_setupLowQualityBlurOnSnapshot");
  v21 = 0.0;
  v22 = 0.0;
  v19 = 0;
  v20 = 0.0;
  v18 = 0;
  -[CAMSnapshotView _prepareForApplyingLowQualityBlurForStyle:applying:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:targetView:](self, "_prepareForApplyingLowQualityBlurForStyle:applying:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:targetView:", a3, 1, &v22, &v21, &v20, &v19, &v18);
  v9 = v19;
  v10 = v18;
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKeyPath:", CFSTR("opacity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFromValue:", v13);

    objc_msgSend(v12, "setBeginTime:", v20);
    objc_msgSend(v12, "setDuration:", v21);
    objc_msgSend(v12, "setTimingFunction:", v9);
    objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    if (v8)
    {
      v14 = objc_alloc_init(CAMAnimationDelegate);
      -[CAMAnimationDelegate setCompletion:](v14, "setCompletion:", v8);
      objc_msgSend(v12, "setDelegate:", v14);

    }
    objc_msgSend(v11, "addAnimation:forKey:", v12, CFSTR("inputRadiusAnimation"));

  }
  HIDWORD(v15) = HIDWORD(v22);
  *(float *)&v15 = v22;
  objc_msgSend(v11, "setOpacity:", v15);
  -[CAMSnapshotView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1.0;
  objc_msgSend(v16, "setOpacity:", v17);

  if (v8 && !v5)
    v8[2](v8, 1);

}

- (void)_removeLowQualityBlurForStyle:(int64_t)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CAMAnimationDelegate *v14;
  void *v15;
  void *v16;
  double v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;

  v5 = a4;
  v8 = a5;
  v24 = 0;
  v22 = 0.0;
  v23 = 0.0;
  v20 = 0;
  v21 = 0;
  -[CAMSnapshotView _prepareForApplyingLowQualityBlurForStyle:applying:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:targetView:](self, "_prepareForApplyingLowQualityBlurForStyle:applying:opacityAmount:opacityDuration:opacityDelay:opacityTimingFunction:targetView:", a3, 0, &v24, &v23, &v22, &v21, &v20);
  v9 = v21;
  v10 = v20;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSnapshotView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("opacity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v13);

    objc_msgSend(v11, "setDuration:", v23);
    objc_msgSend(v11, "setBeginTime:", v22);
    objc_msgSend(v11, "setTimingFunction:", v9);
    objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    v14 = objc_alloc_init(CAMAnimationDelegate);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__CAMSnapshotView__removeLowQualityBlurForStyle_animated_withCompletionBlock___block_invoke;
    v18[3] = &unk_1EA32A6A8;
    v19 = v8;
    -[CAMAnimationDelegate setCompletion:](v14, "setCompletion:", v18);
    objc_msgSend(v11, "setDelegate:", v14);
    -[CAMSnapshotView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAnimation:forKey:", v11, CFSTR("containerOpacityAnimation"));

  }
  -[CAMSnapshotView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 0;
  objc_msgSend(v16, "setOpacity:", v17);

  if (v8 && !v5)
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);

}

uint64_t __78__CAMSnapshotView__removeLowQualityBlurForStyle_animated_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setupDimOnSnapshot
{
  id v3;
  UIView *v4;
  UIView *dimmingView;
  UIView *v6;
  void *v7;

  if (!self->__dimmingView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[CAMSnapshotView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    dimmingView = self->__dimmingView;
    self->__dimmingView = v4;

    v6 = self->__dimmingView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[CAMSnapshotView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->__dimmingView, self->_snapshotView);
  }
}

- (void)_applySnapshotDimAnimated:(BOOL)a3 withCompletionBlock:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  CAMAnimationDelegate *v11;
  double v12;
  void (**v13)(id, uint64_t);

  v4 = a3;
  v13 = (void (**)(id, uint64_t))a4;
  -[CAMSnapshotView _setupDimOnSnapshot](self, "_setupDimOnSnapshot");
  -[CAMSnapshotView _dimmingView](self, "_dimmingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", &unk_1EA3B1A10);
    objc_msgSend(v9, "setToValue:", &unk_1EA3B1A20);
    objc_msgSend(v9, "setDuration:", 0.25);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimingFunction:", v10);

    objc_msgSend(v9, "setRemovedOnCompletion:", 0);
    v11 = objc_alloc_init(CAMAnimationDelegate);
    -[CAMAnimationDelegate setCompletion:](v11, "setCompletion:", v13);
    objc_msgSend(v9, "setDelegate:", v11);
    objc_msgSend(v7, "addAnimation:forKey:", v9, CFSTR("opacityAnimation"));

    LODWORD(v12) = 1.0;
    objc_msgSend(v7, "setOpacity:", v12);
  }
  else
  {
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOpacity:", v8);
    if (v13)
      v13[2](v13, 1);
  }

}

- (void)_removeSnapshotDimAnimated:(BOOL)a3 withCompletionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *dimmingView;
  id v11;
  UIView *v12;
  void (**v13)(void *, uint64_t);
  double v14;
  void *v15;
  void *v16;
  CAMAnimationDelegate *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  UIView *v23;
  id v24;

  v4 = a3;
  v6 = a4;
  -[CAMSnapshotView _dimmingView](self, "_dimmingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeAllAnimations");
  v9 = self->__dimmingView;
  dimmingView = self->__dimmingView;
  self->__dimmingView = 0;

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __66__CAMSnapshotView__removeSnapshotDimAnimated_withCompletionBlock___block_invoke;
  v22 = &unk_1EA328890;
  v23 = v9;
  v11 = v6;
  v24 = v11;
  v12 = v9;
  v13 = (void (**)(void *, uint64_t))_Block_copy(&v19);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"), v19, v20, v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFromValue:", &unk_1EA3B1A10);
    objc_msgSend(v15, "setToValue:", &unk_1EA3B1A30);
    objc_msgSend(v15, "setDuration:", 0.25);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimingFunction:", v16);

    objc_msgSend(v15, "setRemovedOnCompletion:", 0);
    v17 = objc_alloc_init(CAMAnimationDelegate);
    -[CAMAnimationDelegate setCompletion:](v17, "setCompletion:", v13);
    objc_msgSend(v15, "setDelegate:", v17);
    objc_msgSend(v8, "addAnimation:forKey:", v15, CFSTR("opacityAnimation"));

    LODWORD(v18) = 0;
    objc_msgSend(v8, "setOpacity:", v18);
  }
  else
  {
    LODWORD(v14) = 0;
    objc_msgSend(v8, "setOpacity:", v14, v19, v20, v21, v22, v23, v24);
    if (v13)
      v13[2](v13, 1);
  }

}

uint64_t __66__CAMSnapshotView__removeSnapshotDimAnimated_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)removeAllAnimationsOnLayer:(id)a3 recursively:(BOOL)a4 shouldLog:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  CAMSnapshotView *v27;
  uint64_t v28;

  v5 = a5;
  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "animationKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v23 = v10;
        v24 = 2114;
        v25 = v9;
        v26 = 2114;
        v27 = self;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Removing animation keys %{public}@ from layer %{public}@ on behalf of view %{public}@", buf, 0x20u);
      }

    }
  }
  objc_msgSend(v9, "removeAllAnimations");
  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v9, "sublayers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[CAMSnapshotView removeAllAnimationsOnLayer:recursively:shouldLog:](self, "removeAllAnimationsOnLayer:recursively:shouldLog:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 1, v5);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (BOOL)blurred
{
  return self->_blurred;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (BOOL)_supportsBlur
{
  return self->__supportsBlur;
}

- (int64_t)_blurStyleForEffectAnimationFactory
{
  return self->__blurStyleForEffectAnimationFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__blurView, 0);
  objc_storeStrong((id *)&self->__dimmingView, 0);
  objc_storeStrong((id *)&self->__lowQualityBlurView, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
