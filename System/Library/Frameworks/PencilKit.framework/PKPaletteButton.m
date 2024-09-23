@implementation PKPaletteButton

+ (id)undoButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_undoButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Undo-Button"));
  return v4;
}

+ (id)redoButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_redoButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Redo-Button"));
  return v4;
}

+ (id)ellipsisButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_ellipsisButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("More-Button"));
  return v4;
}

+ (id)plusButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_plusButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Plus-Button"));
  return v4;
}

+ (id)UCBButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_UCBButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Scribble-Compact-Button"));
  return v4;
}

+ (id)keyboardButton
{
  PKPaletteKeyboardButton *v2;
  void *v3;
  PKPaletteKeyboardButton *v4;

  v2 = [PKPaletteKeyboardButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_keyboardButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteKeyboardButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteKeyboardButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Scribble-Keyboard-Button"));
  return v4;
}

+ (id)emojiKeyboardButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_emojiButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Scribble-Emoji-Button"));
  return v4;
}

+ (id)returnKeyButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_returnKeyButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  -[PKPaletteButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Scribble-Small-Return-Button"));
  return v4;
}

+ (id)textButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_textButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  return v4;
}

+ (id)shapeButton
{
  PKPaletteButton *v2;
  void *v3;
  PKPaletteButton *v4;

  v2 = [PKPaletteButton alloc];
  objc_msgSend(MEMORY[0x1E0DC3870], "pk_shapeButtonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteButton initWithImage:](v2, "initWithImage:", v3);

  return v4;
}

- (PKPaletteButton)initWithFrame:(CGRect)a3
{
  id v4;
  PKPaletteButton *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  v5 = -[PKPaletteButton initWithImage:](self, "initWithImage:", v4);

  return v5;
}

- (PKPaletteButton)initWithImage:(id)a3
{
  id v4;
  PKPaletteButton *v5;
  PKPaletteButton *v6;
  uint64_t v7;
  NSHashTable *observers;
  uint64_t v9;
  UIButton *button;
  uint64_t v11;
  UIPointerInteraction *pointerInteraction;
  void *v13;
  id v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaletteButton;
  v5 = -[PKPaletteButton initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_scalingFactor = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    if (!PKIsVisionDevice())
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v9 = objc_claimAutoreleasedReturnValue();
      button = v6->_button;
      v6->_button = (UIButton *)v9;

      -[UIButton setUserInteractionEnabled:](v6->_button, "setUserInteractionEnabled:", 0);
      -[UIButton setImage:forState:](v6->_button, "setImage:forState:", v4, 0);
      -[PKPaletteButton addSubview:](v6, "addSubview:", v6->_button);
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v6);
    pointerInteraction = v6->_pointerInteraction;
    v6->_pointerInteraction = (UIPointerInteraction *)v11;

    -[PKPaletteButton addInteraction:](v6, "addInteraction:", v6->_pointerInteraction);
    -[PKPaletteButton _uiButtonInstance](v6, "_uiButtonInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsLargeContentViewer:", 1);

    v14 = objc_alloc_init(MEMORY[0x1E0DC3998]);
    -[PKPaletteButton addInteraction:](v6, "addInteraction:", v14);

    -[PKPaletteButton setHitTestInsets:](v6, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
    -[PKPaletteButton _updateUI](v6, "_updateUI");
  }

  return v6;
}

- (void)setMenu:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[PKPaletteButton menu](self, "menu");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    -[PKPaletteButton setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", v6 != 0);
    -[PKPaletteButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", v6 != 0);
  }

}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    -[PKPaletteButton _updateUI](self, "_updateUI");
  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)_uiButtonInstance
{
  PKPaletteButton *v3;

  if (PKIsVisionDevice())
  {
    v3 = self;
  }
  else
  {
    -[PKPaletteButton button](self, "button");
    v3 = (PKPaletteButton *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)addIntrinsicContentSizeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaletteButton observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeIntrinsicContentSizeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaletteButton observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_notifyIntrinsicContentSizeDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKPaletteButton observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "buttonDidChangeIntrinsicContentSize:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PKPaletteButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteButton window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);
  v7 = PKPaletteButtonSize(v6);
  v9 = v8;

  -[PKPaletteButton scalingFactor](self, "scalingFactor");
  v11 = v9 * v10;
  v12 = v7 * v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  double MidX;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)PKPaletteButton;
  -[PKPaletteButton layoutSubviews](&v14, sel_layoutSubviews);
  if (!PKIsVisionDevice())
  {
    -[PKPaletteButton bounds](self, "bounds");
    MidX = CGRectGetMidX(v15);
    -[PKPaletteButton layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", MidX);

    -[PKPaletteButton bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PKPaletteButton button](self, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (id)_tintColorForCurrentState
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (-[PKPaletteButton _wantsCustomTintColor](self, "_wantsCustomTintColor"))
  {
    -[PKPaletteButton delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paletteButton:tintColorForState:", self, -[PKPaletteButton state](self, "state"));
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;

    return v5;
  }
  if (-[PKPaletteButton isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[PKPaletteButton isEnabled](self, "isEnabled"))
  {
    if ((-[PKPaletteButton isSelected](self, "isSelected") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v6;
  return v5;
}

- (BOOL)_wantsCustomTintColor
{
  void *v3;
  void *v4;
  char v5;

  -[PKPaletteButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPaletteButton delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "paletteButton:wantsCustomTintColorForState:", self, -[PKPaletteButton state](self, "state"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_backgroundColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!-[PKPaletteButton _wantsCustomBackgroundColor](self, "_wantsCustomBackgroundColor"))
  {
    if (-[PKPaletteButton useCompactLayout](self, "useCompactLayout"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[PKPaletteButton isHighlighted](self, "isHighlighted"))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (!-[PKPaletteButton isEnabled](self, "isEnabled")
        && (-[PKPaletteButton isEnabled](self, "isEnabled") & 1) != 0)
      {
        v6 = 0;
        return v6;
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    return v6;
  }
  -[PKPaletteButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteButton:backgroundColorForState:", self, -[PKPaletteButton state](self, "state"));
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v4;

  return v6;
}

- (BOOL)_wantsCustomBackgroundColor
{
  void *v3;
  void *v4;
  char v5;

  -[PKPaletteButton delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKPaletteButton delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "paletteButton:wantsCustomBackgroundColorForState:", self, -[PKPaletteButton state](self, "state"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPaletteButton isHidden](self, "isHidden") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    -[PKPaletteButton setHidden:](&v5, sel_setHidden_, v3);
    -[PKPaletteButton _notifyIntrinsicContentSizeDidChange](self, "_notifyIntrinsicContentSizeDidChange");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPaletteButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    -[PKPaletteButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[PKPaletteButton _updateUI](self, "_updateUI");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPaletteButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    -[PKPaletteButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[PKPaletteButton _updateUI](self, "_updateUI");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPaletteButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteButton;
    -[PKPaletteButton setSelected:](&v5, sel_setSelected_, v3);
    -[PKPaletteButton _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[6];

  if (!PKIsVisionDevice())
  {
    v3 = -[PKPaletteButton isEnabled](self, "isEnabled");
    -[PKPaletteButton button](self, "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

    v5 = -[PKPaletteButton isSelected](self, "isSelected");
    -[PKPaletteButton button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelected:", v5);

    v7 = -[PKPaletteButton isHighlighted](self, "isHighlighted");
    -[PKPaletteButton button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighlighted:", v7);

    -[PKPaletteButton _buttonTransform](self, "_buttonTransform");
    -[PKPaletteButton button](self, "button");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v12[3];
    v12[1] = v12[4];
    v12[2] = v12[5];
    objc_msgSend(v9, "setTransform:", v12);

    -[PKPaletteButton _backgroundColor](self, "_backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteButton setBackgroundColor:](self, "setBackgroundColor:", v10);

    -[PKPaletteButton _tintColorForCurrentState](self, "_tintColorForCurrentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteButton setTintColor:](self, "setTintColor:", v11);

  }
}

- (CGAffineTransform)_buttonTransform
{
  uint64_t v5;
  __int128 v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  v7 = -[PKPaletteButton useCompactLayout](self, "useCompactLayout");
  -[PKPaletteButton scalingFactor](self, "scalingFactor");
  v9 = v8;
  if (v7)
  {
    v9 = v8 * 0.75;
    -[PKPaletteButton scalingFactor](self, "scalingFactor");
    v11 = v10 * 0.75;
  }
  else
  {
    -[PKPaletteButton scalingFactor](self, "scalingFactor");
    v11 = v12;
  }
  return CGAffineTransformMakeScale(retstr, v9, v11);
}

- (void)setScalingFactor:(double)a3
{
  if (self->_scalingFactor != a3)
  {
    self->_scalingFactor = a3;
    -[PKPaletteButton _updateUI](self, "_updateUI");
    -[PKPaletteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PKPaletteButton _notifyIntrinsicContentSizeDidChange](self, "_notifyIntrinsicContentSizeDidChange");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteButton;
  -[PKPaletteButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteButton traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteButton _updateUI](self, "_updateUI");
  -[PKPaletteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PKPaletteButton _notifyIntrinsicContentSizeDidChange](self, "_notifyIntrinsicContentSizeDidChange");
LABEL_6:

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC36B8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PKPaletteButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v9[3] = &unk_1E777CCF0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __73__PKPaletteButton_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "menu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  CGRect v6;
  CGRect v7;

  objc_msgSend(a5, "rect", a3, a4);
  v7 = CGRectInset(v6, -8.0, -8.0);
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0DC3D90];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithView:", v7);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteButtonDelegate)delegate
{
  return (PKPaletteButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
