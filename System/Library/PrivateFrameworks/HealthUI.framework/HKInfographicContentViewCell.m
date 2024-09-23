@implementation HKInfographicContentViewCell

- (HKInfographicContentViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKInfographicContentViewCell *v4;
  HKInfographicContentViewCell *v5;
  void *v6;
  uint64_t v7;
  UILabel *titleLabel;
  void *v9;
  uint64_t v10;
  UILabel *descriptionLabel;
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
  objc_super v49;
  _QWORD v50[9];

  v50[7] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)HKInfographicContentViewCell;
  v4 = -[HKInfographicContentViewCell initWithStyle:reuseIdentifier:](&v49, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKInfographicContentViewCell _titleFont](v4, "_titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell _labelWithFont:](v5, "_labelWithFont:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v7;

    -[HKInfographicContentViewCell _descriptionFont](v5, "_descriptionFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell _labelWithFont:](v5, "_labelWithFont:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = (UILabel *)v10;

    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_titleLabel);

    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5->_descriptionLabel);

    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDirectionalLayoutMargins:", 7.0, 7.0, 7.0, 7.0);

    v36 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v5->_titleLabel, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v44;
    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v39;
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layoutMarginsGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v33;
    -[UILabel topAnchor](v5->_descriptionLabel, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 3.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v30;
    -[UILabel leadingAnchor](v5->_descriptionLabel, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v27;
    -[UILabel trailingAnchor](v5->_descriptionLabel, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v17;
    -[UILabel bottomAnchor](v5->_descriptionLabel, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v23);

    -[HKInfographicContentViewCell contentView](v5, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMasksToBounds:", 1);

  }
  return v5;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKInfographicContentViewCell;
  -[HKInfographicContentViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (id)_labelWithFont:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = (objc_class *)MEMORY[0x1E0DC3990];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setFont:", v4);

  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  objc_msgSend(v6, "setClipsToBounds:", 0);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  LODWORD(v8) = 1132068864;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  LODWORD(v9) = 1132068864;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v9);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  return v6;
}

- (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B58], 1024);
}

- (id)_descriptionFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v18[0] = v4;
    v18[1] = CFSTR("InfographicContentItem");
    v18[2] = CFSTR("Cell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    v17[0] = v5;
    v17[1] = CFSTR("InfographicContentItem");
    v17[2] = CFSTR("Title");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

    v16[0] = v5;
    v16[1] = CFSTR("InfographicContentItem");
    v16[2] = CFSTR("Description");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicContentViewCell descriptionLabel](self, "descriptionLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", v12);

  }
  else
  {
    -[HKInfographicContentViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
    -[HKInfographicContentViewCell titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityIdentifier:", 0);

    -[HKInfographicContentViewCell descriptionLabel](self, "descriptionLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityIdentifier:", 0);

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
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
