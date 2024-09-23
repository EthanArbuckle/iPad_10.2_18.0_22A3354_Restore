@implementation DNDSAppFocusConfigurationTask

- (DNDSAppFocusConfigurationTask)initWithAction:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  DNDSAppFocusConfigurationTask *v9;
  DNDSAppFocusConfigurationTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSAppFocusConfigurationTask;
  v9 = -[DNDSAppFocusConfigurationTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (NSUUID)taskIdentifier
{
  void *v2;
  void *v3;

  -[DNDSAppFocusConfigurationTask _executorCreatingIfNeeded](self, "_executorCreatingIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)prepareWithCompletion:(id)a3
{
  void *v4;
  id completion;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copy");
  completion = self->_completion;
  self->_completion = v4;

  v6 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[DNDSAppFocusConfigurationTask taskIdentifier](self, "taskIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor connection](self->_executor, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor action](self->_executor, "action");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Task id=%{public}@ Preparing action on %{public}@; action=%{public}@",
      (uint8_t *)&v12,
      0x20u);

  }
}

- (void)execute
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[DNDSAppFocusConfigurationTask taskIdentifier](self, "taskIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor connection](self->_executor, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNActionExecutor action](self->_executor, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Task id=%{public}@ Executing prepared action on %{public}@; action=%{public}@",
      (uint8_t *)&v10,
      0x20u);

  }
  -[DNDSAppFocusConfigurationTask _executorCreatingIfNeeded](self, "_executorCreatingIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "perform");

}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**completion)(id, DNDSAppFocusConfigurationTask *, id, id);
  void *v18;
  NSObject *log;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    -[DNDSAppFocusConfigurationTask taskIdentifier](self, "taskIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v21 = v18;
    v22 = 2114;
    v23 = v13;
    v24 = 2114;
    v25 = v15;
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v16;
    _os_log_impl(&dword_1CB895000, log, OS_LOG_TYPE_DEFAULT, "Task id=%{public}@ completed action execution %{public}@:%{public}@; result=%{public}@ error=%{public}@",
      buf,
      0x34u);

  }
  completion = (void (**)(id, DNDSAppFocusConfigurationTask *, id, id))self->_completion;
  if (completion)
    completion[2](completion, self, v9, v10);

}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT))
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:].cold.1();
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected callback: %@; request=%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppFocusConfigurationTask _malformedIntentErrorWithMessage:](self, "_malformedIntentErrorWithMessage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v10);

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT))
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:].cold.1();
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected callback: %@; request=%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppFocusConfigurationTask _malformedIntentErrorWithMessage:](self, "_malformedIntentErrorWithMessage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v10);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT))
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:].cold.1();
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected callback: %@; request=%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppFocusConfigurationTask _malformedIntentErrorWithMessage:](self, "_malformedIntentErrorWithMessage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v10);

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_FAULT))
    -[DNDSAppFocusConfigurationTask executor:needsConfirmationWithRequest:].cold.1();
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected callback: %@; request=%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppFocusConfigurationTask _malformedIntentErrorWithMessage:](self, "_malformedIntentErrorWithMessage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "respondWithError:", v10);

}

- (id)_executorCreatingIfNeeded
{
  LNActionExecutor *executor;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  LNActionExecutor *v17;
  LNActionExecutor *v18;
  void *v19;
  LNAction *v20;
  NSString *v21;
  void *v22;
  NSString *bundleIdentifier;
  LNAction *action;
  uint64_t v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  executor = self->_executor;
  if (executor)
    return executor;
  _DNDSContainingBundleIdentifier(self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D44200]);
  -[LNAction identifier](self->_action, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "actionForBundleIdentifier:andActionIdentifier:error:", v4, v6, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  v10 = !v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D44188], "policyWithActionMetadata:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v27 = 0;
    -[NSObject connectionWithError:](v11, "connectionWithError:", &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    -[LNAction parameters](self->_action, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject actionWithParameters:](v11, "actionWithParameters:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "actionWithOpenWhenRun:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 || !v12)
    {
      v22 = (void *)DNDSLogAppFocusConfiguration;
      if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      action = self->_action;
      v16 = v22;
      -[LNAction identifier](action, "identifier");
      v26 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      v31 = 2114;
      v32 = bundleIdentifier;
      v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1CB895000, v16, OS_LOG_TYPE_ERROR, "Failed to create connection for task with actionIdentifier:%{public}@ applicationIdentifier:%{public}@ error=%{public}@", buf, 0x20u);
      v18 = (LNActionExecutor *)v26;
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D440F8]);
      objc_msgSend(v12, "executorForAction:options:delegate:", v15, v16, self);
      v17 = (LNActionExecutor *)objc_claimAutoreleasedReturnValue();
      v18 = self->_executor;
      self->_executor = v17;
    }

LABEL_16:
    goto LABEL_17;
  }
  v19 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
  {
    v20 = self->_action;
    v11 = v19;
    -[LNAction identifier](v20, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138543874;
    v30 = (uint64_t)v12;
    v31 = 2114;
    v32 = v21;
    v33 = 2114;
    v34 = v8;
    _os_log_error_impl(&dword_1CB895000, v11, OS_LOG_TYPE_ERROR, "Failed to get action metadata for task with actionIdentifier:%{public}@ applicationIdentifier:%{public}@ error=%{public}@", buf, 0x20u);
LABEL_17:

  }
  if (!v10)
    return 0;
  executor = self->_executor;
  return executor;
}

- (id)_malformedIntentErrorWithMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0D1D3E0];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 1009, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)executor:needsConfirmationWithRequest:.cold.1()
{
  void *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(v1);
  v2 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1CB895000, v4, v5, "Unexpected callback: %{public}@; request=%{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);

  OUTLINED_FUNCTION_1_1();
}

@end
