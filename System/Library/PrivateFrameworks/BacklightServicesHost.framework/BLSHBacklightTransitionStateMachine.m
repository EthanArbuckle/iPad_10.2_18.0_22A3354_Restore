@implementation BLSHBacklightTransitionStateMachine

- (int64_t)backlightState
{
  os_unfair_lock_s *p_lock;
  int64_t lock_backlightState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_backlightState = self->_lock_backlightState;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightState;
}

- (BLSHBacklightTransitionStateMachine)initWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLSHBacklightTransitionStateMachine *v12;
  BLSHBacklightTransitionStateMachine *v13;
  BLSHBacklightDisplayStateMachine *v14;
  BLSHBacklightDisplayStateMachine *displayStateMachine;
  uint64_t v16;
  NSMutableArray *lock_queuedEventsToPerform;
  uint64_t v18;
  NSMutableArray *lock_activeEvents;
  uint64_t v20;
  NSMutableArray *lock_abortedEvents;
  BLSHAlwaysOnPresentationEngine *v22;
  BLSHAlwaysOnPresentationEngine *alwaysOnPresentationEngine;
  uint64_t v24;
  uint64_t v25;
  id v26;
  BLSHBacklightAggregateState *v27;
  BLSHBacklightAggregateState *currentState;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  BLSHBacklightTransitionStateMachine *result;
  void *v34;
  _QWORD block[4];
  BLSHBacklightTransitionStateMachine *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  id location;
  objc_super v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v43.receiver = self;
  v43.super_class = (Class)BLSHBacklightTransitionStateMachine;
  v12 = -[BLSHBacklightTransitionStateMachine init](&v43, sel_init);
  v13 = v12;
  if (!v12)
  {
LABEL_14:

    return v13;
  }
  v12->_lock._os_unfair_lock_opaque = 0;
  v12->_lock_safeToUnblank = 1;
  objc_storeStrong((id *)&v12->_platformProvider, a3);
  objc_storeStrong((id *)&v13->_inactiveBudgetPolicy, a5);
  objc_storeStrong((id *)&v13->_osInterfaceProvider, a4);
  v14 = -[BLSHBacklightDisplayStateMachine initWithDelegate:platformProvider:osInterfaceProvider:]([BLSHBacklightDisplayStateMachine alloc], "initWithDelegate:platformProvider:osInterfaceProvider:", v13, v9, v10);
  displayStateMachine = v13->_displayStateMachine;
  v13->_displayStateMachine = v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = objc_claimAutoreleasedReturnValue();
  lock_queuedEventsToPerform = v13->_lock_queuedEventsToPerform;
  v13->_lock_queuedEventsToPerform = (NSMutableArray *)v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = objc_claimAutoreleasedReturnValue();
  lock_activeEvents = v13->_lock_activeEvents;
  v13->_lock_activeEvents = (NSMutableArray *)v18;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = objc_claimAutoreleasedReturnValue();
  lock_abortedEvents = v13->_lock_abortedEvents;
  v13->_lock_abortedEvents = (NSMutableArray *)v20;

  v13->_flipbookSupported = objc_msgSend(v10, "deviceSupportsAlwaysOnFlipbook");
  if (objc_msgSend(v10, "deviceSupportsAlwaysOn"))
  {
    v22 = -[BLSHAlwaysOnPresentationEngine initWithDelegate:platformProvider:osInterfaceProvider:inactiveBudgetPolicy:]([BLSHAlwaysOnPresentationEngine alloc], "initWithDelegate:platformProvider:osInterfaceProvider:inactiveBudgetPolicy:", v13, v9, v10, v11);
    alwaysOnPresentationEngine = v13->_alwaysOnPresentationEngine;
    v13->_alwaysOnPresentationEngine = v22;

  }
  v13->_lastSteadyStateFlipbookState = -[BLSHBacklightTransitionStateMachine flipbookStateForEngine]((uint64_t)v13);
  if (!-[BLSHAlwaysOnPresentationEngine engineState](v13->_alwaysOnPresentationEngine, "engineState"))
  {
    v24 = -[BLSHBacklightDisplayStateMachine displayMode](v13->_displayStateMachine, "displayMode");
    v25 = 0;
    switch(v24)
    {
      case 0:
      case 5:
        goto LABEL_10;
      case 1:
        v26 = -[BLSHAlwaysOnPresentationEngine suppressForReason:](v13->_alwaysOnPresentationEngine, "suppressForReason:", CFSTR("flipbookSuppressedOnInit"));
        v25 = 0;
        goto LABEL_10;
      case 2:
      case 3:
        v25 = 1;
        goto LABEL_10;
      case 4:
        v25 = 2;
        goto LABEL_10;
      case 6:
        v25 = 3;
LABEL_10:
        v13->_lock_backlightState = v25;
        break;
      default:
        break;
    }
    v13->_backlightStateChangeTimestamp = mach_continuous_time();
    v27 = -[BLSHBacklightAggregateState initWithDisplayModeSource:]([BLSHBacklightAggregateState alloc], "initWithDisplayModeSource:", v13->_displayStateMachine);
    currentState = v13->_currentState;
    v13->_currentState = v27;

    v29 = -[BLSHBacklightAggregateState displayMode](v13->_currentState, "displayMode");
    v13->_lock_lastNotifiedTargetDisplayMode = v29;
    v13->_lock_lastNotifiedCompletedDisplayMode = v29;
    objc_initWeak(&location, v13);
    v30 = MEMORY[0x24BDAC760];
    v37 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke;
    v40 = &unk_24D1BC578;
    objc_copyWeak(&v41, &location);
    v13->_stateHandler = os_state_add_handler();
    +[BLSHBacklightFBSceneHostEnvironment setAmendSceneSettingsDelegate:](BLSHBacklightFBSceneHostEnvironment, "setAmendSceneSettingsDelegate:", v13);
    if ((BLSBacklightStateIsActive() & 1) == 0)
    {
      -[BLSHBacklightTransitionStateMachine acquireTouchLockAssertion]((uint64_t)v13);
      -[BLSHBacklightTransitionStateMachine createSession]((uint64_t)v13);
      -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDisplayMode:", -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)v13, v13->_lock_backlightState, v13->_lock_session));
      -[BLSHBacklightEnvironmentStateMachine updateAllEnvironmentsInPresentation](v13->_environmentStateMachine, "updateAllEnvironmentsInPresentation");
      block[0] = v30;
      block[1] = 3221225472;
      block[2] = __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke_2;
      block[3] = &unk_24D1BC268;
      v36 = v13;
      v32 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("presentationEngine:%@ is not stopped on intitialization"), v13->_alwaysOnPresentationEngine);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHBacklightTransitionStateMachine initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:].cold.1();
  objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
  result = (BLSHBacklightTransitionStateMachine *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (uint64_t)flipbookStateForEngine
{
  uint64_t v1;
  unint64_t v2;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 40), "engineState");
    if (result)
    {
      v2 = result;
      if (objc_msgSend(*(id *)(v1 + 40), "isSuppressed"))
      {
        if (BLSBacklightStateIsActive())
          return 2;
        else
          return 3;
      }
      else if (v2 > 4)
      {
        return 0;
      }
      else
      {
        return qword_21462C410[v2 - 1];
      }
    }
  }
  return result;
}

uint64_t __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)acquireTouchLockAssertion
{
  os_unfair_lock_s *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(void **)(a1 + 56);
    if (v3)
    {
      v4 = objc_msgSend(v3, "isActive");
      os_unfair_lock_unlock(v2);
      if ((v4 & 1) != 0)
        return;
    }
    else
    {
      os_unfair_lock_unlock(v2);
    }
    v5 = (void *)MEMORY[0x24BE0B838];
    objc_msgSend(MEMORY[0x24BE0B9A8], "touchLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireWithExplanation:observer:attributes:", CFSTR("inactiveBacklight"), 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(v2);
    v9 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v8;
    v10 = v8;
    v11 = v9;

    os_unfair_lock_unlock(v2);
    objc_msgSend(v11, "invalidate");

  }
}

- (uint64_t)createSession
{
  if (result)
    return BSDispatchMain();
  return result;
}

- (BLSHBacklightMutableTargetState)withLock_ensureTargetStateCreated
{
  BLSHBacklightMutableTargetState *v2;
  BLSHBacklightMutableTargetState *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BLSHBacklightMutableTargetState *v8;
  void *v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  BLSHBacklightMutableTargetState *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (BLSHBacklightMutableTargetState *)*(id *)(a1 + 160);
    if (v2)
    {
      v3 = v2;
      -[BLSHBacklightMutableTargetState presentation](v2, "presentation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        return v3;
      objc_msgSend(*(id *)(a1 + 152), "presentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return v3;
      bls_backlight_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 152);
        v12 = 134218498;
        v13 = a1;
        v14 = 2114;
        v15 = v3;
        v16 = 2114;
        v17 = v11;
        _os_log_error_impl(&dword_2145AC000, v6, OS_LOG_TYPE_ERROR, "TSM:%p nil target presentation, will adopt from current state — target:%{public}@ current:%{public}@", (uint8_t *)&v12, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 152), "presentation");
      v7 = objc_claimAutoreleasedReturnValue();
      -[BLSHBacklightMutableTargetState setPresentation:](v3, "setPresentation:", v7);
    }
    else
    {
      v8 = -[BLSHBacklightMutableTargetState initWithState:]([BLSHBacklightMutableTargetState alloc], "initWithState:", *(_QWORD *)(a1 + 152));
      v9 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v8;

      v3 = v8;
      bls_backlight_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated].cold.1(a1, v3, v7);
    }

    return v3;
  }
  return (BLSHBacklightMutableTargetState *)0;
}

- (uint64_t)lock_displayModeForBacklightState:(void *)a3 session:
{
  id v5;
  uint64_t result;
  void *v7;

  v5 = a3;
  if (!a1)
    goto LABEL_13;
  if (a2 == 3)
  {
    a1 = 6;
LABEL_13:

    return a1;
  }
  if (a2 != 1)
  {
    if (a2)
      a1 = 4;
    else
      a1 = *(unsigned __int8 *)(a1 + 231);
    goto LABEL_13;
  }
  if (!*(_BYTE *)(a1 + 231))
  {
    if (!*(_BYTE *)(a1 + 224) || *(_BYTE *)(a1 + 242) || *(_BYTE *)(a1 + 240))
    {
      a1 = 3;
    }
    else if (-[BLSHBacklightTransitionStateMachine hasUnrestrictedFramerateWithSession:](a1, v5))
    {
      a1 = 3;
    }
    else
    {
      a1 = 2;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unexpectedly wants suppression when backlightState:BLSBacklightStateInactiveOn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:].cold.1();
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

void __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke_2(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)onMain_performNextStepInTransition
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p got operation: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)dealloc
{
  objc_super v3;

  +[BLSHBacklightFBSceneHostEnvironment setAmendSceneSettingsDelegate:](BLSHBacklightFBSceneHostEnvironment, "setAmendSceneSettingsDelegate:", 0);
  -[BLSHBacklightTransitionStateMachine invalidateTouchLockAssertion]((uint64_t)self);
  if (self->_stateHandler)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightTransitionStateMachine;
  -[BLSHBacklightTransitionStateMachine dealloc](&v3, sel_dealloc);
}

- (void)invalidateTouchLockAssertion
{
  os_unfair_lock_s *v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;
    v4 = v3;

    os_unfair_lock_unlock(v2);
    objc_msgSend(v4, "invalidate");

  }
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightTransitionStateMachine withLock_backlightStateDescription]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("backlightState"));

  NSStringFromBLSFlipbookState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("flipbookState"));

  v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_safeToUnblank, CFSTR("safeToUnblank"), 0);
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", self->_currentState, CFSTR("currentState"));
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", self->_lock_targetState, CFSTR("targetState"));
  v12 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_flipbookSupported, CFSTR("fb"), 0);
  v13 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_lock_pendingEnvironmentUpdate, CFSTR("pendingEventToPerform"));
  v14 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_lock_pendingUpdateDisplayMode, CFSTR("pendingUpdateDisplayMode"));
  v15 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_lock_pendingUpdatePresentation, CFSTR("pendingUpdatePresentation"));
  v16 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_lock_pendingUpdateToSpecifier, CFSTR("pendingUpdateToSpecifier"));
  v17 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_lock_ensureFlipbookCurrentOperation, CFSTR("ensureFlipbookCurrentOperation"));
  NSStringFromBLSBacklightChangeEvents();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v18, CFSTR("queuedEvents"));

  objc_msgSend(v4, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v19;
}

