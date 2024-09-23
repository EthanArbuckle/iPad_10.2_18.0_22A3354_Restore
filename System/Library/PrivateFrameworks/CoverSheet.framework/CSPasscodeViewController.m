@implementation CSPasscodeViewController

- (CSPasscodeViewController)initWithOptions:(unint64_t)a3
{
  CSPasscodeViewController *v4;
  CSPasscodeViewController *v5;
  void *v6;
  uint64_t v7;
  CSLockScreenPearlSettings *pearlSettings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSPasscodeViewController;
  v4 = -[CSPasscodeViewController init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pearlSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    pearlSettings = v5->_pearlSettings;
    v5->_pearlSettings = (CSLockScreenPearlSettings *)v7;

    -[PTSettings addKeyObserver:](v5->_pearlSettings, "addKeyObserver:", v5);
    -[CSPasscodeViewController _updateProudLockViewControllerConfiguration](v5, "_updateProudLockViewControllerConfiguration");
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CSCoverSheetContextProviding authenticationManager](self->_coverSheetContext, "authenticationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBiometricAutoUnlockingDisabled:forReason:", 0, v4);

  -[SBFAuthenticationAssertion invalidate](self->_sustainAuthenticationAssertion, "invalidate");
  -[CSPasscodeViewController _setBiometricAuthenticationEnabledForTransientAppearanceTransition:](self, "_setBiometricAuthenticationEnabledForTransientAppearanceTransition:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v5, sel_dealloc);
}

- (void)loadView
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
  SBUIPasscodeLockView_Internal *v12;
  SBUIPasscodeLockView_Internal *passcodeLockView;
  SBUIPasscodeLockView_Internal *v14;
  void *v15;
  SBUIPasscodeLockView_Internal *v16;
  void *v17;
  SBUIPasscodeLockView_Internal *v18;
  void *v19;
  SBUIPasscodeLockView_Internal *v20;
  void *v21;
  SBUIPasscodeLockView_Internal *v22;
  SBUIPasscodeLockView_Internal *v23;
  void *v24;
  CSPasscodeBackgroundView *v25;
  CSPasscodeBackgroundView *backgroundView;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase loadView](&v27, sel_loadView);
  -[CSPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[CSPasscodeViewController _shouldUseLightStylePasscodeView](self, "_shouldUseLightStylePasscodeView"))
    objc_msgSend(MEMORY[0x1E0DAC5F8], "lightPasscodeLockViewForUsersCurrentStyle");
  else
    objc_msgSend(MEMORY[0x1E0DAC5F8], "passcodeLockViewForUsersCurrentStyle");
  v12 = (SBUIPasscodeLockView_Internal *)objc_claimAutoreleasedReturnValue();
  passcodeLockView = self->_passcodeLockView;
  self->_passcodeLockView = v12;

  v14 = self->_passcodeLockView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView_Internal setCustomBackgroundColor:](v14, "setCustomBackgroundColor:", v15);

  v16 = self->_passcodeLockView;
  v17 = (void *)-[CSWallpaperColorProvider newLegibilitySettingsProvider](self->_wallpaperColorProvider, "newLegibilitySettingsProvider");
  -[SBUIPasscodeLockView_Internal setBackgroundLegibilitySettingsProvider:](v16, "setBackgroundLegibilitySettingsProvider:", v17);

  v18 = self->_passcodeLockView;
  if ((self->_options & 1) != 0)
  {
    -[SBUIPasscodeLockView_Internal setShowsEmergencyCallButton:](self->_passcodeLockView, "setShowsEmergencyCallButton:", 0);
  }
  else
  {
    -[CSCoverSheetContextProviding telephonyStatusProvider](self->_coverSheetContext, "telephonyStatusProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockView_Internal setShowsEmergencyCallButton:](v18, "setShowsEmergencyCallButton:", objc_msgSend(v19, "isEmergencyCallSupported"));

  }
  v20 = self->_passcodeLockView;
  -[CSCoverSheetContextProviding authenticationStatusProvider](self->_coverSheetContext, "authenticationStatusProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView_Internal _noteDeviceHasBeenUnlockedOnceSinceBoot:](v20, "_noteDeviceHasBeenUnlockedOnceSinceBoot:", objc_msgSend(v21, "hasAuthenticatedAtLeastOnceSinceBoot"));

  -[SBUIPasscodeLockView_Internal setScreenOn:](self->_passcodeLockView, "setScreenOn:", 1);
  -[SBUIPasscodeLockView_Internal setDelegate:](self->_passcodeLockView, "setDelegate:", self);
  -[SBUIPasscodeLockView_Internal setShowsProudLock:](self->_passcodeLockView, "setShowsProudLock:", 0);
  -[CSPasscodeViewController _updateProudLockViewControllerConfiguration](self, "_updateProudLockViewControllerConfiguration");
  v22 = self->_passcodeLockView;
  objc_msgSend(v3, "bounds");
  -[SBUIPasscodeLockView_Internal setFrame:](v22, "setFrame:");
  -[SBUIPasscodeLockView_Internal setAutoresizingMask:](self->_passcodeLockView, "setAutoresizingMask:", 18);
  -[SBUIPasscodeLockView_Internal setUsesBiometricPresentation:](self->_passcodeLockView, "setUsesBiometricPresentation:", -[CSPasscodeViewController useBiometricPresentation](self, "useBiometricPresentation"));
  -[SBUIPasscodeLockView_Internal setBiometricPresentationAncillaryButtonsVisible:](self->_passcodeLockView, "setBiometricPresentationAncillaryButtonsVisible:", -[CSPasscodeViewController biometricButtonsInitiallyVisible](self, "biometricButtonsInitiallyVisible"));
  v23 = self->_passcodeLockView;
  -[CSPasscodeViewController unlockDestination](self, "unlockDestination");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView_Internal setUnlockDestination:](v23, "setUnlockDestination:", v24);

  -[SBUIPasscodeLockView_Internal setConfirmedNotInPocket:](self->_passcodeLockView, "setConfirmedNotInPocket:", -[CSPasscodeViewController confirmedNotInPocket](self, "confirmedNotInPocket"));
  -[SBUIPasscodeLockView_Internal setCanSuggestSwipeToRetry:](self->_passcodeLockView, "setCanSuggestSwipeToRetry:", 1);
  objc_msgSend(v3, "addSubview:", self->_passcodeLockView);
  v25 = objc_alloc_init(CSPasscodeBackgroundView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v25;

  -[CSPasscodeBackgroundView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
  -[CSPasscodeBackgroundView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  -[CSPasscodeViewController _updateReduceTransparencyBackingColor](self, "_updateReduceTransparencyBackingColor");
  objc_msgSend(v3, "addSubview:", self->_backgroundView);
  objc_msgSend(v3, "sendSubviewToBack:", self->_backgroundView);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  -[CSPasscodeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase registerView:forRole:](self, "registerView:forRole:", v3, 3);

  v4.receiver = self;
  v4.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v4, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  SBUIPasscodeLockView_Internal *passcodeLockView;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v9, sel_viewWillAppear_);
  passcodeLockView = self->_passcodeLockView;
  -[CSPasscodeViewController proudLockContainerViewControllerToUpdate](self, "proudLockContainerViewControllerToUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockView_Internal setOverrideProudLockContainerViewController:](passcodeLockView, "setOverrideProudLockContainerViewController:", v6);

  -[CSPasscodeViewController _setBiometricAuthenticationEnabledForTransientAppearanceTransition:](self, "_setBiometricAuthenticationEnabledForTransientAppearanceTransition:", 1);
  -[CSCoverSheetContextProviding authenticationManager](self->_coverSheetContext, "authenticationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBiometricAutoUnlockingDisabled:forReason:", 1, v8);

  if ((-[CSFaceOcclusionMonitor faceOcclusionsSinceScreenOn](self->_faceOcclusionMonitor, "faceOcclusionsSinceScreenOn") & 1) != 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBUIPasscodeLockView_Internal noteBottomFaceHasBeenOccluded](self->_passcodeLockView, "noteBottomFaceHasBeenOccluded");
  }
  if ((-[CSFaceOcclusionMonitor faceOcclusionsSinceScreenOn](self->_faceOcclusionMonitor, "faceOcclusionsSinceScreenOn") & 2) != 0&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBUIPasscodeLockView_Internal noteFaceHasBeenOccluded](self->_passcodeLockView, "noteFaceHasBeenOccluded");
  }
  if (v3)
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "_performBlockAfterCATransactionCommits:", &__block_literal_global_4);
}

