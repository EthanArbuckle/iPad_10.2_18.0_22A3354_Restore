@implementation BLSHAlwaysOnPresentationEngine

- (BLSHAlwaysOnPresentationEngine)initWithDelegate:(id)a3 platformProvider:(id)a4 osInterfaceProvider:(id)a5 inactiveBudgetPolicy:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BLSHAlwaysOnPresentationEngine *v15;
  BLSHAlwaysOnPresentationEngine *v16;
  BLSHNullInactiveBudgetPolicy *v17;
  BLSHInactiveBudgetPolicing_Private *nullInactiveBudgetPolicy;
  uint64_t v19;
  BLSHOnSystemSleepAction *sleepAction;
  BLSHFlipbookPowerSavingProvider *v21;
  BLSHFlipbookPowerSavingProvider *flipbookPowerSavingProvider;
  BLSHFlipbookHistory *v23;
  BLSHFlipbookHistory *renderedFlipbookHistory;
  BLSHFlipbookSpecification *v25;
  uint64_t v26;
  BLSHFlipbookTelemetry *flipbookTelemetryDelegate;
  NSObject *v28;
  id v30;
  id location;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)BLSHAlwaysOnPresentationEngine;
  v15 = -[BLSHAlwaysOnPresentationEngine init](&v32, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_delegate, a3);
    objc_storeStrong((id *)&v16->_osInterfaceProvider, a5);
    objc_storeStrong((id *)&v16->_realInactiveBudgetPolicy, a6);
    objc_storeStrong((id *)&v16->_inactiveBudgetPolicy, a6);
    v17 = objc_alloc_init(BLSHNullInactiveBudgetPolicy);
    nullInactiveBudgetPolicy = v16->_nullInactiveBudgetPolicy;
    v16->_nullInactiveBudgetPolicy = (BLSHInactiveBudgetPolicing_Private *)v17;

    v16->_lock_fillFlipbookState = 0;
    +[BLSHOnSystemSleepAction actionWithIdentifier:delegate:osInterfaceProvider:](BLSHOnSystemSleepAction, "actionWithIdentifier:delegate:osInterfaceProvider:", CFSTR("AlwaysOnPresentationEngine-Action"), v16, v13);
    v19 = objc_claimAutoreleasedReturnValue();
    sleepAction = v16->_sleepAction;
    v16->_sleepAction = (BLSHOnSystemSleepAction *)v19;

    -[BLSHOnSystemSleepAction install](v16->_sleepAction, "install");
    v16->_lock_onStandby = 1;
    v21 = objc_alloc_init(BLSHFlipbookPowerSavingProvider);
    flipbookPowerSavingProvider = v16->_flipbookPowerSavingProvider;
    v16->_flipbookPowerSavingProvider = v21;

    if (os_variant_has_internal_diagnostics())
    {
      v23 = -[BLSHFlipbookHistory initWithFrameLimit:memoryLimit:]([BLSHFlipbookHistory alloc], "initWithFrameLimit:memoryLimit:", objc_msgSend(v13, "flipbookDiagnosticHistoryFrameLimit"), objc_msgSend(v13, "flipbookDiagnosticHistoryMemoryLimit"));
      renderedFlipbookHistory = v16->_renderedFlipbookHistory;
      v16->_renderedFlipbookHistory = v23;

    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v12, "flipbookSpecification"),
          (v25 = (BLSHFlipbookSpecification *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v25 = -[BLSHFlipbookSpecification initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:]([BLSHFlipbookSpecification alloc], "initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:", 104857600, 100, 30.0, 3.0, 0.0028, 90.0, 300.0);
    }
    objc_storeStrong((id *)&v16->_flipbookSpecification, v25);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "flipbookTelemetryDelegate");
      v26 = objc_claimAutoreleasedReturnValue();
      flipbookTelemetryDelegate = v16->_flipbookTelemetryDelegate;
      v16->_flipbookTelemetryDelegate = (BLSHFlipbookTelemetry *)v26;

    }
    bls_flipbook_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[BLSHAlwaysOnPresentationEngine initWithDelegate:platformProvider:osInterfaceProvider:inactiveBudgetPolicy:].cold.1();

    v16->_lock_engineState = 0;
    objc_initWeak(&location, v16);
    objc_copyWeak(&v30, &location);
    v16->_stateHandler = os_state_add_handler();
    -[BLSHAlwaysOnPresentationEngine createFlipbook]((uint64_t)v16);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v16;
}

uint64_t __109__BLSHAlwaysOnPresentationEngine_initWithDelegate_platformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke(uint64_t a1)
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

- (void)createFlipbook
{
  os_unfair_lock_s *v2;
  BLSHPseudoFlipbook *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v7 = *(id *)(a1 + 88);
    if (*(_BYTE *)(a1 + 269))
    {
      v3 = objc_alloc_init(BLSHPseudoFlipbook);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 24), "createFlipbook");
      v3 = (BLSHPseudoFlipbook *)objc_claimAutoreleasedReturnValue();
    }
    v4 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v3;

    v5 = *(unsigned __int8 *)(a1 + 271);
    v6 = *(id *)(a1 + 88);
    objc_msgSend(v6, "set1HzFlipbook:", v5);
    objc_msgSend(*(id *)(a1 + 88), "setCachesFramesOnExit:", *(unsigned __int8 *)(a1 + 272));
    os_unfair_lock_unlock(v2);
    objc_msgSend(v7, "invalidate");
    objc_msgSend(*(id *)(a1 + 112), "setFlipbook:", v6);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[BLSHOnSystemSleepAction uninstall](self->_sleepAction, "uninstall");
  -[BLSHFlipbook invalidate](self->_lock_flipbook, "invalidate");
  -[BSTimerScheduleQuerying invalidate](self->_lock_timer, "invalidate");
  if (self->_stateHandler)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)BLSHAlwaysOnPresentationEngine;
  -[BLSHAlwaysOnPresentationEngine dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  unint64_t v20;
  const __CFString *v21;
  id v22;
  void *v23;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_onStandby, CFSTR("onStandby"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_suppressed, CFSTR("suppressed"));
  switch(self->_lock_engineState)
  {
    case 0:
      v7 = (id)objc_msgSend(v4, "appendObject:withName:", CFSTR("stopped"), CFSTR("state"));
      goto LABEL_3;
    case 1:
      v9 = (id)objc_msgSend(v4, "appendObject:withName:", CFSTR("live"), CFSTR("state"));
      -[BLSHPresentationDateSpecifier presentationDate](self->_lock_lastLiveSpecifier, "presentationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v10 = CFSTR("liveFlipbook");
      goto LABEL_8;
    case 3:
      v10 = CFSTR("predictiveFlipbook");
      goto LABEL_8;
    case 4:
      v10 = CFSTR("predictiveFlipbookToFill");
LABEL_8:
      v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("state"));
      -[BLSHFlipbook frameOnGlass](self->_lock_flipbook, "frameOnGlass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bls_specifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentationDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_3:
      v8 = 0;
      break;
  }
  -[NSDateInterval bls_shortLoggingString](self->_lock_lastRequestInterval, "bls_shortLoggingString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "appendObject:withName:", v14, CFSTR("lastRequestInterval"));

  if (v8)
  {
    objc_msgSend(v8, "bls_shortLoggingString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("lastSpeciferDate"));

  }
  NSStringFromBLSHOnSystemSleepActionState(-[BLSHOnSystemSleepAction state](self->_sleepAction, "state"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v4, "appendObject:withName:", v18, CFSTR("sleepActionState"));

  v20 = self->_lock_fillFlipbookState - 1;
  if (v20 > 3)
    v21 = CFSTR("Awake");
  else
    v21 = off_24D1BC920[v20];
  v22 = (id)objc_msgSend(v4, "appendObject:withName:", v21, CFSTR("fillState"));
  objc_msgSend(v4, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v23;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  BLSHAlwaysOnPresentationEngine *v17;
  _QWORD v18[4];
  id v19;
  BLSHAlwaysOnPresentationEngine *v20;
  _QWORD v21[4];
  id v22;
  BLSHAlwaysOnPresentationEngine *v23;
  _QWORD v24[4];
  id v25;
  BLSHAlwaysOnPresentationEngine *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  BLSHAlwaysOnPresentationEngine *v32;
  _QWORD v33[4];
  id v34;
  BLSHAlwaysOnPresentationEngine *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_opt_new();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  v5 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke;
  v33[3] = &unk_24D1BC5A0;
  v6 = v4;
  v34 = v6;
  v35 = self;
  v36 = &v37;
  objc_msgSend(v6, "appendProem:block:", self, v33);
  if (self->_lock_requestDatesOperation)
  {
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_2;
    v30[3] = &unk_24D1BBE80;
    v31 = v6;
    v32 = self;
    objc_msgSend(v31, "appendBodySectionWithName:block:", CFSTR("requestDatesOperation"), v30);
    v7 = v31;
  }
  else
  {
    -[NSDateInterval bls_loggingString](self->_lock_lastRequestInterval, "bls_loggingString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("lastRequestInterval"));
  }

  if (v38[5])
  {
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_3;
    v27[3] = &unk_24D1BC5C8;
    v28 = v6;
    v29 = &v37;
    objc_msgSend(v28, "appendBodySectionWithName:block:", CFSTR("frameOnGlass"), v27);

  }
  if (self->_lock_renderingSpecifier)
  {
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_4;
    v24[3] = &unk_24D1BBE80;
    v25 = v6;
    v26 = self;
    objc_msgSend(v25, "appendBodySectionWithName:block:", CFSTR("renderingSpecifier"), v24);

  }
  if (self->_lock_cachedFlipbookUpdates)
  {
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_5;
    v21[3] = &unk_24D1BBE80;
    v22 = v6;
    v23 = self;
    objc_msgSend(v22, "appendBodySectionWithName:block:", CFSTR("cachedFlipbookUpdates"), v21);

  }
  if (self->_lock_timer)
  {
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_6;
    v18[3] = &unk_24D1BBE80;
    v19 = v6;
    v20 = self;
    objc_msgSend(v19, "appendBodySectionWithName:block:", CFSTR("timer"), v18);

  }
  if (self->_lock_livePowerAssertion)
  {
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_7;
    v15[3] = &unk_24D1BBE80;
    v16 = v6;
    v17 = self;
    objc_msgSend(v16, "appendBodySectionWithName:block:", CFSTR("livePowerAssertion"), v15);

  }
  if ((unint64_t)(self->_lock_engineState - 2) <= 2)
  {
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_8;
    v13[3] = &unk_24D1BBE80;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v14, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", CFSTR("activeFrames"), CFSTR(" {"), CFSTR("} "), v13);

  }
  if (self->_renderedFlipbookHistory)
  {
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_9;
    v11[3] = &unk_24D1BBE80;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v12, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", CFSTR("history"), CFSTR(" {"), CFSTR("} "), v11);

  }
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v37, 8);
  return (NSString *)v9;
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  const __CFString *v21;
  id v22;
  void *v23;
  id v24;
  id v25;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 265), CFSTR("onStandby"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 266), CFSTR("suppressed"));
  switch(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 240))
  {
    case 0:
      v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", CFSTR("stopped"), CFSTR("backlightState"));
      break;
    case 1:
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", CFSTR("live"), CFSTR("backlightState"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "bls_loggingString");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      break;
    case 2:
      v9 = *(void **)(a1 + 32);
      v10 = CFSTR("liveFlipbook");
      goto LABEL_7;
    case 3:
      v9 = *(void **)(a1 + 32);
      v10 = CFSTR("predictiveFlipbook");
      goto LABEL_7;
    case 4:
      v9 = *(void **)(a1 + 32);
      v10 = CFSTR("predictiveFlipbookToFill");
LABEL_7:
      v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("backlightState"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "frameOnGlass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bls_loggingString");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      break;
    default:
      break;
  }
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPointer:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184), CFSTR("renderFlipbookSession"));
  v17 = *(void **)(a1 + 32);
  NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "state"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("sleepActionState"));

  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248) - 1;
  if (v20 > 3)
    v21 = CFSTR("Awake");
  else
    v21 = off_24D1BC920[v20];
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v21, CFSTR("fillState"));
  v23 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "description");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "appendObject:withName:", v25, 0);

}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, &stru_24D1BE888);

}

id __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_3(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), &stru_24D1BE888);
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, &stru_24D1BE888);

}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, &stru_24D1BE888);

}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, &stru_24D1BE888);

}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_7(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 200), "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, &stru_24D1BE888);

}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "activeFrames", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "bls_loggingString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_9(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allFrames", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "bls_loggingString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

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
  +[BLSHAlwaysFillFlipbookAttributeHandler registerHandlerForService:provider:](BLSHAlwaysFillFlipbookAttributeHandler, "registerHandlerForService:provider:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145BF720);
  }
  v5 = (void *)v4;
  +[BLSHPseudoFlipbookAttributeHandler registerHandlerForService:provider:](BLSHPseudoFlipbookAttributeHandler, "registerHandlerForService:provider:", v12, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:].cold.2();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145BF784);
  }
  +[BLSHDisableFlipbookPowerSavingAttributeHandler registerHandlerForService:provider:](BLSHDisableFlipbookPowerSavingAttributeHandler, "registerHandlerForService:provider:", v12, self->_flipbookPowerSavingProvider);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:].cold.3();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145BF7E8);
  }
  +[BLSHGlobal1HzFlipbookAttributeHandler registerHandlerForService:provider:](BLSHGlobal1HzFlipbookAttributeHandler, "registerHandlerForService:provider:", v12, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:].cold.4();
    goto LABEL_17;
  }

}

