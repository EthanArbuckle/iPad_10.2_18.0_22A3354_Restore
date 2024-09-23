@implementation FMDistanceBadge

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setRoundedRectBackgroundColor:](self, "setRoundedRectBackgroundColor:", v3);

  v4.receiver = self;
  v4.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge awakeFromNib](&v4, sel_awakeFromNib);
  -[FMDistanceBadge _commonSetup](self, "_commonSetup");
}

- (void)prepareForInterfaceBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge prepareForInterfaceBuilder](&v3, sel_prepareForInterfaceBuilder);
  -[FMDistanceBadge _commonSetup](self, "_commonSetup");
}

- (void)_commonSetup
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.4627, 0.7764, 0.2313, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setRoundedRectBackgroundColor:](self, "setRoundedRectBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDistanceBadge setTextColor:](self, "setTextColor:", v4);

  -[FMDistanceBadge setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", 1);
  -[FMDistanceBadge setMinimumScaleFactor:](self, "setMinimumScaleFactor:", 0.8);
  -[FMDistanceBadge setTextAlignment:](self, "setTextAlignment:", 1);
  -[FMDistanceBadge setInsets:](self, "setInsets:", 1.0, 9.0, 2.0, 9.0);
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);

}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
  -[FMDistanceBadge invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FMDistanceBadge insets](self, "insets");
  v12.receiver = self;
  v12.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  CGPath *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  float v16;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[FMDistanceBadge bounds](self, "bounds");
  v9 = -[UIView newPathForRoundedRect:radius:](self, "newPathForRoundedRect:radius:");
  -[UIView roundedRectBackgroundColor](self, "roundedRectBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIView roundedRectBackgroundColor](self, "roundedRectBackgroundColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v11, "CGColor"));

  }
  -[UIView roundedRectBorderColor](self, "roundedRectBorderColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIView roundedRectBorderColor](self, "roundedRectBorderColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v13, "CGColor"));

  }
  -[UIView roundedRectBorderWidth](self, "roundedRectBorderWidth");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIView roundedRectBorderWidth](self, "roundedRectBorderWidth");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    CGContextSetLineWidth(CurrentContext, v16);

  }
  CGContextAddPath(CurrentContext, v9);
  CGContextFillPath(CurrentContext);
  CGContextStrokePath(CurrentContext);
  CGPathRelease(v9);
  v17.receiver = self;
  v17.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge drawRect:](&v17, sel_drawRect_, x, y, width, height);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  v15.receiver = self;
  v15.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge intrinsicContentSize](&v15, sel_intrinsicContentSize);
  v5 = v3;
  v6 = v4;
  if ((v3 != *MEMORY[0x24BDBF148] || v4 != *(double *)(MEMORY[0x24BDBF148] + 8))
    && v3 != *MEMORY[0x24BDF7FB8]
    && v4 != *MEMORY[0x24BDF7FB8])
  {
    -[FMDistanceBadge insets](self, "insets");
    v6 = v6 + v9 + v10;
    v5 = v5 + v11 + v12;
  }
  v13 = v5;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (void)setBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_badgeColor, a3);
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeColor, 0);
}

@end