uint64_t __43__CSPasscodeViewController_viewWillAppear___block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("DashBoardPasscodePresented"), CFSTR("DashBoardPasscode"));
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (a3)
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("DashBoardPasscodePresented"), CFSTR("DashBoardPasscode"));
  v6.receiver = self;
  v6.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  +[CSAction actionWithType:](CSAction, "actionWithType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v5);

  -[CSPasscodeViewController _setBiometricAuthenticationEnabledForTransientAppearanceTransition:](self, "_setBiometricAuthenticationEnabledForTransientAppearanceTransition:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v8, sel_viewWillDisappear_);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
  if (v3)
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "_performBlockAfterCATransactionCommits:", &__block_literal_global_26);
  -[CSCoverSheetContextProviding authenticationManager](self->_coverSheetContext, "authenticationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPasscodeVisible:animated:", 0, v3);

  -[CSPasscodeViewController _setBiometricAuthenticationEnabledForTransientAppearanceTransition:](self, "_setBiometricAuthenticationEnabledForTransientAppearanceTransition:", 0);
  -[CSCoverSheetContextProviding authenticationManager](self->_coverSheetContext, "authenticationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBiometricAutoUnlockingDisabled:forReason:", 0, v7);

  -[SBUIPasscodeLockView_Internal resignFirstResponder](self->_passcodeLockView, "resignFirstResponder");
  -[SBUIPasscodeLockView_Internal setOverrideProudLockContainerViewController:](self->_passcodeLockView, "setOverrideProudLockContainerViewController:", 0);
}

