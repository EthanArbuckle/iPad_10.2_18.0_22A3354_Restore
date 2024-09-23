@implementation BLSHBacklightDisplayStateMachine

- (BLSHBacklightDisplayStateMachine)initWithDelegate:(id)a3 platformProvider:(id)a4 osInterfaceProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHBacklightDisplayStateMachine *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)BLSHBacklightDisplayStateMachine;
  v11 = -[BLSHBacklightDisplayStateMachine init](&v29, sel_init);
  v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = -[BLSHBacklightDisplayStateMachine displayModeForOSInterfaceProvider:]((uint64_t)v11, v10);
    *(_QWORD *)(v12 + 96) = v13;
    *(_QWORD *)(v12 + 104) = v13;
    *(_DWORD *)(v12 + 48) = 0;
    *(_QWORD *)(v12 + 56) = v13;
    *(_QWORD *)(v12 + 64) = 0;
    *(_QWORD *)(v12 + 72) = 0;
    *(_QWORD *)(v12 + 80) = 0;
    *(_QWORD *)(v12 + 88) = 2;
    objc_msgSend(v10, "setDisplayStateDelegate:", v12);
    v14 = objc_msgSend(v10, "cbDisplayMode");
    *(_QWORD *)(v12 + 120) = 0;
    *(_QWORD *)(v12 + 128) = v14;
    *(_OWORD *)(v12 + 136) = 0u;
    *(_OWORD *)(v12 + 152) = 0u;
    *(_QWORD *)(v12 + 168) = 0;
    *(_OWORD *)(v12 + 176) = xmmword_21462C480;
    *(_QWORD *)(v12 + 112) = v14;
    v15 = objc_msgSend(v10, "cbFlipbookState");
    v16 = mach_continuous_time();
    *(_DWORD *)(v12 + 192) = 0;
    *(_QWORD *)(v12 + 200) = v15;
    *(_QWORD *)(v12 + 208) = 2;
    *(_QWORD *)(v12 + 216) = v16;
    *(_QWORD *)(v12 + 224) = v15;
    objc_storeStrong((id *)(v12 + 24), a5);
    objc_storeWeak((id *)(v12 + 312), v8);
    objc_initWeak(&location, (id)v12);
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __90__BLSHBacklightDisplayStateMachine_initWithDelegate_platformProvider_osInterfaceProvider___block_invoke;
    v26 = &unk_24D1BC578;
    objc_copyWeak(&v27, &location);
    *(_QWORD *)(v12 + 304) = os_state_add_handler();
    if ((IsOffForBLSBacklightDisplayMode(v13) & 1) == 0)
    {
      objc_msgSend(*(id *)(v12 + 24), "acquireDisplayPowerAssertionForReason:", 0, v23, 3221225472, __90__BLSHBacklightDisplayStateMachine_initWithDelegate_platformProvider_osInterfaceProvider___block_invoke, &unk_24D1BC578);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(v12 + 272);
      *(_QWORD *)(v12 + 272) = v17;

    }
    if (!IsBlankedForBLSBacklightDisplayMode(v13))
      -[BLSHBacklightDisplayStateMachine acquireLiveRenderingSystemActivityAssertion](v12);
    if ((unint64_t)(v13 - 2) > 4)
      v19 = 100;
    else
      v19 = qword_21462C4A0[v13 - 2];
    objc_msgSend(v10, "createDisplayPowerResourceHintWithState:", v19, v23, v24, v25, v26);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v20;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return (BLSHBacklightDisplayStateMachine *)v12;
}

- (uint64_t)displayModeForOSInterfaceProvider:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "caDisplayState");
    v6 = objc_msgSend(v4, "cbDisplayMode");
    if (v5 == 3)
    {
      a1 = 1;
    }
    else
    {
      a1 = v6;
      if (v6)
      {
        if (v5 == 2)
        {
          a1 = 2;
        }
        else if (v5 == 1)
        {
          v7 = objc_msgSend(v4, "isShowingBlankingWindow");
          v8 = 3;
          if (a1 != 1)
            v8 = 4;
          if (a1 == 4)
            v8 = 6;
          if ((v7 & 1) != 0)
            a1 = 5;
          else
            a1 = v8;
        }
        else
        {
          a1 = 0;
        }
      }
    }
  }

  return a1;
}

