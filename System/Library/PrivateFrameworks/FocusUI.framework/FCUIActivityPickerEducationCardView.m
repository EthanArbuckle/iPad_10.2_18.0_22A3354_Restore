@implementation FCUIActivityPickerEducationCardView

+ (id)_defaultPromimentViewWithBaubleDescriptions:(id)a3
{
  id v3;
  FCUIActivityBaubleGroupView *v4;

  v3 = a3;
  v4 = -[FCUIActivityBaubleGroupView initWithBaubleDescriptions:baubleGroupType:]([FCUIActivityBaubleGroupView alloc], "initWithBaubleDescriptions:baubleGroupType:", v3, 1);

  return v4;
}

+ (id)defaultEducationCardViewActivityIdentifiers
{
  return &unk_24D218EF0;
}

+ (id)defaultEducationCardViewFallbackBaubleDescriptions
{
  FCUIActivityBaubleDescription *v2;
  void *v3;
  FCUIActivityBaubleDescription *v4;
  FCUIActivityBaubleDescription *v5;
  void *v6;
  FCUIActivityBaubleDescription *v7;
  FCUIActivityBaubleDescription *v8;
  void *v9;
  FCUIActivityBaubleDescription *v10;
  FCUIActivityBaubleDescription *v11;
  void *v12;
  FCUIActivityBaubleDescription *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v2 = [FCUIActivityBaubleDescription alloc];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemIndigoColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCUIActivityBaubleDescription initWithSystemImageName:tintColor:](v2, "initWithSystemImageName:tintColor:", CFSTR("moon.fill"), v3);
  v16[0] = v4;
  v5 = [FCUIActivityBaubleDescription alloc];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemOrangeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCUIActivityBaubleDescription initWithSystemImageName:tintColor:](v5, "initWithSystemImageName:tintColor:", CFSTR("book.closed.fill"), v6);
  v16[1] = v7;
  v8 = [FCUIActivityBaubleDescription alloc];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCUIActivityBaubleDescription initWithSystemImageName:tintColor:](v8, "initWithSystemImageName:tintColor:", CFSTR("figure.run"), v9);
  v16[2] = v10;
  v11 = [FCUIActivityBaubleDescription alloc];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemMintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCUIActivityBaubleDescription initWithSystemImageName:tintColor:](v11, "initWithSystemImageName:tintColor:", CFSTR("bed.double.fill"), v12);
  v16[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)defaultEducationCardViewWithProminentViewBaubleDescriptions:(id)a3 dismissAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  objc_msgSend(a1, "_defaultPromimentViewWithBaubleDescriptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_ONBOARDING_HEADLINE"), &stru_24D20B520, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_ONBOARDING_BODY"), &stru_24D20B520, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithProminentView:headlineText:bodyText:dismissAction:", v9, v11, v13, v6);

  return v14;
}

- (FCUIActivityPickerEducationCardView)initWithProminentView:(id)a3 headlineText:(id)a4 bodyText:(id)a5 dismissAction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCUIActivityPickerEducationCardView *v15;
  FCUIActivityPickerEducationCardView *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCUIActivityPickerEducationCardView;
  v15 = -[FCUIActivityPickerEducationCardView init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[FCUIActivityPickerEducationCardView setAdjustsFontForContentSizeCategory:](v15, "setAdjustsFontForContentSizeCategory:", 1);
    objc_storeStrong((id *)&v16->_prominentView, a3);
    -[FCUIActivityPickerEducationCardView addSubview:](v16, "addSubview:", v16->_prominentView);
    -[FCUIActivityPickerEducationCardView _configureHeadlineLabelIfNecessary](v16, "_configureHeadlineLabelIfNecessary");
    -[UILabel setText:](v16->_headlineLabel, "setText:", v12);
    -[FCUIActivityPickerEducationCardView _configureBodyLabelIfNecessary](v16, "_configureBodyLabelIfNecessary");
    -[UILabel setText:](v16->_bodyLabel, "setText:", v13);
    -[FCUIActivityPickerEducationCardView _configureDismissControlIfNecessaryWithAction:](v16, "_configureDismissControlIfNecessaryWithAction:", v14);
    -[FCUIActivityPickerEducationCardView setClipsToBounds:](v16, "setClipsToBounds:", 1);
  }

  return v16;
}

