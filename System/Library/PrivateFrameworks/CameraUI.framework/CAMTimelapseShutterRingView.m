@implementation CAMTimelapseShutterRingView

- (CAMTimelapseShutterRingView)initWithSpec:(id *)a3
{
  CAMTimelapseShutterRingView *v4;
  CAMTimelapseShutterRingView *v5;
  __int128 v6;
  _OWORD v8[2];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMTimelapseShutterRingView;
  v4 = -[CAMTimelapseShutterRingView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var2;
    v8[0] = *(_OWORD *)&a3->var0;
    v8[1] = v6;
    -[CAMTimelapseShutterRingView _commonCAMTimelapseShutterRingViewInitializationWithSpec:](v4, "_commonCAMTimelapseShutterRingViewInitializationWithSpec:", v8);
  }
  return v5;
}

- (CAMTimelapseShutterRingView)initWithFrame:(CGRect)a3 spec:(id *)a4
{
  CAMTimelapseShutterRingView *v5;
  CAMTimelapseShutterRingView *v6;
  __int128 v7;
  _OWORD v9[2];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMTimelapseShutterRingView;
  v5 = -[CAMTimelapseShutterRingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = *(_OWORD *)&a4->var2;
    v9[0] = *(_OWORD *)&a4->var0;
    v9[1] = v7;
    -[CAMTimelapseShutterRingView _commonCAMTimelapseShutterRingViewInitializationWithSpec:](v5, "_commonCAMTimelapseShutterRingViewInitializationWithSpec:", v9);
  }
  return v6;
}

- (void)_commonCAMTimelapseShutterRingViewInitializationWithSpec:(id *)a3
{
  __int128 v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  CAReplicatorLayer *v12;
  CAReplicatorLayer *smallTickReplicatorLayer;
  CAReplicatorLayer *v14;
  CAReplicatorLayer *v15;
  CAReplicatorLayer *largeTickReplicatorLayer;
  CAReplicatorLayer *v17;
  CALayer *v18;
  CALayer *smallTickLayer;
  CALayer *v20;
  id v21;
  CALayer *v22;
  CALayer *largeTickLayer;
  CALayer *v24;
  id v25;
  CALayer *v26;
  CALayer *timerHandParentLayer;
  CALayer *v28;
  CALayer *timerHandLayer;
  CALayer *v30;
  id v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;

  -[CAMTimelapseShutterRingView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v5 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_spec.smallTickCount = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_spec.smallTickLength = v5;
  -[CAMTimelapseShutterRingView _rotationRadiansFromTickCount:](self, "_rotationRadiansFromTickCount:", self->_spec.smallTickCount);
  self->__smallTickRotationRadians = v6;
  -[CAMTimelapseShutterRingView _rotationRadiansFromTickCount:](self, "_rotationRadiansFromTickCount:", self->_spec.largeTickCount);
  self->__largeTickRotationRadians = v7;
  -[CAMTimelapseShutterRingView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  -[CAMTimelapseShutterRingView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v34, 0, sizeof(v34));
  CATransform3DMakeRotation(&v34, self->__smallTickRotationRadians, 0.0, 0.0, 1.0);
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeRotation(&v33, self->__largeTickRotationRadians, 0.0, 0.0, 1.0);
  v12 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x1E0CD2828]);
  smallTickReplicatorLayer = self->__smallTickReplicatorLayer;
  self->__smallTickReplicatorLayer = v12;

  objc_msgSend(v11, "addSublayer:", self->__smallTickReplicatorLayer);
  -[CAReplicatorLayer setInstanceCount:](self->__smallTickReplicatorLayer, "setInstanceCount:", self->_spec.smallTickCount + 1);
  v14 = self->__smallTickReplicatorLayer;
  v32 = v34;
  -[CAReplicatorLayer setInstanceTransform:](v14, "setInstanceTransform:", &v32);
  v15 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x1E0CD2828]);
  largeTickReplicatorLayer = self->__largeTickReplicatorLayer;
  self->__largeTickReplicatorLayer = v15;

  objc_msgSend(v11, "addSublayer:", self->__largeTickReplicatorLayer);
  -[CAReplicatorLayer setInstanceCount:](self->__largeTickReplicatorLayer, "setInstanceCount:", self->_spec.largeTickCount + 1);
  v17 = self->__largeTickReplicatorLayer;
  v32 = v33;
  -[CAReplicatorLayer setInstanceTransform:](v17, "setInstanceTransform:", &v32);
  v18 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  smallTickLayer = self->__smallTickLayer;
  self->__smallTickLayer = v18;

  -[CAReplicatorLayer addSublayer:](self->__smallTickReplicatorLayer, "addSublayer:", self->__smallTickLayer);
  v20 = self->__smallTickLayer;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v20, "setBackgroundColor:", objc_msgSend(v21, "CGColor"));

  -[CALayer setRasterizationScale:](self->__smallTickLayer, "setRasterizationScale:", v10);
  -[CALayer setAllowsEdgeAntialiasing:](self->__smallTickLayer, "setAllowsEdgeAntialiasing:", 1);
  v22 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  largeTickLayer = self->__largeTickLayer;
  self->__largeTickLayer = v22;

  -[CAReplicatorLayer addSublayer:](self->__largeTickReplicatorLayer, "addSublayer:", self->__largeTickLayer);
  v24 = self->__largeTickLayer;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v24, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

  -[CALayer setRasterizationScale:](self->__largeTickLayer, "setRasterizationScale:", v10);
  -[CALayer setAllowsEdgeAntialiasing:](self->__largeTickLayer, "setAllowsEdgeAntialiasing:", 1);
  v26 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  timerHandParentLayer = self->__timerHandParentLayer;
  self->__timerHandParentLayer = v26;

  objc_msgSend(v11, "addSublayer:", self->__timerHandParentLayer);
  v28 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  timerHandLayer = self->__timerHandLayer;
  self->__timerHandLayer = v28;

  -[CALayer addSublayer:](self->__timerHandParentLayer, "addSublayer:", self->__timerHandLayer);
  v30 = self->__timerHandLayer;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v30, "setBackgroundColor:", objc_msgSend(v31, "CGColor"));

  -[CALayer setRasterizationScale:](self->__timerHandLayer, "setRasterizationScale:", v10);
  -[CALayer setAllowsEdgeAntialiasing:](self->__timerHandLayer, "setAllowsEdgeAntialiasing:", 1);

}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3)
      -[CAMTimelapseShutterRingView _startAnimating](self, "_startAnimating");
    else
      -[CAMTimelapseShutterRingView _stopAnimating](self, "_stopAnimating");
  }
}

