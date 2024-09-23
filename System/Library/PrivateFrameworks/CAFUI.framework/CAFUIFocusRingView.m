@implementation CAFUIFocusRingView

- (CAFUIFocusRingView)initWithFrame:(CGRect)a3
{
  CAFUIFocusRingView *v3;
  void *v4;
  uint64_t v5;
  UIColor *ringColor;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAFUIFocusRingView;
  v3 = -[CAFUIFocusRingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFUIFocusRingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_cornerRadius = 11.0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "_carSystemFocusColor");
    v5 = objc_claimAutoreleasedReturnValue();
    ringColor = v3->_ringColor;
    v3->_ringColor = (UIColor *)v5;

    v3->_ringWidth = 2.0;
    -[CAFUIFocusRingView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CAFUIFocusRingView"));
  }
  return v3;
}

- (void)_updateFocusRect
{
  void *v3;

  -[CAFUIFocusRingView focusPath](self, "focusPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPoints");

  -[CAFUIFocusRingView setFocusPath:](self, "setFocusPath:", 0);
  -[CAFUIFocusRingView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAFUIFocusRingView;
  -[CAFUIFocusRingView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CAFUIFocusRingView _updateFocusRect](self, "_updateFocusRect");
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[CAFUIFocusRingView _updateFocusRect](self, "_updateFocusRect");
  }
}

- (void)setRingWidth:(double)a3
{
  if (self->_ringWidth != a3)
  {
    self->_ringWidth = a3;
    -[CAFUIFocusRingView _updateFocusRect](self, "_updateFocusRect");
  }
}

- (void)setRingColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringColor, a3);
  -[CAFUIFocusRingView _updateFocusRect](self, "_updateFocusRect");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAFUIFocusRingView;
  -[CAFUIFocusRingView layoutSubviews](&v3, sel_layoutSubviews);
  -[CAFUIFocusRingView _updateFocusRect](self, "_updateFocusRect");
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)CAFUIFocusRingView;
  -[CAFUIFocusRingView drawRect:](&v18, sel_drawRect_);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v20 = CGRectInset(v19, 1.0, 1.0);
  v8 = v20.origin.x;
  v9 = v20.origin.y;
  v10 = v20.size.width;
  v11 = v20.size.height;
  -[CAFUIFocusRingView focusPath](self, "focusPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x24BEBD420];
    -[CAFUIFocusRingView cornerRadius](self, "cornerRadius");
    objc_msgSend(v13, "_bezierPathWithPillRect:cornerRadius:", v8, v9, v10, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineWidth:", self->_ringWidth);
    -[CAFUIFocusRingView setFocusPath:](self, "setFocusPath:", v15);

  }
  -[CAFUIFocusRingView ringColor](self, "ringColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStroke");

  -[CAFUIFocusRingView focusPath](self, "focusPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stroke");

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)ringWidth
{
  return self->_ringWidth;
}

- (UIColor)ringColor
{
  return self->_ringColor;
}

- (UIBezierPath)focusPath
{
  return self->_focusPath;
}

- (void)setFocusPath:(id)a3
{
  objc_storeStrong((id *)&self->_focusPath, a3);
}

- (UIBezierPath)insetFocusPath
{
  return self->_insetFocusPath;
}

- (void)setInsetFocusPath:(id)a3
{
  objc_storeStrong((id *)&self->_insetFocusPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetFocusPath, 0);
  objc_storeStrong((id *)&self->_focusPath, 0);
  objc_storeStrong((id *)&self->_ringColor, 0);
}

@end
