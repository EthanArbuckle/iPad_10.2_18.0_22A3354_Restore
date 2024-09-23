@implementation BLSHEnvironmentTransitionState

+ (id)createStateForEnvironment:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BLSHEnvironmentTransitionState initWithEnvironment:delegate:]((id *)[BLSHEnvironmentTransitionState alloc], v6, v5);

  return v7;
}

- (id)initWithEnvironment:(void *)a3 delegate:
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  objc_super v11;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)BLSHEnvironmentTransitionState;
    v8 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 2) = 0;
      objc_storeStrong(v8 + 9, a2);
      objc_storeStrong(a1 + 2, a3);
      bls_scenes_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BLSHEnvironmentTransitionState initWithEnvironment:delegate:].cold.1((uint64_t)a1, a1 + 9);

    }
  }

  return a1;
}

- (void)dealloc
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 72), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_2145AC000, v2, v3, "ETS:%p:%{public}@ transitionState dealloc", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (id)bls_loggingString
{
  return -[BLSHEnvironmentTransitionState descriptionAbbreviated:]((uint64_t)self, 0);
}

- (id)descriptionAbbreviated:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  char v11;

  if (!a1)
    return 0;
  v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__BLSHEnvironmentTransitionState_descriptionAbbreviated___block_invoke;
  v8[3] = &unk_24D1BC2F8;
  v9 = v4;
  v10 = a1;
  v11 = a2;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v8);
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bls_shortLoggingString
{
  return -[BLSHEnvironmentTransitionState descriptionAbbreviated:]((uint64_t)self, 1);
}

- (id)description
{
  return -[BLSHEnvironmentTransitionState descriptionAbbreviated:]((uint64_t)self, 0);
}

