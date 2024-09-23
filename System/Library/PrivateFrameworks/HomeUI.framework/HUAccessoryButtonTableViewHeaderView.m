@implementation HUAccessoryButtonTableViewHeaderView

- (HUAccessoryButtonTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  HUAccessoryButtonTableViewHeaderView *v3;
  HUAccessoryButtonTableViewHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  v3 = -[HUAccessoryButtonTableViewHeaderView initWithReuseIdentifier:](&v13, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    -[HUAccessoryButtonTableViewHeaderView setItemSection:](v3, "setItemSection:", 0);
    -[HUAccessoryButtonTableViewHeaderView setOverrideAccessoryButtonTitle:](v4, "setOverrideAccessoryButtonTitle:", 0);
    -[HUAccessoryButtonTableViewHeaderView defaultAccessoryButtonFont](v4, "defaultAccessoryButtonFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryButtonTableViewHeaderView setAccessoryButtonFont:](v4, "setAccessoryButtonFont:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryButtonTableViewHeaderView setTintColor:](v4, "setTintColor:", v6);

    -[HUAccessoryButtonTableViewHeaderView setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryButtonTableViewHeaderView setAccessoryButton:](v4, "setAccessoryButton:", v7);

    -[HUAccessoryButtonTableViewHeaderView accessoryButton](v4, "accessoryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUAccessoryButtonTableViewHeaderView accessoryButton](v4, "accessoryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", v4, sel_accessoryButtonPressed, 64);

    -[HUAccessoryButtonTableViewHeaderView contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryButtonTableViewHeaderView accessoryButton](v4, "accessoryButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[HUAccessoryButtonTableViewHeaderView updateUIWithAnimation:](v4, "updateUIWithAnimation:", 0);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  -[HUAccessoryButtonTableViewHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[HUAccessoryButtonTableViewHeaderView setItemSection:](self, "setItemSection:", 0);
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  -[HUAccessoryButtonTableViewHeaderView updateConstraints](&v16, sel_updateConstraints);
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[HUAccessoryButtonTableViewHeaderView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryButtonTableViewHeaderView accessoryButton](self, "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  -[HUAccessoryButtonTableViewHeaderView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryButtonTableViewHeaderView accessoryButton](self, "accessoryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v10, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  v15.receiver = self;
  v15.super_class = (Class)HUAccessoryButtonTableViewHeaderView;
  -[HUAccessoryButtonTableViewHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v15, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  v7 = v6;
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "_defaultFontForTableViewStyle:isSectionHeader:", -[HUAccessoryButtonTableViewHeaderView tableViewStyle](self, "tableViewStyle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_scaledValueForValue:", 40.0);
  v12 = v9 + v11;

  v13 = v7;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)defaultAccessoryButtonFont
{
  return (id)objc_msgSend((id)objc_opt_class(), "_defaultFontForTableViewStyle:isSectionHeader:", -[HUAccessoryButtonTableViewHeaderView tableViewStyle](self, "tableViewStyle"), 1);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[HUAccessoryButtonTableViewHeaderView itemSection](self, "itemSection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerAccessoryButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAccessoryButtonTableViewHeaderView overrideAccessoryButtonTitle](self, "overrideAccessoryButtonTitle");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  objc_msgSend(v9, "localizedUppercaseString");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[HUAccessoryButtonTableViewHeaderView accessoryButton](self, "accessoryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v17, 0);

  -[HUAccessoryButtonTableViewHeaderView accessoryButton](self, "accessoryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryButtonTableViewHeaderView accessoryButtonFont](self, "accessoryButtonFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  -[HUAccessoryButtonTableViewHeaderView accessoryButton](self, "accessoryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryButtonTableViewHeaderView tintColor](self, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleColor:forState:", v15, 0);

  -[HUAccessoryButtonTableViewHeaderView accessoryButton](self, "accessoryButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNeedsLayout");

}

- (void)accessoryButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUAccessoryButtonTableViewHeaderView itemSection](self, "itemSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerAccessoryButtonDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUAccessoryButtonTableViewHeaderView itemSection](self, "itemSection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headerAccessoryButtonDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryButtonTableViewHeaderView itemSection](self, "itemSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemSection:accessoryButtonPressedInHeader:", v6, self);

  }
}

- (HFItemSection)itemSection
{
  return self->itemSection;
}

- (void)setItemSection:(id)a3
{
  objc_storeStrong((id *)&self->itemSection, a3);
}

- (NSString)overrideAccessoryButtonTitle
{
  return self->_overrideAccessoryButtonTitle;
}

- (void)setOverrideAccessoryButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_overrideAccessoryButtonTitle, a3);
}

- (UIFont)accessoryButtonFont
{
  return self->_accessoryButtonFont;
}

- (void)setAccessoryButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButtonFont, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_overrideAccessoryButtonTitle, 0);
  objc_storeStrong((id *)&self->itemSection, 0);
}

@end
