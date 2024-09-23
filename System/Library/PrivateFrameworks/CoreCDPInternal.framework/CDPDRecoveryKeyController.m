@implementation CDPDRecoveryKeyController

- (CDPDRecoveryKeyController)initWithContext:(id)a3
{
  return -[CDPDRecoveryKeyController initWithContext:uiProvider:](self, "initWithContext:uiProvider:", a3, 0);
}

- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4
{
  return -[CDPDRecoveryKeyController initWithContext:uiProvider:authProvider:](self, "initWithContext:uiProvider:authProvider:", a3, a4, 0);
}

- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  CDPDSecureBackupProxyImpl *v13;
  CDPDOctagonTrustProxyImpl *v14;
  id v15;
  CDPDRecoveryKeyController *v16;

  v8 = (objc_class *)MEMORY[0x24BE1A3E8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithContext:", v11);
  v13 = -[CDPDSecureBackupProxyImpl initWithContext:]([CDPDSecureBackupProxyImpl alloc], "initWithContext:", v11);
  v14 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", v11);
  v15 = objc_alloc_init(MEMORY[0x24BE1A470]);
  v16 = -[CDPDRecoveryKeyController initWithContext:uiProvider:authProvider:circleProxy:secureBackupProxy:octagonTrustProxy:pcsProxy:](self, "initWithContext:uiProvider:authProvider:circleProxy:secureBackupProxy:octagonTrustProxy:pcsProxy:", v11, v10, v9, v12, v13, v14, v15);

  return v16;
}

- (CDPDRecoveryKeyController)initWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 circleProxy:(id)a6 secureBackupProxy:(id)a7 octagonTrustProxy:(id)a8 pcsProxy:(id)a9
{
  id v16;
  id v17;
  id v18;
  CDPDRecoveryKeyController *v19;
  CDPDRecoveryKeyController *v20;
  CDPDAuthProxyImpl *v21;
  CDPDAuthProviderInternal *internalAuthProvider;
  CDPDPCSController *v23;
  CDPDPCSController *pcsController;
  CDPDSecureBackupController *v25;
  CDPDSecureBackupController *secureBackupController;
  id v28;
  id v29;
  id v30;
  id v31;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = -[CDPDRecoveryKeyController init](self, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_context, a3);
    objc_storeStrong((id *)&v20->_uiProvider, a4);
    objc_storeStrong((id *)&v20->_recoveryAuthProvider, a5);
    v21 = objc_alloc_init(CDPDAuthProxyImpl);
    internalAuthProvider = v20->_internalAuthProvider;
    v20->_internalAuthProvider = (CDPDAuthProviderInternal *)v21;

    objc_storeStrong((id *)&v20->_circleProxy, a6);
    objc_storeStrong((id *)&v20->_sbProxy, a7);
    objc_storeStrong((id *)&v20->_otProxy, a8);
    v23 = -[CDPDPCSController initWithContext:pcsProxy:]([CDPDPCSController alloc], "initWithContext:pcsProxy:", v20->_context, v18, v28, v29, v30, v31);
    pcsController = v20->_pcsController;
    v20->_pcsController = v23;

    v25 = -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:]([CDPDSecureBackupController alloc], "initWithContext:secureBackupProxy:octagonTrustProxy:", v20->_context, v20->_sbProxy, v20->_otProxy);
    secureBackupController = v20->_secureBackupController;
    v20->_secureBackupController = v25;

  }
  return v20;
}

- (void)recoverState:(id)a3
{
  -[CDPDPCSController recoverKeysWithCompletion:](self->_pcsController, "recoverKeysWithCompletion:", a3);
}

- (void)recoverAndSynchronizeStateWithServer:(id)a3
{
  -[CDPDPCSController recoverAndSynchronizeKeysWithCompletion:](self->_pcsController, "recoverAndSynchronizeKeysWithCompletion:", a3);
}

- (BOOL)isRecoveryKeyAvailableWithError:(id *)a3
{
  NSObject *v5;

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryKeyController isRecoveryKeyAvailableWithError:].cold.1();

  return -[CDPDSecureBackupController supportsRecoveryKeyWithError:](self->_secureBackupController, "supportsRecoveryKeyWithError:", a3);
}

- (BOOL)isWalrusRecoveryKeyAvailableWithError:(id *)a3
{
  return -[CDPDSecureBackupController supportsWalrusRecoveryKeyWithError:](self->_secureBackupController, "supportsWalrusRecoveryKeyWithError:", a3);
}

