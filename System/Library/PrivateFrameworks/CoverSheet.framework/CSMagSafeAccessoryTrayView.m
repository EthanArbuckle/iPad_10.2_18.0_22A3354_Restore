@implementation CSMagSafeAccessoryTrayView

- (CSMagSafeAccessoryTrayView)initWithTrayColor:(id)a3
{
  id v4;
  CSMagSafeAccessoryTrayView *v5;
  CSMagSafeAccessoryTrayView *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t *v9;
  uint64_t v10;
  CABackdropLayer *averageColorBackdropLayer;
  double v12;
  CABackdropLayer *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CABackdropLayer *backgroundBackdropLayer;
  CABackdropLayer *v18;
  void *v19;
  double v20;
  uint64_t v21;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  CABackdropLayer *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  CALayer *splashRing1;
  uint64_t v36;
  CALayer *splashRing2;
  uint64_t v38;
  CALayer *splashRing3;
  uint64_t v40;
  CALayer *splashRing4;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  CSRingLayer *trackRing;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  CABackdropLayer *trackRingBlurBackdropLayer;
  CABackdropLayer *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  CSRingLayer *trackRingBlurLayer;
  CSRingLayer *v77;
  id v78;
  void *v79;
  id v81;
  objc_super v82;
  _QWORD v83[2];

  v83[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)CSMagSafeAccessoryTrayView;
  v5 = -[CSMagSafeAccessoryView initWithFrame:](&v82, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[CSMagSafeAccessoryTrayView layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    v8 = -[CSMagSafeAccessoryView isReduceTransparencyEnabled](v6, "isReduceTransparencyEnabled");
    v9 = (uint64_t *)MEMORY[0x1E0CD2E70];
    v81 = v4;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CD2708], "layer");
      v10 = objc_claimAutoreleasedReturnValue();
      averageColorBackdropLayer = v6->_averageColorBackdropLayer;
      v6->_averageColorBackdropLayer = (CABackdropLayer *)v10;

      LODWORD(v12) = 0;
      -[CABackdropLayer setOpacity:](v6->_averageColorBackdropLayer, "setOpacity:", v12);
      v13 = v6->_averageColorBackdropLayer;
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2B88]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABackdropLayer setFilters:](v13, "setFilters:", v15);

      -[CABackdropLayer setScale:](v6->_averageColorBackdropLayer, "setScale:", 100.0);
      -[CABackdropLayer setAllowsGroupOpacity:](v6->_averageColorBackdropLayer, "setAllowsGroupOpacity:", 1);
      -[CABackdropLayer setAllowsGroupBlending:](v6->_averageColorBackdropLayer, "setAllowsGroupBlending:", 1);
      -[CABackdropLayer setAllowsEdgeAntialiasing:](v6->_averageColorBackdropLayer, "setAllowsEdgeAntialiasing:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2708], "backdropLayerWithGaussianBlurRadius:brightnessAmount:saturationAmount:", 0.0, 0.0, 1.0);
      v16 = objc_claimAutoreleasedReturnValue();
      backgroundBackdropLayer = v6->_backgroundBackdropLayer;
      v6->_backgroundBackdropLayer = (CABackdropLayer *)v16;

      v18 = v6->_backgroundBackdropLayer;
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABackdropLayer setCompositingFilter:](v18, "setCompositingFilter:", v19);

      LODWORD(v20) = 1.0;
      -[CABackdropLayer setOpacity:](v6->_backgroundBackdropLayer, "setOpacity:", v20);
    }
    if (-[CSMagSafeAccessoryView isReduceMotionEnabled](v6, "isReduceMotionEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CD2708], "backdropLayerWithGaussianBlurRadius:brightnessAmount:saturationAmount:", 60.0, 0.0, 1.0);
      v21 = objc_claimAutoreleasedReturnValue();
      backgroundRadiusBackdropLayer = v6->_backgroundRadiusBackdropLayer;
      v6->_backgroundRadiusBackdropLayer = (CABackdropLayer *)v21;

      v23 = v6->_backgroundRadiusBackdropLayer;
      v24 = *v9;
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABackdropLayer setCompositingFilter:](v23, "setCompositingFilter:", v25);

      v26 = v24;
      LODWORD(v27) = 0;
      -[CABackdropLayer setOpacity:](v6->_backgroundRadiusBackdropLayer, "setOpacity:", v27);
    }
    else
    {
      v26 = *v9;
    }
    -[CSMagSafeAccessoryView configuration](v6, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ring");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "splashRingDiameter");
    v31 = v30 * 1.2 * 0.5;
    v32 = v30 * 2.1 * 0.5;
    v33 = *MEMORY[0x1E0CD2EA0];
    objc_msgSend(MEMORY[0x1E0CD27A8], "ringLayerWithBlendMode:cornerRadius:borderWidth:", *MEMORY[0x1E0CD2EA0], v30 * 0.5, 0.0);
    v34 = objc_claimAutoreleasedReturnValue();
    splashRing1 = v6->_splashRing1;
    v6->_splashRing1 = (CALayer *)v34;

    objc_msgSend(MEMORY[0x1E0CD27A8], "ringLayerWithBlendMode:cornerRadius:borderWidth:", v33, v31, 0.0);
    v36 = objc_claimAutoreleasedReturnValue();
    splashRing2 = v6->_splashRing2;
    v6->_splashRing2 = (CALayer *)v36;

    objc_msgSend(MEMORY[0x1E0CD27A8], "ringLayerWithBlendMode:cornerRadius:borderWidth:", v26, v32, 0.0);
    v38 = objc_claimAutoreleasedReturnValue();
    splashRing3 = v6->_splashRing3;
    v6->_splashRing3 = (CALayer *)v38;

    objc_msgSend(MEMORY[0x1E0CD27A8], "ringLayerWithBlendMode:cornerRadius:borderWidth:", v26, v32, 0.0);
    v40 = objc_claimAutoreleasedReturnValue();
    splashRing4 = v6->_splashRing4;
    v6->_splashRing4 = (CALayer *)v40;

    objc_msgSend(v29, "ringDiameter");
    v43 = v42;
    -[CSMagSafeAccessoryTrayView _trackRingLineWidthAnimationOffset](v6, "_trackRingLineWidthAnimationOffset");
    v45 = v43 + v44;
    objc_msgSend(v29, "lineWidth");
    v47 = v46;
    -[CSMagSafeAccessoryTrayView _trackRingLineWidthAnimationOffset](v6, "_trackRingLineWidthAnimationOffset");
    +[CSRingLayer ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:](CSRingLayer, "ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:", v26, v45, v47 + v48, 0.0, 1.25);
    v49 = objc_claimAutoreleasedReturnValue();
    trackRing = v6->_trackRing;
    v6->_trackRing = (CSRingLayer *)v49;

    -[CSRingLayer setAllowsGroupOpacity:](v6->_trackRing, "setAllowsGroupOpacity:", 0);
    -[CSRingLayer setAllowsGroupBlending:](v6->_trackRing, "setAllowsGroupBlending:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v51 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4 || v51 == v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v52 = objc_msgSend(v53, "CGColor");

      v6->_clearColorAnimationNeeded = 1;
    }
    else
    {
      v6->_clearColorAnimationNeeded = 0;
      v52 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
    }
    -[CALayer setBackgroundColor:](v6->_splashRing1, "setBackgroundColor:", v52);
    -[CALayer setBackgroundColor:](v6->_splashRing2, "setBackgroundColor:", v52);
    -[CALayer setBackgroundColor:](v6->_splashRing3, "setBackgroundColor:", v52);
    -[CALayer setBackgroundColor:](v6->_splashRing4, "setBackgroundColor:", v52);
    -[CSRingLayer setStrokeColor:](v6->_trackRing, "setStrokeColor:", v52);
    if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](v6, "isReduceTransparencyEnabled"))
    {
      -[CSMagSafeAccessoryTrayView layer](v6, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addSublayer:", v6->_averageColorBackdropLayer);

    }
    -[CSMagSafeAccessoryTrayView layer](v6, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSublayer:", v6->_backgroundBackdropLayer);

    v56 = -[CSMagSafeAccessoryView isReduceMotionEnabled](v6, "isReduceMotionEnabled");
    -[CSMagSafeAccessoryTrayView layer](v6, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v56)
    {
      objc_msgSend(v57, "insertSublayer:below:", v6->_backgroundRadiusBackdropLayer, v6->_backgroundBackdropLayer);
    }
    else
    {
      objc_msgSend(v57, "addSublayer:", v6->_splashRing1);

      -[CSMagSafeAccessoryTrayView layer](v6, "layer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addSublayer:", v6->_splashRing2);
    }

    -[CSMagSafeAccessoryTrayView layer](v6, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addSublayer:", v6->_splashRing3);

    -[CSMagSafeAccessoryTrayView layer](v6, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addSublayer:", v6->_splashRing4);

    -[CSMagSafeAccessoryTrayView layer](v6, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSublayer:", v6->_trackRing);

    if (v6->_clearColorAnimationNeeded)
    {
      objc_msgSend(MEMORY[0x1E0CD2708], "backdropLayerWithGaussianBlurRadius:brightnessAmount:saturationAmount:", 45.0, 0.15, 1.3);
      v62 = objc_claimAutoreleasedReturnValue();
      trackRingBlurBackdropLayer = v6->_trackRingBlurBackdropLayer;
      v6->_trackRingBlurBackdropLayer = (CABackdropLayer *)v62;

      v64 = v6->_trackRingBlurBackdropLayer;
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v26);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[CABackdropLayer setCompositingFilter:](v64, "setCompositingFilter:", v65);

      -[CSMagSafeAccessoryView configuration](v6, "configuration");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "ring");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v67, "ringDiameter");
      v69 = v68;
      -[CSMagSafeAccessoryTrayView _trackRingLineWidthAnimationOffset](v6, "_trackRingLineWidthAnimationOffset");
      v71 = v69 + v70;
      objc_msgSend(v67, "lineWidth");
      v73 = v72;
      -[CSMagSafeAccessoryTrayView _trackRingLineWidthAnimationOffset](v6, "_trackRingLineWidthAnimationOffset");
      +[CSRingLayer ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:](CSRingLayer, "ringLayerWithBlendMode:diameter:lineWidth:brightnessAmount:saturationAmount:", v26, v71, v73 + v74, 0.1, 1.25);
      v75 = objc_claimAutoreleasedReturnValue();
      trackRingBlurLayer = v6->_trackRingBlurLayer;
      v6->_trackRingBlurLayer = (CSRingLayer *)v75;

      v77 = v6->_trackRingBlurLayer;
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CSRingLayer setStrokeColor:](v77, "setStrokeColor:", objc_msgSend(v78, "CGColor"));

      -[CABackdropLayer setMask:](v6->_trackRingBlurBackdropLayer, "setMask:", v6->_trackRingBlurLayer);
      -[CSMagSafeAccessoryTrayView layer](v6, "layer");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "insertSublayer:above:", v6->_trackRingBlurBackdropLayer, v6->_backgroundBackdropLayer);

    }
    v4 = v81;
  }

  return v6;
}

