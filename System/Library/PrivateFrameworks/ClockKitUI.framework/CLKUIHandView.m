@implementation CLKUIHandView

- (CLKUIHandView)initWithImage:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  CLKUIHandView *v8;
  CLKUIHandView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLKUIHandView;
  v8 = -[CLKUIHandView init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[CLKUIHandView _initWithImage:forDevice:](v8, "_initWithImage:forDevice:", v6, v7);

  return v9;
}

- (void)_initWithImage:(id)a3 forDevice:(id)a4
{
  UIImage *v6;
  CLKDevice *v7;
  CLKUIColoringImageView *v8;
  CLKUIColoringImageView *handImageView;
  double v10;
  double v11;
  double v12;
  CLKDevice *device;
  CLKDevice *v14;
  UIImage *image;
  UIImage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v6 = (UIImage *)a3;
  v7 = (CLKDevice *)a4;
  v8 = -[CLKUIColoringImageView initWithImage:]([CLKUIColoringImageView alloc], "initWithImage:", v6);
  handImageView = self->_handImageView;
  self->_handImageView = v8;

  -[UIImage size](v6, "size");
  v11 = v10;
  -[UIImage size](v6, "size");
  -[CLKUIColoringImageView setBounds:](self->_handImageView, "setBounds:", 0.0, 0.0, v11, v12);
  -[CLKUIHandView addSubview:](self, "addSubview:", self->_handImageView);
  device = self->_device;
  self->_device = v7;
  v14 = v7;

  image = self->_image;
  self->_image = v6;
  v16 = v6;

  self->_dropShadowsHidden = 1;
  -[CLKUIHandView _updateShadows](self, "_updateShadows");
  self->_scale = 1.0;
  self->_zRotation = 0.0;
  -[CLKUIHandView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("transform");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v22[1] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  v22[2] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setActions:", v21);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  double v8;
  double Height;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18.receiver = self;
  v18.super_class = (Class)CLKUIHandView;
  -[CLKUIHandView layoutSubviews](&v18, sel_layoutSubviews);
  -[CLKUIHandView bounds](self, "bounds");
  v4 = v3 * 0.5;
  v6 = v5 * 0.5;
  -[CLKUIColoringImageView setCenter:](self->_handImageView, "setCenter:", v3 * 0.5, v5 * 0.5);
  -[CLKUIHandView _layoutInlayLayer](self, "_layoutInlayLayer");
  -[UIImageView sizeToFit](self->_radialShadowImageView, "sizeToFit");
  -[UIImageView setCenter:](self->_radialShadowImageView, "setCenter:", v4, v6);
  -[UIImageView sizeToFit](self->_dropShadowImageView, "sizeToFit");
  -[CLKUIHandView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  -[UIImageView bounds](self->_dropShadowImageView, "bounds");
  v8 = Width / CGRectGetWidth(v20);
  -[CLKUIHandView bounds](self, "bounds");
  Height = CGRectGetHeight(v21);
  -[UIImageView bounds](self->_dropShadowImageView, "bounds");
  v10 = Height / CGRectGetHeight(v22);
  -[CLKUIHandView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anchorPoint");
  v13 = (v12 + -0.5) * v8 + 0.5;
  -[CLKUIHandView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anchorPoint");
  v16 = (v15 + -0.5) * v10 + 0.5;
  -[UIImageView layer](self->_dropShadowImageView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAnchorPoint:", v13, v16);

  -[CLKUIHandView _updateShadows](self, "_updateShadows");
}

- (void)_layoutInlayLayer
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CALayer *inlayLayer;

  -[CLKUIHandView bounds](self, "bounds");
  top = self->_inlayInsets.top;
  left = self->_inlayInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_inlayInsets.right);
  v12 = v11 - (top + self->_inlayInsets.bottom);
  v13 = -[CALayer setBounds:](self->_inlayLayer, "setBounds:", 0.0, 0.0, v10, v12);
  inlayLayer = self->_inlayLayer;
  MEMORY[0x1D17A167C](v13, v6, v8, v10, v12);
  -[CALayer setPosition:](inlayLayer, "setPosition:");
  -[CALayer setCornerRadius:](self->_inlayLayer, "setCornerRadius:", v10 * 0.5);
}

- (void)setColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_color, a3);
  v5 = a3;
  -[CLKUIHandView noModelUpdate_setColor:](self, "noModelUpdate_setColor:", v5);

}

- (void)noModelUpdate_setColor:(id)a3
{
  -[CLKUIColoringImageView setColor:](self->_handImageView, "setColor:", a3);
}

- (void)setImage:(id)a3
{
  -[CLKUIColoringImageView setImage:](self->_handImageView, "setImage:", a3);
}

- (void)setZRotation:(double)a3
{
  self->_zRotation = a3;
  -[CLKUIHandView _updateTransform](self, "_updateTransform");
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  -[CLKUIHandView _updateTransform](self, "_updateTransform");
}

- (void)_updateTransform
{
  void *v3;
  void *v4;
  CATransform3D v5;
  CATransform3D v6;
  CATransform3D v7;
  CATransform3D v8;

  -[CLKUIHandView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v7, self->_scale, self->_scale, self->_scale);
  CATransform3DRotate(&v8, &v7, self->_zRotation, 0.0, 0.0, 1.0);
  objc_msgSend(v3, "setTransform:", &v8);

  -[UIImageView layer](self->_dropShadowImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v5, self->_scale, self->_scale, self->_scale);
  CATransform3DRotate(&v6, &v5, self->_zRotation, 0.0, 0.0, 1.0);
  objc_msgSend(v4, "setTransform:", &v6);

}

- (void)setEnableBackgroundColorAction:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_enableBackgroundColorAction != a3)
  {
    v3 = a3;
    -[CALayer actions](self->_inlayLayer, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "mutableCopy");

    if (v3)
    {
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("backgroundColor"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("backgroundColor"));

    }
    -[CLKUIHandView inlayLayer](self, "inlayLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActions:", v8);

    self->_enableBackgroundColorAction = v3;
  }
}

