@implementation MTMaterialShadowView

+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4
{
  return (id)objc_msgSend(a1, "materialShadowViewWithRecipe:configuration:initialWeighting:", a3, a4, 1.0);
}

+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5
{
  return (id)objc_msgSend(a1, "materialShadowViewWithRecipe:configuration:initialWeighting:scaleAdjustment:", a3, a4, 0, a5);
}

+ (id)materialShadowViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = objc_alloc((Class)a1);
  +[MTMaterialView materialViewWithRecipe:configuration:initialWeighting:scaleAdjustment:](MTMaterialView, "materialViewWithRecipe:configuration:initialWeighting:scaleAdjustment:", a3, a4, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithMaterialView:", v12);
  return v13;
}

+ (id)materialShadowViewWithRecipeNamed:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc((Class)a1);
  +[MTMaterialView materialViewWithRecipeNamed:inBundle:configuration:initialWeighting:scaleAdjustment:](MTMaterialView, "materialViewWithRecipeNamed:inBundle:configuration:initialWeighting:scaleAdjustment:", v14, v13, a5, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithMaterialView:", v16);
  return v17;
}

+ (id)materialShadowViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc((Class)a1);
  +[MTMaterialView materialViewWithRecipeNamesByTraitCollection:compatibleWithTraitCollection:bundle:configuration:initialWeighting:scaleAdjustment:](MTMaterialView, "materialViewWithRecipeNamesByTraitCollection:compatibleWithTraitCollection:bundle:configuration:initialWeighting:scaleAdjustment:", v14, 0, v13, a5, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithMaterialView:", v16);
  return v17;
}

- (MTMaterialShadowView)initWithMaterialView:(id)a3
{
  id v6;
  MTMaterialShadowView *v7;
  MTMaterialShadowView *v8;
  id *p_materialView;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialShadowView.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("materialView"));

  }
  -[MTMaterialView bounds](self->_materialView, "bounds");
  v15.receiver = self;
  v15.super_class = (Class)MTMaterialShadowView;
  v7 = -[MTMaterialShadowView initWithFrame:](&v15, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[MTMaterialShadowView setAutoresizesSubviews:](v7, "setAutoresizesSubviews:", 1);
    p_materialView = (id *)&v8->_materialView;
    objc_storeStrong((id *)&v8->_materialView, a3);
    -[MTMaterialView groupNameBase](v8->_materialView, "groupNameBase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = *p_materialView;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p"), objc_opt_class(), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setGroupNameBase:", v12);

    }
    objc_msgSend(*p_materialView, "_addObserver:", v8);
    objc_msgSend(*p_materialView, "frame");
    -[MTMaterialShadowView setBounds:](v8, "setBounds:");
    -[MTMaterialShadowView addSubview:](v8, "addSubview:", *p_materialView);
    objc_msgSend(*p_materialView, "setAutoresizingMask:", 18);
  }

  return v8;
}