- (id)flipbook
{
  os_unfair_lock_s *p_lock;
  BLSHFlipbook *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_flipbook;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)engineState
{
  os_unfair_lock_s *p_lock;
  int64_t lock_engineState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_engineState = self->_lock_engineState;
  os_unfair_lock_unlock(p_lock);
  return lock_engineState;
}

- (BLSHRenderedFlipbookFrame)onGlassFlipbookFrame
{
  os_unfair_lock_s *p_lock;
  BLSHRenderedFlipbookFrame *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(self->_lock_engineState - 2) > 2
    || (-[BLSHFlipbook frameOnGlass](self->_lock_flipbook, "frameOnGlass"),
        (v4 = (BLSHRenderedFlipbookFrame *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = self->_lock_frameOnGlassWhenFlipbookCancelled;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)invalidateOnGlassFlipbookFrame
{
  os_unfair_lock_s *p_lock;
  BLSHRenderedFlipbookFrame *lock_frameOnGlassWhenFlipbookCancelled;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_frameOnGlassWhenFlipbookCancelled = self->_lock_frameOnGlassWhenFlipbookCancelled;
  self->_lock_frameOnGlassWhenFlipbookCancelled = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BLSHBacklightInactiveEnvironmentSession)inactiveSession
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightInactiveEnvironmentSession *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_inactiveSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInactiveSession:(id)a3
{
  BLSHBacklightInactiveEnvironmentSession *v4;
  BLSHBacklightInactiveEnvironmentSession *lock_inactiveSession;
  void *v6;
  void *v7;
  BLSHBacklightInactiveEnvironmentSession *v8;

  v4 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_engineState)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_engineState == BLSHAlwaysOnPresentationEngineStateStopped"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAlwaysOnPresentationEngine setInactiveSession:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    lock_inactiveSession = self->_lock_inactiveSession;
    self->_lock_inactiveSession = v4;
    v8 = v4;

    -[BLSHBacklightInactiveEnvironmentSession presentation](v8, "presentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v6);

    os_unfair_lock_unlock(&self->_lock);
    -[BLSHBacklightInactiveEnvironmentSession addObserver:](v8, "addObserver:", self);

  }
}

- (uint64_t)_lock_update1HzFromPresentation:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(unsigned __int8 *)(a1 + 271);
    if (*(_BYTE *)(a1 + 270))
    {
      v6 = 1;
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v3, "presentationEntries", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v8 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "environment");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = BLSIs1HzFlipbookForEnvironment(v10);

            if ((v11 & 1) != 0)
            {
              v6 = 1;
              goto LABEL_14;
            }
          }
          v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_14:

    }
    if (v5 == (_DWORD)v6)
    {
      a1 = 0;
    }
    else
    {
      *(_BYTE *)(a1 + 271) = v6;
      objc_msgSend(*(id *)(a1 + 88), "set1HzFlipbook:", v6);
      a1 = 1;
    }
  }

  return a1;
}

- (BOOL)isOnStandby
{
  BLSHAlwaysOnPresentationEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_onStandby;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOnStandby:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_onStandby != v3)
  {
    self->_lock_onStandby = v3;
    if (!v3)
      -[BLSHAlwaysOnPresentationEngine lock_completeSleepActionIfPendingForReason:subReason:]((uint64_t)self, CFSTR("no longer on standby"), 0);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)lock_completeSleepActionIfPendingForReason:(void *)a3 subReason:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x2199D2BD8](*(_QWORD *)(a1 + 72));
    v8 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    if (v7)
    {
      bls_flipbook_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 240) - 1;
        if (v10 > 3)
          v11 = CFSTR("Stopped");
        else
          v11 = off_24D1BC958[v10];
        NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(a1 + 64), "state"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v14 = *(_QWORD *)(a1 + 248) - 1;
        if (v14 > 3)
          v15 = CFSTR("Awake");
        else
          v15 = off_24D1BC920[v14];
        v16 = *(unsigned __int8 *)(a1 + 265);
        v17 = *(unsigned __int8 *)(a1 + 266);
        v18 = 134219778;
        v19 = a1;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v5;
        v24 = 2114;
        v25 = v6;
        v26 = 2114;
        v27 = v12;
        v28 = 2114;
        v29 = v15;
        v30 = 1024;
        v31 = v16;
        v32 = 1024;
        v33 = v17;
        _os_log_impl(&dword_2145AC000, v9, OS_LOG_TYPE_INFO, "%p:%{public}@ will complete sleep action for reason:%{public}@ subReason:%{public}@ sleepActionState=%{public}@ fillState:%{public}@ onStandby:%{BOOL}u suppressed:%{BOOL}u", (uint8_t *)&v18, 0x4Au);

      }
      dispatch_async(MEMORY[0x24BDAC9B8], v7);
    }

  }
}

- (BOOL)isSuppressed
{
  BLSHAlwaysOnPresentationEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_suppressed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)suppressForReason:(id)a3
{
  id v4;
  _BOOL4 lock_suppressed;
  BSTimerScheduleQuerying *lock_timer;
  BLSHPreventSystemSleepAsserting *lock_livePowerAssertion;
  void *v8;
  void *v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_suppressed = self->_lock_suppressed;
  if (!self->_lock_suppressed)
  {
    self->_lock_suppressed = 1;
    -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:]((uint64_t)self, v4);
    -[BSTimerScheduleQuerying invalidate](self->_lock_timer, "invalidate");
    lock_timer = self->_lock_timer;
    self->_lock_timer = 0;

    -[BLSHPreventSystemSleepAsserting invalidate](self->_lock_livePowerAssertion, "invalidate");
    lock_livePowerAssertion = self->_lock_livePowerAssertion;
    self->_lock_livePowerAssertion = 0;

  }
  -[BLSHFlipbook frameOnGlass](self->_lock_flipbook, "frameOnGlass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bls_specifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (!lock_suppressed)
    -[BLSHAlwaysOnPresentationEngine noteFlipbookIsCurrentWithSpecifier:]((uint64_t)self, v9);

  return v9;
}

- (void)lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  int v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  const __CFString *v22;
  int v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionForReason:wasPreventingSleep:](a1, v3, objc_msgSend(*(id *)(a1 + 64), "state") == 1);
    v4 = *(_QWORD *)(a1 + 248);
    if (v4 == 2)
    {
      v10 = 3;
    }
    else
    {
      if (v4 != 1)
      {
LABEL_18:
        -[BLSHAlwaysOnPresentationEngine lock_completeSleepActionIfPendingForReason:subReason:](a1, CFSTR("endFlipbookRenderSession"), v3);
LABEL_19:
        objc_msgSend(*(id *)(a1 + 192), "invalidate");
        v16 = *(void **)(a1 + 192);
        *(_QWORD *)(a1 + 192) = 0;

        goto LABEL_20;
      }
      v5 = *(unsigned __int8 *)(a1 + 266);
      bls_flipbook_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v17 = *(_QWORD *)(a1 + 240) - 1;
          if (v17 > 3)
            v18 = CFSTR("Stopped");
          else
            v18 = off_24D1BC958[v17];
          NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(a1 + 64), "state"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          v21 = *(_QWORD *)(a1 + 248) - 1;
          if (v21 > 3)
            v22 = CFSTR("Awake");
          else
            v22 = off_24D1BC920[v21];
          v23 = *(unsigned __int8 *)(a1 + 265);
          v24 = 134219010;
          v25 = a1;
          v26 = 2114;
          v27 = v18;
          v28 = 2114;
          v29 = v19;
          v30 = 2114;
          v31 = v22;
          v32 = 1024;
          v33 = v23;
          _os_log_debug_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (waiting for flipbook) sleepActionState:%{public}@ fillState:%{public}@ onStandby:%{BOOL}u", (uint8_t *)&v24, 0x30u);

        }
        goto LABEL_19;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 240) - 1;
        if (v8 > 3)
          v9 = CFSTR("Stopped");
        else
          v9 = off_24D1BC958[v8];
        NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(a1 + 64), "state"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = *(_QWORD *)(a1 + 248) - 1;
        if (v13 > 3)
          v14 = CFSTR("Awake");
        else
          v14 = off_24D1BC920[v13];
        v15 = *(unsigned __int8 *)(a1 + 265);
        v24 = 134219010;
        v25 = a1;
        v26 = 2114;
        v27 = v9;
        v28 = 2114;
        v29 = v11;
        v30 = 2114;
        v31 = v14;
        v32 = 1024;
        v33 = v15;
        _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "%p:%{public}@ (suppressed — skipped filling flipbook) sleepActionState:%{public}@ fillState:%{public}@ onStandby:%{BOOL}u", (uint8_t *)&v24, 0x30u);

      }
      v10 = 4;
    }
    *(_QWORD *)(a1 + 248) = v10;
    goto LABEL_18;
  }
LABEL_20:

}

- (void)noteFlipbookIsCurrentWithSpecifier:(uint64_t)a1
{
  id v3;
  int v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4 = *(unsigned __int8 *)(a1 + 264);
    *(_BYTE *)(a1 + 264) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __69__BLSHAlwaysOnPresentationEngine_noteFlipbookIsCurrentWithSpecifier___block_invoke;
      v5[3] = &unk_24D1BBE80;
      v5[4] = a1;
      v6 = v3;
      dispatch_async(MEMORY[0x24BDAC9B8], v5);

    }
  }

}