id __57__BLSHEnvironmentTransitionState_descriptionAbbreviated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id result;
  int v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  BOOL v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  const __CFString *v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<NULL>");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v5, v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v7 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", CFSTR("animating"), 0);
    v7 = *(_QWORD *)(a1 + 40);
  }
  v8 = *(_QWORD *)(v7 + 24);
  if (v8)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v8, CFSTR("->"));
    v7 = *(_QWORD *)(a1 + 40);
  }
  result = *(id *)(v7 + 32);
  if (result)
  {
    v11 = objc_msgSend(result, "didUpdateInitialState");
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "didCompleteAnimation");
    v13 = CFSTR("-->");
    if ((v11 & v12) != 0)
      v13 = CFSTR("->|");
    if ((v11 | v12 ^ 1) == 1)
      v14 = v13;
    else
      v14 = CFSTR("-()->");
    if (v11)
      v15 = v12 == 0;
    else
      v15 = 0;
    if (v15)
      v16 = CFSTR("-•->");
    else
      v16 = v14;
    result = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), v16);
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (v17)
    {
      v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v17, CFSTR("completedOld"));
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
        v19 = *(const __CFString **)(*(_QWORD *)(a1 + 40) + 48);
      else
        v19 = CFSTR("<NULL>");
      return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v19, CFSTR("newPending"));
    }
  }
  return result;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_lock_animating, CFSTR("animating"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_lock_requestingFidelityTarget, CFSTR("requestingFidelityTarget"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_lock_inProgressUpdateTarget, CFSTR("inProgressUpdateTarget"), 1);
  -[BLSHBacklightSceneHostEnvironment debugDescription](self->_environment, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("environment"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%p:%@>"), self->_delegate, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("delegate"));

  -[BLSHEnvironmentTransitionStateTarget debugDescription](self->_lock_animationCompletedForOldTarget, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("completed"), 1);

  -[BLSHEnvironmentTransitionStateTarget debugDescription](self->_lock_animationCompletedWithNewTarget, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v12, CFSTR("wasPending"), 1);

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isUpdatingInitialState
{
  os_unfair_lock_s *p_lock;
  _BOOL4 v4;
  BLSHEnvironmentTransitionStateTarget *lock_inProgressUpdateTarget;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_requestingFidelityTarget)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    lock_inProgressUpdateTarget = self->_lock_inProgressUpdateTarget;
    if (lock_inProgressUpdateTarget)
      v4 = !-[BLSHEnvironmentTransitionStateTarget didUpdateInitialState](lock_inProgressUpdateTarget, "didUpdateInitialState");
    else
      LOBYTE(v4) = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isUpdatingVisualState
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_inProgressUpdateTarget)
    v4 = 1;
  else
    v4 = self->_lock_requestingFidelityTarget != 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isAnimating
{
  BLSHEnvironmentTransitionState *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_animating;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUpdatedToBacklightState:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  NSObject *v9;
  BLSHBacklightSceneHostEnvironment *environment;
  void *v11;
  int v12;
  BLSHEnvironmentTransitionState *v13;
  __int16 v14;
  BLSHBacklightSceneHostEnvironment *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((-[BLSHBacklightSceneHostEnvironment clientHasDelegate](self->_environment, "clientHasDelegate") & 1) != 0)
  {
    -[BLSHBacklightSceneHostEnvironment visualState](self->_environment, "visualState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHEnvironmentTransitionState visualStateForBacklightState:requestedFidelity:]((uint64_t)self, a3, objc_msgSend(v5, "updateFidelity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

    return v7;
  }
  else
  {
    bls_scenes_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      environment = self->_environment;
      NSStringFromBLSBacklightState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218498;
      v13 = self;
      v14 = 2114;
      v15 = environment;
      v16 = 2114;
      v17 = v11;
      _os_log_debug_impl(&dword_2145AC000, v9, OS_LOG_TYPE_DEBUG, "ETS:%p: client is disabled for %{public}@, so considering updated to state:%{public}@", (uint8_t *)&v12, 0x20u);

    }
    return 1;
  }
}

- (id)visualStateForBacklightState:(uint64_t)a3 requestedFidelity:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v6 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 16), "inactiveBudgetPolicy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 16), "osTimerProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BLSVisualStateForBacklightState(a2, a3, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)updateToBacklightState:(int64_t)a3 forEvent:(id)a4 touchTargetable:(BOOL)a5 presentationDate:(id)a6 sceneUpdate:(id)a7 performBacklightRamp:(id)a8
{
  id v13;
  id v14;
  id v15;
  BLSHEnvironmentTransitionStateTarget *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  int64_t v20;
  BLSHEnvironmentTransitionStateTarget *v21;
  BLSHBacklightSceneHostEnvironment *environment;
  id v23;
  id v24;
  BLSHEnvironmentTransitionStateTarget *v25;
  id v26;
  _QWORD v28[5];
  BLSHEnvironmentTransitionStateTarget *v29;
  id v30;
  id v31;
  BOOL v32;

  v26 = a6;
  v13 = a7;
  v14 = a8;
  v15 = a4;
  os_unfair_lock_lock(&self->_lock);
  v16 = [BLSHEnvironmentTransitionStateTarget alloc];
  v17 = self->_lock_nextSequenceID + 1;
  self->_lock_nextSequenceID = v17;
  -[BLSHBacklightSceneHostEnvironment identifier](self->_environment, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v20 = a3;
  v21 = -[BLSHEnvironmentTransitionStateTarget initWithSequenceID:backlightState:triggerEvent:backlightRampBlock:forIdentifier:previousTarget:](v16, "initWithSequenceID:backlightState:triggerEvent:backlightRampBlock:forIdentifier:previousTarget:", v19, a3, v15, v14, v18, self->_lock_requestingFidelityTarget);

  objc_storeStrong((id *)&self->_lock_requestingFidelityTarget, v21);
  os_unfair_lock_unlock(&self->_lock);
  environment = self->_environment;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __132__BLSHEnvironmentTransitionState_updateToBacklightState_forEvent_touchTargetable_presentationDate_sceneUpdate_performBacklightRamp___block_invoke;
  v28[3] = &unk_24D1BC320;
  v28[4] = self;
  v29 = v21;
  v32 = a5;
  v30 = v26;
  v31 = v13;
  v23 = v13;
  v24 = v26;
  v25 = v21;
  BLSHGetRequestedFidelityForBacklightState(v20, environment, v28);

}

void __132__BLSHEnvironmentTransitionState_updateToBacklightState_forEvent_touchTargetable_presentationDate_sceneUpdate_performBacklightRamp___block_invoke(uint64_t a1, uint64_t a2)
{
  -[BLSHEnvironmentTransitionState updateToTarget:touchTargetable:presentationDate:sceneUpdate:requestedFidelity:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56), a2);
}

- (void)updateToTarget:(unsigned int)a3 touchTargetable:(void *)a4 presentationDate:(void *)a5 sceneUpdate:(uint64_t)a6 requestedFidelity:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  id *v32;
  id *v33;
  BLSHEnvironmentTransitionStateTarget *v34;
  _QWORD *v35;
  NSObject *v36;
  void *v37;
  int v38;
  _QWORD *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id *v56;
  id *v57;
  id *v58;
  id *v59;
  id *v60;
  int v61;
  void *v62;
  void *v63;
  unsigned int v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  BLSHEnvironmentTransitionStateTarget *obj;
  _QWORD v73[4];
  id *v74;
  id *v75;
  _QWORD v76[2];
  id v77;
  _QWORD v78[4];
  id *v79;
  id *v80;
  BLSHEnvironmentTransitionStateTarget *v81;
  _QWORD v82[4];
  id *v83;
  id *v84;
  BLSHEnvironmentTransitionStateTarget *v85;
  id v86;
  char v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  BLSHEnvironmentTransitionStateTarget *v93;
  __int16 v94;
  _BYTE v95[10];
  _BYTE v96[6];
  _BYTE v97[10];
  _BYTE v98[6];
  __int16 v99;
  id v100;
  __int16 v101;
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v68 = a4;
  v66 = a5;
  if (a1)
  {
    objc_msgSend(v10, "triggerEvent");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v69 = *(id *)(a1 + 24);
    if (v69 == v10)
    {
      v11 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

    }
    -[BLSHEnvironmentTransitionState visualStateForBacklightState:requestedFidelity:](a1, objc_msgSend(v10, "backlightState"), a6);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    obj = -[BLSHEnvironmentTransitionStateTarget initWithTarget:visualState:presentationDate:]([BLSHEnvironmentTransitionStateTarget alloc], "initWithTarget:visualState:presentationDate:", v10, v70, v68);
    objc_msgSend(*(id *)(a1 + 72), "visualState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "presentationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[BLSHEnvironmentTransitionStateTarget isEqualToVisualState:presentationDate:](obj, "isEqualToVisualState:presentationDate:", v12, v13);

    v15 = *(id *)(a1 + 32);
    if (v71)
    {
      v16 = objc_msgSend(v71, "isEnvironmentTransitionAnimated");
      if (v15)
      {
LABEL_6:
        objc_msgSend(v15, "visualState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "presentationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[BLSHEnvironmentTransitionStateTarget isEqualToVisualState:presentationDate:](obj, "isEqualToVisualState:presentationDate:", v17, v18);

        goto LABEL_9;
      }
    }
    else
    {
      v16 = 0;
      if (v15)
        goto LABEL_6;
    }
    v19 = 0;
LABEL_9:
    v20 = *(unsigned __int8 *)(a1 + 64);
    if (*(_BYTE *)(a1 + 64))
    {
      if (v71)
      {
        v21 = objc_msgSend(v71, "previousState");
        v22 = v21 == -[BLSHEnvironmentTransitionStateTarget backlightState](obj, "backlightState");
        v23 = v22;
        if (v22 || ((v16 ^ 1) & 1) != 0)
          goto LABEL_18;
        goto LABEL_15;
      }
      v23 = 1;
    }
    else
    {
      if (v16)
      {
LABEL_15:
        v23 = objc_msgSend(*(id *)(a1 + 72), "isAlwaysOnEnabledForEnvironment");
        goto LABEL_18;
      }
      v23 = 0;
    }
LABEL_18:
    if (v15)
      v24 = v19;
    else
      v24 = 1;
    v65 = v23;
    if ((v14 & v24) == 1)
    {
      if (v20)
        v25 = v23 ^ 1;
      else
        v25 = 0;
    }
    else
    {
      v25 = 1;
    }
    objc_msgSend(*(id *)(a1 + 72), "identifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69 != v10)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      bls_scenes_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](obj, "pendingBacklightRamp");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219522;
        v89 = a1;
        v90 = 2114;
        v91 = v67;
        v92 = 2114;
        v93 = obj;
        v94 = 2114;
        *(_QWORD *)v95 = v69;
        *(_WORD *)&v95[8] = 1024;
        *(_DWORD *)v96 = objc_msgSend(v27, "hasPendingRamp");
        *(_WORD *)&v96[4] = 2114;
        *(_QWORD *)v97 = v71;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)v98 = v25;
        _os_log_impl(&dword_2145AC000, v26, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ will skip update to oldTarget:%{public}@ was replaced with newPartialTarget:%{public}@ hadBacklightRamp:%{BOOL}u oldEvent:%{public}@ wouldTransitionHaveBeenNeeded:%{BOOL}U", buf, 0x40u);

      }
      goto LABEL_61;
    }
    if ((v25 & 1) != 0)
    {
      objc_storeStrong((id *)(a1 + 32), obj);
      *(_BYTE *)(a1 + 64) = v65;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      bls_scenes_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](obj, "pendingBacklightRamp");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "hasPendingRamp");
        objc_msgSend(v71, "bls_shortLoggingString");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219778;
        v89 = a1;
        v90 = 2114;
        v91 = v67;
        v92 = 2114;
        v93 = obj;
        v94 = 1024;
        *(_DWORD *)v95 = v15 != 0;
        *(_WORD *)&v95[4] = 1024;
        *(_DWORD *)&v95[6] = v65;
        *(_WORD *)v96 = 1024;
        *(_DWORD *)&v96[2] = v53;
        *(_WORD *)v97 = 2114;
        *(_QWORD *)&v97[2] = v54;
        *(_WORD *)v98 = 1024;
        *(_DWORD *)&v98[2] = a3;
        _os_log_debug_impl(&dword_2145AC000, v28, OS_LOG_TYPE_DEBUG, "ETS:%p:%{public}@ will update to target:%{public}@ wasUpdating:%{BOOL}u animated:%{BOOL}u hasBacklightRamp:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u", buf, 0x42u);

      }
      objc_initWeak((id *)buf, (id)a1);
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B818]), "initWithDate:fidelity:userObject:", v68, objc_msgSend(v70, "updateFidelity"), v66);
      v29 = v71;
      objc_msgSend(v29, "eventID");
      objc_msgSend(v29, "state");
      BLSEncode4Chars();
      BLSEncode4Chars();
      kdebug_trace();

      v30 = *(void **)(a1 + 72);
      v31 = MEMORY[0x24BDAC760];
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke;
      v82[3] = &unk_24D1BC348;
      v32 = v29;
      v83 = v32;
      v33 = v67;
      v84 = v33;
      v87 = v65;
      v34 = obj;
      v85 = v34;
      objc_copyWeak(&v86, (id *)buf);
      if (v65)
      {
        -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](v34, "pendingBacklightRamp");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v62, "hasPendingRamp");
        if (v61)
        {
          v78[0] = v31;
          v78[1] = 3221225472;
          v78[2] = __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_2;
          v78[3] = &unk_24D1BC370;
          v35 = v78;
          v56 = (id *)&v79;
          v79 = v32;
          v57 = (id *)&v80;
          v80 = v33;
          v58 = (id *)&v81;
          v81 = v34;
        }
        else
        {
          v35 = 0;
        }
        v73[0] = v31;
        v73[1] = 3221225472;
        v73[2] = __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_3;
        v73[3] = &unk_24D1BC398;
        v39 = v73;
        v74 = v32;
        v75 = v33;
        v33 = &v77;
        objc_copyWeak(&v77, (id *)buf);
        v59 = (id *)&v74;
        v60 = (id *)&v75;
        v29 = (id *)v76;
        v76[0] = v34;
        v76[1] = a1;
        v38 = v61;
      }
      else
      {
        v35 = 0;
        v38 = 0;
        v39 = 0;
      }
      objc_msgSend(v30, "updateToVisualState:presentationDateSpecifier:animated:triggerEvent:touchTargetable:sceneContentsUpdated:performBacklightRamp:animationComplete:", v70, v63, v65, v32, a3, v82, v35, v39);
      if (v65)
      {

        objc_destroyWeak(v33);
      }
      if (v38)
      {

      }
      objc_destroyWeak(&v86);

      objc_destroyWeak((id *)buf);
      goto LABEL_61;
    }
    bls_scenes_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](obj, "pendingBacklightRamp");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220034;
      v89 = a1;
      v90 = 2114;
      v91 = v67;
      v92 = 2114;
      v93 = obj;
      v94 = 1024;
      *(_DWORD *)v95 = v15 != 0;
      *(_WORD *)&v95[4] = 1024;
      *(_DWORD *)&v95[6] = v65;
      *(_WORD *)v96 = 1024;
      *(_DWORD *)&v96[2] = objc_msgSend(v37, "hasPendingRamp");
      *(_WORD *)v97 = 2114;
      *(_QWORD *)&v97[2] = v71;
      *(_WORD *)v98 = 1024;
      *(_DWORD *)&v98[2] = a3;
      v99 = 2114;
      v100 = v15;
      _os_log_impl(&dword_2145AC000, v36, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ redundant update to target:%{public}@ wasUpdating:%{BOOL}u animated:%{BOOL}u hasBacklightRamp:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u existingInProgress:%{public}@", buf, 0x4Cu);

    }
    if (v15)
    {
      if ((v19 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ETS:%p:%@ targetMatchesInProgress=NO — redundant update to target:%@ wasUpdating:%u animated:%u event:%@ touchTarget:%u existingInProgress:%@"), a1, v67, obj, 1, v65, v71, a3, v15);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[BLSHEnvironmentTransitionState updateToTarget:touchTargetable:presentationDate:sceneUpdate:requestedFidelity:].cold.1(sel_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity_, a1, (uint64_t)v55);
        objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x2145BAF50);
      }
      objc_msgSend(v15, "setBacklightState:", -[BLSHEnvironmentTransitionStateTarget backlightState](obj, "backlightState"));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (!objc_msgSend(v15, "didUpdateInitialState"))
      {
LABEL_45:
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
        v43 = *(id *)(a1 + 32);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        if (v43 == v15)
        {
          -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](obj, "pendingBacklightRamp");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          v49 = 0.0;
          if (v65)
            v49 = 0.5;
          objc_msgSend(v47, "performBacklightRampIfNeededWithDuration:", v49);

          if (v15)
            goto LABEL_53;
          -[BLSHEnvironmentTransitionStateTarget setDidCompleteAnimation:](obj, "setDidCompleteAnimation:", 1);
          v50 = *(void **)(a1 + 16);
          v51 = -[BLSHEnvironmentTransitionStateTarget backlightState](obj, "backlightState");
          -[BLSHEnvironmentTransitionStateTarget visualState](obj, "visualState");
          v44 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "transitionState:didCompleteUpdateToBacklightState:visualState:", a1, v51, v44);
        }
        else
        {
          bls_scenes_log();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](obj, "pendingBacklightRamp");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "hasPendingRamp");
            *(_DWORD *)buf = 134220290;
            v89 = a1;
            v90 = 2114;
            v91 = v67;
            v92 = 2114;
            v93 = obj;
            v94 = 1024;
            *(_DWORD *)v95 = v15 != 0;
            *(_WORD *)&v95[4] = 1024;
            *(_DWORD *)&v95[6] = v65;
            *(_WORD *)v96 = 1024;
            *(_DWORD *)&v96[2] = v46;
            *(_WORD *)v97 = 2114;
            *(_QWORD *)&v97[2] = v71;
            *(_WORD *)v98 = 1024;
            *(_DWORD *)&v98[2] = a3;
            v99 = 2114;
            v100 = v15;
            v101 = 2114;
            v102 = v43;
            _os_log_impl(&dword_2145AC000, v44, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ (now obsolete - will not call backlight ramp or animation completion) redundant update to target:%{public}@ wasUpdating:%{BOOL}u animated:%{BOOL}u hasBacklightRamp:%{BOOL}u event:%{public}@ touchTarget:%{BOOL}u oldInProgress:%{public}@ currentInProgress:%{public}@", buf, 0x56u);

          }
        }

