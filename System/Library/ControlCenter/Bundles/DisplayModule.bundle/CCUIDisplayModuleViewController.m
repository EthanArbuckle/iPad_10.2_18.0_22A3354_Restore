@implementation CCUIDisplayModuleViewController

- (float)_backlightLevel
{
  unint64_t contentRenderingMode;
  float result;
  double v4;

  contentRenderingMode = self->_contentRenderingMode;
  if (contentRenderingMode == 1)
  {
    CCUISliderPreviewRenderingModeValue();
    return v4;
  }
  else if (!contentRenderingMode)
  {
    BKSDisplayBrightnessGetCurrent();
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController viewWillAppear:](&v17, sel_viewWillAppear_, a3);
  objc_msgSend__updateBrightnessControlAvailability(self, v4, v5);
  objc_msgSend__updateWithCurrentBrightnessAnimated_(self, v6, 0);
  objc_msgSend__updateBrightnessControlInteractionEnabled(self, v7, v8);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDF7D48];
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v11, v16, (uint64_t)self, sel__noteScreenBrightnessDidChange_, v12, v15);

}

- (void)viewDidDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  BKSDisplayBrightnessTransaction *brightnessTransaction;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, *MEMORY[0x24BDF7D48], 0);

  brightnessTransaction = self->_brightnessTransaction;
  if (brightnessTransaction)
  {
    CFRelease(brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
}

- (void)dealloc
{
  BKSDisplayBrightnessTransaction *brightnessTransaction;
  objc_super v4;

  brightnessTransaction = self->_brightnessTransaction;
  if (brightnessTransaction)
  {
    CFRelease(brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  const char *v4;
  uint64_t v5;
  CCUIContinuousSliderView *v6;
  CCUIContinuousSliderView *sliderView;
  CCUIContinuousSliderView *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;

  v3 = objc_alloc(MEMORY[0x24BE19B30]);
  v6 = (CCUIContinuousSliderView *)objc_msgSend_initWithFrame_(v3, v4, v5, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  sliderView = self->_sliderView;
  self->_sliderView = v6;

  v8 = self->_sliderView;
  objc_msgSend__backlightLevel(self, v9, v10);
  objc_msgSend_setValue_animated_(v8, v11, 0);
  objc_msgSend_setInteractiveWhenUnexpanded_(self->_sliderView, v12, 1);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v13, (uint64_t)self, sel__sliderEditingDidBegin_, 0x10000);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v14, (uint64_t)self, sel__sliderPresentationValueDidChange_, *MEMORY[0x24BE19A38]);
  objc_msgSend_addTarget_action_forControlEvents_(self->_sliderView, v15, (uint64_t)self, sel__sliderEditingDidEnd_, 0x40000);
  objc_msgSend_setAccessibilityIdentifier_(self->_sliderView, v16, (uint64_t)CFSTR("cc-brightness-slider"));
  objc_msgSend_setView_(self, v17, (uint64_t)self->_sliderView);
  objc_msgSend__updateBrightnessControlInteractionEnabled(self, v18, v19);
}

- (void)viewDidLoad
{
  BrightnessSystemClient *v3;
  BrightnessSystemClient *brightnessSystemClient;
  BrightnessSystemClient *v5;
  const char *v6;
  id WeakRetained;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController viewDidLoad](&v17, sel_viewDidLoad);
  v3 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x24BE1A2D0]);
  brightnessSystemClient = self->_brightnessSystemClient;
  self->_brightnessSystemClient = v3;

  objc_initWeak(&location, self);
  v5 = self->_brightnessSystemClient;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = sub_230FC59E8;
  v14 = &unk_24FFD1990;
  objc_copyWeak(&v15, &location);
  objc_msgSend_registerNotificationBlock_forProperties_(v5, v6, (uint64_t)&v11, &unk_24FFD36A0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_currentBrightness(self, v8, v9, v11, v12, v13, v14);
  objc_msgSend_displayModuleViewController_brightnessDidChange_(WeakRetained, v10, (uint64_t)self);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  const char *v8;
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CCUIDisplayModuleViewController;
  v7 = a4;
  -[CCUIDisplayModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_230FC5C2C;
  v9[3] = &unk_24FFD19B8;
  v9[4] = self;
  objc_msgSend_animateAlongsideTransition_completion_(v7, v8, (uint64_t)v9, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend__updateBrightnessControlInteractionEnabled(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIDisplayModuleViewController;
  -[CCUIDisplayModuleViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  if (self->_expanded)
    objc_msgSend_preferredExpandedContinuousCornerRadius(self, v3, v4);
  else
    objc_msgSend_compactContinuousCornerRadius(self, v3, v4);
  objc_msgSend_setContinuousSliderCornerRadius_(self->_sliderView, v5, v6);
}

- (void)setGlyphShouldBeTinted:(BOOL)a3
{
  const char *v5;
  uint64_t v6;
  CCUIContinuousSliderView *sliderView;
  const char *v8;
  id v9;

  objc_msgSend_loadViewIfNeeded(self, a2, a3);
  sliderView = self->_sliderView;
  if (a3)
  {
    objc_msgSend_systemYellowColor(MEMORY[0x24BDF6950], v5, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphTintColor_(sliderView, v8, (uint64_t)v9);

  }
  else
  {
    objc_msgSend_setGlyphTintColor_(sliderView, v5, 0);
  }
}

- (void)setGlyphPackageDescription:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend_loadViewIfNeeded(self, v4, v5);
  objc_msgSend_setGlyphPackageDescription_(self->_sliderView, v6, (uint64_t)v7);

}

- (void)setGlyphState:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend_loadViewIfNeeded(self, v4, v5);
  objc_msgSend_setGlyphState_(self->_sliderView, v6, (uint64_t)v7);

}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  id v6;

  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    objc_msgSend_viewIfLoaded(self, a2, v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setNeedsLayout(v6, v4, v5);

  }
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (self->_contentRenderingMode != a3)
  {
    self->_contentRenderingMode = a3;
    objc_msgSend__updateWithCurrentBrightnessAnimated_(self, a2, 0);
  }
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_expanded = a3;
  MEMORY[0x24BEDD108](self->_sliderView, sel_setGlyphVisible_, !a3);
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (id)viewForTouchContinuation
{
  uint64_t v2;
  CCUIContinuousSliderView *sliderView;

  if (objc_msgSend_isUserInteractionEnabled(self->_sliderView, a2, v2))
    sliderView = self->_sliderView;
  else
    sliderView = 0;
  return sliderView;
}

- (BOOL)isGroupRenderingRequired
{
  return ((uint64_t (*)(CCUIContinuousSliderView *, char *))MEMORY[0x24BEDD108])(self->_sliderView, sel_isGroupRenderingRequired);
}

- (NSArray)punchOutRenderingViews
{
  return (NSArray *)((uint64_t (*)(CCUIContinuousSliderView *, char *))MEMORY[0x24BEDD108])(self->_sliderView, sel_punchOutRenderingViews);
}

- (void)_setBacklightLevel:(float)a3
{
  BKSDisplayBrightnessSet();
}

- (void)_updateBrightnessControlAvailability
{
  uint64_t v2;
  CCUIContinuousSliderView *sliderView;
  uint64_t v4;
  const char *v5;

  sliderView = self->_sliderView;
  v4 = objc_msgSend__canAdjustBrightness(self, a2, v2) ^ 1;
  objc_msgSend_setInoperative_(sliderView, v5, v4);
}

- (void)_updateBrightnessControlInteractionEnabled
{
  uint64_t v2;
  CCUIContinuousSliderView *sliderView;
  uint64_t isAppearingOrAppeared;

  sliderView = self->_sliderView;
  isAppearingOrAppeared = objc_msgSend_bs_isAppearingOrAppeared(self, a2, v2);
  MEMORY[0x24BEDD108](sliderView, sel_setUserInteractionEnabled_, isAppearingOrAppeared);
}

- (void)_updateWithCurrentBrightnessAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CCUIContinuousSliderView *sliderView;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id WeakRetained;

  v3 = a3;
  sliderView = self->_sliderView;
  objc_msgSend__backlightLevel(self, a2, a3);
  objc_msgSend_setValue_animated_(sliderView, v6, v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_currentBrightness(self, v7, v8);
  objc_msgSend_displayModuleViewController_brightnessDidChange_(WeakRetained, v9, (uint64_t)self);

}

- (void)_noteScreenBrightnessDidChange:(id)a3
{
  objc_msgSend__updateWithCurrentBrightnessAnimated_(self, a2, 1);
}

- (void)_sliderEditingDidBegin:(id)a3
{
  if (!self->_brightnessTransaction)
    self->_brightnessTransaction = (BKSDisplayBrightnessTransaction *)BKSDisplayBrightnessTransactionCreate();
}

- (void)_sliderPresentationValueDidChange:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id WeakRetained;

  if (self->_brightnessTransaction)
  {
    objc_msgSend_presentationValue(a3, a2, (uint64_t)a3);
    objc_msgSend__setBacklightLevel_(self, v4, v5);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_currentBrightness(self, v6, v7);
  objc_msgSend_displayModuleViewController_brightnessDidChange_(WeakRetained, v8, (uint64_t)self);

}

- (void)_sliderEditingDidEnd:(id)a3
{
  BKSDisplayBrightnessTransaction *brightnessTransaction;

  brightnessTransaction = self->_brightnessTransaction;
  if (brightnessTransaction)
  {
    CFRelease(brightnessTransaction);
    self->_brightnessTransaction = 0;
  }
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (CCUIDisplayModuleViewControllerDelegate)delegate
{
  return (CCUIDisplayModuleViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CCUIContinuousSliderView)sliderView
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end
