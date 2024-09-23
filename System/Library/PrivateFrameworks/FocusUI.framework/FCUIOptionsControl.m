@implementation FCUIOptionsControl

- (FCUIOptionsControl)initWithReferencePointSize:(double)a3 maximumPointSize:(double)a4
{
  FCUIOptionsControl *v6;
  FCUIOptionsControl *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCUIOptionsControl;
  v6 = -[FCUIOptionsControl init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_referencePointSize = a3;
    v6->_maxPointSize = a4;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
    {
      -[FCUIOptionsControl setHitTestInsets:](v7, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v7);
      -[FCUIOptionsControl addInteraction:](v7, "addInteraction:", v10);

    }
  }
  return v7;
}

- (void)setControlType:(int64_t)a3
{
  UIImageView *glyphView;

  if (self->_controlType != a3)
  {
    self->_controlType = a3;
    -[UIImageView removeFromSuperview](self->_glyphView, "removeFromSuperview");
    glyphView = self->_glyphView;
    self->_glyphView = 0;

    -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGlyphVisualStylingProvider:(id)a3
{
  MTVisualStylingProvider *v5;
  MTVisualStylingProvider *v6;

  v5 = (MTVisualStylingProvider *)a3;
  if (self->_glyphVisualStylingProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_glyphVisualStylingProvider, a3);
    -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setParentControlHighlighted:(BOOL)a3
{
  if (self->_parentControlHighlighted != a3)
  {
    self->_parentControlHighlighted = a3;
    -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setParentControlSelected:(BOOL)a3
{
  UIImageView *glyphView;
  void *v5;

  if (self->_parentControlSelected != a3)
  {
    self->_parentControlSelected = a3;
    -[UIImageView removeFromSuperview](self->_glyphView, "removeFromSuperview");
    glyphView = self->_glyphView;
    self->_glyphView = 0;

    if (self->_controlType == 2)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCUIOptionsControl setTintColor:](self, "setTintColor:", v5);

    }
    -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[FCUIOptionsControl _configureGlyphViewIfNecessary](self, "_configureGlyphViewIfNecessary", a3.width, a3.height);
  -[FCUIOptionsControl _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIOptionsControl _scaledValueForValue:](self, "_scaledValueForValue:", self->_referencePointSize);
  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UIView *backgroundView;
  char v8;
  double v9;
  int v10;
  _QWORD v11[9];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCUIOptionsControl;
  -[FCUIOptionsControl layoutSubviews](&v12, sel_layoutSubviews);
  -[FCUIOptionsControl _configureBackgroundViewIfNecessary](self, "_configureBackgroundViewIfNecessary");
  -[FCUIOptionsControl _configureGlyphViewIfNecessary](self, "_configureGlyphViewIfNecessary");
  -[FCUIOptionsControl _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[FCUIOptionsControl bounds](self, "bounds");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__FCUIOptionsControl_layoutSubviews__block_invoke;
  v11[3] = &unk_24D20AC88;
  v11[4] = self;
  v11[5] = v3;
  v11[6] = v4;
  v11[7] = v5;
  v11[8] = v6;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v11);
  backgroundView = self->_backgroundView;
  v8 = -[FCUIOptionsControl isHighlighted](self, "isHighlighted");
  v9 = 1.0;
  if ((v8 & 1) == 0)
  {
    v10 = -[FCUIOptionsControl isSelected](self, "isSelected", 1.0);
    v9 = 0.0;
    if (v10)
      v9 = 1.0;
  }
  -[UIView setAlpha:](backgroundView, "setAlpha:", v9);
  -[FCUIOptionsControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_glyphView, -[FCUIOptionsControl _glyphViewVisualStyleForCurrentState](self, "_glyphViewVisualStyleForCurrentState"), self->_glyphVisualStylingProvider, 0);
}

uint64_t __36__FCUIOptionsControl_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "_setCornerRadius:", CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  FCUIOptionsControl *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (FCUIOptionsControl *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[FCUIOptionsControl isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)FCUIOptionsControl;
  -[FCUIOptionsControl setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != -[FCUIOptionsControl isHighlighted](self, "isHighlighted"))
  {
    -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
    -[FCUIOptionsControl layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[FCUIOptionsControl isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)FCUIOptionsControl;
  -[FCUIOptionsControl setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != -[FCUIOptionsControl isSelected](self, "isSelected"))
  {
    -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
    -[FCUIOptionsControl layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[FCUIOptionsControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[FCUIOptionsControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
    -[FCUIOptionsControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24D218F08;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  void *v7;
  MTVisualStylingProvider *glyphVisualStylingProvider;
  MTVisualStylingProvider *v9;
  MTVisualStylingProvider *v10;
  MTVisualStylingProvider *v11;
  MTVisualStylingProvider *v12;
  MTVisualStylingProvider *v13;

  v13 = (MTVisualStylingProvider *)a3;
  -[FCUIOptionsControl requiredVisualStyleCategories](self, "requiredVisualStyleCategories");
  v6 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MTVisualStylingProvider containsObject:](v6, "containsObject:", v7))
  {

    goto LABEL_5;
  }
  glyphVisualStylingProvider = self->_glyphVisualStylingProvider;

  v9 = v13;
  if (glyphVisualStylingProvider != v13)
  {
    v10 = self->_glyphVisualStylingProvider;
    v11 = v13;
    v12 = self->_glyphVisualStylingProvider;
    self->_glyphVisualStylingProvider = v11;
    v6 = v10;

    -[FCUIOptionsControl _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", self->_glyphVisualStylingProvider, a4, v6);
LABEL_5:

    v9 = v13;
  }

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;
  void *v6;

  if (self->_controlType)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BEBD838];
    objc_msgSend(a5, "rect", a3, a4);
    UIRectInset();
    objc_msgSend(v6, "regionWithRect:identifier:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(MEMORY[0x24BEBD888]);
  v6 = (void *)MEMORY[0x24BEBD420];
  -[UIView bounds](self->_backgroundView, "bounds");
  objc_msgSend(v6, "bezierPathWithOvalInRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:parameters:", self, v5);
  v9 = (void *)MEMORY[0x24BEBD848];
  objc_msgSend(MEMORY[0x24BEBD830], "effectWithPreview:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "styleWithEffect:shape:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__FCUIOptionsControl_pointerInteraction_willEnterRegion_animator___block_invoke;
  v5[3] = &unk_24D20A9C0;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

uint64_t __66__FCUIOptionsControl_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 1);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__FCUIOptionsControl_pointerInteraction_willExitRegion_animator___block_invoke;
  v5[3] = &unk_24D20A9C0;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

uint64_t __65__FCUIOptionsControl_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
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

  -[FCUIOptionsControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;
  UIImageView *glyphView;
  void *v7;
  double maxPointSize;
  id v9;

  -[FCUIOptionsControl traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  glyphView = self->_glyphView;
  v7 = (void *)MEMORY[0x24BEBD660];
  -[FCUIOptionsControl _scaledValueForValue:](self, "_scaledValueForValue:", self->_referencePointSize);
  if (maxPointSize > self->_maxPointSize)
    maxPointSize = self->_maxPointSize;
  objc_msgSend(v7, "configurationWithPointSize:", maxPointSize);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](glyphView, "setPreferredSymbolConfiguration:", v9);

}

- (void)_updateTextAttributesIfNecessary
{
  if (-[FCUIOptionsControl _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[FCUIOptionsControl _updateTextAttributes](self, "_updateTextAttributes");
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

- (id)_glyphImageNameForCurrentStateWithControlType:(int64_t)a3
{
  __CFString *v3;
  __CFString *v5;

  if (a3 == 2)
  {
    if (self->_parentControlSelected)
      v5 = CFSTR("checkmark");
    else
      v5 = 0;
    return v5;
  }
  else
  {
    v3 = CFSTR("ellipsis");
    if (a3)
      v3 = 0;
    if (a3 == 1)
      return CFSTR("chevron.forward");
    else
      return v3;
  }
}

- (int64_t)_glyphViewVisualStyleForCurrentState
{
  return 2 * self->_parentControlHighlighted;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  UIImageView *glyphView;
  id v8;
  id v9;

  if (a4 == 1)
  {
    glyphView = self->_glyphView;
    v8 = a5;
    v9 = a3;
    -[FCUIOptionsControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", glyphView, -[FCUIOptionsControl _glyphViewVisualStyleForCurrentState](self, "_glyphViewVisualStyleForCurrentState"), v9, v8);

  }
}

- (void)_configureBackgroundViewIfNecessary
{
  UIView *v3;
  UIView *backgroundView;
  UIView *v5;
  void *v6;

  if (!self->_backgroundView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
    v5 = self->_backgroundView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[FCUIOptionsControl insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.0);
  }
}

- (void)_configureGlyphViewIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *glyphView;
  UIImageView *v10;
  void *v11;

  if (!self->_glyphView)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD668]);
    v4 = (void *)MEMORY[0x24BEBD640];
    -[FCUIOptionsControl _glyphImageNameForCurrentStateWithControlType:](self, "_glyphImageNameForCurrentStateWithControlType:", self->_controlType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIOptionsControl traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemImageNamed:compatibleWithTraitCollection:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v7);
    glyphView = self->_glyphView;
    self->_glyphView = v8;

    -[UIImageView setContentMode:](self->_glyphView, "setContentMode:", 4);
    v10 = self->_glyphView;
    -[FCUIOptionsControl tintColor](self, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10, "setTintColor:", v11);

    -[FCUIOptionsControl addSubview:](self, "addSubview:", self->_glyphView);
    -[FCUIOptionsControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_glyphView, -[FCUIOptionsControl _glyphViewVisualStyleForCurrentState](self, "_glyphViewVisualStyleForCurrentState"), self->_glyphVisualStylingProvider, 0);
  }
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCUIOptionsControl;
  v4 = a3;
  -[FCUIOptionsControl setTintColor:](&v5, sel_setTintColor_, v4);
  -[UIImageView setTintColor:](self->_glyphView, "setTintColor:", v4, v5.receiver, v5.super_class);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (BOOL)isParentControlHighlighted
{
  return self->_parentControlHighlighted;
}

- (BOOL)isParentControlSelected
{
  return self->_parentControlSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_glyphVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
