@implementation BLSHLocalHostSceneEnvironmentUpdater

- (BLSHLocalHostSceneEnvironmentUpdater)initWithSessionProvider:(id)a3 localHostEnvironment:(id)a4
{
  id v7;
  id v8;
  BLSHLocalHostSceneEnvironmentUpdater *v9;
  BLSHLocalHostSceneEnvironmentUpdater *v10;
  BLSHBacklightOSTimerProvider *v11;
  BLSHOSTimerProviding *osTimerProvider;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BLSHCriticalAssertTester *v19;
  BLSHCriticalAssertTester *criticalAssertTester;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BLSHLocalHostSceneEnvironmentUpdater;
  v9 = -[BLSHLocalHostSceneEnvironmentUpdater init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_lock_nextEventID = 0x8000000000000000;
    objc_storeStrong((id *)&v9->_sessionProvider, a3);
    v11 = objc_alloc_init(BLSHBacklightOSTimerProvider);
    osTimerProvider = v10->_osTimerProvider;
    v10->_osTimerProvider = (BLSHOSTimerProviding *)v11;

    objc_storeStrong((id *)&v10->_localHostEnvironment, a4);
    objc_msgSend(v8, "visualState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BLSBacklightStateForVisuaState();

    if (v14 == 1)
      -[BLSHLocalHostSceneEnvironmentUpdater ensureInactiveEnvSessionCreated](v10, "ensureInactiveEnvSessionCreated");
    if (os_variant_has_internal_diagnostics())
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "processName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.BacklightServices.BLSHBacklightSceneEnvironmentHosting.%@.criticalasserttest"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[BLSHCriticalAssertTester initWithNotificationName:]([BLSHCriticalAssertTester alloc], "initWithNotificationName:", v18);
      criticalAssertTester = v10->_criticalAssertTester;
      v10->_criticalAssertTester = v19;

    }
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self->_sessionProvider);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("sessionProvider"));

  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_localHostEnvironment, CFSTR("localHostEnvironment"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)ensureInactiveEnvSessionCreated
{
  BSDispatchMain();
}

uint64_t __71__BLSHLocalHostSceneEnvironmentUpdater_ensureInactiveEnvSessionCreated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onMain_ensureInactiveEnvSessionCreated");
}

- (void)destroyInactiveEnvSession
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  objc_msgSend(*(id *)(a1 + 56), "presentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218498;
  v9 = a1;
  v10 = 2048;
  v11 = v5;
  v12 = 2114;
  v13 = v6;
  OUTLINED_FUNCTION_19(&dword_2145AC000, a3, v7, "%p (localHostUpdater) destroy session:%p with current presentation:%{public}@", (uint8_t *)&v8);

}

- (void)onMain_ensureInactiveEnvSessionCreated
{
  BLSHBacklightInactiveEnvironmentSession *v3;
  void *v4;
  NSObject *v5;
  BLSHBacklightEnvironmentStateMachine *v6;
  int64_t backlightState;
  BLSHNullInactiveBudgetPolicy *v8;
  BLSHBacklightEnvironmentStateMachine *v9;
  BLSHBacklightEnvironmentStateMachine *environmentStateMachine;
  int v11;
  BLSHLocalHostSceneEnvironmentUpdater *v12;
  __int16 v13;
  BLSHBacklightInactiveEnvironmentSession *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_lock_inactiveEnvSession;
  os_unfair_lock_unlock(&self->_lock);
  if (!v3)
  {
    -[BLSHBacklightEnvironmentSessionProviding createInactiveEnvironmentSession](self->_sessionProvider, "createInactiveEnvironmentSession");
    v3 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_inactiveEnvSession, v3);
    -[BLSHBacklightInactiveEnvironmentSession setUpdater:](v3, "setUpdater:", self);
    -[BLSHBacklightInactiveEnvironmentSession presentation](v3, "presentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    bls_backlight_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134218498;
      v12 = self;
      v13 = 2048;
      v14 = v3;
      v15 = 2114;
      v16 = v4;
      _os_log_debug_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) createdSession:%p with presentation:%{public}@", (uint8_t *)&v11, 0x20u);
    }

    v6 = [BLSHBacklightEnvironmentStateMachine alloc];
    backlightState = self->_backlightState;
    v8 = objc_alloc_init(BLSHNullInactiveBudgetPolicy);
    v9 = -[BLSHBacklightEnvironmentStateMachine initWithPresentation:backlightState:delegate:inactiveBudgetPolicy:osTimerProvider:](v6, "initWithPresentation:backlightState:delegate:inactiveBudgetPolicy:osTimerProvider:", v4, backlightState, self, v8, self->_osTimerProvider);
    environmentStateMachine = self->_environmentStateMachine;
    self->_environmentStateMachine = v9;

    os_unfair_lock_unlock(&self->_lock);
    -[BLSHBacklightInactiveEnvironmentSession addEnvironmentsObserver:](v3, "addEnvironmentsObserver:", self);

  }
}