- (id)withLock_backlightStateDescription
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    if (-[BLSHBacklightTransitionStateMachine withLock_isTransitioning](a1))
      v3 = "transitioning to ";
    else
      v3 = "";
    NSStringFromBLSBacklightState();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0BDF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    objc_msgSend(v5, "formatDuration:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDBCE60]);
    objc_msgSend(v7, "bls_initWithMachContinuousTime:", *(_QWORD *)(a1 + 80));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bls_shortLoggingString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%s%@ for %@ since %@"), v3, v4, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightTransitionStateMachine withLock_debugDescription]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (id)withLock_debugDescription
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHBacklightTransitionStateMachine withLock_backlightStateDescription]((uint64_t)v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("backlightState"));

    NSStringFromBLSFlipbookState();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v2, "appendObject:withName:", v5, CFSTR("flipbookState"));

    -[BLSHBacklightTransitionStateMachine flipbookStateForEngine]((uint64_t)v1);
    NSStringFromBLSFlipbookState();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v2, "appendObject:withName:", v7, CFSTR("flipbookState (immediate-engine)"));

    v9 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", *((unsigned __int8 *)v1 + 243), CFSTR("safeToUnblank"), 0);
    objc_msgSend(v1[19], "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v2, "appendObject:withName:", v10, CFSTR("currentState"));

    objc_msgSend(v1[20], "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v2, "appendObject:withName:", v12, CFSTR("targetState"));

    objc_msgSend(v1[13], "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v2, "appendObject:withName:", v14, CFSTR("pendingEventToPerform"));

    objc_msgSend(v1[16], "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v2, "appendObject:withName:", v16, CFSTR("pendingUpdateDisplayMode"));

    objc_msgSend(v1[14], "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v2, "appendObject:withName:", v18, CFSTR("pendingUpdatePresentation"));

    objc_msgSend(v1[15], "debugDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v2, "appendObject:withName:", v20, CFSTR("pendingUpdateToSpecifier"));

    objc_msgSend(v1[17], "debugDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v2, "appendObject:withName:", v22, CFSTR("ensureFlipbookCurrentOperation"));

    objc_msgSend(v1[22], "debugDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v2, "appendObject:withName:", v24, CFSTR("queuedEvents"));

    objc_msgSend(v1[21], "debugDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v2, "appendObject:withName:", v26, CFSTR("pendingPrewarmedEvent"));

    objc_msgSend(v2, "build");
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)registerHandlersForService:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  +[BLSHDisableFlipbookAttributeHandler registerHandlerForService:provider:](BLSHDisableFlipbookAttributeHandler, "registerHandlerForService:provider:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145FBF90);
  }
  v5 = (void *)v4;
  +[BLSHGlobalUnrestrictedFramerateAttributeHandler registerHandlerForService:provider:](BLSHGlobalUnrestrictedFramerateAttributeHandler, "registerHandlerForService:provider:", v12, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:].cold.2();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145FBFF4);
  }
  +[BLSHGlobalHighLuminanceAlwaysOnAttributeHandler registerHandlerForService:provider:](BLSHGlobalHighLuminanceAlwaysOnAttributeHandler, "registerHandlerForService:provider:", v12, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:].cold.3();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145FC058);
  }
  +[BLSHGlobalCacheFlipbookOnDisplayWakeAttributeHandler registerHandlerForService:provider:](BLSHGlobalCacheFlipbookOnDisplayWakeAttributeHandler, "registerHandlerForService:provider:", v12, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:].cold.4();
    goto LABEL_17;
  }
  -[BLSHAlwaysOnPresentationEngine registerHandlersForService:](self->_alwaysOnPresentationEngine, "registerHandlersForService:", v12);

}

- (int64_t)flipbookState
{
  os_unfair_lock_s *p_lock;
  int64_t lastSteadyStateFlipbookState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastSteadyStateFlipbookState = self->_lastSteadyStateFlipbookState;
  os_unfair_lock_unlock(p_lock);
  return lastSteadyStateFlipbookState;
}

- (BLSHBacklightInactiveEnvironmentSession)session
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightInactiveEnvironmentSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_session;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)backlightDisplayMode
{
  return self->_lock_lastNotifiedCompletedDisplayMode;
}

- (unint64_t)backlightStateChangeTimestamp
{
  os_unfair_lock_s *p_lock;
  unint64_t backlightStateChangeTimestamp;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  backlightStateChangeTimestamp = self->_backlightStateChangeTimestamp;
  os_unfair_lock_unlock(p_lock);
  return backlightStateChangeTimestamp;
}

- (NSString)backlightStateDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightTransitionStateMachine withLock_backlightStateDescription]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BOOL)withLock_isTransitioning
{
  if (result)
    return *(_QWORD *)(result + 104)
        || *(_QWORD *)(result + 112)
        || *(_QWORD *)(result + 120)
        || *(_QWORD *)(result + 128)
        || *(_QWORD *)(result + 136)
        || objc_msgSend(*(id *)(result + 176), "count") != 0;
  return result;
}

- (BOOL)isAlwaysOnSuppressed
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnSuppressed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnSuppressed:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysOnSuppressed = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isTransitioning
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BLSHBacklightTransitionStateMachine withLock_isTransitioning]((_BOOL8)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAlwaysOnEnabled
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BOOL result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BLSHBacklightTransitionStateMachine *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shouldn't be called"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BLSHBacklightTransitionStateMachine.m");
    v17 = 1024;
    v18 = 356;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)deviceSupportsAlwaysOn
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BOOL result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BLSHBacklightTransitionStateMachine *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shouldn't be called"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BLSHBacklightTransitionStateMachine.m");
    v17 = 1024;
    v18 = 362;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)safeToUnblank
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_safeToUnblank;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSafeToUnblank:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_safeToUnblank;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_safeToUnblank = self->_lock_safeToUnblank;
  self->_lock_safeToUnblank = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_safeToUnblank != v3 && v3 != 0)
    BSDispatchMain();
}

void __56__BLSHBacklightTransitionStateMachine_setSafeToUnblank___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (BLSHBacklightHostObserving)performerDelegate
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightHostObserving *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_performerDelegate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPerformerDelegate:(id)a3
{
  BLSHBacklightHostObserving *v4;
  BLSHBacklightHostObserving *lock_performerDelegate;

  v4 = (BLSHBacklightHostObserving *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_performerDelegate = self->_lock_performerDelegate;
  self->_lock_performerDelegate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

void __52__BLSHBacklightTransitionStateMachine_createSession__block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_ensureSessionCreated](*(_QWORD *)(a1 + 32));
}

- (void)onMain_ensureSessionCreated
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

- (uint64_t)_lock_updateCacheFlipbookWithSession:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(unsigned __int8 *)(a1 + 229);
    if (*(_BYTE *)(a1 + 228))
    {
      v6 = 1;
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v3, "presentation", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentationEntries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v6)
      {
        v9 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(v8);
            v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v11, "environment");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = BLSCacheFlipbookOnDisplayWakeForEnvironment(v12);

            if (v13)
            {
              bls_backlight_log();
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = v14;
              if (v5)
                v16 = OS_LOG_TYPE_DEBUG;
              else
                v16 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v14, v16))
              {
                objc_msgSend(v11, "environment");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v26 = a1;
                v27 = 2114;
                v28 = v18;
                _os_log_impl(&dword_2145AC000, v15, v16, "TSM:%p cacheFlipbook:YES for %{public}@", buf, 0x16u);

              }
              v6 = 1;
              goto LABEL_19;
            }
          }
          v6 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_19:

    }
    if (v5 == (_DWORD)v6)
    {
      a1 = 0;
    }
    else
    {
      bls_backlight_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v26 = a1;
        v27 = 1024;
        LODWORD(v28) = v6;
        _os_log_impl(&dword_2145AC000, v19, OS_LOG_TYPE_INFO, "TSM:%p new cacheFlipbook:%{BOOL}u", buf, 0x12u);
      }

      *(_BYTE *)(a1 + 229) = v6;
      objc_msgSend(*(id *)(a1 + 40), "setCacheFlipbook:", v6);
      a1 = 1;
    }
  }

  return a1;
}

- (uint64_t)lock_isHighLuminanceAlwaysOnWithSession:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 241))
    {
      a1 = 1;
    }
    else
    {
      objc_msgSend(v3, "presentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(v5, "isHighLuminanceAlwaysOn");

    }
  }

  return a1;
}

- (void)destroySession
{
  os_unfair_lock_s *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(id *)(a1 + 144);
    bls_backlight_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "presentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = a1;
      v13 = 2048;
      v14 = v3;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_2145AC000, v4, OS_LOG_TYPE_INFO, "TSM:%p destroy session:%p with current presentation:%{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(v3, "setUpdater:", 0);
    v6 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;

    objc_msgSend(*(id *)(a1 + 152), "setPresentationSource:", 0);
    v7 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;
    v8 = v7;

    v9 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

    os_unfair_lock_unlock(v2);
    objc_msgSend(v3, "sessionDidEnd");
    objc_msgSend(v8, "invalidate");
    v10 = (id)objc_msgSend(*(id *)(a1 + 40), "stopForReason:", CFSTR("destroySession"));
    objc_msgSend(*(id *)(a1 + 40), "purgeFlipbook");

  }
}

- (uint64_t)hasUnrestrictedFramerateWithSession:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      objc_msgSend(v3, "presentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(v5, "hasUnrestrictedFramerateUpdates");

    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (void)withLock_acquireTransitionAPAwakeAssertion
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p already have transition system activity assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

uint64_t __81__BLSHBacklightTransitionStateMachine_withLock_acquireTransitionAPAwakeAssertion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 0);
}

void __81__BLSHBacklightTransitionStateMachine_withLock_acquireTransitionAPAwakeAssertion__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
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
    _os_log_impl(&dword_2145AC000, v9, v10, "TSM:%p transition system activity assertion callback elapsed:%.4lfs details:%{public}@ error:%{public}@", (uint8_t *)&v15, 0x2Au);

  }
}

- (void)releaseTransitionAPAwakeAssertion
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p dropping transition system activity assertion %{public}@");
  OUTLINED_FUNCTION_2();
}

- (BOOL)isFlipbookDisabled
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_flipbookDisabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFlipbookDisabled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  BLSHBacklightMutableTargetState *lock_targetState;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BLSHBacklightMutableTargetState *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_flipbookDisabled != v3 && self->_lock_backlightState == 1;
  self->_lock_flipbookDisabled = v3;
  if (self->_lock_targetState)
  {
    v7 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, self->_lock_session);
    bls_backlight_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBLSBacklightDisplayMode(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      lock_targetState = self->_lock_targetState;
      *(_DWORD *)buf = 134218754;
      v12 = self;
      v13 = 1024;
      v14 = v3;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = lock_targetState;
      _os_log_debug_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEBUG, "TSM:%p setFlipbookDisabled:%{BOOL}u targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x26u);

    }
    -[BLSHBacklightMutableTargetState setDisplayMode:](self->_lock_targetState, "setDisplayMode:", v7);
  }
  os_unfair_lock_unlock(p_lock);
  if (v6)
    BSDispatchMain();
}

void __59__BLSHBacklightTransitionStateMachine_setFlipbookDisabled___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)performEvent:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __52__BLSHBacklightTransitionStateMachine_performEvent___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performEvent:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)onMain_performEvent:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  char v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!a1)
    goto LABEL_15;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v3 = objc_msgSend(v13, "state");
  v4 = *(id *)(a1 + 168);
  *(_QWORD *)(a1 + 168) = 0;

  if (*(_BYTE *)(a1 + 227))
    v5 = 0;
  else
    v5 = objc_msgSend(v13, "isTransitionForcedUnanimated");
  *(_BYTE *)(a1 + 226) = v5;
  -[BLSHBacklightTransitionStateMachine _lock_enqueueNewEvent:]((id *)a1, v13);
  v6 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v3;
  if (v6 == v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if ((BLSBacklightStateIsActive() & 1) != 0)
      goto LABEL_10;
  }
  else
  {
    *(_QWORD *)(a1 + 80) = mach_continuous_time();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  -[BLSHBacklightTransitionStateMachine onMain_ensureSessionCreated](a1);
LABEL_10:
  v7 = v4 == v13;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated](a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayMode:", -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:](a1, *(_QWORD *)(a1 + 72), *(void **)(a1 + 144)));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  -[BLSHBacklightTransitionStateMachine logForPerformEvent:currentState:targetState:matchesPrewarm:pendingPrewarmedEvent:](a1, v13, *(void **)(a1 + 152), v8, v7, *(void **)(a1 + 168));
  if (v6 != v3)
  {
    if (BLSBacklightStateIsActive())
      -[BLSHBacklightTransitionStateMachine invalidateTouchLockAssertion](a1);
    else
      -[BLSHBacklightTransitionStateMachine acquireTouchLockAssertion](a1);
  }
  objc_msgSend(*(id *)(a1 + 48), "invalidate:", 1);
  v9 = *(void **)(a1 + 24);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSM:%p transition to backlight state for event:%@"), a1, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheduleWatchdogWithDelegate:explanation:timeout:", a1, v10, 20.0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v11;

  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](a1);
LABEL_15:

}

