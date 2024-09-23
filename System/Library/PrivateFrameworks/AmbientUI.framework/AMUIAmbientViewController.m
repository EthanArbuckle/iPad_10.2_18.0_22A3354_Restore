@implementation AMUIAmbientViewController

- (AMUIAmbientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AMUIAmbientViewController *v4;
  AMUIAmbientViewController *v5;
  void *v6;
  AMUIPosterSwitcherViewController *v7;
  AMUIPosterSwitcherViewController *posterSwitcherViewController;
  uint64_t v9;
  AMUIPosterSwitcherModel *posterSwitcherModel;
  AMUIBatteryChargingViewController *v11;
  AMUIBatteryChargingViewController *batteryChargingViewController;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMUIAmbientViewController;
  v4 = -[AMUIAmbientViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AMUIAmbientViewController _defaultPosterSelectionCoordinator](v4, "_defaultPosterSelectionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v5);
    objc_storeWeak((id *)&v5->_posterSelectionCoordinator, v6);
    v7 = objc_alloc_init(AMUIPosterSwitcherViewController);
    posterSwitcherViewController = v5->_posterSwitcherViewController;
    v5->_posterSwitcherViewController = v7;

    -[AMUIPosterSwitcherViewController setDelegate:](v5->_posterSwitcherViewController, "setDelegate:", v5);
    +[AMUIPosterSwitcherModel sharedInstance](AMUIPosterSwitcherModel, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    posterSwitcherModel = v5->_posterSwitcherModel;
    v5->_posterSwitcherModel = (AMUIPosterSwitcherModel *)v9;

    -[AMUIPosterSwitcherModel addObserver:](v5->_posterSwitcherModel, "addObserver:", v5);
    -[AMUIAmbientViewController _refreshPosterConfigurationsAnimated:](v5, "_refreshPosterConfigurationsAnimated:", 0);
    v11 = objc_alloc_init(AMUIBatteryChargingViewController);
    batteryChargingViewController = v5->_batteryChargingViewController;
    v5->_batteryChargingViewController = v11;

  }
  return v5;
}

- (void)dealloc
{
  AMUIBatteryChargingViewController *batteryChargingViewController;
  objc_super v4;

  -[AMUIPosterSwitcherViewController invalidate](self->_posterSwitcherViewController, "invalidate");
  -[AMUIPosterSwitcherModel removeObserver:](self->_posterSwitcherModel, "removeObserver:", self);
  batteryChargingViewController = self->_batteryChargingViewController;
  self->_batteryChargingViewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)AMUIAmbientViewController;
  -[AMUIAmbientViewController dealloc](&v4, sel_dealloc);
}

+ (void)prewarm
{
  id v2;

  v2 = +[AMUIPosterSwitcherModel sharedInstance](AMUIPosterSwitcherModel, "sharedInstance");
}

- (void)setConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  -[AMUIPosterSwitcherViewController updatePosterConfiguration:withAnimationSettings:](self->_posterSwitcherViewController, "updatePosterConfiguration:withAnimationSettings:", a3, a4);
}

- (BOOL)handleDismiss
{
  if (!self->_posterEditingSwitcherVC)
    return -[AMUIPosterSwitcherViewController handleDismiss](self->_posterSwitcherViewController, "handleDismiss");
  -[AMUIPosterEditingSwitcherViewController handleDismiss](self->_posterEditingSwitcherVC, "handleDismiss");
  return 1;
}

- (void)invalidate
{
  -[AMUIPosterSwitcherViewController invalidate](self->_posterSwitcherViewController, "invalidate");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  AMAmbientDefaults *v6;
  AMAmbientDefaults *ambientDefaults;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(obj, "ambientDefaultsForAmbientViewController:", self);
      v6 = (AMAmbientDefaults *)objc_claimAutoreleasedReturnValue();
      ambientDefaults = self->_ambientDefaults;
      self->_ambientDefaults = v6;

      -[AMUIDefaultSelectedPosterCoordinator setAmbientDefaults:](self->_defaultPosterSelectionCoordinator, "setAmbientDefaults:", self->_ambientDefaults);
    }
    -[AMUIPosterSwitcherViewController noteAmbientViewControllingDelegateDidUpdate](self->_posterSwitcherViewController, "noteAmbientViewControllingDelegateDidUpdate");
    v5 = obj;
  }

}

