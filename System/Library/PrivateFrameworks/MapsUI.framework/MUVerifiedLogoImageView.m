@implementation MUVerifiedLogoImageView

- (MUVerifiedLogoImageView)initWithFrame:(CGRect)a3
{
  MUVerifiedLogoImageView *v3;
  MUVerifiedLogoImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUVerifiedLogoImageView;
  v3 = -[MUImageView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
    -[MUVerifiedLogoImageView _setupCustomBorder](v3, "_setupCustomBorder");
  return v4;
}

- (void)_setupCustomBorder
{
  void *v3;
  void *v4;
  CAShapeLayer *v5;
  CAShapeLayer *innerRingLayer;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MUVerifiedLogoImageView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 1);

  -[MUVerifiedLogoImageView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", 2.0);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  innerRingLayer = self->_innerRingLayer;
  self->_innerRingLayer = v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_innerRingLayer, "setFillColor:", objc_msgSend(v7, "CGColor"));

  -[CAShapeLayer setLineWidth:](self->_innerRingLayer, "setLineWidth:", 1.0);
  -[MUVerifiedLogoImageView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSublayer:", self->_innerRingLayer);

  -[MUVerifiedLogoImageView _updateInnerRingFrame](self, "_updateInnerRingFrame");
  -[MUVerifiedLogoImageView _updateRingColors](self, "_updateRingColors");
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)-[MUVerifiedLogoImageView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v9, sel__updateRingColors);

}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)MUVerifiedLogoImageView;
  -[MUImageView layoutSubviews](&v5, sel_layoutSubviews);
  -[MUVerifiedLogoImageView _updateInnerRingFrame](self, "_updateInnerRingFrame");
  -[MUVerifiedLogoImageView bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[MUVerifiedLogoImageView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (void)_updateInnerRingFrame
{
  double x;
  double y;
  double width;
  double height;
  id v7;
  CGRect v8;
  CGRect v9;

  -[MUVerifiedLogoImageView bounds](self, "bounds");
  v9 = CGRectInset(v8, 2.5, 2.5);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  -[MUVerifiedLogoImageView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_innerRingLayer, "setFrame:");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_innerRingLayer, "setPath:", objc_msgSend(v7, "CGPath"));

}

- (void)_updateRingColors
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[MUVerifiedLogoImageView innerRingColor](self, "innerRingColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_innerRingLayer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

  -[MUVerifiedLogoImageView outerRingColor](self, "outerRingColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v6, "CGColor");
  -[MUVerifiedLogoImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (UIColor)outerRingColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (UIColor)innerRingColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerRingLayer, 0);
}

@end
