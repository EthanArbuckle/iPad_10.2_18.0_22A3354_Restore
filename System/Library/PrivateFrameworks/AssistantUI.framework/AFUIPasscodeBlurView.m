@implementation AFUIPasscodeBlurView

- (AFUIPasscodeBlurView)initWithFrame:(CGRect)a3
{
  AFUIPasscodeBlurView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MTMaterialView *materialView;
  void *v8;
  UIView *v9;
  UIView *lightenSourceOverView;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *plusDView;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AFUIPasscodeBlurView;
  v3 = -[AFUIPasscodeBlurView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BE64058];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "materialViewWithRecipeNamed:inBundle:configuration:initialWeighting:scaleAdjustment:", CFSTR("dashBoardPasscodeBackground"), v5, 1, &__block_literal_global_8, 1.0);
    v6 = objc_claimAutoreleasedReturnValue();
    materialView = v3->_materialView;
    v3->_materialView = (MTMaterialView *)v6;

    -[MTMaterialView setShouldCrossfade:](v3->_materialView, "setShouldCrossfade:", 1);
    -[AFUIPasscodeBlurView addSubview:](v3, "addSubview:", v3->_materialView);
    -[AFUIPasscodeBlurView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    v9 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    lightenSourceOverView = v3->_lightenSourceOverView;
    v3->_lightenSourceOverView = v9;

    v11 = v3->_lightenSourceOverView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UIView layer](v3->_lightenSourceOverView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", v14);

    -[AFUIPasscodeBlurView addSubview:](v3, "addSubview:", v3->_lightenSourceOverView);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    plusDView = v3->_plusDView;
    v3->_plusDView = v15;

    -[AFUIPasscodeBlurView _setPlusDBackgroundColorWithWeighting:](v3, "_setPlusDBackgroundColorWithWeighting:", 1.0);
    -[UIView layer](v3->_plusDView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", v18);

    -[AFUIPasscodeBlurView addSubview:](v3, "addSubview:", v3->_plusDView);
  }
  return v3;
}

double __38__AFUIPasscodeBlurView_initWithFrame___block_invoke()
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
  v11.super_class = (Class)AFUIPasscodeBlurView;
  -[AFUIPasscodeBlurView layoutSubviews](&v11, sel_layoutSubviews);
  -[AFUIPasscodeBlurView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:");
  -[UIView setFrame:](self->_lightenSourceOverView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_plusDView, "setFrame:", v4, v6, v8, v10);
}

- (void)_setPlusDBackgroundColorWithWeighting:(double)a3
{
  UIView *plusDView;
  id v4;

  plusDView = self->_plusDView;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, a3 * 0.2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](plusDView, "setBackgroundColor:", v4);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusDView, 0);
  objc_storeStrong((id *)&self->_lightenSourceOverView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
