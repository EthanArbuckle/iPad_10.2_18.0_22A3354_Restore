@implementation CSStatusTextView

- (CSStatusTextView)initWithFrame:(CGRect)a3
{
  CSStatusTextView *v3;
  uint64_t v4;
  _UILegibilitySettings *legibilitySettings;
  void *v6;
  double v7;
  uint64_t v8;
  SBUILegibilityLabel *supervisionLabel;
  uint64_t v10;
  SBUILegibilityLabel *provisionalEnrollmentLabel;
  uint64_t v12;
  SBUILegibilityLabel *deviceInformationLabel;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CSStatusTextView;
  v3 = -[CSStatusTextView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 2);
    v4 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v3->_legibilitySettings;
    v3->_legibilitySettings = (_UILegibilitySettings *)v4;

    objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusTextStrengthForStyle:", 2);
    v3->_strength = v7;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5D8]), "initWithSettings:strength:", v3->_legibilitySettings, v3->_strength);
    supervisionLabel = v3->_supervisionLabel;
    v3->_supervisionLabel = (SBUILegibilityLabel *)v8;

    -[SBUILegibilityLabel setHidden:](v3->_supervisionLabel, "setHidden:", 1);
    -[SBUILegibilityLabel setOptions:](v3->_supervisionLabel, "setOptions:", 2);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5D8]), "initWithSettings:strength:", v3->_legibilitySettings, v3->_strength);
    provisionalEnrollmentLabel = v3->_provisionalEnrollmentLabel;
    v3->_provisionalEnrollmentLabel = (SBUILegibilityLabel *)v10;

    -[SBUILegibilityLabel setHidden:](v3->_provisionalEnrollmentLabel, "setHidden:", 1);
    -[SBUILegibilityLabel setOptions:](v3->_provisionalEnrollmentLabel, "setOptions:", 2);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5D8]), "initWithSettings:strength:", v3->_legibilitySettings, v3->_strength);
    deviceInformationLabel = v3->_deviceInformationLabel;
    v3->_deviceInformationLabel = (SBUILegibilityLabel *)v12;

    -[SBUILegibilityLabel setHidden:](v3->_deviceInformationLabel, "setHidden:", 1);
    -[SBUILegibilityLabel setOptions:](v3->_deviceInformationLabel, "setOptions:", 2);
  }
  return v3;
}

- (void)setSupervisionText:(id)a3
{
  NSString *v4;
  NSString *supervisionText;

  if (self->_supervisionText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    supervisionText = self->_supervisionText;
    self->_supervisionText = v4;

    -[CSStatusTextView _updateTextViewsIfNecessary](self, "_updateTextViewsIfNecessary");
  }
}

- (void)setProvisionalEnrollmentText:(id)a3
{
  NSString *v4;
  NSString *provisionalEnrollmentText;

  if (self->_provisionalEnrollmentText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    provisionalEnrollmentText = self->_provisionalEnrollmentText;
    self->_provisionalEnrollmentText = v4;

    -[CSStatusTextView _updateTextViewsIfNecessary](self, "_updateTextViewsIfNecessary");
  }
}

- (void)setDeviceInformationText:(id)a3
{
  NSArray *v4;
  NSArray *deviceInformationText;

  if (self->_deviceInformationText != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    deviceInformationText = self->_deviceInformationText;
    self->_deviceInformationText = v4;

    -[CSStatusTextView _updateTextViewsIfNecessary](self, "_updateTextViewsIfNecessary");
  }
}

- (void)setInternalLegalText:(id)a3
{
  NSString *v4;
  NSString *internalLegalText;

  if (self->_internalLegalText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    internalLegalText = self->_internalLegalText;
    self->_internalLegalText = v4;

    -[CSStatusTextView _updateTextViewsIfNecessary](self, "_updateTextViewsIfNecessary");
  }
}

- (void)updateTextsWithBlock:(id)a3
{
  unint64_t transactionCount;

  transactionCount = self->_transactionCount;
  self->_transactionCount = transactionCount + 1;
  if (a3)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    transactionCount = self->_transactionCount - 1;
  }
  self->_transactionCount = transactionCount;
  -[CSStatusTextView _updateTextViewsIfNecessary](self, "_updateTextViewsIfNecessary");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (double *)MEMORY[0x1E0CEB980];
  if (self->_supervisionText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_supervisionLabel, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  }
  else if (!self->_deviceInformationText)
  {
    if (self->_internalLegalText)
    {
      -[SBUILegibilityLabel sizeThatFits:](self->_internalLegalTextLabel, "sizeThatFits:", a3.width, a3.height);
      v8 = v12;
    }
    else
    {
      width = *MEMORY[0x1E0C9D820];
      v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    goto LABEL_10;
  }
  if (self->_provisionalEnrollmentText)
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_provisionalEnrollmentLabel, "systemLayoutSizeFittingSize:", *v6, v6[1]);
  if (self->_deviceInformationText)
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_deviceInformationLabel, "systemLayoutSizeFittingSize:", *v6, v6[1]);
  -[CSStatusTextView _spacingBetweenNonLegalLabels](self, "_spacingBetweenNonLegalLabels");
  SBFMainScreenScale();
  BSFloatCeilForScale();
  v8 = v7;
  if (self->_internalLegalText)
  {
    -[SBUILegibilityLabel sizeThatFits:](self->_internalLegalTextLabel, "sizeThatFits:", width, height);
    v8 = v8 + v9 + 2.0;
  }