- (BOOL)ensureAlwaysOnSessionCreated
{
  BLSBacklightSceneEnvironment_Private *v2;
  uint64_t v3;
  void *v4;

  v2 = self->_localHostEnvironment;
  -[BLSBacklightSceneEnvironment_Private alwaysOnSession](v2, "alwaysOnSession");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B820]), "initWithEnvironment:", v2);
    -[BLSBacklightSceneEnvironment_Private setAlwaysOnSession:](v2, "setAlwaysOnSession:", v4);
  }

  return v3 == 0;
}

- (void)timelinesForDateInterval:(id)a3 previousPresentationDate:(id)a4 localHostEnvironment:(id)a5 shouldReset:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *v16;
  void *v17;
  id *v18;
  NSMutableSet *lock_timelinesCalculators;
  NSMutableSet *v20;
  NSMutableSet *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = [BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator alloc];
  -[BLSHLocalHostSceneEnvironmentUpdater subHostedHostEnvironments](self, "subHostedHostEnvironments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator initWithDateInterval:previousPresentationDate:localHostEnvironment:subHostedHostEnvironments:shouldReset:osTimerProvider:]((id *)&v16->super.isa, v12, v13, v14, v17, a6, self->_osTimerProvider);

  os_unfair_lock_lock(&self->_lock);
  lock_timelinesCalculators = self->_lock_timelinesCalculators;
  if (!lock_timelinesCalculators)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v21 = self->_lock_timelinesCalculators;
    self->_lock_timelinesCalculators = v20;

    lock_timelinesCalculators = self->_lock_timelinesCalculators;
  }
  -[NSMutableSet addObject:](lock_timelinesCalculators, "addObject:", v18);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, v18);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __134__BLSHLocalHostSceneEnvironmentUpdater_timelinesForDateInterval_previousPresentationDate_localHostEnvironment_shouldReset_completion___block_invoke;
  v23[3] = &unk_24D1BDF70;
  objc_copyWeak(&v25, &location);
  v23[4] = self;
  v22 = v15;
  v24 = v22;
  objc_msgSend(v18, "calculateWithCompletion:", v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __134__BLSHLocalHostSceneEnvironmentUpdater_timelinesForDateInterval_previousPresentationDate_localHostEnvironment_shouldReset_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", WeakRetained);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)aggregateDesiredFidelityForBacklightState:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  BLSBacklightSceneEnvironment_Private *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BLSBacklightSceneEnvironment_Private *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  int64_t v23;
  _QWORD v24[4];
  BLSBacklightSceneEnvironment_Private *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[4];
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[4];
  int v37;

  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveEnvSession, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2810000000;
  v36[3] = &unk_214643C35;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v35 = objc_msgSend(v8, "count");
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v9 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke;
  v28[3] = &unk_24D1BDF98;
  v30 = v36;
  v31 = v33;
  v32 = v34;
  v10 = v6;
  v29 = v10;
  v11 = (void *)MEMORY[0x2199D2BD8](v28);
  v12 = self->_localHostEnvironment;
  v13 = objc_alloc(MEMORY[0x24BDD1508]);
  -[BLSHOSTimerProviding now](self->_osTimerProvider, "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithStartDate:duration:", v14, 60.0);

  -[BLSBacklightSceneEnvironment_Private delegate](v12, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_2;
  v24[3] = &unk_24D1BDFC0;
  v17 = v12;
  v25 = v17;
  v18 = v15;
  v26 = v18;
  v19 = v11;
  v27 = v19;
  objc_msgSend(v16, "environment:timelinesForDateInterval:previousSpecifier:completion:", v17, v18, 0, v24);

  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_3;
  v21[3] = &unk_24D1BDFE8;
  v23 = a3;
  v20 = v19;
  v22 = v20;
  -[BLSHLocalHostSceneEnvironmentUpdater performWithSubhostedEnvironmentsFromPresentationEntries:block:](self, "performWithSubhostedEnvironmentsFromPresentationEntries:block:", v8, v21);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

void __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 32));
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 <= a2)
    v5 = a2;
  *(_QWORD *)(v4 + 24) = v5;
  v6 = --*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1[5] + 8) + 32));
  if (!v6)
    (*(void (**)(void))(a1[4] + 16))();
}

