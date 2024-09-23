@implementation HKObjectPickerNoDataTableViewCell

- (HKObjectPickerNoDataTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKObjectPickerNoDataTableViewCell *v4;
  HKObjectPickerNoDataTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKObjectPickerNoDataTableViewCell;
  v4 = -[HKObjectPickerNoDataTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKObjectPickerNoDataTableViewCell _setupSubviews](v4, "_setupSubviews");
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObjectPickerNoDataTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[HKObjectPickerNoDataTableViewCell setShowLearnMoreButton:](v5, "setShowLearnMoreButton:", 1);
  }
  return v5;
}

- (void)_setupSubviews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *label;
  uint64_t v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *learnMoreButton;
  UIButton *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  UIButton *v24;
  void *v25;
  UIStackView *v26;
  UIStackView *stackView;
  void *v28;
  UIStackView *v29;
  void *v30;
  UIStackView *v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectPickerNoDataTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HKObjectPickerNoDataTableViewCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 10.0);
  -[HKObjectPickerNoDataTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  label = self->_label;
  self->_label = v9;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_label, "setAdjustsFontForContentSizeCategory:", 1);
  v11 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v12);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_label, "setTextColor:", v13);

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = (UIButton *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v5, v6, v7, v8);
  learnMoreButton = self->_learnMoreButton;
  self->_learnMoreButton = v14;

  v16 = self->_learnMoreButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v16, "setTitle:forState:", v18, 0);

  v19 = self->_learnMoreButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v19, "setTitleColor:forState:", v20, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_learnMoreButton, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_learnMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v24 = self->_learnMoreButton;
  v33[0] = self->_label;
  v33[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (UIStackView *)objc_msgSend(v23, "initWithArrangedSubviews:", v25);
  stackView = self->_stackView;
  self->_stackView = v26;

  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 1);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 4.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKObjectPickerNoDataTableViewCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", self->_stackView);

  v29 = self->_stackView;
  -[HKObjectPickerNoDataTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView hk_alignVerticalConstraintsWithView:margin:](v29, "hk_alignVerticalConstraintsWithView:margin:", v30, 16.0);

  v31 = self->_stackView;
  -[HKObjectPickerNoDataTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView hk_alignHorizontalConstraintsWithView:margin:](v31, "hk_alignHorizontalConstraintsWithView:margin:", v32, 16.0);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKObjectPickerNoDataTableViewCell;
  -[HKObjectPickerNoDataTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_label, "setText:", 0);
}

- (NSString)explanationText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setExplanationText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void)setShowLearnMoreButton:(BOOL)a3
{
  if (self->_showLearnMoreButton != a3)
  {
    if (a3)
      -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_learnMoreButton);
    else
      -[UIButton removeFromSuperview](self->_learnMoreButton, "removeFromSuperview");
    self->_showLearnMoreButton = a3;
  }
}

- (BOOL)showLearnMoreButton
{
  return self->_showLearnMoreButton;
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreButton, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
}

@end