- (BOOL)cacheFlipbook
{
  BLSHAlwaysOnPresentationEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cacheFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCacheFlipbook:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_cacheFlipbook;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_cacheFlipbook = self->_lock_cacheFlipbook;
  self->_lock_cacheFlipbook = v3;
  if (lock_cacheFlipbook != v3)
    -[BLSHFlipbook setCachesFramesOnExit:](self->_lock_flipbook, "setCachesFramesOnExit:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)startLiveUpdates
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_suppressed;
  void *v5;
  NSObject *v6;
  BLSHDateSpecifierModel *v7;
  BLSHDateSpecifierModel *lock_presentationDatesModel;
  uint64_t v9;
  int64_t lock_engineState;
  NSObject *v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  const __CFString *v15;
  os_log_type_t v16;
  unint64_t v17;
  const __CFString *v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const char *v23;
  unint64_t v24;
  const __CFString *v25;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_suppressed = self->_lock_suppressed;
  self->_lock_suppressed = 0;
  if ((unint64_t)(self->_lock_engineState - 2) <= 2)
  {
    -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, CFSTR("startLiveUpdates"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (unint64_t)(self->_lock_engineState - 3) <= 1)
    {
      bls_flipbook_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v24 = self->_lock_engineState - 1;
        if (v24 > 3)
          v25 = CFSTR("Stopped");
        else
          v25 = off_24D1BC958[v24];
        *(_DWORD *)buf = 134218498;
        v27 = self;
        v28 = 2114;
        v29 = v25;
        v30 = 2114;
        v31 = v5;
        _os_log_debug_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEBUG, "%p:%{public}@ engine starting live from flipbook, will live update to:%{public}@", buf, 0x20u);
      }

      os_unfair_lock_unlock(p_lock);
      -[BLSHAlwaysOnPresentationEngine performLiveUpdateToSpecifier:]((uint64_t)self, v5);
      os_unfair_lock_lock(p_lock);
    }

  }
  if (!self->_lock_presentationDatesModel)
  {
    v7 = -[BLSHDateSpecifierModel initWithInactiveBudgetPolicy:]([BLSHDateSpecifierModel alloc], "initWithInactiveBudgetPolicy:", self->_inactiveBudgetPolicy);
    lock_presentationDatesModel = self->_lock_presentationDatesModel;
    self->_lock_presentationDatesModel = v7;

  }
  v9 = -[BLSHOnSystemSleepAction state](self->_sleepAction, "state");
  lock_engineState = self->_lock_engineState;
  bls_flipbook_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (lock_engineState == 1)
  {
    if (lock_suppressed)
    {
      LOBYTE(v13) = v9 != 2;
      if (os_log_type_enabled(v11, (os_log_type_t)(v9 != 2)))
      {
        v14 = self->_lock_engineState - 1;
        if (v14 > 3)
          v15 = CFSTR("Stopped");
        else
          v15 = off_24D1BC958[v14];
        NSStringFromBLSHOnSystemSleepActionState(v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v27 = self;
        v28 = 2114;
        v29 = v15;
        v30 = 2114;
        v31 = v22;
        v23 = "%p:%{public}@ engine continuing live (no longer suppressed) sleep:%{public}@";
LABEL_27:
        _os_log_impl(&dword_2145AC000, v12, (os_log_type_t)v13, v23, buf, 0x20u);

      }
    }
    else
    {
      v13 = (2 * (v9 != 2));
      if (os_log_type_enabled(v11, (os_log_type_t)(2 * (v9 != 2))))
      {
        v19 = self->_lock_engineState - 1;
        if (v19 > 3)
          v20 = CFSTR("Stopped");
        else
          v20 = off_24D1BC958[v19];
        NSStringFromBLSHOnSystemSleepActionState(v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v27 = self;
        v28 = 2114;
        v29 = v20;
        v30 = 2114;
        v31 = v22;
        v23 = "%p:%{public}@ engine continuing live sleep:%{public}@";
        goto LABEL_27;
      }
    }

    goto LABEL_29;
  }
  v16 = v9 != 2;
  if (os_log_type_enabled(v11, (os_log_type_t)(v9 != 2)))
  {
    v17 = self->_lock_engineState - 1;
    if (v17 > 3)
      v18 = CFSTR("Stopped");
    else
      v18 = off_24D1BC958[v17];
    NSStringFromBLSHOnSystemSleepActionState(v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v27 = self;
    v28 = 2114;
    v29 = v18;
    v30 = 2114;
    v31 = v21;
    _os_log_impl(&dword_2145AC000, v12, v16, "%p:%{public}@->Live engine starting live sleep:%{public}@", buf, 0x20u);

  }
  self->_lock_engineState = 1;
LABEL_29:
  -[BLSHAlwaysOnPresentationEngine _lock_acquireAlwaysOnLivePowerAssertion]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  if (lock_engineState != 1)
    BSDispatchMain();
}

- (id)lock_stopForReason:(int)a3 shouldEmptyModel:
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 240);
    if (v6)
    {
      if (v6 == 1)
      {
        v7 = *(id *)(a1 + 152);
        v8 = *(void **)(a1 + 152);
        *(_QWORD *)(a1 + 152) = 0;

        v9 = 0;
      }
      else
      {
        -[BLSHAlwaysOnPresentationEngine lock_cancelFlipbookFramesAndCollectForReason:](a1, CFSTR("stopFlipbook"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bls_specifier");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a3)
        -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:](a1, v5);
      else
        -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionForReason:wasPreventingSleep:](a1, v5, 0);
      objc_msgSend(*(id *)(a1 + 208), "invalidate");
      v10 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = 0;

      objc_msgSend(*(id *)(a1 + 200), "invalidate");
      v11 = *(void **)(a1 + 200);
      *(_QWORD *)(a1 + 200) = 0;

    }
    else
    {
      v7 = 0;
      v9 = 0;
    }
    *(_QWORD *)(a1 + 240) = 0;
    bls_flipbook_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(v6 - 1) > 3)
        v13 = CFSTR("Stopped");
      else
        v13 = off_24D1BC958[v6 - 1];
      if (a3)
        v14 = "stopping";
      else
        v14 = "suspending";
      v15 = *(void **)(a1 + 104);
      v16 = "previousOnGlassFrame";
      if (!v15)
        v16 = "currentSpecifier";
      if (v9)
        v17 = "onGlassFrame";
      else
        v17 = v16;
      if (!v15)
        v15 = v7;
      objc_msgSend(v15, "bls_loggingString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 134219266;
      v25 = a1;
      v26 = 2114;
      v27 = v13;
      v28 = 2080;
      v29 = v14;
      v30 = 2114;
      v31 = v5;
      v32 = 2080;
      v33 = v17;
      v34 = 2114;
      v35 = v18;
      _os_log_impl(&dword_2145AC000, v12, OS_LOG_TYPE_INFO, "%p:%{public}@->Stopped engine %s (%{public}@) %s:%{public}@", (uint8_t *)&v24, 0x3Eu);

    }
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 144), "invalidate");
      v19 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

      v20 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

      v21 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 24), "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "purgeStaleDataForNowDate:", v22);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performLiveUpdateToSpecifier:(uint64_t)a1
{
  void *v2;
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v2 = a2;
  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 8));
    if (v4)
    {
      v18 = v2;
      objc_msgSend(v4, "specifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      bls_flipbook_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 240) - 1;
        if (v7 > 3)
          v8 = CFSTR("Stopped");
        else
          v8 = off_24D1BC958[v7];
        objc_msgSend(v4, "bls_loggingString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v25 = a1;
        v26 = 2114;
        v27 = v8;
        v28 = 2114;
        v29 = v9;
        _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ performing live updates for specifier:%{public}@", buf, 0x20u);

      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v15, "environment");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dateSpecifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "updateToDateSpecifier:sceneContentsUpdated:", v17, &__block_literal_global_179);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

      v2 = v18;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_storeStrong((id *)(a1 + 152), v2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

- (uint64_t)_lock_acquireAlwaysOnLivePowerAssertion
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 200))
    {
      objc_msgSend(*(id *)(result + 24), "createPowerAssertionWithIdentifier:", CFSTR("always on (live)"));
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(v1 + 200);
      *(_QWORD *)(v1 + 200) = v2;

      return objc_msgSend(*(id *)(v1 + 200), "acquireWithTimeout:handler:", 0, 0.0);
    }
  }
  return result;
}

void __50__BLSHAlwaysOnPresentationEngine_startLiveUpdates__block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)main_performNextStep
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, v1, "%p:%{public}@ suppressed - do no more work", v2);
  OUTLINED_FUNCTION_2();
}

- (void)startFlipbookAndEnsureCurrent
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_suppressed;
  id v5;
  BLSHDateSpecifierModel *v6;
  BLSHDateSpecifierModel *lock_presentationDatesModel;
  int64_t lock_engineState;
  uint64_t v9;
  void *v10;
  int v11;
  BSTimerScheduleQuerying *lock_timer;
  BLSHPreventSystemSleepAsserting *lock_livePowerAssertion;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  unint64_t v18;
  const __CFString *v19;
  BOOL v20;
  const __CFString *v21;
  unint64_t v22;
  const __CFString *v23;
  unint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  const __CFString *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  uint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  unint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldNotifyFlipbookCurrent = 1;
  lock_suppressed = self->_lock_suppressed;
  self->_lock_suppressed = 0;
  if (self->_lock_engineState == 1)
    v5 = -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, CFSTR("startFlipbook"), 0);
  if (!self->_lock_presentationDatesModel)
  {
    v6 = -[BLSHDateSpecifierModel initWithInactiveBudgetPolicy:]([BLSHDateSpecifierModel alloc], "initWithInactiveBudgetPolicy:", self->_inactiveBudgetPolicy);
    lock_presentationDatesModel = self->_lock_presentationDatesModel;
    self->_lock_presentationDatesModel = v6;

  }
  lock_engineState = self->_lock_engineState;
  v9 = -[BLSHOnSystemSleepAction state](self->_sleepAction, "state");
  -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveSession, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isLiveUpdating");

  if (!v11 || v9)
  {
    -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
    -[BLSHPreventSystemSleepAsserting invalidate](self->_lock_livePowerAssertion, "invalidate");
    lock_livePowerAssertion = self->_lock_livePowerAssertion;
    self->_lock_livePowerAssertion = 0;

  }
  else
  {
    -[BLSHAlwaysOnPresentationEngine _lock_acquireAlwaysOnLiveFlipbookPowerAssertion]((uint64_t)self);
    if ((unint64_t)(self->_lock_engineState - 3) <= 1)
    {
      -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:]((uint64_t)self, CFSTR("live updating"));
      -[BSTimerScheduleQuerying invalidate](self->_lock_timer, "invalidate");
      lock_timer = self->_lock_timer;
      self->_lock_timer = 0;

    }
    self->_lock_engineState = 2;
  }
  if (self->_lock_fillFlipbookState == 1)
    self->_lock_fillFlipbookState = 2;
  v14 = self->_lock_engineState;
  bls_flipbook_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == lock_engineState)
  {
    if (lock_suppressed)
    {
      v17 = v9 != 2;
      if (os_log_type_enabled(v15, (os_log_type_t)(v9 != 2)))
      {
        v18 = self->_lock_engineState - 1;
        if (v18 > 3)
          v19 = CFSTR("Stopped");
        else
          v19 = off_24D1BC958[v18];
        NSStringFromBLSHOnSystemSleepActionState(v9);
        v34 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v34;
        v35 = self->_lock_fillFlipbookState - 1;
        if (v35 > 3)
          v36 = CFSTR("Awake");
        else
          v36 = off_24D1BC920[v35];
        *(_DWORD *)buf = 134218754;
        v41 = self;
        v42 = 2114;
        v43 = v19;
        v44 = 2114;
        v45 = v34;
        v46 = 2114;
        v47 = (uint64_t)v36;
        v30 = "%p:%{public}@ engine continuing flipbook (no longer suppressed) sleep:%{public}@ fill:%{public}@";
LABEL_42:
        v31 = v16;
        v32 = v17;
        v33 = 42;
LABEL_43:
        _os_log_impl(&dword_2145AC000, v31, v32, v30, buf, v33);

      }
    }
    else
    {
      v17 = 2 * (v9 != 2);
      if (os_log_type_enabled(v15, v17))
      {
        v22 = self->_lock_engineState - 1;
        if (v22 > 3)
          v23 = CFSTR("Stopped");
        else
          v23 = off_24D1BC958[v22];
        NSStringFromBLSHOnSystemSleepActionState(v9);
        v37 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v37;
        v38 = self->_lock_fillFlipbookState - 1;
        if (v38 > 3)
          v39 = CFSTR("Awake");
        else
          v39 = off_24D1BC920[v38];
        *(_DWORD *)buf = 134218754;
        v41 = self;
        v42 = 2114;
        v43 = v23;
        v44 = 2114;
        v45 = v37;
        v46 = 2114;
        v47 = (uint64_t)v39;
        v30 = "%p:%{public}@ engine continuing flipbook sleep:%{public}@ fill:%{public}@";
        goto LABEL_42;
      }
    }
  }
  else
  {
    v20 = v9 != 2;
    if (os_log_type_enabled(v15, (os_log_type_t)(v9 != 2)))
    {
      if ((unint64_t)(lock_engineState - 1) > 3)
        v21 = CFSTR("Stopped");
      else
        v21 = off_24D1BC958[lock_engineState - 1];
      v24 = self->_lock_engineState - 1;
      if (v24 > 3)
        v25 = CFSTR("Stopped");
      else
        v25 = off_24D1BC958[v24];
      NSStringFromBLSHOnSystemSleepActionState(v9);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      v28 = self->_lock_fillFlipbookState - 1;
      if (v28 > 3)
        v29 = CFSTR("Awake");
      else
        v29 = off_24D1BC920[v28];
      *(_DWORD *)buf = 134219010;
      v41 = self;
      v42 = 2114;
      v43 = v21;
      v44 = 2114;
      v45 = (uint64_t)v25;
      v46 = 2114;
      v47 = v26;
      v48 = 2114;
      v49 = v29;
      v30 = "%p:%{public}@->%{public}@ engine starting flipbook sleep:%{public}@ fill:%{public}@";
      v31 = v16;
      v32 = v20;
      v33 = 52;
      goto LABEL_43;
    }
  }

  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

- (uint64_t)_lock_acquireAlwaysOnLiveFlipbookPowerAssertion
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 200))
    {
      objc_msgSend(*(id *)(result + 24), "createPowerAssertionWithIdentifier:", CFSTR("always on (live flipbook)"));
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(void **)(v1 + 200);
      *(_QWORD *)(v1 + 200) = v2;

      return objc_msgSend(*(id *)(v1 + 200), "acquireWithTimeout:handler:", 0, 0.0);
    }
  }
  return result;
}

- (uint64_t)lock_setFlipbookPredictiveRenderType
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    if (objc_msgSend(*(id *)(result + 64), "state"))
    {
      v2 = 4;
    }
    else if (*(_BYTE *)(v1 + 268))
    {
      v2 = 4;
    }
    else
    {
      v2 = 3;
    }
    v3 = *(_QWORD *)(v1 + 240);
    *(_QWORD *)(v1 + 240) = v2;
    if (v2 == v3)
    {
      return 0;
    }
    else
    {
      bls_flipbook_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = CFSTR("Stopped");
        v6 = CFSTR("Stopped");
        if ((unint64_t)(v3 - 1) <= 3)
          v6 = off_24D1BC958[v3 - 1];
        if (v2 == 3)
          v5 = CFSTR("PredictiveFlipbook-JustInTime");
        if (v2 == 4)
          v5 = CFSTR("PredictiveFlipbook-Fill");
        v7 = v5;
        NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(v1 + 64), "state"));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = *(_QWORD *)(v1 + 248) - 1;
        if (v10 > 3)
          v11 = CFSTR("Awake");
        else
          v11 = off_24D1BC920[v10];
        v12 = *(unsigned __int8 *)(v1 + 265);
        v13 = 134219266;
        v14 = v1;
        v15 = 2114;
        v16 = v6;
        v17 = 2114;
        v18 = v7;
        v19 = 2114;
        v20 = v8;
        v21 = 2114;
        v22 = v11;
        v23 = 1024;
        v24 = v12;
        _os_log_debug_impl(&dword_2145AC000, v4, OS_LOG_TYPE_DEBUG, "%p:%{public}@->%{public}@ did change flipbook render type sleepActionState:%{public}@ fillState:%{public}@ onStandby:%{BOOL}u", (uint8_t *)&v13, 0x3Au);

      }
      -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates](v1);
      return 1;
    }
  }
  return result;
}