- (CSMagSafeAccessoryTrayView)initWithFrame:(CGRect)a3
{
  void *v4;
  CSMagSafeAccessoryTrayView *v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CSMagSafeAccessoryTrayView initWithTrayColor:](self, "initWithTrayColor:", v4);

  return v5;
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  CABackdropLayer *averageColorBackdropLayer;
  CABackdropLayer *backgroundBackdropLayer;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  double v23;
  double v24;
  CABackdropLayer *trackRingBlurBackdropLayer;
  CSRingLayer *trackRingBlurLayer;
  void *v27;
  void *v28;
  double v29;
  double v30;
  CALayer *splashRing1;
  CALayer *splashRing2;
  double v33;
  CALayer *splashRing3;
  CALayer *splashRing4;
  CSRingLayer *trackRing;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CSMagSafeAccessoryTrayView;
  -[CSMagSafeAccessoryView layoutSubviews](&v42, sel_layoutSubviews);
  -[CSMagSafeAccessoryTrayView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CSMagSafeAccessoryTrayView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  -[CSMagSafeAccessoryView configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ring");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ringDiameter");
  v41 = v14;
  -[CSMagSafeAccessoryTrayView _trackRingLineWidthAnimationOffset](self, "_trackRingLineWidthAnimationOffset");
  v40 = v15;
  -[CSMagSafeAccessoryView configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ring");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ringDiameter");
  v39 = v18;
  -[CSMagSafeAccessoryTrayView _trackRingLineWidthAnimationOffset](self, "_trackRingLineWidthAnimationOffset");
  v37 = v19;

  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    -[CABackdropLayer setBounds:](self->_averageColorBackdropLayer, "setBounds:", v5, v7, v9, v11);
    averageColorBackdropLayer = self->_averageColorBackdropLayer;
    -[CABackdropLayer bounds](averageColorBackdropLayer, "bounds");
    -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](averageColorBackdropLayer, "setPosition:");
  }
  -[CABackdropLayer setBounds:](self->_backgroundBackdropLayer, "setBounds:", v5, v7, v9, v11, v37);
  backgroundBackdropLayer = self->_backgroundBackdropLayer;
  -[CABackdropLayer bounds](backgroundBackdropLayer, "bounds");
  -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CABackdropLayer setPosition:](backgroundBackdropLayer, "setPosition:");
  if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    -[CABackdropLayer setBounds:](self->_backgroundRadiusBackdropLayer, "setBounds:", v5, v7, v9, v11);
    backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
    -[CABackdropLayer bounds](backgroundRadiusBackdropLayer, "bounds");
    -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](backgroundRadiusBackdropLayer, "setPosition:");
  }
  v23 = v41 + v40;
  v24 = v39 + v38;
  if (self->_clearColorAnimationNeeded)
  {
    -[CABackdropLayer setBounds:](self->_trackRingBlurBackdropLayer, "setBounds:", 0.0, 0.0, v41 + v40, v39 + v38);
    trackRingBlurBackdropLayer = self->_trackRingBlurBackdropLayer;
    -[CABackdropLayer bounds](trackRingBlurBackdropLayer, "bounds");
    -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CABackdropLayer setPosition:](trackRingBlurBackdropLayer, "setPosition:");
    -[CSRingLayer setBounds:](self->_trackRingBlurLayer, "setBounds:", 0.0, 0.0, v23, v24);
    trackRingBlurLayer = self->_trackRingBlurLayer;
    -[CSRingLayer bounds](trackRingBlurLayer, "bounds");
    -[CABackdropLayer bounds](self->_trackRingBlurBackdropLayer, "bounds");
    UIRectCenteredIntegralRect();
    UIRectGetCenter();
    -[CSRingLayer setPosition:](trackRingBlurLayer, "setPosition:");
  }
  -[CSMagSafeAccessoryView configuration](self, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "ring");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "splashRingDiameter");
  v30 = v29;

  -[CALayer setBounds:](self->_splashRing1, "setBounds:", 0.0, 0.0, v30, v30);
  splashRing1 = self->_splashRing1;
  -[CALayer bounds](splashRing1, "bounds");
  -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing1, "setPosition:");
  -[CALayer setBounds:](self->_splashRing2, "setBounds:", 0.0, 0.0, v30 * 1.2, v30 * 1.2);
  splashRing2 = self->_splashRing2;
  -[CALayer bounds](splashRing2, "bounds");
  -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing2, "setPosition:");
  v33 = v30 * 2.1;
  -[CALayer setBounds:](self->_splashRing3, "setBounds:", 0.0, 0.0, v33, v33);
  splashRing3 = self->_splashRing3;
  -[CALayer bounds](splashRing3, "bounds");
  -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing3, "setPosition:");
  -[CALayer setBounds:](self->_splashRing4, "setBounds:", 0.0, 0.0, v33, v33);
  splashRing4 = self->_splashRing4;
  -[CALayer bounds](splashRing4, "bounds");
  -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](splashRing4, "setPosition:");
  -[CSRingLayer setBounds:](self->_trackRing, "setBounds:", 0.0, 0.0, v23, v24);
  trackRing = self->_trackRing;
  -[CSRingLayer bounds](trackRing, "bounds");
  -[CSMagSafeAccessoryTrayView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CSRingLayer setPosition:](trackRing, "setPosition:");
}