- (void)verifyRecoveryKey:(id)a3
{
  id v4;
  void *v5;
  CDPDRecoveryKeyValidator *v6;
  CDPStateUIProviderInternal *uiProvider;
  CDPContext *context;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  CDPDRecoveryKeyController *v14;

  v4 = a3;
  -[CDPContext dsid](self->_context, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[CDPDDeviceSecretValidator initWithContext:delegate:]([CDPDRecoveryKeyValidator alloc], "initWithContext:delegate:", self->_context, self);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__3;
    v13[4] = __Block_byref_object_dispose__3;
    v14 = self;
    uiProvider = v14->_uiProvider;
    context = self->_context;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__CDPDRecoveryKeyController_verifyRecoveryKey___block_invoke;
    v10[3] = &unk_24C81CE60;
    v11 = v4;
    v12 = v13;
    -[CDPStateUIProviderInternal cdpContext:promptForRecoveryKeyWithSecretValidator:completion:](uiProvider, "cdpContext:promptForRecoveryKeyWithSecretValidator:completion:", context, v6, v10);

    _Block_object_dispose(v13, 8);
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryKeyController verifyRecoveryKey:].cold.1();

  if (v4)
  {
    _CDPStateError();
    v6 = (CDPDRecoveryKeyValidator *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CDPDRecoveryKeyValidator *))v4 + 2))(v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:

}

void __47__CDPDRecoveryKeyController_verifyRecoveryKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Recovery key verification UI flow completed with success: %{BOOL}d - %@\", (uint8_t *)v10, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)generateNewRecoveryKey:(id)a3
{
  id v4;
  void *v5;
  CDPDRecoveryKeyValidatorImpl *v6;
  CDPContext *context;
  void *v8;
  CDPDRecoveryKeyValidatorImpl *v9;
  CDPDRecoveryKeyController *v10;
  CDPStateUIProviderInternal *uiProvider;
  CDPContext *v12;
  CDPDRecoveryKeyValidatorImpl *v13;
  NSObject *v14;
  _QWORD v15[4];
  CDPDRecoveryKeyValidatorImpl *v16;
  CDPDRecoveryKeyController *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  CDPDRecoveryKeyController *v21;

  v4 = a3;
  -[CDPContext dsid](self->_context, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [CDPDRecoveryKeyValidatorImpl alloc];
    context = self->_context;
    -[CDPDRecoveryKeyController otProxy](self, "otProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CDPDRecoveryKeyValidatorImpl initWithContext:delegate:octagonTrustProxy:](v6, "initWithContext:delegate:octagonTrustProxy:", context, self, v8);

    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__3;
    v20[4] = __Block_byref_object_dispose__3;
    v10 = self;
    v21 = v10;
    uiProvider = v10->_uiProvider;
    v12 = self->_context;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke;
    v15[3] = &unk_24C81CEB0;
    v13 = v9;
    v16 = v13;
    v17 = v10;
    v18 = v4;
    v19 = v20;
    -[CDPStateUIProviderInternal cdpContext:presentRecoveryKeyWithValidator:completion:](uiProvider, "cdpContext:presentRecoveryKeyWithValidator:completion:", v12, v13, v15);

    _Block_object_dispose(v20, 8);
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryKeyController verifyRecoveryKey:].cold.1();

  if (v4)
  {
    _CDPStateError();
    v13 = (CDPDRecoveryKeyValidatorImpl *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CDPDRecoveryKeyValidatorImpl *))v4 + 2))(v4, 0, v13);
    goto LABEL_7;
  }
LABEL_8:

}

void __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v26 = a2;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Recovery key UI flow completed with success %{BOOL}d - %@\", buf, 0x12u);
  }

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "recoveryKeyVerified"))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Recovery Key verified!\", buf, 2u);
    }

    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(*(id *)(a1 + 32), "recoveryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v8, "generateVerifierWithRecoveryKey:error:", v9, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    if (!v10 || v11)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(a1 + 48);
      v14 = *(void **)(v12 + 72);
      v15 = *(_QWORD *)(v12 + 8);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_20;
      v20[3] = &unk_24C81CE88;
      v22 = v13;
      v23 = a2;
      v21 = v5;
      objc_msgSend(v14, "cdpContext:persistMasterKeyVerifier:completion:", v15, v10, v20);

    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v16 + 16))(*(_QWORD *)(a1 + 48), 0, v5);
    }
    else
    {
      _CDPStateError();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

    }
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

}

void __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_20_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryKeyController authenticateAndGenerateNewRecoveryKeyWithCompletion:].cold.1();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_24C81CED8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:](self, "_authenticateAndPerformRecoveryKeyOperation:completion:", v7, v6);

}

uint64_t __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "generateNewRecoveryKey:", *(_QWORD *)(a1 + 40));
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDRecoveryKeyController authenticateAndDeleteRecoveryKeyWithCompletion:].cold.1();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_24C81CED8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:](self, "_authenticateAndPerformRecoveryKeyOperation:completion:", v7, v6);

}