- (void)setNotificationCount:(unint64_t)a3
{
  AMUINotificationIndicatorView *notificationIndicatorView;
  id v5;

  if (self->_notificationCount != a3)
  {
    self->_notificationCount = a3;
    if (a3)
    {
      notificationIndicatorView = self->_notificationIndicatorView;
      if (notificationIndicatorView)
        -[AMUINotificationIndicatorView setNotificationCount:](notificationIndicatorView, "setNotificationCount:");
    }
    else
    {
      -[AMUIAmbientViewController _animateNotificationIndicatorViewRemoval](self, "_animateNotificationIndicatorViewRemoval");
    }
    -[AMUIAmbientViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (UIView)contentView
{
  return -[AMUIPosterSwitcherViewController contentView](self->_posterSwitcherViewController, "contentView");
}

- (UIView)backgroundView
{
  return -[AMUIPosterSwitcherViewController backgroundView](self->_posterSwitcherViewController, "backgroundView");
}

- (void)_setPosterSelectionCoordinator:(id)a3
{
  id v4;
  AMUIPosterSelectionCoordinating **p_posterSelectionCoordinator;
  id WeakRetained;
  void *v7;
  id obj;

  v4 = a3;
  if (!v4)
  {
    -[AMUIAmbientViewController _defaultPosterSelectionCoordinator](self, "_defaultPosterSelectionCoordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  p_posterSelectionCoordinator = &self->_posterSelectionCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)p_posterSelectionCoordinator);

  v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_posterSelectionCoordinator, obj);
    v7 = obj;
  }

}

- (void)setDateProvider:(id)a3
{
  AMUIDateProviding **p_dateProvider;
  id v6;

  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  v6 = a3;
  -[AMUIPosterSwitcherViewController setDateProvider:](self->_posterSwitcherViewController, "setDateProvider:", *p_dateProvider);

}

- (PRSPosterConfiguration)activeConfiguration
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
  objc_msgSend(WeakRetained, "lastSelectedPosterConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AMUIPosterSwitcherViewController mostVisibleConfiguration](self->_posterSwitcherViewController, "mostVisibleConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PRSPosterConfiguration *)v4;
}

- (NSDictionary)activeConfigurationMetadata
{
  return -[AMUIPosterSwitcherViewController activeConfigurationMetadata](self->_posterSwitcherViewController, "activeConfigurationMetadata");
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_authenticated != a3)
  {
    self->_authenticated = a3;
    -[AMUIAmbientViewController _handleAuthenticationChanged:](self, "_handleAuthenticationChanged:");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMUIAmbientViewController;
  -[AMUIAmbientViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[AMUIAmbientViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("amui-ambient-view"));
  -[AMUIPosterSwitcherViewController view](self->_posterSwitcherViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[AMUIAmbientViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_posterSwitcherViewController);
  -[AMUIAmbientViewController _setupPosterEditingSwitcherGestureRecognizer](self, "_setupPosterEditingSwitcherGestureRecognizer");
  -[AMUIAmbientViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_batteryChargingViewController);
  -[AMUIAmbientViewController _updateBatteryViewLayout](self, "_updateBatteryViewLayout");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIAmbientViewController;
  -[AMUIAmbientViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AMUIAmbientViewController _animateBatteryViewAppearanceIfNecessary](self, "_animateBatteryViewAppearanceIfNecessary");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIAmbientViewController;
  -[AMUIAmbientViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AMUIAmbientViewController _configureNotificationIndicatorViewIfNecessary](self, "_configureNotificationIndicatorViewIfNecessary");
  -[AMUIAmbientViewController _updateNotificationIndicatorViewLayout](self, "_updateNotificationIndicatorViewLayout");
  -[AMUIAmbientViewController _updateBatteryViewLayout](self, "_updateBatteryViewLayout");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AMUIAmbientViewController;
  -[AMUIAmbientViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[AMUIAmbientViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(self->_lastViewFrame, v20))
  {
    self->_lastViewFrame.origin.x = v5;
    self->_lastViewFrame.origin.y = v7;
    self->_lastViewFrame.size.width = v9;
    self->_lastViewFrame.size.height = v11;
    -[AMUIPosterSwitcherModel activeConfiguration](self->_posterSwitcherModel, "activeConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AMUILogSwitcher();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "serverUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_23600A000, v13, OS_LOG_TYPE_DEFAULT, "switcher resetting scroll position after layout (scrolling to %{public}@)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDF6F90], "_currentAnimationSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIAmbientViewController setConfiguration:withAnimationSettings:](self, "setConfiguration:withAnimationSettings:", v12, v15);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  AMUIPosterEditingSwitcherViewController *posterEditingSwitcherVC;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMUIAmbientViewController;
  -[AMUIAmbientViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AMUIAmbientViewController _animateBatteryViewDismissalIfNecessary](self, "_animateBatteryViewDismissalIfNecessary");
  if (-[AMUIAmbientViewController isConfiguringUIVisible](self, "isConfiguringUIVisible"))
  {
    posterEditingSwitcherVC = self->_posterEditingSwitcherVC;
    if (posterEditingSwitcherVC)
      -[AMUIPosterEditingSwitcherViewController handleDismiss](posterEditingSwitcherVC, "handleDismiss");
    else
      -[AMUIAmbientViewController _willEndConfiguration](self, "_willEndConfiguration");
  }
}

- (void)_setupPosterEditingSwitcherGestureRecognizer
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *posterEditingSwitcherGestureRecognizer;
  void *v5;
  UINotificationFeedbackGenerator *v6;
  UINotificationFeedbackGenerator *posterEditingSwitcherFeedbackGenerator;

  if (!self->_posterEditingSwitcherGestureRecognizer)
  {
    v3 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", self, sel__handlePosterEditingSwitcherGesture_);
    posterEditingSwitcherGestureRecognizer = self->_posterEditingSwitcherGestureRecognizer;
    self->_posterEditingSwitcherGestureRecognizer = v3;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_posterEditingSwitcherGestureRecognizer, "setMinimumPressDuration:", 0.3);
    -[UILongPressGestureRecognizer setDelegate:](self->_posterEditingSwitcherGestureRecognizer, "setDelegate:", self);
    -[AMUIAmbientViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->_posterEditingSwitcherGestureRecognizer);

  }
  if (!self->_posterEditingSwitcherFeedbackGenerator)
  {
    v6 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BDF6C10]);
    posterEditingSwitcherFeedbackGenerator = self->_posterEditingSwitcherFeedbackGenerator;
    self->_posterEditingSwitcherFeedbackGenerator = v6;

  }
}

- (void)_handlePosterEditingSwitcherGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  AMUIConcreteUnlockRequest *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  id v14;
  id buf[2];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    AMUILogEditingSwitcher();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Poster Editing Switcher - gesture recognized", (uint8_t *)buf, 2u);
    }

    -[AMUIPosterSwitcherViewController view](self->_posterSwitcherViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__AMUIAmbientViewController__handlePosterEditingSwitcherGesture___block_invoke;
    v12[3] = &unk_250763788;
    objc_copyWeak(&v14, buf);
    v7 = v6;
    v13 = v7;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7EA970](v12);
    -[AMUIAmbientViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_alloc_init(AMUIConcreteUnlockRequest);
      objc_msgSend(v9, "ambientViewController:requestsUnlock:withCompletion:", self, v10, v8);
    }
    else
    {
      if (objc_msgSend(v9, "ambientViewControllerIsAuthenticated:", self))
      {
        v8[2](v8, 1);
        goto LABEL_9;
      }
      -[UINotificationFeedbackGenerator notificationOccurred:](self->_posterEditingSwitcherFeedbackGenerator, "notificationOccurred:", 2);
      AMUILogEditingSwitcher();
      v10 = (AMUIConcreteUnlockRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_23600A000, &v10->super, OS_LOG_TYPE_DEFAULT, "Poster Editing Switcher - gesture failed because device has not been authenticated", v11, 2u);
      }
    }

