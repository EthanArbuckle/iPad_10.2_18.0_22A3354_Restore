@implementation BLSHBacklightEnvironmentStateMachine

- (BLSHBacklightEnvironmentStateMachine)initWithPresentation:(id)a3 backlightState:(int64_t)a4 delegate:(id)a5 inactiveBudgetPolicy:(id)a6 osTimerProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BLSHBacklightEnvironmentStateMachine *v17;
  BLSHBacklightEnvironmentStateMachine *v18;
  uint64_t v19;
  NSMutableArray *performEventHistory;
  uint64_t v21;
  NSMutableArray *didBeginUpdateHistory;
  uint64_t v23;
  NSMutableArray *didCompleteUpdateHistory;
  uint64_t v25;
  NSMapTable *transitionStates;
  uint64_t v27;
  NSMutableSet *lock_updatingVisualStateTransitionStates;
  BLSHBacklightEnvironmentStateMachine *result;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v35.receiver = self;
  v35.super_class = (Class)BLSHBacklightEnvironmentStateMachine;
  v17 = -[BLSHBacklightEnvironmentStateMachine init](&v35, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_4;
  if (v13)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_lock_presentation, a3);
    v18->_lock_targetBacklightState = a4;
    v18->_lock_performEventTargetBacklightState = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    performEventHistory = v18->_performEventHistory;
    v18->_performEventHistory = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    didBeginUpdateHistory = v18->_didBeginUpdateHistory;
    v18->_didBeginUpdateHistory = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    didCompleteUpdateHistory = v18->_didCompleteUpdateHistory;
    v18->_didCompleteUpdateHistory = (NSMutableArray *)v23;

    objc_storeWeak((id *)&v18->_delegate, v14);
    objc_storeStrong((id *)&v18->_inactiveBudgetPolicy, a6);
    objc_storeStrong((id *)&v18->_osTimerProvider, a7);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 517, 4);
    transitionStates = v18->_transitionStates;
    v18->_transitionStates = (NSMapTable *)v25;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    lock_updatingVisualStateTransitionStates = v18->_lock_updatingVisualStateTransitionStates;
    v18->_lock_updatingVisualStateTransitionStates = (NSMutableSet *)v27;

    objc_initWeak(&location, v18);
    objc_copyWeak(&v33, &location);
    v18->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
