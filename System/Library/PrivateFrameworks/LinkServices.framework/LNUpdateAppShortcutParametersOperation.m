@implementation LNUpdateAppShortcutParametersOperation

- (LNUpdateAppShortcutParametersOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  LNUpdateAppShortcutParametersOperation *v14;
  void *v15;
  id completionHandler;
  LNUpdateAppShortcutParametersOperation *v17;
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
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNUpdateAppShortcutParametersOperation.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNUpdateAppShortcutParametersOperation.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)LNUpdateAppShortcutParametersOperation;
  v14 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v21, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v13, v9, 1, v10, &__block_literal_global_3101);

  if (v14)
  {
    v15 = _Block_copy(v12);
    completionHandler = v14->_completionHandler;
    v14->_completionHandler = v15;

    v17 = v14;
  }

  return v14;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNUpdateAppShortcutParametersOperation;
  -[LNConnectionOperation start](&v7, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Updating App Shortcuts parameters", buf, 2u);
  }

  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__LNUpdateAppShortcutParametersOperation_start__block_invoke;
  v5[3] = &unk_1E45DD430;
  v5[4] = self;
  objc_msgSend(v4, "updateAppShortcutParametersWithCompletionHandler:", v5);

}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  objc_super v8;

  v4 = a3;
  -[LNUpdateAppShortcutParametersOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", 0, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    -[LNUpdateAppShortcutParametersOperation completionHandler](self, "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

    -[LNUpdateAppShortcutParametersOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v6;
  }
  v8.receiver = self;
  v8.super_class = (Class)LNUpdateAppShortcutParametersOperation;
  -[LNConnectionOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

void __47__LNUpdateAppShortcutParametersOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v4, &v5);

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  os_activity_scope_leave(&v5);

}

os_activity_t __94__LNUpdateAppShortcutParametersOperation_initWithConnectionInterface_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:update app shortcut parameters", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
