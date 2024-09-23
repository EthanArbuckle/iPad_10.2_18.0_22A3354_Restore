@implementation CSProudLockViewController

- (CSProudLockViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CSProudLockViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSProudLockViewController;
  result = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_deferredAuthenticationState = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CSLockScreenPearlSettings *v5;
  CSLockScreenPearlSettings *pearlSettings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSProudLockViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC648]), "initWithAuthenticationInformationProvider:", self);
  objc_msgSend(v3, "setSuppressAlongsideCoaching:", _os_feature_enabled_impl());
  objc_msgSend(v3, "setDelegate:", self);
  -[CSProudLockViewController bs_addChildViewController:](self, "bs_addChildViewController:", v3);
  -[CSProudLockViewController setProudLockContainerViewController:](self, "setProudLockContainerViewController:", v3);
  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pearlSettings");
  v5 = (CSLockScreenPearlSettings *)objc_claimAutoreleasedReturnValue();
  pearlSettings = self->_pearlSettings;
  self->_pearlSettings = v5;

  -[PTSettings addKeyObserver:](self->_pearlSettings, "addKeyObserver:", self);
  -[CSProudLockViewController _updateProudLockViewControllerConfiguration](self, "_updateProudLockViewControllerConfiguration");

}

- (void)viewDidLayoutSubviews
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
  v13.super_class = (Class)CSProudLockViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[CSProudLockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBUIProudLockContainerViewController view](self->_proudLockContainerViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSProudLockViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSProudLockViewController _createFaceDetectAssertion](self, "_createFaceDetectAssertion");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSProudLockViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CSProudLockViewController _clearFaceDetectAssertion](self, "_clearFaceDetectAssertion");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSProudLockViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSProudLockViewController _clearFaceDetectAssertion](self, "_clearFaceDetectAssertion");
}

- (void)updateLockForBiometricMatchFailure
{
  id v2;

  if (!self->_suspendLockUpdates)
  {
    -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateLockForBiometricMatchFailure");

  }
}

