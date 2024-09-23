@implementation FBSProcessWatchdog

- (void)activate
{
  FBSProcessWatchdog *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!*(_WORD *)&obj->_active)
  {
    obj->_active = 1;
    -[FBSProcessWatchdog _beginMonitoringConstraints](obj, "_beginMonitoringConstraints");
  }
  objc_sync_exit(obj);

}

- (void)_beginMonitoringConstraints
{
  FBSProcessWatchdog *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id WeakRetained;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_active)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[FBSProcessWatchdogPolicy provisions](v2->_policy, "provisions", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v7, "prepareForReuse");
          objc_msgSend(v7, "setDelegate:", v2);
          WeakRetained = objc_loadWeakRetained((id *)&v2->_process);
          objc_msgSend(v7, "monitorProcess:", WeakRetained);

        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
  objc_sync_exit(v2);

}

- (void)invalidate
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_19A6D4000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] Invalidating %{public}@", buf, 0x16u);

}

- (void)deactivate
{
  FBSProcessWatchdog *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_active)
  {
    -[FBSProcessWatchdog _stopMonitoringConstraints](obj, "_stopMonitoringConstraints");
    obj->_active = 0;
  }
  objc_sync_exit(obj);

}

- (void)_stopMonitoringConstraints
{
  FBSProcessWatchdog *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[FBSProcessWatchdogPolicy provisions](v2->_policy, "provisions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setDelegate:", 0);
        objc_msgSend(v7, "stopMonitoring");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (FBSProcessWatchdogPolicy)policy
{
  return self->_policy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_destroyWeak((id *)&self->_process);
  objc_storeStrong((id *)&self->_name, 0);
}

- (FBSProcessWatchdog)initWithName:(id)a3 process:(id)a4 policy:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  FBSProcessWatchdog *v15;
  FBSProcessWatchdog *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  FBSProcessWatchdogPolicy *policy;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessWatchdog initWithName:process:policy:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6ED2B4);
  }
  v12 = v11;
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EE3B9AE0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(FBSProcessInternal)]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessWatchdog initWithName:process:policy:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6ED318);
  }

  v13 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessWatchdog initWithName:process:policy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6ED37CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessWatchdog initWithName:process:policy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6ED3E0);
  }

  v14 = v10;
  NSClassFromString(CFSTR("FBSProcessWatchdogPolicy"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessWatchdog initWithName:process:policy:].cold.3();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6ED444);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSProcessWatchdogPolicyClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessWatchdog initWithName:process:policy:].cold.3();
    goto LABEL_27;
  }

  v27.receiver = self;
  v27.super_class = (Class)FBSProcessWatchdog;
  v15 = -[FBSProcessWatchdog init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_process, v12);
    v17 = objc_msgSend(v13, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    policy = v16->_policy;
    v16->_policy = (FBSProcessWatchdogPolicy *)v19;

  }
  return v16;
}

- (void)setCompletion:(id)a3
{
  FBSProcessWatchdog *v4;
  uint64_t v5;
  id completion;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_completion != v7)
  {
    v5 = objc_msgSend(v7, "copy");
    completion = v4->_completion;
    v4->_completion = (id)v5;

  }
  objc_sync_exit(v4);

}

- (id)completion
{
  FBSProcessWatchdog *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x19AECA324](v2->_completion);
  objc_sync_exit(v2);

  return v3;
}

