@implementation CCUILabeledRoundButtonViewController

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  return -[CCUILabeledRoundButtonViewController initWithGlyphImage:highlightColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:useLightStyle:", a3, a4, 0);
}

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  return -[CCUILabeledRoundButtonViewController initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", a3, a4, 0, a5);
}

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5
{
  return -[CCUILabeledRoundButtonViewController initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:](self, "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", a3, a4, a5, 0);
}

- (CCUILabeledRoundButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CCUILabeledRoundButtonViewController *v14;
  CCUILabeledRoundButtonViewController *v15;
  uint64_t v16;
  UIColor *highlightColor;
  uint64_t v18;
  UIColor *highlightTintColor;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CCUILabeledRoundButtonViewController;
  v14 = -[CCUILabeledRoundButtonViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_glyphImage, a3);
    v15->_glyphScale = 1.0;
    v16 = objc_msgSend(v12, "copy");
    highlightColor = v15->_highlightColor;
    v15->_highlightColor = (UIColor *)v16;

    v18 = objc_msgSend(v13, "copy");
    highlightTintColor = v15->_highlightTintColor;
    v15->_highlightTintColor = (UIColor *)v18;

    v15->_toggleStateOnTap = 1;
    v15->_useLightStyle = a6;
    v15->_contentSizeCategoryThreshold = (NSString *)*MEMORY[0x1E0DC4900];
  }

  return v15;
}

- (CCUILabeledRoundButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  return -[CCUILabeledRoundButtonViewController initWithGlyphPackageDescription:highlightColor:useLightStyle:](self, "initWithGlyphPackageDescription:highlightColor:useLightStyle:", a3, a4, 0);
}

- (CCUILabeledRoundButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  id v9;
  id v10;
  CCUILabeledRoundButtonViewController *v11;
  CCUILabeledRoundButtonViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCUILabeledRoundButtonViewController;
  v11 = -[CCUILabeledRoundButtonViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_glyphPackageDescription, a3);
    v12->_glyphScale = 1.0;
    objc_storeStrong((id *)&v12->_highlightColor, a4);
    v12->_toggleStateOnTap = 1;
    v12->_useLightStyle = a5;
    v12->_contentSizeCategoryThreshold = (NSString *)*MEMORY[0x1E0DC4900];
  }

  return v12;
}

- (void)buttonTapped:(id)a3
{
  if (self->_toggleStateOnTap)
    -[UIControl setSelected:](self->_button, "setSelected:", -[UIControl isSelected](self->_button, "isSelected", a3) ^ 1);
}

- (void)setHighlightColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_highlightColor, a3);
  v5 = a3;
  -[CCUILabeledRoundButton setHighlightColor:](self->_buttonContainer, "setHighlightColor:", v5);

}

- (void)setGlyphImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphImage, a3);
  v5 = a3;
  -[CCUILabeledRoundButton setGlyphImage:](self->_buttonContainer, "setGlyphImage:", v5);

}

- (void)setGlyphScale:(double)a3
{
  self->_glyphScale = a3;
  -[CCUILabeledRoundButton setGlyphScale:](self->_buttonContainer, "setGlyphScale:");
}

- (void)setGlyphPackageDescription:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
  v5 = a3;
  -[CCUILabeledRoundButton setGlyphPackageDescription:](self->_buttonContainer, "setGlyphPackageDescription:", v5);

}

- (void)setGlyphState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_glyphState, a3);
  v5 = a3;
  -[CCUILabeledRoundButton setGlyphState:](self->_buttonContainer, "setGlyphState:", v5);

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UIControl setSelected:](self->_button, "setSelected:");
}

- (void)setInoperative:(BOOL)a3
{
  self->_inoperative = a3;
  -[UIControl setEnabled:](self->_button, "setEnabled:", !a3);
}

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUILabeledRoundButtonViewController;
  v4 = a3;
  -[CCUILabeledRoundButtonViewController setTitle:](&v5, sel_setTitle_, v4);
  -[CCUILabeledRoundButton setTitle:](self->_buttonContainer, "setTitle:", v4, v5.receiver, v5.super_class);

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  -[CCUILabeledRoundButton setSubtitle:](self->_buttonContainer, "setSubtitle:", v6);
}

- (void)setLabelsVisible:(BOOL)a3
{
  self->_labelsVisible = a3;
  -[CCUILabeledRoundButton setLabelsVisible:](self->_buttonContainer, "setLabelsVisible:");
}

- (void)setUseAlternateBackground:(BOOL)a3
{
  self->_useAlternateBackground = a3;
  -[CCUILabeledRoundButton setUseAlternateBackground:](self->_buttonContainer, "setUseAlternateBackground:");
}

