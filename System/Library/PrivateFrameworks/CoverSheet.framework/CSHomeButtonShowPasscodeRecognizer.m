@implementation CSHomeButtonShowPasscodeRecognizer

- (CSHomeButtonShowPasscodeRecognizer)initWithFingerOn:(BOOL)a3
{
  CSHomeButtonShowPasscodeRecognizer *v4;
  CSHomeButtonShowPasscodeRecognizer *v5;
  void *v6;
  uint64_t v7;
  NSString *simplePublicDescription;
  NSObject *v9;
  NSString *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CSHomeButtonShowPasscodeRecognizer;
  v4 = -[CSHomeButtonShowPasscodeRecognizer init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_fingerWasOnInitially = a3;
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "build");
    v7 = objc_claimAutoreleasedReturnValue();
    simplePublicDescription = v5->_simplePublicDescription;
    v5->_simplePublicDescription = (NSString *)v7;

    SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v5->_simplePublicDescription;
      NSStringFromBOOL();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D0337000, v9, OS_LOG_TYPE_INFO, "Initialized %{public}@ with finger on: %{public}@", buf, 0x16u);

    }
    -[CSHomeButtonShowPasscodeRecognizer _reallySetState:forReason:](v5, "_reallySetState:forReason:", 1, CFSTR("InitializedFromHomeButtonPress"));
  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *simplePublicDescription;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CSHomeButtonShowPasscodeRecognizer _invalidateMinimumTimer](self, "_invalidateMinimumTimer");
  SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    simplePublicDescription = self->_simplePublicDescription;
    *(_DWORD *)buf = 138543362;
    v7 = simplePublicDescription;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_INFO, "[%{public}@] dealloc", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)CSHomeButtonShowPasscodeRecognizer;
  -[CSHomeButtonShowPasscodeRecognizer dealloc](&v5, sel_dealloc);
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSString *simplePublicDescription;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSHomeButtonShowPasscodeRecognizer handleBiometricEvent:].cold.3(a3, v5);

  if (self->_state - 3 >= 2)
  {
    if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSBUIBiometricEvent();
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("BiometricEventRequiresPasscode: %@"), v7);
LABEL_7:
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSHomeButtonShowPasscodeRecognizer _reallySetState:forReason:](self, "_reallySetState:forReason:", 3, v8);

LABEL_8:
      return;
    }
    if (a3 - 9 <= 1)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSBUIBiometricEvent();
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("MatchFailure: %@"), v7);
      goto LABEL_7;
    }
    if (a3)
    {
      if (a3 == 1)
      {
        SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[CSHomeButtonShowPasscodeRecognizer handleBiometricEvent:].cold.1((uint64_t)self, v7, v10);
        goto LABEL_8;
      }
    }
    else
    {
      SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CSHomeButtonShowPasscodeRecognizer handleBiometricEvent:].cold.2((uint64_t)self, v11, v12);

      if (self->_fingerWasOnInitially)
      {
        self->_fingerHasLifted = 1;
        SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          simplePublicDescription = self->_simplePublicDescription;
          *(_DWORD *)buf = 138543362;
          v16 = simplePublicDescription;
          _os_log_impl(&dword_1D0337000, v13, OS_LOG_TYPE_INFO, "[%{public}@] initial finger down has lifted", buf, 0xCu);
        }

        if (self->_state == 2)
          -[CSHomeButtonShowPasscodeRecognizer _reallySetState:forReason:](self, "_reallySetState:forReason:", 3, CFSTR("Finger Off After Minimum Timer Has Passed"));
      }
    }
  }
}

- (void)noteAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;

  if (self->_state - 3 >= 2)
  {
    v3 = a3;
    SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CSHomeButtonShowPasscodeRecognizer noteAuthenticated:].cold.1((uint64_t)self, v3, v5);

    if (v3)
      -[CSHomeButtonShowPasscodeRecognizer _reallySetState:forReason:](self, "_reallySetState:forReason:", 4, CFSTR("Authenticated"));
  }
}

- (void)_reallySetState:(unint64_t)a3 forReason:(id)a4
{
  id v7;
  unint64_t state;
  NSObject *v10;
  NSString *simplePublicDescription;
  unint64_t v12;
  const __CFString *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  state = self->_state;
  if (state != a3 && state - 3 >= 2)
  {
    self->_state = a3;
    SBLogLockScreenMesaHomeButtonPasscodeRecognizer();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      simplePublicDescription = self->_simplePublicDescription;
      v12 = self->_state - 1;
      if (v12 > 3)
        v13 = CFSTR("Initial");
      else
        v13 = *(&off_1E8E30908 + v12);
      v14 = 138543874;
      v15 = simplePublicDescription;
      v16 = 2114;
      v17 = v13;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_INFO, "[%{public}@] changed to state: %{public}@ for reason: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    -[CSHomeButtonShowPasscodeRecognizer _switchedFromState:toState:](self, "_switchedFromState:toState:", state, self->_state);
    if (self->_state - 3 <= 1)
      objc_storeStrong((id *)&self->_terminalStateReasoning, a4);
  }

}

