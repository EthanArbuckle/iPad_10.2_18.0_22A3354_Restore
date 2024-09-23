@implementation LNFetchMDMPropertiesConnectionOperation

- (LNFetchMDMPropertiesConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  LNFetchMDMPropertiesConnectionOperation *v16;
  uint64_t v17;
  LNAction *action;
  uint64_t v19;
  id completionHandler;
  LNFetchMDMPropertiesConnectionOperation *v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

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
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchMDMPropertiesConnectionOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchMDMPropertiesConnectionOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchMDMPropertiesConnectionOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)LNFetchMDMPropertiesConnectionOperation;
  v16 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v26, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v15, v11, 1, v13, &__block_literal_global_2223);

  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    action = v16->_action;
    v16->_action = (LNAction *)v17;

    v19 = objc_msgSend(v14, "copy");
    completionHandler = v16->_completionHandler;
    v16->_completionHandler = (id)v19;

    v21 = v16;
  }

  return v16;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)LNFetchMDMPropertiesConnectionOperation;
  -[LNConnectionOperation start](&v8, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LNFetchMDMPropertiesConnectionOperation action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching MDM properties for action %@", buf, 0xCu);

  }
  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchMDMPropertiesConnectionOperation action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__LNFetchMDMPropertiesConnectionOperation_start__block_invoke;
  v7[3] = &unk_1E45DC1F8;
  v7[4] = self;
  objc_msgSend(v5, "fetchDestinationMDMAccountIdentifierForAction:completionHandler:", v6, v7);

}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  objc_super v8;

  v4 = a3;
  -[LNFetchMDMPropertiesConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchMDMPropertiesConnectionOperation completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchMDMPropertiesConnectionOperation accountIdentifier](self, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v6)[2](v6, v7, v4);

    -[LNFetchMDMPropertiesConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)LNFetchMDMPropertiesConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

- (LNAction)action
{
  return self->_action;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __48__LNFetchMDMPropertiesConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

  objc_msgSend(*(id *)(a1 + 32), "setAccountIdentifier:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&v8);

}

os_activity_t __102__LNFetchMDMPropertiesConnectionOperation_initWithConnectionInterface_action_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch MDM properties", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
