@implementation MFComposeActionCardTitleView

- (MFComposeActionCardTitleView)initWithFrame:(CGRect)a3
{
  MFComposeActionCardTitleView *v3;
  MFComposeActionCardTitleView *v4;
  id v5;
  uint64_t v6;
  UILabel *titleLabel;
  void *v8;
  uint64_t v9;
  UIButton *closeButton;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)MFComposeActionCardTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFComposeActionCardTitleView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    -[_UINavigationBarTitleView setHideStandardTitle:](v4, "setHideStandardTitle:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B60], 1024);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v8);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
    v9 = objc_claimAutoreleasedReturnValue();
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFComposeActionCardTitleView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[MFComposeActionCardTitleView addSubview:](v4, "addSubview:", v4->_closeButton);
    v11 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeActionCardTitleView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", 8.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    -[UILabel centerYAnchor](v4->_titleLabel, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeActionCardTitleView centerYAnchor](v4, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v21;
    -[MFComposeActionCardTitleView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v4->_closeButton, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 8.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v15;
    -[UIButton centerYAnchor](v4->_closeButton, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeActionCardTitleView centerYAnchor](v4, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v19);

    -[MFComposeActionCardTitleView _updateHeightForCurrentTraits](v4, "_updateHeightForCurrentTraits");
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeActionCardTitleView;
  -[MFComposeActionCardTitleView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[MFComposeActionCardTitleView _updateHeightForCurrentTraits](self, "_updateHeightForCurrentTraits");

}

- (void)_updateHeightForCurrentTraits
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  -[MFComposeActionCardTitleView traitCollection](self, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightForTraitCollection:");
  -[_UINavigationBarTitleView setHeight:](self, "setHeight:");

}

+ (double)heightForTraitCollection:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;

  v3 = a3;
  if (objc_msgSend(v3, "verticalSizeClass") == 1 && objc_msgSend(v3, "horizontalSizeClass") == 1)
    v4 = 0x4047000000000000;
  else
    v4 = 0x404D000000000000;
  v5 = *(double *)&v4;

  return v5;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