uint64_t __90__BLSHBacklightDisplayStateMachine_initWithDelegate_platformProvider_osInterfaceProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)acquireLiveRenderingSystemActivityAssertion
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "DSM:%p already have live rendering system activity assertion %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stateHandler)
    os_state_remove_handler();
  -[BLSHSystemActivityAsserting invalidate](self->_lock_liveRenderingSystemActivityAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightDisplayStateMachine;
  -[BLSHBacklightDisplayStateMachine dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  unint64_t displayMode;
  void *v7;
  id v8;
  id v9;
  unint64_t lock_prewarmingDisplayMode;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = -[BLSHBacklightOSInterfaceProviding isShowingBlankingWindow](self->_osInterface, "isShowingBlankingWindow");
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  displayMode = self->_lock_displayRampOperation.displayMode;
  NSStringFromBLSBacklightDisplayMode(displayMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("displayMode"));

  v8 = (id)objc_msgSend(v5, "appendBool:withName:", self->_lock_displayRampOperation.phase != 2, CFSTR("transitioning"));
  v9 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", self->_lock_caDisplayStateChangeOperation.phase == 1, CFSTR("updatingCA"), 1);
  lock_prewarmingDisplayMode = self->_lock_prewarmingDisplayMode;
  if (self->_lock_isPrewarmingDisplayMode)
  {
    NSStringFromBLSBacklightDisplayMode(lock_prewarmingDisplayMode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("prewarmingDisplayMode");
  }
  else
  {
    if (displayMode != lock_prewarmingDisplayMode)
      goto LABEL_6;
    NSStringFromBLSBacklightDisplayMode(displayMode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("prewarmedDisplayMode");
  }
  objc_msgSend(v5, "appendString:withName:", v11, v12);

LABEL_6:
  if (self->_lock_displayRampOperation.phase != 2)
  {
    NSStringFromBLSBacklightDisplayMode(self->_lock_lastSteadyStateDisplayMode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:withName:", v13, CFSTR("lastSteadyStateMode"));

    if (self->_lock_cbDisplayModeTransitionOperation.phase == 2)
    {
      if (self->_lock_cbDisplayModeTransitionOperation.shouldWait)
        v14 = CFSTR("completedWaitForCBDisplayMode");
      else
        v14 = CFSTR("completedCBDisplayMode");
      v15 = (id)objc_msgSend(v5, "appendInteger:withName:", self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode, v14);
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (self->_lock_cbDisplayModeTransitionOperation.phase != 2)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u->%u"), self->_lock_completedCBDisplayMode, self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_lock_cbDisplayModeTransitionOperation.shouldWait)
      v17 = CFSTR("waitingForCBDisplayMode");
    else
      v17 = CFSTR("pendingCBDisplayMode");
    objc_msgSend(v5, "appendString:withName:", v16, v17);

  }
LABEL_18:
  if (self->_lock_cbFlipbookStateChangeOperation.phase != 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u->%u"), self->_lock_completedCBFlipbookState, self->_lock_cbFlipbookStateChangeOperation.cbFlipbookState);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:withName:", v18, CFSTR("pendingCBFlipbookState"));

  }
  v19 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", self->_lock_liveRenderingSystemActivityAssertion, CFSTR("liveAssertion"), 1);
  os_unfair_lock_unlock(p_lock);
  -[BLSHBacklightOSInterfaceProviding caDisplayState](self->_osInterface, "caDisplayState");
  NSStringFromCADisplayState();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v5, "appendObject:withName:", v20, CFSTR("caDisplayState"));

  NSStringFromCBDisplayMode_bls(-[BLSHBacklightOSInterfaceProviding cbDisplayMode](self->_osInterface, "cbDisplayMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v5, "appendObject:withName:", v22, CFSTR("cbDisplayMode"));

  v24 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", v4, CFSTR("showingBlankingWindow"), 1);
  v25 = (id)objc_msgSend(v5, "appendInteger:withName:", -[BLSHBacklightOSInterfaceProviding cbFlipbookState](self->_osInterface, "cbFlipbookState"), CFSTR("cbFlipbookState"));
  objc_msgSend(v5, "build");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (int64_t)displayMode
{
  os_unfair_lock_s *p_lock;
  int64_t displayMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  displayMode = self->_lock_displayRampOperation.displayMode;
  os_unfair_lock_unlock(p_lock);
  return displayMode;
}

- (int64_t)lastSteadyStateDisplayMode
{
  os_unfair_lock_s *p_lock;
  int64_t lock_lastSteadyStateDisplayMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSteadyStateDisplayMode = self->_lock_lastSteadyStateDisplayMode;
  os_unfair_lock_unlock(p_lock);
  return lock_lastSteadyStateDisplayMode;
}

- (BOOL)isTransitioningDisplayMode
{
  BLSHBacklightDisplayStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_displayRampOperation.phase == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isHighLuminanceAlwaysOn
{
  BLSHBacklightDisplayStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_highLuminanceAlwaysOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHighLuminanceAlwaysOn:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_highLuminanceAlwaysOn == v3)
  {
    self->_lock_highLuminanceAlwaysOn = v3;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = IsAlwaysOnBrightnessForBLSBacklightDisplayMode(self->_lock_displayRampOperation.displayMode);
    self->_lock_highLuminanceAlwaysOn = v3;
    os_unfair_lock_unlock(p_lock);
    if (v6)
      BSDispatchMain();
  }
}

void __61__BLSHBacklightDisplayStateMachine_setHighLuminanceAlwaysOn___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (void)onMain_performNextStepInModeTransition
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)acquireDisplayPowerAssertionForReason:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 24), "acquireDisplayPowerAssertionForReason:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 272);
    *(_QWORD *)(a1 + 272) = v5;

    os_unfair_lock_unlock(v4);
  }
}

- (void)releaseDisplayPowerAssertion
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 272), "invalidate");
    v3 = *(void **)(a1 + 272);
    *(_QWORD *)(a1 + 272) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void)prewarmForDisplayMode:(int64_t)a3
{
  uint64_t v5;
  int lock_isPrewarmingDisplayMode;
  const char *v7;
  unint64_t displayMode;
  unsigned int v9;
  unsigned int v10;
  int64_t phase;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  unsigned int v25;
  void *v26;
  char v27;
  unint64_t lock_prewarmingDisplayMode;
  unsigned int v29;
  BLSCADisplayPowerAssertion *lock_caDisplayPowerAssertion;
  uint8_t buf[4];
  BLSHBacklightDisplayStateMachine *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 3) <= 3)
    -[BLSDisplayPowerResourceHint updateState:](self->_powerResourceHint, "updateState:", 101);
  v5 = -[BLSHBacklightOSInterfaceProviding cbDisplayMode](self->_osInterface, "cbDisplayMode");
  os_unfair_lock_lock(&self->_lock);
  lock_isPrewarmingDisplayMode = self->_lock_isPrewarmingDisplayMode;
  lock_prewarmingDisplayMode = self->_lock_prewarmingDisplayMode;
  LODWORD(v7) = IsOffForBLSBacklightDisplayMode(a3);
  displayMode = self->_lock_displayRampOperation.displayMode;
  if (displayMode == a3)
    v9 = 0;
  else
    v9 = v7 ^ 1;
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v10 = 0;
  else
    v10 = v9;
  phase = self->_lock_cbFlipbookStateChangeOperation.phase;
  lock_caDisplayPowerAssertion = self->_lock_caDisplayPowerAssertion;
  self->_lock_prewarmingDisplayMode = a3;
  v29 = v10;
  if (displayMode != a3)
    lock_isPrewarmingDisplayMode = 0;
  self->_lock_isPrewarmingDisplayMode = displayMode != a3;
  if (displayMode != a3)
    self->_lock_prewarmingDisplayMode_startTimestamp = mach_continuous_time();
  os_unfair_lock_unlock(&self->_lock);
  bls_backlight_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (lock_isPrewarmingDisplayMode)
    v14 = OS_LOG_TYPE_INFO;
  else
    v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v12, v14))
  {
    NSStringFromBLSBacklightDisplayMode(displayMode);
    v25 = v7 ^ 1;
    v15 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v15;
    NSStringFromBLSBacklightDisplayMode(a3);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = phase;
    v18 = (void *)v16;
    v27 = (char)v7;
    if (v17 == 1)
      v7 = " (interrupting ramp)";
    else
      v7 = "";
    NSStringFromBLSBacklightDisplayMode(lock_prewarmingDisplayMode);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v5;
    v21 = (void *)v19;
    NSStringFromCBDisplayMode_bls(v20);
    *(_DWORD *)buf = 134220546;
    v32 = self;
    v33 = 2114;
    v34 = v15;
    v35 = 2114;
    v36 = v18;
    v37 = 2080;
    v38 = v7;
    v39 = 2114;
    v40 = v21;
    v41 = 1024;
    v42 = lock_caDisplayPowerAssertion != 0;
    v43 = 1024;
    v44 = v25;
    v45 = 1024;
    LOBYTE(v7) = v27;
    v46 = displayMode != a3;
    v47 = 1024;
    v48 = v29;
    v49 = 1024;
    v50 = lock_isPrewarmingDisplayMode;
    v51 = 2114;
    v52 = objc_claimAutoreleasedReturnValue();
    v22 = lock_isPrewarmingDisplayMode;
    v23 = (void *)v52;
    _os_log_impl(&dword_2145AC000, v13, v14, "DSM:%p prewarmForDisplayMode:%{public}@->%{public}@%s previousPrewarm:%{public}@ hasAssertion:%{BOOL}u isPrewarmOn:%{BOOL}u requiresModeChange:%{BOOL}u shouldSignalPowerOn:%{BOOL}u shouldCleanup:%{BOOL}u cbDisplayMode:%{public}@", buf, 0x5Cu);

    lock_isPrewarmingDisplayMode = v22;
  }

  if ((v7 & 1) != 0)
  {
    if (lock_caDisplayPowerAssertion)
      v24 = 1;
    else
      v24 = lock_isPrewarmingDisplayMode;
    lock_isPrewarmingDisplayMode = (displayMode == a3) & v24;
  }
  else if (!lock_caDisplayPowerAssertion)
  {
    -[BLSHBacklightDisplayStateMachine acquireDisplayPowerAssertionForReason:]((uint64_t)self, 1);
  }
  if (!IsBlankedForBLSBacklightDisplayMode(a3))
    -[BLSHBacklightDisplayStateMachine acquireLiveRenderingSystemActivityAssertion]((uint64_t)self);
  if (displayMode != a3)
    -[BLSHBacklightDisplayStateMachine replaceCurrentWatchdog]((uint64_t)self);
  if (lock_isPrewarmingDisplayMode)
    BSDispatchMain();
}

