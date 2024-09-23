@implementation BLSHLocalHostSceneEnvironment

- (BLSHLocalHostSceneEnvironment)initWithBacklightSceneEnvironment:(id)a3
{
  id v4;
  void *v5;
  BLSHLocalHostSceneEnvironment *v6;
  uint64_t v7;
  BLSBacklightSceneVisualState *lock_visualState;
  uint64_t v9;
  NSDate *lock_presentationDate;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)BLSHLocalHostSceneEnvironment;
  v6 = -[BLSHBaseSceneHostEnvironment initWithIdentifier:](&v12, sel_initWithIdentifier_, v5);

  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v6->_clientEnvironment, v4);
    objc_msgSend(v4, "visualState");
    v7 = objc_claimAutoreleasedReturnValue();
    lock_visualState = v6->_lock_visualState;
    v6->_lock_visualState = (BLSBacklightSceneVisualState *)v7;

    objc_msgSend(v4, "presentationDate");
    v9 = objc_claimAutoreleasedReturnValue();
    lock_presentationDate = v6->_lock_presentationDate;
    v6->_lock_presentationDate = (NSDate *)v9;

    -[BLSHBaseSceneHostEnvironment setAlwaysOnEnabledForEnvironment:](v6, "setAlwaysOnEnabledForEnvironment:", 1);
  }

  return v6;
}

- (BOOL)hasVisualStateMistmach
{
  BLSHLocalHostSceneEnvironment *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_visualStateMismatchStartTime != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)clientHasDelegate
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isClientActive
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v3 = objc_msgSend(WeakRetained, "isDelegateActive");

  return v3;
}

- (id)visualState
{
  os_unfair_lock_s *p_lock;
  BLSBacklightSceneVisualState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_visualState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)clientSupportsAlwaysOn
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v3 = objc_msgSend(WeakRetained, "supportsAlwaysOn");

  return v3;
}

- (BOOL)isLiveUpdating
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v3 = objc_msgSend(WeakRetained, "isLiveUpdating");

  return v3;
}

- (void)setLiveUpdating:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BLSHLocalHostSceneEnvironment *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shouldn't be called on this subclass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BLSHLocalHostSceneEnvironment.m");
    v17 = 1024;
    v18 = 67;
    v19 = 2114;
    v20 = v5;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v3 = objc_msgSend(WeakRetained, "hasUnrestrictedFramerateUpdates");

  return v3;
}

- (void)setUnrestrictedFramerateUpdates:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BLSHLocalHostSceneEnvironment *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shouldn't be called on this subclass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BLSHLocalHostSceneEnvironment.m");
    v17 = 1024;
    v18 = 75;
    v19 = 2114;
    v20 = v5;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)presentationDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_presentationDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)clearPresentationDate
{
  os_unfair_lock_s *p_lock;
  NSDate *lock_presentationDate;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentationDate = self->_lock_presentationDate;
  self->_lock_presentationDate = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)requestDateSpecifiersForDateInterval:(id)a3 previousPresentationDate:(id)a4 shouldReset:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __118__BLSHLocalHostSceneEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke;
  v18[3] = &unk_24D1BE0F8;
  v19 = v10;
  v20 = WeakRetained;
  v21 = v9;
  v22 = v11;
  v14 = v11;
  v15 = v9;
  v16 = WeakRetained;
  v17 = v10;
  objc_msgSend(v13, "environment:timelinesForDateInterval:previousSpecifier:completion:", v16, v15, 0, v18);

}

void __118__BLSHLocalHostSceneEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "alwaysOnSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "specifierForPresentationDate:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BE0B828], "constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:", v7, *(_QWORD *)(a1 + 48), 1, v4, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

id __118__BLSHLocalHostSceneEnvironment_requestDateSpecifiersForDateInterval_previousPresentationDate_shouldReset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x24BE0B818];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "presentationInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "requestedFidelity");

  v8 = (void *)objc_msgSend(v4, "initWithDate:fidelity:", v6, v7);
  return v8;
}

- (void)requestedFidelityForInactiveContentWithCompletion:(id)a3
{
  BLSBacklightSceneEnvironment_Private **p_clientEnvironment;
  id v5;
  void *v6;
  id WeakRetained;

  p_clientEnvironment = &self->_clientEnvironment;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_clientEnvironment);
  objc_msgSend(WeakRetained, "visualState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(v6, "updateFidelity"));

}

