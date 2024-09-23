@implementation BLSHEngineRenderFlipbookSession

- (BLSHEngineRenderFlipbookSession)initWithDelegate:(id)a3 flipbook:(id)a4 presentation:(id)a5 osInterfaceProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BLSHEngineRenderFlipbookSession *v14;
  BLSHEngineRenderFlipbookSession *v15;
  uint64_t v16;
  NSMutableArray *lock_renderedFrames;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v26;
  id v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)BLSHEngineRenderFlipbookSession;
  v14 = -[BLSHEngineRenderFlipbookSession init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    v26 = v13;
    v27 = v11;
    objc_storeStrong((id *)&v14->_flipbook, a4);
    objc_storeStrong((id *)&v15->_presentation, a5);
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v15->_lock_delegate, v10);
    objc_storeStrong((id *)&v15->_osInterfaceProvider, a6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    lock_renderedFrames = v15->_lock_renderedFrames;
    v15->_lock_renderedFrames = (NSMutableArray *)v16;

    BSContinuousMachTimeNow();
    v15->_sessionStartTime = v18;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v12, "presentationEntries");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "environment", v26, v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "willBeginRenderSession:", v15);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    objc_initWeak(&location, v15);
    objc_copyWeak(&v28, &location);
    v15->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    v13 = v26;
    v11 = v27;
  }

  return v15;
}

uint64_t __94__BLSHEngineRenderFlipbookSession_initWithDelegate_flipbook_presentation_osInterfaceProvider___block_invoke(uint64_t a1)
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

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[BLSHEngineRenderFlipbookSession count](self, "count"), CFSTR("renderedCount"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_lock_renderedFrames, "count"), CFSTR("renderedCount"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_didFailToRender, CFSTR("didFailToRender"), 1);
  v7 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_timedOut, CFSTR("timedOut"), 1);
  v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_lock_invalidated, CFSTR("invalidated"), 1);
  if (self->_lock_retryRenderCount >= 1)
    v9 = (id)objc_msgSend(v4, "appendInt:withName:");
  BSContinuousMachTimeNow();
  v11 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("totalPreparationSeconds"), 3, v10 - self->_sessionStartTime);
  v12 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("accumulatedLayoutSeconds"), 3, self->_lock_accumulatedLayoutDuration);
  v13 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("accumulatedRenderSeconds"), 3, self->_lock_accumulatedRenderDuration);
  v14 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lock_preparingSpecifier, CFSTR("preparingSpecifier"), 1);
  v15 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_lock_timeoutTimer, CFSTR("timeoutTimer"), 1);
  -[NSMutableSet allObjects](self->_lock_pendingEnvironments, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v16, CFSTR("pendingEnvironments"), CFSTR("      "), 1);

  objc_msgSend(v4, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", self->_lock_renderedFrames, CFSTR("renderedFrames"), CFSTR("      "), 1);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray count](self->_lock_renderedFrames, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)memoryUsage
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BLSHEngineRenderFlipbookSession lock_memoryUsage]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (uint64_t)lock_memoryUsage
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "memoryUsage", (_QWORD)v8);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)renderedFrames
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_lock_renderedFrames, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  BSTimerScheduleQuerying *lock_timeoutTimer;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  if (self->_lock_didDisableFlipbookPowerSavings)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    objc_msgSend(WeakRetained, "decrementDisablePowerSavingUsageCountForReason:", 3);

    self->_lock_didDisableFlipbookPowerSavings = 0;
  }
  -[BSTimerScheduleQuerying invalidate](self->_lock_timeoutTimer, "invalidate");
  lock_timeoutTimer = self->_lock_timeoutTimer;
  self->_lock_timeoutTimer = 0;

  objc_storeWeak((id *)&self->_lock_delegate, 0);
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BLSHBacklightEnvironmentPresentation presentationEntries](self->_presentation, "presentationEntries", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "environment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "willEndRenderSession:", self);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)prepareAndRenderFrameSpecifier:(id)a3
{
  double v6;
  id WeakRetained;
  NSMutableSet *v8;
  NSMutableSet *lock_pendingEnvironments;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSMutableSet *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("specifier != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145C7B78);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_lock_invalidated"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:].cold.4(a2);
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145C7BDCLL);
  }
  if (self->_lock_preparingSpecifier)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_preparingSpecifier == nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:].cold.3(a2);
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145C7C40);
  }
  BSContinuousMachTimeNow();
  self->_lock_layoutStartTime = v6;
  if (!self->_lock_didDisableFlipbookPowerSavings)
  {
    self->_lock_didDisableFlipbookPowerSavings = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    objc_msgSend(WeakRetained, "incrementDisablePowerSavingUsageCountForReason:", 3);

  }
  objc_storeStrong((id *)&self->_lock_preparingSpecifier, a3);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  lock_pendingEnvironments = self->_lock_pendingEnvironments;
  self->_lock_pendingEnvironments = v8;

  objc_msgSend(v30, "specifiers");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v10);
        v14 = self->_lock_pendingEnvironments;
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "environment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v14, "addObject:", v16);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v11);
  }

  if (!-[NSMutableSet count](self->_lock_pendingEnvironments, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_lock_pendingEnvironments count] > 0"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145C7CA4);
  }
  -[BLSHEngineRenderFlipbookSession _lock_scheduleTimeoutForSpecifier:]((uint64_t)self, v30);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v36;
    v20 = MEMORY[0x24BDAC760];
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v22, "environment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dateSpecifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v20;
        v31[1] = 3221225472;
        v31[2] = __66__BLSHEngineRenderFlipbookSession_prepareAndRenderFrameSpecifier___block_invoke;
        v31[3] = &unk_24D1BC848;
        objc_copyWeak(&v34, &location);
        v25 = v23;
        v32 = v25;
        v33 = v30;
        objc_msgSend(v25, "updateToDateSpecifier:sceneContentsUpdated:", v24, v31);

        objc_destroyWeak(&v34);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v18);
  }

  objc_destroyWeak(&location);
}

