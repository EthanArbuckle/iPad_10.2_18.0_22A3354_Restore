@implementation HKEmergencyCardSOSHeaderCell

- (HKEmergencyCardSOSHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKEmergencyCardSOSHeaderCell *v4;
  HKEmergencyCardSOSHeaderCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKEmergencyCardSOSHeaderCell;
  v4 = -[HKEmergencyCardSOSHeaderCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKEmergencyCardSOSHeaderCell setupSubviews](v4, "setupSubviews");
    -[HKEmergencyCardSOSHeaderCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  id v17;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_alloc(MEMORY[0x1E0DC3990]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKEmergencyCardSOSHeaderCell setHeaderLabel:](self, "setHeaderLabel:", v7);

  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontWithDescriptor:size:", v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[HKEmergencyCardSOSHeaderCell _updateTextColor](self, "_updateTextColor");
  -[HKEmergencyCardSOSHeaderCell contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v16);

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
  id v22;

  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HKEmergencyCardSOSHeaderCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v11, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKEmergencyCardSOSHeaderCell contentView](self, "contentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v20, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKEmergencyCardSOSHeaderCell;
  -[HKEmergencyCardSOSHeaderCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HKEmergencyCardSOSHeaderCell _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardSOSHeaderCell headerLabel](self, "headerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
