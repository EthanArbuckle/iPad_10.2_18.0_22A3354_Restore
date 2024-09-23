@implementation LNPerformActionConnectionOperation

- (LNPerformActionConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 executor:(id)a5 executorActivity:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  LNPerformActionConnectionOperation *v25;
  uint64_t v26;
  id completionHandler;
  LNPerformActionConnectionOperation *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  id v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;

  v15 = a3;
  obj = a4;
  v16 = a4;
  v35 = a5;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionConnectionOperation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"), obj, v35);

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionConnectionOperation.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("executor"));

      if (v20)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionConnectionOperation.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  if (!v17)
    goto LABEL_13;
LABEL_4:
  if (v20)
    goto LABEL_5;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionConnectionOperation.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  if (objc_msgSend(v16, "openAppWhenRun"))
    v21 = 2;
  else
    v21 = 1;
  objc_msgSend(v17, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemProtocols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __123__LNPerformActionConnectionOperation_initWithConnectionInterface_action_executor_executorActivity_queue_completionHandler___block_invoke;
  v37[3] = &unk_1E45DD6C8;
  v24 = v18;
  v38 = v24;
  v36.receiver = self;
  v36.super_class = (Class)LNPerformActionConnectionOperation;
  v25 = -[LNRuntimeAssertionsTakingConnectionOperation initWithIdentifier:connectionInterface:systemProtocols:priority:queue:activity:](&v36, sel_initWithIdentifier_connectionInterface_systemProtocols_priority_queue_activity_, v22, v15, v23, v21, v19, v37);

  if (v25)
  {
    objc_storeStrong((id *)&v25->_action, obj);
    objc_storeStrong((id *)&v25->_executor, v35);
    v26 = objc_msgSend(v20, "copy");
    completionHandler = v25->_completionHandler;
    v25->_completionHandler = (id)v26;

    v28 = v25;
  }

  return v25;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)LNPerformActionConnectionOperation;
  -[LNConnectionOperation start](&v19, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNPerformActionConnectionOperation action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPerformActionConnectionOperation action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    v24 = 2112;
    v25 = v8;

  }
  -[LNPerformActionConnectionOperation action](self, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D43D08], "fileValueType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__LNPerformActionConnectionOperation_start__block_invoke;
  v18[3] = &unk_1E45DD6F0;
  v18[4] = self;
  objc_msgSend(v9, "enumerateParameterValuesOfValueType:block:", v10, v18);

  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionConnectionOperation action](self, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionConnectionOperation executor](self, "executor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionConnectionOperation executor](self, "executor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __43__LNPerformActionConnectionOperation_start__block_invoke_2;
  v17[3] = &unk_1E45DD718;
  v17[4] = self;
  objc_msgSend(v12, "performAction:options:executor:completionHandler:", v13, v15, v16, v17);

}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  objc_super v10;

  v4 = a3;
  -[LNPerformActionConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNPerformActionConnectionOperation result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNPerformActionConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNPerformActionConnectionOperation result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNPerformActionConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformActionConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (double)timeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[LNPerformActionConnectionOperation executor](self, "executor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionOperationTimeout");
  v5 = v4;

  return v5;
}

- (LNAction)action
{
  return self->_action;
}

- (LNActionExecutor)executor
{
  return self->_executor;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (LNSuccessResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __43__LNPerformActionConnectionOperation_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFileURL");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "executor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "auditToken");

    objc_msgSend(v5, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    INIssueSandboxExtensionToProcess();

  }
}

void __43__LNPerformActionConnectionOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_activity_scope_state_s v8;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v7, &v8);

  objc_msgSend(*(id *)(a1 + 32), "setResult:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&v8);

}

id __123__LNPerformActionConnectionOperation_initWithConnectionInterface_action_executor_executorActivity_queue_completionHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
