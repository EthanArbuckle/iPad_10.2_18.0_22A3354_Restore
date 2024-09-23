@implementation FCUIActivityBaubleView

- (FCUIActivityBaubleView)initWithBaubleDescription:(id)a3 shadowAttributes:(id *)a4
{
  id v6;
  FCUIActivityBaubleView *v7;
  FCUIActivityBaubleView *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIImageView *glyphImageView;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCUIActivityBaubleView;
  v7 = -[FCUIActivityBaubleView init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_adjustsFontForContentSizeCategory = 1;
    objc_msgSend(v6, "referencePointSize");
    v8->_referencePointSize = v9;
    objc_msgSend(v6, "maximumPointSize");
    v8->_maximumPointSize = v10;
    objc_msgSend(v6, "referenceDimension");
    v8->_referenceDimension = v11;
    v12 = objc_alloc(MEMORY[0x24BEBD668]);
    v13 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v6, "systemImageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_systemImageNamed:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "initWithImage:", v15);
    glyphImageView = v8->_glyphImageView;
    v8->_glyphImageView = (UIImageView *)v16;

    -[UIImageView setContentMode:](v8->_glyphImageView, "setContentMode:", 4);
    -[FCUIActivityBaubleView addSubview:](v8, "addSubview:", v8->_glyphImageView);
    objc_msgSend(v6, "tintColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityBaubleView setTintColor:](v8, "setTintColor:", v18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityBaubleView setBackgroundColor:](v8, "setBackgroundColor:", v19);

    -[FCUIActivityBaubleView layer](v8, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowPathIsBounds:", 1);
    *(float *)&v21 = a4->var0;
    objc_msgSend(v20, "setShadowOpacity:", v21);
    objc_msgSend(v20, "setShadowOffset:", a4->var1.width, a4->var1.height);
    objc_msgSend(v20, "setShadowRadius:", a4->var2);

  }
  return v8;
}

- (double)scaledValueForValue:(double)a3
{
  double maximumPointSize;

  -[FCUIActivityBaubleView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIActivityBaubleView _scaledValueForValue:](self, "_scaledValueForValue:", self->_referencePointSize);
  if (maximumPointSize > self->_maximumPointSize)
    maximumPointSize = self->_maximumPointSize;
  return maximumPointSize / self->_referencePointSize * a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[FCUIActivityBaubleView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary", a3.width, a3.height);
  -[FCUIActivityBaubleView scaledValueForValue:](self, "scaledValueForValue:", self->_referenceDimension);
  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  UIImageView *glyphImageView;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)FCUIActivityBaubleView;
  -[FCUIActivityBaubleView layoutSubviews](&v5, sel_layoutSubviews);
  -[FCUIActivityBaubleView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIActivityBaubleView bounds](self, "bounds");
  -[FCUIActivityBaubleView _setCornerRadius:](self, "_setCornerRadius:", CGRectGetHeight(v6) * 0.5);
  glyphImageView = self->_glyphImageView;
  -[UIImageView image](glyphImageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  -[UIImageView setFrame:](glyphImageView, "setFrame:", 0);

}

- (id)tintColor
{
  return -[UIImageView tintColor](self->_glyphImageView, "tintColor");
}

- (void)setTintColor:(id)a3
{
  -[UIImageView setTintColor:](self->_glyphImageView, "setTintColor:", a3);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[FCUIActivityBaubleView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[FCUIActivityBaubleView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
    -[FCUIActivityBaubleView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  return v3;
}

- (double)_scaledValueForValue:(double)a3
{
  UIFont *referenceFont;
  void *v6;
  uint64_t v7;
  void *v8;
  UIFont *v9;
  UIFont *v10;
  double result;

  if (!-[FCUIActivityBaubleView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"))
    return a3;
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    v6 = (void *)MEMORY[0x24BEBB520];
    v7 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", self->_preferredContentSizeCategory);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFontForTextStyle:compatibleWithTraitCollection:", v7, v8);
    v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v10 = self->_referenceFont;
    self->_referenceFont = v9;

    referenceFont = self->_referenceFont;
  }
  -[UIFont _scaledValueForValue:](referenceFont, "_scaledValueForValue:", a3);
  return result;
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_referenceFont == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  UIFont *referenceFont;

  referenceFont = self->_referenceFont;
  self->_referenceFont = 0;

  -[FCUIActivityBaubleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;
  UIImageView *glyphImageView;
  void *v7;
  double maximumPointSize;
  id v9;

  -[FCUIActivityBaubleView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  glyphImageView = self->_glyphImageView;
  v7 = (void *)MEMORY[0x24BEBD660];
  -[FCUIActivityBaubleView _scaledValueForValue:](self, "_scaledValueForValue:", self->_referencePointSize);
  if (maximumPointSize > self->_maximumPointSize)
    maximumPointSize = self->_maximumPointSize;
  objc_msgSend(v7, "configurationWithPointSize:", maximumPointSize);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](glyphImageView, "setPreferredSymbolConfiguration:", v9);

}

- (void)_updateTextAttributesIfNecessary
{
  if (-[FCUIActivityBaubleView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[FCUIActivityBaubleView _updateTextAttributes](self, "_updateTextAttributes");
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (double)referencePointSize
{
  return self->_referencePointSize;
}

- (double)maximumPointSize
{
  return self->_maximumPointSize;
}

- (double)referenceDimension
{
  return self->_referenceDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end
