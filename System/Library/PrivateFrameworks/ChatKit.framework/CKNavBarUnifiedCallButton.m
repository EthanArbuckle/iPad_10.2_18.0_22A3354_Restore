@implementation CKNavBarUnifiedCallButton

- (CKNavBarUnifiedCallButton)initWithFrame:(CGRect)a3
{
  CKNavBarUnifiedCallButton *v3;
  CKNavBarUnifiedCallButton *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKNavBarUnifiedCallButton;
  v3 = -[CKNavBarUnifiedCallButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKNavBarUnifiedCallButton setButtonStyle:](v3, "setButtonStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKNavBarUnifiedCallButton;
  -[CKNavBarUnifiedCallButton layoutSubviews](&v14, sel_layoutSubviews);
  -[CKNavBarUnifiedCallButton _cornerRadiusForCurrentStyle](self, "_cornerRadiusForCurrentStyle");
  v4 = v3;
  -[CKNavBarUnifiedCallButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  if (-[CKNavBarUnifiedCallButton _isStyledForJoinableCall](self, "_isStyledForJoinableCall"))
  {
    -[CKNavBarUnifiedCallButton titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel");

      if (!v8)
      {
        -[CKNavBarUnifiedCallButton _currentLabelPreferredWidth](self, "_currentLabelPreferredWidth");
        v10 = v9;
        -[CKNavBarUnifiedCallButton titleLabel](self, "titleLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v13 = ceil(v12);

        if (v10 > v13)
          -[CKNavBarUnifiedCallButton setJoinPillShouldDisableLabel:](self, "setJoinPillShouldDisableLabel:", 1);
      }
    }
    else
    {

    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)CKNavBarUnifiedCallButton;
  -[CKNavBarUnifiedCallButton sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  v5 = fmin(v4, 80.0);
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)updateWithStyle:(int64_t)a3 availabilityForVideo:(BOOL)a4 audio:(BOOL)a5 telephony:(BOOL)a6 screenSharing:(BOOL)a7
{
  _BOOL4 v7;

  v7 = self->_buttonStyle != a3
    || self->_faceTimeVideoAvailable != a4
    || self->_faceTimeAudioAvailable != a5
    || self->_telephonyCallAvailable != a6
    || self->_screenSharingAvailable != a7;
  self->_buttonStyle = a3;
  self->_faceTimeVideoAvailable = a4;
  self->_faceTimeAudioAvailable = a5;
  self->_telephonyCallAvailable = a6;
  self->_screenSharingAvailable = a7;
  if (v7)
    -[CKNavBarUnifiedCallButton _updateForCurrentState](self, "_updateForCurrentState");
}

- (void)setOverrideAudioCallActions:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_overrideAudioCallActions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideAudioCallActions, a3);
    -[CKNavBarUnifiedCallButton _configureActionsForCurrentState](self, "_configureActionsForCurrentState");
  }

}

- (void)_localeDidChange:(id)a3
{
  -[CKNavBarUnifiedCallButton setJoinPillShouldDisableLabel:](self, "setJoinPillShouldDisableLabel:", 0);
}

- (double)_currentLabelPreferredWidth
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[CKNavBarUnifiedCallButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    return 0.0;
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNavBarUnifiedCallButton titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pointSize");
  v11 = v10;
  -[CKNavBarUnifiedCallButton titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_actualScaleFactor");
  v14 = round(v11 * v13 * 4.0) * 0.25;

  v20 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v9, "fontWithSize:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sizeWithAttributes:", v16);
  v18 = ceil(v17);

  return v18;
}

- (void)setJoinPillShouldDisableLabel:(BOOL)a3
{
  id v4;

  if (self->_joinPillShouldDisableLabel != a3)
  {
    self->_joinPillShouldDisableLabel = a3;
    -[CKNavBarUnifiedCallButton _updateForCurrentState](self, "_updateForCurrentState");
    -[CKNavBarUnifiedCallButton layoutIfNeeded](self, "layoutIfNeeded");
    -[CKNavBarUnifiedCallButton delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonWidthDidChange:", self);

  }
}

- (void)_updateForCurrentState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__CKNavBarUnifiedCallButton__updateForCurrentState__block_invoke;
  v2[3] = &unk_1E274A208;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v2);
}

void __51__CKNavBarUnifiedCallButton__updateForCurrentState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
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
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "_axLabelForCurrentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAccessibilityLabel:", v2);

  objc_msgSend(*(id *)(a1 + 32), "imageForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_targetImageForCurrentFlags");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v20 != v3)
    objc_msgSend(*(id *)(a1 + 32), "setImage:forState:", v3, objc_msgSend(*(id *)(a1 + 32), "state"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "_tintColorForCurrentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "_backgroundColorForCurrentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "_titleForCurrentStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "_titleColorForCurrentStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleColor:forState:", v11, 0);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_titleLabelFontForCurrentStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 0);

  v15 = objc_msgSend(*(id *)(a1 + 32), "_shouldEnableAdjustFontSizeForCurrentStyle");
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", v15);

  objc_msgSend(*(id *)(a1 + 32), "_minimumFontScaleFactorForCurrentStyle");
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMinimumScaleFactor:", v18);

  objc_msgSend(*(id *)(a1 + 32), "_configureActionsForCurrentState");
  objc_msgSend(*(id *)(a1 + 32), "_configureInsetsForCurrentState");
  objc_msgSend(*(id *)(a1 + 32), "_configureFrameForCurrentState");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");

}

- (BOOL)shouldUseJoinPillWithLabel
{
  _BOOL4 v3;

  v3 = -[CKNavBarUnifiedCallButton _isStyledForJoinableCall](self, "_isStyledForJoinableCall");
  if (v3)
    LOBYTE(v3) = !-[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel");
  return v3;
}

- (void)_configureActionsForCurrentState
{
  void *v3;
  void *v4;
  CKNavBarUnifiedCallButton *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[CKNavBarUnifiedCallButton _actionsForCurrentStyle](self, "_actionsForCurrentStyle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNavBarUnifiedCallButton _subActionsForCurrentStyle](self, "_subActionsForCurrentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKNavBarUnifiedCallButton _isStyledForJoinableCall](self, "_isStyledForJoinableCall")
    || -[CKNavBarUnifiedCallButton _isStyledForJoinedCall](self, "_isStyledForJoinedCall"))
  {
    -[CKNavBarUnifiedCallButton openJoinedCallAction](self, "openJoinedCallAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavBarUnifiedCallButton addAction:forControlEvents:](self, "addAction:forControlEvents:", v4, 64);

    -[CKNavBarUnifiedCallButton setMenu:](self, "setMenu:", 0);
    -[CKNavBarUnifiedCallButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", 0);
    v5 = self;
    v6 = 1;
LABEL_4:
    -[CKNavBarUnifiedCallButton setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", v6);
    goto LABEL_5;
  }
  if (!objc_msgSend(v13, "count"))
  {
    -[CKNavBarUnifiedCallButton openJoinedCallAction](self, "openJoinedCallAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavBarUnifiedCallButton removeAction:forControlEvents:](self, "removeAction:forControlEvents:", v8, 64);

    -[CKNavBarUnifiedCallButton setMenu:](self, "setMenu:", 0);
    -[CKNavBarUnifiedCallButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", 0);
    v5 = self;
    v6 = 0;
    goto LABEL_4;
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "addObject:", v7);
  -[CKNavBarUnifiedCallButton openJoinedCallAction](self, "openJoinedCallAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavBarUnifiedCallButton removeAction:forControlEvents:](self, "removeAction:forControlEvents:", v11, 64);

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavBarUnifiedCallButton setMenu:](self, "setMenu:", v12);

  -[CKNavBarUnifiedCallButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", 1);
  -[CKNavBarUnifiedCallButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);

LABEL_5:
}

- (void)_configureInsetsForCurrentState
{
  void *v3;
  uint64_t v4;
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
  double v15;
  double v16;
  double v17;

  -[CKNavBarUnifiedCallButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  -[CKNavBarUnifiedCallButton _topMarginForCurrentState](self, "_topMarginForCurrentState");
  v6 = v5;
  -[CKNavBarUnifiedCallButton _leadingMarginForCurrentState](self, "_leadingMarginForCurrentState");
  v8 = v7;
  -[CKNavBarUnifiedCallButton _bottomMarginForCurrentState](self, "_bottomMarginForCurrentState");
  v10 = v9;
  -[CKNavBarUnifiedCallButton _trailingMarginForCurrentState](self, "_trailingMarginForCurrentState");
  v12 = v11;
  -[CKNavBarUnifiedCallButton _imageToTextSpacingForCurrentState](self, "_imageToTextSpacingForCurrentState");
  v14 = v12 + v13;
  v15 = -v13;
  if (v4 == 1)
    v16 = -v13;
  else
    v16 = v13;
  if (v4 == 1)
  {
    v15 = v13;
    v17 = v12 + v13;
  }
  else
  {
    v17 = v8;
  }
  if (v4 != 1)
    v8 = v14;
  -[CKNavBarUnifiedCallButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v16, 0.0, v15);
  -[CKNavBarUnifiedCallButton setContentEdgeInsets:](self, "setContentEdgeInsets:", v6, v17, v10, v8);
}

- (BOOL)_isStyledForJoinedCall
{
  unint64_t v2;

  v2 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  return (v2 < 7) & (0x54u >> v2);
}

- (BOOL)_isStyledForJoinableCall
{
  unint64_t v2;

  v2 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  return (v2 < 6) & v2;
}

- (void)_configureFrameForCurrentState
{
  -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  -[CKNavBarUnifiedCallButton sizeToFit](self, "sizeToFit");
}

- (double)_cornerRadiusForCurrentStyle
{
  unint64_t v3;
  void *v5;
  double v6;
  double v7;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  if (v3 > 5
    || ((1 << v3) & 0x2A) == 0
    || -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel"))
  {
    return 0.0;
  }
  -[CKNavBarUnifiedCallButton frame](self, "frame");
  -[CKNavBarUnifiedCallButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UIRoundToScale();
  v7 = v6;

  return v7;
}

- (double)_topMarginForCurrentState
{
  -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  return 0.0;
}

- (double)_leadingMarginForCurrentState
{
  unint64_t v3;
  double result;
  _BOOL4 v5;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  result = 0.0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    v5 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel", 0.0);
    result = 10.0;
    if (v5)
      return 0.0;
  }
  return result;
}

- (double)_bottomMarginForCurrentState
{
  -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  return 0.0;
}

- (double)_trailingMarginForCurrentState
{
  unint64_t v3;
  double result;
  _BOOL4 v5;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  result = 0.0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    v5 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel", 0.0);
    result = 10.0;
    if (v5)
      return 0.0;
  }
  return result;
}

- (double)_imageToTextSpacingForCurrentState
{
  unint64_t v3;
  double result;
  _BOOL4 v5;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  result = 0.0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    v5 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel", 0.0);
    result = 5.0;
    if (v5)
      return 0.0;
  }
  return result;
}

- (id)_axLabelForCurrentStyle
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  if (v2 <= 5 && ((1 << v2) & 0x2A) != 0)
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("JOIN");
  }
  else
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("FACE_TIME_DEFAULT");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_titleForCurrentStyle
{
  unint64_t v3;
  __CFString *v4;
  void *v5;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  v4 = &stru_1E276D870;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if (-[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel"))
    {
      v4 = 0;
    }
    else
    {
      CKFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1E276D870, CFSTR("ChatKit"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (id)_titleLabelFontForCurrentStyle
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  v4 = 0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if (-[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel"))
    {
      v4 = 0;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navBarUnifiedCallButtonJoinTextFont");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (BOOL)_shouldEnableAdjustFontSizeForCurrentStyle
{
  unint64_t v2;

  v2 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  return (v2 < 6) & v2;
}

- (double)_minimumFontScaleFactorForCurrentStyle
{
  int64_t v2;
  double result;

  v2 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  result = 0.0;
  if ((unint64_t)(v2 - 1) <= 4)
    return dbl_18E7CAE98[v2 - 1];
  return result;
}

- (id)_tintColorForCurrentStyle
{
  unint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  v4 = 0;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x2A) != 0)
    {
      v6 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel");
      v5 = (void *)MEMORY[0x1E0CEA478];
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      goto LABEL_6;
    }
    if (((1 << v3) & 0x54) != 0)
    {
      v5 = (void *)MEMORY[0x1E0CEA478];
LABEL_6:
      objc_msgSend(v5, "ckColorNamed:", CFSTR("CKSystemGreenColor"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)_titleColorForCurrentStyle
{
  unint64_t v3;
  void *v4;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  v4 = 0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if (-[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel"))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)_backgroundColorForCurrentStyle
{
  unint64_t v3;
  void *v4;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  v4 = 0;
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    if (-[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel"))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKSystemGreenColor"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)_targetImageForCurrentFlags
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;
  void *v12;

  switch(-[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle"))
  {
    case 1:
      v3 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v3)
        goto LABEL_11;
      objc_msgSend(v4, "navbarJoinPillVideoImage");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navBarVideoFillImage");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v7 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      if (v7)
        goto LABEL_14;
      objc_msgSend(v8, "navbarJoinPillAudioImage");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navBarAudioFillImage");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      v9 = -[CKNavBarUnifiedCallButton joinPillShouldDisableLabel](self, "joinPillShouldDisableLabel");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      if (v9)
        goto LABEL_13;
      objc_msgSend(v10, "navbarJoinPillSharePlayImage");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
LABEL_13:
      objc_msgSend(v10, "navBarSharePlayImage");
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = -[CKNavBarUnifiedCallButton isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_11:
        objc_msgSend(v5, "navBarVideoImage");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_14:
        objc_msgSend(v5, "navBarAudioImage");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  v12 = (void *)v6;

  return v12;
}

- (id)_actionsForCurrentStyle
{
  unint64_t v3;
  void *v4;

  v3 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
  if (v3 <= 5 && ((1 << v3) & 0x2A) != 0)
  {
    -[CKNavBarUnifiedCallButton _joinCallActions](self, "_joinCallActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKNavBarUnifiedCallButton _startCallActions](self, "_startCallActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_subActionsForCurrentStyle
{
  void *v3;

  if (-[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle"))
  {
    v3 = 0;
  }
  else
  {
    -[CKNavBarUnifiedCallButton _startCallSubActions](self, "_startCallSubActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_startCallActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavBarUnifiedCallButton overrideAudioCallActions](self, "overrideAudioCallActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CKNavBarUnifiedCallButton overrideAudioCallActions](self, "overrideAudioCallActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);
LABEL_7:

    goto LABEL_8;
  }
  if (-[CKNavBarUnifiedCallButton isFaceTimeAudioAvailable](self, "isFaceTimeAudioAvailable"))
  {
    -[CKNavBarUnifiedCallButton faceTimeAudioAction](self, "faceTimeAudioAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[CKNavBarUnifiedCallButton isTelephonyAvailable](self, "isTelephonyAvailable"))
  {
    -[CKNavBarUnifiedCallButton telephonyCallAction](self, "telephonyCallAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);
    goto LABEL_7;
  }
LABEL_8:
  if (-[CKNavBarUnifiedCallButton isFaceTimeVideoAvailable](self, "isFaceTimeVideoAvailable"))
  {
    -[CKNavBarUnifiedCallButton faceTimeVideoAction](self, "faceTimeVideoAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)_startCallSubActions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (!-[CKNavBarUnifiedCallButton isScreenSharingAvailable](self, "isScreenSharingAvailable"))
    return 0;
  -[CKNavBarUnifiedCallButton faceTimeShareMyScreenAction](self, "faceTimeShareMyScreenAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[CKNavBarUnifiedCallButton faceTimeInviteToShareTheirScreenAction](self, "faceTimeInviteToShareTheirScreenAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_joinCallActions
{
  return 0;
}

- (UIAction)faceTimeVideoAction
{
  UIAction *faceTimeVideoAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *v10;
  UIAction *v11;
  _QWORD v13[4];
  id v14;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  faceTimeVideoAction = self->_faceTimeVideoAction;
  if (!faceTimeVideoAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_VIDEO"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navBarVideoImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__CKNavBarUnifiedCallButton_faceTimeVideoAction__block_invoke;
    v13[3] = &unk_1E274A4C0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v8, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeVideo"), v13);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v10 = self->_faceTimeVideoAction;
    self->_faceTimeVideoAction = v9;

    objc_destroyWeak(&v14);
    faceTimeVideoAction = self->_faceTimeVideoAction;
  }
  v11 = faceTimeVideoAction;
  objc_destroyWeak(&location);
  return v11;
}

void __48__CKNavBarUnifiedCallButton_faceTimeVideoAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buttonRequestsStartFaceTimeVideo:", v3);

    WeakRetained = v3;
  }

}

- (UIAction)faceTimeJoinWithVideoAction
{
  UIAction *faceTimeJoinWithVideoAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *v10;
  UIAction *v11;
  _QWORD v13[4];
  id v14;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  faceTimeJoinWithVideoAction = self->_faceTimeJoinWithVideoAction;
  if (!faceTimeJoinWithVideoAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_VIDEO"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navBarVideoImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__CKNavBarUnifiedCallButton_faceTimeJoinWithVideoAction__block_invoke;
    v13[3] = &unk_1E274A4C0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v8, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeJoinWithVideo"), v13);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v10 = self->_faceTimeJoinWithVideoAction;
    self->_faceTimeJoinWithVideoAction = v9;

    objc_destroyWeak(&v14);
    faceTimeJoinWithVideoAction = self->_faceTimeJoinWithVideoAction;
  }
  v11 = faceTimeJoinWithVideoAction;
  objc_destroyWeak(&location);
  return v11;
}

void __56__CKNavBarUnifiedCallButton_faceTimeJoinWithVideoAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "button:requestsJoinActiveCallWithVideoEnabled:", v3, 1);

    WeakRetained = v3;
  }

}

- (UIAction)faceTimeAudioAction
{
  UIAction *faceTimeAudioAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *v10;
  UIAction *v11;
  _QWORD v13[4];
  id v14;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  faceTimeAudioAction = self->_faceTimeAudioAction;
  if (!faceTimeAudioAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_AUDIO"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navBarAudioImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__CKNavBarUnifiedCallButton_faceTimeAudioAction__block_invoke;
    v13[3] = &unk_1E274A4C0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v8, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeAudio"), v13);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v10 = self->_faceTimeAudioAction;
    self->_faceTimeAudioAction = v9;

    objc_destroyWeak(&v14);
    faceTimeAudioAction = self->_faceTimeAudioAction;
  }
  v11 = faceTimeAudioAction;
  objc_destroyWeak(&location);
  return v11;
}

void __48__CKNavBarUnifiedCallButton_faceTimeAudioAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buttonRequestsStartFaceTimeAudio:", v3);

    WeakRetained = v3;
  }

}

- (UIAction)faceTimeJoinWithAudioAction
{
  UIAction *faceTimeJoinWithAudioAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *v10;
  UIAction *v11;
  _QWORD v13[4];
  id v14;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  faceTimeJoinWithAudioAction = self->_faceTimeJoinWithAudioAction;
  if (!faceTimeJoinWithAudioAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_AUDIO"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navBarAudioImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__CKNavBarUnifiedCallButton_faceTimeJoinWithAudioAction__block_invoke;
    v13[3] = &unk_1E274A4C0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v8, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierFaceTimeJoinWithAudio"), v13);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v10 = self->_faceTimeJoinWithAudioAction;
    self->_faceTimeJoinWithAudioAction = v9;

    objc_destroyWeak(&v14);
    faceTimeJoinWithAudioAction = self->_faceTimeJoinWithAudioAction;
  }
  v11 = faceTimeJoinWithAudioAction;
  objc_destroyWeak(&location);
  return v11;
}

void __56__CKNavBarUnifiedCallButton_faceTimeJoinWithAudioAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "button:requestsJoinActiveCallWithVideoEnabled:", v3, 0);

    WeakRetained = v3;
  }

}

- (UIAction)faceTimeShareMyScreenAction
{
  UIAction *faceTimeShareMyScreenAction;
  void *v4;
  void *v5;
  void *v6;
  UIAction *v7;
  UIAction *v8;
  UIAction *v9;
  _QWORD v11[4];
  id v12;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  faceTimeShareMyScreenAction = self->_faceTimeShareMyScreenAction;
  if (!faceTimeShareMyScreenAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INVITE_TO_SHARE_MY_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__CKNavBarUnifiedCallButton_faceTimeShareMyScreenAction__block_invoke;
    v11[3] = &unk_1E274A4C0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v11);
    v7 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v8 = self->_faceTimeShareMyScreenAction;
    self->_faceTimeShareMyScreenAction = v7;

    objc_destroyWeak(&v12);
    faceTimeShareMyScreenAction = self->_faceTimeShareMyScreenAction;
  }
  v9 = faceTimeShareMyScreenAction;
  objc_destroyWeak(&location);
  return v9;
}

void __56__CKNavBarUnifiedCallButton_faceTimeShareMyScreenAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "button:requestsStartFaceTimeWithScreenShareType:", v3, 1);

    WeakRetained = v3;
  }

}

- (UIAction)faceTimeInviteToShareTheirScreenAction
{
  UIAction *faceTimeInviteToShareTheirScreenAction;
  void *v4;
  void *v5;
  void *v6;
  UIAction *v7;
  UIAction *v8;
  UIAction *v9;
  _QWORD v11[4];
  id v12;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  faceTimeInviteToShareTheirScreenAction = self->_faceTimeInviteToShareTheirScreenAction;
  if (!faceTimeInviteToShareTheirScreenAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ASK_TO_SHARE_THEIR_SCREEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__CKNavBarUnifiedCallButton_faceTimeInviteToShareTheirScreenAction__block_invoke;
    v11[3] = &unk_1E274A4C0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v11);
    v7 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v8 = self->_faceTimeInviteToShareTheirScreenAction;
    self->_faceTimeInviteToShareTheirScreenAction = v7;

    objc_destroyWeak(&v12);
    faceTimeInviteToShareTheirScreenAction = self->_faceTimeInviteToShareTheirScreenAction;
  }
  v9 = faceTimeInviteToShareTheirScreenAction;
  objc_destroyWeak(&location);
  return v9;
}

void __67__CKNavBarUnifiedCallButton_faceTimeInviteToShareTheirScreenAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "button:requestsStartFaceTimeWithScreenShareType:", v3, 2);

    WeakRetained = v3;
  }

}

- (UIAction)telephonyCallAction
{
  UIAction *telephonyCallAction;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAction *v9;
  UIAction *v10;
  UIAction *v11;
  _QWORD v13[4];
  id v14;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  telephonyCallAction = self->_telephonyCallAction;
  if (!telephonyCallAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CALL"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navBarAudioImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__CKNavBarUnifiedCallButton_telephonyCallAction__block_invoke;
    v13[3] = &unk_1E274A4C0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v8, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierTelephonyCall"), v13);
    v9 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v10 = self->_telephonyCallAction;
    self->_telephonyCallAction = v9;

    objc_destroyWeak(&v14);
    telephonyCallAction = self->_telephonyCallAction;
  }
  v11 = telephonyCallAction;
  objc_destroyWeak(&location);
  return v11;
}

void __48__CKNavBarUnifiedCallButton_telephonyCallAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buttonRequestsStartTelephonyCall:", v3);

    WeakRetained = v3;
  }

}

- (UIAction)openJoinedCallAction
{
  UIAction *openJoinedCallAction;
  void *v4;
  void *v5;
  void *v6;
  UIAction *v7;
  UIAction *v8;
  UIAction *v9;
  _QWORD v11[4];
  id v12;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  openJoinedCallAction = self->_openJoinedCallAction;
  if (!openJoinedCallAction)
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__CKNavBarUnifiedCallButton_openJoinedCallAction__block_invoke;
    v11[3] = &unk_1E274A4C0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, 0, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierOpenJoinedCall"), v11);
    v7 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v8 = self->_openJoinedCallAction;
    self->_openJoinedCallAction = v7;

    objc_destroyWeak(&v12);
    openJoinedCallAction = self->_openJoinedCallAction;
  }
  v9 = openJoinedCallAction;
  objc_destroyWeak(&location);
  return v9;
}

void __49__CKNavBarUnifiedCallButton_openJoinedCallAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buttonRequestsOpenJoinedCall:", v3);

    WeakRetained = v3;
  }

}

- (UIAction)leaveJoinedCallAction
{
  UIAction *leaveJoinedCallAction;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIAction *v11;
  UIAction *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  leaveJoinedCallAction = self->_leaveJoinedCallAction;
  if (!leaveJoinedCallAction)
  {
    location = 0;
    objc_initWeak(&location, self);
    v4 = -[CKNavBarUnifiedCallButton buttonStyle](self, "buttonStyle");
    v5 = CFSTR("LEAVE_CONVERSATION_SHORT");
    if (v4 == 4)
      v5 = CFSTR("END_CALL");
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __50__CKNavBarUnifiedCallButton_leaveJoinedCallAction__block_invoke;
    v17 = &unk_1E274A4C0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, v10, CFSTR("CKNavBarUnifiedButtonViewUIActionIdentifierLeaveJoinedCall"), &v14);
    v11 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v12 = self->_leaveJoinedCallAction;
    self->_leaveJoinedCallAction = v11;

    -[UIAction setAttributes:](self->_leaveJoinedCallAction, "setAttributes:", 2, v14, v15, v16, v17);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
    leaveJoinedCallAction = self->_leaveJoinedCallAction;
  }
  return leaveJoinedCallAction;
}

void __50__CKNavBarUnifiedCallButton_leaveJoinedCallAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buttonRequestsLeaveJoinedCall:", v3);

    WeakRetained = v3;
  }

}

- (CKNavBarUnifiedCallButtonDelegate)delegate
{
  return (CKNavBarUnifiedCallButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(int64_t)a3
{
  self->_buttonStyle = a3;
}

- (NSArray)overrideAudioCallActions
{
  return self->_overrideAudioCallActions;
}

- (BOOL)isFaceTimeVideoAvailable
{
  return self->_faceTimeVideoAvailable;
}

- (void)setFaceTimeVideoAvailable:(BOOL)a3
{
  self->_faceTimeVideoAvailable = a3;
}

- (BOOL)isFaceTimeAudioAvailable
{
  return self->_faceTimeAudioAvailable;
}

- (void)setFaceTimeAudioAvailable:(BOOL)a3
{
  self->_faceTimeAudioAvailable = a3;
}

- (BOOL)isTelephonyAvailable
{
  return self->_telephonyCallAvailable;
}

- (void)setTelephonyCallAvailable:(BOOL)a3
{
  self->_telephonyCallAvailable = a3;
}

- (BOOL)isScreenSharingAvailable
{
  return self->_screenSharingAvailable;
}

- (void)setScreenSharingAvailable:(BOOL)a3
{
  self->_screenSharingAvailable = a3;
}

- (BOOL)joinPillShouldDisableLabel
{
  return self->_joinPillShouldDisableLabel;
}

- (void)setFaceTimeVideoAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeVideoAction, a3);
}

- (void)setFaceTimeJoinWithVideoAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeJoinWithVideoAction, a3);
}

- (void)setFaceTimeAudioAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeAudioAction, a3);
}

- (void)setFaceTimeJoinWithAudioAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeJoinWithAudioAction, a3);
}

- (void)setFaceTimeShareMyScreenAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeShareMyScreenAction, a3);
}

- (void)setFaceTimeInviteToShareTheirScreenAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeInviteToShareTheirScreenAction, a3);
}

- (void)setTelephonyCallAction:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyCallAction, a3);
}

- (void)setOpenJoinedCallAction:(id)a3
{
  objc_storeStrong((id *)&self->_openJoinedCallAction, a3);
}

- (void)setLeaveJoinedCallAction:(id)a3
{
  objc_storeStrong((id *)&self->_leaveJoinedCallAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaveJoinedCallAction, 0);
  objc_storeStrong((id *)&self->_openJoinedCallAction, 0);
  objc_storeStrong((id *)&self->_telephonyCallAction, 0);
  objc_storeStrong((id *)&self->_faceTimeInviteToShareTheirScreenAction, 0);
  objc_storeStrong((id *)&self->_faceTimeShareMyScreenAction, 0);
  objc_storeStrong((id *)&self->_faceTimeJoinWithAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeJoinWithVideoAction, 0);
  objc_storeStrong((id *)&self->_faceTimeVideoAction, 0);
  objc_storeStrong((id *)&self->_overrideAudioCallActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
