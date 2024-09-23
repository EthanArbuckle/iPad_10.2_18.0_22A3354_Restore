@implementation FCUIActivityControlMenuItemView

- (void)setDefaultAction:(id)a3
{
  UIAction *v4;
  UIAction *defaultAction;
  void *v6;
  void *v7;
  void *v8;
  UILabel *alternativeDescriptionLabel;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "fcui_isEqualToAction:", self->_defaultAction) & 1) == 0)
  {
    v4 = (UIAction *)objc_msgSend(v10, "copy");
    defaultAction = self->_defaultAction;
    self->_defaultAction = v4;

    -[UIAction title](self->_defaultAction, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _setActivationDescription:](self, "_setActivationDescription:", v6);

    -[UIAction discoverabilityTitle](self->_defaultAction, "discoverabilityTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _setActivationDetails:](self, "_setActivationDetails:", v7);

    -[UIAction image](self->_defaultAction, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _setAccessoryImage:](self, "_setAccessoryImage:", v8);

    -[UILabel removeFromSuperview](self->_alternativeDescriptionLabel, "removeFromSuperview");
    alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
    self->_alternativeDescriptionLabel = 0;

  }
}

- (NSString)alternativeDescription
{
  return -[UILabel text](self->_alternativeDescriptionLabel, "text");
}

