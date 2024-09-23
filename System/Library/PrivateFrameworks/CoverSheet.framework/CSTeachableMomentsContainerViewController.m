@implementation CSTeachableMomentsContainerViewController

- (CSTeachableMomentsContainerViewController)initWithCoverSheetContext:(id)a3
{
  id v5;
  CSTeachableMomentsContainerViewController *v6;
  CSTeachableMomentsContainerViewController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *cachedLegibilityLabels;
  NSCountedSet *v10;
  NSCountedSet *homeAffordanceAnimationSuppressionReasons;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSTeachableMomentsContainerViewController;
  v6 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetContext, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedLegibilityLabels = v7->_cachedLegibilityLabels;
    v7->_cachedLegibilityLabels = v8;

    v10 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    homeAffordanceAnimationSuppressionReasons = v7->_homeAffordanceAnimationSuppressionReasons;
    v7->_homeAffordanceAnimationSuppressionReasons = v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryChanged, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSTeachableMomentsContainerViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CSTeachableMomentsContainerView *v3;
  void *v4;
  void *v5;
  CSHomeAffordanceViewController *v6;
  CSHomeAffordanceViewController *homeAffordanceViewController;
  CSHomeAffordanceViewController *v8;
  id v9;
  UITapGestureRecognizer *v10;
  UITapGestureRecognizer *homeAffordanceClickGestureRecognizer;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  CSTeachableMomentsContainerView *v17;
  CSTeachableMomentsContainerViewController *v18;

  v3 = objc_alloc_init(CSTeachableMomentsContainerView);
  -[CSTeachableMomentsContainerView controlCenterGlyphContainerView](v3, "controlCenterGlyphContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerView setStatusBarToFollow:](v3, "setStatusBarToFollow:", v5);

  -[CSTeachableMomentsContainerViewController setView:](self, "setView:", v3);
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v6 = -[CSHomeAffordanceViewController initWithCoverSheetContext:]([CSHomeAffordanceViewController alloc], "initWithCoverSheetContext:", self->_coverSheetContext);
    homeAffordanceViewController = self->_homeAffordanceViewController;
    self->_homeAffordanceViewController = v6;

    -[CSHomeAffordanceViewController setDelegate:](self->_homeAffordanceViewController, "setDelegate:", self);
    v8 = self->_homeAffordanceViewController;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __53__CSTeachableMomentsContainerViewController_loadView__block_invoke;
    v16 = &unk_1E8E2DF58;
    v17 = v3;
    v18 = self;
    -[CSTeachableMomentsContainerViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v8, 0, &v13);
    v9 = objc_alloc(MEMORY[0x1E0CEAA88]);
    v10 = (UITapGestureRecognizer *)objc_msgSend(v9, "initWithTarget:action:", self, sel__homeAffordanceClickRecognized_, v13, v14, v15, v16);
    homeAffordanceClickGestureRecognizer = self->_homeAffordanceClickGestureRecognizer;
    self->_homeAffordanceClickGestureRecognizer = v10;

    -[UITapGestureRecognizer setDelegate:](self->_homeAffordanceClickGestureRecognizer, "setDelegate:", self);
    -[UITapGestureRecognizer setName:](self->_homeAffordanceClickGestureRecognizer, "setName:", CFSTR("homeAffordanceClickGestureRecognizer"));
    -[UITapGestureRecognizer setAllowedTouchTypes:](self->_homeAffordanceClickGestureRecognizer, "setAllowedTouchTypes:", &unk_1E8E89E20);
    -[CSHomeAffordanceViewController homeAffordanceView](self->_homeAffordanceViewController, "homeAffordanceView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", self->_homeAffordanceClickGestureRecognizer);

  }
  -[CSTeachableMomentsContainerViewController _updateLegibilitySettings](self, "_updateLegibilitySettings");

}

void __53__CSTeachableMomentsContainerViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1056);
  v8 = a2;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHomeAffordanceContainerView:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1056), "homeAffordanceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHomeAffordanceView:", v7);

  v8[2]();
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSTeachableMomentsContainerViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CSTeachableMomentsContainerViewController _updateTextLabel](self, "_updateTextLabel");
  -[CSTeachableMomentsContainerViewController setAnimationState:](self, "setAnimationState:", 1);
  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesStatusBarRelativeLayoutForControlCenterTutors");

  if (v5)
  {
    -[CSTeachableMomentsContainerViewController _setControlCenterTutorsHidden:](self, "_setControlCenterTutorsHidden:", 1);
    -[CSTeachableMomentsContainerViewController _setControlCenterTutorsHidden:](self, "_setControlCenterTutorsHidden:", 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSTeachableMomentsContainerViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CSTeachableMomentsContainerViewController setAnimationState:](self, "setAnimationState:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CSTeachableMomentsContainerViewController;
  v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__CSTeachableMomentsContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E8E2EEA0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);

}

uint64_t __96__CSTeachableMomentsContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  CSTeachableMomentsContainerViewController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSTeachableMomentsContainerViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v14, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 <= 14)
    {
      if (v6 == 1)
      {
        -[CSTeachableMomentsContainerViewController _updateLegibilitySettings](self, "_updateLegibilitySettings");
      }
      else
      {
        if (v6 != 13)
          goto LABEL_19;
        objc_msgSend(v4, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        -[CSTeachableMomentsContainerViewController setAuthenticated:](self, "setAuthenticated:", v10);
      }
    }
    else if (v6 == 15)
    {
      objc_msgSend(v4, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      if (v12 == 28 && !-[CSTeachableMomentsContainerViewController currentState](self, "currentState"))
        -[CSTeachableMomentsContainerViewController _moveUpTimerForFiringAfterDelay:](self, "_moveUpTimerForFiringAfterDelay:", 0.0);
    }
    else
    {
      if (v6 == 24)
      {
        v7 = self;
        v8 = 1;
      }
      else
      {
        if (v6 != 25)
          goto LABEL_19;
        v7 = self;
        v8 = 0;
      }
      -[CSTeachableMomentsContainerViewController setScreenOn:](v7, "setScreenOn:", v8);
    }
    v5 = 0;
    goto LABEL_19;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_19:

  return v5;
}

- (void)setAuthenticated:(BOOL)a3
{
  unsigned __int8 *p_authenticated;
  _BOOL4 v4;
  NSObject *v6;

  p_authenticated = (unsigned __int8 *)&self->_authenticated;
  if (self->_authenticated != a3)
  {
    v4 = a3;
    *p_authenticated = a3;
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CSTeachableMomentsContainerViewController setAuthenticated:].cold.1(p_authenticated, v6);

    if (v4)
      -[CSTeachableMomentsContainerViewController setUpdateTextLabelOnNextAnimation:](self, "setUpdateTextLabelOnNextAnimation:", 1);
    else
      -[CSTeachableMomentsContainerViewController _updateTextLabel](self, "_updateTextLabel");
  }
}

