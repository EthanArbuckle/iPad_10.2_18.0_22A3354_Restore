@implementation NTKCFaceDetailTitleValueEditOptionCell

- (NTKCFaceDetailTitleValueEditOptionCell)initWithEditOption:(id)a3
{
  id v5;
  void *v6;
  NTKCFaceDetailTitleValueEditOptionCell *v7;
  uint64_t v8;
  UIImageView *leadingAccessoryView;
  uint64_t v10;
  UILabel *titleLabel;
  uint64_t v12;
  UILabel *valueLabel;
  id v14;
  uint64_t v15;
  UIStackView *alignmentView;
  objc_super v18;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)NTKCFaceDetailTitleValueEditOptionCell;
  v7 = -[NTKCDetailTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, 0, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_editOption, a3);
    v7->_active = 0;
    v8 = objc_opt_new();
    leadingAccessoryView = v7->_leadingAccessoryView;
    v7->_leadingAccessoryView = (UIImageView *)v8;

    v10 = objc_opt_new();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v10;

    v12 = objc_opt_new();
    valueLabel = v7->_valueLabel;
    v7->_valueLabel = (UILabel *)v12;

    v14 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    alignmentView = v7->_alignmentView;
    v7->_alignmentView = (UIStackView *)v15;

    -[NTKCFaceDetailTitleValueEditOptionCell _setupSubviews](v7, "_setupSubviews");
  }

  return v7;
}

- (id)_checkmarkImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_reservedSizeForImage
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (double)rowHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (void)_setupSubviews
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
  UILabel *titleLabel;
  uint64_t v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *valueLabel;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v32 = (void *)objc_opt_new();
  -[UIStackView addArrangedSubview:](self->_alignmentView, "addArrangedSubview:", self->_leadingAccessoryView);
  -[UIStackView addArrangedSubview:](self->_alignmentView, "addArrangedSubview:", self->_titleLabel);
  -[UIStackView addArrangedSubview:](self->_alignmentView, "addArrangedSubview:", v32);
  -[UIStackView addArrangedSubview:](self->_alignmentView, "addArrangedSubview:", self->_valueLabel);
  -[NTKCFaceDetailTitleValueEditOptionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_alignmentView);

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_alignmentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setPreservesSuperviewLayoutMargins:](self->_alignmentView, "setPreservesSuperviewLayoutMargins:", 1);
  -[NTKCFaceDetailTitleValueEditOptionCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView leadingAnchor](self->_alignmentView, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v28;
  -[UIStackView trailingAnchor](self->_alignmentView, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v6;
  -[UIStackView topAnchor](self->_alignmentView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v9;
  -[UIStackView bottomAnchor](self->_alignmentView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v13);

  -[UIStackView setAxis:](self->_alignmentView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_alignmentView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_alignmentView, "setSpacing:", 8.0);
  -[UIImageView widthAnchor](self->_leadingAccessoryView, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailTitleValueEditOptionCell _reservedSizeForImage](self, "_reservedSizeForImage");
  objc_msgSend(v14, "constraintEqualToConstant:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  titleLabel = self->_titleLabel;
  v17 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v18);

  v19 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v19, "setTextColor:", v20);

  valueLabel = self->_valueLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](valueLabel, "setFont:", v22);

  v23 = self->_valueLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v23, "setTextColor:", v24);

  -[NTKCDetailTableViewCell setShowsSeparator:](self, "setShowsSeparator:", 1);
  -[NTKCFaceDetailTitleValueEditOptionCell setAccessoryType:](self, "setAccessoryType:", 1);

}

- (void)setActive:(BOOL)a3
{
  void *v4;
  NSString *valueText;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      -[NTKCFaceDetailTitleValueEditOptionCell _checkmarkImage](self, "_checkmarkImage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_leadingAccessoryView, "setImage:", v4);

    }
    else
    {
      -[UIImageView setImage:](self->_leadingAccessoryView, "setImage:", 0);
    }
    if (self->_active)
      valueText = self->_valueText;
    else
      valueText = 0;
    -[UILabel setText:](self->_valueLabel, "setText:", valueText);
  }
}

- (void)setTitleText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", v5);
  }

}

- (void)setValueText:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_valueText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_valueText, a3);
    if (self->_active)
      v5 = v6;
    else
      v5 = 0;
    -[UILabel setText:](self->_valueLabel, "setText:", v5);
  }

}

- (NTKEditOption)editOption
{
  return self->_editOption;
}

- (BOOL)active
{
  return self->_active;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_editOption, 0);
  objc_storeStrong((id *)&self->_alignmentView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
}

@end
