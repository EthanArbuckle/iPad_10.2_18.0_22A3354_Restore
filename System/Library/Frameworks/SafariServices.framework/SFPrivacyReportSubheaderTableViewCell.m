@implementation SFPrivacyReportSubheaderTableViewCell

- (SFPrivacyReportSubheaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportSubheaderTableViewCell *v4;
  UILabel *v5;
  UILabel *subheaderLabel;
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
  NSString *subheaderText;
  SFPrivacyReportSubheaderTableViewCell *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)SFPrivacyReportSubheaderTableViewCell;
  v4 = -[SFPrivacyReportSubheaderTableViewCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subheaderLabel = v4->_subheaderLabel;
    v4->_subheaderLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_subheaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subheaderLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_subheaderLabel, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subheaderLabel, "setTextColor:", v8);

    -[UILabel setNumberOfLines:](v4->_subheaderLabel, "setNumberOfLines:", 0);
    -[SFPrivacyReportSubheaderTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_subheaderLabel);
    objc_msgSend(v9, "layoutMarginsGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v4->_subheaderLabel, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;
    objc_msgSend(v10, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    -[UILabel trailingAnchor](v4->_subheaderLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v11;
    -[UILabel topAnchor](v4->_subheaderLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v13, 2.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v14;
    objc_msgSend(v9, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_subheaderLabel, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v16, 0.5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v18);

    subheaderText = v4->_subheaderText;
    v4->_subheaderText = (NSString *)&stru_1E4AC8470;

    v20 = v4;
  }

  return v4;
}

- (void)setSubheaderText:(id)a3
{
  NSString *v4;
  NSString *subheaderText;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_subheaderText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    subheaderText = self->_subheaderText;
    self->_subheaderText = v4;

    objc_msgSend(v7, "localizedUppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_subheaderLabel, "setText:", v6);

  }
}

- (NSString)subheaderText
{
  return self->_subheaderText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheaderText, 0);
  objc_storeStrong((id *)&self->_subheaderLabel, 0);
}

@end