uint64_t __46__CSPasscodeViewController_viewWillDisappear___block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("DashBoardPasscodeDismissed"), CFSTR("DashBoardPasscode"));
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SBFAuthenticationAssertion *sustainAuthenticationAssertion;
  objc_super v6;

  v3 = a3;
  if (a3)
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("DashBoardPasscodeDismissed"), CFSTR("DashBoardPasscode"));
  v6.receiver = self;
  v6.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  -[SBFAuthenticationAssertion invalidate](self->_sustainAuthenticationAssertion, "invalidate");
  sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
  self->_sustainAuthenticationAssertion = 0;

  -[CSPasscodeViewController _setBiometricAuthenticationEnabledForTransientAppearanceTransition:](self, "_setBiometricAuthenticationEnabledForTransientAppearanceTransition:", 0);
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v41, sel_aggregateAppearance_, v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "hidden:", -[CSPasscodeViewController showProudLock](self, "showProudLock") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 60);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prefersInlineCoaching:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addComponent:", v10);
  v11 = SBUICurrentPasscodeStyleForUser();
  if (v11 == 3)
  {
    v12 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
    if (v12 == 4 || v12 == 2)
    {
      +[CSComponent poseidon](CSComponent, "poseidon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "priority:", 60);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hidden:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addComponent:", v15);

    }
  }
  -[CSPasscodeViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "passcodeViewControllerShouldHideStatusBar:", self);

  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "priority:", 60);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hidden:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fakeStatusBar:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v21);

  if (-[CSPasscodeViewController _shouldUseLightStylePasscodeView](self, "_shouldUseLightStylePasscodeView"))
  {
    v22 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithStyle:contentColor:", 2, v23);

  }
  else
  {
    CSGetLegibilitySettingsForBackgroundStyle(7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setLegibilitySettings:", v24);

  if (SBFEffectiveHomeButtonType() == 2)
  {
    if (!-[SBUIPasscodeLockView_Internal passcodeLockViewState](self->_passcodeLockView, "passcodeLockViewState"))
    {
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "priority:", 60);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hidden:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "suppressTeachableMomentsAnimation:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addComponent:", v30);

LABEL_19:
      goto LABEL_20;
    }
    if (-[SBUIPasscodeLockView_Internal passcodeLockViewState](self->_passcodeLockView, "passcodeLockViewState") != 1)
    {
LABEL_20:
      +[CSComponent controlCenterGrabber](CSComponent, "controlCenterGrabber");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "priority:", 60);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "hidden:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addComponent:", v40);

      goto LABEL_21;
    }
    if (v11 == 3)
    {
      if ((__sb__runningInSpringBoard() & 1) != 0)
      {
        if (SBFEffectiveDeviceClass() != 2)
          goto LABEL_18;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "userInterfaceIdiom");

      if (v32 == 1)
      {
LABEL_17:
        v33 = (void *)objc_opt_new();
        objc_msgSend(v33, "priority:", 60);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "suppressTeachableMomentsAnimation:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addComponent:", v37);

      }
    }
