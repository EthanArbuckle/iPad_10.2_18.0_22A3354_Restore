@implementation FMXPCActivity

- (FMXPCActivity)initWithName:(id)a3 qos:(unsigned int)a4 criteriaBlock:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  FMXPCActivity *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  FMQueueSynchronizer *v18;
  FMQueueSynchronizer *queueSynchronizer;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  id criteriaBlock;
  uint64_t v24;
  id handlerBlock;
  objc_super v27;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v27.receiver = self;
  v27.super_class = (Class)FMXPCActivity;
  v12 = -[FMXPCActivity init](&v27, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FMXPCActivity-%@"), v9);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v16;

    v18 = -[FMQueueSynchronizer initWithQueue:]([FMQueueSynchronizer alloc], "initWithQueue:", v12->_queue);
    queueSynchronizer = v12->_queueSynchronizer;
    v12->_queueSynchronizer = v18;

    v12->lock._os_unfair_lock_opaque = 0;
    v20 = objc_msgSend(v9, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v20;

    v22 = MEMORY[0x1AF455734](v10);
    criteriaBlock = v12->_criteriaBlock;
    v12->_criteriaBlock = (id)v22;

    v24 = MEMORY[0x1AF455734](v11);
    handlerBlock = v12->_handlerBlock;
    v12->_handlerBlock = (id)v24;

    -[FMXPCActivity register](v12, "register");
  }

  return v12;
}

- (BOOL)shouldDefer
{
  _xpc_activity_s *v2;
  _xpc_activity_s *v3;
  BOOL should_defer;
  NSObject *v5;

  -[FMXPCActivity _getActivity](self, "_getActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    should_defer = xpc_activity_should_defer(v2);
  }
  else
  {
    LogCategory_FMXPCActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FMXPCActivity shouldDefer].cold.1();

    should_defer = 0;
  }

  return should_defer;
}

- (BOOL)defer
{
  _xpc_activity_s *v2;
  _xpc_activity_s *v3;
  BOOL v4;
  NSObject *v5;

  -[FMXPCActivity _getActivity](self, "_getActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = xpc_activity_set_state(v2, 3);
  }
  else
  {
    LogCategory_FMXPCActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FMXPCActivity defer].cold.1();

    v4 = 0;
  }

  return v4;
}

- (BOOL)continue
{
  _xpc_activity_s *v2;
  _xpc_activity_s *v3;
  BOOL v4;
  NSObject *v5;

  -[FMXPCActivity _getActivity](self, "_getActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = xpc_activity_set_state(v2, 4);
  }
  else
  {
    LogCategory_FMXPCActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FMXPCActivity continue].cold.1();

    v4 = 0;
  }

  return v4;
}

- (BOOL)done
{
  _xpc_activity_s *v2;
  _xpc_activity_s *v3;
  BOOL v4;
  NSObject *v5;

  -[FMXPCActivity _getActivity](self, "_getActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = xpc_activity_set_state(v2, 5);
  }
  else
  {
    LogCategory_FMXPCActivity();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FMXPCActivity done].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)getCriteria
{
  _xpc_activity_s *v2;
  _xpc_activity_s *v3;
  FMXPCActivityCriteria *v4;
  FMXPCActivityCriteria *v5;
  NSObject *v6;
  NSObject *v7;

  -[FMXPCActivity _getActivity](self, "_getActivity");
  v2 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (FMXPCActivityCriteria *)xpc_activity_copy_criteria(v2);
    v5 = v4;
    if (v4)
      v4 = -[FMXPCActivityCriteria initWithXPCObject:]([FMXPCActivityCriteria alloc], "initWithXPCObject:", v4);
    v6 = v4;

    v7 = v6;
  }
  else
  {
    LogCategory_FMXPCActivity();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FMXPCActivity getCriteria].cold.1();
    v7 = 0;
  }

  return v7;
}

- (void)updateCriteria
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  FMXPCActivity *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  LogCategory_FMXPCActivity();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_1AEA5C000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: updateCriteria called on FMXPCActivity", (uint8_t *)&v11, 0xCu);
  }

  -[FMXPCActivity _getActivity](self, "_getActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FMXPCActivity updateCriteriaForActivity:](self, "updateCriteriaForActivity:", v5);
  }
  else
  {
    v6 = -[FMXPCActivity checkedInAtLeastOnce](self, "checkedInAtLeastOnce");
    LogCategory_FMXPCActivity();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        -[FMXPCActivity name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_1AEA5C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No current activity -- re-registering: %{public}@", (uint8_t *)&v11, 0x16u);

      }
      -[FMXPCActivity register](self, "register");
    }
    else
    {
      if (v8)
      {
        -[FMXPCActivity name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v10;
        _os_log_impl(&dword_1AEA5C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No current activity -- hasn't checked in yet: %{public}@", (uint8_t *)&v11, 0x16u);

      }
    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)register
{
  void *v3;
  _QWORD v4[5];

  -[FMXPCActivity queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__FMXPCActivity_register__block_invoke;
  v4[3] = &unk_1E5E0DE90;
  v4[4] = self;
  objc_msgSend(v3, "conditionalSync:", v4);

}

void __25__FMXPCActivity_register__block_invoke(uint64_t a1)
{
  id v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __25__FMXPCActivity_register__block_invoke_2;
  v8 = &unk_1E5E0E6D8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(*(id *)(a1 + 32), "setRegistrationBlock:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "name", v5, v6, v7, v8);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  objc_msgSend(*(id *)(a1 + 32), "registrationBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_activity_register(v3, (xpc_object_t)*MEMORY[0x1E0C80748], v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__FMXPCActivity_register__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "activityHandler:", v3);

}

- (void)activityHandler:(id)a3
{
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  _xpc_activity_s *v7;

  v7 = (_xpc_activity_s *)a3;
  state = xpc_activity_get_state(v7);
  if (state)
  {
    v5 = state;
    -[FMXPCActivity handlerBlock](self, "handlerBlock");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, FMXPCActivity *, xpc_activity_state_t))v6)[2](v6, self, v5);

  }
  else
  {
    -[FMXPCActivity processCheckin:](self, "processCheckin:", v7);
  }

}

- (void)processCheckin:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  int64_t v6;
  void (**v7)(id, FMXPCActivity *, int64_t);

  p_lock = &self->lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FMXPCActivity setActivity:](self, "setActivity:", v5);
  -[FMXPCActivity setCheckedInAtLeastOnce:](self, "setCheckedInAtLeastOnce:", 1);
  v6 = -[FMXPCActivity updateCriteriaForActivity:](self, "updateCriteriaForActivity:", v5);

  os_unfair_lock_unlock(p_lock);
  -[FMXPCActivity handlerBlock](self, "handlerBlock");
  v7 = (void (**)(id, FMXPCActivity *, int64_t))objc_claimAutoreleasedReturnValue();
  v7[2](v7, self, v6);

}

