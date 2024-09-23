@implementation CEKLightingDialBackground

- (CEKLightingDialBackground)initWithFrame:(CGRect)a3
{
  CEKLightingDialBackground *v3;
  CEKLightingDialBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEKLightingDialBackground;
  v3 = -[CEKLightingDialBackground initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CEKLightingDialBackground setOpaque:](v3, "setOpaque:", 0);
    -[CEKLightingDialBackground setContentMode:](v4, "setContentMode:", 3);
  }
  return v4;
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    -[CEKLightingDialBackground setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[CEKLightingDialBackground bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CEKLightingDialBackground radius](self, "radius");
  UIRoundToViewScale();
  v14 = v13;
  v15 = CEKPixelWidthForView(self);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  v16 = v15 + CGRectGetMinY(v26);
  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  v17 = CGRectGetMidX(v27) + v14 * -0.5;
  v28.origin.x = v17;
  v28.origin.y = v16;
  v28.size.width = v14;
  v28.size.height = v14;
  v29 = CGRectInset(v28, v15, v15);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "colorWithAlphaComponent:", 0.3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "set");

  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  CGContextFillEllipseInRect(CurrentContext, v30);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "colorWithAlphaComponent:", 0.1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "set");

  CGContextSetLineWidth(CurrentContext, v15);
  v31.origin.x = v17;
  v31.origin.y = v16;
  v31.size.width = v14;
  v31.size.height = v14;
  CGContextStrokeEllipseInRect(CurrentContext, v31);
}

- (double)radius
{
  return self->_radius;
}

@end