- (void)_lock_enqueueNewEvent:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "state");
    objc_msgSend(a1[23], "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && v5 != objc_msgSend(v6, "state"))
    {
      objc_msgSend(a1[24], "addObjectsFromArray:", a1[23]);
      v9[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[23], "setArray:", v8);
      objc_msgSend(a1[22], "setArray:", v8);

    }
    else
    {
      objc_msgSend(a1[23], "addObject:", v4);
      objc_msgSend(a1[22], "addObject:", v4);
    }

  }
}

- (void)logForPerformEvent:(void *)a3 currentState:(void *)a4 targetState:(int)a5 matchesPrewarm:(void *)a6 pendingPrewarmedEvent:
{
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  BLSHBacklightEnvironmentPresentation *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  const __CFString *v35;
  __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
  os_log_type_t type;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *log;
  id v71;
  int v72;
  id v73;
  id v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  id v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  id v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  __int16 v95;
  __CFString *v96;
  __int16 v97;
  __CFString *v98;
  __int16 v99;
  __CFString *v100;
  __int16 v101;
  id v102;
  __int16 v103;
  __CFString *v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x24BDAC8D0];
  v74 = a2;
  v11 = a3;
  v73 = a4;
  v71 = a6;
  if (a1)
  {
    if (!a5
      || (bls_backlight_log(),
          v12 = objc_claimAutoreleasedReturnValue(),
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO),
          v12,
          v13))
    {
      v72 = a5;
      objc_msgSend(v11, "presentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "presentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentationEntries");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      v66 = a1;
      if (v17 >= 2)
      {
        v18 = v11;
        v19 = [BLSHBacklightEnvironmentPresentation alloc];
        objc_msgSend(v15, "presentationEntries");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v105[0] = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "flipbookContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 20.0);
        v24 = v14;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[BLSHBacklightEnvironmentPresentation initWithPresentationEntries:flipbookContext:expirationDate:](v19, "initWithPresentationEntries:flipbookContext:expirationDate:", v22, v23, v25);

        v14 = (void *)v26;
        v11 = v18;
      }
      objc_msgSend(v15, "differenceFromPresentation:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "insertions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v27;
      objc_msgSend(v27, "removals");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "count");
      v69 = v29;
      v31 = objc_msgSend(v29, "count");
      objc_msgSend(v74, "changeRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      bls_backlight_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (v72)
        v34 = OS_LOG_TYPE_INFO;
      else
        v34 = OS_LOG_TYPE_ERROR;
      log = v33;
      if (!os_log_type_enabled(v33, v34))
        goto LABEL_32;
      type = v34;
      v35 = CFSTR("(unmatched prewarm event) ");
      v36 = &stru_24D1BE888;
      if (v72)
        v35 = &stru_24D1BE888;
      v55 = v35;
      v37 = v74;
      v54 = objc_msgSend(v74, "eventID");
      objc_msgSend(v74, "previousState");
      NSStringFromBLSBacklightState();
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "state");
      NSStringFromBLSBacklightState();
      v64 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sourceEvent");
      NSStringFromBLSBacklightChangeSourceEvent();
      v63 = (id)objc_claimAutoreleasedReturnValue();
      v57 = v32;
      objc_msgSend(v32, "explanation");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v59 = v11;
      NSStringFromBLSBacklightDisplayMode(objc_msgSend(v11, "displayMode"));
      v62 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightDisplayMode(objc_msgSend(v73, "displayMode"));
      v60 = v28;
      v61 = (id)objc_claimAutoreleasedReturnValue();
      v39 = (void *)0x24BDD1000;
      if (v14 == v15)
      {
        if (v30)
          goto LABEL_14;
      }
      else
      {
        v40 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v14, "presentationEntries");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v51, "count");
        objc_msgSend(v15, "presentationEntries");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v41;
        v28 = v60;
        objc_msgSend(v40, "stringWithFormat:", CFSTR("presentation:%p(%lu)->%p(%lu)"), v14, v50, v15, objc_msgSend(v53, "count"));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
LABEL_14:
          v42 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v28, "bs_map:", &__block_literal_global_116);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("\nadded %@"), v52);
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
          v58 = v14;
          if (v31)
          {
            v44 = v43;
            v45 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v69, "bs_map:", &__block_literal_global_121);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v45;
            v43 = v44;
            objc_msgSend(v46, "stringWithFormat:", CFSTR("\nremoved %@"), v37);
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v47 = &stru_24D1BE888;
          }
          objc_msgSend(v15, "bls_shortLoggingString");
          v67 = (id)objc_claimAutoreleasedReturnValue();
          if ((v72 & 1) != 0)
          {
            v48 = &stru_24D1BE888;
          }
          else
          {
            v49 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v71, "bls_shortLoggingString");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "stringWithFormat:", CFSTR("\n%@"), v39);
            v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 134221570;
          v76 = v66;
          v77 = 2114;
          v78 = v55;
          v79 = 2048;
          v80 = v54;
          v81 = 2048;
          v82 = v74;
          v83 = 2114;
          v84 = v65;
          v85 = 2114;
          v86 = v64;
          v87 = 2114;
          v88 = v63;
          v89 = 2114;
          v90 = v38;
          v91 = 2114;
          v92 = v62;
          v93 = 2114;
          v94 = v61;
          v95 = 2114;
          v96 = v36;
          v97 = 2114;
          v98 = v43;
          v99 = 2114;
          v100 = v47;
          v101 = 2114;
          v102 = v67;
          v103 = 2114;
          v104 = v48;
          _os_log_impl(&dword_2145AC000, log, type, "TSM:%p %{public}@will performEvent(%llu:%p) %{public}@->%{public}@ %{public}@:%{public}@ %{public}@->%{public}@ %{public}@%{public}@%{public}@\n%{public}@%{public}@", buf, 0x98u);
          if ((v72 & 1) == 0)
          {

          }
          if (v31)
          {

          }
          v11 = v59;
          v28 = v60;
          if (v30)
          {

          }
          v14 = v58;
          if (v58 != v15)
          {

          }
          v32 = v57;
LABEL_32:

          goto LABEL_33;
        }
      }
      v43 = &stru_24D1BE888;
      goto LABEL_17;
    }
  }
LABEL_33:

}

id __120__BLSHBacklightTransitionStateMachine_logForPerformEvent_currentState_targetState_matchesPrewarm_pendingPrewarmedEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __120__BLSHBacklightTransitionStateMachine_logForPerformEvent_currentState_targetState_matchesPrewarm_pendingPrewarmedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)prewarmEvent:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_pendingPrewarmedEvent, a3);
  v5 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, objc_msgSend(v9, "state"), self->_lock_session);
  -[BLSHBacklightTransitionStateMachine lock_displayOperationForTarget:isNullOperationAllowed:]((uint64_t)self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isCompleted") & 1) != 0)
    objc_msgSend(v6, "last");
  else
    objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "targetDisplayMode");
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightDisplayStateMachine prewarmForDisplayMode:](self->_displayStateMachine, "prewarmForDisplayMode:", v8);

}

- (id)lock_displayOperationForTarget:(uint64_t)a3 isNullOperationAllowed:
{
  void *v4;
  void *v5;
  void *v6;
  double v7;

  if (a1)
  {
    +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:isNullOperationAllowed:](BLSHPendingUpdateDisplayMode, "operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:isNullOperationAllowed:", objc_msgSend(*(id *)(a1 + 152), "displayMode"), a2, *(_QWORD *)(a1 + 128), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rampOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "duration");
      if (v7 == 0.0)
      {
        objc_msgSend(*(id *)(a1 + 248), "backlightFadeOutDuration");
        objc_msgSend(v6, "setDuration:");
      }
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)addObserver:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BLSHBacklightTransitionStateMachine *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("should not add observers to %@"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("BLSHBacklightTransitionStateMachine.m");
    v18 = 1024;
    v19 = 758;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  v4 = *(void **)(a1 + 40);
  if (a2 == 1)
  {
    v5 = (id)objc_msgSend(v4, "suppressForReason:", CFSTR("flipbookSuppressed"));
    goto LABEL_17;
  }
  v6 = objc_msgSend(v4, "engineState");
  if (v6)
  {
    if (a2 == 2)
    {
      if (v6 != 1)
        goto LABEL_17;
      v7 = *(void **)(a1 + 40);
      v8 = CFSTR("wantFlipbookEngine");
    }
    else
    {
      if (*(_QWORD *)(a1 + 72) != 1)
      {
        v10 = *(void **)(a1 + 40);
        if (*(_BYTE *)(a1 + 229))
          objc_msgSend(v10, "suppressForReason:", CFSTR("cacheFlipbook"));
        else
          objc_msgSend(v10, "stopForReason:", CFSTR("wantStopped"));
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if ((unint64_t)(v6 - 2) > 2)
        goto LABEL_17;
      v7 = *(void **)(a1 + 40);
      v8 = CFSTR("wantLiveUpdatingEngine");
    }
    objc_msgSend(v7, "suspendForReason:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v11 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v9;

  }
LABEL_17:
  v12 = *(void **)(a1 + 136);
  if (v12 && (objc_msgSend(v12, "isCompleted") & 1) == 0)
  {
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 136);
      NSStringFromBLSBacklightDisplayMode(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218498;
      v18 = a1;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_2145AC000, v13, OS_LOG_TYPE_INFO, "TSM:%p (stopPresentationEngine) abandoning ensureFlipbookCurrentOperation %{public}@ because it's obsolete; disp"
        "layMode=%{public}@",
        (uint8_t *)&v17,
        0x20u);

    }
  }
  v16 = *(void **)(a1 + 136);
  *(_QWORD *)(a1 + 136) = 0;

}

- (id)onMainWithLock_onScreenSpecifierForDisplayMode:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "onGlassFlipbookFrame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bls_specifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 144), "presentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    v4 = v5;
  }
  v8 = v5;
  bls_backlight_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightDisplayMode(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bls_shortLoggingString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218498;
    v14 = a1;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_debug_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEBUG, "TSM:%p onScreenSpecifierForDisplayMode:%{public}@ will use current:%{public}@", (uint8_t *)&v13, 0x20u);

  }
  return v8;
}

- (uint64_t)setDisplayMode:(uint64_t)result withRampDuration:
{
  if (result)
    return BSDispatchMain();
  return result;
}

void __71__BLSHBacklightTransitionStateMachine_setDisplayMode_withRampDuration___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_setDisplayMode:withRampDuration:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)onMain_setDisplayMode:(double)a3 withRampDuration:
{
  os_unfair_lock_s *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v7 = *(_QWORD *)(a1 + 208);
    *(_QWORD *)(a1 + 208) = a2;
    v10 = (id)objc_msgSend(*(id *)(a1 + 184), "copy");
    v8 = (void *)objc_msgSend(*(id *)(a1 + 192), "copy");
    os_unfair_lock_unlock(v6);
    if (v7 != a2)
    {
      objc_msgSend((id)a1, "performerDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backlight:willUpdateToDisplayMode:fromDisplayMode:forEvents:abortedEvents:", a1, a2, v7, v10, v8);

    }
    objc_msgSend(*(id *)(a1 + 256), "setDisplayMode:withRampDuration:", a2, a3);
    if (a2 != 2)
      objc_msgSend(*(id *)(a1 + 40), "invalidateOnGlassFlipbookFrame");
    objc_msgSend(*(id *)(a1 + 40), "setOnStandby:", IsOffForBLSBacklightDisplayMode(a2) ^ 1);

  }
}

- (id)onMainWithLock_environmentPerformUpdateIfNeededBeforeDisplayUpdate
{
  if (a1)
  {
    -[BLSHBacklightTransitionStateMachine onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:](a1, 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  void *v6;
  id *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  id *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v2 = a1;
  v24 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return v2;
  if (objc_msgSend(a1[22], "count"))
  {
    objc_msgSend(v2[22], "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((((objc_msgSend(v4, "state") == 0) ^ a2) & 1) != 0)
    {
      v5 = (void *)objc_msgSend(v2[22], "copy");
      objc_msgSend(v2[22], "removeAllObjects");
      -[BLSHBacklightTransitionStateMachine onMainWithLock_environmentUpdateOperationForEvents:]((BLSHPendingEnvironmentUpdateOperation *)v2, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return (id *)v6;
    }

    goto LABEL_12;
  }
  v8 = v2 + 13;
  if (!v2[13])
    goto LABEL_12;
  v9 = -[BLSHBacklightTransitionStateMachine willUnblankTransitioningToDisplayMode:]((uint64_t)v2, objc_msgSend(v2[20], "displayMode"));
  v10 = v2[16];
  if (v10
    && objc_msgSend(v10, "isCompleted")
    && (objc_msgSend(v2[16], "isDirectRamp") & 1) == 0
    && v2[20])
  {
    objc_msgSend(v2[16], "last");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "targetDisplayMode");
    v13 = v12 == objc_msgSend(v2[20], "displayMode");

  }
  else
  {
    v13 = 0;
  }
  v15 = *v8;
  if (a2 && (v9 || v13))
  {
    if ((objc_msgSend(v15, "didUpdateInitialState") & 1) == 0)
      goto LABEL_22;
LABEL_12:
    bls_backlight_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBLSBacklightChangeEvents();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218498;
      v19 = v2;
      v20 = 1024;
      v21 = a2;
      v22 = 2114;
      v23 = v17;
      _os_log_debug_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEBUG, "TSM:%p (findNextOperation) no environmentPerformUpdate operation needed isBeforeDisplayBlankingChange:%{BOOL}u (queuedEvents:%{public}@})", (uint8_t *)&v18, 0x1Cu);

    }
    v2 = 0;
    return v2;
  }
  if ((objc_msgSend(v15, "isCompleted") & 1) != 0)
    goto LABEL_12;
LABEL_22:
  bls_backlight_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightTransitionStateMachine onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:].cold.1();

  return (id *)*v8;
}