uint64_t __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "deleteRecoveryKeyWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_authenticateAndPerformRecoveryKeyOperation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CDPContext *context;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  -[CDPDRecoveryKeyController uiProvider](self, "uiProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

    -[CDPDRecoveryKeyController uiProvider](self, "uiProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke;
    v28[3] = &unk_24C81CF00;
    v29 = v6;
    v30 = v7;
    objc_msgSend(v18, "cdpContext:promptForLocalSecretWithCompletion:", context, v28);

    v20 = v29;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:].cold.1(v10, v21, v22, v23, v24, v25, v26, v27);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5306);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);
LABEL_9:

  }
}

void __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_1((uint64_t)v6, v15);

    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v6);
  }

}

- (void)deleteRecoveryKeyWithCompletion:(id)a3
{
  id v4;
  CDPDSecureBackupController *secureBackupController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  secureBackupController = self->_secureBackupController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke;
  v7[3] = &unk_24C81CF28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDSecureBackupController disableRecoveryKeyFromAllSystemsWithCompletion:](secureBackupController, "disableRecoveryKeyFromAllSystemsWithCompletion:", v7);

}

void __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(v2 + 72);
    v5 = *(_QWORD *)(v2 + 8);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2;
    v6[3] = &unk_24C81C580;
    v7 = v3;
    objc_msgSend(v4, "cdpContext:persistMasterKeyVerifier:completion:", v5, MEMORY[0x24BDBD1B8], v6);

  }
}

void __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)generateRandomRecoveryKey:(id)a3
{
  id v4;
  CDPDRecoveryKeyValidatorImpl *v5;
  CDPContext *context;
  void *v7;
  CDPDRecoveryKeyValidatorImpl *v8;
  id v9;
  CDPDRecoveryKeyValidatorImpl *v10;
  _QWORD v11[4];
  CDPDRecoveryKeyValidatorImpl *v12;
  CDPDRecoveryKeyController *v13;
  id v14;

  v4 = a3;
  v5 = [CDPDRecoveryKeyValidatorImpl alloc];
  context = self->_context;
  -[CDPDRecoveryKeyController otProxy](self, "otProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CDPDRecoveryKeyValidatorImpl initWithContext:delegate:octagonTrustProxy:](v5, "initWithContext:delegate:octagonTrustProxy:", context, self, v7);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke;
  v11[3] = &unk_24C81CFA0;
  v13 = self;
  v14 = v4;
  v12 = v8;
  v9 = v4;
  v10 = v8;
  -[CDPDRecoveryKeyValidatorImpl generateRecoveryKey:](v10, "generateRecoveryKey:", v11);

}

void __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_2;
  v7[3] = &unk_24C81CF78;
  v8 = v4;
  v5 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v5;
  v9 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v8, "confirmRecoveryKey:completion:", v6, v7);

}

