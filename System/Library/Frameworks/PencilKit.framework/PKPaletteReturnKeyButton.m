@implementation PKPaletteReturnKeyButton

- (PKPaletteReturnKeyButton)initWithFrame:(CGRect)a3
{
  PKPaletteReturnKeyButton *v3;
  PKPaletteReturnKeyButton *v4;
  PKPaletteReturnKeyButtonContentView *v5;
  PKPaletteReturnKeyButtonContentView *contentView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PKTextInputLanguageSelectionToken *observerToken;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PKPaletteReturnKeyButton;
  v3 = -[PKPaletteButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKPaletteReturnKeyButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Scribble-Large-Return-Button"));
    v5 = objc_alloc_init(PKPaletteReturnKeyButtonContentView);
    contentView = v4->_contentView;
    v4->_contentView = v5;

    -[PKPaletteReturnKeyButtonContentView setTranslatesAutoresizingMaskIntoConstraints:](v4->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteReturnKeyButtonContentView setUserInteractionEnabled:](v4->_contentView, "setUserInteractionEnabled:", 0);
    -[PKPaletteReturnKeyButton addSubview:](v4, "addSubview:", v4->_contentView);
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteReturnKeyButtonContentView centerXAnchor](v4->_contentView, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteReturnKeyButton centerXAnchor](v4, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    -[PKPaletteReturnKeyButtonContentView centerYAnchor](v4->_contentView, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteReturnKeyButton centerYAnchor](v4, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v14);

    -[PKPaletteReturnKeyButton _updateUI](v4, "_updateUI");
    objc_initWeak(&location, v4);
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__PKPaletteReturnKeyButton_initWithFrame___block_invoke;
    v19[3] = &unk_1E7778F90;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v15, "registerObserver:", v19);
    v16 = objc_claimAutoreleasedReturnValue();
    observerToken = v4->_observerToken;
    v4->_observerToken = (PKTextInputLanguageSelectionToken *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__PKPaletteReturnKeyButton_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateUI");

}

- (void)dealloc
{
  objc_super v3;

  -[PKTextInputLanguageSelectionToken invalidate](self->_observerToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteReturnKeyButton;
  -[PKPaletteReturnKeyButton dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteReturnKeyButton;
  -[PKPaletteButton layoutSubviews](&v9, sel_layoutSubviews);
  v3 = -[PKPaletteReturnKeyButton axis](self, "axis");
  -[PKPaletteReturnKeyButton bounds](self, "bounds");
  if (v3)
    v6 = v4;
  else
    v6 = v5;
  v7 = v6 * 0.5;
  -[PKPaletteReturnKeyButton layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PKPaletteReturnKeyButton _contentViewSize](self, "_contentViewSize");
  v4 = v3;
  v6 = v5;
  -[PKPaletteReturnKeyButton scalingFactor](self, "scalingFactor");
  v8 = v6 * v7;
  v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)_contentViewSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = 28.0;
  v4 = 28.0;
  if (!-[PKPaletteReturnKeyButton _useCompactLayout](self, "_useCompactLayout"))
  {
    -[PKPaletteReturnKeyButton contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v4 = v6;
    v3 = v7;

    if (-[PKPaletteReturnKeyButton axis](self, "axis"))
      v3 = v3 + 40.0;
    else
      v4 = v4 + 40.0;
  }
  v8 = v4;
  v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor;

  scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_scalingFactor = a3;
    -[PKPaletteReturnKeyButton _updateUI](self, "_updateUI");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPaletteReturnKeyButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteReturnKeyButton;
    -[PKPaletteButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[PKPaletteReturnKeyButton _updateUI](self, "_updateUI");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPaletteReturnKeyButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteReturnKeyButton;
    -[PKPaletteButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[PKPaletteReturnKeyButton _updateUI](self, "_updateUI");
  }
}

- (void)setReturnKeyType:(int64_t)a3
{
  if (self->_returnKeyType != a3)
  {
    self->_returnKeyType = a3;
    -[PKPaletteReturnKeyButton _updateUI](self, "_updateUI");
  }
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    -[PKPaletteReturnKeyButton _updateUI](self, "_updateUI");
  }
}

- (void)_updateUI
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  -[PKPaletteReturnKeyButton _updateLabelText](self, "_updateLabelText");
  -[PKPaletteReturnKeyButton _updateImageView](self, "_updateImageView");
  -[PKPaletteReturnKeyButton _updateContentViewOrientation](self, "_updateContentViewOrientation");
  v3 = -[PKPaletteReturnKeyButton _useCompactLayout](self, "_useCompactLayout");
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseCompactLayout:", v3);

  -[PKPaletteReturnKeyButton _backgroundColor](self, "_backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteReturnKeyButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[PKPaletteReturnKeyButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)_useCompactLayout
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaletteReturnKeyButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteReturnKeyButton window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKPaletteReturnKeyButton _returnKeyImage](self, "_returnKeyImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v3);

  -[PKPaletteReturnKeyButton _returnKeyTintColor](self, "_returnKeyTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

}

- (id)_backgroundColor
{
  if (-[PKPaletteReturnKeyButton _useCompactLayout](self, "_useCompactLayout"))
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    -[PKPaletteReturnKeyButton _regularLayoutBackgroundColor](self, "_regularLayoutBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_regularLayoutBackgroundColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_paletteButtonBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaletteReturnKeyButton isEnabled](self, "isEnabled"))
  {
    if (-[PKPaletteReturnKeyButton _shouldUseBlueReturnKeyColor](self, "_shouldUseBlueReturnKeyColor"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    if (-[PKPaletteReturnKeyButton isHighlighted](self, "isHighlighted"))
    {
      objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
  }
  return v3;
}

- (id)_returnKeyTintColor
{
  if (-[PKPaletteReturnKeyButton _useCompactLayout](self, "_useCompactLayout"))
    -[PKPaletteReturnKeyButton _regularLayoutBackgroundColor](self, "_regularLayoutBackgroundColor");
  else
    -[PKPaletteReturnKeyButton _textColor](self, "_textColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateContentViewOrientation
{
  _BOOL8 v3;
  void *v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  v3 = -[PKPaletteReturnKeyButton axis](self, "axis") == 1;
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutOrientation:", v3);

  -[PKPaletteReturnKeyButton scalingFactor](self, "scalingFactor");
  v6 = v5;
  -[PKPaletteReturnKeyButton scalingFactor](self, "scalingFactor");
  CGAffineTransformMakeScale(&v10, v6, v7);
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  objc_msgSend(v8, "setTransform:", &v9);

}

- (void)_updateLabelText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKPaletteReturnKeyButton _returnKeyLabelText](self, "_returnKeyLabelText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[PKPaletteReturnKeyButton _textColor](self, "_textColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaletteReturnKeyButton contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

}

- (id)_returnKeyLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLanguageIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PKPaletteReturnKeyButton returnKeyType](self, "returnKeyType");
  UIKeyboardLocalizedReturnKeyNameForLocale();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capitalizedStringWithLocale:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_textColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaletteReturnKeyButton _shouldUseBlueReturnKeyColor](self, "_shouldUseBlueReturnKeyColor"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if ((-[PKPaletteReturnKeyButton isEnabled](self, "isEnabled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)_shouldUseBlueReturnKeyColor
{
  int64_t v3;

  v3 = -[PKPaletteReturnKeyButton returnKeyType](self, "returnKeyType");
  if (v3)
    LOBYTE(v3) = -[PKPaletteReturnKeyButton returnKeyType](self, "returnKeyType") != 4
              && -[PKPaletteReturnKeyButton returnKeyType](self, "returnKeyType") != 11;
  return v3;
}

- (id)_returnKeyImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC3870];
  -[PKPaletteReturnKeyButton _returnKeyImageSymbolConfiguration](self, "_returnKeyImageSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:withConfiguration:", CFSTR("arrow.forward.circle"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_returnKeyImageSymbolConfiguration
{
  if (-[PKPaletteReturnKeyButton _useCompactLayout](self, "_useCompactLayout"))
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2, 17.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 14.0);
  return (id)objc_claimAutoreleasedReturnValue();
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
  v10.super_class = (Class)PKPaletteReturnKeyButton;
  -[PKPaletteButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKPaletteReturnKeyButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "verticalSizeClass");
  if (v6 == objc_msgSend(v4, "verticalSizeClass"))
  {
    -[PKPaletteReturnKeyButton traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "horizontalSizeClass");
    v9 = objc_msgSend(v4, "horizontalSizeClass");

    if (v8 == v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaletteReturnKeyButton _updateUI](self, "_updateUI");
LABEL_6:

}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (int64_t)axis
{
  return self->_axis;
}

- (PKPaletteReturnKeyButtonContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (PKTextInputLanguageSelectionToken)observerToken
{
  return self->_observerToken;
}

- (void)setObserverToken:(id)a3
{
  objc_storeStrong((id *)&self->_observerToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
