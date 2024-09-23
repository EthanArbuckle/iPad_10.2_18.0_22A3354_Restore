@implementation _FCUIFocusSelectionHeaderFooterView

- (_FCUIFocusSelectionHeaderFooterView)initWithText:(id)a3
{
  id v4;
  _FCUIFocusSelectionHeaderFooterView *v5;
  _FCUIFocusSelectionHeaderFooterView *v6;
  void *v7;
  UILabel *label;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_FCUIFocusSelectionHeaderFooterView;
  v5 = -[_FCUIFocusSelectionHeaderFooterView init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_FCUIFocusSelectionHeaderFooterView setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    -[_FCUIFocusSelectionHeaderFooterView _configureLabelIfNecessary](v6, "_configureLabelIfNecessary");
    -[_FCUIFocusSelectionHeaderFooterView _attributedTextForText:](v6, "_attributedTextForText:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    label = v6->_label;
    if (v7)
      -[UILabel setAttributedText:](label, "setAttributedText:", v7);
    else
      -[UILabel setText:](label, "setText:", v4);

  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  v6 = *MEMORY[0x24BDBF148];
  BSRectWithSize();
  -[_FCUIFocusSelectionHeaderFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", &v6);
  v5 = *((double *)&v6 + 1);
  v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_FCUIFocusSelectionHeaderFooterView;
  -[_FCUIFocusSelectionHeaderFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[_FCUIFocusSelectionHeaderFooterView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[_FCUIFocusSelectionHeaderFooterView bounds](self, "bounds");
  -[_FCUIFocusSelectionHeaderFooterView _layoutSubviewsInBounds:measuringOnly:](self, "_layoutSubviewsInBounds:measuringOnly:", 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[_FCUIFocusSelectionHeaderFooterView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[_FCUIFocusSelectionHeaderFooterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);

  if (v5)
    -[_FCUIFocusSelectionHeaderFooterView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  return v5 != NSOrderedSame;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  else
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEBB590];
  v14 = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_attributedTextForText:(id)a3
{
  return 0;
}

- (void)_layoutSubviewsInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  -[_FCUIFocusSelectionHeaderFooterView _layoutLabel:inBounds:measuringOnly:](self, "_layoutLabel:inBounds:measuringOnly:", self->_label, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_labelFont
{
  return (id)objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE220], 0, *MEMORY[0x24BEBB608]);
}

- (void)_updateTextAttributesForLabel:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[_FCUIFocusSelectionHeaderFooterView _labelFont](self, "_labelFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    -[_FCUIFocusSelectionHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  NSString *preferredContentSizeCategory;

  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  -[_FCUIFocusSelectionHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;

  -[_FCUIFocusSelectionHeaderFooterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  -[_FCUIFocusSelectionHeaderFooterView _updateTextAttributesForLabel:](self, "_updateTextAttributesForLabel:", self->_label);
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[_FCUIFocusSelectionHeaderFooterView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[_FCUIFocusSelectionHeaderFooterView _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_configureLabel:(id)a3
{
  UILabel *label;
  id v5;

  if (a3)
  {
    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    label = self->_label;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](label, "setTextColor:", v5);

  }
}

- (void)_configureLabelIfNecessary
{
  UILabel *v3;
  UILabel *label;

  if (!self->_label)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = self->_label;
    self->_label = v3;

    -[_FCUIFocusSelectionHeaderFooterView _configureLabel:](self, "_configureLabel:", self->_label);
    -[_FCUIFocusSelectionHeaderFooterView addSubview:](self, "addSubview:", self->_label);
    -[_FCUIFocusSelectionHeaderFooterView _updateTextAttributesForLabel:](self, "_updateTextAttributesForLabel:", self->_label);
  }
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