- (void)_lock_scheduleTimeoutForSpecifier:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    v4 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "build");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__BLSHEngineRenderFlipbookSession__lock_scheduleTimeoutForSpecifier___block_invoke;
    v9[3] = &unk_24D1BC8B0;
    objc_copyWeak(&v11, &location);
    v10 = v3;
    objc_msgSend(v4, "scheduledTimerWithIdentifier:interval:leewayInterval:handler:", v6, v9, 1.0, 2.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __66__BLSHEngineRenderFlipbookSession_prepareAndRenderFrameSpecifier___block_invoke(void **a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[BLSHEngineRenderFlipbookSession environment:didUpdateToSpecifier:]((uint64_t)WeakRetained, a1[4], a1[5]);

}

- (void)environment:(void *)a3 didUpdateToSpecifier:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(_BYTE *)(a1 + 118)
      || *(_BYTE *)(a1 + 117)
      || *(id *)(a1 + 24) != v5
      || (v6 = *(void **)(a1 + 32),
          objc_msgSend(v10, "identifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "removeObject:", v7),
          v7,
          objc_msgSend(*(id *)(a1 + 32), "count")))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    }
    else
    {
      v8 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v9 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      *(_DWORD *)(a1 + 112) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](a1, v5, 0);
    }
  }

}

