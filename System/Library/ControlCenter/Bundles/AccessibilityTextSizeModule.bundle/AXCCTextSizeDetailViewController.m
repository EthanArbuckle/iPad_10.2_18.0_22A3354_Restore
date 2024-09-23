@implementation AXCCTextSizeDetailViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CCUISteppedSliderView *v7;
  CCUISteppedSliderView *slider;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  UISelectionFeedbackGenerator *v15;
  UISelectionFeedbackGenerator *selectionFeedback;
  id v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *contentSizeCategories;

  v3 = objc_alloc(MEMORY[0x24BE19B80]);
  v7 = (CCUISteppedSliderView *)objc_msgSend_initWithFrame_(v3, v4, v5, v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  slider = self->_slider;
  self->_slider = v7;

  objc_msgSend_setGlyphVisible_(self->_slider, v9, 0, v10);
  objc_msgSend_setView_(self, v11, (uint64_t)self->_slider, v12);
  objc_msgSend_addTarget_action_forControlEvents_(self->_slider, v13, (uint64_t)self, (uint64_t)sel__sliderValueDidChange_, 4096);
  objc_msgSend_addTarget_action_forControlEvents_(self->_slider, v14, (uint64_t)self, (uint64_t)sel__sliderValueDidCommit_, 0x40000);
  v15 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBD940]);
  selectionFeedback = self->_selectionFeedback;
  self->_selectionFeedback = v15;

  v17 = objc_alloc(MEMORY[0x24BDBCE30]);
  v19 = (NSArray *)objc_msgSend_initWithObjects_(v17, (const char *)*MEMORY[0x24BEBE058], *MEMORY[0x24BEBE0A8], v18, *MEMORY[0x24BEBE0D0], *MEMORY[0x24BEBE0C0], *MEMORY[0x24BEBE0B8], *MEMORY[0x24BEBE0A0], *MEMORY[0x24BEBE098], *MEMORY[0x24BEBE090], *MEMORY[0x24BEBE078], *MEMORY[0x24BEBE070], *MEMORY[0x24BEBE068], *MEMORY[0x24BEBE060], *MEMORY[0x24BEBE058], 0);
  contentSizeCategories = self->_contentSizeCategories;
  self->_contentSizeCategories = v19;

}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeDetailViewController;
  -[AXCCTextSizeDetailViewController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLoad
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  objc_msgSend__refreshTextSizes(self, a2, v2, v3);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)self, (uint64_t)sel_sizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  v10.receiver = self;
  v10.super_class = (Class)AXCCTextSizeDetailViewController;
  -[AXCCTextSizeDetailViewController viewDidLoad](&v10, sel_viewDidLoad);
}

- (void)beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (a3)
    objc_msgSend__refreshTextSizes(self, a2, a3, a4);
  v7.receiver = self;
  v7.super_class = (Class)AXCCTextSizeDetailViewController;
  -[AXCCTextSizeDetailViewController beginAppearanceTransition:animated:](&v7, sel_beginAppearanceTransition_animated_, v5, v4);
}

- (void)endTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230F80314;
  block[3] = &unk_24FFC4368;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  objc_msgSend__refreshTextSizes(self, a2, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)AXCCTextSizeDetailViewController;
  -[AXCCTextSizeDetailViewController viewWillAppear:](&v6, sel_viewWillAppear_, v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  objc_msgSend__commitTextSizeIfNeeded(self, a2, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)AXCCTextSizeDetailViewController;
  -[AXCCTextSizeDetailViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v4);
}

- (CCUISteppedSliderView)slider
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_loadViewIfNeeded(self, a2, v2, v3);
  return self->_slider;
}

- (void)setHelper:(id)a3
{
  void **p_helper;
  const char *v6;
  uint64_t v7;
  id v8;

  p_helper = (void **)&self->_helper;
  objc_storeStrong((id *)&self->_helper, a3);
  v8 = a3;
  objc_msgSend_setDelegate_(*p_helper, v6, (uint64_t)self, v7);

}

