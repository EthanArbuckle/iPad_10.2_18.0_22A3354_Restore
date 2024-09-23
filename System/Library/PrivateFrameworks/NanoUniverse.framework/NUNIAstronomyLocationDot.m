@implementation NUNIAstronomyLocationDot

- (NUNIAstronomyLocationDot)init
{
  NUNIAstronomyLocationDotConfiguration *v3;
  NUNIAstronomyLocationDot *v4;

  v3 = objc_alloc_init(NUNIAstronomyLocationDotConfiguration);
  v4 = -[NUNIAstronomyLocationDot initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (NUNIAstronomyLocationDot)initWithConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  NUNIAstronomyLocationDot *v7;

  v4 = a3;
  objc_msgSend(v4, "defaultSize");
  v7 = -[NUNIAstronomyLocationDot initWithFrame:configuration:](self, "initWithFrame:configuration:", v4, 0.0, 0.0, v5, v6);

  return v7;
}

- (NUNIAstronomyLocationDot)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NUNIAstronomyLocationDot *v11;
  NUNIAstronomyLocationDot *v12;
  id *p_configuration;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIImageView *v19;
  UIImageView *innerDotImageView;
  id v21;
  uint64_t v22;
  UIView *outerDot;
  void *v24;
  objc_super v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NUNIAstronomyLocationDot;
  v11 = -[NUNIAstronomyLocationDot initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_configuration = (id *)&v11->_configuration;
    objc_storeStrong((id *)&v11->_configuration, a4);
    +[NUNIAstronomyLocationDot _defaultColor](NUNIAstronomyLocationDot, "_defaultColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_configuration, "defaultOuterDotDiameter");
    v12->_outerDotDiameter = v15;
    objc_msgSend(*p_configuration, "defaultInnerDotDiameter");
    v12->_innerDotDiameter = v16;
    +[NUNIAstronomyLocationDot defaultPulseDuration](NUNIAstronomyLocationDot, "defaultPulseDuration");
    v12->_pulseDuration = v17;
    +[NUNIAstronomyLocationDot defaultPulseAlphaDelay](NUNIAstronomyLocationDot, "defaultPulseAlphaDelay");
    v12->_pulseAlphaDelay = v18;
    v19 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    innerDotImageView = v12->_innerDotImageView;
    v12->_innerDotImageView = v19;

    v21 = objc_alloc(MEMORY[0x24BEBDB00]);
    v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    outerDot = v12->_outerDot;
    v12->_outerDot = (UIView *)v22;

    -[UIView layer](v12->_outerDot, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAnchorPoint:", 0.5, 0.5);

    -[NUNIAstronomyLocationDot setOuterDotColor:](v12, "setOuterDotColor:", v14);
    -[NUNIAstronomyLocationDot setInnerDotColor:](v12, "setInnerDotColor:", v14);
    -[NUNIAstronomyLocationDot addSubview:](v12, "addSubview:", v12->_outerDot);
    -[NUNIAstronomyLocationDot addSubview:](v12, "addSubview:", v12->_innerDotImageView);

  }
  return v12;
}

- (void)_generateInnerDotImage
{
  double v3;
  CGFloat v4;
  double innerDotDiameter;
  CGFloat v6;
  CGContext *CurrentContext;
  id v8;
  CGColor *v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  id v20;
  CGSize v21;
  CGSize v22;
  CGRect v23;

  -[NUNIAstronomyLocationDot screenScale](self, "screenScale");
  v4 = v3;
  innerDotDiameter = self->_innerDotDiameter;
  v6 = ceil(innerDotDiameter + 1.73205078 + innerDotDiameter * 1.05 * 2.0);
  v21.width = v6;
  v21.height = v6;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v4);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");
  v22.width = 0.50000006;
  v22.height = 0.866025388;
  CGContextSetShadowWithColor(CurrentContext, v22, innerDotDiameter * 1.05, v9);

  -[NUNIAstronomyLocationDotConfiguration screenScale](self->_configuration, "screenScale");
  v19 = v10;
  UIRectCenteredIntegralRectScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  CGContextSetFillColorWithColor(CurrentContext, -[UIColor CGColor](self->_innerDotColor, "CGColor", v19));
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  CGContextAddEllipseInRect(CurrentContext, v23);
  CGContextFillPath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[UIImageView setImage:](self->_innerDotImageView, "setImage:", v20);
  -[UIImageView setBounds:](self->_innerDotImageView, "setBounds:", 0.0, 0.0, v6, v6);

}

- (double)screenScale
{
  double result;

  -[NUNIAstronomyLocationDotConfiguration screenScale](self->_configuration, "screenScale");
  return result;
}

+ (id)_defaultColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.129411765, 0.756862745, 0.360784314, 1.0);
}

+ (double)defaultPulseDuration
{
  return 2.0;
}

+ (double)defaultPulseAlphaDelay
{
  return 1.0;
}