LABEL_4:

    return v18;
  }
  v30 = (void *)MEMORY[0x24BDD17C8];
  -[BLSHBacklightEnvironmentStateMachine _lock_debugDescription]((int *)v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("%p cannot initialize with nil presentation, %@"), v18, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[BLSHBacklightEnvironmentStateMachine initWithPresentation:backlightState:delegate:inactiveBudgetPolicy:osTimerProvider:].cold.1();
  objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
  result = (BLSHBacklightEnvironmentStateMachine *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (int)_lock_debugDescription
{
  int *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v1[32] >= 1)
      v4 = (id)objc_msgSend(v2, "appendInt:withName:");
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", *((_QWORD *)v1 + 6), CFSTR("updatingVisualState"));
    v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", *((_QWORD *)v1 + 7), CFSTR("updatingDateSpecifier"), 1);
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", *((_QWORD *)v1 + 2), CFSTR("presentation"));
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", *((_QWORD *)v1 + 8), CFSTR("updatingSpecifier"));
    NSStringFromBLSBacklightState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v9, CFSTR("target"));

    if (*((_QWORD *)v1 + 13) != *((_QWORD *)v1 + 14))
    {
      NSStringFromBLSBacklightState();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:withName:", v10, CFSTR("performEventTarget"));

    }
    v11 = (id)objc_msgSend(v3, "appendBool:withName:", *((unsigned __int8 *)v1 + 132), CFSTR("pendingNotifyBeganUpdatingState"));
    v12 = (id)objc_msgSend(v3, "appendBool:withName:", *((unsigned __int8 *)v1 + 133), CFSTR("updatingState"));
    v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", *((_QWORD *)v1 + 12), CFSTR("updatingPresentation"), 1);
    objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", *((_QWORD *)v1 + 9), CFSTR("performEventHistory"), 1);
    objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", *((_QWORD *)v1 + 10), CFSTR("didBeginUpdateHistory"), 1);
    objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", *((_QWORD *)v1 + 11), CFSTR("didCompleteUpdateHistory"), 1);
    objc_msgSend(v3, "build");
    v1 = (int *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __122__BLSHBacklightEnvironmentStateMachine_initWithPresentation_backlightState_delegate_inactiveBudgetPolicy_osTimerProvider___block_invoke(uint64_t a1)
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

- (void)dealloc
{
  objc_super v3;

  if (self->_stateHandler)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightEnvironmentStateMachine;
  -[BLSHBacklightEnvironmentStateMachine dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  if (self->_lock_addingEnvironmentsCount >= 1)
    v6 = (id)objc_msgSend(v4, "appendInt:withName:");
  v7 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_lock_updatingVisualStateTransitionStates, CFSTR("updatingVisualState"));
  v9 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lock_updatingDateSpecifierTransitionStates, CFSTR("updatingDateSpecifier"), 1);
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", self->_lock_presentation, CFSTR("presentation"));
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", self->_updatingSpecifier, CFSTR("updatingSpecifier"));
  NSStringFromBLSBacklightState();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v12, CFSTR("target"));

  if (self->_lock_targetBacklightState != self->_lock_performEventTargetBacklightState)
  {
    NSStringFromBLSBacklightState();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v13, CFSTR("performEventTarget"));

  }
  v14 = (id)objc_msgSend(v4, "appendBool:withName:", self->_pendingNotifyBeganUpdatingState, CFSTR("pendingNotifyBeganUpdatingState"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", self->_updatingState, CFSTR("updatingState"));
  v16 = (id)objc_msgSend(v4, "appendBool:withName:", self->_lock_setPresentationOperation != 0, CFSTR("updatingPresentation"));
  if (-[NSMutableSet count](self->_lock_staleEnvironmentsThatNeedDeferredUpdate, "count"))
  {
    -[NSMutableSet allObjects](self->_lock_staleEnvironmentsThatNeedDeferredUpdate, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v19, CFSTR("removedEnvsForStateUpdateLater"));

  }
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BLSHBacklightEnvironmentStateMachine _lock_debugDescription]((int *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BLSHBacklightEnvironmentPresentation *lock_presentation;
  NSMutableSet *lock_updatingVisualStateTransitionStates;
  NSMutableSet *lock_updatingDateSpecifierTransitionStates;
  NSMapTable *transitionStates;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightEnvironmentPresentation presentationEntries](self->_lock_presentation, "presentationEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "environment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deactivateClient");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  lock_presentation = self->_lock_presentation;
  self->_lock_presentation = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[NSMutableSet removeAllObjects](self->_lock_updatingVisualStateTransitionStates, "removeAllObjects");
  lock_updatingVisualStateTransitionStates = self->_lock_updatingVisualStateTransitionStates;
  self->_lock_updatingVisualStateTransitionStates = 0;

  -[NSMutableSet removeAllObjects](self->_lock_updatingDateSpecifierTransitionStates, "removeAllObjects");
  lock_updatingDateSpecifierTransitionStates = self->_lock_updatingDateSpecifierTransitionStates;
  self->_lock_updatingDateSpecifierTransitionStates = 0;

  transitionStates = self->_transitionStates;
  self->_transitionStates = 0;

  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  -[BLSHBacklightEnvironmentStateMachine updateRemovedEnvironmentsToActiveOn]((uint64_t)self);

}

- (void)updateRemovedEnvironmentsToActiveOn
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

- (os_unfair_lock_s)isInvalid
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (os_unfair_lock_s *)(BYTE2(v1[33]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  os_unfair_lock_s *p_lock;
  BLSHBacklightEnvironmentPresentation *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_presentation;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPresentation:(id)a3 withTargetBacklightState:(int64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  BSDispatchMain();

}

void __81__BLSHBacklightEnvironmentStateMachine_setPresentation_withTargetBacklightState___block_invoke(uint64_t a1)
{
  -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)onMain_setPresentation:(uint64_t)a3 withTargetBacklightState:
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  id WeakRetained;
  id v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  BLSSetPresentationOperation *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  id v70;
  id v71;
  NSObject *v72;
  BLSSetPresentationOperation *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *log;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  uint8_t v87[128];
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (a1)
  {
    if (-[BLSHBacklightEnvironmentStateMachine isInvalid]((os_unfair_lock_s *)a1))
    {
      bls_backlight_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.1();
LABEL_80:

      goto LABEL_81;
    }
    if (!v6)
    {
      v65 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend((id)a1, "debugDescription");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "stringWithFormat:", CFSTR("%p cannot set nil presentation, %@"), a1, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.2();
      objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145D63FCLL);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(_QWORD *)(a1 + 104) = a3;
    v8 = *(id *)(a1 + 16);
    objc_storeStrong((id *)(a1 + 16), a2);
    v72 = v8;
    objc_msgSend(v6, "differenceFromPresentation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertions");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *(id *)(a1 + 96);
    v12 = v11;
    v77 = v9;
    v75 = v11;
    if (v11)
    {
      objc_msgSend(v11, "additions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v6;
      objc_msgSend(v6, "presentationEntries");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke;
      v84[3] = &unk_24D1BCE00;
      v85 = v10;
      v15 = v13;
      v86 = v15;
      objc_msgSend(v14, "bs_compactMap:", v84);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v12, "backlightState");
      v18 = a3;
      LOBYTE(v12) = v17 != a3;
      if (v17 == a3)
      {
        v19 = v16;
      }
      else
      {
        v19 = v16;
        v20 = v16;

        v10 = v20;
      }

      v21 = v19;
      a3 = v18;
      v6 = v70;
      v9 = v77;
    }
    else
    {
      v21 = v10;
    }
    v74 = v21;
    v73 = -[BLSSetPresentationOperation initWithBacklightState:additions:]([BLSSetPresentationOperation alloc], "initWithBacklightState:additions:", a3, v21);
    objc_storeStrong((id *)(a1 + 96), v73);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v22 = objc_msgSend(v9, "hasChanges");
    v23 = v22;
    v76 = v10;
    if ((v12 & 1) == 0 && !v22)
    {
      bls_backlight_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightState();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v89 = a1;
        v90 = 2114;
        v91 = v25;
        _os_log_impl(&dword_2145AC000, v24, OS_LOG_TYPE_INFO, "ESM:%p setPresentation (redundant) targetBacklightState:%{public}@", buf, 0x16u);

      }
      v26 = 0;
LABEL_57:

      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      v50 = v26;
      if (objc_msgSend(v26, "count"))
      {
        v51 = *(void **)(a1 + 120);
        if (v51)
          objc_msgSend(v51, "unionSet:", v26);
        else
          objc_storeStrong((id *)(a1 + 120), v26);
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 120), "minusSet:", v52);
        bls_backlight_log();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 120), "valueForKey:", CFSTR("identifier"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v89 = a1;
          v90 = 2114;
          v91 = v54;
          _os_log_impl(&dword_2145AC000, v53, OS_LOG_TYPE_INFO, "ESM:%p setPresentation: staleEnvironmentsThatNeedDeferredUpdate:%{public}@", buf, 0x16u);

        }
      }
      v55 = objc_msgSend(*(id *)(a1 + 56), "count");
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
      v57 = *(id *)(a1 + 64);
      if (v55)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      }
      else
      {
        v58 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = 0;

        v59 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = 0;

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        if (v57)
          objc_msgSend(WeakRetained, "environmentStateMachine:didUpdateToSpecifier:", a1, v57);
      }
      if (-[BLSHBacklightEnvironmentStateMachine isTransitionComplete]((os_unfair_lock_s *)a1))
      {
        bls_backlight_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.3();

        +[BLSHCompletedUpdateOperation didCompleteUpdateToBacklightState:](BLSHCompletedUpdateOperation, "didCompleteUpdateToBacklightState:", a3);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLSHBacklightEnvironmentStateMachine completedOperation:](a1, v61);

        v7 = v72;
        v62 = v73;
      }
      else
      {
        v62 = v73;
        if (-[BLSHBacklightEnvironmentStateMachine isSetPresentationOperationComplete:]((os_unfair_lock_s *)a1, v73))
        {
          bls_backlight_log();
          v63 = objc_claimAutoreleasedReturnValue();
          v7 = v72;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.4();

          -[BLSHBacklightEnvironmentStateMachine completedOperation:](a1, v73);
        }
        else
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          bls_backlight_log();
          v64 = objc_claimAutoreleasedReturnValue();
          v7 = v72;
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.5(a1, (uint64_t)v6, v64);

          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        }
      }

      goto LABEL_80;
    }
    objc_msgSend(v9, "removals");
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v10, "count");
    v27 = -[NSObject count](v68, "count");
    bls_backlight_log();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

    if (v29)
    {
      bls_backlight_log();
      log = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
      if ((v23 & 1) != 0)
      {
        v31 = v77;
        if (!v27)
        {
          if (v30)
          {
            objc_msgSend(v10, "bs_map:", &__block_literal_global_79);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromBLSBacklightState();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v89 = a1;
            v90 = 2114;
            v91 = v38;
            v92 = 2114;
            v93 = v39;
            _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation by adding:%{public}@ targetBacklightState:%{public}@", buf, 0x20u);

          }
          goto LABEL_50;
        }
        if (v69)
        {
          if (v30)
          {
            objc_msgSend(v10, "bs_map:", &__block_literal_global_83);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject bs_map:](v68, "bs_map:", &__block_literal_global_85);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromBLSBacklightState();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v89 = a1;
            v90 = 2114;
            v91 = v32;
            v92 = 2114;
            v93 = v33;
            v94 = 2114;
            v95 = v34;
            _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation by adding:%{public}@ and removing:%{public}@ targetBacklightState:%{public}@", buf, 0x2Au);

LABEL_32:
            v31 = v77;

          }
        }
        else if (v30)
        {
          -[NSObject bs_map:](v68, "bs_map:", &__block_literal_global_81);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromBLSBacklightState();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v89 = a1;
          v90 = 2114;
          v91 = v32;
          v92 = 2114;
          v93 = v33;
          _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation by removing:%{public}@ targetBacklightState:%{public}@", buf, 0x20u);
          goto LABEL_32;
        }

        goto LABEL_34;
      }
      if (v30)
      {
        objc_msgSend(v75, "backlightState");
        NSStringFromBLSBacklightState();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_map:", &__block_literal_global_8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v89 = a1;
        v90 = 2114;
        v91 = v35;
        v92 = 2114;
        v93 = v36;
        v94 = 2114;
        v95 = v37;
        _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_INFO, "ESM:%p setPresentation (redundant) targetBacklightState:%{public}@->%{public}@ additions:%{public}@", buf, 0x2Au);

      }
    }
    v31 = v77;
    if (!v27)
    {
      v78 = 0;
      v24 = v68;
LABEL_52:
      if (v69)
      {
        bls_backlight_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          -[BLSHBacklightEnvironmentStateMachine onMain_setPresentation:withTargetBacklightState:].cold.6(a3, v10, v49);

        -[BLSHBacklightEnvironmentStateMachine updateTransitionStatesForEnvironments:toBacklightState:forEvent:withInitialSpecifier:forReason:performBacklightRamp:environmentTransformer:]((os_unfair_lock_s *)a1, v10, a3, 0, 0, CFSTR("setPresentation"), 0, &__block_literal_global_94);
      }
      v26 = v78;
      goto LABEL_57;
    }
LABEL_34:
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v31, "removals");
    log = objc_claimAutoreleasedReturnValue();
    v40 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    if (v40)
    {
      v41 = v40;
      v42 = a3;
      v71 = v6;
      v78 = 0;
      v43 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v81 != v43)
            objc_enumerationMutation(log);
          v45 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v46)
          {
            objc_msgSend(v46, "performBacklightRampIfPendingForReason:", CFSTR("removed"));
            objc_msgSend(*(id *)(a1 + 48), "removeObject:", v47);
            objc_msgSend(*(id *)(a1 + 56), "removeObject:", v47);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          objc_msgSend(v45, "deactivateClient");
          if (v42 != 2
            && (objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend(v45, "wantsStateUpdateToActiveAfterRemovalFromPresentation"))
          {
            v48 = v78;
            if (!v78)
            {
              objc_msgSend(MEMORY[0x24BDBCEF0], "set");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v78 = v48;
            objc_msgSend(v48, "addObject:", v45);
          }

        }
        v41 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      }
      while (v41);
      v6 = v71;
      a3 = v42;
      goto LABEL_51;
    }
