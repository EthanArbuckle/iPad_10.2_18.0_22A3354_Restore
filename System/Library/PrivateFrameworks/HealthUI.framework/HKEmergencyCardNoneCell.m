@implementation HKEmergencyCardNoneCell

- (HKEmergencyCardNoneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKEmergencyCardNoneCell *v4;
  HKEmergencyCardNoneCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardNoneCell;
  v4 = -[HKEmergencyCardNoneCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKEmergencyCardNoneCell setUpViews](v4, "setUpViews");
    -[HKEmergencyCardNoneCell setUpConstraints](v5, "setUpConstraints");
  }
  return v5;
}

- (void)setUpViews
{
  UILabel *v3;
  UILabel *noneLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  noneLabel = self->_noneLabel;
  self->_noneLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noneLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_noneLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_noneLabel, "setNumberOfLines:", 2);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_noneLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_noneLabel, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_NONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_noneLabel, "setText:", v8);

  -[HKEmergencyCardNoneCell contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_noneLabel);

}

- (void)setUpConstraints
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_noneLabel, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardNoneCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  -[UILabel leadingAnchor](self->_noneLabel, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardNoneCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v14, 16.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  -[HKEmergencyCardNoneCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_noneLabel, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v6;
  -[HKEmergencyCardNoneCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_noneLabel, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noneLabel, 0);
}

@end
