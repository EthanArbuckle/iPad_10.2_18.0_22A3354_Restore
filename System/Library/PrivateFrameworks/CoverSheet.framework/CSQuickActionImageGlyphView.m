@implementation CSQuickActionImageGlyphView

- (CSQuickActionImageGlyphView)initWithSystemImageName:(id)a3 selectedSystemImageName:(id)a4 symbolScaleValue:(double)a5 buttonDiameter:(double)a6
{
  return -[CSQuickActionImageGlyphView initWithSystemImageName:selectedSystemImageName:symbolScaleValue:buttonDiameter:symbolOnColor:](self, "initWithSystemImageName:selectedSystemImageName:symbolScaleValue:buttonDiameter:symbolOnColor:", a3, a4, 0, a5, a6);
}

- (CSQuickActionImageGlyphView)initWithSystemImageName:(id)a3 selectedSystemImageName:(id)a4 symbolScaleValue:(double)a5 buttonDiameter:(double)a6 symbolOnColor:(id)a7
{
  id v13;
  id v14;
  id v15;
  CSQuickActionImageGlyphView *v16;
  CSQuickActionImageGlyphView *v17;
  uint64_t v18;
  UIImage *image;
  uint64_t v20;
  UIImage *selectedImage;
  SBMiscellaneousDefaults *v22;
  SBMiscellaneousDefaults *miscellaneousSettings;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CSQuickActionImageGlyphView;
  v16 = -[CSQuickActionImageGlyphView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v17 = v16;
  if (v16)
  {
    -[CSQuickActionImageGlyphView setOpaque:](v16, "setOpaque:", 0);
    -[CSQuickActionImageGlyphView setContentMode:](v17, "setContentMode:", 1);
    objc_storeStrong((id *)&v17->_imageName, a3);
    objc_storeStrong((id *)&v17->_selectedImageName, a4);
    -[CSQuickActionImageGlyphView _systemImageWithName:](v17, "_systemImageWithName:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
    image = v17->_image;
    v17->_image = (UIImage *)v18;

    -[CSQuickActionImageGlyphView _systemImageWithName:](v17, "_systemImageWithName:", v14);
    v20 = objc_claimAutoreleasedReturnValue();
    selectedImage = v17->_selectedImage;
    v17->_selectedImage = (UIImage *)v20;

    -[CSQuickActionImageGlyphView _updateImageAppearance](v17, "_updateImageAppearance");
    v17->_symbolScaleValue = a5;
    v17->_buttonDiameter = a6;
    objc_storeStrong((id *)&v17->_onColor, a7);
    v22 = (SBMiscellaneousDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FB0]);
    miscellaneousSettings = v17->_miscellaneousSettings;
    v17->_miscellaneousSettings = v22;

  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[BSDefaultObserver invalidate](self->_defaultsObserverToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CSQuickActionImageGlyphView;
  -[CSQuickActionImageGlyphView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSQuickActionImageGlyphView;
  -[CSQuickActionImageGlyphView layoutSubviews](&v4, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 6, 3, self->_buttonDiameter * self->_symbolScaleValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionImageGlyphView setPreferredSymbolConfiguration:](self, "setPreferredSymbolConfiguration:", v3);

}

- (void)_updateTint
{
  UIColor *onColor;
  UIColor *v4;
  UIColor *v5;
  void *v6;
  int64_t appearance;
  double v8;
  uint64_t v9;
  UIColor *v10;

  onColor = self->_onColor;
  if (onColor)
  {
    v4 = onColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "darkTextColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v4;
  if (-[CSQuickActionImageGlyphView isSelected](self, "isSelected"))
  {
    v5 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (!self->_selected)
  {
    appearance = self->_appearance;
    if (appearance == 2)
    {
      v8 = 0.25;
      goto LABEL_12;
    }
    if (appearance == 1)
    {
      v8 = 0.5;
LABEL_12:
      -[UIColor colorWithAlphaComponent:](v5, "colorWithAlphaComponent:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
  }
  -[CSQuickActionImageGlyphView setTintColor:](self, "setTintColor:", v6);

}

- (void)setSelected:(BOOL)a3
{
  void *v5;

  if (self->_selected != a3
    || (-[CSQuickActionImageGlyphView image](self, "image"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_selected = a3;
    -[CSQuickActionImageGlyphView _updateImageAppearance](self, "_updateImageAppearance");
  }
}

- (void)setAppearance:(int64_t)a3
{
  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    -[CSQuickActionImageGlyphView _updateImageAppearance](self, "_updateImageAppearance");
  }
}

- (void)_updateImageAppearance
{
  UIImage *image;

  if (!self->_selected || (image = self->_selectedImage) == 0)
    image = self->_image;
  -[CSQuickActionImageGlyphView setImage:](self, "setImage:", image);
  -[CSQuickActionImageGlyphView _updateTint](self, "_updateTint");
}

- (id)_systemImageWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CSQuickActionImageGlyphView preferredSymbolConfiguration](self, "preferredSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionImageGlyphView _systemImageWithName:configuration:](self, "_systemImageWithName:configuration:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_systemImageWithName:(id)a3 configuration:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_imageThatSuppressesAccessibilityHairlineThickening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsObserverToken, 0);
  objc_storeStrong((id *)&self->_miscellaneousSettings, 0);
  objc_storeStrong((id *)&self->_onColor, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_selectedImageName, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