- (void)setSpec:(id *)a3
{
  $A80D443DDE06F88C0551F1F01FF73514 *p_spec;
  __int128 v5;
  double v6;
  double v7;

  p_spec = &self->_spec;
  if (self->_spec.smallTickCount != a3->var0
    || self->_spec.largeTickCount != a3->var1
    || self->_spec.smallTickLength != a3->var2
    || self->_spec.largeTickLength != a3->var3)
  {
    v5 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&p_spec->smallTickCount = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_spec.smallTickLength = v5;
    -[CAMTimelapseShutterRingView _rotationRadiansFromTickCount:](self, "_rotationRadiansFromTickCount:", p_spec->smallTickCount);
    self->__smallTickRotationRadians = v6;
    -[CAMTimelapseShutterRingView _rotationRadiansFromTickCount:](self, "_rotationRadiansFromTickCount:", p_spec->largeTickCount);
    self->__largeTickRotationRadians = v7;
  }
}

- (double)_rotationRadiansFromTickCount:(int64_t)a3
{
  return 360.0 / (double)a3 * 3.14159265 / 180.0;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  double smallTickLength;
  double v11;
  double v12;
  double v13;
  double v14;
  double largeTickLength;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  -[CAMTimelapseShutterRingView bounds](self, "bounds", a3);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MidY = CGRectGetMidY(v19);
  -[CAReplicatorLayer setBounds:](self->__smallTickReplicatorLayer, "setBounds:", x, y, width, height);
  -[CAReplicatorLayer setPosition:](self->__smallTickReplicatorLayer, "setPosition:", MidX, MidY);
  -[CAReplicatorLayer setBounds:](self->__largeTickReplicatorLayer, "setBounds:", x, y, width, height);
  -[CAReplicatorLayer setPosition:](self->__largeTickReplicatorLayer, "setPosition:", MidX, MidY);
  -[CALayer setBounds:](self->__timerHandParentLayer, "setBounds:", x, y, width, height);
  -[CALayer setPosition:](self->__timerHandParentLayer, "setPosition:", MidX, MidY);
  smallTickLength = self->_spec.smallTickLength;
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CAMTimelapseShutterRingView _tickRadiusForTickSize:ringSize:](self, "_tickRadiusForTickSize:ringSize:", 1.0, smallTickLength, width, height);
  v14 = MidY - v13;
  -[CALayer setBounds:](self->__smallTickLayer, "setBounds:", v11, v12, 1.0, smallTickLength);
  -[CALayer setPosition:](self->__smallTickLayer, "setPosition:", MidX, v14);
  largeTickLength = self->_spec.largeTickLength;
  -[CAMTimelapseShutterRingView _tickRadiusForTickSize:ringSize:](self, "_tickRadiusForTickSize:ringSize:", 1.0, largeTickLength, width, height);
  v17 = MidY - v16;
  -[CALayer setBounds:](self->__largeTickLayer, "setBounds:", v11, v12, 1.0, largeTickLength);
  -[CALayer setPosition:](self->__largeTickLayer, "setPosition:", MidX, v17);
  -[CALayer setBounds:](self->__timerHandLayer, "setBounds:", v11, v12, 1.0, largeTickLength);
  -[CALayer setPosition:](self->__timerHandLayer, "setPosition:", MidX, v17);
}

