@implementation FBSSceneActivitySession

- (FBSSceneActivitySession)initWithName:(id)a3 scene:(id)a4 executionPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  FBSSceneActivitySession *v15;
  uint64_t v16;
  NSString *name;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  FBSProcessExecutionPolicy *executionPolicy;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  NSClassFromString(CFSTR("NSString"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A714538);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A71459CLL);
  }

  v12 = v9;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A714600);
  }
  v13 = v12;
  if ((objc_msgSend(v12, "conformsToProtocol:", &unk_1EE3B2308) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(FBSSceneHandle)]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A714664);
  }

  v14 = v10;
  NSClassFromString(CFSTR("FBSProcessExecutionPolicy"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:].cold.3();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A7146C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSProcessExecutionPolicyClass]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneActivitySession initWithName:scene:executionPolicy:].cold.3();
    goto LABEL_27;
  }

  v15 = -[FBSSceneActivitySession init](self, "init");
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    name = v15->_name;
    v15->_name = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v20;

    objc_storeWeak((id *)&v15->_scene, v13);
    v22 = objc_msgSend(v14, "copy");
    executionPolicy = v15->_executionPolicy;
    v15->_executionPolicy = (FBSProcessExecutionPolicy *)v22;

  }
  return v15;
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
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (id)errorHandler
{
  FBSSceneActivitySession *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x19AECA324](v2->_errorHandler);
  objc_sync_exit(v2);

  return v3;
}

- (void)setErrorHandler:(id)a3
{
  FBSSceneActivitySession *v4;
  uint64_t v5;
  id errorHandler;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_errorHandler != v7)
  {
    v5 = objc_msgSend(v7, "copy");
    errorHandler = v4->_errorHandler;
    v4->_errorHandler = (id)v5;

  }
  objc_sync_exit(v4);

}

- (BOOL)_isValid
{
  FBSSceneActivitySession *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_open && !v2->_invalidated;
  objc_sync_exit(v2);

  return v3;
}

- (void)open
{
  FBSSceneActivitySession *v2;
  id WeakRetained;
  void *v4;
  int v5;
  uint64_t v6;
  FBSProcessAssertion *v7;
  FBSProcessAssertion *assertion;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  FBSProcessWatchdog *v14;
  FBSProcessWatchdog *watchdog;
  FBSProcessWatchdog *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  BOOL (*v20)(uint64_t, _BOOL8, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!*(_WORD *)&v2->_open)
  {
    v2->_open = 1;
    WeakRetained = objc_loadWeakRetained((id *)&v2->_scene);
    objc_msgSend(WeakRetained, "clientProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pid");
    if (v5 == getpid())
    {
      objc_msgSend(WeakRetained, "hostProcess");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    objc_storeWeak((id *)&v2->_process, v4);
    if (v4)
    {
      if (v2->_executionPolicy)
      {
        v7 = -[FBSProcessAssertion initWithName:process:policy:]([FBSProcessAssertion alloc], "initWithName:process:policy:", v2->_name, v4, v2->_executionPolicy);
        assertion = v2->_assertion;
        v2->_assertion = v7;

        -[FBSProcessAssertion activate](v2->_assertion, "activate");
        -[FBSProcessExecutionPolicy provisions](v2->_executionPolicy, "provisions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          objc_msgSend(WeakRetained, "callOutQueue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, v2);
          -[FBSProcessExecutionPolicy provisions](v2->_executionPolicy, "provisions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[FBSProcessWatchdogPolicy policyWithProvisions:](FBSProcessWatchdogPolicy, "policyWithProvisions:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = -[FBSProcessWatchdog initWithName:process:policy:]([FBSProcessWatchdog alloc], "initWithName:process:policy:", v2->_name, v4, v13);
          watchdog = v2->_watchdog;
          v2->_watchdog = v14;

          v16 = v2->_watchdog;
          v18 = MEMORY[0x1E0C809B0];
          v19 = 3221225472;
          v20 = __31__FBSSceneActivitySession_open__block_invoke;
          v21 = &unk_1E38EC1D0;
          objc_copyWeak(&v24, &location);
          v17 = v11;
          v22 = v17;
          v23 = WeakRetained;
          -[FBSProcessWatchdog setCompletion:](v16, "setCompletion:", &v18);
          -[FBSProcessWatchdog activate](v2->_watchdog, "activate", v18, v19, v20, v21);

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);

        }
      }
    }

  }
  objc_sync_exit(v2);

}

