@implementation AMUIPosterViewController

- (void)setContentMode:(int64_t)a3
{
  AMUIPosterAppearanceTransitionCoordinator *v4;
  AMUIPosterAppearanceTransitionCoordinator *appearanceTransitionCoordinator;

  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    -[AMUIPosterViewController _updateStateForContentMode:](self, "_updateStateForContentMode:", -[AMUIPosterViewController effectiveContentMode](self, "effectiveContentMode"));
    self->_appearanceTransitionProgress = 1.0;
    v4 = objc_alloc_init(AMUIPosterAppearanceTransitionCoordinator);
    appearanceTransitionCoordinator = self->_appearanceTransitionCoordinator;
    self->_appearanceTransitionCoordinator = v4;

  }
}

- (int64_t)effectiveContentMode
{
  return self->_contentMode;
}

- (void)setAppearanceTransitionCoordinator:(id)a3
{
  AMUIPosterAppearanceTransitionCoordinator **p_appearanceTransitionCoordinator;
  AMUIPosterAppearanceTransitionCoordinator *v6;
  AMUIPosterAppearanceTransitionCoordinator *v7;
  AMUIPosterAppearanceTransitionCoordinator *v8;
  id v9;

  p_appearanceTransitionCoordinator = &self->_appearanceTransitionCoordinator;
  v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_appearanceTransitionCoordinator, a3);
    v6 = *p_appearanceTransitionCoordinator;
    if (!*p_appearanceTransitionCoordinator)
    {
      v7 = objc_alloc_init(AMUIPosterAppearanceTransitionCoordinator);
      v8 = *p_appearanceTransitionCoordinator;
      *p_appearanceTransitionCoordinator = v7;

      v6 = *p_appearanceTransitionCoordinator;
    }
    -[AMUIPosterAppearanceTransitionCoordinator setPosterViewController:progress:](v6, "setPosterViewController:progress:", self, self->_appearanceTransitionProgress);
  }

}

