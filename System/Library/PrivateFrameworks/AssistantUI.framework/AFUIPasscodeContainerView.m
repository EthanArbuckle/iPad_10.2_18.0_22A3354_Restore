@implementation AFUIPasscodeContainerView

- (AFUIPasscodeContainerView)initWithFrame:(CGRect)a3 backdropView:(id)a4 mode:(int64_t)a5 passcodeViewFactoryClass:(Class)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  AFUIPasscodeContainerView *v14;
  AFUIPasscodeContainerView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AFUIPasscodeContainerView;
  v14 = -[AFUIPasscodeContainerView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_backdropView, v13);
    v15->_mode = a5;
    v15->_factoryClass = a6;
  }

  return v15;
}

- (void)cancelShowingPasscodeUnlock
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_unlockCompletion)
  {
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __56__AFUIPasscodeContainerView_cancelShowingPasscodeUnlock__block_invoke;
    v4[3] = &unk_24D7A1BF8;
    objc_copyWeak(&v5, &location);
    objc_msgSend(WeakRetained, "passcodeView:hideLockViewWithResult:unlockCompletionHandler:", self, 2, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __56__AFUIPasscodeContainerView_cancelShowingPasscodeUnlock__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupWithResult:", a2);

}

- (id)_lockViewLegibilityProvider
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BEB0848]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_backdropView);
  v5 = (void *)objc_msgSend(v3, "initWithBackdropView:", WeakRetained);

  return v5;
}

- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void (**v13)(id, uint64_t);
  unint64_t mode;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id unlockCompletion;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  AFUIPasscodeBlurView *passcodeBlurView;
  AFUIPasscodeBlurView *v41;
  AFUIPasscodeBlurView *v42;
  AFUIPasscodeBlurView *v43;
  id WeakRetained;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a5;
  v13 = (void (**)(id, uint64_t))a6;
  if (!objc_opt_class()
    || ((mode = self->_mode, v15 = mode > 8, v16 = (1 << mode) & 0x191, !v15) ? (v17 = v16 == 0) : (v17 = 1), v17))
  {
    v26 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      -[AFUIPasscodeContainerView showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
      if (!v12)
      {
LABEL_13:
        if (v13)
          v13[2](v13, 1);
        goto LABEL_23;
      }
LABEL_12:
      v12[2](v12, 0);
      goto LABEL_13;
    }
LABEL_11:
    if (!v12)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (self->_lockView)
  {
    v18 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      -[AFUIPasscodeContainerView showPasscodeUnlockWithStatusText:subtitle:completionHandler:unlockCompletionHandler:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
      if (!v12)
        goto LABEL_13;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  self->_unlockAttemptCount = 0;
  v34 = (void *)MEMORY[0x219A0D984](v13);
  unlockCompletion = self->_unlockCompletion;
  self->_unlockCompletion = v34;

  -[objc_class lockView](self->_factoryClass, "lockView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDelegate:", self);
  objc_msgSend(v36, "setShowsEmergencyCallButton:", 0);
  objc_msgSend(v36, "setShowsStatusField:", 0);
  objc_msgSend(v36, "setUsesBiometricPresentation:", 1);
  objc_msgSend(v36, "setBiometricPresentationAncillaryButtonsVisible:", 1);
  objc_msgSend(v36, "setShowsProudLock:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCustomBackgroundColor:", v37);

  -[AFUIPasscodeContainerView _lockViewLegibilityProvider](self, "_lockViewLegibilityProvider");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBackgroundLegibilitySettingsProvider:", v38);
  -[AFUIPasscodeContainerView bounds](self, "bounds");
  objc_msgSend(v36, "setFrame:");
  objc_storeStrong((id *)&self->_lockView, v36);
  -[AFUIPasscodeContainerView addSubview:](self, "addSubview:", v36);
  objc_msgSend(v36, "setAutoresizingMask:", 18);
  objc_msgSend(v36, "becomeFirstResponder");
  v39 = self->_mode;
  if (v39 == 7 || !v39)
  {
    passcodeBlurView = self->_passcodeBlurView;
    if (!passcodeBlurView)
    {
      v41 = objc_alloc_init(AFUIPasscodeBlurView);
      v42 = self->_passcodeBlurView;
      self->_passcodeBlurView = v41;

      v43 = self->_passcodeBlurView;
      -[AFUIPasscodeContainerView bounds](self, "bounds");
      -[AFUIPasscodeBlurView setFrame:](v43, "setFrame:");
      -[AFUIPasscodeBlurView setAutoresizingMask:](self->_passcodeBlurView, "setAutoresizingMask:", 18);
      -[AFUIPasscodeBlurView setNeedsLayout](self->_passcodeBlurView, "setNeedsLayout");
      passcodeBlurView = self->_passcodeBlurView;
    }
    -[AFUIPasscodeContainerView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", passcodeBlurView, v36);
  }
  objc_msgSend(v36, "setShowsStatusField:", 1);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v36, "updateStatusText:subtitle:animated:", v10, v11, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeView:animateShowPasscodeWithCompletionHandler:", self, v12);

LABEL_23:
}

- (void)cleanupWithResult:(int64_t)a3
{
  void *v5;
  void (**v6)(id, int64_t);

  -[AFUIPasscodeContainerView unlockCompletion](self, "unlockCompletion");
  v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, a3);
  -[AFUIPasscodeContainerView lockView](self, "lockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[AFUIPasscodeContainerView setLockView:](self, "setLockView:", 0);
  -[AFUIPasscodeContainerView setUnlockCompletion:](self, "setUnlockCompletion:", 0);

}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  id *v9;
  unint64_t unlockAttemptCount;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  ++self->_unlockAttemptCount;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(WeakRetained, "passcodeView:attemptUnlockWithPassword:", self, v6);

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__AFUIPasscodeContainerView_passcodeLockViewPasscodeEntered___block_invoke;
    v13[3] = &unk_24D7A1BF8;
    v9 = &v14;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "passcodeView:hideLockViewWithResult:unlockCompletionHandler:", self, 0, v13);
LABEL_5:

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  unlockAttemptCount = self->_unlockAttemptCount;
  objc_msgSend(v4, "resetForFailedPasscode");
  if (unlockAttemptCount >= 3)
  {
    objc_initWeak(&location, self);
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__AFUIPasscodeContainerView_passcodeLockViewPasscodeEntered___block_invoke_2;
    v11[3] = &unk_24D7A1BF8;
    v9 = &v12;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v8, "passcodeView:hideLockViewWithResult:unlockCompletionHandler:", self, 1, v11);
    goto LABEL_5;
  }
LABEL_6:

}