- (void)_updateLegibilitySettings
{
  void *v3;
  void *v4;
  id v5;

  -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilitySettings:", v5);

  -[CSHomeAffordanceViewController setLegibilitySettings:](self->_homeAffordanceViewController, "setLegibilitySettings:", v5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_homeAffordanceClickGestureRecognizer == a3)
    return objc_msgSend(a4, "_isPointerTouch");
  else
    return 0;
}

- (void)_homeAffordanceClickRecognized:(id)a3
{
  id v4;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 11);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

}

- (void)_setControlCenterTutorsHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  BOOL v10;

  v3 = a3;
  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 || (objc_msgSend(v5, "isStatusBarLayoutReady") & 1) != 0)
  {
    objc_msgSend(v6, "setNeedsLayout");
    objc_msgSend(v6, "controlCenterTutorsContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v3);

  }
  else
  {
    v8 = dispatch_time(0, 100000000);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__CSTeachableMomentsContainerViewController__setControlCenterTutorsHidden___block_invoke;
    v9[3] = &unk_1E8E2E190;
    v9[4] = self;
    v10 = v3;
    dispatch_after(v8, MEMORY[0x1E0C80D38], v9);
  }

}

uint64_t __75__CSTeachableMomentsContainerViewController__setControlCenterTutorsHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setControlCenterTutorsHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setAnimationState:(unint64_t)a3
{
  if (self->_animationState != a3)
  {
    self->_animationState = a3;
    -[CSTeachableMomentsContainerViewController _updateEffectiveAnimationState](self, "_updateEffectiveAnimationState");
  }
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    if (a3)
      -[CSTeachableMomentsContainerViewController _endSuppressingHomeAffordanceAnimationForScreenOff](self, "_endSuppressingHomeAffordanceAnimationForScreenOff");
    else
      -[CSTeachableMomentsContainerViewController _beginSuppressingHomeAffordanceAnimationForScreenOff](self, "_beginSuppressingHomeAffordanceAnimationForScreenOff");
  }
}

- (void)_updateEffectiveAnimationState
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[CSTeachableMomentsContainerViewController animationState](self, "animationState");
  if (-[CSTeachableMomentsContainerViewController _suppressingHomeAffordanceAnimation](self, "_suppressingHomeAffordanceAnimation"))
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }
  -[CSTeachableMomentsContainerViewController setEffectiveAnimationState:](self, "setEffectiveAnimationState:", v4);
}

- (void)setEffectiveAnimationState:(unint64_t)a3
{
  NSObject *v4;

  if (self->_effectiveAnimationState != a3)
  {
    self->_effectiveAnimationState = a3;
    if (a3)
    {
      if (a3 == 1)
      {
        SBLogDashBoard();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
          -[CSTeachableMomentsContainerViewController setEffectiveAnimationState:].cold.1();

        -[CSTeachableMomentsContainerViewController _setupTimer](self, "_setupTimer");
        if (-[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled"))
        {
          if (-[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState"))
            -[CSTeachableMomentsContainerViewController _moveUpTimerForFiringAfterDelay:](self, "_moveUpTimerForFiringAfterDelay:", 0.0);
        }
      }
    }
    else
    {
      -[CSTeachableMomentsContainerViewController _cancelTimerAndResetAnimation](self, "_cancelTimerAndResetAnimation");
    }
  }
}

- (void)_setupTimer
{
  -[CSTeachableMomentsContainerViewController _setupTimerWithDelay:](self, "_setupTimerWithDelay:", 3.0);
}

- (void)_setupTimerWithDelay:(double)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__CSTeachableMomentsContainerViewController__setupTimerWithDelay___block_invoke;
  v5[3] = &unk_1E8E2F2C0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSTeachableMomentsContainerViewController setFireOffAnimationTimer:](self, "setFireOffAnimationTimer:", v4);

}

uint64_t __66__CSTeachableMomentsContainerViewController__setupTimerWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateTextLabelIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_addHomeAffordanceAnimation");
  objc_msgSend(*(id *)(a1 + 32), "_addTextAnimation");
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldTeachAboutControlCenter"))
  {
    objc_msgSend(*(id *)(a1 + 32), "teachableMomentsContainerView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "controlCenterGrabberContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addControlCenterGrabberAnimation");
      objc_msgSend(*(id *)(a1 + 32), "_addControlCenterGlyphAnimation");
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "setFireOffAnimationTimer:", 0);
}

- (void)_cancelTimerAndResetAnimation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0(&dword_1D0337000, v0, v1, "starting reset animations because timer has already fired.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_moveUpTimerForFiringAfterDelay:(double)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[CSTeachableMomentsContainerViewController fireOffAnimationTimer](self, "fireOffAnimationTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  if (v7 > a3)
  {
    -[CSTeachableMomentsContainerViewController setFireOffAnimationTimer:](self, "setFireOffAnimationTimer:", 0);
    -[CSTeachableMomentsContainerViewController _setupTimerWithDelay:](self, "_setupTimerWithDelay:", a3);
  }

}

- (void)setFireOffAnimationTimer:(id)a3
{
  NSTimer *v5;
  NSTimer **p_fireOffAnimationTimer;
  NSTimer *v7;

  v5 = (NSTimer *)a3;
  p_fireOffAnimationTimer = &self->_fireOffAnimationTimer;
  if (*p_fireOffAnimationTimer != v5)
  {
    v7 = v5;
    -[NSTimer invalidate](*p_fireOffAnimationTimer, "invalidate");
    objc_storeStrong((id *)p_fireOffAnimationTimer, a3);
    v5 = v7;
  }

}

- (BOOL)_shouldTeachAboutControlCenter
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D14570], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "userInvocationCount") < 2;

  return v3;
}

- (BOOL)_animatesTextPositionWhenResetting
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;

  -[CSCoverSheetContextProviding assistantController](self->_coverSheetContext, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  if (!v4)
    return 1;
  -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", CFSTR("HomeAffordanceDoubleTap")) == 0;

  return v6;
}

+ (void)_addRepeatedAnimationWithProvider:(id)a3 toLayer:(id)a4
{
  id v6;
  double v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(double, double);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = (void (**)(double, double))a3;
  v6 = a4;
  v7 = CACurrentMediaTime();
  for (i = 0; i != 3; ++i)
  {
    v17[2](4.0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          if (i == 2)
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kCSTeachableMomentIsLastAnimationKey"));
          objc_msgSend(v14, "keyPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_animationKeyForKeyPath:iteration:reset:", v15, i, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addAnimation:forKey:", v14, v16);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
    v7 = v7 + 4.0;

  }
}

- (void)_addResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "presentationLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKeyPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v6, "valueForKeyPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", v7, v6);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDuration:", 0.2);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTimingFunction:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setToValue:", v17);

  objc_msgSend((id)objc_opt_class(), "_animationKeyForKeyPath:iteration:reset:", v7, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAnimation:forKey:", v19, v18);
}

- (void)_removeResetAnimationForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_animationKeyForKeyPath:iteration:reset:", v6, 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeAnimationForKey:", v7);
}

- (void)_removeNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend((id)objc_opt_class(), "_animationKeyForKeyPath:iteration:reset:", v8, i, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationForKey:", v7);

  }
}