LABEL_18:
    +[CSComponent whitePoint](CSComponent, "whitePoint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "priority:", 60);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hidden:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addComponent:", v29);
    goto LABEL_19;
  }
LABEL_21:

}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPasscodeViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v6, sel_aggregateBehavior_, v4);
  objc_msgSend(v4, "setIdleTimerDuration:", 6, v6.receiver, v6.super_class);
  objc_msgSend(v4, "setIdleTimerMode:", 2);
  objc_msgSend(v4, "setIdleWarnMode:", 1);
  if (-[SBUIPasscodeLockView_Internal passcodeLockViewState](self->_passcodeLockView, "passcodeLockViewState") == 1)
    v5 = 2130112;
  else
    v5 = 2134208;
  objc_msgSend(v4, "setRestrictedCapabilities:", v5);

}

- (id)_newDisplayLayoutElement
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DAAE30]);
  v3 = (void *)objc_msgSend(v2, "initWithIdentifier:", *MEMORY[0x1E0DAB688]);
  objc_msgSend(v3, "setFillsDisplayBounds:", 1);
  objc_msgSend(v3, "setLayoutRole:", 6);
  return v3;
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  BOOL v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  BOOL v26;
  _QWORD v27[6];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke;
    v27[3] = &unk_1E8E2DB38;
    v27[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v27);
    -[SBUIPasscodeLockView_Internal becomeActiveWithAnimationSettings:](self->_passcodeLockView, "becomeActiveWithAnimationSettings:", v8);
  }
  -[SBUIPasscodeLockView_Internal setKeypadVisible:animated:](self->_passcodeLockView, "setKeypadVisible:animated:", v6, v8 != 0);
  -[SBUIPasscodeLockView_Internal layer](self->_passcodeLockView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationModifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CEABB0];
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2;
    v25[3] = &unk_1E8E2E190;
    v26 = v6;
    v25[4] = self;
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3;
    v23[3] = &unk_1E8E2E2C0;
    v15 = &v24;
    v24 = v9;
    v16 = v9;
    objc_msgSend(v14, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v25, v23, 340.0, 30.0);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D01908];
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_4;
    v21[3] = &unk_1E8E2E190;
    v22 = v6;
    v21[4] = self;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_5;
    v19[3] = &unk_1E8E2DFA8;
    v15 = &v20;
    v20 = v9;
    v18 = v9;
    objc_msgSend(v17, "animateWithSettings:options:actions:completion:", v8, 2, v21, v19);
  }

}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setWeighting:", 0.0);
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setWeighting:", v3);
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", v2);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setWeighting:", v3);
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)presentationCancelsTouches
{
  return 0;
}

- (void)beginInteractivePresentationTransitionForInitialTransition:(BOOL)a3
{
  _QWORD v4[5];

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __87__CSPasscodeViewController_beginInteractivePresentationTransitionForInitialTransition___block_invoke;
    v4[3] = &unk_1E8E2DB38;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
  }
  else
  {
    -[SBUIPasscodeLockView_Internal beginTransitionToState:](self->_passcodeLockView, "beginTransitionToState:", 0);
  }
  -[SBUIPasscodeLockView_Internal setAllowsAutomaticBiometricPresentationTransition:](self->_passcodeLockView, "setAllowsAutomaticBiometricPresentationTransition:", 0);
}

