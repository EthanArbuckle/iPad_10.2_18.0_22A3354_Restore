@implementation LNFetchViewEntitiesConnectionOperation

- (LNFetchViewEntitiesConnectionOperation)initWithConnectionInterface:(id)a3 interactionIDs:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  LNFetchViewEntitiesConnectionOperation *v17;
  void *v18;
  id completionHandler;
  LNFetchViewEntitiesConnectionOperation *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchViewEntitiesConnectionOperation.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchViewEntitiesConnectionOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)LNFetchViewEntitiesConnectionOperation;
  v17 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v24, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v16, v11, 2, v13, &__block_literal_global_4951);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_interactionIDs, a4);
    v18 = _Block_copy(v15);
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = v18;

    v20 = v17;
  }

  return v17;
}

- (LNFetchViewEntitiesConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  return -[LNFetchViewEntitiesConnectionOperation initWithConnectionInterface:interactionIDs:queue:completionHandler:](self, "initWithConnectionInterface:interactionIDs:queue:completionHandler:", a3, 0, a4, a5);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  NSArray *interactionIDs;
  _QWORD v6[5];
  uint8_t buf[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNFetchViewEntitiesConnectionOperation;
  -[LNConnectionOperation start](&v8, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching app view entities", buf, 2u);
  }

  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  interactionIDs = self->_interactionIDs;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__LNFetchViewEntitiesConnectionOperation_start__block_invoke;
  v6[3] = &unk_1E45DD9E0;
  v6[4] = self;
  objc_msgSend(v4, "fetchViewEntitiesWithInteractionIDs:completionHandler:", interactionIDs, v6);

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
  -[LNFetchViewEntitiesConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchViewEntitiesConnectionOperation result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchViewEntitiesConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchViewEntitiesConnectionOperation result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNFetchViewEntitiesConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchViewEntitiesConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (NSArray)interactionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInteractionIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)result
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
  objc_storeStrong((id *)&self->_interactionIDs, 0);
}

void __47__LNFetchViewEntitiesConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

os_activity_t __109__LNFetchViewEntitiesConnectionOperation_initWithConnectionInterface_interactionIDs_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch view entities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