- (void)_pauseNormalAnimationsForKeyPath:(id)a3 onLayer:(id)a4
{
  id v5;
  double v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = CACurrentMediaTime();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend((id)objc_opt_class(), "_animationKeyForKeyPath:iteration:reset:", v13, i, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setSpeed:", v11);
    objc_msgSend(v9, "beginTime");
    objc_msgSend(v10, "setTimeOffset:", v6 - v12);
    objc_msgSend(v5, "removeAnimationForKey:", v8);
    objc_msgSend(v5, "addAnimation:forKey:", v10, v8);

  }
}

+ (id)_animationKeyForKeyPath:(id)a3 iteration:(unint64_t)a4 reset:(BOOL)a5
{
  __CFString *v5;

  if (a5)
    v5 = CFSTR("kCSHomeAffordanceResetAnimation");
  else
    v5 = CFSTR("kCSHomeAffordanceNormalAnimation");
  return (id)-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("-%@-%lu"), a3, a4);
}

- (void)_addHomeAffordanceAnimation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CSHomeAffordanceViewController view](self->_homeAffordanceViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v4);
  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("position.y"), v4);
  v5 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__CSTeachableMomentsContainerViewController__addHomeAffordanceAnimation__block_invoke;
  v6[3] = &unk_1E8E2F2E8;
  v6[4] = self;
  objc_msgSend(v5, "_addRepeatedAnimationWithProvider:toLayer:", v6, v4);

}

id __72__CSTeachableMomentsContainerViewController__addHomeAffordanceAnimation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_homeAffordancePositionAnimationWithDuration:beginTime:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_homeAffordancePositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyTimes:", &unk_1E8E89E38);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -5.0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -15.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValues:", v12);

  objc_msgSend(v6, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(v6, "setBeginTime:", a4);
  objc_msgSend(v6, "setAdditive:", 1);
  return v6;
}

- (void)_addHomeAffordanceResetAnimation
{
  void *v3;
  id v4;

  -[CSHomeAffordanceViewController view](self->_homeAffordanceViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v4);
}

- (void)_addTextAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callToActionLabelContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v5);
  -[CSTeachableMomentsContainerViewController _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v5);
  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("position.y"), v5);
  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("opacity"), v5);
  v6 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CSTeachableMomentsContainerViewController__addTextAnimation__block_invoke;
  v7[3] = &unk_1E8E2F2E8;
  v7[4] = self;
  objc_msgSend(v6, "_addRepeatedAnimationWithProvider:toLayer:", v7, v5);

}

id __62__CSTeachableMomentsContainerViewController__addTextAnimation__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_textPositionAnimationWithDuration:beginTime:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_textAlphaAnimationWithDuration:beginTime:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_textPositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyTimes:", &unk_1E8E89E50);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -16.0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -30.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -33.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -33.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValues:", v12);

  objc_msgSend(v6, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(v6, "setBeginTime:", a4);
  objc_msgSend(v6, "setAdditive:", 1);
  return v6;
}

- (id)_textAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyTimes:", &unk_1E8E89E68);
  objc_msgSend(v7, "setValues:", &unk_1E8E89E80);
  objc_msgSend(v7, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v7, "setDuration:", a3);
  objc_msgSend(v7, "setBeginTime:", a4);
  objc_msgSend(v7, "setAdditive:", 1);
  objc_msgSend(v7, "setDelegate:", self);
  return v7;
}

- (void)_addTextResetAnimation
{
  void *v3;
  void *v4;
  id v5;

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callToActionLabelContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[CSTeachableMomentsContainerViewController _animatesTextPositionWhenResetting](self, "_animatesTextPositionWhenResetting"))
  {
    -[CSTeachableMomentsContainerViewController _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v5);
  }
  else
  {
    -[CSTeachableMomentsContainerViewController _pauseNormalAnimationsForKeyPath:onLayer:](self, "_pauseNormalAnimationsForKeyPath:onLayer:", CFSTR("position.y"), v5);
  }
  -[CSTeachableMomentsContainerViewController _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v5);

}

- (void)_addControlCenterGrabberAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCenterGrabberContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v5);
  -[CSTeachableMomentsContainerViewController _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v5);
  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("position.y"), v5);
  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("opacity"), v5);
  v6 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CSTeachableMomentsContainerViewController__addControlCenterGrabberAnimation__block_invoke;
  v7[3] = &unk_1E8E2F2E8;
  v7[4] = self;
  objc_msgSend(v6, "_addRepeatedAnimationWithProvider:toLayer:", v7, v5);

}

id __78__CSTeachableMomentsContainerViewController__addControlCenterGrabberAnimation__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_controlCenterGrabberPositionAnimationWithDuration:beginTime:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_controlCenterGrabberAlphaAnimationWithDuration:beginTime:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_controlCenterGrabberPositionAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  double v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  double v45;
  int v46;
  int v47;
  int v48;
  int v49;
  double v50;
  int v51;
  double v52;
  int v53;
  double v54;
  int v55;
  int v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  double v64;
  double v65;
  int v66;
  double v67;
  int v68;
  double v69;
  double v70;
  int v71;
  double v72;
  double v73;
  double v74;
  int v75;
  int v76;
  int v77;
  int v78;
  double v79;
  double v80;
  int v81;
  double v82;
  uint64_t v83;
  double v84;
  double v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  __int128 v150;
  int v151;
  int v152;
  uint64_t v153;
  int v154;
  uint64_t v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  _QWORD v166[7];

  v166[5] = *MEMORY[0x1E0C80C00];
  v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v134, "userInterfaceIdiom") != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_10;
    }
  }
  v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "_referenceBounds");
    }
    v9 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v32 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v31 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v164 = v11 ^ 1;
      v165 = v10;
      v150 = 0uLL;
      v151 = 0;
      v149 = 0;
      v148 = 0;
      v152 = 0;
      v153 = 0;
      v147 = 0;
      v146 = 0;
      v154 = 0;
      v144 = 0;
      v155 = 0;
      v145 = 0;
      v156 = 0;
      v143 = 0;
      v141 = 0;
      v139 = 0;
      v157 = 0;
      v158 = 0;
      v142 = 0;
      v159 = 0;
      v140 = 0;
      v160 = 0;
      v138 = 0;
      v161 = 0;
      v137 = 0;
      v162 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v163 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 30.8;
      v28 = 36.0;
      goto LABEL_67;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_10:
  v12 = __sb__runningInSpringBoard();
  v164 = v9;
  v165 = v10;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v13 = 0;
      v14 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v133, "userInterfaceIdiom") != 1)
    {
      v13 = 0;
      v14 = 1;
      goto LABEL_19;
    }
  }
  v14 = v12 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "_referenceBounds");
    }
    v13 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v162 = v11 ^ 1;
      v163 = v14;
      v150 = 0uLL;
      v151 = 0;
      v149 = 0;
      v148 = 0;
      v152 = 0;
      v153 = 0;
      v147 = 0;
      v146 = 0;
      v154 = 0;
      v144 = 0;
      v155 = 0;
      v145 = 0;
      v156 = 0;
      v143 = 0;
      v141 = 0;
      v139 = 0;
      v157 = 0;
      v158 = 0;
      v142 = 0;
      v159 = 0;
      v140 = 0;
      v160 = 0;
      v138 = 0;
      v161 = 0;
      v137 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 30.8;
      v28 = 36.0;
      goto LABEL_67;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_19:
  v15 = __sb__runningInSpringBoard();
  v162 = v13;
  v163 = v14;
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v16 = 0;
      v17 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v132, "userInterfaceIdiom") != 1)
    {
      v16 = 0;
      v17 = 1;
      goto LABEL_28;
    }
  }
  v17 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "_referenceBounds");
    }
    v16 = v11 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v160 = v11 ^ 1;
      v161 = v17;
      v150 = 0uLL;
      v151 = 0;
      v149 = 0;
      v148 = 0;
      v152 = 0;
      v153 = 0;
      v147 = 0;
      v146 = 0;
      v154 = 0;
      v144 = 0;
      v155 = 0;
      v145 = 0;
      v156 = 0;
      v143 = 0;
      v141 = 0;
      v139 = 0;
      v157 = 0;
      v158 = 0;
      v142 = 0;
      v159 = 0;
      v140 = 0;
      v138 = 0;
      v137 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 30.8;
      v28 = 36.0;
      goto LABEL_67;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_28:
  v18 = __sb__runningInSpringBoard();
  v160 = v16;
  v161 = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v4 = 0;
      v19 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v131, "userInterfaceIdiom") != 1)
    {
      v4 = 0;
      v19 = 1;
      goto LABEL_37;
    }
  }
  v19 = v18 ^ 1;
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "_referenceBounds");
  }
  v4 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v158 = v11 ^ 1;
    v159 = v19;
    v150 = 0uLL;
    v151 = 0;
    v149 = 0;
    v148 = 0;
    v152 = 0;
    v153 = 0;
    v147 = 0;
    v146 = 0;
    v154 = 0;
    v144 = 0;
    v155 = 0;
    v145 = 0;
    v156 = 0;
    v143 = 0;
    v141 = 0;
    v139 = 0;
    v157 = 0;
    v142 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 30.8;
    v28 = 36.0;
    goto LABEL_67;
  }