- (void)updateToDateSpecifier:(id)a3 sceneContentsUpdated:(id)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSDate *v23;
  NSDate *lock_presentationDate;
  void *v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  BLSBacklightSceneVisualState *v29;
  BLSBacklightSceneVisualState *lock_visualState;
  NSDate *v31;
  NSDate *v32;
  NSObject *v33;
  BLSBacklightSceneVisualState *v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void (**v62)(_QWORD);
  dispatch_time_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  __CFString *v70;
  void *v71;
  void *v72;
  BLSHLocalHostSceneEnvironment *v73;
  BLSHLocalHostSceneEnvironment *v74;
  void *v75;
  SEL v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  _QWORD v83[4];
  BLSBacklightSceneVisualState *v84;
  id v85;
  id v86;
  BLSHLocalHostSceneEnvironment *v87;
  SEL v88;
  double v89;
  uint8_t buf[4];
  BLSHLocalHostSceneEnvironment *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  double v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v79 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  objc_msgSend(WeakRetained, "visualState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = a2;
  v78 = v10;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v45 = (void *)MEMORY[0x24BDD17C8];
      -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", CFSTR("%p %@: userObject on %@ is not a BLSBacklightSceneUpdate"), self, v46, v7);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.5();
      objc_msgSend(objc_retainAutorelease(v47), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21460A0C8);
    }
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "isAnimated");
    v12 = objc_msgSend(v11, "isTouchTargetable");
    objc_msgSend(v11, "previousVisualState");
    v81 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "triggerEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v48 = (void *)MEMORY[0x24BDD17C8];
      -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%p %@: trigger event should be nil"), self, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.4();
      objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21460A13CLL);
    }
    objc_msgSend(v11, "visualState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v9);

    if ((v15 & 1) == 0)
    {
      v51 = (void *)MEMORY[0x24BDD17C8];
      -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "visualState");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("%p %@: scene update visual state and clientEnvironment's visual state don't match: %@, %@"), self, v52, v53, v9);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.3();
      objc_msgSend(objc_retainAutorelease(v54), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21460A1C8);
    }

  }
  else
  {
    v81 = v9;
    v12 = 0;
  }
  objc_msgSend(WeakRetained, "alwaysOnSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "specifierForPresentationDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_msgSend(v18, "grantedFidelity");
    if (v19 != objc_msgSend(v7, "fidelity"))
    {
      v55 = (void *)MEMORY[0x24BDD17C8];
      -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "grantedFidelity");
      NSStringFromBLSUpdateFidelity();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fidelity");
      NSStringFromBLSUpdateFidelity();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringWithFormat:", CFSTR("%p %@:frameSpecifier %@ grantedFidelity (%@) doesn't match dateSpecifier %@ fidelity (%@)"), self, v56, v18, v57, v7, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.2();
      objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21460A274);
    }
  }
  v77 = v16;
  v20 = v79;
  BYTE1(v64) = 1;
  LOBYTE(v64) = v12;
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B870]), "initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:", WeakRetained, v9, v81, v18, v10, 0, v64, v79, 0, 0);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v18, "presentationInterval");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v82 = v9;
  if (v21)
  {
    objc_msgSend(v21, "startDate");
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lock_presentationDate = self->_lock_presentationDate;
    self->_lock_presentationDate = v23;

    v89 = 0.0;
    objc_msgSend(WeakRetained, "presentationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v22, "bls_containsDate:withEpsilon:outDelta:", v25, &v89, 0.0001);

    if ((v26 & 1) == 0)
    {
      bls_environment_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(WeakRetained, "identifier");
        v74 = (BLSHLocalHostSceneEnvironment *)objc_claimAutoreleasedReturnValue();
        v43 = CFSTR("early");
        if (v89 > 0.0)
          v43 = CFSTR("late");
        v68 = v43;
        if (v89 >= 0.0)
          v44 = v89;
        else
          v44 = -v89;
        objc_msgSend(v7, "bls_shortLoggingString");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "frameSpecifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "bls_shortLoggingString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "bls_shortLoggingString");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v91 = v74;
        v92 = 2112;
        v93 = v68;
        v94 = 2048;
        v95 = v44;
        v96 = 2114;
        v97 = v71;
        v98 = 2114;
        v99 = v67;
        v100 = 2114;
        v101 = v66;
        v102 = 2114;
        v103 = v65;
        _os_log_fault_impl(&dword_2145AC000, v27, OS_LOG_TYPE_FAULT, "updateToDateSpecifier: %{public}@ clientEnv.presentationDate too %@ for presentationInterval by %0.4fs dateSpecifier:%{public}@ clientEnv.frameSpecifier:%{public}@ visualState:%{public}@ clientEnv.visualState:%{public}@", buf, 0x48u);

      }
    }
    if (v7)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend(WeakRetained, "presentationDate");
    v31 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v32 = self->_lock_presentationDate;
    self->_lock_presentationDate = v31;

    if (v7)
    {
LABEL_14:
      v28 = objc_msgSend(v7, "fidelity");
      if (-[BLSBacklightSceneVisualState updateFidelity](self->_lock_visualState, "updateFidelity") != v28)
      {
        v29 = (BLSBacklightSceneVisualState *)-[BLSBacklightSceneVisualState newVisualStateWithUpdateFidelity:](self->_lock_visualState, "newVisualStateWithUpdateFidelity:", v28);
        lock_visualState = self->_lock_visualState;
        self->_lock_visualState = v29;

      }
      goto LABEL_20;
    }
  }
  bls_environment_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    -[BLSHLocalHostSceneEnvironment updateToDateSpecifier:sceneContentsUpdated:].cold.1(self, (uint64_t)v80, v33);

