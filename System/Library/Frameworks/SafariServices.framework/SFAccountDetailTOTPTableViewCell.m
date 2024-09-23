@implementation SFAccountDetailTOTPTableViewCell

- (SFAccountDetailTOTPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAccountDetailTOTPTableViewCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *subtitleLabel;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *verificationCodeLabel;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  uint64_t v21;
  UIStackView *titleAndVerificationCodeStackView;
  id v23;
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
  id v37;
  SFAccountDetailTOTPTableViewCell *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  uint64_t v49;
  _QWORD v50[4];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)SFAccountDetailTOTPTableViewCell;
  v4 = -[SFAccountDetailTOTPTableViewCell initWithStyle:reuseIdentifier:](&v48, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v7);

    objc_msgSend(v5, "setNumberOfLines:", 0);
    objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v5;
    objc_msgSend(v5, "setText:", v8);

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v9;

    subtitleFont();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFAccountDetailTOTPTableViewCell _attributedSubtitleStringWithRemainingSeconds:](v4, "_attributedSubtitleStringWithRemainingSeconds:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v4->_subtitleLabel, "setAttributedText:", v13);

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    verificationCodeLabel = v4->_verificationCodeLabel;
    v4->_verificationCodeLabel = v14;

    verificationCodeFont();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_verificationCodeLabel, "setFont:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_verificationCodeLabel, "setTextColor:", v17);

    -[UILabel setTextAlignment:](v4->_verificationCodeLabel, "setTextAlignment:", 2);
    -[UILabel setNumberOfLines:](v4->_verificationCodeLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_verificationCodeLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setText:](v4->_verificationCodeLabel, "setText:", CFSTR(" "));
    LODWORD(v18) = 1144766464;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_verificationCodeLabel, "setContentHuggingPriority:forAxis:", 0, v18);
    v19 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v52[0] = v5;
    v52[1] = v4->_verificationCodeLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithArrangedSubviews:", v20);
    titleAndVerificationCodeStackView = v4->_titleAndVerificationCodeStackView;
    v4->_titleAndVerificationCodeStackView = (UIStackView *)v21;

    v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v51[0] = v4->_titleAndVerificationCodeStackView;
    v51[1] = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v24);

    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v25, "setAxis:", 1);
    objc_msgSend(v25, "setSpacing:", 6.0);
    -[SFAccountDetailTOTPTableViewCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v25);

    -[SFAccountDetailTOTPTableViewCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v25, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v44;
    objc_msgSend(v25, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v40;
    objc_msgSend(v25, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v31;
    objc_msgSend(v25, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v35);

    -[SFAccountDetailTOTPTableViewCell _updateTitleAndVerificationCodeStackView](v4, "_updateTitleAndVerificationCodeStackView");
    -[SFAccountDetailTOTPTableViewCell _updateVerificationCodeLabelTextColor](v4, "_updateVerificationCodeLabelTextColor");
    v49 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)-[SFAccountDetailTOTPTableViewCell registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v36, v4, sel__updateTitleAndVerificationCodeStackView);

    v38 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_codeUpdateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFAccountDetailTOTPTableViewCell;
  -[SFAccountDetailTOTPTableViewCell dealloc](&v3, sel_dealloc);
}

- (void)configureWithGenerator:(id)a3
{
  NSTimer *codeUpdateTimer;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_generator, a3);
  if (self->_generator)
  {
    -[SFAccountDetailTOTPTableViewCell _updateCodeAndLabels](self, "_updateCodeAndLabels");
    -[SFAccountDetailTOTPTableViewCell _startTOTPTimerIfNeeded](self, "_startTOTPTimerIfNeeded");
  }
  else
  {
    -[NSTimer invalidate](self->_codeUpdateTimer, "invalidate");
    codeUpdateTimer = self->_codeUpdateTimer;
    self->_codeUpdateTimer = 0;

  }
}