- (id)onMainWithLock_environmentPerformUpdateIfNeededAfterDisplayUpdate
{
  if (a1)
  {
    -[BLSHBacklightTransitionStateMachine onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:](a1, 0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BLSHPendingEnvironmentUpdateOperation)onMainWithLock_environmentUpdateOperationForEvents:(BLSHPendingEnvironmentUpdateOperation *)a1
{
  id v3;
  void *isa;
  uint64_t v5;
  BLSHPendingEnvironmentUpdateOperation *v6;
  void *v7;
  BLSHPendingEnvironmentUpdateOperation *v8;
  NSObject *v9;
  BLSHPendingEnvironmentUpdateOperation *v10;
  BLSHPendingEnvironmentUpdateOperation *v11;
  BLSHPendingEnvironmentUpdateOperation *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSObject *v19;
  BLSHPendingEnvironmentUpdateOperation *v20;
  BLSHPendingEnvironmentUpdateOperation *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  NSObject *v26;
  BLSHPendingEnvironmentUpdateOperation *v27;
  Class v28;
  int IsActive;
  BLSHPendingEnvironmentUpdateOperation *v30;
  BLSHPendingEnvironmentUpdateOperation *v31;
  BOOL v32;
  BLSHPendingEnvironmentUpdateOperation *v33;
  void *v34;
  BLSHPendingEnvironmentUpdateOperation *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD block[4];
  BLSHPendingEnvironmentUpdateOperation *v53;
  BLSHPendingEnvironmentUpdateOperation *v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  BLSHPendingEnvironmentUpdateOperation *v58;
  __int16 v59;
  BLSHPendingEnvironmentUpdateOperation *v60;
  __int16 v61;
  BLSHPendingEnvironmentUpdateOperation *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    isa = a1[5].super.isa;
    if (!isa)
      isa = a1[4]._initialSpecifier;
    v5 = objc_msgSend(isa, "displayMode");
    if (v5 == 1)
    {
      v6 = -[BLSHPendingEnvironmentUpdateOperation initWithEvents:withInitialSpecifier:]([BLSHPendingEnvironmentUpdateOperation alloc], "initWithEvents:withInitialSpecifier:", v3, 0);
      v7 = *(void **)&a1[3]._started;
      *(_QWORD *)&a1[3]._started = v6;

      v8 = v6;
      -[BLSHPendingEnvironmentUpdateOperation setStarted:](v8, "setStarted:", 1);
      -[BLSHPendingEnvironmentUpdateOperation setUpdatedInitialState:](v8, "setUpdatedInitialState:", 1);
      bls_backlight_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightChangeEvents();
        v10 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v58 = a1;
        v59 = 2114;
        v60 = v8;
        v61 = 2114;
        v62 = v10;
        _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) started pendingEnvironmentUpdate %{public}@, will skip environment update for -> FlipbookSuppressed events:%{public}@", buf, 0x20u);

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __90__BLSHBacklightTransitionStateMachine_onMainWithLock_environmentUpdateOperationForEvents___block_invoke;
      block[3] = &unk_24D1BBE80;
      v11 = v8;
      v53 = v11;
      v54 = a1;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      a1 = v11;
      v12 = v53;
    }
    else
    {
      if (BYTE3(a1[7].super.isa))
      {
        v13 = 1;
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v14 = v3;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v49;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v49 != v17)
                objc_enumerationMutation(v14);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "isEnvironmentTransitionAnimated") & 1) != 0)
              {
                v13 = 1;
                goto LABEL_20;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v16)
              continue;
            break;
          }
        }
        v13 = 0;
LABEL_20:

      }
      if (IsBlankedForBLSBacklightDisplayMode(v5))
      {
        bls_backlight_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)&a1[1]._started, "description");
          v20 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
          NSStringFromBLSBacklightDisplayMode(v5);
          v21 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v58 = a1;
          v59 = 2114;
          v60 = v20;
          v61 = 2114;
          v62 = v21;
          _os_log_impl(&dword_2145AC000, v19, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) did not stop  presentation engine:%{public}@ (displayMode:%{public}@)", buf, 0x20u);

        }
      }
      else
      {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:]((uint64_t)a1, v5);
      }
      objc_msgSend(v3, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (a1[3].super.isa)
      {
        v24 = objc_msgSend(v22, "previousState");
        v25 = a1[3].super.isa;
        v12 = (BLSHPendingEnvironmentUpdateOperation *)v25;
        if (v24 != 1)
        {
          if (v25)
          {
            bls_backlight_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              NSStringFromBLSBacklightChangeEvents();
              v27 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v58 = a1;
              v59 = 2114;
              v60 = v12;
              v61 = 2114;
              v62 = v27;
              _os_log_impl(&dword_2145AC000, v26, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) will discard specifier from presentation engine end:%{public}@ (not needed for events:%{public}@)", buf, 0x20u);

            }
          }

          v12 = 0;
        }
        v28 = a1[3].super.isa;
        a1[3].super.isa = 0;

      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v23, "state");
      IsActive = BLSBacklightStateIsActive();
      v30 = (BLSHPendingEnvironmentUpdateOperation *)*(id *)&a1[3]._started;
      v31 = v30;
      if (v30)
        v32 = v12 == 0;
      else
        v32 = 0;
      if (v32)
        v12 = 0;
      if (v32 && IsActive)
      {
        -[BLSHPendingEnvironmentUpdateOperation initialSpecifier](v30, "initialSpecifier");
        v12 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
      }
      if (!v12)
      {
        if ((IsActive & 1) != 0 || (objc_msgSend(v23, "previousState"), (BLSBacklightStateIsActive() & 1) == 0))
        {
          -[BLSHBacklightTransitionStateMachine onMainWithLock_onScreenSpecifierForDisplayMode:]((uint64_t)a1, -[BLSHPresentationDateSpecifier displayMode](a1[4]._initialSpecifier, "displayMode"));
          v12 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
      }
      v33 = -[BLSHPendingEnvironmentUpdateOperation initWithEvents:withInitialSpecifier:]([BLSHPendingEnvironmentUpdateOperation alloc], "initWithEvents:withInitialSpecifier:", v3, v12);
      v34 = *(void **)&a1[3]._started;
      *(_QWORD *)&a1[3]._started = v33;

      v35 = v33;
      BYTE3(a1[7].super.isa) = v13;
      if ((v13 & 1) == 0)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v36 = v3;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v45;
LABEL_53:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v39)
              objc_enumerationMutation(v36);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v40), "isTransitionForcedUnanimated", (_QWORD)v44))break;
            if (v38 == ++v40)
            {
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
              if (v38)
                goto LABEL_53;
              break;
            }
          }
        }

      }
      bls_backlight_log();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v31)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v58 = a1;
          v59 = 2114;
          v60 = v31;
          v61 = 2114;
          v62 = v35;
          _os_log_impl(&dword_2145AC000, v42, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) replaced pending events:%{public}@ with new events:%{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_environmentUpdateOperationForEvents:].cold.1();
      }

      a1 = v35;
    }

  }
  return a1;
}

- (BOOL)willUnblankTransitioningToDisplayMode:(uint64_t)a1
{
  return a1
      && !IsBlankedForBLSBacklightDisplayMode(a2)
      && IsBlankedForBLSBacklightDisplayMode(objc_msgSend(*(id *)(a1 + 152), "displayMode"));
}

- (id)onMainWithLock_updateSpecifierOperationIfNeeded
{
  id *v1;
  id v2;
  id *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  BLSHPendingUpdateToSpecifier *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  _BOOL4 v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id *v27;
  BOOL v28;
  uint8_t buf[4];
  id *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = a1;
    v3 = a1 + 15;
    v2 = a1[15];
    if (v2)
    {
      if (!objc_msgSend(v2, "isCompleted"))
      {
        bls_backlight_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded].cold.3();
        goto LABEL_16;
      }
      v4 = *v3;
      *v3 = 0;

    }
    v5 = v1[12];
    if (v5)
    {
      v6 = v1[9];
      if (v6 == (id)1)
      {
        objc_msgSend(v1[19], "presentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1[20], "presentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = [BLSHPendingUpdateToSpecifier alloc];
        v10 = v1[12];
        v21 = MEMORY[0x24BDAC760];
        v22 = 3221225472;
        v23 = __86__BLSHBacklightTransitionStateMachine_onMainWithLock_updateSpecifierOperationIfNeeded__block_invoke;
        v24 = &unk_24D1BDE20;
        v28 = v8 != v7;
        v25 = v7;
        v26 = v8;
        v27 = v1;
        v11 = v8;
        v12 = v7;
        objc_msgSend(v10, "filter:", &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[BLSHPendingUpdateToSpecifier initWithSpecifier:](v9, "initWithSpecifier:", v13, v21, v22, v23, v24);
        v15 = v1[15];
        v1[15] = (id)v14;

      }
      else
      {
        v12 = v5;
        bls_backlight_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v30 = v1;
          v31 = 2114;
          v32 = v12;
          v33 = 1024;
          v34 = (int)v6;
          _os_log_impl(&dword_2145AC000, v11, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) will discard specifier from presentation engine end:%{public}@ (no events, currentBacklightState:%u)", buf, 0x1Cu);
        }
      }

      v17 = v1[12];
      v1[12] = 0;

    }
    v18 = *v3;
    bls_backlight_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v19)
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded].cold.2();
LABEL_16:

      a1 = (id *)*v3;
      return a1;
    }
    if (v19)
      -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded].cold.1();

    a1 = 0;
  }
  return a1;
}

uint64_t __86__BLSHBacklightTransitionStateMachine_onMainWithLock_updateSpecifierOperationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsEnvironment:", v3) & 1) != 0
    || *(_BYTE *)(a1 + 56) && (objc_msgSend(*(id *)(a1 + 40), "containsEnvironment:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    bls_backlight_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 40), "bls_shortLoggingString");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR("(same)");
      }
      v12 = 134218754;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_2145AC000, v5, OS_LOG_TYPE_ERROR, "TSM:%p specifier environment:%{public}@ not in presentation:%{public}@ or target:%{public}@", (uint8_t *)&v12, 0x2Au);
      if (v10)

    }
    v4 = 0;
  }

  return v4;
}

uint64_t __90__BLSHBacklightTransitionStateMachine_onMainWithLock_environmentUpdateOperationForEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setCompleted:", 1);
  bls_backlight_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_2145AC000, v2, OS_LOG_TYPE_INFO, "TSM:%p completed pendingEnvironmentUpdate %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 40));
}

- (id)onMainWithLock_updatePresentationOperationIfNeeded
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  id *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  BLSHPendingUpdatePresentation *v11;
  id v12;
  int v14;
  id *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v1 = a1;
  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a1[20], "presentation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[19], "presentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 && (objc_msgSend(v2, "isEqual:", v3) & 1) == 0)
    {
      v11 = -[BLSHPendingUpdatePresentation initWithPresentation:]([BLSHPendingUpdatePresentation alloc], "initWithPresentation:", v2);
      v5 = v1 + 14;
      v12 = v1[14];
      v1[14] = v11;

      bls_backlight_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded].cold.2();
    }
    else
    {
      v5 = v1 + 14;
      v4 = v1[14];
      if (!v4)
      {
LABEL_9:
        bls_backlight_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v14 = 134218498;
          v15 = v1;
          v16 = 2114;
          v17 = v2;
          v18 = 2114;
          v19 = v3;
          _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p (findNextOperation) no updatePresentation operation needed — target:%{public}@ current:%{public}@", (uint8_t *)&v14, 0x20u);
        }

        v1 = 0;
        goto LABEL_17;
      }
      v6 = objc_msgSend(v4, "isCompleted");
      bls_backlight_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
          -[BLSHBacklightTransitionStateMachine onMainWithLock_updatePresentationOperationIfNeeded].cold.1();

        v9 = *v5;
        *v5 = 0;

        goto LABEL_9;
      }
      if (v8)
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updatePresentationOperationIfNeeded].cold.2();
    }

    v1 = (id *)*v5;
LABEL_17:

  }
  return v1;
}