LABEL_37:
  v21 = __sb__runningInSpringBoard();
  v158 = v4;
  v159 = v19;
  if (v21)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v156 = 0;
      v5 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v130, "userInterfaceIdiom") != 1)
    {
      v156 = 0;
      v5 = 1;
      goto LABEL_47;
    }
  }
  v5 = v21 ^ 1u;
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "_referenceBounds");
  }
  v156 = v11 ^ 1;
  BSSizeRoundForScale();
  if (v29 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v157 = v5;
    v150 = 0uLL;
    v151 = 0;
    v149 = 0;
    v148 = 0;
    v152 = 0;
    v153 = 0;
    v147 = 0;
    v146 = 0;
    v154 = 0;
    v144 = 0;
    v155 = 0;
    v145 = 0;
    v143 = 0;
    v141 = 0;
    v139 = 0;
    v140 = 0;
    v142 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 30.8;
    v28 = 36.0;
    goto LABEL_67;
  }
LABEL_47:
  v30 = __sb__runningInSpringBoard();
  v157 = v5;
  if (v30)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v155 = 0;
      goto LABEL_176;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v129, "userInterfaceIdiom") != 1)
    {
      v155 = 0x100000000;
      goto LABEL_176;
    }
  }
  HIDWORD(v155) = v30 ^ 1;
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "_referenceBounds");
  }
  LODWORD(v155) = v11 ^ 1;
  BSSizeRoundForScale();
  if (v45 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    v150 = 0uLL;
    v151 = 0;
    v149 = 0;
    v148 = 0;
    v152 = 0;
    v153 = 0;
    v147 = 0;
    v146 = 0;
    v154 = 0;
    v143 = 0;
    v144 = 0;
    v141 = 0;
    v142 = 0;
    v145 = 0;
    v139 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0.0;
    v28 = 0.0;
    goto LABEL_67;
  }
LABEL_176:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_178;
LABEL_184:
    v150 = 0uLL;
    v151 = 0;
    v149 = 0;
    v148 = 0;
    v152 = 0;
    v153 = 0;
    v147 = 0;
    v146 = 0;
    v144 = 0;
    v145 = 0;
    v141 = 0;
    v142 = 0;
    v143 = 0;
    v139 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v28 = 36.0;
    v27 = 30.8;
    v154 = v11 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v127, "userInterfaceIdiom") == 1)
    goto LABEL_184;
LABEL_178:
  v154 = v11 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_182:
    v153 = 0;
    goto LABEL_192;
  }
  v46 = __sb__runningInSpringBoard();
  if (v46)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_182;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v121, "userInterfaceIdiom"))
    {
      v153 = 0x100000000;
      goto LABEL_192;
    }
  }
  HIDWORD(v153) = v46 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v47 = __sb__runningInSpringBoard();
    if (v47)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "_referenceBounds");
    }
    v11 = v47 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v153) = v11;
    if (v52 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v150 = 0uLL;
      v151 = 0;
      v149 = 0;
      v148 = 0;
      v152 = 0;
      v146 = 0;
      v147 = 0;
      v144 = 0;
      v145 = 0;
      v141 = 0;
      v142 = 0;
      v143 = 0;
      v139 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 24.8;
      v28 = 28.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v153) = 0;
  }
LABEL_192:
  v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v11 = 0;
      v152 = 0;
      goto LABEL_202;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "userInterfaceIdiom"))
    {
      v11 = 0;
      v152 = 1;
      goto LABEL_202;
    }
  }
  v152 = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "_referenceBounds");
    }
    v11 = v49 ^ 1u;
    BSSizeRoundForScale();
    if (v50 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_206;
  }
  else
  {
    v11 = 0;
  }
LABEL_202:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    v151 = v11;
    v150 = 0uLL;
    v149 = 0;
    v147 = 0;
    v148 = 0;
    v145 = 0;
    v146 = 0;
    v143 = 0;
    v144 = 0;
    v141 = 0;
    v142 = 0;
    v139 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 24.8;
    v28 = 28.0;
    goto LABEL_67;
  }
LABEL_206:
  v151 = v11;
  if (!_SBF_Private_IsD64Like())
  {
LABEL_210:
    LODWORD(v150) = 0;
    HIDWORD(v150) = 0;
    goto LABEL_220;
  }
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_210;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom"))
    {
      LODWORD(v150) = 0;
      HIDWORD(v150) = 1;
      goto LABEL_220;
    }
  }
  HIDWORD(v150) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v53 = __sb__runningInSpringBoard();
    if (v53)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "_referenceBounds");
    }
    v11 = v53 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v150) = v11;
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)((char *)&v150 + 4) = 0;
      v149 = 0;
      v147 = 0;
      v148 = 0;
      v145 = 0;
      v146 = 0;
      v143 = 0;
      v144 = 0;
      v141 = 0;
      v142 = 0;
      v139 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 24.8;
      v28 = 28.0;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v150) = 0;
  }