- (void)provision:(id)a3 wasViolatedWithError:(id)a4
{
  id v6;
  id v7;
  FBSProcessWatchdog *v8;
  id WeakRetained;
  uint64_t (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  WeakRetained = objc_loadWeakRetained((id *)&v8->_process);
  -[FBSProcessWatchdog completion](v8, "completion");
  v10 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[FBSProcessWatchdog setCompletion:](v8, "setCompletion:", 0);
  if (v8->_active
    && (-[FBSProcessWatchdogPolicy provisions](v8->_policy, "provisions"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v6),
        v11,
        v12))
  {
    -[FBSProcessWatchdog deactivate](v8, "deactivate");
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v8);

  FBLogWatchdog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    FBSProcessPrettyDescription(WeakRetained);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSProcessWatchdog succinctDescription](v8, "succinctDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "succinctDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v25;
    v32 = 2114;
    v33 = v26;
    v34 = 2114;
    v35 = v27;
    _os_log_error_impl(&dword_19A6D4000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Watchdog %{public}@ provision violated: %{public}@", buf, 0x20u);

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_setSafeObject:forKey:", v6, CFSTR("FBSProcessExecutionProvision"));
    objc_msgSend(v15, "bs_setSafeObject:forKey:", CFSTR("An execution provision was violated."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v15, "bs_setSafeObject:forKey:", v7, *MEMORY[0x1E0CB3388]);
    objc_msgSend(v7, "localizedFailureReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_setSafeObject:forKey:", v16, *MEMORY[0x1E0CB2D68]);

    v29 = 0;
    v17 = objc_msgSend(WeakRetained, "_watchdog:shouldTerminateWithDeclineReason:", v8, &v29);
    v28 = v29;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSProcessWatchdogErrorDomain"), 1, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_watchdog:terminationRequestForViolatedProvision:error:", v8, v6, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      FBLogWatchdog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[FBSProcessWatchdog provision:wasViolatedWithError:].cold.2(WeakRetained);

    }
    else
    {
      FBLogWatchdog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        FBSProcessPrettyDescription(WeakRetained);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v21;
        v32 = 2114;
        v33 = v28;
        _os_log_impl(&dword_19A6D4000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Process declined watchdog termination with reason: %{public}@", buf, 0x16u);

      }
      v19 = 0;
    }

    if (!v10
      || (objc_msgSend(v15, "bs_setSafeObject:forKey:", v19, CFSTR("FBSProcessTerminationRequest")),
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSProcessWatchdogErrorDomain"), 1, v15), v22 = (void *)objc_claimAutoreleasedReturnValue(), v23 = ((uint64_t (**)(_QWORD, uint64_t, void *))v10)[2](v10, 1, v22), v22, (v23 & 1) == 0))
    {
      if (v19)
      {
        objc_msgSend(WeakRetained, "_terminateWithRequest:forWatchdog:", v19, v8);
      }
      else
      {
        FBLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[FBSProcessWatchdog provision:wasViolatedWithError:].cold.1(WeakRetained);

      }
    }

  }
}

- (NSString)description
{
  return (NSString *)-[FBSProcessWatchdog descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessWatchdog succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  unint64_t Value;
  double v14;
  id v15;
  id v16;
  _QWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("name"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FBSProcessWatchdogPolicy provisions](self->_policy, "provisions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type");
        memset(v18, 0, sizeof(v18));
        if (v11)
          objc_msgSend(v11, "allowance");
        Value = FBSProcessResourceAllowanceGetValue((uint64_t)v18);
        v14 = FBSProcessResourceTimeIntervalForValue(Value);
        if (v12 == 2)
        {
          v8 = v8 + v14;
        }
        else if (v12 == 1)
        {
          v9 = v9 + v14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);

    if (v9 > 0.0)
      v15 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("time"), 0, v9);
    if (v8 > 0.0)
      v16 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("cpuTime"), 0, v8);
  }
  else
  {

  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessWatchdog descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  FBSProcessWatchdog *v12;

  v4 = a3;
  -[FBSProcessWatchdog succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendBool:withName:", self->_active, CFSTR("active"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__FBSProcessWatchdog_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E38EAE08;
  v7 = v5;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v8 = v7;
  return v8;
}

id __60__FBSProcessWatchdog_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("policy"));
}

- (NSString)name
{
  return self->_name;
}

- (FBSProcess)process
{
  return (FBSProcess *)objc_loadWeakRetained((id *)&self->_process);
}

- (void)initWithName:process:policy:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithName:process:policy:.cold.2()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithName:process:policy:.cold.3()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)provision:(void *)a1 wasViolatedWithError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  FBSProcessPrettyDescription(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v2, v3, "Not terminating \"%{public}@\" for violated provision because: \"%{public}@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)provision:(void *)a1 wasViolatedWithError:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  FBSProcessPrettyDescription(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_0(&dword_19A6D4000, v2, v3, "[%{public}@] Watchdog termination request provided: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

@end
