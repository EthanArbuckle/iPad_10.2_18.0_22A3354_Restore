@implementation FPFetchDefaultContainerOperation

- (id)initForApplicationRecord:(id)a3 providerDomain:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FPFetchDefaultContainerOperation *v10;
  void *v11;
  uint64_t v12;
  NSString *domainIdentifier;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)FPFetchDefaultContainerOperation;
  v10 = -[FPActionOperation initWithProvider:action:](&v15, sel_initWithProvider_action_, v9, 0);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_requestedRecord, a3);
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fp_toDomainIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v10->_domainIdentifier;
    v10->_domainIdentifier = (NSString *)v12;

    -[FPActionOperation setSetupRemoteOperationService:](v10, "setSetupRemoteOperationService:", 1);
  }

  return v10;
}

- (void)actionMain
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] Requested default container for application record %@ with nil bundle identifier", v2);
  OUTLINED_FUNCTION_3();
}

void __46__FPFetchDefaultContainerOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__FPFetchDefaultContainerOperation_actionMain__block_invoke_cold_1(v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v5, v6);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[FPFetchDefaultContainerOperation fetchCompletionBlock](self, "fetchCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[FPFetchDefaultContainerOperation setFetchCompletionBlock:](self, "setFetchCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)FPFetchDefaultContainerOperation;
  -[FPActionOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedRecord, 0);
}

void __46__FPFetchDefaultContainerOperation_actionMain__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] couldn't create directory: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

@end
