@implementation MRUVolumeViewController

- (void)updateVisibility
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  char v20;
  _QWORD v21[5];
  char v22;
  char v23;
  BOOL v24;

  -[MRUAudioModuleController spatialAudioController](self->_audioModuleController, "spatialAudioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 > 1;

  -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSplitRoute");

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "volumeCapabilitiesForType:", 0);

  v11 = +[MRUFeatureFlagProvider isRelativeVolumeUIEnabled](MRUFeatureFlagProvider, "isRelativeVolumeUIEnabled");
  v12 = (v10 & 5) != 0 && v11;
  -[MRUVolumeViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != objc_msgSend(v13, "showSecondarySlider"))
    goto LABEL_7;
  -[MRUVolumeViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 != objc_msgSend(v14, "showStepper"))
  {

LABEL_7:
LABEL_8:
    v15 = (void *)MEMORY[0x1E0D14778];
    -[MRUVolumeViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __43__MRUVolumeViewController_updateVisibility__block_invoke;
    v21[3] = &unk_1E5819A00;
    v21[4] = self;
    v22 = v8;
    v23 = v12;
    v24 = v6;
    objc_msgSend(v15, "performWithoutAnimationWhileHiddenInWindow:actions:", v17, v21);

    return;
  }
  v18 = v5 > 1;
  -[MRUVolumeViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "showSpatialAudioModeButton");

  if ((v20 & 1) != 0)
    goto LABEL_8;
}