- (void)setAlternativeDescription:(id)a3
{
  void *v4;
  char v5;
  UILabel *activationDescriptionLabel;
  UILabel *activationDetailsLabel;
  id v8;

  v8 = a3;
  -[FCUIActivityControlMenuItemView alternativeDescription](self, "alternativeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityControlMenuItemView _configureAlternativeDescriptionLabelIfNecessary](self, "_configureAlternativeDescriptionLabelIfNecessary");
    -[FCUIActivityControlMenuItemView _addViewRequiringUpdate:](self, "_addViewRequiringUpdate:", self->_alternativeDescriptionLabel);
    -[UILabel setText:](self->_alternativeDescriptionLabel, "setText:", v8);
    -[UILabel removeFromSuperview](self->_activationDescriptionLabel, "removeFromSuperview");
    activationDescriptionLabel = self->_activationDescriptionLabel;
    self->_activationDescriptionLabel = 0;

    -[UILabel removeFromSuperview](self->_activationDetailsLabel, "removeFromSuperview");
    activationDetailsLabel = self->_activationDetailsLabel;
    self->_activationDetailsLabel = 0;

    -[FCUIActivityControlMenuItemView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    if (a3)
      -[FCUIActivityControlMenuItemView _configureSeparatorViewIfNecessary](self, "_configureSeparatorViewIfNecessary");
    else
      -[FCUIActivityControlMenuItemView _tearDownSeparatorViewIfNecessary](self, "_tearDownSeparatorViewIfNecessary");
  }
}

- (FCUIActivityControlMenuItemView)initWithFrame:(CGRect)a3
{
  FCUIActivityControlMenuItemView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCUIActivityControlMenuItemView;
  v3 = -[FCUIActivityControlMenuItemView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v3);
      -[FCUIActivityControlMenuItemView addInteraction:](v3, "addInteraction:", v6);

    }
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  _BOOL4 IsAccessibilityCategory;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGSize result;
  CGRect v44;
  CGRect v45;

  if (a3.width <= 0.0)
  {
    v33 = *MEMORY[0x24BDBF148];
    v35 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    -[FCUIActivityControlMenuItemView _activationDescription](self, "_activationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    -[FCUIActivityControlMenuItemView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
    BSRectWithSize();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    if (v5)
    {
      -[UILabel font](self->_activationDescriptionLabel, "font");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel text](self->_activationDescriptionLabel, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "fcui_hasExuberatedLineHeightForText:", v15);

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BEBB520], "fcui_exuberatedValueForValue:", 12.0);
        objc_msgSend(MEMORY[0x24BEBB520], "fcui_exuberatedValueForValue:", 12.0);
      }
      -[FCUIActivityControlMenuItemView _accessoryImageFrameForBounds:](self, "_accessoryImageFrameForBounds:", v7, v9, v11, v13);
      -[FCUIActivityControlMenuItemView _textFrameForBounds:accessoryImageFrame:](self, "_textFrameForBounds:accessoryImageFrame:", v7, v9, v11, v13, v17, v18, v19, v20);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v27 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_activationDescriptionLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext);
      v28 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_activationDetailsLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, v22, v24, v26, 1.79769313e308);
      -[UILabel fcui_measuringHeightWithNumberOfLines:](self->_activationDescriptionLabel, "fcui_measuringHeightWithNumberOfLines:", v27);
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
      v30 = v28 - 1;
      if (!v28)
        v30 = 0;
      if (IsAccessibilityCategory)
        v31 = v28;
      else
        v31 = v30;
      -[UILabel fcui_measuringHeightWithNumberOfLines:](self->_activationDetailsLabel, "fcui_measuringHeightWithNumberOfLines:", v31);
      UISizeRoundToScale();
      v33 = v32;
      v35 = v34;

    }
    else
    {
      -[UILabel font](self->_alternativeDescriptionLabel, "font");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel text](self->_alternativeDescriptionLabel, "text");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "fcui_hasExuberatedLineHeightForText:", v37);

      if (v38)
        objc_msgSend(MEMORY[0x24BEBB520], "fcui_exuberatedValueForValue:", 22.0);
      v44.origin.x = v7;
      v44.origin.y = v9;
      v44.size.width = v11;
      v44.size.height = v13;
      v45 = CGRectInset(v44, 24.0, 0.0);
      -[UILabel fcui_measuringHeightWithNumberOfLines:](self->_alternativeDescriptionLabel, "fcui_measuringHeightWithNumberOfLines:", -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_alternativeDescriptionLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, v45.origin.x, v45.origin.y, v45.size.width, 1.79769313e308));
      UISizeRoundToScale();
      v33 = v39;
      v35 = v40;
    }
  }
  v41 = v33;
  v42 = v35;
  result.height = v42;
  result.width = v41;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void (**v19)(void *, UILabel *, double, double, double, double);
  void *v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  __int128 v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  uint64_t v32;
  double v33;
  double v34;
  _QWORD v35[9];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD aBlock[5];
  _QWORD v41[9];
  objc_super v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v42.receiver = self;
  v42.super_class = (Class)FCUIActivityControlMenuItemView;
  -[FCUIActivityControlMenuItemView layoutSubviews](&v42, sel_layoutSubviews);
  -[FCUIActivityControlMenuItemView _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[FCUIActivityControlMenuItemView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIActivityControlMenuItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v34 = v7;
  v9 = v8;
  -[FCUIActivityControlMenuItemView _accessoryImageFrameForBounds:](self, "_accessoryImageFrameForBounds:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke;
  v41[3] = &unk_24D20AC88;
  v41[4] = self;
  *(double *)&v41[5] = v10;
  *(double *)&v41[6] = v12;
  *(double *)&v41[7] = v14;
  *(double *)&v41[8] = v16;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v41);
  aBlock[0] = v18;
  aBlock[1] = 3221225472;
  aBlock[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_2;
  aBlock[3] = &unk_24D20AF28;
  aBlock[4] = self;
  v19 = (void (**)(void *, UILabel *, double, double, double, double))_Block_copy(aBlock);
  -[FCUIActivityControlMenuItemView _activationDescription](self, "_activationDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    v33 = v4;
    v22 = v4;
    v23 = v6;
    v24 = v6;
    v25 = v34;
    v26 = v9;
    -[FCUIActivityControlMenuItemView _textFrameForBounds:accessoryImageFrame:](self, "_textFrameForBounds:accessoryImageFrame:", v22, v24, v34, v9, v11, v13, v15, v17);
    v27 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v38 = *MEMORY[0x24BDBF090];
    v39 = v27;
    v36 = v38;
    v37 = v27;
    objc_msgSend(MEMORY[0x24BEBD708], "fcui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:", self->_activationDescriptionLabel, self->_activationDetailsLabel, &v38, &v36, self->_drawingContext);
    v19[2](v19, self->_activationDescriptionLabel, *(double *)&v38, *((double *)&v38 + 1), *(double *)&v39, *((double *)&v39 + 1));
    v19[2](v19, self->_activationDetailsLabel, *(double *)&v36, *((double *)&v36 + 1), *(double *)&v37, *((double *)&v37 + 1));
    v28 = v33;
  }
  else
  {
    v43.origin.x = v4;
    v43.origin.y = v6;
    v43.size.width = v34;
    v26 = v9;
    v43.size.height = v9;
    CGRectInset(v43, 24.0, 0.0);
    -[UILabel fcui_drawingHeightWithNumberOfLines:](self->_alternativeDescriptionLabel, "fcui_drawingHeightWithNumberOfLines:", -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_alternativeDescriptionLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext));
    v32 = 0;
    UIRectCenteredIntegralRectScale();
    ((void (*)(void (**)(void *, UILabel *, double, double, double, double), UILabel *))v19[2])(v19, self->_alternativeDescriptionLabel);
    v28 = v4;
    v23 = v6;
    v25 = v34;
  }
  -[FCUIActivityControlMenuItemView _didPerformUpdate](self, "_didPerformUpdate", v32);
  if (self->_separatorView)
  {
    -[FCUIActivityControlMenuItemView _separatorHeight](self, "_separatorHeight");
    v30 = v29;
    v44.origin.x = v28;
    v44.origin.y = v23;
    v44.size.width = v25;
    v44.size.height = v26;
    v31 = CGRectGetMaxY(v44) - v30;
    v45.origin.x = v28;
    v45.origin.y = v23;
    v45.size.width = v25;
    v45.size.height = v26;
    v35[0] = v18;
    v35[1] = 3221225472;
    v35[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_4;
    v35[3] = &unk_24D20AC88;
    v35[4] = self;
    v35[5] = 0;
    *(CGFloat *)&v35[6] = v31;
    v35[7] = CGRectGetWidth(v45);
    *(double *)&v35[8] = v30;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v35);
  }

}

uint64_t __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v13 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "containsObject:"))
  {
    v11 = (void *)MEMORY[0x24BEBDB00];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_3;
    v14[3] = &unk_24D20AC88;
    v12 = v13;
    v15 = v12;
    v16 = a3;
    v17 = a4;
    v18 = a5;
    v19 = a6;
    objc_msgSend(v11, "performWithoutAnimation:", v14);
    objc_msgSend(v12, "setAlpha:", 1.0);

  }
  else
  {
    objc_msgSend(v13, "setFrame:", a3, a4, a5, a6);
  }

}

