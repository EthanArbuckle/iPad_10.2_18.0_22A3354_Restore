@implementation AXLiveListenContentModule

- (BOOL)isEnabled
{
  return 1;
}

- (id)contentViewControllerForContext:(id)a3
{
  AXLiveListenModuleViewController *moduleViewController;
  AXLiveListenModuleViewController *v5;
  AXLiveListenModuleViewController *v6;
  void *v7;

  moduleViewController = self->_moduleViewController;
  if (!moduleViewController)
  {
    v5 = objc_alloc_init(AXLiveListenModuleViewController);
    v6 = self->_moduleViewController;
    self->_moduleViewController = v5;

    moduleViewController = self->_moduleViewController;
  }
  -[AXLiveListenContentModule contentModuleContext](self, "contentModuleContext", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLiveListenModuleViewController setContentModuleContext:](moduleViewController, "setContentModuleContext:", v7);

  return self->_moduleViewController;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
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
  objc_storeStrong((id *)&self->_moduleViewController, 0);
}

@end