- (void)replaceCurrentWatchdog
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  double v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v3 = *(void **)(a1 + 8);
    if (v3)
    {
      objc_msgSend(v3, "explanation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      bls_diagnostics_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 134218242;
        v9 = 20.0 + 2.0;
        v10 = 2114;
        v11 = v4;
        _os_log_impl(&dword_2145AC000, v5, OS_LOG_TYPE_INFO, "replacing existing watchdog with new watchdog for %.1fs: %{public}@", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 8), "invalidate:", 1);
      objc_msgSend(*(id *)(a1 + 24), "scheduleWatchdogWithDelegate:explanation:timeout:", a1, v4, 20.0 + 2.0 + 2.0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v6;

    }
    os_unfair_lock_unlock(v2);
  }
}

void __58__BLSHBacklightDisplayStateMachine_prewarmForDisplayMode___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (void)setDisplayMode:(int64_t)a3 withRampDuration:(double)a4
{
  uint64_t v7;
  int64_t phase;
  uint64_t sequenceNumber;
  unint64_t displayMode;
  double startSeconds;
  double duration;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  id v22;
  __CFString *v23;
  int64_t v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BLSHWatchdogInvalidatable *v34;
  BLSHWatchdogInvalidatable *watchdogTimer;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint8_t buf[4];
  BLSHBacklightDisplayStateMachine *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  int v53;
  __int16 v54;
  id v55;
  __int16 v56;
  __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 3) <= 3)
    -[BLSDisplayPowerResourceHint updateState:](self->_powerResourceHint, "updateState:", 101);
  os_unfair_lock_lock(&self->_lock);
  v7 = (self->_lock_sequenceNumber + 1);
  self->_lock_sequenceNumber = v7;
  phase = self->_lock_displayRampOperation.phase;
  sequenceNumber = self->_lock_displayRampOperation.sequenceNumber;
  displayMode = self->_lock_displayRampOperation.displayMode;
  duration = self->_lock_displayRampOperation.duration;
  startSeconds = self->_lock_displayRampOperation.startSeconds;
  v13 = 0x24BDD1000;
  if (phase == 2)
  {
    bls_backlight_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromBLSBacklightDisplayMode(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v41 = self;
      v42 = 2114;
      v43 = v15;
      v44 = 2048;
      v45 = a4;
      v46 = 1024;
      v47 = v7;
      _os_log_impl(&dword_2145AC000, v14, OS_LOG_TYPE_INFO, "DSM:%p setDisplayMode:%{public}@ duration:%lf seqId:%d", buf, 0x26u);

    }
  }
  else
  {
    v16 = 0.0;
    if (self->_lock_cbDisplayModeTransitionOperation.phase == 1)
    {
      -[BLSHBacklightOSInterfaceProviding now](self->_osInterface, "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v16 = v18 - self->_lock_cbDisplayModeTransitionOperation.startSeconds;

    }
    bls_backlight_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v14 = v19;
    if (v16 <= 3.0)
      v20 = OS_LOG_TYPE_INFO;
    else
      v20 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v19, v20))
    {
      v39 = sequenceNumber;
      NSStringFromBLSBacklightDisplayMode(a3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = displayMode;
      NSStringFromBLSBacklightDisplayMode(displayMode);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", startSeconds);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bls_shortLoggingString");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v16 <= 3.0)
      {
        v23 = &stru_24D1BE888;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" cbOperationIsOverdue! %lfs sinceCBOperationStart"), *(_QWORD *)&v16);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 134220034;
      v41 = self;
      v42 = 2114;
      v43 = v38;
      v44 = 2048;
      v45 = a4;
      v46 = 1024;
      v47 = v7;
      v48 = 2114;
      v49 = v37;
      v50 = 2048;
      v51 = duration;
      v52 = 1024;
      v53 = v39;
      v54 = 2114;
      v55 = v22;
      v56 = 2114;
      v57 = v23;
      _os_log_impl(&dword_2145AC000, v14, v20, "DSM:%p setDisplayMode:%{public}@ duration:%lf seqId:%d interrupting previous setDisplayMode:%{public}@ duration:%lf seqId:%d with started at:%{public}@%{public}@", buf, 0x54u);
      if (v16 > 3.0)

      sequenceNumber = v39;
      displayMode = v36;
    }
    v13 = 0x24BDD1000uLL;
  }

  v24 = self->_lock_displayRampOperation.displayMode;
  -[BLSHBacklightOSInterfaceProviding now](self->_osInterface, "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeIntervalSinceReferenceDate");
  self->_lock_displayRampOperation.sequenceNumber = v7;
  self->_lock_displayRampOperation.displayMode = a3;
  self->_lock_displayRampOperation.previousDisplayMode = v24;
  self->_lock_displayRampOperation.duration = a4;
  self->_lock_displayRampOperation.startSeconds = v26;
  self->_lock_displayRampOperation.phase = 1;

  self->_lock_isPrewarmingDisplayMode = 0;
  -[BLSHWatchdogInvalidatable invalidate:](self->_watchdogTimer, "invalidate:", 1);
  v27 = *(void **)(v13 + 1992);
  NSStringFromBLSBacklightDisplayMode(a3);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (phase == 2)
  {
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%p transition to displayMode:%@ duration:%lf seqId:%d"), self, v28, *(_QWORD *)&a4, v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromBLSBacklightDisplayMode(displayMode);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", startSeconds);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bls_shortLoggingString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("DSM:%p transition to displayMode:%@ duration:%lf seqId:%d interrupting previous setDisplayMode:%@ duration:%lf seqId:%d with started at:%@"), self, v29, *(_QWORD *)&a4, v7, v31, *(_QWORD *)&duration, sequenceNumber, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[BLSHBacklightOSInterfaceProviding scheduleWatchdogWithDelegate:explanation:timeout:](self->_osInterface, "scheduleWatchdogWithDelegate:explanation:timeout:", self, v30, 18.0);
  v34 = (BLSHWatchdogInvalidatable *)objc_claimAutoreleasedReturnValue();
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = v34;

  os_unfair_lock_unlock(&self->_lock);
  if (!IsBlankedForBLSBacklightDisplayMode(a3))
    -[BLSHBacklightDisplayStateMachine acquireLiveRenderingSystemActivityAssertion]((uint64_t)self);
  BSDispatchMain();

}

