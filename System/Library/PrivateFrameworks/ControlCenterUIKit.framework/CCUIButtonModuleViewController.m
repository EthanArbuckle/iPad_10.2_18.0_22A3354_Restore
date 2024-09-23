@implementation CCUIButtonModuleViewController

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[CCUIButtonModuleViewController _updateSelected](self, "_updateSelected");
  }
}

- (BOOL)hasGlyph
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[CCUIButtonModuleViewController glyphView](self, "glyphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[CCUIButtonModuleViewController glyphImage](self, "glyphImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[CCUIButtonModuleViewController glyphPackageDescription](self, "glyphPackageDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return -[CCUIButtonModuleView glyphPackageDescription](self->_buttonModuleView, "glyphPackageDescription");
}

- (UIImage)glyphImage
{
  return -[CCUIButtonModuleView glyphImage](self->_buttonModuleView, "glyphImage");
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CCUIButtonModuleView)buttonView
{
  return self->_buttonModuleView;
}

- (void)viewWillLayoutSubviews
{
  _BOOL8 v3;
  double v4;
  void *v5;
  CCUIButtonModuleView *buttonModuleView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIButtonModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  v3 = -[CCUIButtonModuleViewController isExpanded](self, "isExpanded");
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CCUIButtonModuleViewController preferredExpandedContinuousCornerRadius](self, "preferredExpandedContinuousCornerRadius");
    else
      v4 = CCUIExpandedModuleContinuousCornerRadius();
    -[CCUIButtonModuleViewController _applyContinuousCornerRadius:](self, "_applyContinuousCornerRadius:", v4);
  }
  else if (!-[CCUIButtonModuleViewController isResizing](self, "isResizing"))
  {
    -[CCUIButtonModuleViewController _applyCompactContinuousCornerRadius](self, "_applyCompactContinuousCornerRadius");
  }
  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpanded:", v3);

  buttonModuleView = self->_buttonModuleView;
  -[CCUIButtonModuleViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[CCUIButtonModuleView setFrame:](buttonModuleView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  CCUIControlTemplateView *v4;
  CCUIButtonModuleView *v5;
  void *v6;
  CCUIButtonModuleView *buttonModuleView;
  CCUIButtonModuleView *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUIButtonModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[CCUIButtonModuleViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CCUIControlTemplateView alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[CCUIControlTemplateView initWithFrame:](v4, "initWithFrame:");
  -[CCUIButtonModuleViewController title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleView setTitle:](v5, "setTitle:", v6);

  -[CCUIButtonModuleView setSupportsAccessibilityContentSizeCategories:](v5, "setSupportsAccessibilityContentSizeCategories:", -[CCUIButtonModuleViewController supportsAccessibilityContentSizeCategories](self, "supportsAccessibilityContentSizeCategories"));
  buttonModuleView = self->_buttonModuleView;
  self->_buttonModuleView = v5;
  v8 = v5;

  objc_msgSend(v3, "addSubview:", self->_buttonModuleView);
  -[CCUIButtonModuleViewController _updateValueText](self, "_updateValueText");
  -[CCUIButtonModuleView addTarget:action:forControlEvents:](self->_buttonModuleView, "addTarget:action:forControlEvents:", self, sel__buttonTouchDown_forEvent_, 1);
  -[CCUIButtonModuleView addTarget:action:forControlEvents:](self->_buttonModuleView, "addTarget:action:forControlEvents:", self, sel__buttonTapped_forEvent_, 64);

}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIButtonModuleViewController;
  v4 = a3;
  -[CCUIButtonModuleViewController setTitle:](&v6, sel_setTitle_, v4);
  -[CCUIButtonModuleViewController _templateView](self, "_templateView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)setValueText:(id)a3
{
  NSString *v4;
  NSString *valueText;
  id v6;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    valueText = self->_valueText;
    self->_valueText = v4;

    -[CCUIButtonModuleViewController _updateValueText](self, "_updateValueText");
  }

}

- (void)setSelectedValueText:(id)a3
{
  NSString *v4;
  NSString *selectedValueText;
  id v6;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    selectedValueText = self->_selectedValueText;
    self->_selectedValueText = v4;

    -[CCUIButtonModuleViewController _updateValueText](self, "_updateValueText");
  }

}

- (void)setGlyphView:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setGlyphView:](self->_buttonModuleView, "setGlyphView:", v4);

}

