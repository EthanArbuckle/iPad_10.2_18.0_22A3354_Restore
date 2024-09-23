@implementation AXCCTextSizeSliderModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
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

- (void)_updateTintColor
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;

  objc_msgSend_configurationWithPointSize_weight_(MEMORY[0x24BEBD660], a2, 6, v2, 25.0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (self->gridSizeClass == 1)
    objc_msgSend_systemBlueColor(MEMORY[0x24BEBD4B8], v4, v5, v6);
  else
    objc_msgSend_systemWhiteColor(MEMORY[0x24BEBD4B8], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemImageNamed_withConfiguration_(MEMORY[0x24BEBD640], v8, (uint64_t)CFSTR("textformat.size"), (uint64_t)v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGlyphImage_(self->_sliderView, v10, (uint64_t)v9, v11);

  objc_msgSend_setGlyphTintColor_(self->_sliderView, v12, (uint64_t)v7, v13);
}

- (void)loadView
{
  id v3;
  uint64_t v4;
  NSArray *v5;
  NSArray *contentSizeCategories;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CCUISteppedSliderView *v11;
  CCUISteppedSliderView *sliderView;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  CCUISteppedSliderView *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;

  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  v5 = (NSArray *)objc_msgSend_initWithObjects_(v3, (const char *)*MEMORY[0x24BEBE058], *MEMORY[0x24BEBE0A8], v4, *MEMORY[0x24BEBE0D0], *MEMORY[0x24BEBE0C0], *MEMORY[0x24BEBE0B8], *MEMORY[0x24BEBE0A0], *MEMORY[0x24BEBE098], *MEMORY[0x24BEBE090], *MEMORY[0x24BEBE078], *MEMORY[0x24BEBE070], *MEMORY[0x24BEBE068], *MEMORY[0x24BEBE060], *MEMORY[0x24BEBE058], 0);
  contentSizeCategories = self->_contentSizeCategories;
  self->_contentSizeCategories = v5;

  v7 = objc_alloc(MEMORY[0x24BE19B80]);
  v11 = (CCUISteppedSliderView *)objc_msgSend_initWithFrame_(v7, v8, v9, v10, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  sliderView = self->_sliderView;
  self->_sliderView = v11;

  objc_msgSend__refreshTextSizes(self, v13, v14, v15);
  objc_msgSend_updateWithCurrentTextSize_(self, v16, 0, v17);
  objc_msgSend__updateSliderControlInteractionEnabled(self, v18, v19, v20);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v21, (uint64_t)self, (uint64_t)sel__sliderValueDidChange_, 4096);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v22, (uint64_t)self, (uint64_t)sel__sliderValueDidCommit_, 0x40000);
  objc_msgSend__updateTintColor(self, v23, v24, v25);
  if (!self->gridSizeClass)
    objc_msgSend_setUserInteractionEnabled_(self->_sliderView, v26, 0, v27);
  v28 = self->_sliderView;
  AXCCLocalizedString(CFSTR("text.size.label"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccessibilityLabel_(v28, v30, (uint64_t)v29, v31);

  objc_msgSend_setInteractiveWhenUnexpanded_(self->_sliderView, v32, 1, v33);
  objc_msgSend_setView_(self, v34, (uint64_t)self->_sliderView, v35);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXCCTextSizeSliderModuleViewController;
  -[AXCCTextSizeSliderModuleViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  objc_msgSend__updateSliderControlInteractionEnabled(self, v4, v5, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXCCTextSizeSliderModuleViewController;
  -[AXCCTextSizeSliderModuleViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  objc_msgSend__refreshTextSizes(self, v4, v5, v6);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v10, v11, (uint64_t)self, (uint64_t)sel_sizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  objc_msgSend__updateSliderControlInteractionEnabled(self, v12, v13, v14);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_230F88FB0;
  v5[3] = &unk_24FFC45E0;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230F89004;
  v4[3] = &unk_24FFC45E0;
  objc_msgSend_animateAlongsideTransition_completion_(a4, a2, (uint64_t)v5, (uint64_t)v4);
}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXCCTextSizeSliderModuleViewController;
  -[AXCCTextSizeSliderModuleViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  if (self->_expanded)
    objc_msgSend_preferredExpandedContinuousCornerRadius(self, v3, v4, v5);
  else
    objc_msgSend_compactContinuousCornerRadius(self, v3, v4, v5);
  objc_msgSend_setContinuousSliderCornerRadius_(self->_sliderView, v6, v7, v8);
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return !self->_expanded && self->gridSizeClass == 0;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    objc_msgSend_viewIfLoaded(self, a2, v3, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNeedsLayout(v8, v5, v6, v7);

  }
}

- (void)_updateSliderControlValueVisible
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_expanded)
    objc_msgSend_setValueVisible_(self->_sliderView, a2, 1, v2);
  else
    objc_msgSend_setValueVisible_(self->_sliderView, a2, self->gridSizeClass != 0, v2);
  objc_msgSend__updateTintColor(self, v4, v5, v6);
}

- (void)_updateSliderControlInteractionEnabled
{
  uint64_t v2;
  uint64_t v3;
  CCUISteppedSliderView *sliderView;
  uint64_t isAppearingOrAppeared;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sliderView = self->_sliderView;
  if (self->gridSizeClass)
  {
    isAppearingOrAppeared = objc_msgSend_bs_isAppearingOrAppeared(self, a2, v2, v3);
    objc_msgSend_setUserInteractionEnabled_(sliderView, v7, isAppearingOrAppeared, v8);
  }
  else
  {
    objc_msgSend_setUserInteractionEnabled_(sliderView, a2, 0, v3);
  }
  MEMORY[0x24BEDD108](self, sel__updateSliderControlValueVisible, v9, v10);
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  self->_expanded = a3;
  objc_msgSend__refreshTextSizes(self, a2, a3, v3);
  objc_msgSend_setGlyphVisible_(self->_sliderView, v6, !v4, v7);
  objc_msgSend_setUserInteractionEnabled_(self->_sliderView, v8, 0, v9);
  MEMORY[0x24BEDD108](self, sel__updateSliderControlValueVisible, v10, v11);
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  uint64_t v3;

  if (a3 || self->gridSizeClass)
    objc_msgSend_setUserInteractionEnabled_(self->_sliderView, a2, 1, v3);
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

- (void)updateWithCurrentTextSize:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  CCUISteppedSliderView *sliderView;
  NSArray *contentSizeCategories;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  sliderView = self->_sliderView;
  contentSizeCategories = self->_contentSizeCategories;
  objc_msgSend_categoryName(self->_helper, a2, a3, v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (double)(unint64_t)objc_msgSend_indexOfObject_(contentSizeCategories, v7, (uint64_t)v12, v8);
  *(float *)&v9 = v9;
  objc_msgSend_setValue_animated_(sliderView, v10, v4, v11, v9);

}

- (void)_setupSlider
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;
  NSArray *contentSizeCategories;
  void *v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  NSArray *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  objc_msgSend_categoryName(self->_helper, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  contentSizeCategories = self->_contentSizeCategories;
  v9 = (void *)*MEMORY[0x24BEBE0B8];
  if (v7)
    v10 = objc_msgSend_indexOfObject_(contentSizeCategories, v5, (uint64_t)v7, v6);
  else
    v10 = objc_msgSend_indexOfObject_(contentSizeCategories, v5, *MEMORY[0x24BEBE0B8], v6);
  self->_selectedCategoryIndex = v10;
  if (objc_msgSend_state(self->_helper, v11, v12, v13) == 3)
  {
    v17 = CFPreferencesGetAppBooleanValue(CFSTR("largeTextUsesExtendedRange"), CFSTR("com.apple.preferences-framework"), 0) != 0;
    CFPreferencesAppSynchronize(CFSTR("com.apple.preferences-framework"));
    if (v7)
      goto LABEL_9;
  }
  else
  {
    v17 = 1;
    if (v7)
      goto LABEL_9;
  }
  v7 = v9;
LABEL_9:
  v18 = self->_contentSizeCategories;
  if (v17)
    v20 = objc_msgSend_count(v18, v14, v15, v16) - 1;
  else
    v20 = objc_msgSend_indexOfObject_(v18, v14, *MEMORY[0x24BEBE090], v16);
  objc_msgSend_setNumberOfSteps_(self->_sliderView, v19, v20, v21);
  v22 = v7;
  AXPerformBlockOnMainThreadAfterDelay();

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
        self->_selectedCategoryIndexNeedsCommit = 1;
        if (self->_expanded)
        {
          objc_msgSend_objectAtIndexedSubscript_(self->_contentSizeCategories, v14, v9, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCategoryName_(self->_helper, v17, (uint64_t)v16, v18);

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
}

- (void)_sliderValueDidCommit:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;

  objc_msgSend__commitTextSizeIfNeeded(self, a2, (uint64_t)a3, v3);
  objc_msgSend_categoryName(self->_helper, v5, v6, v7);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  AXTextSizePercentage();
  v8 = (void *)MEMORY[0x24BDD17C8];
  AXCCLocalizedString(CFSTR("text.control.center.status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatFloatWithPercentage();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringWithFormat_(v8, v11, (uint64_t)v9, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_contentModuleContext(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x24BE19B78], v18, (uint64_t)v13, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enqueueStatusUpdate_(v17, v20, (uint64_t)v19, v21);

}

- (id)viewForTouchContinuation
{
  uint64_t v2;
  uint64_t v3;
  CCUISteppedSliderView *sliderView;

  if (objc_msgSend_isUserInteractionEnabled(self->_sliderView, a2, v2, v3))
    sliderView = self->_sliderView;
  else
    sliderView = 0;
  return sliderView;
}

- (void)perAppTextSizeToggled
{
  ((void (*)(AXCCTextSizeSliderModuleViewController *, char *))MEMORY[0x24BEDD108])(self, sel__setupSlider);
}

- (int64_t)gridSizeClass
{
  return self->gridSizeClass;
}

- (void)setGridSizeClass:(int64_t)a3
{
  self->gridSizeClass = a3;
}

- (AXCCTextSizeHelper)helper
{
  return self->_helper;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (AXCCTextSizeModuleViewControllerDelegate)textSizeDelegate
{
  return (AXCCTextSizeModuleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_textSizeDelegate);
}

- (void)setTextSizeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textSizeDelegate, a3);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (CCUISteppedSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_destroyWeak((id *)&self->_textSizeDelegate);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_selectionFeedback, 0);
  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
}

@end
