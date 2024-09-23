@implementation AKBiometricRatchetHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ak:bioratchet"));

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

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ak:bioratchet"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AKBiometricRatchetHook _armBiometricRatchetWithServerAttributes:completion:](self, "_armBiometricRatchetWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKBiometricRatchetHook _armBiometricRatchetWithServerAttributes:completion:](self, "_armBiometricRatchetWithServerAttributes:completion:", v7, v6);

}

- (void)_armBiometricRatchetWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  AKBiometricRatchetController *v8;
  AKBiometricRatchetController *biometricRatchetController;
  id v10;
  NSString *v11;
  NSString *context;
  __CFString *v13;
  void *v14;
  AKBiometricRatchetController *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (AKBiometricRatchetController *)objc_alloc_init(MEMORY[0x1E0D001A0]);
  biometricRatchetController = self->_biometricRatchetController;
  self->_biometricRatchetController = v8;

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("context"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = (NSString *)v10;
  else
    v11 = 0;

  context = self->_context;
  self->_context = v11;

  if (self->_context)
    v13 = (__CFString *)self->_context;
  else
    v13 = &stru_1E7679C68;
  objc_storeStrong((id *)&self->_context, v13);
  if ((-[AKBiometricRatchetController isDTOEnabled](self->_biometricRatchetController, "isDTOEnabled") & 1) != 0)
  {
    -[AKBiometricRatchetHook _biometricRatchetUIContextFromAttributes:](self, "_biometricRatchetUIContextFromAttributes:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_biometricRatchetController;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke;
    v17[3] = &unk_1E76793F8;
    v17[4] = self;
    v18 = v7;
    -[AKBiometricRatchetController armWithContext:completion:](v15, "armWithContext:completion:", v14, v17);

  }
  else
  {
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AKBiometricRatchetHook _armBiometricRatchetWithServerAttributes:completion:].cold.1(v16);

    -[AKBiometricRatchetHook _updateResponseWithContext](self, "_updateResponseWithContext");
    if (v7)
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_2((uint64_t)v6, v8);

    objc_msgSend(*(id *)(a1 + 32), "_updateResponseWithContext");
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_1((uint64_t)v5, v8, v11, v12, v13, v14, v15, v16);

    objc_msgSend(*(id *)(a1 + 32), "_updateResponseWithRatchetResult:", v5);
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
    {
      v10 = *(void (**)(void))(v17 + 16);
      goto LABEL_10;
    }
  }

}

- (id)_biometricRatchetUIContextFromAttributes:(id)a3
{
  RUIServerHookDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AKBiometricRatchetUIContext *v16;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKBiometricRatchetHook _biometricRatchetUIContextFromAttributes:].cold.2((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[AKBiometricRatchetHook _biometricRatchetUIContextFromAttributes:].cold.1(v9);
  }

  v16 = -[AKBiometricRatchetUIContext initWithAttributes:presentationContext:]([AKBiometricRatchetUIContext alloc], "initWithAttributes:presentationContext:", v5, v7);
  return v16;
}

- (void)_updateResponseWithRatchetResult:(id)a3
{
  void *v4;
  __CFString *v5;
  id v6;
  NSString *context;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ratchetState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toString:", objc_msgSend(v4, "rawState"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v5, "length"))
  {

    v5 = CFSTR("undefined");
  }
  v6 = objc_alloc_init(MEMORY[0x1E0D872E0]);
  v9[0] = CFSTR("ratchetState");
  v9[1] = CFSTR("context");
  context = self->_context;
  v10[0] = v5;
  v10[1] = context;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalPayload:", v8);

  -[AKBiometricRatchetHook setServerHookResponse:](self, "setServerHookResponse:", v6);
}

- (void)_updateResponseWithContext
{
  id v3;
  NSString *context;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D872E0]);
  context = self->_context;
  v6 = CFSTR("context");
  v7[0] = context;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdditionalPayload:", v5);

  -[AKBiometricRatchetHook setServerHookResponse:](self, "setServerHookResponse:", v3);
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
  objc_storeStrong((id *)&self->_biometricRatchetController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_armBiometricRatchetWithServerAttributes:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "DTO feature not enabled, no arming required, sending success back", v1, 2u);
}

void __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD795000, a2, a3, "Received response from arming ratchet call: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __78__AKBiometricRatchetHook__armBiometricRatchetWithServerAttributes_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "Error during arming ratchet: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)_biometricRatchetUIContextFromAttributes:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "biometricRatchetUIContext - passing nil presentation context", v1, 2u);
}

- (void)_biometricRatchetUIContextFromAttributes:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD795000, a2, a3, "biometricRatchetUIContext - passing presentation context - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
