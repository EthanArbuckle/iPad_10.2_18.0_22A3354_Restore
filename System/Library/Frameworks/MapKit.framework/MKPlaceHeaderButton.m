@implementation MKPlaceHeaderButton

- (MKPlaceHeaderButton)init
{
  MKPlaceHeaderButton *v2;
  MKPlaceHeaderButton *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKPlaceHeaderButton;
  v2 = -[MKPlaceHeaderButton init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKPlaceHeaderButton titleLabel](v2, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNumberOfLines:", 3);

    -[MKPlaceHeaderButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMinimumScaleFactor:", 0.699999988);

    -[MKPlaceHeaderButton titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 1);

  }
  return v3;
}

- (MKPlaceHeaderButton)initWithPrimaryType:(unint64_t)a3
{
  MKPlaceHeaderButton *v4;
  MKPlaceHeaderButton *v5;

  v4 = -[MKPlaceHeaderButton init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_primary = 1;
    v4->_buttonType = a3;
    -[MKPlaceHeaderButton applyButtonDefaultConfiguration](v4, "applyButtonDefaultConfiguration");
    -[MKPlaceHeaderButton _setVibrantView](v5, "_setVibrantView");
    -[MKPlaceHeaderButton _updateStylePrimaryButton](v5, "_updateStylePrimaryButton");
  }
  return v5;
}

- (void)setButtonController:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_buttonController, obj);
    objc_msgSend(obj, "setDelegate:", self);

    -[MKPlaceHeaderButton setEnabled:](self, "setEnabled:", objc_msgSend(obj, "disabled") ^ 1);
    -[MKPlaceHeaderButton applyButtonDefaultConfiguration](self, "applyButtonDefaultConfiguration");
    -[MKPlaceHeaderButton _updateStyleNonPrimaryButton](self, "_updateStyleNonPrimaryButton");
    v6 = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(v6, "buttonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(v8, "buttonSubTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton setPrimaryTitle:subtitle:](self, "setPrimaryTitle:subtitle:", v7, v9);

    -[MKPlaceHeaderButton _setVibrantView](self, "_setVibrantView");
  }

}

- (void)_setVibrantView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  MKVibrantView *v9;
  MKVibrantView *v10;
  MKVibrantView *vibrantView;
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
  id v26;
  id v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  if (self->_primary)
    goto LABEL_12;
  if (!-[MKPlaceHeaderButton _isTintColorWhite](self, "_isTintColorWhite"))
    goto LABEL_9;
  if (self->_primary)
  {
LABEL_12:
    if (!-[MKPlaceHeaderButton _isTintColorWhite](self, "_isTintColorWhite"))
    {
      if (self->_primary)
        return;
      goto LABEL_7;
    }
LABEL_9:
    v9 = [MKVibrantView alloc];
    v10 = -[MKVibrantView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    vibrantView = self->_vibrantView;
    self->_vibrantView = v10;

    -[MKVibrantView setTranslatesAutoresizingMaskIntoConstraints:](self->_vibrantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVibrantView setBackgroundColor:](self->_vibrantView, "setBackgroundColor:", v12);

    -[MKVibrantView setUserInteractionEnabled:](self->_vibrantView, "setUserInteractionEnabled:", 0);
    -[MKVibrantView setContinuousCornerRadius:](self->_vibrantView, "setContinuousCornerRadius:", 8.0);
    -[MKPlaceHeaderButton insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_vibrantView, 0);
    v23 = (void *)MEMORY[0x1E0CB3718];
    -[MKVibrantView topAnchor](self->_vibrantView, "topAnchor");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton topAnchor](self, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v24;
    -[MKVibrantView bottomAnchor](self->_vibrantView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton bottomAnchor](self, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v15;
    -[MKVibrantView leadingAnchor](self->_vibrantView, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton leadingAnchor](self, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v18;
    -[MKVibrantView trailingAnchor](self->_vibrantView, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v22);

    return;
  }
LABEL_7:
  if (-[MKPlaceHeaderButton _isTintColorWhite](self, "_isTintColorWhite"))
  {
    -[MKPlaceHeaderButton layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCornerRadius:", 8.0);

    v4 = *MEMORY[0x1E0CD2A68];
    -[MKPlaceHeaderButton layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.200000003);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    -[MKPlaceHeaderButton layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);

    -[MKPlaceHeaderButton layer](self, "layer");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBorderWidth:", 1.0);

  }
}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  int v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id WeakRetained;

  v3 = (void *)MEMORY[0x1E0CEA5E8];
  v4 = (void *)MEMORY[0x1E0CEA5F0];
  v5 = _MKPlaceCardUseSmallerFont();
  v6 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x1E0CEB588];
  objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v6, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mapkit_scaledValueForValue:", 52.0);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

  if (self->_primary)
  {
    -[MKPlaceHeaderButton titleLabel](self, "titleLabel");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton setPrimaryTitle:](self, "setPrimaryTitle:", v9);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(WeakRetained, "buttonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(v10, "buttonSubTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton setPrimaryTitle:subtitle:](self, "setPrimaryTitle:subtitle:", v9, v11);

  }
}