uint64_t __87__CSPasscodeViewController_beginInteractivePresentationTransitionForInitialTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setWeighting:", 0.0);
}

- (void)updateInteractiveTransitionWithPercent:(double)a3 forInitialTransition:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;

  if (a4)
  {
    v6 = fmin(fmax(a3 * a3, 0.0), 1.0);
    -[SBUIPasscodeLockView_Internal setAlpha:](self->_passcodeLockView, "setAlpha:", v6);
    -[CSPasscodeBackgroundView setWeighting:](self->_backgroundView, "setWeighting:", v6);
  }
  else
  {
    -[SBUIPasscodeLockView_Internal updateTransitionWithProgress:](self->_passcodeLockView, "updateTransitionWithProgress:", a3);
  }
  -[SBUIPasscodeLockView_Internal frame](self->_passcodeLockView, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBUIPasscodeLockView_Internal bounds](self->_passcodeLockView, "bounds");
  -[SBUIPasscodeLockView_Internal setFrame:](self->_passcodeLockView, "setFrame:", v8, (1.0 - a3) * CGRectGetMidY(v13), v10, v12);
}

- (void)commitingToEndTransitionToPresented:(BOOL)a3 forInitialTransition:(BOOL)a4
{
  BOOL v5;

  if (!a3)
    self->_isBeingDismissedAfterInterstitialTransitionCancelled = 1;
  if (!a4)
  {
    v5 = !a3;
    -[SBUIPasscodeLockView_Internal willEndTransitionToState:](self->_passcodeLockView, "willEndTransitionToState:", !a3);
    if (!v5)
      -[SBUIPasscodeLockView_Internal _resumeBiometricMatchingAdvisory:](self->_passcodeLockView, "_resumeBiometricMatchingAdvisory:", 0);
  }
}

- (void)endInteractiveTransitionToPresented:(BOOL)a3 forInitialTransition:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  SBUIPasscodeLockView_Internal *passcodeLockView;
  uint64_t v8;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  _QWORD v12[6];
  _QWORD v13[9];
  CGRect v14;

  v4 = a4;
  v5 = a3;
  -[CSPasscodeBackgroundView setWeighting:](self->_backgroundView, "setWeighting:", 1.0);
  if ((-[SBFAuthenticationAssertion isValid](self->_sustainAuthenticationAssertion, "isValid") & 1) == 0)
    -[SBUIPasscodeLockView_Internal setAllowsAutomaticBiometricPresentationTransition:](self->_passcodeLockView, "setAllowsAutomaticBiometricPresentationTransition:", 1);
  if (v4)
  {
    if (v5)
      -[SBUIPasscodeLockView_Internal _resumeBiometricMatchingAdvisory:](self->_passcodeLockView, "_resumeBiometricMatchingAdvisory:", 1);
  }
  else
  {
    passcodeLockView = self->_passcodeLockView;
    v8 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      -[SBUIPasscodeLockView_Internal _resumeBiometricMatchingAdvisory:](passcodeLockView, "_resumeBiometricMatchingAdvisory:", 1);
    }
    else
    {
      -[SBUIPasscodeLockView_Internal frame](passcodeLockView, "frame");
      x = v14.origin.x;
      width = v14.size.width;
      height = v14.size.height;
      CGRectGetMinY(v14);
      if ((BSFloatIsZero() & 1) == 0)
      {
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke;
        v13[3] = &unk_1E8E2EDA8;
        v13[4] = self;
        *(CGFloat *)&v13[5] = x;
        v13[6] = 0;
        *(CGFloat *)&v13[7] = width;
        *(CGFloat *)&v13[8] = height;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
      }
    }
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke_2;
    v12[3] = &unk_1E8E2EDD0;
    v12[4] = self;
    v12[5] = !v5;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
  }
  self->_isBeingDismissedAfterInterstitialTransitionCancelled = 0;
}