LABEL_53:
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    -[BLSHEnvironmentTransitionStateTarget setDidUpdateInitialState:](obj, "setDidUpdateInitialState:", 1);
    v40 = *(void **)(a1 + 16);
    v41 = -[BLSHEnvironmentTransitionStateTarget backlightState](obj, "backlightState");
    -[BLSHEnvironmentTransitionStateTarget visualState](obj, "visualState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "transitionState:didBeginUpdateToBacklightState:visualState:", a1, v41, v42);

    goto LABEL_45;
  }
LABEL_62:

}

- (BOOL)performBacklightRampIfPendingForReason:(id)a3
{
  id v4;
  BLSHEnvironmentTransitionStateTarget *v5;
  void *v6;
  char v7;
  BLSHEnvironmentTransitionStateTarget *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  int v17;
  BLSHEnvironmentTransitionState *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  __int16 v25;
  BLSHEnvironmentTransitionStateTarget *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_lock_inProgressUpdateTarget;
  -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](v5, "pendingBacklightRamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPendingRamp");

  if ((v7 & 1) == 0)
  {
    v8 = self->_lock_requestingFidelityTarget;

    v5 = v8;
  }
  -[BLSHEnvironmentTransitionStateTarget triggerEvent](v5, "triggerEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnvironmentTransitionAnimated");

  os_unfair_lock_unlock(&self->_lock);
  if (v10)
    v11 = 0.5;
  else
    v11 = 0.0;
  -[BLSHEnvironmentTransitionStateTarget pendingBacklightRamp](v5, "pendingBacklightRamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "performBacklightRampIfNeededWithDuration:", v11);

  if (v13)
  {
    bls_scenes_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[BLSHBacklightSceneHostEnvironment identifier](self->_environment, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134219010;
      v18 = self;
      v19 = 2114;
      v20 = v15;
      v21 = 2112;
      v22 = v4;
      v23 = 2048;
      v24 = v11;
      v25 = 2114;
      v26 = v5;
      _os_log_impl(&dword_2145AC000, v14, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ (%@) did perform backlightRamp duration:%.2f to target:%{public}@ ", (uint8_t *)&v17, 0x34u);

    }
  }

  return v13;
}

void __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _BOOL4 v4;
  id WeakRetained;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "eventID");
  objc_msgSend(v2, "state");
  BLSEncode4Chars();
  BLSEncode4Chars();

  kdebug_trace();
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 48), "pendingBacklightRamp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performBacklightRampIfNeededWithDuration:", 0.0);

  }
  objc_msgSend(*(id *)(a1 + 48), "setDidUpdateInitialState:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[BLSHEnvironmentTransitionState sceneContentsUpdatedToTarget:forEvent:animated:]((uint64_t)WeakRetained, *(void **)(a1 + 48), *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 64));
  if (!*(_BYTE *)(a1 + 64))
  {
    v4 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "didCompleteAnimation"))
  {
    v4 = *(_BYTE *)(a1 + 64) != 0;
LABEL_7:
    -[BLSHEnvironmentTransitionState animationCompleteToTarget:forEvent:animated:]((uint64_t)WeakRetained, *(void **)(a1 + 48), *(void **)(a1 + 32), v4);
  }

}