- (UIColor)shadowColor
{
  UIView *shadowView;
  void *v3;
  void *v4;
  void *v5;

  shadowView = self->_shadowView;
  if (shadowView)
  {
    v3 = (void *)MEMORY[0x24BDF6950];
    -[UIView layer](shadowView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v4, "shadowColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (UIColor *)v5;
}

- (void)setShadowColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[MTMaterialShadowView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[UIView layer](self->_shadowView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setShadowColor:", v6);
}

- (double)shadowOpacity
{
  void *v2;
  float v3;
  double v4;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOpacity");
  v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(double)a3
{
  double v5;
  id v6;

  -[MTMaterialShadowView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[UIView layer](self->_shadowView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v6, "setShadowOpacity:", v5);

}

- (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  -[MTMaterialShadowView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[UIView layer](self->_shadowView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowOffset:", width, height);

}

- (double)shadowRadius
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  id v5;

  -[MTMaterialShadowView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[UIView layer](self->_shadowView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowRadius:", a3);

}

- (BOOL)shadowPathIsBounds
{
  void *v2;
  char v3;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shadowPathIsBounds");

  return v3;
}

- (void)setShadowPathIsBounds:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[MTMaterialShadowView _configureShadowViewIfNecessary](self, "_configureShadowViewIfNecessary");
  -[UIView layer](self->_shadowView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowPathIsBounds:", v3);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTMaterialShadowView;
  -[MTMaterialShadowView layoutSubviews](&v3, sel_layoutSubviews);
  -[MTMaterialShadowView _configureCaptureOnlyMaterialViewIfNecessary](self, "_configureCaptureOnlyMaterialViewIfNecessary");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[MTMaterialView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", a3);
  -[MTMaterialView _setContinuousCornerRadius:](self->_captureOnlyMaterialView, "_setContinuousCornerRadius:", a3);
}

- (void)recipeNameDidChangeForMaterialView:(id)a3
{
  MTMaterialView *captureOnlyMaterialView;
  id v4;

  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  objc_msgSend(a3, "recipeName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView setRecipeName:](captureOnlyMaterialView, "setRecipeName:", v4);

}

- (void)weightingDidChangeForMaterialView:(id)a3
{
  MTMaterialView *captureOnlyMaterialView;

  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  objc_msgSend(a3, "weighting");
  -[MTMaterialView setWeighting:](captureOnlyMaterialView, "setWeighting:");
}

- (void)groupNameDidChangeForMaterialView:(id)a3
{
  MTMaterialView *captureOnlyMaterialView;
  id v4;

  captureOnlyMaterialView = self->_captureOnlyMaterialView;
  objc_msgSend(a3, "groupNameBase");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMaterialView setGroupNameBase:](captureOnlyMaterialView, "setGroupNameBase:", v4);

}

- (void)_configureShadowViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *shadowView;
  void *v6;
  UIView *v7;

  if (!self->_shadowView)
  {
    v3 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[MTMaterialShadowView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    -[UIView layer](self->_shadowView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowPathIsBounds:", 1);

    v7 = self->_shadowView;
    -[MTMaterialView _continuousCornerRadius](self->_materialView, "_continuousCornerRadius");
    -[UIView _setContinuousCornerRadius:](v7, "_setContinuousCornerRadius:");
    -[MTMaterialShadowView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_shadowView, self->_materialView);
    -[UIView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 18);
  }
}

- (void)_configureCaptureOnlyMaterialViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *captureOnlyMaterialView;
  MTMaterialView *v5;
  void *v6;
  MTMaterialView *v7;

  if (self->_shadowView && !self->_captureOnlyMaterialViewSuppliedByClient && !self->_captureOnlyMaterialView)
  {
    v3 = (MTMaterialView *)-[MTMaterialView copy](self->_materialView, "copy");
    captureOnlyMaterialView = self->_captureOnlyMaterialView;
    self->_captureOnlyMaterialView = v3;

    -[MTMaterialView setCaptureOnly:](self->_captureOnlyMaterialView, "setCaptureOnly:", 1);
    v5 = self->_captureOnlyMaterialView;
    -[MTMaterialView groupNameBase](self->_materialView, "groupNameBase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setGroupNameBase:](v5, "setGroupNameBase:", v6);

    v7 = self->_captureOnlyMaterialView;
    -[MTMaterialShadowView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v7, "setFrame:");
    -[MTMaterialShadowView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_captureOnlyMaterialView, self->_shadowView);
    -[MTMaterialView setAutoresizingMask:](self->_captureOnlyMaterialView, "setAutoresizingMask:", 18);
  }
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (BOOL)isCaptureOnlyMaterialViewSuppliedByClient
{
  return self->_captureOnlyMaterialViewSuppliedByClient;
}

- (void)setCaptureOnlyMaterialViewSuppliedByClient:(BOOL)a3
{
  self->_captureOnlyMaterialViewSuppliedByClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_captureOnlyMaterialView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
