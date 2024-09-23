@implementation BLSHBacklightStateMachine

- (int64_t)backlightState
{
  return -[BLSHBacklightStateMachineEventPerforming backlightState](self->_eventPerformer, "backlightState");
}

- (BOOL)isAlwaysOnEnabled
{
  BLSHBacklightStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabledResolved;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BLSHBacklightStateMachine)initWithPlatformProvider:(id)a3 eventPerformer:(id)a4 osInterfaceProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSHBacklightStateMachine *v11;
  BLSHBacklightStateMachine *v12;
  uint64_t v13;
  NSHashTable *lock_observers;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BLSHSystemActivityAsserting *lock_activeOnAPAwakeAssertion;
  BLSHSystemActivityAsserting *v20;
  char v21;
  uint64_t v22;
  BLSHOnSystemSleepAction *sleepAction;
  NSObject *v24;
  _BOOL4 lock_alwaysOnEnabledByPlatform;
  uint64_t v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id location;
  _QWORD v32[4];
  id v33;
  BLSHBacklightStateMachine *v34;
  uint64_t v35;
  objc_super v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)BLSHBacklightStateMachine;
  v11 = -[BLSHBacklightStateMachine init](&v36, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_16;
  objc_storeStrong((id *)&v11->_osInterfaceProvider, a5);
  v12->_lock._os_unfair_lock_opaque = 0;
  v12->_lock_nextEventID = 1;
  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 2);
  lock_observers = v12->_lock_observers;
  v12->_lock_observers = (NSHashTable *)v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = objc_msgSend(v8, "suppressionSupported");
    v12->_suppressionSupported = v15;
    if (!v15)
    {
LABEL_6:
      if (os_variant_has_internal_diagnostics())
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
        v12->_suppressionSupported = objc_msgSend(v16, "BOOLForKey:", CFSTR("SuppressionServiceEnabled"));

      }
    }
  }
  else if (!v12->_suppressionSupported)
  {
    goto LABEL_6;
  }
  objc_msgSend(v9, "backlightState");
  if (BLSBacklightStateIsActive())
  {
    v17 = objc_msgSend(v10, "mach_continuous_time");
    -[BLSHOSInterfaceProviding createSystemActivityAssertionWithIdentifier:configurator:](v12->_osInterfaceProvider, "createSystemActivityAssertionWithIdentifier:configurator:", CFSTR("BacklightServices.backlightActiveOn.startup"), &__block_literal_global_10);
    v18 = objc_claimAutoreleasedReturnValue();
    lock_activeOnAPAwakeAssertion = v12->_lock_activeOnAPAwakeAssertion;
    v12->_lock_activeOnAPAwakeAssertion = (BLSHSystemActivityAsserting *)v18;

    v20 = v12->_lock_activeOnAPAwakeAssertion;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_2;
    v32[3] = &unk_24D1BD1E8;
    v33 = v10;
    v34 = v12;
    v35 = v17;
    -[BLSHSystemActivityAsserting acquireWithTimeout:handler:](v20, "acquireWithTimeout:handler:", v32, 0.0);

  }
  v12->_deviceSupportsAlwaysOn = objc_msgSend(v10, "deviceSupportsAlwaysOn");
  objc_storeStrong((id *)&v12->_eventPerformer, a4);
  v12->_lock_activityState = BLSBacklightActivityStateForBLSBacklightState();
  objc_msgSend(v9, "setPerformerDelegate:", v12);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = objc_msgSend(v8, "isAlwaysOnEnabled");
  else
    v21 = 0;
  v12->_lock_alwaysOnEnabledByPlatform = v21;
  v12->_lock_alwaysOnEnabledResolved = 0;
  objc_msgSend(v8, "addObserver:", v12);
  +[BLSHOnSystemSleepAction actionWithIdentifier:delegate:osInterfaceProvider:](BLSHOnSystemSleepAction, "actionWithIdentifier:delegate:osInterfaceProvider:", CFSTR("BacklightStateMachine-Action"), v12, v10);
  v22 = objc_claimAutoreleasedReturnValue();
  sleepAction = v12->_sleepAction;
  v12->_sleepAction = (BLSHOnSystemSleepAction *)v22;

  -[BLSHOnSystemSleepAction install](v12->_sleepAction, "install");
  bls_backlight_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    lock_alwaysOnEnabledByPlatform = v12->_lock_alwaysOnEnabledByPlatform;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = lock_alwaysOnEnabledByPlatform;
    _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_INFO, "BSM:%p startup alwaysOnEnabledByPlatform:%{BOOL}u", buf, 0x12u);
  }

  -[BLSHBacklightStateMachine updateSuppressionServiceForActivityState:](v12, v12->_lock_activityState);
  objc_initWeak(&location, v12);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_39;
  v29[3] = &unk_24D1BD210;
  objc_copyWeak(&v30, &location);
  v29[4] = buf;
  objc_msgSend(v10, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("backlightAssertionInitialization"), v29, 5.0, 1.0);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v26;

  objc_destroyWeak(&v30);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
LABEL_16:

  return v12;
}

uint64_t __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 1);
}

void __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "mach_continuous_time");
  if (a2)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v10 + 96));
      *(_QWORD *)(v10 + 56) = v9;
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 96));
    }
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "afterPendingSleepWasAlreadyInitiated"))
      v12 = OS_LOG_TYPE_DEFAULT;
    else
      v12 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    v12 = OS_LOG_TYPE_FAULT;
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled(v11, v12))
  {
    v13 = *(_QWORD *)(a1 + 40);
    BSTimeDifferenceFromMachTimeToMachTime();
    v15 = 134218754;
    v16 = v13;
    v17 = 2114;
    v18 = v8;
    v19 = 2048;
    v20 = v14;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_2145AC000, v11, v12, "BSM:%p startup activeOn system activity assertion callback details:%{public}@ elapsed:%.4lfs error:%{public}@", (uint8_t *)&v15, 0x2Au);
  }

}

- (void)updateSuppressionServiceForActivityState:(_BYTE *)a1
{
  uint64_t v4;
  _QWORD v5[7];
  _QWORD v6[7];

  if (a1 && a1[125])
  {
    objc_msgSend(a1, "isAlwaysOnEnabled");
    v4 = BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable();
    if (v4)
    {
      if (v4 == 1)
      {
        v6[0] = MEMORY[0x24BDAC760];
        v6[1] = 3221225472;
        v6[2] = __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke;
        v6[3] = &unk_24D1BD368;
        v6[4] = a1;
        v6[5] = a2;
        v6[6] = 1;
        -[BLSHBacklightStateMachine startSuppressionServiceWithLogBlock:]((uint64_t)a1, v6);
      }
    }
    else
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke_89;
      v5[3] = &unk_24D1BD368;
      v5[4] = a1;
      v5[5] = a2;
      v5[6] = 0;
      -[BLSHBacklightStateMachine endSuppressionServiceWithExplanation:logBlock:]((uint64_t)a1, CFSTR("disabledAlwaysOn"), v5);
    }
  }
}

