@implementation _HKDisplayTypeSectionedHeaderWithButtonView

- (_HKDisplayTypeSectionedHeaderWithButtonView)initWithFrame:(CGRect)a3
{
  _HKDisplayTypeSectionedHeaderWithButtonView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIButton *accessoryButton;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[5];
  _QWORD v59[6];

  v59[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)_HKDisplayTypeSectionedHeaderWithButtonView;
  v3 = -[_HKDisplayTypeSectionedHeaderView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    accessoryButton = v3->_accessoryButton;
    v3->_accessoryButton = (UIButton *)v9;

    -[UIButton titleLabel](v3->_accessoryButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    v12 = v3->_accessoryButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_accessoryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v3->_accessoryButton, "setBackgroundColor:", v14);

    -[UIButton setClipsToBounds:](v3->_accessoryButton, "setClipsToBounds:", 0);
    -[UIButton titleLabel](v3->_accessoryButton, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineBreakMode:", 0);

    -[UIButton titleLabel](v3->_accessoryButton, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumberOfLines:", 0);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v3->_accessoryButton);
    v45 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton topAnchor](v3->_accessoryButton, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v53);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v51;
    -[UIButton bottomAnchor](v3->_accessoryButton, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v47);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v18;
    -[UIButton leadingAnchor](v3->_accessoryButton, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v21;
    -[UIButton trailingAnchor](v3->_accessoryButton, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v25);

    -[_HKDisplayTypeSectionedHeaderWithButtonView _updatePreferredTitleFont](v3, "_updatePreferredTitleFont");
    -[_HKDisplayTypeSectionedHeaderView contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v17);

    -[_HKDisplayTypeSectionedHeaderView titleTrailingConstraint](v3, "titleTrailingConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 0);

    v42 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v17, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView contentView](v3, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v52);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v50;
    objc_msgSend(v17, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v43;
    objc_msgSend(v17, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView contentView](v3, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v38;
    objc_msgSend(v17, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView titleLabel](v3, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v29, 10.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v30;
    objc_msgSend(v17, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKDisplayTypeSectionedHeaderView titleLabel](v3, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v35);

  }
  return v3;
}

- (void)setAccessoryButtonAction:(id)a3
{
  UIButton *accessoryButton;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    accessoryButton = self->_accessoryButton;
    v5 = a3;
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](accessoryButton, "setTitle:forState:", v6, 0);

    -[UIButton addAction:forControlEvents:](self->_accessoryButton, "addAction:forControlEvents:", v5, 64);
    -[_HKDisplayTypeSectionedHeaderView titleWithTopMargin](self, "titleWithTopMargin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    -[_HKDisplayTypeSectionedHeaderView titleWithNoTopMargin](self, "titleWithNoTopMargin");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HKDisplayTypeSectionedHeaderWithButtonView;
  -[_HKDisplayTypeSectionedHeaderView prepareForReuse](&v4, sel_prepareForReuse);
  -[UIButton titleLabel](self->_accessoryButton, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E9C4C428);

  -[_HKDisplayTypeSectionedHeaderWithButtonView setHidden:](self, "setHidden:", 0);
}

- (void)_updatePreferredTitleFont
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKDisplayTypeSectionedHeaderWithButtonView;
  -[_HKDisplayTypeSectionedHeaderView _updatePreferredTitleFont](&v5, sel__updatePreferredTitleFont);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartOverlaySectionHeaderAccessoryButtonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_accessoryButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

}

+ (id)reuseIdentifier
{
  return CFSTR("HKChartViewControllerCollectionViewHeaderWithButtonIdentifier");
}

- (UIAction)accessoryButtonAction
{
  return self->_accessoryButtonAction;
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
  objc_storeStrong((id *)&self->_accessoryButtonAction, 0);
}

@end