- (CALayer)inlayLayer
{
  CALayer *inlayLayer;
  CALayer *v4;
  CALayer *v5;
  CALayer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  inlayLayer = self->_inlayLayer;
  if (!inlayLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_inlayLayer;
    self->_inlayLayer = v4;

    v6 = self->_inlayLayer;
    v14[0] = CFSTR("transform");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v14[1] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    v14[2] = CFSTR("position");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v9;
    v14[3] = CFSTR("backgroundColor");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v6, "setActions:", v11);

    -[CLKUIColoringImageView layer](self->_handImageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", self->_inlayLayer);

    -[CLKUIHandView _adjustHandImageSubviewOrder](self, "_adjustHandImageSubviewOrder");
    inlayLayer = self->_inlayLayer;
  }
  return inlayLayer;
}

- (void)setRadialShadowImage:(id)a3
{
  UIImageView *radialShadowImageView;
  UIImageView *v6;
  UIImageView *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_radialShadowImage, a3);
  radialShadowImageView = self->_radialShadowImageView;
  if (!radialShadowImageView)
  {
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v7 = self->_radialShadowImageView;
    self->_radialShadowImageView = v6;

    -[CLKUIHandView addSubview:](self, "addSubview:", self->_radialShadowImageView);
    radialShadowImageView = self->_radialShadowImageView;
  }
  -[UIImageView setImage:](radialShadowImageView, "setImage:", v8);
  -[CLKUIHandView _updateShadows](self, "_updateShadows");

}

- (void)setShadowImageBehindHand:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *radialShadowImageView;

  v3 = a3;
  self->_shadowImageBehindHand = a3;
  radialShadowImageView = self->_radialShadowImageView;
  if (v3)
    -[CLKUIHandView sendSubviewToBack:](self, "sendSubviewToBack:", radialShadowImageView);
  else
    -[CLKUIHandView bringSubviewToFront:](self, "bringSubviewToFront:", radialShadowImageView);
}