void __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "alwaysOnSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "desiredFidelityForDateInterval:timelines:withCompletion:", a1[5], v4, a1[6]);

}

void __97__BLSHLocalHostSceneEnvironmentUpdater_aggregateDesiredFidelityForBacklightState_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  BLSHGetRequestedFidelityForBacklightState(*(_QWORD *)(a1 + 40), a2, *(void **)(a1 + 32));
}

- (void)performBlockWithSubhostedEnvironments:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveEnvSession, "presentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationEntries");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  -[BLSHLocalHostSceneEnvironmentUpdater performWithSubhostedEnvironmentsFromPresentationEntries:block:](self, "performWithSubhostedEnvironmentsFromPresentationEntries:block:", v7, v5);

}

- (void)performWithSubhostedEnvironmentsFromPresentationEntries:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  os_unfair_lock_s *p_lock;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSBacklightSceneEnvironment_Private identifier](self->_localHostEnvironment, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "environment", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if ((v17 & 1) == 0)
          v7[2](v7, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (id)subHostedHostEnvironments
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSBacklightSceneEnvironment_Private identifier](self->_localHostEnvironment, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveEnvSession, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__BLSHLocalHostSceneEnvironmentUpdater_subHostedHostEnvironments__block_invoke;
  v10[3] = &unk_24D1BCF68;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __65__BLSHLocalHostSceneEnvironmentUpdater_subHostedHostEnvironments__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((a1 & 1) != 0)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (void)updatedEnvironmentWithDelta:(id)a3 backlightSceneUpdate:(id)a4
{
  id v4;
  char v5;
  id v7;
  BLSBacklightSceneEnvironment_Private *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  NSObject *v41;
  BLSBacklightSceneUpdate *v42;
  BLSHBacklightEnvironmentStateMachine *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  unint64_t lock_nextEventID;
  id obj;
  id obja;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  BLSBacklightSceneEnvironment_Private *v58;
  NSObject *v59;
  BLSHBacklightInactiveEnvironmentSession *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  BLSHLocalHostSceneEnvironmentUpdater *v70;
  __int16 v71;
  _BYTE v72[28];
  uint64_t v73;

  v4 = a4;
  v5 = (char)a3;
  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = self->_localHostEnvironment;
  if (v7)
    v9 = objc_msgSend(v7, "isUpdateToDateSpecifier") ^ 1;
  else
    v9 = 0;
  -[BLSBacklightSceneEnvironment_Private alwaysOnSession](v8, "alwaysOnSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 8) != 0)
  {
    -[BLSBacklightSceneEnvironment_Private visualState](v8, "visualState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "updateFidelity");
    v13 = objc_msgSend(v11, "adjustedLuminance");
    if (v13 == 2)
      v14 = v9;
    else
      v14 = 0;
    if (v13 == 1 || (v14 & 1) != 0 || (unint64_t)(v12 - 1) <= 1)
    {
      if (-[BLSHLocalHostSceneEnvironmentUpdater ensureAlwaysOnSessionCreated](self, "ensureAlwaysOnSessionCreated"))
      {
        obj = v4;
        -[BLSBacklightSceneEnvironment_Private alwaysOnSession](v8, "alwaysOnSession");
        v17 = objc_claimAutoreleasedReturnValue();

        bls_environment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          BLSBacklightFBSSceneEnvironmentDeltaDescription();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v70 = self;
          v71 = 2114;
          *(_QWORD *)v72 = v17;
          *(_WORD *)&v72[8] = 2114;
          *(_QWORD *)&v72[10] = v8;
          *(_WORD *)&v72[18] = 2114;
          *(_QWORD *)&v72[20] = v19;
          _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "%p (localHostUpdater) created alwaysOnSession:%{public}@ for updatedEnvironment:%{public}@ withDelta:%{public}@", buf, 0x2Au);

        }
        v10 = (void *)v17;
        v4 = obj;
      }

      -[BLSHLocalHostSceneEnvironmentUpdater ensureInactiveEnvSessionCreated](self, "ensureInactiveEnvSessionCreated");
      if (v7)
        goto LABEL_22;
      goto LABEL_44;
    }
    if (!v10)
    {

      if (v7)
        goto LABEL_16;
      goto LABEL_44;
    }
    bls_environment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      BLSBacklightFBSSceneEnvironmentDeltaDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v70 = self;
      v71 = 2114;
      *(_QWORD *)v72 = v10;
      *(_WORD *)&v72[8] = 2114;
      *(_QWORD *)&v72[10] = v8;
      *(_WORD *)&v72[18] = 2114;
      *(_QWORD *)&v72[20] = v16;
      _os_log_impl(&dword_2145AC000, v15, OS_LOG_TYPE_INFO, "%p (localHostUpdater) destroying alwaysOnSession:%{public}@ for updatedEnvironment:%{public}@ withDelta:%{public}@", buf, 0x2Au);

    }
    objc_msgSend(v10, "invalidate");
    -[BLSBacklightSceneEnvironment_Private setAlwaysOnSession:](v8, "setAlwaysOnSession:", 0);

    v10 = 0;
  }
  if (v7)
  {
LABEL_16:
    -[BLSHLocalHostSceneEnvironmentUpdater ensureInactiveEnvSessionCreated](self, "ensureInactiveEnvSessionCreated");
LABEL_22:
    obja = v4;
    v57 = v10;
    v58 = v8;
    objc_msgSend(v7, "context");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject triggerEvent](v20, "triggerEvent");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v59 = v20;
    -[NSObject frameSpecifier](v20, "frameSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[BLSBacklightSceneEnvironment_Private identifier](self->_localHostEnvironment, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = self->_lock_inactiveEnvSession;
    -[BLSHBacklightInactiveEnvironmentSession presentation](self->_lock_inactiveEnvSession, "presentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    bls_environment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v61 = v24;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v24, "bls_shortLoggingString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v70 = self;
      v71 = 1024;
      *(_DWORD *)v72 = v9;
      *(_WORD *)&v72[4] = 2048;
      *(_QWORD *)&v72[6] = v60;
      *(_WORD *)&v72[14] = 2114;
      *(_QWORD *)&v72[16] = v26;
      _os_log_impl(&dword_2145AC000, v25, OS_LOG_TYPE_INFO, "%p (localHostUpdater) updatedEnvironmentWithDelta: doPerformEvent:%{BOOL}u inactiveEnvSession:%p presentation:%{public}@", buf, 0x26u);

      v24 = v61;
    }

    objc_msgSend(v24, "presentationEntries");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke;
    v65[3] = &unk_24D1BE010;
    v55 = v23;
    v66 = v55;
    v28 = v22;
    v67 = v28;
    v29 = v7;
    v68 = v29;
    v56 = v27;
    objc_msgSend(v27, "bs_map:", v65);
    v30 = objc_claimAutoreleasedReturnValue();
    v53 = v28;
    objc_msgSend(v28, "presentationInterval");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "startDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v30;
    +[BLSHPresentationDateSpecifier specifierWithPresentationDate:specifiers:](BLSHPresentationDateSpecifier, "specifierWithPresentationDate:specifiers:", v32, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(&self->_lock);
    if (v9)
    {
      v34 = v29;
      v35 = v59;
      if (!v21)
      {
        lock_nextEventID = self->_lock_nextEventID;
        self->_lock_nextEventID = lock_nextEventID + 1;
        -[NSObject visualState](v59, "visualState");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = BLSBacklightStateForVisuaState();

        v38 = BLSBacklightActivityStateForBLSBacklightState();
        v39 = objc_alloc(MEMORY[0x24BE0B850]);
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B858]), "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", v38, CFSTR("createdLocalEvent — just added to presentation?"), mach_continuous_time(), 10, 0);
        v21 = (id)objc_msgSend(v39, "initWithEventID:state:previousState:changeRequest:", lock_nextEventID, v37, v37, v40);

        bls_backlight_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v70 = self;
          v71 = 2114;
          *(_QWORD *)v72 = v21;
          *(_WORD *)&v72[8] = 2114;
          *(_QWORD *)&v72[10] = v34;
          _os_log_impl(&dword_2145AC000, v41, OS_LOG_TYPE_INFO, "%p (localHostUpdater) created new triggerEvent:%{public}@ sceneUpdate:%{public}@", buf, 0x20u);
        }

      }
      v42 = self->_lock_sceneUpdateForPerformingEvent;
      objc_storeStrong((id *)&self->_lock_localTriggerEventForPerformingEvent, v21);
      objc_storeStrong((id *)&self->_lock_sceneUpdateForPerformingEvent, obja);
      v43 = self->_environmentStateMachine;
      os_unfair_lock_unlock(&self->_lock);
      bls_environment_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v70 = self;
        v71 = 2114;
        *(_QWORD *)v72 = v21;
        *(_WORD *)&v72[8] = 2114;
        *(_QWORD *)&v72[10] = v33;
        _os_log_debug_impl(&dword_2145AC000, v44, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) calling [environmentStateMachine performEvent:withInitialSpecifier:performBacklightRamp:], event:%{public}@, dateSpecifier:%{public}@", buf, 0x20u);
      }

      v45 = v61;
      if (v42)
      {
        objc_msgSend(v34, "setReplacedSceneUpdate:", v42);
        bls_backlight_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v70 = self;
          v71 = 2114;
          *(_QWORD *)v72 = v42;
          *(_WORD *)&v72[8] = 2114;
          *(_QWORD *)&v72[10] = v34;
          _os_log_impl(&dword_2145AC000, v46, OS_LOG_TYPE_INFO, "%p (localHostUpdater) replaced sceneUpdateForPerformingEvent:%{public}@ with new sceneUpdate:%{public}@", buf, 0x20u);
        }
      }
      else
      {
        bls_backlight_log();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:].cold.2();
      }

      if (!v43)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected nil environmentStateMachine doPerformEvent=YES backlightSceneUpdate:%@"), v34);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:].cold.1();
        objc_msgSend(objc_retainAutorelease(v49), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x214604C3CLL);
      }
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_145;
      v62[3] = &unk_24D1BC370;
      v62[4] = self;
      v21 = v21;
      v63 = v21;
      v64 = v34;
      -[BLSHBacklightEnvironmentStateMachine performEvent:withInitialSpecifier:performBacklightRamp:](v43, "performEvent:withInitialSpecifier:performBacklightRamp:", v21, v33, v62);

    }
    else
    {
      v42 = self->_environmentStateMachine;
      os_unfair_lock_unlock(&self->_lock);
      bls_environment_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:].cold.4();

      v45 = v61;
      if (!v42)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected nil environmentStateMachine doPerformEvent=NO backlightSceneUpdate:%@"), v29);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:].cold.3();
        objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x214604BE0);
      }
      -[BLSBacklightSceneUpdate updateToSpecifier:](v42, "updateToSpecifier:", v33);
      v35 = v59;
    }

    v10 = v57;
    v8 = v58;
    goto LABEL_46;
  }