- (double)_tickRadiusForTickSize:(CGSize)a3 ringSize:(CGSize)a4
{
  double height;

  if (a4.width >= a4.height)
    height = a4.height;
  else
    height = a4.width;
  return height * 0.5 - a3.height * 0.5;
}

- (void)_startAnimating
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CAMTimelapseShutterRingView _removeStartAnimations](self, "_removeStartAnimations");
  -[CAMTimelapseShutterRingView _removeStopAnimations](self, "_removeStopAnimations");
  -[CAMTimelapseShutterRingView _addStartAnimations](self, "_addStartAnimations");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_stopAnimating
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CAMTimelapseShutterRingView _addStopAnimations](self, "_addStopAnimations");
  -[CAMTimelapseShutterRingView _removeStartAnimations](self, "_removeStartAnimations");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_removeStartAnimations
{
  -[CAReplicatorLayer removeAnimationForKey:](self->__smallTickReplicatorLayer, "removeAnimationForKey:", CFSTR("kStartAnimationsKey"));
  -[CALayer removeAnimationForKey:](self->__timerHandParentLayer, "removeAnimationForKey:", CFSTR("kStartAnimationsKey"));
}

- (void)_removeStopAnimations
{
  -[CAReplicatorLayer removeAnimationForKey:](self->__smallTickReplicatorLayer, "removeAnimationForKey:", CFSTR("kStopAnimationsKey"));
  -[CALayer removeAnimationForKey:](self->__timerHandParentLayer, "removeAnimationForKey:", CFSTR("kStopAnimationsKey"));
}

- (BOOL)_shouldUseAnimations
{
  return CFPreferencesGetAppBooleanValue(CFSTR("CAMDisableTimelapseShutterAnimation"), CFSTR("com.apple.mobileslideshow"), 0) == 0;
}