- (void)noModelUpdate_setInlayColor:(id)a3
{
  UIColor *v5;
  UIColor **p_inlayColor;
  UIColor *inlayColor;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UIColor *v12;

  v5 = (UIColor *)a3;
  p_inlayColor = &self->_inlayColor;
  inlayColor = self->_inlayColor;
  if (inlayColor == v5)
    goto LABEL_12;
  v12 = v5;
  objc_storeStrong((id *)&self->_inlayColor, a3);
  if (!v12 || inlayColor)
  {
    if (v12 || !inlayColor)
      goto LABEL_9;
    -[CLKUIHandView inlayLayer](self, "inlayLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    -[CLKUIHandView inlayLayer](self, "inlayLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "setHidden:", v10);

LABEL_9:
  if (*p_inlayColor)
  {
    -[CLKUIHandView inlayLayer](self, "inlayLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", -[UIColor CGColor](*p_inlayColor, "CGColor"));

  }
  -[CLKUIHandView setNeedsLayout](self, "setNeedsLayout");
  v5 = v12;
LABEL_12:

}

- (void)noModelUpdate_setInlayInsets:(UIEdgeInsets)a3
{
  self->_inlayInsets = a3;
  -[CLKUIHandView _layoutInlayLayer](self, "_layoutInlayLayer");
}

- (void)setShadowsHidden:(BOOL)a3
{
  if (self->_shadowsHidden != a3)
  {
    self->_shadowsHidden = a3;
    -[CLKUIHandView _updateShadows](self, "_updateShadows");
  }
}

- (void)setRadialShadowsHidden:(BOOL)a3
{
  if (self->_radialShadowsHidden != a3)
  {
    self->_radialShadowsHidden = a3;
    -[CLKUIHandView _updateShadows](self, "_updateShadows");
  }
}

- (void)setDropShadowsHidden:(BOOL)a3
{
  if (self->_dropShadowsHidden != a3)
  {
    self->_dropShadowsHidden = a3;
    -[CLKUIHandView _updateShadows](self, "_updateShadows");
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CLKUIHandView;
  -[CLKUIHandView setHidden:](&v5, sel_setHidden_);
  -[CLKUIHandView setShadowsHidden:](self, "setShadowsHidden:", v3);
}

- (void)setNeedsLayout
{
  NSObject *v2;
  uint8_t v3[16];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUIHandView;
  -[CLKUIHandView setNeedsLayout](&v4, sel_setNeedsLayout);
  if (CLKInternalBuild() && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    CLKLoggingObjectForDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1CB9A4000, v2, OS_LOG_TYPE_DEFAULT, "AnalogHandsView-WrongThread: Hands view is not laying out on main thread.", v3, 2u);
    }

  }
}

- (void)_updateShadows
{
  _BOOL4 dropShadowsHidden;
  UIImageView *radialShadowImageView;
  UIImageView *dropShadowImageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  UIImageView *v10;

  if (CLKInternalBuild())
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_shadowsHidden)
  {
    -[UIImageView setHidden:](self->_radialShadowImageView, "setHidden:", 1);
LABEL_10:
    -[UIImageView setHidden:](self->_dropShadowImageView, "setHidden:", 1);
    -[UIImageView removeFromSuperview](self->_dropShadowImageView, "removeFromSuperview");
    dropShadowImageView = self->_dropShadowImageView;
    self->_dropShadowImageView = 0;

    return;
  }
  dropShadowsHidden = self->_dropShadowsHidden;
  if (self->_radialShadowsHidden)
  {
    -[UIImageView setHidden:](self->_radialShadowImageView, "setHidden:", 1);
  }
  else if (self->_radialShadowImage)
  {
    -[UIImageView setHidden:](self->_radialShadowImageView, "setHidden:", 0);
    radialShadowImageView = self->_radialShadowImageView;
    -[CLKUIHandView alpha](self, "alpha");
    -[UIImageView setAlpha:](radialShadowImageView, "setAlpha:");
  }
  if (dropShadowsHidden)
    goto LABEL_10;
  v6 = self->_dropShadowImageView;
  if (!v6)
  {
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v8 = self->_dropShadowImageView;
    self->_dropShadowImageView = v7;

    v6 = self->_dropShadowImageView;
  }
  -[UIImageView setImage:](v6, "setImage:", self->_dropShadowImage);
  v9 = self->_dropShadowImageView;
  if (self->_dropShadowImage)
  {
    -[UIImageView setHidden:](v9, "setHidden:", 0);
    v10 = self->_dropShadowImageView;
    -[CLKUIHandView alpha](self, "alpha");
    -[UIImageView setAlpha:](v10, "setAlpha:");
  }
  else
  {
    -[UIImageView setHidden:](v9, "setHidden:", 1);
  }
}

