@implementation SFNavigationBarToggleButton

- (void)setPointerPreviewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_pointerPreviewContainer, a3);
}

- (void)setResizableBackgroundCornerRadius:(double)a3
{
  if (self->_resizableBackgroundCornerRadius != a3)
  {
    self->_resizableBackgroundCornerRadius = a3;
    -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumSideMargin:(double)a3
{
  if (self->_minimumSideMargin != a3)
  {
    self->_minimumSideMargin = a3;
    -[SFNavigationBarToggleButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (SFNavigationBarToggleButton)initWithImage:(id)a3 forInputMode:(unint64_t)a4
{
  id v7;
  SFNavigationBarToggleButton *v8;
  SFNavigationBarToggleButton *v9;
  UIView *v10;
  UIView *tiplessPopoverSourceView;
  SFToggleBackgroundView *v12;
  SFToggleBackgroundView *selectedStateMaskView;
  SFToggleBackgroundView *v14;
  int64_t cornerRoundingMode;
  uint64_t v16;
  UIImageView *selectedStateImageView;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  UIView *selectedStateFillView;
  uint64_t v23;
  UIImageView *defaultStateImageView;
  uint64_t v25;
  UIImageView *secondaryImageView;
  uint64_t v27;
  UIImageView *tertiaryImageView;
  UIView *v29;
  UIView *badgeView;
  void *v31;
  void *v32;
  uint64_t v33;
  UIPointerInteraction *pointerInteraction;
  void *v35;
  id v36;
  SFNavigationBarToggleButton *v37;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;

  v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFNavigationBarToggleButton;
  v8 = -[SFNavigationBarToggleButton initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a3);
    v9->_inputMode = a4;
    v9->_cornerRoundingMode = a4 != 1;
    v9->_insetFromBackground = _SFOnePixel();
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    tiplessPopoverSourceView = v9->_tiplessPopoverSourceView;
    v9->_tiplessPopoverSourceView = v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_tiplessPopoverSourceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v9->_tiplessPopoverSourceView, "setUserInteractionEnabled:", 0);
    -[SFNavigationBarToggleButton addSubview:](v9, "addSubview:", v9->_tiplessPopoverSourceView);
    v12 = objc_alloc_init(SFToggleBackgroundView);
    selectedStateMaskView = v9->_selectedStateMaskView;
    v9->_selectedStateMaskView = v12;

    v14 = v9->_selectedStateMaskView;
    if (v14)
    {
      cornerRoundingMode = v9->_cornerRoundingMode;
      if (v14->_cornerRoundingMode != cornerRoundingMode)
      {
        v14->_cornerRoundingMode = cornerRoundingMode;
        -[SFToggleBackgroundView setNeedsLayout](v14, "setNeedsLayout");
        v14 = v9->_selectedStateMaskView;
      }
    }
    -[SFNavigationBarToggleButton setMaskView:](v9, "setMaskView:", v14);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    selectedStateImageView = v9->_selectedStateImageView;
    v9->_selectedStateImageView = (UIImageView *)v16;

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView layer](v9->_selectedStateImageView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", v18);

    -[UIImageView setContentMode:](v9->_selectedStateImageView, "setContentMode:", 4);
    v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[SFNavigationBarToggleButton bounds](v9, "bounds");
    v21 = objc_msgSend(v20, "initWithFrame:");
    selectedStateFillView = v9->_selectedStateFillView;
    v9->_selectedStateFillView = (UIView *)v21;

    -[UIView setAutoresizingMask:](v9->_selectedStateFillView, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v9->_selectedStateFillView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v9->_selectedStateFillView, "setAlpha:", 0.0);
    -[UIView addSubview:](v9->_selectedStateFillView, "addSubview:", v9->_selectedStateImageView);
    -[SFNavigationBarToggleButton addSubview:](v9, "addSubview:", v9->_selectedStateFillView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    defaultStateImageView = v9->_defaultStateImageView;
    v9->_defaultStateImageView = (UIImageView *)v23;

    -[UIImageView setUserInteractionEnabled:](v9->_defaultStateImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v9->_defaultStateImageView, "setContentMode:", 4);
    -[SFNavigationBarToggleButton addSubview:](v9, "addSubview:", v9->_defaultStateImageView);
    -[SFNavigationBarToggleButton _createAccessoryImageView](v9);
    v25 = objc_claimAutoreleasedReturnValue();
    secondaryImageView = v9->_secondaryImageView;
    v9->_secondaryImageView = (UIImageView *)v25;

    -[SFNavigationBarToggleButton _createAccessoryImageView](v9);
    v27 = objc_claimAutoreleasedReturnValue();
    tertiaryImageView = v9->_tertiaryImageView;
    v9->_tertiaryImageView = (UIImageView *)v27;

    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    badgeView = v9->_badgeView;
    v9->_badgeView = v29;

    -[UIView setHidden:](v9->_badgeView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_badgeView, "setBackgroundColor:", v31);

    -[UIView _setContinuousCornerRadius:](v9->_badgeView, "_setContinuousCornerRadius:", 2.5);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFNavigationBarToggleButton addSubview:](v9, "addSubview:", v9->_badgeView);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setGlyphTintColor:](v9, "setGlyphTintColor:", v32);

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v9);
    pointerInteraction = v9->_pointerInteraction;
    v9->_pointerInteraction = (UIPointerInteraction *)v33;

    -[SFNavigationBarToggleButton addInteraction:](v9, "addInteraction:", v9->_pointerInteraction);
    objc_initWeak(&location, v9);
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __58__SFNavigationBarToggleButton_initWithImage_forInputMode___block_invoke;
    v39[3] = &unk_1E21E4650;
    objc_copyWeak(&v40, &location);
    v36 = (id)-[SFNavigationBarToggleButton registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v35, v39);

    v37 = v9;
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (id)_createAccessoryImageView
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v2, "setUserInteractionEnabled:", 0);
    objc_msgSend(v2, "setContentMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPreferredSymbolConfiguration:", v3);

    objc_msgSend(a1, "addSubview:", v2);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setGlyphTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_glyphTintColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphTintColor, a3);
    -[SFNavigationBarToggleButton _updateDefaultStateImageView]((uint64_t)self);
    -[SFNavigationBarToggleButton _updateSelectedStateView]((uint64_t)self);
  }

}