- (void)_addStartAnimations
{
  float v3;
  double v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[4];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  if (-[CAMTimelapseShutterRingView _shouldUseAnimations](self, "_shouldUseAnimations"))
  {
    UIAnimationDragCoefficient();
    v4 = v3 * 0.7;
    UIAnimationDragCoefficient();
    v6 = v5 * 12.0;
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("instanceCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_spec.smallTickCount + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v8);

    objc_msgSend(v7, "setToValue:", &unk_1EA3B10A8);
    v48 = v7;
    objc_msgSend(v7, "setDuration:", v4);
    v46 = *MEMORY[0x1E0CD3048];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v9);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("instanceCount"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = &unk_1EA3B10A8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_spec.smallTickCount + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v10;
    v53[2] = &unk_1EA3B10A8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setValues:", v11);

    objc_msgSend(v47, "setKeyTimes:", &unk_1EA3B3998);
    objc_msgSend(v47, "setBeginTime:", v4);
    objc_msgSend(v47, "setDuration:", v6);
    v12 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTimingFunction:", v13);

    LODWORD(v14) = 2139095040;
    objc_msgSend(v47, "setRepeatCount:", v14);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("instanceTransform.rotation.z"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
    objc_msgSend(v16, "numberWithDouble:", -v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v18;
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValues:", v21);

    v22 = v15;
    objc_msgSend(v15, "setKeyTimes:", &unk_1EA3B39B0);
    v23 = *MEMORY[0x1E0CD2930];
    objc_msgSend(v15, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
    objc_msgSend(v15, "setDuration:", v4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v15;
    objc_msgSend(v15, "setTimingFunction:", v24);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("instanceTransform.rotation.z"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v27;
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
    objc_msgSend(v28, "numberWithDouble:", -v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v30;
    v31 = (void *)MEMORY[0x1E0CB37E8];
    -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
    objc_msgSend(v31, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValues:", v33);

    objc_msgSend(v25, "setKeyTimes:", &unk_1EA3B39C8);
    objc_msgSend(v25, "setCalculationMode:", v23);
    objc_msgSend(v25, "setBeginTime:", v4);
    objc_msgSend(v25, "setDuration:", v6);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTimingFunction:", v34);

    LODWORD(v35) = 2139095040;
    objc_msgSend(v25, "setRepeatCount:", v35);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setValues:", &unk_1EA3B39E0);
    objc_msgSend(v36, "setKeyTimes:", &unk_1EA3B39F8);
    objc_msgSend(v36, "setCalculationMode:", *MEMORY[0x1E0CD2938]);
    objc_msgSend(v36, "setDuration:", v4);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v46);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTimingFunction:", v37);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValues:", &unk_1EA3B3A10);
    objc_msgSend(v38, "setKeyTimes:", &unk_1EA3B3A28);
    objc_msgSend(v38, "setBeginTime:", v4);
    objc_msgSend(v38, "setDuration:", v6 * 0.5);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTimingFunction:", v39);

    LODWORD(v40) = 2139095040;
    objc_msgSend(v38, "setRepeatCount:", v40);
    v50[0] = v22;
    v50[1] = v48;
    v50[2] = v25;
    v50[3] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAnimations:", v41);
    objc_msgSend(v42, "setDuration:", 6048000.0);
    v49[0] = v36;
    v49[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAnimations:", v43);
    objc_msgSend(v44, "setDuration:", 6048000.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[CAReplicatorLayer addAnimation:forKey:](self->__smallTickReplicatorLayer, "addAnimation:forKey:", v42, CFSTR("kStartAnimationsKey"));
    -[CALayer addAnimation:forKey:](self->__timerHandParentLayer, "addAnimation:forKey:", v44, CFSTR("kStartAnimationsKey"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (void)_addStopAnimations
{
  CAReplicatorLayer *v3;
  CAReplicatorLayer *smallTickReplicatorLayer;
  CAReplicatorLayer *v5;
  CALayer *v6;
  CALayer *timerHandParentLayer;
  CALayer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void **v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  CALayer *v54;
  CAReplicatorLayer *v55;
  _OWORD v56[8];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  _QWORD v74[2];
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  void *v80;
  _QWORD v81[2];
  _QWORD v82[4];

  v82[2] = *MEMORY[0x1E0C80C00];
  if (-[CAMTimelapseShutterRingView _shouldUseAnimations](self, "_shouldUseAnimations"))
  {
    -[CAReplicatorLayer presentationLayer](self->__smallTickReplicatorLayer, "presentationLayer");
    v3 = (CAReplicatorLayer *)objc_claimAutoreleasedReturnValue();
    smallTickReplicatorLayer = v3;
    if (!v3)
      smallTickReplicatorLayer = self->__smallTickReplicatorLayer;
    v5 = smallTickReplicatorLayer;

    -[CALayer presentationLayer](self->__timerHandParentLayer, "presentationLayer");
    v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
    timerHandParentLayer = v6;
    if (!v6)
      timerHandParentLayer = self->__timerHandParentLayer;
    v8 = timerHandParentLayer;

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    if (v5)
      -[CAReplicatorLayer instanceTransform](v5, "instanceTransform");
    v61 = v69;
    v62 = v70;
    v63 = v71;
    v64 = v72;
    v57 = v65;
    v58 = v66;
    v59 = v67;
    v60 = v68;
    -[CAMTimelapseShutterRingView _rotationZFromTransform:](self, "_rotationZFromTransform:", &v57);
    v10 = v9;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    if (v8)
      -[CALayer transform](v8, "transform");
    v54 = v8;
    v56[4] = v61;
    v56[5] = v62;
    v56[6] = v63;
    v56[7] = v64;
    v56[0] = v57;
    v56[1] = v58;
    v56[2] = v59;
    v56[3] = v60;
    -[CAMTimelapseShutterRingView _rotationZFromTransform:](self, "_rotationZFromTransform:", v56);
    if (v11 >= 0.0)
      v12 = v11;
    else
      v12 = v11 + 6.28318531;
    UIAnimationDragCoefficient();
    v14 = v13 * 0.4;
    v15 = 1.0 - v12 / 6.28318531;
    v55 = v5;
    if (v10 <= 0.0)
    {
      v16 = v14 * (v15 + 1.0);
      v79[0] = &unk_1EA3B10C0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 / (v15 + 1.0));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v26;
      v79[2] = &unk_1EA3B10A8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAReplicatorLayer instanceCount](v5, "instanceCount"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = v27;
      v78[1] = &unk_1EA3B10A8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_spec.smallTickCount + 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
      v29 = objc_claimAutoreleasedReturnValue();

      v19 = v29;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v30;
      v77[1] = &unk_1EA3B1B40;
      v77[2] = &unk_1EA3B1B50;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
      v52 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v31;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
      v23 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("instanceTransform.rotation.z"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0CB37E8];
      -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
      objc_msgSend(v33, "numberWithDouble:", -v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v35;
      v36 = (void *)MEMORY[0x1E0CB37E8];
      -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
      objc_msgSend(v36, "numberWithDouble:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v37;
      v38 = (void *)MEMORY[0x1E0CB37E8];
      -[CAMTimelapseShutterRingView _smallTickRotationRadians](self, "_smallTickRotationRadians");
      objc_msgSend(v38, "numberWithDouble:", -v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setValues:", v41);

      v21 = v52;
      objc_msgSend(v24, "setKeyTimes:", v25);
      objc_msgSend(v24, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
      objc_msgSend(v24, "setDuration:", v16);
      objc_msgSend(v24, "setTimingFunctions:", v23);
    }
    else
    {
      v16 = v14 * v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAReplicatorLayer instanceCount](v5, "instanceCount"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_spec.smallTickCount + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v82[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v20;
      v81[1] = &unk_1EA3B1B40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = 0;
      v25 = &unk_1EA3B3A40;
    }
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("instanceCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setValues:", v19);
    objc_msgSend(v42, "setKeyTimes:", v25);
    objc_msgSend(v42, "setDuration:", v16);
    objc_msgSend(v42, "setTimingFunctions:", v23);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValues:", v21);
    v53 = v25;
    objc_msgSend(v43, "setKeyTimes:", v25);
    objc_msgSend(v43, "setDuration:", v16);
    v44 = (void *)v23;
    objc_msgSend(v43, "setTimingFunctions:", v23);
    v45 = (void *)v21;
    if (v24)
    {
      v74[0] = v24;
      v74[1] = v42;
      v46 = (void *)MEMORY[0x1E0C99D20];
      v47 = (void **)v74;
      v48 = 2;
    }
    else
    {
      v73 = v42;
      v46 = (void *)MEMORY[0x1E0C99D20];
      v47 = &v73;
      v48 = 1;
    }
    objc_msgSend(v46, "arrayWithObjects:count:", v47, v48, v19);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAnimations:", v49);
    objc_msgSend(v50, "setDuration:", v16);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[CAReplicatorLayer addAnimation:forKey:](self->__smallTickReplicatorLayer, "addAnimation:forKey:", v50, CFSTR("kStopAnimationsKey"));
    -[CALayer addAnimation:forKey:](self->__timerHandParentLayer, "addAnimation:forKey:", v43, CFSTR("kStopAnimationsKey"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (double)_rotationZFromTransform:(CATransform3D *)a3
{
  return atan2(a3->m12, a3->m11);
}

- ($EA90F2AF3C0DC35AB2D8304CE3BCA89E)spec
{
  __int128 v3;

  v3 = *(_OWORD *)&self[15].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[15].var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (double)_smallTickRotationRadians
{
  return self->__smallTickRotationRadians;
}

- (double)_largeTickRotationRadians
{
  return self->__largeTickRotationRadians;
}

- (CALayer)_smallTickLayer
{
  return self->__smallTickLayer;
}

- (CALayer)_largeTickLayer
{
  return self->__largeTickLayer;
}

- (CAReplicatorLayer)_smallTickReplicatorLayer
{
  return self->__smallTickReplicatorLayer;
}

- (CAReplicatorLayer)_largeTickReplicatorLayer
{
  return self->__largeTickReplicatorLayer;
}

- (CALayer)_timerHandLayer
{
  return self->__timerHandLayer;
}

- (CALayer)_timerHandParentLayer
{
  return self->__timerHandParentLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timerHandParentLayer, 0);
  objc_storeStrong((id *)&self->__timerHandLayer, 0);
  objc_storeStrong((id *)&self->__largeTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->__smallTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->__largeTickLayer, 0);
  objc_storeStrong((id *)&self->__smallTickLayer, 0);
}

@end