LABEL_220:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)((char *)&v150 + 4) = 0;
      goto LABEL_230;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom"))
    {
      *(_QWORD *)((char *)&v150 + 4) = 0x100000000;
      goto LABEL_230;
    }
  }
  DWORD2(v150) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "_referenceBounds");
    }
    DWORD1(v150) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_234;
  }
  else
  {
    DWORD1(v150) = 0;
  }
LABEL_230:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    v149 = 0;
    v147 = 0;
    v148 = 0;
    v145 = 0;
    v146 = 0;
    v143 = 0;
    v144 = 0;
    v141 = 0;
    v142 = 0;
    v139 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 24.8;
    v28 = 28.0;
    goto LABEL_67;
  }
LABEL_234:
  v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v149 = 0;
      LODWORD(v148) = 0;
      goto LABEL_244;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom"))
    {
      LODWORD(v148) = 0;
      v149 = 1;
      goto LABEL_244;
    }
  }
  v149 = v55 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v56 = __sb__runningInSpringBoard();
    if (v56)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_referenceBounds");
    }
    v11 = v56 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v148) = v11;
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      HIDWORD(v148) = 0;
      v146 = 0;
      v147 = 0;
      v144 = 0;
      v145 = 0;
      v141 = 0;
      v142 = 0;
      v143 = 0;
      v139 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 28.0;
      v27 = 24.8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v148) = 0;
  }
LABEL_244:
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v148) = 0;
      v11 = 0;
      goto LABEL_254;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "userInterfaceIdiom"))
    {
      v11 = 0;
      HIDWORD(v148) = 1;
      goto LABEL_254;
    }
  }
  HIDWORD(v148) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "_referenceBounds");
    }
    v11 = v58 ^ 1u;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_264;
  }
  else
  {
    v11 = 0;
  }
LABEL_254:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    HIDWORD(v147) = v11;
    LODWORD(v147) = 0;
    v145 = 0;
    v146 = 0;
    v143 = 0;
    v144 = 0;
    v141 = 0;
    v142 = 0;
    v139 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v28 = 28.0;
    v27 = 24.8;
    goto LABEL_67;
  }
LABEL_264:
  HIDWORD(v147) = v11;
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v147) = 0;
      HIDWORD(v146) = 0;
      goto LABEL_274;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v115, "userInterfaceIdiom"))
    {
      HIDWORD(v146) = 0;
      LODWORD(v147) = 1;
      goto LABEL_274;
    }
  }
  LODWORD(v147) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v63 = __sb__runningInSpringBoard();
    if (v63)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "_referenceBounds");
    }
    v11 = v63 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v146) = v11;
    if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      LODWORD(v146) = 0;
      v144 = 0;
      v145 = 0;
      v141 = 0;
      v142 = 0;
      v143 = 0;
      v139 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 29.0;
      v27 = 24.8;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v146) = 0;
  }
LABEL_274:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v146) = 0;
      HIDWORD(v145) = 0;
      goto LABEL_284;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v112, "userInterfaceIdiom"))
    {
      HIDWORD(v145) = 0;
      LODWORD(v146) = 1;
      goto LABEL_284;
    }
  }
  LODWORD(v146) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "_referenceBounds");
    }
    HIDWORD(v145) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_293;
  }
  else
  {
    HIDWORD(v145) = 0;
  }
LABEL_284:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v143 = 0;
    v144 = 0;
    v141 = 0;
    v142 = 0;
    LODWORD(v145) = 0;
    v139 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0.0;
    v28 = 0.0;
    goto LABEL_67;
  }
LABEL_293:
  v5 = (uint64_t)&unk_1D048F000;
  v4 = (uint64_t)&unk_1D048F000;
  if (!_SBF_Private_IsD93Like())
  {
LABEL_297:
    LODWORD(v144) = 0;
    HIDWORD(v141) = 0;
    goto LABEL_304;
  }
  v66 = __sb__runningInSpringBoard();
  if (v66)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_297;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      HIDWORD(v141) = 0;
      LODWORD(v144) = 1;
      goto LABEL_304;
    }
  }
  LODWORD(v144) = v66 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "_referenceBounds");
    }
    HIDWORD(v141) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      LODWORD(v145) = 0;
      v142 = 0;
      v143 = 0;
      HIDWORD(v144) = 0;
      LODWORD(v141) = 0;
      v139 = 0;
      v140 = 0;
      v137 = 0;
      v138 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 26.6666667;
      v27 = 23.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v141) = 0;
  }
LABEL_304:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v145) = 0;
      HIDWORD(v143) = 0;
      goto LABEL_314;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v111, "userInterfaceIdiom"))
    {
      HIDWORD(v143) = 0;
      LODWORD(v145) = 1;
      goto LABEL_314;
    }
  }
  LODWORD(v145) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "_referenceBounds");
    }
    HIDWORD(v143) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v67 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_318;
  }
  else
  {
    HIDWORD(v143) = 0;
  }
LABEL_314:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    HIDWORD(v144) = 0;
    LODWORD(v143) = 0;
    LODWORD(v141) = 0;
    v139 = 0;
    v140 = 0;
    v142 = 0;
    v137 = 0;
    v138 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v28 = 26.6666667;
    v27 = 23.6666667;
    goto LABEL_67;
  }
LABEL_318:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_322:
    HIDWORD(v144) = 0;
    LODWORD(v143) = 0;
    goto LABEL_332;
  }
  v68 = __sb__runningInSpringBoard();
  if (v68)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_322;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v102, "userInterfaceIdiom"))
    {
      LODWORD(v143) = 0;
      HIDWORD(v144) = 1;
      goto LABEL_332;
    }
  }
  HIDWORD(v144) = v68 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_referenceBounds");
    }
    LODWORD(v143) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v73 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v141) = 0;
      v139 = 0;
      v140 = 0;
      v142 = 0;
      v137 = 0;
      v138 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 26.6666667;
      v27 = 23.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v143) = 0;
  }
LABEL_332:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v141) = 0;
      LODWORD(v139) = 0;
      goto LABEL_342;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      LODWORD(v139) = 0;
      LODWORD(v141) = 1;
      goto LABEL_342;
    }
  }
  LODWORD(v141) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_referenceBounds");
    }
    LODWORD(v139) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_346;
  }
  else
  {
    LODWORD(v139) = 0;
  }
LABEL_342:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    v142 = 0;
    v140 = 0;
    v137 = 0;
    v138 = 0;
    HIDWORD(v139) = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v28 = 26.6666667;
    v27 = 23.6666667;
    goto LABEL_67;
  }
LABEL_346:
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v142 = 0;
      goto LABEL_356;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v103, "userInterfaceIdiom"))
    {
      v142 = 0x100000000;
      goto LABEL_356;
    }
  }
  HIDWORD(v142) = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "_referenceBounds");
    }
    LODWORD(v142) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v140 = 0;
      v137 = 0;
      v138 = 0;
      HIDWORD(v139) = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 29.0;
      v27 = 24.8;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v142) = 0;
  }
