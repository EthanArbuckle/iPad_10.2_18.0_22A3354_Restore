@implementation HKObjectPickerTableViewCell

- (HKObjectPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5
{
  HKObjectPickerTableViewCell *v5;
  HKObjectPickerTableViewCell *v6;
  objc_super v8;

  self->_presentationOptions = a5;
  v8.receiver = self;
  v8.super_class = (Class)HKObjectPickerTableViewCell;
  v5 = -[HKObjectPickerTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v6 = v5;
  if (v5)
  {
    -[HKObjectPickerTableViewCell _setupSubviews](v5, "_setupSubviews");
    -[HKObjectPickerTableViewCell _setupConstraints](v6, "_setupConstraints");
  }
  return v6;
}

- (void)_setupSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *v11;
  UILabel *primaryLabel;
  uint64_t v13;
  void *v14;
  void *v15;
  HKAttributedTextLabel *v16;
  UILabel *secondaryLabel;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *separatorView;
  void *v22;
  id v23;
  void *v24;
  UIStackView *v25;
  UIStackView *recordDetailStackView;
  UIView *v27;
  UIView *secondSeparatorView;
  void *v29;
  HKObjectPickerDetailView *v30;
  HKObjectPickerDetailView *patientDetailView;
  id v32;
  UIView *v33;
  UIView *v34;
  void *v35;
  UIStackView *v36;
  UIStackView *labelStackView;
  UIImageView *v38;
  UIImageView *checkboxView;
  double v40;
  id v41;
  UIStackView *v42;
  void *v43;
  UIStackView *v44;
  UIStackView *contentStackView;
  double v46;
  double v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[5];
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  -[HKObjectPickerTableViewCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 10.0);
  -[HKObjectPickerTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 3);
  -[HKObjectPickerTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObjectPickerTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  v6 = objc_alloc(MEMORY[0x1E0DC3990]);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v11;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_primaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v13 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v14);

  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v15);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = -[HKAttributedTextLabel initWithFrame:]([HKAttributedTextLabel alloc], "initWithFrame:", v7, v8, v9, v10);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = &v16->super;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_secondaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v18);

  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v19);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
  separatorView = self->_separatorView;
  self->_separatorView = v20;

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v22);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v51[0] = self->_secondaryLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (UIStackView *)objc_msgSend(v23, "initWithArrangedSubviews:", v24);
  recordDetailStackView = self->_recordDetailStackView;
  self->_recordDetailStackView = v25;

  -[UIStackView setAlignment:](self->_recordDetailStackView, "setAlignment:", 1);
  -[UIStackView setAxis:](self->_recordDetailStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_recordDetailStackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_recordDetailStackView, "setSpacing:", 4.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_recordDetailStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
  secondSeparatorView = self->_secondSeparatorView;
  self->_secondSeparatorView = v27;

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_secondSeparatorView, "setBackgroundColor:", v29);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_secondSeparatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v30 = -[HKObjectPickerDetailView initWithFrame:]([HKObjectPickerDetailView alloc], "initWithFrame:", v7, v8, v9, v10);
  patientDetailView = self->_patientDetailView;
  self->_patientDetailView = v30;

  -[HKObjectPickerDetailView setTranslatesAutoresizingMaskIntoConstraints:](self->_patientDetailView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v33 = self->_separatorView;
  v50[0] = self->_primaryLabel;
  v50[1] = v33;
  v34 = self->_secondSeparatorView;
  v50[2] = self->_recordDetailStackView;
  v50[3] = v34;
  v50[4] = self->_patientDetailView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (UIStackView *)objc_msgSend(v32, "initWithArrangedSubviews:", v35);
  labelStackView = self->_labelStackView;
  self->_labelStackView = v36;

  -[UIStackView setAlignment:](self->_labelStackView, "setAlignment:", 1);
  -[UIStackView setAxis:](self->_labelStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_labelStackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_labelStackView, "setSpacing:", 12.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if ((self->_presentationOptions & 1) != 0)
  {
    v38 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    checkboxView = self->_checkboxView;
    self->_checkboxView = v38;

    -[UIImageView setContentMode:](self->_checkboxView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkboxView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v40) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_checkboxView, "setContentCompressionResistancePriority:forAxis:", 0, v40);
    v41 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v42 = self->_labelStackView;
    v49[0] = self->_checkboxView;
    v49[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (UIStackView *)objc_msgSend(v41, "initWithArrangedSubviews:", v43);
    contentStackView = self->_contentStackView;
    self->_contentStackView = v44;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](self->_contentStackView, "setAlignment:", 1);
    -[UIStackView setAxis:](self->_contentStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](self->_contentStackView, "setDistribution:", 0);
    -[UIStackView setSpacing:](self->_contentStackView, "setSpacing:", 5.0);
  }
  else
  {
    objc_storeStrong((id *)&self->_contentStackView, self->_labelStackView);
  }
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_contentStackView, "setLayoutMarginsRelativeArrangement:", 1);
  if ((self->_presentationOptions & 2) != 0)
  {
    -[HKObjectPickerTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 47.0, 0.0, 0.0);
    v46 = 16.0;
    v47 = 12.0;
  }
  else
  {
    v46 = 16.0;
    v47 = 16.0;
  }
  -[UIStackView setDirectionalLayoutMargins:](self->_contentStackView, "setDirectionalLayoutMargins:", v46, v46, v47, v46);
  -[HKObjectPickerTableViewCell _updateAccessibilityIdentifiers](self, "_updateAccessibilityIdentifiers");
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", self->_contentStackView);

}