- (void)setAppearanceTransitionProgress:(double)a3
{
  self->_appearanceTransitionProgress = a3;
  -[AMUIPosterAppearanceTransitionCoordinator setPosterViewController:progress:](self->_appearanceTransitionCoordinator, "setPosterViewController:progress:", self);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UIView *v6;
  void *v7;
  UIView *touchBlockingView;
  UIView *v9;
  UIGestureRecognizer *v10;
  UIGestureRecognizer *tapGestureRecognizer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterViewController;
  -[AMUIPosterViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[AMUIPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(v3, "bounds");
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[UIView layer](v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHitTestsAsOpaque:", 1);

  objc_msgSend(v3, "addSubview:", v6);
  touchBlockingView = self->_touchBlockingView;
  self->_touchBlockingView = v6;
  v9 = v6;

  v10 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__triggerTapEvent_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v10;

  -[UIGestureRecognizer setName:](self->_tapGestureRecognizer, "setName:", CFSTR("AmbientTap"));
  -[UIView addGestureRecognizer:](self->_touchBlockingView, "addGestureRecognizer:", self->_tapGestureRecognizer);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  -[AMUIPosterViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AMUIPosterViewController _evaluateAuthenticationWithConfiguration:](self, "_evaluateAuthenticationWithConfiguration:", self->_configuration);
  -[PRUISAmbientPosterViewController setVisibility:](self->_posterViewController, "setVisibility:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  -[AMUIPosterViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRUISAmbientPosterViewController setVisibility:](self->_posterViewController, "setVisibility:", 2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  -[AMUIPosterViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PRUISAmbientPosterViewController setVisibility:](self->_posterViewController, "setVisibility:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  -[AMUIPosterViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PRUISAmbientPosterViewController setVisibility:](self->_posterViewController, "setVisibility:", 0);
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v7;
  id v8;
  PRUISAmbientPosterViewController **p_posterViewController;
  char v10;
  PRUISAmbientPosterViewController *v11;
  PRUISAmbientPosterViewController *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PRUISAmbientPosterViewController *v19;
  void *v20;
  PRUISAmbientPosterViewController *v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  AMUIPosterViewController *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  PRUISAmbientPosterViewController *v34;

  v7 = a3;
  v8 = a4;
  p_posterViewController = &self->_posterViewController;
  if ((-[PRUISAmbientPosterViewController updateConfiguration:](self->_posterViewController, "updateConfiguration:", v7) & 1) != 0)
  {
    v10 = 1;
  }
  else if (v7)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    v11 = *p_posterViewController;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke;
    v33[3] = &unk_250763400;
    v33[4] = self;
    v12 = v11;
    v34 = v12;
    v13 = (void *)MEMORY[0x23B7EA970](v33);
    v14 = objc_alloc_init((Class)getPRUISAmbientPosterViewControllerClass());
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIPosterViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "setFrame:");

    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v15, "setAlpha:", 0.0);
    if (v8)
    {
      objc_msgSend(v15, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAllowsGroupOpacity:", 1);

    }
    -[AMUIPosterViewController bs_addChildViewController:](self, "bs_addChildViewController:", v14);
    -[AMUIPosterViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bringSubviewToFront:", self->_touchBlockingView);

    objc_storeStrong((id *)&self->_posterViewController, v14);
    -[PRUISAmbientPosterViewController setDelegate:](*p_posterViewController, "setDelegate:", self);
    v19 = *p_posterViewController;
    -[AMUIPosterViewController _snapshotController](self, "_snapshotController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISAmbientPosterViewController setSnapshotController:](v19, "setSnapshotController:", v20);

    -[PRUISAmbientPosterViewController setVisibleSnapshotLayers:](*p_posterViewController, "setVisibleSnapshotLayers:", 1);
    v10 = -[PRUISAmbientPosterViewController updateConfiguration:](*p_posterViewController, "updateConfiguration:", v7);
    v21 = *p_posterViewController;
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2;
    v28 = &unk_250763520;
    v29 = self;
    v30 = v14;
    v31 = v8;
    v32 = v13;
    v22 = v13;
    v23 = v14;
    -[PRUISAmbientPosterViewController activateWithCompletion:](v21, "activateWithCompletion:", &v25);
    -[AMUIPosterViewController _updateStateForContentMode:](self, "_updateStateForContentMode:", -[AMUIPosterViewController effectiveContentMode](self, "effectiveContentMode", v25, v26, v27, v28, v29));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  BSDispatchQueueAssertMain();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  if (v2 == *(void **)(a1 + 40))
  {
    v3 = (void *)MEMORY[0x24BE0BF08];
    v4 = *(_QWORD *)(a1 + 48);
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3;
    v8[3] = &unk_250763388;
    v9 = v2;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_4;
    v6[3] = &unk_250763330;
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v3, "animateWithSettings:actions:completion:", v4, v8, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  -[PRUISAmbientPosterViewController invalidate](self->_posterViewController, "invalidate");
}

+ (NSArray)suggestedInstanceIdentifiers
{
  return (NSArray *)objc_msgSend(getPRUISAmbientPosterViewControllerClass(), "suggestedInstanceIdentifiers");
}

- (BOOL)handleDismiss
{
  return 0;
}

- (NSDictionary)activeConfigurationMetadata
{
  return 0;
}

- (void)ambientPosterViewController:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  -[AMUIPosterViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "posterViewController:setChromeVisibility:withAnimationSettings:animationFence:", self, v7, v10, v9);

}

- (id)ambientPosterViewControllerRequestExtensionInstanceIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterViewControllerRequestExtensionInstanceIdentifier:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)ambientPosterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AMUIPosterViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterViewController:relinquishExtensionInstanceIdentifier:", self, v5);

}

- (unint64_t)ambientPosterViewController:(id)a3 titleAlignmentForInterfaceOrientation:(int64_t)a4
{
  int64_t chromeOrientationPolicy;

  chromeOrientationPolicy = self->_chromeOrientationPolicy;
  if (chromeOrientationPolicy == 2)
  {
    if (a4 == 3)
      return 3;
    else
      return 2 * (a4 == 4);
  }
  else if (chromeOrientationPolicy == 1)
  {
    return 5;
  }
  else if (chromeOrientationPolicy)
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (id)_snapshotController
{
  if (_snapshotController_onceToken != -1)
    dispatch_once(&_snapshotController_onceToken, &__block_literal_global_1);
  return (id)_snapshotController___sharedSnapshotController;
}

void __47__AMUIPosterViewController__snapshotController__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(getPRUISAmbientPosterViewControllerClass(), "defaultSnapshotCacheURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v2 = objc_msgSend(v1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v0, 1, 0, &v9);
  v3 = v9;

  if ((v2 & 1) == 0)
  {
    AMUILogSwitcher();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __47__AMUIPosterViewController__snapshotController__block_invoke_cold_1();

  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getPRUISPosterSnapshotControllerClass_softClass;
  v14 = getPRUISPosterSnapshotControllerClass_softClass;
  if (!getPRUISPosterSnapshotControllerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getPRUISPosterSnapshotControllerClass_block_invoke;
    v10[3] = &unk_2507634B8;
    v10[4] = &v11;
    __getPRUISPosterSnapshotControllerClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = objc_msgSend([v6 alloc], "initWithCacheURL:", v0);
  v8 = (void *)_snapshotController___sharedSnapshotController;
  _snapshotController___sharedSnapshotController = v7;

}

- (void)_updateStateForContentMode:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 2;
  }
  else
  {
    if (a3)
      return;
    v3 = 1;
  }
  -[PRUISAmbientPosterViewController setPresentationMode:](self->_posterViewController, "setPresentationMode:", v3);
}

- (void)_triggerTapEvent:(id)a3
{
  objc_msgSend(a3, "locationInView:", self->_touchBlockingView);
  -[PRUISAmbientPosterViewController userTapEventOccurredWithLocation:](self->_posterViewController, "userTapEventOccurredWithLocation:");
}

- (void)_evaluateAuthenticationWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  objc_msgSend(v4, "pr_loadAmbientConfigurationWithError:", &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (v5)
  {
    -[AMUIPosterViewController delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject posterViewControllerIsAuthenticated:](v7, "posterViewControllerIsAuthenticated:", self);
    v9 = -[NSObject posterViewControllerHasInlineAuthenticated:](v7, "posterViewControllerHasInlineAuthenticated:", self);
    v10 = objc_msgSend(v5, "needsAuthentication");
    if (!(_DWORD)v8 && !(_DWORD)v9 && v10)
    {
      AMUILogSwitcher();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        MEMORY[0x23B7EA574](v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x23B7EA574](v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x23B7EA574](1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v12;
        v20 = 2114;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        _os_log_impl(&dword_23600A000, v11, OS_LOG_TYPE_DEFAULT, "Poster configuration requesting in-line authentication... isAuthenticated: %{public}@, hasInlineAuthenticated: %{public}@, configurationNeedsAuthentication: %{public}@", buf, 0x20u);

      }
      objc_msgSend(v4, "providerBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMUIPosterViewController _posterExtensionDisplayNameWithBundleIdentifier:](self, "_posterExtensionDisplayNameWithBundleIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject posterViewController:didRequestInlineAuthenticationWithUnlockDestination:](v7, "posterViewController:didRequestInlineAuthenticationWithUnlockDestination:", self, v16);

    }
  }
  else
  {
    AMUILogSwitcher();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AMUIPosterViewController _evaluateAuthenticationWithConfiguration:].cold.1();
  }

}

- (id)_posterExtensionDisplayNameWithBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDC1528];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:error:", v4, 0);

  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)chromeOrientationPolicy
{
  return self->_chromeOrientationPolicy;
}

- (void)setChromeOrientationPolicy:(int64_t)a3
{
  self->_chromeOrientationPolicy = a3;
}

- (AMUIPosterAppearanceTransitionCoordinator)appearanceTransitionCoordinator
{
  return self->_appearanceTransitionCoordinator;
}

- (double)appearanceTransitionProgress
{
  return self->_appearanceTransitionProgress;
}

- (AMUIPosterViewControllerDelegate)delegate
{
  return (AMUIPosterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRUISAmbientPosterViewController)_posterViewController
{
  return self->_posterViewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appearanceTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_posterViewController, 0);
}

void __47__AMUIPosterViewController__snapshotController__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "Failed to create cache directory at URL \"%{public}@\". Error %@");
}

- (void)_evaluateAuthenticationWithConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23600A000, v0, v1, "Failed to load ambient configuration from configuration %@ with error %@");
}

@end
