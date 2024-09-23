@implementation CFXFaceReticleView

- (CFXFaceReticleView)initWithFrame:(CGRect)a3 reticleType:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  CFXFaceReticleView *v9;
  CFXFaceReticleView *v10;
  uint64_t v11;
  UIImageView *reticleImageView;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CFXFaceReticleView;
  v9 = -[CFXFaceReticleView initWithFrame:](&v19, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v9->_isShowingFaceIndicator = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", x, y, width, height);
    reticleImageView = v10->_reticleImageView;
    v10->_reticleImageView = (UIImageView *)v11;

    -[UIImageView setHidden:](v10->_reticleImageView, "setHidden:", 1);
    v10->_canPerformFadeInAnimations = 1;
    if (a4 == 1)
    {
      -[CFXFaceReticleView setupAnimojiReticleLayers](v10, "setupAnimojiReticleLayers");
    }
    else if (!a4)
    {
      v13 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("faceIndicator"), v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "size");
      objc_msgSend(v15, "resizableImageWithCapInsets:", v16 * 0.5, v16 * 0.5, v16 * 0.5, v16 * 0.5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v10->_reticleImageView, "setImage:", v17);

    }
    -[CFXFaceReticleView addSubview:](v10, "addSubview:", v10->_reticleImageView);
  }
  return v10;
}

- (void)updateFrameForDisplayRelativeToBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  __int128 v22;
  uint64_t v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frameSize");
  v12 = aspectRatioForSize(v10, v11);
  v22 = *MEMORY[0x24BDC0D88];
  v23 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  +[JFXEffectEditingUtilities currentFaceRectRelativeToBounds:atTime:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "currentFaceRectRelativeToBounds:atTime:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v22, 0, 1, v8, v12, 0, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CFXFaceReticleView reticleImageView](self, "reticleImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

}

- (void)userFeedbackForTrackingType:(int64_t)a3 needsHaptics:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (a3 == 1)
    -[CFXFaceReticleView fadeInAnimation](self, "fadeInAnimation");
  else
    -[CFXFaceReticleView fadeOutAnimationWithCompletion:](self, "fadeOutAnimationWithCompletion:", 0);
  -[CFXFaceReticleView shouldUseHapticFeedback:](self, "shouldUseHapticFeedback:", v4);
}