uint64_t __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "didEndTransitionToState:", *(_QWORD *)(a1 + 40));
}

- (void)setWallpaperAverageColorOverride:(id)a3
{
  if (self->_wallpaperAverageColorOverride != a3)
  {
    self->_wallpaperAverageColorOverride = (UIColor *)a3;
    -[CSPasscodeViewController _updateReduceTransparencyBackingColor](self, "_updateReduceTransparencyBackingColor");
  }
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  CSCoverSheetContextProviding *coverSheetContext;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  coverSheetContext = self->_coverSheetContext;
  v5 = a3;
  -[CSCoverSheetContextProviding passcodeFieldChangeObserver](coverSheetContext, "passcodeFieldChangeObserver");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  if (v7)
    objc_msgSend(v9, "notePasscodeEntryBegan");
  else
    objc_msgSend(v9, "notePasscodeEntryCancelled");
  +[CSAction actionWithType:](CSAction, "actionWithType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v8);

}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  -[CSPasscodeViewController _passcodeLockViewPasscodeEntered:authenticationType:](self, "_passcodeLockViewPasscodeEntered:authenticationType:", a3, 1);
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
  -[CSPasscodeViewController _passcodeLockViewPasscodeEntered:authenticationType:](self, "_passcodeLockViewPasscodeEntered:authenticationType:", a3, 2);
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  void *v4;
  id WeakRetained;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewControllerDidCancelPasscodeEntry:", self);

  -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  void *v4;
  id v5;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

  +[CSAction actionWithType:](CSAction, "actionWithType:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v5);

}

- (void)passcodeLockViewStateChange:(id)a3
{
  -[CSCoverSheetViewControllerBase rebuildEverythingForReason:](self, "rebuildEverythingForReason:", CFSTR("-[SBDashBoardPasscodeViewController passcodeLockViewStateChange:]"));
}

- (int64_t)presentationStyle
{
  return 2;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 550;
}

- (int64_t)presentationTransition
{
  return 1;
}

- (CAFrameRateRange)presentationPreferredFrameRateRange
{
  return CAFrameRateRangeMake(80.0, 120.0, 120.0);
}

- (unsigned)presentationFrameRateRangeReason
{
  return 1114125;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  SBFAuthenticationAssertion *sustainAuthenticationAssertion;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSPasscodeViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v12, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 <= 23)
    {
      if (v6 == 5)
      {
        -[SBUIPasscodeLockView_Internal resignFirstResponder](self->_passcodeLockView, "resignFirstResponder");
      }
      else
      {
        if (v6 != 13)
          goto LABEL_18;
        objc_msgSend(v4, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");

        if ((v8 & 1) == 0)
        {
          -[CSPasscodeViewController proudLockContainerViewControllerToUpdate](self, "proudLockContainerViewControllerToUpdate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAuthenticated:", 0);

        }
      }
    }
    else
    {
      switch(v6)
      {
        case 24:
          -[SBUIPasscodeLockView_Internal setScreenOn:](self->_passcodeLockView, "setScreenOn:", 1);
          break;
        case 25:
          -[SBUIPasscodeLockView_Internal setScreenOn:](self->_passcodeLockView, "setScreenOn:", 0);
          -[SBFAuthenticationAssertion invalidate](self->_sustainAuthenticationAssertion, "invalidate");
          sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
          self->_sustainAuthenticationAssertion = 0;

          break;
        case 27:
          if (-[CSPasscodeViewController _shouldEmulateInteractivePresentation](self, "_shouldEmulateInteractivePresentation"))
          {
            -[CSPasscodeViewController _emulateInteractivePresentation](self, "_emulateInteractivePresentation");
          }
          break;
        default:
          goto LABEL_18;
      }
    }
    v5 = 0;
    goto LABEL_18;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_18:

  return v5;
}

- (void)_setBiometricAuthenticationEnabledForTransientAppearanceTransition:(BOOL)a3
{
  -[SBUIPasscodeLockView_Internal _overrideBiometricMatchingEnabled:forReason:](self->_passcodeLockView, "_overrideBiometricMatchingEnabled:forReason:", a3, CFSTR("DashBoardTransientPasscodeAppearanceTransition"));
}

- (void)_passcodeLockViewPasscodeEntered:(id)a3 authenticationType:(unint64_t)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  if (!self->_attemptingUnlock)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "passcodeViewControllerDidBeginPasscodeEntry:", self);

    self->_attemptingUnlock = 1;
    if (a4 == 1)
    {
      objc_msgSend(v6, "passcode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[CSCoverSheetContextProviding authenticationAssertionProvider](self->_coverSheetContext, "authenticationAssertionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createGracePeriodAssertionWithReason:", CFSTR("DashBoardAttemptUnlock"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activate");
    v11 = !self->_isBeingDismissedAfterInterstitialTransitionCancelled;
    -[CSCoverSheetContextProviding authenticationManager](self->_coverSheetContext, "authenticationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__CSPasscodeViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke;
    v15[3] = &unk_1E8E2EDF8;
    v15[4] = self;
    v16 = v9;
    v17 = v6;
    v18 = v10;
    v13 = v10;
    v14 = v9;
    objc_msgSend(v12, "attemptUnlockWithPasscode:finishUIUnlock:completion:", v8, v11, v15);

  }
}