void __68__BLSHBacklightDisplayStateMachine_setDisplayMode_withRampDuration___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (void)resumeDisplayMode:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t displayMode;
  _BOOL4 lock_isPrewarmingDisplayMode;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  BLSHBacklightDisplayStateMachine *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  displayMode = self->_lock_displayRampOperation.displayMode;
  lock_isPrewarmingDisplayMode = self->_lock_isPrewarmingDisplayMode;
  self->_lock_isPrewarmingDisplayMode = 0;
  if (displayMode == a3)
  {
    if (!lock_isPrewarmingDisplayMode)
    {
      os_unfair_lock_unlock(p_lock);
      return;
    }
    bls_backlight_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromBLSBacklightDisplayMode(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v14 = self;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_INFO, "DSM:%p resumed transition to display mode:%{public}@", buf, 0x16u);

    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_9;
  }
  bls_backlight_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    NSStringFromBLSBacklightDisplayMode(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightDisplayMode(displayMode);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v14 = self;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_fault_impl(&dword_2145AC000, v10, OS_LOG_TYPE_FAULT, "DSM:%p resumed display mode:%{public}@ did not match current target:%{public}@", buf, 0x20u);

  }
  os_unfair_lock_unlock(p_lock);
  if (lock_isPrewarmingDisplayMode)
