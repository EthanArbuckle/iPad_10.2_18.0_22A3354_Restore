@implementation CSMagSafeAccessorySleeveViewController

- (CSMagSafeAccessorySleeveViewController)initWithAccessory:(id)a3
{
  CSMagSafeAccessorySleeveViewController *v3;
  CSMagSafeAccessorySleeveView *v4;
  uint64_t v5;
  CSMagSafeAccessorySleeveView *sleeveView;
  SBFLockScreenDateViewController *v7;
  SBFLockScreenDateViewController *dateViewController;
  SBFLockScreenDateViewController *v9;
  SBFLockScreenDateViewController *secondaryDateViewController;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  v3 = -[CSMagSafeAccessoryViewController initWithAccessory:](&v12, sel_initWithAccessory_, a3);
  if (v3)
  {
    v4 = [CSMagSafeAccessorySleeveView alloc];
    v5 = -[CSMagSafeAccessorySleeveView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sleeveView = v3->_sleeveView;
    v3->_sleeveView = (CSMagSafeAccessorySleeveView *)v5;

    v3->_chargingAnimationVisible = 0;
    v7 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E0DA9E60]);
    dateViewController = v3->_dateViewController;
    v3->_dateViewController = v7;

    v9 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E0DA9E60]);
    secondaryDateViewController = v3->_secondaryDateViewController;
    v3->_secondaryDateViewController = v9;

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBFLockScreenDateViewController *dateViewController;
  uint64_t v9;
  id v10;
  SBFLockScreenDateViewController *secondaryDateViewController;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v20, sel_viewDidLoad);
  -[CSMagSafeAccessoryViewController accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSMagSafeAccessorySleeveViewController _legibilitySettingsForAccessory:](self, "_legibilitySettingsForAccessory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSMagSafeAccessorySleeveViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_sleeveView);

  -[SBFLockScreenDateViewController dateView](self->_dateViewController, "dateView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLegibilitySettings:", self->_legibilitySettings);

  -[SBFLockScreenDateViewController setRestrictsVibrancy:](self->_dateViewController, "setRestrictsVibrancy:", 1);
  -[SBFLockScreenDateViewController dateView](self->_secondaryDateViewController, "dateView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLegibilitySettings:", v4);

  -[SBFLockScreenDateViewController setRestrictsVibrancy:](self->_secondaryDateViewController, "setRestrictsVibrancy:", 1);
  objc_initWeak(&location, self);
  dateViewController = self->_dateViewController;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke;
  v16[3] = &unk_1E8E303B0;
  objc_copyWeak(&v18, &location);
  v10 = v4;
  v17 = v10;
  -[CSMagSafeAccessorySleeveViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", dateViewController, 0, v16);
  secondaryDateViewController = self->_secondaryDateViewController;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke_2;
  v13[3] = &unk_1E8E303B0;
  objc_copyWeak(&v15, &location);
  v12 = v10;
  v14 = v12;
  -[CSMagSafeAccessorySleeveViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", secondaryDateViewController, 0, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "sleeveView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "dateViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateView:", v7);

  objc_msgSend(WeakRetained, "sleeveView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "visibleBounds");
  objc_msgSend(v8, "setVisibleWindowFrame:");

  objc_msgSend(WeakRetained, "sleeveView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLegibilitySettings:", *(_QWORD *)(a1 + 32));

  v4[2](v4);
}

void __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "sleeveView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "secondaryDateViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryDateView:", v7);

  objc_msgSend(WeakRetained, "sleeveView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "visibleBounds");
  objc_msgSend(v8, "setVisibleWindowFrame:");

  objc_msgSend(WeakRetained, "sleeveView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLegibilitySettings:", *(_QWORD *)(a1 + 32));

  v4[2](v4);
}

- (id)_legibilitySettingsForAccessory:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CEADE8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "primaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithStyle:primaryColor:secondaryColor:shadowColor:", 1, v6, v7, 0);
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  BCBatteryDeviceController *v5;
  BCBatteryDeviceController *batteryDeviceController;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v7, sel_viewWillAppear_);
  -[CSMagSafeAccessorySleeveViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_dateViewController, 1, v3);
  if (!self->_batteryDeviceController)
  {
    v5 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E0D01B20]);
    batteryDeviceController = self->_batteryDeviceController;
    self->_batteryDeviceController = v5;

    -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](self->_batteryDeviceController, "addBatteryDeviceObserver:queue:", self, MEMORY[0x1E0C80D38]);
  }
  -[CSMagSafeAccessorySleeveViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_secondaryDateViewController, 1, v3);
  -[CSMagSafeAccessorySleeveViewController _updateOverrideFloor](self, "_updateOverrideFloor");
}