LABEL_44:
  bls_environment_log();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v70 = self;
    _os_log_impl(&dword_2145AC000, v35, OS_LOG_TYPE_INFO, "%p (localHostUpdater) updatedEnvironmentWithDelta: backlightSceneUpdate=nil", buf, 0xCu);
  }
LABEL_46:

}

BLSHEnvironmentDateSpecifier *__89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BLSHEnvironmentDateSpecifier *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "presentationInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "updateFidelity");

    v12 = -[BLSHEnvironmentDateSpecifier initWithPresentationDate:fidelity:environment:userObject:]([BLSHEnvironmentDateSpecifier alloc], "initWithPresentationDate:fidelity:environment:userObject:", v8, v11, v3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    BLSHSubhostedEnvironmentIdentifierForEnvironment(v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entrySpecifierForTimelineIdentifier:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "timelineEntry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[BLSHEnvironmentDateSpecifier initWithPresentationDate:fidelity:environment:userObject:]([BLSHEnvironmentDateSpecifier alloc], "initWithPresentationDate:fidelity:environment:userObject:", v15, objc_msgSend(v8, "grantedFidelity"), v3, *(_QWORD *)(a1 + 48));
  }

  return v12;
}

uint64_t __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_145(uint64_t a1, double a2)
{
  NSObject *v4;
  uint64_t v5;

  bls_environment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_145_cold_1(a1, v4, v5, a2);

  return objc_msgSend(*(id *)(a1 + 48), "performBacklightRampWithDuration:", a2);
}

