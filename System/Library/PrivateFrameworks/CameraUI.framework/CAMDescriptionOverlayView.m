@implementation CAMDescriptionOverlayView

- (CAMDescriptionOverlayView)initWithFrame:(CGRect)a3
{
  CAMDescriptionOverlayView *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  UIVisualEffectView *blurEffectView;
  CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *primaryVibrancyEffectView;
  _BOOL4 v16;
  uint64_t v17;
  UILabel *titleLabel;
  uint64_t v19;
  uint64_t v20;
  UILabel *descriptionTitleLabel;
  uint64_t v22;
  UILabel *descriptionLabel;
  UILabel *v24;
  void *v25;
  uint64_t v26;
  UILabel *infoTitleLabel;
  uint64_t v28;
  UILabel *infoLabel;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  UIButton *detailButton;
  uint64_t v40;
  uint64_t v41;
  UIButton *acknowledgmentButton;
  void *v43;
  void *v44;
  uint64_t v45;
  UIButton *v46;
  CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *v47;
  BOOL v48;
  CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *v49;
  CAMDescriptionOverlayView *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)CAMDescriptionOverlayView;
  v3 = -[CAMDescriptionOverlayView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v4;
  CAMYellowColor();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "colorWithAlphaComponent:", 0.4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v52);
  blurEffectView = v3->__blurEffectView;
  v3->__blurEffectView = (UIVisualEffectView *)v7;

  -[CAMDescriptionOverlayView addSubview:](v3, "addSubview:", v3->__blurEffectView);
  v9 = [CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView alloc];
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  primaryVibrancyEffectView = v3->__primaryVibrancyEffectView;
  v3->__primaryVibrancyEffectView = (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v14;

  -[CAMDescriptionOverlayView addSubview:](v3, "addSubview:", v3->__primaryVibrancyEffectView);
  v16 = -[CAMDescriptionOverlayView isTitleMultiline](v3, "isTitleMultiline");
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
  titleLabel = v3->__titleLabel;
  v3->__titleLabel = (UILabel *)v17;

  -[UILabel setTextColor:](v3->__titleLabel, "setTextColor:", v6);
  -[UILabel setTextAlignment:](v3->__titleLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](v3->__titleLabel, "setNumberOfLines:", !v16);
  if (v16)
    v19 = 0;
  else
    v19 = 4;
  -[UILabel setLineBreakMode:](v3->__titleLabel, "setLineBreakMode:", v19);
  -[UILabel setAdjustsFontSizeToFitWidth:](v3->__titleLabel, "setAdjustsFontSizeToFitWidth:", !v16);
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
  descriptionTitleLabel = v3->__descriptionTitleLabel;
  v3->__descriptionTitleLabel = (UILabel *)v20;

  -[UILabel setTextColor:](v3->__descriptionTitleLabel, "setTextColor:", v5);
  -[UILabel setTextAlignment:](v3->__descriptionTitleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v3->__descriptionTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
  descriptionLabel = v3->__descriptionLabel;
  v3->__descriptionLabel = (UILabel *)v22;

  -[UILabel setNumberOfLines:](v3->__descriptionLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](v3->__descriptionLabel, "setLineBreakMode:", 0);
  -[UILabel setTextColor:](v3->__descriptionLabel, "setTextColor:", v6);
  -[UILabel setTextAlignment:](v3->__descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setUserInteractionEnabled:](v3->__descriptionLabel, "setUserInteractionEnabled:", 1);
  v24 = v3->__descriptionLabel;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel_handleDescriptionLabelTapped_);
  -[UILabel addGestureRecognizer:](v24, "addGestureRecognizer:", v25);

  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
  infoTitleLabel = v3->__infoTitleLabel;
  v3->__infoTitleLabel = (UILabel *)v26;

  v54 = (void *)v5;
  -[UILabel setTextColor:](v3->__infoTitleLabel, "setTextColor:", v5);
  -[UILabel setTextAlignment:](v3->__infoTitleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v3->__infoTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
  infoLabel = v3->__infoLabel;
  v3->__infoLabel = (UILabel *)v28;

  -[UILabel setNumberOfLines:](v3->__infoLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](v3->__infoLabel, "setLineBreakMode:", 0);
  v53 = v6;
  -[UILabel setTextColor:](v3->__infoLabel, "setTextColor:", v6);
  -[UILabel setTextAlignment:](v3->__infoLabel, "setTextAlignment:", 1);
  v30 = -[CAMDescriptionOverlayView buttonStyle](v3, "buttonStyle");
  if (v30 == 1)
  {
    v34 = (void *)*MEMORY[0x1E0DC4A88];
    v35 = (void *)*MEMORY[0x1E0DC4A88];
LABEL_11:
    v32 = v34;
    v31 = v35;
    goto LABEL_12;
  }
  v31 = 0;
  v32 = 0;
  if (!v30)
  {
    -[CAMDescriptionOverlayView detailTextUsingNarrowWidth:](v3, "detailTextUsingNarrowWidth:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)*MEMORY[0x1E0DC4A88];
    v35 = (void *)*MEMORY[0x1E0DC4AD0];
    if (!v33)
      v34 = (void *)*MEMORY[0x1E0DC4AD0];
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0DC3520], "tintedButtonConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setContentInsets:", 4.0, 12.0, 4.0, 12.0);
  objc_msgSend(v36, "setCornerStyle:", 4);
  -[CAMDescriptionOverlayView _buttonTitleTransformerForTextStyle:](v3, "_buttonTitleTransformerForTextStyle:", v31);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitleTextAttributesTransformer:", v37);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v36, 0);
  v38 = objc_claimAutoreleasedReturnValue();
  detailButton = v3->__detailButton;
  v3->__detailButton = (UIButton *)v38;

  -[UIButton setTintColor:](v3->__detailButton, "setTintColor:", v56);
  -[UIButton setTitleColor:forState:](v3->__detailButton, "setTitleColor:forState:", v56, 0);
  -[UIButton setTitleColor:forState:](v3->__detailButton, "setTitleColor:forState:", v55, 1);
  -[UIButton addTarget:action:forControlEvents:](v3->__detailButton, "addTarget:action:forControlEvents:", v3, sel__handleDetailButtonTapped_, 64);
  v40 = -[CAMDescriptionOverlayView buttonStyle](v3, "buttonStyle");
  if (v40)
  {
    if (v40 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v36, 0);
      v41 = objc_claimAutoreleasedReturnValue();
      acknowledgmentButton = v3->__acknowledgmentButton;
      v3->__acknowledgmentButton = (UIButton *)v41;

      -[UIButton setTintColor:](v3->__acknowledgmentButton, "setTintColor:", v56);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setContentInsets:", 4.0, 4.0, 4.0, 4.0);
    -[CAMDescriptionOverlayView _buttonTitleTransformerForTextStyle:](v3, "_buttonTitleTransformerForTextStyle:", v32);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTitleTextAttributesTransformer:", v44);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v43, 0);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v3->__acknowledgmentButton;
    v3->__acknowledgmentButton = (UIButton *)v45;

  }
  -[UIButton setTitleColor:forState:](v3->__acknowledgmentButton, "setTitleColor:forState:", v56, 0);
  -[UIButton setTitleColor:forState:](v3->__acknowledgmentButton, "setTitleColor:forState:", v55, 1);
  -[UIButton addTarget:action:forControlEvents:](v3->__acknowledgmentButton, "addTarget:action:forControlEvents:", v3, sel__handleAcknowledgmentButtonTapped_, 64);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView contentView](v3->__primaryVibrancyEffectView, "contentView");
  v47 = (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)objc_claimAutoreleasedReturnValue();
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v47, "addSubview:", v3->__titleLabel);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v47, "addSubview:", v3->__descriptionTitleLabel);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v47, "addSubview:", v3->__infoTitleLabel);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v47, "addSubview:", v3->__infoLabel);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v3->__primaryVibrancyEffectView, "addSubview:", v3->__detailButton);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v3->__primaryVibrancyEffectView, "addSubview:", v3->__acknowledgmentButton);
  v48 = -[CAMDescriptionOverlayView detailTextShouldHaveVibrancyEffect](v3, "detailTextShouldHaveVibrancyEffect");
  v49 = v47;
  if (!v48)
    v49 = v3->__primaryVibrancyEffectView;
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v49, "addSubview:", v3->__descriptionLabel);
  v50 = v3;