- (void)setOuterDotColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_outerDotColor, a3);
    -[UIView setBackgroundColor:](self->_outerDot, "setBackgroundColor:", v5);
  }

}

- (void)setInnerDotColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_innerDotColor, a3);
    -[NUNIAstronomyLocationDot _generateInnerDotImage](self, "_generateInnerDotImage");
  }

}

- (void)setOuterDotDiameter:(double)a3
{
  self->_outerDotDiameter = a3;
  -[NUNIAstronomyLocationDot setNeedsLayout](self, "setNeedsLayout");
}

- (void)setInnerDotDiameter:(double)a3
{
  if (self->_innerDotDiameter != a3)
  {
    self->_innerDotDiameter = a3;
    -[NUNIAstronomyLocationDot _generateInnerDotImage](self, "_generateInnerDotImage");
    -[NUNIAstronomyLocationDot setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
  if (self->_animating)
  {
    -[NUNIAstronomyLocationDot stopAnimation](self, "stopAnimation");
    -[NUNIAstronomyLocationDot startAnimation](self, "startAnimation");
  }
}

- (void)startAnimation
{
  -[NUNIAstronomyLocationDot startAnimationWithCompletionBlock:](self, "startAnimationWithCompletionBlock:", 0);
}

- (void)startAnimationWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[NUNIAstronomyLocationDot stopAnimation](self, "stopAnimation");
  self->_animating = 1;
  -[UIImageView setAlpha:](self->_innerDotImageView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_outerDot, "setAlpha:", 0.0);
  -[UIView setBounds:](self->_outerDot, "setBounds:", 0.0, 0.0, self->_outerDotDiameter, self->_outerDotDiameter);
  if (self->_pulseDuration <= 0.0)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v4);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDuration:", self->_pulseDuration);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_innerDotDiameter / self->_outerDotDiameter);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFromValue:", v6);

    objc_msgSend(v5, "setToValue:", &unk_24CFE3750);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", self->_pulseDuration - self->_pulseAlphaDelay);
    objc_msgSend(v7, "setFromValue:", &unk_24CFE3750);
    objc_msgSend(v7, "setToValue:", &unk_24CFE3750);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDuration:", self->_pulseDuration - self->_pulseAlphaDelay);
    objc_msgSend(v8, "setFromValue:", &unk_24CFE3750);
    objc_msgSend(v8, "setToValue:", &unk_24CFE3760);
    objc_msgSend(v8, "setBeginTime:", self->_pulseAlphaDelay);
    LODWORD(v9) = 1050253722;
    LODWORD(v10) = *(_DWORD *)"333?";
    LODWORD(v11) = 0;
    LODWORD(v12) = 1.0;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v9, v11, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimingFunction:", v13);

    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = v7;
    v18[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnimations:", v15);

    objc_msgSend(v14, "setDuration:", self->_pulseDuration);
    LODWORD(v16) = 2.0;
    objc_msgSend(v14, "setRepeatCount:", v16);
    objc_msgSend(v14, "setFrameInterval:", 0.0666666667);
    objc_msgSend(v14, "setDiscretizesTime:", 1);
    -[UIView layer](self->_outerDot, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAnimation:forKey:", v14, CFSTR("pulse"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)stopAnimation
{
  id v2;

  self->_animating = 0;
  -[UIView layer](self->_outerDot, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("pulse"));

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  UIImageView *innerDotImageView;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUNIAstronomyLocationDot;
  -[NUNIAstronomyLocationDot layoutSubviews](&v9, sel_layoutSubviews);
  -[NUNIAstronomyLocationDot bounds](self, "bounds");
  -[NUNIAstronomyLocationDotConfiguration screenScale](self->_configuration, "screenScale");
  v7 = v3;
  UIRectCenteredIntegralRectScale();
  -[UIView setFrame:](self->_outerDot, "setFrame:", v7);
  -[UIView layer](self->_outerDot, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", self->_outerDotDiameter * 0.5);

  innerDotImageView = self->_innerDotImageView;
  -[UIImageView bounds](innerDotImageView, "bounds");
  -[NUNIAstronomyLocationDotConfiguration screenScale](self->_configuration, "screenScale");
  v8 = v6;
  UIRectCenteredIntegralRectScale();
  -[UIImageView setFrame:](innerDotImageView, "setFrame:", v8);
}

- (UIColor)outerDotColor
{
  return self->_outerDotColor;
}

- (double)outerDotDiameter
{
  return self->_outerDotDiameter;
}

- (UIColor)innerDotColor
{
  return self->_innerDotColor;
}

- (double)innerDotDiameter
{
  return self->_innerDotDiameter;
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (double)pulseAlphaDelay
{
  return self->_pulseAlphaDelay;
}

- (void)setPulseAlphaDelay:(double)a3
{
  self->_pulseAlphaDelay = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerDotColor, 0);
  objc_storeStrong((id *)&self->_outerDotColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_innerDotImageView, 0);
  objc_storeStrong((id *)&self->_outerDot, 0);
}

@end