LABEL_9:
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);

  }
}

void __65__AMUIAmbientViewController__handlePosterEditingSwitcherGesture___block_invoke(uint64_t a1, int a2)
{
  NSObject *WeakRetained;
  NSObject *v4;
  NSObject *v5;
  Class isa;
  AMUIPosterEditingSwitcherViewController *v7;
  void *v8;
  void *v9;
  Class v10;
  AMUIPosterEditingSwitcherViewController *v11;
  int v12;
  Class v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      -[NSObject _willBeginConfiguration](WeakRetained, "_willBeginConfiguration");
      AMUILogEditingSwitcher();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        isa = v4[130].isa;
        v12 = 138543362;
        v13 = isa;
        _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_DEFAULT, "Presenting Poster Editing Switcher with activeConfig: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      v7 = -[AMUIPosterEditingSwitcherViewController initWithActiveConfiguration:transitionOverlayView:]([AMUIPosterEditingSwitcherViewController alloc], "initWithActiveConfiguration:transitionOverlayView:", v4[130].isa, *(_QWORD *)(a1 + 32));
      -[AMUIPosterEditingSwitcherViewController setDelegate:](v7, "setDelegate:", v4);
      -[AMUIPosterEditingSwitcherViewController view](v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject view](v4, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      objc_msgSend(v8, "setFrame:");

      objc_msgSend(v8, "setAutoresizingMask:", 18);
      -[NSObject bs_addChildViewController:](v4, "bs_addChildViewController:", v7);
      v10 = v4[129].isa;
      v4[129].isa = (Class)v7;
      v11 = v7;

      -[objc_class notificationOccurred:](v4[128].isa, "notificationOccurred:", 0);
    }
  }
  else
  {
    AMUILogEditingSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_23600A000, v4, OS_LOG_TYPE_DEFAULT, "Not presenting Poster Editing Switcher because device authentication failed", (uint8_t *)&v12, 2u);
    }
  }

}