- (UIControl)button
{
  -[CCUILabeledRoundButtonViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_button;
}

- (void)setContentSizeCategoryThreshold:(id)a3
{
  if (self->_contentSizeCategoryThreshold != a3)
  {
    self->_contentSizeCategoryThreshold = (NSString *)a3;
    -[CCUILabeledRoundButton setContentSizeCategoryThreshold:](self->_buttonContainer, "setContentSizeCategoryThreshold:");
  }
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  id v4;

  if (self->_dynamicLayoutEnabled != a3)
  {
    self->_dynamicLayoutEnabled = a3;
    -[CCUILabeledRoundButton setDynamicLayoutEnabled:](self->_buttonContainer, "setDynamicLayoutEnabled:");
    -[CCUILabeledRoundButtonViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)loadView
{
  CCUILabeledRoundButton *v3;
  CCUILabeledRoundButton *buttonContainer;
  CCUILabeledRoundButton *v5;
  void *v6;
  CCUILabeledRoundButton *v7;
  void *v8;
  UIControl *v9;
  UIControl *button;

  if (self->_glyphImage)
  {
    v3 = -[CCUILabeledRoundButton initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:]([CCUILabeledRoundButton alloc], "initWithGlyphImage:highlightColor:highlightTintColor:useLightStyle:", self->_glyphImage, self->_highlightColor, self->_highlightTintColor, self->_useLightStyle);
  }
  else
  {
    if (!self->_glyphPackageDescription)
      goto LABEL_6;
    v3 = -[CCUILabeledRoundButton initWithGlyphPackageDescription:highlightColor:useLightStyle:]([CCUILabeledRoundButton alloc], "initWithGlyphPackageDescription:highlightColor:useLightStyle:", self->_glyphPackageDescription, self->_highlightColor, self->_useLightStyle);
  }
  buttonContainer = self->_buttonContainer;
  self->_buttonContainer = v3;

LABEL_6:
  -[CCUILabeledRoundButton setGlyphScale:](self->_buttonContainer, "setGlyphScale:", self->_glyphScale);
  -[CCUILabeledRoundButton setDynamicLayoutEnabled:](self->_buttonContainer, "setDynamicLayoutEnabled:", self->_dynamicLayoutEnabled);
  -[CCUILabeledRoundButton setLabelsVisible:](self->_buttonContainer, "setLabelsVisible:", self->_labelsVisible);
  v5 = self->_buttonContainer;
  -[CCUILabeledRoundButtonViewController title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUILabeledRoundButton setTitle:](v5, "setTitle:", v6);

  v7 = self->_buttonContainer;
  -[CCUILabeledRoundButtonViewController subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUILabeledRoundButton setSubtitle:](v7, "setSubtitle:", v8);

  -[CCUILabeledRoundButton setContentSizeCategoryThreshold:](self->_buttonContainer, "setContentSizeCategoryThreshold:", self->_contentSizeCategoryThreshold);
  -[CCUILabeledRoundButton buttonView](self->_buttonContainer, "buttonView");
  v9 = (UIControl *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v9;

  -[UIControl addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_buttonTapped_, 64);
  -[CCUILabeledRoundButtonViewController setView:](self, "setView:", self->_buttonContainer);
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (id)requiredVisualStyleCategories
{
  return -[CCUILabeledRoundButton requiredVisualStyleCategories](self->_buttonContainer, "requiredVisualStyleCategories");
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[CCUILabeledRoundButtonViewController requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    -[CCUILabeledRoundButtonViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[CCUILabeledRoundButton setVisualStylingProvider:forCategory:](self->_buttonContainer, "setVisualStylingProvider:forCategory:", v9, a4);
  }

}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)labelsVisible
{
  return self->_labelsVisible;
}

- (BOOL)toggleStateOnTap
{
  return self->_toggleStateOnTap;
}

- (void)setToggleStateOnTap:(BOOL)a3
{
  self->_toggleStateOnTap = a3;
}

- (BOOL)useAlternateBackground
{
  return self->_useAlternateBackground;
}

- (NSString)contentSizeCategoryThreshold
{
  return self->_contentSizeCategoryThreshold;
}

- (BOOL)isDynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isInoperative
{
  return self->_inoperative;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIColor)highlightTintColor
{
  return self->_highlightTintColor;
}

- (void)setHighlightTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightTintColor, a3);
}

- (BOOL)useLightStyle
{
  return self->_useLightStyle;
}

- (void)setUseLightStyle:(BOOL)a3
{
  self->_useLightStyle = a3;
}

- (CCUILabeledRoundButton)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_highlightTintColor, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end