- (void)sceneContentsUpdatedToTarget:(void *)a3 forEvent:(int)a4 animated:
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  os_log_type_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 24);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    bls_scenes_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v9 == v7 && v10 == 0;
    if (v13)
      v14 = OS_LOG_TYPE_DEBUG;
    else
      v14 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v11, v14))
    {
      objc_msgSend((id)a1, "environment");
      v15 = a4;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v22 = a1;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v7;
      v27 = 2114;
      v28 = v8;
      v29 = 1024;
      v30 = v15;
      v13 = v9 == v7 && v10 == 0;
      v31 = 2114;
      v32 = v9;
      v33 = 2114;
      v34 = v10;
      _os_log_impl(&dword_2145AC000, v12, v14, "ETS:%p:%{public}@ scene contents updated to target:%{public}@ event:%{public}@ animated:%{BOOL}u inProgressUpdateTarget:%{public}@ requestingFidelityTarget:%{public}@", buf, 0x44u);

    }
    if (v13)
    {
      v18 = *(void **)(a1 + 16);
      v19 = objc_msgSend(v7, "backlightState");
      objc_msgSend(v7, "visualState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transitionState:didBeginUpdateToBacklightState:visualState:", a1, v19, v20);

    }
  }

}

- (void)animationCompleteToTarget:(void *)a3 forEvent:(int)a4 animated:
{
  id v8;
  id v9;
  os_unfair_lock_s *v10;
  id v11;
  int v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v10 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v8, "isEqual:", v11);
    v13 = *(id *)(a1 + 24);
    if (v13)
      v14 = 0;
    else
      v14 = v12;
    if (v12)
    {
      *(_BYTE *)(a1 + 64) = 0;
      v15 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      v16 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      v17 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;
    }
    else
    {
      objc_storeStrong((id *)(a1 + 40), a2);
      v18 = v11;
      v17 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v18;
    }

    bls_scenes_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v14)
      v21 = OS_LOG_TYPE_DEBUG;
    else
      v21 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v19, v21))
    {
      objc_msgSend((id)a1, "environment");
      v22 = v13;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v32 = v14;
      v24 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bls_shortLoggingString");
      v33 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v35 = a1;
      v36 = 2114;
      v37 = v25;
      v38 = 2114;
      v39 = v8;
      v40 = 2114;
      v41 = v26;
      v42 = 1024;
      v43 = a4;
      v44 = 2114;
      v45 = v24;
      v46 = 2114;
      v47 = v22;
      _os_log_impl(&dword_2145AC000, v20, v21, "ETS:%p:%{public}@ animationComplete to target:%{public}@ event:%{public}@ animated:%{BOOL}u inProgressUpdateTarget:%{public}@ requestingFidelityTarget:%{public}@", buf, 0x44u);

      v13 = v22;
      v10 = (os_unfair_lock_s *)(a1 + 8);

      v9 = v33;
      v11 = v24;
      v14 = v32;
    }

    os_unfair_lock_unlock(v10);
    if (v14)
    {
      v27 = v9;
      objc_msgSend(v8, "backlightState");
      if (BLSBacklightStateIsActive())
      {
        objc_msgSend(*(id *)(a1 + 72), "presentationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          objc_msgSend(*(id *)(a1 + 72), "clearPresentationDate");
      }
      v29 = *(void **)(a1 + 16);
      v30 = objc_msgSend(v8, "backlightState");
      objc_msgSend(v8, "visualState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "transitionState:didCompleteUpdateToBacklightState:visualState:", a1, v30, v31);

      v9 = v27;
    }

  }
}