LABEL_10:
  v10 = width;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  SBUILegibilityLabel *provisionalEnrollmentLabel;
  double v17;
  uint64_t v18;
  SBUILegibilityLabel *supervisionLabel;
  double v20;
  uint64_t v21;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;

  -[CSStatusTextView bounds](self, "bounds");
  v4 = v3;
  -[SBUILegibilityLabel sizeThatFits:](self->_internalLegalTextLabel, "sizeThatFits:", v5, v3);
  SBFMainScreenScale();
  v24 = v6;
  UIRectCenteredXInRectScale();
  v8 = v7;
  -[SBUILegibilityLabel setFrame:](self->_internalLegalTextLabel, "setFrame:", v24);
  v9 = (double *)MEMORY[0x1E0CEB980];
  if (self->_provisionalEnrollmentText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_provisionalEnrollmentLabel, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    v11 = v10;
  }
  else
  {
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_supervisionText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_supervisionLabel, "systemLayoutSizeFittingSize:", *v9, v9[1]);
    v28 = v12;
  }
  else
  {
    v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_deviceInformationText)
  {
    -[SBUILegibilityLabel systemLayoutSizeFittingSize:](self->_deviceInformationLabel, "systemLayoutSizeFittingSize:", *v9, v9[1]);
    v29 = v13;
  }
  else
  {
    v29 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_internalLegalText)
    v14 = v4 - v8 + -2.0;
  else
    v14 = v4;
  SBFMainScreenScale();
  v25 = v15;
  UIRectCenteredXInRectScale();
  -[SBUILegibilityLabel setFrame:](self->_provisionalEnrollmentLabel, "setFrame:", v25);
  provisionalEnrollmentLabel = self->_provisionalEnrollmentLabel;
  if (self->_provisionalEnrollmentText && v11 <= v14)
  {
    -[SBUILegibilityLabel setHidden:](provisionalEnrollmentLabel, "setHidden:", 0);
    -[CSStatusTextView _spacingBetweenNonLegalLabels](self, "_spacingBetweenNonLegalLabels");
    v14 = v14 - (v11 + v17);
  }
  else
  {
    -[SBUILegibilityLabel setHidden:](provisionalEnrollmentLabel, "setHidden:", 1);
  }
  SBFMainScreenScale();
  v26 = v18;
  UIRectCenteredXInRectScale();
  -[SBUILegibilityLabel setFrame:](self->_supervisionLabel, "setFrame:", v26);
  supervisionLabel = self->_supervisionLabel;
  if (self->_supervisionText && v28 <= v14)
  {
    -[SBUILegibilityLabel setHidden:](supervisionLabel, "setHidden:", 0);
    -[CSStatusTextView _spacingBetweenNonLegalLabels](self, "_spacingBetweenNonLegalLabels");
    v14 = v14 - (v28 + v20);
  }
  else
  {
    -[SBUILegibilityLabel setHidden:](supervisionLabel, "setHidden:", 1);
  }
  SBFMainScreenScale();
  v27 = v21;
  UIRectCenteredXInRectScale();
  -[SBUILegibilityLabel setFrame:](self->_deviceInformationLabel, "setFrame:", v27);
  v23 = v29 > v14 || self->_deviceInformationText == 0;
  -[SBUILegibilityLabel setHidden:](self->_deviceInformationLabel, "setHidden:", v23);
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  uint64_t v5;
  _UILegibilitySettings *legibilitySettings;
  id v7;

  v4 = a3;
  if (!objc_msgSend(v4, "style"))
  {
    objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = (_UILegibilitySettings *)v4;
  v7 = v4;

  -[SBUILegibilityLabel setLegibilitySettings:](self->_supervisionLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBUILegibilityLabel setLegibilitySettings:](self->_provisionalEnrollmentLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBUILegibilityLabel setLegibilitySettings:](self->_deviceInformationLabel, "setLegibilitySettings:", self->_legibilitySettings);
  -[SBUILegibilityLabel setLegibilitySettings:](self->_internalLegalTextLabel, "setLegibilitySettings:", self->_legibilitySettings);

  -[CSStatusTextView _updateLegibilityStrength](self, "_updateLegibilityStrength");
}