LABEL_356:
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v140) = 0;
      HIDWORD(v138) = 0;
      goto LABEL_366;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "userInterfaceIdiom"))
    {
      HIDWORD(v138) = 0;
      HIDWORD(v140) = 1;
      goto LABEL_366;
    }
  }
  HIDWORD(v140) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v11 = __sb__runningInSpringBoard();
    if ((_DWORD)v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "_referenceBounds");
    }
    HIDWORD(v138) = v11 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_376;
  }
  else
  {
    HIDWORD(v138) = 0;
  }
LABEL_366:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v140) = 0;
    HIDWORD(v139) = 0;
    LODWORD(v138) = 0;
    v137 = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0.0;
    v28 = 0.0;
    goto LABEL_67;
  }
LABEL_376:
  v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v140) = 0;
      HIDWORD(v139) = 0;
      goto LABEL_386;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v99, "userInterfaceIdiom"))
    {
      HIDWORD(v139) = 0;
      LODWORD(v140) = 1;
      goto LABEL_386;
    }
  }
  LODWORD(v140) = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v76 = __sb__runningInSpringBoard();
    if (v76)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "_referenceBounds");
    }
    v11 = v76 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v139) = v11;
    if (v79 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      LODWORD(v138) = 0;
      v137 = 0;
      v136 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 26.6666667;
      v27 = 23.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v139) = 0;
  }
LABEL_386:
  v77 = __sb__runningInSpringBoard();
  if (v77)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v138) = 0;
      v11 = 0;
      goto LABEL_396;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v96, "userInterfaceIdiom"))
    {
      v11 = 0;
      LODWORD(v138) = 1;
      goto LABEL_396;
    }
  }
  LODWORD(v138) = v77 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v78 = __sb__runningInSpringBoard();
    if (v78)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_referenceBounds");
    }
    v11 = v78 ^ 1u;
    BSSizeRoundForScale();
    if (v80 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_403;
  }
  else
  {
    v11 = 0;
  }
LABEL_396:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    HIDWORD(v137) = v11;
LABEL_407:
    LODWORD(v137) = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v28 = 26.6666667;
    v27 = 23.6666667;
    goto LABEL_67;
  }
LABEL_403:
  HIDWORD(v137) = v11;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
    || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    goto LABEL_407;
  }
  v28 = 26.6666667;
  v27 = 23.6666667;
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0 || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v137) = 0;
    v136 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    goto LABEL_67;
  }
  v11 = __sb__runningInSpringBoard();
  if ((_DWORD)v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v137) = 0;
      v136 = 0;
      goto LABEL_421;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "userInterfaceIdiom"))
    {
      v136 = 0;
      LODWORD(v137) = 1;
      goto LABEL_421;
    }
  }
  LODWORD(v137) = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v4 = __sb__runningInSpringBoard();
    if ((_DWORD)v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "_referenceBounds");
    }
    v136 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v84 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v28 = 27.6666667;
      goto LABEL_67;
    }
  }
  else
  {
    v136 = 0;
  }
LABEL_421:
  v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
      goto LABEL_431;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "userInterfaceIdiom"))
    {
      v23 = 0;
      v22 = 1;
      goto LABEL_431;
    }
  }
  v22 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v4 = __sb__runningInSpringBoard();
    if ((_DWORD)v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_referenceBounds");
    }
    v23 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v85 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0.0;
      v28 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    v23 = 0;
  }
LABEL_431:
  v4 = __sb__runningInSpringBoard();
  if (!(_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v11, "userInterfaceIdiom"))
    {
      v25 = 0;
      v24 = 1;
      goto LABEL_441;
    }
LABEL_437:
    v24 = v4 ^ 1;
    v4 = __sb__runningInSpringBoard();
    if ((_DWORD)v4)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "_referenceBounds");
    }
    v25 = v4 ^ 1;
    BSSizeRoundForScale();
    if (v82 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
      goto LABEL_444;
    goto LABEL_441;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_437;
  v24 = 0;
  v25 = 0;
LABEL_441:
  v83 = __sb__runningInSpringBoard();
  if ((_DWORD)v83)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
LABEL_444:
      v26 = 0;
      v27 = 0.0;
      v28 = 0.0;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v4, "userInterfaceIdiom"))
    {
      v26 = 1;
      v27 = 0.0;
      v28 = 0.0;
      goto LABEL_67;
    }
  }
  v26 = v83 ^ 1;
  v86 = __sb__runningInSpringBoard();
  if (v86)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v83 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v83, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v27 = 0.0;
  v28 = 0.0;
  if (v86 != 1)

LABEL_67:
  if (v26)

  if (v25)
  if (v24)

  if (v23)
  if (v22)

  if (v136)
  if ((_DWORD)v137)

  if (HIDWORD(v137))
  if ((_DWORD)v138)

  if (HIDWORD(v139))
  if ((_DWORD)v140)

  if (HIDWORD(v138))
  if (HIDWORD(v140))

  if ((_DWORD)v142)
  if (HIDWORD(v142))

  if ((_DWORD)v139)
  if ((_DWORD)v141)

  if ((_DWORD)v143)
  if (HIDWORD(v144))

  if (HIDWORD(v143))
  if ((_DWORD)v145)

  if (HIDWORD(v141))
  if ((_DWORD)v144)

  if (HIDWORD(v145))
  if ((_DWORD)v146)

  if (HIDWORD(v146))
  if ((_DWORD)v147)

  if (HIDWORD(v147))
  if (HIDWORD(v148))

  if ((_DWORD)v148)
  if (v149)

  if (DWORD1(v150))
  if (DWORD2(v150))

  if ((_DWORD)v150)
  if (HIDWORD(v150))

  if (v151)
  if (v152)

  if ((_DWORD)v153)
  if (HIDWORD(v153))

  if (v154)
  if ((_DWORD)v155)

  if (HIDWORD(v155))
  if (v156)

  if (v157)
  if (v158)
  {

    if (!v159)
      goto LABEL_157;
  }
  else if (!v159)
  {
LABEL_157:
    if (v160)
      goto LABEL_158;
    goto LABEL_166;
  }

  if (v160)
  {
LABEL_158:

    if (!v161)
      goto LABEL_159;
    goto LABEL_167;
  }
LABEL_166:
  if (!v161)
  {
LABEL_159:
    if (v162)
      goto LABEL_160;
    goto LABEL_168;
  }
LABEL_167:

  if (v162)
  {
LABEL_160:

    if (!v163)
      goto LABEL_161;
    goto LABEL_169;
  }
LABEL_168:
  if (!v163)
  {
LABEL_161:
    if (v164)
      goto LABEL_162;
    goto LABEL_170;
  }
LABEL_169:

  if (v164)
  {
LABEL_162:

    if (!v165)
      goto LABEL_172;
    goto LABEL_171;
  }
LABEL_170:
  if (v165)
LABEL_171:

LABEL_172:
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setKeyTimes:", &unk_1E8E89E98);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v166[0] = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v166[1] = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v166[2] = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v166[3] = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v166[4] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setValues:", v42);

  objc_msgSend(v36, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v36, "setDuration:", a3);
  objc_msgSend(v36, "setBeginTime:", a4);
  objc_msgSend(v36, "setAdditive:", 1);
  v43 = v36;

  return v43;
}

- (id)_controlCenterGrabberAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyTimes:", &unk_1E8E89EB0);
  objc_msgSend(v6, "setValues:", &unk_1E8E89EC8);
  objc_msgSend(v6, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(v6, "setBeginTime:", a4);
  return v6;
}

- (void)_addControlCenterGrabberResetAnimation
{
  void *v3;
  void *v4;
  id v5;

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCenterGrabberContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("position.y"), v5);
  -[CSTeachableMomentsContainerViewController _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v5);

}

- (void)_addControlCenterGlyphAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCenterGlyphContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _removeResetAnimationForKeyPath:onLayer:](self, "_removeResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v5);
  -[CSTeachableMomentsContainerViewController _removeNormalAnimationsForKeyPath:onLayer:](self, "_removeNormalAnimationsForKeyPath:onLayer:", CFSTR("opacity"), v5);
  v6 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__CSTeachableMomentsContainerViewController__addControlCenterGlyphAnimation__block_invoke;
  v7[3] = &unk_1E8E2F2E8;
  v7[4] = self;
  objc_msgSend(v6, "_addRepeatedAnimationWithProvider:toLayer:", v7, v5);

}

id __76__CSTeachableMomentsContainerViewController__addControlCenterGlyphAnimation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_controlCenterGlyphAlphaAnimationWithDuration:beginTime:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_controlCenterGlyphAlphaAnimationWithDuration:(double)a3 beginTime:(double)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyTimes:", &unk_1E8E89EE0);
  objc_msgSend(v6, "setValues:", &unk_1E8E89EF8);
  objc_msgSend(v6, "setCalculationMode:", CFSTR("cubic"));
  objc_msgSend(v6, "setDuration:", a3);
  objc_msgSend(v6, "setBeginTime:", a4);
  objc_msgSend(v6, "setAdditive:", 1);
  return v6;
}

- (void)_addControlCenterGlyphResetAnimation
{
  void *v3;
  void *v4;
  id v5;

  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlCenterGlyphContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CSTeachableMomentsContainerViewController _addResetAnimationForKeyPath:onLayer:](self, "_addResetAnimationForKeyPath:onLayer:", CFSTR("opacity"), v5);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  int v6;
  NSObject *v7;

  if (a4)
  {
    objc_msgSend(a3, "valueForKey:", CFSTR("kCSTeachableMomentIsLastAnimationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      SBLogDashBoard();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[CSTeachableMomentsContainerViewController animationDidStop:finished:].cold.1();

      -[CSTeachableMomentsContainerViewController _setupTimer](self, "_setupTimer");
    }
    -[CSTeachableMomentsContainerViewController _updateTextLabelIfNeeded](self, "_updateTextLabelIfNeeded");
  }
}

- (unint64_t)currentState
{
  return -[CSTeachableMomentsContainerViewController authenticated](self, "authenticated");
}

- (void)_updateTextLabelIfNeeded
{
  if (-[CSTeachableMomentsContainerViewController updateTextLabelOnNextAnimation](self, "updateTextLabelOnNextAnimation"))
  {
    -[CSTeachableMomentsContainerViewController setUpdateTextLabelOnNextAnimation:](self, "setUpdateTextLabelOnNextAnimation:", 0);
    -[CSTeachableMomentsContainerViewController _updateTextLabel](self, "_updateTextLabel");
  }
}

- (void)_updateTextLabel
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0337000, a2, OS_LOG_TYPE_DEBUG, "Updating Call to action Label: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateText:(id)a3
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  char v11;
  int v12;
  char v13;
  char v14;
  uint64_t v15;
  int v16;
  char v17;
  char IsD53;
  double v19;
  double v20;
  int v21;
  char v22;
  int v23;
  char v24;
  char IsD54;
  double v26;
  int v27;
  char v28;
  int v29;
  char v30;
  char IsD33OrSimilarDevice;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  double v39;
  void *v40;
  double v41;
  BOOL v42;
  id v43;

  v43 = a3;
  -[CSTeachableMomentsContainerViewController cachedLegibilityLabels](self, "cachedLegibilityLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v43);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_77;
  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createCallToActionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setString:", v43);
  objc_msgSend(v6, "setObject:forKey:", v7, v43);
  v9 = __sb__runningInSpringBoard();
  v10 = v9;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if ((_SBF_Private_IsD53() & 1) != 0)
        goto LABEL_34;
      goto LABEL_9;
    }
LABEL_21:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      IsD53 = _SBF_Private_IsD53();
      goto LABEL_31;
    }
    v16 = __sb__runningInSpringBoard();
    v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v19 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      IsD53 = 0;
      if ((v17 & 1) != 0)
        goto LABEL_31;
    }
    else
    {
      IsD53 = _SBF_Private_IsD53();
      if ((v17 & 1) != 0)
      {
LABEL_31:
        if ((v10 & 1) == 0)

        if ((IsD53 & 1) != 0)
          goto LABEL_34;
        goto LABEL_9;
      }
    }

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "userInterfaceIdiom"))
    goto LABEL_21;
  v11 = _SBF_Private_IsD53();

  if ((v11 & 1) != 0)
  {
LABEL_34:
    v20 = 0.820512821;
LABEL_75:
    objc_msgSend(v7, "font");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "_fontScaledByScaleFactor:", v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v33);

    goto LABEL_76;
  }
LABEL_9:
  v12 = __sb__runningInSpringBoard();
  v13 = v12;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if ((_SBF_Private_IsD54() & 1) != 0)
        goto LABEL_56;
      goto LABEL_16;
    }
LABEL_43:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      IsD54 = _SBF_Private_IsD54();
      goto LABEL_53;
    }
    v23 = __sb__runningInSpringBoard();
    v24 = v23;
    if (v23)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v26 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      IsD54 = 0;
      if ((v24 & 1) != 0)
        goto LABEL_53;
    }
    else
    {
      IsD54 = _SBF_Private_IsD54();
      if ((v24 & 1) != 0)
      {
LABEL_53:
        if ((v13 & 1) == 0)

        if ((IsD54 & 1) != 0)
          goto LABEL_56;
        goto LABEL_16;
      }
    }

    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "userInterfaceIdiom"))
    goto LABEL_43;
  v14 = _SBF_Private_IsD54();

  if ((v14 & 1) != 0)
  {
LABEL_56:
    v20 = 0.876168224;
    goto LABEL_75;
  }
LABEL_16:
  v15 = __sb__runningInSpringBoard();
  if ((_DWORD)v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        goto LABEL_74;
      goto LABEL_37;
    }