uint64_t __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __49__FCUIActivityControlMenuItemView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[FCUIActivityControlMenuItemView setHighlighted:](self, "setHighlighted:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[FCUIActivityControlMenuItemView setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[FCUIActivityControlMenuItemView setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (BOOL)isMenuElement
{
  return 1;
}

- (NSString)representedObjectIdentifier
{
  return -[UIAction identifier](self->_defaultAction, "identifier");
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

  if (self->_defaultAction)
  {
    v3 = a3;
    if (-[FCUIActivityControlMenuItemView isHighlighted](self, "isHighlighted") != a3)
    {
      -[FCUIActivityControlMenuItemView _configureHighlightViewIfNecessary](self, "_configureHighlightViewIfNecessary");
      v5 = 0.0;
      if (v3)
        v5 = 1.0;
      -[UIView setAlpha:](self->_highlightView, "setAlpha:", v5);
    }
  }
}

- (void)performAction
{
  -[UIAction performWithSender:target:](self->_defaultAction, "performWithSender:target:", self, 0);
}

- (BOOL)isSelected
{
  return -[UIAction state](self->_defaultAction, "state") == UIMenuElementStateOn;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_defaultAction)
  {
    v3 = a3;
    if (-[FCUIActivityControlMenuItemView isSelected](self, "isSelected") != a3)
    {
      -[UIAction setState:](self->_defaultAction, "setState:", v3);
      if (-[FCUIActivityControlMenuItemView isSelected](self, "isSelected"))
        -[FCUIActivityControlMenuItemView _configureCheckmarkImageViewIfNecessary](self, "_configureCheckmarkImageViewIfNecessary");
      else
        -[FCUIActivityControlMenuItemView _tearDownCheckmarkImageViewIfNecessary](self, "_tearDownCheckmarkImageViewIfNecessary");
    }
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24D218F20;
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
  id v16;

  v16 = a3;
  -[FCUIActivityControlMenuItemView requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
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

    if (!self->_categoriesToVisualStylingProviders)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v13 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = v12;

    }
    v14 = self->_categoriesToVisualStylingProviders;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, v15);
    else
      -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

    -[FCUIActivityControlMenuItemView _visualStylingProvider:didChangeForCategory:outgoingProvider:](self, "_visualStylingProvider:didChangeForCategory:outgoingProvider:", v16, a4, v11);
  }

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[FCUIActivityControlMenuItemView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[FCUIActivityControlMenuItemView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
    -[FCUIActivityControlMenuItemView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BEBD848];
  v5 = (void *)MEMORY[0x24BEBD810];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:", self);
  objc_msgSend(v5, "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleWithEffect:shape:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (id)_activationDescription
{
  return -[UILabel text](self->_activationDescriptionLabel, "text");
}

- (void)_setActivationDescription:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityControlMenuItemView _activationDescription](self, "_activationDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityControlMenuItemView _configureActivationDescriptionLabelIfNecessary](self, "_configureActivationDescriptionLabelIfNecessary");
    -[FCUIActivityControlMenuItemView _addViewRequiringUpdate:](self, "_addViewRequiringUpdate:", self->_activationDescriptionLabel);
    -[UILabel setText:](self->_activationDescriptionLabel, "setText:", v6);
    -[FCUIActivityControlMenuItemView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_activationDetails
{
  return -[UILabel text](self->_activationDetailsLabel, "text");
}

- (void)_setActivationDetails:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityControlMenuItemView _activationDetails](self, "_activationDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityControlMenuItemView _configureActivationDetailsLabelIfNecessary](self, "_configureActivationDetailsLabelIfNecessary");
    -[FCUIActivityControlMenuItemView _addViewRequiringUpdate:](self, "_addViewRequiringUpdate:", self->_activationDetailsLabel);
    -[UILabel setText:](self->_activationDetailsLabel, "setText:", v6);
    -[FCUIActivityControlMenuItemView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)_accessoryImage
{
  return -[UIImageView image](self->_accessoryImageView, "image");
}

- (void)_setAccessoryImage:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityControlMenuItemView _accessoryImage](self, "_accessoryImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      -[FCUIActivityControlMenuItemView _configureAccessoryImageViewIfNecessary](self, "_configureAccessoryImageViewIfNecessary");
      -[UIImageView setImage:](self->_accessoryImageView, "setImage:", v6);
    }
    -[FCUIActivityControlMenuItemView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)_separatorHeight
{
  void *v2;
  NSString *v3;
  double v4;
  void *v5;
  double v6;

  -[FCUIActivityControlMenuItemView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v4 = v6;

  }
  return 1.0 / v4;
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

  -[FCUIActivityControlMenuItemView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;

  -[FCUIActivityControlMenuItemView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  -[FCUIActivityControlMenuItemView _updateTextAttributesForActivationDescriptionLabel](self, "_updateTextAttributesForActivationDescriptionLabel");
  -[FCUIActivityControlMenuItemView _updateTextAttributesForActivationDetailsLabel](self, "_updateTextAttributesForActivationDetailsLabel");
  -[FCUIActivityControlMenuItemView _updateTextAttributesForAlternativeDescriptionLabel](self, "_updateTextAttributesForAlternativeDescriptionLabel");
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[FCUIActivityControlMenuItemView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[FCUIActivityControlMenuItemView _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_updateTextAttributesForActivationDescriptionLabel
{
  UILabel *activationDescriptionLabel;
  id v3;

  activationDescriptionLabel = self->_activationDescriptionLabel;
  if (activationDescriptionLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE1D0], 0x8000, *MEMORY[0x24BEBB608]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](activationDescriptionLabel, "setFont:", v3);

  }
}

- (void)_updateTextAttributesForActivationDetailsLabel
{
  UILabel *activationDetailsLabel;
  id v3;

  activationDetailsLabel = self->_activationDetailsLabel;
  if (activationDetailsLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE220], 0x8000, *MEMORY[0x24BEBB610]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](activationDetailsLabel, "setFont:", v3);

  }
}

- (void)_updateTextAttributesForAlternativeDescriptionLabel
{
  UILabel *alternativeDescriptionLabel;
  id v3;

  alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
  if (alternativeDescriptionLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE1F0], 0x8000, *MEMORY[0x24BEBB608]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](alternativeDescriptionLabel, "setFont:", v3);

  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v8;
  uint64_t v9;
  int *v10;
  UIView *backgroundView;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if (a4 == 2)
  {
    backgroundView = self->_backgroundView;
    objc_msgSend(v13, "_visualStylingForStyleNamed:", CFSTR("moduleListTint"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mt_replaceVisualStyling:](backgroundView, "mt_replaceVisualStyling:", v12);

    v10 = &OBJC_IVAR___FCUIActivityControlMenuItemView__highlightView;
    v9 = 1;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_activationDescriptionLabel, 0, v13, v8);
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_activationDetailsLabel, 1, v13, v8);
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_alternativeDescriptionLabel, 1, v13, v8);
    v9 = 0;
    v10 = &OBJC_IVAR___FCUIActivityControlMenuItemView__accessoryImageView;
LABEL_5:
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", *(Class *)((char *)&self->super.super.super.isa + *v10), v9, v13, v8);
  }

}

- (void)_configureBackgroundViewIfNecessary
{
  id v3;
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  void *v7;
  id v8;

  if (!self->_backgroundView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[FCUIActivityControlMenuItemView bounds](self, "bounds");
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    -[FCUIActivityControlMenuItemView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
    v6 = self->_backgroundView;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F98);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_visualStylingForStyleNamed:", CFSTR("moduleListTint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mt_replaceVisualStyling:](v6, "mt_replaceVisualStyling:", v7);

  }
}