- (void)_updateTextViewsIfNecessary
{
  if (!self->_transactionCount)
    -[CSStatusTextView _updateTextViews](self, "_updateTextViews");
}

- (void)_updateTextViews
{
  -[CSStatusTextView _updateInternalLegalLabel](self, "_updateInternalLegalLabel");
  -[CSStatusTextView _updateSupervisionLabel](self, "_updateSupervisionLabel");
  -[CSStatusTextView _updateProvisionalEnrollmentLabel](self, "_updateProvisionalEnrollmentLabel");
  -[CSStatusTextView _updateDeviceInformationLabel](self, "_updateDeviceInformationLabel");
  -[CSStatusTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLegibilityStrength
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;

  v3 = -[_UILegibilitySettings style](self->_legibilitySettings, "style");
  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusTextStrengthForStyle:", v3);
  v6 = v5;

  -[CSStatusTextView setStrength:](self, "setStrength:", v6);
  -[SBUILegibilityLabel setStrength:](self->_internalLegalTextLabel, "setStrength:", self->_strength);
  -[SBUILegibilityLabel setStrength:](self->_supervisionLabel, "setStrength:", self->_strength);
  -[SBUILegibilityLabel setStrength:](self->_provisionalEnrollmentLabel, "setStrength:", self->_strength);
  -[SBUILegibilityLabel setStrength:](self->_deviceInformationLabel, "setStrength:", self->_strength);
}

- (id)_font
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 10.0);
}

- (id)_largeFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 14.0);
}