void __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldClearRKCacheAfterGeneration"))
  {
    +[CDPRecoveryKeyCache sharedInstance](CDPRecoveryKeyCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteCache");

  }
  if (v4
    || (objc_msgSend(*(id *)(a1 + 32), "recoveryKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(*(id *)(a1 + 32), "recoveryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "generateVerifierWithRecoveryKey:error:", v8, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;

    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(v11 + 72);
      v13 = *(_QWORD *)(v11 + 8);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_3;
      v14[3] = &unk_24C81CF50;
      v16 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v12, "cdpContext:persistMasterKeyVerifier:completion:", v13, v9, v14);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __55__CDPDRecoveryKeyController_generateRandomRecoveryKey___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)recoverDataUsingMasterKeyWithCompletion:(id)a3
{
  id v4;
  CDPDAccountRecoveryValidator *v5;
  CDPContext *context;
  CDPAuthProviderInternal *recoveryAuthProvider;
  void *v8;
  CDPDAccountRecoveryValidator *v9;
  CDPStateUIProviderInternal *uiProvider;
  CDPContext *v11;
  id v12;
  CDPDAccountRecoveryValidator *v13;
  _QWORD v14[4];
  CDPDAccountRecoveryValidator *v15;
  CDPDRecoveryKeyController *v16;
  id v17;

  v4 = a3;
  v5 = [CDPDAccountRecoveryValidator alloc];
  context = self->_context;
  recoveryAuthProvider = self->_recoveryAuthProvider;
  -[CDPDRecoveryKeyController otProxy](self, "otProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDPDAccountRecoveryValidator initWithContext:authProvider:octagonTrustProxy:](v5, "initWithContext:authProvider:octagonTrustProxy:", context, recoveryAuthProvider, v8);

  uiProvider = self->_uiProvider;
  v11 = self->_context;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke;
  v14[3] = &unk_24C81CDE8;
  v15 = v9;
  v16 = self;
  v17 = v4;
  v12 = v4;
  v13 = v9;
  -[CDPStateUIProviderInternal cdpContext:promptForRecoveryKeyWithValidator:completion:](uiProvider, "cdpContext:promptForRecoveryKeyWithValidator:completion:", v11, v13, v14);

}

void __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2
    && (objc_msgSend(*(id *)(a1 + 32), "recoveredInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Prompt for Recovery Key came back with success and recoveredInfo, attempting to cache with proxy %@\", buf, 0xCu);
    }

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(*(id *)(a1 + 32), "recoveryKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_29;
    v14[3] = &unk_24C81CF28;
    v16 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v9, "cacheRecoveryKey:completionBlock:", v10, v14);

  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_cold_1();

    v12 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v5);
    }
    else
    {
      _CDPStateError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
  }

}

void __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "recoveredInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (id)generateRecoveryKeyWithInfo:(id)a3 error:(id *)a4
{
  return (id)-[CDPDCircleProxy generateRecoveryKeyWithInfo:error:](self->_circleProxy, "generateRecoveryKeyWithInfo:error:", a3, a4);
}

- (void)secretValidator:(id)a3 validateRecoveryKeyWithContext:(id)a4 completion:(id)a5
{
  CDPContext *context;
  id v8;
  uint64_t v9;
  CDPDSecureBackupController *secureBackupController;
  id v11;

  context = self->_context;
  v8 = a5;
  v11 = a4;
  v9 = -[CDPContext type](context, "type");
  secureBackupController = self->_secureBackupController;
  if (v9 == 9)
    -[CDPDSecureBackupController validateAndRepairRecoveryKeyMismatchWithContext:authProvider:circleProxy:completion:](secureBackupController, "validateAndRepairRecoveryKeyMismatchWithContext:authProvider:circleProxy:completion:", v11, self->_internalAuthProvider, self->_circleProxy, v8);
  else
    -[CDPDSecureBackupController validateRecoveryKeyWithContext:completion:](secureBackupController, "validateRecoveryKeyWithContext:completion:", v11, v8);

}

- (void)secretValidator:(id)a3 recoverSecureBackupWithContext:(id)a4 completion:(id)a5
{
  -[CDPDSecureBackupController recoverSecureBackupWithContext:completion:](self->_secureBackupController, "recoverSecureBackupWithContext:completion:", a4, a5);
}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  return 0;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"CDPDRecoveryKeyController %p deallocated\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiProvider, a3);
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
  objc_storeStrong((id *)&self->_circleProxy, a3);
}

- (CDPDSecureBackupProxy)sbProxy
{
  return self->_sbProxy;
}

- (void)setSbProxy:(id)a3
{
  objc_storeStrong((id *)&self->_sbProxy, a3);
}

- (CDPDOctagonTrustProxy)otProxy
{
  return self->_otProxy;
}

- (void)setOtProxy:(id)a3
{
  objc_storeStrong((id *)&self->_otProxy, a3);
}

- (CDPAuthProviderInternal)recoveryAuthProvider
{
  return self->_recoveryAuthProvider;
}

- (void)setRecoveryAuthProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryAuthProvider, a3);
}

- (CDPDAuthProviderInternal)internalAuthProvider
{
  return self->_internalAuthProvider;
}

- (void)setInternalAuthProvider:(id)a3
{
  objc_storeStrong((id *)&self->_internalAuthProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAuthProvider, 0);
  objc_storeStrong((id *)&self->_recoveryAuthProvider, 0);
  objc_storeStrong((id *)&self->_otProxy, 0);
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_pcsController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)isRecoveryKeyAvailableWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Checking recovery key status from Secure Backup\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)verifyRecoveryKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Invalid context, assuming no primary account available\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __52__CDPDRecoveryKeyController_generateNewRecoveryKey___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to persist RK verifier: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Beginning authentication before generating new recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __81__CDPDRecoveryKeyController_authenticateAndGenerateNewRecoveryKeyWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Has local secret. Calling generateNewRecoveryKey (%s)\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)authenticateAndDeleteRecoveryKeyWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Beginning authentication before deleting recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __76__CDPDRecoveryKeyController_authenticateAndDeleteRecoveryKeyWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Has local secret. Calling deleteRecoveryKeyWithCompletion (%s)\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_authenticateAndPerformRecoveryKeyOperation:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a1, a3, "\"UI Provider is nil. Cannot proceed. (%s)\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_authenticateAndPerformRecoveryKeyOperation:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Prompting for local secret (%s)\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[CDPDRecoveryKeyController _authenticateAndPerformRecoveryKeyOperation:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to get local secret with error (%s): %@\", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __84__CDPDRecoveryKeyController__authenticateAndPerformRecoveryKeyOperation_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Came back with local secret and maybe error? (%s)\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __61__CDPDRecoveryKeyController_deleteRecoveryKeyWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to persist verifier: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __69__CDPDRecoveryKeyController_recoverDataUsingMasterKeyWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Recovery Key prompt came back with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