- (CCUIButtonModuleGlyph)glyphView
{
  return -[CCUIButtonModuleView glyphView](self->_buttonModuleView, "glyphView");
}

- (void)setGlyphImage:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setGlyphImage:](self->_buttonModuleView, "setGlyphImage:", v4);

}

- (void)setGlyphColor:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setGlyphColor:](self->_buttonModuleView, "setGlyphColor:", v4);

}

- (UIColor)glyphColor
{
  return -[CCUIButtonModuleView glyphColor](self->_buttonModuleView, "glyphColor");
}

- (void)setSelectedGlyphImage:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setSelectedGlyphImage:](self->_buttonModuleView, "setSelectedGlyphImage:", v4);

}

- (UIImage)selectedGlyphImage
{
  return -[CCUIButtonModuleView selectedGlyphImage](self->_buttonModuleView, "selectedGlyphImage");
}

- (void)setSelectedGlyphColor:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setSelectedGlyphColor:](self->_buttonModuleView, "setSelectedGlyphColor:", v4);

}

- (UIColor)selectedGlyphColor
{
  return -[CCUIButtonModuleView selectedGlyphColor](self->_buttonModuleView, "selectedGlyphColor");
}

- (void)setGlyphPackageDescription:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setGlyphPackageDescription:](self->_buttonModuleView, "setGlyphPackageDescription:", v4);

}

- (void)setGlyphState:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setGlyphState:](self->_buttonModuleView, "setGlyphState:", v4);

}

- (NSString)glyphState
{
  return -[CCUIButtonModuleView glyphState](self->_buttonModuleView, "glyphState");
}

- (void)setGlyphScale:(double)a3
{
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setGlyphScale:](self->_buttonModuleView, "setGlyphScale:", a3);
}

- (double)glyphScale
{
  CCUIButtonModuleView *buttonModuleView;
  double result;

  buttonModuleView = self->_buttonModuleView;
  if (!buttonModuleView)
    return 1.0;
  -[CCUIButtonModuleView glyphScale](buttonModuleView, "glyphScale");
  return result;
}

- (BOOL)appearsSelected
{
  return !self->_contentRenderingMode && self->_selected;
}

- (void)_buttonTapped:(id)a3 forEvent:(id)a4
{
  id v4;

  -[CCUIButtonModuleViewController buttonTapped:forEvent:](self, "buttonTapped:forEvent:", a3, a4);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deactivateReachability");

}

- (CCUIButtonModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIButtonModuleViewController *v4;
  void *v5;
  uint64_t v6;
  NSString *valueText;
  void *v8;
  uint64_t v9;
  NSString *selectedValueText;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CCUIButtonModuleViewController;
  v4 = -[CCUIButtonModuleViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONTROL_OFF"), &stru_1E8E21150, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    valueText = v4->_valueText;
    v4->_valueText = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTROL_ON"), &stru_1E8E21150, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    selectedValueText = v4->_selectedValueText;
    v4->_selectedValueText = (NSString *)v9;

  }
  return v4;
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (void)setResizing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResizing:", v3);

}

- (BOOL)isResizing
{
  void *v2;
  char v3;

  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResizing");

  return v3;
}

- (void)setGridSizeClass:(int64_t)a3
{
  id v5;

  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGridSizeClass:", a3);

}

