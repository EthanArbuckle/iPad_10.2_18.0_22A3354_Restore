@implementation AXHeadphoneLevelsModuleViewController

- (AXHeadphoneLevelsModuleViewController)init
{
  AXHeadphoneLevelsModuleViewController *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  HACCShortcutViewController *shortcutController;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AXHeadphoneLevelsModuleViewController;
  v2 = -[AXHeadphoneLevelsModuleViewController init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE4BDE8]);
    v5 = objc_msgSend_initWithDelegate_andAvailableModules_(v3, v4, (uint64_t)v2, (uint64_t)&unk_2503F89D8);
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v5;

    objc_msgSend_setPrefersContentToAlwaysExpand_(v2->_shortcutController, v7, 1, v8);
    objc_msgSend__systemImageNamed_(MEMORY[0x24BDF6AC8], v9, (uint64_t)CFSTR("slider.horizontal.below.waveform"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_configurationWithPointSize_(MEMORY[0x24BDF6AE0], v12, v13, v14, 30.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingSymbolConfiguration_(v11, v16, (uint64_t)v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphImage_(v2, v19, (uint64_t)v18, v20);

    objc_msgSend_addChildViewController_(v2, v21, (uint64_t)v2->_shortcutController, v22);
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  id location;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)AXHeadphoneLevelsModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v43, sel_viewDidLoad);
  objc_msgSend_view(self, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v6, v11, (uint64_t)v10, v12);

  hearingLocString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(self, v14, (uint64_t)v13, v15);

  objc_initWeak(&location, self);
  objc_msgSend_buttonView(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityTraits_(v19, v20, *MEMORY[0x24BDF73B0], v21);

  objc_msgSend_buttonView(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  hearingLocString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(v25, v27, (uint64_t)v26, v28);

  objc_msgSend_buttonView(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityIdentifier_(v32, v33, (uint64_t)CFSTR("AX_HEADPHONE_LEVELS"), v34);

  objc_msgSend_buttonView(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityHint_(v38, v40, (uint64_t)v39, v41);

  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int isExpanded;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXHeadphoneLevelsModuleViewController;
  -[CCUIButtonModuleViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (isExpanded)
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 1.0);
  else
    objc_msgSend_setAlpha_(v10, v11, v12, v13, 0.0);

}

- (BOOL)canDismissPresentedContent
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_expandedController(self->_shortcutController, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)shortcutDidChangeSize:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_view(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v5, v6, v7, v8);
  objc_msgSend_preferredExpandedContentHeight(self, v9, v10, v11);

  if (objc_msgSend_isExpanded(self, v12, v13, v14))
    MEMORY[0x24BEDD108](self, sel_setPreferredContentSize_, v15, v16);
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  HAInitializeLogging();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("Dismissing Control Center"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("%s:%d %@"), v11, "-[AXHeadphoneLevelsModuleViewController dismissPresentedContentAnimated:completion:]", 99, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v25 = objc_msgSend_UTF8String(v14, v16, v17, v18);
    _os_log_impl(&dword_232BF5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend_presentedViewController(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dismissViewControllerAnimated_completion_(v22, v23, v4, (uint64_t)v6);

}

- (double)preferredExpandedContentHeight
{
  uint64_t v2;
  uint64_t v3;
  double result;

  objc_msgSend_preferredExpandedContentHeight(self->_shortcutController, a2, v2, v3);
  return result;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (void)setContentModuleContext:(id)a3
{
  uint64_t v3;

  objc_msgSend_setContentModuleContext_(self->_shortcutController, a2, (uint64_t)a3, v3);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_headphoneLevelsIconButtonTapped, a3, a4);
}

- (void)headphoneLevelsIconButtonTapped
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  objc_msgSend_contentModuleContext(self->_shortcutController, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule(v4, v5, v6, v7);

  AXLogAggregate();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_232BF5000, v8, OS_LOG_TYPE_INFO, "Live headphone level opened", v9, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end
