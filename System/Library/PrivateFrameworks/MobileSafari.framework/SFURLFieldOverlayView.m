@implementation SFURLFieldOverlayView

- (SFURLFieldOverlayView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SFURLFieldOverlayView *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  UIView *backgroundView;
  NSArray *buttons;
  id v16;
  uint64_t v17;
  UIView *clippingView;
  UIImageView *v19;
  UIImageView *iconView;
  uint64_t v21;
  void *v22;
  UILabel *v23;
  UILabel *secondaryTextLabel;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  UILabel *v30;
  UILabel *textLabel;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  uint64_t v38;
  UIStackView *stackView;
  void *v40;
  uint64_t v41;
  SFURLFieldOverlayView *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  SFURLFieldOverlayView *v48;
  SFURLFieldOverlayView *v49;
  _QWORD v51[4];
  SFURLFieldOverlayView *v52;
  _QWORD v53[4];
  SFURLFieldOverlayView *v54;
  objc_super v55;
  _QWORD v56[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v56[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)SFURLFieldOverlayView;
  v10 = -[SFURLFieldOverlayView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = *MEMORY[0x1E0DC4B10];
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFURLFieldOverlayView bounds](v10, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    backgroundView = v10->_backgroundView;
    v10->_backgroundView = (UIView *)v13;

    buttons = v10->_buttons;
    v10->_buttons = (NSArray *)MEMORY[0x1E0C9AA60];

    v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFURLFieldOverlayView bounds](v10, "bounds");
    v17 = objc_msgSend(v16, "initWithFrame:");
    clippingView = v10->_clippingView;
    v10->_clippingView = (UIView *)v17;

    v19 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconView = v10->_iconView;
    v10->_iconView = v19;

    -[UIImageView setContentMode:](v10->_iconView, "setContentMode:", 4);
    v21 = *MEMORY[0x1E0DC4918];
    -[UIImageView setMaximumContentSizeCategory:](v10->_iconView, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v10->_iconView, "setPreferredSymbolConfiguration:", v22);

    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryTextLabel = v10->_secondaryTextLabel;
    v10->_secondaryTextLabel = v23;

    -[UILabel setAdjustsFontForContentSizeCategory:](v10->_secondaryTextLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_secondaryTextLabel, "setFont:", v25);

    -[UILabel font](v10->_secondaryTextLabel, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pointSize");
    -[UILabel setMinimumScaleFactor:](v10->_secondaryTextLabel, "setMinimumScaleFactor:", 11.0 / v27);

    -[UILabel setMaximumContentSizeCategory:](v10->_secondaryTextLabel, "setMaximumContentSizeCategory:", v21);
    LODWORD(v28) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_secondaryTextLabel, "setContentCompressionResistancePriority:forAxis:", 0, v28);
    LODWORD(v29) = 1131937792;
    -[UILabel setContentHuggingPriority:forAxis:](v10->_secondaryTextLabel, "setContentHuggingPriority:forAxis:", 0, v29);
    v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v10->_textLabel;
    v10->_textLabel = v30;

    -[UILabel setAdjustsFontForContentSizeCategory:](v10->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel font](v10->_secondaryTextLabel, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pointSize");
    -[UILabel setMinimumScaleFactor:](v10->_textLabel, "setMinimumScaleFactor:", 11.0 / v33);

    -[UILabel setMaximumContentSizeCategory:](v10->_textLabel, "setMaximumContentSizeCategory:", v21);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", v11, *MEMORY[0x1E0DC1448]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_textLabel, "setFont:", v34);

    LODWORD(v35) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v35);
    LODWORD(v36) = 1132003328;
    -[UILabel setContentHuggingPriority:forAxis:](v10->_textLabel, "setContentHuggingPriority:forAxis:", 0, v36);
    v37 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    -[SFURLFieldOverlayView bounds](v10, "bounds");
    v38 = objc_msgSend(v37, "initWithFrame:");
    stackView = v10->_stackView;
    v10->_stackView = (UIStackView *)v38;

    -[UIStackView setSpacing:](v10->_stackView, "setSpacing:", 5.0);
    -[SFURLFieldOverlayView addSubview:](v10, "addSubview:", v10->_clippingView);
    -[UIView addSubview:](v10->_clippingView, "addSubview:", v10->_backgroundView);
    -[UIView addSubview:](v10->_clippingView, "addSubview:", v10->_stackView);
    -[UIStackView addArrangedSubview:](v10->_stackView, "addArrangedSubview:", v10->_iconView);
    -[UIStackView addArrangedSubview:](v10->_stackView, "addArrangedSubview:", v10->_textLabel);
    -[UIStackView addArrangedSubview:](v10->_stackView, "addArrangedSubview:", v10->_secondaryTextLabel);
    -[UIStackView setCustomSpacing:afterView:](v10->_stackView, "setCustomSpacing:afterView:", v10->_textLabel, 8.0);
    v40 = (void *)MEMORY[0x1E0DC3F10];
    v41 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke;
    v53[3] = &unk_1E21E2050;
    v42 = v10;
    v54 = v42;
    objc_msgSend(v40, "performWithoutAnimation:", v53);
    -[SFURLFieldOverlayView setConfiguration:](v42, "setConfiguration:", v9);
    v43 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v10->_iconView, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintGreaterThanOrEqualToConstant:", 26.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v46);

    v47 = (void *)MEMORY[0x1E0DC3F10];
    v51[0] = v41;
    v51[1] = 3221225472;
    v51[2] = __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke_2;
    v51[3] = &unk_1E21E2050;
    v48 = v42;
    v52 = v48;
    objc_msgSend(v47, "performWithoutAnimation:", v51);
    v49 = v48;

  }
  return v10;
}