- (id)telemetryDataWithEndTime:(double)a3 reasonEnded:(id)a4 preventedSleepDuration:(double)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BLSHFlipbookRenderSessionTelemetryData *v15;

  p_lock = &self->_lock;
  v9 = a4;
  os_unfair_lock_lock(p_lock);
  v10 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v10, "bls_initWithBSContinuousMachTime:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[BLSHFlipbookFramesHistogram histogramWithReferenceDate:flipbookFrames:](BLSHFlipbookFramesHistogram, "histogramWithReferenceDate:flipbookFrames:", v11, self->_lock_renderedFrames);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHBacklightEnvironmentPresentation presentationEntries](self->_presentation, "presentationEntries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_468);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[BLSHFlipbookRenderSessionTelemetryData initWithTimestamp:environmentIdentifiers:reasonEnded:sessionFramesHistogram:totalPreparationDuration:accumulatedLayoutDuration:accumulatedRenderDuration:preventedSleepDuration:didFailToRender:timedOutEnvironmentCount:]([BLSHFlipbookRenderSessionTelemetryData alloc], "initWithTimestamp:environmentIdentifiers:reasonEnded:sessionFramesHistogram:totalPreparationDuration:accumulatedLayoutDuration:accumulatedRenderDuration:preventedSleepDuration:didFailToRender:timedOutEnvironmentCount:", v14, v9, v12, self->_lock_didFailToRender, -[NSMutableSet count](self->_lock_pendingEnvironments, "count"), a3, a3 - self->_sessionStartTime, self->_lock_accumulatedLayoutDuration, self->_lock_accumulatedRenderDuration, a5);
  os_unfair_lock_unlock(p_lock);

  return v15;
}

id __95__BLSHEngineRenderFlipbookSession_telemetryDataWithEndTime_reasonEnded_preventedSleepDuration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __69__BLSHEngineRenderFlipbookSession__lock_scheduleTimeoutForSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)timeoutTimerFiredForSpecifier:(uint64_t)a1
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(id *)(a1 + 24) != v3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_preparingSpecifier == specifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:].cold.3();
      objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145C8308);
    }
    *(_BYTE *)(a1 + 117) = 1;
    v4 = *(unsigned __int8 *)(a1 + 118);
    *(_QWORD *)(a1 + 24) = 0;

    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    v6 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (v4)
    {
      bls_flipbook_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:].cold.2();
    }
    else
    {
      v8 = BSIsBeingDebugged();
      bls_flipbook_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (!v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:].cold.1();

        -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](a1, v3, v5);
        goto LABEL_7;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v12 = a1;
        v13 = 2114;
        v14 = v5;
        _os_log_impl(&dword_2145AC000, v7, OS_LOG_TYPE_INFO, "%p prepare frame operation did not complete after ~1 second (+leeway), (but it is being debugged), pending environments:%{public}@ ", buf, 0x16u);
      }
    }

LABEL_7:
  }

}