LABEL_50:
    v78 = 0;
LABEL_51:
    v24 = v68;

    v10 = v76;
    goto LABEL_52;
  }
LABEL_81:

}

- (NSSet)updatingVisualStateTransitionStates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_lock_updatingVisualStateTransitionStates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (NSSet)updatingDateSpecifierTransitionStates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_lock_updatingDateSpecifierTransitionStates, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (BOOL)pendingNotifyBeganUpdatingState
{
  BLSHBacklightEnvironmentStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_pendingNotifyBeganUpdatingState;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUpdatingState
{
  BLSHBacklightEnvironmentStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_updatingState;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUpdatingPresentation
{
  BLSHBacklightEnvironmentStateMachine *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_setPresentationOperation != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3))
  {
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BLSBacklightStateForVisuaState();
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@(%@)"), v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_78(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BLSBacklightStateForVisuaState();
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@(%@)"), v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_80(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BLSBacklightStateForVisuaState();
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@(%@)"), v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_82(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BLSBacklightStateForVisuaState();
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@(%@)"), v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_2_84(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BLSBacklightStateForVisuaState();
  NSStringFromBLSBacklightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%p:%@(%@)"), v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __88__BLSHBacklightEnvironmentStateMachine_onMain_setPresentation_withTargetBacklightState___block_invoke_92(uint64_t a1, void *a2)
{
  return a2;
}

- (void)updateTransitionStatesForEnvironments:(uint64_t)a3 toBacklightState:(void *)a4 forEvent:(void *)a5 withInitialSpecifier:(void *)a6 forReason:(void *)a7 performBacklightRamp:(void *)a8 environmentTransformer:
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  BOOL v31;

  v23 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a1)
  {
    v18 = a8;
    v19 = a2;
    os_unfair_lock_lock(a1 + 2);
    ++a1[32]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(a1 + 2);
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke;
    v24[3] = &unk_24D1BCEA8;
    v24[4] = a1;
    v30 = a3;
    v25 = v15;
    v26 = v21;
    v27 = v23;
    v31 = v23 != 0;
    v29 = v17;
    v28 = v16;
    v22 = v21;
    -[BLSHBacklightEnvironmentStateMachine enumerateRemoteEnvironmentsFirstFromSource:environmentTransformer:block:]((uint64_t)a1, v19, v18, v24);

    -[BLSHBacklightEnvironmentStateMachine endAddingEnvironments](a1);
  }

}

- (os_unfair_lock_s)isTransitionComplete
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    if ((int)v1[32]._os_unfair_lock_opaque <= 0)
      v1 = (os_unfair_lock_s *)(objc_msgSend(*(id *)&v1[12]._os_unfair_lock_opaque, "count") == 0);
    else
      v1 = 0;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)completedOperation:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  unsigned __int8 isKindOfClass;
  unsigned __int8 v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(_QWORD);
  _BYTE *v18;
  int v19;
  dispatch_time_t v20;
  id v21;
  void *v22;
  id v23;
  id WeakRetained;
  NSObject *v25;
  os_unfair_lock_s *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  int v44;
  int v45;
  os_unfair_lock_s *lock;
  _QWORD v47[4];
  id v48;
  void *v49;
  int v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  id v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!a1)
    goto LABEL_37;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v4 = objc_msgSend(v3, "backlightState");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();
  v43 = *(unsigned __int8 *)(a1 + 133);
  v44 = v6 & (v43 != 0);
  if (v44 == 1)
  {
    *(_BYTE *)(a1 + 133) = 0;
    v8 = *(_QWORD *)(a1 + 104);
    if (v8 != v4 && *(_QWORD *)(a1 + 112) != v4)
    {
      v9 = malloc_type_calloc(1uLL, 0x290uLL, 0xB4BB8F40uLL);
      -[BLSHBacklightEnvironmentStateMachine populateOperationCompletedMismatchedBacklightStatesStruct:backlightState:targetBacklightState:performEventHistory:didBeginUpdateHistory:didCompleteUpdateHistory:](a1, (uint64_t)v9, v8, v4, *(void **)(a1 + 72), *(void **)(a1 + 80), *(void **)(a1 + 88));
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = v4;
      NSStringFromBLSBacklightState();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("no more transitionStates but state:%@ != target:%@ and != performEventTarget:%@ eventHistory:%@ didBeginUpdateHistory:%@ didCompleteHistory:%@"), v12, v13, v14, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      BLSHRecordCriticalAssertFailure(v15);
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __59__BLSHBacklightEnvironmentStateMachine_completedOperation___block_invoke;
      v47[3] = &unk_24D1BCFF8;
      v50 = 656;
      v48 = v15;
      v49 = v9;
      v16 = v15;
      v17 = (void (**)(_QWORD))MEMORY[0x2199D2BD8](v47);
      if (BLSHIsUnitTestRunning())
      {
        v17[2](v17);
      }
      else
      {
        v20 = dispatch_time(0, 1000000000);
        dispatch_after(v20, MEMORY[0x24BDAC9B8], v17);
      }

      v4 = v11;
    }
    v18 = (_BYTE *)(a1 + 132);
    if (*(_BYTE *)(a1 + 132))
      goto LABEL_13;
  }
  else
  {
    v18 = (_BYTE *)(a1 + 132);
    if (((*(_BYTE *)(a1 + 132) != 0) & isKindOfClass) == 1 && v4 == *(_QWORD *)(a1 + 112))
    {
LABEL_13:
      *v18 = 0;
      v19 = 1;
      goto LABEL_14;
    }
  }
  v19 = 0;
LABEL_14:
  v21 = *(id *)(a1 + 96);
  if ((v7 & (v21 == v3)) != 0
    || -[BLSHBacklightEnvironmentStateMachine _lock_isSetPresentationOperationComplete:](a1, v21))
  {
    v22 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    v45 = 1;
  }
  else
  {
    v45 = 0;
  }
  v23 = *(id *)(a1 + 16);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
  lock = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  bls_backlight_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromBLSBacklightState();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(_QWORD *)(a1 + 72);
    v41 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)buf = 134220546;
    v52 = a1;
    v53 = 2114;
    v54 = v3;
    v55 = 2114;
    v56 = v39;
    v57 = 2114;
    v58 = v42;
    v59 = 1024;
    v60 = v43;
    v61 = 1024;
    v62 = v45;
    v63 = 1024;
    v64 = v19;
    v65 = 1024;
    v66 = v44;
    v67 = 2114;
    v68 = v21;
    v69 = 2114;
    v70 = v40;
    v71 = 2114;
    v72 = v41;
    _os_log_debug_impl(&dword_2145AC000, v25, OS_LOG_TYPE_DEBUG, "ESM:%p completedOperation:%{public}@ target:%{public}@ performEventTarget:%{public}@ updatingState:%{BOOL}u shouldNotifyUpdatedPresentation:%{BOOL}u shouldNotifyBegan:%{BOOL}u shouldNotifyCompleted:%{BOOL}u, setPresentationOperation:%{public}@ eventHistory:%{public}@ updateHistory:%{public}@", buf, 0x60u);

  }
  if (v45)
    objc_msgSend(WeakRetained, "environmentStateMachine:didUpdateToPresentation:", a1, v23);
  v26 = (os_unfair_lock_s *)(a1 + 8);
  if (v19)
  {
    os_unfair_lock_lock(lock);
    if (!*v18)
    {
      v27 = v23;
      os_unfair_lock_unlock(lock);
      objc_msgSend(WeakRetained, "environmentStateMachine:didBeginUpdateToState:", a1, v4);
      v33 = 1;
      goto LABEL_29;
    }
    v27 = v23;
    bls_backlight_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      NSStringFromBLSBacklightState();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(void **)(a1 + 72);
      v32 = *(_QWORD *)(a1 + 88);
      *(_DWORD *)buf = 134220290;
      v52 = a1;
      v53 = 2114;
      v54 = v3;
      v55 = 2114;
      v56 = v29;
      v57 = 2114;
      v58 = v30;
      v59 = 1024;
      v60 = v43;
      v61 = 1024;
      v62 = v45;
      v63 = 1024;
      v64 = 0;
      v65 = 1024;
      v66 = v44;
      v67 = 2114;
      v68 = v31;
      v69 = 2114;
      v70 = v32;
      _os_log_impl(&dword_2145AC000, v28, OS_LOG_TYPE_INFO, "ESM:%p (dropping didBeginUpdateToState callback) completedOperation:%{public}@ target:%{public}@ performEventTarget:%{public}@ updatingState:%{BOOL}u shouldNotifyUpdatedPresentation:%{BOOL}u shouldNotifyBegan:%{BOOL}u shouldNotifyCompleted:%{BOOL}u eventHistory:%{public}@ updateHistory:%{public}@", buf, 0x56u);

    }
    v26 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_unlock(lock);
  }
  else
  {
    v27 = v23;
  }
  v33 = 0;
