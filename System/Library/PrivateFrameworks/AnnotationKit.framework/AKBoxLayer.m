@implementation AKBoxLayer

- (AKBoxLayer)initWithBorderWidth:(double)a3 cornerRadius:(double)a4
{
  AKBoxLayer *v6;
  AKBoxLayer *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AKBoxLayer;
  v6 = -[AKBoxLayer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[AKBoxLayer setAnchorPoint:](v6, "setAnchorPoint:", 0.5, 0.5);
    -[AKBoxLayer setLineWidth:](v7, "setLineWidth:", a3);
    objc_msgSend(MEMORY[0x24BDF6950], "akBoxBorderColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[AKBoxLayer setStrokeColor:](v7, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

    -[AKBoxLayer setFillColor:](v7, "setFillColor:", 0);
    v7->_borderWidthScale = 1.0;
    v7->_boxCornerRadius = a4;
    v7->_nominalBorderWidth = a3;
  }
  return v7;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKBoxLayer;
  -[AKBoxLayer setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AKBoxLayer _updateBoxPath](self, "_updateBoxPath");
}

- (double)borderWidthScale
{
  return self->_borderWidthScale;
}

- (void)setBorderWidthScale:(double)a3
{
  double v4;
  double v5;
  double v6;

  if (self->_borderWidthScale != a3)
  {
    self->_borderWidthScale = a3;
    -[AKBoxLayer nominalBorderWidth](self, "nominalBorderWidth");
    v5 = v4;
    -[AKBoxLayer borderWidthScale](self, "borderWidthScale");
    -[AKBoxLayer setLineWidth:](self, "setLineWidth:", v5 / v6);
    -[AKBoxLayer _updateBoxPath](self, "_updateBoxPath");
  }
}

- (void)_updateBoxPath
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGPathRef v15;
  const CGPath *v16;
  CGRect v17;
  CGRect v18;

  -[AKBoxLayer bounds](self, "bounds");
  if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
  {
    -[AKBoxLayer bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[AKBoxLayer lineWidth](self, "lineWidth");
    v12 = v11 * 0.5;
    -[AKBoxLayer lineWidth](self, "lineWidth");
    v14 = v13 * 0.5;
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    v18 = CGRectInset(v17, v12, v14);
    v15 = CGPathCreateWithRoundedRect(v18, self->_boxCornerRadius, self->_boxCornerRadius, 0);
    if (v15)
    {
      v16 = v15;
      -[AKBoxLayer setPath:](self, "setPath:", v15);
      CGPathRelease(v16);
    }
  }
}

- (double)boxCornerRadius
{
  return self->_boxCornerRadius;
}

- (void)setBoxCornerRadius:(double)a3
{
  self->_boxCornerRadius = a3;
}

- (double)nominalBorderWidth
{
  return self->_nominalBorderWidth;
}

- (void)setNominalBorderWidth:(double)a3
{
  self->_nominalBorderWidth = a3;
}

@end
