@implementation TUIKeyboardBrightnessModule

- (id)contentViewControllerForContext:(id)a3
{
  TUIKeyboardBrightnessModuleViewController *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  v4 = objc_alloc_init(TUIKeyboardBrightnessModuleViewController);
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForInfoDictionaryKey_(v10, v11, *MEMORY[0x24BDBD1D0], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v4, v15, (uint64_t)v14, v16, v17);

  v18 = (void *)MEMORY[0x24BDF6AC8];
  v19 = (void *)MEMORY[0x24BDD1488];
  v20 = objc_opt_class();
  objc_msgSend_bundleForClass_(v19, v21, v20, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(v18, v25, (uint64_t)CFSTR("KeyboardBrightness"), (uint64_t)v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphImage_(v4, v28, (uint64_t)v27, v29, v30);

  objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelectedGlyphColor_(v4, v36, (uint64_t)v35, v37, v38);

  objc_storeStrong((id *)&self->_viewController, v4);
  return v4;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  TUIKeyboardBrightnessBackgroundViewController *v4;

  v4 = objc_alloc_init(TUIKeyboardBrightnessBackgroundViewController);
  objc_storeStrong((id *)&self->_backgroundViewController, v4);
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