LABEL_29:
  if (v44)
  {
    os_unfair_lock_lock(v26);
    if (*(_QWORD *)(a1 + 104) == v4 && *(_QWORD *)(a1 + 112) == v4)
    {
      os_unfair_lock_unlock(v26);
      objc_msgSend(WeakRetained, "environmentStateMachine:didCompleteUpdateToState:", a1, v4);
    }
    else
    {
      bls_backlight_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightState();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *(void **)(a1 + 72);
        v38 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134220290;
        v52 = a1;
        v53 = 2114;
        v54 = v3;
        v55 = 2114;
        v56 = v35;
        v57 = 2114;
        v58 = v36;
        v59 = 1024;
        v60 = 1;
        v61 = 1024;
        v62 = v45;
        v63 = 1024;
        v64 = v33;
        v65 = 1024;
        v66 = 0;
        v67 = 2114;
        v68 = v37;
        v69 = 2114;
        v70 = v38;
        _os_log_impl(&dword_2145AC000, v34, OS_LOG_TYPE_INFO, "ESM:%p (dropping didCompleteUpdateToState callback) completedOperation:%{public}@ target:%{public}@ performEventTarget:%{public}@ updatingState:%{BOOL}u shouldNotifyUpdatedPresentation:%{BOOL}u shouldNotifyBegan:%{BOOL}u shouldNotifyCompleted:%{BOOL}u eventHistory:%{public}@ updateHistory:%{public}@", buf, 0x56u);

        v26 = (os_unfair_lock_s *)(a1 + 8);
      }

      os_unfair_lock_unlock(v26);
    }
  }

LABEL_37:
}

- (uint64_t)isSetPresentationOperationComplete:(os_unfair_lock_s *)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    os_unfair_lock_lock(a1 + 2);
    v5 = -[BLSHBacklightEnvironmentStateMachine _lock_isSetPresentationOperationComplete:]((uint64_t)a1, v4);
    os_unfair_lock_unlock(a1 + 2);
  }

  return v5;
}

void __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  bls_backlight_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke_cold_1(a1, v3);

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsEnvironment:", v3);
  v6 = *(os_unfair_lock_s **)(a1 + 32);
  if (v5)
  {
    -[BLSHBacklightEnvironmentStateMachine withLock_transitionStateForEnvironment:]((uint64_t)v6, v3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      objc_msgSend(v8, "dateSpecifierForEnvironment:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v13 = *(_QWORD *)(a1 + 80);
    v15 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v16 = v15 == v3 && *(_BYTE *)(a1 + 88) != 0;
    objc_msgSend(v9, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == v3)
      v19 = *(_QWORD *)(a1 + 72);
    else
      v19 = 0;
    -[NSObject updateToBacklightState:forEvent:touchTargetable:presentationDate:sceneUpdate:performBacklightRamp:](v7, "updateToBacklightState:forEvent:touchTargetable:presentationDate:sceneUpdate:performBacklightRamp:", v13, v14, v16, v17, v18, v19);

  }
  else
  {
    os_unfair_lock_unlock(v6 + 2);
    bls_backlight_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v3, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218754;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      v24 = 2048;
      v25 = v3;
      v26 = 2114;
      v27 = v12;
      _os_log_debug_impl(&dword_2145AC000, v7, OS_LOG_TYPE_DEBUG, "ESM:%p will skip environment update, no longer in presentation — updateTransitionStatesForReason:%{public}@ environment:%p:%{public}@", (uint8_t *)&v20, 0x2Au);

    }
  }

}

- (id)withLock_transitionStateForEnvironment:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[BLSHEnvironmentTransitionState createStateForEnvironment:delegate:](BLSHEnvironmentTransitionState, "createStateForEnvironment:delegate:", v3, a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)enumerateRemoteEnvironmentsFirstFromSource:(void *)a3 environmentTransformer:(void *)a4 block:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke;
    v15[3] = &unk_24D1BCED0;
    v16 = v7;
    objc_msgSend(a2, "bs_map:", v15);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke_2;
    v12[3] = &unk_24D1BCEF8;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    v10 = v13;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199D2BD8](v12);
    v11[2](v11, 0);
    v11[2](v11, 1);

  }
}

- (void)endAddingEnvironments
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

BLSHEnvironmentAndSource *__112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;
  void *v5;
  BLSHEnvironmentAndSource *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  v3(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BLSHEnvironmentAndSource initWithEnvironment:environmentSource:]([BLSHEnvironmentAndSource alloc], "initWithEnvironment:environmentSource:", v5, v4);

  return v6;
}

void __112__BLSHBacklightEnvironmentStateMachine_enumerateRemoteEnvironmentsFirstFromSource_environmentTransformer_block___block_invoke_2(uint64_t a1, int a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "environment", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((a2 & 1) == 0)
            goto LABEL_11;
LABEL_10:
          v11 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v9, "environmentSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v10, v12);

          goto LABEL_11;
        }
        if (objc_msgSend(v10, "isLocal") == a2)
          goto LABEL_10;
LABEL_11:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)performEvent:(id)a3 withInitialSpecifier:(id)a4 performBacklightRamp:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v12;
  v9 = v11;
  v10 = v7;
  BSDispatchMain();

}

void __95__BLSHBacklightEnvironmentStateMachine_performEvent_withInitialSpecifier_performBacklightRamp___block_invoke(uint64_t a1)
{
  -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)onMain_performEvent:(void *)a3 withInitialSpecifier:(void *)a4 performBacklightRamp:
{
  id v7;
  id v8;
  void (**v9)(_QWORD, __n128);
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BLSHEnvironmentPerformEventData *v16;
  unint64_t v17;
  NSObject *v18;
  int v19;
  __n128 v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v10 = *(unsigned __int8 *)(a1 + 134);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v10)
    {
      bls_backlight_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend((id)a1, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v30 = a1;
      v31 = 2114;
      v32 = v12;
      v33 = 2114;
      v34 = (uint64_t)v7;
      v35 = 2114;
      v36 = v8;
      _os_log_fault_impl(&dword_2145AC000, v11, OS_LOG_TYPE_FAULT, "ESM:%p calling performEvent on invalidated state machine:%{public}@ event:%{public}@ initialSpecifier:%{public}@", buf, 0x2Au);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      v13 = objc_msgSend(v7, "previousState");
      v14 = objc_msgSend(v7, "state");
      v15 = *(void **)(a1 + 72);
      v16 = -[BLSHEnvironmentPerformEventData initWithStateMachineOldBacklightState:eventPreviousBacklightState:eventNewBacklightState:]([BLSHEnvironmentPerformEventData alloc], "initWithStateMachineOldBacklightState:eventPreviousBacklightState:eventNewBacklightState:", *(_QWORD *)(a1 + 104), v13, v14);
      objc_msgSend(v15, "addObject:", v16);

      v17 = objc_msgSend(*(id *)(a1 + 72), "count");
      if (v17 >= 6)
        objc_msgSend(*(id *)(a1 + 72), "removeObjectsInRange:", 0, v17 - 5);
      *(_QWORD *)(a1 + 104) = v14;
      *(_QWORD *)(a1 + 112) = v14;
      *(_WORD *)(a1 + 132) = 257;
      v11 = *(id *)(a1 + 16);
      -[NSObject presentationEntries](v11, "presentationEntries");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      if (objc_msgSend(v12, "count"))
      {
        bls_backlight_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromBLSBacklightState();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKeyPath:", CFSTR("environment.identifier"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "bls_shortLoggingString");
          *(_DWORD *)buf = 138412802;
          v30 = (uint64_t)v28;
          v31 = 2112;
          v32 = v27;
          v33 = 2112;
          v34 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v34;
          _os_log_debug_impl(&dword_2145AC000, v18, OS_LOG_TYPE_DEBUG, "ESM: performEvent: -> %@ environments:%@ event:%@", buf, 0x20u);

        }
        -[BLSHBacklightEnvironmentStateMachine updateTransitionStatesForEnvironments:toBacklightState:forEvent:withInitialSpecifier:forReason:performBacklightRamp:environmentTransformer:]((os_unfair_lock_s *)a1, v12, v14, v7, v8, CFSTR("performEvent"), v9, &__block_literal_global_108);
      }
      else if (v9)
      {
        v19 = objc_msgSend(v7, "isEnvironmentTransitionAnimated");
        v20.n128_u64[0] = 0;
        if (v19)
          v20.n128_f64[0] = 0.5;
        v9[2](v9, v20);
      }
      if (-[BLSHBacklightEnvironmentStateMachine isTransitionComplete]((os_unfair_lock_s *)a1))
      {
        bls_backlight_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:].cold.1(a1, v7, v21);

        +[BLSHCompletedUpdateOperation didCompleteUpdateToBacklightState:](BLSHCompletedUpdateOperation, "didCompleteUpdateToBacklightState:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!-[BLSHBacklightEnvironmentStateMachine allTransitionsDidBeginUpdateBacklightState:]((os_unfair_lock_s *)a1, v14))
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
          bls_backlight_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:].cold.3(a1, v7);

          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
          goto LABEL_27;
        }
        bls_backlight_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[BLSHBacklightEnvironmentStateMachine onMain_performEvent:withInitialSpecifier:performBacklightRamp:].cold.2(a1, v7, v23);

        +[BLSHBegunUpdateOperation didBeginUpdateToBacklightState:](BLSHBegunUpdateOperation, "didBeginUpdateToBacklightState:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = v22;
      -[BLSHBacklightEnvironmentStateMachine completedOperation:](a1, v22);

    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:

}