void __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_39(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  -[BLSHBacklightStateMachine enableAlwaysOnAfterInitialization](WeakRetained);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (os_unfair_lock_s)enableAlwaysOnAfterInitialization
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  if (result)
  {
    v1 = result;
    v2 = result + 24;
    os_unfair_lock_lock(result + 24);
    HIBYTE(v1[30]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)BSDispatchMain();
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BLSHBacklightStateMachineEventPerforming removeObserver:](self->_eventPerformer, "removeObserver:", self);
  -[BLSHSystemActivityAsserting invalidate](self->_lock_activeOnAPAwakeAssertion, "invalidate");
  -[BLSHSystemActivityAsserting invalidate](self->_lock_performEventAPAwakeAssertion, "invalidate");
  -[BSTimerScheduleQuerying invalidate](self->_lock_activeOnAPAwakeTimeoutTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightStateMachine;
  -[BLSHBacklightStateMachine dealloc](&v3, sel_dealloc);
}

void __62__BLSHBacklightStateMachine_enableAlwaysOnAfterInitialization__block_invoke(uint64_t a1)
{
  -[BLSHBacklightStateMachine onMain_updateAlwaysOnConfiguration](*(_QWORD *)(a1 + 32));
}

- (void)onMain_updateAlwaysOnConfiguration
{
  os_unfair_lock_s *v2;
  int v3;
  uint64_t v4;
  int v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return;
  v2 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  v3 = *(_BYTE *)(a1 + 126) && *(_BYTE *)(a1 + 121) && !*(_BYTE *)(a1 + 122) && *(_BYTE *)(a1 + 123) != 0;
  v4 = *(_QWORD *)(a1 + 112);
  v5 = *(unsigned __int8 *)(a1 + 120);
  if (v5 != v3)
  {
    *(_BYTE *)(a1 + 120) = v3;
    objc_msgSend(*(id *)(a1 + 32), "changeRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_8;
LABEL_10:
    v8 = objc_msgSend(*(id *)(a1 + 144), "backlightState");
    if (*(_BYTE *)(a1 + 120))
      objc_msgSend(*(id *)(a1 + 144), "isAlwaysOnSuppressed");
    v7 = v8 != BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable();
    goto LABEL_14;
  }
  v6 = 0;
  if (!v4)
    goto LABEL_10;
LABEL_8:
  v7 = 0;
LABEL_14:
  os_unfair_lock_unlock(v2);
  if (v5 != v3)
  {
    -[BLSHBacklightStateMachine updateSuppressionServiceForActivityState:]((_BYTE *)a1, v4);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__BLSHBacklightStateMachine_onMain_updateAlwaysOnConfiguration__block_invoke;
    v14[3] = &unk_24D1BD458;
    v14[4] = a1;
    v15 = v3;
    -[BLSHBacklightStateMachine notifyObserversWithBlock:](a1, v14);
    if (v7)
    {
      v9 = CFSTR("alwaysOnDisabled");
      if (v3)
        v9 = CFSTR("alwaysOnEnabled");
      v10 = v9;
      v11 = v6;
      if (!v11)
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE0B858]), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", v4, v10, mach_continuous_time(), 12, 0);
      bls_backlight_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v17 = a1;
        v18 = 2114;
        v19 = v10;
        v20 = 2114;
        v21 = v11;
        _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "BSM:%p sendNewChangeRequest explanation:%{public}@ request:%{public}@", buf, 0x20u);
      }

      v13 = (id)objc_msgSend((id)a1, "performChangeRequest:", v11);
    }
  }

}

- (void)registerHandlersForService:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[BLSHDisableAlwaysOnAttributeHandler registerHandlerForService:provider:](BLSHDisableAlwaysOnAttributeHandler, "registerHandlerForService:provider:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightStateMachine registerHandlersForService:].cold.1(a2);
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145DFAB4);
  }
  v5 = (void *)v4;
  +[BLSHLocalAssertionAttributeHandler registerHandlerForService:](BLSHValidWhenBacklightInactiveAttributeHandler, "registerHandlerForService:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHBacklightStateMachine registerHandlersForService:].cold.2(a2);
    goto LABEL_9;
  }

}

- (int64_t)flipbookState
{
  return -[BLSHBacklightStateMachineEventPerforming flipbookState](self->_eventPerformer, "flipbookState");
}

- (BOOL)isTransitioning
{
  return -[BLSHBacklightStateMachineEventPerforming isTransitioning](self->_eventPerformer, "isTransitioning");
}

- (int64_t)backlightDisplayMode
{
  return -[BLSHBacklightStateMachineEventPerforming backlightDisplayMode](self->_eventPerformer, "backlightDisplayMode");
}

- (unint64_t)backlightStateChangeTimestamp
{
  return -[BLSHBacklightStateMachineEventPerforming backlightStateChangeTimestamp](self->_eventPerformer, "backlightStateChangeTimestamp");
}

- (NSString)backlightStateDescription
{
  return (NSString *)-[BLSHBacklightStateMachineEventPerforming backlightStateDescription](self->_eventPerformer, "backlightStateDescription");
}

