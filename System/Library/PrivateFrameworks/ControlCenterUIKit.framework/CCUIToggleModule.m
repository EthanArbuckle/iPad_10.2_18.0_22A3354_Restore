@implementation CCUIToggleModule

- (NSString)title
{
  NSString *displayName;
  void *v4;
  NSString *v5;
  NSString *v6;

  displayName = self->_displayName;
  if (!displayName)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "ccui_bundleForModuleInstance:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ccui_displayName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_displayName;
    self->_displayName = v5;

    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)valueText
{
  return -[CCUIButtonModuleViewController valueText](self->_contentViewController, "valueText");
}

- (NSString)selectedValueText
{
  return -[CCUIButtonModuleViewController selectedValueText](self->_contentViewController, "selectedValueText");
}

- (BOOL)isSelected
{
  return 0;
}

- (BOOL)appearsSelected
{
  return -[CCUIButtonModuleViewController appearsSelected](self->_contentViewController, "appearsSelected");
}

- (UIImage)iconGlyph
{
  return 0;
}

- (UIImage)selectedIconGlyph
{
  return 0;
}

- (UIColor)selectedColor
{
  return 0;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return 0;
}

- (NSString)glyphState
{
  return 0;
}

- (double)glyphScale
{
  return 1.0;
}

- (void)refreshStateAnimated:(BOOL)a3
{
  -[CCUIToggleViewController refreshStateAnimated:](self->_contentViewController, "refreshStateAnimated:", a3);
}

- (void)reconfigureView
{
  -[CCUIToggleViewController reconfigureView](self->_contentViewController, "reconfigureView");
}

- (id)contentViewControllerForContext:(id)a3
{
  CCUIToggleViewController *v4;

  v4 = objc_alloc_init(CCUIToggleViewController);
  -[CCUIToggleViewController setModule:](v4, "setModule:", self);
  objc_storeStrong((id *)&self->_contentViewController, v4);
  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)refreshState
{
  -[CCUIToggleModule refreshStateAnimated:](self, "refreshStateAnimated:", 0);
}

- (UIImageView)glyphImageView
{
  void *v2;
  void *v3;

  -[CCUIButtonModuleViewController buttonView](self->_contentViewController, "buttonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glyphImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
