@implementation CCUILowPowerModule

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (id)contentViewControllerForContext:(id)a3
{
  CCUILowPowerModuleViewController *v4;

  v4 = objc_alloc_init(CCUILowPowerModuleViewController);
  -[CCUIMenuModuleViewController setContentModuleContext:](v4, "setContentModuleContext:", self->_contentModuleContext);
  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
