@implementation LNFetchOptionsDefaultValueConnectionOperation

- (LNFetchOptionsDefaultValueConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  LNFetchOptionsDefaultValueConnectionOperation *v17;
  uint64_t v18;
  LNAction *action;
  uint64_t v20;
  id completionHandler;
  LNFetchOptionsDefaultValueConnectionOperation *v22;
  void *v24;
  void *v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v12)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchOptionsDefaultValueConnectionOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchOptionsDefaultValueConnectionOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)LNFetchOptionsDefaultValueConnectionOperation;
  v17 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v26, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v16, v11, 1, v13, &__block_literal_global_7743);

  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    action = v17->_action;
    v17->_action = (LNAction *)v18;

    v20 = objc_msgSend(v15, "copy");
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = (id)v20;

    v22 = v17;
  }

  return v17;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)LNFetchOptionsDefaultValueConnectionOperation;
  -[LNConnectionOperation start](&v9, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNFetchOptionsDefaultValueConnectionOperation action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching options default values for action %@", buf, 0xCu);

  }
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsDefaultValueConnectionOperation action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__LNFetchOptionsDefaultValueConnectionOperation_start__block_invoke;
  v8[3] = &unk_1E45DD228;
  v8[4] = self;
  objc_msgSend(v6, "fetchOptionsDefaultValuesForAction:completionHandler:", v7, v8);

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
  -[LNFetchOptionsDefaultValueConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchOptionsDefaultValueConnectionOperation result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchOptionsDefaultValueConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchOptionsDefaultValueConnectionOperation result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNFetchOptionsDefaultValueConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchOptionsDefaultValueConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (LNAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (LNAction)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __54__LNFetchOptionsDefaultValueConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

os_activity_t __108__LNFetchOptionsDefaultValueConnectionOperation_initWithConnectionInterface_action_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch options default", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
