@implementation AXCCTextSizeModule

- (AXCCTextSizeModule)init
{
  AXCCTextSizeModule *v2;
  AXCCTextSizeHelper *v3;
  AXCCTextSizeHelper *helper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXCCTextSizeModule;
  v2 = -[AXCCTextSizeModule init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AXCCTextSizeHelper);
    helper = v2->_helper;
    v2->_helper = v3;

  }
  return v2;
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __objc2_class *v8;
  id v9;
  const char *v10;
  CCUIContentModuleContentViewController *v11;
  CCUIContentModuleContentViewController *contentViewController;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  CCUIContentModuleContentViewController *v23;

  v4 = a3;
  if (_os_feature_enabled_impl() && objc_msgSend_environment(v4, v5, v6, v7) != 1)
    v8 = AXCCTextSizeSliderModuleViewController;
  else
    v8 = AXCCTextSizeModuleViewController;
  v9 = [v8 alloc];
  v11 = (CCUIContentModuleContentViewController *)objc_msgSend_initWithNibName_bundle_(v9, v10, 0, 0);
  contentViewController = self->_contentViewController;
  self->_contentViewController = v11;

  objc_msgSend_contentModuleContext(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentModuleContext_(self->_contentViewController, v17, (uint64_t)v16, v18);

  objc_msgSend_setTextSizeDelegate_(self->_contentViewController, v19, (uint64_t)self, v20);
  objc_msgSend_setHelper_(self->_contentViewController, v21, (uint64_t)self->_helper, v22);
  v23 = self->_contentViewController;

  return v23;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __objc2_class *v8;
  id v9;
  const char *v10;
  AXCCTextSizeBackgroundViewControllerBase *v11;
  AXCCTextSizeBackgroundViewControllerBase *bgController;
  const char *v13;
  uint64_t v14;
  AXCCTextSizeBackgroundViewControllerBase *v15;

  v4 = a3;
  if (_os_feature_enabled_impl() && objc_msgSend_environment(v4, v5, v6, v7) != 1)
    v8 = AXCCTextSizeSliderBackgroundViewController;
  else
    v8 = AXCCTextSizeBackgroundViewController;
  v9 = [v8 alloc];
  v11 = (AXCCTextSizeBackgroundViewControllerBase *)objc_msgSend_initWithNibName_bundle_(v9, v10, 0, 0);
  bgController = self->_bgController;
  self->_bgController = v11;

  objc_msgSend_setHelper_(self->_bgController, v13, (uint64_t)self->_helper, v14);
  v15 = self->_bgController;

  return v15;
}

- (unint64_t)supportedGridSizeClasses
{
  return 3;
}

- (void)expandModule
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_contentModuleContext(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule(v7, v4, v5, v6);

}

- (void)moduleDidExpand
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_moduleDidExpand(self->_bgController, a2, v2, v3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_bgController, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