- (void)_refreshTextSizes
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend__commitTextSizeIfNeeded(self, a2, v2, v3);
  objc_msgSend_refreshAppInfo(self->_helper, v5, v6, v7);
  objc_msgSend_refreshCategoryName(self->_helper, v8, v9, v10);
  MEMORY[0x24BEDD108](self, sel__setupSlider, v11, v12);
}

- (void)_setupSlider
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  NSArray *contentSizeCategories;
  void *v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  NSArray *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  char *v26;

  objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  v5 = (const char *)objc_claimAutoreleasedReturnValue();
  contentSizeCategories = self->_contentSizeCategories;
  v8 = (void *)*MEMORY[0x24BEBE0B8];
  v26 = (char *)v5;
  if (v5)
    v9 = objc_msgSend_indexOfObject_(contentSizeCategories, v5, (uint64_t)v5, v6);
  else
    v9 = objc_msgSend_indexOfObject_(contentSizeCategories, 0, (uint64_t)v8, v6);
  self->_selectedCategoryIndex = v9;
  if (objc_msgSend_state(self->_helper, v10, v11, v12) == 3)
  {
    v16 = CFPreferencesGetAppBooleanValue(CFSTR("largeTextUsesExtendedRange"), CFSTR("com.apple.preferences-framework"), 0) != 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.preferences-framework"));
  }
  else
  {
    v16 = 1;
  }
  if (!v26)
    v26 = v8;
  v17 = self->_contentSizeCategories;
  if (v16)
    v19 = objc_msgSend_count(v17, v13, v14, v15) - 1;
  else
    v19 = objc_msgSend_indexOfObject_(v17, v13, *MEMORY[0x24BEBE090], v15);
  objc_msgSend_setNumberOfSteps_(self->_slider, v18, v19, v20);
  v23 = objc_msgSend_indexOfObject_(self->_contentSizeCategories, v21, (uint64_t)v26, v22);
  objc_msgSend_setStep_(self->_slider, v24, (unint64_t)(double)(unint64_t)v23, v25);

}

- (void)_sliderValueDidChange:(id)a3
{
  uint64_t v3;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend_step(a3, a2, (uint64_t)a3, v3);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = v5;
    if (v5 < objc_msgSend_count(self->_contentSizeCategories, v6, v7, v8))
    {
      AXLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v11, v9, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v13;
        _os_log_impl(&dword_230F7C000, v10, OS_LOG_TYPE_INFO, "Setting new text size change: %@", (uint8_t *)&v32, 0xCu);

      }
      if (self->_selectedCategoryIndex != v9)
      {
        self->_selectedCategoryIndex = v9;
        objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v14, v9, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCategoryName_(self->_helper, v17, (uint64_t)v16, v18);

        self->_selectedCategoryIndexNeedsCommit = 1;
        objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v23, v9, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_postNotificationName_object_(v22, v26, (uint64_t)CFSTR("AXCCInternalTextSizeDidUpdate"), (uint64_t)v25);

        if (v9 == objc_msgSend_indexOfObject_(self->_contentSizeCategories, v27, *MEMORY[0x24BEBE0B8], v28))
          objc_msgSend_selectionChanged(self->_selectionFeedback, v29, v30, v31);
      }
    }
  }
}

- (void)_commitTextSizeIfNeeded
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (self->_selectedCategoryIndexNeedsCommit)
  {
    self->_selectedCategoryIndexNeedsCommit = 0;
    objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, a2, self->_selectedCategoryIndex, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCategoryName_(self->_helper, v5, (uint64_t)v4, v6);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BED26D0], 0, 0, 1u);
  }
}

- (void)perAppTextSizeToggled
{
  ((void (*)(AXCCTextSizeDetailViewController *, char *))MEMORY[0x24BEDD108])(self, sel__setupSlider);
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_selectionFeedback, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
}

@end