- (void)infoCardThemeChanged
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceHeaderButton;
  -[UIView infoCardThemeChanged](&v7, sel_infoCardThemeChanged);
  if (self->_primary)
  {
    -[MKPlaceHeaderButton _updateStylePrimaryButton](self, "_updateStylePrimaryButton");
  }
  else
  {
    -[MKPlaceHeaderButton _updateStyleNonPrimaryButton](self, "_updateStyleNonPrimaryButton");
    WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(WeakRetained, "buttonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(v5, "buttonSubTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton setPrimaryTitle:subtitle:](self, "setPrimaryTitle:subtitle:", v4, v6);

  }
}

- (void)applyButtonDefaultConfiguration
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *heightConstraint;
  id v13;

  -[MKPlaceHeaderButton _accessibilitySetInterfaceStyleIntent:](self, "_accessibilitySetInterfaceStyleIntent:", 1);
  -[MKPlaceHeaderButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 5.0, 10.0, 5.0, 10.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  if (WeakRetained)
    -[MKPlaceHeaderButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel_buttonSelected_, 0x2000);
  -[MKPlaceHeaderButton setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPlaceHeaderButton heightAnchor](self, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA5E8];
  v6 = (void *)MEMORY[0x1E0CEA5F0];
  v7 = _MKPlaceCardUseSmallerFont();
  v8 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (!v7)
    v8 = (_QWORD *)MEMORY[0x1E0CEB588];
  objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v8, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_mapkit_scaledValueForValue:", 52.0);
  objc_msgSend(v4, "constraintEqualToConstant:");
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v11;

  -[NSLayoutConstraint setActive:](self->_heightConstraint, "setActive:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

- (void)buttonSelected:(id)a3
{
  id v4;
  id WeakRetained;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  id v8;

  v4 = a3;
  if (!self->_primary)
  {
    v8 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(WeakRetained, "buttonSelectedBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v8;
      else
        v7 = 0;
      ((void (**)(_QWORD, id))v6)[2](v6, v7);
    }

    v4 = v8;
  }

}

- (BOOL)_isTintColorWhite
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[UIView mk_theme](self, "mk_theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)_primaryButtonTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

- (id)_primaryButtonColor
{
  void *v2;
  unint64_t buttonType;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  buttonType = self->_buttonType;
  if (buttonType <= 4)
  {
    if (buttonType == 2)
    {
      -[UIView mk_theme](self, "mk_theme");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isDarkTheme") & 1) != 0)
      {
        v6 = 0.243137255;
        v7 = 0.776470602;
        v8 = 0.333333343;
      }
      else
      {
        v6 = 0.270000011;
        v7 = 0.860000014;
        v8 = 0.370000005;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v6, v7, v8, 1.0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView mk_theme](self, "mk_theme");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tintColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v2 = (void *)v5;

  }
  return v2;
}

- (void)setPrimaryTitle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  -[MKPlaceHeaderButton _primaryButtonTextColor](self, "_primaryButtonTextColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  v7 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0CEA0A0], v10, 0, v5);
  -[MKPlaceHeaderButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v6, 0);
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v9, "addAttribute:value:range:", v7, v8, 0, v5);
  -[MKPlaceHeaderButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v9, 1);

}

- (void)_updateStylePrimaryButton
{
  id v3;

  if (self->_primary)
  {
    -[MKPlaceHeaderButton updateButtonWithHighlighted:](self, "updateButtonWithHighlighted:", self->_buttonHighlighted);
    if (!-[MKPlaceHeaderButton _isTintColorWhite](self, "_isTintColorWhite"))
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("Button"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[MKPlaceHeaderButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v3, 0);

    }
  }
}

- (void)_updateStyleNonPrimaryButton
{
  if (!self->_primary)
    -[MKPlaceHeaderButton updateButtonWithHighlighted:](self, "updateButtonWithHighlighted:", self->_buttonHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  self->_buttonHighlighted = a3;
  -[MKPlaceHeaderButton updateButtonWithHighlighted:](self, "updateButtonWithHighlighted:");
}

- (void)updateButtonWithHighlighted:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    if (self->_primary && !-[MKPlaceHeaderButton _isTintColorWhite](self, "_isTintColorWhite"))
    {
      -[UIView mk_theme](self, "mk_theme");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "headerPrimaryButtonHighlightedColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceHeaderButton setTintColor:](self, "setTintColor:", v5);
      goto LABEL_9;
    }
    -[UIView mk_theme](self, "mk_theme");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buttonHighlightedColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_primary && !-[MKPlaceHeaderButton _isTintColorWhite](self, "_isTintColorWhite"))
    {
      -[MKPlaceHeaderButton _primaryButtonColor](self, "_primaryButtonColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MKPlaceHeaderButton setTintColor:](self, "setTintColor:", v7);
      goto LABEL_10;
    }
    -[UIView mk_theme](self, "mk_theme");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buttonNormalColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  -[MKVibrantView contentView](self->_vibrantView, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

LABEL_9:
LABEL_10:

}

- (void)setPrimaryTitle:(id)a3 subtitle:(id)a4
{
  const __CFString *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFString *)a3;
  v7 = a4;
  v8 = v7;
  if (v6)
    v9 = v6;
  else
    v9 = &stru_1E20DFC00;
  if (objc_msgSend(v7, "length"))
  {
    v10 = 0.0;
    v11 = -1.0;
    v12 = 0.0;
    v13 = 0.0;
  }
  else
  {
    v11 = *MEMORY[0x1E0CEB4B0];
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  -[MKPlaceHeaderButton setContentEdgeInsets:](self, "setContentEdgeInsets:", v11, v10, v12, v13);
  v14 = objc_msgSend(v8, "length");
  v15 = objc_alloc(MEMORY[0x1E0CB3778]);
  v16 = *MEMORY[0x1E0CEA098];
  if (v14)
  {
    v47 = *MEMORY[0x1E0CEA098];
    v17 = (void *)MEMORY[0x1E0CEA5E8];
    v18 = (void *)MEMORY[0x1E0CEA5F0];
    v19 = _MKPlaceCardUseSmallerFont();
    v20 = *MEMORY[0x1E0CEB558];
    v21 = *MEMORY[0x1E0CEB588];
    if (v19)
      v22 = *MEMORY[0x1E0CEB558];
    else
      v22 = *MEMORY[0x1E0CEB588];
    objc_msgSend(v18, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v22, 2, 0, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontWithDescriptor:size:", v23, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v15, "initWithString:attributes:", v9, v25);

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v26, "appendAttributedString:", v27);

    v28 = objc_alloc(MEMORY[0x1E0CB3498]);
    v45 = v16;
    v29 = (void *)MEMORY[0x1E0CEA5E8];
    if (_MKPlaceCardUseSmallerFont())
      v30 = v20;
    else
      v30 = v21;
    objc_msgSend(v29, "preferredFontForTextStyle:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pointSize");
    objc_msgSend(v29, "systemFontOfSize:weight:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v28, "initWithString:attributes:", v8, v33);
    objc_msgSend(v26, "appendAttributedString:", v34);

  }
  else
  {
    v49 = *MEMORY[0x1E0CEA098];
    v35 = (void *)MEMORY[0x1E0CEA5E8];
    v36 = (void *)MEMORY[0x1E0CEA5F0];
    v37 = _MKPlaceCardUseSmallerFont();
    v38 = (_QWORD *)MEMORY[0x1E0CEB558];
    if (!v37)
      v38 = (_QWORD *)MEMORY[0x1E0CEB588];
    objc_msgSend(v36, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *v38, 2, 0, v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fontWithDescriptor:size:", v31, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v15, "initWithString:attributes:", v9, v33);
  }

  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  objc_msgSend(v40, "setAlignment:", 1);
  objc_msgSend(v40, "setParagraphSpacing:", -3.0);
  objc_msgSend(v40, "setLineBreakMode:", 5);
  v41 = objc_msgSend(v26, "length");
  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x1E0CEA0D0], v40, 0, v41);
  if ((-[MKPlaceHeaderButton isEnabled](self, "isEnabled") & 1) != 0)
  {
    -[UIView mk_theme](self, "mk_theme");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "tintColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "colorWithAlphaComponent:", 0.3);
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x1E0CEA0A0], v43, 0, v41);
  -[MKPlaceHeaderButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v26, 0);

}

- (void)placeActionButtonControllerTextDidChange:(id)a3
{
  _MKPlaceActionButtonController **p_buttonController;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;

  p_buttonController = &self->_buttonController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonController);

  if (WeakRetained == v5)
  {
    v10 = objc_loadWeakRetained((id *)p_buttonController);
    objc_msgSend(v10, "buttonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)p_buttonController);
    objc_msgSend(v8, "buttonSubTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceHeaderButton setPrimaryTitle:subtitle:](self, "setPrimaryTitle:subtitle:", v7, v9);

  }
}

- (_MKPlaceActionButtonController)buttonController
{
  return (_MKPlaceActionButtonController *)objc_loadWeakRetained((id *)&self->_buttonController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonController);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
