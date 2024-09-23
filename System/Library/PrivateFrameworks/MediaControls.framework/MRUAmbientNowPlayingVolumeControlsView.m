@implementation MRUAmbientNowPlayingVolumeControlsView

- (MRUAmbientNowPlayingVolumeControlsView)initWithFrame:(CGRect)a3
{
  MRUAmbientNowPlayingVolumeControlsView *v3;
  MRUSlider *v4;
  MRUSlider *slider;
  MRUCAPackageView *v6;
  MRUCAPackageView *packageView;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  CATransform3D v18;
  CATransform3D v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MRUAmbientNowPlayingVolumeControlsView;
  v3 = -[MRUAmbientNowPlayingVolumeControlsView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[MRUSlider initWithStyle:]([MRUSlider alloc], "initWithStyle:", 1);
    slider = v3->_slider;
    v3->_slider = v4;

    -[MRUSlider setExpansionFactor:](v3->_slider, "setExpansionFactor:", 1.78571429);
    -[MRUSlider setHitRectInset:](v3->_slider, "setHitRectInset:", -24.0, -24.0, -24.0, 0.0);
    -[MRUSlider addTarget:action:forControlEvents:](v3->_slider, "addTarget:action:forControlEvents:", v3, sel_sliderTouchUp_, 64);
    -[MRUSlider addTarget:action:forControlEvents:](v3->_slider, "addTarget:action:forControlEvents:", v3, sel_sliderTouchDown_, 1);
    -[MRUSlider addTarget:action:forControlEvents:](v3->_slider, "addTarget:action:forControlEvents:", v3, sel_sliderValueChanged_, 4096);
    -[MRUAmbientNowPlayingVolumeControlsView addSubview:](v3, "addSubview:", v3->_slider);
    v6 = objc_alloc_init(MRUCAPackageView);
    packageView = v3->_packageView;
    v3->_packageView = v6;

    -[MRUAmbientNowPlayingVolumeControlsView traitCollection](v3, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "layoutDirection");

    memset(&v19, 0, sizeof(v19));
    if (v9 == 1)
    {
      CATransform3DMakeScale(&v19, -1.0, 1.0, 1.0);
    }
    else
    {
      v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v19.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v19.m33 = v10;
      v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v19.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v19.m43 = v11;
      v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v19.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v19.m13 = v12;
      v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v19.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v19.m23 = v13;
    }
    +[MRUAssetsProvider volumeBoldPackageName](MRUAssetsProvider, "volumeBoldPackageName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    +[MRUCAPackageAsset packageNamed:glyphState:permanentTransform:](MRUCAPackageAsset, "packageNamed:glyphState:permanentTransform:", v14, 0, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUCAPackageView setAsset:](v3->_packageView, "setAsset:", v15);

    -[MRUCAPackageView setScale:](v3->_packageView, "setScale:", 1.25);
    -[MRUSlider setMaximumValueView:](v3->_slider, "setMaximumValueView:", v3->_packageView);
    v3->_sliderExpanded = 0;
    v3->_ignoreAnimationForVolumeEvents = 1;
    -[MRUAmbientNowPlayingVolumeControlsView createConstraints](v3, "createConstraints");
    -[MRUAmbientNowPlayingVolumeControlsView updateVisibility](v3, "updateVisibility");
    objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addVolumeDisplay:", v3);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeVolumeDisplay:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientNowPlayingVolumeControlsView;
  -[MRUAmbientNowPlayingVolumeControlsView dealloc](&v4, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 32.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)createConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[MRUSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[MRUSlider leadingAnchor](self->_slider, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingVolumeControlsView leadingAnchor](self, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  -[MRUSlider trailingAnchor](self->_slider, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingVolumeControlsView trailingAnchor](self, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  -[MRUSlider centerYAnchor](self->_slider, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUAmbientNowPlayingVolumeControlsView centerYAnchor](self, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  -[MRUSlider heightAnchor](self->_slider, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (CGRect)hitRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  v10.receiver = self;
  v10.super_class = (Class)MRUAmbientNowPlayingVolumeControlsView;
  -[MRUAmbientNowPlayingVolumeControlsView hitRect](&v10, sel_hitRect);
  v3 = v2 + -24.0;
  v5 = v4 + -24.0;
  v7 = v6 - (-24.0 + 0.0);
  v9 = v8 - (-24.0 + -24.0);
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v5;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MRUAmbientNowPlayingVolumeControlsView hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)setSliderExpanded:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_sliderExpanded != a3)
  {
    self->_sliderExpanded = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__MRUAmbientNowPlayingVolumeControlsView_setSliderExpanded___block_invoke;
    v4[3] = &unk_1E5818C88;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v4, 0, 0.25, 0.25, 0.0, 0.0);
    -[MRUAmbientNowPlayingVolumeControlsView resetIdleTimer](self, "resetIdleTimer");
  }
}

uint64_t __60__MRUAmbientNowPlayingVolumeControlsView_setSliderExpanded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisibility");
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
  -[MRUAmbientNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", 0);
  -[MRUAmbientNowPlayingVolumeControlsView updateVisibility](self, "updateVisibility");
}

- (MPVolumeControllerDataSource)dataSource
{
  return -[MPVolumeController dataSource](self->_volumeController, "dataSource");
}

- (void)setDataSource:(id)a3
{
  -[MPVolumeController setDataSource:](self->_volumeController, "setDataSource:", a3);
  -[MRUAmbientNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", self->_onScreen);
}

- (void)setStylingProvider:(id)a3
{
  -[MRUSlider setStylingProvider:](self->_slider, "setStylingProvider:", a3);
}

- (void)setOnScreen:(BOOL)a3
{
  id v3;

  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    -[MRUAmbientNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", 0);
    objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsUpdate");

  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5;

  v5 = a3;
  if ((-[MRUSlider isTracking](self->_slider, "isTracking") & 1) == 0)
    -[MRUAmbientNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", -[MRUAmbientNowPlayingVolumeControlsView isOnScreen](self, "isOnScreen"));
  if ((objc_msgSend(v5, "isVolumeControlAvailable") & 1) != 0)
  {
    if (self->_sliderExpanded && self->_idleTimer)
      -[MRUAmbientNowPlayingVolumeControlsView resetIdleTimer](self, "resetIdleTimer");
  }
  else
  {
    -[MRUAmbientNowPlayingVolumeControlsView setSliderExpanded:](self, "setSliderExpanded:", 0);
  }

}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  -[MRUAmbientNowPlayingVolumeControlsView updateVolumeAnimated:](self, "updateVolumeAnimated:", -[MRUAmbientNowPlayingVolumeControlsView isOnScreen](self, "isOnScreen", a3, a4));
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return self->_onScreen;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  void *v2;
  void *v3;

  -[MRUAmbientNowPlayingVolumeControlsView window](self, "window");
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

- (void)updateVolumeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  float v6;
  float v7;
  double v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double v11;

  v3 = a3;
  v5 = -[MPVolumeController isVolumeControlAvailable](self->_volumeController, "isVolumeControlAvailable");
  -[MRUVolumeController volumeValue](self->_volumeController, "volumeValue");
  v7 = v6;
  -[MRUSlider value](self->_slider, "value");
  *(float *)&v8 = *(float *)&v8 - v7;
  if (*(float *)&v8 < 0.0)
    *(float *)&v8 = -*(float *)&v8;
  v9 = v3 && !self->_ignoreAnimationForVolumeEvents;
  if (*(float *)&v8 > 0.00000011921)
  {
    *(float *)&v8 = v7;
    -[MRUSlider setValue:animated:](self->_slider, "setValue:animated:", v9, v8);
    if (self->_ignoreAnimationForVolumeEvents)
      self->_ignoreAnimationForVolumeEvents = 0;
    else
      -[MRUAmbientNowPlayingVolumeControlsView setSliderExpanded:](self, "setSliderExpanded:", -[MPVolumeController isVolumeControlAvailable](self->_volumeController, "isVolumeControlAvailable"));
  }
  v10 = self->_onScreen && v5;
  -[MRUAmbientNowPlayingVolumeControlsView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v10);
  *(float *)&v11 = v7;
  -[MRUAmbientNowPlayingVolumeControlsView updatePackageWithValue:](self, "updatePackageWithValue:", v11);
}

- (void)updatePackageWithValue:(float)a3
{
  void *v4;
  char v5;
  id v6;

  -[MRUAmbientNowPlayingVolumeControlsView _packageStateForVolume:](self, "_packageStateForVolume:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUCAPackageView glyphState](self->_packageView, "glyphState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[MRUCAPackageView setGlyphState:](self->_packageView, "setGlyphState:", v6);

}

- (void)updateVisibility
{
  -[MRUSlider setFluidTrackHidden:](self->_slider, "setFluidTrackHidden:", -[MRUAmbientNowPlayingVolumeControlsView sliderExpanded](self, "sliderExpanded") ^ 1);
}

- (void)invalidateIdleTimer
{
  MSVTimer *idleTimer;

  -[MSVTimer invalidate](self->_idleTimer, "invalidate");
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

}

- (void)resetIdleTimer
{
  MSVTimer *v3;
  MSVTimer *idleTimer;
  _QWORD v5[5];

  -[MRUAmbientNowPlayingVolumeControlsView invalidateIdleTimer](self, "invalidateIdleTimer");
  if (self->_sliderExpanded && (-[MRUSlider isTracking](self->_slider, "isTracking") & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__MRUAmbientNowPlayingVolumeControlsView_resetIdleTimer__block_invoke;
    v5[3] = &unk_1E5818C88;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0D4D110], "timerWithInterval:repeats:block:", 0, v5, 5.0);
    v3 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;

  }
}

uint64_t __56__MRUAmbientNowPlayingVolumeControlsView_resetIdleTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSliderExpanded:", 0);
}

- (void)sliderTouchDown:(id)a3
{
  -[MRUAmbientNowPlayingVolumeControlsView setSliderExpanded:](self, "setSliderExpanded:", 1);
  -[MRUAmbientNowPlayingVolumeControlsView invalidateIdleTimer](self, "invalidateIdleTimer");
}

- (void)sliderValueChanged:(id)a3
{
  MRUVolumeController *volumeController;
  id v5;
  int v6;
  int v7;
  double v8;

  volumeController = self->_volumeController;
  v5 = a3;
  objc_msgSend(v5, "value");
  -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");
  objc_msgSend(v5, "value");
  v7 = v6;

  LODWORD(v8) = v7;
  -[MRUAmbientNowPlayingVolumeControlsView updatePackageWithValue:](self, "updatePackageWithValue:", v8);
}

- (void)sliderTouchUp:(id)a3
{
  MRUVolumeController *volumeController;

  volumeController = self->_volumeController;
  objc_msgSend(a3, "value");
  -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");
  -[MRUAmbientNowPlayingVolumeControlsView resetIdleTimer](self, "resetIdleTimer");
}

- (id)_packageStateForVolume:(float)a3
{
  double v4;
  __CFString *v5;

  if (-[MPVolumeController isVolumeControlAvailable](self->_volumeController, "isVolumeControlAvailable"))
  {
    *(float *)&v4 = a3;
    +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("off");
  }
  return v5;
}

- (MRUSlider)slider
{
  return self->_slider;
}

- (MRUVolumeController)volumeController
{
  return self->_volumeController;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (double)sliderExpansionFactor
{
  return self->_sliderExpansionFactor;
}

- (void)setSliderExpansionFactor:(double)a3
{
  self->_sliderExpansionFactor = a3;
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (double)sliderValueOnPanBegin
{
  return self->_sliderValueOnPanBegin;
}

- (void)setSliderValueOnPanBegin:(double)a3
{
  self->_sliderValueOnPanBegin = a3;
}

- (BOOL)sliderExpanded
{
  return self->_sliderExpanded;
}

- (BOOL)ignoreAnimationForVolumeEvents
{
  return self->_ignoreAnimationForVolumeEvents;
}

- (void)setIgnoreAnimationForVolumeEvents:(BOOL)a3
{
  self->_ignoreAnimationForVolumeEvents = a3;
}

- (MSVTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_slider, 0);
}

@end