uint64_t __102__BLSHBacklightEnvironmentStateMachine_onMain_performEvent_withInitialSpecifier_performBacklightRamp___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment");
}

- (os_unfair_lock_s)allTransitionsDidBeginUpdateBacklightState:(os_unfair_lock_s *)result
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  if (result)
  {
    v3 = (uint64_t)result;
    v4 = result + 2;
    os_unfair_lock_lock(result + 2);
    v5 = -[BLSHBacklightEnvironmentStateMachine withLock_allTransitionsDidBeginUpdateBacklightState:environmentFilter:](v3, a2, 0);
    os_unfair_lock_unlock(v4);
    return (os_unfair_lock_s *)v5;
  }
  return result;
}

- (void)updateAllEnvironmentsInPresentation
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  _os_log_fault_impl(&dword_2145AC000, a2, OS_LOG_TYPE_FAULT, "ESM:%p calling updateAllEnvironmentsInPresentation on invalidated state machine:%{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_2_1();
}

void __75__BLSHBacklightEnvironmentStateMachine_updateAllEnvironmentsInPresentation__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "environment", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLSHBacklightEnvironmentStateMachine onMain_updateEnvironment:](v7, v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)onMain_updateEnvironment:(uint64_t)a1
{
  id v3;
  int v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4 = *(unsigned __int8 *)(a1 + 134);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4)
    {
      bls_backlight_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BLSHBacklightEnvironmentStateMachine onMain_updateEnvironment:].cold.1();
      goto LABEL_17;
    }
    v6 = (id)objc_msgSend((id)a1, "presentation");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v7 = *(_QWORD *)(a1 + 104);
    v8 = objc_msgSend(*(id *)(a1 + 16), "containsEnvironment:", v3);
    objc_msgSend(*(id *)(a1 + 16), "presentationEntries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "environment");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (!v8)
    {
      bls_backlight_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v3, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218498;
      v22 = a1;
      v23 = 2114;
      v24 = v12;
      v25 = 2114;
      v26 = v16;
      _os_log_debug_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEBUG, "ESM:%p will not update environment:%{public}@ (not in presentation) to backlightState:%{public}@", (uint8_t *)&v21, 0x20u);

LABEL_16:
      goto LABEL_17;
    }
    objc_msgSend(v3, "visualState");
    v5 = objc_claimAutoreleasedReturnValue();
    BLSVisualStateForBacklightState(v7, -[NSObject updateFidelity](v5, "updateFidelity"), v3, *(void **)(a1 + 24), *(void **)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqual:](v5, "isEqual:", v12) & 1) != 0)
    {
      bls_backlight_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v3, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218754;
      v22 = a1;
      v23 = 2114;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v12;
      _os_log_debug_impl(&dword_2145AC000, v13, OS_LOG_TYPE_DEBUG, "ESM:%p not will update environment:%{public}@ (unchanged) to backlightState:%{public}@ visualState:%{public}@", (uint8_t *)&v21, 0x2Au);

    }
    else
    {
      -[BLSHBacklightEnvironmentStateMachine transitionStateForEnvironment:]((os_unfair_lock_s *)a1, v3);
      v13 = objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      bls_backlight_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 134218754;
        v22 = a1;
        v23 = 2114;
        v24 = v18;
        v25 = 2114;
        v26 = v19;
        v27 = 2114;
        v28 = v12;
        _os_log_impl(&dword_2145AC000, v17, OS_LOG_TYPE_INFO, "ESM:%p will update environment:%{public}@ to backlightState:%{public}@ visualState:%{public}@", (uint8_t *)&v21, 0x2Au);

      }
      v20 = v11 == v3;

      objc_msgSend(v3, "presentationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject updateToBacklightState:forEvent:touchTargetable:presentationDate:sceneUpdate:performBacklightRamp:](v13, "updateToBacklightState:forEvent:touchTargetable:presentationDate:sceneUpdate:performBacklightRamp:", v7, 0, v20, v14, 0, 0);
    }

    goto LABEL_15;
  }
LABEL_18:

}

- (void)updateEnvironment:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __58__BLSHBacklightEnvironmentStateMachine_updateEnvironment___block_invoke(uint64_t a1)
{
  -[BLSHBacklightEnvironmentStateMachine onMain_updateEnvironment:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (os_unfair_lock_s)transitionStateForEnvironment:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  id v4;

  v2 = a1;
  if (a1)
  {
    v3 = a1 + 2;
    v4 = a2;
    os_unfair_lock_lock(v2 + 2);
    -[BLSHBacklightEnvironmentStateMachine withLock_transitionStateForEnvironment:]((uint64_t)v2, v4);
    v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }
  return v2;
}

- (void)updateToSpecifier:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __58__BLSHBacklightEnvironmentStateMachine_updateToSpecifier___block_invoke(uint64_t a1)
{
  -[BLSHBacklightEnvironmentStateMachine onMain_updateToSpecifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)onMain_updateToSpecifier:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v12 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    v5 = *(id *)(a1 + 16);
    objc_msgSend(v5, "presentationEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke;
    v15[3] = &unk_24D1BCF68;
    v15[4] = a1;
    objc_msgSend(v6, "bs_map:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    v10 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v9;

    objc_storeStrong((id *)(a1 + 64), a2);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (objc_msgSend(v8, "count"))
    {
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke_3;
      v13[3] = &unk_24D1BCFD0;
      v14 = v12;
      -[BLSHBacklightEnvironmentStateMachine enumerateRemoteEnvironmentsFirstFromSource:environmentTransformer:block:](a1, v8, &__block_literal_global_111, v13);

    }
    else
    {
      objc_msgSend(WeakRetained, "environmentStateMachine:didUpdateToSpecifier:", a1, v12);
    }

  }
}

id __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightEnvironmentStateMachine withLock_transitionStateForEnvironment:](v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment");
}

void __65__BLSHBacklightEnvironmentStateMachine_onMain_updateToSpecifier___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "dateSpecifierForEnvironment:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateToDateSpecifier:", v6);

}

