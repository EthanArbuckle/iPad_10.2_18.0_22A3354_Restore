@implementation CCUIPerformanceTraceModule

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (id)contentViewControllerForContext:(id)a3
{
  CCUIPerformanceTraceModuleViewController *viewController;
  CCUIPerformanceTraceModuleViewController *v5;
  void *v6;
  void *v7;
  CCUIPerformanceTraceModuleViewController *v8;
  CCUIPerformanceTraceModuleViewController *v9;

  viewController = self->_viewController;
  if (!viewController)
  {
    v5 = objc_alloc_init(CCUIPerformanceTraceModuleViewController);
    objc_msgSend(MEMORY[0x24BDD1488], "ccui_bundleForModuleInstance:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ccui_displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIButtonModuleViewController setTitle:](v5, "setTitle:", v7);

    v8 = self->_viewController;
    self->_viewController = v5;
    v9 = v5;

    -[CCUIPerformanceTraceModuleViewController setContentModuleContext:](self->_viewController, "setContentModuleContext:", self->_contentModuleContext);
    viewController = self->_viewController;
  }
  return viewController;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (CCUIPerformanceTraceModuleViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