void __61__AFUIPasscodeContainerView_passcodeLockViewPasscodeEntered___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupWithResult:", a2);

}

void __61__AFUIPasscodeContainerView_passcodeLockViewPasscodeEntered___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupWithResult:", a2);

}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__AFUIPasscodeContainerView_passcodeLockViewCancelButtonPressed___block_invoke;
  v6[3] = &unk_24D7A1BF8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(WeakRetained, "passcodeView:hideLockViewWithResult:unlockCompletionHandler:", self, 2, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __65__AFUIPasscodeContainerView_passcodeLockViewCancelButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupWithResult:", a2);

}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__AFUIPasscodeContainerView_passcodeLockViewPasscodeEnteredViaMesa___block_invoke;
  v6[3] = &unk_24D7A1BF8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(WeakRetained, "passcodeView:hideLockViewWithResult:unlockCompletionHandler:", self, 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __68__AFUIPasscodeContainerView_passcodeLockViewPasscodeEnteredViaMesa___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupWithResult:", a2);

}

+ (int64_t)maxUnlockAttempts
{
  return 3;
}

- (AFUIPasscodeContainerViewDelegate)delegate
{
  return (AFUIPasscodeContainerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIBackdropView)backdropView
{
  return (_UIBackdropView *)objc_loadWeakRetained((id *)&self->_backdropView);
}

- (void)setBackdropView:(id)a3
{
  objc_storeWeak((id *)&self->_backdropView, a3);
}

- (id)unlockCompletion
{
  return self->_unlockCompletion;
}

- (void)setUnlockCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (unint64_t)unlockAttemptCount
{
  return self->_unlockAttemptCount;
}

- (void)setUnlockAttemptCount:(unint64_t)a3
{
  self->_unlockAttemptCount = a3;
}

- (SBUIPasscodeLockView)lockView
{
  return self->_lockView;
}

- (void)setLockView:(id)a3
{
  objc_storeStrong((id *)&self->_lockView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong(&self->_unlockCompletion, 0);
  objc_destroyWeak((id *)&self->_backdropView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeBlurView, 0);
}

- (void)showPasscodeUnlockWithStatusText:(uint64_t)a3 subtitle:(uint64_t)a4 completionHandler:(uint64_t)a5 unlockCompletionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s Asking for unlock on unsupported platform", a5, a6, a7, a8, 2u);
}

- (void)showPasscodeUnlockWithStatusText:(uint64_t)a3 subtitle:(uint64_t)a4 completionHandler:(uint64_t)a5 unlockCompletionHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s Can't show more than one lock view at a time", a5, a6, a7, a8, 2u);
}

@end
