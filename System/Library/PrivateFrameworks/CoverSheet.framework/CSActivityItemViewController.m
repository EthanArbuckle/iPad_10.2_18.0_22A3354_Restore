@implementation CSActivityItemViewController

- (CSActivityItemViewController)initWithActivityHostViewController:(id)a3
{
  id v5;
  CSActivityItemViewController *v6;
  CSActivityItemViewController *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSActivityItemViewController;
  v6 = -[CSActivityItemViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityHostViewController, a3);
    -[CSActivityItemViewController _updateAudioCategoriesDisablingVolumeHUDWithReason:](v7, "_updateAudioCategoriesDisablingVolumeHUDWithReason:", CFSTR("Initialization"));
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[CSActivityItemViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", v9, sel__backlightLuminanceDidChange);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CSActivityItemViewController _invalidateRestrictsTouchesAssertion](self, "_invalidateRestrictsTouchesAssertion");
  -[CSActivityItemViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_activityHostViewController);
  v3.receiver = self;
  v3.super_class = (Class)CSActivityItemViewController;
  -[CSActivityItemViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  CSActivityItemContentView *v3;

  v3 = objc_alloc_init(CSActivityItemContentView);
  -[CSActivityItemContentView setSizeProvider:](v3, "setSizeProvider:", self);
  -[CSActivityItemContentView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("activity-content-view"));
  -[CSActivityItemViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  -[CSActivityItemViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_activityHostViewController);
  -[ACUISActivityHostViewController preferredContentSize](self->_activityHostViewController, "preferredContentSize");
  -[CSActivityItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  v3.receiver = self;
  v3.super_class = (Class)CSActivityItemViewController;
  -[CSActivityItemViewController viewDidLoad](&v3, sel_viewDidLoad);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  -[ACUISActivityHostViewController preferredContentSize](self->_activityHostViewController, "preferredContentSize", a3);
  -[CSActivityItemViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CSActivityItemViewController;
  -[CSActivityItemViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[CSActivityItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[ACUISActivityHostViewController view](self->_activityHostViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (NSArray)activityHostTouchRestrictedRects
{
  return (NSArray *)-[ACUISActivityHostViewController hostIgnoredTouchedRects](self->_activityHostViewController, "hostIgnoredTouchedRects");
}

- (void)setPresentationMode:(unint64_t)a3
{
  _QWORD v5[6];

  -[ACUISActivityHostViewController setPresentationMode:](self->_activityHostViewController, "setPresentationMode:");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CSActivityItemViewController_setPresentationMode___block_invoke;
  v5[3] = &unk_1E8E2EDD0;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

void __52__CSActivityItemViewController_setPresentationMode___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneHostEnvironmentObserver");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v1, "didAddNewSceneHostEnvironment");

  }
}

- (void)reevaluateAudioCategoriesDisablingVolumeHUD
{
  id v3;

  NSStringFromSelector(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityItemViewController _updateAudioCategoriesDisablingVolumeHUDWithReason:](self, "_updateAudioCategoriesDisablingVolumeHUDWithReason:", v3);

}

- (void)_backlightLuminanceDidChange
{
  id v3;

  NSStringFromSelector(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityItemViewController _updatePresentationModeWithReason:](self, "_updatePresentationModeWithReason:", v3);

}

- (BOOL)_isContentVisibleAndAppeared
{
  _BOOL4 v3;

  v3 = -[CSActivityItemViewController isContentVisible](self, "isContentVisible");
  if (v3)
    LOBYTE(v3) = -[CSActivityItemViewController isListAppeared](self, "isListAppeared");
  return v3;
}

- (void)_updatePresentationModeWithReason:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CSActivityItemViewController _isContentVisibleAndAppeared](self, "_isContentVisibleAndAppeared");
  v6 = -[CSActivityItemViewController isScreenOn](self, "isScreenOn");
  -[CSActivityItemViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_backlightLuminance");

  if (v8)
    v9 = 1;
  else
    v9 = v6;
  v10 = v5 & v9;
  SBLogDashBoard();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
      v12 = CFSTR("live");
    else
      v12 = CFSTR("live snapshot");
    NSStringFromBOOL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413314;
    v17 = v12;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "Updating activity scene presentation mode to: %@, for reason: %@, for screen on: %@, appeared: %@, backlight luminance: %ld", (uint8_t *)&v16, 0x34u);

  }
  if (v10)
    v15 = 1;
  else
    v15 = 2;

  -[CSActivityItemViewController setPresentationMode:](self, "setPresentationMode:", v15);
}

- (void)_updateAudioCategoriesDisablingVolumeHUDWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  CSActivityItemViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CSActivityItemViewController _isContentVisibleAndAppeared](self, "_isContentVisibleAndAppeared"))
  {
    -[ACUISActivityHostViewController audioCategoriesDisablingVolumeHUD](self->_activityHostViewController, "audioCategoriesDisablingVolumeHUD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v6);
    SBLogDashBoard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543874;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1D0337000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating audioCategoriesDisablingVolumeHUD to '%{public}@' for reason: %{public}@", (uint8_t *)&v9, 0x20u);
    }

    -[CSActivityItemViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityItemViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:", self);

  }
}

- (void)_invalidateRestrictsTouchesAssertion
{
  BSInvalidatable *restrictsTouchesAssertion;

  -[BSInvalidatable invalidate](self->_restrictsTouchesAssertion, "invalidate");
  restrictsTouchesAssertion = self->_restrictsTouchesAssertion;
  self->_restrictsTouchesAssertion = 0;

}

- (void)notificationListSupplementaryViewPresentableContentWillBecomeVisible:(BOOL)a3
{
  _BOOL4 v3;
  id v6;

  v3 = a3;
  -[CSActivityItemViewController setContentVisible:](self, "setContentVisible:");
  -[ACUISActivityHostViewController setVisibility:](self->_activityHostViewController, "setVisibility:", v3);
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CSActivityItemViewController _updatePresentationModeWithReason:](self, "_updatePresentationModeWithReason:", v6);
  -[CSActivityItemViewController _updateAudioCategoriesDisablingVolumeHUDWithReason:](self, "_updateAudioCategoriesDisablingVolumeHUDWithReason:", v6);

}

- (CGSize)contentSizeForContentView:(id)a3
{
  double v4;
  double v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[ACUISActivityHostViewController preferredContentSize](self->_activityHostViewController, "preferredContentSize", a3);
  if (v4 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[ACUISActivityHostViewController activitySceneDescriptor](self->_activityHostViewController, "activitySceneDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metricsRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lockScreenMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "initialSize");
    v11 = v10;
    v13 = v12;

    v4 = v11;
    v5 = v13;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setScreenOn:(BOOL)a3
{
  id v4;

  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    NSStringFromSelector(a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CSActivityItemViewController _updatePresentationModeWithReason:](self, "_updatePresentationModeWithReason:", v4);

  }
}

- (void)setListAppeared:(BOOL)a3
{
  id v4;

  if (self->_listAppeared != a3)
  {
    self->_listAppeared = a3;
    NSStringFromSelector(a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CSActivityItemViewController _updatePresentationModeWithReason:](self, "_updatePresentationModeWithReason:", v4);
    -[CSActivityItemViewController _updateAudioCategoriesDisablingVolumeHUDWithReason:](self, "_updateAudioCategoriesDisablingVolumeHUDWithReason:", v4);

  }
}

- (void)restrictsTouchesOnHostedScene:(BOOL)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *restrictsTouchesAssertion;

  if (a3)
  {
    if (!self->_restrictsTouchesAssertion)
    {
      -[ACUISActivityHostViewController cancelTouchesForCurrentEventInHostedContent](self->_activityHostViewController, "cancelTouchesForCurrentEventInHostedContent");
      v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      restrictsTouchesAssertion = self->_restrictsTouchesAssertion;
      self->_restrictsTouchesAssertion = v4;

    }
  }
  else
  {
    -[CSActivityItemViewController _invalidateRestrictsTouchesAssertion](self, "_invalidateRestrictsTouchesAssertion");
  }
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ACUISActivityHostViewController backlightHostEnvironment](self->_activityHostViewController, "backlightHostEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ACUISActivityHostViewController activitySceneDescriptor](self->_activityHostViewController, "activitySceneDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platterTargetBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0DA9DB0], "entryWithSceneHostEnvironment:bundleIdentifier:", v3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)isListAppeared
{
  return self->_listAppeared;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (CSActivityItemViewControllerDelegate)delegate
{
  return (CSActivityItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSListItemSceneHostEnvironmentObserving)sceneHostEnvironmentObserver
{
  return (CSListItemSceneHostEnvironmentObserving *)objc_loadWeakRetained((id *)&self->_sceneHostEnvironmentObserver);
}

- (void)setSceneHostEnvironmentObserver:(id)a3
{
  objc_storeWeak((id *)&self->_sceneHostEnvironmentObserver, a3);
}

- (ACUISActivityHostViewController)activityHostViewController
{
  return self->_activityHostViewController;
}

- (void)setActivityHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityHostViewController, a3);
}

- (BSInvalidatable)restrictsTouchesAssertion
{
  return self->_restrictsTouchesAssertion;
}

- (void)setRestrictsTouchesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_restrictsTouchesAssertion, a3);
}

- (BOOL)isContentVisible
{
  return self->_contentVisible;
}

- (void)setContentVisible:(BOOL)a3
{
  self->_contentVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictsTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_activityHostViewController, 0);
  objc_destroyWeak((id *)&self->_sceneHostEnvironmentObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
}

@end