- (void)_updateInternalLegalLabel
{
  NSString *internalLegalText;
  SBUILegibilityLabel *internalLegalTextLabel;
  _UILegibilitySettings *legibilitySettings;
  _UILegibilitySettings *v6;
  SBUILegibilityLabel *v7;
  _UILegibilitySettings *v8;
  id v9;
  double strength;
  NSString *v11;
  void *v12;
  SBUILegibilityLabel *v13;
  SBUILegibilityLabel *v14;
  SBUILegibilityLabel *v15;
  void *v16;

  internalLegalText = self->_internalLegalText;
  internalLegalTextLabel = self->_internalLegalTextLabel;
  if (internalLegalText)
  {
    if (!internalLegalTextLabel)
    {
      legibilitySettings = self->_legibilitySettings;
      if (legibilitySettings)
      {
        v6 = legibilitySettings;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
        v6 = (_UILegibilitySettings *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v6;
      v9 = objc_alloc(MEMORY[0x1E0DAC5D8]);
      strength = self->_strength;
      v11 = self->_internalLegalText;
      -[CSStatusTextView _font](self, "_font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (SBUILegibilityLabel *)objc_msgSend(v9, "initWithSettings:strength:string:font:", v8, v11, v12, strength);
      v14 = self->_internalLegalTextLabel;
      self->_internalLegalTextLabel = v13;

      -[SBUILegibilityLabel setOptions:](self->_internalLegalTextLabel, "setOptions:", 2);
      v15 = self->_internalLegalTextLabel;
      objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "statusTextStrengthForStyle:", -[_UILegibilitySettings style](v8, "style"));
      -[SBUILegibilityLabel setStrength:](v15, "setStrength:");

      internalLegalTextLabel = self->_internalLegalTextLabel;
    }
    -[SBUILegibilityLabel sizeToFit](internalLegalTextLabel, "sizeToFit");
    -[CSStatusTextView addSubview:](self, "addSubview:", self->_internalLegalTextLabel);
  }
  else if (internalLegalTextLabel)
  {
    -[SBUILegibilityLabel removeFromSuperview](internalLegalTextLabel, "removeFromSuperview");
    v7 = self->_internalLegalTextLabel;
    self->_internalLegalTextLabel = 0;

  }
  -[CSStatusTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSupervisionLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[CSStatusTextView _font](self, "_font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_supervisionText, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    -[CSStatusTextView _nonLegalLabelFontLeading](self, "_nonLegalLabelFontLeading");
    v7 = v6;
    objc_msgSend(v3, "lineHeight");
    objc_msgSend(v5, "setLineSpacing:", v7 - v8);
    objc_msgSend(v5, "setAlignment:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 4);
    v9 = *MEMORY[0x1E0CEA098];
    v12[0] = *MEMORY[0x1E0CEA0D0];
    v12[1] = v9;
    v13[0] = v5;
    v13[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_supervisionText, v10);
    -[CSStatusTextView addSubview:](self, "addSubview:", self->_supervisionLabel);

  }
  else
  {
    -[SBUILegibilityLabel removeFromSuperview](self->_supervisionLabel, "removeFromSuperview");
    v11 = 0;
  }
  -[SBUILegibilityLabel setAttributedText:](self->_supervisionLabel, "setAttributedText:", v11);
  -[SBUILegibilityLabel setNumberOfLines:](self->_supervisionLabel, "setNumberOfLines:", 1);
  -[CSStatusTextView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateProvisionalEnrollmentLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[CSStatusTextView _largeFont](self, "_largeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_provisionalEnrollmentText, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    -[CSStatusTextView _nonLegalLabelFontLeading](self, "_nonLegalLabelFontLeading");
    v7 = v6;
    objc_msgSend(v3, "lineHeight");
    objc_msgSend(v5, "setLineSpacing:", v7 - v8);
    objc_msgSend(v5, "setAlignment:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 4);
    v9 = *MEMORY[0x1E0CEA098];
    v12[0] = *MEMORY[0x1E0CEA0D0];
    v12[1] = v9;
    v13[0] = v5;
    v13[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_provisionalEnrollmentText, v10);
    -[CSStatusTextView addSubview:](self, "addSubview:", self->_provisionalEnrollmentLabel);

  }
  else
  {
    -[SBUILegibilityLabel removeFromSuperview](self->_provisionalEnrollmentLabel, "removeFromSuperview");
    v11 = 0;
  }
  -[SBUILegibilityLabel setAttributedText:](self->_provisionalEnrollmentLabel, "setAttributedText:", v11);
  -[SBUILegibilityLabel setNumberOfLines:](self->_provisionalEnrollmentLabel, "setNumberOfLines:", 1);
  -[CSStatusTextView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateDeviceInformationLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[CSStatusTextView _font](self, "_font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_deviceInformationText, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_deviceInformationText, "componentsJoinedByString:", CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[CSStatusTextView _nonLegalLabelFontLeading](self, "_nonLegalLabelFontLeading");
    v8 = v7;
    objc_msgSend(v3, "lineHeight");
    objc_msgSend(v6, "setLineSpacing:", v8 - v9);
    objc_msgSend(v6, "setAlignment:", 1);
    objc_msgSend(v6, "setLineBreakMode:", 4);
    v10 = *MEMORY[0x1E0CEA098];
    v13[0] = *MEMORY[0x1E0CEA0D0];
    v13[1] = v10;
    v14[0] = v6;
    v14[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v11);
    -[CSStatusTextView addSubview:](self, "addSubview:", self->_deviceInformationLabel);

  }
  else
  {
    -[SBUILegibilityLabel removeFromSuperview](self->_deviceInformationLabel, "removeFromSuperview");
    v12 = 0;
  }
  -[SBUILegibilityLabel setAttributedText:](self->_deviceInformationLabel, "setAttributedText:", v12);
  -[SBUILegibilityLabel setNumberOfLines:](self->_deviceInformationLabel, "setNumberOfLines:", 1);
  -[CSStatusTextView setNeedsLayout](self, "setNeedsLayout");

}

- (double)_nonLegalLabelFontLeading
{
  return 13.0;
}

- (double)_nonLegalTextParagraphSpacing
{
  int v2;
  double result;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass();
    result = 23.0;
    if (v2 != 2)
      return result;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    result = 23.0;
    if (v5 != 1)
      return result;
  }
  v6 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation", result);
  result = 18.5;
  if ((unint64_t)(v6 - 1) < 2)
    return 23.0;
  return result;
}

- (double)_lineHeightOfNonLegalLabels
{
  void *v2;
  double v3;
  double v4;

  -[CSStatusTextView _font](self, "_font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");
  SBFMainScreenScale();
  BSFloatCeilForScale();
  v4 = v3;

  return v4;
}

- (double)_spacingBetweenNonLegalLabels
{
  double result;

  -[CSStatusTextView _nonLegalTextParagraphSpacing](self, "_nonLegalTextParagraphSpacing");
  -[CSStatusTextView _lineHeightOfNonLegalLabels](self, "_lineHeightOfNonLegalLabels");
  SBFMainScreenScale();
  BSFloatFloorForScale();
  return result;
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (NSString)internalLegalText
{
  return self->_internalLegalText;
}

- (NSString)supervisionText
{
  return self->_supervisionText;
}

- (NSArray)deviceInformationText
{
  return self->_deviceInformationText;
}

- (NSString)provisionalEnrollmentText
{
  return self->_provisionalEnrollmentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionalEnrollmentText, 0);
  objc_storeStrong((id *)&self->_deviceInformationText, 0);
  objc_storeStrong((id *)&self->_supervisionText, 0);
  objc_storeStrong((id *)&self->_internalLegalText, 0);
  objc_storeStrong((id *)&self->_provisionalEnrollmentLabel, 0);
  objc_storeStrong((id *)&self->_supervisionLabel, 0);
  objc_storeStrong((id *)&self->_deviceInformationLabel, 0);
  objc_storeStrong((id *)&self->_internalLegalTextLabel, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
