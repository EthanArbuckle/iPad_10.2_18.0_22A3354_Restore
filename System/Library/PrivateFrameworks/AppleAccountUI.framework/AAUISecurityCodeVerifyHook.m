@implementation AAUISecurityCodeVerifyHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("icsc:verify"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("icsc:verify"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUISecurityCodeVerifyHook _verifySecurityCodeWithServerAttributes:completion:](self, "_verifySecurityCodeWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUISecurityCodeVerifyHook _verifySecurityCodeWithServerAttributes:completion:](self, "_verifySecurityCodeWithServerAttributes:completion:", v7, v6);

}

- (void)_verifySecurityCodeWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  AAUID2DEncryptionFlowContext *v11;
  id v12;
  id v13;
  int v14;
  char isKindOfClass;
  AAUIManateeStateValidator *v16;
  RUIServerHookResponse *v17;
  RUIServerHookResponse *serverHookResponse;
  id v19;
  AAUID2DEncryptionFlowContext *v20;
  _QWORD v21[4];
  AAUID2DEncryptionFlowContext *v22;
  AAUISecurityCodeVerifyHook *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Verifying security code with server attributes (%@)", buf, 0xCu);
  }

  -[AAUISecurityCodeVerifyHook delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationContextForHook:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AAUID2DEncryptionFlowContext initWithType:]([AAUID2DEncryptionFlowContext alloc], "initWithType:", 7);
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D87318]);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  v14 = objc_msgSend(v13, "BOOLValue");
  if (v14)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  -[CDPUIDeviceToDeviceEncryptionFlowContext setForceInlinePresentation:](v11, "setForceInlinePresentation:", isKindOfClass & 1);
  v16 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:]([AAUIManateeStateValidator alloc], "initWithFlowContext:withPresentingViewController:", v11, v10);
  v17 = (RUIServerHookResponse *)objc_alloc_init(MEMORY[0x1E0D872E0]);
  serverHookResponse = self->_serverHookResponse;
  self->_serverHookResponse = v17;

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke;
  v21[3] = &unk_1EA2DC430;
  v22 = v11;
  v23 = self;
  v24 = v7;
  v19 = v7;
  v20 = v11;
  -[AAUIManateeStateValidator verifyAndRepairManateeWithCompletion:](v16, "verifyAndRepairManateeWithCompletion:", v21);

}

void __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Successfully verified or repaired security code, will attempt to respond with PET", (uint8_t *)&v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "repairContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedLocalSecret");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "repairContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "passwordEquivToken");
    v7 = objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9 && v7)
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Determined that local secret was created or validated, attaching PET to server hook response", (uint8_t *)&v15, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("password"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setAdditionalPayload:", v11);
    }
    else if (v12)
    {
      v13 = CFSTR("NO");
      if (v9)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      if (v7)
        v13 = CFSTR("YES");
      v15 = 138412546;
      v16 = v14;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Unable to attach PET to server hook response (hasCachedLocalSecret: %@, hasPET: %@)", (uint8_t *)&v15, 0x16u);
    }

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke_cold_1((uint64_t)v5, v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __81__AAUISecurityCodeVerifyHook__verifySecurityCodeWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Failed to verify and repair security code with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
