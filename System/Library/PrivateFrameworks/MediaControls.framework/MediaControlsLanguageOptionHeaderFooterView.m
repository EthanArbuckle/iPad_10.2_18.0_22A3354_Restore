@implementation MediaControlsLanguageOptionHeaderFooterView

- (MediaControlsLanguageOptionHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  MediaControlsLanguageOptionHeaderFooterView *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)MediaControlsLanguageOptionHeaderFooterView;
  v3 = -[MediaControlsLanguageOptionHeaderFooterView initWithReuseIdentifier:](&v30, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    -[MediaControlsLanguageOptionHeaderFooterView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_titleLabel);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionHeaderFooterView contentView](v3, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 20.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionHeaderFooterView contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 20.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v21;
    -[UILabel firstBaselineAnchor](v3->_titleLabel, "firstBaselineAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionHeaderFooterView contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v11, 1.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v12;
    -[MediaControlsLanguageOptionHeaderFooterView contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v15, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionHeaderFooterView setTintColor:](v3, "setTintColor:", v18);

  }
  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
