@implementation HKMedicalIDCallToActionTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("HKMedicalIDCallToActionTableViewCellIdentifier");
}

- (HKMedicalIDCallToActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDCallToActionTableViewCell *v4;
  HKMedicalIDCallToActionTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDCallToActionTableViewCell;
  v4 = -[HKMedicalIDCallToActionTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKMedicalIDCallToActionTableViewCell setupSubviews](v4, "setupSubviews");
    -[HKMedicalIDCallToActionTableViewCell setupConstraints](v5, "setupConstraints");
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

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKMedicalIDCallToActionTableViewCell setCallToActionLabel:](self, "setCallToActionLabel:", v3);

  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (void *)MEMORY[0x1E0DC3518];
  HKHealthKeyColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CREATE_MEDICAL_ID"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v14, v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell setActionButton:](self, "setActionButton:", v17);

  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNumberOfLines:", 0);

  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  -[HKMedicalIDCallToActionTableViewCell setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v40;
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v34;
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutMarginsGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v28;
  -[HKMedicalIDCallToActionTableViewCell callToActionLabel](self, "callToActionLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -22.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v22;
  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMarginsGuide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v16;
  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v5;
  -[HKMedicalIDCallToActionTableViewCell actionButton](self, "actionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDCallToActionTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v12);

}

- (UILabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (void)setCallToActionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_callToActionLabel, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
}

@end