- (id)_newLabel
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v2, "_setTextAlignmentFollowsWritingDirection:", 1);
  objc_msgSend(v2, "setNumberOfLines:", 0);
  return v2;
}

- (void)_addViewRequiringUpdate:(id)a3
{
  id v4;
  NSHashTable *viewsRequiringUpdate;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    viewsRequiringUpdate = self->_viewsRequiringUpdate;
    v8 = v4;
    if (!viewsRequiringUpdate)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_viewsRequiringUpdate;
      self->_viewsRequiringUpdate = v6;

      viewsRequiringUpdate = self->_viewsRequiringUpdate;
    }
    -[NSHashTable addObject:](viewsRequiringUpdate, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_didPerformUpdate
{
  NSHashTable *viewsRequiringUpdate;

  viewsRequiringUpdate = self->_viewsRequiringUpdate;
  self->_viewsRequiringUpdate = 0;

}

- (void)_configureActivationDescriptionLabelIfNecessary
{
  UILabel *v3;
  UILabel *activationDescriptionLabel;
  UILabel *v5;
  id v6;

  if (!self->_activationDescriptionLabel)
  {
    v3 = -[FCUIActivityControlMenuItemView _newLabel](self, "_newLabel");
    activationDescriptionLabel = self->_activationDescriptionLabel;
    self->_activationDescriptionLabel = v3;

    -[FCUIActivityControlMenuItemView addSubview:](self, "addSubview:", self->_activationDescriptionLabel);
    -[FCUIActivityControlMenuItemView _updateTextAttributesForActivationDescriptionLabel](self, "_updateTextAttributesForActivationDescriptionLabel");
    v5 = self->_activationDescriptionLabel;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 0, v6, 0);

  }
}

