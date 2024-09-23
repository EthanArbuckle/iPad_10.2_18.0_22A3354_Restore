@implementation CSPasscodeBackgroundView

- (CSPasscodeBackgroundView)initWithFrame:(CGRect)a3
{
  CSPasscodeBackgroundView *v3;
  UIView *v4;
  UIView *reduceTransparencyBackingView;
  void *v6;
  UIView *v7;
  UIView **p_reduceTransparencyTintingView;
  UIView *reduceTransparencyTintingView;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MTMaterialView *materialView;
  void *v17;
  UIView *v18;
  UIView *lightenSourceOverView;
  UIView *v20;
  void *v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *plusDView;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CSPasscodeBackgroundView;
  v3 = -[CSPasscodeBackgroundView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      reduceTransparencyBackingView = v3->_reduceTransparencyBackingView;
      v3->_reduceTransparencyBackingView = v4;

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPasscodeBackgroundView setReduceTransparencyBackingColor:](v3, "setReduceTransparencyBackingColor:", v6);

      -[CSPasscodeBackgroundView addSubview:](v3, "addSubview:", v3->_reduceTransparencyBackingView);
      v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      p_reduceTransparencyTintingView = &v3->_reduceTransparencyTintingView;
      reduceTransparencyTintingView = v3->_reduceTransparencyTintingView;
      v3->_reduceTransparencyTintingView = v7;

      v10 = v3->_reduceTransparencyTintingView;
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "colorWithAlphaComponent:", 0.35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v12);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0D47498];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("dashBoardPasscodeBackground"), v14, 0, &__block_literal_global_16, 0.0);
      v15 = objc_claimAutoreleasedReturnValue();
      materialView = v3->_materialView;
      v3->_materialView = (MTMaterialView *)v15;

      -[MTMaterialView setShouldCrossfade:](v3->_materialView, "setShouldCrossfade:", 1);
      -[CSPasscodeBackgroundView addSubview:](v3, "addSubview:", v3->_materialView);
      -[CSPasscodeBackgroundView layer](v3, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsGroupBlending:", 0);

      v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      lightenSourceOverView = v3->_lightenSourceOverView;
      v3->_lightenSourceOverView = v18;

      v20 = v3->_lightenSourceOverView;
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

      -[UIView layer](v3->_lightenSourceOverView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2DE0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCompositingFilter:", v23);

      -[CSPasscodeBackgroundView addSubview:](v3, "addSubview:", v3->_lightenSourceOverView);
      v24 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      p_reduceTransparencyTintingView = &v3->_plusDView;
      plusDView = v3->_plusDView;
      v3->_plusDView = v24;

      -[CSPasscodeBackgroundView _setPlusDBackgroundColorWithWeighting:](v3, "_setPlusDBackgroundColorWithWeighting:", 1.0);
      -[UIView layer](v3->_plusDView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCompositingFilter:", v12);
    }

    -[CSPasscodeBackgroundView addSubview:](v3, "addSubview:", *p_reduceTransparencyTintingView);
  }
  return v3;
}

double __42__CSPasscodeBackgroundView_initWithFrame___block_invoke()
{
  return 0.5;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSPasscodeBackgroundView;
  -[CSPasscodeBackgroundView layoutSubviews](&v11, sel_layoutSubviews);
  -[CSPasscodeBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_reduceTransparencyBackingView, "setFrame:");
  -[UIView setFrame:](self->_reduceTransparencyTintingView, "setFrame:", v4, v6, v8, v10);
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_lightenSourceOverView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_plusDView, "setFrame:", v4, v6, v8, v10);
}

- (void)setReduceTransparencyBackingColor:(id)a3
{
  UIColor *v5;
  UIColor **p_reduceTransparencyBackingColor;
  UIColor *v7;
  UIColor *v8;
  UIView *reduceTransparencyBackingView;
  void *v10;
  UIColor *v11;

  v5 = (UIColor *)a3;
  p_reduceTransparencyBackingColor = &self->_reduceTransparencyBackingColor;
  if (self->_reduceTransparencyBackingColor != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, a3);
    if (*p_reduceTransparencyBackingColor)
    {
      v7 = *p_reduceTransparencyBackingColor;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    reduceTransparencyBackingView = self->_reduceTransparencyBackingView;
    -[UIColor colorWithAlphaComponent:](v7, "colorWithAlphaComponent:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](reduceTransparencyBackingView, "setBackgroundColor:", v10);

    v5 = v11;
  }

}

- (void)setWeighting:(double)a3
{
  -[UIView setAlpha:](self->_reduceTransparencyBackingView, "setAlpha:");
  -[UIView setAlpha:](self->_reduceTransparencyTintingView, "setAlpha:", a3);
  -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", a3);
  -[UIView setAlpha:](self->_lightenSourceOverView, "setAlpha:", a3);
  -[CSPasscodeBackgroundView _setPlusDBackgroundColorWithWeighting:](self, "_setPlusDBackgroundColorWithWeighting:", a3);
}

- (void)_setPlusDBackgroundColorWithWeighting:(double)a3
{
  UIView *plusDView;
  id v4;

  plusDView = self->_plusDView;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, a3 * 0.2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](plusDView, "setBackgroundColor:", v4);

}

- (UIColor)reduceTransparencyBackingColor
{
  return self->_reduceTransparencyBackingColor;
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (UIView)lightenSourceOverView
{
  return self->_lightenSourceOverView;
}

- (void)setLightenSourceOverView:(id)a3
{
  objc_storeStrong((id *)&self->_lightenSourceOverView, a3);
}

- (UIView)plusDView
{
  return self->_plusDView;
}

- (void)setPlusDView:(id)a3
{
  objc_storeStrong((id *)&self->_plusDView, a3);
}

- (UIView)reduceTransparencyTintingView
{
  return self->_reduceTransparencyTintingView;
}

- (void)setReduceTransparencyTintingView:(id)a3
{
  objc_storeStrong((id *)&self->_reduceTransparencyTintingView, a3);
}

- (UIView)reduceTransparencyBackingView
{
  return self->_reduceTransparencyBackingView;
}

- (void)setReduceTransparencyBackingView:(id)a3
{
  objc_storeStrong((id *)&self->_reduceTransparencyBackingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyBackingView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyTintingView, 0);
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_lightenSourceOverView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, 0);
}

@end