- (void)setSuspendLockUpdates:(BOOL)a3
{
  if (self->_suspendLockUpdates != a3)
  {
    self->_suspendLockUpdates = a3;
    if (!a3)
    {
      -[CSProudLockViewController _updateProudLockViewControllerConfiguration](self, "_updateProudLockViewControllerConfiguration");
      if (self->_deferredAuthenticationState != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CSProudLockViewController _updateForAuthenticated:](self, "_updateForAuthenticated:", BSSettingFlagIsYes());
        self->_deferredAuthenticationState = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
}

- (UIView)proudLockView
{
  void *v2;
  void *v3;

  -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)cameraCoveredView
{
  void *v2;
  void *v3;

  -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraCoveredView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isBiometricLockedOut
{
  void *v2;
  BOOL v3;

  -[CSProudLockViewController biometricResource](self, "biometricResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "biometricLockoutState") != 0;

  return v3;
}

- (BOOL)hasPasscodeSet
{
  void *v2;
  char v3;

  -[CSProudLockViewController authenticationStatusProvider](self, "authenticationStatusProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPasscodeSet");

  return v3;
}

- (void)proudLockContainerViewController:(id)a3 guidanceTextVisibilityDidChange:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[CSProudLockViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proudLockDidChangeToCoachingText:", v9);

  -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:](self, "updateAppearanceForController:withAnimationSettings:completion:", self, v7, 0);
}

- (BOOL)proudLockContainerViewControllerIsCoverSheetVisible:(id)a3
{
  void *v3;
  char v4;

  -[CSProudLockViewController delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "proudLockViewControllerIsCoverSheetVisible");

  return v4;
}

- (id)transientSubtitleText
{
  void *v2;
  void *v3;

  -[CSProudLockViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientSubtitleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CSProudLockViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v22, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 <= 15)
    {
      switch(v6)
      {
        case 1:
          -[CSCoverSheetViewControllerBase activeAppearance](self, "activeAppearance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "legibilitySettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setLegibilitySettings:", v12);

          break;
        case 13:
          objc_msgSend(v4, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");

          if (self->_suspendLockUpdates)
          {
            v5 = 0;
            self->_deferredAuthenticationState = BSSettingFlagForBool();
            goto LABEL_28;
          }
          -[CSProudLockViewController _updateForAuthenticated:](self, "_updateForAuthenticated:", v18);
          break;
        case 15:
          objc_msgSend(v4, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "integerValue");

          if (!self->_suspendLockUpdates)
          {
            -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "handleBiometricEvent:", v8);

          }
          if (v8 == 27 && -[CSProudLockViewController isBiometricLockedOut](self, "isBiometricLockedOut"))
            -[CSProudLockViewController _createFaceDetectAssertion](self, "_createFaceDetectAssertion");
          break;
        default:
          goto LABEL_28;
      }
LABEL_27:
      v5 = 0;
      goto LABEL_28;
    }
    switch(v6)
    {
      case 16:
        objc_msgSend(v4, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v16 = v15;

        if (v16 > 0.0)
          goto LABEL_27;
        -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateForScreenWillTurnOff");
        break;
      case 24:
        if (self->_suspendLockUpdates)
          goto LABEL_27;
        objc_msgSend(v4, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setScreenOn:fromUnlockSource:", 1, v20);
        break;
      case 25:
        if (self->_suspendLockUpdates)
          goto LABEL_27;
        -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setScreenOn:", 0);
        break;
      default:
        goto LABEL_28;
    }

    goto LABEL_27;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_28:

  return v5;
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CSProudLockViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v29, sel_aggregateAppearance_, v4);
  -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGuidanceTextVisible");

  if (v6)
  {
    +[CSComponent footerCallToActionLabel](CSComponent, "footerCallToActionLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "priority:", 60);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hidden:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v11);

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "priority:", 60);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase coverSheetIdentifier](self, "coverSheetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suppressTeachableMomentsAnimation:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v16);

  }
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingString:", CFSTR("BlurRadius"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeAllComponentsWithIdentifier:", v18);
  if (-[CSProudLockViewController _shouldApplyScaleAndBlurForAuthenticated](self, "_shouldApplyScaleAndBlurForAuthenticated"))
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    CSComponentTransitionInputsMake(0, (uint64_t)&v26, 0.5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 0.35, 4.0);
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "identifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "priority:", 20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transitionModifiers:", 48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    objc_msgSend(v22, "transitionInputs:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hidden:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v24);

LABEL_8:
    goto LABEL_9;
  }
  if (self->_isAuthenticated && self->_hasReactedToAuthentication)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "identifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "priority:", 20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hidden:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v22);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)_shouldApplyScaleAndBlurForAuthenticated
{
  return self->_isAuthenticated && self->_shouldReactToAuthentication && !self->_hasReactedToAuthentication;
}

- (void)_updateForAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  BOOL isAuthenticated;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CSProudLockViewController *v11;
  id v12;
  BOOL v13;
  id location;

  v3 = a3;
  isAuthenticated = self->_isAuthenticated;
  self->_isAuthenticated = a3;
  if (!a3)
  {
    self->_shouldReactToAuthentication = 0;
    self->_hasReactedToAuthentication = 0;
  }
  objc_initWeak(&location, self);
  -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __53__CSProudLockViewController__updateForAuthenticated___block_invoke;
  v10 = &unk_1E8E2DE08;
  objc_copyWeak(&v12, &location);
  v11 = self;
  v13 = isAuthenticated;
  objc_msgSend(v6, "setAuthenticated:completion:", v3, &v7);

  if (v3)
    -[CSProudLockViewController _clearFaceDetectAssertion](self, "_clearFaceDetectAssertion", v7, v8, v9, v10);
  else
    -[CSProudLockViewController _createFaceDetectAssertion](self, "_createFaceDetectAssertion", v7, v8, v9, v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__CSProudLockViewController__updateForAuthenticated___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  double v5;
  dispatch_time_t v6;
  _QWORD block[5];
  id v8;
  char v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = dbl_1D048E930[*((_BYTE *)WeakRetained + 1064) == 0];
  else
    v5 = 0.3;
  objc_msgSend(*(id *)(a1 + 32), "_updateForProudLockStateChangeDuration:completion:", 0, v5);
  v6 = dispatch_time(0, 450000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSProudLockViewController__updateForAuthenticated___block_invoke_2;
  block[3] = &unk_1E8E2DE08;
  objc_copyWeak(&v8, v2);
  v9 = *(_BYTE *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

}

void __53__CSProudLockViewController__updateForAuthenticated___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *(unsigned __int8 *)(a1 + 48) != WeakRetained[1064])
  {
    if (WeakRetained[1064])
    {
      WeakRetained[1065] = 1;
      WeakRetained[1066] = 0;
    }
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__CSProudLockViewController__updateForAuthenticated___block_invoke_3;
    v6[3] = &unk_1E8E2DDE0;
    v7 = v3;
    objc_msgSend(v7, "updateAppearanceForController:withAnimationSettings:completion:", v5, v4, v6);

  }
}

uint64_t __53__CSProudLockViewController__updateForAuthenticated___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    if (*(_BYTE *)(v1 + 1064))
    {
      *(_BYTE *)(v1 + 1065) = 0;
      *(_BYTE *)(*(_QWORD *)(result + 32) + 1066) = 1;
    }
  }
  return result;
}

- (void)_updateForProudLockStateChangeAnimated:(BOOL)a3
{
  double v3;

  v3 = 0.3;
  if (!a3)
    v3 = 0.0;
  -[CSProudLockViewController _updateForProudLockStateChangeDuration:completion:](self, "_updateForProudLockStateChangeDuration:completion:", 0, v3);
}

- (void)_updateForProudLockStateChangeDuration:(double)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if ((BSFloatIsZero() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:](self, "updateAppearanceForController:withAnimationSettings:completion:", self, v6, v7);

}

- (void)_createFaceDetectAssertion
{
  void *v3;
  int v4;
  BSInvalidatable *v5;
  BSInvalidatable *faceDetectWantedAssertion;
  id v7;

  if (!self->_faceDetectWantedAssertion
    && -[CSProudLockViewController isBiometricLockedOut](self, "isBiometricLockedOut"))
  {
    -[CSProudLockViewController biometricResource](self, "biometricResource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasBiometricAuthenticationCapabilityEnabled");

    if (v4)
    {
      -[CSProudLockViewController biometricResource](self, "biometricResource");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "acquireFaceDetectionWantedAssertionForReason:", CFSTR("FaceDetectForProudLock"));
      v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      faceDetectWantedAssertion = self->_faceDetectWantedAssertion;
      self->_faceDetectWantedAssertion = v5;

    }
  }
}

- (void)_clearFaceDetectAssertion
{
  BSInvalidatable *faceDetectWantedAssertion;
  BSInvalidatable *v4;

  faceDetectWantedAssertion = self->_faceDetectWantedAssertion;
  if (faceDetectWantedAssertion)
  {
    -[BSInvalidatable invalidate](faceDetectWantedAssertion, "invalidate");
    v4 = self->_faceDetectWantedAssertion;
    self->_faceDetectWantedAssertion = 0;

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  unint64_t v5;
  void *v6;

  if (self->_pearlSettings == a3)
  {
    if (objc_msgSend(a3, "overrideCoachingConditionEnabled"))
      v5 = -[CSLockScreenPearlSettings overrideCoachingBiometricEvent](self->_pearlSettings, "overrideCoachingBiometricEvent");
    else
      v5 = 16;
    -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleBiometricEvent:", v5);

    -[CSProudLockViewController _updateProudLockViewControllerConfiguration](self, "_updateProudLockViewControllerConfiguration");
  }
}

- (void)_updateProudLockViewControllerConfiguration
{
  CSLockScreenPearlSettings *pearlSettings;
  void *v4;
  _OWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  pearlSettings = self->_pearlSettings;
  if (pearlSettings)
    -[CSLockScreenPearlSettings proudLockControllerViewControllerConfiguration](pearlSettings, "proudLockControllerViewControllerConfiguration");
  -[CSProudLockViewController proudLockContainerViewController](self, "proudLockContainerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  objc_msgSend(v4, "setConfiguration:", v5);

}

- (SBUIProudLockContainerViewController)proudLockContainerViewController
{
  return self->_proudLockContainerViewController;
}

- (void)setProudLockContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_proudLockContainerViewController, a3);
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (void)setBiometricResource:(id)a3
{
  objc_storeStrong((id *)&self->_biometricResource, a3);
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void)setAuthenticationStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationStatusProvider, a3);
}

- (BOOL)suspendLockUpdates
{
  return self->_suspendLockUpdates;
}

- (CSProudLockViewControllerDelegate)delegate
{
  return (CSProudLockViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewController, 0);
  objc_storeStrong((id *)&self->_faceDetectWantedAssertion, 0);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
}

@end