LABEL_9:
    BSDispatchMain();
}

void __54__BLSHBacklightDisplayStateMachine_resumeDisplayMode___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

uint64_t __79__BLSHBacklightDisplayStateMachine_acquireLiveRenderingSystemActivityAssertion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 0);
}

void __79__BLSHBacklightDisplayStateMachine_acquireLiveRenderingSystemActivityAssertion__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  bls_backlight_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    if (objc_msgSend(v8, "afterPendingSleepWasAlreadyInitiated"))
      v10 = OS_LOG_TYPE_DEFAULT;
    else
      v10 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    v10 = OS_LOG_TYPE_FAULT;
  }
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(a1 + 32);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v13 = v12;
    objc_msgSend(v7, "bls_loggingString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218754;
    v16 = v11;
    v17 = 2048;
    v18 = v13;
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_2145AC000, v9, v10, "DSM:%p live rendering system activity assertion callback elapsed:%.4lfs details:%{public}@ error:%{public}@", (uint8_t *)&v15, 0x2Au);

  }
}

- (void)releaseLiveRenderingSystemActivityAssertion
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "DSM:%p dropping live rendering system activity assertion %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (os_unfair_lock_s)switchToFlipbookState:(os_unfair_lock_s *)result
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;

  if (result)
  {
    v3 = (uint64_t)result;
    v4 = result + 4;
    os_unfair_lock_lock(result + 4);
    if (*(_QWORD *)(v3 + 208) != 2)
    {
      bls_backlight_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BLSHBacklightDisplayStateMachine switchToFlipbookState:].cold.1(v3, a2, v5);

    }
    v6 = *(_DWORD *)(v3 + 40) + 1;
    *(_DWORD *)(v3 + 40) = v6;
    v7 = mach_continuous_time();
    *(_DWORD *)(v3 + 192) = v6;
    *(_QWORD *)(v3 + 200) = a2;
    *(_QWORD *)(v3 + 208) = 1;
    *(_QWORD *)(v3 + 216) = v7;
    os_unfair_lock_unlock(v4);
    kdebug_trace();
    return (os_unfair_lock_s *)objc_msgSend(*(id *)(v3 + 24), "switchToFlipbookState:", a2);
  }
  return result;
}

- (void)transitionToDisplayMode:(int)a3 withDuration:(double)a4 shouldWaitForCompletion:
{
  os_unfair_lock_s *v8;
  void *v9;
  double v10;
  double v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 24), "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;

    v12 = *(_QWORD *)(a1 + 128);
    if (*(_QWORD *)(a1 + 176) == 2)
    {
      bls_backlight_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromCBDisplayMode_bls(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v38 = a1;
        v39 = 2114;
        v40 = v14;
        v41 = 2048;
        v42 = a4;
        v43 = 2048;
        v44 = a4;
        v45 = 1024;
        LODWORD(v46) = a3;
        _os_log_debug_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEBUG, "DSM:%p ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs shouldWaitForCompletion:%{BOOL}u", buf, 0x30u);
LABEL_35:

      }
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 136);
      v16 = v15 == a2 || !a2 && v15 == 2 || a2 == 2 && v15 == 0;
      v18 = *(double *)(a1 + 152);
      if (v16 && v18 > 0.0)
      {
        v19 = v11 - *(double *)(a1 + 168);
        v20 = 1.0;
        v21 = v19 / v18 >= 1.0;
        v22 = v19 / v18 > 0.0 || v19 / v18 >= 1.0;
        if (v19 / v18 <= 0.0)
          v21 = 1;
        if (!v22)
          v20 = 0.0;
        if (v21)
          v23 = v20;
        else
          v23 = v19 / v18;
        v24 = v23 * a4;
        v25 = v11 - (a4 - v23 * a4);
        bls_backlight_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromCBDisplayMode_bls(v12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = *(double *)(a1 + 144);
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 160));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "bls_shortLoggingString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromCBDisplayMode_bls(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134220546;
          v38 = a1;
          v39 = 2114;
          v40 = v26;
          v41 = 2048;
          v42 = v34;
          v43 = 2048;
          v44 = v18;
          v45 = 2114;
          v46 = v28;
          v47 = 2048;
          v48 = v19;
          v49 = 2048;
          v50 = v23;
          v51 = 2114;
          v52 = v29;
          v53 = 2048;
          v54 = v23 * a4;
          v55 = 2048;
          v56 = a4;
          v57 = 1024;
          v58 = a3;
          _os_log_debug_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEBUG, "DSM:%p reversing pending ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs started at %{public}@ (%fs elapsed — %f%%) with ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs shouldWaitForCompletion:%{BOOL}u", buf, 0x6Cu);

        }
        goto LABEL_31;
      }
      bls_backlight_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromCBDisplayMode_bls(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(double *)(a1 + 144);
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 160));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bls_shortLoggingString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCBDisplayMode_bls(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219778;
        v38 = a1;
        v39 = 2114;
        v40 = v14;
        v41 = 2048;
        v42 = v35;
        v43 = 2048;
        v44 = v18;
        v45 = 2114;
        v46 = v32;
        v47 = 2114;
        v48 = *(double *)&v33;
        v49 = 2048;
        v50 = a4;
        v51 = 1024;
        LODWORD(v52) = a3;
        _os_log_debug_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEBUG, "DSM:%p replacing pending ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs started at %{public}@ with ramp to displayMode:%{public}@ withDuration:%fs shouldWaitForCompletion:%{BOOL}u", buf, 0x4Eu);

        goto LABEL_35;
      }
    }
    v25 = v11;
    v24 = a4;
