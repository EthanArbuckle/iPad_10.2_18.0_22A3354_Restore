@implementation HKOrganDonationRegisteredTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("HKOrganDonationRegisteredTableViewCell");
}

- (HKOrganDonationRegisteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKOrganDonationRegisteredTableViewCell *v4;
  HKOrganDonationRegisteredTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKOrganDonationRegisteredTableViewCell;
  v4 = -[HKOrganDonationRegisteredTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKOrganDonationRegisteredTableViewCell setupSubviews](v4, "setupSubviews");
    -[HKOrganDonationRegisteredTableViewCell setupConstraints](v5, "setupConstraints");
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKOrganDonationRegisteredTableViewCell setIntroLabel:](self, "setIntroLabel:", v3);

  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OD_REGISTERED_WITH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  v15 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKOrganDonationRegisteredTableViewCell setRegistrarLabel:](self, "setRegistrarLabel:", v15);

  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OD_REGISTRAR_DONATE_LIFE_AMERICA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v23);

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
  id v41;

  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 22.0);
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell introLabel](self, "introLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_scaledValueForValue:", 27.0);
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 16.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 16.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[HKOrganDonationRegisteredTableViewCell contentView](self, "contentView");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisteredTableViewCell registrarLabel](self, "registrarLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "lastBaselineAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 48.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

}

- (UILabel)introLabel
{
  return self->_introLabel;
}

- (void)setIntroLabel:(id)a3
{
  objc_storeStrong((id *)&self->_introLabel, a3);
}

- (UILabel)registrarLabel
{
  return self->_registrarLabel;
}

- (void)setRegistrarLabel:(id)a3
{
  objc_storeStrong((id *)&self->_registrarLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrarLabel, 0);
  objc_storeStrong((id *)&self->_introLabel, 0);
}

@end