void __63__BLSHAlwaysOnPresentationEngine_startFlipbookAndEnsureCurrent__block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (id)suspendForReason:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)stopForReason:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)lock_cancelFlipbookFramesAndCollectForReason:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    v4 = a2;
    objc_msgSend(v3, "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHAlwaysOnPresentationEngine lock_cancelFlipbookFramesForReason:source:didClearDateSpecifiers:wasReset:](a1, v4, v6, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_storeStrong((id *)(a1 + 96), v7);
    objc_msgSend(*(id *)(a1 + 88), "collect");
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)lock_endFlipbookRenderSessionForReason:(int)a3 wasPreventingSleep:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  int v16;
  int v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  double v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    v6 = *(void **)(a1 + 184);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v7, "count");
      kdebug_trace();
      BSContinuousMachTimeNow();
      v9 = v8;
      bls_flipbook_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 240) - 1;
        if (v11 > 3)
          v12 = CFSTR("Stopped");
        else
          v12 = off_24D1BC958[v11];
        NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(a1 + 64), "state", v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 248) - 1;
        if (v14 > 3)
          v15 = CFSTR("Awake");
        else
          v15 = off_24D1BC920[v14];
        v16 = *(unsigned __int8 *)(a1 + 265);
        v17 = *(unsigned __int8 *)(a1 + 266);
        -[BLSHAlwaysOnPresentationEngine loggingStreamForRenderSession]((id *)a1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134220034;
        v35 = a1;
        v36 = 2114;
        v37 = v27;
        v38 = 2048;
        v39 = v7;
        v40 = 2114;
        v41 = v5;
        v42 = 2114;
        v43 = v13;
        v44 = 2114;
        v45 = v15;
        v46 = 1024;
        v47 = v16;
        v48 = 1024;
        v49 = v17;
        v50 = 2114;
        v51 = v18;
        _os_log_impl(&dword_2145AC000, v10, OS_LOG_TYPE_INFO, "%p:%{public}@ ending render session:%p for reason:%{public}@ sleepActionState:%{public}@ fillState:%{public}@ stby:%{BOOL}u sup:%{BOOL}u %{public}@", buf, 0x54u);

      }
      v19 = *(id *)(a1 + 56);
      v20 = 0.0;
      if (a3)
      {
        BSContinuousMachTimeNow();
        v20 = v21 - *(double *)(a1 + 256);
      }
      v22 = (void *)MEMORY[0x24BE0B998];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __92__BLSHAlwaysOnPresentationEngine_lock_endFlipbookRenderSessionForReason_wasPreventingSleep___block_invoke;
      v28[3] = &unk_24D1BC630;
      v29 = v7;
      v32 = v9;
      v33 = v20;
      v30 = v5;
      v31 = v19;
      v23 = v19;
      v24 = v7;
      objc_msgSend(v22, "dispatchWithQOSClass:block:", 17, v28);
      objc_msgSend(v24, "invalidate");
      v25 = *(void **)(a1 + 184);
      *(_QWORD *)(a1 + 184) = 0;

    }
    v26 = *(void **)(a1 + 176);
    *(_QWORD *)(a1 + 176) = 0;

    *(_QWORD *)(a1 + 232) = 0;
    -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates](a1);
  }

}

- (id)lock_cancelFlipbookFramesForReason:(void *)a3 source:(int)a4 didClearDateSpecifiers:(int)a5 wasReset:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  unint64_t v16;
  id v17;
  const __CFString *v18;
  const char *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD);
  dispatch_time_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  double v51;
  char v52;
  char v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  char *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 88), "activeFrames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "cancelAllFrames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)(a1 + 104), v10);
    objc_msgSend(*(id *)(a1 + 88), "activeFrames");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "count"))
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      v32 = objc_msgSend(v44, "count");
      objc_msgSend(v44, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bls_loggingString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("[[CAFlipbook activeFrames] count] should be zero (not %d) after cancelAllFrames lastFrame:%@ (did backboardd die?)"), v32, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v35;
      BLSHRecordCriticalAssertFailure(v35);
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke;
      v54[3] = &unk_24D1BC070;
      v56 = a1;
      v57 = sel_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset_;
      v55 = v44;
      v37 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v54);
      if (BLSHIsUnitTestRunning())
      {
        v37[2](v37);
      }
      else
      {
        v38 = dispatch_time(0, 1000000000);
        dispatch_after(v38, MEMORY[0x24BDAC9B8], v37);
      }

    }
    v11 = *(_QWORD *)(a1 + 240) - 3;
    v12 = objc_msgSend(v9, "count");
    bls_flipbook_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11 < 2)
      v15 = OS_LOG_TYPE_INFO;
    else
      v15 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v13, v15))
    {
      v39 = v9;
      v40 = v8;
      v16 = *(_QWORD *)(a1 + 240) - 1;
      v17 = v7;
      if (v16 > 3)
        v18 = CFSTR("Stopped");
      else
        v18 = off_24D1BC958[v16];
      if (v10)
        v19 = "onGlassFrame";
      else
        v19 = "previousOnGlassFrame";
      v20 = v10;
      if (!v10)
        v20 = *(void **)(a1 + 104);
      objc_msgSend(v20, "bls_shortLoggingString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v44, "count");
      *(_DWORD *)buf = 134220290;
      v59 = a1;
      v60 = 2114;
      v61 = v18;
      v62 = 2114;
      v8 = v40;
      v63 = v40;
      v64 = 2114;
      v65 = v17;
      v66 = 1024;
      v67 = v12;
      v68 = 1024;
      v69 = a4;
      v70 = 1024;
      v71 = a5;
      v72 = 2080;
      v73 = v19;
      v7 = v17;
      v74 = 2114;
      v75 = v21;
      v76 = 1024;
      v77 = v22;
      _os_log_impl(&dword_2145AC000, v14, v15, "%p:%{public}@ invalidate flipbook for source:%{public}@ reason:%{public}@ frameCount:%u didClearDateSpecifiers:%{BOOL}u wasReset:%{BOOL}u %s:%{public}@ zeroedFrameCount:%u", buf, 0x56u);

      v9 = v39;
    }

    objc_msgSend(*(id *)(a1 + 32), "performInvalidation");
    if (v12)
    {
      BSContinuousMachTimeNow();
      v24 = v23;
      v25 = objc_alloc(MEMORY[0x24BDBCE60]);
      objc_msgSend(v25, "bls_initWithBSContinuousMachTime:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = *(id *)(a1 + 56);
      v28 = (void *)MEMORY[0x24BE0B998];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke_163;
      v45[3] = &unk_24D1BC738;
      v46 = v9;
      v51 = v24;
      v47 = v7;
      v52 = a4;
      v53 = a5;
      v48 = v8;
      v49 = v26;
      v50 = v27;
      v29 = v27;
      v30 = v26;
      objc_msgSend(v28, "dispatchWithQOSClass:block:", 17, v45);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)purgeFlipbook
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHFlipbook collect](self->_lock_flipbook, "collect");
  -[BLSHFlipbook purge](self->_lock_flipbook, "purge");
  os_unfair_lock_unlock(p_lock);
}

- (void)requestDatesOperation:(id)a3 environment:(id)a4 didProvideSpecifiers:(id)a5 forPresentationInterval:(id)a6 isComplete:(BOOL)a7
{
  _BOOL4 v7;
  BLSHEngineRequestDatesOperation *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  BSTimerScheduleQuerying *lock_timer;
  NSObject *v18;
  _BOOL4 v19;
  BLSHEngineRequestDatesOperation *lock_requestDatesOperation;
  NSDateInterval *v21;
  NSDateInterval *lock_lastRequestInterval;
  BLSHFlipbookTelemetry *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BLSHEngineRequestDatesOperation *v27;
  BLSHFlipbookTelemetry *v28;
  unint64_t v29;
  const __CFString *v30;
  unint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  _QWORD block[5];
  _QWORD v42[4];
  BLSHEngineRequestDatesOperation *v43;
  BLSHFlipbookTelemetry *v44;
  uint64_t v45;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  BLSHEngineRequestDatesOperation *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v7 = a7;
  v58 = *MEMORY[0x24BDAC8D0];
  v12 = (BLSHEngineRequestDatesOperation *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  os_unfair_lock_lock(&self->_lock);
  v16 = MEMORY[0x24BDAC760];
  if (self->_lock_requestDatesOperation != v12)
  {
    os_unfair_lock_unlock(&self->_lock);
    if (!v7)
      goto LABEL_12;
    goto LABEL_9;
  }
  -[BLSHDateSpecifierModel registerSpecifiers:forDateInterval:environment:](self->_lock_presentationDatesModel, "registerSpecifiers:forDateInterval:environment:", v14, v15, v13);
  if (self->_lock_engineState == 1)
  {
    -[BSTimerScheduleQuerying invalidate](self->_lock_timer, "invalidate");
    lock_timer = self->_lock_timer;
    self->_lock_timer = 0;

  }
  bls_flipbook_log();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v19)
    {
      v29 = self->_lock_engineState - 1;
      if (v29 > 3)
        v30 = CFSTR("Stopped");
      else
        v30 = off_24D1BC958[v29];
      v39 = v30;
      objc_msgSend(v13, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bls_shortLoggingString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bls_boundedDescriptionWithTransformer:", &__block_literal_global_4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v47 = self;
      v48 = 2114;
      v49 = v39;
      v50 = 2114;
      v51 = v37;
      v52 = 2114;
      v53 = v12;
      v54 = 2114;
      v55 = v35;
      v56 = 2114;
      v57 = v33;
      _os_log_debug_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (%{public}@) did complete request dates operation:%{public}@, interval:%{public}@ specifiers:%{public}@", buf, 0x3Eu);

    }
    lock_requestDatesOperation = self->_lock_requestDatesOperation;
    self->_lock_requestDatesOperation = 0;

    self->_lock_requestDatesOperationDidTimeout = 0;
    -[BLSHEngineRequestDatesOperation requestInterval](v12, "requestInterval");
    v21 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
    lock_lastRequestInterval = self->_lock_lastRequestInterval;
    self->_lock_lastRequestInterval = v21;

    -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates]((uint64_t)self);
    os_unfair_lock_unlock(&self->_lock);
LABEL_9:
    v23 = self->_flipbookTelemetryDelegate;
    BSContinuousMachTimeNow();
    v25 = v24;
    v26 = (void *)MEMORY[0x24BE0B998];
    v42[0] = v16;
    v42[1] = 3221225472;
    v42[2] = __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138;
    v42[3] = &unk_24D1BC070;
    v27 = v12;
    v45 = v25;
    v43 = v27;
    v44 = v23;
    v28 = v23;
    objc_msgSend(v26, "dispatchWithQOSClass:block:", 17, v42);
    -[BLSHEngineRequestDatesOperation invalidate](v27, "invalidate");

    goto LABEL_12;
  }
  if (v19)
  {
    v31 = self->_lock_engineState - 1;
    if (v31 > 3)
      v32 = CFSTR("Stopped");
    else
      v32 = off_24D1BC958[v31];
    v40 = v32;
    objc_msgSend(v13, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bls_shortLoggingString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bls_boundedDescriptionWithTransformer:", &__block_literal_global_136);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v47 = self;
    v48 = 2114;
    v49 = v40;
    v50 = 2114;
    v51 = v38;
    v52 = 2114;
    v53 = v12;
    v54 = 2114;
    v55 = v36;
    v56 = 2114;
    v57 = v34;
    _os_log_debug_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (%{public}@) updated request dates operation:%{public}@, interval:%{public}@ specifiers:%{public}@", buf, 0x3Eu);

  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_12:
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_139;
  block[3] = &unk_24D1BC268;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (uint64_t)lock_invalidateFlipbookUpdates
{
  uint64_t v1;
  id v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = (id)objc_msgSend(*(id *)(result + 168), "invalidate");
    v3 = *(void **)(v1 + 168);
    *(_QWORD *)(v1 + 168) = 0;

    return objc_msgSend(*(id *)(v1 + 32), "resetFutureSpecifiers");
  }
  return result;
}

uint64_t __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_135(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

void __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "telemetryDataWithEndTime:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  bls_flipbook_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logTelemetryForRequestDates:", v2);
}

void __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_139(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)requestDatesOperation:(id)a3 didTimeoutPendingEnvironments:(id)a4
{
  BLSHEngineRequestDatesOperation *v6;
  id v7;
  BLSHEngineRequestDatesOperation *lock_requestDatesOperation;
  NSObject *v9;
  BLSHEngineRequestDatesOperation *v10;
  BLSHFlipbookTelemetry *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BLSHEngineRequestDatesOperation *v16;
  BLSHFlipbookTelemetry *v17;
  unint64_t v18;
  const __CFString *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  BLSHEngineRequestDatesOperation *v22;
  BLSHFlipbookTelemetry *v23;
  uint64_t v24;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  BLSHEngineRequestDatesOperation *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (BLSHEngineRequestDatesOperation *)a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_requestDatesOperation = self->_lock_requestDatesOperation;
  if (lock_requestDatesOperation == v6)
  {
    bls_flipbook_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v18 = self->_lock_engineState - 1;
      if (v18 > 3)
        v19 = CFSTR("Stopped");
      else
        v19 = off_24D1BC958[v18];
      *(_DWORD *)buf = 134218754;
      v26 = self;
      v27 = 2114;
      v28 = v19;
      v29 = 2114;
      v30 = v6;
      v31 = 2114;
      v32 = v7;
      _os_log_debug_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEBUG, "%p:%{public}@ did timeout render dates operation:%{public}@ pendingEnvironments:%{public}@", buf, 0x2Au);
    }

    v10 = self->_lock_requestDatesOperation;
    self->_lock_requestDatesOperation = 0;

    self->_lock_requestDatesOperationDidTimeout = 1;
    -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates]((uint64_t)self);
  }
  os_unfair_lock_unlock(&self->_lock);
  v11 = self->_flipbookTelemetryDelegate;
  BSContinuousMachTimeNow();
  v13 = v12;
  v14 = (void *)MEMORY[0x24BE0B998];
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke;
  v21[3] = &unk_24D1BC070;
  v16 = v6;
  v22 = v16;
  v24 = v13;
  v17 = v11;
  v23 = v17;
  objc_msgSend(v14, "dispatchWithQOSClass:block:", 17, v21);
  -[BLSHEngineRequestDatesOperation invalidate](v16, "invalidate");
  if (lock_requestDatesOperation == v6)
  {
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke_140;
    v20[3] = &unk_24D1BC268;
    v20[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);
  }

}