- (void)populateEnvironmentStateMachineStruct:(id *)a3
{
  BLSHBacklightEnvironmentPresentation *lock_presentation;
  uint64_t lock_addingEnvironmentsCount;
  void *v7;
  uint64_t v8;
  id v9;

  lock_presentation = self->_lock_presentation;
  lock_addingEnvironmentsCount = self->_lock_addingEnvironmentsCount;
  -[NSMutableSet allObjects](self->_lock_updatingVisualStateTransitionStates, "allObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_lock_updatingDateSpecifierTransitionStates, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v8) = self->_lock_setPresentationOperation != 0;
  LOWORD(v8) = *(_WORD *)&self->_pendingNotifyBeganUpdatingState;
  +[BLSHBacklightEnvironmentStateMachineAbortPayload populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:](BLSHBacklightEnvironmentStateMachineAbortPayload, "populateEnvironmentStateMachineStruct:machineIsNil:presentation:addingEnvironmentsCount:updatingVisualStateTransitionStates:updatingDateSpecifierTransitionStates:backlightState:previousBacklightState:pendingNotifyBeganUpdatingState:updatingState:updatingPresentation:", a3, 0, lock_presentation, lock_addingEnvironmentsCount, v9, v7, self->_lock_targetBacklightState, self->_lock_performEventTargetBacklightState, v8);

}

- (void)populateOperationCompletedMismatchedBacklightStatesStruct:(uint64_t)a3 backlightState:(uint64_t)a4 targetBacklightState:(void *)a5 performEventHistory:(void *)a6 didBeginUpdateHistory:(void *)a7 didCompleteUpdateHistory:
{
  uint64_t v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  if (a1)
  {
    v12 = *(_QWORD *)(a1 + 16);
    v13 = *(_DWORD *)(a1 + 128);
    v14 = *(void **)(a1 + 48);
    v15 = a7;
    v16 = a6;
    v17 = a5;
    objc_msgSend(v14, "allObjects");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v21) = *(_QWORD *)(a1 + 96) != 0;
    LOWORD(v21) = *(_WORD *)(a1 + 132);
    LODWORD(v20) = v13;
    LOBYTE(v19) = 0;
    +[BLSHBacklightEnvironmentStateMachineAbortPayload populateOperationCompletedMismatchedBacklightStatesStruct:backlightState:targetBacklightState:performEventHistory:didBeginUpdateHistory:didCompleteUpdateHistory:envStateMachineIsNil:envStateMachinePresentation:addingEnvironmentsCount:envStateMachineUpdatingVisualStateTransitionStates:envStateMachineUpdatingDateSpecifierTransitionStates:envStateMachineBacklightState:envStateMachinePreviousBacklightState:envStateMachinePendingNotifyBeganUpdatingState:envStateMachineUpdatingState:envStateMachineUpdatingPresentation:](BLSHBacklightEnvironmentStateMachineAbortPayload, "populateOperationCompletedMismatchedBacklightStatesStruct:backlightState:targetBacklightState:performEventHistory:didBeginUpdateHistory:didCompleteUpdateHistory:envStateMachineIsNil:envStateMachinePresentation:addingEnvironmentsCount:envStateMachineUpdatingVisualStateTransitionStates:envStateMachineUpdatingDateSpecifierTransitionStates:envStateMachineBacklightState:envStateMachinePreviousBacklightState:envStateMachinePendingNotifyBeganUpdatingState:envStateMachineUpdatingState:envStateMachineUpdatingPresentation:", a2, a3, a4, v17, v16, v15, v19, v12, v20, v23, v18, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112),
      v21);

  }
}