- (void)fadeInAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  _QWORD v18[5];
  _QWORD v19[5];
  CGAffineTransform v20;
  CGAffineTransform v21;

  if (-[CFXFaceReticleView canPerformFadeInAnimations](self, "canPerformFadeInAnimations"))
  {
    -[CFXFaceReticleView setCanPerformFadeInAnimations:](self, "setCanPerformFadeInAnimations:", 0);
    -[CFXFaceReticleView setCanPerformFadeOutAnimations:](self, "setCanPerformFadeOutAnimations:", 1);
    -[CFXFaceReticleView reticleImageView](self, "reticleImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

    -[CFXFaceReticleView reticleImageView](self, "reticleImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    CGAffineTransformMakeScale(&v21, 0.85, 0.85);
    -[CFXFaceReticleView reticleImageView](self, "reticleImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    objc_msgSend(v5, "setTransform:", &v20);

    v6 = objc_alloc(MEMORY[0x24BDF6FA8]);
    v7 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __37__CFXFaceReticleView_fadeInAnimation__block_invoke;
    v19[3] = &unk_24EE57B60;
    v19[4] = self;
    v8 = (void *)objc_msgSend(v6, "initWithDuration:curve:animations:", 0, v19, 0.5);
    objc_msgSend(v8, "startAnimation");
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __37__CFXFaceReticleView_fadeInAnimation__block_invoke_2;
    v18[3] = &unk_24EE57B60;
    v18[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:curve:animations:", 0, v18, 0.7);
    -[CFXFaceReticleView setBounceAnimator:](self, "setBounceAnimator:", v9);

    objc_initWeak(&location, self);
    -[CFXFaceReticleView bounceAnimator](self, "bounceAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v13 = 3221225472;
    v14 = __37__CFXFaceReticleView_fadeInAnimation__block_invoke_3;
    v15 = &unk_24EE5B978;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "addCompletion:", &v12);

    -[CFXFaceReticleView bounceAnimator](self, "bounceAnimator", v12, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAnimationAfterDelay:", 0.5);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __37__CFXFaceReticleView_fadeInAnimation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

void __37__CFXFaceReticleView_fadeInAnimation__block_invoke_2(uint64_t a1, double a2)
{
  __int128 v3;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  LODWORD(a2) = 2139095040;
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationRepeatCount:", a2);
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationRepeatAutoreverses:", 1);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformScale(&v7, &v6, 0.93, 0.93);
  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  objc_msgSend(v4, "setTransform:", &v5);

}

void __37__CFXFaceReticleView_fadeInAnimation__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCanPerformFadeInAnimations:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setBounceAnimator:", 0);

}

- (void)fadeOutAnimationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[5];

  v4 = (void (**)(_QWORD))a3;
  if (-[CFXFaceReticleView canPerformFadeOutAnimations](self, "canPerformFadeOutAnimations"))
  {
    -[CFXFaceReticleView setCanPerformFadeOutAnimations:](self, "setCanPerformFadeOutAnimations:", 0);
    v5 = objc_alloc(MEMORY[0x24BDF6FA8]);
    v6 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke;
    v18[3] = &unk_24EE57B60;
    v18[4] = self;
    v7 = (void *)objc_msgSend(v5, "initWithDuration:curve:animations:", 0, v18, 0.5);
    -[CFXFaceReticleView setFadeOutAnimator:](self, "setFadeOutAnimator:", v7);

    objc_initWeak(&location, self);
    -[CFXFaceReticleView fadeOutAnimator](self, "fadeOutAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_2;
    v15[3] = &unk_24EE5B978;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v8, "addCompletion:", v15);

    -[CFXFaceReticleView fadeOutAnimator](self, "fadeOutAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startAnimation");

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  if (v4)
  {
    -[CFXFaceReticleView fadeOutAnimator](self, "fadeOutAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRunning");

    if (v11)
    {
      -[CFXFaceReticleView fadeOutAnimator](self, "fadeOutAnimator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_3;
      v13[3] = &unk_24EE587E0;
      v14 = v4;
      objc_msgSend(v12, "addCompletion:", v13);

    }
    else
    {
      v4[2](v4);
    }
  }

}

void __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reticleImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "bounceAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAnimation:", 0);

  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "bounceAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishAnimationAtPosition:", a2);

  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "setFadeOutAnimator:", 0);

}

uint64_t __53__CFXFaceReticleView_fadeOutAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fadeOutAndEndHapticWithCompletionBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[CFXFaceReticleView shouldUseHapticFeedback:](self, "shouldUseHapticFeedback:", 0);
  -[CFXFaceReticleView fadeOutAnimationWithCompletion:](self, "fadeOutAnimationWithCompletion:", v4);

}

- (void)shouldUseHapticFeedback:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[CFXFaceReticleView feedbackGenerator](self, "feedbackGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDF6D80]);
      -[CFXFaceReticleView setFeedbackGenerator:](self, "setFeedbackGenerator:", v5);

      -[CFXFaceReticleView feedbackGenerator](self, "feedbackGenerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setOutputMode:", 5);

    }
    -[CFXFaceReticleView feedbackGenerator](self, "feedbackGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepare");

    -[CFXFaceReticleView feedbackGenerator](self, "feedbackGenerator");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionChanged");

  }
  else
  {
    -[CFXFaceReticleView setFeedbackGenerator:](self, "setFeedbackGenerator:", 0);
  }
}