- (double)_trackRingLineWidthAnimationOffset
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  v3 = 0.0;
  if (!-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    -[CSMagSafeAccessoryView configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ring");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lineWidth");
    v7 = v6;

    if (v7 < 30.0)
    {
      -[CSMagSafeAccessoryView configuration](self, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ring");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lineWidth");
      v3 = 30.0 - v10;

    }
  }
  return v3;
}

- (void)_presentAnimation
{
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CABackdropLayer *backgroundRadiusBackdropLayer;
  void *v14;
  const __CFString *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[3];
  _QWORD v91[4];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[2];
  _QWORD v96[5];

  v96[3] = *MEMORY[0x1E0C80C00];
  v3 = CACurrentMediaTime();
  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyTimes:", &unk_1E8E89328);
    objc_msgSend(v4, "setValues:", &unk_1E8E89340);
    objc_msgSend(v4, "setDuration:", 0.42);
    objc_msgSend(v4, "setRemovedOnCompletion:", 0);
    v5 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v6 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v7);

    -[CABackdropLayer addAnimation:forKey:](self->_averageColorBackdropLayer, "addAnimation:forKey:", v4, CFSTR("opacity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorBrightness.inputAmount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyTimes:", &unk_1E8E89358);
    objc_msgSend(v4, "setValues:", &unk_1E8E89370);
    objc_msgSend(v4, "setDuration:", 0.42);
    objc_msgSend(v4, "setRemovedOnCompletion:", 0);
    v5 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v6 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimingFunction:", v8);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v4, CFSTR("filters.colorBrightness.inputAmount"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorSaturate.inputAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeyTimes:", &unk_1E8E89388);
    objc_msgSend(v9, "setValues:", &unk_1E8E893A0);
    objc_msgSend(v9, "setDuration:", 0.42);
    objc_msgSend(v9, "setRemovedOnCompletion:", 0);
    objc_msgSend(v9, "setFillMode:", v5);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimingFunction:", v10);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v9, CFSTR("filters.colorSaturate.inputAmount"));
    if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setKeyTimes:", &unk_1E8E893E8);
      objc_msgSend(v11, "setValues:", &unk_1E8E89400);
      objc_msgSend(v11, "setDuration:", 0.42);
      objc_msgSend(v11, "setRemovedOnCompletion:", 0);
      objc_msgSend(v11, "setFillMode:", v5);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v12);

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      v14 = v11;
      v15 = CFSTR("opacity");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setKeyTimes:", &unk_1E8E893B8);
      objc_msgSend(v11, "setValues:", &unk_1E8E893D0);
      objc_msgSend(v11, "setDuration:", 0.42);
      objc_msgSend(v11, "setRemovedOnCompletion:", 0);
      objc_msgSend(v11, "setFillMode:", v5);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimingFunction:", v16);

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      v14 = v11;
      v15 = CFSTR("filters.gaussianBlur.inputRadius");
    }
    -[CABackdropLayer addAnimation:forKey:](backgroundRadiusBackdropLayer, "addAnimation:forKey:", v14, v15);

  }
  if (self->_clearColorAnimationNeeded)
    v17 = 0.15;
  else
    v17 = 0.25;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBeginTime:", v3 + 0.5);
  objc_msgSend(v18, "setKeyTimes:", &unk_1E8E89418);
  v96[0] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v19;
  v96[2] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValues:", v20);

  objc_msgSend(v18, "setDuration:", 0.31);
  objc_msgSend(v18, "setRemovedOnCompletion:", 0);
  v87 = v5;
  objc_msgSend(v18, "setFillMode:", v5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v21;
  v86 = v6;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimingFunctions:", v23);

  if (!-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    -[CALayer addAnimation:forKey:](self->_splashRing1, "addAnimation:forKey:", v18, CFSTR("opacity"));
    if (self->_clearColorAnimationNeeded)
      v24 = 0.2;
    else
      v24 = 0.25;
    objc_msgSend(v18, "setBeginTime:", v3 + 0.6);
    v94[0] = &unk_1E8E879D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v25;
    v94[2] = &unk_1E8E879D0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValues:", v26);

    -[CALayer addAnimation:forKey:](self->_splashRing2, "addAnimation:forKey:", v18, CFSTR("opacity"));
  }
  if (self->_clearColorAnimationNeeded)
    v27 = 0.1;
  else
    v27 = 1.0;
  objc_msgSend(v18, "setBeginTime:", v3 + 0.71);
  objc_msgSend(v18, "setKeyTimes:", &unk_1E8E89430);
  v93[0] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v28;
  v93[2] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValues:", v29);

  objc_msgSend(v18, "setDuration:", 1.37);
  -[CALayer addAnimation:forKey:](self->_splashRing3, "addAnimation:forKey:", v18, CFSTR("opacity"));
  if (self->_clearColorAnimationNeeded)
    v30 = 0.2;
  else
    v30 = 1.0;
  objc_msgSend(v18, "setBeginTime:", v3 + 0.65);
  objc_msgSend(v18, "setKeyTimes:", &unk_1E8E89448);
  v92[0] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v31;
  v92[2] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValues:", v32);

  objc_msgSend(v18, "setDuration:", 0.97);
  -[CALayer addAnimation:forKey:](self->_splashRing4, "addAnimation:forKey:", v18, CFSTR("opacity"));
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBeginTime:", v3 + 0.5);
  objc_msgSend(v33, "setKeyTimes:", &unk_1E8E89460);
  objc_msgSend(v33, "setValues:", &unk_1E8E89478);
  objc_msgSend(v33, "setDuration:", 0.3);
  objc_msgSend(v33, "setRemovedOnCompletion:", 0);
  objc_msgSend(v33, "setFillMode:", v5);
  LODWORD(v34) = 1059816735;
  LODWORD(v35) = 0;
  LODWORD(v36) = 0;
  LODWORD(v37) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v35, v36, v34, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTimingFunction:", v38);

  if (!-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    -[CALayer addAnimation:forKey:](self->_splashRing1, "addAnimation:forKey:", v33, CFSTR("transform.scale.xy"));
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v86);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTimingFunction:", v39);

    -[CALayer addAnimation:forKey:](self->_splashRing2, "addAnimation:forKey:", v33, CFSTR("transform.scale.xy"));
    objc_msgSend(v33, "setBeginTime:", v3 + 0.7);
    objc_msgSend(v33, "setDuration:", 1.07);
    objc_msgSend(v33, "setValues:", &unk_1E8E89490);
    LODWORD(v40) = 0;
    LODWORD(v41) = 0;
    LODWORD(v42) = 1.0;
    LODWORD(v43) = 1042536202;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v40, v41, v43, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTimingFunction:", v44);

    -[CALayer addAnimation:forKey:](self->_splashRing3, "addAnimation:forKey:", v33, CFSTR("transform.scale.xy"));
    objc_msgSend(v33, "setBeginTime:", v3 + 0.64);
    objc_msgSend(v33, "setDuration:", 0.85);
    objc_msgSend(v33, "setValues:", &unk_1E8E894A8);
    LODWORD(v45) = 0;
    LODWORD(v46) = 0;
    LODWORD(v47) = 1.0;
    LODWORD(v48) = 1042536202;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v45, v46, v48, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTimingFunction:", v49);

    -[CALayer addAnimation:forKey:](self->_splashRing4, "addAnimation:forKey:", v33, CFSTR("transform.scale.xy"));
  }
  v85 = v33;
  v50 = (_QWORD *)MEMORY[0x1E0CD3048];
  if (self->_clearColorAnimationNeeded)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBeginTime:", v3 + 0.48);
    objc_msgSend(v51, "setKeyTimes:", &unk_1E8E894C0);
    objc_msgSend(v51, "setValues:", &unk_1E8E894D8);
    objc_msgSend(v51, "setDuration:", 0.1);
    objc_msgSend(v51, "setRemovedOnCompletion:", 0);
    objc_msgSend(v51, "setFillMode:", v5);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTimingFunction:", v52);

    -[CABackdropLayer addAnimation:forKey:](self->_trackRingBlurBackdropLayer, "addAnimation:forKey:", v51, CFSTR("opacity"));
  }
  v53 = 0x1E0C99000;
  if (!-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setBeginTime:", v3 + 0.6);
    objc_msgSend(v54, "setKeyTimes:", &unk_1E8E894F0);
    objc_msgSend(v54, "setValues:", &unk_1E8E89508);
    objc_msgSend(v54, "setDuration:", 0.18);
    objc_msgSend(v54, "setRemovedOnCompletion:", 0);
    objc_msgSend(v54, "setFillMode:", v87);
    LODWORD(v55) = 1053944709;
    LODWORD(v56) = 1053609165;
    LODWORD(v57) = 0;
    LODWORD(v58) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v55, v57, v56, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTimingFunction:", v59);

    -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v54, CFSTR("transform.scale.xy"));
    if (self->_clearColorAnimationNeeded)
      -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v54, CFSTR("transform.scale.xy"));
    -[CSMagSafeAccessoryView configuration](self, "configuration");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "ring");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "lineWidth");
    v63 = v62;

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBeginTime:", v3 + 0.14);
    objc_msgSend(v64, "setKeyTimes:", &unk_1E8E89520);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 80.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v65;
    v91[1] = &unk_1E8E87A90;
    v91[2] = &unk_1E8E87AA0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 4);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setValues:", v67);

    objc_msgSend(v64, "setDuration:", 1.34);
    objc_msgSend(v64, "setRemovedOnCompletion:", 0);
    objc_msgSend(v64, "setFillMode:", v87);
    LODWORD(v68) = 1036831949;
    LODWORD(v69) = 0;
    LODWORD(v70) = 1.0;
    LODWORD(v71) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v69, v68, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v72;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v73;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v86);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 3);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setTimingFunctions:", v75);

    -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v64, CFSTR("lineWidth"));
    if (self->_clearColorAnimationNeeded)
      -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v64, CFSTR("lineWidth"));

    v53 = 0x1E0C99000uLL;
  }
  if (self->_clearColorAnimationNeeded)
    v76 = 0.2;
  else
    v76 = 1.0;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setBeginTime:", v3 + 0.63);
  objc_msgSend(v77, "setKeyTimes:", &unk_1E8E89538);
  v89[0] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v78;
  objc_msgSend(*(id *)(v53 + 3360), "arrayWithObjects:count:", v89, 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setValues:", v79);

  objc_msgSend(v77, "setDuration:", 0.06);
  objc_msgSend(v77, "setRemovedOnCompletion:", 0);
  objc_msgSend(v77, "setFillMode:", v87);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v86);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setTimingFunction:", v80);

  -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v77, CFSTR("opacity"));
  if (self->_clearColorAnimationNeeded)
  {
    v88[0] = &unk_1E8E879D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v76 * 3.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v81;
    objc_msgSend(*(id *)(v53 + 3360), "arrayWithObjects:count:", v88, 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setValues:", v82);

    -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v77, CFSTR("opacity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorBrightness.inputAmount"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setKeyTimes:", &unk_1E8E89550);
    objc_msgSend(v83, "setValues:", &unk_1E8E89568);
    objc_msgSend(v83, "setDuration:", 2.6);
    objc_msgSend(v83, "setRemovedOnCompletion:", 0);
    objc_msgSend(v83, "setFillMode:", v87);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v86);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setTimingFunction:", v84);

    -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v83, CFSTR("filters.colorBrightness.inputAmount"));
  }

}