- (_QWORD)lock_displayOperationForCurrentTarget
{
  uint64_t v1;
  void *v2;

  if (a1)
  {
    v1 = (uint64_t)a1;
    v2 = (void *)a1[20];
    if (!v2)
      v2 = *(void **)(v1 + 152);
    -[BLSHBacklightTransitionStateMachine lock_displayOperationForTarget:isNullOperationAllowed:](v1, objc_msgSend(v2, "displayMode"), 1);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)onMainWithLock_updateDisplayOrEngineOperationIfNeeded
{
  void *v2;
  id *v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  int v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = (id *)(a1 + 128);
    v2 = *(void **)(a1 + 128);
    if (v2)
    {
      v4 = objc_msgSend(v2, "isFullyCompleted");
      v5 = *v3;
      if (v4)
      {
        *v3 = 0;

        v5 = *v3;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;
    -[BLSHBacklightTransitionStateMachine lock_displayOperationForCurrentTarget]((_QWORD *)a1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 160);
    if (!v8)
      v8 = *(void **)(a1 + 152);
    v9 = objc_msgSend(v8, "displayMode");
    v10 = IsOffForBLSBacklightDisplayMode(v9);
    v11 = *(void **)(a1 + 104);
    if (v11 && ((objc_msgSend(v11, "isCompleted") | v10) & 1) == 0)
    {
      v12 = objc_msgSend(*(id *)(a1 + 104), "didUpdateInitialState");
      bls_backlight_log();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.6();

        goto LABEL_46;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.5();

    }
    if (*(_QWORD *)(a1 + 112))
      v15 = v10;
    else
      v15 = 1;
    if ((v15 & 1) != 0)
    {
      if (v6 && v6 != v7)
      {
        bls_backlight_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = *(void **)(a1 + 128);
          v35 = 134218242;
          v36 = a1;
          v37 = 2114;
          v38 = v17;
          _os_log_impl(&dword_2145AC000, v16, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) abandoning outdated pending:%{public}@", (uint8_t *)&v35, 0x16u);
        }

        v18 = *v3;
        *v3 = 0;

      }
      objc_storeStrong(v3, v7);
      if (v9 == 2)
      {
        if (objc_msgSend(*(id *)(a1 + 152), "displayMode") == 1)
        {
          -[BLSHBacklightTransitionStateMachine _lock_ensureFlipbookCurrent](a1);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (id)v19;
            bls_backlight_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v35 = 134218498;
              v36 = a1;
              v37 = 2114;
              v38 = v20;
              v39 = 2114;
              v40 = v7;
              _os_log_debug_impl(&dword_2145AC000, v21, OS_LOG_TYPE_DEBUG, "TSM:%p (findNextOperation) will start ensure flipbook current operation %{public}@ and defer %{public}@", (uint8_t *)&v35, 0x20u);
            }
LABEL_56:

            goto LABEL_57;
          }
        }
        if (v7)
        {
          if (v6 != v7)
          {
LABEL_49:
            bls_backlight_log();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.3();

            goto LABEL_52;
          }
          goto LABEL_52;
        }
        -[BLSHBacklightTransitionStateMachine _lock_ensureFlipbookCurrent](a1);
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v20 = (id)v33;
          bls_backlight_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.2();
          goto LABEL_56;
        }
      }
      else
      {
        v23 = *(void **)(a1 + 136);
        if (v23 && (objc_msgSend(v23, "isCompleted") & 1) == 0)
        {
          bls_backlight_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = *(void **)(a1 + 136);
            NSStringFromBLSBacklightDisplayMode(v9);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 134218498;
            v36 = a1;
            v37 = 2114;
            v38 = v25;
            v39 = 2114;
            v40 = v26;
            _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) abandoning ensureFlipbookCurrentOperation %{public}@ because targetDisplayMode=%{public}@", (uint8_t *)&v35, 0x20u);

          }
        }
        v27 = *(void **)(a1 + 136);
        *(_QWORD *)(a1 + 136) = 0;

        if (v7)
        {
          if (v6 != v7)
          {
            -[BLSHBacklightTransitionStateMachine onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:](a1, v9);
            if (IsBlankedForBLSBacklightDisplayMode(objc_msgSend(*(id *)(a1 + 152), "displayMode")))
            {
              -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded]((id *)a1);
              v28 = objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v20 = (id)v28;
                bls_backlight_log();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  NSStringFromBLSBacklightDisplayMode(objc_msgSend(*(id *)(a1 + 152), "displayMode"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromBLSBacklightDisplayMode(v9);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = 134218754;
                  v36 = a1;
                  v37 = 2114;
                  v38 = v20;
                  v39 = 2114;
                  v40 = v30;
                  v41 = 2114;
                  v42 = v31;
                  _os_log_impl(&dword_2145AC000, v29, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) will update to specifier:%{public}@ prior to display mode:%{public}@->%{public}@", (uint8_t *)&v35, 0x2Au);

                }
                goto LABEL_57;
              }
            }
            goto LABEL_49;
          }
LABEL_52:
          v20 = v7;
          goto LABEL_57;
        }
      }
      bls_backlight_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.1();
    }
    else
    {
      bls_backlight_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.4();
    }

LABEL_46:
    v20 = 0;
LABEL_57:

    return v20;
  }
  return 0;
}

- (id)_lock_ensureFlipbookCurrent
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  if (!a1)
  {
LABEL_7:
    v3 = 0;
    return v3;
  }
  v2 = *(id *)(a1 + 136);
  if (!v2)
  {
    +[BLSHEnsureFlipbookCurrentOperation operation](BLSHEnsureFlipbookCurrentOperation, "operation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v5;

    v3 = v5;
    return v3;
  }
  v3 = v2;
  if (objc_msgSend(v2, "isCompleted"))
  {

    *(_BYTE *)(a1 + 230) = 0;
    bls_backlight_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightTransitionStateMachine _lock_ensureFlipbookCurrent].cold.1();

    goto LABEL_7;
  }
  return v3;
}

uint64_t __73__BLSHBacklightTransitionStateMachine_onMain_performNextStepInTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decrementDisablePowerSavingUsageCountForReason:", 2);
}

- (id)setupRampOperationIfNeeded
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    -[BLSHBacklightTransitionStateMachine lock_displayOperationForCurrentTarget]((_QWORD *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
    objc_msgSend(v3, "rampOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_storeStrong((id *)(a1 + 128), v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __73__BLSHBacklightTransitionStateMachine_onMain_performNextStepInTransition__block_invoke_155(uint64_t a1, double a2)
{
  -[BLSHBacklightTransitionStateMachine ifStillValidPerformAlwaysOnBrightnessRamp:withDuration:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2);
}

- (void)ifStillValidPerformAlwaysOnBrightnessRamp:(double)a3 withDuration:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("rampOperation != nil"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightTransitionStateMachine ifStillValidPerformAlwaysOnBrightnessRamp:withDuration:].cold.1();
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145FFC98);
    }
    objc_msgSend(v5, "setReadyToStart:", 1);
    objc_msgSend(v6, "setDuration:", a3);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v7 = *(id *)(a1 + 128);
    v8 = *(void **)(a1 + 160);
    if (!v8)
      v8 = *(void **)(a1 + 152);
    v9 = objc_msgSend(v8, "displayMode");
    objc_msgSend(v7, "rampOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v6)
    {
      objc_msgSend(v6, "last");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "targetDisplayMode") == v9;

    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(v7, "first");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (objc_msgSend(v6, "isStarted"))
    {
      bls_backlight_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v22 = a1;
        v23 = 2114;
        v24 = *(double *)&v6;
        v15 = "TSM:%p nothing do here since rampOperation has already started:%{public}@";
        v16 = v14;
        v17 = 22;
LABEL_21:
        _os_log_impl(&dword_2145AC000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
    else if (v11)
    {
      if (v13 == v6 || (objc_msgSend(v13, "isCompleted") & 1) != 0)
      {
        bls_backlight_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v22 = a1;
          v23 = 2048;
          v24 = a3;
          v25 = 2114;
          v26 = v6;
          _os_log_debug_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEBUG, "TSM:%p performing brightness ramp with duration:%.2lfs using operation:%{public}@", buf, 0x20u);
        }

        objc_msgSend(v6, "setStarted:", 1);
        bls_backlight_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v22 = a1;
          v23 = 2114;
          v24 = *(double *)&v6;
          _os_log_impl(&dword_2145AC000, v19, OS_LOG_TYPE_INFO, "TSM:%p started rampOperation %{public}@", buf, 0x16u);
        }

        objc_msgSend(v6, "targetDisplayMode");
        -[BLSHBacklightTransitionStateMachine setDisplayMode:withRampDuration:](a1);
        goto LABEL_23;
      }
      bls_backlight_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v22 = a1;
        v23 = 2048;
        v24 = a3;
        v25 = 2114;
        v26 = v7;
        _os_log_debug_impl(&dword_2145AC000, v14, OS_LOG_TYPE_DEBUG, "TSM:%p waiting to perform brightness ramp with duration:%.2lfs using operation:%{public}@", buf, 0x20u);
      }
    }
    else
    {
      bls_backlight_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        v22 = a1;
        v23 = 2048;
        v24 = a3;
        v25 = 2114;
        v26 = v6;
        v27 = 2114;
        v28 = v7;
        v15 = "TSM:%p not performing brightness ramp with duration:%.2lfs using operation:%{public}@ because display oper"
              "ation has changed to operation:%{public}@";
        v16 = v14;
        v17 = 42;
        goto LABEL_21;
      }
    }

LABEL_23:
  }

}

- (void)environmentStateMachineDidBeginUpdateToState:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = (void *)objc_msgSend(*(id *)(a1 + 184), "copy");
    v6 = (void *)objc_msgSend(*(id *)(a1 + 192), "copy");
    objc_msgSend(*(id *)(a1 + 104), "triggerEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*(_QWORD *)(a1 + 104))
      v9 = objc_msgSend(v7, "state") == a2;
    else
      v9 = 0;
    bls_backlight_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBLSBacklightState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 104);
      NSStringFromBLSBacklightChangeEvents();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v17 = a1;
      v18 = 2114;
      v19 = v11;
      v20 = 1024;
      v21 = v9;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v12;
      _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p didBeginUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@ events:%{public}@", buf, 0x30u);

    }
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 104), "setUpdatedInitialState:", 1);
      os_unfair_lock_unlock(v4);
      v14 = v5;
      v15 = v6;
      BSDispatchMain();

    }
    else
    {
      os_unfair_lock_unlock(v4);
    }

  }
}

- (void)environmentStateMachineDidCompleteUpdateToState:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v5 = *(void **)(a1 + 104);
    if (v5)
    {
      objc_msgSend(v5, "triggerEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state") == a2;

    }
    else
    {
      v7 = 0;
    }
    bls_backlight_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBLSBacklightState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 104);
      *(_DWORD *)buf = 134218754;
      v14 = a1;
      v15 = 2114;
      v16 = v11;
      v17 = 1024;
      v18 = v7;
      v19 = 2114;
      v20 = v12;
      _os_log_debug_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEBUG, "TSM:%p environmentStateMachine didCompleteUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@ ", buf, 0x26u);

    }
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 104), "setCompleted:", 1);
      bls_backlight_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(void **)(a1 + 104);
        *(_DWORD *)buf = 134218242;
        v14 = a1;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "TSM:%p completed pendingEnvironmentUpdate %{public}@", buf, 0x16u);
      }

      os_unfair_lock_unlock(v4);
      BSDispatchMain();
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

- (void)environmentStateMachine:(id)a3 didBeginUpdateToState:(int64_t)a4
{
  -[BLSHBacklightTransitionStateMachine environmentStateMachineDidBeginUpdateToState:]((uint64_t)self, a4);
}

void __84__BLSHBacklightTransitionStateMachine_environmentStateMachineDidBeginUpdateToState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "performerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backlight:didUpdateVisualContentsToBeginTransitionToState:forEvents:abortedEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (os_unfair_lock_s *)(v3 + 8);
  v5 = *(id *)(v3 + 144);
  os_unfair_lock_unlock(v4);
  objc_msgSend(v5, "updaterDidBeginUpdateToBacklightState:", *(_QWORD *)(a1 + 56));
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));

}

- (void)environmentStateMachine:(id)a3 didCompleteUpdateToState:(int64_t)a4
{
  -[BLSHBacklightTransitionStateMachine environmentStateMachineDidCompleteUpdateToState:]((uint64_t)self, a4);
}