- (void)viewDidAppear:(BOOL)a3
{
  CSMagSafeAccessorySleeveView *sleeveView;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CSMagSafeAccessorySleeveViewController bs_endAppearanceTransitionForChildViewController:](self, "bs_endAppearanceTransitionForChildViewController:", self->_dateViewController);
  -[CSMagSafeAccessorySleeveViewController bs_endAppearanceTransitionForChildViewController:](self, "bs_endAppearanceTransitionForChildViewController:", self->_secondaryDateViewController);
  sleeveView = self->_sleeveView;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CSMagSafeAccessorySleeveViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_1E8E2DB38;
  v5[4] = self;
  -[CSMagSafeAccessorySleeveView performAnimation:completionHandler:](sleeveView, "performAnimation:completionHandler:", 0, v5);
}

void __56__CSMagSafeAccessorySleeveViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendAction:", v2);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[CSMagSafeAccessorySleeveViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_dateViewController, 0, v3);
  -[CSMagSafeAccessorySleeveViewController bs_beginAppearanceTransitionForChildViewController:toVisible:animated:](self, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", self->_secondaryDateViewController, 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BCBatteryDeviceController *batteryDeviceController;
  BCBatteryDeviceController *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[CSMagSafeAccessorySleeveViewController bs_endAppearanceTransitionForChildViewController:](self, "bs_endAppearanceTransitionForChildViewController:", self->_dateViewController);
  -[CSMagSafeAccessorySleeveViewController bs_endAppearanceTransitionForChildViewController:](self, "bs_endAppearanceTransitionForChildViewController:", self->_secondaryDateViewController);
  batteryDeviceController = self->_batteryDeviceController;
  if (batteryDeviceController)
  {
    -[BCBatteryDeviceController removeBatteryDeviceObserver:](batteryDeviceController, "removeBatteryDeviceObserver:", self);
    v5 = self->_batteryDeviceController;
    self->_batteryDeviceController = 0;

  }
  -[CSMagSafeAccessorySleeveViewController _removeOverrideFloor](self, "_removeOverrideFloor");
}

- (void)setDateProvider:(id)a3
{
  SBFLockScreenDateViewController *dateViewController;
  id v5;

  dateViewController = self->_dateViewController;
  v5 = a3;
  -[SBFLockScreenDateViewController setDateProvider:](dateViewController, "setDateProvider:", v5);
  -[SBFLockScreenDateViewController setDateProvider:](self->_secondaryDateViewController, "setDateProvider:", v5);

}

- (void)setVisibleBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CSMagSafeAccessorySleeveView visibleWindowFrame](self->_sleeveView, "visibleWindowFrame");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  if (!CGRectEqualToRect(v8, v9))
  {
    self->_visibleBounds.origin.x = x;
    self->_visibleBounds.origin.y = y;
    self->_visibleBounds.size.width = width;
    self->_visibleBounds.size.height = height;
    -[CSMagSafeAccessorySleeveView setVisibleWindowFrame:](self->_sleeveView, "setVisibleWindowFrame:", x, y, width, height);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UILegibilitySettings *v11;

  v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFLockScreenDateViewController dateViewIfExists](self->_dateViewController, "dateViewIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", self->_legibilitySettings);

    -[CSMagSafeAccessoryViewController accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSMagSafeAccessorySleeveViewController _legibilitySettingsForAccessory:](self, "_legibilitySettingsForAccessory:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFLockScreenDateViewController dateViewIfExists](self->_secondaryDateViewController, "dateViewIfExists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLegibilitySettings:", v8);

    -[CSMagSafeAccessorySleeveViewController sleeveView](self, "sleeveView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLegibilitySettings:", v8);

    v5 = v11;
  }

}