LABEL_61:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      IsD33OrSimilarDevice = _SBF_Private_IsD33OrSimilarDevice();
      goto LABEL_71;
    }
    v29 = __sb__runningInSpringBoard();
    v30 = v29;
    if (v29)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v32 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      IsD33OrSimilarDevice = 0;
      if ((v30 & 1) != 0)
        goto LABEL_71;
    }
    else
    {
      IsD33OrSimilarDevice = _SBF_Private_IsD33OrSimilarDevice();
      if ((v30 & 1) != 0)
      {
LABEL_71:
        if ((v15 & 1) == 0)

        if ((IsD33OrSimilarDevice & 1) != 0)
          goto LABEL_74;
        goto LABEL_37;
      }
    }

    goto LABEL_71;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "userInterfaceIdiom"))
    goto LABEL_61;
  v15 = _SBF_Private_IsD33OrSimilarDevice();

  if ((v15 & 1) != 0)
  {
LABEL_74:
    v20 = 0.905797101;
    goto LABEL_75;
  }
LABEL_37:
  v21 = __sb__runningInSpringBoard();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v15 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v15, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_76;
    goto LABEL_59;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    goto LABEL_77;
  if (SBFEffectiveHomeButtonType() == 2)
  {
LABEL_59:
    v27 = __sb__runningInSpringBoard();
    v28 = v27;
    if (v27)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v42 = v41 >= *(double *)(MEMORY[0x1E0DAB260] + 72);
    if ((v28 & 1) != 0)
    {
      if ((v22 & 1) != 0)
        goto LABEL_85;
    }
    else
    {

      if ((v22 & 1) != 0)
      {
LABEL_85:
        if (!v42)
          goto LABEL_77;
        goto LABEL_89;
      }
    }

    if (!v42)
      goto LABEL_77;
LABEL_89:
    v20 = 0.853333333;
    goto LABEL_75;
  }
  if ((v22 & 1) == 0)
LABEL_76:

LABEL_77:
  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "callToActionLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v35)
  {
    -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "componentForType:property:", 9, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isHidden");

    v39 = 1.0;
    if (v38)
      v39 = 0.0;
    objc_msgSend(v7, "setAlpha:", v39);
  }
  -[CSTeachableMomentsContainerViewController teachableMomentsContainerView](self, "teachableMomentsContainerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setCallToActionLabel:", v7);

}

- (void)_beginSuppressingHomeAffordanceAnimationForScreenOff
{
  void *v3;
  char v4;
  void *v5;

  -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("ScreenOff"));

  if ((v4 & 1) == 0)
  {
    -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", CFSTR("ScreenOff"));

  }
  -[CSTeachableMomentsContainerViewController _updateEffectiveAnimationState](self, "_updateEffectiveAnimationState");
}

- (void)_endSuppressingHomeAffordanceAnimationForScreenOff
{
  void *v3;
  int v4;
  void *v5;

  -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("ScreenOff"));

  if (v4)
  {
    -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", CFSTR("ScreenOff"));

  }
  -[CSTeachableMomentsContainerViewController _updateEffectiveAnimationState](self, "_updateEffectiveAnimationState");
}

- (void)_beginSuppressingHomeAffordanceAnimationForHomeAffordanceDoubleTap
{
  void *v3;

  -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", CFSTR("HomeAffordanceDoubleTap"));

  -[CSTeachableMomentsContainerViewController _updateEffectiveAnimationState](self, "_updateEffectiveAnimationState");
}

- (void)_endSuppressingHomeAffordanceAnimationForHomeAffordanceDoubleTap
{
  void *v3;

  -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", CFSTR("HomeAffordanceDoubleTap"));

  -[CSTeachableMomentsContainerViewController _updateEffectiveAnimationState](self, "_updateEffectiveAnimationState");
}

- (BOOL)_suppressingHomeAffordanceAnimation
{
  void *v2;
  BOOL v3;

  -[CSTeachableMomentsContainerViewController homeAffordanceAnimationSuppressionReasons](self, "homeAffordanceAnimationSuppressionReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_contentSizeCategoryChanged
{
  -[NSMutableDictionary removeAllObjects](self->_cachedLegibilityLabels, "removeAllObjects");
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSTeachableMomentsContainerViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v5, sel_aggregateAppearance_, v4);
  objc_msgSend(v4, "unionAppearance:", self->_homeAffordanceViewController, v5.receiver, v5.super_class);

}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (CSHomeAffordanceViewController)homeAffordanceViewController
{
  return self->_homeAffordanceViewController;
}

- (unint64_t)animationState
{
  return self->_animationState;
}

- (SBDashBoardHomeAffordanceAnimationViewProviding)viewProvider
{
  return (SBDashBoardHomeAffordanceAnimationViewProviding *)objc_loadWeakRetained((id *)&self->_viewProvider);
}

- (void)setViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_viewProvider, a3);
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (void)setBiometricResource:(id)a3
{
  objc_storeStrong((id *)&self->_biometricResource, a3);
}

- (NSTimer)fireOffAnimationTimer
{
  return self->_fireOffAnimationTimer;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (BOOL)updateTextLabelOnNextAnimation
{
  return self->_updateTextLabelOnNextAnimation;
}

- (void)setUpdateTextLabelOnNextAnimation:(BOOL)a3
{
  self->_updateTextLabelOnNextAnimation = a3;
}

- (NSMutableDictionary)cachedLegibilityLabels
{
  return self->_cachedLegibilityLabels;
}

- (void)setCachedLegibilityLabels:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLegibilityLabels, a3);
}

- (BOOL)controlCenterCoachingIsHidden
{
  return self->_controlCenterCoachingIsHidden;
}

- (void)setControlCenterCoachingIsHidden:(BOOL)a3
{
  self->_controlCenterCoachingIsHidden = a3;
}

- (UITapGestureRecognizer)homeAffordanceClickGestureRecognizer
{
  return self->_homeAffordanceClickGestureRecognizer;
}

- (void)setHomeAffordanceClickGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceClickGestureRecognizer, a3);
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (NSCountedSet)homeAffordanceAnimationSuppressionReasons
{
  return self->_homeAffordanceAnimationSuppressionReasons;
}

- (void)setHomeAffordanceAnimationSuppressionReasons:(id)a3
{
  objc_storeStrong((id *)&self->_homeAffordanceAnimationSuppressionReasons, a3);
}

- (unint64_t)effectiveAnimationState
{
  return self->_effectiveAnimationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceAnimationSuppressionReasons, 0);
  objc_storeStrong((id *)&self->_homeAffordanceClickGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cachedLegibilityLabels, 0);
  objc_storeStrong((id *)&self->_fireOffAnimationTimer, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
}

- (void)setAuthenticated:(unsigned __int8 *)a1 .cold.1(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D0337000, a2, OS_LOG_TYPE_DEBUG, "SBDashBoardTeachableMomentsContainerViewController setAuthenticated: %{BOOL}d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)setEffectiveAnimationState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0(&dword_1D0337000, v0, v1, "Setting up timer as a result of setting animation state bounce", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)animationDidStop:finished:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0(&dword_1D0337000, v0, v1, "Setting up timer as a result of cycle finishing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
