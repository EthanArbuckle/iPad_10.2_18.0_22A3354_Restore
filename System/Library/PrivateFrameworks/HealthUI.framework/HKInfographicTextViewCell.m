@implementation HKInfographicTextViewCell

- (HKInfographicTextViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKInfographicTextViewCell *v4;
  HKInfographicTextViewCell *v5;
  void *v6;
  uint64_t v7;
  UILabel *descriptionLabel;
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
  objc_super v34;
  _QWORD v35[6];

  v35[4] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)HKInfographicTextViewCell;
  v4 = -[HKInfographicTextViewCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKInfographicTextViewCell _descriptionFont](v4, "_descriptionFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell _labelWithFont:](v5, "_labelWithFont:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = (UILabel *)v7;

    -[HKInfographicTextViewCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5->_descriptionLabel);

    -[HKInfographicTextViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v5->_descriptionLabel, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell contentView](v5, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v29;
    -[UILabel leadingAnchor](v5->_descriptionLabel, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell contentView](v5, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v23;
    -[UILabel trailingAnchor](v5->_descriptionLabel, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v13;
    -[UILabel bottomAnchor](v5->_descriptionLabel, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v19);

  }
  return v5;
}

- (id)_labelWithFont:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (objc_class *)MEMORY[0x1E0DC3990];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setFont:", v5);

  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);
  -[HKInfographicTextViewCell _descriptionTextColor](self, "_descriptionTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v7, "setNumberOfLines:", 0);
  LODWORD(v9) = 1132068864;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  LODWORD(v10) = 1132068864;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v10);
  objc_msgSend(v7, "setLineBreakMode:", 0);
  return v7;
}

- (id)_descriptionFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (id)_descriptionTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (void)updateAutomationIdentifiersWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    v13[1] = CFSTR("InfographicTextItem");
    v13[2] = CFSTR("Cell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    v12[0] = v5;
    v12[1] = CFSTR("InfographicTextItem");
    v12[2] = CFSTR("Description");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTextViewCell descriptionLabel](self, "descriptionLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  }
  else
  {
    -[HKInfographicTextViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
    -[HKInfographicTextViewCell descriptionLabel](self, "descriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", 0);

  }
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