LABEL_19:
  return v3;
}

- (id)_buttonTitleTransformerForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, 0, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CAMDescriptionOverlayView__buttonTitleTransformerForTextStyle___block_invoke;
  aBlock[3] = &unk_1EA32CE08;
  v10 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  v7 = _Block_copy(v6);

  return v7;
}

id __65__CAMDescriptionOverlayView__buttonTitleTransformerForTextStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMDescriptionOverlayView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateFontsUsingNarrowWidth:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void **v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  id v42;

  v3 = a3;
  v5 = -[CAMDescriptionOverlayView isTitleMultiline](self, "isTitleMultiline");
  v6 = (void **)MEMORY[0x1E0DC4B50];
  if (!v3 || !v5)
    v6 = (void **)MEMORY[0x1E0DC4B48];
  v7 = *v6;
  v8 = (id *)MEMORY[0x1E0DC4A88];
  if (v3)
    v8 = (id *)MEMORY[0x1E0DC4B08];
  v9 = *v8;
  v10 = v7;
  -[CAMDescriptionOverlayView infoTextStyleUsingNarrowWidth:](self, "infoTextStyleUsingNarrowWidth:", v3);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v10, 32770, 3);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v9, 0, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v42, 0, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v10, 0, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v9, 0, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v42, 0, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 1.0;
  v19 = 1.0;
  if (v16)
  {
    objc_msgSend(v12, "pointSize", 1.0);
    v21 = v20;
    objc_msgSend(v16, "pointSize");
    v19 = v21 / v22;
  }
  v40 = v16;
  -[CAMDescriptionOverlayView _setDescriptionFontSizeMultiplier:](self, "_setDescriptionFontSizeMultiplier:", v19);
  if (v17)
  {
    objc_msgSend(v13, "pointSize");
    v24 = v23;
    objc_msgSend(v17, "pointSize");
    v18 = v24 / v25;
  }
  -[CAMDescriptionOverlayView _setInfoFontSizeMultiplier:](self, "_setInfoFontSizeMultiplier:", v18);
  v39 = v17;
  v26 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v15, "pointSize");
  objc_msgSend(v26, "fontWithDescriptor:size:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v14, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v41, 0.0);
  v38 = (void *)v11;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v13, 0.0);
  v37 = v12;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _titleLabel](self, "_titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v27);

  -[CAMDescriptionOverlayView _descriptionTitleLabel](self, "_descriptionTitleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFont:", v28);

  -[CAMDescriptionOverlayView _descriptionLabel](self, "_descriptionLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v29);

  -[CAMDescriptionOverlayView _infoTitleLabel](self, "_infoTitleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFont:", v30);

  -[CAMDescriptionOverlayView _infoLabel](self, "_infoLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFont:", v31);

}

- (void)_updateTextUsingNarrowWidth:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  -[CAMDescriptionOverlayView descriptionTitleTextUsingNarrowWidth:](self, "descriptionTitleTextUsingNarrowWidth:");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView attributedDescriptionTextUsingNarrowWidth:](self, "attributedDescriptionTextUsingNarrowWidth:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView infoTitleTextUsingNarrowWidth:](self, "infoTitleTextUsingNarrowWidth:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView infoTextUsingNarrowWidth:](self, "infoTextUsingNarrowWidth:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView titleTextUsingNarrowWidth:](self, "titleTextUsingNarrowWidth:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView detailTextUsingNarrowWidth:](self, "detailTextUsingNarrowWidth:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView acknowledgmentTextUsingNarrowWidth:](self, "acknowledgmentTextUsingNarrowWidth:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _titleLabel](self, "_titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v8);

  -[CAMDescriptionOverlayView _detailButton](self, "_detailButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v9, 0);

  -[CAMDescriptionOverlayView _acknowledgmentButton](self, "_acknowledgmentButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v10, 0);

  -[CAMDescriptionOverlayView _descriptionTitleLabel](self, "_descriptionTitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v18);

  -[CAMDescriptionOverlayView _descriptionLabel](self, "_descriptionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAttributedText:", v5);

  -[CAMDescriptionOverlayView _infoTitleLabel](self, "_infoTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v6);

  -[CAMDescriptionOverlayView _infoLabel](self, "_infoLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v7);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  BOOL v44;
  _BOOL8 v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v55;
  _BOOL4 v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  int64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  CGFloat v91;
  double v92;
  void *v93;
  int v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  void *v99;
  uint64_t v100;
  double v101;
  void *v102;
  void *v103;
  int v104;
  double v105;
  double v106;
  double v107;
  double MaxY;
  void *v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  uint64_t v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  CGFloat v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  double v148;
  double v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double y;
  double v163;
  double v164;
  double v165;
  double v166;
  double x;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  CGFloat v187;
  double rect;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  _BOOL4 v201;
  double v202;
  void *v203;
  CGFloat v204;
  _OWORD v205[3];
  __int128 v206;
  __int128 v207;
  __int128 v208;
  objc_super v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;

  v209.receiver = self;
  v209.super_class = (Class)CAMDescriptionOverlayView;
  -[CAMDescriptionOverlayView layoutSubviews](&v209, sel_layoutSubviews);
  -[CAMDescriptionOverlayView bounds](self, "bounds");
  v178 = v4;
  v179 = v3;
  v176 = v6;
  v177 = v5;
  -[CAMDescriptionOverlayView viewportFrame](self, "viewportFrame");
  v8 = v7;
  v10 = v9;
  v137 = v12;
  v138 = v11;
  UIRectGetCenter();
  v173 = v14;
  v174 = v13;
  v201 = v8 < 414.0;
  -[CAMDescriptionOverlayView _updateFontsUsingNarrowWidth:](self, "_updateFontsUsingNarrowWidth:", v8 < 414.0);
  -[CAMDescriptionOverlayView _updateTextUsingNarrowWidth:](self, "_updateTextUsingNarrowWidth:", v8 < 414.0);
  -[CAMDescriptionOverlayView _blurEffectView](self, "_blurEffectView");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _primaryVibrancyEffectView](self, "_primaryVibrancyEffectView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _titleLabel](self, "_titleLabel");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _descriptionTitleLabel](self, "_descriptionTitleLabel");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _descriptionLabel](self, "_descriptionLabel");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _infoTitleLabel](self, "_infoTitleLabel");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _infoLabel](self, "_infoLabel");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _detailButton](self, "_detailButton");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _acknowledgmentButton](self, "_acknowledgmentButton");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v150, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "descender");
  UIFloorToViewScale();
  v25 = v24;
  objc_msgSend(v16, "descender");
  UIFloorToViewScale();
  v152 = v26;
  objc_msgSend(v17, "descender");
  UIFloorToViewScale();
  v28 = v27;
  objc_msgSend(v18, "descender");
  UIFloorToViewScale();
  v148 = v29;
  objc_msgSend(v19, "descender");
  UIFloorToViewScale();
  v185 = v30;
  objc_msgSend(v21, "descender");
  UIFloorToViewScale();
  v135 = v31;
  objc_msgSend(v23, "descender");
  UIFloorToViewScale();
  v143 = v32;
  v175 = v15;
  objc_msgSend(v15, "lineHeight");
  UICeilToViewScale();
  v34 = v33;
  v183 = v33;
  objc_msgSend(v16, "lineHeight");
  UICeilToViewScale();
  v139 = v35;
  objc_msgSend(v17, "lineHeight");
  UICeilToViewScale();
  v37 = v36;
  objc_msgSend(v18, "lineHeight");
  UICeilToViewScale();
  v140 = v38;
  objc_msgSend(v19, "lineHeight");
  UICeilToViewScale();
  v158 = v39;
  objc_msgSend(v21, "lineHeight");
  UICeilToViewScale();
  v134 = v40;
  objc_msgSend(v23, "lineHeight");
  UICeilToViewScale();
  v142 = v41;
  v181 = v25 + v34;
  v160 = v28;
  v166 = v28 + v37;
  v42 = -[CAMDescriptionOverlayView orientation](self, "orientation");
  v207 = 0u;
  v208 = 0u;
  v43 = v42 - 3;
  v206 = 0u;
  CAMOrientationTransform(v42, (uint64_t)&v206);
  v44 = v43 >= 2;
  v45 = v43 < 2;
  v46 = MEMORY[0x1E0C9D648];
  v204 = *MEMORY[0x1E0C9D648];
  if (v44)
    v47 = v10;
  else
    v47 = v8;
  v180 = v8;
  v136 = v10;
  if (!v44)
    v8 = v10;
  v198 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v199 = v8;
  -[CAMDescriptionOverlayView maxTitleTextWidthForNarrowWidth:isLandscape:](self, "maxTitleTextWidthForNarrowWidth:isLandscape:", v201, v45);
  v49 = v48;
  -[CAMDescriptionOverlayView _descriptionFontSizeMultiplier](self, "_descriptionFontSizeMultiplier");
  -[CAMDescriptionOverlayView maxDescriptionTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:](self, "maxDescriptionTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:", v201, v45);
  v51 = v50;
  -[CAMDescriptionOverlayView _infoFontSizeMultiplier](self, "_infoFontSizeMultiplier");
  -[CAMDescriptionOverlayView maxInfoTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:](self, "maxInfoTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:", v201, v45);
  v53 = v8 + -20.0;
  if (v49 <= 0.0 || v49 > v53)
    v49 = v8 + -20.0;
  if (v51 > v53)
    v51 = v8 + -20.0;
  if (v52 <= v53)
    v55 = v52;
  else
    v55 = v8 + -20.0;
  v56 = -[CAMDescriptionOverlayView isTitleMultiline](self, "isTitleMultiline");
  v57 = *MEMORY[0x1E0C9D538];
  v58 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v203, "textRectForBounds:limitedToNumberOfLines:", !v56, *MEMORY[0x1E0C9D538], v58, v49, v47);
  objc_msgSend(v156, "textRectForBounds:limitedToNumberOfLines:", 0, v57, v58, v51, v47);
  v141 = v57;
  v170 = v58;
  objc_msgSend(v154, "textRectForBounds:limitedToNumberOfLines:", 0, v57, v58, v55, v47);
  objc_msgSend(v157, "intrinsicContentSize");
  objc_msgSend(v155, "intrinsicContentSize");
  objc_msgSend(v151, "intrinsicContentSize");
  objc_msgSend(v150, "intrinsicContentSize");
  UICeilToViewScale();
  v60 = v59;
  UICeilToViewScale();
  rect = v61;
  UICeilToViewScale();
  v190 = v62;
  UICeilToViewScale();
  v189 = v63;
  UICeilToViewScale();
  v193 = v64;
  UICeilToViewScale();
  v191 = v65;
  UICeilToViewScale();
  v194 = v66;
  UICeilToViewScale();
  v192 = v67;
  UICeilToViewScale();
  v196 = v68;
  UICeilToViewScale();
  v195 = v69;
  UICeilToViewScale();
  v71 = v70;
  UICeilToViewScale();
  v73 = v72;
  UICeilToViewScale();
  v75 = v74;
  UICeilToViewScale();
  v77 = v76;
  v78 = -[CAMDescriptionOverlayView buttonStyle](self, "buttonStyle");
  if (v71 >= v75)
    v79 = v71;
  else
    v79 = v75;
  if (v73 >= v77)
    v80 = v73;
  else
    v80 = v77;
  if (v78 == 1)
    v81 = v80;
  else
    v81 = v77;
  if (v78 == 1)
    v82 = v79;
  else
    v82 = v75;
  v200 = v82;
  v202 = v81;
  if (v78 != 1)
  {
    v80 = v73;
    v79 = v71;
  }
  v163 = v79;
  v164 = v80;
  -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing");
  v84 = v83;
  v197 = v47;
  UIFloorToViewScale();
  v86 = v85 - v181;
  v210.origin.x = (v199 - v60) * 0.5;
  v210.origin.y = v86;
  v172 = v60;
  v210.size.width = v60;
  v210.size.height = rect;
  v87 = v84 + CGRectGetMaxY(v210) - (v183 - v181) + 37.0;
  v88 = *(double *)(v46 + 16);
  v89 = *(double *)(v46 + 24);
  objc_msgSend(v157, "text");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v89;
  v168 = v86;
  v169 = (v199 - v60) * 0.5;
  if (v90)
  {

    v91 = v204;
    v92 = v160;
LABEL_33:
    v211.size.width = v190;
    v211.origin.x = (v199 - v190) * 0.5;
    v211.origin.y = v87 - (v152 + v139);
    x = v211.origin.x;
    y = v211.origin.y;
    v211.size.height = v189;
    v87 = v84 + v139 + v152 + CGRectGetMaxY(v211) + 2.0;
    goto LABEL_35;
  }
  objc_msgSend(v157, "text");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "isEqualToString:", &stru_1EA3325A0);

  v91 = v204;
  v92 = v160;
  if (v94)
    goto LABEL_33;
  v189 = v89;
  v190 = v88;
  y = v198;
  x = v204;
LABEL_35:
  v212.size.width = v193;
  v212.origin.x = (v199 - v193) * 0.5;
  v95 = v87 - v166;
  v212.origin.y = v87 - v166;
  v212.size.height = v191;
  v96 = v92 + CGRectGetMaxY(v212);
  objc_msgSend(v157, "text");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v88;
  if (objc_msgSend(v97, "length"))
  {

    v98 = v158;
  }
  else
  {
    objc_msgSend(v156, "text");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "length");

    v98 = v158;
    if (!v100)
      goto LABEL_39;
  }
  v87 = v84 + v96 + 39.0;
LABEL_39:
  v101 = v185 + v98;
  objc_msgSend(v155, "text", 0x4042800000000000);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v95;
  if (v102)
  {

LABEL_42:
    v105 = v199;
    v213.size.width = v194;
    v213.origin.x = (v199 - v194) * 0.5;
    v213.origin.y = v87 - (v148 + v140);
    v159 = v213.origin.x;
    v153 = v213.origin.y;
    v213.size.height = v192;
    v87 = v84 + v140 + v148 + CGRectGetMaxY(v213) + 2.0;
    goto LABEL_44;
  }
  objc_msgSend(v155, "text");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "isEqualToString:", &stru_1EA3325A0);

  if (v104)
    goto LABEL_42;
  v159 = v91;
  v153 = v198;
  v194 = v88;
  v192 = v182;
  v105 = v199;
LABEL_44:
  v106 = v164;
  v214.size.height = v195;
  v214.size.width = v196;
  v107 = v87 - v101;
  v214.origin.x = (v105 - v196) * 0.5;
  v214.origin.y = v107;
  MaxY = CGRectGetMaxY(v214);
  objc_msgSend(v155, "text");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = (v105 - v196) * 0.5;
  if (objc_msgSend(v109, "length"))
  {

    v110 = v143;
    v112 = v141;
    v111 = v142;
  }
  else
  {
    objc_msgSend(v154, "text");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "length");

    v110 = v143;
    v112 = v141;
    v111 = v142;
    if (!v114)
      goto LABEL_48;
  }
  v96 = v185 + MaxY;
LABEL_48:
  v186 = v110 + v111;
  v115 = v96 + 41.0;
  v116 = v84;
  v117 = v84 + v115;
  objc_msgSend(v151, "contentRectForBounds:", v112, v170, v163, v106);
  objc_msgSend(v151, "titleRectForContentRect:");
  v119 = v118;
  objc_msgSend(v150, "contentRectForBounds:", v112, v170, v200, v202);
  objc_msgSend(v150, "titleRectForContentRect:");
  v121 = v120;
  -[CAMDescriptionOverlayView detailTextUsingNarrowWidth:](self, "detailTextUsingNarrowWidth:", v180 < 414.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  v149 = v107;
  if (v122)
  {
    v215.origin.x = (v199 - v163) * 0.5;
    v215.origin.y = v117 - v119 - (v135 + v134);
    v144 = v215.origin.y;
    v145 = v215.origin.x;
    v215.size.width = v163;
    v215.size.height = v106;
    v117 = v116 + v135 + CGRectGetMaxY(v215) + v133;
    v182 = v106;
    v184 = v163;
  }
  else
  {
    v144 = v198;
    v145 = v204;
  }
  v123 = v186;
  objc_msgSend(v151, "setHidden:", v122 == 0);
  v187 = (v199 - v200) * 0.5;
  v124 = v117 - v121 - v123;
  v216.origin.x = v169;
  v216.origin.y = v168;
  v216.size.width = v172;
  v216.size.height = rect;
  CGRectGetMinY(v216);
  v217.origin.x = v187;
  v217.origin.y = v124;
  v217.size.width = v200;
  v217.size.height = v202;
  CGRectGetMaxY(v217);
  objc_msgSend(v150, "contentEdgeInsets");
  v218.origin.x = v204;
  v218.size.height = v197;
  v218.origin.y = v198;
  v218.size.width = v199;
  CGRectGetHeight(v218);
  UIRoundToViewScale();
  v126 = y + v125;
  v127 = v161 + v125;
  v128 = v153 + v125;
  v129 = v149 + v125;
  v171 = v144 + v125;
  v130 = v124 + v125;
  objc_msgSend(v203, "frameForAlignmentRect:", v169, v168 + v125, v172, rect);
  objc_msgSend(v203, "setFrame:");
  objc_msgSend(v157, "frameForAlignmentRect:", x, v126, v190, v189);
  objc_msgSend(v157, "setFrame:");
  objc_msgSend(v156, "frameForAlignmentRect:", (v199 - v193) * 0.5, v127, v193, v191);
  objc_msgSend(v156, "setFrame:");
  objc_msgSend(v155, "frameForAlignmentRect:", v159, v128, v194, v192);
  objc_msgSend(v155, "setFrame:");
  objc_msgSend(v154, "frameForAlignmentRect:", v165, v129, v196, v195);
  objc_msgSend(v154, "setFrame:");
  objc_msgSend(v151, "frameForAlignmentRect:", v145, v171, v184, v182);
  objc_msgSend(v151, "setFrame:");
  objc_msgSend(v150, "frameForAlignmentRect:", v187, v130, v200, v202);
  objc_msgSend(v150, "setFrame:");
  objc_msgSend(v147, "setFrame:", v179, v178, v177, v176);
  v205[0] = v206;
  v205[1] = v207;
  v205[2] = v208;
  objc_msgSend(v146, "setTransform:", v205);
  objc_msgSend(v146, "setCenter:", v174, v173);
  objc_msgSend(v146, "setBounds:", v204, v198, v199, v197);
  -[CAMDescriptionOverlayView _blackoutView](self, "_blackoutView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setFrame:", v179, v178, v177, v176);

  -[CAMDescriptionOverlayView _blackoutMask](self, "_blackoutMask");
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  if (v132)
    -[CAMDescriptionOverlayView _layoutBlackoutMaskForFrame:inFrame:](self, "_layoutBlackoutMaskForFrame:inFrame:", v138, v137, v180, v136, v179, v178, v177, v176);

}

- (BOOL)isDetailButtonHighlighted
{
  void *v2;
  char v3;

  -[CAMDescriptionOverlayView _detailButton](self, "_detailButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setDetailButtonHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMDescriptionOverlayView _detailButton](self, "_detailButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (void)_handleDetailButtonTapped:(id)a3
{
  id WeakRetained;

  -[CAMDescriptionOverlayView detailButtonTapped](self, "detailButtonTapped", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "descriptionOverlayViewDidSelectDetail:", self);

}

- (BOOL)isAcknowledgmentButtonHighlighted
{
  void *v2;
  char v3;

  -[CAMDescriptionOverlayView _acknowledgmentButton](self, "_acknowledgmentButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setAcknowledgmentButtonHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMDescriptionOverlayView _acknowledgmentButton](self, "_acknowledgmentButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (void)_handleAcknowledgmentButtonTapped:(id)a3
{
  id WeakRetained;

  -[CAMDescriptionOverlayView acknowledgementButtonTapped](self, "acknowledgementButtonTapped", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "descriptionOverlayViewDidAcknowledge:", self);

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMDescriptionOverlayView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v6[5];

  if (self->_orientation != a3)
  {
    if (a4)
    {
      -[CAMDescriptionOverlayView layoutIfNeeded](self, "layoutIfNeeded");
      self->_orientation = a3;
      -[CAMDescriptionOverlayView setNeedsLayout](self, "setNeedsLayout");
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __53__CAMDescriptionOverlayView_setOrientation_animated___block_invoke;
      v6[3] = &unk_1EA328868;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v6, 0, 0.25, 0.0);
    }
    else
    {
      self->_orientation = a3;
      -[CAMDescriptionOverlayView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __53__CAMDescriptionOverlayView_setOrientation_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_viewportFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(a3, self->_viewportFrame))
  {
    p_viewportFrame->origin.x = x;
    p_viewportFrame->origin.y = y;
    p_viewportFrame->size.width = width;
    p_viewportFrame->size.height = height;
    -[CAMDescriptionOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_layoutBlackoutMaskForFrame:(CGRect)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGPath *Mutable;
  void *v14;
  CGRect v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGPathAddRect(Mutable, 0, v15);
  v16.origin.x = v11;
  v16.origin.y = v10;
  v16.size.width = v9;
  v16.size.height = v8;
  CGPathAddRect(Mutable, 0, v16);
  -[CAMDescriptionOverlayView _blackoutMask](self, "_blackoutMask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPath:", Mutable);

  CGPathRelease(Mutable);
}

- (BOOL)_isVisible
{
  void *v2;
  double v3;
  double v4;

  -[CAMDescriptionOverlayView _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4 == 1.0;
}

- (void)setVisible:(BOOL)a3 animationDuration:(double)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(_QWORD);
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  id v20;
  double v21;
  BOOL v22;
  BOOL v23;

  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  if (-[CAMDescriptionOverlayView _isVisible](self, "_isVisible") != v6)
  {
    -[CAMDescriptionOverlayView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptionOverlayView:willBecomeVisible:", self, v6);

  }
  if (v6)
    v10 = 1.0;
  else
    v10 = 0.0;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke;
  aBlock[3] = &unk_1EA32A6F8;
  aBlock[4] = self;
  v13 = v11;
  v20 = v13;
  v21 = v10;
  v22 = v6;
  v23 = v6;
  v14 = _Block_copy(aBlock);
  v15 = v14;
  if (a4 <= 0.0)
  {
    (*((void (**)(void *))v14 + 2))(v14);
    if (v8)
      v8[2](v8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke_2;
    v17[3] = &unk_1EA32A6A8;
    v18 = v8;
    objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 6, v15, v17, a4, 0.0);

  }
}

uint64_t __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_blurEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffect:", v2);

  v4 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  v6 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_descriptionTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  v8 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_descriptionLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  v10 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_infoTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v10);

  v12 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_infoLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", v12);

  v14 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_detailButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", v14);

  v16 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_acknowledgmentButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v16);

  v18 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_blackoutView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", v18);

  objc_msgSend(*(id *)(a1 + 32), "setCustomSubviewsVisible:", *(unsigned __int8 *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 57));
}

uint64_t __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setBlackoutFrameVisible:(BOOL)a3
{
  CAShapeLayer *v4;
  CAShapeLayer *blackoutMask;
  id v6;
  UIView *v7;
  UIView *blackoutView;
  void *v9;
  CAShapeLayer *v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  CAShapeLayer *v14;

  if (self->_blackoutFrameVisible != a3)
  {
    self->_blackoutFrameVisible = a3;
    if (a3)
    {
      v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      blackoutMask = self->__blackoutMask;
      self->__blackoutMask = v4;

      -[CAShapeLayer setFillRule:](self->__blackoutMask, "setFillRule:", *MEMORY[0x1E0CD2B70]);
      v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      blackoutView = self->__blackoutView;
      self->__blackoutView = v7;

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->__blackoutView, "setBackgroundColor:", v9);

      -[UIView setUserInteractionEnabled:](self->__blackoutView, "setUserInteractionEnabled:", 0);
      v10 = self->__blackoutMask;
      -[UIView layer](self->__blackoutView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMask:", v10);

      -[CAMDescriptionOverlayView addSubview:](self, "addSubview:", self->__blackoutView);
    }
    else
    {
      v12 = self->__blackoutView;
      if (v12)
      {
        -[UIView removeFromSuperview](v12, "removeFromSuperview");
        v13 = self->__blackoutView;
        self->__blackoutView = 0;

        v14 = self->__blackoutMask;
        self->__blackoutMask = 0;

      }
    }
  }
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_1EA3325A0;
}

- (id)infoTextStyleUsingNarrowWidth:(BOOL)a3
{
  id *v3;

  v3 = (id *)MEMORY[0x1E0DC4B08];
  if (!a3)
    v3 = (id *)MEMORY[0x1E0DC4A88];
  return *v3;
}

- (BOOL)isTitleMultiline
{
  return 0;
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_1EA3325A0;
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3
{
  void *v3;
  void *v4;

  -[CAMDescriptionOverlayView descriptionTextUsingNarrowWidth:](self, "descriptionTextUsingNarrowWidth:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_1EA3325A0;
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_1EA3325A0;
}

- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4
{
  return 0.0;
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  return 0.0;
}

- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  return 0.0;
}

- (id)currentContentSize
{
  void *v2;
  void *v3;

  -[CAMDescriptionOverlayView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)additionalSpacing
{
  void *v3;
  double v4;
  double v5;

  -[CAMDescriptionOverlayView currentContentSize](self, "currentContentSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMDescriptionOverlayView _additionalSpacingForContentSize:](self, "_additionalSpacingForContentSize:", v3);
  v5 = v4;

  return v5;
}

- (double)_additionalSpacingForContentSize:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;

  v3 = a3;
  v4 = 0.0;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) == 0)
  {
    v5 = *MEMORY[0x1E0DC4918];
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
    {
      v4 = 5.0;
      if ((objc_msgSend(v3, "isEqualToString:", v5) & 1) == 0)
      {
        v4 = 10.0;
        if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) == 0)
        {
          if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48F8]) & 1) != 0
            || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0
            || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) != 0
            || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) != 0
            || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0
            || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0
            || (v4 = 0.0, objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC48B8])))
          {
            v4 = 15.0;
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)detailTextShouldHaveVibrancyEffect
{
  return 1;
}

- (int64_t)buttonStyle
{
  return 0;
}

- (CAMDescriptionOverlayViewDelegate)delegate
{
  return (CAMDescriptionOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewportFrame.origin.x;
  y = self->_viewportFrame.origin.y;
  width = self->_viewportFrame.size.width;
  height = self->_viewportFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isBlackoutFrameVisible
{
  return self->_blackoutFrameVisible;
}

- (UIVisualEffectView)_blurEffectView
{
  return self->__blurEffectView;
}

- (UIView)_blackoutView
{
  return self->__blackoutView;
}

- (CAShapeLayer)_blackoutMask
{
  return self->__blackoutMask;
}

- (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView)_primaryVibrancyEffectView
{
  return self->__primaryVibrancyEffectView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_descriptionTitleLabel
{
  return self->__descriptionTitleLabel;
}

- (UILabel)_descriptionLabel
{
  return self->__descriptionLabel;
}

- (UILabel)_infoTitleLabel
{
  return self->__infoTitleLabel;
}

- (UILabel)_infoLabel
{
  return self->__infoLabel;
}

- (UIButton)_detailButton
{
  return self->__detailButton;
}

- (UIButton)_acknowledgmentButton
{
  return self->__acknowledgmentButton;
}

- (double)_descriptionFontSizeMultiplier
{
  return self->__descriptionFontSizeMultiplier;
}

- (void)_setDescriptionFontSizeMultiplier:(double)a3
{
  self->__descriptionFontSizeMultiplier = a3;
}

- (double)_infoFontSizeMultiplier
{
  return self->__infoFontSizeMultiplier;
}

- (void)_setInfoFontSizeMultiplier:(double)a3
{
  self->__infoFontSizeMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__acknowledgmentButton, 0);
  objc_storeStrong((id *)&self->__detailButton, 0);
  objc_storeStrong((id *)&self->__infoLabel, 0);
  objc_storeStrong((id *)&self->__infoTitleLabel, 0);
  objc_storeStrong((id *)&self->__descriptionLabel, 0);
  objc_storeStrong((id *)&self->__descriptionTitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__primaryVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->__blackoutMask, 0);
  objc_storeStrong((id *)&self->__blackoutView, 0);
  objc_storeStrong((id *)&self->__blurEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
