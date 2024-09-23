@implementation CSMagSafeAccessorySleeveView

- (CSMagSafeAccessorySleeveView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CSMagSafeAccessorySleeveView *v7;
  CSMagSafeAccessorySleeveView *v8;
  void *v9;
  uint64_t v10;
  CALayer *backgroundColorLayer;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIImageView *chargingBoltImageView;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CSMagSafeAccessorySleeveView;
  v7 = -[CSMagSafeAccessoryView initWithFrame:](&v21, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[CSMagSafeAccessorySleeveView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    v10 = objc_opt_new();
    backgroundColorLayer = v8->_backgroundColorLayer;
    v8->_backgroundColorLayer = (CALayer *)v10;

    -[CALayer setFrame:](v8->_backgroundColorLayer, "setFrame:", x, y, width, height);
    LODWORD(v12) = 0;
    -[CALayer setOpacity:](v8->_backgroundColorLayer, "setOpacity:", v12);
    -[CALayer setAllowsGroupOpacity:](v8->_backgroundColorLayer, "setAllowsGroupOpacity:", 1);
    -[CALayer setAllowsGroupBlending:](v8->_backgroundColorLayer, "setAllowsGroupBlending:", 1);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("bolt.fill"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_flatImageWithColor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 7, 1, 32.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithRenderingMode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v17);
    chargingBoltImageView = v8->_chargingBoltImageView;
    v8->_chargingBoltImageView = (UIImageView *)v18;

    -[UIImageView setPreferredSymbolConfiguration:](v8->_chargingBoltImageView, "setPreferredSymbolConfiguration:", v16);
    v8->_charging = 0;

  }
  return v8;
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
  void *v13;
  void *v14;
  CALayer *backgroundColorLayer;
  void *v16;
  CALayer *v17;
  void *v18;
  CALayer *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CSMagSafeAccessorySleeveView;
  -[CSMagSafeAccessoryView layoutSubviews](&v21, sel_layoutSubviews);
  -[CSMagSafeAccessorySleeveView updateDateViews](self, "updateDateViews");
  -[CSMagSafeAccessorySleeveView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_charging)
  {
    -[UIImageView sizeToFit](self->_chargingBoltImageView, "sizeToFit");
    -[UIImageView frame](self->_chargingBoltImageView, "frame");
    -[UIImageView setFrame:](self->_chargingBoltImageView, "setFrame:", self->_visibleWindowFrame.origin.x + 15.0, self->_visibleWindowFrame.origin.y + (self->_visibleWindowFrame.size.height - v12) * 0.5);
    CSMagSafePowerStatusForBatteryState(-[BCBatteryDevice isLowPowerModeActive](self->_batteryDevice, "isLowPowerModeActive"), -[BCBatteryDevice isCharging](self->_batteryDevice, "isCharging"), (double)-[BCBatteryDevice percentCharge](self->_batteryDevice, "percentCharge"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CSRingColorForPowerStatus(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_chargingBoltImageView, "setTintColor:", v14);

  }
  -[CALayer setBounds:](self->_backgroundColorLayer, "setBounds:", v5, v7, v9, v11);
  backgroundColorLayer = self->_backgroundColorLayer;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E70]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setCompositingFilter:](backgroundColorLayer, "setCompositingFilter:", v16);

  v17 = self->_backgroundColorLayer;
  -[CALayer bounds](v17, "bounds");
  -[CSMagSafeAccessorySleeveView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  UIRectGetCenter();
  -[CALayer setPosition:](v17, "setPosition:");
  -[CSMagSafeAccessorySleeveView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_backgroundColorLayer;
  -[SBFLockScreenDateView layer](self->_dateView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertSublayer:below:", v19, v20);

}

- (void)updateDateViews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MidY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SBFLockScreenDateView *dateView;
  SBFLockScreenDateView *secondaryDateView;
  SBFLockScreenDateView *v23;
  void *v24;
  double v25;
  id v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x1E0D1BCB0], "tightFrameForElements:", 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  MidY = CGRectGetMidY(self->_visibleWindowFrame);
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v12 = MidY - CGRectGetMidY(v27);
  -[CSMagSafeAccessorySleeveView bounds](self, "bounds");
  v16 = v13;
  v17 = v14;
  v18 = v15;
  v20 = v12 + v19;
  dateView = self->_dateView;
  if (dateView)
  {
    -[SBFLockScreenDateView setFrame:](dateView, "setFrame:", v13, v20, v14, v15);
    -[SBFLockScreenDateView setSubtitleHidden:](self->_dateView, "setSubtitleHidden:", 1);
  }
  secondaryDateView = self->_secondaryDateView;
  if (secondaryDateView)
  {
    -[SBFLockScreenDateView setFrame:](secondaryDateView, "setFrame:", v16, v20, v17, v18);
    -[SBFLockScreenDateView setSubtitleHidden:](self->_secondaryDateView, "setSubtitleHidden:", 1);
    v23 = self->_secondaryDateView;
    -[CSMagSafeAccessoryView legibilitySettings](self, "legibilitySettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFLockScreenDateView setLegibilitySettings:](v23, "setLegibilitySettings:", v24);

    -[SBFLockScreenDateView layer](self->_secondaryDateView, "layer");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 0;
    objc_msgSend(v26, "setOpacity:", v25);

  }
}

- (void)setVisibleWindowFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleWindowFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleWindowFrame = &self->_visibleWindowFrame;
  if (!CGRectEqualToRect(self->_visibleWindowFrame, a3))
  {
    p_visibleWindowFrame->origin.x = x;
    p_visibleWindowFrame->origin.y = y;
    p_visibleWindowFrame->size.width = width;
    p_visibleWindowFrame->size.height = height;
    -[CSMagSafeAccessorySleeveView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDateView:(id)a3
{
  SBFLockScreenDateView *v5;
  SBFLockScreenDateView *dateView;
  SBFLockScreenDateView *v7;

  v5 = (SBFLockScreenDateView *)a3;
  dateView = self->_dateView;
  if (dateView != v5)
  {
    v7 = v5;
    if (dateView)
      -[SBFLockScreenDateView removeFromSuperview](dateView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_dateView, a3);
    -[CSMagSafeAccessorySleeveView addSubview:](self, "addSubview:", self->_dateView);
    -[CSMagSafeAccessorySleeveView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setCharging:(BOOL)a3
{
  CSBatteryChargingView *batteryChargingView;
  uint64_t v5;
  CSBatteryChargingView *v6;
  CSBatteryChargingView *v7;
  CSBatteryChargingView *v8;

  if (self->_charging != a3)
  {
    self->_charging = a3;
    batteryChargingView = self->_batteryChargingView;
    v5 = objc_opt_class();
    v6 = batteryChargingView;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    -[CSBatteryChargingView updateForInternalBatteryDevice:](v8, "updateForInternalBatteryDevice:", self->_batteryDevice);
    if (self->_charging)
      -[CSMagSafeAccessorySleeveView addSubview:](self, "addSubview:", self->_chargingBoltImageView);
    else
      -[UIImageView removeFromSuperview](self->_chargingBoltImageView, "removeFromSuperview");
    -[CSMagSafeAccessorySleeveView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)transitionChargingViewVisible:(BOOL)a3 chargingInfo:(id)a4
{
  _BOOL4 v4;
  SBFLockScreenDateView *dateView;
  BCBatteryDevice *v7;
  BCBatteryDevice *batteryDevice;
  void *v9;
  CSBatteryChargingView *batteryChargingView;
  CSBatteryChargingView *v11;
  SBFLockScreenDateView *v12;
  id v13;

  v4 = a3;
  v13 = a4;
  if (v4)
  {
    dateView = self->_dateView;
    if (dateView)
    {
      -[SBFLockScreenDateView setHidden:](dateView, "setHidden:", 1);
      -[SBFLockScreenDateView setHidden:](self->_secondaryDateView, "setHidden:", 1);
    }
    -[UIImageView setHidden:](self->_chargingBoltImageView, "setHidden:", 1);
    objc_msgSend(v13, "internalBatteryDevice");
    v7 = (BCBatteryDevice *)objc_claimAutoreleasedReturnValue();
    batteryDevice = self->_batteryDevice;
    self->_batteryDevice = v7;

    -[CSMagSafeAccessorySleeveView _batteryChargingViewWithChargingInfo:](self, "_batteryChargingViewWithChargingInfo:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSMagSafeAccessorySleeveView addSubview:](self, "addSubview:", v9);
  }
  else
  {
    batteryChargingView = self->_batteryChargingView;
    if (batteryChargingView)
    {
      -[CSBatteryChargingView removeFromSuperview](batteryChargingView, "removeFromSuperview");
      v11 = self->_batteryChargingView;
      self->_batteryChargingView = 0;

    }
    v12 = self->_dateView;
    if (v12)
    {
      -[SBFLockScreenDateView setHidden:](v12, "setHidden:", 0);
      -[SBFLockScreenDateView setHidden:](self->_secondaryDateView, "setHidden:", 0);
    }
    -[UIImageView setHidden:](self->_chargingBoltImageView, "setHidden:", 0);
    v9 = self->_batteryDevice;
    self->_batteryDevice = 0;
  }

  -[CSMagSafeAccessorySleeveView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)_chargingViewFrame
{
  double height;
  double width;
  double v4;
  double v5;
  double v6;
  CGRect result;

  width = self->_visibleWindowFrame.size.width;
  height = self->_visibleWindowFrame.size.height;
  v4 = self->_visibleWindowFrame.origin.x + (width - width) * 0.5;
  v5 = height / 3.0;
  v6 = self->_visibleWindowFrame.origin.y + (height - height / 3.0) * 0.5;
  result.size.height = v5;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (id)_batteryChargingViewWithChargingInfo:(id)a3
{
  CSBatteryChargingView *batteryChargingView;
  id v5;
  void *v6;
  CSBatteryChargingView *v7;
  CSBatteryChargingView *v8;
  CSBatteryChargingView *v9;
  CSBatteryChargingView *v10;
  CSBatteryChargingView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  batteryChargingView = self->_batteryChargingView;
  if (!batteryChargingView)
  {
    v5 = a3;
    if (objc_msgSend(v5, "isChargingWithInternalWirelessAccessory"))
    {
      +[CSMagSafeAccessoryConfiguration staticViewConfiguration](CSMagSafeAccessoryConfiguration, "staticViewConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSBatteryChargingView batteryChargingRingViewWithConfiguration:](CSBatteryChargingView, "batteryChargingRingViewWithConfiguration:", v6);
      v7 = (CSBatteryChargingView *)objc_claimAutoreleasedReturnValue();
      v8 = self->_batteryChargingView;
      self->_batteryChargingView = v7;

    }
    else
    {
      +[CSBatteryChargingView horizontalBatteryChargingViewForBatterySize:includeBoltImage:](CSBatteryChargingView, "horizontalBatteryChargingViewForBatterySize:includeBoltImage:", 1, 50.0, 20.0);
      v9 = (CSBatteryChargingView *)objc_claimAutoreleasedReturnValue();
      v6 = self->_batteryChargingView;
      self->_batteryChargingView = v9;
    }

    v10 = self->_batteryChargingView;
    -[CSMagSafeAccessorySleeveView _chargingViewFrame](self, "_chargingViewFrame");
    -[CSBatteryChargingView setFrame:](v10, "setFrame:");
    -[CSBatteryChargingView setBatteryVisible:](self->_batteryChargingView, "setBatteryVisible:", 1);
    v11 = self->_batteryChargingView;
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryChargingView setLegibilitySettings:](v11, "setLegibilitySettings:", v12);

    -[CSBatteryChargingView setAutoresizingMask:](self->_batteryChargingView, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "internalBatteryDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "percentCharge");
    objc_msgSend(MEMORY[0x1E0D01B18], "localizedBatteryDetailTextForBatteryLevel:", (double)v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryChargingView setPrimaryBatteryText:forBattery:](self->_batteryChargingView, "setPrimaryBatteryText:forBattery:", v15, v13);

    batteryChargingView = self->_batteryChargingView;
  }
  return batteryChargingView;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  CALayer *backgroundColorLayer;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSMagSafeAccessorySleeveView;
  v4 = a3;
  -[CSMagSafeAccessoryView setLegibilitySettings:](&v8, sel_setLegibilitySettings_, v4);
  backgroundColorLayer = self->_backgroundColorLayer;
  objc_msgSend(v4, "secondaryColor", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  -[CALayer setBackgroundColor:](backgroundColorLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

}

- (void)setSecondaryDateView:(id)a3
{
  SBFLockScreenDateView *v5;
  SBFLockScreenDateView *secondaryDateView;
  SBFLockScreenDateView *v7;

  v5 = (SBFLockScreenDateView *)a3;
  secondaryDateView = self->_secondaryDateView;
  if (secondaryDateView != v5)
  {
    v7 = v5;
    if (secondaryDateView)
      -[SBFLockScreenDateView removeFromSuperview](secondaryDateView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_secondaryDateView, a3);
    -[CSMagSafeAccessorySleeveView addSubview:](self, "addSubview:", self->_secondaryDateView);
    -[CSMagSafeAccessorySleeveView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)_presentAnimation
{
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = CACurrentMediaTime();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBeginTime:", v3 + 0.0);
  objc_msgSend(v4, "setKeyTimes:", &unk_1E8E89F40);
  objc_msgSend(v4, "setValues:", &unk_1E8E89F58);
  objc_msgSend(v4, "setDuration:", 1.44);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  v5 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v7 = *MEMORY[0x1E0CD3058];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunctions:", v9);

  -[CALayer addAnimation:forKey:](self->_backgroundColorLayer, "addAnimation:forKey:", v4, CFSTR("opacity"));
  v10 = v3 + 0.34;
  objc_msgSend(v4, "setBeginTime:", v10);
  objc_msgSend(v4, "setKeyTimes:", &unk_1E8E89F70);
  objc_msgSend(v4, "setValues:", &unk_1E8E89F88);
  objc_msgSend(v4, "setDuration:", 0.88);
  -[SBFLockScreenDateView layer](self->_secondaryDateView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v4, CFSTR("opacity"));

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBeginTime:", v10);
  objc_msgSend(v12, "setKeyTimes:", &unk_1E8E89FA0);
  objc_msgSend(v12, "setValues:", &unk_1E8E89FB8);
  objc_msgSend(v12, "setRemovedOnCompletion:", 0);
  objc_msgSend(v12, "setFillMode:", v5);
  objc_msgSend(v12, "setDuration:", 0.88);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v13);

  -[SBFLockScreenDateView layer](self->_dateView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v12, CFSTR("opacity"));

}

- (void)_dismissAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyTimes:", &unk_1E8E89FD0);
  objc_msgSend(v7, "setValues:", &unk_1E8E89FE8);
  objc_msgSend(v7, "setDuration:", 0.44);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v3);

  -[CALayer addAnimation:forKey:](self->_backgroundColorLayer, "addAnimation:forKey:", v7, CFSTR("opacity"));
  -[SBFLockScreenDateView layer](self->_secondaryDateView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", v7, CFSTR("fadeOut"));

  v5 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setValues:", &unk_1E8E8A000);
  -[SBFLockScreenDateView layer](self->_dateView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v5, CFSTR("fadeIn"));

}

- (void)_runAnimationWithType:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[CSMagSafeAccessorySleeveView _dismissAnimation](self, "_dismissAnimation");
  }
  else if (!a3)
  {
    -[CSMagSafeAccessorySleeveView _presentAnimation](self, "_presentAnimation");
  }
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v7 = (void *)MEMORY[0x1E0CD28B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CSMagSafeAccessorySleeveView_performAnimation_completionHandler___block_invoke;
  v9[3] = &unk_1E8E2DFD8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "setCompletionBlock:", v9);
  -[CSMagSafeAccessorySleeveView _runAnimationWithType:](self, "_runAnimationWithType:", a3);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __67__CSMagSafeAccessorySleeveView_performAnimation_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)animationDurationBeforeDismissal
{
  return 4.8;
}

- (SBFLockScreenDateView)dateView
{
  return self->_dateView;
}

- (SBFLockScreenDateView)secondaryDateView
{
  return self->_secondaryDateView;
}

- (CGRect)visibleWindowFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleWindowFrame.origin.x;
  y = self->_visibleWindowFrame.origin.y;
  width = self->_visibleWindowFrame.size.width;
  height = self->_visibleWindowFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)charging
{
  return self->_charging;
}

- (CALayer)backgroundColorLayer
{
  return self->_backgroundColorLayer;
}

- (void)setBackgroundColorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorLayer, a3);
}

- (CSBatteryChargingView)batteryChargingView
{
  return self->_batteryChargingView;
}

- (void)setBatteryChargingView:(id)a3
{
  objc_storeStrong((id *)&self->_batteryChargingView, a3);
}

- (UIImageView)chargingBoltImageView
{
  return self->_chargingBoltImageView;
}

- (void)setChargingBoltImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chargingBoltImageView, a3);
}

- (BCBatteryDevice)batteryDevice
{
  return self->_batteryDevice;
}

- (void)setBatteryDevice:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDevice, 0);
  objc_storeStrong((id *)&self->_chargingBoltImageView, 0);
  objc_storeStrong((id *)&self->_batteryChargingView, 0);
  objc_storeStrong((id *)&self->_backgroundColorLayer, 0);
  objc_storeStrong((id *)&self->_secondaryDateView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
}

@end