- (os_unfair_lock_s)activeOnAPAwakeAssertionIsActive
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = result + 24;
    os_unfair_lock_lock(result + 24);
    v3 = objc_msgSend(*(id *)&v1[12]._os_unfair_lock_opaque, "isActive");
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (BOOL)deviceSupportsAlwaysOn
{
  BLSHBacklightStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_deviceSupportsAlwaysOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (uint64_t)withLock_desiredBacklightStateForRequestedActivityState:(uint64_t)result
{
  if (result)
  {
    if (*(_BYTE *)(result + 120))
      objc_msgSend(*(id *)(result + 144), "isAlwaysOnSuppressed");
    return BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable();
  }
  return result;
}

- (id)performChangeRequest:(id)a3
{
  id v3;
  id v5;

  v5 = a3;
  v3 = v5;
  BSDispatchMain();

  return 0;
}

void __50__BLSHBacklightStateMachine_performChangeRequest___block_invoke(uint64_t a1)
{
  -[BLSHBacklightStateMachine onMain_performChangeRequest:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)onMain_performChangeRequest:(uint64_t)a1
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  char IsActive;
  char v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  char v52;
  char v53;
  _QWORD v54[5];
  id v55;
  uint64_t v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t);
  void *v64;
  uint64_t v65;
  id v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  _QWORD block[5];
  id v81;
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  void *v85;
  _QWORD v86[4];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(unsigned __int8 *)(a1 + 124);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    if (v4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke;
      block[3] = &unk_24D1BBE80;
      block[4] = a1;
      v81 = v3;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      v5 = *(id *)(a1 + 144);
      v6 = objc_msgSend(v5, "backlightState");
      v7 = objc_msgSend(v3, "requestedActivityState");
      v8 = -[BLSHBacklightStateMachine withLock_desiredBacklightStateForRequestedActivityState:](a1);
      v9 = *(_QWORD *)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v9 + 1;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B850]), "initWithEventID:state:previousState:changeRequest:", v9, v8, v6, v3);
      objc_storeStrong((id *)(a1 + 32), v10);
      *(_QWORD *)(a1 + 112) = v7;
      *(_BYTE *)(a1 + 124) = 1;
      v11 = (uint64_t)*(id *)(a1 + 72);
      v44 = *(id *)(a1 + 48);
      v49 = *(id *)(a1 + 80);
      if (!*(_QWORD *)(a1 + 40))
      {
        v12 = (void *)MEMORY[0x24BE0B838];
        +[BLSHDisableFlipbookPowerSavingAttribute disablePowerSavingForReason:](BLSHDisableFlipbookPowerSavingAttribute, "disablePowerSavingForReason:", 1);
        v47 = v10;
        v42 = v8;
        v13 = v6;
        v14 = v5;
        v15 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "acquireWithExplanation:observer:attributes:", CFSTR("BacklightEvent"), 0, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v18;

        v11 = v15;
        v5 = v14;
        v6 = v13;
        v8 = v42;
        v10 = v47;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      bls_backlight_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v83 = a1;
        v84 = 2114;
        v85 = v10;
        _os_log_impl(&dword_2145AC000, v20, OS_LOG_TYPE_DEFAULT, "BSM:%p will performRequest with event:%{public}@", buf, 0x16u);
      }

      objc_msgSend(v3, "sourceEvent");
      objc_msgSend(v3, "timestamp");
      kdebug_trace();
      v43 = v5;
      objc_msgSend(v5, "prewarmEvent:", v10);
      objc_msgSend((id)a1, "telemetryDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v21, "backlightTelemetrySource:willPerformEvent:", a1, v10);
      else
        objc_msgSend(v21, "backlightTelemetrySource:willTransitionToState:forEvent:", a1, v8, v10);
      v22 = (uint64_t)v44;
      -[BLSHBacklightStateMachine updateSuppressionServiceForActivityState:]((_BYTE *)a1, v7);
      v48 = *(id *)(a1 + 8);
      v41 = v21;
      if (BLSBacklightStateIsActive())
      {
        if (v44)
        {
          v61 = MEMORY[0x24BDAC760];
          v62 = 3221225472;
          v63 = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_69;
          v64 = &unk_24D1BBE80;
          v65 = a1;
          v66 = v10;
          BSDispatchMain();
          v23 = v66;
        }
        else
        {
          objc_msgSend(v43, "setSafeToUnblank:", 0);
          objc_msgSend(v49, "invalidate");
          v74[0] = MEMORY[0x24BDAC760];
          v74[1] = 3221225472;
          v74[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_63;
          v74[3] = &unk_24D1BD238;
          v45 = v43;
          v75 = v45;
          v76 = a1;
          v24 = v10;
          v77 = v24;
          v40 = v3;
          v78 = v40;
          v25 = v48;
          v79 = v25;
          objc_msgSend(v25, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("systemActivity.backlightActiveOn.timeout"), v74, 0.6, 0.1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "createSystemActivityAssertionWithIdentifier:configurator:", CFSTR("BacklightServices.backlightActiveOn"), &__block_literal_global_67);
          v22 = objc_claimAutoreleasedReturnValue();
          kdebug_trace();
          v67[0] = MEMORY[0x24BDAC760];
          v67[1] = 3221225472;
          v67[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2;
          v67[3] = &unk_24D1BD2A8;
          v68 = v25;
          v69 = a1;
          v70 = v24;
          v71 = v40;
          v49 = v39;
          v72 = v49;
          v73 = v45;
          objc_msgSend((id)v22, "acquireWithTimeout:handler:", v67, 0.0);

          v23 = v75;
        }

      }
      if (v6 != v8)
      {
        v26 = objc_msgSend(*(id *)(a1 + 16), "state");
        if (!(v22 | v11))
        {
          if (v26 == 1)
          {
            v11 = 0;
          }
          else
          {
            v27 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v10, "changeRequest");
            v46 = v22;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("BacklightServices.performEvent:%p:%d"), v10, objc_msgSend(v28, "sourceEvent"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "createSystemActivityAssertionWithIdentifier:configurator:", v29, &__block_literal_global_72);
            v11 = objc_claimAutoreleasedReturnValue();

            v22 = v46;
            v57[0] = MEMORY[0x24BDAC760];
            v57[1] = 3221225472;
            v57[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_4;
            v57[3] = &unk_24D1BD2F0;
            v57[4] = a1;
            v58 = v10;
            v59 = v3;
            v60 = v48;
            objc_msgSend((id)v11, "acquireWithTimeout:handler:", v57, 22.0);

          }
        }
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_73;
        v54[3] = &unk_24D1BD318;
        v54[4] = a1;
        v56 = v8;
        v55 = v10;
        -[BLSHBacklightStateMachine notifyObserversWithBlock:](a1, v54);

      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      v30 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v11;
      v31 = (id)v11;

      v32 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v22;
      v33 = (id)v22;

      v34 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v49;
      v35 = v49;

      *(_BYTE *)(a1 + 124) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      IsActive = BLSBacklightStateIsActive();
      v37 = BLSBacklightStateIsActive();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_77;
      v50[3] = &unk_24D1BD340;
      v50[4] = a1;
      v51 = v10;
      v52 = v37 & ~IsActive;
      v53 = IsActive & (v37 ^ 1);
      v38 = v10;
      -[BLSHBacklightStateMachine notifyObserversWithBlock:](a1, v50);
      objc_msgSend(v43, "performEvent:", v38);

    }
  }

}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightStateMachine onMain_performChangeRequest:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  kdebug_trace();
  objc_msgSend(v3, "invalidate");

  bls_backlight_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "safeToUnblank"))
    v5 = OS_LOG_TYPE_DEBUG;
  else
    v5 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "timestamp");
    objc_msgSend(*(id *)(a1 + 64), "mach_continuous_time");
    BSTimeDifferenceFromMachTimeToMachTime();
    v10 = 134218498;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    _os_log_impl(&dword_2145AC000, v4, v5, "BSM:%p activeOn system activity assertion timed out (related to rdar://74802930) event:%{public}@ elapsed:%.4lfs", (uint8_t *)&v10, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setSafeToUnblank:", 1);
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_66(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 0);
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(*(id *)(a1 + 32), "mach_continuous_time");
  if (v7)
    objc_msgSend(v7, "code");
  kdebug_trace();
  if (a2)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v10 + 96));
      *(_QWORD *)(v10 + 56) = v9;
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 96));
    }
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "afterPendingSleepWasAlreadyInitiated"))
      v12 = OS_LOG_TYPE_DEFAULT;
    else
      v12 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    v12 = OS_LOG_TYPE_FAULT;
    bls_backlight_log();
    v11 = objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled(v11, v12))
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "timestamp");
    BSTimeDifferenceFromMachTimeToMachTime();
    *(_DWORD *)buf = 134219010;
    v21 = v13;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v14;
    v26 = 2048;
    v27 = v15;
    v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_2145AC000, v11, v12, "BSM:%p activeOn system activity assertion callback details:%{public}@ event:%{public}@ elapsed:%.4lfs error:%{public}@", buf, 0x34u);
  }

  objc_msgSend(*(id *)(a1 + 64), "invalidate");
  objc_msgSend(*(id *)(a1 + 72), "setSafeToUnblank:", 1);
  v18 = v7;
  v19 = *(id *)(a1 + 48);
  v16 = v8;
  v17 = v7;
  BSDispatchMain();

}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_68(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "telemetryDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backlightTelemetrySource:didAcquireSystemActivityWithError:isActive:details:forEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_69(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "telemetryDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backlightTelemetrySource:hadExistingSystemActivityForEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 0);
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
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
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "timestamp");
    objc_msgSend(*(id *)(a1 + 56), "mach_continuous_time");
    BSTimeDifferenceFromMachTimeToMachTime();
    v14 = 134219010;
    v15 = v11;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v12;
    v20 = 2048;
    v21 = v13;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_2145AC000, v9, v10, "BSM:%p performEvent system activity assertion callback details:%{public}@ event:%{public}@ elapsed:%.4lfs error:%{public}@", (uint8_t *)&v14, 0x34u);
  }

}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_73(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "backlightHost:willTransitionToState:forEvent:", a1[4], a1[6], a1[5]);

}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  os_unfair_lock_s *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    objc_msgSend(*(id *)(a1 + 88), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_77(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  int v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "observesPerformingAllEvents"))
  {
    objc_msgSend(v6, "backlight:performingEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_12:
    v3 = v6;
    goto LABEL_13;
  }
  if (*(_BYTE *)(a1 + 48)
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "observesActivation"))
  {
    objc_msgSend(v6, "backlight:activatingWithEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    goto LABEL_12;
  }
  v3 = v6;
  if (*(_BYTE *)(a1 + 49))
  {
    v4 = objc_opt_respondsToSelector();
    v3 = v6;
    if ((v4 & 1) != 0)
    {
      v5 = objc_msgSend(v6, "observesDeactivation");
      v3 = v6;
      if (v5)
      {
        objc_msgSend(v6, "backlight:deactivatingWithEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

void __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bls_backlight_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
    v6 = OS_LOG_TYPE_INFO;
  else
    v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v4, v6))
  {
    if (a2)
      v7 = "";
    else
      v7 = "not ";
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromBLSBacklightActivityState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218754;
    v12 = v8;
    v13 = 2080;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_2145AC000, v5, v6, "BSM:%p will %sstart suppression service; activityState:%{public}@ unsuppressedTargetBacklightState:%{public}@",
      (uint8_t *)&v11,
      0x2Au);

  }
}

- (void)startSuppressionServiceWithLogBlock:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  int v4;
  char v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend(*(id *)(a1 + 8), "isSuppressionServiceActive");
    v5 = v4;
    v3[2](v3, v4 ^ 1u);
    if ((v5 & 1) == 0)
    {
      v6 = *(void **)(a1 + 8);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __65__BLSHBacklightStateMachine_startSuppressionServiceWithLogBlock___block_invoke;
      v7[3] = &unk_24D1BD390;
      v7[4] = a1;
      objc_msgSend(v6, "startSuppressionServiceWithHandler:", v7);
    }
  }

}