- (void)renderFrameSpecifier:(void *)a3 timedOutEnvironments:
{
  id v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v13 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = objc_msgSend(v13, "encodedPresentationTime");
    objc_msgSend(v5, "count");
    objc_msgSend(v13, "encodedPresentationTime");
    kdebug_trace();
    BSContinuousMachTimeNow();
    *(double *)(a1 + 96) = *(double *)(a1 + 96) + v7 - *(double *)(a1 + 88);
    objc_msgSend(v13, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "count");
    kdebug_trace();

    BSContinuousMachTimeNow();
    v10 = v9;
    v11 = *(void **)(a1 + 8);
    v12 = *(_QWORD *)(a1 + 120);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke;
    v14[3] = &unk_24D1BC8D8;
    v18 = v6;
    v15 = v13;
    v16 = a1;
    v19 = v10;
    v17 = v5;
    v20 = sel_renderFrameSpecifier_timedOutEnvironments_;
    objc_msgSend(v11, "renderFrameForPresentation:dateSpecifier:completion:", v12, v15, v14);

  }
}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t *v7;
  double v8;
  int v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  id *v34;
  void *v35;
  int v36;
  os_unfair_lock_s *v37;
  NSObject *v38;
  char v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  dispatch_time_t v45;
  uint64_t v46;
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
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD block[4];
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  _BYTE v78[14];
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "frameId");
  v7 = (uint64_t *)(a1 + 40);
  kdebug_trace();
  BSContinuousMachTimeNow();
  *(double *)(*(_QWORD *)(a1 + 40) + 104) = v8 - *(double *)(a1 + 64) + *(double *)(*(_QWORD *)(a1 + 40) + 104);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 118);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
  if (v5)
    objc_msgSend(*(id *)(*v7 + 40), "addObject:", v5);
  v11 = objc_msgSend(*(id *)(*v7 + 40), "count");
  v12 = -[BLSHEngineRenderFlipbookSession lock_memoryUsage](*v7);
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("com.apple.coreanimation.flipbook"));

    if (v14)
    {
      v15 = objc_msgSend(v6, "code");
      if (v15 == 5)
      {
        ++*(_DWORD *)(*v7 + 112);
        os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
        bls_flipbook_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v61 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v6, "bls_loggingString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringFromByteCount:", v12);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v74 = v61;
          v75 = 2114;
          v76 = v29;
          v77 = 2114;
          *(_QWORD *)v78 = v30;
          *(_WORD *)&v78[8] = 1024;
          *(_DWORD *)&v78[10] = v11;
          v79 = 2114;
          v80 = v32;
          _os_log_impl(&dword_2145AC000, v28, OS_LOG_TYPE_INFO, "%p (will retry) failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);

        }
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        v33 = dispatch_time(0, 10000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_477;
        block[3] = &unk_24D1BC848;
        v34 = &v68;
        objc_copyWeak(&v68, (id *)buf);
        v66 = *(id *)(a1 + 32);
        v67 = *(id *)(a1 + 48);
        dispatch_after(v33, MEMORY[0x24BDAC9B8], block);

        v35 = v66;
        goto LABEL_25;
      }
      if (v15 == 2)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = objc_msgSend(*(id *)(*v7 + 64), "isFlipbookTransparent");
        else
          v16 = 0;
        v36 = v16 & (objc_msgSend(WeakRetained, "isUsingPseudoFlipbook") ^ 1);
        v37 = (os_unfair_lock_s *)*v7;
        if (*(int *)(*v7 + 112) >= 1)
        {
          bls_flipbook_log();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v57 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v6, "bls_loggingString");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "stringFromByteCount:", v12);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219010;
            v74 = v57;
            v75 = 2114;
            v76 = v63;
            v77 = 2114;
            *(_QWORD *)v78 = v60;
            *(_WORD *)&v78[8] = 1024;
            *(_DWORD *)&v78[10] = v11;
            v79 = 2114;
            v80 = v56;
            _os_log_error_impl(&dword_2145AC000, v38, OS_LOG_TYPE_ERROR, "%p (likely rdar://81598375) failed (twice) to render error:%{public}@ specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);

          }
          os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
          if ((v36 & 1) != 0)
            goto LABEL_36;
          goto LABEL_10;
        }
        v39 = v36 ^ 1;
        if (v9)
          v39 = 0;
        if ((v39 & 1) == 0)
        {
          os_unfair_lock_unlock(v37 + 4);
          if (v36)
          {
LABEL_36:
            bls_flipbook_log();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v46 = *(_QWORD *)(a1 + 40);
              objc_msgSend(v6, "bls_loggingString");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringFromByteCount:", v12);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134219010;
              v74 = v46;
              v75 = 2114;
              v76 = v47;
              v77 = 2114;
              *(_QWORD *)v78 = v48;
              *(_WORD *)&v78[8] = 1024;
              *(_DWORD *)&v78[10] = v11;
              v79 = 2114;
              v80 = v50;
              _os_log_error_impl(&dword_2145AC000, v40, OS_LOG_TYPE_ERROR, "%p (**INVALID CONFIGURATION**) failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)\nEITHER DELETE transparentFlipbook:\n    login -fq mobile defaults delete com.apple.BacklightServices transparentFlipbook\nOR ALSO SET usePseudoFlipbook:\n    login -fq mobile defaults write com.apple.BacklightServices usePseudoFlipbook -BOOL YES", buf, 0x30u);

            }
            goto LABEL_39;
          }
          goto LABEL_10;
        }
        v37[28]._os_unfair_lock_opaque = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
        bls_flipbook_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v64 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v6, "bls_loggingString");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringFromByteCount:", v12);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v74 = v64;
          v75 = 2114;
          v76 = v51;
          v77 = 2114;
          *(_QWORD *)v78 = v52;
          *(_WORD *)&v78[8] = 1024;
          *(_DWORD *)&v78[10] = v11;
          v79 = 2114;
          v80 = v54;
          _os_log_error_impl(&dword_2145AC000, v44, OS_LOG_TYPE_ERROR, "%p (likely rdar://81598375) (will retry) failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);

        }
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        v45 = dispatch_time(0, 50000000);
        v69[0] = MEMORY[0x24BDAC760];
        v69[1] = 3221225472;
        v69[2] = __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_476;
        v69[3] = &unk_24D1BC848;
        v34 = &v72;
        objc_copyWeak(&v72, (id *)buf);
        v70 = *(id *)(a1 + 32);
        v71 = *(id *)(a1 + 48);
        dispatch_after(v45, MEMORY[0x24BDAC9B8], v69);

        v35 = v70;
