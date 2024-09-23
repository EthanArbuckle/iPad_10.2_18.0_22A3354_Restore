@implementation ACHXPCScheduler

- (ACHXPCScheduler)initWithName:(id)a3 performHandler:(id)a4
{
  id v7;
  id v8;
  ACHXPCScheduler *v9;
  ACHXPCScheduler *v10;
  uint64_t v11;
  NSString *lastSuccessfulRunDateKey;
  uint64_t v13;
  id performHandler;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ACHXPCScheduler;
  v9 = -[ACHXPCScheduler init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ACHXPCScheduler_%@_lastSuccessfulRunDate"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
    lastSuccessfulRunDateKey = v10->_lastSuccessfulRunDateKey;
    v10->_lastSuccessfulRunDateKey = (NSString *)v11;

    v13 = objc_msgSend(v8, "copy");
    performHandler = v10->_performHandler;
    v10->_performHandler = (id)v13;

    v10->_lock._os_unfair_lock_opaque = 0;
    -[ACHXPCScheduler _registerActivity](v10, "_registerActivity");
  }

  return v10;
}

- (void)setLastSuccessfulRunDate:(id)a3
{
  NSDate *v4;
  os_unfair_lock_s *p_lock;
  NSDate *lastSuccessfulRunDate;
  NSDate *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v4 = (NSDate *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
  self->_lastSuccessfulRunDate = v4;
  v7 = v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](self->_lastSuccessfulRunDate, "timeIntervalSinceReferenceDate");
  v10 = v9;

  -[ACHXPCScheduler lastSuccessfulRunDateKey](self, "lastSuccessfulRunDateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDouble:forKey:", v11, v10);

  os_unfair_lock_unlock(p_lock);
}

- (NSDate)lastSuccessfulRunDate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSDate *v8;
  NSDate *lastSuccessfulRunDate;
  NSDate *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lastSuccessfulRunDate)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHXPCScheduler lastSuccessfulRunDateKey](self, "lastSuccessfulRunDateKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleForKey:", v5);
    v7 = v6;

    if (v7 <= 0.0)
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    else
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v7);
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastSuccessfulRunDate = self->_lastSuccessfulRunDate;
    self->_lastSuccessfulRunDate = v8;

  }
  v10 = self->_lastSuccessfulRunDate;
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)_registerActivity
{
  xpc_object_t v3;
  id v4;
  const char *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6C0], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
  objc_initWeak(&location, self);
  -[ACHXPCScheduler name](self, "name");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__ACHXPCScheduler__registerActivity__block_invoke;
  v6[3] = &unk_24D13B4E0;
  objc_copyWeak(&v7, &location);
  xpc_activity_register(v5, v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __36__ACHXPCScheduler__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x2199C8FE0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleXPCActivityCallback:", v5);

  objc_autoreleasePoolPop(v3);
}

- (void)_handleXPCActivityCallback:(id)a3
{
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (_xpc_activity_s *)a3;
  state = xpc_activity_get_state(v4);
  ACHLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (state)
  {
    if (v7)
    {
      -[ACHXPCScheduler name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity for %{public}@ requested perform.", (uint8_t *)&v10, 0xCu);

    }
    -[ACHXPCScheduler _performActivity:](self, "_performActivity:", v4);
  }
  else
  {
    if (v7)
    {
      -[ACHXPCScheduler name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity for %{public}@ checked in.", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)_performActivity:(id)a3
{
  _xpc_activity_s *v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  _QWORD v10[5];
  _xpc_activity_s *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (_xpc_activity_s *)a3;
  v5 = xpc_activity_set_state(v4, 4);
  ACHLogXPC();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHXPCScheduler name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Performing activity for %{public}@", buf, 0xCu);

    }
    -[ACHXPCScheduler performHandler](self, "performHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __36__ACHXPCScheduler__performActivity___block_invoke;
    v10[3] = &unk_24D13B508;
    v10[4] = self;
    v11 = v4;
    ((void (**)(_QWORD, _QWORD *))v9)[2](v9, v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHXPCScheduler _performActivity:].cold.1(self);

  }
}

uint64_t __36__ACHXPCScheduler__performActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletionResult:error:activity:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)_handleCompletionResult:(BOOL)a3 error:(id)a4 activity:(id)a5
{
  _BOOL4 v6;
  id v8;
  _xpc_activity_s *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a3;
  v8 = a4;
  v9 = (_xpc_activity_s *)a5;
  if (v6)
  {
    if ((xpc_activity_set_completion_status() & 1) == 0)
    {
      ACHLogXPC();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ACHXPCScheduler _handleCompletionResult:error:activity:].cold.1(self);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    -[ACHXPCScheduler setLastSuccessfulRunDate:](self, "setLastSuccessfulRunDate:", v11);
  }
  else
  {
    ACHLogXPC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACHXPCScheduler _handleCompletionResult:error:activity:].cold.4(self, (uint64_t)v8, v12);

    if (xpc_activity_should_defer(v9))
    {
      if (xpc_activity_set_state(v9, 3))
        goto LABEL_8;
      ACHLogXPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ACHXPCScheduler _handleCompletionResult:error:activity:].cold.2(self);
    }
    else
    {
      if ((xpc_activity_set_completion_status() & 1) != 0)
        goto LABEL_8;
      ACHLogXPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ACHXPCScheduler _handleCompletionResult:error:activity:].cold.1(self);
    }
  }

LABEL_8:
}

- (void)synthesizeActivityFireWithCompletion:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[ACHXPCScheduler performHandler](self, "performHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (NSString)name
{
  return self->_name;
}

- (NSString)lastSuccessfulRunDateKey
{
  return self->_lastSuccessfulRunDateKey;
}

- (id)performHandler
{
  return self->_performHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performHandler, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulRunDateKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulRunDate, 0);
}

- (void)_performActivity:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21407B000, v2, v3, "Failed to continue activity for %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCompletionResult:(void *)a1 error:activity:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21407B000, v2, v3, "Unable to finish activity for %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCompletionResult:(void *)a1 error:activity:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_21407B000, v2, v3, "Unable to defer activity for %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_handleCompletionResult:(void *)a1 error:(uint64_t)a2 activity:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_21407B000, a3, OS_LOG_TYPE_ERROR, "Activity for %{public}@ was not successful and returned error %{public}@", v6, 0x16u);

}

@end