void __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke_89(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bls_backlight_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
    v6 = OS_LOG_TYPE_INFO;
  else
    v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v4, v6))
  {
    if (a2)
      v7 = "";
    else
      v7 = "not ";
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromBLSBacklightActivityState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218754;
    v12 = v8;
    v13 = 2080;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_2145AC000, v5, v6, "BSM:%p will %send suppression service; activityState:%{public}@ unsuppressedTargetBacklightState:%{public}@",
      (uint8_t *)&v11,
      0x2Au);

  }
}

- (void)endSuppressionServiceWithExplanation:(void *)a3 logBlock:
{
  void (**v5)(id, uint64_t);
  uint64_t v6;
  int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  BLSHSuppressionEvent *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_10;
  v6 = objc_msgSend(*(id *)(a1 + 8), "isSuppressionServiceActive");
  v5[2](v5, v6);
  if ((_DWORD)v6)
    objc_msgSend(*(id *)(a1 + 8), "endSuppressionService");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  v7 = objc_msgSend(*(id *)(a1 + 144), "isAlwaysOnSuppressed");
  objc_msgSend(*(id *)(a1 + 144), "setAlwaysOnSuppressed:", 0);
  if ((v6 & 1) != 0 || !v7)
  {
    if ((v6 & v7 & 1) != 0)
    {
      v8 = mach_continuous_time();
      v9 = objc_alloc(MEMORY[0x24BE0B858]);
      v10 = *(_QWORD *)(a1 + 112);
      v11 = objc_alloc(MEMORY[0x24BE0B860]);
      v12 = -[BLSHSuppressionEvent initWithType:reason:timestamp:]([BLSHSuppressionEvent alloc], "initWithType:reason:timestamp:", 2, 0x80000000, v8);
      v13 = (void *)objc_msgSend(v11, "initWithSuppressionEvent:", v12);
      v14 = (void *)objc_msgSend(v9, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", v10, v17, v8, 14, v13);

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      if (v14)
      {
        v15 = (id)objc_msgSend((id)a1, "performChangeRequest:", v14);

      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    }
LABEL_10:

    return;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BSM:%p suppressed but suppression service not active"), a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHBacklightStateMachine endSuppressionServiceWithExplanation:logBlock:].cold.1(sel_endSuppressionServiceWithExplanation_logBlock_);
  objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __65__BLSHBacklightStateMachine_startSuppressionServiceWithLogBlock___block_invoke(uint64_t a1, void *a2)
{
  -[BLSHBacklightStateMachine onMain_handleSuppressionEvent:](*(_QWORD *)(a1 + 32), a2);
}

- (void)onMain_handleSuppressionEvent:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 8), "isSuppressionServiceActive") & 1) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      v4 = objc_msgSend(v3, "wantsSuppression");
      objc_msgSend(*(id *)(a1 + 144), "setAlwaysOnSuppressed:", v4);
      v5 = (void *)MEMORY[0x24BDD17C8];
      if ((_DWORD)v4)
        v6 = CFSTR("alwaysOn suppressed");
      else
        v6 = CFSTR("alwaysOn unsuppressed");
      objc_msgSend(v3, "reason");
      NSStringFromBLSAlwaysOnSuppressionReason();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ — %@"), v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x24BE0B858]);
      v10 = *(_QWORD *)(a1 + 112);
      v11 = objc_msgSend(v3, "machContinuousTimestamp");
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B860]), "initWithSuppressionEvent:", v3);
      v13 = (void *)objc_msgSend(v9, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", v10, v8, v11, 14, v12);

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      bls_backlight_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218754;
        v18 = a1;
        v19 = 2114;
        v20 = v8;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v3;
        _os_log_impl(&dword_2145AC000, v14, OS_LOG_TYPE_INFO, "BSM:%p suppressionEvent explanation:%{public}@ request:%{public}@ event:%{public}@", buf, 0x2Au);
      }

      v15 = (id)objc_msgSend((id)a1, "performChangeRequest:", v13);
    }
    else
    {
      bls_backlight_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "reason");
        NSStringFromBLSAlwaysOnSuppressionReason();
        v16 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v18 = a1;
        v19 = 2114;
        v20 = v16;
        v21 = 2114;
        v22 = v3;
        _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEFAULT, "BSM:%p will ignore suppressionEvent — arrived after service was deactivated — explanation:%{public}@ event:%{public}@", buf, 0x20u);

      }
    }

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v5 = v4;
  BSDispatchMain();

}