uint64_t __87__BLSHBacklightTransitionStateMachine_environmentStateMachineDidCompleteUpdateToState___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)environmentStateMachine:(id)a3 didUpdateToPresentation:(id)a4
{
  BLSHPendingUpdatePresentation *v5;
  BLSHPendingUpdatePresentation *lock_pendingUpdatePresentation;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  BLSHPendingUpdatePresentation *v11;
  BLSHBacklightInactiveEnvironmentSession *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  BLSHPendingUpdatePresentation *v17;
  BLSHBacklightInactiveEnvironmentSession *v18;
  BLSHPendingUpdatePresentation *v19;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v21;
  __int16 v22;
  BLSHPendingUpdatePresentation *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  BLSHPendingUpdatePresentation *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (BLSHPendingUpdatePresentation *)a4;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingUpdatePresentation = self->_lock_pendingUpdatePresentation;
  if (lock_pendingUpdatePresentation
    && (-[BLSHPendingUpdatePresentation presentation](lock_pendingUpdatePresentation, "presentation"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v5),
        v7,
        v8))
  {
    v9 = 1;
    -[BLSHPendingUpdatePresentation setCompleted:](self->_lock_pendingUpdatePresentation, "setCompleted:", 1);
    bls_backlight_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_lock_pendingUpdatePresentation;
      *(_DWORD *)buf = 134218242;
      v21 = self;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_2145AC000, v10, OS_LOG_TYPE_INFO, "TSM:%p completed pendingUpdatePresentation %{public}@", buf, 0x16u);
    }

    self->_lock_flipbookIsStale = 1;
  }
  else
  {
    v9 = 0;
  }
  v12 = self->_lock_session;
  -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, v12);
  bls_backlight_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightDisplayMode(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_lock_pendingUpdatePresentation;
    *(_DWORD *)buf = 134219010;
    v21 = self;
    v22 = 2114;
    v23 = v5;
    v24 = 1024;
    v25 = v9;
    v26 = 2114;
    v27 = v16;
    v28 = 2114;
    v29 = v17;
    _os_log_debug_impl(&dword_2145AC000, v15, OS_LOG_TYPE_DEBUG, "TSM:%p didUpdateToPresentation:%{public}@ matchesPendingUpdate:%{BOOL}u targetDisplayMode:%{public}@ pending:%{public}@", buf, 0x30u);

  }
  objc_msgSend(v13, "setDisplayMode:", v14);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    v18 = v12;
    v19 = v5;
    BSDispatchMain();

  }
}

void __87__BLSHBacklightTransitionStateMachine_environmentStateMachine_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updaterDidUpdateToPresentation:", *(_QWORD *)(a1 + 40));
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 48));
}

- (void)environmentStateMachine:(id)a3 didUpdateToSpecifier:(id)a4
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  BLSHPendingUpdateToSpecifier *v11;
  BLSHPendingUpdateToSpecifier *lock_pendingUpdateToSpecifier;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v14;
  __int16 v15;
  BLSHPendingUpdateToSpecifier *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  BLSHPendingUpdateToSpecifier *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (unint64_t)a4;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHPendingUpdateToSpecifier specifier](self->_lock_pendingUpdateToSpecifier, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)v6;
  if (self->_lock_pendingUpdateToSpecifier)
    v8 = (objc_msgSend(v6, "isEqual:", v5) & 1) != 0 || (v5 | v7) == 0;
  else
    v8 = 0;
  bls_backlight_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    lock_pendingUpdateToSpecifier = self->_lock_pendingUpdateToSpecifier;
    *(_DWORD *)buf = 134218754;
    v14 = self;
    v15 = 2114;
    v16 = (BLSHPendingUpdateToSpecifier *)v5;
    v17 = 1024;
    v18 = v8;
    v19 = 2114;
    v20 = lock_pendingUpdateToSpecifier;
    _os_log_debug_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEBUG, "TSM:%p didUpdateToSpecifier:%{public}@ matchesPendingUpdate:%{BOOL}u pending:%{public}@", buf, 0x26u);
  }

  if (v8)
  {
    -[BLSHPendingUpdateToSpecifier setCompleted:](self->_lock_pendingUpdateToSpecifier, "setCompleted:", 1);
    bls_backlight_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = self->_lock_pendingUpdateToSpecifier;
      *(_DWORD *)buf = 134218242;
      v14 = self;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_2145AC000, v10, OS_LOG_TYPE_INFO, "TSM:%p completed pendingUpdateToSpecifier %{public}@", buf, 0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
    BSDispatchMain();
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

void __84__BLSHBacklightTransitionStateMachine_environmentStateMachine_didUpdateToSpecifier___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)inactiveEnvironmentSession:(id)a3 updateToPresentation:(id)a4
{
  BLSHBacklightInactiveEnvironmentSession *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  BLSHBacklightInactiveEnvironmentSession *v21;
  BLSHBacklightInactiveEnvironmentSession *lock_session;
  void *v23;
  const char *v24;
  BLSHBacklightDisplayStateMachine *v25;
  void *v26;
  void *v27;
  BLSHBacklightInactiveEnvironmentSession *v28;
  BLSHBacklightInactiveEnvironmentSession *v29;
  void *v30;
  BLSHBacklightDisplayStateMachine *v31;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v33;
  __int16 v34;
  BLSHBacklightInactiveEnvironmentSession *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_session == v6)
  {
    if (!self->_environmentStateMachine)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("session:%@ exists but no environment state machine"), v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightTransitionStateMachine inactiveEnvironmentSession:updateToPresentation:].cold.1();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x214600AFCLL);
    }
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, self->_lock_session);
    -[BLSHBacklightTransitionStateMachine _lock_updateCacheFlipbookWithSession:]((uint64_t)self, self->_lock_session);
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if (!v12)
      goto LABEL_21;
    objc_msgSend(v9, "presentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "differenceFromPresentation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "hasChanges"))
    {
      bls_backlight_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightDisplayMode(v10);
        v21 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v33 = self;
        v34 = 2114;
        v35 = v21;
        v36 = 2114;
        v37 = (uint64_t)v9;
        _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_INFO, "TSM:%p updateToPresentation (redundant) displayMode:%{public}@ previousTarget:%{public}@", buf, 0x20u);

      }
      goto LABEL_20;
    }
    objc_msgSend(v14, "insertions");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject count](v15, "count");
    v30 = v16;
    if (objc_msgSend(v16, "count"))
    {
      bls_backlight_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (v19)
        {
          -[NSObject bs_map:](v15, "bs_map:", &__block_literal_global_173);
          v28 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "bs_map:", &__block_literal_global_174);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromBLSBacklightDisplayMode(v10);
          *(_DWORD *)buf = 134219010;
          v33 = self;
          v34 = 2114;
          v35 = v28;
          v36 = 2114;
          v37 = (uint64_t)v27;
          v38 = 2114;
          v39 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v39;
          v40 = 2114;
          v41 = v9;
          _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "TSM:%p updateToPresentation by adding:%{public}@ and removing:%{public}@ displayMode:%{public}@ previousTarget:%{public}@", buf, 0x34u);

        }
        goto LABEL_19;
      }
      if (v19)
      {
        objc_msgSend(v30, "bs_map:", &__block_literal_global_171);
        v29 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightDisplayMode(v10);
        *(_DWORD *)buf = 134218754;
        v33 = self;
        v34 = 2114;
        v35 = v29;
        v36 = 2114;
        v37 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v37;
        v38 = 2114;
        v39 = (uint64_t)v9;
        v24 = "TSM:%p updateToPresentation by removing:%{public}@ displayMode:%{public}@ previousTarget:%{public}@";
        goto LABEL_18;
      }
    }
    else
    {
      bls_backlight_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        -[NSObject bs_map:](v15, "bs_map:", &__block_literal_global_169);
        v29 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightDisplayMode(v10);
        *(_DWORD *)buf = 134218754;
        v33 = self;
        v34 = 2114;
        v35 = v29;
        v36 = 2114;
        v37 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v37;
        v38 = 2114;
        v39 = (uint64_t)v9;
        v24 = "TSM:%p updateToPresentation by adding:%{public}@ displayMode:%{public}@ previousTarget:%{public}@";
LABEL_18:
        _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, v24, buf, 0x2Au);

      }
    }
LABEL_19:

LABEL_20:
LABEL_21:
    objc_msgSend(v9, "setDisplayMode:", v10);
    objc_msgSend(v9, "setPresentation:", v7);
    -[BLSHBacklightTransitionStateMachine lock_isHighLuminanceAlwaysOnWithSession:]((uint64_t)self, v6);

    os_unfair_lock_unlock(&self->_lock);
    v31 = self->_displayStateMachine;
    v25 = v31;
    BSDispatchMain();

    goto LABEL_22;
  }
  bls_backlight_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    lock_session = self->_lock_session;
    *(_DWORD *)buf = 134218754;
    v33 = self;
    v34 = 2114;
    v35 = v6;
    v36 = 2114;
    v37 = (uint64_t)lock_session;
    v38 = 2114;
    v39 = (uint64_t)v7;
    _os_log_error_impl(&dword_2145AC000, v8, OS_LOG_TYPE_ERROR, "TSM:%p updated presentation on invalid session:%{public}@ currentSession:%{public}@ new presentation:%{public}@", buf, 0x2Au);
  }

  os_unfair_lock_unlock(&self->_lock);
LABEL_22:

}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_170(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_172(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_175(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHighLuminanceAlwaysOn:", *(unsigned __int8 *)(a1 + 48));
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 40));
}

- (BOOL)isGlobalUnrestrictedFramerate
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_globalUnrestrictedFramerate;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobalUnrestrictedFramerate:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 v6;
  int64_t lock_backlightState;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  BLSHBacklightMutableTargetState *lock_targetState;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BLSHBacklightMutableTargetState *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_globalUnrestrictedFramerate == v3)
  {
    v6 = 0;
  }
  else
  {
    lock_backlightState = self->_lock_backlightState;
    v6 = lock_backlightState == 1;
    if (lock_backlightState == 1 && v3)
    {
      -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
      v6 = 1;
    }
  }
  self->_lock_globalUnrestrictedFramerate = v3;
  if (self->_lock_targetState)
  {
    v9 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, self->_lock_session);
    bls_backlight_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBLSBacklightDisplayMode(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      lock_targetState = self->_lock_targetState;
      *(_DWORD *)buf = 134218754;
      v14 = self;
      v15 = 1024;
      v16 = v3;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = lock_targetState;
      _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p setGlobalUnrestrictedFramerate:%{BOOL}u targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x26u);

    }
    -[BLSHBacklightMutableTargetState setDisplayMode:](self->_lock_targetState, "setDisplayMode:", v9);
  }
  os_unfair_lock_unlock(p_lock);
  if (v6)
    BSDispatchMain();
}

void __70__BLSHBacklightTransitionStateMachine_setGlobalUnrestrictedFramerate___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (BOOL)isGlobalHighLuminanceAlwaysOn
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_globalHighLuminanceAlwaysOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobalHighLuminanceAlwaysOn:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_globalHighLuminanceAlwaysOn;
  BLSHBacklightDisplayStateMachine *v8;
  BLSHBacklightDisplayStateMachine *v9;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_globalHighLuminanceAlwaysOn = self->_lock_globalHighLuminanceAlwaysOn;
  self->_lock_globalHighLuminanceAlwaysOn = v3;
  -[BLSHBacklightTransitionStateMachine lock_isHighLuminanceAlwaysOnWithSession:]((uint64_t)self, self->_lock_session);
  if (lock_globalHighLuminanceAlwaysOn != v3 && v3 != 0)
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  if (lock_globalHighLuminanceAlwaysOn != v3)
  {
    v9 = self->_displayStateMachine;
    v8 = v9;
    BSDispatchMain();

  }
}

uint64_t __70__BLSHBacklightTransitionStateMachine_setGlobalHighLuminanceAlwaysOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighLuminanceAlwaysOn:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)globalCacheFlipbookOnDisplayWake
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_globalCacheFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobalCacheFlipbookOnDisplayWake:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_globalCacheFlipbook;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_globalCacheFlipbook = self->_lock_globalCacheFlipbook;
  self->_lock_globalCacheFlipbook = v3;
  if (lock_globalCacheFlipbook == v3)
    goto LABEL_7;
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v10 = self;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "TSM:%p new globalCacheFlipbook:%{BOOL}u", buf, 0x12u);
  }

  if (-[BLSHBacklightTransitionStateMachine _lock_updateCacheFlipbookWithSession:]((uint64_t)self, self->_lock_session)&& self->_lock_session)
  {
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    os_unfair_lock_unlock(p_lock);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__BLSHBacklightTransitionStateMachine_setGlobalCacheFlipbookOnDisplayWake___block_invoke;
    block[3] = &unk_24D1BC268;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
LABEL_7:
    os_unfair_lock_unlock(p_lock);
  }
}

void __75__BLSHBacklightTransitionStateMachine_setGlobalCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)hostEnvironment:(id)a3 hostDidSetAlwaysOnEnabledForEnvironment:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
  -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, self->_lock_session);
  bls_backlight_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightDisplayMode(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v13 = self;
    v14 = 1024;
    v15 = v4;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "TSM:%p hostDidSetAlwaysOnEnabled:%{BOOL}u forEnvironment:%{public}@ targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x30u);

  }
  objc_msgSend(v7, "setDisplayMode:", v8);
  os_unfair_lock_unlock(&self->_lock);
  BSDispatchMain();

}