- (void)setupAnimojiReticleLayers
{
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;

  -[CFXFaceReticleView bounds](self, "bounds");
  v3 = 0.125;
  v5 = (v4 * 0.125 * 3.14159265 * 3.0 * 0.5 - v4 * 0.5) / (v4 + v4);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CFXFaceReticleView setReticleLayersToAnimate:](self, "setReticleLayersToAnimate:", v7);

  -[CFXFaceReticleView reticleLayersToAnimate](self, "reticleLayersToAnimate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = *MEMORY[0x24BDE5CE8];
  if (v9 <= 7)
  {
    v11 = 0.375;
    do
    {
      v12 = (void *)MEMORY[0x24BDF6870];
      -[CFXFaceReticleView bounds](self, "bounds");
      objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x24BDE5758]);
      objc_msgSend(v14, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "setFillColor:", objc_msgSend(v15, "CGColor"));

      objc_msgSend(v14, "setLineWidth:", 5.0);
      objc_msgSend(v14, "setLineCap:", v10);
      objc_msgSend(v14, "setStrokeStart:", v3 + 0.045 - v5);
      objc_msgSend(v14, "setStrokeEnd:", v11 + -0.045 - v5);
      v16 = objc_retainAutorelease(v13);
      objc_msgSend(v14, "setPath:", objc_msgSend(v16, "CGPath"));
      -[UIImageView layer](self->_reticleImageView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSublayer:", v14);

      -[CFXFaceReticleView reticleLayersToAnimate](self, "reticleLayersToAnimate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v14);

      v3 = v3 + 0.25;
      v11 = v11 + 0.25;

      -[CFXFaceReticleView reticleLayersToAnimate](self, "reticleLayersToAnimate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v20 < 8);
  }
  v21 = (void *)MEMORY[0x24BDF6870];
  -[CFXFaceReticleView bounds](self, "bounds");
  objc_msgSend(v21, "bezierPathWithRoundedRect:cornerRadius:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x24BDE5758]);
  v28 = objc_retainAutorelease(v6);
  objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v28, "CGColor"));
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v23, "setFillColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v23, "setLineWidth:", 5.0);
  objc_msgSend(v23, "setLineCap:", v10);
  objc_msgSend(v23, "setStrokeStart:", 0.0);
  objc_msgSend(v23, "setStrokeEnd:", 0.08 - v5);
  v25 = objc_retainAutorelease(v22);
  objc_msgSend(v23, "setPath:", objc_msgSend(v25, "CGPath"));
  -[UIImageView layer](self->_reticleImageView, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSublayer:", v23);

  -[CFXFaceReticleView reticleLayersToAnimate](self, "reticleLayersToAnimate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v23);

}

- (void)animojiFadeInAnimation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  _QWORD v17[5];
  _QWORD v18[5];

  -[CFXFaceReticleView reticleImageView](self, "reticleImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CFXFaceReticleView reticleImageView](self, "reticleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke;
  v18[3] = &unk_24EE57B60;
  v18[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithDuration:curve:animations:", 0, v18, 0.4);
  objc_msgSend(v7, "startAnimation");
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_2;
  v17[3] = &unk_24EE57B60;
  v17[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FA8]), "initWithDuration:curve:animations:", 0, v17, 0.4);
  -[CFXFaceReticleView setAnimojiBounceAnimator:](self, "setAnimojiBounceAnimator:", v8);

  objc_initWeak(&location, self);
  -[CFXFaceReticleView animojiBounceAnimator](self, "animojiBounceAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12 = 3221225472;
  v13 = __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_3;
  v14 = &unk_24EE5B978;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v9, "addCompletion:", &v11);

  -[CFXFaceReticleView animojiBounceAnimator](self, "animojiBounceAnimator", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startAnimation");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_2(uint64_t a1, double a2)
{
  __int128 v3;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  LODWORD(a2) = 2139095040;
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationRepeatCount:", a2);
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationRepeatAutoreverses:", 1);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformScale(&v7, &v6, 0.93, 0.93);
  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  objc_msgSend(v4, "setTransform:", &v5);

}

void __44__CFXFaceReticleView_animojiFadeInAnimation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setBounceAnimator:", 0);

}

- (void)animojiCloseAnimationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v5 = (void *)MEMORY[0x24BDE57D8];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __58__CFXFaceReticleView_animojiCloseAnimationWithCompletion___block_invoke;
  v29[3] = &unk_24EE580C8;
  v22 = v4;
  v30 = v22;
  objc_msgSend(v5, "setCompletionBlock:", v29);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CFXFaceReticleView reticleLayersToAnimate](self, "reticleLayersToAnimate");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = v6;
    v24 = *(_QWORD *)v26;
    v8 = *MEMORY[0x24BDE5978];
    v9 = *MEMORY[0x24BDE5D20];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeStart"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v11, "strokeStart");
        objc_msgSend(v13, "numberWithDouble:", v14 + -0.045);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setToValue:", v15);

        objc_msgSend(v12, "setDuration:", 0.2);
        objc_msgSend(v12, "setFillMode:", v8);
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTimingFunction:", v16);

        objc_msgSend(v12, "setRemovedOnCompletion:", 0);
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("strokeEnd"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v11, "strokeEnd");
        objc_msgSend(v18, "numberWithDouble:", v19 + 0.045);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setToValue:", v20);

        objc_msgSend(v17, "setDuration:", 0.2);
        objc_msgSend(v17, "setFillMode:", v8);
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimingFunction:", v21);

        objc_msgSend(v17, "setRemovedOnCompletion:", 0);
        objc_msgSend(v11, "addAnimation:forKey:", v17, 0);
        objc_msgSend(v11, "addAnimation:forKey:", v12, 0);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __58__CFXFaceReticleView_animojiCloseAnimationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showAndAnimateAnimojiFaceReticle
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CFXFaceReticleView_showAndAnimateAnimojiFaceReticle__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __54__CFXFaceReticleView_showAndAnimateAnimojiFaceReticle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animojiFadeInAnimation");
}

- (void)hideAnimojiFaceReticleAnimatedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CFXFaceReticleView animojiBounceAnimator](self, "animojiBounceAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimation:", 1);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke;
  v7[3] = &unk_24EE580A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CFXFaceReticleView animojiCloseAnimationWithCompletion:](self, "animojiCloseAnimationWithCompletion:", v7);

}