- (void)_switchedFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  id WeakRetained;
  BSAbsoluteMachTimer *v8;
  BSAbsoluteMachTimer *minimumTimer;
  BSAbsoluteMachTimer *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (a3 == 1)
    -[CSHomeButtonShowPasscodeRecognizer _invalidateMinimumTimer](self, "_invalidateMinimumTimer");
  switch(a4)
  {
    case 4uLL:
      objc_msgSend(WeakRetained, "homeButtonShowPasscodeRecognizerDidFailToRecognize:", self);
      break;
    case 3uLL:
      objc_msgSend(WeakRetained, "homeButtonShowPasscodeRecognizerRequestsPasscodeUIToBeShown:", self);
      break;
    case 1uLL:
      objc_initWeak(&location, self);
      v8 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("CSHomeButtonShowPasscodeRecognizer.minimumTimer"));
      minimumTimer = self->_minimumTimer;
      self->_minimumTimer = v8;

      v10 = self->_minimumTimer;
      v11 = MEMORY[0x1E0C80D38];
      v12 = MEMORY[0x1E0C80D38];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__CSHomeButtonShowPasscodeRecognizer__switchedFromState_toState___block_invoke;
      v13[3] = &unk_1E8E2DD30;
      objc_copyWeak(&v14, &location);
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v10, "scheduleWithFireInterval:leewayInterval:queue:handler:", v11, v13, 0.15, 0.0);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      break;
  }

}

void __65__CSHomeButtonShowPasscodeRecognizer__switchedFromState_toState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_minimumTimerFired");

}

- (NSString)description
{
  return (NSString *)-[CSHomeButtonShowPasscodeRecognizer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSHomeButtonShowPasscodeRecognizer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSHomeButtonShowPasscodeRecognizer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  -[CSHomeButtonShowPasscodeRecognizer succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = self->_state - 1;
  if (v6 > 3)
    v7 = CFSTR("Initial");
  else
    v7 = *(&off_1E8E30908 + v6);
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("state"));
  v8 = (id)objc_msgSend(v5, "appendBool:withName:", self->_minimumTimer != 0, CFSTR("minimumTimerActive"));
  v9 = (id)objc_msgSend(v5, "appendBool:withName:", self->_fingerWasOnInitially, CFSTR("initialFingerOn?"));
  v10 = (id)objc_msgSend(v5, "appendBool:withName:", self->_fingerHasLifted, CFSTR("initialFingerOnHasLifted?"));
  if (self->_state - 3 <= 1)
    v11 = (id)objc_msgSend(v5, "appendObject:withName:", self->_terminalStateReasoning, CFSTR("finalStateReason"));
  return v5;
}

- (unint64_t)_state
{
  return self->_state;
}

- (void)_invalidateMinimumTimer
{
  BSAbsoluteMachTimer *minimumTimer;

  -[BSAbsoluteMachTimer invalidate](self->_minimumTimer, "invalidate");
  minimumTimer = self->_minimumTimer;
  self->_minimumTimer = 0;

}

- (void)_minimumTimerFired
{
  const __CFString *v3;
  CSHomeButtonShowPasscodeRecognizer *v4;
  uint64_t v5;

  -[CSHomeButtonShowPasscodeRecognizer _invalidateMinimumTimer](self, "_invalidateMinimumTimer");
  if (self->_state == 1)
  {
    if (self->_fingerWasOnInitially)
    {
      if (!self->_fingerHasLifted)
      {
        v3 = CFSTR("MinimumTimeToShowPasscodePassed - finger on initially but hasn't yet lifted");
        v4 = self;
        v5 = 2;
        goto LABEL_9;
      }
      v3 = CFSTR("MinimumTimerExpired - was on initially and lifted during the minimum timer.");
    }
    else
    {
      v3 = CFSTR("MinimumTimerExpired - finger was not on at the time the home button press recognized");
    }
    v4 = self;
    v5 = 3;
LABEL_9:
    -[CSHomeButtonShowPasscodeRecognizer _reallySetState:forReason:](v4, "_reallySetState:forReason:", v5, v3);
  }
}

- (SBHomeButtonShowPasscodeRecognizerDelegate)delegate
{
  return (SBHomeButtonShowPasscodeRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalStateReasoning, 0);
  objc_storeStrong((id *)&self->_minimumTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_simplePublicDescription, 0);
}

- (void)handleBiometricEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, a2, a3, "[%{public}@] fingerOn", (uint8_t *)&v4);
}

- (void)handleBiometricEvent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, a2, a3, "[%{public}@] fingerOff", (uint8_t *)&v4);
}

- (void)handleBiometricEvent:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSBUIBiometricEvent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1_0(&dword_1D0337000, a2, v4, "Received biometric event: %{public}@", (uint8_t *)&v5);

}

- (void)noteAuthenticated:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 8);
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1D0337000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] authenticated: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