- (void)_dismissPosterEditingSwitcher
{
  AMUIPosterEditingSwitcherViewController *posterEditingSwitcherVC;

  if (self->_posterEditingSwitcherVC)
  {
    -[AMUIAmbientViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    posterEditingSwitcherVC = self->_posterEditingSwitcherVC;
    self->_posterEditingSwitcherVC = 0;

    -[AMUIAmbientViewController _willEndConfiguration](self, "_willEndConfiguration");
  }
}

- (void)posterSwitcherModel:(id)a3 didUpdateConfigurations:(id)a4
{
  -[AMUIAmbientViewController _refreshPosterConfigurationsAnimated:](self, "_refreshPosterConfigurationsAnimated:", 1, a4);
}

- (void)posterSwitcherModel:(id)a3 didUpdateActiveConfiguration:(id)a4
{
  -[AMUIAmbientViewController setConfiguration:withAnimationSettings:](self, "setConfiguration:withAnimationSettings:", a4, 0);
}

- (void)posterSwitcherViewController:(id)a3 didSettleOnConfiguration:(id)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  AMUILogSwitcher();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "switcher didSettleOnConfiguration:%@ interactive:%{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
  objc_msgSend(WeakRetained, "updateLastSelectedPosterConfiguration:fromUserAction:", v7, v5);

}

- (void)posterSwitcherViewController:(id)a3 willSwitchFromConfiguration:(id)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  AMUILogSwitcher();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "switcher willSwitchFromConfiguration:%@ interactive:%{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
  objc_msgSend(WeakRetained, "updateLastSelectedPosterConfiguration:fromUserAction:", v7, v5);

}

- (void)posterSwitcherViewController:(id)a3 isTransitioningSettled:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "ambientViewController:isTransitioningSettled:", self, v4);
      v7 = v9;
    }
  }

}

- (id)createUnlockRequestForViewController:(id)a3
{
  return objc_alloc_init(AMUIConcreteUnlockRequest);
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[AMUIAmbientViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "ambientViewController:requestsUnlock:withCompletion:", self, v9, v7);

}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  -[AMUIAmbientViewController _willBeginConfiguration](self, "_willBeginConfiguration", a3);
  -[AMUIPosterSwitcherViewController setSwitchingEnabled:](self->_posterSwitcherViewController, "setSwitchingEnabled:", 0);
}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  -[AMUIAmbientViewController _willEndConfiguration](self, "_willEndConfiguration", a3);
  -[AMUIPosterSwitcherViewController setSwitchingEnabled:](self->_posterSwitcherViewController, "setSwitchingEnabled:", 1);
}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMUIAmbientViewController activeConfiguration](self, "activeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ambientViewController:didUpdateActiveConfiguration:withMetadata:", self, v6, v7);

  }
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  -[AMUIAmbientViewController setTemporaryOverlayVisible:](self, "setTemporaryOverlayVisible:", 1);
  -[AMUIAmbientViewController _animateAllOverlayUIDismissal](self, "_animateAllOverlayUIDismissal");
}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  -[AMUIAmbientViewController setTemporaryOverlayVisible:](self, "setTemporaryOverlayVisible:", 0);
  -[AMUIAmbientViewController _animateAllOverlayUIAppearance](self, "_animateAllOverlayUIAppearance");
}

