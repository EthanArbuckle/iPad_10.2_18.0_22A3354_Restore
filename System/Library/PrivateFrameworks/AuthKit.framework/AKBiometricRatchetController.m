@implementation AKBiometricRatchetController

- (AKBiometricRatchetController)init
{
  AKBiometricRatchetController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKBiometricRatchetController;
  result = -[AKBiometricRatchetController init](&v3, sel_init);
  if (result)
    result->_dtoLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)stateWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CC12B0]);
  +[AKBiometricRatchetUtility ratchetIdentifier](AKBiometricRatchetUtility, "ratchetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__AKBiometricRatchetController_stateWithCompletion___block_invoke;
  v8[3] = &unk_1E2E61380;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "stateWithCompletion:", v8);

}

void __52__AKBiometricRatchetController_stateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__AKBiometricRatchetController_stateWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    +[AKBiometricRatchetUtility stateFromLARatchetState:](AKBiometricRatchetUtility, "stateFromLARatchetState:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v9, 0);

  }
}

- (void)armWithContext:(id)a3 completion:(id)a4
{
  id v7;
  AKBiometricRatchetContext **p_context;
  void (**v9)(id, _QWORD, uint64_t);
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;

  v7 = a3;
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  v9 = (void (**)(id, _QWORD, uint64_t))a4;
  LOBYTE(self) = objc_opt_respondsToSelector();
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((self & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKBiometricRatchetController armWithContext:completion:].cold.1(v11);

    -[AKBiometricRatchetContext presentRatchetUIWithCompletion:](*p_context, "presentRatchetUIWithCompletion:", v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKBiometricRatchetController armWithContext:completion:].cold.2(v11);

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7027);
    v12 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v12);

    v9 = (void (**)(id, _QWORD, uint64_t))v12;
  }

}

- (void)cancelWithReason:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CC12B0];
  v7 = a3;
  v8 = [v6 alloc];
  +[AKBiometricRatchetUtility ratchetIdentifier](AKBiometricRatchetUtility, "ratchetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__AKBiometricRatchetController_cancelWithReason_completion___block_invoke;
  v12[3] = &unk_1E2E5E220;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "cancelWithReason:completion:", v7, v12);

}

uint64_t __60__AKBiometricRatchetController_cancelWithReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isDTOEnabled
{
  os_unfair_lock_s *p_dtoLock;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;

  p_dtoLock = &self->_dtoLock;
  os_unfair_lock_lock(&self->_dtoLock);
  objc_msgSend(MEMORY[0x1E0CC12C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFeatureSupported"))
  {
    objc_msgSend(MEMORY[0x1E0CC12C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isFeatureAvailable"))
    {
      objc_msgSend(MEMORY[0x1E0CC12C0], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isFeatureEnabled");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  os_unfair_lock_unlock(p_dtoLock);
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetController isDTOEnabled].cold.1(v6, v7);

  return v6;
}

- (void)isCriticalEditAllowedForAltDSID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  AKAppleIDAuthenticationController *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(AKAppleIDAuthenticationController);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke;
  v10[3] = &unk_1E2E5E6D8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  -[AKAppleIDAuthenticationController getUserInformationForAltDSID:completion:](v7, "getUserInformationForAltDSID:completion:", v9, v10);

}

void __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_8:
      v9();
    }
  }
  else
  {
    objc_msgSend(v5, "criticalAccountEditsAllowed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "BOOLValue");

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }

}

- (id)currentRachetState
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t Nanoseconds;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v19;
  os_signpost_id_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _AKSignpostLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = _AKSignpostCreate(v2);
  v5 = v4;

  _AKSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "RatchetFetchState", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  _AKSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = v3;
    _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RatchetFetchState  enableTelemetry=YES ", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CC12C0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ratchetState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  Nanoseconds = _AKSignpostGetNanoseconds(v3, v5);
  _AKSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_19202F000, v13, OS_SIGNPOST_INTERVAL_END, v3, "RatchetFetchState", (const char *)&unk_192100ADF, (uint8_t *)&v19, 2u);
  }

  _AKSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218240;
    v20 = v3;
    v21 = 2048;
    v22 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:RatchetFetchState ", (uint8_t *)&v19, 0x16u);
  }

  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetController currentRachetState].cold.2(v10);

  +[AKBiometricRatchetUtility stateFromLARatchetState:](AKBiometricRatchetUtility, "stateFromLARatchetState:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[AKBiometricRatchetController currentRachetState].cold.1(v16);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __52__AKBiometricRatchetController_stateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Ratchet stateWithCompletion failed with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)armWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Presenting Ratchet UI", v1, 2u);
}

- (void)armWithContext:(os_log_t)log completion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Ratchet UI context doesn't respond to presentBiometricRatchetArmingUIWithCompletion", v1, 2u);
}

- (void)isDTOEnabled
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "dtoEnabled: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __75__AKBiometricRatchetController_isCriticalEditAllowedForAltDSID_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Failed to fetch user info for altDSID (%@) with error (%@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)currentRachetState
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "rawValue");
  OUTLINED_FUNCTION_4_2(&dword_19202F000, v1, v2, "LARatchet state: %lu", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