void __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "telemetryDataWithEndTime:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  bls_flipbook_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "logTelemetryForRequestDates:", v2);
}

void __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke_140(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)renderFramesSession:(id)a3 didRenderFrame:(id)a4 timedOutEnvironments:(id)a5
{
  id v6;
  BLSHPresentationDateSpecifier *v7;
  BLSHPresentationDateSpecifier *lock_renderingSpecifier;
  unint64_t v9;
  _QWORD block[5];

  v6 = a4;
  objc_msgSend(v6, "bls_specifier");
  v7 = (BLSHPresentationDateSpecifier *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  lock_renderingSpecifier = self->_lock_renderingSpecifier;
  if (lock_renderingSpecifier == v7)
  {
    self->_lock_renderingSpecifier = 0;

    self->_lock_renderingSpecifier_backoffTime = 0;
  }
  v9 = self->_lock_engineState - 2;
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHFlipbookHistory addRenderedFrameToHistory:](self->_renderedFlipbookHistory, "addRenderedFrameToHistory:", v6);

  -[BLSHInactiveBudgetPolicing_Private chargeRenderedSpecifier:](self->_inactiveBudgetPolicy, "chargeRenderedSpecifier:", v7);
  if (v9 <= 2)
    -[BLSHAlwaysOnPresentationEngine noteFlipbookIsCurrentWithSpecifier:]((uint64_t)self, v7);
  if (lock_renderingSpecifier == v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__BLSHAlwaysOnPresentationEngine_renderFramesSession_didRenderFrame_timedOutEnvironments___block_invoke;
    block[3] = &unk_24D1BC268;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __90__BLSHAlwaysOnPresentationEngine_renderFramesSession_didRenderFrame_timedOutEnvironments___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

void __69__BLSHAlwaysOnPresentationEngine_noteFlipbookIsCurrentWithSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 264);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (!v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentationEngine:didUpdateToCurrentWithSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)renderFramesSession:(id)a3 failedToRenderSpecifier:(id)a4 error:(id)a5 timedOutEnvironments:(id)a6
{
  BLSHPresentationDateSpecifier *lock_renderingSpecifier;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  BLSHPresentationDateSpecifier *v11;
  BLSHPresentationDateSpecifier *v13;

  v13 = (BLSHPresentationDateSpecifier *)a4;
  os_unfair_lock_lock(&self->_lock);
  lock_renderingSpecifier = self->_lock_renderingSpecifier;
  if (lock_renderingSpecifier == v13)
  {
    -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:]((uint64_t)self, CFSTR("failed to render"));
    v8 = mach_continuous_time();
    self->_lock_renderingSpecifier_backoffTime = BLSMachTimeFromNSTimeInterval() + v8;
    -[BLSHPresentationDateSpecifier presentationDate](v13, "presentationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHAlwaysOnPresentationEngine lock_scheduleUpdateTimerForNextUpdatesStart:]((uint64_t)self, v9);

  }
  v10 = self->_lock_engineState - 5;
  os_unfair_lock_unlock(&self->_lock);
  v11 = v13;
  if (lock_renderingSpecifier == v13 && v10 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    -[BLSHAlwaysOnPresentationEngine noteFlipbookIsCurrentWithSpecifier:]((uint64_t)self, 0);
    v11 = v13;
  }

}

- (void)lock_scheduleUpdateTimerForNextUpdatesStart:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  NSObject *v30;
  unint64_t v31;
  const __CFString *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  unint64_t v38;
  const __CFString *v39;
  unint64_t v40;
  const __CFString *v41;
  unint64_t v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  id v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  unint64_t v52;
  const __CFString *v53;
  NSObject *v54;
  unint64_t v55;
  const __CFString *v56;
  unint64_t v57;
  const __CFString *v58;
  NSObject *v59;
  unint64_t v60;
  const __CFString *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  double v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  __CFString *v79;
  _QWORD block[5];
  _QWORD v81[4];
  NSObject *v82;
  id v83;
  id v84;
  id location;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  double v91;
  __int16 v92;
  double v93;
  __int16 v94;
  id v95;
  __int16 v96;
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToDate:", v3);

    if (v5)
    {
      bls_flipbook_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 240) - 1;
        if (v7 > 3)
          v8 = CFSTR("Stopped");
        else
          v8 = off_24D1BC958[v7];
        objc_msgSend(v3, "bls_shortLoggingString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v87 = a1;
        v88 = 2114;
        v89 = v8;
        v90 = 2114;
        v91 = *(double *)&v9;
        _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ will use 30 seconds from now, nextsUpdateStart:%{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 24), "dateWithTimeIntervalSinceNow:", 30.0);
      v10 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v10;
    }
    v11 = *(_QWORD *)(a1 + 240);
    v12 = 0.045;
    if ((unint64_t)(v11 - 3) < 2)
      v12 = 1.0;
    if (v11 == 4)
      v13 = 3.0;
    else
      v13 = v12;
    objc_msgSend(*(id *)(a1 + 24), "now", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v14);
    v16 = v15;

    v17 = v16 > 0.0 && (unint64_t)(v11 - 3) < 2;
    if (v17 && v16 < v13 + -0.045)
      v18 = v16 * 0.5 + 0.016;
    else
      v18 = v13;
    objc_msgSend(v3, "dateByAddingTimeInterval:", -v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("AlwaysOnPresentationEngine");
    if (v11 == 4)
      v20 = CFSTR("AlwaysOnPresentationEngine-waking");
    v79 = v20;
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 24), "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceDate:](v19, "timeIntervalSinceDate:", v21);
      v23 = v22;

      if (objc_msgSend(*(id *)(a1 + 208), "isScheduled"))
      {
        objc_msgSend(*(id *)(a1 + 208), "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[__CFString isEqualToString:](v79, "isEqualToString:", v24);

        if (v25)
        {
          objc_msgSend(*(id *)(a1 + 208), "timeRemaining");
          v27 = v26;
          v28 = v26 + 0.015;
          if (v23 + 0.015 >= v27 && v23 <= v28)
          {
            bls_flipbook_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = *(_QWORD *)(a1 + 240) - 1;
              if (v31 > 3)
                v32 = CFSTR("Stopped");
              else
                v32 = off_24D1BC958[v31];
              -[NSObject bls_loggingString](v19, "bls_loggingString");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v87 = a1;
              v88 = 2114;
              v89 = v32;
              v90 = 2048;
              v91 = v27;
              v92 = 2114;
              v93 = *(double *)&v76;
              _os_log_impl(&dword_2145AC000, v30, OS_LOG_TYPE_INFO, "%p:%{public}@ timer already scheduled in %lfs will not schedule a new timer for %{public}@", buf, 0x2Au);

            }
LABEL_77:

            goto LABEL_78;
          }
        }
      }
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 208), "isScheduled"))
      {
        objc_msgSend(*(id *)(a1 + 208), "timeRemaining");
        v34 = v33;
        objc_msgSend(*(id *)(a1 + 80), "maximumRenderInterval");
        v36 = v35 * 2.5;
        if (v34 < v35 * 2.5)
        {
          bls_flipbook_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v42 = *(_QWORD *)(a1 + 240) - 1;
            if (v42 > 3)
              v43 = CFSTR("Stopped");
            else
              v43 = off_24D1BC958[v42];
            *(_DWORD *)buf = 134218498;
            v87 = a1;
            v88 = 2114;
            v89 = v43;
            v90 = 2048;
            v91 = v34;
            _os_log_debug_impl(&dword_2145AC000, v19, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (nil next update) timer already scheduled in %lfs will not reschedule", buf, 0x20u);
          }
          goto LABEL_77;
        }
        objc_msgSend(*(id *)(a1 + 24), "dateWithTimeIntervalSinceNow:", v35 * 2.5);
        v19 = objc_claimAutoreleasedReturnValue();
        bls_flipbook_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = *(_QWORD *)(a1 + 240) - 1;
          if (v38 > 3)
            v39 = CFSTR("Stopped");
          else
            v39 = off_24D1BC958[v38];
          -[NSObject bls_shortLoggingString](v19, "bls_shortLoggingString");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v87 = a1;
          v88 = 2114;
          v89 = v39;
          v90 = 2048;
          v91 = v34;
          v92 = 2048;
          v93 = v36;
          v94 = 2114;
          v95 = v77;
          _os_log_debug_impl(&dword_2145AC000, v37, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (nil next update) timer already scheduled but %lfs is more than %lfs in the future, will reschedule for %{public}@", buf, 0x34u);

        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 24), "dateWithTimeIntervalSinceNow:", 30.0);
        v19 = objc_claimAutoreleasedReturnValue();
        bls_flipbook_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v40 = *(_QWORD *)(a1 + 240) - 1;
          if (v40 > 3)
            v41 = CFSTR("Stopped");
          else
            v41 = off_24D1BC958[v40];
          -[NSObject bls_shortLoggingString](v19, "bls_shortLoggingString");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v87 = a1;
          v88 = 2114;
          v89 = v41;
          v90 = 2114;
          v91 = *(double *)&v44;
          _os_log_impl(&dword_2145AC000, v37, OS_LOG_TYPE_INFO, "%p:%{public}@ (nil next update) will use 30 seconds from now, nextsUpdateStart:%{public}@", buf, 0x20u);

        }
      }

      objc_msgSend(*(id *)(a1 + 24), "now");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceDate:](v19, "timeIntervalSinceDate:", v45);
      v23 = v46;

    }
    objc_initWeak(&location, (id)a1);
    v47 = MEMORY[0x24BDAC760];
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke;
    v81[3] = &unk_24D1BC820;
    objc_copyWeak(&v84, &location);
    v19 = v19;
    v82 = v19;
    v48 = v3;
    v83 = v48;
    v49 = (void *)MEMORY[0x2199D2BD8](v81);
    objc_msgSend(*(id *)(a1 + 208), "invalidate");
    if (v11 == 4)
    {
      if (v23 >= v18)
      {
        bls_flipbook_log();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v57 = *(_QWORD *)(a1 + 240) - 1;
          if (v57 > 3)
            v58 = CFSTR("Stopped");
          else
            v58 = off_24D1BC958[v57];
          -[NSObject bls_loggingString](v19, "bls_loggingString");
          v64 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "bls_shortLoggingString");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v87 = a1;
          v88 = 2114;
          v89 = v58;
          v90 = 2114;
          v91 = *(double *)&v64;
          v92 = 2114;
          v93 = *(double *)&v65;
          _os_log_impl(&dword_2145AC000, v50, OS_LOG_TYPE_INFO, "%p:%{public}@ scheduling waking timer for %{public}@ nextsUpdateStart:%{public}@", buf, 0x2Au);

        }
        v18 = v23;
      }
      else
      {
        v50 = v19;
        objc_msgSend(*(id *)(a1 + 24), "dateWithTimeIntervalSinceNow:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        bls_flipbook_log();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = *(_QWORD *)(a1 + 240) - 1;
          if (v52 > 3)
            v53 = CFSTR("Stopped");
          else
            v53 = off_24D1BC958[v52];
          v78 = v53;
          -[NSObject bls_loggingString](v50, "bls_loggingString");
          v71 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject bls_shortLoggingString](v19, "bls_shortLoggingString");
          v72 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "bls_shortLoggingString");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v87 = a1;
          v88 = 2114;
          v89 = v78;
          v90 = 2114;
          v91 = *(double *)&v71;
          v92 = 2048;
          v93 = v18;
          v94 = 2114;
          v95 = v72;
          v96 = 2114;
          v97 = v73;
          _os_log_impl(&dword_2145AC000, v51, OS_LOG_TYPE_INFO, "%p:%{public}@ scheduling waking timer %{public}@ is too soon, using %lf seconds from now:%{public}@ nextsUpdateStart:%{public}@", buf, 0x3Eu);

        }
      }

      objc_msgSend(*(id *)(a1 + 24), "scheduledWakingTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("AlwaysOnPresentationEngine-waking"), v49, v18, 0.5);
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v74;

    }
    else if (v23 >= 0.05)
    {
      bls_flipbook_log();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = *(_QWORD *)(a1 + 240) - 1;
        if (v60 > 3)
          v61 = CFSTR("Stopped");
        else
          v61 = off_24D1BC958[v60];
        -[NSObject bls_loggingString](v19, "bls_loggingString");
        v66 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "bls_shortLoggingString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v87 = a1;
        v88 = 2114;
        v89 = v61;
        v90 = 2114;
        v91 = *(double *)&v66;
        v92 = 2114;
        v93 = *(double *)&v67;
        _os_log_impl(&dword_2145AC000, v59, OS_LOG_TYPE_INFO, "%p:%{public}@ scheduling timer for %{public}@ nextsUpdateStart:%{public}@", buf, 0x2Au);

      }
      v68 = 0.75;
      if (v11 != 3)
        v68 = 0.015;
      objc_msgSend(*(id *)(a1 + 24), "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("AlwaysOnPresentationEngine"), v49, v23, v68);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v69;

    }
    else
    {
      bls_flipbook_log();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = *(_QWORD *)(a1 + 240) - 1;
        if (v55 > 3)
          v56 = CFSTR("Stopped");
        else
          v56 = off_24D1BC958[v55];
        -[NSObject bls_loggingString](v19, "bls_loggingString");
        v62 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "bls_shortLoggingString");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v87 = a1;
        v88 = 2114;
        v89 = v56;
        v90 = 2114;
        v91 = *(double *)&v62;
        v92 = 2114;
        v93 = *(double *)&v63;
        _os_log_impl(&dword_2145AC000, v54, OS_LOG_TYPE_INFO, "%p:%{public}@ timer too soon (will just dispatch_async) for %{public}@ nextsUpdateStart:%{public}@", buf, 0x2Au);

      }
      block[0] = v47;
      block[1] = 3221225472;
      block[2] = __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke_205;
      block[3] = &unk_24D1BC268;
      block[4] = a1;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }

    objc_destroyWeak(&v84);
    objc_destroyWeak(&location);
    goto LABEL_77;
  }
