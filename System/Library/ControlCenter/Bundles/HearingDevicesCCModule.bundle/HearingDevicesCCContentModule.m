@implementation HearingDevicesCCContentModule

- (BOOL)isEnabled
{
  return 1;
}

- (id)contentViewControllerForContext:(id)a3
{
  uint64_t v3;
  HearingDevicesCCModuleViewController *moduleViewController;
  HearingDevicesCCModuleViewController *v6;
  HearingDevicesCCModuleViewController *v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  moduleViewController = self->_moduleViewController;
  if (!moduleViewController)
  {
    v6 = objc_alloc_init(HearingDevicesCCModuleViewController);
    v7 = self->_moduleViewController;
    self->_moduleViewController = v6;

    moduleViewController = self->_moduleViewController;
  }
  objc_msgSend_contentModuleContext(self, a2, (uint64_t)a3, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentModuleContext_(moduleViewController, v9, (uint64_t)v8, v10);

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
