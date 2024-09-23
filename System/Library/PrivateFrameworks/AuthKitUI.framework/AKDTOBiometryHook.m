@implementation AKDTOBiometryHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ak:biometrics"));

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

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ak:biometrics"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AKDTOBiometryHook _performDTOBiometricsWithServerAttributes:completion:](self, "_performDTOBiometricsWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKDTOBiometryHook _performDTOBiometricsWithServerAttributes:completion:](self, "_performDTOBiometricsWithServerAttributes:completion:", v7, v6);

}

- (void)_performDTOBiometricsWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSString *v10;
  NSString *context;
  __CFString *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D001A0]);
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("context"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (NSString *)v9;
  else
    v10 = 0;

  context = self->_context;
  self->_context = v10;

  if (self->_context)
    v12 = (__CFString *)self->_context;
  else
    v12 = &stru_1E7679C68;
  objc_storeStrong((id *)&self->_context, v12);
  if ((objc_msgSend(v8, "isDTOEnabled") & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fallback"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    if (v14)
      v23 = objc_msgSend(v14, "BOOLValue");
    else
      v23 = 0;
    v24 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v31[0] = &unk_1E769A998;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DTO_BIOMETRY_FALLBACK_ALERT_SUBTITLE"), &stru_1E7679C68, CFSTR("Localizable-DTO"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = &unk_1E769A9B0;
    v32[0] = v26;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke;
    v29[3] = &unk_1E7679110;
    v29[4] = self;
    v30 = v7;
    objc_msgSend(v24, "evaluatePolicy:options:reply:", 1025, v28, v29);

  }
  else
  {
    _AKLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AKDTOBiometryHook _performDTOBiometricsWithServerAttributes:completion:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    -[AKDTOBiometryHook _updateResponseWithContext](self, "_updateResponseWithContext");
    if (v7)
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateResponseWithContext");
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_2(v6);

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_1(v6, v9, v10, v11, v12, v13, v14, v15);

    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
    {
      v8 = *(void (**)(void))(v16 + 16);
      goto LABEL_10;
    }
  }

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

  -[AKDTOBiometryHook setServerHookResponse:](self, "setServerHookResponse:", v3);
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
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_performDTOBiometricsWithServerAttributes:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BD795000, a1, a3, "DTO feature not enabled, no arming required, sending success back", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BD795000, a1, a3, "Biometry succeeded, sending success response back to IdMS", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __74__AKDTOBiometryHook__performDTOBiometricsWithServerAttributes_completion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Biometry failed, sending failure response back to IdMS", v1, 2u);
  OUTLINED_FUNCTION_2();
}

@end
