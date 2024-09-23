@implementation DOCDeterminateProgressRingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (DOCDeterminateProgressRingView)initWithFrame:(CGRect)a3
{
  DOCDeterminateProgressRingView *v3;
  DOCDeterminateProgressRingView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  CALayer *squareLayer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DOCDeterminateProgressRingView;
  v3 = -[DOCDeterminateProgressRingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DOCDeterminateProgressRingView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v7 = objc_claimAutoreleasedReturnValue();
    squareLayer = v4->_squareLayer;
    v4->_squareLayer = (CALayer *)v7;

    -[CALayer setHidden:](v4->_squareLayer, "setHidden:", 1);
    objc_msgSend(v5, "addSublayer:", v4->_squareLayer);
    -[DOCDeterminateProgressRingView _updateShapePath](v4, "_updateShapePath");
    objc_msgSend(v5, "setStrokeEnd:", 0.0);

  }
  return v4;
}

- (void)setCanShowStopButton:(BOOL)a3
{
  self->_canShowStopButton = a3;
  -[CALayer setHidden:](self->_squareLayer, "setHidden:", !a3);
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DOCDeterminateProgressRingView;
  v4 = a3;
  -[DOCDeterminateProgressRingView setTintColor:](&v9, sel_setTintColor_, v4);
  -[DOCDeterminateProgressRingView layer](self, "layer", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "CGColor");

  -[CALayer setBackgroundColor:](self->_squareLayer, "setBackgroundColor:", v8);
}

- (void)_updateShapePath
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  CGFloat v8;
  double MidX;
  id v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[DOCDeterminateProgressRingView layer](self, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDeterminateProgressRingView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v8 = v14.size.width * 0.5;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  objc_msgSend(v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v15), v8, -1.57079633, 4.71238898);
  v10 = objc_retainAutorelease(v3);
  objc_msgSend(v13, "setPath:", objc_msgSend(v10, "CGPath"));
  if (width >= height)
    v11 = height;
  else
    v11 = width;
  v12 = v11 / 36.0;
  DOCCenterSizeInRect();
  -[CALayer setFrame:](self->_squareLayer, "setFrame:");
  objc_msgSend(v13, "setLineWidth:", v12 * 3.0);
  objc_msgSend(v13, "setBounds:", x, y, width, height);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCDeterminateProgressRingView;
  -[DOCDeterminateProgressRingView layoutSubviews](&v3, sel_layoutSubviews);
  -[DOCDeterminateProgressRingView _updateShapePath](self, "_updateShapePath");
}

- (void)setProgress:(double)a3
{
  id v4;

  self->_progress = a3;
  -[DOCDeterminateProgressRingView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeEnd:", self->_progress);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DOCDeterminateProgressRingView;
  if (-[DOCDeterminateProgressRingView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("strokeEnd"));

  return v5;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)canShowStopButton
{
  return self->_canShowStopButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_squareLayer, 0);
}

@end
