@implementation _FCUIActivityControlMenuFooterView

- (void)setFooterAction:(id)a3
{
  UIAction **p_footerAction;
  UILabel *footerLabel;
  void *v7;
  id v8;

  p_footerAction = &self->_footerAction;
  v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_footerAction, a3);
    -[_FCUIActivityControlMenuFooterView _configureFooterLabelIfNecessary](self, "_configureFooterLabelIfNecessary");
    footerLabel = self->_footerLabel;
    -[UIAction title](*p_footerAction, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](footerLabel, "setText:", v7);

  }
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

  -[_FCUIActivityControlMenuFooterView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[UILabel font](self->_footerLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  UISizeRoundToScale();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;

  -[_FCUIActivityControlMenuFooterView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[_FCUIActivityControlMenuFooterView bounds](self, "bounds");
  CGRectGetWidth(v12);
  -[UILabel font](self->_footerLabel, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel setFrame:](self->_footerLabel, "setFrame:", v5, v7, v9, v11);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[_FCUIActivityControlMenuFooterView setHighlighted:](self, "setHighlighted:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[_FCUIActivityControlMenuFooterView setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[_FCUIActivityControlMenuFooterView setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (double)_continuousCornerRadius
{
  double result;

  -[UIView _continuousCornerRadius](self->_highlightView, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[_FCUIActivityControlMenuFooterView _configureHightlightViewIfNecessary](self, "_configureHightlightViewIfNecessary");
  -[UIView frame](self->_highlightView, "frame");
  v6 = v5;
  v8 = v7;
  -[_FCUIActivityControlMenuFooterView bounds](self, "bounds");
  -[UIView setFrame:](self->_highlightView, "setFrame:", v6, v9 - a3 * 3.0, v8, a3 * 3.0);
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", a3);
  -[UIView layer](self->_highlightView, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaskedCorners:", 12);

}

- (BOOL)isMenuElement
{
  return 1;
}

- (NSString)representedObjectIdentifier
{
  return (NSString *)CFSTR("footer");
}

- (BOOL)isHighlighted
{
  double v2;

  -[UIView alpha](self->_highlightView, "alpha");
  return v2 == 1.0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  if (self->_footerAction)
  {
    v3 = a3;
    if (-[_FCUIActivityControlMenuFooterView isHighlighted](self, "isHighlighted") != a3)
    {
      -[_FCUIActivityControlMenuFooterView _configureHightlightViewIfNecessary](self, "_configureHightlightViewIfNecessary");
      v5 = 0.0;
      if (v3)
        v5 = 1.0;
      -[UIView setAlpha:](self->_highlightView, "setAlpha:", v5);
    }
  }
}

- (void)performAction
{
  -[UIAction performWithSender:target:](self->_footerAction, "performWithSender:target:", self, 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[_FCUIActivityControlMenuFooterView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[_FCUIActivityControlMenuFooterView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
    -[_FCUIActivityControlMenuFooterView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24D218F38;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  NSMutableDictionary *categoriesToVisualStylingProviders;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[_FCUIActivityControlMenuFooterView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](categoriesToVisualStylingProviders, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_categoriesToVisualStylingProviders;
    if (!v12)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v14 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v13;

      v12 = self->_categoriesToVisualStylingProviders;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v18, v15);

    v16 = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v18, v17);
    else
      -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

    -[_FCUIActivityControlMenuFooterView _visualStylingProvider:didChangeForCategory:outgoingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingProvider:", v18, a4, v11);
  }

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

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6 observerBlock:(id)a7
{
  id v11;
  id v12;
  id v13;

  if (a3)
  {
    v11 = a7;
    v12 = a5;
    v13 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v13);
    objc_msgSend(v12, "automaticallyUpdateView:withStyle:andObserverBlock:", v13, a4, v11);

  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v8;
  UILabel *highlightView;
  _FCUIActivityControlMenuFooterView *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  if (a4 == 2)
  {
    highlightView = (UILabel *)self->_highlightView;
    v14 = &__block_literal_global_0;
    v10 = self;
    v11 = 1;
    v12 = v15;
    v13 = v8;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    highlightView = self->_footerLabel;
    v10 = self;
    v11 = 0;
    v12 = v15;
    v13 = v8;
    v14 = 0;
LABEL_5:
    -[_FCUIActivityControlMenuFooterView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:](v10, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:", highlightView, v11, v12, v13, v14);
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

  -[_FCUIActivityControlMenuFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;

  -[_FCUIActivityControlMenuFooterView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  -[_FCUIActivityControlMenuFooterView _updateTextAttributesForFooterLabel](self, "_updateTextAttributesForFooterLabel");
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[_FCUIActivityControlMenuFooterView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[_FCUIActivityControlMenuFooterView _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_updateTextAttributesForFooterLabel
{
  UILabel *footerLabel;
  id v3;

  footerLabel = self->_footerLabel;
  if (footerLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE220], 0, *MEMORY[0x24BEBB608]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](footerLabel, "setFont:", v3);

  }
}

- (void)_configureFooterLabelIfNecessary
{
  UILabel *v3;
  UILabel *footerLabel;
  UILabel *v5;
  void *v6;

  if (!self->_footerLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v3;

    -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_footerLabel, "setLineBreakMode:", 4);
    -[_FCUIActivityControlMenuFooterView addSubview:](self, "addSubview:", self->_footerLabel);
    -[_FCUIActivityControlMenuFooterView _updateTextAttributesForFooterLabel](self, "_updateTextAttributesForFooterLabel");
    v5 = self->_footerLabel;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218FB0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FCUIActivityControlMenuFooterView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:", v5, 0, v6, 0, 0);

    -[_FCUIActivityControlMenuFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_configureHightlightViewIfNecessary
{
  UIView *v3;
  UIView *highlightView;
  UIView *v5;
  void *v6;
  UIView *v7;
  id v8;

  if (!self->_highlightView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    highlightView = self->_highlightView;
    self->_highlightView = v3;

    -[UIView setUserInteractionEnabled:](self->_highlightView, "setUserInteractionEnabled:", 0);
    v5 = self->_highlightView;
    -[_FCUIActivityControlMenuFooterView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setAutoresizingMask:](self->_highlightView, "setAutoresizingMask:", 18);
    -[UIView setAlpha:](self->_highlightView, "setAlpha:", 0.0);
    -[_FCUIActivityControlMenuFooterView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_highlightView, 0);
    -[_FCUIActivityControlMenuFooterView setClipsToBounds:](self, "setClipsToBounds:", 0);
    -[_FCUIActivityControlMenuFooterView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 1);

    v7 = self->_highlightView;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218FC8);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_FCUIActivityControlMenuFooterView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:", v7, 1, v8, 0, &__block_literal_global_157);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (UIAction)footerAction
{
  return self->_footerAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerAction, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end
