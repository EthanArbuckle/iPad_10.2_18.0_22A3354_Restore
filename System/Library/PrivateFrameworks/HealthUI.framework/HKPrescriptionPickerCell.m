@implementation HKPrescriptionPickerCell

- (HKPrescriptionPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKPrescriptionPickerCell *v4;
  HKPrescriptionPickerCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKPrescriptionPickerCell;
  v4 = -[HKPrescriptionPickerCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKPrescriptionPickerCell _setupSubviews](v4, "_setupSubviews");
    -[HKPrescriptionPickerCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
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
  UILabel *v16;
  UILabel *secondaryLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIButton *v27;
  UIButton *showDetailsButton;
  id v29;
  UILabel *v30;
  void *v31;
  UIStackView *v32;
  UIStackView *sampleInfoStackView;
  UISwitch *v34;
  UISwitch *toggleView;
  double v36;
  id v37;
  UISwitch *v38;
  void *v39;
  UIStackView *v40;
  UIStackView *contentStackView;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id location;
  _QWORD v47[2];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  -[HKPrescriptionPickerCell _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 10.0);
  -[HKPrescriptionPickerCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[HKPrescriptionPickerCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPrescriptionPickerCell setBackgroundColor:](self, "setBackgroundColor:", v5);

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
  v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v16;

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_secondaryLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v19);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v43);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("doc.text"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", v22);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("VIEW_PRESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-VRX"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v24);

  objc_msgSend(v20, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v20, "setImagePadding:", 3.0);
  objc_initWeak(&location, self);
  v25 = (void *)MEMORY[0x1E0DC3428];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __42__HKPrescriptionPickerCell__setupSubviews__block_invoke;
  v44[3] = &unk_1E9C40D30;
  objc_copyWeak(&v45, &location);
  objc_msgSend(v25, "actionWithHandler:", v44);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v20, v26);
  v27 = (UIButton *)objc_claimAutoreleasedReturnValue();
  showDetailsButton = self->_showDetailsButton;
  self->_showDetailsButton = v27;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_showDetailsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v29 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v30 = self->_secondaryLabel;
  v48[0] = self->_primaryLabel;
  v48[1] = v30;
  v48[2] = self->_showDetailsButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (UIStackView *)objc_msgSend(v29, "initWithArrangedSubviews:", v31);
  sampleInfoStackView = self->_sampleInfoStackView;
  self->_sampleInfoStackView = v32;

  -[UIStackView setAlignment:](self->_sampleInfoStackView, "setAlignment:", 1);
  -[UIStackView setAxis:](self->_sampleInfoStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_sampleInfoStackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_sampleInfoStackView, "setSpacing:", 6.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_sampleInfoStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v34 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
  toggleView = self->_toggleView;
  self->_toggleView = v34;

  -[UISwitch addTarget:action:forControlEvents:](self->_toggleView, "addTarget:action:forControlEvents:", self, sel__didToggleSwitch_, 4096);
  -[UISwitch setContentMode:](self->_toggleView, "setContentMode:", 1);
  -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_toggleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v36) = 1148846080;
  -[UISwitch setContentCompressionResistancePriority:forAxis:](self->_toggleView, "setContentCompressionResistancePriority:forAxis:", 0, v36);
  v37 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v38 = self->_toggleView;
  v47[0] = self->_sampleInfoStackView;
  v47[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (UIStackView *)objc_msgSend(v37, "initWithArrangedSubviews:", v39);
  contentStackView = self->_contentStackView;
  self->_contentStackView = v40;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_contentStackView, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_contentStackView, "setAxis:", 0);
  -[UIStackView setDistribution:](self->_contentStackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_contentStackView, "setSpacing:", 5.0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_contentStackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setDirectionalLayoutMargins:](self->_contentStackView, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  -[HKPrescriptionPickerCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", self->_contentStackView);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

}

void __42__HKPrescriptionPickerCell__setupSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapShowDetailsButton");

}

- (void)_setupConstraints
{
  UIStackView *contentStackView;
  id v3;

  contentStackView = self->_contentStackView;
  -[HKPrescriptionPickerCell contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStackView hk_alignConstraintsWithView:](contentStackView, "hk_alignConstraintsWithView:", v3);

}

- (void)prepareForReuse
{
  HKVisionPrescription *prescription;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKPrescriptionPickerCell;
  -[HKPrescriptionPickerCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UILabel setText:](self->_primaryLabel, "setText:", 0);
  -[UILabel setText:](self->_secondaryLabel, "setText:", 0);
  -[UISwitch setOn:](self->_toggleView, "setOn:", 0);
  prescription = self->_prescription;
  self->_prescription = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_didTapShowDetailsButton
{
  id v3;
  char v4;
  id v5;
  id to;

  objc_copyWeak(&to, (id *)&self->_delegate);
  v3 = objc_loadWeakRetained(&to);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(&to);
    objc_msgSend(v5, "didTapShowDetailsButtonForCell:", self);

  }
  objc_destroyWeak(&to);
}

- (void)_didToggleSwitch:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v5 = objc_loadWeakRetained(&to);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "didToggleSwitchForCell:isOn:", self, -[UISwitch isOn](self->_toggleView, "isOn"));

  }
  objc_destroyWeak(&to);

}