- (void)_updateSelectedStateView
{
  void *v2;
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  if (a1)
  {
    v2 = *(void **)(a1 + 888);
    if (v2)
    {
      v3 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v3;
    objc_msgSend(*(id *)(a1 + 816), "setBackgroundColor:", v3);
    if (objc_msgSend((id)a1, "isSelected"))
      v4 = *(_BYTE *)(a1 + 760) != 0;
    else
      v4 = 0;
    if (objc_msgSend(v16, "sf_isDarkColor"))
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", (double)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setBackgroundColor:", v6);

    if (v4)
      v7 = 0;
    else
      v7 = *(_QWORD *)(a1 + 872);
    v8 = *(_QWORD **)(a1 + 808);
    if (v8 && v8[54] != v7)
    {
      v8[54] = v7;
      objc_msgSend(v8, "setNeedsLayout");
    }
    if (objc_msgSend((id)a1, "isHighlighted"))
    {
      if (*(_BYTE *)(a1 + 843))
        v9 = 1;
      else
        v9 = objc_msgSend((id)a1, "isSelected");
    }
    else
    {
      v9 = 0;
    }
    v10 = objc_msgSend((id)a1, "isSelected");
    v11 = 0.2;
    if (!v9)
      v11 = 0.0;
    v12 = 0.8;
    if (!v9)
      v12 = 1.0;
    if (v10)
      v11 = v12;
    objc_msgSend(*(id *)(a1 + 816), "setAlpha:", v11);
    if (objc_msgSend((id)a1, "isSelected"))
    {
      objc_msgSend((id)a1, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "userInterfaceStyle");

      if (v14 == 1)
        v15 = 2;
      else
        v15 = 1;
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(*(id *)(a1 + 784), "setOverrideUserInterfaceStyle:", v15);
    objc_msgSend(*(id *)(a1 + 792), "setOverrideUserInterfaceStyle:", v15);

  }
}

- (void)_updateDefaultStateImageView
{
  id v2;
  void *v3;
  int v4;
  char v5;
  char v6;
  double v7;
  id v8;

  if (a1)
  {
    if (objc_msgSend((id)a1, "tintAdjustmentMode") == 2)
    {
      objc_msgSend((id)a1, "tintColor");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = *(void **)(a1 + 888);
      if (v3)
      {
        v2 = v3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v2 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v8 = v2;
    objc_msgSend(*(id *)(a1 + 768), "setTintColor:", v2);
    objc_msgSend(*(id *)(a1 + 776), "setTintColor:", v8);
    if (objc_msgSend((id)a1, "isHighlighted"))
    {
      v4 = *(unsigned __int8 *)(a1 + 843);
      v5 = objc_msgSend((id)a1, "isSelected");
      v6 = v5;
      if (v4)
      {
        if ((v5 & 1) == 0)
          goto LABEL_17;
        goto LABEL_12;
      }
      if ((objc_msgSend((id)a1, "isSelected") & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 768), "setAlpha:", 0.0);
        v7 = 1.0;
        if ((v6 & 1) != 0)
          goto LABEL_18;
LABEL_20:
        v7 = 0.2;
        goto LABEL_18;
      }
      if ((v6 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 768), "setAlpha:", 0.2);
        goto LABEL_20;
      }
    }
    else if ((objc_msgSend((id)a1, "isSelected") & 1) != 0)
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 768), "setAlpha:", 0.0);
      v7 = 1.0;
LABEL_18:
      objc_msgSend(*(id *)(a1 + 784), "setAlpha:", v7);
      objc_msgSend(*(id *)(a1 + 792), "setAlpha:", v7);
      objc_msgSend(*(id *)(a1 + 800), "setAlpha:", v7);
      objc_msgSend(*(id *)(a1 + 824), "setAlpha:", v7);

      return;
    }
