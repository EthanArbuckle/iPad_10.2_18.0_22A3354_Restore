@implementation CAMSemanticStyleDetailView

- (CAMSemanticStyleDetailView)initWithFrame:(CGRect)a3
{
  CAMSemanticStyleDetailView *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *styleTitleLabel;
  uint64_t v13;
  UILabel *styleDescriptionLabel;
  uint64_t v15;
  UILabel *toneTitleLabel;
  void *v17;
  uint64_t v18;
  UILabel *toneValueLabel;
  uint64_t v20;
  UILabel *warmthTitleLabel;
  void *v22;
  uint64_t v23;
  UILabel *warmthValueLabel;
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
  uint64_t v36;
  void *v37;
  NSNumberFormatter *v38;
  NSNumberFormatter *integerFormatter;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSNumberFormatter *v44;
  void *v45;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  objc_super v91;
  _QWORD v92[19];

  v92[17] = *MEMORY[0x1E0C80C00];
  v91.receiver = self;
  v91.super_class = (Class)CAMSemanticStyleDetailView;
  v3 = -[CAMSemanticStyleDetailView initWithFrame:](&v91, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    CEKFontOfSizeWeightStyle();
    v4 = objc_claimAutoreleasedReturnValue();
    CEKFontOfSizeWeightStyle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    styleTitleLabel = v3->__styleTitleLabel;
    v3->__styleTitleLabel = (UILabel *)v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->__styleTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->__styleTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setFont:](v3->__styleTitleLabel, "setFont:", v5);
    -[CAMSemanticStyleDetailView addSubview:](v3, "addSubview:", v3->__styleTitleLabel);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    styleDescriptionLabel = v3->__styleDescriptionLabel;
    v3->__styleDescriptionLabel = (UILabel *)v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->__styleDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->__styleDescriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->__styleDescriptionLabel, "setLineBreakMode:", 0);
    v90 = (void *)v4;
    -[UILabel setFont:](v3->__styleDescriptionLabel, "setFont:", v4);
    -[CAMSemanticStyleDetailView addSubview:](v3, "addSubview:", v3->__styleDescriptionLabel);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    toneTitleLabel = v3->__toneTitleLabel;
    v3->__toneTitleLabel = (UILabel *)v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->__toneTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->__toneTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setFont:](v3->__toneTitleLabel, "setFont:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->__toneTitleLabel, "setTextColor:", v17);

    -[CAMSemanticStyleDetailView addSubview:](v3, "addSubview:", v3->__toneTitleLabel);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    toneValueLabel = v3->__toneValueLabel;
    v3->__toneValueLabel = (UILabel *)v18;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->__toneValueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->__toneValueLabel, "setNumberOfLines:", 1);
    -[UILabel setFont:](v3->__toneValueLabel, "setFont:", v5);
    -[CAMSemanticStyleDetailView addSubview:](v3, "addSubview:", v3->__toneValueLabel);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    warmthTitleLabel = v3->__warmthTitleLabel;
    v3->__warmthTitleLabel = (UILabel *)v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->__warmthTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->__warmthTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setFont:](v3->__warmthTitleLabel, "setFont:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->__warmthTitleLabel, "setTextColor:", v22);

    -[CAMSemanticStyleDetailView addSubview:](v3, "addSubview:", v3->__warmthTitleLabel);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    warmthValueLabel = v3->__warmthValueLabel;
    v3->__warmthValueLabel = (UILabel *)v23;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->__warmthValueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->__warmthValueLabel, "setNumberOfLines:", 1);
    v89 = (void *)v5;
    -[UILabel setFont:](v3->__warmthValueLabel, "setFont:", v5);
    -[CAMSemanticStyleDetailView addSubview:](v3, "addSubview:", v3->__warmthValueLabel);
    v70 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->__styleTitleLabel, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView leadingAnchor](v3, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:constant:", v87, 17.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v86;
    -[UILabel trailingAnchor](v3->__styleTitleLabel, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView trailingAnchor](v3, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, -17.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v83;
    -[UILabel topAnchor](v3->__styleTitleLabel, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView topAnchor](v3, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, 12.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v80;
    -[UILabel leadingAnchor](v3->__styleDescriptionLabel, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView leadingAnchor](v3, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78, 17.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v77;
    -[UILabel trailingAnchor](v3->__styleDescriptionLabel, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView trailingAnchor](v3, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintLessThanOrEqualToAnchor:constant:", v75, -17.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v92[4] = v74;
    -[UILabel topAnchor](v3->__styleDescriptionLabel, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->__toneTitleLabel, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, 6.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v92[5] = v71;
    -[UILabel bottomAnchor](v3->__styleDescriptionLabel, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView bottomAnchor](v3, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68, -12.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v92[6] = v67;
    -[UILabel leadingAnchor](v3->__toneTitleLabel, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView leadingAnchor](v3, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65, 17.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v92[7] = v64;
    -[UILabel topAnchor](v3->__toneTitleLabel, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->__styleTitleLabel, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 1.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v92[8] = v61;
    -[UILabel leadingAnchor](v3->__toneValueLabel, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->__toneTitleLabel, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 6.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v92[9] = v58;
    -[UILabel widthAnchor](v3->__toneValueLabel, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintGreaterThanOrEqualToConstant:", 30.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v92[10] = v56;
    -[UILabel topAnchor](v3->__toneValueLabel, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->__styleTitleLabel, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 1.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v92[11] = v53;
    -[UILabel leadingAnchor](v3->__warmthTitleLabel, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->__toneValueLabel, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 9.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v92[12] = v50;
    -[UILabel topAnchor](v3->__warmthTitleLabel, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->__styleTitleLabel, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 1.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v92[13] = v47;
    -[UILabel leadingAnchor](v3->__warmthValueLabel, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->__warmthTitleLabel, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 6.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v92[14] = v27;
    -[UILabel widthAnchor](v3->__warmthValueLabel, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintGreaterThanOrEqualToConstant:", 30.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v92[15] = v29;
    -[UILabel topAnchor](v3->__warmthValueLabel, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->__styleTitleLabel, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v92[16] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v33);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSemanticStyleDetailView setBackgroundColor:](v3, "setBackgroundColor:", v34);

    -[CAMSemanticStyleDetailView layer](v3, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCornerRadius:", 16.0);

    v36 = *MEMORY[0x1E0CD2A68];
    -[CAMSemanticStyleDetailView layer](v3, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCornerCurve:", v36);

    v38 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    integerFormatter = v3->__integerFormatter;
    v3->__integerFormatter = v38;

    -[NSNumberFormatter setPositiveFormat:](v3->__integerFormatter, "setPositiveFormat:", CFSTR("0"));
    -[NSNumberFormatter setNegativeFormat:](v3->__integerFormatter, "setNegativeFormat:", CFSTR("0"));
    -[NSNumberFormatter stringFromNumber:](v3->__integerFormatter, "stringFromNumber:", &unk_1EA3B0838);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setZeroSymbol:](v3->__integerFormatter, "setZeroSymbol:", v40);

    -[NSNumberFormatter plusSign](v3->__integerFormatter, "plusSign");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setPositivePrefix:](v3->__integerFormatter, "setPositivePrefix:", v41);

    -[NSNumberFormatter minusSign](v3->__integerFormatter, "minusSign");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("-"));
    v44 = v3->__integerFormatter;
    if (v43)
    {
      -[NSNumberFormatter setNegativePrefix:](v44, "setNegativePrefix:", CFSTR("−"));
    }
    else
    {
      -[NSNumberFormatter minusSign](v44, "minusSign");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter setNegativePrefix:](v3->__integerFormatter, "setNegativePrefix:", v45);

    }
    -[CAMSemanticStyleDetailView _updateTextForCurrentStyle](v3, "_updateTextForCurrentStyle");

  }
  return v3;
}

- (void)setSemanticStyle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    -[CAMSemanticStyleDetailView _updateTextForCurrentStyle](self, "_updateTextForCurrentStyle");
  }

}

- (void)_updateTextForCurrentStyle
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
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[CAMSemanticStyleDetailView semanticStyle](self, "semanticStyle");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_SETTINGS_DETAIL_TITLE"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cam_uppercaseStringWithPreferredLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleDetailView _styleTitleLabel](self, "_styleTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[CAMSemanticStyleDetailView _descriptionForSemanticStylePreset:](self, "_descriptionForSemanticStylePreset:", objc_msgSend(v29, "presetType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleDetailView _styleDescriptionLabel](self, "_styleDescriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_CONTROL_TONE"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cam_uppercaseStringWithPreferredLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleDetailView _toneTitleLabel](self, "_toneTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[CAMSemanticStyleDetailView _integerFormatter](self, "_integerFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v29, "sceneBias");
  objc_msgSend(v15, "numberWithDouble:", v16 * 100.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleDetailView _toneValueLabel](self, "_toneValueLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  CAMLocalizedFrameworkString(CFSTR("SEMANTIC_STYLES_CONTROL_WARMTH"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cam_uppercaseStringWithPreferredLocale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleDetailView _warmthTitleLabel](self, "_warmthTitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[CAMSemanticStyleDetailView _integerFormatter](self, "_integerFormatter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v29, "warmthBias");
  objc_msgSend(v24, "numberWithDouble:", v25 * 100.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringFromNumber:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStyleDetailView _warmthValueLabel](self, "_warmthValueLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", v27);

  -[CAMSemanticStyleDetailView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_descriptionForSemanticStylePreset:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  CAMLocalizedFrameworkString(off_1EA32BB20[a3], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (UILabel)_styleTitleLabel
{
  return self->__styleTitleLabel;
}

- (UILabel)_styleDescriptionLabel
{
  return self->__styleDescriptionLabel;
}

- (UILabel)_toneTitleLabel
{
  return self->__toneTitleLabel;
}

- (UILabel)_warmthTitleLabel
{
  return self->__warmthTitleLabel;
}

- (UILabel)_toneValueLabel
{
  return self->__toneValueLabel;
}

- (UILabel)_warmthValueLabel
{
  return self->__warmthValueLabel;
}

- (NSNumberFormatter)_integerFormatter
{
  return self->__integerFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__integerFormatter, 0);
  objc_storeStrong((id *)&self->__warmthValueLabel, 0);
  objc_storeStrong((id *)&self->__toneValueLabel, 0);
  objc_storeStrong((id *)&self->__warmthTitleLabel, 0);
  objc_storeStrong((id *)&self->__toneTitleLabel, 0);
  objc_storeStrong((id *)&self->__styleDescriptionLabel, 0);
  objc_storeStrong((id *)&self->__styleTitleLabel, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end