- (void)_dismissAnimation
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
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
  CABackdropLayer *backgroundRadiusBackdropLayer;
  void *v27;
  const __CFString *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v3 = CACurrentMediaTime();
  if (self->_clearColorAnimationNeeded)
    v4 = 0.2;
  else
    v4 = 1.0;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyTimes:", &unk_1E8E89580);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v6;
  v31[1] = &unk_1E8E879D0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", v7);

  objc_msgSend(v5, "setDuration:", 0.12);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  v8 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  v9 = *MEMORY[0x1E0CD3058];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v10);

  -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v5, CFSTR("fadeOut"));
  if (self->_clearColorAnimationNeeded)
  {
    -[CABackdropLayer addAnimation:forKey:](self->_trackRingBlurBackdropLayer, "addAnimation:forKey:", v5, CFSTR("fadeOut"));
    -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v5, CFSTR("fadeOut"));
  }
  if (!-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
  {
    -[CSMagSafeAccessoryView configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ring");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineWidth");
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setKeyTimes:", &unk_1E8E89598);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    v30[1] = &unk_1E8E879D0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValues:", v17);

    objc_msgSend(v15, "setDuration:", 0.12);
    objc_msgSend(v15, "setRemovedOnCompletion:", 0);
    objc_msgSend(v15, "setFillMode:", v8);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimingFunction:", v18);

    -[CSRingLayer addAnimation:forKey:](self->_trackRing, "addAnimation:forKey:", v15, CFSTR("lineWidthDismiss"));
    if (self->_clearColorAnimationNeeded)
      -[CSRingLayer addAnimation:forKey:](self->_trackRingBlurLayer, "addAnimation:forKey:", v15, CFSTR("lineWidthDismiss"));

  }
  if (-[CSMagSafeAccessoryView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setKeyTimes:", &unk_1E8E895B0);
    objc_msgSend(v19, "setValues:", &unk_1E8E895C8);
    objc_msgSend(v19, "setDuration:", 0.26);
    objc_msgSend(v19, "setRemovedOnCompletion:", 0);
    objc_msgSend(v19, "setFillMode:", v8);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v20);

    -[CABackdropLayer addAnimation:forKey:](self->_averageColorBackdropLayer, "addAnimation:forKey:", v19, CFSTR("opacity"));
    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v19, CFSTR("opacity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorBrightness.inputAmount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBeginTime:", v3 + 0.07);
    objc_msgSend(v19, "setKeyTimes:", &unk_1E8E895E0);
    objc_msgSend(v19, "setValues:", &unk_1E8E895F8);
    objc_msgSend(v19, "setDuration:", 0.26);
    objc_msgSend(v19, "setRemovedOnCompletion:", 0);
    objc_msgSend(v19, "setFillMode:", v8);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v21);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v19, CFSTR("brightnessDismiss"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.colorSaturate.inputAmount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBeginTime:", v3 + 0.07);
    objc_msgSend(v22, "setKeyTimes:", &unk_1E8E89610);
    objc_msgSend(v22, "setValues:", &unk_1E8E89628);
    objc_msgSend(v22, "setDuration:", 0.26);
    objc_msgSend(v22, "setRemovedOnCompletion:", 0);
    objc_msgSend(v22, "setFillMode:", v8);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimingFunction:", v23);

    -[CABackdropLayer addAnimation:forKey:](self->_backgroundBackdropLayer, "addAnimation:forKey:", v22, CFSTR("dismissSaturation"));
    if (-[CSMagSafeAccessoryView isReduceMotionEnabled](self, "isReduceMotionEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setKeyTimes:", &unk_1E8E89670);
      objc_msgSend(v24, "setValues:", &unk_1E8E89688);
      objc_msgSend(v24, "setDuration:", 0.26);
      objc_msgSend(v24, "setRemovedOnCompletion:", 0);
      objc_msgSend(v24, "setFillMode:", v8);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTimingFunction:", v25);

      backgroundRadiusBackdropLayer = self->_backgroundRadiusBackdropLayer;
      v27 = v24;
      v28 = CFSTR("opacity");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBeginTime:", v3 + 0.07);
      objc_msgSend(v24, "setKeyTimes:", &unk_1E8E89640);
      objc_msgSend(v24, "setValues:", &unk_1E8E89658);
      objc_msgSend(v24, "setDuration:", 0.26);
      objc_msgSend(v24, "setRemovedOnCompletion:", 0);
      objc_msgSend(v24, "setFillMode:", v8);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTimingFunction:", v29);

      backgroundRadiusBackdropLayer = self->_backgroundBackdropLayer;
      v28 = CFSTR("dismissGaussianBlur");
      v27 = v24;
    }
    -[CABackdropLayer addAnimation:forKey:](backgroundRadiusBackdropLayer, "addAnimation:forKey:", v27, v28);

  }
}

