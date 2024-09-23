@implementation LNFetchListenerEndpointConnectionOperation

- (LNFetchListenerEndpointConnectionOperation)initWithConnectionInterface:(id)a3 queue:(id)a4 bundleIdentifier:(id)a5 action:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  LNFetchListenerEndpointConnectionOperation *v20;
  void *v21;
  id completionHandler;
  uint64_t v23;
  NSString *bundleIdentifier;
  LNFetchListenerEndpointConnectionOperation *v25;
  void *v27;
  void *v28;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (v13)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchListenerEndpointConnectionOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchListenerEndpointConnectionOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)LNFetchListenerEndpointConnectionOperation;
  v20 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v29, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v19, v13, 1, v14, &__block_literal_global_11214);

  if (v20)
  {
    v21 = _Block_copy(v18);
    completionHandler = v20->_completionHandler;
    v20->_completionHandler = v21;

    v23 = objc_msgSend(v15, "copy");
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_action, a6);
    v25 = v20;
  }

  return v20;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LNFetchListenerEndpointConnectionOperation;
  -[LNConnectionOperation start](&v9, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching XPC listener endpoint", buf, 2u);
  }

  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchListenerEndpointConnectionOperation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNFetchListenerEndpointConnectionOperation action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__LNFetchListenerEndpointConnectionOperation_start__block_invoke;
  v7[3] = &unk_1E45DE118;
  v7[4] = self;
  objc_msgSend(v4, "getListenerEndpointForBundleIdentifier:action:completionHandler:", v5, v6, v7);

}

- (void)finishWithXPCListenerEndpoint:(id)a3 auditTokenData:(id)a4 resolvedAction:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[LNFetchListenerEndpointConnectionOperation completionHandler](self, "completionHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[LNFetchListenerEndpointConnectionOperation completionHandler](self, "completionHandler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v15)[2](v15, v10, v11, v12, v13);

    -[LNFetchListenerEndpointConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)LNFetchListenerEndpointConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v16, sel_finishWithError_, v13);

}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v8;

  v4 = a3;
  -[LNFetchListenerEndpointConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", 0, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    -[LNFetchListenerEndpointConnectionOperation completionHandler](self, "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, 0, 0, v6);

    -[LNFetchListenerEndpointConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v6;
  }
  v8.receiver = self;
  v8.super_class = (Class)LNFetchListenerEndpointConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LNAction)action
{
  return self->_action;
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
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __51__LNFetchListenerEndpointConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
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

  objc_msgSend(*(id *)(a1 + 32), "finishWithXPCListenerEndpoint:auditTokenData:resolvedAction:error:", v9, v10, v11, v12);
  os_activity_scope_leave(&v14);

}

os_activity_t __122__LNFetchListenerEndpointConnectionOperation_initWithConnectionInterface_queue_bundleIdentifier_action_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch listener endpoint", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
