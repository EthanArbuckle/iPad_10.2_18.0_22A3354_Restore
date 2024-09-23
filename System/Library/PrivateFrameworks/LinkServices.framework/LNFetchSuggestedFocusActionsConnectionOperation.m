@implementation LNFetchSuggestedFocusActionsConnectionOperation

- (LNFetchSuggestedFocusActionsConnectionOperation)initWithConnectionInterface:(id)a3 actionMetadata:(id)a4 suggestionContext:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  LNFetchSuggestedFocusActionsConnectionOperation *v20;
  uint64_t v21;
  id completionHandler;
  LNFetchSuggestedFocusActionsConnectionOperation *v23;
  void *v25;
  void *v26;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (v14)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchSuggestedFocusActionsConnectionOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionMetadata"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchSuggestedFocusActionsConnectionOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)LNFetchSuggestedFocusActionsConnectionOperation;
  v20 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v27, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v19, v13, 1, v16, &__block_literal_global_7086);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_actionMetadata, a4);
    objc_storeStrong((id *)&v20->_suggestionContext, a5);
    v21 = objc_msgSend(v18, "copy");
    completionHandler = v20->_completionHandler;
    v20->_completionHandler = (id)v21;

    v23 = v20;
  }

  return v20;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)LNFetchSuggestedFocusActionsConnectionOperation;
  -[LNConnectionOperation start](&v10, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNFetchSuggestedFocusActionsConnectionOperation actionMetadata](self, "actionMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching suggested focus actions %@", buf, 0xCu);

  }
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchSuggestedFocusActionsConnectionOperation actionMetadata](self, "actionMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchSuggestedFocusActionsConnectionOperation suggestionContext](self, "suggestionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__LNFetchSuggestedFocusActionsConnectionOperation_start__block_invoke;
  v9[3] = &unk_1E45DD9E0;
  v9[4] = self;
  objc_msgSend(v6, "fetchSuggestedFocusActionsForActionMetadata:suggestionContext:completionHandler:", v7, v8, v9);

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
  -[LNFetchSuggestedFocusActionsConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchSuggestedFocusActionsConnectionOperation results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchSuggestedFocusActionsConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchSuggestedFocusActionsConnectionOperation results](self, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNFetchSuggestedFocusActionsConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchSuggestedFocusActionsConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (void)setActionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_actionMetadata, a3);
}

- (LNFocusConfigurationSuggestionContext)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setSuggestionContext:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionContext, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
}

void __56__LNFetchSuggestedFocusActionsConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

  objc_msgSend(*(id *)(a1 + 32), "setResults:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&v8);

}

os_activity_t __136__LNFetchSuggestedFocusActionsConnectionOperation_initWithConnectionInterface_actionMetadata_suggestionContext_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch suggested focus actions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
