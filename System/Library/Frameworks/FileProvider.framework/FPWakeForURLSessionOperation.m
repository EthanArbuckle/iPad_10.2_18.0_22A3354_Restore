@implementation FPWakeForURLSessionOperation

- (id)initForProvider:(id)a3 sessionIdentifier:(id)a4
{
  id v7;
  void *v8;
  FPWakeForURLSessionOperation *v9;
  objc_super v11;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", a3, CFSTR("NSFileProviderDomainDefaultIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)FPWakeForURLSessionOperation;
  v9 = -[FPActionOperation initWithProvider:action:](&v11, sel_initWithProvider_action_, v8, 0);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionIdentifier, a4);
    -[FPActionOperation setSetupRemoteOperationService:](v9, "setSetupRemoteOperationService:", 1);
  }

  return v9;
}

- (void)actionMain
{
  void *v3;
  NSString *sessionIdentifier;
  _QWORD v5[5];

  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sessionIdentifier = self->_sessionIdentifier;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__FPWakeForURLSessionOperation_actionMain__block_invoke;
  v5[3] = &unk_1E444A598;
  v5[4] = self;
  objc_msgSend(v3, "wakeForSessionIdentifier:completionHandler:", sessionIdentifier, v5);

}

void __42__FPWakeForURLSessionOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__FPWakeForURLSessionOperation_actionMain__block_invoke_cold_1(a1, v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

void __42__FPWakeForURLSessionOperation_actionMain__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] %@ failed to wake provider: %@", (uint8_t *)&v6, 0x16u);

}

@end
