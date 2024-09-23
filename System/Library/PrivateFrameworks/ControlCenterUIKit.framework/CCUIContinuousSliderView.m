@implementation CCUIContinuousSliderView

- (CCUIContinuousSliderView)initWithFrame:(CGRect)a3
{
  CCUIContinuousSliderView *v3;
  CCUIContinuousSliderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  MTMaterialView *backgroundFillView;
  uint64_t v15;
  UIView *valueIndicatorClippingView;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CCUIContinuousSliderView;
  v3 = -[CCUIBaseSliderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CCUIContinuousSliderView bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    +[CCUIControlCenterMaterialView _lightFillMaterialView](CCUIControlCenterMaterialView, "_lightFillMaterialView");
    v13 = objc_claimAutoreleasedReturnValue();
    backgroundFillView = v4->_backgroundFillView;
    v4->_backgroundFillView = (MTMaterialView *)v13;

    -[MTMaterialView setUserInteractionEnabled:](v4->_backgroundFillView, "setUserInteractionEnabled:", 0);
    -[MTMaterialView setFrame:](v4->_backgroundFillView, "setFrame:", v6, v8, v10, v12);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v8, v10, v12);
    valueIndicatorClippingView = v4->_valueIndicatorClippingView;
    v4->_valueIndicatorClippingView = (UIView *)v15;

    -[UIView setUserInteractionEnabled:](v4->_valueIndicatorClippingView, "setUserInteractionEnabled:", 0);
    -[UIView setClipsToBounds:](v4->_valueIndicatorClippingView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v4->_valueIndicatorClippingView, "addSubview:", v4->_backgroundFillView);
    -[CCUIBaseSliderView glyphContainerView](v4, "glyphContainerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v4->_valueIndicatorClippingView);

    v4->_axis = 2;
  }
  return v4;
}

- (void)setAxis:(unint64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL)
    v3 = a3;
  if (v3 != self->_axis)
  {
    self->_axis = v3;
    -[CCUIContinuousSliderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContinuousSliderCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView setContinuousSliderCornerRadius:](&v5, sel_setContinuousSliderCornerRadius_);
  -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundFillView, "_setContinuousCornerRadius:", a3);
}

- (void)setValueVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView setValueVisible:](&v6, sel_setValueVisible_);
  v5 = 0.0;
  if (v3)
    v5 = 1.0;
  -[UIView setAlpha:](self->_valueIndicatorClippingView, "setAlpha:", v5);
}

- (void)applyInoperativeAppearance:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView applyInoperativeAppearance:](&v5, sel_applyInoperativeAppearance_);
  -[MTMaterialView setHasInoperativeAppearance:](self->_backgroundFillView, "setHasInoperativeAppearance:", v3);
}

- (void)layoutElasticContentViews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CCUIContinuousSliderView;
  -[CCUIBaseSliderView layoutElasticContentViews](&v19, sel_layoutElasticContentViews);
  -[CCUIBaseSliderView presentationLayoutValue](self, "presentationLayoutValue");
  v4 = v3;
  -[CCUIBaseSliderView elasticContentView](self, "elasticContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v10 = -[CCUIContinuousSliderView axis](self, "axis");
  if (v10 == 2)
    v11 = v9;
  else
    v11 = v7;
  -[CCUIContinuousSliderView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");

  v13 = v4 * v11;
  if (-[CCUIBaseSliderView shouldIntegralizeValueLayout](self, "shouldIntegralizeValueLayout"))
  {
    UIRoundToScale();
    v13 = v14;
  }
  if (v10 == 2)
  {
    v15 = 0.0;
    v16 = -(v9 - v13);
    v17 = 0.0;
  }
  else
  {
    v18 = -[CCUIContinuousSliderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v17 = v7 - v13;
    if (v18 == 1)
      v15 = -(v7 - v13);
    else
      v15 = 0.0;
    v16 = 0.0;
    if (v18 != 1)
      v17 = 0.0;
  }
  -[UIView setFrame:](self->_valueIndicatorClippingView, "setFrame:", v17);
  -[MTMaterialView setFrame:](self->_backgroundFillView, "setFrame:", v15, v16, v7, v9);
}

- (CGPoint)glyphCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[CCUIBaseSliderView glyphContainerView](self, "glyphContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (-[CCUIContinuousSliderView axis](self, "axis") == 2)
  {
    v8 = v5 * 0.5;
    v9 = v7 - v8;
  }
  else
  {
    if (-[CCUIContinuousSliderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)v8 = v5 + v7 * -0.65;
    else
      v8 = v7 * 0.65;
    v9 = v7 * 0.5;
  }
  if (-[CCUIBaseSliderView shouldIntegralizeContentLayout](self, "shouldIntegralizeContentLayout"))
  {
    -[CCUIContinuousSliderView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    UIPointRoundToScale();
    v8 = v11;
    v9 = v12;

  }
  v13 = v8;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)_length
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[CCUIContinuousSliderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CCUIContinuousSliderView axis](self, "axis");
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  if (v11 == 2)
    return CGRectGetHeight(*(CGRect *)&v12);
  else
    return CGRectGetWidth(*(CGRect *)&v12);
}

- (unint64_t)axis
{
  return self->_axis;
}

- (UIView)valueIndicatorClippingView
{
  return self->_valueIndicatorClippingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueIndicatorClippingView, 0);
  objc_storeStrong((id *)&self->_backgroundFillView, 0);
}

@end