- (void)setDropShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_dropShadowImage, a3);
  -[CLKUIHandView _updateShadows](self, "_updateShadows");
}

- (void)noModelUpdate_setHandDotColor:(id)a3
{
  UIColor **p_handDotColor;
  id v6;
  UIColor *v7;
  id v8;

  p_handDotColor = &self->_handDotColor;
  objc_storeStrong((id *)&self->_handDotColor, a3);
  v6 = a3;
  v7 = *p_handDotColor;
  -[CLKUIHandView handDotView](self, "handDotView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)setupHandDotViewWithDiameter:(double)a3
{
  UIView *handDotView;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  handDotView = self->_handDotView;
  if (!handDotView)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v7 = self->_handDotView;
    self->_handDotView = v6;

    handDotView = self->_handDotView;
  }
  -[UIView setBounds:](handDotView, "setBounds:", 0.0, 0.0, a3, a3);
  -[UIView layer](self->_handDotView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", a3 * 0.5);

  v9 = self->_handDotView;
  -[CLKUIHandView bounds](self, "bounds");
  v11 = v10;
  -[CLKUIHandView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anchorPoint");
  v14 = v11 * v13;
  -[CLKUIHandView bounds](self, "bounds");
  v16 = v15;
  -[CLKUIHandView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anchorPoint");
  -[UIView setCenter:](v9, "setCenter:", v14, v16 * v18);

  -[CLKUIHandView addSubview:](self, "addSubview:", self->_handDotView);
  -[CLKUIHandView _adjustHandImageSubviewOrder](self, "_adjustHandImageSubviewOrder");
}

- (void)_adjustHandImageSubviewOrder
{
  CALayer *inlayLayer;
  void *v4;

  inlayLayer = self->_inlayLayer;
  if (inlayLayer)
  {
    -[CALayer removeFromSuperlayer](inlayLayer, "removeFromSuperlayer");
    -[CLKUIColoringImageView layer](self->_handImageView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSublayer:", self->_inlayLayer);

  }
  -[CLKUIHandView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_handDotView, self->_handImageView);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CLKUIHandView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, 2, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CLKUIColoringImageView layer](self->_handImageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v10);

  }
  -[CLKUIHandView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filtersForView:style:fraction:", self, 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIView layer](self->_handDotView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v8);

  }
}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CLKUIHandView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CLKUIColoringImageView layer](self->_handImageView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v8);

  }
  -[CLKUIHandView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:", self, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIView layer](self->_handDotView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

  }
}

- (void)setAlpha:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKUIHandView;
  -[CLKUIHandView setAlpha:](&v4, sel_setAlpha_, a3);
  -[CLKUIHandView _updateShadows](self, "_updateShadows");
}

- (CLKUIHandView)initWithConfiguration:(id)a3 forDevice:(id)a4 maskedShadow:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  CLKUIHandView *v10;
  uint64_t v11;
  CLKUIAnalogHandConfiguration *configuration;
  double v13;
  double v14;
  _BOOL8 v15;
  double v16;
  double v17;
  _BOOL8 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CLKUIHandView;
  v10 = -[CLKUIHandView init](&v26, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    configuration = v10->_configuration;
    v10->_configuration = (CLKUIAnalogHandConfiguration *)v11;

    -[CLKUIAnalogHandConfiguration dropShadowOpacity](v10->_configuration, "dropShadowOpacity");
    v14 = v13;
    v15 = v13 == 0.0;
    -[CLKUIAnalogHandConfiguration radialShadowOpacity](v10->_configuration, "radialShadowOpacity");
    v17 = v16;
    v18 = v16 == 0.0;
    if (v5)
      v19 = 22;
    else
      v19 = 14;
    +[CLKUIAnalogHandFactory getAssets:forConfiguration:](CLKUIAnalogHandFactory, "getAssets:forConfiguration:", v19, v10->_configuration);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", &unk_1E86EF068);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIHandView _initWithImage:forDevice:](v10, "_initWithImage:forDevice:", v21, v9);
    -[CLKUIAnalogHandConfiguration bounds](v10->_configuration, "bounds");
    -[CLKUIHandView setBounds:](v10, "setBounds:");
    -[CLKUIAnalogHandConfiguration inlayInsets](v10->_configuration, "inlayInsets");
    -[CLKUIHandView setInlayInsets:](v10, "setInlayInsets:");
    -[CLKUIHandView setShadowsHidden:](v10, "setShadowsHidden:", 0);
    -[CLKUIHandView setDropShadowsHidden:](v10, "setDropShadowsHidden:", v15);
    -[CLKUIHandView setRadialShadowsHidden:](v10, "setRadialShadowsHidden:", v18);
    -[CLKUIAnalogHandConfiguration directionalShadowOffset](v10->_configuration, "directionalShadowOffset");
    -[CLKUIHandView setDirectionalShadowOffset:](v10, "setDirectionalShadowOffset:");
    if (v14 != 0.0)
    {
      if (v5)
        v22 = &unk_1E86EF080;
      else
        v22 = &unk_1E86EF098;
      objc_msgSend(v20, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIHandView setDropShadowImage:](v10, "setDropShadowImage:", v23);

    }
    if (v17 != 0.0)
    {
      objc_msgSend(v20, "objectForKey:", &unk_1E86EF0B0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIHandView setRadialShadowImage:](v10, "setRadialShadowImage:", v24);
      -[CLKUIHandView setShadowImageBehindHand:](v10, "setShadowImageBehindHand:", 1);

    }
  }

  return v10;
}

