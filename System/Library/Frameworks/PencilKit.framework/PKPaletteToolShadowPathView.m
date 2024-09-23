@implementation PKPaletteToolShadowPathView

- (PKPaletteToolShadowPathView)initWithToolConfiguration:(id)a3
{
  id v4;
  PKPaletteToolShadowPathView *v5;
  PKPaletteToolShadowPathView *v6;
  void *v7;
  id v8;
  uint64_t v9;
  UIView *v10;
  UIView *largeShadow;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  UIView *v16;
  UIView *smallShadow;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaletteToolShadowPathView;
  v5 = -[PKPaletteToolShadowPathView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[PKPaletteToolShadowPathView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[PKPaletteToolShadowPathView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 0);

    objc_msgSend(v4, "shadowPath");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGPath");

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    largeShadow = v6->_largeShadow;
    v6->_largeShadow = v10;

    -[UIView setUserInteractionEnabled:](v6->_largeShadow, "setUserInteractionEnabled:", 0);
    -[UIView layer](v6->_largeShadow, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowPath:", v9);

    -[UIView layer](v6->_largeShadow, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolShadowPathView _applyLargeShadowToLayer:](v6, "_applyLargeShadowToLayer:", v13);

    -[PKPaletteToolShadowPathView addSubview:](v6, "addSubview:", v6->_largeShadow);
    objc_msgSend(v4, "shadowPathIncludingTip");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "CGPath");

    if (v15)
      v9 = v15;
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    smallShadow = v6->_smallShadow;
    v6->_smallShadow = v16;

    -[UIView setUserInteractionEnabled:](v6->_smallShadow, "setUserInteractionEnabled:", 0);
    -[UIView layer](v6->_smallShadow, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShadowPath:", v9);

    -[UIView layer](v6->_smallShadow, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteToolShadowPathView _applySmallShadowToLayer:](v6, "_applySmallShadowToLayer:", v19);

    -[PKPaletteToolShadowPathView addSubview:](v6, "addSubview:", v6->_smallShadow);
    -[PKPaletteToolShadowPathView _updateUI](v6, "_updateUI");
  }

  return v6;
}

- (void)applyShadowToLayer:(id)a3
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  -[PKPaletteToolShadowPathView _applyLargeShadowToLayer:](self, "_applyLargeShadowToLayer:", v20);
  objc_msgSend(v20, "shadowRadius");
  v5 = v4;
  -[PKPaletteToolShadowPathView scalingFactor](self, "scalingFactor");
  objc_msgSend(v20, "setShadowRadius:", v5 * v6);
  objc_msgSend(v20, "shadowOffset");
  v8 = v7;
  -[PKPaletteToolShadowPathView scalingFactor](self, "scalingFactor");
  v10 = v8 * v9;
  objc_msgSend(v20, "shadowOffset");
  v12 = v11;
  -[PKPaletteToolShadowPathView scalingFactor](self, "scalingFactor");
  objc_msgSend(v20, "setShadowOffset:", v10, v12 * v13);
  if (-[PKPaletteToolShadowPathView edgeLocation](self, "edgeLocation") == 2)
  {
    objc_msgSend(v20, "shadowOffset");
    v15 = -v14;
    objc_msgSend(v20, "shadowOffset");
    v17 = v16;
LABEL_5:
    objc_msgSend(v20, "setShadowOffset:", v15, v17);
    goto LABEL_6;
  }
  if (-[PKPaletteToolShadowPathView edgeLocation](self, "edgeLocation") == 8)
  {
    objc_msgSend(v20, "shadowOffset");
    v15 = v18;
    objc_msgSend(v20, "shadowOffset");
    v17 = -v19;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_applyLargeShadowToLayer:(id)a3
{
  void *v3;
  id v4;
  double v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v3, "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(v6, "setShadowRadius:", 8.0);
  LODWORD(v5) = 1036831949;
  objc_msgSend(v6, "setShadowOpacity:", v5);
  objc_msgSend(v6, "setShadowOffset:", 0.0, 3.0);

}

- (void)_applySmallShadowToLayer:(id)a3
{
  void *v3;
  id v4;
  double v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v3, "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(v6, "setShadowRadius:", 1.0);
  LODWORD(v5) = 1041865114;
  objc_msgSend(v6, "setShadowOpacity:", v5);
  objc_msgSend(v6, "setShadowOffset:", 0.0, 3.0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolShadowPathView;
  -[PKPaletteToolShadowPathView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaletteToolShadowPathView bounds](self, "bounds");
  -[UIView setFrame:](self->_largeShadow, "setFrame:");
  -[PKPaletteToolShadowPathView bounds](self, "bounds");
  -[UIView setFrame:](self->_smallShadow, "setFrame:");
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    -[PKPaletteToolShadowPathView _updateUI](self, "_updateUI");
    -[PKPaletteToolShadowPathView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteToolShadowPathView _updateUI](self, "_updateUI");
    -[PKPaletteToolShadowPathView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_updateUI
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  UIView *largeShadow;
  UIView *smallShadow;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  if (-[PKPaletteToolShadowPathView edgeLocation](self, "edgeLocation") == 2)
  {
    v3 = 1.57079633;
  }
  else if (-[PKPaletteToolShadowPathView edgeLocation](self, "edgeLocation") == 8)
  {
    v3 = -1.57079633;
  }
  else
  {
    v3 = 0.0;
  }
  memset(&v14, 0, sizeof(v14));
  -[PKPaletteToolShadowPathView scalingFactor](self, "scalingFactor");
  v5 = v4;
  -[PKPaletteToolShadowPathView scalingFactor](self, "scalingFactor");
  CGAffineTransformMakeScale(&v14, v5, v6);
  v12 = v14;
  CGAffineTransformRotate(&v13, &v12, v3);
  largeShadow = self->_largeShadow;
  v11 = v13;
  -[UIView setTransform:](largeShadow, "setTransform:", &v11);
  v12 = v14;
  CGAffineTransformRotate(&v10, &v12, v3);
  smallShadow = self->_smallShadow;
  v9 = v10;
  -[UIView setTransform:](smallShadow, "setTransform:", &v9);
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = -[PKPaletteToolShadowPathView edgeLocation](self, "edgeLocation");
  v4 = 46.0;
  v5 = 106.0;
  if (v3 != 2 && v3 != 8)
  {
    v4 = 106.0;
    v5 = 46.0;
  }
  -[PKPaletteToolShadowPathView scalingFactor](self, "scalingFactor");
  v7 = v4 * v6;
  v8 = v5 * v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallShadow, 0);
  objc_storeStrong((id *)&self->_largeShadow, 0);
}

@end