- (void)performDesiredFidelityRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  BLSBacklightSceneEnvironment_Private *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  BLSHLocalHostSceneEnvironmentUpdater *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BLSBacklightSceneEnvironment_Private *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BLSHLocalHostSceneEnvironmentUpdater ensureInactiveEnvSessionCreated](self, "ensureInactiveEnvSessionCreated");
  v5 = -[BLSHLocalHostSceneEnvironmentUpdater ensureAlwaysOnSessionCreated](self, "ensureAlwaysOnSessionCreated");
  v6 = self->_localHostEnvironment;
  -[BLSBacklightSceneEnvironment_Private alwaysOnSession](v6, "alwaysOnSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  bls_environment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[BLSBacklightSceneEnvironment_Private identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v14 = self;
    v15 = 2114;
    v16 = v4;
    v17 = 2114;
    v18 = v7;
    v19 = 2048;
    v20 = v6;
    v21 = 2114;
    v22 = v9;
    v23 = 1024;
    v24 = v5;
    _os_log_impl(&dword_2145AC000, v8, OS_LOG_TYPE_INFO, "%p (localHostUpdater) performDesiredFidelityRequest:%{public}@ alwaysOnSession:%{public}@ environment:<%p %{public}@>, createdSession=%{BOOL}u", buf, 0x3Au);

  }
  -[BLSBacklightSceneEnvironment_Private delegate](v6, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__BLSHLocalHostSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke;
    v11[3] = &unk_24D1BE038;
    v12 = v4;
    -[BLSHLocalHostSceneEnvironmentUpdater aggregateDesiredFidelityForBacklightState:withCompletion:](self, "aggregateDesiredFidelityForBacklightState:withCompletion:", 1, v11);

  }
  else
  {
    objc_msgSend(v4, "completeWithDesiredFidelity:", 1);
  }

}

