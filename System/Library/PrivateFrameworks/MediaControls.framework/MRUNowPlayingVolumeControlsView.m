@implementation MRUNowPlayingVolumeControlsView

- (MRUNowPlayingVolumeControlsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUNowPlayingVolumeControlsView *v7;
  MRUNowPlayingVolumeControlsView *v8;
  void *v9;
  MRUGroupSlider *v10;
  MRUGroupSlider *slider;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MRUStepper *v16;
  MRUStepper *stepper;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)MRUNowPlayingVolumeControlsView;
  v7 = -[MRUNowPlayingVolumeControlsView initWithFrame:](&v28, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_contentScale = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 14.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRUSlider initWithStyle:]([MRUGroupSlider alloc], "initWithStyle:", 1);
    slider = v8->_slider;
    v8->_slider = v10;

    -[MRUSlider setHitRectInset:](v8->_slider, "setHitRectInset:", -24.0, -24.0, -24.0, -24.0);
    -[MRUSlider setExpansionFactor:](v8->_slider, "setExpansionFactor:", 1.71428571);
    -[MRUSlider setStretchLimit:](v8->_slider, "setStretchLimit:", 12.0);
    -[MRUGroupSlider setDelegate:](v8->_slider, "setDelegate:", v8);
    objc_initWeak(&location, v8);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __49__MRUNowPlayingVolumeControlsView_initWithFrame___block_invoke;
    v25 = &unk_1E58196D8;
    objc_copyWeak(&v26, &location);
    -[MRUSlider setAnimations:](v8->_slider, "setAnimations:", &v22);
    +[MRUAssetsProvider volumeMin](MRUAssetsProvider, "volumeMin", v22, v23, v24, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithConfiguration:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUGroupSlider setMinimumValueImage:](v8->_slider, "setMinimumValueImage:", v13);

    +[MRUAssetsProvider volumeMax](MRUAssetsProvider, "volumeMax");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithConfiguration:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUGroupSlider setMaximumValueImage:](v8->_slider, "setMaximumValueImage:", v15);

    -[MRUGroupSlider addTarget:action:forControlEvents:](v8->_slider, "addTarget:action:forControlEvents:", v8, sel_sliderValueChanged_, 4096);
    -[MRUNowPlayingVolumeControlsView addSubview:](v8, "addSubview:", v8->_slider);
    v16 = -[MRUStepper initWithFrame:]([MRUStepper alloc], "initWithFrame:", x, y, width, height);
    stepper = v8->_stepper;
    v8->_stepper = v16;

    -[MRUStepper setDelegate:](v8->_stepper, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUStepper setPreferredSymbolConfiguration:](v8->_stepper, "setPreferredSymbolConfiguration:", v18);

    +[MRUAssetsProvider volumeRelativeMinus](MRUAssetsProvider, "volumeRelativeMinus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUStepper setDecrementImage:](v8->_stepper, "setDecrementImage:", v19);

    +[MRUAssetsProvider volumeRelativePlus](MRUAssetsProvider, "volumeRelativePlus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUStepper setIncrementImage:](v8->_stepper, "setIncrementImage:", v20);

    -[MRUNowPlayingVolumeControlsView addSubview:](v8, "addSubview:", v8->_stepper);
    -[MRUNowPlayingVolumeControlsView updateVisibility](v8, "updateVisibility");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __49__MRUNowPlayingVolumeControlsView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVisualStyling");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeVolumeDisplay:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRUNowPlayingVolumeControlsView;
  -[MRUNowPlayingVolumeControlsView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double MinX;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double MaxX;
  uint64_t v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v24.receiver = self;
  v24.super_class = (Class)MRUNowPlayingVolumeControlsView;
  -[MRUNowPlayingVolumeControlsView layoutSubviews](&v24, sel_layoutSubviews);
  -[MRUNowPlayingVolumeControlsView bounds](self, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  v7 = CGRectGetWidth(v25);
  v8 = 28.0;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v9 = CGRectGetHeight(v26);
  if (v9 <= 28.0)
    v8 = v9;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  -[MRUStepper setFrame:](self->_stepper, "setFrame:", MinX, CGRectGetMaxY(v28) - v8, v7, v8);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectGetMinX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  CGRectGetWidth(v30);
  -[MRUNowPlayingVolumeControlsView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v23 = v12;
  UIRectCenteredYInRectScale();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[MRUGroupSlider setFrame:](self->_slider, "setFrame:", v14, v16, v18, v20, v23);
  v31.origin.x = v14;
  v31.origin.y = v16;
  v31.size.width = v18;
  v31.size.height = v20;
  v21 = -CGRectGetMinX(v31);
  v32.origin.x = v14;
  v32.origin.y = v16;
  v32.size.width = v18;
  v32.size.height = v20;
  MaxX = CGRectGetMaxX(v32);
  -[MRUNowPlayingVolumeControlsView bounds](self, "bounds");
  -[MRUSlider setHitRectInset:](self->_slider, "setHitRectInset:", -24.0, v21, -24.0, MaxX - CGRectGetWidth(v33));
}

- (CGSize)sizeThatFits:(CGSize)result
{
  uint64_t *v3;
  double v4;

  if (self->_layout == 1)
    v3 = &MRUNowPlayingControlHeightCompact;
  else
    v3 = &MRUNowPlayingControlHeight;
  v4 = *(double *)v3 * self->_contentScale;
  result.height = v4;
  return result;
}

- (void)setVolumeController:(id)a3
{
  MRUVolumeController *v4;
  MRUVolumeController *volumeController;
  MRUVolumeController *v6;

  v4 = (MRUVolumeController *)a3;
  -[MRUVolumeController setDelegate:](self->_volumeController, "setDelegate:", 0);
  volumeController = self->_volumeController;
  self->_volumeController = v4;
  v6 = v4;

  -[MRUVolumeController setDelegate:](self->_volumeController, "setDelegate:", self);
  self->_ignoreAnimationForVolumeEvents = 1;
  -[MRUNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", 0);
  -[MRUNowPlayingVolumeControlsView updateVisibility](self, "updateVisibility");
}

- (MPVolumeControllerDataSource)dataSource
{
  return -[MPVolumeController dataSource](self->_volumeController, "dataSource");
}

- (void)setDataSource:(id)a3
{
  self->_ignoreAnimationForVolumeEvents = 1;
  -[MPVolumeController setDataSource:](self->_volumeController, "setDataSource:", a3);
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  v7 = v5;
  if (stylingProvider != v5)
  {
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUNowPlayingVolumeControlsView updateVisualStyling](self, "updateVisualStyling");
    -[MRUSlider setStylingProvider:](self->_slider, "setStylingProvider:", v7);
    -[MRUStepper setStylingProvider:](self->_stepper, "setStylingProvider:", v7);
  }

}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "addVolumeDisplay:", self);
    else
      objc_msgSend(v5, "removeVolumeDisplay:", self);

    -[MRUNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", 0);
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUSlider setDimmed:](self->_slider, "setDimmed:");
    -[MRUStepper setDimmed:](self->_stepper, "setDimmed:", self->_dimmed);
    -[MRUNowPlayingVolumeControlsView updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingVolumeControlsView updateVisibility](self, "updateVisibility");
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingVolumeControlsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)sliderValueChanged:(id)a3
{
  MRUVolumeController *volumeController;

  volumeController = self->_volumeController;
  objc_msgSend(a3, "value");
  -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  void *v6;
  char v7;
  double v8;
  id v9;

  if ((-[MRUGroupSlider isTracking](self->_slider, "isTracking", a3) & 1) == 0)
  {
    -[MRUNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", -[MRUNowPlayingVolumeControlsView isOnScreen](self, "isOnScreen"));
    -[MRUNowPlayingVolumeControlsView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[MRUNowPlayingVolumeControlsView delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v8 = a4;
      objc_msgSend(v9, "volumeControlsView:volumeValueDidChange:", self, v8);

    }
  }
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  -[MRUNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", -[MRUNowPlayingVolumeControlsView isOnScreen](self, "isOnScreen", a3, a4));
}

- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  char v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  -[MRUNowPlayingVolumeControlsView delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[MRUNowPlayingVolumeControlsView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "volumeControlsView:volumeCapabiltiesDidChange:", self, v4);

  }
  -[MRUNowPlayingVolumeControlsView updateVisibility](self, "updateVisibility");
}

- (BOOL)sliderShouldAllowLongPress:(id)a3
{
  return -[MRUVolumeGroupCoordinator shouldAllowEqualization](self->_volumeGroupCoordinator, "shouldAllowEqualization", a3);
}

- (void)sliderLongPressActionDidBegin:(id)a3
{
  -[MRUVolumeGroupCoordinator beginEqualization](self->_volumeGroupCoordinator, "beginEqualization", a3);
}

- (void)sliderLongPressActionDidCancel:(id)a3
{
  -[MRUVolumeGroupCoordinator finishEqualization](self->_volumeGroupCoordinator, "finishEqualization", a3);
}

- (void)sliderLongPressActionDidFinish:(id)a3
{
  -[MRUVolumeGroupCoordinator equalizeVolumes](self->_volumeGroupCoordinator, "equalizeVolumes", a3);
  -[MRUVolumeGroupCoordinator finishEqualization](self->_volumeGroupCoordinator, "finishEqualization");
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return self->_onScreen;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  void *v2;
  void *v3;

  -[MRUNowPlayingVolumeControlsView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v3;
}

- (NSString)volumeAudioCategory
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[MPVolumeController volumeAudioCategory](self->_volumeController, "volumeAudioCategory");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Audio/Video");
  v4 = v2;

  return v4;
}

- (void)stepperDidDecrement:(id)a3
{
  -[MPVolumeController decreaseVolume](self->_volumeController, "decreaseVolume", a3);
}

- (void)stepperDidIncrement:(id)a3
{
  -[MPVolumeController increaseVolume](self->_volumeController, "increaseVolume", a3);
}

- (void)stepperDecrementHoldBegan:(id)a3
{
  -[MPVolumeController beginDecreasingRelativeVolume](self->_volumeController, "beginDecreasingRelativeVolume", a3);
}

- (void)stepperDecrementHoldEnded:(id)a3
{
  -[MPVolumeController endDecreasingRelativeVolume](self->_volumeController, "endDecreasingRelativeVolume", a3);
}

- (void)stepperIncrementHoldBegan:(id)a3
{
  -[MPVolumeController beginIncreasingRelativeVolume](self->_volumeController, "beginIncreasingRelativeVolume", a3);
}

- (void)stepperIncrementHoldEnded:(id)a3
{
  -[MPVolumeController endIncreasingRelativeVolume](self->_volumeController, "endIncreasingRelativeVolume", a3);
}

- (void)updateVolumeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  float v6;
  float v7;
  double v8;
  _BOOL8 v9;
  _BOOL8 v10;

  v3 = a3;
  v5 = -[MPVolumeController isVolumeControlAvailable](self->_volumeController, "isVolumeControlAvailable");
  -[MRUVolumeController volumeValue](self->_volumeController, "volumeValue");
  v7 = v6;
  -[MRUGroupSlider value](self->_slider, "value");
  *(float *)&v8 = *(float *)&v8 - v7;
  if (*(float *)&v8 < 0.0)
    *(float *)&v8 = -*(float *)&v8;
  v9 = !self->_ignoreAnimationForVolumeEvents && v3;
  if (self->_ignoreAnimationForVolumeEvents && *(float *)&v8 > 0.00000011921)
  {
    v9 = 0;
    self->_ignoreAnimationForVolumeEvents = 0;
  }
  if (*(float *)&v8 > 0.00000011921)
  {
    *(float *)&v8 = v7;
    -[MRUGroupSlider setValue:animated:](self->_slider, "setValue:animated:", v9, v8);
  }
  v10 = self->_onScreen && v5;
  -[MRUGroupSlider setEnabled:](self->_slider, "setEnabled:", v10);
}

- (void)updateVisibility
{
  char v3;
  _BOOL8 v4;
  id v5;

  v3 = -[MPVolumeController volumeCapabilities](self->_volumeController, "volumeCapabilities");
  v4 = (v3 & 5) == 0;
  -[MRUGroupSlider setHidden:](self->_slider, "setHidden:", (v3 & 5) != 0);
  -[MRUStepper setHidden:](self->_stepper, "setHidden:", v4);
  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdate");

}

- (void)updateVisualStyling
{
  MRUVisualStylingProvider *stylingProvider;
  uint64_t v4;
  id v5;

  if (-[MRUGroupSlider isTracking](self->_slider, "isTracking"))
  {
    stylingProvider = self->_stylingProvider;
    v4 = 0;
  }
  else
  {
    stylingProvider = self->_stylingProvider;
    if (self->_dimmed)
      v4 = 3;
    else
      v4 = 2;
  }
  -[MRUVisualStylingProvider blendColorForStyle:](stylingProvider, "blendColorForStyle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUGroupSlider setTintColor:](self->_slider, "setTintColor:", v5);

}

- (MRUNowPlayingVolumeControlsViewDelegate)delegate
{
  return (MRUNowPlayingVolumeControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUVolumeController)volumeController
{
  return self->_volumeController;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (void)setVolumeGroupCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, a3);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUGroupSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (MRUStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
  objc_storeStrong((id *)&self->_stepper, a3);
}

- (BOOL)ignoreAnimationForVolumeEvents
{
  return self->_ignoreAnimationForVolumeEvents;
}

- (void)setIgnoreAnimationForVolumeEvents:(BOOL)a3
{
  self->_ignoreAnimationForVolumeEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