LABEL_17:
    v7 = 1.0;
    objc_msgSend(*(id *)(a1 + 768), "setAlpha:", 1.0);
    goto LABEL_18;
  }
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  UIImageSymbolConfiguration *v5;
  UIImageSymbolConfiguration *preferredSymbolConfiguration;
  BOOL v7;
  UIImageSymbolConfiguration *v8;

  v5 = (UIImageSymbolConfiguration *)a3;
  preferredSymbolConfiguration = self->_preferredSymbolConfiguration;
  if (preferredSymbolConfiguration != v5)
  {
    v8 = v5;
    v7 = -[UIImageSymbolConfiguration isEqualToConfiguration:](preferredSymbolConfiguration, "isEqualToConfiguration:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
      -[UIImageView setPreferredSymbolConfiguration:](self->_defaultStateImageView, "setPreferredSymbolConfiguration:", v8);
      -[UIImageView setPreferredSymbolConfiguration:](self->_selectedStateImageView, "setPreferredSymbolConfiguration:", v8);
      v5 = v8;
    }
  }

}

+ (CGSize)glyphSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)pageMenuImageWithIntelligence:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("apple.page.menu.badge.sparkles"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3888];
    badgeTintColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithSymbolConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("apple.page.menu"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)readerImageWithSummary:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("text.page.badge.sparkles"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3888];
    badgeTintColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithSymbolConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("text.page"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (UIImage)translationImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
}

+ (UIImage)extensionsImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("puzzlepiece.extension.fill"));
}

+ (UIImage)siriReaderPlayingImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("speaker.wave.2.bubble.left"));
}

void __58__SFNavigationBarToggleButton_initWithImage_forInputMode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SFNavigationBarToggleButton _updateSelectedStateView]((uint64_t)WeakRetained);

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *image;
  char v7;
  UIImage *v8;

  v5 = (UIImage *)a3;
  image = self->_image;
  if (image != v5)
  {
    v8 = v5;
    v7 = -[UIImage isEqual:](image, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      -[UIImageView setImage:](self->_selectedStateImageView, "setImage:", v8);
      -[UIImageView setImage:](self->_defaultStateImageView, "setImage:", v8);
      -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
      v5 = v8;
    }
  }

}