- (id)_getActivity
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[FMXPCActivity queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__FMXPCActivity__getActivity__block_invoke;
  v6[3] = &unk_1E5E0DD78;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "conditionalSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__FMXPCActivity__getActivity__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)updateCriteriaForActivity:(id)a3
{
  _xpc_activity_s *v4;
  xpc_object_t v5;
  FMXPCActivityCriteria *v6;
  void (**v7)(_QWORD, _QWORD);
  FMXPCActivityCriteria *v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  FMXPCActivityCriteria *v12;
  NSObject *v13;
  const char *v14;
  int64_t v15;
  void *v16;
  int v18;
  FMXPCActivity *v19;
  __int16 v20;
  FMXPCActivityCriteria *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (_xpc_activity_s *)a3;
  v5 = xpc_activity_copy_criteria(v4);
  if (v5)
    v6 = -[FMXPCActivityCriteria initWithXPCObject:]([FMXPCActivityCriteria alloc], "initWithXPCObject:", v5);
  else
    v6 = 0;
  -[FMXPCActivity criteriaBlock](self, "criteriaBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, FMXPCActivityCriteria *))v7)[2](v7, v6);
  v8 = (FMXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v8)
    {
      v9 = -[FMXPCActivityCriteria isEqual:](v6, "isEqual:", v8);
      LogCategory_FMXPCActivity();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          -[FMXPCActivityCriteria debugDescription](v8, "debugDescription");
          v12 = (FMXPCActivityCriteria *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = self;
          v20 = 2114;
          v21 = v12;
          _os_log_impl(&dword_1AEA5C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Keeping existing criteria for: %{public}@", (uint8_t *)&v18, 0x16u);

        }
        goto LABEL_20;
      }
      if (v11)
      {
        v18 = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1AEA5C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Existing criteria: %{public}@", (uint8_t *)&v18, 0x16u);
      }

      LogCategory_FMXPCActivity();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = v8;
        v14 = "%{public}@: Registering updated criteria: %{public}@";
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
  else if (v8)
  {
    LogCategory_FMXPCActivity();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      v14 = "%{public}@: Registering new criteria: %{public}@";
LABEL_18:
      _os_log_impl(&dword_1AEA5C000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0x16u);
    }
LABEL_19:

    -[FMXPCActivityCriteria xpcDictionary](v8, "xpcDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(v4, v16);

LABEL_20:
    v15 = 3;
    goto LABEL_21;
  }
  -[FMXPCActivity unregister](self, "unregister");
  v15 = 5;
LABEL_21:

  return v15;
}

- (void)unregister
{
  void *v3;
  _QWORD v4[5];

  -[FMXPCActivity queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__FMXPCActivity_unregister__block_invoke;
  v4[3] = &unk_1E5E0DE90;
  v4[4] = self;
  objc_msgSend(v3, "conditionalSync:", v4);

}

void __27__FMXPCActivity_unregister__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_activity_unregister((const char *)objc_msgSend(v2, "UTF8String"));

  objc_msgSend(*(id *)(a1 + 32), "setRegistrationBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setActivity:", 0);
  LogCategory_FMXPCActivity();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1AEA5C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Unregistered criteria", (uint8_t *)&v5, 0xCu);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_queueSynchronizer, a3);
}

- (id)criteriaBlock
{
  return self->_criteriaBlock;
}

- (void)setCriteriaBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_xpc_object)activity
{
  return (OS_xpc_object *)objc_loadWeakRetained((id *)&self->_activity);
}

- (void)setActivity:(id)a3
{
  objc_storeWeak((id *)&self->_activity, a3);
}

- (BOOL)checkedInAtLeastOnce
{
  return self->_checkedInAtLeastOnce;
}

- (void)setCheckedInAtLeastOnce:(BOOL)a3
{
  self->_checkedInAtLeastOnce = a3;
}

- (id)registrationBlock
{
  return self->_registrationBlock;
}

- (void)setRegistrationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registrationBlock, 0);
  objc_destroyWeak((id *)&self->_activity);
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong(&self->_criteriaBlock, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)shouldDefer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "%{public}@: shouldDefer called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)defer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "%{public}@: defer called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)continue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "%{public}@: continue called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)done
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "%{public}@: done called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getCriteria
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA5C000, v0, v1, "%{public}@: getCriteria called on invalidated FMXPCActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
