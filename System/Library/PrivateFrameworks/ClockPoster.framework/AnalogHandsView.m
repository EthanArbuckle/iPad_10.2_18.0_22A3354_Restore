@implementation AnalogHandsView

- (AnalogHandsView)initWithFixedSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  double v7;
  void *v8;
  AnalogHandsView *v9;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  UIRoundToScale();
  self->_scaleFactor = v7;

  self->_size.width = width;
  self->_size.height = height;
  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)AnalogHandsView;
  v9 = -[CLKUIAnalogHandsView initForDevice:](&v11, sel_initForDevice_, v8);

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double scaleFactor;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  v9.receiver = self;
  v9.super_class = (Class)AnalogHandsView;
  -[CLKUIAnalogHandsView sizeThatFits:](&v9, sel_sizeThatFits_, a3.width, a3.height);
  scaleFactor = self->_scaleFactor;
  v6 = v5 * scaleFactor;
  v8 = v7 * scaleFactor;
  result.height = v8;
  result.width = v6;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AnalogHandsView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOverrideDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[CLKUIAnalogHandsView setFrozen:](self, "setFrozen:", 1);
    -[AnalogHandsView _stopHandAnimation](self, "_stopHandAnimation");
    -[CLKUIAnalogHandsView calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CLKHourMinuteSecondAnglesForTime();

    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setZRotation:", 0.0);

  }
  else
  {
    -[CLKUIAnalogHandsView setFrozen:](self, "setFrozen:", 0);
    -[AnalogHandsView _startNewSecondHandAnimation](self, "_startNewSecondHandAnimation");
  }

}

- (void)_startNewSecondHandAnimation
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 2139095040;
  objc_msgSend(v9, "setRepeatCount:", v3);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v4);

  objc_msgSend(v9, "setByValue:", &unk_2509CB2A8);
  objc_msgSend(v9, "setDuration:", *MEMORY[0x24BE16EA8]);
  -[CLKUIAnalogHandsView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalogHandsView _timeAnimationFramesPerSecondForDevice:](self, "_timeAnimationFramesPerSecondForDevice:", v5);
  objc_msgSend(v9, "setFrameInterval:", 1.0 / v6);

  objc_msgSend(v9, "setDiscretizesTime:", 1);
  -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("time"));

}

- (void)_stopHandAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("time"));

  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("time"));

  -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("time"));

}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return 30.0;
}