- (void)_configureActivationDetailsLabelIfNecessary
{
  UILabel *v3;
  UILabel *activationDetailsLabel;
  UILabel *v5;
  id v6;

  if (!self->_activationDetailsLabel)
  {
    v3 = -[FCUIActivityControlMenuItemView _newLabel](self, "_newLabel");
    activationDetailsLabel = self->_activationDetailsLabel;
    self->_activationDetailsLabel = v3;

    -[FCUIActivityControlMenuItemView addSubview:](self, "addSubview:", self->_activationDetailsLabel);
    -[FCUIActivityControlMenuItemView _updateTextAttributesForActivationDetailsLabel](self, "_updateTextAttributesForActivationDetailsLabel");
    v5 = self->_activationDetailsLabel;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 1, v6, 0);

  }
}

- (void)_configureAlternativeDescriptionLabelIfNecessary
{
  UILabel *v3;
  UILabel *alternativeDescriptionLabel;
  UILabel *v5;
  id v6;

  if (!self->_alternativeDescriptionLabel)
  {
    v3 = -[FCUIActivityControlMenuItemView _newLabel](self, "_newLabel");
    alternativeDescriptionLabel = self->_alternativeDescriptionLabel;
    self->_alternativeDescriptionLabel = v3;

    -[UILabel setTextAlignment:](self->_alternativeDescriptionLabel, "setTextAlignment:", 1);
    -[FCUIActivityControlMenuItemView addSubview:](self, "addSubview:", self->_alternativeDescriptionLabel);
    -[FCUIActivityControlMenuItemView _updateTextAttributesForAlternativeDescriptionLabel](self, "_updateTextAttributesForAlternativeDescriptionLabel");
    v5 = self->_alternativeDescriptionLabel;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 1, v6, 0);

  }
}