LABEL_78:

}

- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  BLSHBacklightInactiveEnvironmentSession *v8;
  BLSHBacklightInactiveEnvironmentSession *lock_inactiveSession;
  void *v10;
  void *v11;
  _QWORD block[5];

  p_lock = &self->_lock;
  v7 = a4;
  v8 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(p_lock);
  lock_inactiveSession = self->_lock_inactiveSession;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookForReason:source:environment:]((uint64_t)self, CFSTR("∆presentation"), v11, 0);

  -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v7);
  os_unfair_lock_unlock(p_lock);
  if (lock_inactiveSession == v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__BLSHAlwaysOnPresentationEngine_inactiveEnvironmentSession_didUpdateToPresentation___block_invoke;
    block[3] = &unk_24D1BC268;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)lock_invalidateFlipbookForReason:(void *)a3 source:(void *)a4 environment:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  const __CFString *v17;
  unint64_t v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9
      && (objc_msgSend(*(id *)(a1 + 128), "clearSpecifiersForEnvironment:", v9),
          objc_msgSend(*(id *)(a1 + 136), "presentation"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "containsEnvironment:", v10),
          v11,
          (v12 & 1) == 0))
    {
      bls_flipbook_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 240) - 1;
        if (v18 > 3)
          v19 = CFSTR("Stopped");
        else
          v19 = off_24D1BC958[v18];
        *(_DWORD *)buf = 134219010;
        v24 = a1;
        v25 = 2114;
        v26 = v19;
        v27 = 2114;
        v28 = v8;
        v29 = 2114;
        v30 = v7;
        v31 = 2114;
        v32 = v10;
        _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_INFO, "%p:%{public}@ will ignore invalidate flipbook (not in presentation) for source:%{public}@ reason:%{public}@ environment:%{public}@", buf, 0x34u);
      }
    }
    else if ((unint64_t)(*(_QWORD *)(a1 + 240) - 2) > 2)
    {
      bls_flipbook_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = *(_QWORD *)(a1 + 240) - 1;
        if (v16 > 3)
          v17 = CFSTR("Stopped");
        else
          v17 = off_24D1BC958[v16];
        *(_DWORD *)buf = 134219010;
        v24 = a1;
        v25 = 2114;
        v26 = v17;
        v27 = 2114;
        v28 = v8;
        v29 = 2114;
        v30 = v7;
        v31 = 2114;
        v32 = v10;
        _os_log_debug_impl(&dword_2145AC000, v15, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will ignore invalidate flipbook (rendering live) for source:%{public}@ reason:%{public}@ environment:%{public}@", buf, 0x34u);
      }
    }
    else
    {
      v13 = *(id *)(a1 + 112);
      objc_msgSend(v13, "incrementDisablePowerSavingUsageCountForReason:", 6);
      v14 = -[BLSHAlwaysOnPresentationEngine lock_cancelFlipbookFramesForReason:source:didClearDateSpecifiers:wasReset:](a1, v7, v8, v10 != 0, 0);
      if ((unint64_t)(*(_QWORD *)(a1 + 240) - 3) > 1)
      {
        objc_msgSend(*(id *)(a1 + 208), "invalidate");
        v20 = *(void **)(a1 + 208);
        *(_QWORD *)(a1 + 208) = 0;

      }
      else
      {
        -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionForReason:wasPreventingSleep:](a1, CFSTR("invalidation"), 0);
      }
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __86__BLSHAlwaysOnPresentationEngine_lock_invalidateFlipbookForReason_source_environment___block_invoke;
      v21[3] = &unk_24D1BBE80;
      v21[4] = a1;
      v22 = v13;
      v15 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], v21);

    }
  }

}

void __85__BLSHAlwaysOnPresentationEngine_inactiveEnvironmentSession_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)didEndInactiveEnvironmentSession:(id)a3
{
  BLSHBacklightInactiveEnvironmentSession *v4;

  v4 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_inactiveSession == v4)
  {
    self->_lock_inactiveSession = 0;

  }
  -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightInactiveEnvironmentSession removeObserver:](v4, "removeObserver:", self);

}

- (BOOL)isGlobal1HzFlipbook
{
  BLSHAlwaysOnPresentationEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_global1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobal1HzFlipbook:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  int v8;
  BLSHBacklightInactiveEnvironmentSession *lock_inactiveSession;
  _QWORD block[5];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_global1HzFlipbook = v3;
  v6 = 40;
  if (v3)
    v6 = 48;
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, *(id *)((char *)&self->super.isa + v6));
  -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveSession, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v7);

  if (v8)
  {
    lock_inactiveSession = self->_lock_inactiveSession;
    os_unfair_lock_unlock(p_lock);
    if (lock_inactiveSession)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__BLSHAlwaysOnPresentationEngine_setGlobal1HzFlipbook___block_invoke;
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

void __55__BLSHAlwaysOnPresentationEngine_setGlobal1HzFlipbook___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  id v7;
  id v8;
  int64_t lock_engineState;
  uint64_t v10;
  BLSHOSInterfaceProviding *v11;
  uint64_t v12;
  BLSHInactiveBudgetPolicing_Private *inactiveBudgetPolicy;
  void *v14;
  BLSHOSInterfaceProviding *v15;
  BLSHDateSpecifierModel *lock_presentationDatesModel;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BLSHOSInterfaceProviding *v25;
  BLSHAlwaysOnPresentationEngine *v26;
  uint64_t v27;
  uint64_t v28;
  SEL v29;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalidateContentForReason passed nil environment: \"%@\"), v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHAlwaysOnPresentationEngine hostEnvironment:invalidateContentForReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145C3AA0);
  }
  os_unfair_lock_lock(&self->_lock);
  lock_engineState = self->_lock_engineState;
  v10 = ++hostEnvironment_invalidateContentForReason____lock_currentSystemActivityID;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_engineState)
  {
    v11 = self->_osInterfaceProvider;
    v12 = mach_continuous_time();
    inactiveBudgetPolicy = self->_inactiveBudgetPolicy;
    -[BLSHOSInterfaceProviding now](v11, "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke;
    v22[3] = &unk_24D1BC6D0;
    v23 = v8;
    v24 = v7;
    v25 = v11;
    v26 = self;
    v27 = v10;
    v28 = v12;
    v29 = a2;
    v15 = v11;
    -[BLSHInactiveBudgetPolicing_Private invalidateAtRequestDate:forEnvironment:invalidationBlock:](inactiveBudgetPolicy, "invalidateAtRequestDate:forEnvironment:invalidationBlock:", v14, v24, v22);

  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    lock_presentationDatesModel = self->_lock_presentationDatesModel;
    bls_flipbook_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (lock_presentationDatesModel)
    {
      if (v18)
      {
        objc_msgSend(v7, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v31 = self;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v19;
        _os_log_impl(&dword_2145AC000, v17, OS_LOG_TYPE_INFO, "%p: invalidateContentForReason: engine is suspended so only clearing specifiers \"%{public}@\" from %{public}@", buf, 0x20u);

      }
      -[BLSHDateSpecifierModel clearSpecifiersForEnvironment:](self->_lock_presentationDatesModel, "clearSpecifiersForEnvironment:", v7);
    }
    else
    {
      if (v18)
      {
        objc_msgSend(v7, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v31 = self;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v20;
        _os_log_impl(&dword_2145AC000, v17, OS_LOG_TYPE_INFO, "%p: invalidateContentForReason: engine is stopped so ignoring \"%{public}@\" from %{public}@", buf, 0x20u);

      }
    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  id v20[2];
  _QWORD block[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  id v28[3];
  id location;
  _QWORD v30[3];
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("invalidateContentForReason:%@ forEnv:%@ id:%llu"), v3, v4, *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  objc_msgSend(*(id *)(a1 + 48), "createSystemActivityAssertionWithIdentifier:configurator:", v5, &__block_literal_global_150);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 1;
  objc_initWeak(&location, *(id *)(a1 + 56));
  v6 = dispatch_time(0, 60000000000);
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_3;
  block[3] = &unk_24D1BC658;
  v26 = v30;
  objc_copyWeak(v28, &location);
  v27 = &v32;
  v8 = v5;
  v9 = *(void **)(a1 + 80);
  v28[1] = *(id *)(a1 + 72);
  v28[2] = v9;
  v10 = *(_QWORD *)(a1 + 56);
  v22 = v8;
  v23 = v10;
  v24 = *(id *)(a1 + 32);
  v25 = *(id *)(a1 + 40);
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
  v11 = (void *)v33[5];
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_153;
  v14[3] = &unk_24D1BC6A8;
  objc_copyWeak(v20, &location);
  v12 = v8;
  v13 = *(void **)(a1 + 72);
  v15 = v12;
  v20[1] = v13;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = v30;
  v19 = &v32;
  objc_msgSend(v11, "acquireWithTimeout:handler:", v14, 0.0);

  objc_destroyWeak(v20);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

}

uint64_t __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcquireWaitsToAbortSleepRequested:", 1);
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (os_variant_has_internal_diagnostics())
    {
      if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "isActive"))
      {
LABEL_9:
        v11 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLSHAlwaysOnPresentationEngine invalidateFlipbookForReason:source:environment:]((uint64_t)WeakRetained, v11, v12, *(void **)(a1 + 56));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "invalidate");
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        return;
      }
      v3 = (void *)MEMORY[0x24BDD17C8];
      v4 = *(_QWORD *)(a1 + 32);
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%p held systemActivity for too long. invalidating. \"%@\" elapsed:%.4lfs"), WeakRetained, v4, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      BLSHRecordCriticalAssertFailure(v6);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_4;
      v16[3] = &unk_24D1BC630;
      v16[4] = WeakRetained;
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 96);
      v19 = *(_QWORD *)(a1 + 88);
      v20 = v8;
      v9 = *(_QWORD *)(a1 + 40);
      v17 = v7;
      v18 = v9;
      v10 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v16);
      if (BLSHIsUnitTestRunning())
      {
        v10[2](v10);
      }
      else
      {
        v15 = dispatch_time(0, 1000000000);
        dispatch_after(v15, MEMORY[0x24BDAC9B8], v10);
      }

    }
    else
    {
      bls_flipbook_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_3_cold_1((uint64_t)WeakRetained, a1, v6);
    }

    goto LABEL_9;
  }
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_4(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("BLSHCriticalAssertDidFailNotification"), 0, 0, 4u);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%p held systemActivity for too long. invalidating. \"%@\" elapsed:%.4lfs"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2114;
    v19 = CFSTR("BLSHAlwaysOnPresentationEngine.m");
    v20 = 1024;
    v21 = 1058;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)invalidateFlipbookForReason:(void *)a3 source:(void *)a4 environment:
{
  os_unfair_lock_s *v7;
  id v8;
  id v9;
  id v10;

  if (a1)
  {
    v7 = (os_unfair_lock_s *)(a1 + 8);
    v8 = a4;
    v9 = a3;
    v10 = a2;
    os_unfair_lock_lock(v7);
    -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookForReason:source:environment:](a1, v10, v9, v8);

    os_unfair_lock_unlock(v7);
  }
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_153(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[2];
  char v14;

  v7 = a3;
  v8 = a4;
  objc_copyWeak(v13, a1 + 9);
  v14 = a2;
  v9 = a1[4];
  v13[1] = a1[10];
  v10 = v7;
  v11 = a1[5];
  v12 = a1[6];
  BSDispatchMain();

  objc_destroyWeak(v13);
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2_154(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  bls_flipbook_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 96))
    v5 = OS_LOG_TYPE_INFO;
  else
    v5 = OS_LOG_TYPE_FAULT;
  if (os_log_type_enabled(v3, v5))
  {
    v6 = *(_QWORD *)(a1 + 32);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "bls_loggingString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218754;
    v15 = WeakRetained;
    v16 = 2114;
    v17 = v6;
    v18 = 2048;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_2145AC000, v4, v5, "%p \"%{public}@\" elapsed:%.4lfs error:%{public}@", (uint8_t *)&v14, 0x2Au);

  }
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHAlwaysOnPresentationEngine invalidateFlipbookForReason:source:environment:]((uint64_t)WeakRetained, v10, v11, *(void **)(a1 + 56));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "invalidate");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