- (void)updateFont:(id)a3 textColor:(id)a4 vibrancyConfiguration:(id)a5 numberingSystem:(id)a6
{
  SBFLockScreenDateViewController *dateViewController;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  dateViewController = self->_dateViewController;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[SBFLockScreenDateViewController dateView](dateViewController, "dateView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setVibrancyConfiguration:", v12);

  -[SBFLockScreenDateViewController dateView](self->_dateViewController, "dateView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v13);

  -[SBFLockScreenDateViewController dateView](self->_dateViewController, "dateView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCustomTimeFont:", v14);

  -[SBFLockScreenDateViewController dateView](self->_dateViewController, "dateView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCustomTimeNumberingSystem:", v11);

  -[SBFLockScreenDateViewController dateView](self->_secondaryDateViewController, "dateView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setVibrancyConfiguration:", v12);

  -[SBFLockScreenDateViewController dateView](self->_secondaryDateViewController, "dateView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCustomTimeFont:", v14);

  -[SBFLockScreenDateViewController dateView](self->_secondaryDateViewController, "dateView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCustomTimeNumberingSystem:", v11);

}

- (void)updateViewWithBatteryCharging:(BOOL)a3
{
  -[CSMagSafeAccessorySleeveView setCharging:](self->_sleeveView, "setCharging:", a3);
}

- (BOOL)isStatic
{
  return 1;
}

- (BOOL)hasChargingAnimation
{
  return 1;
}

- (BOOL)allowsQuickDismissal
{
  return 0;
}

- (BOOL)showingChargingAnimation
{
  return self->_chargingAnimationVisible;
}

- (double)chargingAnimationDuration
{
  return 3.0;
}

- (id)accessoryView
{
  return self->_sleeveView;
}

- (double)animationDurationBeforeDismissal
{
  double result;

  -[CSMagSafeAccessorySleeveView animationDurationBeforeDismissal](self->_sleeveView, "animationDurationBeforeDismissal");
  return result;
}

- (void)transitionChargingViewVisible:(BOOL)a3 chargingInfo:(id)a4
{
  -[CSMagSafeAccessorySleeveView transitionChargingViewVisible:chargingInfo:](self->_sleeveView, "transitionChargingViewVisible:chargingInfo:", a3, a4);
  self->_chargingAnimationVisible = a3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  v4 = a3;
  -[CSMagSafeAccessoryViewController handleEvent:](&v7, sel_handleEvent_, v4);
  v5 = objc_msgSend(v4, "type", v7.receiver, v7.super_class);

  if (v5 == 24)
  {
    -[CSMagSafeAccessorySleeveViewController _updateOverrideFloor](self, "_updateOverrideFloor");
    return 1;
  }
  if (v5 == 25)
  {
    -[CSMagSafeAccessorySleeveViewController _removeOverrideFloor](self, "_removeOverrideFloor");
    return 1;
  }
  return 0;
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "isInternal"))
          -[CSMagSafeAccessorySleeveViewController updateViewWithBatteryCharging:](self, "updateViewWithBatteryCharging:", objc_msgSend(v9, "isCharging"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_updateOverrideFloor
{
  void *v3;
  void *v4;
  BrightnessSystemClient *v5;
  BrightnessSystemClient *brightnessClient;
  BrightnessSystemClient *v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chargingSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "shouldUseBrightnessFloor"))
  {
    if (!self->_brightnessClient)
    {
      v5 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
      brightnessClient = self->_brightnessClient;
      self->_brightnessClient = v5;

    }
    objc_msgSend(v4, "brightnessFloor");
    v7 = self->_brightnessClient;
    *(float *)&v8 = v8;
    v11[0] = CFSTR("nits");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("period");
    v12[0] = v9;
    v12[1] = &unk_1E8E87EF0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrightnessSystemClient setProperty:forKey:](v7, "setProperty:forKey:", v10, CFSTR("MinNits"));

  }
  else
  {
    -[CSMagSafeAccessorySleeveViewController _removeOverrideFloor](self, "_removeOverrideFloor");
  }

}

- (void)_removeOverrideFloor
{
  BrightnessSystemClient *brightnessClient;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  brightnessClient = self->_brightnessClient;
  v4[0] = CFSTR("nits");
  v4[1] = CFSTR("period");
  v5[0] = &unk_1E8E87F00;
  v5[1] = &unk_1E8E87EF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrightnessSystemClient setProperty:forKey:](brightnessClient, "setProperty:forKey:", v3, CFSTR("MinNits"));

}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBFDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (SBFLockScreenDateViewController)dateViewController
{
  return self->_dateViewController;
}

- (void)setDateViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dateViewController, a3);
}

- (SBFLockScreenDateViewController)secondaryDateViewController
{
  return self->_secondaryDateViewController;
}

- (void)setSecondaryDateViewController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryDateViewController, a3);
}

- (BCBatteryDeviceController)batteryDeviceController
{
  return self->_batteryDeviceController;
}

- (void)setBatteryDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDeviceController, a3);
}

- (CSMagSafeAccessorySleeveView)sleeveView
{
  return self->_sleeveView;
}

- (void)setSleeveView:(id)a3
{
  objc_storeStrong((id *)&self->_sleeveView, a3);
}

- (BOOL)chargingAnimationVisible
{
  return self->_chargingAnimationVisible;
}

- (void)setChargingAnimationVisible:(BOOL)a3
{
  self->_chargingAnimationVisible = a3;
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessClient, 0);
  objc_storeStrong((id *)&self->_sleeveView, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_secondaryDateViewController, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