- (void)_configureAccessoryImageViewIfNecessary
{
  UIImageView *v3;
  UIImageView *accessoryImageView;
  UIImageView *v5;
  id v6;

  if (!self->_accessoryImageView)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    accessoryImageView = self->_accessoryImageView;
    self->_accessoryImageView = v3;

    -[FCUIActivityControlMenuItemView addSubview:](self, "addSubview:", self->_accessoryImageView);
    v5 = self->_accessoryImageView;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 0, v6, 0);

  }
}

- (BOOL)_isCheckmarkEnabled
{
  void *v2;
  BOOL v3;

  -[UIAction image](self->_defaultAction, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)_checkmarkImage
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[FCUIActivityControlMenuItemView _isCheckmarkEnabled](self, "_isCheckmarkEnabled")
    && (-[FCUIActivityControlMenuItemView _accessoryImage](self, "_accessoryImage"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    -[FCUIActivityControlMenuItemView _accessoryImage](self, "_accessoryImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_configureCheckmarkImageViewIfNecessary
{
  UIImageView *accessoryImageView;
  id v4;

  if (-[FCUIActivityControlMenuItemView _isCheckmarkEnabled](self, "_isCheckmarkEnabled"))
  {
    -[FCUIActivityControlMenuItemView _configureAccessoryImageViewIfNecessary](self, "_configureAccessoryImageViewIfNecessary");
    accessoryImageView = self->_accessoryImageView;
    -[FCUIActivityControlMenuItemView _checkmarkImage](self, "_checkmarkImage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](accessoryImageView, "setImage:", v4);

  }
}

- (void)_tearDownAccessoryImageViewIfNecessary
{
  UIImageView *accessoryImageView;
  void *v4;
  UIImageView *v5;

  accessoryImageView = self->_accessoryImageView;
  if (accessoryImageView)
  {
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", accessoryImageView, 0, 0, v4);

    -[UIImageView removeFromSuperview](self->_accessoryImageView, "removeFromSuperview");
    v5 = self->_accessoryImageView;
    self->_accessoryImageView = 0;

  }
}

- (void)_tearDownCheckmarkImageViewIfNecessary
{
  if (-[FCUIActivityControlMenuItemView _isCheckmarkEnabled](self, "_isCheckmarkEnabled"))
    -[FCUIActivityControlMenuItemView _tearDownAccessoryImageViewIfNecessary](self, "_tearDownAccessoryImageViewIfNecessary");
}

- (void)_configureSeparatorViewIfNecessary
{
  UIView *v3;
  UIView *separatorView;
  UIView *v5;
  id v6;

  if (!self->_separatorView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = self->_separatorView;
    self->_separatorView = v3;

    -[FCUIActivityControlMenuItemView addSubview:](self, "addSubview:", self->_separatorView);
    v5 = self->_separatorView;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v5, 5, v6, 0);

  }
}

- (void)_tearDownSeparatorViewIfNecessary
{
  UIView *separatorView;
  void *v4;
  UIView *v5;

  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F80);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", separatorView, 5, 0, v4);

    -[UIView removeFromSuperview](self->_separatorView, "removeFromSuperview");
    v5 = self->_separatorView;
    self->_separatorView = 0;

  }
}

- (void)_configureHighlightViewIfNecessary
{
  UIView *v3;
  UIView *highlightView;
  UIView *v5;
  UIView *v6;
  id v7;

  if (!self->_highlightView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    highlightView = self->_highlightView;
    self->_highlightView = v3;

    -[UIView setUserInteractionEnabled:](self->_highlightView, "setUserInteractionEnabled:", 0);
    v5 = self->_highlightView;
    -[FCUIActivityControlMenuItemView bounds](self, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView setAutoresizingMask:](self->_highlightView, "setAutoresizingMask:", 18);
    -[FCUIActivityControlMenuItemView _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
    -[FCUIActivityControlMenuItemView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_highlightView, self->_backgroundView);
    v6 = self->_highlightView;
    -[NSMutableDictionary objectForKey:](self->_categoriesToVisualStylingProviders, "objectForKey:", &unk_24D218F98);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControlMenuItemView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v6, 1, v7, 0);

  }
}

- (CGRect)_accessoryImageFrameForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  BSRectWithSize();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if ((-[FCUIActivityControlMenuItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
  {
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    CGRectGetWidth(v32);
    v33.origin.x = v9;
    v33.origin.y = v11;
    v33.size.width = v13;
    v33.size.height = v15;
    CGRectGetWidth(v33);
  }
  UIRectCenteredYInRect();
  -[FCUIActivityControlMenuItemView _accessoryImage](self, "_accessoryImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[FCUIActivityControlMenuItemView _checkmarkImage](self, "_checkmarkImage");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  objc_msgSend(v19, "size");
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)_textFrameForBounds:(CGRect)a3 accessoryImageFrame:(CGRect)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  int v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat rect;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v11 = -[FCUIActivityControlMenuItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v26.origin.x = v10;
  v26.origin.y = v9;
  v26.size.width = v8;
  v26.size.height = height;
  CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = rect;
  CGRectGetWidth(v27);
  v28.origin.x = v10;
  v28.origin.y = v9;
  v28.size.width = v8;
  v28.size.height = height;
  CGRectGetHeight(v28);
  BSRectWithSize();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = 25.0;
  if (v11)
  {
    v29.origin.x = v10;
    v29.origin.y = v9;
    v29.size.width = v8;
    v29.size.height = height;
    v21 = CGRectGetWidth(v29) + -25.0;
    v30.origin.x = v13;
    v30.origin.y = v15;
    v30.size.width = v17;
    v30.size.height = v19;
    v20 = v21 - CGRectGetWidth(v30);
  }
  v22 = v15;
  v23 = v17;
  v24 = v19;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v20;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_viewsRequiringUpdate, 0);
  objc_storeStrong((id *)&self->_alternativeDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_activationDetailsLabel, 0);
  objc_storeStrong((id *)&self->_activationDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