void __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_2(uint64_t a1, double a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  objc_msgSend(v4, "eventID");
  objc_msgSend(v4, "state");
  BLSEncode4Chars();
  BLSEncode4Chars();

  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 48), "pendingBacklightRamp");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBacklightRampIfNeededWithDuration:", a2);

}

void __112__BLSHEnvironmentTransitionState_updateToTarget_touchTargetable_presentationDate_sceneUpdate_requestedFidelity___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "eventID");
  objc_msgSend(v2, "state");
  BLSEncode4Chars();
  BLSEncode4Chars();

  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "pendingBacklightRamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "performBacklightRampIfNeededWithDuration:", 0.0);

  if (v5)
  {
    bls_scenes_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 134218754;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_2145AC000, v6, OS_LOG_TYPE_ERROR, "ETS:%p:%{public}@ target:%{public}@ snapped because client failed to perform backlight ramp for event:%{public}@", (uint8_t *)&v11, 0x2Au);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "setDidCompleteAnimation:", 1);
  if (objc_msgSend(*(id *)(a1 + 48), "didUpdateInitialState"))
    -[BLSHEnvironmentTransitionState animationCompleteToTarget:forEvent:animated:]((uint64_t)WeakRetained, *(void **)(a1 + 48), *(void **)(a1 + 32), 1);

}