- (void)setPrescription:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKVisionPrescriptionType v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_storeStrong((id *)&self->_prescription, a3);
  v5 = v19;
  if (v19)
  {
    HKVisionPrescriptionTypeDetailedLongLocalizedString(v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_primaryLabel, "setText:", v6);

    objc_msgSend(v19, "dateIssued");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForDateAndTemplate(v7, 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_secondaryLabel, "setText:", v8);

    v9 = -[HKVisionPrescription prescriptionType](self->_prescription, "prescriptionType");
    v10 = CFSTR("UIA.Health.Contacts");
    if (v9 == HKVisionPrescriptionTypeGlasses)
      v10 = CFSTR("UIA.Health.Glasses");
    v11 = v10;
    HKVisionPrescriptionRawDescription(v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v12, "hk_stringByRemovingCharactersInSet:", v13);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v11, v12);
      v15 = objc_claimAutoreleasedReturnValue();

      v11 = (__CFString *)v15;
    }
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(".Cell.StaticText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", v16);

    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(".Cell.Switch"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setAccessibilityIdentifier:](self->_toggleView, "setAccessibilityIdentifier:", v17);

    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(".ViewPrescription.Button"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAccessibilityIdentifier:](self->_showDetailsButton, "setAccessibilityIdentifier:", v18);

    v5 = v19;
  }

}

- (void)setOn:(BOOL)a3
{
  -[UISwitch setOn:](self->_toggleView, "setOn:", a3);
}

- (BOOL)isOn
{
  return -[UISwitch isOn](self->_toggleView, "isOn");
}

- (HKVisionPrescription)prescription
{
  return self->_prescription;
}

- (HKPrescriptionPickerCellDelegate)delegate
{
  return (HKPrescriptionPickerCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (UIButton)showDetailsButton
{
  return self->_showDetailsButton;
}

- (void)setShowDetailsButton:(id)a3
{
  objc_storeStrong((id *)&self->_showDetailsButton, a3);
}

- (UIStackView)sampleInfoStackView
{
  return self->_sampleInfoStackView;
}

- (void)setSampleInfoStackView:(id)a3
{
  objc_storeStrong((id *)&self->_sampleInfoStackView, a3);
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsStackView, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (UISwitch)toggleView
{
  return self->_toggleView;
}

- (void)setToggleView:(id)a3
{
  objc_storeStrong((id *)&self->_toggleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_sampleInfoStackView, 0);
  objc_storeStrong((id *)&self->_showDetailsButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prescription, 0);
}

@end