uint64_t __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIsShowing:completion:", 0, 0);
}

- (double)_buttonCornerRadius
{
  double v2;

  -[SFURLFieldOverlayView _continuousCornerRadius](self, "_continuousCornerRadius");
  return _SFContinuousCornerRadiusMatchingRadiusWithInset(v2, 5.0);
}

- (void)_layOutClippingView
{
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat Height;
  double v12;
  double v13;
  double v14;

  -[SFURLFieldOverlayView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (!self->_isShowing)
  {
    Height = CGRectGetHeight(*(CGRect *)&v3);
    v7 = _SFFlipRectInCoordinateSpace(!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"), 0.0, 0.0, 0.0, Height, v7, v8, v9, v10);
    v8 = v12;
    v9 = v13;
    v10 = v14;
  }
  -[UIView setFrame:](self->_clippingView, "setFrame:", v7, v8, v9, v10);
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;
  CGRect v6;
  CGRect v7;

  v3.receiver = self;
  v3.super_class = (Class)SFURLFieldOverlayView;
  -[SFURLFieldOverlayView layoutSubviews](&v3, sel_layoutSubviews);
  -[SFURLFieldOverlayView _layOutClippingView](self, "_layOutClippingView");
  -[SFURLFieldOverlayView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[SFURLFieldOverlayView bounds](self, "bounds");
  v5 = CGRectInset(v4, 5.0, 5.0);
  -[UIStackView setFrame:](self->_stackView, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  -[SFURLFieldOverlayView bounds](self, "bounds");
  if (CGRectGetWidth(v6) != self->_lastLayoutWidth)
    -[SFURLFieldOverlayView _updateText](self, "_updateText");
  -[SFURLFieldOverlayView bounds](self, "bounds");
  self->_lastLayoutWidth = CGRectGetWidth(v7);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  double v5;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SFURLFieldOverlayView _continuousCornerRadius](self, "_continuousCornerRadius");
  if (v5 != a3)
  {
    v20.receiver = self;
    v20.super_class = (Class)SFURLFieldOverlayView;
    -[SFURLFieldOverlayView _setContinuousCornerRadius:](&v20, sel__setContinuousCornerRadius_, a3);
    -[UIView _setContinuousCornerRadius:](self->_clippingView, "_setContinuousCornerRadius:", a3);
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
    -[SFURLFieldOverlayView _buttonCornerRadius](self, "_buttonCornerRadius");
    v7 = v6;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_buttons;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "configuration", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "background");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setCornerRadius:", v7);

          objc_msgSend(v13, "setConfiguration:", v14);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

  }
}

- (id)_configurationForButtonItem:(id)a3 inOverlayConfiguration:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3520];
  v8 = a3;
  objc_msgSend(v7, "borderedButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLFieldOverlayView _buttonCornerRadius](self, "_buttonCornerRadius");
  v11 = v10;
  objc_msgSend(v9, "background");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  objc_msgSend(v9, "setCornerStyle:", -1);
  objc_msgSend(v9, "setImagePadding:", 4.0);
  objc_msgSend(v9, "setTitleTextAttributesTransformer:", &__block_literal_global_64);
  v13 = objc_msgSend(v8, "theme");

  switch(v13)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "colorWithAlphaComponent:", 0.08);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBaseBackgroundColor:", v19);

      objc_msgSend(v6, "themeColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      objc_msgSend(v6, "prominentButtonBackgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v9, "setBaseBackgroundColor:", v20);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBaseBackgroundColor:", v21);

      }
      objc_msgSend(v6, "prominentButtonTextColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(v6, "themeColor");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
LABEL_11:
      objc_msgSend(v9, "setBaseForegroundColor:", v16);
LABEL_14:

      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "colorWithAlphaComponent:", 0.1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBaseBackgroundColor:", v15);

      objc_msgSend(v6, "primaryTextColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v22 = (void *)v17;
        objc_msgSend(v9, "setBaseForegroundColor:", v17);

        goto LABEL_14;
      }
      goto LABEL_11;
  }

  return v9;
}

