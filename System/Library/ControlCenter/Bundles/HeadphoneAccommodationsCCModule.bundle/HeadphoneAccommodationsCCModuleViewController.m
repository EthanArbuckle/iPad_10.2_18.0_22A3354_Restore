@implementation HeadphoneAccommodationsCCModuleViewController

- (HeadphoneAccommodationsCCModuleViewController)init
{
  HeadphoneAccommodationsCCModuleViewController *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  HACCShortcutViewController *shortcutController;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HeadphoneAccommodationsCCModuleViewController;
  v2 = -[HeadphoneAccommodationsCCModuleViewController init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE4BDE8]);
    v5 = objc_msgSend_initWithDelegate_andAvailableModules_(v3, v4, (uint64_t)v2, (uint64_t)&unk_2503FB638);
    shortcutController = v2->_shortcutController;
    v2->_shortcutController = (HACCShortcutViewController *)v5;

    objc_msgSend_setPrefersContentToAlwaysExpand_(v2->_shortcutController, v7, 1, v8);
    objc_msgSend_addChildViewController_(v2, v9, (uint64_t)v2->_shortcutController, v10);
    objc_msgSend_didMoveToParentViewController_(v2->_shortcutController, v11, (uint64_t)v2, v12);
    objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x24BDF6AE0], v13, 3, v14, 30.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x24BDF6AC8], v16, (uint64_t)CFSTR("apple.hearing.aid"), (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphImage_(v2, v18, (uint64_t)v17, v19);

  }
  return v2;
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id location;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)HeadphoneAccommodationsCCModuleViewController;
  -[CCUIButtonModuleViewController viewDidLoad](&v37, sel_viewDidLoad);
  objc_msgSend_view(self, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(self->_shortcutController, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSubview_(v6, v11, (uint64_t)v10, v12);

  objc_initWeak(&location, self);
  objc_msgSend_buttonView(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  paLocString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(v16, v18, (uint64_t)v17, v19);

  objc_msgSend_buttonView(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityIdentifier_(v23, v24, (uint64_t)CFSTR("AX_HEADPHONE_ACCOMMODATIONS"), v25);

  objc_msgSend_buttonView(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityHint_(v29, v31, (uint64_t)v30, v32);

  paLocString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(self, v34, (uint64_t)v33, v35);

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
  v15.super_class = (Class)HeadphoneAccommodationsCCModuleViewController;
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)shortcutViewController
{
  return self->_shortcutController;
}

- (double)preferredExpandedContentHeight
{
  uint64_t v2;
  uint64_t v3;
  double result;

  objc_msgSend_preferredExpandedContentHeight(self->_shortcutController, a2, v2, v3);
  return result;
}

- (void)setContentModuleContext:(id)a3
{
  uint64_t v3;

  objc_msgSend_setContentModuleContext_(self->_shortcutController, a2, (uint64_t)a3, v3);
}

- (void)expandModule
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_contentModuleContext(self->_shortcutController, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestExpandModule(v7, v4, v5, v6);

}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_expandModule, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutController, 0);
}

@end