- (void)_updateCodeAndLabels
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[SFAccountDetailTOTPTableViewCell _formattedCode](self, "_formattedCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_verificationCodeLabel, "setAttributedText:", v3);

  objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_sf_passwordManagerIsInDemoMode");

  if ((v5 & 1) == 0)
  {
    -[UILabel layer](self->_verificationCodeLabel, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisableUpdateMask:", 18);

  }
  -[SFAccountDetailTOTPTableViewCell _attributedSubtitleString](self, "_attributedSubtitleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v7);

  -[SFAccountDetailTOTPTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_formattedCode
{
  id v3;
  WBSTOTPGenerator *generator;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  generator = self->_generator;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTOTPGenerator codeForDate:](generator, "codeForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  if ((unint64_t)objc_msgSend(v7, "length") >= 5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v7, "insertAttributedString:atIndex:", v8, (unint64_t)-[WBSTOTPGenerator numberOfDigitsInCode](self->_generator, "numberOfDigitsInCode") >> 1);

  }
  verificationCodeFont();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaledFontForFont:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0DC3318];
  v18[0] = *MEMORY[0x1E0DC32A0];
  v18[1] = v12;
  v19[0] = v9;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "pointSize");
  objc_msgSend(v13, "numberWithDouble:", v14 * 0.15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAttributes:range:", v16, 0, objc_msgSend(v7, "length"));
  return v7;
}

- (void)_startTOTPTimerIfNeeded
{
  void *v3;
  NSTimer *v4;
  NSTimer *codeUpdateTimer;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (!self->_codeUpdateTimer)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __59__SFAccountDetailTOTPTableViewCell__startTOTPTimerIfNeeded__block_invoke;
    v10 = &unk_1E4AC1450;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 1, &v7, 0.25);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    codeUpdateTimer = self->_codeUpdateTimer;
    self->_codeUpdateTimer = v4;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTimer:forMode:", self->_codeUpdateTimer, *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __59__SFAccountDetailTOTPTableViewCell__startTOTPTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCodeAndLabels");

}

- (id)_attributedSubtitleString
{
  WBSTOTPGenerator *generator;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  generator = self->_generator;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSTOTPGenerator startDateOfIntervalContainingDate:](generator, "startDateOfIntervalContainingDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceNow");
  -[SFAccountDetailTOTPTableViewCell _attributedSubtitleStringWithRemainingSeconds:](self, "_attributedSubtitleStringWithRemainingSeconds:", -[WBSTOTPGenerator codeGenerationPeriod](self->_generator, "codeGenerationPeriod") - vcvtmd_u64_f64(-v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_attributedSubtitleStringWithRemainingSeconds:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0D8ACE8], "countdownStringForSecondsRemaining:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC32A0];
  subtitleFont();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v7);

  return v8;
}

- (void)_updateTitleAndVerificationCodeStackView
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  -[SFAccountDetailTOTPTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    v6 = 1;
  else
    v6 = 2;
  -[UIStackView setAxis:](self->_titleAndVerificationCodeStackView, "setAxis:", IsAccessibilityCategory);
  -[UIStackView setAlignment:](self->_titleAndVerificationCodeStackView, "setAlignment:", v6);
  -[SFAccountDetailTOTPTableViewCell traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutDirection");

  if ((unint64_t)(v8 + 1) >= 2)
  {
    if (v8 != 1)
      return;
    if (IsAccessibilityCategory)
      v9 = 2;
    else
      v9 = 0;
  }
  else if (IsAccessibilityCategory)
  {
    v9 = 0;
  }
  else
  {
    v9 = 2;
  }
  -[UILabel setTextAlignment:](self->_verificationCodeLabel, "setTextAlignment:", v9);
}

- (void)setOverrideVerificationCodeLabelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideVerificationCodeLabelTextColor, a3);
  -[SFAccountDetailTOTPTableViewCell _updateVerificationCodeLabelTextColor](self, "_updateVerificationCodeLabelTextColor");
}

- (void)_updateVerificationCodeLabelTextColor
{
  id v3;

  if (self->_overrideVerificationCodeLabelTextColor)
  {
    -[UILabel setTextColor:](self->_verificationCodeLabel, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_verificationCodeLabel, "setTextColor:", v3);

  }
}

- (UIColor)overrideVerificationCodeLabelTextColor
{
  return self->_overrideVerificationCodeLabelTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideVerificationCodeLabelTextColor, 0);
  objc_storeStrong((id *)&self->_codeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_titleAndVerificationCodeStackView, 0);
  objc_storeStrong((id *)&self->_verificationCodeLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
}

@end