uint64_t __86__BLSHAlwaysOnPresentationEngine_lock_invalidateFlipbookForReason_source_environment___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "decrementDisablePowerSavingUsageCountForReason:", 6);
}

void __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("BLSHCriticalAssertDidFailNotification"), 0, 0, 4u);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bls_loggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[CAFlipbook activeFrames] count] should be zero (not %d) after cancelAllFrames lastFrame:%@ (did backboardd die?)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2114;
    v19 = CFSTR("BLSHAlwaysOnPresentationEngine.m");
    v20 = 1024;
    v21 = 1154;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke_163(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BLSHFlipbookInvalidationTelemetryData *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BLSHFlipbookInvalidationTelemetryData *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7), "bls_specifier", (_QWORD)v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "specifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_166);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v11 = [BLSHFlipbookInvalidationTelemetryData alloc];
  v12 = *(double *)(a1 + 72);
  v13 = *(unsigned __int8 *)(a1 + 80);
  v14 = *(unsigned __int8 *)(a1 + 81);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 40);
  +[BLSHFlipbookFramesHistogram histogramWithReferenceDate:flipbookFrames:](BLSHFlipbookFramesHistogram, "histogramWithReferenceDate:flipbookFrames:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[BLSHFlipbookInvalidationTelemetryData initWithTimestamp:reason:source:didClearDateSpecifiers:wasReset:invalidatedFramesHistogram:environmentIdentifiers:](v11, "initWithTimestamp:reason:source:didClearDateSpecifiers:wasReset:invalidatedFramesHistogram:environmentIdentifiers:", v16, v15, v13, v14, v17, v18, v12);

  bls_flipbook_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138_cold_1();

  objc_msgSend(*(id *)(a1 + 64), "logTelemetryForInvalidation:", v19);
}

id __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t lock_engineState;
  NSObject *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_engineState = self->_lock_engineState;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_engineState == 1)
  {
    bls_flipbook_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = self->_lock_engineState - 1;
      if (v9 > 3)
        v10 = CFSTR("Stopped");
      else
        v10 = off_24D1BC958[v9];
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v14 = self;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v11;
      v19 = 1024;
      v20 = v4;
      _os_log_debug_impl(&dword_2145AC000, v8, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (live) hostEnvironment:%{public}@ hostDidSetUnrestrictedFramerateUpdates:%{BOOL}u", buf, 0x26u);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__BLSHAlwaysOnPresentationEngine_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke;
    block[3] = &unk_24D1BC268;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __89__BLSHAlwaysOnPresentationEngine_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)hostEnvironment:(id)a3 hostDidSet1HzFlipbook:(BOOL)a4
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveSession, "presentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)systemSleepAction:(id)a3 performWithCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  double v8;
  _BOOL4 lock_onStandby;
  NSObject *v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  _BOOL4 lock_suppressed;
  unint64_t v18;
  void *v19;
  id lock_sleepActionCompletion;
  void *v21;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  os_unfair_lock_lock(&self->_lock);
  BSContinuousMachTimeNow();
  self->_lock_sleepRequestedTime = v8;
  lock_onStandby = self->_lock_onStandby;
  bls_flipbook_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_lock_engineState - 1;
    if (v11 > 3)
      v12 = CFSTR("Stopped");
    else
      v12 = off_24D1BC958[v11];
    NSStringFromBLSHOnSystemSleepActionState(-[BLSHOnSystemSleepAction state](self->_sleepAction, "state"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = self->_lock_fillFlipbookState - 1;
    if (v15 > 3)
      v16 = CFSTR("Awake");
    else
      v16 = off_24D1BC920[v15];
    lock_suppressed = self->_lock_suppressed;
    *(_DWORD *)buf = 134219266;
    v23 = self;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    v28 = 2114;
    v29 = v16;
    v30 = 1024;
    v31 = lock_onStandby;
    v32 = 1024;
    v33 = lock_suppressed;
    _os_log_impl(&dword_2145AC000, v10, OS_LOG_TYPE_INFO, "%p:%{public}@ perform systemSleepAction sleepActionState=%{public}@ fillState:%{public}@ onStandby:%{BOOL}u suppressed:%{BOOL}u", buf, 0x36u);

  }
  if (lock_onStandby)
  {
    if (self->_lock_sleepActionCompletion)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_sleepActionCompletion == nil"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHAlwaysOnPresentationEngine systemSleepAction:performWithCompletion:].cold.1();
      objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145C4C14);
    }
    v18 = self->_lock_engineState - 3;
    v19 = (void *)MEMORY[0x2199D2BD8](v7);
    lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
    self->_lock_sleepActionCompletion = v19;

    if (v18 >= 2)
    {
      self->_lock_fillFlipbookState = 1;
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
      self->_lock_fillFlipbookState = 2;
      os_unfair_lock_unlock(&self->_lock);
      BSDispatchMain();
    }
  }
  else
  {
    self->_lock_fillFlipbookState = 4;
    os_unfair_lock_unlock(&self->_lock);
    v7[2](v7);
  }

}

void __74__BLSHAlwaysOnPresentationEngine_systemSleepAction_performWithCompletion___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void)systemSleepAction:(id)a3 systemWillWakeForReason:(id)a4
{
  id v5;
  int64_t lock_engineState;
  int64_t lock_fillFlipbookState;
  int v8;
  _BOOL4 lock_shouldNotifyFlipbookCurrent;
  NSDate *lock_serviceNextUpdatesStart;
  NSObject *v11;
  char v12;
  const __CFString *v13;
  unint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  _BOOL4 lock_onStandby;
  _BOOL4 lock_suppressed;
  const __CFString *v21;
  uint64_t v22;
  uint8_t buf[4];
  BLSHAlwaysOnPresentationEngine *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_sleepActionCompletion)
    -[BLSHAlwaysOnPresentationEngine lock_completeSleepActionIfPendingForReason:subReason:]((uint64_t)self, v5, 0);
  lock_engineState = self->_lock_engineState;
  lock_fillFlipbookState = self->_lock_fillFlipbookState;
  self->_lock_fillFlipbookState = 0;
  if ((unint64_t)(lock_engineState - 3) > 1)
    v8 = 0;
  else
    v8 = -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
  lock_shouldNotifyFlipbookCurrent = self->_lock_shouldNotifyFlipbookCurrent;
  lock_serviceNextUpdatesStart = self->_lock_serviceNextUpdatesStart;
  bls_flipbook_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(lock_engineState - 1) > 3)
      v13 = CFSTR("Stopped");
    else
      v13 = off_24D1BC958[lock_engineState - 1];
    v21 = v13;
    v14 = self->_lock_engineState - 1;
    if (v14 > 3)
      v15 = CFSTR("Stopped");
    else
      v15 = off_24D1BC958[v14];
    NSStringFromBLSHOnSystemSleepActionState(-[BLSHOnSystemSleepAction state](self->_sleepAction, "state", v21));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if ((unint64_t)(lock_fillFlipbookState - 1) > 3)
      v18 = CFSTR("Awake");
    else
      v18 = off_24D1BC920[lock_fillFlipbookState - 1];
    lock_onStandby = self->_lock_onStandby;
    lock_suppressed = self->_lock_suppressed;
    *(_DWORD *)buf = 134220546;
    v24 = self;
    v25 = 2114;
    v26 = v22;
    v27 = 2114;
    v28 = v15;
    v29 = 2114;
    v30 = v5;
    v31 = 2114;
    v32 = v16;
    v33 = 2114;
    v34 = v18;
    v35 = 1024;
    v36 = lock_onStandby;
    v37 = 1024;
    v38 = lock_suppressed;
    v39 = 1024;
    v40 = v8;
    v41 = 1024;
    v42 = lock_shouldNotifyFlipbookCurrent;
    v43 = 1024;
    v44 = lock_serviceNextUpdatesStart != 0;
    _os_log_debug_impl(&dword_2145AC000, v11, OS_LOG_TYPE_DEBUG, "%p:%{public}@->%{public}@ %{public}@ sleepActionState=%{public}@ fillState:%{public}@->Awake onStandby:%{BOOL}u suppressed:%{BOOL}u changed:%{BOOL}u shouldNotifyFlipbookCurrent:%{BOOL}u shouldServiceTimer:%{BOOL}u", buf, 0x5Cu);

  }
  os_unfair_lock_unlock(&self->_lock);
  if (lock_shouldNotifyFlipbookCurrent)
    v12 = 1;
  else
    v12 = v8;
  if ((v12 & 1) != 0 || lock_serviceNextUpdatesStart)
    BSDispatchMain();

}

void __76__BLSHAlwaysOnPresentationEngine_systemSleepAction_systemWillWakeForReason___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (BOOL)alwaysFillFlipbook
{
  BLSHAlwaysOnPresentationEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysFillFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysFillFlipbook:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  int v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysFillFlipbook = a3;
  if ((unint64_t)(self->_lock_engineState - 3) >= 2)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
    os_unfair_lock_unlock(p_lock);
    if (v6)
      BSDispatchMain();
  }
}

void __56__BLSHAlwaysOnPresentationEngine_setAlwaysFillFlipbook___block_invoke(uint64_t a1)
{
  -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (BOOL)isUsingPseudoFlipbook
{
  BLSHAlwaysOnPresentationEngine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_usePseudoFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUsePseudoFlipbook:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int lock_usePseudoFlipbook;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t buf[16];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_usePseudoFlipbook = self->_lock_usePseudoFlipbook;
  self->_lock_usePseudoFlipbook = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_usePseudoFlipbook != v3)
  {
    bls_flipbook_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        v9 = "will use pseudo-flipbook";
LABEL_7:
        _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, v9, buf, 2u);
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      v9 = "will use CAFlipbook";
      goto LABEL_7;
    }

    BSDispatchMain();
  }
}

void __55__BLSHAlwaysOnPresentationEngine_setUsePseudoFlipbook___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 41))
      v3 = CFSTR("usePseudoFlipbook");
    else
      v3 = CFSTR("!usePseudoFlipbook");
    v4 = (id)objc_msgSend(v2, "stopForReason:", v3);
  }
  -[BLSHAlwaysOnPresentationEngine createFlipbook](*(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "startFlipbookAndEnsureCurrent");
}

- (BOOL)isFlipbookPowerSavingEnabled
{
  return -[BLSHFlipbookPowerSavingProvider isFlipbookPowerSavingEnabled](self->_flipbookPowerSavingProvider, "isFlipbookPowerSavingEnabled");
}

- (void)incrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
  -[BLSHFlipbookPowerSavingProvider incrementDisablePowerSavingUsageCountForReason:](self->_flipbookPowerSavingProvider, "incrementDisablePowerSavingUsageCountForReason:", a3);
}

- (void)decrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
  -[BLSHFlipbookPowerSavingProvider decrementDisablePowerSavingUsageCountForReason:](self->_flipbookPowerSavingProvider, "decrementDisablePowerSavingUsageCountForReason:", a3);
}

- (id)allFlipbookFrames
{
  return -[BLSHFlipbookHistory allFrames](self->_renderedFlipbookHistory, "allFrames");
}

- (id)frameWithUUID:(id)a3
{
  return -[BLSHFlipbookHistory frameWithUUID:](self->_renderedFlipbookHistory, "frameWithUUID:", a3);
}

