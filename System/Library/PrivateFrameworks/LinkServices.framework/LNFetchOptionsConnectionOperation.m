@implementation LNFetchOptionsConnectionOperation

os_activity_t __182__LNFetchOptionsConnectionOperation_initWithConnectionInterface_action_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch options", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  -[LNFetchOptionsConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchOptionsConnectionOperation result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchOptionsConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchOptionsConnectionOperation result](self, "result");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNFetchOptionsConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchOptionsConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)LNFetchOptionsConnectionOperation;
  -[LNConnectionOperation start](&v17, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNFetchOptionsConnectionOperation actionMetadata](self, "actionMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFetchOptionsConnectionOperation parameterMetadata](self, "parameterMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFetchOptionsConnectionOperation searchTerm](self, "searchTerm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v5;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching options for action %@, parameter: %@, searchTerm: %@", buf, 0x20u);

  }
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsConnectionOperation action](self, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsConnectionOperation actionMetadata](self, "actionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsConnectionOperation parameterMetadata](self, "parameterMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsConnectionOperation optionsProviderReference](self, "optionsProviderReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsConnectionOperation searchTerm](self, "searchTerm");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchOptionsConnectionOperation localeIdentifier](self, "localeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = 3221225472;
  v16[2] = __42__LNFetchOptionsConnectionOperation_start__block_invoke;
  v16[3] = &unk_1E45DD950;
  v16[4] = self;
  v16[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v9, "fetchOptionsForAction:actionMetadata:parameterMetadata:optionsProviderReference:searchTerm:localeIdentifier:completionHandler:", v10, v11, v12, v13, v14, v15, v16);

}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (LNDynamicOptionsProviderReference)optionsProviderReference
{
  return self->_optionsProviderReference;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

- (LNFetchOptionsConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 actionMetadata:(id)a5 parameterMetadata:(id)a6 optionsProviderReference:(id)a7 searchTerm:(id)a8 localeIdentifier:(id)a9 queue:(id)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  LNFetchOptionsConnectionOperation *v26;
  void *v27;
  id completionHandler;
  LNFetchOptionsConnectionOperation *v29;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  SEL v40;
  void *v41;
  id obj;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v51;

  v17 = a3;
  v49 = a4;
  obj = a5;
  v18 = a5;
  v43 = a6;
  v19 = a6;
  v44 = a7;
  v48 = a7;
  v46 = a8;
  v47 = a8;
  v45 = a9;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = a2;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("LNFetchOptionsConnectionOperation.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionMetadata"), obj, v43, v44, a9, v46, v47, v48, v49);

    a2 = v31;
    if (v19)
    {
LABEL_3:
      if (v20)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = a2;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v35, self, CFSTR("LNFetchOptionsConnectionOperation.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier"));

      a2 = v35;
      if (v17)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = a2;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v33, self, CFSTR("LNFetchOptionsConnectionOperation.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterMetadata"));

  a2 = v33;
  if (!v20)
    goto LABEL_12;
LABEL_4:
  if (v17)
    goto LABEL_5;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = a2;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("LNFetchOptionsConnectionOperation.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

  a2 = v37;
LABEL_5:
  v23 = v19;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = a2;
    v41 = v39;
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v40, self, CFSTR("LNFetchOptionsConnectionOperation.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "systemProtocols");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51.receiver = self;
  v51.super_class = (Class)LNFetchOptionsConnectionOperation;
  v26 = -[LNRuntimeAssertionsTakingConnectionOperation initWithIdentifier:connectionInterface:systemProtocols:priority:queue:activity:](&v51, sel_initWithIdentifier_connectionInterface_systemProtocols_priority_queue_activity_, v24, v17, v25, 1, v21, &__block_literal_global_9568);

  if (v26)
  {
    objc_storeStrong((id *)&v26->_action, a4);
    objc_storeStrong((id *)&v26->_actionMetadata, obj);
    objc_storeStrong((id *)&v26->_parameterMetadata, v43);
    objc_storeStrong((id *)&v26->_optionsProviderReference, v44);
    objc_storeStrong((id *)&v26->_searchTerm, v46);
    objc_storeStrong((id *)&v26->_localeIdentifier, v45);
    v27 = _Block_copy(v22);
    completionHandler = v26->_completionHandler;
    v26->_completionHandler = v27;

    v29 = v26;
  }

  return v26;
}

void __42__LNFetchOptionsConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (LNDynamicOptionsResult)result
{
  return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_optionsProviderReference, 0);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void)setActionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_actionMetadata, a3);
}

- (void)setParameterMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_parameterMetadata, a3);
}

- (void)setOptionsProviderReference:(id)a3
{
  objc_storeStrong((id *)&self->_optionsProviderReference, a3);
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

@end