- (UIImage)secondaryImage
{
  return -[UIImageView image](self->_secondaryImageView, "image");
}

- (void)setSecondaryImage:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SFNavigationBarToggleButton secondaryImage](self, "secondaryImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[UIImageView setImage:](self->_secondaryImageView, "setImage:", v6);
    -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIImage)tertiaryImage
{
  return -[UIImageView image](self->_tertiaryImageView, "image");
}

- (void)setTertiaryImage:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SFNavigationBarToggleButton tertiaryImage](self, "tertiaryImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[UIImageView setImage:](self->_tertiaryImageView, "setImage:", v6);
    -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIColor)secondaryImageColor
{
  return -[UIImageView tintColor](self->_secondaryImageView, "tintColor");
}

- (void)setSecondaryImageColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SFNavigationBarToggleButton secondaryImageColor](self, "secondaryImageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIImageView setTintColor:](self->_secondaryImageView, "setTintColor:", v6);

}

- (UIColor)tertiaryImageColor
{
  return -[UIImageView tintColor](self->_tertiaryImageView, "tintColor");
}

- (void)setTertiaryImageColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SFNavigationBarToggleButton tertiaryImageColor](self, "tertiaryImageColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIImageView setTintColor:](self->_tertiaryImageView, "setTintColor:", v6);

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *accessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    v7 = v5;
    if (v5)
      -[SFNavigationBarToggleButton addSubview:](self, "addSubview:", v5);
    else
      -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setShowsBadge:(BOOL)a3
{
  if (self->_showsBadge != a3)
  {
    self->_showsBadge = a3;
    -[UIView setHidden:](self->_badgeView, "setHidden:", !a3);
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFNavigationBarToggleButton;
  -[SFNavigationBarToggleButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SFNavigationBarToggleButton _updateDefaultStateImageView]((uint64_t)self);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double minimumSideMargin;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  SFToggleBackgroundView **p_selectedStateMaskView;
  double v20;
  double insetFromBackground;
  double MinX;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v63.receiver = self;
  v63.super_class = (Class)SFNavigationBarToggleButton;
  -[SFNavigationBarToggleButton layoutSubviews](&v63, sel_layoutSubviews);
  -[SFNavigationBarToggleButton bounds](self, "bounds");
  x = v64.origin.x;
  y = v64.origin.y;
  width = v64.size.width;
  height = v64.size.height;
  v7 = CGRectGetWidth(v64);
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  v8 = CGRectGetHeight(v65);
  v9 = _SFCGRectOfSizeAlignedWithinRect(0, 0, 30.34, 21.0, x, y, width, height);
  minimumSideMargin = _SFRoundRectToPixels(v9);
  v14 = v13;
  if (self->_minimumSideMargin != 0.0)
    minimumSideMargin = self->_minimumSideMargin;
  v58 = v12;
  v60 = minimumSideMargin;
  v15 = v11;
  -[UIImageView setFrame:](self->_defaultStateImageView, "setFrame:");
  v50 = y;
  v51 = x;
  v56 = height;
  v57 = width;
  v54 = v14;
  v62 = v8;
  if (self->_inputMode == 1)
  {
    v16 = fmin(v7, v8);
    if (self->_accessoryView
      || (-[UIImageView image](self->_secondaryImageView, "image"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v18 = v16,
          v17))
    {
      v18 = v7;
    }
    p_selectedStateMaskView = &self->_selectedStateMaskView;
    -[SFToggleBackgroundView setBounds:](self->_selectedStateMaskView, "setBounds:", 0.0, 0.0, v18, v16);
    UIRectGetCenter();
    -[SFToggleBackgroundView setCenter:](self->_selectedStateMaskView, "setCenter:");
    v20 = 12.0;
    v14 = v54;
  }
  else
  {
    if (self->_usesInsetFromBackground)
      insetFromBackground = self->_insetFromBackground;
    else
      insetFromBackground = 0.0;
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v67 = CGRectInset(v66, insetFromBackground, insetFromBackground);
    p_selectedStateMaskView = &self->_selectedStateMaskView;
    -[SFToggleBackgroundView setFrame:](self->_selectedStateMaskView, "setFrame:", v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
    v20 = _SFContinuousCornerRadiusMatchingRadiusWithInset(self->_resizableBackgroundCornerRadius, insetFromBackground);
  }
  -[SFToggleBackgroundView _setContinuousCornerRadius:](*p_selectedStateMaskView, "_setContinuousCornerRadius:", v20);
  v52 = v15;
  -[UIImageView setFrame:](self->_selectedStateImageView, "setFrame:", v60, v15, v58, v14);
  v68.origin.x = v60;
  v68.origin.y = v15;
  v68.size.width = v58;
  v68.size.height = v14;
  MinX = CGRectGetMinX(v68);
  v69.origin.x = v60;
  v69.origin.y = v15;
  v69.size.width = v58;
  v69.size.height = v14;
  -[UIView setFrame:](self->_tiplessPopoverSourceView, "setFrame:", MinX, 7.0, CGRectGetWidth(v69), v62);
  v53 = self->_minimumSideMargin + 30.34 + -5.0;
  -[UIView setFrame:](self->_badgeView, "setFrame:");
  -[SFNavigationBarToggleButton _resolvedSecondaryView]((char *)self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarToggleButton _resolvedTertiaryView]((char *)self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0C9D820];
  v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v23, "sizeThatFits:", *MEMORY[0x1E0C9D820], v26);
  objc_msgSend(v24, "sizeThatFits:", v25, v26);
  v27 = _SFRoundRectToPixels(v58 + v60 + 2.0);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v23, "setFrame:");
  v34 = _SFRoundRectToPixels(v27 + v31 + 2.0);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  objc_msgSend(v24, "setFrame:");
  if (!-[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
  {
    v41 = _SFFlipRectInCoordinateSpace(1, v60, v52, v58, v54, v51, v50, v57, v56);
    v59 = v40;
    v61 = v38;
    v42 = v41;
    v44 = v43;
    v49 = v33;
    v46 = v45;
    v55 = v34;
    v48 = v47;
    -[UIImageView setFrame:](self->_defaultStateImageView, "setFrame:");
    -[UIImageView setFrame:](self->_selectedStateImageView, "setFrame:", v42, v44, v46, v48);
    -[UIView setFrame:](self->_badgeView, "setFrame:", _SFFlipRectInCoordinateSpace(1, v53, v52, 5.0, 5.0, v51, v50, v57, v56));
    objc_msgSend(v23, "setFrame:", _SFFlipRectInCoordinateSpace(1, v27, v29, v31, v49, v51, v50, v57, v56));
    objc_msgSend(v24, "setFrame:", _SFFlipRectInCoordinateSpace(1, v55, v36, v61, v59, v51, v50, v57, v56));
  }

}

- (char)_resolvedSecondaryView
{
  char *v1;
  void *v2;
  int *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "secondaryImage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = &OBJC_IVAR___SFNavigationBarToggleButton__secondaryImageView;
    if (!v2)
      v3 = &OBJC_IVAR___SFNavigationBarToggleButton__accessoryView;
    v1 = (char *)*(id *)&v1[*v3];

  }
  return v1;
}

- (char)_resolvedTertiaryView
{
  char *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (a1)
  {
    -[SFNavigationBarToggleButton _resolvedSecondaryView](a1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    v4 = (void *)*((_QWORD *)v1 + 100);
    if (v2 != *((_QWORD *)v1 + 98) || !v4)
    {
      if ((void *)v2 != v4
        || (objc_msgSend(v1, "secondaryImage"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
      {
        objc_msgSend(v1, "tertiaryImage");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          v6 = (void *)*((_QWORD *)v1 + 99);
        else
          v6 = 0;
        v1 = v6;

        goto LABEL_13;
      }
      v4 = (void *)*((_QWORD *)v1 + 98);
    }
    v1 = v4;
LABEL_13:

  }
  return v1;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  if (self->_minimumSideMargin == 0.0)
  {
    v16.receiver = self;
    v16.super_class = (Class)SFNavigationBarToggleButton;
    -[SFNavigationBarToggleButton intrinsicContentSize](&v16, sel_intrinsicContentSize);
    v10 = v12;
    v11 = v13;
  }
  else
  {
    -[SFNavigationBarToggleButton _resolvedSecondaryView]((char *)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton _resolvedTertiaryView]((char *)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
    v6 = (double *)MEMORY[0x1E0C9D820];
    v7 = 0.0;
    if (v3)
    {
      objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v7 = v8 + 2.0;
    }
    if (v4)
    {
      objc_msgSend(v4, "sizeThatFits:", *v6, v6[1]);
      v5 = v9 + 2.0;
    }
    v10 = self->_minimumSideMargin + v5 + v7 + self->_minimumSideMargin + 30.34;
    v11 = 21.0;

  }
  v14 = v10;
  v15 = v11;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setCornerRoundingMode:(int64_t)a3
{
  SFToggleBackgroundView *selectedStateMaskView;

  if (self->_cornerRoundingMode != a3)
  {
    self->_cornerRoundingMode = a3;
    selectedStateMaskView = self->_selectedStateMaskView;
    if (selectedStateMaskView)
    {
      if (selectedStateMaskView->_cornerRoundingMode != a3)
      {
        selectedStateMaskView->_cornerRoundingMode = a3;
        -[SFToggleBackgroundView setNeedsLayout](selectedStateMaskView, "setNeedsLayout");
      }
    }
  }
}

- (void)setInsetFromBackground:(double)a3
{
  if (self->_insetFromBackground != a3)
  {
    self->_insetFromBackground = a3;
    -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUsesInsetFromBackground:(BOOL)a3
{
  if (self->_usesInsetFromBackground != a3)
  {
    self->_usesInsetFromBackground = a3;
    -[SFNavigationBarToggleButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  _QWORD v6[5];
  objc_super v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFNavigationBarToggleButton;
  if (-[SFNavigationBarToggleButton isHighlighted](&v8, sel_isHighlighted) != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SFNavigationBarToggleButton;
    -[SFNavigationBarToggleButton setHighlighted:](&v7, sel_setHighlighted_, v3);
    v5 = 0.2;
    if (v3)
      v5 = 0.0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__SFNavigationBarToggleButton_setHighlighted___block_invoke;
    v6[3] = &unk_1E21E2050;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659332, v6, 0, v5, 0.0);
  }
}

void __46__SFNavigationBarToggleButton_setHighlighted___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    -[SFNavigationBarToggleButton _updateDefaultStateImageView](*(_QWORD *)(a1 + 32));
    -[SFNavigationBarToggleButton _updateSelectedStateView](v1);
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];
  objc_super v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFNavigationBarToggleButton;
  if (-[SFNavigationBarToggleButton isSelected](&v10, sel_isSelected) != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)SFNavigationBarToggleButton;
    -[SFNavigationBarToggleButton setSelected:](&v9, sel_setSelected_, v3);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__SFNavigationBarToggleButton_setSelected___block_invoke;
    v8[3] = &unk_1E21E2050;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659332, v8, 0, 0.25, 0.0);
    v6 = 0.195;
    if (v3)
      v6 = 0.205;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __43__SFNavigationBarToggleButton_setSelected___block_invoke_2;
    v7[3] = &unk_1E21E2050;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659332, v7, 0, v6, 0.0);
    -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
  }
}

void __43__SFNavigationBarToggleButton_setSelected___block_invoke(uint64_t a1)
{
  -[SFNavigationBarToggleButton _updateDefaultStateImageView](*(_QWORD *)(a1 + 32));
}

void __43__SFNavigationBarToggleButton_setSelected___block_invoke_2(uint64_t a1)
{
  -[SFNavigationBarToggleButton _updateSelectedStateView](*(_QWORD *)(a1 + 32));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
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
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGRect v33;
  CGRect v34;

  -[SFNavigationBarToggleButton superview](self, "superview", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_pointerPreviewContainer);
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = WeakRetained;
  else
    v8 = v5;
  v9 = v8;

  -[SFNavigationBarToggleButton center](self, "center");
  objc_msgSend(v9, "convertPoint:fromView:", v5);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B88]), "initWithContainer:center:", v9, v10, v11);

  v13 = objc_alloc(MEMORY[0x1E0DC3D90]);
  v14 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v15 = (void *)objc_msgSend(v13, "initWithView:parameters:target:", self, v14, v12);

  if (-[SFNavigationBarToggleButton isSelected](self, "isSelected"))
  {
    v16 = (void *)MEMORY[0x1E0DC3B30];
    -[SFNavigationBarToggleButton superview](self, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFToggleBackgroundView bounds](self->_selectedStateMaskView, "bounds");
    objc_msgSend(v17, "convertRect:fromView:", self->_selectedStateMaskView);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[SFToggleBackgroundView _continuousCornerRadius](self->_selectedStateMaskView, "_continuousCornerRadius");
    objc_msgSend(v16, "shapeWithRoundedRect:cornerRadius:", v19, v21, v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0DC3B20];
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0DC3B30];
    if (self->_inputMode)
    {
      objc_msgSend(MEMORY[0x1E0DC3B30], "sf_shapeForToolbarButton:", self);
    }
    else
    {
      -[SFNavigationBarToggleButton frame](self, "frame");
      v34 = CGRectInset(v33, 2.0, 2.0);
      objc_msgSend(v29, "shapeWithRoundedRect:cornerRadius:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height, self->_resizableBackgroundCornerRadius + -2.0);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0DC3B00];
  }
  objc_msgSend(v28, "effectWithPreview:", v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v30, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  self->_liftedForCursor = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__SFNavigationBarToggleButton_pointerInteraction_willEnterRegion_animator___block_invoke;
  v5[3] = &unk_1E21E2050;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

void __75__SFNavigationBarToggleButton_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  -[SFNavigationBarToggleButton _updateSelectedStateView](*(_QWORD *)(a1 + 32));
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  self->_liftedForCursor = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__SFNavigationBarToggleButton_pointerInteraction_willExitRegion_animator___block_invoke;
  v5[3] = &unk_1E21E2050;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

void __74__SFNavigationBarToggleButton_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  -[SFNavigationBarToggleButton _updateSelectedStateView](*(_QWORD *)(a1 + 32));
}

- (UIImage)image
{
  return self->_image;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (double)minimumSideMargin
{
  return self->_minimumSideMargin;
}

- (BOOL)showsBadge
{
  return self->_showsBadge;
}

- (BOOL)drawsLightGlyph
{
  return self->_drawsLightGlyph;
}

- (void)setDrawsLightGlyph:(BOOL)a3
{
  self->_drawsLightGlyph = a3;
}

- (double)resizableBackgroundCornerRadius
{
  return self->_resizableBackgroundCornerRadius;
}

- (int64_t)cornerRoundingMode
{
  return self->_cornerRoundingMode;
}

- (double)insetFromBackground
{
  return self->_insetFromBackground;
}

- (BOOL)usesInsetFromBackground
{
  return self->_usesInsetFromBackground;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (BOOL)highlightsBackground
{
  return self->_highlightsBackground;
}

- (void)setHighlightsBackground:(BOOL)a3
{
  self->_highlightsBackground = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (UIView)pointerPreviewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_pointerPreviewContainer);
}

- (UIView)tiplessPopoverSourceView
{
  return self->_tiplessPopoverSourceView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiplessPopoverSourceView, 0);
  objc_destroyWeak((id *)&self->_pointerPreviewContainer);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_selectedStateFillView, 0);
  objc_storeStrong((id *)&self->_selectedStateMaskView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_tertiaryImageView, 0);
  objc_storeStrong((id *)&self->_secondaryImageView, 0);
  objc_storeStrong((id *)&self->_selectedStateImageView, 0);
  objc_storeStrong((id *)&self->_defaultStateImageView, 0);
}

@end