- (id)frameOnGlassNow
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHFlipbook captureFrameOnGlass](self->_lock_flipbook, "captureFrameOnGlass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  +[BLSDiagnosticFlipbookFrame createWithFrame:](BLSHFlipbookHistoryFrame, "createWithFrame:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  os_unfair_lock_s *p_lock;
  BLSHRenderedFlipbookFrame *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_frameOnGlassWhenFlipbookLastCancelledAndReset;
  os_unfair_lock_unlock(p_lock);
  +[BLSDiagnosticFlipbookFrame createWithFrame:](BLSHFlipbookHistoryFrame, "createWithFrame:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)main_getMissingDatesFromEnvironments
{
  void *v2;
  unint64_t v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BLSHEngineRequestDatesOperation *v15;
  void *v16;
  BLSHEngineRequestDatesOperation *v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 136), "presentation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (!v2 || *(_QWORD *)(a1 + 144) || (v3 = *(_QWORD *)(a1 + 240)) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      v17 = 0;
      v14 = 0;
      v13 = 0;
LABEL_28:

      return;
    }
    v4 = *(unsigned __int8 *)(a1 + 271);
    v5 = 10.0;
    if (v3 >= 3 && !*(_BYTE *)(a1 + 271))
    {
      objc_msgSend(*(id *)(a1 + 80), "minimumPrepareInterval");
      v5 = v6;
    }
    objc_msgSend(*(id *)(a1 + 80), "maximumRenderInterval");
    v8 = v7;
    if (v3 == 4)
      v5 = v7;
    objc_msgSend(*(id *)(a1 + 24), "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v9, v5);
    if (objc_msgSend(*(id *)(a1 + 128), "missingAnySpecifiersInDateInterval:forPresentation:", v10, v2))
    {
      v11 = v8 + 10.0;
      if (!v4)
        v11 = v8 + v8;
      if (v3 >= 3)
        v12 = v11;
      else
        v12 = 30.0;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v9, v12);
      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 128), "missingIntervalsForMinimumInterval:requestInterval:ofPresentation:", v10, v13, v2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          v15 = -[BLSHEngineRequestDatesOperation initWithRequestInterval:delegate:osTimerProvider:]([BLSHEngineRequestDatesOperation alloc], "initWithRequestInterval:delegate:osTimerProvider:", v13, a1, *(_QWORD *)(a1 + 24));
          v16 = *(void **)(a1 + 144);
          *(_QWORD *)(a1 + 144) = v15;

          v17 = v15;
        }
        else
        {
          bls_flipbook_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            if (v3 > 4)
              v22 = CFSTR("Stopped");
            else
              v22 = off_24D1BC958[v3 - 1];
            v24 = v22;
            objc_msgSend(v13, "bls_shortLoggingString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v26 = a1;
            v27 = 2114;
            v28 = v24;
            v29 = 2114;
            v30 = v23;
            _os_log_debug_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEBUG, "%p:%{public}@ not requesting dates for interval:%{public}@ (no missingIntervals)", buf, 0x20u);

          }
          v17 = 0;
        }
        objc_msgSend(*(id *)(a1 + 32), "purgeStaleDataForNowDate:", v9);
        goto LABEL_25;
      }
    }
    else
    {
      v13 = 0;
    }
    v14 = 0;
    v17 = 0;
LABEL_25:

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v17)
    {
      bls_flipbook_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        if (v3 > 4)
          v20 = CFSTR("Stopped");
        else
          v20 = off_24D1BC958[v3 - 1];
        objc_msgSend(v13, "bls_shortLoggingString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v26 = a1;
        v27 = 2114;
        v28 = v20;
        v29 = 2114;
        v30 = v21;
        v31 = 2114;
        v32 = v14;
        _os_log_debug_impl(&dword_2145AC000, v19, OS_LOG_TYPE_DEBUG, "%p:%{public}@ requesting dates for interval:%{public}@ missingIntervals:%{public}@", buf, 0x2Au);

      }
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:](v17, "beginOperationWithIntervals:shouldReset:", v14, 0);
    }
    goto LABEL_28;
  }
}

- (uint64_t)main_shouldWaitForRequestDates
{
  os_unfair_lock_s *v2;
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v23;
  int v24;
  os_log_type_t v25;
  __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  int v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  id v43;
  __int16 v44;
  _QWORD v45[4];

  *(_QWORD *)((char *)&v45[2] + 4) = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v3 = *(id *)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 240);
  v5 = *(id *)(a1 + 24);
  objc_msgSend(v5, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v4 && v3)
  {
    if ((objc_msgSend(v3, "isComplete") & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v3, "requestInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v11 = v10;

    if (v11 >= 0.3)
    {
LABEL_11:
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "beginDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v12);
      v14 = v13;
      if (v4 > 4 || (v15 = dbl_21462C300[v4 - 1] - v13, v15 <= 0.0))
      {
        bls_flipbook_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          if (v4 > 4)
            v28 = CFSTR("Stopped");
          else
            v28 = off_24D1BC958[v4 - 1];
          v29 = *(_QWORD *)(a1 + 208);
          *(_DWORD *)buf = 134219010;
          v37 = a1;
          v38 = 2114;
          v39 = v28;
          v40 = 2048;
          v41 = v14;
          v42 = 2114;
          v43 = v3;
          v44 = 2114;
          v45[0] = v29;
          _os_log_debug_impl(&dword_2145AC000, v21, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will render frames, waiting (enough) %.3lfs for operation:%{public}@ timer:%{public}@", buf, 0x34u);
        }
        v7 = 0;
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 208), "isScheduled")
          && (objc_msgSend(*(id *)(a1 + 208), "timeRemaining"), v16 <= v15))
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 208), "invalidate");
          v17 = *(void **)(a1 + 24);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __64__BLSHAlwaysOnPresentationEngine_main_shouldWaitForRequestDates__block_invoke;
          v31[3] = &unk_24D1BC788;
          v31[4] = a1;
          v35 = v4;
          v32 = v5;
          v33 = v12;
          v34 = v3;
          objc_msgSend(v17, "scheduledWakingTimerWithIdentifier:interval:leewayInterval:handler:", CFSTR("AlwaysOnPresentationEngine"), v31, v15, 0.2);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 208);
          *(_QWORD *)(a1 + 208) = v18;

          v20 = 1;
        }
        bls_flipbook_log();
        v23 = objc_claimAutoreleasedReturnValue();
        v21 = v23;
        v30 = v20;
        if (v14 > 0.2)
          v24 = 1;
        else
          v24 = v20;
        v7 = 1;
        if (v24)
          v25 = OS_LOG_TYPE_INFO;
        else
          v25 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v23, v25))
        {
          v26 = off_24D1BC958[v4 - 1];
          v27 = *(_QWORD *)(a1 + 208);
          *(_DWORD *)buf = 134219266;
          v37 = a1;
          v38 = 2114;
          v39 = v26;
          v40 = 2048;
          v41 = v14;
          v42 = 2114;
          v43 = v3;
          v44 = 1024;
          LODWORD(v45[0]) = v30;
          WORD2(v45[0]) = 2114;
          *(_QWORD *)((char *)v45 + 6) = v27;
          _os_log_impl(&dword_2145AC000, v21, v25, "%p:%{public}@ will not render frames, waiting %.3lfs for operation:%{public}@ didCreateNewTimer:%{BOOL}u timer:%{public}@", buf, 0x3Au);
        }
      }

    }
  }
  os_unfair_lock_unlock(v2);

  return v7;
}

- (void)main_performUpdateIfNeeded
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v5, "%p servicing timer nextsUpdateStart:%{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

uint64_t __54__BLSHAlwaysOnPresentationEngine_main_performNextStep__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decrementDisablePowerSavingUsageCountForReason:", 4);
}

void __64__BLSHAlwaysOnPresentationEngine_main_shouldWaitForRequestDates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  bls_flipbook_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 64) - 1;
    if (v6 > 3)
      v7 = CFSTR("Stopped");
    else
      v7 = off_24D1BC958[v6];
    objc_msgSend(*(id *)(a1 + 40), "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 56);
    v11 = 134218754;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v10;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_2145AC000, v4, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ request dates timeout will now render frames, waited %.3lfs for operation:%{public}@", (uint8_t *)&v11, 0x2Au);

  }
  objc_msgSend(v3, "invalidate");

  -[BLSHAlwaysOnPresentationEngine timerFiredForNextUpdatesStart:](*(_QWORD *)(a1 + 32), 0);
}

- (void)timerFiredForNextUpdatesStart:(uint64_t)a1
{
  id v4;
  void *v5;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      objc_storeStrong((id *)(a1 + 216), a2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    BSDispatchMain();
  }

}

- (void)main_performLiveUpdateIfNeeded
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(_QWORD *)(a1 + 240) == 1 && !objc_msgSend(*(id *)(a1 + 208), "isScheduled"))
    {
      objc_msgSend(*(id *)(a1 + 136), "presentation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 24), "now");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 128), "purgeSpecifiersBefore:", v4);
      v5 = *(void **)(a1 + 128);
      v6 = *(_QWORD *)(a1 + 152);
      objc_msgSend(*(id *)(a1 + 80), "coaelscingEpsilon");
      objc_msgSend(v5, "updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:", v6, v4, 1, 0, v3, 0, 0.028, 1.79769313e308, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueNextUpdate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLSHAlwaysOnPresentationEngine lock_scheduleUpdateTimerForNextUpdatesStart:](a1, v9);
      v10 = (id)objc_msgSend(v8, "invalidate");

      os_unfair_lock_unlock(v2);
      if (v11)
      {
        -[BLSHAlwaysOnPresentationEngine performLiveUpdateToSpecifier:](a1, v11);

      }
    }
    else
    {
      os_unfair_lock_unlock(v2);
    }
  }
}

- (void)main_prepareAndRenderNextFlipbookFrame
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "%p:%{public}@ no more updates, will not render more frames", v1);
  OUTLINED_FUNCTION_2();
}

void __72__BLSHAlwaysOnPresentationEngine_main_prepareAndRenderNextFlipbookFrame__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "invalidate");
  -[BLSHAlwaysOnPresentationEngine timerFiredForNextUpdatesStart:](*(_QWORD *)(a1 + 32), 0);
}

- (id)loggingStreamForRenderSession
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id *v9;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromByteCount:", objc_msgSend(v1[23], "memoryUsage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, 0);

    objc_msgSend(v1[23], "renderedFrames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__BLSHAlwaysOnPresentationEngine_loggingStreamForRenderSession__block_invoke;
    v8[3] = &unk_24D1BC7F8;
    v1 = v2;
    v9 = v1;
    objc_msgSend(v1, "bls_appendBoundedCollection:withName:maximumItems:itemBlock:", v6, 0, 4, v8);

  }
  return v1;
}

void __63__BLSHAlwaysOnPresentationEngine_loggingStreamForRenderSession__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bls_shortLoggingString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

}

void __92__BLSHAlwaysOnPresentationEngine_lock_endFlipbookRenderSessionForReason_wasPreventingSleep___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "telemetryDataWithEndTime:reasonEnded:preventedSleepDuration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  bls_flipbook_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "logTelemetryForRenderSession:", v2);
}

void __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  bls_flipbook_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1[4], "bls_loggingString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "bls_shortLoggingString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218498;
    v7 = WeakRetained;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_2145AC000, v3, OS_LOG_TYPE_INFO, "%p timerFired for %{public}@ nextsUpdateStart:%{public}@", (uint8_t *)&v6, 0x20u);

  }
  -[BLSHAlwaysOnPresentationEngine timerFiredForNextUpdatesStart:]((uint64_t)WeakRetained, a1[5]);

}

uint64_t __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke_205(uint64_t a1)
{
  return -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

uint64_t __64__BLSHAlwaysOnPresentationEngine_timerFiredForNextUpdatesStart___block_invoke(uint64_t a1)
{
  return -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_serviceNextUpdatesStart, 0);
  objc_storeStrong((id *)&self->_lock_timer, 0);
  objc_storeStrong((id *)&self->_lock_livePowerAssertion, 0);
  objc_storeStrong((id *)&self->_lock_renderFlipbookSessionPowerAssertion, 0);
  objc_storeStrong((id *)&self->_lock_renderFlipbookSession, 0);
  objc_storeStrong((id *)&self->_lock_renderingSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_cachedFlipbookUpdates, 0);
  objc_storeStrong((id *)&self->_lock_lastRequestInterval, 0);
  objc_storeStrong((id *)&self->_lock_lastLiveSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_requestDatesOperation, 0);
  objc_storeStrong((id *)&self->_lock_inactiveSession, 0);
  objc_storeStrong((id *)&self->_lock_presentationDatesModel, 0);
  objc_storeStrong((id *)&self->_renderedFlipbookHistory, 0);
  objc_storeStrong((id *)&self->_flipbookPowerSavingProvider, 0);
  objc_storeStrong((id *)&self->_lock_frameOnGlassWhenFlipbookCancelled, 0);
  objc_storeStrong((id *)&self->_lock_frameOnGlassWhenFlipbookLastCancelledAndReset, 0);
  objc_storeStrong((id *)&self->_lock_flipbook, 0);
  objc_storeStrong((id *)&self->_flipbookSpecification, 0);
  objc_storeStrong(&self->_lock_sleepActionCompletion, 0);
  objc_storeStrong((id *)&self->_sleepAction, 0);
  objc_storeStrong((id *)&self->_flipbookTelemetryDelegate, 0);
  objc_storeStrong((id *)&self->_nullInactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_realInactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:platformProvider:osInterfaceProvider:inactiveBudgetPolicy:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  v5 = 2114;
  v6 = v0;
  v7 = 2114;
  v8 = v1;
  v9 = 2114;
  v10 = v2;
  _os_log_debug_impl(&dword_2145AC000, v3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ did create engine with:%{public}@ telemetryDelegate:%{public}@", v4, 0x2Au);
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

- (void)setInactiveSession:.cold.1()
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

void __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_138_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9(&dword_2145AC000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)hostEnvironment:invalidateContentForReason:.cold.1()
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

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a2 + 32);
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  v7 = 134218498;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_fault_impl(&dword_2145AC000, a3, OS_LOG_TYPE_FAULT, "%p held systemActivity for too long. invalidating. \"%{public}@\" elapsed:%.4lfs", (uint8_t *)&v7, 0x20u);
  OUTLINED_FUNCTION_14();
}

- (void)systemSleepAction:performWithCompletion:.cold.1()
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

@end