void __41__BLSHBacklightStateMachine_addObserver___block_invoke(uint64_t a1)
{
  -[BLSHBacklightStateMachine onMain_notifyInitialStateForObserver:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)onMain_notifyInitialStateForObserver:(uint64_t)a1
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  int v9;
  int v10;
  void *v11;

  v3 = a2;
  if (a1)
  {
    v11 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = objc_msgSend(*(id *)(a1 + 88), "containsObject:", v11);
    v5 = *(unsigned __int8 *)(a1 + 120);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v3 = v11;
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "backlight:didCompleteUpdateToState:forEvents:abortedEvents:", a1, objc_msgSend((id)a1, "backlightState"), 0, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "backlight:didCompleteUpdateToState:forEvent:", a1, objc_msgSend((id)a1, "backlightState"), 0);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "backlight:didChangeAlwaysOnEnabled:", a1, v5 != 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "backlight:didCompleteUpdateToFlipbookState:forEvents:abortedEvents:", a1, objc_msgSend((id)a1, "flipbookState"), 0, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "backlight:didCompleteUpdateToFlipbookState:forEvent:", a1, objc_msgSend((id)a1, "flipbookState"), 0);
      }
      v6 = objc_msgSend(*(id *)(a1 + 144), "backlightDisplayMode");
      v7 = IsBlankedForBLSBacklightDisplayMode(v6);
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v11, "observesUpdateToDisplayMode"))
      {
        objc_msgSend(v11, "backlight:didUpdateToDisplayMode:fromDisplayMode:activeEvents:abortedEvents:", a1, v6, v6, 0, 0);
LABEL_23:
        v3 = v11;
        goto LABEL_24;
      }
      v8 = objc_opt_respondsToSelector();
      if (v7)
      {
        v3 = v11;
        if ((v8 & 1) != 0)
        {
          v9 = objc_msgSend(v11, "observesBlankingChanges");
          v3 = v11;
          if (v9)
          {
            objc_msgSend(v11, "backlight:didBlankToDisplayMode:fromDisplayMode:activeEvents:abortedEvents:", a1, v6, v6, 0, 0);
            goto LABEL_23;
          }
        }
      }
      else
      {
        v3 = v11;
        if ((v8 & 1) != 0)
        {
          v10 = objc_msgSend(v11, "observesBlankingChanges");
          v3 = v11;
          if (v10)
          {
            objc_msgSend(v11, "backlight:willUnblankToDisplayMode:fromDisplayMode:forEvents:abortedEvents:", a1, v6, v6, 0, 0);
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9;
  BLSBacklightChangeEvent *lock_transitioningEvent;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  BLSHSystemActivityAsserting *lock_performEventAPAwakeAssertion;
  char IsActive;
  BSTimerScheduleQuerying *lock_activeOnAPAwakeTimeoutTimer;
  BLSHSystemActivityAsserting *lock_activeOnAPAwakeAssertion;
  void (**v28)(_QWORD);
  id lock_sleepActionCompletion;
  BLSAssertion *lock_flipbookPowerSavingAssertion;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  int64_t v40;
  uint8_t buf[4];
  BLSHBacklightStateMachine *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v35 = a6;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_transitioningEvent && objc_msgSend(v9, "containsObject:"))
  {
    lock_transitioningEvent = self->_lock_transitioningEvent;
    self->_lock_transitioningEvent = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previousState");
  objc_msgSend(v12, "sourceEvent");
  v34 = v12;
  objc_msgSend(v12, "timestamp");
  kdebug_trace();
  v13 = objc_msgSend(v9, "count");
  bls_backlight_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = 2 * (v13 == 0);
  if (os_log_type_enabled(v14, v15))
  {
    NSStringFromBLSBacklightState();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v18 = v17;
    NSStringFromBLSBacklightChangeEvents();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v42 = self;
    v43 = 2114;
    v44 = v16;
    v45 = 2048;
    v46 = v18;
    v47 = 2114;
    v48 = v19;
    _os_log_impl(&dword_2145AC000, v14, v15, "BSM:%p didCompleteUpdateToState:%{public}@ elapsed:%.4lfs forEvents:%{public}@", buf, 0x2Au);

  }
  if (v13)
  {
    -[BLSHBacklightStateMachine telemetryDelegate](self, "telemetryDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v20, "backlightTelemetrySource:didCompleteUpdateToState:forEvents:abortedEvents:", self, a4, v9, v35);
    else
      objc_msgSend(v20, "backlightTelemetrySource:didCompleteUpdateToState:forEvent:", self, a4, v11);

  }
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __88__BLSHBacklightStateMachine_backlight_didCompleteUpdateToState_forEvents_abortedEvents___block_invoke;
  v36[3] = &unk_24D1BD3B8;
  v36[4] = self;
  v40 = a4;
  v21 = v9;
  v37 = v21;
  v22 = v35;
  v38 = v22;
  v23 = v11;
  v39 = v23;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v36);
  os_unfair_lock_lock(&self->_lock);
  -[BLSHSystemActivityAsserting invalidate](self->_lock_performEventAPAwakeAssertion, "invalidate");
  lock_performEventAPAwakeAssertion = self->_lock_performEventAPAwakeAssertion;
  self->_lock_performEventAPAwakeAssertion = 0;

  IsActive = BLSBacklightStateIsActive();
  if ((IsActive & 1) == 0)
  {
    -[BSTimerScheduleQuerying invalidate](self->_lock_activeOnAPAwakeTimeoutTimer, "invalidate");
    lock_activeOnAPAwakeTimeoutTimer = self->_lock_activeOnAPAwakeTimeoutTimer;
    self->_lock_activeOnAPAwakeTimeoutTimer = 0;

    -[BLSHSystemActivityAsserting invalidate](self->_lock_activeOnAPAwakeAssertion, "invalidate");
    lock_activeOnAPAwakeAssertion = self->_lock_activeOnAPAwakeAssertion;
    self->_lock_activeOnAPAwakeAssertion = 0;

  }
  v28 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](self->_lock_sleepActionCompletion);
  lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
  self->_lock_sleepActionCompletion = 0;

  -[BLSAssertion invalidate](self->_lock_flipbookPowerSavingAssertion, "invalidate");
  lock_flipbookPowerSavingAssertion = self->_lock_flipbookPowerSavingAssertion;
  self->_lock_flipbookPowerSavingAssertion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v28)
    v31 = IsActive;
  else
    v31 = 1;
  if ((v31 & 1) == 0)
  {
    bls_backlight_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBLSBacklightChangeEvents();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v42 = self;
      v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_2145AC000, v32, OS_LOG_TYPE_DEFAULT, "BSM:%p unexpected system sleep - did deactivate backlight with events:%{public}@", buf, 0x16u);

    }
    v28[2](v28);
  }

}

