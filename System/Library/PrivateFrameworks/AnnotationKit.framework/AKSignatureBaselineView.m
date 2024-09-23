@implementation AKSignatureBaselineView

- (AKSignatureBaselineView)initWithFrame:(CGRect)a3
{
  AKSignatureBaselineView *v3;
  AKSignatureBaselineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSignatureBaselineView;
  v3 = -[AKSignatureBaselineView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKSignatureBaselineView _commonInit](v3, "_commonInit");
  return v4;
}

- (AKSignatureBaselineView)initWithCoder:(id)a3
{
  AKSignatureBaselineView *v3;
  AKSignatureBaselineView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKSignatureBaselineView;
  v3 = -[AKSignatureBaselineView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AKSignatureBaselineView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  id v4;

  -[AKSignatureBaselineView setOpaque:](self, "setOpaque:", 0);
  -[AKSignatureBaselineView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureBaselineView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[AKSignatureBaselineView setContentMode:](self, "setContentMode:", 3);
  -[AKSignatureBaselineView setBaselinePercent:](self, "setBaselinePercent:", 0.187);
  -[AKSignatureBaselineView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);

}

- (double)scaleFactor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[AKSignatureBaselineView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKSignatureBaselineView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v8 = v9;
  }

  return v8;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[AKSignatureBaselineView _drawBaselineInContext:](self, "_drawBaselineInContext:", CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[AKSignatureBaselineView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AKSignatureBaselineView lastSafeAreaInsets](self, "lastSafeAreaInsets");
  if (v6 != v14 || v4 != v11 || v10 != v13 || v8 != v12)
  {
    -[AKSignatureBaselineView safeAreaInsets](self, "safeAreaInsets");
    -[AKSignatureBaselineView setLastSafeAreaInsets:](self, "setLastSafeAreaInsets:");
    -[AKSignatureBaselineView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_drawBaselineInContext:(CGContext *)a3
{
  CGPath *Mutable;
  double width;
  double height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  id v18;
  CGRect ClipBoundingBox;

  if (a3)
  {
    CGContextSaveGState(a3);
    Mutable = CGPathCreateMutable();
    ClipBoundingBox = CGContextGetClipBoundingBox(a3);
    width = ClipBoundingBox.size.width;
    height = ClipBoundingBox.size.height;
    v8 = *(double *)&qword_255A24AB0;
    -[AKSignatureBaselineView safeAreaInsets](self, "safeAreaInsets", ClipBoundingBox.origin.x, ClipBoundingBox.origin.y);
    if (v9 > 0.0 || (-[AKSignatureBaselineView safeAreaInsets](self, "safeAreaInsets"), v10 > 0.0))
    {
      -[AKSignatureBaselineView safeAreaInsets](self, "safeAreaInsets");
      v8 = v11;
      -[AKSignatureBaselineView safeAreaInsets](self, "safeAreaInsets");
      if (v8 < v12)
        v8 = v12;
    }
    -[AKSignatureBaselineView baselinePercent](self, "baselinePercent");
    v14 = height - height * v13;
    v15 = width - v8;
    if (-[AKSignatureBaselineView _isRTL](self, "_isRTL"))
      v16 = width - v8 + -16.0;
    else
      v16 = v8;
    if (!-[AKSignatureBaselineView _isRTL](self, "_isRTL"))
      v8 = v8 + 16.0 + 8.0;
    if (-[AKSignatureBaselineView _isRTL](self, "_isRTL"))
      v15 = v16 + -8.0;
    CGPathMoveToPoint(Mutable, 0, v8, v14);
    CGPathAddLineToPoint(Mutable, 0, v15, v14);
    v17 = v14 + 1.0;
    CGPathMoveToPoint(Mutable, 0, v16, v17);
    CGPathAddLineToPoint(Mutable, 0, v16 + 16.0, v17 + -16.0);
    CGPathMoveToPoint(Mutable, 0, v16, v17 + -16.0);
    CGPathAddLineToPoint(Mutable, 0, v16 + 16.0, v17);
    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.6, 0.7);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v18, "CGColor"));

    CGContextSetLineWidth(a3, 1.0);
    CGContextAddPath(a3, Mutable);
    CGContextStrokePath(a3);
    CGContextRestoreGState(a3);
    CGPathRelease(Mutable);
  }
}

- (BOOL)_isRTL
{
  return 0;
}

- (double)baselinePercent
{
  return self->_baselinePercent;
}

- (void)setBaselinePercent:(double)a3
{
  self->_baselinePercent = a3;
}

- (UIEdgeInsets)lastSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_lastSafeAreaInsets.top;
  left = self->_lastSafeAreaInsets.left;
  bottom = self->_lastSafeAreaInsets.bottom;
  right = self->_lastSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLastSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_lastSafeAreaInsets = a3;
}

@end