id __76__SFURLFieldOverlayView__configurationForButtonItem_inOverlayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0DC1138];
  v2 = (void *)MEMORY[0x1E0DC1350];
  v3 = *MEMORY[0x1E0DC4B10];
  v4 = *MEMORY[0x1E0DC1448];
  v5 = a2;
  objc_msgSend(v2, "_preferredFontForTextStyle:weight:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_setValuesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  id v21;
  NSArray *v22;
  NSArray *buttons;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  objc_msgSend(v5, "themeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v6);

  objc_msgSend(v5, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_iconView, "setImage:", v7);

  objc_msgSend(v5, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](self->_iconView, "setHidden:", v8 == 0);

  objc_msgSend(v5, "primaryTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v10);

  }
  -[SFURLFieldOverlayView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  objc_msgSend(v5, "secondaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[UILabel setTextColor:](self->_secondaryTextLabel, "setTextColor:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_secondaryTextLabel, "setTextColor:", v12);

  }
  objc_msgSend(v5, "primaryTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v14);

  }
  -[SFURLFieldOverlayView _updateText](self, "_updateText");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_buttons;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "removeFromSuperview");
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__11;
  v28[4] = __Block_byref_object_dispose__11;
  v29 = 0;
  objc_msgSend(v5, "buttonItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __42__SFURLFieldOverlayView_setConfiguration___block_invoke;
  v25[3] = &unk_1E21E7488;
  v25[4] = self;
  v21 = v5;
  v26 = v21;
  v27 = v28;
  objc_msgSend(v19, "safari_mapObjectsUsingBlock:", v25);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  buttons = self->_buttons;
  self->_buttons = v22;

  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __42__SFURLFieldOverlayView_setConfiguration___block_invoke_2;
  v24[3] = &unk_1E21E2050;
  v24[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v24);

  _Block_object_dispose(v28, 8);
}

id __42__SFURLFieldOverlayView_setConfiguration___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "_configurationForButtonItem:inOverlayConfiguration:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(v5, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "buttonWithConfiguration:primaryAction:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    || !objc_msgSend((id)a1[5], "placeFirstButtonInLeadingEdge"))
  {
    objc_msgSend(*(id *)(a1[4] + 480), "addArrangedSubview:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 480), "insertArrangedSubview:atIndex:", v9, 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);
  return v9;
}

uint64_t __42__SFURLFieldOverlayView_setConfiguration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "layoutIfNeeded");
}

- (void)_updateText
{
  void *v3;
  SFURLFieldOverlayConfiguration *configuration;
  double Width;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  CGRect v10;

  if (!-[SFURLFieldOverlayConfiguration placeFirstButtonInLeadingEdge](self->_configuration, "placeFirstButtonInLeadingEdge"))
  {
    -[SFURLFieldOverlayView bounds](self, "bounds");
    Width = CGRectGetWidth(v10);
    -[UILabel setHidden:](self->_secondaryTextLabel, "setHidden:", Width <= 500.0);
    -[SFURLFieldOverlayConfiguration secondaryText](self->_configuration, "secondaryText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_secondaryTextLabel, "setText:", v6);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_secondaryTextLabel, "setAdjustsFontSizeToFitWidth:", -[SFURLFieldOverlayConfiguration shouldTextShrinkToFit](self->_configuration, "shouldTextShrinkToFit"));
    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 4);
    if (Width > 500.0)
    {
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_textLabel, "setAdjustsFontSizeToFitWidth:", 0);
    }
    else
    {
      -[UILabel setAdjustsFontSizeToFitWidth:](self->_textLabel, "setAdjustsFontSizeToFitWidth:", -[SFURLFieldOverlayConfiguration shouldTextShrinkToFit](self->_configuration, "shouldTextShrinkToFit"));
      if (-[SFURLFieldOverlayConfiguration prefersSecondaryText](self->_configuration, "prefersSecondaryText"))
      {
        -[SFURLFieldOverlayConfiguration secondaryText](self->_configuration, "secondaryText");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v9 = (id)v7;
        -[UILabel setText:](self->_textLabel, "setText:", v7);

        return;
      }
    }
    -[SFURLFieldOverlayConfiguration text](self->_configuration, "text");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[SFURLFieldOverlayConfiguration text](self->_configuration, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  configuration = self->_configuration;
  if (v3)
    -[SFURLFieldOverlayConfiguration text](configuration, "text");
  else
    -[SFURLFieldOverlayConfiguration secondaryText](configuration, "secondaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_textLabel, "setText:", v8);

  -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_textLabel, "setAdjustsFontSizeToFitWidth:", -[SFURLFieldOverlayConfiguration shouldTextShrinkToFit](self->_configuration, "shouldTextShrinkToFit"));
  -[UILabel setHidden:](self->_secondaryTextLabel, "setHidden:", 1);
}

- (void)_animateWithDelay:(double)a3 isPresenting:(BOOL)a4 group:(id)a5 animations:(id)a6
{
  _BOOL4 v7;
  NSObject *v10;
  NSArray *buttons;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;

  v7 = a4;
  v10 = a5;
  buttons = self->_buttons;
  v12 = a6;
  v13 = -[NSArray count](buttons, "count");
  if (!v7)
    a3 = (double)(unint64_t)(v13 - 1) * 0.1 + 0.25 - a3;
  dispatch_group_enter(v10);
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__SFURLFieldOverlayView__animateWithDelay_isPresenting_group_animations___block_invoke;
  v16[3] = &unk_1E21E2190;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "sf_animate:usingDefaultMotionWithDelay:options:animations:completion:", 1, 0, v12, v16, a3);

}