void __88__BLSHBacklightStateMachine_backlight_didCompleteUpdateToState_forEvents_abortedEvents___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "backlight:didCompleteUpdateToState:forEvents:abortedEvents:", a1[4], a1[8], a1[5], a1[6]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "backlight:didCompleteUpdateToState:forEvent:", a1[4], a1[8], a1[7]);
  }

}

- (void)backlight:(id)a3 didCompleteUpdateToFlipbookState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightStateMachine telemetryDelegate](self, "telemetryDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "backlightTelemetrySource:didCompleteUpdateToFlipbookState:forEvents:abortedEvents:", self, a4, v9, v10);
  else
    objc_msgSend(v12, "backlightTelemetrySource:didCompleteUpdateToFlipbookState:forEvent:", self, a4, v11);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__BLSHBacklightStateMachine_backlight_didCompleteUpdateToFlipbookState_forEvents_abortedEvents___block_invoke;
  v16[3] = &unk_24D1BD3B8;
  v19 = v11;
  v20 = a4;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v16);

}

void __96__BLSHBacklightStateMachine_backlight_didCompleteUpdateToFlipbookState_forEvents_abortedEvents___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "backlight:didCompleteUpdateToFlipbookState:forEvents:abortedEvents:", a1[4], a1[8], a1[5], a1[6]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "backlight:didCompleteUpdateToFlipbookState:forEvent:", a1[4], a1[8], a1[7]);
  }

}

- (void)backlight:(id)a3 didUpdateVisualContentsToBeginTransitionToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;

  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightStateMachine telemetryDelegate](self, "telemetryDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "backlightTelemetrySource:didUpdateVisualContentsToBeginTransitionToState:forEvents:abortedEvents:", self, a4, v9, v10);
  else
    objc_msgSend(v12, "backlightTelemetrySource:didUpdateVisualContentsToBeginTransitionToState:forEvent:", self, a4, v11);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __111__BLSHBacklightStateMachine_backlight_didUpdateVisualContentsToBeginTransitionToState_forEvents_abortedEvents___block_invoke;
  v15[3] = &unk_24D1BD3E0;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a4;
  v13 = v10;
  v14 = v9;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v15);

}

void __111__BLSHBacklightStateMachine_backlight_didUpdateVisualContentsToBeginTransitionToState_forEvents_abortedEvents___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "observesDidUpdateVisualContents"))
    objc_msgSend(v3, "backlight:didUpdateVisualContentsToBeginTransitionToState:forEvents:abortedEvents:", a1[4], a1[7], a1[5], a1[6]);

}

- (void)backlight:(id)a3 willUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 forEvents:(id)a6 abortedEvents:(id)a7
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;
  int64_t v20;
  BOOL v21;

  v11 = a6;
  v12 = a7;
  v13 = WillUnblankForDisplayModeTransition(a5, a4);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __103__BLSHBacklightStateMachine_backlight_willUpdateToDisplayMode_fromDisplayMode_forEvents_abortedEvents___block_invoke;
  v16[3] = &unk_24D1BD408;
  v19 = a4;
  v20 = a5;
  v16[4] = self;
  v17 = v11;
  v18 = v12;
  v21 = v13;
  v14 = v12;
  v15 = v11;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v16);

}

void __103__BLSHBacklightStateMachine_backlight_willUpdateToDisplayMode_fromDisplayMode_forEvents_abortedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "observesUpdateToDisplayMode"))
  {
    objc_msgSend(v3, "backlight:willUpdateToDisplayMode:fromDisplayMode:forEvents:abortedEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if (*(_BYTE *)(a1 + 72)
         && (objc_opt_respondsToSelector() & 1) != 0
         && objc_msgSend(v3, "observesBlankingChanges"))
  {
    objc_msgSend(v3, "backlight:willUnblankToDisplayMode:fromDisplayMode:forEvents:abortedEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)backlight:(id)a3 didUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7
{
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  int64_t v24;
  BOOL v25;

  v11 = a6;
  v12 = a7;
  v13 = WillUnblankForDisplayModeTransition(a5, a4);
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightStateMachine telemetryDelegate](self, "telemetryDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "backlightTelemetrySource:didUnblankToDisplayMode:fromDisplayMode:activeEvents:abortedEvents:", self, a4, a5, v11, v12);
    }
    else if (v14)
    {
      v16 = BLSBacklightStateForBLSBacklightDisplayMode(a4);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v15, "backlightTelemetrySource:didUpdateDisplayForState:forEvents:abortedEvents:", self, v16, v11, v12);
      else
        objc_msgSend(v15, "backlightTelemetrySource:didUpdateDisplayForState:forEvent:", self, v16, v14);
    }
  }
  v17 = WillBlankForDisplayModeTransition(a5, a4);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __105__BLSHBacklightStateMachine_backlight_didUpdateToDisplayMode_fromDisplayMode_activeEvents_abortedEvents___block_invoke;
  v20[3] = &unk_24D1BD408;
  v23 = a4;
  v24 = a5;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v25 = v17;
  v18 = v12;
  v19 = v11;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v20);

}