uint64_t __70__BLSHLocalHostSceneEnvironmentUpdater_performDesiredFidelityRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWithDesiredFidelity:", a2);
}

- (void)performFrameSpecifiersRequest:(id)a3
{
  id v4;
  BLSBacklightSceneEnvironment_Private *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  BLSHLocalHostSceneEnvironmentUpdater *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  BLSBacklightSceneEnvironment_Private *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BLSHLocalHostSceneEnvironmentUpdater ensureInactiveEnvSessionCreated](self, "ensureInactiveEnvSessionCreated");
  v5 = self->_localHostEnvironment;
  -[BLSBacklightSceneEnvironment_Private alwaysOnSession](v5, "alwaysOnSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  bls_environment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "specifierCount");
    -[BLSBacklightSceneEnvironment_Private identifier](v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v19 = self;
    v20 = 2114;
    v21 = v4;
    v22 = 1024;
    v23 = v9;
    v24 = 2048;
    v25 = v5;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "%p (localHostUpdater) performFrameSpecifiersRequest:%{public}@ session-model:%d environment:<%p %{public}@>", buf, 0x30u);

  }
  -[BLSBacklightSceneEnvironment_Private delegate](v5, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v6)
  {
    objc_msgSend(v4, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousPresentationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "shouldReset");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__BLSHLocalHostSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke;
    v15[3] = &unk_24D1BE060;
    v16 = v6;
    v17 = v4;
    -[BLSHLocalHostSceneEnvironmentUpdater timelinesForDateInterval:previousPresentationDate:localHostEnvironment:shouldReset:completion:](self, "timelinesForDateInterval:previousPresentationDate:localHostEnvironment:shouldReset:completion:", v12, v13, v5, v14, v15);

  }
  else
  {
    objc_msgSend(v4, "completeWithDateSpecifiers:", MEMORY[0x24BDBD1A8]);
  }

}

uint64_t __70__BLSHLocalHostSceneEnvironmentUpdater_performFrameSpecifiersRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performFrameSpecifiersRequest:timelines:", *(_QWORD *)(a1 + 40), a2);
}