void __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id location;
  _QWORD v14[5];

  v2 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_2;
  v14[3] = &unk_24EE57B60;
  v14[4] = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_msgSend(v2, "initWithDuration:curve:animations:", 0, v14, 0.4);
  objc_msgSend(*(id *)(a1 + 32), "setAnimojiFadeOutAnimator:", v4);

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "animojiFadeOutAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  v8 = 3221225472;
  v9 = __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_3;
  v10 = &unk_24EE5B9A0;
  objc_copyWeak(&v12, &location);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v5, "addCompletion:", &v7);

  objc_msgSend(*(id *)(a1 + 32), "animojiFadeOutAnimator", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAnimationAfterDelay:", 0.2);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reticleImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __67__CFXFaceReticleView_hideAnimojiFaceReticleAnimatedWithCompletion___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reticleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setFadeOutAnimator:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isShowingFaceIndicator
{
  return self->_isShowingFaceIndicator;
}

- (void)setIsShowingFaceIndicator:(BOOL)a3
{
  self->_isShowingFaceIndicator = a3;
}

- (UIImageView)reticleImageView
{
  return self->_reticleImageView;
}

- (void)setReticleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_reticleImageView, a3);
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)canPerformFadeInAnimations
{
  return self->_canPerformFadeInAnimations;
}

- (void)setCanPerformFadeInAnimations:(BOOL)a3
{
  self->_canPerformFadeInAnimations = a3;
}

- (BOOL)canPerformFadeOutAnimations
{
  return self->_canPerformFadeOutAnimations;
}

- (void)setCanPerformFadeOutAnimations:(BOOL)a3
{
  self->_canPerformFadeOutAnimations = a3;
}

- (UIViewPropertyAnimator)bounceAnimator
{
  return self->_bounceAnimator;
}

- (void)setBounceAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_bounceAnimator, a3);
}

- (UIViewPropertyAnimator)fadeOutAnimator
{
  return self->_fadeOutAnimator;
}

- (void)setFadeOutAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_fadeOutAnimator, a3);
}

- (UIViewPropertyAnimator)animojiBounceAnimator
{
  return self->_animojiBounceAnimator;
}

- (void)setAnimojiBounceAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animojiBounceAnimator, a3);
}

- (UIViewPropertyAnimator)animojiFadeOutAnimator
{
  return self->_animojiFadeOutAnimator;
}

- (void)setAnimojiFadeOutAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animojiFadeOutAnimator, a3);
}

- (NSMutableArray)reticleLayersToAnimate
{
  return self->_reticleLayersToAnimate;
}

- (void)setReticleLayersToAnimate:(id)a3
{
  objc_storeStrong((id *)&self->_reticleLayersToAnimate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reticleLayersToAnimate, 0);
  objc_storeStrong((id *)&self->_animojiFadeOutAnimator, 0);
  objc_storeStrong((id *)&self->_animojiBounceAnimator, 0);
  objc_storeStrong((id *)&self->_fadeOutAnimator, 0);
  objc_storeStrong((id *)&self->_bounceAnimator, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_reticleImageView, 0);
}

@end
