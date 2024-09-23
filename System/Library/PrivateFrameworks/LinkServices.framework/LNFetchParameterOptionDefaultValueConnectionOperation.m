@implementation LNFetchParameterOptionDefaultValueConnectionOperation

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
  _QWORD v11[5];
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)LNFetchParameterOptionDefaultValueConnectionOperation;
  -[LNConnectionOperation start](&v12, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNFetchParameterOptionDefaultValueConnectionOperation actionMetadata](self, "actionMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFetchParameterOptionDefaultValueConnectionOperation parameterIdentifier](self, "parameterIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching options default value for action %@ parameter %@", buf, 0x16u);

  }
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchParameterOptionDefaultValueConnectionOperation action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchParameterOptionDefaultValueConnectionOperation actionMetadata](self, "actionMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchParameterOptionDefaultValueConnectionOperation parameterIdentifier](self, "parameterIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__LNFetchParameterOptionDefaultValueConnectionOperation_start__block_invoke;
  v11[3] = &unk_1E45DCAC0;
  v11[4] = self;
  objc_msgSend(v7, "fetchParameterOptionDefaultValueForAction:actionMetadata:parameterIdentifier:completionHandler:", v8, v9, v10, v11);

}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (LNAction)action
{
  return self->_action;
}

os_activity_t __151__LNFetchParameterOptionDefaultValueConnectionOperation_initWithConnectionInterface_action_actionMetadata_parameterIdentifier_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch parameter option default value", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (LNFetchParameterOptionDefaultValueConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 actionMetadata:(id)a5 parameterIdentifier:(id)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  LNFetchParameterOptionDefaultValueConnectionOperation *v25;
  uint64_t v26;
  LNAction *action;
  uint64_t v28;
  LNActionMetadata *actionMetadata;
  uint64_t v30;
  NSString *parameterIdentifier;
  uint64_t v32;
  id completionHandler;
  LNFetchParameterOptionDefaultValueConnectionOperation *v34;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchParameterOptionDefaultValueConnectionOperation.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

    if (v20)
      goto LABEL_4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchParameterOptionDefaultValueConnectionOperation.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionMetadata"));

  if (!v18)
    goto LABEL_11;
LABEL_3:
  if (v20)
    goto LABEL_4;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchParameterOptionDefaultValueConnectionOperation.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "systemProtocols");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = v22;
  else
    v24 = MEMORY[0x1E0C9AA60];
  v39.receiver = self;
  v39.super_class = (Class)LNFetchParameterOptionDefaultValueConnectionOperation;
  v25 = -[LNRuntimeAssertionsTakingConnectionOperation initWithIdentifier:connectionInterface:systemProtocols:priority:queue:activity:](&v39, sel_initWithIdentifier_connectionInterface_systemProtocols_priority_queue_activity_, v21, v15, v24, 1, v19, &__block_literal_global_4606);

  if (v25)
  {
    v26 = objc_msgSend(v16, "copy");
    action = v25->_action;
    v25->_action = (LNAction *)v26;

    v28 = objc_msgSend(v17, "copy");
    actionMetadata = v25->_actionMetadata;
    v25->_actionMetadata = (LNActionMetadata *)v28;

    v30 = objc_msgSend(v18, "copy");
    parameterIdentifier = v25->_parameterIdentifier;
    v25->_parameterIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    completionHandler = v25->_completionHandler;
    v25->_completionHandler = (id)v32;

    v34 = v25;
  }

  return v25;
}

void __62__LNFetchParameterOptionDefaultValueConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  objc_super v8;

  v4 = a3;
  -[LNFetchParameterOptionDefaultValueConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchParameterOptionDefaultValueConnectionOperation completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchParameterOptionDefaultValueConnectionOperation result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v6)[2](v6, v7, v4);

    -[LNFetchParameterOptionDefaultValueConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)LNFetchParameterOptionDefaultValueConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (LNDynamicOption)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setActionMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setParameterIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