LABEL_31:

    v30 = *(_DWORD *)(a1 + 40) + 1;
    *(_DWORD *)(a1 + 40) = v30;
    *(_DWORD *)(a1 + 120) = v30;
    *(_QWORD *)(a1 + 128) = a2;
    *(_QWORD *)(a1 + 136) = v12;
    *(double *)(a1 + 144) = v24;
    *(double *)(a1 + 152) = a4;
    *(double *)(a1 + 160) = v11;
    *(double *)(a1 + 168) = v25;
    *(_QWORD *)(a1 + 176) = 1;
    *(_BYTE *)(a1 + 184) = a3;
    os_unfair_lock_unlock(v8);
    objc_msgSend(*(id *)(a1 + 24), "transitionToDisplayMode:withDuration:", a2, v24);
    if ((a3 & 1) == 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __97__BLSHBacklightDisplayStateMachine_transitionToDisplayMode_withDuration_shouldWaitForCompletion___block_invoke;
      block[3] = &unk_24D1BC268;
      block[4] = a1;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

- (os_unfair_lock_s)transitionToCADisplayState:(os_unfair_lock_s *)result
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;

  if (result)
  {
    v3 = (uint64_t)result;
    v4 = result + 4;
    os_unfair_lock_lock(result + 4);
    if (*(_QWORD *)(v3 + 248) != 2)
    {
      bls_backlight_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightDisplayStateMachine transitionToCADisplayState:].cold.1(v3, a2, v5);

    }
    v6 = *(_DWORD *)(v3 + 40) + 1;
    *(_DWORD *)(v3 + 40) = v6;
    v7 = mach_continuous_time();
    *(_DWORD *)(v3 + 232) = v6;
    *(_QWORD *)(v3 + 240) = a2;
    *(_QWORD *)(v3 + 248) = 1;
    *(_QWORD *)(v3 + 256) = v7;
    os_unfair_lock_unlock(v4);
    kdebug_trace();
    return (os_unfair_lock_s *)objc_msgSend(*(id *)(v3 + 24), "transitionToCADisplayState:", a2);
  }
  return result;
}

uint64_t __97__BLSHBacklightDisplayStateMachine_transitionToDisplayMode_withDuration_shouldWaitForCompletion___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (void)osInterfaceProvider:(id)a3 didCompleteTransitionToCBDisplayMode:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int64_t phase;
  void *v17;
  void *v18;
  uint8_t buf[4];
  BLSHBacklightDisplayStateMachine *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    bls_backlight_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromCBDisplayMode_bls(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bls_loggingString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = self;
      v21 = 2114;
      v22 = v17;
      v23 = 2114;
      v24 = v18;
      _os_log_fault_impl(&dword_2145AC000, v10, OS_LOG_TYPE_FAULT, "DSM:%p core brightness failed to switch to display mode:%{public}@ error:%{public}@", buf, 0x20u);

    }
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_completedCBDisplayMode = a4;
  if (self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode != a4)
  {
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromCBDisplayMode_bls(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCBDisplayMode_bls(self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      phase = self->_lock_cbDisplayModeTransitionOperation.phase;
      *(_DWORD *)buf = 134218754;
      v20 = self;
      v21 = 2114;
      v22 = v14;
      v23 = 2114;
      v24 = v15;
      v25 = 1024;
      v26 = phase;
      _os_log_impl(&dword_2145AC000, v13, OS_LOG_TYPE_INFO, "DSM:%p core brightness completed switch to wrong display mode:%{public}@, waiting for display mode:%{public}@ phase:%u", buf, 0x26u);

LABEL_15:
    }
LABEL_18:

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_19;
  }
  v11 = self->_lock_cbDisplayModeTransitionOperation.phase;
  if (v11 == 2)
  {
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromCBDisplayMode_bls(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v20 = self;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_2145AC000, v13, OS_LOG_TYPE_INFO, "DSM:%p (likely initialization) core brightness completed switch to display mode:%{public}@", buf, 0x16u);
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (v11 != 1)
  {
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BLSHBacklightDisplayStateMachine osInterfaceProvider:didCompleteTransitionToCBDisplayMode:withError:].cold.1((uint64_t)self, a4, v13);
    goto LABEL_18;
  }
  bls_backlight_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightDisplayStateMachine osInterfaceProvider:didCompleteTransitionToCBDisplayMode:withError:].cold.2((uint64_t)self, a4, v12);

  self->_lock_cbDisplayModeTransitionOperation.phase = 2;
  os_unfair_lock_unlock(&self->_lock);
  BSDispatchMain();
LABEL_19:

}