LABEL_20:
  v34 = self->_lock_visualState;
  if ((-[BLSBacklightSceneVisualState isEqual:](v34, "isEqual:", v82) & 1) == 0)
  {
    bls_environment_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      -[BLSBacklightSceneVisualState bls_shortLoggingString](v34, "bls_shortLoggingString");
      v73 = (BLSHLocalHostSceneEnvironment *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "bls_shortLoggingString");
      v41 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v91 = v73;
      v92 = 2114;
      v93 = v70;
      v94 = 2114;
      v95 = *(double *)&v41;
      v42 = (void *)v41;
      _os_log_fault_impl(&dword_2145AC000, v35, OS_LOG_TYPE_FAULT, "hostSceneVisualState != clientEnvVisualState. visualState:%{public}@ clientEnvironment:%{public}@ clientEnvVisualState:%{public}@", buf, 0x20u);

    }
    if (os_variant_has_internal_diagnostics()
      && (-[BLSBacklightSceneVisualState isEqual:](v34, "isEqual:", v82) & 1) == 0)
    {
      v72 = (void *)MEMORY[0x24BDD17C8];
      -[BLSBacklightSceneVisualState bls_shortLoggingString](v34, "bls_shortLoggingString");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "bls_shortLoggingString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringWithFormat:", CFSTR("visualState:%@ clientEnvironment:%@ clientEnvVisualState:%@"), v75, v69, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      BLSHRecordCriticalAssertFailure(v61);
      v83[0] = MEMORY[0x24BDAC760];
      v83[1] = 3221225472;
      v83[2] = __76__BLSHLocalHostSceneEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke;
      v83[3] = &unk_24D1BE120;
      v84 = v34;
      v85 = WeakRetained;
      v87 = self;
      v88 = v76;
      v86 = v82;
      v62 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v83);
      if (BLSHIsUnitTestRunning())
      {
        v62[2](v62);
      }
      else
      {
        v63 = dispatch_time(0, 1000000000);
        dispatch_after(v63, MEMORY[0x24BDAC9B8], v62);
      }

    }
  }
  os_unfair_lock_unlock(&self->_lock);
  bls_environment_log();
  v36 = objc_claimAutoreleasedReturnValue();
  if (-[BLSHLocalHostSceneEnvironment hasVisualStateMistmach](self, "hasVisualStateMistmach"))
    v37 = OS_LOG_TYPE_DEFAULT;
  else
    v37 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v36, v37))
  {
    -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v91 = self;
    v92 = 2114;
    v93 = v38;
    v94 = 2114;
    v95 = *(double *)&v39;
    v96 = 2114;
    v97 = v80;
    _os_log_impl(&dword_2145AC000, v36, v37, "%p (localHostEnv) updateToDateSpecifier: calling performBacklightSceneUpdate: on delegate for %{public}@ %{public}@ with %{public}@", buf, 0x2Au);

    v20 = v79;
  }

  objc_msgSend(WeakRetained, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "environment:performBacklightSceneUpdate:", WeakRetained, v80);

}