- (id)hourHandConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  double scaleFactor;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v3 = (void *)MEMORY[0x24BE16F18];
  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultHourConfigurationForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  scaleFactor = self->_scaleFactor;
  objc_msgSend(v5, "handWidth");
  objc_msgSend(v5, "setHandWidth:", v7 * (scaleFactor * 0.8));
  objc_msgSend(v5, "pegRadius");
  objc_msgSend(v5, "setPegRadius:", scaleFactor * v8);
  objc_msgSend(v5, "pegStrokeWidth");
  objc_msgSend(v5, "setPegStrokeWidth:", scaleFactor * v9);
  objc_msgSend(v5, "armWidth");
  objc_msgSend(v5, "setArmWidth:", scaleFactor * v10);
  objc_msgSend(v5, "armLength");
  objc_msgSend(v5, "setArmLength:", scaleFactor * v11);
  objc_msgSend(v5, "dropShadowRadius");
  objc_msgSend(v5, "setDropShadowRadius:", scaleFactor * v12);
  objc_msgSend(v5, "radialShadowRadius");
  objc_msgSend(v5, "setRadialShadowRadius:", scaleFactor * v13);
  objc_msgSend(v5, "directionalShadowOffset");
  v15 = scaleFactor * v14;
  objc_msgSend(v5, "directionalShadowOffset");
  objc_msgSend(v5, "setDirectionalShadowOffset:", v15, scaleFactor * v16);
  -[AnalogHandsView secondHandConfiguration](self, "secondHandConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handLength");
  v19 = v18;
  objc_msgSend(v5, "armLength");
  v21 = -(v20 - v19 * 0.54);
  objc_msgSend(v5, "pegRadius");
  v23 = v21 + v22 * -0.5;
  objc_msgSend(v5, "pegStrokeWidth");
  objc_msgSend(v5, "setHandLength:", v23 - v24);

  objc_msgSend(v5, "cp_handConfigurationRoundedToScaleOfView:", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)minuteHandConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  double scaleFactor;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v3 = (void *)MEMORY[0x24BE16F18];
  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultMinuteConfigurationForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  scaleFactor = self->_scaleFactor;
  objc_msgSend(v5, "handWidth");
  objc_msgSend(v5, "setHandWidth:", v7 * (scaleFactor * 0.8));
  objc_msgSend(v5, "pegRadius");
  objc_msgSend(v5, "setPegRadius:", scaleFactor * v8);
  objc_msgSend(v5, "pegStrokeWidth");
  objc_msgSend(v5, "setPegStrokeWidth:", scaleFactor * v9);
  objc_msgSend(v5, "armWidth");
  objc_msgSend(v5, "setArmWidth:", scaleFactor * v10);
  objc_msgSend(v5, "armLength");
  objc_msgSend(v5, "setArmLength:", scaleFactor * v11);
  objc_msgSend(v5, "dropShadowRadius");
  objc_msgSend(v5, "setDropShadowRadius:", scaleFactor * v12);
  objc_msgSend(v5, "radialShadowRadius");
  objc_msgSend(v5, "setRadialShadowRadius:", scaleFactor * v13);
  objc_msgSend(v5, "directionalShadowOffset");
  v15 = scaleFactor * v14;
  objc_msgSend(v5, "directionalShadowOffset");
  objc_msgSend(v5, "setDirectionalShadowOffset:", v15, scaleFactor * v16);
  -[AnalogHandsView secondHandConfiguration](self, "secondHandConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handLength");
  v19 = v18;
  objc_msgSend(v5, "armLength");
  v21 = -(v20 - v19 * 0.92);
  objc_msgSend(v5, "pegRadius");
  v23 = v21 + v22 * -0.5;
  objc_msgSend(v5, "pegStrokeWidth");
  objc_msgSend(v5, "setHandLength:", v23 - v24);

  objc_msgSend(v5, "cp_handConfigurationRoundedToScaleOfView:", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)secondHandConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  double scaleFactor;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v3 = (void *)MEMORY[0x24BE16F18];
  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSecondConfigurationForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  scaleFactor = self->_scaleFactor;
  objc_msgSend(v5, "handWidth");
  objc_msgSend(v5, "setHandWidth:", scaleFactor * v7);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  UIRoundToScale();
  objc_msgSend(v5, "setHandLength:");

  objc_msgSend(v5, "pegRadius");
  objc_msgSend(v5, "setPegRadius:", scaleFactor * 1.3333 * v9);
  objc_msgSend(v5, "pegStrokeWidth");
  objc_msgSend(v5, "setPegStrokeWidth:", scaleFactor / 1.3333 * v10);
  objc_msgSend(v5, "tailLength");
  objc_msgSend(v5, "setTailLength:", scaleFactor * v11);
  objc_msgSend(v5, "dropShadowRadius");
  objc_msgSend(v5, "setDropShadowRadius:", scaleFactor * v12);
  objc_msgSend(v5, "radialShadowRadius");
  objc_msgSend(v5, "setRadialShadowRadius:", scaleFactor * v13);
  objc_msgSend(v5, "setRadialShadowOpacity:", 0.15);
  objc_msgSend(v5, "directionalShadowOffset");
  v15 = scaleFactor * v14;
  objc_msgSend(v5, "directionalShadowOffset");
  objc_msgSend(v5, "setDirectionalShadowOffset:", v15, scaleFactor * v16);
  objc_msgSend(v5, "cp_handConfigurationRoundedToScaleOfView:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