uint64_t __80__CSPasscodeViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1104));
  objc_msgSend(WeakRetained, "passcodeViewController:didCompletePasscodeEntry:", *(_QWORD *)(a1 + 32), a2 & a3);

  if (a2)
  {
    if (a3)
    {
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048))
      {
        objc_msgSend(*(id *)(a1 + 40), "createKeybagUnlockAssertionWithReason:", CFSTR("DashBoardSustainUnlock"));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 1048);
        *(_QWORD *)(v8 + 1048) = v7;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "activate");
      }
      objc_msgSend(*(id *)(a1 + 48), "resetForSuccess");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "resetForFailedPasscode");
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1040) = 0;
  return objc_msgSend(*(id *)(a1 + 56), "invalidate");
}

- (BOOL)_shouldUseLightStylePasscodeView
{
  _BOOL4 IsReduceTransparencyEnabled;
  void *v4;
  char v5;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (IsReduceTransparencyEnabled)
  {
    -[CSPasscodeViewController _effectiveAverageWallpaperColor](self, "_effectiveAverageWallpaperColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sb_brightness");
    v5 = BSFloatGreaterThanFloat();

    LOBYTE(IsReduceTransparencyEnabled) = v5;
  }
  return IsReduceTransparencyEnabled;
}

- (void)_updateReduceTransparencyBackingColor
{
  int v3;
  int v4;
  double v5;
  void *v6;
  SBUIPasscodeLockView_Internal *passcodeLockView;
  uint64_t v8;
  SBUIPasscodeLockView_Internal *v9;
  SBUIPasscodeLockView_Internal *v10;
  SBUIPasscodeLockView_Internal *v11;
  void *v12;
  id v13;

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[CSPasscodeViewController _effectiveAverageWallpaperColor](self, "_effectiveAverageWallpaperColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sb_brightness");
    v3 = BSFloatLessThanFloat();
    v4 = BSFloatGreaterThanFloat();
    v5 = 0.666666667;
    if (v4)
      v5 = 1.0;
    if (v3)
      v5 = 0.5;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v5, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    passcodeLockView = self->_passcodeLockView;
    v8 = objc_opt_class();
    v9 = passcodeLockView;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    -[SBUIPasscodeLockView_Internal _numberPad](v11, "_numberPad");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setReduceTransparencyButtonColor:", v6);
    -[CSPasscodeBackgroundView setReduceTransparencyBackingColor:](self->_backgroundView, "setReduceTransparencyBackingColor:", v13);

  }
}