void __103__BLSHBacklightDisplayStateMachine_osInterfaceProvider_didCompleteTransitionToCBDisplayMode_withError___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (void)osInterfaceProvider:(id)a3 didCompleteSwitchToCBFlipbookState:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  BLSHBacklightDisplayStateMachine *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    bls_backlight_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromCBFlipbookState_bls(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bls_loggingString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v18 = self;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_fault_impl(&dword_2145AC000, v10, OS_LOG_TYPE_FAULT, "DSM:%p core brightness failed to switch to flipbook state:%{public}@ error:%{public}@", buf, 0x20u);

    }
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_completedCBFlipbookState = a4;
  if (self->_lock_cbFlipbookStateChangeOperation.phase == 1
    && self->_lock_cbFlipbookStateChangeOperation.cbFlipbookState == a4)
  {
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightDisplayStateMachine osInterfaceProvider:didCompleteSwitchToCBFlipbookState:withError:].cold.1((uint64_t)self, a4, v11);

    self->_lock_cbFlipbookStateChangeOperation.phase = 2;
    os_unfair_lock_unlock(&self->_lock);
    kdebug_trace();
    BSDispatchMain();
  }
  else
  {
    bls_backlight_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromCBFlipbookState_bls(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCBFlipbookState_bls(self->_lock_cbFlipbookStateChangeOperation.cbFlipbookState);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v18 = self;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "DSM:%p core brightness completed switch to wrong flipbook state:%{public}@}, waiting for flipbook state:%{public}@", buf, 0x20u);

    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

void __101__BLSHBacklightDisplayStateMachine_osInterfaceProvider_didCompleteSwitchToCBFlipbookState_withError___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (void)osInterfaceProvider:(id)a3 didCompleteTransitionToCADisplayState:(int64_t)a4 currentState:(int64_t)a5 transitionStatus:(int64_t)a6
{
  os_unfair_lock_s *p_lock;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t phase;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  BLSHBacklightDisplayStateMachine *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BYTE v40[14];
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a6 != 3 && a6)
  {
    bls_backlight_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    NSStringFromCADisplayStateTransitionStatus();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    phase = self->_lock_caDisplayStateChangeOperation.phase;
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    *(_DWORD *)buf = 134219522;
    v32 = self;
    v33 = 2112;
    v34 = v19;
    v35 = 2114;
    v36 = v20;
    v37 = 2114;
    v38 = v21;
    v39 = 2114;
    *(_QWORD *)v40 = v22;
    *(_WORD *)&v40[8] = 1024;
    *(_DWORD *)&v40[10] = phase;
    v41 = 2048;
    v42 = v24;
    _os_log_fault_impl(&dword_2145AC000, v18, OS_LOG_TYPE_FAULT, "DSM:%p core animation state transition status:%@ to display state:%{public}@, current display state:%{public}@ – pending transition to display state:%{public}@ phase:%u elapsed:%lfs", buf, 0x44u);

LABEL_16:
    goto LABEL_18;
  }
  self->_lock_completedCADisplayState = a4;
  if (self->_lock_caDisplayStateChangeOperation.caDisplayState != a4)
  {
    bls_backlight_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      NSStringFromCADisplayState();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCADisplayState();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCADisplayState();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = self->_lock_caDisplayStateChangeOperation.phase;
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      *(_DWORD *)buf = 134219266;
      v32 = self;
      v33 = 2114;
      v34 = v25;
      v35 = 2114;
      v36 = v26;
      v37 = 2114;
      v38 = v27;
      v39 = 1024;
      *(_DWORD *)v40 = v28;
      *(_WORD *)&v40[4] = 2048;
      *(_QWORD *)&v40[6] = v29;
      _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "DSM:%p core animation completed transition to wrong display state:%{public}@ (currentState:%{public}@), waiting for display state:%{public}@ phase:%u elapsed:%lfs", buf, 0x3Au);

    }
    goto LABEL_18;
  }
  v10 = self->_lock_caDisplayStateChangeOperation.phase;
  if (v10 == 2)
  {
    bls_backlight_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    NSStringFromCADisplayStateTransitionStatus();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v32 = self;
    v33 = 2114;
    v34 = v19;
    v35 = 2114;
    v36 = v20;
    v37 = 2114;
    v38 = v21;
    _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "DSM:%p (likely initialization) core animation completed(%{public}@) switch to display state:%{public}@ currentState:%{public}@", buf, 0x2Au);
    goto LABEL_16;
  }
  if (v10 == 1)
  {
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a6)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        self->_lock_caDisplayStateChangeOperation.phase = 2;
        os_unfair_lock_unlock(p_lock);
        BSDispatchMain();
        return;
      }
      NSStringFromCADisplayState();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCADisplayState();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCADisplayState();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_lock_caDisplayStateChangeOperation.phase;
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      *(_DWORD *)buf = 134219266;
      v32 = self;
      v33 = 2114;
      v34 = v13;
      v35 = 2114;
      v36 = v14;
      v37 = 2114;
      v38 = v15;
      v39 = 1024;
      *(_DWORD *)v40 = v16;
      *(_WORD *)&v40[4] = 2048;
      *(_QWORD *)&v40[6] = v17;
      _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "DSM:%p core animation reporting interrupted transition to display state:%{public}@, current display state:%{public}@ – pending transition to display state:%{public}@ phase:%u elapsed:%lfs", buf, 0x3Au);

    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      NSStringFromCADisplayState();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCADisplayState();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      *(_DWORD *)buf = 134218754;
      v32 = self;
      v33 = 2114;
      v34 = v13;
      v35 = 2114;
      v36 = v14;
      v37 = 2048;
      v38 = v30;
      _os_log_debug_impl(&dword_2145AC000, v12, OS_LOG_TYPE_DEBUG, "DSM:%p core animation completed transition to display state:%{public}@ (currentState:%{public}@) elapsed:%lfs", buf, 0x2Au);
    }

    goto LABEL_21;
  }
  bls_backlight_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    NSStringFromCADisplayStateTransitionStatus();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCADisplayState();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v32 = self;
    v33 = 2114;
    v34 = v19;
    v35 = 2114;
    v36 = v20;
    v37 = 2114;
    v38 = v21;
    _os_log_error_impl(&dword_2145AC000, v18, OS_LOG_TYPE_ERROR, "DSM:%p core animation completed(%{public}@) transition to matching display state:%{public}@, (currentState:%{public}@), but operation is not started", buf, 0x2Au);
    goto LABEL_16;
  }