- (int64_t)gridSizeClass
{
  void *v2;
  int64_t v3;

  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "gridSizeClass");

  return v3;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  id v4;

  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    if (-[CCUIButtonModuleViewController isResizing](self, "isResizing"))
    {
      -[CCUIButtonModuleViewController _applyCompactContinuousCornerRadius](self, "_applyCompactContinuousCornerRadius");
    }
    else
    {
      -[CCUIButtonModuleViewController viewIfLoaded](self, "viewIfLoaded");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNeedsLayout");

    }
  }
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (self->_contentRenderingMode != a3)
  {
    self->_contentRenderingMode = a3;
    -[CCUIButtonModuleViewController _updateSelected](self, "_updateSelected");
  }
}

- (void)setContentMetrics:(id)a3
{
  id v4;

  v4 = a3;
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setContentMetrics:](self->_buttonModuleView, "setContentMetrics:", v4);

}

- (CCUIModuleContentMetrics)contentMetrics
{
  return -[CCUIButtonModuleView contentMetrics](self->_buttonModuleView, "contentMetrics");
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _QWORD v4[5];

  self->_expanded = a3;
  if (-[CCUIButtonModuleView isHighlighted](self->_buttonModuleView, "isHighlighted"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__CCUIButtonModuleViewController_willTransitionToExpandedContentMode___block_invoke;
    v4[3] = &unk_1E8E20590;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  }
}

uint64_t __70__CCUIButtonModuleViewController_willTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setHighlighted:", 0);
}

- (void)setSupportsAccessibilityContentSizeCategories:(BOOL)a3
{
  if (self->_supportsAccessibilityContentSizeCategories != a3)
  {
    self->_supportsAccessibilityContentSizeCategories = a3;
    -[CCUIButtonModuleView setSupportsAccessibilityContentSizeCategories:](self->_buttonModuleView, "setSupportsAccessibilityContentSizeCategories:");
  }
}

- (BOOL)supportsAccessibilityContentSizeCategories
{
  return self->_supportsAccessibilityContentSizeCategories;
}

- (CCUIControlTemplateView)_templateView
{
  CCUIButtonModuleView *buttonModuleView;
  uint64_t v3;
  CCUIButtonModuleView *v4;
  CCUIButtonModuleView *v5;
  CCUIButtonModuleView *v6;

  buttonModuleView = self->_buttonModuleView;
  v3 = objc_opt_class();
  v4 = buttonModuleView;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return (CCUIControlTemplateView *)v6;
}

- (void)_applyCompactContinuousCornerRadius
{
  -[CCUIButtonModuleViewController compactContinuousCornerRadius](self, "compactContinuousCornerRadius");
  -[CCUIButtonModuleViewController _applyContinuousCornerRadius:](self, "_applyContinuousCornerRadius:");
}

- (void)_updateSelected
{
  -[CCUIButtonModuleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[CCUIButtonModuleView setSelected:](self->_buttonModuleView, "setSelected:", -[CCUIButtonModuleViewController appearsSelected](self, "appearsSelected"));
  -[CCUIButtonModuleViewController _updateValueText](self, "_updateValueText");
}

- (void)_updateValueText
{
  void *v3;
  id v4;

  if (-[CCUIButtonModuleViewController appearsSelected](self, "appearsSelected"))
    -[CCUIButtonModuleViewController selectedValueText](self, "selectedValueText");
  else
    -[CCUIButtonModuleViewController valueText](self, "valueText");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v4);

}

- (void)_applyContinuousCornerRadius:(double)a3
{
  void *v5;
  id v6;

  -[CCUIButtonModuleViewController _templateView](self, "_templateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setContinuousCornerRadius:", a3);
  else
    -[CCUIButtonModuleView _setContinuousCornerRadius:](self->_buttonModuleView, "_setContinuousCornerRadius:", a3);

}

- (NSString)valueText
{
  return self->_valueText;
}

- (NSString)selectedValueText
{
  return self->_selectedValueText;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValueText, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_buttonModuleView, 0);
}

@end