LABEL_25:

        objc_destroyWeak(v34);
        objc_destroyWeak((id *)buf);
        goto LABEL_39;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
LABEL_10:
    bls_flipbook_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v59 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "bls_loggingString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringFromByteCount:", v12);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v74 = v59;
      v75 = 2114;
      v76 = v41;
      v77 = 2114;
      *(_QWORD *)v78 = v42;
      *(_WORD *)&v78[8] = 1024;
      *(_DWORD *)&v78[10] = v11;
      v79 = 2114;
      v80 = v43;
      _os_log_fault_impl(&dword_2145AC000, v17, OS_LOG_TYPE_FAULT, "%p failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);

    }
    if (!v9)
      objc_msgSend(WeakRetained, "renderFramesSession:failedToRenderSpecifier:error:timedOutEnvironments:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 48));
    goto LABEL_39;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
  if (v9)
  {
    bls_flipbook_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *v7;
      objc_msgSend(v5, "bls_loggingString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringFromByteCount:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v74 = v19;
      v75 = 2114;
      v76 = v20;
      v77 = 1024;
      *(_DWORD *)v78 = v11;
      *(_WORD *)&v78[4] = 2114;
      *(_QWORD *)&v78[6] = v22;
      _os_log_impl(&dword_2145AC000, v18, OS_LOG_TYPE_INFO, "%p (after invalidated) did render:%{public}@ (session:%u,%{public}@)", buf, 0x26u);

    }
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("renderedFrame != nil"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_cold_1();
      objc_msgSend(objc_retainAutorelease(v55), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x2145C8E84);
    }
    bls_flipbook_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = *v7;
      objc_msgSend(v5, "bls_loggingString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringFromByteCount:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v74 = v24;
      v75 = 2114;
      v76 = v25;
      v77 = 1024;
      *(_DWORD *)v78 = v11;
      *(_WORD *)&v78[4] = 2114;
      *(_QWORD *)&v78[6] = v27;
      _os_log_impl(&dword_2145AC000, v23, OS_LOG_TYPE_INFO, "%p did render:%{public}@ (session:%u,%{public}@)", buf, 0x26u);

    }
    objc_msgSend(WeakRetained, "renderFramesSession:didRenderFrame:timedOutEnvironments:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
  }
LABEL_39:

}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_476(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_477(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return self->_presentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_lock_renderedFrames, 0);
  objc_storeStrong((id *)&self->_lock_pendingEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_preparingSpecifier, 0);
  objc_storeStrong((id *)&self->_flipbook, 0);
}

- (void)prepareAndRenderFrameSpecifier:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)prepareAndRenderFrameSpecifier:.cold.2()
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

- (void)prepareAndRenderFrameSpecifier:(const char *)a1 .cold.3(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)prepareAndRenderFrameSpecifier:(const char *)a1 .cold.4(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_13();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)timeoutTimerFiredForSpecifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_2145AC000, v0, OS_LOG_TYPE_ERROR, "%p prepare frame operation did not complete after ~1 second (+leeway), pending environments:%{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)timeoutTimerFiredForSpecifier:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_2145AC000, v0, (uint64_t)v0, "%p prepare frame operation did not complete after ~1 second (+leeway), (invalidated), pending environments:%{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)timeoutTimerFiredForSpecifier:.cold.3()
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

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(*(SEL *)(v0 + 72));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
