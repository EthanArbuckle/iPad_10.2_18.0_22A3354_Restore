@implementation LNFetchAppShortcutParametersConnectionOperation

os_activity_t __103__LNFetchAppShortcutParametersConnectionOperation_initWithConnectionInterface_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch AppShortcut parameters", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

void __56__LNFetchAppShortcutParametersConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_activity_scope_state_s v14;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v13, &v14);

  objc_msgSend(*(id *)(a1 + 32), "setAppShortcutSubstitutions:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setSpans:", v10);
  objc_msgSend(*(id *)(a1 + 32), "setParameterPresentationSubstitutions:", v11);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v12);
  os_activity_scope_leave(&v14);

}

- (void)setSpans:(id)a3
{
  objc_storeStrong((id *)&self->_spans, a3);
}

- (void)setParameterPresentationSubstitutions:(id)a3
{
  objc_storeStrong((id *)&self->_parameterPresentationSubstitutions, a3);
}

- (void)setAppShortcutSubstitutions:(id)a3
{
  objc_storeStrong((id *)&self->_appShortcutSubstitutions, a3);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[LNFetchAppShortcutParametersConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchAppShortcutParametersConnectionOperation appShortcutSubstitutions](self, "appShortcutSubstitutions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchAppShortcutParametersConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchAppShortcutParametersConnectionOperation appShortcutSubstitutions](self, "appShortcutSubstitutions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFetchAppShortcutParametersConnectionOperation spans](self, "spans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNFetchAppShortcutParametersConnectionOperation parameterPresentationSubstitutions](self, "parameterPresentationSubstitutions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *, uint64_t))v8)[2](v8, v9, v10, v11, v7);

    -[LNFetchAppShortcutParametersConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v12.receiver = self;
  v12.super_class = (Class)LNFetchAppShortcutParametersConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v12, sel_finishWithError_, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)parameterPresentationSubstitutions
{
  return self->_parameterPresentationSubstitutions;
}

- (NSArray)appShortcutSubstitutions
{
  return self->_appShortcutSubstitutions;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNFetchAppShortcutParametersConnectionOperation;
  -[LNConnectionOperation start](&v7, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching AppShortcut parameters", buf, 2u);
  }

  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__LNFetchAppShortcutParametersConnectionOperation_start__block_invoke;
  v5[3] = &unk_1E45DE378;
  v5[4] = self;
  objc_msgSend(v4, "fetchAppShortcutParametersWithCompletionHandler:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterPresentationSubstitutions, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_appShortcutSubstitutions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (LNFetchAppShortcutParametersConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  LNFetchAppShortcutParametersConnectionOperation *v14;
  void *v15;
  id completionHandler;
  LNFetchAppShortcutParametersConnectionOperation *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchAppShortcutParametersConnectionOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchAppShortcutParametersConnectionOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)LNFetchAppShortcutParametersConnectionOperation;
  v14 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v21, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v13, v9, 1, v10, &__block_literal_global_11958);

  if (v14)
  {
    v15 = _Block_copy(v12);
    completionHandler = v14->_completionHandler;
    v14->_completionHandler = v15;

    v17 = v14;
  }

  return v14;
}

@end