BOOL __31__FBSSceneActivitySession_open__block_invoke(uint64_t a1, _BOOL8 a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (a2)
  {
    if (objc_msgSend(WeakRetained, "_isValid"))
    {
      objc_msgSend(v7, "errorHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AECA324]();

    }
    else
    {
      v9 = 0;
    }
    a2 = v9 != 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", CFSTR("An execution provision was violated during the session."), *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v5, "localizedFailureReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bs_setSafeObject:forKey:", v11, *MEMORY[0x1E0CB2D68]);

      objc_msgSend(v10, "bs_setSafeObject:forKey:", v5, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v10, "bs_setSafeObject:forKey:", v7, CFSTR("FBSSceneActivitySession"));
      objc_msgSend(v5, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("FBSProcessExecutionProvision"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bs_setSafeObject:forKey:", v13, CFSTR("FBSProcessExecutionProvision"));

      objc_msgSend(v5, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("FBSProcessTerminationRequest"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bs_setSafeObject:forKey:", v15, CFSTR("FBSProcessTerminationRequest"));

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSSceneActivitySessionErrorDomain"), 2, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v9)[2](v9, v16);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __31__FBSSceneActivitySession_open__block_invoke_2;
    v19[3] = &unk_1E38EAE08;
    v17 = *(void **)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v21 = v7;
    objc_msgSend(v17, "performAsync:", v19);

  }
  return a2;
}

uint64_t __31__FBSSceneActivitySession_open__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeSession:", *(_QWORD *)(a1 + 40));
}

- (void)close
{
  FBSProcessWatchdog *watchdog;
  FBSProcessAssertion *assertion;
  id errorHandler;
  FBSSceneActivitySession *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_open)
  {
    obj->_open = 0;
    objc_storeWeak((id *)&obj->_process, 0);
    -[FBSProcessWatchdog deactivate](obj->_watchdog, "deactivate");
    -[FBSProcessWatchdog invalidate](obj->_watchdog, "invalidate");
    watchdog = obj->_watchdog;
    obj->_watchdog = 0;

    -[FBSProcessAssertion deactivate](obj->_assertion, "deactivate");
    -[FBSProcessAssertion invalidate](obj->_assertion, "invalidate");
    assertion = obj->_assertion;
    obj->_assertion = 0;

    errorHandler = obj->_errorHandler;
    obj->_errorHandler = 0;

  }
  objc_sync_exit(obj);

}

- (void)invalidate
{
  FBSSceneActivitySession *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_invalidated)
  {
    v2->_invalidated = 1;
    if (v2->_open)
    {
      -[FBSSceneActivitySession errorHandler](v2, "errorHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bs_setSafeObject:forKey:", CFSTR("The session was unexpectedly interrupted."), *MEMORY[0x1E0CB2D50]);
        objc_msgSend(v4, "bs_setSafeObject:forKey:", v2, CFSTR("FBSSceneActivitySession"));
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FBSSceneActivitySessionErrorDomain"), 1, v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_get_global_queue(33, 0);
        v6 = objc_claimAutoreleasedReturnValue();
        v8 = MEMORY[0x1E0C809B0];
        v9 = 3221225472;
        v10 = __37__FBSSceneActivitySession_invalidate__block_invoke;
        v11 = &unk_1E38EB888;
        v12 = v5;
        v13 = v3;
        v7 = v5;
        dispatch_async(v6, &v8);

      }
      -[FBSSceneActivitySession close](v2, "close", v8, v9, v10, v11);

    }
  }
  objc_sync_exit(v2);

}

uint64_t __37__FBSSceneActivitySession_invalidate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSString)description
{
  return (NSString *)-[FBSSceneActivitySession descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneActivitySession succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_name, CFSTR("name"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("sceneID"));

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_open, CFSTR("open"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSSceneActivitySession descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  FBSSceneActivitySession *v11;

  v4 = a3;
  -[FBSSceneActivitySession succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__FBSSceneActivitySession_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __65__FBSSceneActivitySession_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id WeakRetained;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("identifier"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("process"));

  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("executionPolicy"));
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v7 + 64))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("assertion"));

    v7 = *(_QWORD *)(a1 + 40);
  }
  v11 = WeakRetained;
  if (*(_QWORD *)(v7 + 72))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "appendObject:withName:", v13, CFSTR("watchdog"));

    v11 = WeakRetained;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FBSSceneHandle)scene
{
  return (FBSSceneHandle *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (FBSProcessExecutionPolicy)executionPolicy
{
  return self->_executionPolicy;
}

- (void)setExecutionPolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isOpen
{
  return self->_open;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_process);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_executionPolicy, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:scene:executionPolicy:.cold.1()
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

- (void)initWithName:scene:executionPolicy:.cold.2()
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

- (void)initWithName:scene:executionPolicy:.cold.3()
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