- (void)environmentStateMachine:(id)a3 didBeginUpdateToState:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  BLSBacklightChangeEvent *v7;
  BLSBacklightChangeEvent *v8;
  _BOOL4 v9;
  NSObject *v10;
  BLSBacklightSceneUpdate *v11;
  void *v12;
  uint8_t buf[4];
  BLSHLocalHostSceneEnvironmentUpdater *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  BLSBacklightChangeEvent *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_lock_localTriggerEventForPerformingEvent;
  v8 = v7;
  if (self->_lock_sceneUpdateForPerformingEvent)
    v9 = -[BLSBacklightChangeEvent state](v7, "state") == a4;
  else
    v9 = 0;
  bls_backlight_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v14 = self;
    v15 = 2114;
    v16 = v12;
    v17 = 1024;
    v18 = v9;
    v19 = 2114;
    v20 = v8;
    _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) didBeginUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@", buf, 0x26u);

  }
  v11 = self->_lock_sceneUpdateForPerformingEvent;
  os_unfair_lock_unlock(p_lock);
  if (v9)
  {
    -[BLSBacklightSceneUpdate sceneContentsDidUpdate](v11, "sceneContentsDidUpdate");
    BSDispatchMain();
  }

}

void __86__BLSHLocalHostSceneEnvironmentUpdater_environmentStateMachine_didBeginUpdateToState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (os_unfair_lock_s *)(v2 + 8);
  v4 = *(id *)(v2 + 40);
  os_unfair_lock_unlock(v3);
  objc_msgSend(v4, "updaterDidBeginUpdateToBacklightState:", *(_QWORD *)(a1 + 40));

}

- (void)environmentStateMachine:(id)a3 didCompleteUpdateToState:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  BLSBacklightChangeEvent *v7;
  BLSBacklightChangeEvent *v8;
  _BOOL4 v9;
  NSObject *v10;
  BLSBacklightSceneUpdate *v11;
  BLSBacklightChangeEvent *lock_localTriggerEventForPerformingEvent;
  BLSBacklightSceneUpdate *lock_sceneUpdateForPerformingEvent;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int IsActive;
  void *v19;
  int v20;
  BLSHLocalHostSceneEnvironmentUpdater *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  BLSBacklightChangeEvent *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_lock_localTriggerEventForPerformingEvent;
  v8 = v7;
  if (self->_lock_sceneUpdateForPerformingEvent)
    v9 = -[BLSBacklightChangeEvent state](v7, "state") == a4;
  else
    v9 = 0;
  bls_backlight_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightState();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218754;
    v21 = self;
    v22 = 2114;
    v23 = v19;
    v24 = 1024;
    v25 = v9;
    v26 = 2114;
    v27 = v8;
    _os_log_debug_impl(&dword_2145AC000, v10, OS_LOG_TYPE_DEBUG, "%p (localHostUpdater) didCompleteUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@", (uint8_t *)&v20, 0x26u);

  }
  v11 = self->_lock_sceneUpdateForPerformingEvent;
  if (v9)
  {
    lock_localTriggerEventForPerformingEvent = self->_lock_localTriggerEventForPerformingEvent;
    self->_lock_localTriggerEventForPerformingEvent = 0;

    lock_sceneUpdateForPerformingEvent = self->_lock_sceneUpdateForPerformingEvent;
    self->_lock_sceneUpdateForPerformingEvent = 0;

    os_unfair_lock_unlock(p_lock);
    -[BLSBacklightSceneUpdate context](v11, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isAnimated");

    if (v15)
      -[BLSBacklightSceneUpdate sceneContentsAnimationDidComplete](v11, "sceneContentsAnimationDidComplete");
    -[BLSBacklightSceneUpdate context](v11, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "visualState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    BLSBacklightStateForVisuaState();
    IsActive = BLSBacklightStateIsActive();

    if (IsActive)
      -[BLSHLocalHostSceneEnvironmentUpdater destroyInactiveEnvSession](self, "destroyInactiveEnvSession");
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)environmentStateMachine:(id)a3 didUpdateToPresentation:(id)a4
{
  id v5;
  BLSHBacklightInactiveEnvironmentSession *v6;
  _BOOL4 v7;
  BLSHBacklightEnvironmentPresentation *lock_updatingToPresentation;
  BLSHBacklightInactiveEnvironmentSession *v9;
  id v10;

  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_lock_inactiveEnvSession;
  v7 = -[BLSHBacklightEnvironmentPresentation isEqual:](self->_lock_updatingToPresentation, "isEqual:", v5);
  lock_updatingToPresentation = self->_lock_updatingToPresentation;
  self->_lock_updatingToPresentation = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v7)
  {
    v9 = v6;
    v10 = v5;
    BSDispatchMain();

  }
}

uint64_t __88__BLSHLocalHostSceneEnvironmentUpdater_environmentStateMachine_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updaterDidUpdateToPresentation:", *(_QWORD *)(a1 + 40));
}