- (MRUVolumeViewController)initWithAudioModuleController:(id)a3
{
  id v5;
  MRUVolumeViewController *v6;
  MRUVolumeViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeViewController;
  v6 = -[MRUVolumeViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioModuleController, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeVolumeDisplay:", self);

  v4.receiver = self;
  v4.super_class = (Class)MRUVolumeViewController;
  -[MRUVolumeViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  MRUVolumeView *v3;
  MRUVolumeView *v4;

  v3 = [MRUVolumeView alloc];
  v4 = -[MRUVolumeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MRUVolumeViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
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
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MRUVolumeViewController;
  -[MRUVolumeViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[MRUVolumeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primarySlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_primarySliderValueDidChange_, 4096);

  -[MRUVolumeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondarySlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_secondarySliderValueDidChange_, 4096);

  -[MRUVolumeViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stepper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "increaseButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_increaseTouchUpInside_, 64);

  -[MRUVolumeViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stepper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decreaseButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_decreaseTouchUpInside_, 64);

  -[MRUVolumeViewController compactContinuousCornerRadius](self, "compactContinuousCornerRadius");
  v14 = v13;
  -[MRUVolumeViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCompactContinuousCornerRadius:", v14);

  -[MRUAudioModuleController addObserver:](self->_audioModuleController, "addObserver:", self);
  -[MRUVolumeViewController updateSliderTint](self, "updateSliderTint");
  -[MRUVolumeViewController updateSliderAsset](self, "updateSliderAsset");
  -[MRUVolumeViewController updateSliderInteractionEnabled](self, "updateSliderInteractionEnabled");
  -[MRUVolumeViewController updateVisibility](self, "updateVisibility");
  -[MRUVolumeViewController setPrimaryInteractionEnabled:](self, "setPrimaryInteractionEnabled:", 1);
  -[MRUVolumeViewController setSecondaryInteractionEnabled:](self, "setSecondaryInteractionEnabled:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeViewController;
  -[MRUVolumeViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[MRUVolumeViewController updateSliderInteractionEnabled](self, "updateSliderInteractionEnabled");
  -[MRUVolumeViewController updatePrimarySliderVolumeValueAnimated:](self, "updatePrimarySliderVolumeValueAnimated:", v3);
  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addVolumeDisplay:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeViewController;
  -[MRUVolumeViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[MRUVolumeViewController updateSliderInteractionEnabled](self, "updateSliderInteractionEnabled");
  objc_msgSend(MEMORY[0x1E0CC2550], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeVolumeDisplay:", self);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  char v8;
  _QWORD v9[5];
  char v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)MRUVolumeViewController;
  v7 = a4;
  -[MRUVolumeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = objc_msgSend(v7, "isAnimated");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E58199B0;
  v9[4] = self;
  v10 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);

}

uint64_t __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  char v5;
  CAFrameRateRange v6;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E5818D00;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966082, v4, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "pendingExpanded");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExpanded:", v2);

  objc_msgSend(*(id *)(a1 + 32), "updatePrimarySliderVolumeValueAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateSecondarySliderVolumeValueAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MRUVisualStylingProvider)stylingProvider
{
  void *v2;
  void *v3;

  -[MRUVolumeViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stylingProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRUVisualStylingProvider *)v3;
}

- (void)setPrimaryInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_primaryInteractionEnabled != a3)
  {
    v3 = a3;
    self->_primaryInteractionEnabled = a3;
    -[MRUVolumeViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrimaryInteractionEnabled:", v3);

    -[MRUVolumeViewController updatePrimarySliderVolumeValueAnimated:](self, "updatePrimarySliderVolumeValueAnimated:", 0);
  }
}

- (void)setPrimaryGlyphShouldBeTinted:(BOOL)a3
{
  if (self->_primaryGlyphShouldBeTinted != a3)
  {
    self->_primaryGlyphShouldBeTinted = a3;
    -[MRUVolumeViewController updateSliderTint](self, "updateSliderTint");
  }
}

- (void)setSecondaryInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_secondaryInteractionEnabled != a3)
  {
    v3 = a3;
    self->_secondaryInteractionEnabled = a3;
    -[MRUVolumeViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondaryInteractionEnabled:", v3);

    -[MRUVolumeViewController updateSecondarySliderVolumeValueAnimated:](self, "updateSecondarySliderVolumeValueAnimated:", 0);
  }
}

- (void)primarySliderValueDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRUVolumeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isExpanded") & 1) != 0)
  {
    -[MRUVolumeViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showSecondarySlider");

    if (v7)
    {
      -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      objc_msgSend(v8, "setVolumeValue:forType:", 1);

      goto LABEL_8;
    }
  }
  else
  {

  }
  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  objc_msgSend(v9, "setVolumeValue:forType:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "value");
  objc_msgSend(WeakRetained, "volumeViewController:didChangeSystemVolumeValue:", self);

  MCLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "value");
    objc_msgSend(v13, "numberWithFloat:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v12;
    v18 = 2114;
    v19 = v14;
    v20 = 1024;
    v21 = objc_msgSend(v4, "isEditingValue");
    v22 = 1024;
    v23 = objc_msgSend(v4, "isTracking");
    _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ slider value changed: %{public}@ | editing: %{BOOL}u | tracking: %{BOOL}u", (uint8_t *)&v16, 0x22u);

  }
  -[MRUVolumeViewController updatePrimarySliderVolumeValueAfterDelay](self, "updatePrimarySliderVolumeValueAfterDelay");
LABEL_8:
  objc_msgSend(v4, "value");
  +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlyphState:", v15);

}

- (void)secondarySliderValueDidChange:(id)a3
{
  MRUAudioModuleController *audioModuleController;
  id v4;
  int v5;
  int v6;
  double v7;
  id v8;

  audioModuleController = self->_audioModuleController;
  v4 = a3;
  -[MRUAudioModuleController volumeController](audioModuleController, "volumeController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;

  LODWORD(v7) = v6;
  objc_msgSend(v8, "setVolumeValue:forType:", 2, v7);

}

- (void)increaseTouchUpInside:(id)a3
{
  id v3;

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "increaseVolume");

}

- (void)decreaseTouchUpInside:(id)a3
{
  id v3;

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decreaseVolume");

}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (double)preferredExpandedContentWidth
{
  void *v3;
  _BOOL8 ShouldBeVertical;
  double Width;
  void *v6;
  void *v7;
  CGRect v9;

  -[MRUVolumeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldBeVertical = MRULayoutShouldBeVertical();
  if (ShouldBeVertical)
  {
    Width = MRUDefaultExpandedWidth(ShouldBeVertical);
  }
  else
  {
    -[MRUVolumeViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    Width = CGRectGetWidth(v9);

  }
  return Width;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  id v4;

  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    -[MRUVolumeViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompactContinuousCornerRadius:", a3);

  }
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  self->_contentRenderingMode = a3;
  -[MRUVolumeViewController updateSliderAsset](self, "updateSliderAsset");
  -[MRUVolumeViewController updatePrimarySliderVolumeValueAnimated:](self, "updatePrimarySliderVolumeValueAnimated:", 0);
  -[MRUVolumeViewController updateSliderInteractionEnabled](self, "updateSliderInteractionEnabled");
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_pendingExpanded = a3;
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = *MEMORY[0x1E0D4C6D0];
    +[MRUSystemOutputDeviceRouteController outputContextDescription](MRUSystemOutputDeviceRouteController, "outputContextDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v4;
    v5 = v4;
    MRAnalyticsSendEvent();

  }
}

id __62__MRUVolumeViewController_didTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isGroupRenderingRequired
{
  void *v2;
  char v3;

  -[MRUVolumeViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGroupRenderingRequired");

  return v3;
}

- (NSArray)punchOutRenderingViews
{
  void *v2;
  void *v3;

  -[MRUVolumeViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchOutRenderingViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  void *v2;
  void *v3;
  void *v4;

  -[MRUVolumeViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v4;
}

- (BOOL)isOnScreen
{
  return -[MRUVolumeViewController _appearState](self, "_appearState") == 2
      || -[MRUVolumeViewController _appearState](self, "_appearState") == 1;
}

- (NSString)volumeAudioCategory
{
  void *v2;
  void *v3;

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumeAudioCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)audioModuleController:(id)a3 volumeController:(id)a4 didChangeVolumeControlCapabilities:(unsigned int)a5 effectiveVolumeValue:(float)a6 forType:(int64_t)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if ((unint64_t)a7 >= 2)
  {
    if (a7 == 2)
    {
      -[MRUVolumeViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "secondarySlider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEditingValue");

      if ((v26 & 1) == 0)
        -[MRUVolumeViewController updateSecondarySliderVolumeValueAnimated:](self, "updateSecondarySliderVolumeValueAnimated:", 1);
    }
  }
  else
  {
    -[MRUVolumeViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primarySlider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEditingValue");

    if ((v15 & 1) == 0)
      -[MRUVolumeViewController updatePrimarySliderVolumeValueAnimated:](self, "updatePrimarySliderVolumeValueAnimated:", 1);
    MCLogCategoryDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      *(float *)&v17 = a6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUVolumeViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "primarySlider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEditingValue");
      -[MRUVolumeViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "primarySlider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v27;
      v30 = 2114;
      v31 = v18;
      v32 = 1024;
      v33 = v21;
      v34 = 1024;
      v35 = objc_msgSend(v23, "isTracking");
      _os_log_impl(&dword_1AA991000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ system volume changed: %{public}@ | editing: %{BOOL}u | tracking: %{BOOL}u", buf, 0x22u);

    }
  }
  -[MRUVolumeViewController updateVisibility](self, "updateVisibility");

}

- (void)updateSliderAsset
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_contentRenderingMode == 1)
  {
    +[MRUOutputDeviceAsset speakerAsset](MRUOutputDeviceAsset, "speakerAsset");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRUAudioModuleController outputDeviceRouteController](self->_audioModuleController, "outputDeviceRouteController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemOutputDeviceAssetWithInCall");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeValueForType:", 0);
  v6 = v5;

  LODWORD(v7) = v6;
  +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primarySlider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOutputDeviceAsset:state:animated:", v11, v8, -[MRUVolumeViewController isOnScreen](self, "isOnScreen"));

}

- (void)updateSliderTint
{
  void *v3;
  void *v4;
  id v5;

  if (-[MRUVolumeViewController primaryGlyphShouldBeTinted](self, "primaryGlyphShouldBeTinted"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemCyanColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[MRUVolumeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primarySlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlyphTintColor:", v5);

}

- (void)updateSliderInteractionEnabled
{
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[MRUVolumeViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  if ((_DWORD)v3)
    v4 = self->_contentRenderingMode != 1;
  else
    v4 = 0;
  -[MRUVolumeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primarySlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4);

  -[MRUVolumeViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondarySlider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v3);

}

- (void)updatePrimarySliderVolumeValueAfterDelay
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updatePrimarySliderVolumeValueAfterDelay, 0);
  -[MRUVolumeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primarySlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditingValue");

  if (v5)
    -[MRUVolumeViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updatePrimarySliderVolumeValueAfterDelay, 0, 0.25);
  else
    -[MRUVolumeViewController updatePrimarySliderVolumeValueAnimated:](self, "updatePrimarySliderVolumeValueAnimated:", 1);
}

- (void)updatePrimarySliderVolumeValueAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  char v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id WeakRetained;

  v3 = a3;
  -[MRUVolumeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isExpanded"))
  {
    -[MRUVolumeViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showSecondarySlider");

  }
  else
  {
    v7 = 0;
  }

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeValueForType:", v7);
  v10 = v9;

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "volumeCapabilitiesForType:", v7);

  if (self->_contentRenderingMode == 1)
  {
    CCUISliderPreviewRenderingModeValue();
    v10 = v13;
LABEL_8:
    v14 = !self->_primaryInteractionEnabled;
    goto LABEL_9;
  }
  if ((v12 & 2) != 0)
    goto LABEL_8;
  v14 = 1;
LABEL_9:
  -[MRUVolumeViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "primarySlider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = v10;
  objc_msgSend(v16, "setValue:animated:", v3, v17);

  -[MRUVolumeViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "primarySlider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInoperative:", v14);

  *(float *)&v20 = v10;
  +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVolumeViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "primarySlider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setGlyphState:", v21);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&v24 = v10;
  objc_msgSend(WeakRetained, "volumeViewController:didChangeSystemVolumeValue:", self, v24);

}

- (void)updateSecondarySliderVolumeValueAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  int v7;
  void *v8;
  char v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v3 = a3;
  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volumeValueForType:", 2);
  v7 = v6;

  -[MRUAudioModuleController volumeController](self->_audioModuleController, "volumeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "volumeCapabilitiesForType:", 2);

  v10 = (v9 & 2) == 0 || !self->_secondaryInteractionEnabled;
  -[MRUVolumeViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secondarySlider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = v7;
  objc_msgSend(v12, "setValue:animated:", v3, v13);

  -[MRUVolumeViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "secondarySlider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInoperative:", v10);

}

uint64_t __43__MRUVolumeViewController_updateVisibility__block_invoke(uint64_t a1)
{
  _QWORD v2[5];
  char v3;
  __int16 v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__MRUVolumeViewController_updateVisibility__block_invoke_2;
  v2[3] = &unk_1E5819A00;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_WORD *)(a1 + 41);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.25);
}

void __43__MRUVolumeViewController_updateVisibility__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowSecondarySlider:", v2);

  v4 = *(unsigned __int8 *)(a1 + 41);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowStepper:", v4);

  v6 = *(unsigned __int8 *)(a1 + 42);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowSpatialAudioModeButton:", v6);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (MRUAudioModuleController)audioModuleController
{
  return self->_audioModuleController;
}

- (MRUVolumeViewControllerDelegate)delegate
{
  return (MRUVolumeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)primaryInteractionEnabled
{
  return self->_primaryInteractionEnabled;
}

- (BOOL)primaryGlyphShouldBeTinted
{
  return self->_primaryGlyphShouldBeTinted;
}

- (BOOL)secondaryInteractionEnabled
{
  return self->_secondaryInteractionEnabled;
}

- (BOOL)pendingExpanded
{
  return self->_pendingExpanded;
}

- (void)setPendingExpanded:(BOOL)a3
{
  self->_pendingExpanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioModuleController, 0);
}

@end