void __105__BLSHBacklightStateMachine_backlight_didUpdateToDisplayMode_fromDisplayMode_activeEvents_abortedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "observesUpdateToDisplayMode"))
  {
    objc_msgSend(v3, "backlight:didUpdateToDisplayMode:fromDisplayMode:activeEvents:abortedEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if (*(_BYTE *)(a1 + 72)
         && (objc_opt_respondsToSelector() & 1) != 0
         && objc_msgSend(v3, "observesBlankingChanges"))
  {
    objc_msgSend(v3, "backlight:didBlankToDisplayMode:fromDisplayMode:activeEvents:abortedEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)platformProvider:(id)a3 didChangeAlwaysOnSetting:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  NSObject *v7;
  uint8_t buf[4];
  BLSHBacklightStateMachine *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysOnEnabledByPlatform = v4;
  bls_backlight_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v9 = self;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEFAULT, "BSM:%p didChangeAlwaysOnSetting:%{BOOL}u", buf, 0x12u);
  }

  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

void __71__BLSHBacklightStateMachine_platformProvider_didChangeAlwaysOnSetting___block_invoke(uint64_t a1)
{
  -[BLSHBacklightStateMachine onMain_updateAlwaysOnConfiguration](*(_QWORD *)(a1 + 32));
}

- (void)platformProviderDidDetectSignificantUserInteraction:(id)a3
{
  id v4;
  int64_t lock_activityState;
  _QWORD v6[6];

  v4 = a3;
  if (self->_suppressionSupported)
  {
    os_unfair_lock_lock(&self->_lock);
    lock_activityState = self->_lock_activityState;
    os_unfair_lock_unlock(&self->_lock);
    if (lock_activityState == 1)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __81__BLSHBacklightStateMachine_platformProviderDidDetectSignificantUserInteraction___block_invoke;
      v6[3] = &unk_24D1BD430;
      v6[4] = self;
      v6[5] = 1;
      -[BLSHBacklightStateMachine endSuppressionServiceWithExplanation:logBlock:]((uint64_t)self, CFSTR("significantUserInteraction"), v6);
    }
  }
  -[BLSHOSInterfaceProviding didDetectSignificantUserInteraction](self->_osInterfaceProvider, "didDetectSignificantUserInteraction");

}

void __81__BLSHBacklightStateMachine_platformProviderDidDetectSignificantUserInteraction___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  bls_backlight_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
    v6 = OS_LOG_TYPE_INFO;
  else
    v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v4, v6))
  {
    if (a2)
      v7 = "";
    else
      v7 = "not ";
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromBLSBacklightActivityState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = v8;
    v12 = 2080;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2145AC000, v5, v6, "BSM:%p will %send suppression service after significant user interaction; activityState:%{public}@",
      (uint8_t *)&v10,
      0x20u);

  }
}

void __63__BLSHBacklightStateMachine_onMain_updateAlwaysOnConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "backlight:didChangeAlwaysOnEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)isAlwaysOnDisabledByAssertion
{
  BLSHBacklightStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnDisabledByAssertion;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnDisabledByAssertion:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  uint8_t buf[4];
  BLSHBacklightStateMachine *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysOnDisabledByAssertion = v3;
  self->_lock_alwaysOnEnabledAfterInitialization = 1;
  bls_backlight_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "BSM:%p setAlwaysOnDisabledByAssertion:%{BOOL}u", buf, 0x12u);
  }

  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

void __60__BLSHBacklightStateMachine_setAlwaysOnDisabledByAssertion___block_invoke(uint64_t a1)
{
  -[BLSHBacklightStateMachine onMain_updateAlwaysOnConfiguration](*(_QWORD *)(a1 + 32));
}

- (void)systemSleepAction:(id)a3 performWithCompletion:(id)a4
{
  void (**v5)(_QWORD);
  int IsActive;
  void *v7;
  void *v8;
  id lock_sleepActionCompletion;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  BLSHOSInterfaceProviding *osInterfaceProvider;
  id *v16;
  id v17;
  BSInvalidatable *v18;
  BSInvalidatable *lock_unexpectedSleepDebounceTimer;
  _BOOL4 v20;
  double v21;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  void *v25;
  _QWORD v26[5];
  void *v27;
  uint8_t buf[4];
  BLSHBacklightStateMachine *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(_QWORD))a4;
  -[BLSHBacklightStateMachine backlightState](self, "backlightState");
  IsActive = BLSBacklightStateIsActive();
  if (IsActive && -[BLSHBacklightStateMachine activeOnAPAwakeAssertionIsActive]((os_unfair_lock_s *)self))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B858]), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", 0, CFSTR("unexpected system sleep"), mach_continuous_time(), 12, 0);
    os_unfair_lock_lock(&self->_lock);
    v8 = (void *)MEMORY[0x2199D2BD8](v5);
    lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
    self->_lock_sleepActionCompletion = v8;

    -[BLSHOSInterfaceProviding mach_continuous_time](self->_osInterfaceProvider, "mach_continuous_time");
    BSTimeDifferenceFromMachTimeToMachTime();
    v11 = v10;
    v12 = 0.5 - v10;
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12 <= 0.0)
    {
      if (v14)
      {
        BLSLoggingStringForContinuousMachTime();
        v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134219010;
        v29 = self;
        v30 = 2114;
        v31 = v21;
        v32 = 2048;
        v33 = v11;
        v34 = 2048;
        v35 = 0.5 - v11;
        v36 = 2114;
        v37 = v7;
        _os_log_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEFAULT, "BSM:%p unexpected system sleep - assertion acquired %{public}@ {elapsedTime:%lf timerInterval:%lf} — dispatching request:%{public}@", buf, 0x34u);

      }
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke_140;
      v24[3] = &unk_24D1BBE80;
      v16 = &v25;
      v24[4] = self;
      v25 = v7;
      v22 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], v24);
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 134218498;
        v29 = self;
        v30 = 2048;
        v31 = 0.5 - v11;
        v32 = 2114;
        v33 = *(double *)&v7;
        _os_log_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEFAULT, "BSM:%p unexpected system sleep - will wait %lfs before sending request:%{public}@", buf, 0x20u);
      }

      osInterfaceProvider = self->_osInterfaceProvider;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke;
      v26[3] = &unk_24D1BD480;
      v16 = &v27;
      v26[4] = self;
      v27 = v7;
      v17 = v7;
      -[BLSHOSInterfaceProviding scheduledTimerWithIdentifier:interval:leewayInterval:handler:](osInterfaceProvider, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("unexpected system sleep debounce"), v26, 0.5 - v11, 0.1);
      v18 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      lock_unexpectedSleepDebounceTimer = self->_lock_unexpectedSleepDebounceTimer;
      self->_lock_unexpectedSleepDebounceTimer = v18;

    }
    os_unfair_lock_unlock(&self->_lock);

    v20 = v7 == 0;
  }
  else
  {
    v5[2](v5);
    v20 = 1;
  }
  if ((IsActive & v20) == 1)
  {
    bls_backlight_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightStateMachine systemSleepAction:performWithCompletion:].cold.1((uint64_t)self, v23);

  }
}

