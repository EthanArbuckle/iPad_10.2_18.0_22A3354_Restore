@implementation HUQuickControlRoundButton

- (HUQuickControlRoundButton)initWithFrame:(CGRect)a3
{
  HUQuickControlRoundButton *v3;
  HUQuickControlRoundButton *v4;
  void *v5;
  uint64_t v6;
  UIView *controlCenterMaterialView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlRoundButton;
  v3 = -[HUQuickControlRoundButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUQuickControlRoundButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[HUQuickControlRoundButton setClipsToBounds:](v4, "setClipsToBounds:", 1);
    if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryMaterial");
      v6 = objc_claimAutoreleasedReturnValue();
      controlCenterMaterialView = v4->_controlCenterMaterialView;
      v4->_controlCenterMaterialView = (UIView *)v6;

      -[HUQuickControlRoundButton addSubview:](v4, "addSubview:", v4->_controlCenterMaterialView);
    }
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HUQuickControlRoundButton;
  -[HUQuickControlRoundButton layoutSubviews](&v20, sel_layoutSubviews);
  -[HUQuickControlRoundButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[HUQuickControlRoundButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    -[HUQuickControlRoundButton frame](self, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[HUQuickControlRoundButton controlCenterMaterialView](self, "controlCenterMaterialView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    -[HUQuickControlRoundButton layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cornerRadius");
    v17 = v16;
    -[HUQuickControlRoundButton controlCenterMaterialView](self, "controlCenterMaterialView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", v17);

  }
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
