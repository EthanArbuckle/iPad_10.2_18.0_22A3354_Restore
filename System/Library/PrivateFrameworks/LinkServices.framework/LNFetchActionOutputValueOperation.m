@implementation LNFetchActionOutputValueOperation

- (LNFetchActionOutputValueOperation)initWithConnectionInterface:(id)a3 actionOutput:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  LNFetchActionOutputValueOperation *v16;
  uint64_t v17;
  id completionHandler;
  LNFetchActionOutputValueOperation *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchActionOutputValueOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionOutput"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchActionOutputValueOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchActionOutputValueOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)LNFetchActionOutputValueOperation;
  v16 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v24, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v15, v11, 1, v13, &__block_literal_global_3370);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_actionOutput, a4);
    v17 = objc_msgSend(v14, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v17;

    v19 = v16;
  }

  return v16;
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
  _QWORD v10[5];
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)LNFetchActionOutputValueOperation;
  -[LNConnectionOperation start](&v11, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNFetchActionOutputValueOperation actionOutput](self, "actionOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v6;

  }
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchActionOutputValueOperation actionOutput](self, "actionOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__LNFetchActionOutputValueOperation_start__block_invoke;
  v10[3] = &unk_1E45DC750;
  v10[4] = self;
  objc_msgSend(v7, "fetchActionOutputValueWithIdentifier:completionHandler:", v9, v10);

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
  -[LNFetchActionOutputValueOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchActionOutputValueOperation value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchActionOutputValueOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchActionOutputValueOperation value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNFetchActionOutputValueOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchActionOutputValueOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (LNActionOutput)actionOutput
{
  return self->_actionOutput;
}

- (void)setActionOutput:(id)a3
{
  objc_storeStrong((id *)&self->_actionOutput, a3);
}

- (LNValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
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
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_actionOutput, 0);
}

void __42__LNFetchActionOutputValueOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

  objc_msgSend(*(id *)(a1 + 32), "setValue:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&v8);

}

os_activity_t __102__LNFetchActionOutputValueOperation_initWithConnectionInterface_actionOutput_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch action output value", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
