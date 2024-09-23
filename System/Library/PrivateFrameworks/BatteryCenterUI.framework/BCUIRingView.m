@implementation BCUIRingView

- (void)setRingStart:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (v3 != self->_ringStart)
  {
    self->_ringStart = v3;
    -[BCUIRingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRingEnd:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (v3 != self->_ringEnd)
  {
    self->_ringEnd = v3;
    -[BCUIRingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStrokeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_strokeColor, a3);
    -[BCUIRingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setFillColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_fillColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[BCUIRingView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setFractionComplete:(double)a3
{
  -[BCUIRingView setRingStart:](self, "setRingStart:", 0.0);
  -[BCUIRingView setRingEnd:](self, "setRingEnd:", a3);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BCUIRingView)initWithFrame:(CGRect)a3
{
  BCUIRingView *v3;
  BCUIRingView *v4;
  void *v5;
  _QWORD v7[4];
  BCUIRingView *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BCUIRingView;
  v3 = -[BCUIRingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lineWidth = 6.0;
    -[BCUIRingView setNeedsLayout](v3, "setNeedsLayout");
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__BCUIRingView_initWithFrame___block_invoke;
    v7[3] = &unk_1E9418368;
    v8 = v4;
    objc_msgSend(v5, "performWithoutAnimation:", v7);

  }
  return v4;
}

uint64_t __30__BCUIRingView_initWithFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGPath *Mutable;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  UIColor *fillColor;
  id v31;
  id v32;
  CGRect v33;

  -[BCUIRingView _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v32 = v3;
  if (self->_ringEnd > self->_ringStart)
  {
    v5 = objc_msgSend(v3, "path");
    v4 = v32;
    if (!v5)
    {
      -[BCUIRingView bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      -[BCUIRingView window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[BCUIRingView window](self, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "screen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scale");
        v14 = v13;

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scale");
        v14 = v15;
      }

      -[BCUIRingView sizeThatFits:](self, "sizeThatFits:", v7, v9);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      Mutable = CGPathCreateMutable();
      UIRectGetCenter();
      UIPointRoundToScale();
      v26 = v25;
      v28 = v27;
      v33.origin.x = v17;
      v33.origin.y = v19;
      v33.size.width = v21;
      v33.size.height = v23;
      CGRectGetWidth(v33);
      UIRoundToScale();
      CGPathAddArc(Mutable, 0, v26, v28, v29, 4.71238898, 10.9955743, 0);
      objc_msgSend(v32, "setPath:", Mutable, v14);
      CGPathRelease(Mutable);
      objc_msgSend(v32, "setLineCap:", CFSTR("round"));
      v4 = v32;
    }
  }
  objc_msgSend(v4, "setLineWidth:", self->_lineWidth);
  fillColor = self->_fillColor;
  if (fillColor)
  {
    objc_msgSend(v32, "setFillColor:", -[UIColor CGColor](fillColor, "CGColor"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "setFillColor:", objc_msgSend(v31, "CGColor"));

  }
  objc_msgSend(v32, "setStrokeColor:", -[UIColor CGColor](self->_strokeColor, "CGColor"));
  objc_msgSend(v32, "setStrokeStart:", self->_ringStart);
  objc_msgSend(v32, "setStrokeEnd:", self->_ringEnd);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BCUIRingView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)BCUIRingView;
  -[BCUIRingView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  -[BCUIRingView frame](self, "frame");
  v22.origin.x = v16;
  v22.origin.y = v17;
  v22.size.width = v18;
  v22.size.height = v19;
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v21, v22))
    -[BCUIRingView _invalidatePath](self, "_invalidatePath");
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  if (result.width > result.height)
    result.width = result.height;
  width = result.width;
  result.height = width;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("strokeStart")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeEnd")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("strokeColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCUIRingView;
    v5 = -[BCUIRingView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_invalidatePath
{
  void *v3;

  -[BCUIRingView _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPath:", 0);

  -[BCUIRingView setNeedsLayout](self, "setNeedsLayout");
}

- (double)ringStart
{
  return self->_ringStart;
}

- (double)ringEnd
{
  return self->_ringEnd;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

- (void)mt_applyVisualStyling:(id)a3
{
  objc_msgSend(a3, "applyToView:withColorBlock:", self, 0);
}

@end
