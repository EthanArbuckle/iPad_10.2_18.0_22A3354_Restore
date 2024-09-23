@implementation CCUIFlashlightModule

- (id)contentViewControllerForContext:(id)a3
{
  CCUIFlashlightModuleViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CCUIFlashlightModuleViewController **p_viewController;
  CCUIFlashlightModuleViewController *viewController;

  v4 = objc_alloc_init(CCUIFlashlightModuleViewController);
  objc_msgSend(MEMORY[0x24BDD1488], "ccui_bundleForModuleInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ccui_displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setTitle:](v4, "setTitle:", v6);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("flashlight.off.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setGlyphImage:](v4, "setGlyphImage:", v7);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("flashlight.on.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphImage:](v4, "setSelectedGlyphImage:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "systemIndigoColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedGlyphColor:](v4, "setSelectedGlyphColor:", v9);

  viewController = self->_viewController;
  p_viewController = &self->_viewController;
  if (!viewController)
    objc_storeStrong((id *)p_viewController, v4);
  return v4;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  CCUIFlashlightBackgroundViewController *v4;
  CCUIFlashlightBackgroundViewController **p_backgroundViewController;
  CCUIFlashlightBackgroundViewController *backgroundViewController;

  v4 = objc_alloc_init(CCUIFlashlightBackgroundViewController);
  backgroundViewController = self->_backgroundViewController;
  p_backgroundViewController = &self->_backgroundViewController;
  if (!backgroundViewController)
    objc_storeStrong((id *)p_backgroundViewController, v4);
  return v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  return (CCUIContentModuleContentViewController *)self->_viewController;
}

- (CCUIContentModuleBackgroundViewController)backgroundViewController
{
  return (CCUIContentModuleBackgroundViewController *)self->_backgroundViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