- (void)_runAnimationWithType:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[CSMagSafeAccessoryTrayView _dismissAnimation](self, "_dismissAnimation");
  }
  else if (!a3)
  {
    -[CSMagSafeAccessoryTrayView _presentAnimation](self, "_presentAnimation");
  }
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = a4;
  objc_msgSend(v6, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v7);

  -[CSMagSafeAccessoryTrayView _runAnimationWithType:](self, "_runAnimationWithType:", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (double)animationDurationBeforeDismissal
{
  return 2.6;
}

- (CABackdropLayer)averageColorBackdropLayer
{
  return self->_averageColorBackdropLayer;
}

- (void)setAverageColorBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_averageColorBackdropLayer, a3);
}

- (CABackdropLayer)backgroundRadiusBackdropLayer
{
  return self->_backgroundRadiusBackdropLayer;
}

- (void)setBackgroundRadiusBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundRadiusBackdropLayer, a3);
}

- (CABackdropLayer)backgroundBackdropLayer
{
  return self->_backgroundBackdropLayer;
}

- (void)setBackgroundBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBackdropLayer, a3);
}

- (CALayer)splashRing1
{
  return self->_splashRing1;
}

- (void)setSplashRing1:(id)a3
{
  objc_storeStrong((id *)&self->_splashRing1, a3);
}