- (void)_setupConstraints
{
  double v3;
  void *v4;
  double v5;
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
  _QWORD v43[12];

  v43[10] = *MEMORY[0x1E0C80C00];
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_contentStackView, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v39;
  -[UIStackView leadingAnchor](self->_contentStackView, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v35;
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_contentStackView, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v31;
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_contentStackView, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v26;
  -[UIView heightAnchor](self->_separatorView, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scale");
  objc_msgSend(v24, "constraintEqualToConstant:", 1.0 / v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v23;
  -[UIView leadingAnchor](self->_separatorView, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v20;
  -[UIView trailingAnchor](self->_separatorView, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v16;
  -[UIView heightAnchor](self->_secondSeparatorView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  objc_msgSend(v15, "constraintEqualToConstant:", 1.0 / v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v6;
  -[UIView leadingAnchor](self->_secondSeparatorView, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v9;
  -[UIView trailingAnchor](self->_secondSeparatorView, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v14);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKObjectPickerTableViewCell;
  -[HKObjectPickerTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  self->_checked = 0;
  -[UILabel setText:](self->_primaryLabel, "setText:", 0);
  -[UILabel setText:](self->_secondaryLabel, "setText:", 0);
  -[UIImageView setImage:](self->_checkboxView, "setImage:", 0);
  -[HKObjectPickerDetailView primaryLabel](self->_patientDetailView, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HKObjectPickerDetailView secondaryLabel](self->_patientDetailView, "secondaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

}

- (void)setChecked:(BOOL)a3
{
  void *v4;
  _BOOL4 checked;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  self->_checked = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  checked = self->_checked;
  -[UIImageView setPreferredSymbolConfiguration:](self->_checkboxView, "setPreferredSymbolConfiguration:", v4);
  if (checked)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_checkboxView, "setImage:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_checkboxView, "setImage:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_checkboxView, "setTintColor:", v8);

}

- (NSString)primaryText
{
  return -[UILabel text](self->_primaryLabel, "text");
}

- (void)setPrimaryText:(id)a3
{
  -[UILabel setText:](self->_primaryLabel, "setText:", a3);
}

- (void)setDetailItems:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  HKObjectPickerDetailView *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_detailItems, a3);
  -[UIStackView subviews](self->_recordDetailStackView, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "primaryText", (_QWORD)v24);
        v17 = (HKObjectPickerDetailView *)objc_claimAutoreleasedReturnValue();
        if (-[HKObjectPickerDetailView length](v17, "length"))
        {
          objc_msgSend(v16, "secondaryText");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");

          if (!v19)
            continue;
          v17 = -[HKObjectPickerDetailView initWithFrame:]([HKObjectPickerDetailView alloc], "initWithFrame:", v11, v12, v13, v14);
          objc_msgSend(v16, "primaryText");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKObjectPickerDetailView primaryLabel](v17, "primaryLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setText:", v20);

          objc_msgSend(v16, "secondaryText");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKObjectPickerDetailView secondaryLabel](v17, "secondaryLabel");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setText:", v22);

          -[HKObjectPickerDetailView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[UIStackView addArrangedSubview:](self->_recordDetailStackView, "addArrangedSubview:", v17);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  -[UIStackView addArrangedSubview:](self->_recordDetailStackView, "addArrangedSubview:", self->_secondaryLabel);
  -[HKObjectPickerTableViewCell _updateRecordDetailAccessibilityIdentifiers](self, "_updateRecordDetailAccessibilityIdentifiers");

}

- (NSString)secondaryText
{
  return -[UILabel text](self->_secondaryLabel, "text");
}

- (void)setSecondaryText:(id)a3
{
  -[UILabel setText:](self->_secondaryLabel, "setText:", a3);
}

- (NSAttributedString)secondaryAttributedText
{
  return -[UILabel attributedText](self->_secondaryLabel, "attributedText");
}

- (void)setSecondaryAttributedText:(id)a3
{
  -[UILabel setAttributedText:](self->_secondaryLabel, "setAttributedText:", a3);
}

- (NSString)patientName
{
  void *v2;
  void *v3;

  -[HKObjectPickerDetailView primaryLabel](self->_patientDetailView, "primaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPatientName:(id)a3
{
  HKObjectPickerDetailView *patientDetailView;
  id v4;
  id v5;

  patientDetailView = self->_patientDetailView;
  v4 = a3;
  -[HKObjectPickerDetailView primaryLabel](patientDetailView, "primaryLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSArray)patientDetails
{
  void *v2;
  void *v3;

  -[HKObjectPickerDetailView secondaryLabel](self->_patientDetailView, "secondaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setPatientDetails:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("\n"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerDetailView secondaryLabel](self->_patientDetailView, "secondaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (void)setBaseAccessibilityIdentifier:(id)a3
{
  NSString *v4;
  NSString *baseAccessibilityIdentifier;

  if (self->_baseAccessibilityIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    baseAccessibilityIdentifier = self->_baseAccessibilityIdentifier;
    self->_baseAccessibilityIdentifier = v4;

    -[HKObjectPickerTableViewCell _updateAccessibilityIdentifiers](self, "_updateAccessibilityIdentifiers");
  }
}

- (void)_updateAccessibilityIdentifiers
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
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_baseAccessibilityIdentifier, "length"))
  {
    v17[0] = self->_baseAccessibilityIdentifier;
    v17[1] = CFSTR("Primary");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", v4);

    v16[0] = self->_baseAccessibilityIdentifier;
    v16[1] = CFSTR("Secondary");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", v6);

    v15[0] = self->_baseAccessibilityIdentifier;
    v15[1] = CFSTR("PatientDetails");
    v15[2] = CFSTR("Primary");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObjectPickerDetailView primaryLabel](self->_patientDetailView, "primaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

    v14[0] = self->_baseAccessibilityIdentifier;
    v14[1] = CFSTR("PatientDetails");
    v14[2] = CFSTR("Secondary");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObjectPickerDetailView secondaryLabel](self->_patientDetailView, "secondaryLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", v11);

  }
  else
  {
    -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", 0);
    -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", 0);
    -[HKObjectPickerDetailView primaryLabel](self->_patientDetailView, "primaryLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", 0);

    -[HKObjectPickerDetailView secondaryLabel](self->_patientDetailView, "secondaryLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", 0);
  }

  -[HKObjectPickerTableViewCell _updateRecordDetailAccessibilityIdentifiers](self, "_updateRecordDetailAccessibilityIdentifiers");
}

- (void)_updateRecordDetailAccessibilityIdentifiers
{
  HKObjectPickerTableViewCell *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __objc2_class **p_superclass;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *baseAccessibilityIdentifier;
  id v11;
  uint64_t v12;
  uint64_t v13;
  HKObjectPickerTableViewCell *v14;
  __objc2_class **v15;
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
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  _BYTE v34[128];
  uint64_t v35;

  v2 = self;
  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[UIStackView subviews](self->_recordDetailStackView, "subviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    p_superclass = HKEmergencyCardBirthdateTableItem.superclass;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          baseAccessibilityIdentifier = v2->_baseAccessibilityIdentifier;
          v11 = v9;
          if (-[NSString length](baseAccessibilityIdentifier, "length"))
          {
            v33[0] = v2->_baseAccessibilityIdentifier;
            v33[1] = CFSTR("DetailItems");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
            v28 = v5;
            v12 = v4;
            v13 = v7;
            v14 = v2;
            v15 = p_superclass;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "description");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v33[2] = v17;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            HKUIJoinStringsForAutomationIdentifier(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setAccessibilityIdentifier:", v19);

            objc_msgSend(v18, "arrayByAddingObject:", CFSTR("Primary"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            HKUIJoinStringsForAutomationIdentifier(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "primaryLabel");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setAccessibilityIdentifier:", v21);

            objc_msgSend(v18, "arrayByAddingObject:", CFSTR("Secondary"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            HKUIJoinStringsForAutomationIdentifier(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "secondaryLabel");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "setAccessibilityIdentifier:", v24);
            p_superclass = v15;
            v2 = v14;
            v7 = v13;
            v4 = v12;
            v5 = v28;

          }
          else
          {
            objc_msgSend(v11, "setAccessibilityIdentifier:", 0);
            objc_msgSend(v11, "primaryLabel");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setAccessibilityIdentifier:", 0);

            objc_msgSend(v11, "secondaryLabel");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "setAccessibilityIdentifier:", 0);
          }

          ++v5;
        }
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (BOOL)checked
{
  return self->_checked;
}

- (NSArray)detailItems
{
  return self->_detailItems;
}

- (NSString)baseAccessibilityIdentifier
{
  return self->_baseAccessibilityIdentifier;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UIStackView)recordDetailStackView
{
  return self->_recordDetailStackView;
}

- (void)setRecordDetailStackView:(id)a3
{
  objc_storeStrong((id *)&self->_recordDetailStackView, a3);
}

- (HKObjectPickerDetailView)patientDetailView
{
  return self->_patientDetailView;
}

- (void)setPatientDetailView:(id)a3
{
  objc_storeStrong((id *)&self->_patientDetailView, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (UIImageView)checkboxView
{
  return self->_checkboxView;
}

- (void)setCheckboxView:(id)a3
{
  objc_storeStrong((id *)&self->_checkboxView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIView)secondSeparatorView
{
  return self->_secondSeparatorView;
}

- (void)setSecondSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_secondSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondSeparatorView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_checkboxView, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_patientDetailView, 0);
  objc_storeStrong((id *)&self->_recordDetailStackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_baseAccessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_detailItems, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
