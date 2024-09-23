@implementation CPSGridButton

+ (id)buttonWithGridButton:(id)a3 templateDelegate:(id)a4
{
  char v4;
  double v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48[2];
  id v49;
  id v50;
  objc_super v51;
  id v52;
  id v53;
  id location[2];
  id v55;
  _QWORD v56[9];

  v56[8] = *MEMORY[0x24BDAC8D0];
  v55 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = 0;
  objc_storeStrong(&v53, a4);
  v51.receiver = v55;
  v51.super_class = (Class)&OBJC_METACLASS___CPSGridButton;
  v52 = objc_msgSendSuper2(&v51, sel_buttonWithType_, 0);
  if (v52)
  {
    v8 = v52;
    v9 = (id)objc_msgSend(location[0], "identifier");
    objc_msgSend(v8, "setIdentifier:");

    v4 = objc_msgSend(location[0], "isEnabled");
    objc_msgSend(v52, "setEnabled:", v4 & 1);
    v50 = (id)objc_msgSend(location[0], "image");
    objc_msgSend(v52, "setImage:forState:", v50);
    v49 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = v49;
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    objc_msgSend(v10, "setBackgroundColor:");

    objc_msgSend(v49, "_setCornerRadius:");
    objc_msgSend(v49, "setHidden:", 1);
    objc_msgSend(v52, "setFocusView:", v49);
    objc_msgSend(v52, "addSubview:", v49);
    v48[1] = (id)1;
    v48[0] = objc_alloc_init(CPSAbridgableLabel);
    objc_msgSend(v48[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = v48[0];
    v13 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    objc_msgSend(v12, "setTextColor:");

    v16 = v48[0];
    v15 = (void *)MEMORY[0x24BDF6A70];
    v14 = *MEMORY[0x24BDF77C0];
    v18 = (id)objc_msgSend(v52, "traitCollection");
    v17 = (id)objc_msgSend(v15, "preferredFontForTextStyle:compatibleWithTraitCollection:", v14);
    objc_msgSend(v16, "setFont:");

    objc_msgSend(v48[0], "setTextAlignment:", 1);
    objc_msgSend(v48[0], "setNumberOfLines:", 1);
    objc_msgSend(v48[0], "sizeToFit");
    objc_msgSend(v48[0], "setEnabled:", objc_msgSend(location[0], "isEnabled") & 1);
    LODWORD(v5) = 1148846080;
    objc_msgSend(v48[0], "setContentCompressionResistancePriority:forAxis:", 0, v5);
    objc_msgSend(v52, "addSubview:", v48[0]);
    objc_msgSend(v52, "setCustomTitleLabel:", v48[0]);
    v19 = v52;
    v43 = (id)objc_msgSend(v48[0], "centerXAnchor");
    v42 = (id)objc_msgSend(v52, "centerXAnchor");
    v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v56[0] = v41;
    v40 = (id)objc_msgSend(v48[0], "bottomAnchor");
    v39 = (id)objc_msgSend(v52, "bottomAnchor");
    v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v56[1] = v38;
    v37 = (id)objc_msgSend(v48[0], "widthAnchor");
    v36 = (id)objc_msgSend(v52, "widthAnchor");
    v35 = (id)objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:multiplier:");
    v56[2] = v35;
    v34 = (id)objc_msgSend(v48[0], "heightAnchor");
    v33 = (id)objc_msgSend(v34, "constraintEqualToConstant:", 16.0);
    v56[3] = v33;
    v32 = (id)objc_msgSend(v49, "leftAnchor");
    v31 = (id)objc_msgSend(v48[0], "leftAnchor");
    v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:", -4.0);
    v56[4] = v30;
    v29 = (id)objc_msgSend(v49, "rightAnchor");
    v28 = (id)objc_msgSend(v48[0], "rightAnchor");
    v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:constant:", 4.0);
    v56[5] = v27;
    v26 = (id)objc_msgSend(v49, "topAnchor");
    v25 = (id)objc_msgSend(v48[0], "topAnchor");
    v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:constant:", -1.0);
    v56[6] = v24;
    v23 = (id)objc_msgSend(v49, "bottomAnchor");
    v22 = (id)objc_msgSend(v48[0], "bottomAnchor");
    v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", 1.0);
    v56[7] = v21;
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 8);
    objc_msgSend(v19, "addConstraints:");

    objc_msgSend(v52, "setGridButton:", location[0]);
    objc_msgSend(v52, "setTemplateDelegate:", v53);
    v44 = v48[0];
    v45 = (id)objc_msgSend(location[0], "titleVariants");
    objc_msgSend(v44, "setTextVariants:");

    v46 = (id)objc_msgSend(v48[0], "textVariants");
    objc_msgSend(v52, "setAccessibilityUserInputLabels:");

    objc_storeStrong(v48, 0);
    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v50, 0);
  }
  v7 = v52;
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id location[2];
  CPSGridButton *v5;
  char v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5 == location[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = -[CPSGridButton isEqualToGridButton:](v5, "isEqualToGridButton:", location[0]);
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)isEqualToGridButton:(id)a3
{
  id v4;
  CPGridButton *v5;
  char v6;
  id location[2];
  CPSGridButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[CPSGridButton gridButton](v8, "gridButton");
  v4 = (id)objc_msgSend(location[0], "gridButton");
  v6 = -[CPGridButton isEqual:](v5, "isEqual:");

  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (unint64_t)hash
{
  CPGridButton *v3;
  unint64_t v4;

  v3 = -[CPSGridButton gridButton](self, "gridButton");
  v4 = -[CPGridButton hash](v3, "hash");

  return v4;
}

- (double)preferredLabelWidth
{
  uint64_t v2;
  double v3;
  NSArray *v5;
  CPGridButton *v6;
  id v7;
  id v8;
  id v9;
  double v10;
  id v11;
  id v12[2];
  CPSGridButton *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12[1] = (id)a2;
  v6 = -[CPSGridButton gridButton](self, "gridButton");
  v5 = -[CPGridButton titleVariants](v6, "titleVariants");
  v12[0] = -[NSArray firstObject](v5, "firstObject");

  v11 = objc_alloc_init(MEMORY[0x24BDF6748]);
  v2 = -[CPSAbridgableLabel lineBreakMode](v13->_customTitleLabel, "lineBreakMode");
  objc_msgSend(v11, "setLineBreakMode:", v2);
  v7 = v12[0];
  v14[0] = *MEMORY[0x24BDF65F8];
  v9 = (id)-[CPSAbridgableLabel font](v13->_customTitleLabel, "font");
  v15[0] = v9;
  v14[1] = *MEMORY[0x24BDF6628];
  v15[1] = v11;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  objc_msgSend(v7, "sizeWithAttributes:");
  v10 = v3;

  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return ceil(v10);
}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  double v5;
  CPSGridButton *v6;
  id v7;
  objc_super v8;
  SEL v9;
  CPSGridButton *v10;
  CGRect v11;
  CGRect v12;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)CPSGridButton;
  -[CPSGridButton layoutSubviews](&v8, sel_layoutSubviews);
  -[CPSGridButton bounds](v10, "bounds");
  CGRectGetWidth(v11);
  -[CPSGridButton bounds](v10, "bounds");
  CGRectGetHeight(v12);
  v6 = v10;
  UIEdgeInsetsMake();
  -[CPSGridButton setImageEdgeInsets:](v6, "setImageEdgeInsets:", v2, v3, v4, v5);
  v7 = (id)-[CPSGridButton imageView](v10, "imageView");
  objc_msgSend(v7, "setNeedsUpdateConstraints");

}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3;
  CPSAbridgableLabel *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  CPSGridButton *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSGridButton;
  -[CPUIButton setEnabled:](&v5, sel_setEnabled_, a3);
  v3 = v6;
  v4 = -[CPSGridButton customTitleLabel](v8, "customTitleLabel");
  -[CPSAbridgableLabel setEnabled:](v4, "setEnabled:", v3);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSGridButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSGridButton;
  -[CPSGridButton pressesBegan:withEvent:](&v5, sel_pressesBegan_withEvent_, location[0], v6);
  if ((_pressesContainsPressType(location[0], 4) & 1) != 0)
    -[CPSGridButton setHighlighted:](v8, "setHighlighted:", 1);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSGridButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSGridButton;
  -[CPSGridButton pressesEnded:withEvent:](&v5, sel_pressesEnded_withEvent_, location[0], v6);
  if ((_pressesContainsPressType(location[0], 4) & 1) != 0)
    -[CPSGridButton setHighlighted:](v8, "setHighlighted:", 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  CPSGridButton *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)CPSGridButton;
  -[CPSGridButton pressesCancelled:withEvent:](&v5, sel_pressesCancelled_withEvent_, location[0], v6);
  if ((_pressesContainsPressType(location[0], 4) & 1) != 0)
    -[CPSGridButton setHighlighted:](v8, "setHighlighted:", 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPSGridButton *v4;
  UIView *v5;
  UIView *v6;
  BOOL v8;
  objc_super v9;
  id v10;
  id location[2];
  CPSGridButton *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9.receiver = v12;
  v9.super_class = (Class)CPSGridButton;
  -[CPSGridButton didUpdateFocusInContext:withAnimationCoordinator:](&v9, sel_didUpdateFocusInContext_withAnimationCoordinator_, location[0], v10);
  v4 = (CPSGridButton *)(id)objc_msgSend(location[0], "nextFocusedItem");
  v8 = v4 != v12;

  if (v8)
  {
    v5 = -[CPSGridButton focusView](v12, "focusView");
    -[UIView setHidden:](v5, "setHidden:", 1);

  }
  else
  {
    v6 = -[CPSGridButton focusView](v12, "focusView");
    -[UIView setHidden:](v6, "setHidden:", 0);

  }
  -[CPSGridButton _updateLabelColor](v12, "_updateLabelColor");
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  CPGridButton *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  CPSAbridgableLabel *v8;
  UIImage *v9;
  objc_super v10;
  id location[2];
  CPSGridButton *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)CPSGridButton;
  -[CPUIButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, location[0]);
  v3 = -[CPSGridButton gridButton](v12, "gridButton");
  v9 = -[CPGridButton image](v3, "image");

  -[CPSGridButton setImage:forState:](v12, "setImage:forState:", v9, 0);
  v8 = -[CPSGridButton customTitleLabel](v12, "customTitleLabel");
  v5 = (void *)MEMORY[0x24BDF6A70];
  v4 = *MEMORY[0x24BDF77C0];
  v7 = (id)-[CPSGridButton traitCollection](v12, "traitCollection");
  v6 = (id)objc_msgSend(v5, "preferredFontForTextStyle:compatibleWithTraitCollection:", v4);
  -[CPSAbridgableLabel setFont:](v8, "setFont:");

  -[CPSGridButton _updateLabelColor](v12, "_updateLabelColor");
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_updateLabelColor
{
  id v2;
  CPSAbridgableLabel *v3;
  id v4;
  CPSAbridgableLabel *v5;

  if ((-[CPSGridButton isFocused](self, "isFocused") & 1) != 0)
  {
    v5 = -[CPSGridButton customTitleLabel](self, "customTitleLabel");
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    -[CPSAbridgableLabel setTextColor:](v5, "setTextColor:");

  }
  else
  {
    v3 = -[CPSGridButton customTitleLabel](self, "customTitleLabel");
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    -[CPSAbridgableLabel setTextColor:](v3, "setTextColor:");

  }
}

- (CPSAbridgableLabel)customTitleLabel
{
  return self->_customTitleLabel;
}

- (void)setCustomTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customTitleLabel, a3);
}

- (UIView)focusView
{
  return self->_focusView;
}

- (void)setFocusView:(id)a3
{
  objc_storeStrong((id *)&self->_focusView, a3);
}

- (CPGridButton)gridButton
{
  return self->_gridButton;
}

- (void)setGridButton:(id)a3
{
  objc_storeStrong((id *)&self->_gridButton, a3);
}

- (CPTemplateDelegate)templateDelegate
{
  return (CPTemplateDelegate *)objc_loadWeakRetained((id *)&self->_templateDelegate);
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_templateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_templateDelegate);
  objc_storeStrong((id *)&self->_gridButton, 0);
  objc_storeStrong((id *)&self->_focusView, 0);
  objc_storeStrong((id *)&self->_customTitleLabel, 0);
}

@end
