@implementation CDPCustodianRecoveryController

- (CDPCustodianRecoveryController)initWithContext:(id)a3
{
  id v5;
  CDPCustodianRecoveryController *v6;
  CDPCustodianRecoveryController *v7;
  AACustodianController *v8;
  AACustodianController *custodianController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPCustodianRecoveryController;
  v6 = -[CDPCustodianRecoveryController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = (AACustodianController *)objc_alloc_init(MEMORY[0x24BE04930]);
    custodianController = v7->_custodianController;
    v7->_custodianController = v8;

  }
  return v7;
}

- (void)startRecoverySessionWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  AACustodianController *custodianController;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE04938]);
  -[CDPContext appleID](self->_context, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOwnerAppleID:", v6);

  objc_initWeak(&location, self);
  custodianController = self->_custodianController;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke;
  v9[3] = &unk_24C7C1640;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  -[AACustodianController startCustodianRecoveryWithContext:completion:](custodianController, "startCustodianRecoveryWithContext:completion:", v5, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  NSObject *v9;
  NSObject *v10;
  void (*v11)(void);
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_20D7E6000, v10, OS_LOG_TYPE_DEFAULT, "@\"Successfuly obtained custodian recovery session: %@\", (uint8_t *)&v12, 0xCu);
      }

      objc_storeStrong(WeakRetained + 2, a2);
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke_cold_1((uint64_t)v7, v10);

      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v11();
  }

}

- (void)validateRecoveryCode:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  AACustodianController *custodianController;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE04938]);
  objc_msgSend(v8, "setRecoverySessionID:", self->_recoverySession);
  objc_msgSend(v8, "setRecoveryCode:", v6);
  objc_initWeak(&location, self);
  custodianController = self->_custodianController;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke;
  v11[3] = &unk_24C7C1668;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  -[AACustodianController validateCustodianRecoveryCodeWithContext:completion:](custodianController, "validateCustodianRecoveryCodeWithContext:completion:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && (objc_msgSend(v5, "custodianUUID"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "custodianUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_20D7E6000, v9, OS_LOG_TYPE_DEFAULT, "@\"Successfuly validated custodian recovery code for custodian with UUID: %@\", (uint8_t *)&v16, 0xCu);

    }
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke_cold_1(v12);

    objc_msgSend(WeakRetained, "_fetchRecoveryInfoWithCompletion:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "custodianUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_20D7E6000, v13, OS_LOG_TYPE_DEFAULT, "@\"Validation of custodian recovery code for custodian with UUID: %@ failed with error: %@\", (uint8_t *)&v16, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_fetchRecoveryInfoWithCompletion:(id)a3
{
  id v4;
  AACustodianController *custodianController;
  NSString *recoverySession;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  recoverySession = self->_recoverySession;
  custodianController = self->_custodianController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__CDPCustodianRecoveryController__fetchRecoveryInfoWithCompletion___block_invoke;
  v8[3] = &unk_24C7C1690;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[AACustodianController fetchCustodianRecoveryKeysWithSessionID:completion:](custodianController, "fetchCustodianRecoveryKeysWithSessionID:completion:", recoverySession, v8);

}

void __67__CDPCustodianRecoveryController__fetchRecoveryInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  char v10;
  CDPCustodianRecoveryInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CDPCustodianRecoveryInfo *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "@\"Successfuly obtained recovery keys for sessionID: %@\", (uint8_t *)&v18, 0xCu);
    }

    v10 = objc_opt_respondsToSelector();
    v11 = [CDPCustodianRecoveryInfo alloc];
    objc_msgSend(v5, "wrappedRKC");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wrappingKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "custodianUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v5, "recordBuildVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CDPCustodianRecoveryInfo initWithWrappedRKC:wrappingKey:custodianUUID:recordBuildVersion:](v11, "initWithWrappedRKC:wrappingKey:custodianUUID:recordBuildVersion:", v12, v13, v14, v15);

    }
    else
    {
      v16 = -[CDPCustodianRecoveryInfo initWithWrappedRKC:wrappingKey:custodianUUID:](v11, "initWithWrappedRKC:wrappingKey:custodianUUID:", v12, v13, v14);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "@\"Failed to fetch recovery keys for sessionID: %@ with error: %@\", (uint8_t *)&v18, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_recoverySession, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"Failed to obtain recoverySession with error: %@\", (uint8_t *)&v2, 0xCu);
}

void __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20D7E6000, log, OS_LOG_TYPE_DEBUG, "@\"Attempting to fetch custodian recovery keys\", v1, 2u);
}

@end
