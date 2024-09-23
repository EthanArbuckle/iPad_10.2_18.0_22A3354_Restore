@implementation LNPerformAllResultsQueryOperation

- (LNPerformAllResultsQueryOperation)initWithConnectionInterface:(id)a3 entityMangledTypeName:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  LNPerformAllResultsQueryOperation *v16;
  NSString *entityType;
  uint64_t v18;
  NSString *entityMangledTypeName;
  uint64_t v20;
  id completionHandler;
  LNPerformAllResultsQueryOperation *v22;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

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
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformAllResultsQueryOperation.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityMangledTypeName"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformAllResultsQueryOperation.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformAllResultsQueryOperation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)LNPerformAllResultsQueryOperation;
  v16 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v27, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v15, v11, 1, v13, &__block_literal_global_9628);

  if (v16)
  {
    entityType = v16->_entityType;
    v16->_entityType = 0;

    v18 = objc_msgSend(v12, "copy");
    entityMangledTypeName = v16->_entityMangledTypeName;
    v16->_entityMangledTypeName = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v20;

    v22 = v16;
  }

  return v16;
}

- (void)start
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNPerformAllResultsQueryOperation;
  -[LNConnectionOperation start](&v6, sel_start);
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformAllResultsQueryOperation entityMangledTypeName](self, "entityMangledTypeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__LNPerformAllResultsQueryOperation_start__block_invoke;
  v5[3] = &unk_1E45DD998;
  v5[4] = self;
  objc_msgSend(v3, "performAllEntitiesQueryWithEntityMangledTypeName:completionHandler:", v4, v5);

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
  -[LNPerformAllResultsQueryOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNPerformAllResultsQueryOperation output](self, "output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNPerformAllResultsQueryOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNPerformAllResultsQueryOperation output](self, "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNPerformAllResultsQueryOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNPerformAllResultsQueryOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (NSString)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)entityMangledTypeName
{
  return self->_entityMangledTypeName;
}

- (void)setEntityMangledTypeName:(id)a3
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

- (LNQueryOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_entityMangledTypeName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
}

void __42__LNPerformAllResultsQueryOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&v8);

}

os_activity_t __111__LNPerformAllResultsQueryOperation_initWithConnectionInterface_entityMangledTypeName_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:entity all results query", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