void __76__BLSHLocalHostSceneEnvironment_updateToDateSpecifier_sceneContentsUpdated___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v3;
  void *v4;
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
  objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "bls_shortLoggingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("visualState:%@ clientEnvironment:%@ clientEnvVisualState:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2048;
    v17 = v11;
    v18 = 2114;
    v19 = CFSTR("BLSHLocalHostSceneEnvironment.m");
    v20 = 1024;
    v21 = 165;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)updateToVisualState:(id)a3 presentationDateSpecifier:(id)a4 animated:(BOOL)a5 triggerEvent:(id)a6 touchTargetable:(BOOL)a7 sceneContentsUpdated:(id)a8 performBacklightRamp:(id)a9 animationComplete:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id WeakRetained;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSDate *v33;
  NSDate *lock_presentationDate;
  void *v35;
  char v36;
  NSObject *v37;
  NSDate *v38;
  NSDate *v39;
  NSDate *lock_visualStateMismatchStartTime;
  void *v41;
  int v42;
  NSDate *v43;
  NSDate *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSDate *v50;
  NSDate *v51;
  NSDate *v52;
  NSObject *v53;
  __CFString *v54;
  NSObject *v55;
  os_log_type_t v56;
  void *v57;
  NSDate *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  __CFString *v63;
  void *v64;
  const __CFString *v65;
  double v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  BLSHLocalHostSceneEnvironment *v77;
  id obj;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  void *v88;
  id v89;
  void *v90;
  __CFString *v91;
  double v92;
  uint8_t buf[4];
  BLSHLocalHostSceneEnvironment *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  double v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  uint64_t v106;
  uint64_t v107;

  v87 = a5;
  v107 = *MEMORY[0x24BDAC8D0];
  v91 = (__CFString *)a3;
  v16 = a4;
  v89 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientEnvironment);
  v90 = v16;
  objc_msgSend(v16, "userObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v71 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(WeakRetained, "identifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "stringWithFormat:", CFSTR("%p %@: userObject on %@ is not a BLSBacklightSceneUpdate"), self, v72, v90);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHLocalHostSceneEnvironment updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:].cold.1();
    objc_msgSend(objc_retainAutorelease(v73), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21460AC70);
  }
  obj = a3;
  v83 = v21;
  objc_msgSend(v21, "context");
  v22 = v17;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "previousVisualState");
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "alwaysOnSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v25;
  objc_msgSend(v25, "specifierForPresentationDate:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc(MEMORY[0x24BE0B870]);
  v84 = v18;
  v86 = v22;
  LOWORD(v74) = a7;
  v82 = (void *)v24;
  v29 = v24;
  v30 = v27;
  v88 = (void *)objc_msgSend(v28, "initForEnvironment:visualState:previousVisualState:frameSpecifier:animated:triggerEvent:touchTargetable:isUpdateToDateSpecifier:sceneContentsUpdated:performBacklightRamp:sceneContentsAnimationComplete:", WeakRetained, v91, v29, v27, v87, v89, v74, v22, v18, v19);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v27, "presentationInterval");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v31;
  v80 = v19;
  if (v31)
  {
    v32 = v31;
    objc_msgSend(v31, "startDate");
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lock_presentationDate = self->_lock_presentationDate;
    self->_lock_presentationDate = v33;

    v92 = 0.0;
    objc_msgSend(WeakRetained, "presentationDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v32, "bls_containsDate:withEpsilon:outDelta:", v35, &v92, 0.0001);

    if ((v36 & 1) == 0)
    {
      bls_environment_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(WeakRetained, "identifier");
        v77 = (BLSHLocalHostSceneEnvironment *)objc_claimAutoreleasedReturnValue();
        if (v92 <= 0.0)
          v65 = CFSTR("early");
        else
          v65 = CFSTR("late");
        if (v92 >= 0.0)
          v66 = v92;
        else
          v66 = -v92;
        objc_msgSend(v90, "bls_shortLoggingString");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "frameSpecifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString bls_shortLoggingString](v91, "bls_shortLoggingString");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "visualState");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "bls_shortLoggingString");
        v69 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v94 = v77;
        v95 = 2112;
        v96 = v65;
        v97 = 2048;
        v98 = v66;
        v99 = 2114;
        v100 = v75;
        v101 = 2114;
        v102 = v67;
        v103 = 2114;
        v104 = v68;
        v105 = 2114;
        v106 = v69;
        v70 = (void *)v69;
        _os_log_fault_impl(&dword_2145AC000, v37, OS_LOG_TYPE_FAULT, "updateToVisualState: %{public}@ clientEnv.presentationDate too %@ for presentationInterval by %0.4fs presentationDateSpecifier:%{public}@ clientEnv.frameSpecifier:%{public}@ visualState:%{public}@ clientEnv.visualState:%{public}@", buf, 0x48u);

      }
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "presentationDate");
    v38 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v39 = self->_lock_presentationDate;
    self->_lock_presentationDate = v38;

  }
  lock_visualStateMismatchStartTime = self->_lock_visualStateMismatchStartTime;
  objc_msgSend(WeakRetained, "visualState");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[__CFString isEssentiallyEqualToVisualState:](v91, "isEssentiallyEqualToVisualState:", v41);

  v43 = self->_lock_visualStateMismatchStartTime;
  if (lock_visualStateMismatchStartTime && v42)
  {
    v44 = self->_lock_visualStateMismatchStartTime;
    self->_lock_visualStateMismatchStartTime = 0;
  }
  else
  {
    if (lock_visualStateMismatchStartTime)
      v45 = 1;
    else
      v45 = v42;
    if ((v45 & 1) != 0)
    {
      v46 = v83;
      v47 = v84;
      v48 = obj;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v49 = v30;
    v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v51 = self->_lock_visualStateMismatchStartTime;
    self->_lock_visualStateMismatchStartTime = v50;

    v52 = v50;
    v30 = v49;
    v44 = v43;
    v43 = v52;
  }
  v47 = v84;
  v48 = obj;

  v46 = v83;
LABEL_17:
  objc_storeStrong((id *)&self->_lock_visualState, v48);
  os_unfair_lock_unlock(&self->_lock);
  if ((v42 & 1) != 0)
  {
    if (!lock_visualStateMismatchStartTime)
      goto LABEL_27;
    bls_environment_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      -[NSDate bls_loggingString](v43, "bls_loggingString");
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v94 = self;
      v95 = 2114;
      v96 = v54;
      v97 = 2114;
      v98 = *(double *)&v91;
      _os_log_impl(&dword_2145AC000, v53, OS_LOG_TYPE_DEFAULT, "%p: (localhostEnv) resolved visualStateMismatch from %{public}@ to %{public}@", buf, 0x20u);

    }
  }
  else
  {
    bls_environment_log();
    v55 = objc_claimAutoreleasedReturnValue();
    v53 = v55;
    if (lock_visualStateMismatchStartTime)
      v56 = OS_LOG_TYPE_DEFAULT;
    else
      v56 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v55, v56))
    {
      objc_msgSend(WeakRetained, "visualState");
      v85 = v30;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v58 = v43;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate bls_loggingString](v58, "bls_loggingString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v94 = self;
      v95 = 2112;
      v96 = v91;
      v97 = 2112;
      v98 = *(double *)&v57;
      v99 = 2112;
      v100 = v59;
      v101 = 2114;
      v102 = v60;
      _os_log_impl(&dword_2145AC000, v53, v56, "%p (localHostEnv) new visualState %@ is not the same as visualState from clientEnvironment: %@, %@ mismatch began at %{public}@", buf, 0x34u);

      v43 = v58;
      v30 = v85;
    }
  }