- (CGPoint)anchorPointFromConfiguration
{
  double v2;
  double v3;
  CGPoint result;

  -[CLKUIAnalogHandConfiguration anchorPoint](self->_configuration, "anchorPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)shadowView
{
  return self->_dropShadowImageView;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (UIImage)image
{
  return self->_image;
}

- (double)zRotation
{
  return self->_zRotation;
}

- (double)scale
{
  return self->_scale;
}

- (UIColor)inlayColor
{
  return self->_inlayColor;
}

- (UIEdgeInsets)inlayInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_inlayInsets.top;
  left = self->_inlayInsets.left;
  bottom = self->_inlayInsets.bottom;
  right = self->_inlayInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CLKUIAnalogHandConfiguration)configuration
{
  return (CLKUIAnalogHandConfiguration *)objc_getProperty(self, a2, 504, 1);
}

- (BOOL)shadowsHidden
{
  return self->_shadowsHidden;
}

- (BOOL)radialShadowsHidden
{
  return self->_radialShadowsHidden;
}

- (BOOL)dropShadowsHidden
{
  return self->_dropShadowsHidden;
}

- (UIEdgeInsets)shadowInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_shadowInsets.top;
  left = self->_shadowInsets.left;
  bottom = self->_shadowInsets.bottom;
  right = self->_shadowInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setShadowInsets:(UIEdgeInsets)a3
{
  self->_shadowInsets = a3;
}

- (UIImage)radialShadowImage
{
  return self->_radialShadowImage;
}

- (UIImage)dropShadowImage
{
  return self->_dropShadowImage;
}

- (CGPath)dropShadowPath
{
  return self->_dropShadowPath;
}

- (void)setDropShadowPath:(CGPath *)a3
{
  self->_dropShadowPath = a3;
}

- (CGPath)radialShadowPath
{
  return self->_radialShadowPath;
}

- (void)setRadialShadowPath:(CGPath *)a3
{
  self->_radialShadowPath = a3;
}

- (CGSize)directionalShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_directionalShadowOffset.width;
  height = self->_directionalShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDirectionalShadowOffset:(CGSize)a3
{
  self->_directionalShadowOffset = a3;
}

- (BOOL)shadowImageBehindHand
{
  return self->_shadowImageBehindHand;
}

- (UIColor)handDotColor
{
  return self->_handDotColor;
}

- (UIView)handDotView
{
  return self->_handDotView;
}

- (CLKUIColoringImageView)handImageView
{
  return self->_handImageView;
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)enableBackgroundColorAction
{
  return self->_enableBackgroundColorAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_handImageView, 0);
  objc_storeStrong((id *)&self->_handDotColor, 0);
  objc_storeStrong((id *)&self->_dropShadowImage, 0);
  objc_storeStrong((id *)&self->_radialShadowImage, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inlayColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_dropShadowImageView, 0);
  objc_storeStrong((id *)&self->_radialShadowImageView, 0);
  objc_storeStrong((id *)&self->_handDotView, 0);
  objc_storeStrong((id *)&self->_inlayLayer, 0);
}

@end
