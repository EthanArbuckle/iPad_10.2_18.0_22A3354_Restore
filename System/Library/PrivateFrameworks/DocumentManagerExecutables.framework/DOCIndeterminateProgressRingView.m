@implementation DOCIndeterminateProgressRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DOCIndeterminateProgressRingView)initWithFrame:(CGRect)a3
{
  DOCIndeterminateProgressRingView *v3;
  DOCIndeterminateProgressRingView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  CABasicAnimation *spinnerAnimation;
  void *v9;
  void *v10;
  CABasicAnimation *v11;
  void *v12;
  float v13;
  void *v14;
  double v15;
  CFTimeInterval v16;
  CABasicAnimation *v17;
  long double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DOCIndeterminateProgressRingView;
  v3 = -[DOCIndeterminateProgressRingView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DOCIndeterminateProgressRingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    -[DOCIndeterminateProgressRingView _updateShapePath](v4, "_updateShapePath");
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v7 = objc_claimAutoreleasedReturnValue();
    spinnerAnimation = v4->_spinnerAnimation;
    v4->_spinnerAnimation = (CABasicAnimation *)v7;

    -[CABasicAnimation keyPath](v4->_spinnerAnimation, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKeyPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CABasicAnimation setFromValue:](v4->_spinnerAnimation, "setFromValue:", v10);
    v11 = v4->_spinnerAnimation;
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "floatValue");
    objc_msgSend(v12, "numberWithDouble:", (double)(fmod(v13, 6.28318531) + 6.28318531));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABasicAnimation setToValue:](v11, "setToValue:", v14);

    -[CABasicAnimation setRemovedOnCompletion:](v4->_spinnerAnimation, "setRemovedOnCompletion:", 0);
    LODWORD(v15) = 2139095040;
    -[CABasicAnimation setRepeatCount:](v4->_spinnerAnimation, "setRepeatCount:", v15);
    -[CABasicAnimation setFillMode:](v4->_spinnerAnimation, "setFillMode:", *MEMORY[0x24BDE5970]);
    -[CABasicAnimation setDuration:](v4->_spinnerAnimation, "setDuration:", 1.0);
    -[CABasicAnimation setBeginTimeMode:](v4->_spinnerAnimation, "setBeginTimeMode:", *MEMORY[0x24BDE5828]);
    v16 = CACurrentMediaTime();
    v17 = v4->_spinnerAnimation;
    -[CABasicAnimation duration](v17, "duration");
    -[CABasicAnimation setBeginTime:](v17, "setBeginTime:", (double)(v16 - fmod(v16, v18)));
    objc_msgSend(v5, "addAnimation:forKey:", v4->_spinnerAnimation, CFSTR("DOCIndeterminateProgressRingViewSpinnerAnimationKey"));

  }
  return v4;
}

- (void)_removeAllAnimations:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCIndeterminateProgressRingView;
  -[DOCIndeterminateProgressRingView _removeAllAnimations:](&v5, sel__removeAllAnimations_, a3);
  -[DOCIndeterminateProgressRingView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAnimation:forKey:", self->_spinnerAnimation, CFSTR("DOCIndeterminateProgressRingViewSpinnerAnimationKey"));

}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCIndeterminateProgressRingView;
  v4 = a3;
  -[DOCIndeterminateProgressRingView setTintColor:](&v8, sel_setTintColor_, v4);
  -[DOCIndeterminateProgressRingView layer](self, "layer", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "CGColor");

  objc_msgSend(v5, "setStrokeColor:", v7);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCIndeterminateProgressRingView;
  -[DOCIndeterminateProgressRingView layoutSubviews](&v3, sel_layoutSubviews);
  -[DOCIndeterminateProgressRingView _updateShapePath](self, "_updateShapePath");
}

- (void)_updateShapePath
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  double MidX;
  double MidY;
  void *v10;
  id v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[DOCIndeterminateProgressRingView layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[DOCIndeterminateProgressRingView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v7 = v14.size.width * 0.5;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidY = CGRectGetMidY(v15);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v7, 0.0, 5.8293997);
  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v13, "setPath:", objc_msgSend(v11, "CGPath"));
  if (width >= height)
    v12 = height;
  else
    v12 = width;
  objc_msgSend(v13, "setLineWidth:", v12 / 36.0 * 3.0);
  objc_msgSend(v13, "setBounds:", x, y, width, height);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerAnimation, 0);
}

@end
