@implementation AMUIPosterUpdater

+ (id)defaultUpdater
{
  if (defaultUpdater_onceToken != -1)
    dispatch_once(&defaultUpdater_onceToken, &__block_literal_global_4);
  return (id)defaultUpdater_defaultUpdater;
}

void __35__AMUIPosterUpdater_defaultUpdater__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultUpdater_defaultUpdater;
  defaultUpdater_defaultUpdater = v0;

}

- (AMUIPosterUpdater)init
{
  AMUIPosterUpdater *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterUpdater;
  result = -[AMUIPosterUpdater init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (BOOL)updateInfograph:(id)a3 forPosterConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  _AMUIPosterUpdate *v16;
  void *v17;
  void *v18;
  _AMUIPosterUpdate *v19;
  os_unfair_lock_s *p_lock;
  _AMUIPosterUpdate **p_lock_pendingInfographConfigurationUpdate;
  _AMUIPosterUpdate *lock_pendingInfographConfigurationUpdate;
  BOOL v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  _AMUIPosterUpdate *v28;
  _AMUIPosterUpdate *v29;
  _AMUIPosterUpdate *v30;
  _AMUIPosterUpdate *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  v11 = v8;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2360185D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x236018638);
  }

  v12 = v9;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x23601869CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x236018700);
  }

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("completion"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x236018764);
  }
  objc_msgSend(v12, "pr_loadAmbientWidgetLayoutWithError:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widgetLayoutIconState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v11);

  if (v15)
  {
    v10[2](v10, v12, 0);
  }
  else
  {
    v16 = [_AMUIPosterUpdate alloc];
    objc_msgSend(MEMORY[0x24BE74C50], "posterUpdateAmbientWidgets:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = CFSTR("infograph");
    v39[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_AMUIPosterUpdate initWithPosterConfiguration:update:userInfo:](v16, "initWithPosterConfiguration:update:userInfo:", v12, v17, v18);

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_inflightInfographConfigurationUpdate)
    {
      lock_pendingInfographConfigurationUpdate = self->_lock_pendingInfographConfigurationUpdate;
      p_lock_pendingInfographConfigurationUpdate = &self->_lock_pendingInfographConfigurationUpdate;
      if (lock_pendingInfographConfigurationUpdate)
      {
        v23 = -[_AMUIPosterUpdate isEqual:](v19, "isEqual:");
        AMUILogInfograph();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        if (v23)
        {
          if (v25)
            -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.6();

          -[_AMUIPosterUpdate appendCompletion:](*p_lock_pendingInfographConfigurationUpdate, "appendCompletion:", v10);
        }
        else
        {
          if (v25)
            -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.7();

          v28 = *p_lock_pendingInfographConfigurationUpdate;
          v29 = v19;
          v30 = *p_lock_pendingInfographConfigurationUpdate;
          *p_lock_pendingInfographConfigurationUpdate = v29;
          v31 = v28;

          -[_AMUIPosterUpdate adoptCompletionsFromStaleUpdate:](v29, "adoptCompletionsFromStaleUpdate:", v31);
          -[_AMUIPosterUpdate cancel](v31, "cancel");

        }
      }
      else
      {
        AMUILogInfograph();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.5();

        objc_storeStrong((id *)p_lock_pendingInfographConfigurationUpdate, v19);
      }
    }
    else
    {
      -[_AMUIPosterUpdate appendCompletion:](v19, "appendCompletion:", v10);
      AMUILogInfograph();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[AMUIPosterUpdater updateInfograph:forPosterConfiguration:completion:].cold.4();

      -[AMUIPosterUpdater _lock_fireInfographUpdate:](self, "_lock_fireInfographUpdate:", v19);
    }
    os_unfair_lock_unlock(p_lock);

  }
  return 1;
}

- (void)_clearInflightAndFireNextRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Clear and fire next infograph Update.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_lock_fireInfographUpdate:(id)a3
{
  id v6;
  NSObject *v7;
  PRSService *lock_service;
  PRSService *v9;
  PRSService *v10;
  PRSService *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  if (self->_lock_inflightInfographConfigurationUpdate)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_inflightInfographConfigurationUpdate == nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater _lock_fireInfographUpdate:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_inflightInfographConfigurationUpdate, a3);
    AMUILogInfograph();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AMUIPosterUpdater _lock_fireInfographUpdate:].cold.1();

    lock_service = self->_lock_service;
    if (v6)
    {
      if (!lock_service)
      {
        v9 = (PRSService *)objc_opt_new();
        v10 = self->_lock_service;
        self->_lock_service = v9;

      }
      objc_initWeak(&location, self);
      v11 = self->_lock_service;
      objc_msgSend(v6, "posterConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "update");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke;
      v15[3] = &unk_250763760;
      objc_copyWeak(&v17, &location);
      v16 = v6;
      -[PRSService updatePosterConfiguration:update:completion:](v11, "updatePosterConfiguration:update:completion:", v12, v13, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_lock_service = 0;

    }
  }
}

void __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  AMUILogInfograph();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11)
      __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_2((uint64_t)v9, v10);
  }
  else if (v11)
  {
    __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_1((uint64_t)v7, (uint64_t)v8, v10);
  }

  objc_copyWeak(&v15, (id *)(a1 + 40));
  v12 = v9;
  v13 = *(id *)(a1 + 32);
  v14 = v7;
  BSDispatchMain();

  objc_destroyWeak(&v15);
}

uint64_t __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_clearInflightAndFireNextRequest");

  return objc_msgSend(*(id *)(a1 + 40), "fireCompletionBlocksWithUpdatedPosterConfiguration:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendingInfographConfigurationUpdate, 0);
  objc_storeStrong((id *)&self->_lock_inflightInfographConfigurationUpdate, 0);
  objc_storeStrong((id *)&self->_lock_service, 0);
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.1()
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

  OUTLINED_FUNCTION_8();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_23600A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.2()
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

  OUTLINED_FUNCTION_8();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_23600A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.3()
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

  OUTLINED_FUNCTION_8();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_23600A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Infograph Update - Just update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Infograph Update - Something updating, put in pending", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Infograph Update - same as pending, append completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateInfograph:forPosterConfiguration:completion:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Infograph Update - Squeeze out pending to become pending", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_lock_fireInfographUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_23600A000, v0, v1, "Fire infograph update.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_lock_fireInfographUpdate:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_23600A000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

void __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_23600A000, log, OS_LOG_TYPE_ERROR, "Successfully updated infograph configuration:%@ with update:%@", (uint8_t *)&v3, 0x16u);
}

void __47__AMUIPosterUpdater__lock_fireInfographUpdate___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23600A000, a2, OS_LOG_TYPE_ERROR, "Failed to update infograph configuration with error:%@", (uint8_t *)&v2, 0xCu);
}

@end