void __95__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)hostEnvironment:(id)a3 hostDidSetLiveUpdating:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightAggregateState presentation](self->_currentState, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsEnvironment:", v6))
  {

LABEL_4:
    if (v4)
      -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, self->_lock_session);
    bls_backlight_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightDisplayMode(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v20 = self;
      v21 = 1024;
      v22 = v4;
      v23 = 2114;
      v24 = v13;
      v25 = 2114;
      v26 = v14;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "TSM:%p hostDidSetLiveUpdating:%{BOOL}u forEnvironment:%{public}@ targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x30u);

    }
    objc_msgSend(v10, "setDisplayMode:", v11);

    os_unfair_lock_unlock(&self->_lock);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __78__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetLiveUpdating___block_invoke;
    v17[3] = &unk_24D1BBE80;
    v17[4] = self;
    v18 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);

    goto LABEL_12;
  }
  -[BLSHBacklightMutableTargetState presentation](self->_lock_targetState, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsEnvironment:", v6);

  if (v9)
    goto LABEL_4;
  bls_backlight_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = self;
    v21 = 1024;
    v22 = v4;
    v23 = 2114;
    v24 = v16;
    _os_log_debug_impl(&dword_2145AC000, v15, OS_LOG_TYPE_DEBUG, "TSM:%p hostDidSetLiveUpdating:%{BOOL}u forEnvironment:%{public}@ but not in presentation", buf, 0x1Cu);

  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_12:

}

void __78__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetLiveUpdating___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_updateHostEnvironmentAndPerformNextStep:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)onMain_updateHostEnvironmentAndPerformNextStep:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  id v5;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 8);
    v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = *(id *)(a1 + 32);
    os_unfair_lock_unlock(v3);
    objc_msgSend(v5, "updateEnvironment:", v4);

    -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](a1);
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightAggregateState presentation](self->_currentState, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsEnvironment:", v6))
  {

LABEL_4:
    if (v4)
      -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:session:]((uint64_t)self, self->_lock_backlightState, self->_lock_session);
    bls_backlight_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightDisplayMode(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bls_shortLoggingString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v21 = self;
      v22 = 1024;
      v23 = v4;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      v28 = 2114;
      v29 = v15;
      _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "TSM:%p hostDidSetUnrestrictedFramerateUpdates:%{BOOL}u forEnvironment:%{public}@ targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x30u);

    }
    objc_msgSend(v10, "setDisplayMode:", v11);

    os_unfair_lock_unlock(&self->_lock);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __94__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke;
    v18[3] = &unk_24D1BBE80;
    v18[4] = self;
    v19 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

    goto LABEL_12;
  }
  -[BLSHBacklightMutableTargetState presentation](self->_lock_targetState, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsEnvironment:", v6);

  if (v9)
    goto LABEL_4;
  bls_backlight_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v21 = self;
    v22 = 1024;
    v23 = v4;
    v24 = 2114;
    v25 = v17;
    _os_log_debug_impl(&dword_2145AC000, v16, OS_LOG_TYPE_DEBUG, "TSM:%p hostDidSetUnrestrictedFramerateUpdates:%{BOOL}u forEnvironment:%{public}@ but not in presentation", buf, 0x1Cu);

  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_12:

}

void __94__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_updateHostEnvironmentAndPerformNextStep:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  _QWORD block[5];

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = !self->_lock_flipbookIsStale && self->_lock_session != 0;
  self->_lock_flipbookIsStale = 1;
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightTransitionStateMachine hostEnvironment:invalidateContentForReason:].cold.1();

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__BLSHBacklightTransitionStateMachine_hostEnvironment_invalidateContentForReason___block_invoke;
    block[3] = &unk_24D1BC268;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __82__BLSHBacklightTransitionStateMachine_hostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)hostEnvironment:(id)a3 hostDidSetCacheFlipbookOnDisplayWake:(BOOL)a4
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightInactiveEnvironmentSession *lock_session;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BLSHBacklightTransitionStateMachine _lock_updateCacheFlipbookWithSession:]((uint64_t)self, self->_lock_session))
  {
    lock_session = self->_lock_session;
    os_unfair_lock_unlock(p_lock);
    if (lock_session)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetCacheFlipbookOnDisplayWake___block_invoke;
      block[3] = &unk_24D1BC268;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

void __92__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (BOOL)hostEnvironment:(id)a3 didAmendSceneSettings:(id)a4
{
  id v6;
  id v7;
  int v8;
  int64_t lock_backlightState;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  os_log_t log;
  os_log_t loga;
  NSObject *logb;
  char v60;
  char v61;
  void *v62;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  NSObject *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = objc_msgSend(v7, "isForeground");
  if (v8)
    lock_backlightState = self->_lock_backlightState;
  else
    lock_backlightState = 2;
  -[BLSHBacklightAggregateState presentation](self->_currentState, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BLSHBacklightTransitionStateMachine withLock_isTransitioning]((_BOOL8)self);
  os_unfair_lock_unlock(&self->_lock);
  v12 = objc_msgSend(v10, "containsEnvironment:", v6);
  objc_msgSend(v6, "presentationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bls_presentationDate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
    v14 = BSEqualObjects();
  else
    v14 = 1;
  v15 = (v8 | v11) & v12;
  LODWORD(v16) = v14 & ~v15;
  if ((_DWORD)v16 == 1)
  {
    BLSVisualStateForBacklightStateAndSettings(lock_backlightState, v7, v6, self->_inactiveBudgetPolicy, self->_osInterfaceProvider);
    v17 = objc_claimAutoreleasedReturnValue();
    bls_backlight_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bls_shortLoggingString](v17, "bls_shortLoggingString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bls_shortLoggingString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "visualState");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bls_shortLoggingString");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentationDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bls_shortLoggingString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bls_visualState");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bls_shortLoggingString");
      v51 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bls_presentationDate");
      log = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bls_shortLoggingString");
      v54 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220546;
      v64 = self;
      v65 = 2114;
      v66 = v48;
      v67 = 2114;
      v68 = v45;
      v69 = 2114;
      v70 = (uint64_t)v18;
      v71 = 1024;
      v72 = v8;
      v73 = 1024;
      v74 = v12;
      v75 = 2114;
      v76 = v37;
      v77 = 2114;
      v78 = v35;
      v79 = 2114;
      v80 = v33;
      v81 = 2114;
      v82 = v19;
      v83 = 2114;
      v84 = v21;
      _os_log_impl(&dword_2145AC000, v16, OS_LOG_TYPE_INFO, "TSM:%p will amend scene %{public}@ for backlightState:%{public}@ with visualState:%{public}@ – willBeForeground:%{BOOL}u containsEnv:%{BOOL}u presentation:%{public}@ oldVisualState:%{public}@ oldPresentationDate:%{public}@ settingsVisualState:%{public}@ settingsPresentationDate:%{public}@", buf, 0x68u);

      v17 = log;
      v10 = v54;

      v13 = v51;
    }

    objc_msgSend(v7, "bls_setVisualState:", v17);
    objc_msgSend(v7, "bls_setPresentationDate:", 0);
    LOBYTE(v16) = 1;
  }
  else
  {
    v49 = v12;
    bls_backlight_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if ((v15 & 1) != 0)
    {
      v17 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bls_visualState");
        v52 = v13;
        loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject bls_shortLoggingString](loga, "bls_shortLoggingString");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bls_shortLoggingString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "visualState");
        v55 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bls_shortLoggingString");
        v60 = (char)v16;
        v16 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219778;
        v64 = self;
        v65 = 2114;
        v66 = v46;
        v67 = 2114;
        v68 = v50;
        v69 = 2114;
        v70 = v23;
        v26 = (void *)v23;
        v71 = 1024;
        v72 = v8;
        v73 = 1024;
        v74 = 1;
        v75 = 2114;
        v76 = v24;
        v77 = 2114;
        v78 = v16;
        _os_log_debug_impl(&dword_2145AC000, v17, OS_LOG_TYPE_DEBUG, "TSM:%p will not amend scene %{public}@ for backlightState:%{public}@ with settingsVisualState:%{public}@ willBeForeground:%{BOOL}u containsEnv:%{BOOL}u presentation:%{public}@ oldVisualState:%{public}@", buf, 0x4Au);

        v10 = v55;
        v13 = v52;

        LOBYTE(v16) = v60;
      }
    }
    else
    {
      v17 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        BLSVisualStateForBacklightStateAndSettings(lock_backlightState, v7, v6, self->_inactiveBudgetPolicy, self->_osInterfaceProvider);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bls_shortLoggingString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bls_shortLoggingString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "visualState");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bls_shortLoggingString");
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "presentationDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bls_shortLoggingString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bls_visualState");
        v61 = (char)v16;
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject bls_shortLoggingString](v16, "bls_shortLoggingString");
        logb = v17;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bls_presentationDate");
        v56 = v10;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bls_shortLoggingString");
        v53 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134220546;
        v64 = self;
        v65 = 2114;
        v66 = v47;
        v67 = 2114;
        v68 = v44;
        v69 = 2114;
        v70 = (uint64_t)v27;
        v71 = 1024;
        v72 = v8;
        v73 = 1024;
        v74 = v49;
        v75 = 2114;
        v76 = v36;
        v77 = 2114;
        v78 = v28;
        v79 = 2114;
        v80 = v34;
        v81 = 2114;
        v82 = v29;
        v83 = 2114;
        v84 = v31;
        _os_log_impl(&dword_2145AC000, logb, OS_LOG_TYPE_INFO, "TSM:%p would have (but will not) amend scene %{public}@ for backlightState:%{public}@ with visualState:%{public}@ – willBeForeground:%{BOOL}u containsEnv:%{BOOL}u presentation:%{public}@ oldVisualState:%{public}@ oldPresentationDate:%{public}@ settingsVisualState:%{public}@ settingsPresentationDate:%{public}@", buf, 0x68u);

        v10 = v56;
        LOBYTE(v16) = v61;

        v13 = v53;
        v17 = logb;

      }
    }
  }

  return (char)v16;
}

- (void)presentationEngine:(id)a3 didUpdateToCurrentWithSpecifier:(id)a4
{
  id v5;
  BLSHEnsureFlipbookCurrentOperation *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v15;
  __int16 v16;
  BLSHEnsureFlipbookCurrentOperation *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_ensureFlipbookCurrentOperation;
  -[BLSHEnsureFlipbookCurrentOperation setCompleted:](v6, "setCompleted:", 1);
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  bls_backlight_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (!v10)
      goto LABEL_7;
    *(_DWORD *)buf = 134218498;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v5;
    v11 = "TSM:%p completed ensureFlipbookCurrentOperation %{public}@, flipbook did update to current with:%{public}@";
    v12 = v9;
    v13 = 32;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    *(_DWORD *)buf = 134218242;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    v11 = "TSM:%p completed ensureFlipbookCurrentOperation %{public}@";
    v12 = v9;
    v13 = 22;
  }
  _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
LABEL_7:

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
    BSDispatchMain();

}

