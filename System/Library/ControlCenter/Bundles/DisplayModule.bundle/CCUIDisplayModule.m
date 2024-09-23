@implementation CCUIDisplayModule

- (id)contentViewControllerForContext:(id)a3
{
  id v4;
  CCUIDisplayModuleViewController *v5;
  const char *v6;
  CCUIDisplayModuleViewController *v7;
  CCUIDisplayModuleViewController *moduleViewController;
  const char *v9;
  CCUIDisplayModuleViewController *v10;
  const char *v11;
  void *v12;
  const char *v13;
  CCUIDisplayModuleViewController *v14;
  const char *v15;
  uint64_t v16;
  float v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;

  v4 = a3;
  v5 = [CCUIDisplayModuleViewController alloc];
  v7 = (CCUIDisplayModuleViewController *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  moduleViewController = self->_moduleViewController;
  self->_moduleViewController = v7;

  objc_msgSend_setGlyphShouldBeTinted_(self->_moduleViewController, v9, 1);
  v10 = self->_moduleViewController;
  objc_msgSend__brightnessGlyphPackageDescriptionForContext_(self, v11, (uint64_t)v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setGlyphPackageDescription_(v10, v13, (uint64_t)v12);
  v14 = self->_moduleViewController;
  objc_msgSend_currentBrightness(v14, v15, v16);
  objc_msgSend__brightnessGlyphStateForBrightnessLevel_(self, v18, v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphState_(v14, v21, (uint64_t)v20);

  objc_msgSend_setDelegate_(self->_moduleViewController, v22, (uint64_t)self);
  return self->_moduleViewController;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4;
  CCUIDisplayBackgroundViewController *v5;
  const char *v6;
  CCUIDisplayBackgroundViewController *v7;
  CCUIDisplayBackgroundViewController *backgroundViewController;
  CCUIDisplayBackgroundViewController *v9;
  const char *v10;
  void *v11;
  const char *v12;
  CCUIDisplayBackgroundViewController *v13;
  const char *v14;
  uint64_t v15;
  float v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = a3;
  v5 = [CCUIDisplayBackgroundViewController alloc];
  v7 = (CCUIDisplayBackgroundViewController *)objc_msgSend_initWithNibName_bundle_(v5, v6, 0, 0);
  backgroundViewController = self->_backgroundViewController;
  self->_backgroundViewController = v7;

  v9 = self->_backgroundViewController;
  objc_msgSend__brightnessGlyphPackageDescriptionForContext_(self, v10, (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setHeaderGlyphPackageDescription_(v9, v12, (uint64_t)v11);
  v13 = self->_backgroundViewController;
  objc_msgSend_currentBrightness(self->_moduleViewController, v14, v15);
  objc_msgSend__brightnessGlyphStateForBrightnessLevel_(self, v17, v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeaderGlyphState_(v13, v20, (uint64_t)v19);

  return self->_backgroundViewController;
}

- (unint64_t)supportedGridSizeClasses
{
  return 2;
}

- (void)displayModuleViewController:(id)a3 brightnessDidChange:(float)a4
{
  const char *v5;
  const char *v6;
  id v7;

  objc_msgSend__brightnessGlyphStateForBrightnessLevel_(self, a2, (uint64_t)a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphState_(self->_moduleViewController, v5, (uint64_t)v7);
  objc_msgSend_setHeaderGlyphState_(self->_backgroundViewController, v6, (uint64_t)v7);

}

- (id)_brightnessGlyphPackageDescriptionForContext:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BE19B00];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("Brightness"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_brightnessGlyphStateForBrightnessLevel:(double)a3
{
  const __CFString *v4;

  if (a3 < 0.33)
    return CFSTR("min");
  if (a3 >= 1.0)
    v4 = CFSTR("max");
  else
    v4 = CFSTR("full");
  if (a3 >= 0.66)
    return (id)v4;
  else
    return CFSTR("mid");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_moduleViewController, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
