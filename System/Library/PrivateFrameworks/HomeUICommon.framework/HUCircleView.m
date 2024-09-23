@implementation HUCircleView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUCircleView)initWithFrame:(CGRect)a3
{
  HUCircleView *v3;
  HUCircleView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIView *controlCenterMaterialView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUCircleView;
  v3 = -[HUCircleView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUCircleView setOpaque:](v3, "setOpaque:", 0);
    -[HUCircleView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[HUCircleView widthAnchor](v4, "widthAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCircleView heightAnchor](v4, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    if (objc_msgSend(MEMORY[0x24BE4D198], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x24BE19B38], "controlCenterTertiaryMaterial");
      v8 = objc_claimAutoreleasedReturnValue();
      controlCenterMaterialView = v4->_controlCenterMaterialView;
      v4->_controlCenterMaterialView = (UIView *)v8;

      -[HUCircleView addSubview:](v4, "addSubview:", v4->_controlCenterMaterialView);
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v19;
  CGRect v20;

  v19.receiver = self;
  v19.super_class = (Class)HUCircleView;
  -[HUCircleView layoutSubviews](&v19, sel_layoutSubviews);
  -[HUCircleView bounds](self, "bounds");
  v3 = CGRectGetWidth(v20) * 0.5;
  -[HUCircleView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

  if (objc_msgSend(MEMORY[0x24BE4D198], "shouldUseControlCenterMaterials"))
  {
    -[HUCircleView frame](self, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[HUCircleView controlCenterMaterialView](self, "controlCenterMaterialView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[HUCircleView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cornerRadius");
    v16 = v15;
    -[HUCircleView controlCenterMaterialView](self, "controlCenterMaterialView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", v16);

  }
}

- (void)tintColorDidChange
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCircleView;
  -[HUCircleView tintColorDidChange](&v7, sel_tintColorDidChange);
  if (-[HUCircleView backgroundColorFollowsTintColor](self, "backgroundColorFollowsTintColor"))
  {
    -[HUCircleView tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCircleView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
  if (-[HUCircleView borderColorFollowsTintColor](self, "borderColorFollowsTintColor"))
  {
    -[HUCircleView tintColor](self, "tintColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[HUCircleView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderColor:", v5);

  }
}

- (void)setBackgroundColorFollowsTintColor:(BOOL)a3
{
  self->_backgroundColorFollowsTintColor = a3;
  -[HUCircleView tintColorDidChange](self, "tintColorDidChange");
}

- (void)setBorderColorFollowsTintColor:(BOOL)a3
{
  self->_borderColorFollowsTintColor = a3;
  -[HUCircleView tintColorDidChange](self, "tintColorDidChange");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cornerRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("borderColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUCircleView;
    v5 = -[HUCircleView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)backgroundColorFollowsTintColor
{
  return self->_backgroundColorFollowsTintColor;
}

- (BOOL)borderColorFollowsTintColor
{
  return self->_borderColorFollowsTintColor;
}

- (UIView)controlCenterMaterialView
{
  return self->_controlCenterMaterialView;
}

- (void)setControlCenterMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterMaterialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCenterMaterialView, 0);
}

@end
