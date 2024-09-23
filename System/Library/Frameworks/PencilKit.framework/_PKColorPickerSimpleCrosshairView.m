@implementation _PKColorPickerSimpleCrosshairView

- (_PKColorPickerSimpleCrosshairView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _PKColorPickerSimpleCrosshairView *v7;
  uint64_t v8;
  UIView *shadowView;
  void *v10;
  void *v11;
  uint64_t v12;
  UIView *borderView;
  void *v14;
  void *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)_PKColorPickerSimpleCrosshairView;
  v7 = -[_PKColorPickerSimpleCrosshairView initWithFrame:](&v17, sel_initWithFrame_);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
  shadowView = v7->_shadowView;
  v7->_shadowView = (UIView *)v8;

  -[_PKColorPickerSimpleCrosshairView shadowView](v7, "shadowView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerSimpleCrosshairView configureShadowView:](v7, "configureShadowView:", v10);

  -[_PKColorPickerSimpleCrosshairView shadowView](v7, "shadowView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerSimpleCrosshairView addSubview:](v7, "addSubview:", v11);

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
  borderView = v7->_borderView;
  v7->_borderView = (UIView *)v12;

  -[_PKColorPickerSimpleCrosshairView borderView](v7, "borderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerSimpleCrosshairView configureBorderView:](v7, "configureBorderView:", v14);

  -[_PKColorPickerSimpleCrosshairView borderView](v7, "borderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerSimpleCrosshairView addSubview:](v7, "addSubview:", v15);

  -[_PKColorPickerSimpleCrosshairView setClipsToBounds:](v7, "setClipsToBounds:", 0);
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PKColorPickerSimpleCrosshairView;
  -[_PKColorPickerSimpleCrosshairView layoutSubviews](&v5, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[_PKColorPickerSimpleCrosshairView shadowView](self, "shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerSimpleCrosshairView configureShadowView:](self, "configureShadowView:", v3);

  -[_PKColorPickerSimpleCrosshairView borderView](self, "borderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorPickerSimpleCrosshairView configureBorderView:](self, "configureBorderView:", v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)setBorderCornerRadius:(double)a3
{
  self->_borderCornerRadius = a3;
  -[_PKColorPickerSimpleCrosshairView setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureBorderView:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v10 = a3;
  objc_msgSend(v4, "pk_crosshairViewBorderColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v10, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  objc_msgSend(v10, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 2.0);

  -[_PKColorPickerSimpleCrosshairView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v10, "setFrame:");

  -[_PKColorPickerSimpleCrosshairView _cornerRadiusForBorderView](self, "_cornerRadiusForBorderView");
  objc_msgSend(v10, "_setCornerRadius:");

}

- (void)configureShadowView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double MidX;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v16 = a3;
  objc_msgSend(v4, "pk_crosshairViewShadowColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.1);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  objc_msgSend(v16, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v7);

  objc_msgSend(v16, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", 4.0);

  objc_msgSend(v16, "setClipsToBounds:", 0);
  -[_PKColorPickerSimpleCrosshairView layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetWidth(v17) + 2.0;
  -[_PKColorPickerSimpleCrosshairView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v11, CGRectGetHeight(v18) + 2.0);

  -[_PKColorPickerSimpleCrosshairView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  MidX = CGRectGetMidX(v19);
  -[_PKColorPickerSimpleCrosshairView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  objc_msgSend(v16, "setPosition:", MidX, CGRectGetMidY(v20));

  -[_PKColorPickerSimpleCrosshairView _cornerRadiusForShadowView](self, "_cornerRadiusForShadowView");
  objc_msgSend(v16, "_setCornerRadius:");
  objc_msgSend(v16, "setAlpha:", 1.0);

}

- (double)_cornerRadiusForShadowView
{
  double v2;

  -[_PKColorPickerSimpleCrosshairView borderCornerRadius](self, "borderCornerRadius");
  return v2 + 1.0;
}

- (double)borderCornerRadius
{
  return self->_borderCornerRadius;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