- (CALayer)splashRing2
{
  return self->_splashRing2;
}

- (void)setSplashRing2:(id)a3
{
  objc_storeStrong((id *)&self->_splashRing2, a3);
}

- (CALayer)splashRing3
{
  return self->_splashRing3;
}

- (void)setSplashRing3:(id)a3
{
  objc_storeStrong((id *)&self->_splashRing3, a3);
}

- (CALayer)splashRing4
{
  return self->_splashRing4;
}

- (void)setSplashRing4:(id)a3
{
  objc_storeStrong((id *)&self->_splashRing4, a3);
}

- (CABackdropLayer)trackRingBlurBackdropLayer
{
  return self->_trackRingBlurBackdropLayer;
}

- (void)setTrackRingBlurBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackRingBlurBackdropLayer, a3);
}

- (CSRingLayer)trackRingBlurLayer
{
  return self->_trackRingBlurLayer;
}

- (void)setTrackRingBlurLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackRingBlurLayer, a3);
}

- (CSRingLayer)trackRing
{
  return self->_trackRing;
}

- (void)setTrackRing:(id)a3
{
  objc_storeStrong((id *)&self->_trackRing, a3);
}

- (BOOL)clearColorAnimationNeeded
{
  return self->_clearColorAnimationNeeded;
}

- (void)setClearColorAnimationNeeded:(BOOL)a3
{
  self->_clearColorAnimationNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackRing, 0);
  objc_storeStrong((id *)&self->_trackRingBlurLayer, 0);
  objc_storeStrong((id *)&self->_trackRingBlurBackdropLayer, 0);
  objc_storeStrong((id *)&self->_splashRing4, 0);
  objc_storeStrong((id *)&self->_splashRing3, 0);
  objc_storeStrong((id *)&self->_splashRing2, 0);
  objc_storeStrong((id *)&self->_splashRing1, 0);
  objc_storeStrong((id *)&self->_backgroundBackdropLayer, 0);
  objc_storeStrong((id *)&self->_backgroundRadiusBackdropLayer, 0);
  objc_storeStrong((id *)&self->_averageColorBackdropLayer, 0);
}

@end