void __90__BLSHBacklightTransitionStateMachine_presentationEngine_didUpdateToCurrentWithSpecifier___block_invoke(uint64_t a1)
{
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (void)displayState:(id)a3 didUpdateToMode:(int64_t)a4
{
  int64_t *p_lock_lastNotifiedCompletedDisplayMode;
  unint64_t lock_lastNotifiedCompletedDisplayMode;
  int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;
  BLSHBacklightMutableTargetState *lock_targetState;
  char v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BLSHPendingUpdateDisplayMode *lock_pendingUpdateDisplayMode;
  void *v36;
  int v37;
  void *v38;
  _BOOL4 v39;
  int v40;
  void *v41;
  os_unfair_lock_t lock;
  uint8_t buf[4];
  BLSHBacklightTransitionStateMachine *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  _BYTE v48[14];
  __int16 v49;
  int v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  int v54;
  __int16 v55;
  BLSHPendingUpdateDisplayMode *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_didNotifyDisplayModeTransitionStartedButNotCompleted
    && self->_lock_lastNotifiedTargetDisplayMode == a4)
  {
    p_lock_lastNotifiedCompletedDisplayMode = &self->_lock_lastNotifiedCompletedDisplayMode;
    lock_lastNotifiedCompletedDisplayMode = self->_lock_lastNotifiedCompletedDisplayMode;
    self->_lock_didNotifyDisplayModeTransitionStartedButNotCompleted = 0;
    v10 = lock_lastNotifiedCompletedDisplayMode != a4;
LABEL_9:
    *p_lock_lastNotifiedCompletedDisplayMode = a4;
    v9 = 1;
    goto LABEL_10;
  }
  p_lock_lastNotifiedCompletedDisplayMode = &self->_lock_lastNotifiedCompletedDisplayMode;
  lock_lastNotifiedCompletedDisplayMode = self->_lock_lastNotifiedCompletedDisplayMode;
  if (lock_lastNotifiedCompletedDisplayMode != a4)
  {
    v10 = 1;
    goto LABEL_9;
  }
  v9 = 0;
  v10 = 0;
  lock_lastNotifiedCompletedDisplayMode = a4;
LABEL_10:
  -[BLSHPendingUpdateDisplayMode updateOperation](self->_lock_pendingUpdateDisplayMode, "updateOperation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_lock_pendingUpdateDisplayMode && objc_msgSend(v11, "targetDisplayMode") == a4)
  {
    objc_msgSend(v12, "setCompleted:", 1);
    v13 = objc_msgSend(v12, "currentDisplayMode");
    bls_backlight_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode)))
    {
      NSStringFromBLSBacklightDisplayMode(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v44 = self;
      v45 = 2114;
      v46 = v12;
      v47 = 1024;
      *(_DWORD *)v48 = v13 == lock_lastNotifiedCompletedDisplayMode;
      *(_WORD *)&v48[4] = 2114;
      *(_QWORD *)&v48[6] = v15;
      _os_log_impl(&dword_2145AC000, v14, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode), "TSM:%p completed updateOperation:%{public}@ modeMatches:%{BOOL}u lastNotifiedMode:%{public}@", buf, 0x26u);

    }
    LODWORD(v16) = 1;
  }
  else
  {
    LODWORD(v16) = 0;
    v13 = lock_lastNotifiedCompletedDisplayMode;
  }
  -[BLSHPendingUpdateDisplayMode rampOperation](self->_lock_pendingUpdateDisplayMode, "rampOperation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v41 = v12;
  v40 = v16;
  if (v17 && objc_msgSend(v17, "targetDisplayMode") == a4)
  {
    objc_msgSend(v18, "setCompleted:", 1);
    v13 = objc_msgSend(v12, "currentDisplayMode");
    bls_backlight_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode)))
    {
      NSStringFromBLSBacklightDisplayMode(v13);
      v37 = v9;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v44 = self;
      v45 = 2114;
      v46 = v12;
      v47 = 1024;
      *(_DWORD *)v48 = v13 == lock_lastNotifiedCompletedDisplayMode;
      *(_WORD *)&v48[4] = 2114;
      *(_QWORD *)&v48[6] = v19;
      _os_log_impl(&dword_2145AC000, (os_log_t)v16, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode), "TSM:%p completed rampOperation:%{public}@ modeMatches:%{BOOL}u lastNotifiedMode:%{public}@", buf, 0x26u);

      v9 = v37;
    }

    v20 = 1;
    LOBYTE(v16) = v40;
  }
  else
  {
    v20 = 0;
  }
  if (v10)
    v21 = lock_lastNotifiedCompletedDisplayMode;
  else
    v21 = v13;
  if (v9)
    lock_lastNotifiedCompletedDisplayMode = v21;
  lock_targetState = self->_lock_targetState;
  if (!lock_targetState)
    goto LABEL_32;
  v23 = (v16 | v20) ^ 1;
  if (!self->_lock_pendingUpdateDisplayMode)
    v23 = 1;
  if ((v23 & 1) != 0)
  {
LABEL_32:
    v24 = v9;
    v39 = 0;
  }
  else
  {
    v24 = v9;
    v25 = -[BLSHBacklightMutableTargetState displayMode](lock_targetState, "displayMode");
    -[BLSHPendingUpdateDisplayMode last](self->_lock_pendingUpdateDisplayMode, "last");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v25 == objc_msgSend(v26, "targetDisplayMode");

  }
  v27 = (void *)-[NSMutableArray copy](self->_lock_activeEvents, "copy");
  v28 = (void *)-[NSMutableArray copy](self->_lock_abortedEvents, "copy");
  bls_backlight_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightDisplayMode(a4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightDisplayMode(lock_lastNotifiedCompletedDisplayMode);
    v32 = objc_claimAutoreleasedReturnValue();
    lock_pendingUpdateDisplayMode = self->_lock_pendingUpdateDisplayMode;
    v36 = (void *)v32;
    NSStringFromBLSBacklightChangeEvents();
    v33 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134220034;
    v44 = self;
    v45 = 2114;
    v46 = v38;
    v47 = 2114;
    *(_QWORD *)v48 = v36;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)&v48[10] = v40;
    v49 = 1024;
    v50 = v20;
    v51 = 1024;
    v52 = v39;
    v53 = 1024;
    v54 = v24;
    v55 = 2114;
    v56 = lock_pendingUpdateDisplayMode;
    v57 = 2114;
    v34 = (void *)v33;
    v58 = v33;
    _os_log_debug_impl(&dword_2145AC000, v29, OS_LOG_TYPE_DEBUG, "TSM:%p didUpdateToMode:%{public}@ fromMode:%{public}@ matchesUpdate:%{BOOL}u matchesRamp:%{BOOL}u matchesTargetDisplayMode:%{BOOL}u shouldNotify:%{BOOL}u update:%{public}@ events:%{public}@", buf, 0x4Cu);

  }
  os_unfair_lock_unlock(lock);
  v30 = v28;
  v31 = v27;
  BSDispatchMain();

}

void __68__BLSHBacklightTransitionStateMachine_displayState_didUpdateToMode___block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "performerDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backlight:didUpdateToDisplayMode:fromDisplayMode:activeEvents:abortedEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  if (*(_BYTE *)(a1 + 73))
    -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(_QWORD *)(a1 + 32));
}

- (BOOL)hasEnsureFlipbookCurrent
{
  BLSHBacklightTransitionStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_ensureFlipbookCurrentOperation != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)abortContextForTimer:(id)a3
{
  void *v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  BLSHBacklightTransitionStateMachineAbortContext *v9;
  BLSHBacklightAggregateState *currentState;
  NSMutableArray *lock_abortedEvents;
  BLSHPendingEnvironmentUpdateOperation *lock_pendingEnvironmentUpdate;
  BLSHPendingUpdatePresentation *lock_pendingUpdatePresentation;
  BLSHEnsureFlipbookCurrentOperation *lock_ensureFlipbookCurrentOperation;
  NSMutableArray *lock_queuedEventsToPerform;
  BLSBacklightChangeEvent *pendingPrewarmedEvent;
  BLSHBacklightEnvironmentStateMachine *environmentStateMachine;
  BLSHBacklightTransitionStateMachineAbortContext *v18;
  uint64_t v20;
  __int128 v21;
  NSMutableArray *lock_activeEvents;
  BLSHBacklightMutableTargetState *lock_targetState;
  int v24;

  -[BLSHOSInterfaceProviding systemSleepMonitor](self->_osInterfaceProvider, "systemSleepMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -1.0;
  v24 = objc_msgSend(v4, "isSleepImminent");
  if (v24)
  {
    v6 = v4;
    mach_continuous_time();
    objc_msgSend(v6, "aggregateState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sleepMonitorStateTimestamp");
    BSTimeDifferenceFromMachTimeToMachTime();
    v5 = v8;

  }
  v9 = [BLSHBacklightTransitionStateMachineAbortContext alloc];
  currentState = self->_currentState;
  lock_abortedEvents = self->_lock_abortedEvents;
  lock_activeEvents = self->_lock_activeEvents;
  lock_targetState = self->_lock_targetState;
  lock_pendingEnvironmentUpdate = self->_lock_pendingEnvironmentUpdate;
  lock_pendingUpdatePresentation = self->_lock_pendingUpdatePresentation;
  v21 = *(_OWORD *)&self->_lock_pendingUpdateToSpecifier;
  lock_ensureFlipbookCurrentOperation = self->_lock_ensureFlipbookCurrentOperation;
  pendingPrewarmedEvent = self->_pendingPrewarmedEvent;
  lock_queuedEventsToPerform = self->_lock_queuedEventsToPerform;
  environmentStateMachine = self->_environmentStateMachine;
  BYTE1(v20) = v24;
  LOBYTE(v20) = objc_msgSend(v4, "hasSleepBeenRequested");
  v18 = -[BLSHBacklightTransitionStateMachineAbortContext initWithCurrentState:targetState:activeEvents:abortedEvents:pendingEnvironmentUpdate:pendingUpdatePresentation:pendingUpdateToSpecifier:pendingUpdateDisplayMode:ensureFlipbookCurrentOperation:queuedEventsToPerform:pendingPrewarmedEvent:environmentStateMachine:sleepRequested:sleepImminent:timeInSleepImminent:](v9, "initWithCurrentState:targetState:activeEvents:abortedEvents:pendingEnvironmentUpdate:pendingUpdatePresentation:pendingUpdateToSpecifier:pendingUpdateDisplayMode:ensureFlipbookCurrentOperation:queuedEventsToPerform:pendingPrewarmedEvent:environmentStateMachine:sleepRequested:sleepImminent:timeInSleepImminent:", currentState, lock_targetState, lock_activeEvents, lock_abortedEvents, lock_pendingEnvironmentUpdate, lock_pendingUpdatePresentation, v5, v21, lock_ensureFlipbookCurrentOperation, lock_queuedEventsToPerform, pendingPrewarmedEvent, environmentStateMachine, v20);

  return v18;
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

- (id)osInterfaceProvider
{
  return self->_osInterfaceProvider;
}

- (id)allFlipbookFrames
{
  return -[BLSHAlwaysOnPresentationEngine allFlipbookFrames](self->_alwaysOnPresentationEngine, "allFlipbookFrames");
}

- (id)frameWithUUID:(id)a3
{
  return -[BLSHAlwaysOnPresentationEngine frameWithUUID:](self->_alwaysOnPresentationEngine, "frameWithUUID:", a3);
}

- (id)frameOnGlassNow
{
  return -[BLSHAlwaysOnPresentationEngine frameOnGlassNow](self->_alwaysOnPresentationEngine, "frameOnGlassNow");
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  return -[BLSHAlwaysOnPresentationEngine frameOnGlassWhenFlipbookLastCancelled](self->_alwaysOnPresentationEngine, "frameOnGlassWhenFlipbookLastCancelled");
}

- (BLSHBacklightPlatformProvider)platformProvider
{
  return self->_platformProvider;
}

- (BLSHBacklightDisplayStateMachine)displayStateMachine
{
  return self->_displayStateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStateMachine, 0);
  objc_storeStrong((id *)&self->_platformProvider, 0);
  objc_storeStrong((id *)&self->_lock_abortedEvents, 0);
  objc_storeStrong((id *)&self->_lock_activeEvents, 0);
  objc_storeStrong((id *)&self->_lock_queuedEventsToPerform, 0);
  objc_storeStrong((id *)&self->_pendingPrewarmedEvent, 0);
  objc_storeStrong((id *)&self->_lock_targetState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_lock_session, 0);
  objc_storeStrong((id *)&self->_lock_ensureFlipbookCurrentOperation, 0);
  objc_storeStrong((id *)&self->_lock_pendingUpdateDisplayMode, 0);
  objc_storeStrong((id *)&self->_lock_pendingUpdateToSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_pendingUpdatePresentation, 0);
  objc_storeStrong((id *)&self->_lock_pendingEnvironmentUpdate, 0);
  objc_storeStrong((id *)&self->_lock_stopEngineOnScreenSpecifier, 0);
  objc_storeStrong((id *)&self->_transitionAPAwakeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_performerDelegate, 0);
  objc_storeStrong((id *)&self->_touchLockAssertion, 0);
  objc_storeStrong((id *)&self->_onMain_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_alwaysOnPresentationEngine, 0);
  objc_storeStrong((id *)&self->_environmentStateMachine, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
}

- (void)initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:.cold.1()
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

- (void)withLock_ensureTargetStateCreated
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_2145AC000, a3, OS_LOG_TYPE_DEBUG, "TSM:%p created target:%{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)lock_displayModeForBacklightState:session:.cold.1()
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

- (void)registerHandlersForService:.cold.1()
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

- (void)registerHandlersForService:.cold.2()
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

- (void)registerHandlersForService:.cold.3()
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

- (void)registerHandlersForService:.cold.4()
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

- (void)onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p (findNextOperation) pending:%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)onMainWithLock_environmentUpdateOperationForEvents:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p (findNextOperation) will start:%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)onMainWithLock_updateSpecifierOperationIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p (findNextOperation) still pending:%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)onMainWithLock_updatePresentationOperationIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p (findNextOperation) returning existing updatePresentation operation: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)onMainWithLock_updateDisplayOrEngineOperationIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_15_1(&dword_2145AC000, v0, v1, "TSM:%p (findNextOperation) animating:%{BOOL}u forcedUnanimated:%{BOOL}u pending:%{public}@");
  OUTLINED_FUNCTION_2_2();
}

- (void)_lock_ensureFlipbookCurrent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9(&dword_2145AC000, v0, v1, "TSM:%p flipbookIsStale=NO ensureCurrent completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)ifStillValidPerformAlwaysOnBrightnessRamp:withDuration:.cold.1()
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

- (void)inactiveEnvironmentSession:updateToPresentation:.cold.1()
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

- (void)hostEnvironment:invalidateContentForReason:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "TSM:%p flipbookIsStale=YES invalidateContentForReason:%{public}@");
  OUTLINED_FUNCTION_2();
}

@end