LABEL_18:

  os_unfair_lock_unlock(p_lock);
}

void __124__BLSHBacklightDisplayStateMachine_osInterfaceProvider_didCompleteTransitionToCADisplayState_currentState_transitionStatus___block_invoke(uint64_t a1)
{
  -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(_QWORD *)(a1 + 32));
}

- (id)abortContextForTimer:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  char v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  BLSHBacklightDisplayStateMachineAbortContext *v14;
  int64_t displayMode;
  int64_t lock_lastSteadyStateDisplayMode;
  int64_t lock_prewarmingDisplayMode;
  char v18;
  BLSHBacklightDisplayStateMachineAbortContext *v19;
  uint64_t v21;

  v4 = -[BLSHBacklightOSInterfaceProviding caDisplayState](self->_osInterface, "caDisplayState", a3);
  v5 = -[BLSHBacklightOSInterfaceProviding cbDisplayMode](self->_osInterface, "cbDisplayMode");
  v6 = -[BLSHBacklightOSInterfaceProviding isShowingBlankingWindow](self->_osInterface, "isShowingBlankingWindow");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "hasEnsureFlipbookCurrent");

  -[BLSHBacklightOSInterfaceProviding systemSleepMonitor](self->_osInterface, "systemSleepMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -1.0;
  if (objc_msgSend(v9, "isSleepImminent"))
  {
    v11 = v9;
    mach_continuous_time();
    objc_msgSend(v11, "aggregateState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sleepMonitorStateTimestamp");
    BSTimeDifferenceFromMachTimeToMachTime();
    v10 = v13;

  }
  v14 = [BLSHBacklightDisplayStateMachineAbortContext alloc];
  displayMode = self->_lock_displayRampOperation.displayMode;
  lock_prewarmingDisplayMode = self->_lock_prewarmingDisplayMode;
  lock_lastSteadyStateDisplayMode = self->_lock_lastSteadyStateDisplayMode;
  v18 = objc_msgSend(v9, "hasSleepBeenRequested");
  BYTE2(v21) = v8;
  BYTE1(v21) = objc_msgSend(v9, "isSleepImminent");
  LOBYTE(v21) = v18;
  v19 = -[BLSHBacklightDisplayStateMachineAbortContext initWithDisplayMode:prewarmingDisplayMode:lastSteadyStateDisplayMode:caDisplayState:cbDisplayMode:showingBlankingWindow:sleepRequested:sleepImminent:timeInSleepImminent:hasEnsureFlipbookCurrent:](v14, "initWithDisplayMode:prewarmingDisplayMode:lastSteadyStateDisplayMode:caDisplayState:cbDisplayMode:showingBlankingWindow:sleepRequested:sleepImminent:timeInSleepImminent:hasEnsureFlipbookCurrent:", displayMode, lock_prewarmingDisplayMode, lock_lastSteadyStateDisplayMode, v4, v5, v6, v10, v21);

  return v19;
}

- (id)osInterfaceProvider
{
  return self->_osInterface;
}

- (id)identifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BLSHBacklightDisplayStateMachineDelegate)delegate
{
  return (BLSHBacklightDisplayStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_liveRenderingSystemActivityAssertion, 0);
  objc_storeStrong((id *)&self->_lock_caDisplayPowerAssertion, 0);
  objc_storeStrong((id *)&self->_powerResourceHint, 0);
  objc_storeStrong((id *)&self->_osInterface, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
}

- (void)switchToFlipbookState:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[56];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromCBFlipbookState_bls(*(_QWORD *)(a1 + 200));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 24), "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bls_machContinuousTime");
  OUTLINED_FUNCTION_13_0();
  NSStringFromCBFlipbookState_bls(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  _os_log_fault_impl(&dword_2145AC000, a3, OS_LOG_TYPE_FAULT, "DSM:%p replacing pending switch to flipbookState:%{public}@ from %lfs ago with switch to flipbookState:%{public}@", v9, 0x2Au);

  OUTLINED_FUNCTION_10_3();
}

- (void)transitionToCADisplayState:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[56];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NSStringFromCADisplayState();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 24), "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bls_machContinuousTime");
  OUTLINED_FUNCTION_13_0();
  NSStringFromCADisplayState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "DSM:%p replacing pending switch to caDisplayState:%{public}@ from %lfs ago with switch to caDisplayState:%{public}@", v8, 0x2Au);

  OUTLINED_FUNCTION_10_3();
}

- (void)osInterfaceProvider:(uint64_t)a1 didCompleteTransitionToCBDisplayMode:(unint64_t)a2 withError:(NSObject *)a3 .cold.1(uint64_t a1, unint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromCBDisplayMode_bls(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(&dword_2145AC000, a3, OS_LOG_TYPE_ERROR, "DSM:%p core brightness completed switch to matching display mode:%{public}@, but operation is not started", v5, 0x16u);

  OUTLINED_FUNCTION_2_1();
}

- (void)osInterfaceProvider:(uint64_t)a1 didCompleteTransitionToCBDisplayMode:(unint64_t)a2 withError:(NSObject *)a3 .cold.2(uint64_t a1, unint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromCBDisplayMode_bls(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v5, "DSM:%p core brightness completed switch to display mode:%{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)osInterfaceProvider:(uint64_t)a1 didCompleteSwitchToCBFlipbookState:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromCBFlipbookState_bls(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v5, "DSM:%p core brightness completed switch to flipbook state:%{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

@end