- (void)updateToDateSpecifier:(id)a3
{
  id v4;
  BLSHBacklightSceneHostEnvironment *v5;
  NSObject *v6;
  id v7;
  BLSHBacklightSceneHostEnvironment *v8;
  _QWORD v9[5];
  BLSHBacklightSceneHostEnvironment *v10;
  id v11;
  uint8_t buf[4];
  BLSHEnvironmentTransitionState *v13;
  __int16 v14;
  BLSHBacklightSceneHostEnvironment *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_environment;
  bls_scenes_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v4;
    _os_log_debug_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEBUG, "ETS:%p:%{public}@ update to dateSpecifier:%{public}@", buf, 0x20u);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke;
  v9[3] = &unk_24D1BC3C0;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  -[BLSHBacklightSceneHostEnvironment updateToDateSpecifier:sceneContentsUpdated:](v8, "updateToDateSpecifier:sceneContentsUpdated:", v7, v9);

}

uint64_t __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke(uint64_t a1)
{
  NSObject *v2;

  bls_scenes_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke_cold_1(a1, v2);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "transitionState:didUpdateToDateSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_lock_animationCompletedWithNewTarget, 0);
  objc_storeStrong((id *)&self->_lock_animationCompletedForOldTarget, 0);
  objc_storeStrong((id *)&self->_lock_inProgressUpdateTarget, 0);
  objc_storeStrong((id *)&self->_lock_requestingFidelityTarget, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithEnvironment:(uint64_t)a1 delegate:(id *)a2 .cold.1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_2145AC000, v3, v4, "ETS:%p:%{public}@ transitionState init", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)updateToTarget:(uint64_t)a3 touchTargetable:presentationDate:sceneUpdate:requestedFidelity:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  __int16 v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138544642;
  v10 = v5;
  OUTLINED_FUNCTION_1_2();
  v11 = 2048;
  v12 = a2;
  v13 = v8;
  v14 = CFSTR("BLSHEnvironmentTransitionState.m");
  v15 = 1024;
  v16 = 248;
  v17 = v8;
  v18 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

}

void __56__BLSHEnvironmentTransitionState_updateToDateSpecifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = 134218498;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_2145AC000, a2, OS_LOG_TYPE_DEBUG, "ETS:%p:%{public}@ did update to dateSpecifier:%{public}@", (uint8_t *)&v7, 0x20u);

}

@end
