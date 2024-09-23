@implementation LNFetchStructuredDataConnectionOperation

- (LNFetchStructuredDataConnectionOperation)initWithConnectionInterface:(id)a3 typeIdentifier:(int64_t)a4 entityIdentifiers:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  LNFetchStructuredDataConnectionOperation *v18;
  uint64_t v19;
  id completionHandler;
  LNFetchStructuredDataConnectionOperation *v21;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchStructuredDataConnectionOperation.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityIdentifiers"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchStructuredDataConnectionOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionInterface"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNFetchStructuredDataConnectionOperation.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)LNFetchStructuredDataConnectionOperation;
  v18 = -[LNInterfaceConnectionOperation initWithIdentifier:connectionInterface:priority:queue:activity:](&v26, sel_initWithIdentifier_connectionInterface_priority_queue_activity_, v17, v13, 2, v15, &__block_literal_global_3886);

  if (v18)
  {
    v18->_typeIdentifier = a4;
    objc_storeStrong((id *)&v18->_entityIdentifiers, a5);
    v19 = objc_msgSend(v16, "copy");
    completionHandler = v18->_completionHandler;
    v18->_completionHandler = (id)v19;

    v21 = v18;
  }

  return v18;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  int64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LNFetchStructuredDataConnectionOperation;
  -[LNConnectionOperation start](&v9, sel_start);
  getLNLogCategoryConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A18F6000, v3, OS_LOG_TYPE_INFO, "Fetching structured data from entities", buf, 2u);
  }

  -[LNInterfaceConnectionOperation connectionInterface](self, "connectionInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNFetchStructuredDataConnectionOperation typeIdentifier](self, "typeIdentifier");
  -[LNFetchStructuredDataConnectionOperation entityIdentifiers](self, "entityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__LNFetchStructuredDataConnectionOperation_start__block_invoke;
  v7[3] = &unk_1E45DCFE0;
  v7[4] = self;
  objc_msgSend(v4, "fetchStructuredDataWithTypeIdentifier:forEntityIdentifiers:completionHandler:", v5, v6, v7);

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
  -[LNFetchStructuredDataConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNFetchStructuredDataConnectionOperation entityIdentifiersToStructuredData](self, "entityIdentifiersToStructuredData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    -[LNFetchStructuredDataConnectionOperation completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNFetchStructuredDataConnectionOperation entityIdentifiersToStructuredData](self, "entityIdentifiersToStructuredData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v9, v7);

    -[LNFetchStructuredDataConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchStructuredDataConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v4);

}

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSArray)entityIdentifiers
{
  return self->_entityIdentifiers;
}

- (NSDictionary)entityIdentifiersToStructuredData
{
  return self->_entityIdentifiersToStructuredData;
}

- (void)setEntityIdentifiersToStructuredData:(id)a3
{
  objc_storeStrong((id *)&self->_entityIdentifiersToStructuredData, a3);
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
  objc_storeStrong((id *)&self->_entityIdentifiersToStructuredData, 0);
  objc_storeStrong((id *)&self->_entityIdentifiers, 0);
}

void __49__LNFetchStructuredDataConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
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

  objc_msgSend(*(id *)(a1 + 32), "setEntityIdentifiersToStructuredData:", v5);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  os_activity_scope_leave(&v8);

}

os_activity_t __129__LNFetchStructuredDataConnectionOperation_initWithConnectionInterface_typeIdentifier_entityIdentifiers_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:fetch structured data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

@end
