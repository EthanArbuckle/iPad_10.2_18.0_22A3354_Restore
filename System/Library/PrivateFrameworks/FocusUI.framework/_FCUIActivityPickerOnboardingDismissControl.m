@implementation _FCUIActivityPickerOnboardingDismissControl

- (_FCUIActivityPickerOnboardingDismissControl)initWithAction:(id)a3
{
  id v4;
  _FCUIActivityPickerOnboardingDismissControl *v5;
  _FCUIActivityPickerOnboardingDismissControl *v6;
  id v7;
  void *v8;
  uint64_t v9;
  UIImageView *imageView;
  UIImageView *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_FCUIActivityPickerOnboardingDismissControl;
  v5 = -[_FCUIActivityPickerOnboardingDismissControl init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_FCUIActivityPickerOnboardingDismissControl addAction:forControlEvents:](v5, "addAction:forControlEvents:", v4, 64);
    v7 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("xmark"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithImage:", v8);
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v9;

    -[UIImageView setContentMode:](v6->_imageView, "setContentMode:", 4);
    v11 = v6->_imageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v11, "setTintColor:", v12);

    -[_FCUIActivityPickerOnboardingDismissControl addSubview:](v6, "addSubview:", v6->_imageView);
  }

  return v6;
}

- (void)layoutSubviews
{
  UIImageView *imageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_FCUIActivityPickerOnboardingDismissControl;
  -[_FCUIActivityPickerOnboardingDismissControl layoutSubviews](&v4, sel_layoutSubviews);
  -[_FCUIActivityPickerOnboardingDismissControl _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  imageView = self->_imageView;
  -[_FCUIActivityPickerOnboardingDismissControl bounds](self, "bounds");
  -[_FCUIActivityPickerOnboardingDismissControl _imageViewFrameWithBounds:](self, "_imageViewFrameWithBounds:");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (UIEdgeInsets)contentInsetsWithBounds:(CGRect)a3
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MaxY;
  double v12;
  double MaxX;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat rect;
  CGFloat MinX;
  CGFloat MinY;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  UIEdgeInsets result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  height = a3.size.height;
  rect = a3.size.height;
  -[_FCUIActivityPickerOnboardingDismissControl _imageViewFrameWithBounds:](self, "_imageViewFrameWithBounds:");
  v7 = v21.origin.x;
  v8 = v21.origin.y;
  v9 = v21.size.width;
  v10 = v21.size.height;
  MinY = CGRectGetMinY(v21);
  v22.origin.x = v7;
  v22.origin.y = v8;
  v22.size.width = v9;
  v22.size.height = v10;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxY = CGRectGetMaxY(v23);
  v24.origin.x = v7;
  v24.origin.y = v8;
  v24.size.width = v9;
  v24.size.height = v10;
  v12 = MaxY - CGRectGetMaxY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = rect;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = v7;
  v26.origin.y = v8;
  v26.size.width = v9;
  v26.size.height = v10;
  v14 = MaxX - CGRectGetMaxX(v26);
  v16 = MinX;
  v15 = MinY;
  v17 = v12;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[_FCUIActivityPickerOnboardingDismissControl _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary", a3.width, a3.height);
  -[UIImageView image](self->_imageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = fmax(v6, 44.0);
  v10 = fmax(v8, 44.0);
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _FCUIActivityPickerOnboardingDismissControl *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (_FCUIActivityPickerOnboardingDismissControl *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[_FCUIActivityPickerOnboardingDismissControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[_FCUIActivityPickerOnboardingDismissControl traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
    -[_FCUIActivityPickerOnboardingDismissControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");

  return v5 != NSOrderedSame;
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

  -[_FCUIActivityPickerOnboardingDismissControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;
  UIImageView *imageView;
  void *v7;
  double v8;
  id v9;

  -[_FCUIActivityPickerOnboardingDismissControl traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  imageView = self->_imageView;
  v7 = (void *)MEMORY[0x24BEBD660];
  -[_FCUIActivityPickerOnboardingDismissControl _scaledValueForValue:](self, "_scaledValueForValue:", 11.0);
  if (v8 > 20.0)
    v8 = 20.0;
  objc_msgSend(v7, "configurationWithPointSize:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](imageView, "setPreferredSymbolConfiguration:", v9);

}

- (void)_updateTextAttributesIfNecessary
{
  if (-[_FCUIActivityPickerOnboardingDismissControl _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[_FCUIActivityPickerOnboardingDismissControl _updateTextAttributes](self, "_updateTextAttributes");
}

- (CGRect)_imageViewFrameWithBounds:(CGRect)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");

  BSRectWithSize();
  UIRectCenteredIntegralRect();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