- (id)widgetHostManagerForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "widgetHostManagerForAmbientViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  return self->_ambientDefaults;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "defaultWidgetDescriptorStacksForAmbientViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "ambientViewController:isApplicationVisibleWithBundleIdentifier:", self, v5);
  else
    v7 = 0;

  return v7;
}

- (BOOL)posterSwitcherViewControllerIsAuthenticated:(id)a3
{
  AMUIAmbientViewController *v3;
  void *v4;

  v3 = self;
  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "ambientViewControllerIsAuthenticated:", v3);

  return (char)v3;
}

- (id)posterSwitcherViewControllerAuthenticationHandler:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "ambientViewControllerAuthenticationHandler:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)posterSwitcherViewController:(id)a3 didSetPasscodeVisible:(BOOL)a4
{
  -[AMUIAmbientViewController _setNotificationIndicatorHidden:](self, "_setNotificationIndicatorHidden:", a4);
}

- (void)posterSwitcherViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "ambientViewController:didSetInlineAuthenticationViewVisible:", self, v4);

}

- (void)posterSwitcherViewControllerDidSuccessfullyCompleteInlineAuthentication:(id)a3
{
  self->_hasInlineAuthenticated = 1;
}

- (BOOL)posterSwitcherViewControllerHasInlineAuthenticated:(id)a3
{
  return self->_hasInlineAuthenticated;
}

- (id)posterSwitcherViewController:(id)a3 requestsLastSelectedConfigurationUUIDForProviderBundleIdentifier:(id)a4
{
  AMUIPosterSelectionCoordinating **p_posterSelectionCoordinator;
  id v5;
  id WeakRetained;
  void *v7;

  p_posterSelectionCoordinator = &self->_posterSelectionCoordinator;
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_posterSelectionCoordinator);
  objc_msgSend(WeakRetained, "lastSelectedPosterConfigurationUUIDForProviderBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)posterSwitcherViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "ambientViewController:didSetBiometricAuthenticationDisabled:", self, v4);

}

- (BOOL)posterSwitcherViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;

  v4 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "ambientViewController:wantsBiometricAuthenticationBlockedForDeepUserInteraction:", self, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  PRSPosterConfiguration *posterConfigurationForEditingSwitcher;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  PRSPosterConfiguration *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isEqual:", self->_posterEditingSwitcherGestureRecognizer))
  {
    posterConfigurationForEditingSwitcher = self->_posterConfigurationForEditingSwitcher;
    self->_posterConfigurationForEditingSwitcher = 0;

    -[AMUIAmbientViewController activeConfiguration](self, "activeConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "pr_loadAmbientConfigurationWithError:", &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    AMUILogEditingSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[AMUIAmbientViewController activeConfiguration](self, "activeConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v10;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_23600A000, v9, OS_LOG_TYPE_DEFAULT, "Checking if editing gesture recognizer should begin for activeConfig: %{public}@ with ambientConfig: %{public}@", buf, 0x16u);

      }
      v11 = objc_msgSend(v6, "editingBehavior");
      v12 = objc_msgSend(v6, "deletionBehavior");
      if (v11 == 1 && v12 == 2)
        goto LABEL_14;
      objc_msgSend(v5, "providerBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ambient.AmbientUI.InfographPoster"));

      if (!v14)
      {
        v16 = self->_posterConfigurationForEditingSwitcher;
        self->_posterConfigurationForEditingSwitcher = (PRSPosterConfiguration *)v5;
        v15 = 1;
        v5 = v6;
        goto LABEL_15;
      }
      AMUILogEditingSwitcher();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AMUIAmbientViewController gestureRecognizerShouldBegin:].cold.2(v9);
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[AMUIAmbientViewController gestureRecognizerShouldBegin:].cold.1((uint64_t)self, (uint64_t)v7, v9);
    }

LABEL_14:
    v15 = 0;
    v16 = (PRSPosterConfiguration *)v6;
LABEL_15:

    return v15;
  }
  return 1;
}

- (void)posterSelectionCoordinator:(id)a3 didUpdateLastSelectedPosterConfiguration:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[AMUIAmbientViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMUIAmbientViewController activeConfigurationMetadata](self, "activeConfigurationMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ambientViewController:didUpdateActiveConfiguration:withMetadata:", self, v7, v6);

  }
}