- (void)environmentStateMachine:(id)a3 didUpdateToSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!v6)
  {
LABEL_6:

    return;
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v6, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v9, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAnimated");

    if (v11)
      objc_msgSend(v9, "sceneContentsAnimationDidComplete");
    objc_msgSend(v9, "sceneContentsDidUpdate");

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p (localHostSceneEnvironmentUpdater) didUpdateToSpecifier: specifier %@ userObject %@ isn't a BLSBacklightSceneUpdate"), self, v6, v9, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHLocalHostSceneEnvironmentUpdater environmentStateMachine:didUpdateToSpecifier:].cold.1();
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)inactiveEnvironmentSession:(id)a3 updateToPresentation:(id)a4
{
  id v6;
  BLSHBacklightInactiveEnvironmentSession *lock_inactiveEnvSession;
  BLSBacklightSceneUpdate *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BLSHBacklightInactiveEnvironmentSession *v14;

  v14 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_inactiveEnvSession = self->_lock_inactiveEnvSession;
  if (lock_inactiveEnvSession != v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("session:%@ does not match _session:%@"), v14, lock_inactiveEnvSession);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHLocalHostSceneEnvironmentUpdater inactiveEnvironmentSession:updateToPresentation:].cold.2();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x214605934);
  }
  if (!self->_environmentStateMachine)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("session:%@ exists but no environment state machine"), v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHLocalHostSceneEnvironmentUpdater inactiveEnvironmentSession:updateToPresentation:].cold.1();
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_lock_updatingToPresentation, a4);
  v8 = self->_lock_sceneUpdateForPerformingEvent;
  -[BLSBacklightSceneUpdate context](v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visualState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = BLSBacklightStateForVisuaState();
  }
  else
  {
    -[BLSBacklightSceneEnvironment_Private visualState](self->_localHostEnvironment, "visualState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BLSBacklightStateForVisuaState();

  }
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightEnvironmentStateMachine setPresentation:withTargetBacklightState:](self->_environmentStateMachine, "setPresentation:withTargetBacklightState:", v6, v11);

}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  BLSBacklightSceneEnvironment_Private *localHostEnvironment;
  void *v6;
  id v7;
  void *v8;
  id v9;

  localHostEnvironment = self->_localHostEnvironment;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(a3, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (env:%@)"), v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLSBacklightSceneEnvironment_Private invalidateAllTimelinesForReason:](localHostEnvironment, "invalidateAllTimelinesForReason:", v8);
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalAssertTester, 0);
  objc_storeStrong((id *)&self->_lock_localTriggerEventForPerformingEvent, 0);
  objc_storeStrong((id *)&self->_lock_sceneUpdateForPerformingEvent, 0);
  objc_storeStrong((id *)&self->_lock_timelinesCalculators, 0);
  objc_storeStrong((id *)&self->_environmentStateMachine, 0);
  objc_storeStrong((id *)&self->_lock_updatingToPresentation, 0);
  objc_storeStrong((id *)&self->_lock_inactiveEnvSession, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_storeStrong((id *)&self->_localHostEnvironment, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
}

- (void)updatedEnvironmentWithDelta:backlightSceneUpdate:.cold.1()
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

- (void)updatedEnvironmentWithDelta:backlightSceneUpdate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p (localHostUpdater) will start sceneUpdateForPerformingEvent:%{public}@");
}

- (void)updatedEnvironmentWithDelta:backlightSceneUpdate:.cold.3()
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

- (void)updatedEnvironmentWithDelta:backlightSceneUpdate:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_2145AC000, v0, v1, "%p (localHostUpdater) calling [environmentStateMachine updateToSpecifier:], dateSpecifier:%{public}@");
}

void __89__BLSHLocalHostSceneEnvironmentUpdater_updatedEnvironmentWithDelta_backlightSceneUpdate___block_invoke_145_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = 134218498;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  v10 = 2048;
  v11 = a4;
  OUTLINED_FUNCTION_19(&dword_2145AC000, a2, a3, "%p (localHostUpdater) [environmentStateMachine performEvent:withInitialSpecifier:performBacklightRamp:] finished, event:%{public}@, duration:%1.1f", (uint8_t *)&v6);
}

- (void)environmentStateMachine:didUpdateToSpecifier:.cold.1()
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

- (void)inactiveEnvironmentSession:updateToPresentation:.cold.2()
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