uint64_t __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "performUnexpectedSleepRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke_140(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performUnexpectedSleepRequest:", *(_QWORD *)(a1 + 40));
}

- (void)performUnexpectedSleepRequest:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  id lock_sleepActionCompletion;
  void *v7;
  char v8;
  id v9;
  BSInvalidatable *lock_unexpectedSleepDebounceTimer;
  int IsActive;
  int v12;
  unsigned int v13;
  BLSHOSInterfaceProviding *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  unsigned int v24;
  int v25;
  BLSHBacklightStateMachine *v26;
  __int16 v27;
  _BYTE v28[10];
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](self->_lock_sleepActionCompletion);
  lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
  -[BLSHOSInterfaceProviding systemSleepMonitor](self->_osInterfaceProvider, "systemSleepMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSleepBeenRequested");

  if (!lock_sleepActionCompletion)
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    v9 = self->_lock_sleepActionCompletion;
    self->_lock_sleepActionCompletion = 0;

  }
  -[BSInvalidatable invalidate](self->_lock_unexpectedSleepDebounceTimer, "invalidate");
  lock_unexpectedSleepDebounceTimer = self->_lock_unexpectedSleepDebounceTimer;
  self->_lock_unexpectedSleepDebounceTimer = 0;

  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightStateMachine backlightState](self, "backlightState");
  IsActive = BLSBacklightStateIsActive();
  if ((v8 & 1) != 0)
  {
    if (lock_sleepActionCompletion)
    {
      v12 = IsActive;
      v13 = -[BLSHBacklightStateMachine activeOnAPAwakeAssertionIsActive]((os_unfair_lock_s *)self);
      if ((v12 & v13) == 1)
      {
        v14 = self->_osInterfaceProvider;
        -[BLSHOSInterfaceProviding systemSleepMonitor](v14, "systemSleepMonitor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "hasSleepBeenRequested");

        bls_backlight_log();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[BLSHBacklightStateMachine performUnexpectedSleepRequest:].cold.1((uint64_t)self, (uint64_t)v4, v18);

          v19 = -[BLSHBacklightStateMachine performChangeRequest:](self, "performChangeRequest:", v4);
        }
        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v25 = 134218242;
            v26 = self;
            v27 = 2114;
            *(_QWORD *)v28 = v4;
            _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "BSM:%p (sleep not requested) unexpected system sleep – will not send request:%{public}@", (uint8_t *)&v25, 0x16u);
          }

        }
        goto LABEL_23;
      }
      v24 = v13;
      bls_backlight_log();
      v14 = (BLSHOSInterfaceProviding *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
      {
        v25 = 134218754;
        v26 = self;
        v27 = 1024;
        *(_DWORD *)v28 = v12;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = v24;
        v29 = 2114;
        v30 = v4;
        v21 = "BSM:%p (no longer active) unexpected system sleep - isActive:%{BOOL}u activeOnAPAssertion:%{BOOL}u – will "
              "not send request:%{public}@";
        v22 = v14;
        v23 = 34;
        goto LABEL_19;
      }
    }
    else
    {
      bls_backlight_log();
      v14 = (BLSHOSInterfaceProviding *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
      {
        v25 = 134218242;
        v26 = self;
        v27 = 2114;
        *(_QWORD *)v28 = v4;
        v21 = "BSM:%p (no sleep action completion) unexpected system sleep - will not send request:%{public}@";
        v22 = v14;
        v23 = 22;
LABEL_19:
        _os_log_impl(&dword_2145AC000, v22, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v25, v23);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  bls_backlight_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v25 = 134218754;
    v26 = self;
    v27 = 1024;
    *(_DWORD *)v28 = 1;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = 0;
    v29 = 2114;
    v30 = v4;
    _os_log_impl(&dword_2145AC000, v20, OS_LOG_TYPE_INFO, "BSM:%p (no longer requested) unexpected system sleep - hasSleepActionCompletion:%{BOOL}u hasSleepBeenRequested:%{BOOL}u - will not send request:%{public}@", (uint8_t *)&v25, 0x22u);
  }

  v5[2](v5);
LABEL_24:

}

- (void)systemSleepAction:(id)a3 systemWillWakeForReason:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id lock_sleepActionCompletion;
  BSInvalidatable *lock_unexpectedSleepDebounceTimer;
  NSObject *v9;
  int v10;
  BLSHBacklightStateMachine *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](self->_lock_sleepActionCompletion);
  lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
  self->_lock_sleepActionCompletion = 0;

  -[BSInvalidatable invalidate](self->_lock_unexpectedSleepDebounceTimer, "invalidate");
  lock_unexpectedSleepDebounceTimer = self->_lock_unexpectedSleepDebounceTimer;
  self->_lock_unexpectedSleepDebounceTimer = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    bls_backlight_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "BSM:%p (will not sleep - %@) unexpected system sleep - will not send request", (uint8_t *)&v10, 0x16u);
    }

    v6[2](v6);
  }

}

- (BLSHBacklightHostTelemetryDelegate)telemetryDelegate
{
  return (BLSHBacklightHostTelemetryDelegate *)objc_loadWeakRetained((id *)&self->_telemetryDelegate);
}

- (void)setTelemetryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_telemetryDelegate, a3);
}

- (BLSBacklightChangeEvent)activeTransitionEvent
{
  return self->_activeTransitionEvent;
}

- (BLSHBacklightStateMachineEventPerforming)eventPerformer
{
  return self->_eventPerformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPerformer, 0);
  objc_storeStrong((id *)&self->_activeTransitionEvent, 0);
  objc_destroyWeak((id *)&self->_telemetryDelegate);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_activeOnAPAwakeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_lock_performEventAPAwakeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_unexpectedSleepDebounceTimer, 0);
  objc_storeStrong((id *)&self->_lock_activeOnAPAwakeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_flipbookPowerSavingAssertion, 0);
  objc_storeStrong((id *)&self->_lock_transitioningEvent, 0);
  objc_storeStrong(&self->_lock_sleepActionCompletion, 0);
  objc_storeStrong((id *)&self->_sleepAction, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

- (void)registerHandlersForService:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)registerHandlersForService:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)endSuppressionServiceWithExplanation:(const char *)a1 logBlock:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
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

- (void)systemSleepAction:(uint64_t)a1 performWithCompletion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "BSM:%p system sleep while acquiring system activity, did not deactivate backlight", (uint8_t *)&v2, 0xCu);
}

- (void)performUnexpectedSleepRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "BSM:%p unexpected system sleep - will deactivate backlight with request:%{public}@", (uint8_t *)&v3, 0x16u);
}

@end