- (id)_effectiveAverageWallpaperColor
{
  UIColor *wallpaperAverageColorOverride;
  UIColor *v3;
  void *v4;
  void *v5;
  UIColor *v6;

  wallpaperAverageColorOverride = self->_wallpaperAverageColorOverride;
  if (wallpaperAverageColorOverride)
  {
    v3 = wallpaperAverageColorOverride;
  }
  else
  {
    -[CSWallpaperColorProvider averageColorForCurrentWallpaper](self->_wallpaperColorProvider, "averageColorForCurrentWallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v6;

  }
  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_pearlSettings == a3)
    -[CSPasscodeViewController _updateProudLockViewControllerConfiguration](self, "_updateProudLockViewControllerConfiguration");
}

- (void)_updateProudLockViewControllerConfiguration
{
  CSLockScreenPearlSettings *pearlSettings;
  SBUIPasscodeLockView_Internal *passcodeLockView;
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
  passcodeLockView = self->_passcodeLockView;
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  -[SBUIPasscodeLockView_Internal setProudLockConfiguration:](passcodeLockView, "setProudLockConfiguration:", v5);
}

- (BOOL)_shouldEmulateInteractivePresentation
{
  int v2;

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (v2 = _AXSAssistiveTouchEnabled()) != 0)
  {
    LOBYTE(v2) = SBFEffectiveHomeButtonType() == 2;
  }
  return v2;
}

- (void)_emulateInteractivePresentation
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[CSPasscodeViewController _shouldEmulateInteractivePresentation](self, "_shouldEmulateInteractivePresentation"))
  {
    if ((-[CSPasscodeViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared") & 1) == 0)
    {
      -[CSPasscodeViewController beginInteractivePresentationTransitionForInitialTransition:](self, "beginInteractivePresentationTransitionForInitialTransition:", 0);
      -[CSPasscodeViewController updateInteractiveTransitionWithPercent:forInitialTransition:](self, "updateInteractiveTransitionWithPercent:forInitialTransition:", 0, 0.0);
      v3[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke;
      v4[3] = &unk_1E8E2DB38;
      v4[4] = self;
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke_2;
      v3[3] = &unk_1E8E2DDE0;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v4, v3, 0.4);
    }
  }
}

uint64_t __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateInteractiveTransitionWithPercent:forInitialTransition:", 0, 1.0);
}

uint64_t __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "commitingToEndTransitionToPresented:forInitialTransition:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "endInteractiveTransitionToPresented:forInitialTransition:", 1, 0);
}

- (CSPasscodeViewControllerDelegate)delegate
{
  return (CSPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useBiometricPresentation
{
  return self->_useBiometricPresentation;
}

- (void)setUseBiometricPresentation:(BOOL)a3
{
  self->_useBiometricPresentation = a3;
}

- (BOOL)biometricButtonsInitiallyVisible
{
  return self->_biometricButtonsInitiallyVisible;
}

- (void)setBiometricButtonsInitiallyVisible:(BOOL)a3
{
  self->_biometricButtonsInitiallyVisible = a3;
}

- (BOOL)showProudLock
{
  return self->_showProudLock;
}

- (void)setShowProudLock:(BOOL)a3
{
  self->_showProudLock = a3;
}

- (SBUIProudLockContainerViewController)proudLockContainerViewControllerToUpdate
{
  return self->_proudLockContainerViewControllerToUpdate;
}

- (void)setProudLockContainerViewControllerToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_proudLockContainerViewControllerToUpdate, a3);
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (UIColor)wallpaperAverageColorOverride
{
  return self->_wallpaperAverageColorOverride;
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (void)setCoverSheetContext:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetContext, a3);
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  return self->_wallpaperColorProvider;
}

- (void)setWallpaperColorProvider:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperColorProvider, a3);
}

- (CSFaceOcclusionMonitor)faceOcclusionMonitor
{
  return self->_faceOcclusionMonitor;
}

- (void)setFaceOcclusionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_faceOcclusionMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceOcclusionMonitor, 0);
  objc_storeStrong((id *)&self->_wallpaperColorProvider, 0);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewControllerToUpdate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_passcodeLockView, 0);
  objc_storeStrong((id *)&self->_sustainAuthenticationAssertion, 0);
}

@end