- (void)transitionState:(id)a3 didBeginUpdateToBacklightState:(int64_t)a4 visualState:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSMutableArray *didBeginUpdateHistory;
  BLSHEnvironmentUpdateData *v14;
  void *v15;
  void *v16;
  BLSHEnvironmentUpdateData *v17;
  unint64_t v18;
  BLSSetPresentationOperation *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 pendingNotifyBeganUpdatingState;
  _BOOL4 v27;
  _BOOL4 updatingState;
  NSMutableSet *lock_updatingVisualStateTransitionStates;
  void *v30;
  uint8_t buf[4];
  BLSHBacklightEnvironmentStateMachine *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  NSMutableSet *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  bls_backlight_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

  if (v11)
  {
    bls_backlight_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "environment");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      lock_updatingVisualStateTransitionStates = self->_lock_updatingVisualStateTransitionStates;
      NSStringFromBLSBacklightState();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      pendingNotifyBeganUpdatingState = self->_pendingNotifyBeganUpdatingState;
      v27 = self->_lock_setPresentationOperation != 0;
      updatingState = self->_updatingState;
      *(_DWORD *)buf = 134220802;
      v32 = self;
      v33 = 2048;
      v34 = v8;
      v35 = 2114;
      v36 = v22;
      v37 = 2114;
      v38 = lock_updatingVisualStateTransitionStates;
      v39 = 2114;
      v40 = v23;
      v41 = 2114;
      v42 = v24;
      v43 = 2114;
      v44 = v25;
      v45 = 1024;
      v46 = pendingNotifyBeganUpdatingState;
      v47 = 1024;
      v48 = v27;
      v49 = 1024;
      v50 = updatingState;
      v51 = 2114;
      v52 = v8;
      v53 = 2114;
      v54 = v9;
      _os_log_debug_impl(&dword_2145AC000, v12, OS_LOG_TYPE_DEBUG, "ESM:%p (didBeginUpdateToBacklightState:%p:%{public}@), transitionStates:%{public}@, state:%{public}@ target:%{public}@ performEventTarget:%{public}@ pendingNotifyBegan:%{BOOL}u, updatingPres:%{BOOL}u, updating:%{BOOL}u, transitionState:%{public}@, visualState:%{public}@", buf, 0x6Eu);

    }
  }
  didBeginUpdateHistory = self->_didBeginUpdateHistory;
  v14 = [BLSHEnvironmentUpdateData alloc];
  objc_msgSend(v8, "environment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BLSHEnvironmentUpdateData initWithEnvironmentIdentifier:newBacklightState:pendingTransitionStateCount:](v14, "initWithEnvironmentIdentifier:newBacklightState:pendingTransitionStateCount:", v16, a4, -[BLSHBacklightEnvironmentStateMachine withLock_numTransitionsDidNotBeginUpdateBacklightState:]((uint64_t)self, a4));
  -[NSMutableArray addObject:](didBeginUpdateHistory, "addObject:", v17);

  v18 = -[NSMutableArray count](self->_didBeginUpdateHistory, "count");
  if (v18 >= 6)
    -[NSMutableArray removeObjectsInRange:](self->_didBeginUpdateHistory, "removeObjectsInRange:", 0, v18 - 5);
  v19 = self->_lock_setPresentationOperation;
  os_unfair_lock_unlock(&self->_lock);
  if (-[BLSHBacklightEnvironmentStateMachine allTransitionsDidBeginUpdateBacklightState:]((os_unfair_lock_s *)self, a4))
  {
    +[BLSHBegunUpdateOperation didBeginUpdateToBacklightState:](BLSHBegunUpdateOperation, "didBeginUpdateToBacklightState:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHBacklightEnvironmentStateMachine completedOperation:]((uint64_t)self, v20);

  }
  else if (-[BLSHBacklightEnvironmentStateMachine isSetPresentationOperationComplete:]((os_unfair_lock_s *)self, v19))
  {
    -[BLSHBacklightEnvironmentStateMachine completedOperation:]((uint64_t)self, v19);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    bls_backlight_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[BLSHBacklightEnvironmentStateMachine transitionState:didBeginUpdateToBacklightState:visualState:].cold.1();

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (uint64_t)withLock_numTransitionsDidNotBeginUpdateBacklightState:(uint64_t)result
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (result)
  {
    v2 = *(void **)(result + 48);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __95__BLSHBacklightEnvironmentStateMachine_withLock_numTransitionsDidNotBeginUpdateBacklightState___block_invoke;
    v5[3] = &__block_descriptor_40_e44_B24__0__BLSHEnvironmentTransitionState_8_B16l;
    v5[4] = a2;
    objc_msgSend(v2, "objectsPassingTest:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  return result;
}

uint64_t __59__BLSHBacklightEnvironmentStateMachine_completedOperation___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v3;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("BLSHCriticalAssertDidFailNotification"), 0, 0, 4u);
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v3 = abort_with_payload();
  return -[BLSHBacklightEnvironmentStateMachine _lock_isSetPresentationOperationComplete:](v3);
}

- (uint64_t)_lock_isSetPresentationOperationComplete:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = objc_msgSend(v3, "backlightState");
    objc_msgSend(v4, "additions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BLSHBacklightEnvironmentStateMachine withLock_allTransitionsDidBeginUpdateBacklightState:environmentFilter:](a1, v6, v7);

  }
  return v5;
}

- (void)transitionState:(id)a3 didCompleteUpdateToBacklightState:(int64_t)a4 visualState:(id)a5
{
  id v8;
  NSMutableArray *didCompleteUpdateHistory;
  BLSHEnvironmentUpdateData *v10;
  void *v11;
  void *v12;
  BLSHEnvironmentUpdateData *v13;
  unint64_t v14;
  int64_t lock_targetBacklightState;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 updatingState;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
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
  int lock_addingEnvironmentsCount;
  uint64_t v48;
  void *v49;
  _BOOL4 pendingNotifyBeganUpdatingState;
  id v51;
  int v52;
  os_unfair_lock_t lock;
  id v54;
  int64_t v55;
  uint8_t buf[4];
  BLSHBacklightEnvironmentStateMachine *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  _BOOL4 v75;
  __int16 v76;
  _BOOL4 v77;
  __int16 v78;
  _BOOL4 v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v54 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  didCompleteUpdateHistory = self->_didCompleteUpdateHistory;
  v10 = [BLSHEnvironmentUpdateData alloc];
  objc_msgSend(v8, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = a4;
  v13 = -[BLSHEnvironmentUpdateData initWithEnvironmentIdentifier:newBacklightState:pendingTransitionStateCount:](v10, "initWithEnvironmentIdentifier:newBacklightState:pendingTransitionStateCount:", v12, a4, -[NSMutableSet count](self->_lock_updatingVisualStateTransitionStates, "count"));
  -[NSMutableArray addObject:](didCompleteUpdateHistory, "addObject:", v13);

  v14 = -[NSMutableArray count](self->_didCompleteUpdateHistory, "count");
  if (v14 >= 6)
    -[NSMutableArray removeObjectsInRange:](self->_didCompleteUpdateHistory, "removeObjectsInRange:", 0, v14 - 5);
  lock_targetBacklightState = self->_lock_targetBacklightState;
  pendingNotifyBeganUpdatingState = self->_pendingNotifyBeganUpdatingState;
  v52 = -[BLSHBacklightEnvironmentStateMachine _lock_isActiveTransitionState:]((uint64_t)self, v8);
  bls_backlight_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (lock_targetBacklightState == a4)
    v18 = OS_LOG_TYPE_DEBUG;
  else
    v18 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v16, v18))
  {
    objc_msgSend(v8, "environment");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bls_shortLoggingString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = " (mismatch)";
    if (lock_targetBacklightState == v55)
      v22 = "";
    -[NSMutableSet bs_compactMap:](self->_lock_updatingVisualStateTransitionStates, "bs_compactMap:", &__block_literal_global_127, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBLSBacklightState();
    v51 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_pendingNotifyBeganUpdatingState;
    v27 = self->_lock_setPresentationOperation != 0;
    updatingState = self->_updatingState;
    *(_DWORD *)buf = 134221058;
    v57 = self;
    v58 = 2048;
    v59 = v51;
    v60 = 2114;
    v61 = v19;
    v62 = 2114;
    v63 = v20;
    v64 = 2114;
    v65 = v21;
    v66 = 2080;
    v67 = v48;
    v68 = 2114;
    v69 = v23;
    v70 = 2114;
    v71 = v24;
    v72 = 2114;
    v73 = v25;
    v74 = 1024;
    v75 = v26;
    v76 = 1024;
    v77 = v27;
    v78 = 1024;
    v79 = updatingState;
    v80 = 1024;
    v81 = v52 ^ 1;
    _os_log_impl(&dword_2145AC000, v17, v18, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@ — %{public}@)%s, transitionStates:%{public}@, tar:%{public}@ peTar:%{public}@ pendingNB:%{BOOL}u ∂Pres:%{BOOL}u ∂:%{BOOL}u stale:%{BOOL}u", buf, 0x74u);

    v8 = v51;
  }

  os_unfair_lock_unlock(lock);
  if (lock_targetBacklightState == v55)
  {
    if (objc_msgSend(v8, "isUpdatingInitialState"))
    {
      bls_backlight_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v8, "environment");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v57 = self;
        v58 = 2048;
        v59 = v8;
        v60 = 2114;
        v61 = v41;
        v62 = 2114;
        v63 = v42;
        v64 = 2114;
        v65 = v8;
        _os_log_fault_impl(&dword_2145AC000, v29, OS_LOG_TYPE_FAULT, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) completed before begun : %{public}@", buf, 0x34u);

      }
    }
    if (!v52)
    {
      bls_backlight_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "environment");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v57 = self;
        v58 = 2048;
        v59 = v8;
        v60 = 2114;
        v61 = v33;
        v62 = 2114;
        v63 = v34;
        v64 = 2114;
        v65 = v8;
        _os_log_impl(&dword_2145AC000, v31, OS_LOG_TYPE_DEFAULT, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) completed inactive transitionState : %{public}@", buf, 0x34u);

      }
      goto LABEL_28;
    }
    if (-[BLSHBacklightEnvironmentStateMachine transitionCompleteAfterCompletingTransitionState:]((uint64_t)self, v8))
    {
      +[BLSHCompletedUpdateOperation didCompleteUpdateToBacklightState:](BLSHCompletedUpdateOperation, "didCompleteUpdateToBacklightState:", v55);
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v31 = v30;
      -[BLSHBacklightEnvironmentStateMachine completedOperation:]((uint64_t)self, v30);
LABEL_28:

      goto LABEL_29;
    }
    os_unfair_lock_lock(lock);
    bls_backlight_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v8, "environment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightState();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet bs_compactMap:](self->_lock_updatingVisualStateTransitionStates, "bs_compactMap:", &__block_literal_global_129);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      lock_addingEnvironmentsCount = self->_lock_addingEnvironmentsCount;
      *(_DWORD *)buf = 134219266;
      v57 = self;
      v58 = 2048;
      v59 = v8;
      v60 = 2114;
      v61 = v44;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v46;
      v66 = 1024;
      LODWORD(v67) = lock_addingEnvironmentsCount;
      _os_log_debug_impl(&dword_2145AC000, v35, OS_LOG_TYPE_DEBUG, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) still waiting transitionStates:%{public}@, addingEnvironmentsCount:%d", buf, 0x3Au);

    }
    os_unfair_lock_unlock(lock);
    if (pendingNotifyBeganUpdatingState
      && -[BLSHBacklightEnvironmentStateMachine allTransitionsDidBeginUpdateBacklightState:]((os_unfair_lock_s *)self, v55))
    {
      bls_backlight_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "environment");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightState();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v57 = self;
        v58 = 2048;
        v59 = v8;
        v60 = 2114;
        v61 = v38;
        v62 = 2114;
        v63 = v39;
        v64 = 2114;
        v65 = v8;
        _os_log_impl(&dword_2145AC000, v36, OS_LOG_TYPE_DEFAULT, "ESM:%p (%p:%{public}@ didCompleteUpdateTo:%{public}@) completed before begun (only waiter - will send begun) : %{public}@", buf, 0x34u);

      }
      +[BLSHBegunUpdateOperation didBeginUpdateToBacklightState:](BLSHBegunUpdateOperation, "didBeginUpdateToBacklightState:", v55);
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
  }
LABEL_29:

}

- (uint64_t)_lock_isActiveTransitionState:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3) & 1) != 0)
      a1 = 1;
    else
      a1 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v3);
  }

  return a1;
}

uint64_t __102__BLSHBacklightEnvironmentStateMachine_transitionState_didCompleteUpdateToBacklightState_visualState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (BOOL)transitionCompleteAfterCompletingTransitionState:(uint64_t)a1
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", v3);
    v4 = *(int *)(a1 + 128) <= 0 && objc_msgSend(*(id *)(a1 + 48), "count") == 0;
    -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:](a1, v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __102__BLSHBacklightEnvironmentStateMachine_transitionState_didCompleteUpdateToBacklightState_visualState___block_invoke_128(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (void)_lock_ifPossibleStopTrackingTransitionState:(uint64_t)a1
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v4 = -[BLSHBacklightEnvironmentStateMachine _lock_isActiveTransitionState:](a1, v3);
    if ((v4 & 1) != 0
      || (objc_msgSend(v3, "isUpdatingInitialState") & 1) != 0
      || (objc_msgSend(v3, "isUpdatingVisualState") & 1) != 0)
    {
      bls_backlight_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8 = 134218498;
        v9 = a1;
        v10 = 2114;
        v11 = v3;
        v12 = 1024;
        v13 = v4;
        _os_log_debug_impl(&dword_2145AC000, v5, OS_LOG_TYPE_DEBUG, "ESM:%p will not stop tracking transitionState:%{public}@ (isActiveTransitionState:%{BOOL}u)", (uint8_t *)&v8, 0x1Cu);
      }
    }
    else
    {
      bls_backlight_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:].cold.1();

      v7 = *(void **)(a1 + 40);
      objc_msgSend(v3, "environment");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v5);
    }

  }
}

