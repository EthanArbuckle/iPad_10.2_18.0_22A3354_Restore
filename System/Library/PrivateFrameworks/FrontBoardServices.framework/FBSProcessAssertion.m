@implementation FBSProcessAssertion

- (FBSProcessAssertion)initWithName:(id)a3 process:(id)a4 policy:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  FBSProcessAssertion *v15;
  FBSProcessAssertion *v16;
  uint64_t v17;
  NSString *name;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessAssertion initWithName:process:policy:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A719A50);
  }
  v12 = v11;
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EE3B9978) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(FBSProcess)]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessAssertion initWithName:process:policy:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A719AB4);
  }

  v13 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessAssertion initWithName:process:policy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A719B18);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessAssertion initWithName:process:policy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A719B7CLL);
  }

  v14 = v10;
  NSClassFromString(CFSTR("FBSProcessExecutionPolicy"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessAssertion initWithName:process:policy:].cold.3();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A719BE0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSProcessExecutionPolicyClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessAssertion initWithName:process:policy:].cold.3();
    goto LABEL_27;
  }

  v25.receiver = self;
  v25.super_class = (Class)FBSProcessAssertion;
  v15 = -[FBSProcessAssertion init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_policy, a5);
    objc_storeWeak((id *)&v16->_process, v12);
    v17 = objc_msgSend(v13, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

  }
  return v16;
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

- (BOOL)isActivated
{
  FBSProcessAssertion *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activationCount != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)activate
{
  FBSProcessExecutionPolicy *v3;
  FBSProcessAssertion *v4;
  unint64_t activationCount;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BKSProcessAssertion *assertion;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  FBSProcessAssertion *obj;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  FBSProcessAssertion *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_invalidated == NO"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v17;
      v45 = 2114;
      v46 = v19;
      v47 = 2048;
      v48 = obj;
      v49 = 2114;
      v50 = CFSTR("FBSProcessAssertion.m");
      v51 = 1024;
      v52 = 63;
      v53 = 2114;
      v54 = v14;
      _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    v20 = _bs_set_crash_log_message();
    _realizeSettingsExtension_cold_3(v20);
  }
  v3 = obj->_policy;
  NSClassFromString(CFSTR("FBSProcessExecutionPolicy"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v24;
      v45 = 2114;
      v46 = v26;
      v47 = 2048;
      v48 = obj;
      v49 = 2114;
      v50 = CFSTR("FBSProcessAssertion.m");
      v51 = 1024;
      v52 = 64;
      v53 = 2114;
      v54 = v21;
      _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    v27 = _bs_set_crash_log_message();
    _realizeSettingsExtension_cold_3(v27);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSProcessExecutionPolicyClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C81028];
    v30 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v31;
      v45 = 2114;
      v46 = v33;
      v47 = 2048;
      v48 = obj;
      v49 = 2114;
      v50 = CFSTR("FBSProcessAssertion.m");
      v51 = 1024;
      v52 = 64;
      v53 = 2114;
      v54 = v28;
      _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    v34 = _bs_set_crash_log_message();
    _realizeSettingsExtension_cold_3(v34);
  }

  v4 = obj;
  activationCount = obj->_activationCount;
  obj->_activationCount = activationCount + 1;
  if (!activationCount)
  {
    if (obj->_assertion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_assertion == nil"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = MEMORY[0x1E0C81028];
      v37 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v44 = v38;
        v45 = 2114;
        v46 = v40;
        v47 = 2048;
        v48 = obj;
        v49 = 2114;
        v50 = CFSTR("FBSProcessAssertion.m");
        v51 = 1024;
        v52 = 68;
        v53 = 2114;
        v54 = v35;
        _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
      v41 = _bs_set_crash_log_message();
      _realizeSettingsExtension_cold_3(v41);
    }
    v6 = objc_alloc(MEMORY[0x1E0CFE308]);
    WeakRetained = objc_loadWeakRetained((id *)&obj->_process);
    v8 = objc_msgSend(WeakRetained, "pid");
    -[FBSProcessExecutionPolicy strategy](obj->_policy, "strategy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "flags");
    -[FBSProcessExecutionPolicy strategy](obj->_policy, "strategy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "initWithPID:flags:reason:name:withHandler:", v8, v10, objc_msgSend(v11, "reason"), obj->_name, 0);
    assertion = obj->_assertion;
    obj->_assertion = (BKSProcessAssertion *)v12;

    v4 = obj;
  }
  objc_sync_exit(v4);

}

- (void)deactivate
{
  FBSProcessAssertion *v3;
  unint64_t activationCount;
  unint64_t v5;
  BKSProcessAssertion *assertion;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  FBSProcessAssertion *obj;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  FBSProcessAssertion *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  if (!obj->_invalidated)
  {
    activationCount = obj->_activationCount;
    if (!activationCount)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_activationCount > 0"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        *(_DWORD *)buf = 138544642;
        v16 = v10;
        v17 = 2114;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        v19 = 2048;
        v20 = obj;
        v21 = 2114;
        v22 = CFSTR("FBSProcessAssertion.m");
        v23 = 1024;
        v24 = 79;
        v25 = 2114;
        v26 = v7;
        _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v13 = _bs_set_crash_log_message();
      _realizeSettingsExtension_cold_3(v13);
    }
    v5 = activationCount - 1;
    obj->_activationCount = v5;
    if (!v5)
    {
      -[BKSProcessAssertion invalidate](obj->_assertion, "invalidate");
      assertion = obj->_assertion;
      obj->_assertion = 0;

      v3 = obj;
    }
  }
  objc_sync_exit(v3);

}

- (void)invalidate
{
  BKSProcessAssertion *assertion;
  FBSProcessAssertion *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_activationCount = 0;
  obj->_invalidated = 1;
  objc_storeWeak((id *)&obj->_process, 0);
  -[BKSProcessAssertion invalidate](obj->_assertion, "invalidate");
  assertion = obj->_assertion;
  obj->_assertion = 0;

  objc_sync_exit(obj);
}

- (NSString)description
{
  return (NSString *)-[FBSProcessAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  unint64_t activationCount;
  id v6;
  id v7;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  activationCount = self->_activationCount;
  if (activationCount > 1)
    v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:");
  else
    v6 = (id)objc_msgSend(v3, "appendBool:withName:", activationCount == 1, CFSTR("active"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  _QWORD v9[4];
  id v10;
  FBSProcessAssertion *v11;

  v4 = a3;
  -[FBSProcessAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__FBSProcessAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __61__FBSProcessAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "strategy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("strategy"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("bksAssertion"), 1);
}

- (FBSProcess)process
{
  return (FBSProcess *)objc_loadWeakRetained((id *)&self->_process);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (FBSProcessExecutionPolicy)policy
{
  return self->_policy;
}

- (unint64_t)activationCount
{
  return self->_activationCount;
}

- (BKSProcessAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_destroyWeak((id *)&self->_process);
  objc_storeStrong((id *)&self->_name, 0);
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

@end
