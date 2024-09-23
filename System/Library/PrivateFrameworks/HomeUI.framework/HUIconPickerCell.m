@implementation HUIconPickerCell

- (HUIconPickerCell)initWithFrame:(CGRect)a3
{
  HUIconPickerCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HUIconPickerCell;
  v3 = -[HUIconPickerCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D33720]);
    -[HUIconPickerCell bounds](v3, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:contentMode:", 1);
    -[HUIconPickerCell setIconView:](v3, "setIconView:", v5);

    -[HUIconPickerCell iconView](v3, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIconSize:", 5);

    -[HUIconPickerCell iconView](v3, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

    -[HUIconPickerCell iconView](v3, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableContinuousAnimation:", 1);

    -[HUIconPickerCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconPickerCell iconView](v3, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[HUIconPickerCell bounds](v3, "bounds");
    v12 = (void *)objc_msgSend(v11, "initWithFrame:");
    -[HUIconPickerCell setSelectedBackgroundView:](v3, "setSelectedBackgroundView:", v12);

    -[HUIconPickerCell selectedBackgroundView](v3, "selectedBackgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 7.0);

    -[HUIconPickerCell selectedBackgroundView](v3, "selectedBackgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconPickerCell selectedBackgroundView](v3, "selectedBackgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

  }
  return v3;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)HUIconPickerCell;
  -[HUIconPickerCell layoutSubviews](&v8, sel_layoutSubviews);
  -[HUIconPickerCell bounds](self, "bounds");
  v10 = CGRectInset(v9, 5.0, 5.0);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  -[HUIconPickerCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (void)_updateIconDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CEA650];
  v5 = *MEMORY[0x1E0CEB538];
  v6 = a3;
  objc_msgSend(v4, "configurationWithTextStyle:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageIconDescriptorWithUpdatedImageSymbolConfiguration:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HUIconPickerCell iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithIconDescriptor:displayStyle:animated:", v11, 1, 1);

  -[HUIconPickerCell _iconTintColor](self, "_iconTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerCell iconView](self, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUIconPickerCell;
  -[HUIconPickerCell setSelected:](&v5, sel_setSelected_, a3);
  -[HUIconPickerCell iconDescriptor](self, "iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerCell _updateIconDescriptor:](self, "_updateIconDescriptor:", v4);

}

- (void)setSelectedTintColor:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_selectedTintColor, a3);
  -[HUIconPickerCell iconDescriptor](self, "iconDescriptor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerCell _updateIconDescriptor:](self, "_updateIconDescriptor:", v4);

}

- (HFImageIconDescriptor)iconDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HUIconPickerCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return (HFImageIconDescriptor *)v6;
}

- (id)_iconTintColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HUIconPickerCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkMidGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkLightMidGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[HUIconPickerCell isSelected](self, "isSelected") & 1) != 0)
  {
    -[HUIconPickerCell selectedTintColor](self, "selectedTintColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)setIconDescriptor:(id)a3 andSelectedTintColor:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_selectedTintColor, a4);
  v6 = a3;
  -[HUIconPickerCell _updateIconDescriptor:](self, "_updateIconDescriptor:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;

  -[HUIconPickerCell _iconTintColor](self, "_iconTintColor", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUIconPickerCell iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
