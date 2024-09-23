@implementation HUFadeInButton

+ (id)button
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___HUFadeInButton;
  objc_msgSendSuper2(&v14, sel_buttonWithType_, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _backgroundColorWithTraitCollection(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setBackgroundColor:", v5);
    v6 = (objc_class *)MEMORY[0x1E0CD2790];
    v7 = v5;
    v8 = objc_alloc_init(v6);
    _fadeInGradientWithColor(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setColors:", v9);
    objc_msgSend(v8, "setLocations:", &unk_1E7042C48);
    objc_msgSend(v8, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v8, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v3, "setFadeLayer:", v8);

    objc_msgSend(v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fadeLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v11);

    objc_msgSend(v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 0);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUFadeInButton;
  -[HUFadeInButton traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[HUFadeInButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _backgroundColorWithTraitCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFadeInButton setBackgroundColor:](self, "setBackgroundColor:", v5);
  _fadeInGradientWithColor(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFadeInButton fadeLayer](self, "fadeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColors:", v6);

}

- (void)setShouldFadeRightToLeft:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  if (self->_shouldFadeRightToLeft != a3)
  {
    self->_shouldFadeRightToLeft = a3;
    -[HUFadeInButton fadeLayer](self, "fadeLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startPoint");
    v6 = v5;
    v8 = v7;

    -[HUFadeInButton fadeLayer](self, "fadeLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endPoint");
    v11 = v10;
    v13 = v12;
    -[HUFadeInButton fadeLayer](self, "fadeLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStartPoint:", v11, v13);

    -[HUFadeInButton fadeLayer](self, "fadeLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEndPoint:", v6, v8);

    -[HUFadeInButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double width;
  void *v8;
  double x;
  void *v10;
  double MinY;
  void *v12;
  double Height;
  double MinX;
  CGFloat MaxX;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v20.receiver = self;
  v20.super_class = (Class)HUFadeInButton;
  -[HUFadeInButton layoutSubviews](&v20, sel_layoutSubviews);
  -[HUFadeInButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;

  width = fmin(v6 + v6, 100.0);
  -[HUFadeInButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  x = CGRectGetMinX(v21) - width;
  -[HUFadeInButton titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  MinY = CGRectGetMinY(v22);
  -[HUFadeInButton titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  Height = CGRectGetHeight(v23);

  if (-[HUFadeInButton shouldFadeRightToLeft](self, "shouldFadeRightToLeft"))
  {
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, -1.0, 1.0);
    -[HUFadeInButton bounds](self, "bounds");
    MinX = CGRectGetMinX(v24);
    -[HUFadeInButton bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v25);
    v17 = v19;
    CGAffineTransformTranslate(&v18, &v17, -(MinX + MaxX), 0.0);
    v19 = v18;
    v26.origin.x = x;
    v26.origin.y = MinY;
    v26.size.width = width;
    v26.size.height = Height;
    v27 = CGRectApplyAffineTransform(v26, &v18);
    x = v27.origin.x;
    MinY = v27.origin.y;
    width = v27.size.width;
    Height = v27.size.height;
  }
  -[HUFadeInButton fadeLayer](self, "fadeLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", x, MinY, width, Height);

}

- (BOOL)shouldFadeRightToLeft
{
  return self->_shouldFadeRightToLeft;
}

- (CAGradientLayer)fadeLayer
{
  return (CAGradientLayer *)objc_getProperty(self, a2, 760, 1);
}

- (void)setFadeLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeLayer, 0);
}

@end