LABEL_27:
  bls_environment_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    -[BLSHBaseSceneHostEnvironment identifier](self, "identifier");
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegate");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v94 = self;
    v95 = 2114;
    v96 = v63;
    v97 = 2114;
    v98 = *(double *)&v64;
    v99 = 2114;
    v100 = v88;
    _os_log_debug_impl(&dword_2145AC000, v61, OS_LOG_TYPE_DEBUG, "%p (localHostEnv) updateToVisualState: calling performBacklightSceneUpdate: on delegate for %{public}@ %{public}@ with %{public}@", buf, 0x2Au);

  }
  objc_msgSend(WeakRetained, "delegate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "environment:performBacklightSceneUpdate:", WeakRetained, v88);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_visualStateMismatchStartTime, 0);
  objc_storeStrong((id *)&self->_lock_presentationDate, 0);
  objc_storeStrong((id *)&self->_lock_visualState, 0);
  objc_destroyWeak((id *)&self->_clientEnvironment);
}

- (void)updateToDateSpecifier:(NSObject *)a3 sceneContentsUpdated:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  v11 = 2114;
  v12 = a2;
  _os_log_fault_impl(&dword_2145AC000, a3, OS_LOG_TYPE_FAULT, "%p: (localHostEnv) updateToDateSpecifier: got nil dateSpecifier for %{public}@ sceneUpdate:%{public}@", (uint8_t *)&v7, 0x20u);

}

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.2()
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

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.3()
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

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.4()
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

- (void)updateToDateSpecifier:sceneContentsUpdated:.cold.5()
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

- (void)updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:.cold.1()
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