- (id)posterSelectionCoordinatorRequestsConnectedChargerId:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIAmbientViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "ambientViewControllerRequestsConnectedChargerId:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_refreshPosterConfigurationsAnimated:(BOOL)a3
{
  AMUIPosterSwitcherViewController *posterSwitcherViewController;
  void *v6;
  AMUIPosterSwitcherViewController *v7;
  void *v8;
  id v9;

  posterSwitcherViewController = self->_posterSwitcherViewController;
  -[AMUIPosterSwitcherModel posterConfigurations](self->_posterSwitcherModel, "posterConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPosterSwitcherViewController setConfigurations:](posterSwitcherViewController, "setConfigurations:", v6);

  v7 = self->_posterSwitcherViewController;
  -[AMUIPosterSwitcherModel activeConfiguration](self->_posterSwitcherModel, "activeConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:", 0.3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIPosterSwitcherViewController updatePosterConfiguration:withAnimationSettings:](v7, "updatePosterConfiguration:withAnimationSettings:", v9, v8);

  }
  else
  {
    -[AMUIPosterSwitcherViewController updatePosterConfiguration:withAnimationSettings:](v7, "updatePosterConfiguration:withAnimationSettings:", v9, 0);
  }

}

- (id)_defaultPosterSelectionCoordinator
{
  AMUIDefaultSelectedPosterCoordinator *defaultPosterSelectionCoordinator;
  AMUIDefaultSelectedPosterCoordinator *v4;
  AMUIDefaultSelectedPosterCoordinator *v5;

  defaultPosterSelectionCoordinator = self->_defaultPosterSelectionCoordinator;
  if (!defaultPosterSelectionCoordinator)
  {
    v4 = objc_alloc_init(AMUIDefaultSelectedPosterCoordinator);
    v5 = self->_defaultPosterSelectionCoordinator;
    self->_defaultPosterSelectionCoordinator = v4;

    -[AMUIDefaultSelectedPosterCoordinator setAmbientDefaults:](self->_defaultPosterSelectionCoordinator, "setAmbientDefaults:", self->_ambientDefaults);
    defaultPosterSelectionCoordinator = self->_defaultPosterSelectionCoordinator;
  }
  return defaultPosterSelectionCoordinator;
}

- (void)_animateAllOverlayUIAppearance
{
  -[AMUIAmbientViewController _animateNotificationIndicatorViewAppearanceIfNecessary](self, "_animateNotificationIndicatorViewAppearanceIfNecessary");
  -[AMUIAmbientViewController _animateBatteryViewAppearanceIfNecessary](self, "_animateBatteryViewAppearanceIfNecessary");
}

- (void)_animateAllOverlayUIDismissal
{
  -[AMUIAmbientViewController _animateNotificationIndicatorViewRemoval](self, "_animateNotificationIndicatorViewRemoval");
  -[AMUIAmbientViewController _animateBatteryViewDismissalIfNecessary](self, "_animateBatteryViewDismissalIfNecessary");
}

- (void)_willBeginConfiguration
{
  id v3;

  if (!-[AMUIAmbientViewController isConfiguringUIVisible](self, "isConfiguringUIVisible"))
  {
    -[AMUIAmbientViewController setConfiguringUIVisible:](self, "setConfiguringUIVisible:", 1);
    -[AMUIAmbientViewController _animateAllOverlayUIDismissal](self, "_animateAllOverlayUIDismissal");
    -[AMUIAmbientViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "ambientViewControllerWillBeginConfiguration:", self);

  }
}

- (void)_willEndConfiguration
{
  id v3;

  if (-[AMUIAmbientViewController isConfiguringUIVisible](self, "isConfiguringUIVisible"))
  {
    -[AMUIAmbientViewController setConfiguringUIVisible:](self, "setConfiguringUIVisible:", 0);
    -[AMUIAmbientViewController _animateAllOverlayUIAppearance](self, "_animateAllOverlayUIAppearance");
    -[AMUIAmbientViewController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "ambientViewControllerWillEndConfiguration:", self);

  }
}

- (void)_handleAuthenticationChanged:(BOOL)a3
{
  if (!a3)
    -[AMUIPosterEditingSwitcherViewController handleDismiss](self->_posterEditingSwitcherVC, "handleDismiss");
}