- (void)setDefaultAction:(id)a3
{
  UIAction *v4;
  UIAction *defaultAction;
  UITapGestureRecognizer *defaultTapGesture;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *v9;
  id v10;

  v10 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIAction *)objc_msgSend(v10, "copy");
    defaultAction = self->_defaultAction;
    self->_defaultAction = v4;

    defaultTapGesture = self->_defaultTapGesture;
    if (self->_defaultAction)
    {
      if (!defaultTapGesture)
      {
        v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleDefaultTap_);
        v8 = self->_defaultTapGesture;
        self->_defaultTapGesture = v7;

        -[FCUIActivityPickerEducationCardView addGestureRecognizer:](self, "addGestureRecognizer:", self->_defaultTapGesture);
      }
    }
    else
    {
      -[FCUIActivityPickerEducationCardView removeGestureRecognizer:](self, "removeGestureRecognizer:", defaultTapGesture);
      v9 = self->_defaultTapGesture;
      self->_defaultTapGesture = 0;

    }
  }

}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  _FCUIActivityPickerOnboardingDismissControl *dismissControl;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  unint64_t v36;
  double v37;
  CGFloat v38;
  double v39;
  unint64_t v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat rect;
  CGFloat v47;
  CGFloat v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[FCUIActivityPickerEducationCardView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[_FCUIActivityPickerOnboardingDismissControl sizeThatFits:](self->_dismissControl, "sizeThatFits:", width, height);
  BSRectWithSize();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[_FCUIActivityPickerOnboardingDismissControl contentInsetsWithBounds:](self->_dismissControl, "contentInsetsWithBounds:");
  v19 = v18;
  v21 = 24.0 - v20;
  v48 = y;
  v49 = width;
  v47 = x;
  if (v10)
  {
    v22 = 24.0 - v17;
  }
  else
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v23 = v19;
    v50.size.width = width;
    v50.size.height = height;
    MaxX = CGRectGetMaxX(v50);
    v51.origin.x = v12;
    v51.origin.y = v21;
    v51.size.width = v14;
    v51.size.height = v16;
    v22 = v23 + MaxX - CGRectGetWidth(v51) + -24.0;
  }
  v25 = v21;
  v26 = v14;
  v27 = v16;
  if (!a4)
  {
    dismissControl = self->_dismissControl;
    UIRectIntegralWithScale();
    -[_FCUIActivityPickerOnboardingDismissControl setFrame:](dismissControl, "setFrame:");
  }
  v29 = v22;
  -[UIView sizeThatFits:](self->_prominentView, "sizeThatFits:", v49, height, v19);
  BSRectWithSize();
  rect = height;
  UIRectCenteredXInRectScale();
  v30 = v52.origin.x;
  v31 = v52.origin.y;
  v32 = v52.size.width;
  v33 = v52.size.height;
  v63.origin.x = v29;
  v63.origin.y = v25;
  v63.size.width = v26;
  v63.size.height = v27;
  if (CGRectIntersectsRect(v52, v63))
  {
    v53.origin.x = v29;
    v53.origin.y = v25;
    v53.size.width = v26;
    v53.size.height = v27;
    v31 = CGRectGetMaxY(v53) + 8.0;
  }
  if (!a4)
    -[UIView setFrame:](self->_prominentView, "setFrame:", v30, v31, v32, v33, 0);
  v54.origin.x = v30;
  v54.origin.y = v31;
  v54.size.width = v32;
  v54.size.height = v33;
  v45 = CGRectGetMaxY(v54) + 14.0;
  v55.origin.x = v47;
  v55.origin.y = v48;
  v55.size.width = v49;
  v55.size.height = rect;
  v34 = CGRectGetWidth(v55) + -48.0;
  v56.origin.x = v47;
  v35 = v34;
  v56.origin.y = v48;
  v56.size.width = v49;
  v56.size.height = rect;
  CGRectGetMaxY(v56);
  v57.origin.x = v30;
  v57.origin.y = v31;
  v57.size.width = v32;
  v57.size.height = v33;
  CGRectGetMaxY(v57);
  v36 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_headlineLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, 24.0, v45, v35, 1.79769313e308);
  -[UILabel fcui_measuringHeightWithNumberOfLines:](self->_headlineLabel, "fcui_measuringHeightWithNumberOfLines:", v36);
  v38 = v37;
  if (!a4)
  {
    v58.origin.x = 24.0;
    v58.origin.y = v45;
    v58.size.width = v35;
    v58.size.height = v38;
    CGRectGetWidth(v58);
    -[UILabel fcui_drawingHeightWithNumberOfLines:](self->_headlineLabel, "fcui_drawingHeightWithNumberOfLines:", v36);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_headlineLabel, "setFrame:", 0);
  }
  v59.origin.x = 24.0;
  v59.origin.y = v45;
  v59.size.width = v35;
  v59.size.height = v38;
  v39 = CGRectGetMaxY(v59) + 8.0;
  v40 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_bodyLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, 24.0, v45, v35, 1.79769313e308);
  -[UILabel fcui_measuringHeightWithNumberOfLines:](self->_bodyLabel, "fcui_measuringHeightWithNumberOfLines:", v40);
  v42 = v41;
  if (a4)
  {
    v60.origin.x = v47;
    v60.origin.y = v48;
    v60.size.width = v49;
    v60.size.height = rect;
    CGRectGetWidth(v60);
    v61.origin.x = 24.0;
    v61.origin.y = v39;
    v61.size.width = v35;
    v61.size.height = v42;
    CGRectGetMaxY(v61);
    UISizeRoundToScale();
    a4->width = v43;
    a4->height = v44;
  }
  else
  {
    v62.origin.x = 24.0;
    v62.origin.y = v39;
    v62.size.width = v35;
    v62.size.height = v42;
    CGRectGetWidth(v62);
    -[UILabel fcui_drawingHeightWithNumberOfLines:](self->_bodyLabel, "fcui_drawingHeightWithNumberOfLines:", v40);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_bodyLabel, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  __int128 v6;
  CGSize result;

  v6 = *MEMORY[0x24BDBF148];
  BSRectWithSize();
  -[FCUIActivityPickerEducationCardView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v6);
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
  v3.super_class = (Class)FCUIActivityPickerEducationCardView;
  -[FCUIActivityPickerEducationCardView layoutSubviews](&v3, sel_layoutSubviews);
  -[FCUIActivityPickerEducationCardView _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
  -[FCUIActivityPickerEducationCardView _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIActivityPickerEducationCardView bounds](self, "bounds");
  -[FCUIActivityPickerEducationCardView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[_FCUIActivityPickerOnboardingDismissControl setAdjustsFontForContentSizeCategory:](self->_dismissControl, "setAdjustsFontForContentSizeCategory:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView setAdjustsFontForContentSizeCategory:](self->_prominentView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[FCUIActivityPickerEducationCardView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;

  -[FCUIActivityPickerEducationCardView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    -[FCUIActivityPickerEducationCardView _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    -[_FCUIActivityPickerOnboardingDismissControl adjustForContentSizeCategoryChange](self->_dismissControl, "adjustForContentSizeCategoryChange");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView adjustForContentSizeCategoryChange](self->_prominentView, "adjustForContentSizeCategoryChange");
  }

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

- (void)_updateTextAttributesForHeadlineLabel
{
  UILabel *headlineLabel;
  void *v4;

  headlineLabel = self->_headlineLabel;
  if (headlineLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE250], 0x8000, *MEMORY[0x24BEBB5E8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](headlineLabel, "setFont:", v4);

    -[FCUIActivityPickerEducationCardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTextAttributesForBodyLabel
{
  UILabel *bodyLabel;
  void *v4;

  bodyLabel = self->_bodyLabel;
  if (bodyLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE220], 0x8000, *MEMORY[0x24BEBB608]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](bodyLabel, "setFont:", v4);

    -[FCUIActivityPickerEducationCardView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return !self->_textAttributesValid;
}

- (void)_setNeedsTextAttributesUpdate
{
  self->_textAttributesValid = 0;
  -[FCUIActivityPickerEducationCardView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  self->_textAttributesValid = 1;
  -[FCUIActivityPickerEducationCardView _updateTextAttributesForHeadlineLabel](self, "_updateTextAttributesForHeadlineLabel");
  -[FCUIActivityPickerEducationCardView _updateTextAttributesForBodyLabel](self, "_updateTextAttributesForBodyLabel");
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[FCUIActivityPickerEducationCardView _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[FCUIActivityPickerEducationCardView _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  MTMaterialView *v3;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v5;

  if (!self->_backgroundMaterialView)
  {
    objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:options:", 53, 1);
    v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    v5 = self->_backgroundMaterialView;
    -[FCUIActivityPickerEducationCardView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v5, "setFrame:");
    -[FCUIActivityPickerEducationCardView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
    -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:", 37.0);
  }
}

- (void)_configureHeadlineLabelIfNecessary
{
  UILabel *v3;
  UILabel *headlineLabel;
  UILabel *v5;
  void *v6;

  if (!self->_headlineLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    headlineLabel = self->_headlineLabel;
    self->_headlineLabel = v3;

    -[UILabel setNumberOfLines:](self->_headlineLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_headlineLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_headlineLabel, "setLineBreakMode:", 4);
    v5 = self->_headlineLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    -[FCUIActivityPickerEducationCardView addSubview:](self, "addSubview:", self->_headlineLabel);
    -[FCUIActivityPickerEducationCardView _updateTextAttributesForHeadlineLabel](self, "_updateTextAttributesForHeadlineLabel");
  }
}

- (void)_configureBodyLabelIfNecessary
{
  UILabel *v3;
  UILabel *bodyLabel;
  UILabel *v5;
  void *v6;

  if (!self->_bodyLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    bodyLabel = self->_bodyLabel;
    self->_bodyLabel = v3;

    -[UILabel setNumberOfLines:](self->_bodyLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_bodyLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_bodyLabel, "setLineBreakMode:", 4);
    v5 = self->_bodyLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    -[FCUIActivityPickerEducationCardView addSubview:](self, "addSubview:", self->_bodyLabel);
    -[FCUIActivityPickerEducationCardView _updateTextAttributesForBodyLabel](self, "_updateTextAttributesForBodyLabel");
  }
}

- (void)_configureDismissControlIfNecessaryWithAction:(id)a3
{
  id v4;
  _FCUIActivityPickerOnboardingDismissControl *v5;
  _FCUIActivityPickerOnboardingDismissControl *dismissControl;

  if (!self->_dismissControl)
  {
    v4 = a3;
    v5 = -[_FCUIActivityPickerOnboardingDismissControl initWithAction:]([_FCUIActivityPickerOnboardingDismissControl alloc], "initWithAction:", v4);

    dismissControl = self->_dismissControl;
    self->_dismissControl = v5;

    -[FCUIActivityPickerEducationCardView addSubview:](self, "addSubview:", self->_dismissControl);
  }
}

- (void)_handleDefaultTap:(id)a3
{
  UIAction *defaultAction;

  defaultAction = self->_defaultAction;
  if (defaultAction)
    -[UIAction performWithSender:target:](defaultAction, "performWithSender:target:", self, 0);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UIView)prominentView
{
  return self->_prominentView;
}

- (NSString)headlineText
{
  return self->_headlineText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (UIAction)dismissAction
{
  return self->_dismissAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_headlineText, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_dismissControl, 0);
  objc_storeStrong((id *)&self->_defaultTapGesture, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
  objc_storeStrong((id *)&self->_prominentView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end
