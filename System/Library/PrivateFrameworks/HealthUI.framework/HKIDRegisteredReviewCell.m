@implementation HKIDRegisteredReviewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("HKIDRegisteredReviewCell");
}

- (HKIDRegisteredReviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKIDRegisteredReviewCell *v4;
  HKIDRegisteredReviewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKIDRegisteredReviewCell;
  v4 = -[HKIDRegisteredReviewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKIDRegisteredReviewCell setupSubviews](v4, "setupSubviews");
    -[HKIDRegisteredReviewCell setupConstraints](v5, "setupConstraints");
    -[HKIDRegisteredReviewCell _updateForCurrentSizeCategory](v5, "_updateForCurrentSizeCategory");
  }
  return v5;
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKIDRegisteredReviewCell setTitleLabel:](self, "setTitleLabel:", v3);

  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OD_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[HKIDRegisteredReviewCell contentView](self, "contentView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

}

- (void)setupConstraints
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 60.0);
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HKIDRegisteredReviewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[HKIDRegisteredReviewCell contentView](self, "contentView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 18.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKIDRegisteredReviewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKIDRegisteredReviewCell;
  -[HKIDRegisteredReviewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKIDRegisteredReviewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKIDRegisteredReviewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

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