- (void)_configureNotificationIndicatorViewIfNecessary
{
  AMUINotificationIndicatorView *v3;
  AMUINotificationIndicatorView *notificationIndicatorView;
  void *v5;

  if (!self->_notificationIndicatorView)
  {
    if (-[AMUIAmbientViewController notificationCount](self, "notificationCount"))
    {
      v3 = -[AMUINotificationIndicatorView initWithNotificationCount:]([AMUINotificationIndicatorView alloc], "initWithNotificationCount:", -[AMUIAmbientViewController notificationCount](self, "notificationCount"));
      notificationIndicatorView = self->_notificationIndicatorView;
      self->_notificationIndicatorView = v3;

      -[AMUIAmbientViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSubview:", self->_notificationIndicatorView);

      -[AMUINotificationIndicatorView setAlpha:](self->_notificationIndicatorView, "setAlpha:", 0.0);
    }
  }
}

- (void)_animateNotificationIndicatorViewAppearanceIfNecessary
{
  AMUINotificationIndicatorView *notificationIndicatorView;
  double v4;
  _QWORD v5[5];

  notificationIndicatorView = self->_notificationIndicatorView;
  if (notificationIndicatorView)
  {
    -[AMUINotificationIndicatorView alpha](notificationIndicatorView, "alpha");
    if (v4 == 0.0
      && !-[AMUIAmbientViewController isConfiguringUIVisible](self, "isConfiguringUIVisible")
      && !-[AMUIAmbientViewController isTemporaryOverlayVisible](self, "isTemporaryOverlayVisible"))
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __83__AMUIAmbientViewController__animateNotificationIndicatorViewAppearanceIfNecessary__block_invoke;
      v5[3] = &unk_250763388;
      v5[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.2, 0.0);
    }
  }
}

uint64_t __83__AMUIAmbientViewController__animateNotificationIndicatorViewAppearanceIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAlpha:", 1.0);
}

- (void)_animateNotificationIndicatorViewRemoval
{
  AMUINotificationIndicatorView *notificationIndicatorView;
  AMUINotificationIndicatorView *v4;
  void *v5;
  uint64_t v6;
  AMUINotificationIndicatorView *v7;
  AMUINotificationIndicatorView *v8;
  _QWORD v9[4];
  AMUINotificationIndicatorView *v10;
  _QWORD v11[4];
  AMUINotificationIndicatorView *v12;

  notificationIndicatorView = self->_notificationIndicatorView;
  if (notificationIndicatorView)
  {
    v4 = notificationIndicatorView;
    v5 = (void *)MEMORY[0x24BDF6F90];
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke;
    v11[3] = &unk_250763388;
    v12 = v4;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke_2;
    v9[3] = &unk_2507637B0;
    v10 = v12;
    v7 = v12;
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0, v11, v9, 0.2, 0.0);
    v8 = self->_notificationIndicatorView;
    self->_notificationIndicatorView = 0;

  }
}

uint64_t __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_updateNotificationIndicatorViewLayout
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;

  if (self->_notificationIndicatorView)
  {
    -[AMUIAmbientViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringSubviewToFront:", self->_notificationIndicatorView);

    -[AMUIAmbientViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[AMUINotificationIndicatorView frame](self->_notificationIndicatorView, "frame");
    -[AMUINotificationIndicatorView sizeThatFits:](self->_notificationIndicatorView, "sizeThatFits:", v10, v12);
    UIRectCenteredXInRect();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19.origin.x = v6;
    v19.origin.y = v8;
    v19.size.width = v10;
    v19.size.height = v12;
    -[AMUINotificationIndicatorView setFrame:](self->_notificationIndicatorView, "setFrame:", v14, CGRectGetHeight(v19) * 0.02, v16, v18);
    -[AMUIAmbientViewController _animateNotificationIndicatorViewAppearanceIfNecessary](self, "_animateNotificationIndicatorViewAppearanceIfNecessary");
  }
}

- (void)_setNotificationIndicatorHidden:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self->_notificationIndicatorView);
  v4 = (void *)MEMORY[0x24BDF6F90];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__AMUIAmbientViewController__setNotificationIndicatorHidden___block_invoke;
  v5[3] = &unk_2507634F8;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.2, 0.0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__AMUIAmbientViewController__setNotificationIndicatorHidden___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(WeakRetained, "setAlpha:", v3);

}

