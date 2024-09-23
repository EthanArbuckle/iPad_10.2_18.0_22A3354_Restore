@implementation CNFRegSettingsTemporaryPhoneCell

- (CNFRegSettingsTemporaryPhoneCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNFRegSettingsTemporaryPhoneCell *v4;
  UILabel *v5;
  UILabel *phoneNumberLabel;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *expirationLabel;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *descriptionLabel;
  void *v18;
  void *v19;
  const __CFString *v20;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)CNFRegSettingsTemporaryPhoneCell;
  v4 = -[CNFRegSettingsTemporaryPhoneCell initWithStyle:reuseIdentifier:](&v62, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    phoneNumberLabel = v4->_phoneNumberLabel;
    v4->_phoneNumberLabel = v5;

    -[UILabel setText:](v4->_phoneNumberLabel, "setText:", &stru_24D077260);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_phoneNumberLabel, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_phoneNumberLabel, "setFont:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_phoneNumberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_phoneNumberLabel);

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    expirationLabel = v4->_expirationLabel;
    v4->_expirationLabel = v10;

    -[UILabel setText:](v4->_expirationLabel, "setText:", &stru_24D077260);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_expirationLabel, "setTextColor:", v12);

    v13 = *MEMORY[0x24BEBE220];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_expirationLabel, "setFont:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_expirationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_expirationLabel);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = v16;

    LODWORD(v15) = _os_feature_enabled_impl();
    CommunicationsSetupUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v15)
      v20 = CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_DESCRIPTION_APPLEACCOUNT");
    else
      v20 = CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_DESCRIPTION");
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24D077260, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->_descriptionLabel, "setText:", v21);

    -[UILabel setNumberOfLines:](v4->_descriptionLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_descriptionLabel, "setTextColor:", v22);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_descriptionLabel, "setFont:", v23);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_descriptionLabel);

    -[UILabel topAnchor](v4->_phoneNumberLabel, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_phoneNumberLabel, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[UILabel centerYAnchor](v4->_expirationLabel, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v4->_phoneNumberLabel, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_expirationLabel, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[UILabel topAnchor](v4->_descriptionLabel, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_phoneNumberLabel, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 8.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_descriptionLabel, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_descriptionLabel, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    -[UILabel bottomAnchor](v4->_descriptionLabel, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSettingsTemporaryPhoneCell contentView](v4, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "layoutMarginsGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

  }
  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNFRegSettingsTemporaryPhoneCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v15, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("cnfreg-temp-alias"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsTemporaryPhoneCell phoneNumberLabel](self, "phoneNumberLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  v8 = (void *)MEMORY[0x24BDD17C8];
  CommunicationsSetupUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACETIME_SETTINGS_TEMPORARY_PHONE_DAYS_REMAINING"), &stru_24D077260, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v11, -[CNFRegSettingsTemporaryPhoneCell daysUntilExpiration:](self, "daysUntilExpiration:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegSettingsTemporaryPhoneCell expirationLabel](self, "expirationLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

}

- (unint64_t)daysUntilExpiration:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSinceNow");
  if (v3 >= 0.0)
    return (unint64_t)v3 / 0x15180;
  else
    return 0;
}

- (UILabel)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberLabel, a3);
}

- (UILabel)expirationLabel
{
  return self->_expirationLabel;
}

- (void)setExpirationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_expirationLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
}

@end
