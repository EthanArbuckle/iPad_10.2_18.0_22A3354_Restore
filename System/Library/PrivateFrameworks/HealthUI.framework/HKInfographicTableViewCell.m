@implementation HKInfographicTableViewCell

- (HKInfographicTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKInfographicTableViewCell *v4;
  HKInfographicTableViewCell *v5;
  void *v6;
  uint64_t v7;
  UILabel *titleLabel;
  void *v9;
  uint64_t v10;
  UILabel *valueLabel;
  id v12;
  uint64_t v13;
  UIView *separator;
  UIView *v15;
  void *v16;
  double v17;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  objc_super v68;
  _QWORD v69[13];

  v69[11] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)HKInfographicTableViewCell;
  v4 = -[HKInfographicTableViewCell initWithStyle:reuseIdentifier:](&v68, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->hideSeparator = 0;
    -[HKInfographicTableViewCell _titleFont](v4, "_titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell _labelWithFont:](v5, "_labelWithFont:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v7;

    -[HKInfographicTableViewCell _valueFont](v5, "_valueFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell _labelWithFont:](v5, "_labelWithFont:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    valueLabel = v5->_valueLabel;
    v5->_valueLabel = (UILabel *)v10;

    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separator = v5->_separator;
    v5->_separator = (UIView *)v13;

    v15 = v5->_separator;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView setHidden:](v5->_separator, "setHidden:", v5->hideSeparator);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_separator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    -[UILabel setTextAlignment:](v5->_valueLabel, "setTextAlignment:", 2);
    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v5->_titleLabel);

    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v5->_valueLabel);

    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v5->_separator);

    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDirectionalLayoutMargins:", 3.0, 3.0, 3.0, 3.0);

    v50 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v5->_titleLabel, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layoutMarginsGuide");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v63;
    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layoutMarginsGuide");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v58;
    -[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "layoutMarginsGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v53;
    -[UILabel leadingAnchor](v5->_valueLabel, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 3.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v49;
    -[UILabel topAnchor](v5->_valueLabel, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v5->_titleLabel, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v46;
    -[UILabel trailingAnchor](v5->_valueLabel, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layoutMarginsGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v41;
    -[UILabel bottomAnchor](v5->_valueLabel, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v38;
    -[UIView heightAnchor](v5->_separator, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 0.5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v36;
    -[UIView leadingAnchor](v5->_separator, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v69[8] = v22;
    -[UIView trailingAnchor](v5->_separator, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_valueLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69[9] = v25;
    -[UIView bottomAnchor](v5->_separator, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69[10] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v30);

    -[HKInfographicTableViewCell contentView](v5, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksToBounds:", 1);

  }
  return v5;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKInfographicTableViewCell;
  -[HKInfographicTableViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setSeparatorHidden:(BOOL)a3
{
  self->hideSeparator = a3;
  -[UIView setHidden:](self->_separator, "setHidden:");
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
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
}

- (id)_valueFont
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
    v18[1] = CFSTR("InfographicTableViewItem");
    v18[2] = CFSTR("Cell");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

    v17[0] = v5;
    v17[1] = CFSTR("InfographicTableViewItem");
    v17[2] = CFSTR("Title");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

    v16[0] = v5;
    v16[1] = CFSTR("InfographicTableViewItem");
    v16[2] = CFSTR("Value");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicTableViewCell valueLabel](self, "valueLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", v12);

  }
  else
  {
    -[HKInfographicTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
    -[HKInfographicTableViewCell titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityIdentifier:", 0);

    -[HKInfographicTableViewCell valueLabel](self, "valueLabel");
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

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
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
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
