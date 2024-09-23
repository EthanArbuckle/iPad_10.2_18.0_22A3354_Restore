@implementation AKPrivateEmailClientImpl

- (void)presentPrivateEmailUIForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  _AKLogHme();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKPrivateEmailClientImpl presentPrivateEmailUIForContext:completion:].cold.1((uint64_t)v6, (uint64_t)self, v8);

  if (self->_uiProvider)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__AKPrivateEmailClientImpl_presentPrivateEmailUIForContext_completion___block_invoke;
    block[3] = &unk_1E2E60190;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __71__AKPrivateEmailClientImpl_presentPrivateEmailUIForContext_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "presentPrivateEmailUIForContext:completion:", a1[5], a1[6]);
}

- (AKPrivateEmailUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiProvider, 0);
}

- (void)presentPrivateEmailUIForContext:(os_log_t)log completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Presenting %@ to %@", (uint8_t *)&v4, 0x16u);
}

@end