- (void)_animateBatteryViewAppearanceIfNecessary
{
  AMUIBatteryChargingViewController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  AMUIBatteryChargingViewController *v8;
  _QWORD v9[4];
  AMUIBatteryChargingViewController *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (self->_batteryChargingViewController
    && !-[AMUIAmbientViewController isConfiguringUIVisible](self, "isConfiguringUIVisible")
    && !-[AMUIAmbientViewController isTemporaryOverlayVisible](self, "isTemporaryOverlayVisible")
    && (-[AMAmbientDefaults isFirstPresentation](self->_ambientDefaults, "isFirstPresentation") & 1) == 0)
  {
    v3 = self->_batteryChargingViewController;
    -[AMUIBatteryChargingViewController view](v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x24BDF6F90];
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke;
    v12[3] = &unk_250763388;
    v7 = v4;
    v13 = v7;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_2;
    v9[3] = &unk_2507637D8;
    v8 = v3;
    v10 = v8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0, v12, v9, 0.2, 0.0);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
}

uint64_t __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_3;
  v2[3] = &unk_2507633B0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "performChargingAnimation:", v2);
  objc_destroyWeak(&v3);
}

void __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_animateBatteryViewDismissalIfNecessary");

}

- (void)_animateBatteryViewDismissalIfNecessary
{
  AMUIBatteryChargingViewController *batteryChargingViewController;
  AMUIBatteryChargingViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  AMUIBatteryChargingViewController *v9;
  _QWORD v10[4];
  AMUIBatteryChargingViewController *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  batteryChargingViewController = self->_batteryChargingViewController;
  if (batteryChargingViewController)
  {
    v4 = batteryChargingViewController;
    -[AMUIBatteryChargingViewController view](v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x24BDF6F90];
    v7 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke;
    v13[3] = &unk_250763388;
    v8 = v5;
    v14 = v8;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke_2;
    v10[3] = &unk_250763788;
    objc_copyWeak(&v12, &location);
    v9 = v4;
    v11 = v9;
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v13, v10, 0.3, 0.0);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

uint64_t __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "bs_removeChildViewController:", *(_QWORD *)(a1 + 32));
    v3 = (void *)v4[126];
    v4[126] = 0;

    WeakRetained = v4;
  }

}

- (void)_updateBatteryViewLayout
{
  AMUIBatteryChargingViewController *batteryChargingViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  batteryChargingViewController = self->_batteryChargingViewController;
  if (batteryChargingViewController)
  {
    -[AMUIBatteryChargingViewController view](batteryChargingViewController, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[AMUIAmbientViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v8, "setBounds:");

    -[AMUIAmbientViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v8, "setFrame:");

    objc_msgSend(v8, "setAutoresizingMask:", 18);
    -[AMUIAmbientViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIBatteryChargingViewController view](self->_batteryChargingViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bringSubviewToFront:", v7);

  }
}

- (unint64_t)notificationCount
{
  return self->_notificationCount;
}

- (AMUIPosterSelectionCoordinating)_posterSelectionCoordinator
{
  return (AMUIPosterSelectionCoordinating *)objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (AMUIAmbientViewControllerDelegate)delegate
{
  return (AMUIAmbientViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isConfiguringUIVisible
{
  return self->_configuringUIVisible;
}

- (void)setConfiguringUIVisible:(BOOL)a3
{
  self->_configuringUIVisible = a3;
}

- (BOOL)isTemporaryOverlayVisible
{
  return self->_temporaryOverlayVisible;
}

- (void)setTemporaryOverlayVisible:(BOOL)a3
{
  self->_temporaryOverlayVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_destroyWeak((id *)&self->_posterSelectionCoordinator);
  objc_storeStrong((id *)&self->_posterConfigurationForEditingSwitcher, 0);
  objc_storeStrong((id *)&self->_posterEditingSwitcherVC, 0);
  objc_storeStrong((id *)&self->_posterEditingSwitcherFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_posterEditingSwitcherGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_batteryChargingViewController, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_defaultPosterSelectionCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationIndicatorView, 0);
  objc_storeStrong((id *)&self->_posterSwitcherModel, 0);
  objc_storeStrong((id *)&self->_posterSwitcherViewController, 0);
}

- (void)gestureRecognizerShouldBegin:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 968), "mostVisibleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_23600A000, a3, OS_LOG_TYPE_ERROR, "Failed to load ambient configuration from configuration %@ with error %@", (uint8_t *)&v6, 0x16u);

}

- (void)gestureRecognizerShouldBegin:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23600A000, log, OS_LOG_TYPE_ERROR, "Infograph is able to enter editing switcher but it should not be.", v1, 2u);
}

@end