void __73__SFURLFieldOverlayView__animateWithDelay_isPresenting_group_animations___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dismissAndRemove
{
  _QWORD v3[4];
  id v4;
  id location;

  if (self->_isShowing)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __41__SFURLFieldOverlayView_dismissAndRemove__block_invoke;
    v3[3] = &unk_1E21E2AE8;
    objc_copyWeak(&v4, &location);
    -[SFURLFieldOverlayView _setIsShowing:completion:](self, "_setIsShowing:completion:", 0, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __41__SFURLFieldOverlayView_dismissAndRemove__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeFromSuperview");

}

- (void)present
{
  if (!self->_isShowing)
    -[SFURLFieldOverlayView _setIsShowing:completion:](self, "_setIsShowing:completion:", 1, 0);
}

- (void)_setIsShowing:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  NSArray *buttons;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  NSObject *v18;
  BOOL v19;
  _QWORD v20[5];
  BOOL v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[5];
  BOOL v25;

  v4 = a3;
  v6 = a4;
  self->_isShowing = v4;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  if (v4)
    v9 = 0.0;
  else
    v9 = 0.41;
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke;
  v24[3] = &unk_1E21E2B38;
  v24[4] = self;
  v25 = v4;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_2;
  v22[3] = &unk_1E21E2190;
  v11 = v7;
  v23 = v11;
  objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 0, v24, v22, 0.15, v9);
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_3;
  v20[3] = &unk_1E21E2B38;
  v20[4] = self;
  v21 = v4;
  -[SFURLFieldOverlayView _animateWithDelay:isPresenting:group:animations:](self, "_animateWithDelay:isPresenting:group:animations:", v4, v11, v20, 0.0);
  buttons = self->_buttons;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_4;
  v17[3] = &unk_1E21E74B0;
  v19 = v4;
  v17[4] = self;
  v18 = v11;
  v13 = v11;
  -[NSArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v17);
  ++self->_animationCount;
  -[UIView setClipsToBounds:](self->_clippingView, "setClipsToBounds:", 1);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_6;
  v15[3] = &unk_1E21E25E0;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], v15);

}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
}

void __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "_layOutClippingView");
  LOBYTE(v2) = *(_BYTE *)(a1 + 40);
  v3 = (double)v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", (double)v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setAlpha:", v3);
}

void __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;

  v5 = a2;
  v6 = (double)a3 * 0.1 + 0.25;
  v7 = *(unsigned __int8 *)(a1 + 48);
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_5;
  v11[3] = &unk_1E21E2B38;
  v12 = v5;
  v13 = v7;
  v10 = v5;
  objc_msgSend(v9, "_animateWithDelay:isPresenting:group:animations:", v7, v8, v11, v6);

}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_5(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)*(unint64_t *)&a2);
  v3 = 0.7;
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  CGAffineTransformMakeScale(&v7, v3, v3);
  v4 = *(void **)(a1 + 32);
  v6 = v7;
  return objc_msgSend(v4, "setTransform:", &v6);
}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setClipsToBounds:", --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) > 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (SFURLFieldOverlayConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
