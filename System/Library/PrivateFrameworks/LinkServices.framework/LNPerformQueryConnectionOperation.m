@implementation LNPerformQueryConnectionOperation

- (LNPerformQueryConnectionOperation)initWithConnectionInterface:(id)a3 query:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  LNPerformQueryConnectionOperation *v16;
  uint64_t v17;
  id completionHandler;
  LNPerformQueryConnectionOperation *v19;
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
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformQueryConnectionOperation.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformQueryConnectionOperation.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformQueryConnectionOperation.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)LNPerformQueryConnectionOperation;
  v16 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v24, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v15, v11, 1, v13, &__block_literal_global_3573);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_queryRequest, a4);
    v17 = objc_msgSend(v14, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v17;

    v19 = v16;
  }

  return v16;
}

- (void)start
{
  void *v4;
  void *v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNPerformQueryConnectionOperation;
  -[LNConnectionOperation start](&v7, sel_start);
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformQueryConnectionOperation queryRequest](self, "queryRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__LNPerformQueryConnectionOperation_start__block_invoke;
  v6[3] = &unk_1E45DE1D8;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "performPropertyQuery:completionHandler:", v5, v6);

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
  -[LNPerformQueryConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNPerformQueryConnectionOperation output](self, "output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNPerformQueryConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNPerformQueryConnectionOperation output](self, "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNPerformQueryConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformQueryConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (LNQueryRequest)queryRequest
{
  return self->_queryRequest;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (LNQueryOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queryRequest, 0);
}

void __42__LNPerformQueryConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  if (v6)
    v7 = v5 == 0;
  else
    v7 = v5 != 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("LNPerformQueryConnectionOperation.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(output && !error) || (error && !output)"));

  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &state);

  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&state);

}

os_activity_t __95__LNPerformQueryConnectionOperation_initWithConnectionInterface_query_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:perform query", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
