@implementation AXCCTextSizeModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (AXCCTextSizeModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AXCCTextSizeModuleViewController *v4;
  AXCCTextSizeDetailViewController *v5;
  AXCCTextSizeDetailViewController *detailController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeModuleViewController;
  v4 = -[CCUIButtonModuleViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(AXCCTextSizeDetailViewController);
    detailController = v4->_detailController;
    v4->_detailController = v5;

  }
  return v4;
}

- (void)setHelper:(id)a3
{
  uint64_t v3;

  objc_msgSend_setHelper_(self->_detailController, a2, (uint64_t)a3, v3);
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id from;
  id location;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)AXCCTextSizeModuleViewController;
  -[CCUISliderButtonModuleViewController viewDidLoad](&v55, sel_viewDidLoad);
  objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x24BEBD660], v3, 5, v4, 27.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x24BEBD640], v6, (uint64_t)CFSTR("textformat.size"), (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphImage_(self, v8, (uint64_t)v7, v9);
  objc_msgSend_view(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_buttonView(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addChildViewController_(self, v18, (uint64_t)self->_detailController, v19);
  objc_msgSend_view(self->_detailController, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v13, v24, v25, v26);
  objc_msgSend_setFrame_(v23, v27, v28, v29);

  objc_msgSend_didMoveToParentViewController_(self->_detailController, v30, (uint64_t)self, v31);
  objc_msgSend_slider(self->_detailController, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  AXCCLocalizedString(CFSTR("text.size.label"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(v35, v37, (uint64_t)v36, v38);

  objc_msgSend_setIsAccessibilityElement_(v17, v39, 1, v40);
  AXCCLocalizedString(CFSTR("text.size.label"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(v17, v42, (uint64_t)v41, v43);

  objc_msgSend_setAccessibilityTraits_(v17, v44, *MEMORY[0x24BEBDF00], v45);
  objc_msgSend_setAccessibilityIdentifier_(v17, v46, (uint64_t)CFSTR("text-size"), v47);
  objc_initWeak(&location, v17);
  objc_initWeak(&from, self);
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = sub_230F81F48;
  v50[3] = &unk_24FFC4390;
  objc_copyWeak(&v51, &location);
  objc_copyWeak(&v52, &from);
  objc_msgSend_setAccessibilityPathBlock_(v17, v48, (uint64_t)v50, v49);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;
  double v12;
  double v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXCCTextSizeModuleViewController;
  -[CCUISliderButtonModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230F820D8;
  v10[3] = &unk_24FFC43F8;
  v12 = width;
  v13 = height;
  v10[4] = self;
  v11 = v7;
  v8 = v7;
  objc_msgSend_animateAlongsideTransition_completion_(v8, v9, (uint64_t)&unk_24FFC43D0, (uint64_t)v10);

}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t isExpanded;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeModuleViewController;
  -[CCUISliderButtonModuleViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  isExpanded = objc_msgSend_isExpanded(self, v3, v4, v5);
  objc_msgSend_beginAppearanceTransition_animated_(self->_detailController, v7, isExpanded, 1);
}

- (id)createSliderView
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_slider(self->_detailController, a2, v2, v3);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_textSizeDelegate(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expandModule(v7, v4, v5, v6);

}

- (id)_accessibilityControlCenterButtonLabel
{
  return AXCCLocalizedString(CFSTR("text.size.label"));
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return CFSTR("text-size");
}

- (AXCCTextSizeModuleViewControllerDelegate)textSizeDelegate
{
  return (AXCCTextSizeModuleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_textSizeDelegate);
}

- (void)setTextSizeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textSizeDelegate, a3);
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
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
  objc_storeStrong((id *)&self->_helper, 0);
  objc_destroyWeak((id *)&self->_textSizeDelegate);
  objc_storeStrong((id *)&self->_detailController, 0);
}

@end
