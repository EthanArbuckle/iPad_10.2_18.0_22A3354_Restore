@implementation AAUICDPRecoveryKeyHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v4;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AAUICDPRecoveryKeyHook _shouldMatchAction:](self, "_shouldMatchAction:", v4);

  return (char)self;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = -[AAUICDPRecoveryKeyHook _shouldMatchAction:](self, "_shouldMatchAction:", v7);
  return v8;
}

- (BOOL)_shouldMatchAction:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rk:regenerate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("rk:enable")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("rk:disable")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("rk:verify"));
  }

  return v4;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  AAUICDPRecoveryKeyHook *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v19, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("rk:regenerate"));

  if (v12)
  {
    v13 = self;
    v14 = 4;
LABEL_5:
    -[AAUICDPRecoveryKeyHook _generateRecoveryKeyWithType:attributes:completion:](v13, "_generateRecoveryKeyWithType:attributes:completion:", v14, v9, v10);
    goto LABEL_6;
  }
  objc_msgSend(v19, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("rk:enable"));

  if (v16)
  {
    v13 = self;
    v14 = 5;
    goto LABEL_5;
  }
  objc_msgSend(v19, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("rk:disable"));

  if (v18)
    -[AAUICDPRecoveryKeyHook _deleteRecoveryKey:](self, "_deleteRecoveryKey:", v10);
LABEL_6:

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  AAUICDPRecoveryKeyHook *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(v13, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("rk:regenerate")))
  {
    objc_msgSend(v13, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    v12 = 4;
LABEL_8:
    -[AAUICDPRecoveryKeyHook _generateRecoveryKeyWithType:attributes:completion:](v11, "_generateRecoveryKeyWithType:attributes:completion:", v12, v10, v6);
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("rk:enable")))
  {
    objc_msgSend(v13, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    v12 = 5;
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("rk:verify")))
  {
    objc_msgSend(v13, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICDPRecoveryKeyHook _verifyRecoveryKeyWithType:attributes:completion:](self, "_verifyRecoveryKeyWithType:attributes:completion:", 8, v10, v6);
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("rk:disable")))
    -[AAUICDPRecoveryKeyHook _deleteRecoveryKey:](self, "_deleteRecoveryKey:", v6);
LABEL_10:

}

- (void)_deleteRecoveryKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D15780]);
  +[AAUICDPHelper cdpContextForPrimaryAccount](AAUICDPHelper, "cdpContextForPrimaryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContext:", v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke;
  v8[3] = &unk_1EA2DBC90;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "deleteRecoveryKey:", v8);

}

void __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_cold_1();
  }
  else
  {
    if (!(_DWORD)a2)
      goto LABEL_7;
    v6 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
    -[NSObject startHealthCheckWithCompletion:](v6, "startHealthCheckWithCompletion:", &__block_literal_global_6);
  }

LABEL_7:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

void __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1();

  }
}

- (void)_generateRecoveryKeyWithType:(int64_t)a3 attributes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a4;
  v9 = a5;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to generate recovery key", buf, 2u);
  }

  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D87318]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v13 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "helperWithPresenter:forceInline:", v15, objc_msgSend(v12, "BOOLValue"));
  v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)v23 + 5), "cdpStateControllerForPrimaryAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setType:", a3);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke;
  v19[3] = &unk_1EA2DBE68;
  v18 = v9;
  v20 = v18;
  v21 = buf;
  objc_msgSend(v16, "generateNewRecoveryKey:", v19);

  _Block_object_dispose(buf, 8);
}

void __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke_cold_1();
  }
  else
  {
    if (!(_DWORD)a2)
      goto LABEL_7;
    v6 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
    -[NSObject startHealthCheckWithCompletion:](v6, "startHealthCheckWithCompletion:", &__block_literal_global_38);
  }

LABEL_7:
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke_37(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __115__AAUIRecoveryFactorController__handleRecoveryKeyOperationResultWithSuccess_error_operationDescription_completion___block_invoke_cold_1();

  }
}

- (void)_verifyRecoveryKeyWithType:(int64_t)a3 attributes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t *v23;
  uint8_t v24[8];
  id v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a4;
  v9 = a5;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to verify recovery key", buf, 2u);
  }

  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D87318]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v13 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "helperWithPresenter:forceInline:", v15, objc_msgSend(v12, "BOOLValue"));
  v31 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*((id *)v27 + 5), "cdpStateControllerForPrimaryAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  LOBYTE(v15) = objc_msgSend(v16, "isRecoveryKeyAvailableWithError:", &v25);
  v17 = v25;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(v16, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setType:", a3);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__AAUICDPRecoveryKeyHook__verifyRecoveryKeyWithType_attributes_completion___block_invoke;
    v20[3] = &unk_1EA2DBE90;
    v20[4] = self;
    v21 = v8;
    v22 = v9;
    v23 = buf;
    objc_msgSend(v16, "verifyRecoveryKey:", v20);

  }
  else
  {
    _AAUILogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DB4ED000, v19, OS_LOG_TYPE_DEFAULT, "Recovery key missing - returning early, nothing to verify", v24, 2u);
    }

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15750], -5211, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v17);
  }

  _Block_object_dispose(buf, 8);
}

void __75__AAUICDPRecoveryKeyHook__verifyRecoveryKeyWithType_attributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "_verifyRecoveryKeyWithType completed with: %d, %@", (uint8_t *)v11, 0x12u);
  }

  if (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5308))
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "User reported forgot recovery key in verify recovery flow - will attempt to generate a recovery key", (uint8_t *)v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_generateRecoveryKeyWithType:attributes:completion:", 4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

+ (id)helperWithPresenter:(id)a3 forceInline:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  int v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "creating controller with inline forced: %@", (uint8_t *)&v11, 0xCu);

  }
  +[AAUICDPHelper helperWithPresenter:](AAUICDPHelper, "helperWithPresenter:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_msgSend(v8, "setForceInline:", isKindOfClass & 1);

  return v8;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error deleting the recovery key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __77__AAUICDPRecoveryKeyHook__generateRecoveryKeyWithType_attributes_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error generating recovery key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
