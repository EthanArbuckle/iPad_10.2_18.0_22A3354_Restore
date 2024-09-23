@implementation WDClinicalOnboardingRetrievingRecordsMessageCell

+ (id)defaultReuseIdentifier
{
  return CFSTR("WDClinicalOnboardingRetrievingRecordsMessageCell");
}

- (WDClinicalOnboardingRetrievingRecordsMessageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalOnboardingRetrievingRecordsMessageCell *v4;
  WDClinicalOnboardingRetrievingRecordsMessageCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingRetrievingRecordsMessageCell;
  v4 = -[WDClinicalOnboardingRetrievingRecordsMessageCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDClinicalOnboardingRetrievingRecordsMessageCell _setupSubviews](v4, "_setupSubviews");
    -[WDClinicalOnboardingRetrievingRecordsMessageCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)_setupSubviews
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
  void *v12;
  id v13;
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
  id v26;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDClinicalOnboardingRetrievingRecordsMessageCell setTitleLabel:](self, "setTitleLabel:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4AE8], 1280);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineBreakMode:", 0);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  HRLocalizedString(CFSTR("HEALTH_RECORDS_ONBOARDING_ACCOUNT_SUCCESSFULLY_CONNECTED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDClinicalOnboardingRetrievingRecordsMessageCell setMessageLabel:](self, "setMessageLabel:", v13);

  v14 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontWithDescriptor:size:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineBreakMode:", 0);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("HEALTH_RECORDS_ONBOARDING_ACCOUNT_SUCCESSFULLY_CONNECTED_MESSAGE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v25);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell setBackgroundColor:](self, "setBackgroundColor:", v26);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D2F3F0];
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7, *MEMORY[0x1E0D2F3F0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20, 12.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell titleLabel](self, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 12.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[WDClinicalOnboardingRetrievingRecordsMessageCell contentView](self, "contentView");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "safeAreaLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingRetrievingRecordsMessageCell messageLabel](self, "messageLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 44.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (NSLayoutConstraint)bottomLayoutConstraint
{
  return self->_bottomLayoutConstraint;
}

- (void)setBottomLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