- (void)transitionState:(id)a3 didUpdateToDateSpecifier:(id)a4
{
  id v6;
  id v7;
  BLSHPresentationDateSpecifier *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  NSMutableSet *lock_updatingDateSpecifierTransitionStates;
  BLSHPresentationDateSpecifier *updatingSpecifier;
  NSObject *v17;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_updatingSpecifier;
  if (!v8
    || !-[NSMutableSet containsObject:](self->_lock_updatingDateSpecifierTransitionStates, "containsObject:", v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:]((uint64_t)self, v6);
    goto LABEL_13;
  }
  objc_msgSend(v6, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHPresentationDateSpecifier dateSpecifierForEnvironment:](v8, "dateSpecifierForEnvironment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_8:
    if (v11)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v7, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToDate:", v11))
  {

    goto LABEL_8;
  }

LABEL_9:
  -[NSMutableSet removeObject:](self->_lock_updatingDateSpecifierTransitionStates, "removeObject:", v6);
LABEL_10:
  v14 = -[NSMutableSet count](self->_lock_updatingDateSpecifierTransitionStates, "count");
  if (!v14)
  {
    lock_updatingDateSpecifierTransitionStates = self->_lock_updatingDateSpecifierTransitionStates;
    self->_lock_updatingDateSpecifierTransitionStates = 0;

    updatingSpecifier = self->_updatingSpecifier;
    self->_updatingSpecifier = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[BLSHBacklightEnvironmentStateMachine _lock_ifPossibleStopTrackingTransitionState:]((uint64_t)self, v6);
  if (!v14)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(WeakRetained, "environmentStateMachine:didUpdateToSpecifier:", self, v8);
    goto LABEL_16;
  }
LABEL_13:
  bls_backlight_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[BLSHBacklightEnvironmentStateMachine transitionState:didUpdateToDateSpecifier:].cold.1();

  os_unfair_lock_unlock(&self->_lock);
LABEL_16:

}

- (uint64_t)withLock_allTransitionsDidBeginUpdateBacklightState:(void *)a3 environmentFilter:
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a1 && *(int *)(a1 + 128) <= 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          if (!v5
            || (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "environment", (_QWORD)v16),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                v14 = objc_msgSend(v5, "containsObject:", v13),
                v13,
                v14))
          {
            if ((objc_msgSend(v12, "isUpdatingInitialState", (_QWORD)v16) & 1) != 0
              || !objc_msgSend(v12, "isUpdatedToBacklightState:", a2))
            {
              v6 = 0;
              goto LABEL_17;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_17:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __95__BLSHBacklightEnvironmentStateMachine_withLock_numTransitionsDidNotBeginUpdateBacklightState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isUpdatingInitialState") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isUpdatedToBacklightState:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (BLSHInactiveBudgetPolicing_Private)inactiveBudgetPolicy
{
  return self->_inactiveBudgetPolicy;
}

- (BLSHOSTimerProviding)osTimerProvider
{
  return self->_osTimerProvider;
}

- (BLSHBacklightEnvironmentStateMachineDelegate)delegate
{
  return (BLSHBacklightEnvironmentStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_staleEnvironmentsThatNeedDeferredUpdate, 0);
  objc_storeStrong((id *)&self->_lock_setPresentationOperation, 0);
  objc_storeStrong((id *)&self->_didCompleteUpdateHistory, 0);
  objc_storeStrong((id *)&self->_didBeginUpdateHistory, 0);
  objc_storeStrong((id *)&self->_performEventHistory, 0);
  objc_storeStrong((id *)&self->_updatingSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_updatingDateSpecifierTransitionStates, 0);
  objc_storeStrong((id *)&self->_lock_updatingVisualStateTransitionStates, 0);
  objc_storeStrong((id *)&self->_transitionStates, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_lock_presentation, 0);
}

- (void)initWithPresentation:backlightState:delegate:inactiveBudgetPolicy:osTimerProvider:.cold.1()
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

- (void)onMain_setPresentation:withTargetBacklightState:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend(v0, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_0(&dword_2145AC000, v2, v3, "ESM:%p calling setPresentation on invalidated state machine:%{public}@ presentation:%{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_14();
}

- (void)onMain_setPresentation:withTargetBacklightState:.cold.2()
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

- (void)onMain_setPresentation:withTargetBacklightState:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "ESM:%p finishing (immediate complete - update also) setPresentation:%{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)onMain_setPresentation:withTargetBacklightState:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "ESM:%p finishing (immediate complete) setPresentation:%{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)onMain_setPresentation:(os_log_t)log withTargetBacklightState:.cold.5(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 134218498;
  v5 = a1;
  v6 = 2048;
  v7 = a2;
  v8 = 2114;
  v9 = v3;
  _os_log_debug_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEBUG, "ESM:%p (finishing - waiting) setPresentation:%p transitionStates:%{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)onMain_setPresentation:(NSObject *)a3 withTargetBacklightState:.cold.6(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NSStringFromBLSBacklightState();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "valueForKeyPath:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v7, "ESM: setPresentation: -> %@ environments %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2_1();
}

void __179__BLSHBacklightEnvironmentStateMachine_updateTransitionStatesForEnvironments_toBacklightState_forEvent_withInitialSpecifier_forReason_performBacklightRamp_environmentTransformer___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  NSStringFromBLSBacklightState();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v5, v6, "ESM: updateTransitionStatesForEnvironments: -> %@ environment %@: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_14();
}

- (void)onMain_performEvent:(uint64_t)a1 withInitialSpecifier:(void *)a2 performBacklightRamp:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v5, "ESM:%p finishing (immediate complete) performEvent:%{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)onMain_performEvent:(uint64_t)a1 withInitialSpecifier:(void *)a2 performBacklightRamp:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4(&dword_2145AC000, a3, v5, "ESM:%p finishing (immediate begin update) performEvent:%{public}@", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)onMain_performEvent:(uint64_t)a1 withInitialSpecifier:(void *)a2 performBacklightRamp:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "bls_shortLoggingString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0(&dword_2145AC000, v2, v3, "ESM:%p (finishing - waiting) performEvent:%{public}@ transitionStates:%{public}@ ", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_14();
}

- (void)onMain_updateEnvironment:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend(v0, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_0(&dword_2145AC000, v2, v3, "ESM:%p calling updateEnvironment on invalidated state machine:%{public}@ environment:%{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_14();
}

- (void)transitionState:didBeginUpdateToBacklightState:visualState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  OUTLINED_FUNCTION_10_0();
  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(v2 + 48);
  v7 = *(_DWORD *)(v2 + 128);
  v8 = 134219010;
  v9 = v2;
  v10 = 2048;
  v11 = v1;
  v12 = 2114;
  v13 = v5;
  v14 = 2114;
  v15 = v6;
  v16 = 1024;
  v17 = v7;
  _os_log_debug_impl(&dword_2145AC000, v0, OS_LOG_TYPE_DEBUG, "ESM:%p (didBeginUpdateToBacklightState:%p:%{public}@) still waiting transitionStates:%{public}@, addingEnvironmentsCount:%d", (uint8_t *)&v8, 0x30u);

  OUTLINED_FUNCTION_15_0();
}

- (void)_lock_ifPossibleStopTrackingTransitionState:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "ESM:%p will stop tracking transitionState:%{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)transitionState:didUpdateToDateSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_10_0();
  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(v2 + 56);
  v7 = 134218754;
  v8 = v2;
  v9 = 2048;
  v10 = v1;
  v11 = 2114;
  v12 = v5;
  v13 = 2114;
  v14 = v6;
  _os_log_debug_impl(&dword_2145AC000, v0, OS_LOG_TYPE_DEBUG, "ESM:%p (didUpdateToDateSpecifier:%p:%{public}@) still waiting transitionStates:%{public}@", (uint8_t *)&v7, 0x2Au);

  OUTLINED_FUNCTION_15_0();
}

@end
