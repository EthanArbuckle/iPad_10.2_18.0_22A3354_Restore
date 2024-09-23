@implementation CDPDPCSController

- (CDPDPCSController)init
{
  CDPDPCSController *v2;
  CDPProtectedCloudStorageProxy *v3;
  CDPProtectedCloudStorageProxy *pcsProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPDPCSController;
  v2 = -[CDPDPCSController init](&v6, sel_init);
  if (v2)
  {
    v3 = (CDPProtectedCloudStorageProxy *)objc_alloc_init(MEMORY[0x24BE1A470]);
    pcsProxy = v2->_pcsProxy;
    v2->_pcsProxy = v3;

  }
  return v2;
}

- (CDPDPCSController)initWithContext:(id)a3 pcsProxy:(id)a4
{
  id v7;
  id v8;
  CDPDPCSController *v9;
  CDPDPCSController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPDPCSController;
  v9 = -[CDPDPCSController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pcsProxy, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (void)recoverKeysWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting to recover PCS state\", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CDPDPCSController_recoverKeysWithCompletion___block_invoke;
  v7[3] = &unk_24C81C558;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDPCSController checkiCDPStatusNetwork:withCompletion:](self, "checkiCDPStatusNetwork:withCompletion:", 1, v7);

}

void __47__CDPDPCSController_recoverKeysWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[1];
    objc_msgSend(v6, "_contextSetupDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v7, "pcsRestoreLocalBackup:error:", v8, &v12);
    v10 = v12;

  }
  else
  {
    _CDPStateError();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"PCS State restored %{BOOL}d with error: %@\", buf, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)recoverAndSynchronizeKeysWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting to synchronize PCS state\", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CDPDPCSController_recoverAndSynchronizeKeysWithCompletion___block_invoke;
  v7[3] = &unk_24C81C558;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDPCSController checkiCDPStatusNetwork:withCompletion:](self, "checkiCDPStatusNetwork:withCompletion:", 1, v7);

}

void __61__CDPDPCSController_recoverAndSynchronizeKeysWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[1];
    objc_msgSend(v6, "_contextSetupDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v7, "pcsSynchronizeKeysWithInfo:error:", v8, &v12);
    v10 = v12;

  }
  else
  {
    _CDPStateError();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"PCS State synchronized %{BOOL}d with error: %@\", buf, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkiCDPStatusNetwork:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  _QWORD aBlock[4];
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v8 = v6;
  v15 = v8;
  v9 = _Block_copy(aBlock);
  -[CDPContext passwordEquivToken](self->_context, "passwordEquivToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke_2;
    v11[3] = &unk_24C81C5A8;
    v11[4] = self;
    v13 = v4;
    v12 = v9;
    -[CDPDPCSController _checkiCDPStatusNetwork:withCompletion:](self, "_checkiCDPStatusNetwork:withCompletion:", v4, v11);

  }
  else
  {
    -[CDPDPCSController _reauthenticateAndCheckiCDPStatusWithNetwork:completion:](self, "_reauthenticateAndCheckiCDPStatusWithNetwork:completion:", v4, v9);
  }

}

uint64_t __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__CDPDPCSController_checkiCDPStatusNetwork_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isAuthenticationError"))
    objc_msgSend(*(id *)(a1 + 32), "_reauthenticateAndCheckiCDPStatusWithNetwork:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_reauthenticateAndCheckiCDPStatusWithNetwork:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CDPContext *context;
  id v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;

  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDPCSController _reauthenticateAndCheckiCDPStatusWithNetwork:completion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  context = self->_context;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__CDPDPCSController__reauthenticateAndCheckiCDPStatusWithNetwork_completion___block_invoke;
  v17[3] = &unk_24C81C5A8;
  v19 = a3;
  v17[4] = self;
  v18 = v6;
  v16 = v6;
  -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v17);

}

void __77__CDPDPCSController__reauthenticateAndCheckiCDPStatusWithNetwork_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_checkiCDPStatusNetwork:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_checkiCDPStatusNetwork:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, id);
  _PCSIdentitySetData *v7;
  id v8;
  NSObject *v9;
  CDPProtectedCloudStorageProxy *pcsProxy;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v6 = (void (**)(id, uint64_t, id))a4;
  v17 = 0;
  v7 = -[CDPDPCSController _getOrSetupIdentitySetRef:](self, "_getOrSetupIdentitySetRef:", &v17);
  v8 = v17;
  if (v7)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CDPDPCSController _checkiCDPStatusNetwork:withCompletion:].cold.2(v4, v9);

    pcsProxy = self->_pcsProxy;
    if (v4)
    {
      -[CDPDPCSController _contextSetupDictionary](self, "_contextSetupDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v12 = -[CDPProtectedCloudStorageProxy pcsIdentitySetIsInICDPNetwork:options:error:](pcsProxy, "pcsIdentitySetIsInICDPNetwork:options:error:", v7, v11, &v16);
      v13 = v16;

    }
    else
    {
      v15 = 0;
      v12 = -[CDPProtectedCloudStorageProxy pcsIdentitySetIsInICDPLocal:error:](pcsProxy, "pcsIdentitySetIsInICDPLocal:error:", v7, &v15);
      v13 = v15;
    }
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CDPDPCSController _checkiCDPStatusNetwork:withCompletion:].cold.1(v12, (uint64_t)v13, v14);

    if (v6)
      v6[2](v6, v12, v13);
    CFRelease(v7);

  }
  else if (v6)
  {
    v6[2](v6, 0, v8);
  }

}

- (BOOL)isCloudProtectionEnabledLocally:(id *)a3
{
  NSObject *v5;
  void *v6;
  CDPProtectedCloudStorageProxy *pcsProxy;
  const void *v8;
  id v9;
  void *v10;
  CDPProtectedCloudStorageProxy *v11;
  char v12;
  uint64_t v14;
  id v15;
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Checking local iCDP state...\", buf, 2u);
  }

  -[CDPDPCSController _contextSetupDictionary](self, "_contextSetupDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pcsProxy = self->_pcsProxy;
  v15 = 0;
  v8 = (const void *)-[CDPProtectedCloudStorageProxy pcsIdentityCreateWithInfo:error:](pcsProxy, "pcsIdentityCreateWithInfo:error:", v6, &v15);
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v11 = self->_pcsProxy;
    v14 = 0;
    v12 = -[CDPProtectedCloudStorageProxy pcsIdentitySetIsInICDPLocal:error:](v11, "pcsIdentitySetIsInICDPLocal:error:", v8, &v14);
    CFRelease(v8);
  }
  else
  {
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v9);
  }

  return v12;
}

- (BOOL)isCompanionInKeychainCircle:(id *)a3
{
  NSObject *v5;
  void *v6;
  CDPProtectedCloudStorageProxy *pcsProxy;
  const void *v8;
  id v9;
  void *v10;
  CDPProtectedCloudStorageProxy *v11;
  char v12;
  uint64_t v14;
  id v15;
  uint8_t buf[16];

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Checking companion circle state...\", buf, 2u);
  }

  -[CDPDPCSController _contextSetupDictionary](self, "_contextSetupDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pcsProxy = self->_pcsProxy;
  v15 = 0;
  v8 = (const void *)-[CDPProtectedCloudStorageProxy pcsIdentityCreateWithInfo:error:](pcsProxy, "pcsIdentityCreateWithInfo:error:", v6, &v15);
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v11 = self->_pcsProxy;
    v14 = 0;
    v12 = -[CDPProtectedCloudStorageProxy pcsIdentitySetCompanionInCircle:error:](v11, "pcsIdentitySetCompanionInCircle:error:", v8, &v14);
    CFRelease(v8);
  }
  else
  {
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v9);
  }

  return v12;
}

- (_PCSIdentitySetData)_getOrSetupIdentitySetRef:(id *)a3
{
  void *v4;
  CDPProtectedCloudStorageProxy *pcsProxy;
  _PCSIdentitySetData *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  CDPProtectedCloudStorageProxy *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;

  -[CDPDPCSController _contextSetupDictionary](self, "_contextSetupDictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pcsProxy = self->_pcsProxy;
  v22 = 0;
  v6 = (_PCSIdentitySetData *)-[CDPProtectedCloudStorageProxy pcsIdentityCreateWithInfo:error:](pcsProxy, "pcsIdentityCreateWithInfo:error:", v4, &v22);
  v7 = v22;
  v8 = v7;
  if (v6)
  {
    v9 = v7;
LABEL_6:
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDPDPCSController _getOrSetupIdentitySetRef:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_8;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CDPDPCSController _getOrSetupIdentitySetRef:].cold.3();

  v11 = self->_pcsProxy;
  v21 = v8;
  v6 = (_PCSIdentitySetData *)-[CDPProtectedCloudStorageProxy pcsIdentitySetupWithInfo:error:](v11, "pcsIdentitySetupWithInfo:error:", v4, &v21);
  v9 = v21;

  if (v6)
    goto LABEL_6;
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CDPDPCSController _getOrSetupIdentitySetRef:].cold.1();
  v6 = 0;
LABEL_8:

  return v6;
}

- (void)enableCDPWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CDPDPCSController_enableCDPWithCompletion___block_invoke;
  v6[3] = &unk_24C81C558;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CDPDPCSController _enableCDPWithCompletion:](self, "_enableCDPWithCompletion:", v6);

}

void __45__CDPDPCSController_enableCDPWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (objc_msgSend(v5, "isAuthenticationError"))
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(v7 + 16);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_12;
    v11[3] = &unk_24C81C558;
    v11[4] = v7;
    v12 = v8;
    objc_msgSend(v9, "reauthenticateUserWithCompletion:", v11);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
  }

}

void __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_12(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_enableCDPWithCompletion:", *(_QWORD *)(a1 + 40));
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_enableCDPWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  CDPProtectedCloudStorageProxy *pcsProxy;
  uint64_t v7;
  id v8;
  id v9;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[CDPDPCSController _contextSetupDictionary](self, "_contextSetupDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pcsProxy = self->_pcsProxy;
  v9 = 0;
  v7 = -[CDPProtectedCloudStorageProxy pcsIdentityMigrateToiCDPWithInfo:error:](pcsProxy, "pcsIdentityMigrateToiCDPWithInfo:error:", v5, &v9);
  v8 = v9;
  if (v4)
    v4[2](v4, v7, v8);

}

- (id)pcsKeysForService:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Checking PCS identities for service: %@\", buf, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v6)
  {
    if (-[CDPDPCSController _shoudAllowKeyFetchForService:](self, "_shoudAllowKeyFetchForService:", v6))
    {
      -[CDPDPCSController _contextSetupDictionary](self, "_contextSetupDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _CDPLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[CDPDPCSController pcsKeysForService:error:].cold.4();

      v11 = -[CDPProtectedCloudStorageProxy pcsIdentityCreateWithInfo:error:](self->_pcsProxy, "pcsIdentityCreateWithInfo:error:", v9, a4);
      if (v11)
      {
        v12 = (const void *)v11;
        v25 = *MEMORY[0x24BE7AED0];
        v26 = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CDPLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[CDPDPCSController pcsKeysForService:error:].cold.3();

        v23 = v8;
        v24 = v13;
        v15 = v13;
        PCSIdentitySetEnumerateIdentities();
        CFRelease(v12);

      }
      else if (a4)
      {
        _CDPLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[CDPDPCSController pcsKeysForService:error:].cold.2(a4, v21);

        v16 = 0;
        goto LABEL_26;
      }
      v16 = (void *)objc_msgSend(v8, "copy");
LABEL_26:

      goto LABEL_27;
    }
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CDPDPCSController pcsKeysForService:error:].cold.5();

    if (a4)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = -5302;
      goto LABEL_20;
    }
LABEL_21:
    v16 = 0;
    goto LABEL_27;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[CDPDPCSController pcsKeysForService:error:].cold.1(v17);

  if (!a4)
    goto LABEL_21;
  v18 = (void *)MEMORY[0x24BDD1540];
  v19 = -5003;
LABEL_20:
  objc_msgSend(v18, "cdp_errorWithCode:", v19);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v16;
}

void __45__CDPDPCSController_pcsKeysForService_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "_fetchKeyForPCSIdentityRef:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__CDPDPCSController_pcsKeysForService_error___block_invoke_cold_1(a1, v4);

}

- (id)_fetchKeyForPCSIdentityRef:(_PCSIdentityData *)a3
{
  void *v3;
  void *v4;

  _PCSIdentityGetKey();
  v3 = (void *)_PCSKeyCopyExportedPrivateKey();
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4;
}

- (BOOL)_shoudAllowKeyFetchForService:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _shoudAllowKeyFetchForService__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_shoudAllowKeyFetchForService__onceToken, &__block_literal_global_1);
  v5 = objc_msgSend((id)_shoudAllowKeyFetchForService__allowedServices, "containsObject:", v4);

  return v5;
}

void __51__CDPDPCSController__shoudAllowKeyFetchForService___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE7AE70], *MEMORY[0x24BE7AE78], *MEMORY[0x24BE7AE98], *MEMORY[0x24BE7AE90], *MEMORY[0x24BE7AE88], *MEMORY[0x24BE7AEA8], *MEMORY[0x24BE7AE80], *MEMORY[0x24BE7AEA0], *MEMORY[0x24BE1A840], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_shoudAllowKeyFetchForService__allowedServices;
  _shoudAllowKeyFetchForService__allowedServices = v0;

}

- (id)_contextSetupDictionary
{
  return (id)objc_msgSend(MEMORY[0x24BE1A468], "setupDictionaryWithContext:", self->_context);
}

- (CDPProtectedCloudStorageProxy)pcsProxy
{
  return self->_pcsProxy;
}

- (void)setPcsProxy:(id)a3
{
  objc_storeStrong((id *)&self->_pcsProxy, a3);
}

- (CDPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pcsProxy, 0);
}

- (void)_reauthenticateAndCheckiCDPStatusWithNetwork:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"Silent auth requested prior to checking CDP state\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_checkiCDPStatusNetwork:(os_log_t)log withCompletion:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"PCSIdentitySetIsICDPNetwork returned isEnabled=%i error=%@\", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)_checkiCDPStatusNetwork:(char)a1 withCompletion:(NSObject *)a2 .cold.2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Checking iCDP State. Networked: %{BOOL}d\", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_getOrSetupIdentitySetRef:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"PCSIdentitySetup returned NULL with error: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_getOrSetupIdentitySetRef:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_20DB2C000, a1, a3, "\"PCS Identity fetched\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_0();
}

- (void)_getOrSetupIdentitySetRef:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"PCSIdentityCreate return NULL with error: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __45__CDPDPCSController_enableCDPWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating on error from enableCDPWithCompletion: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)pcsKeysForService:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"No service name provided, no key to fetch.\", v1, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)pcsKeysForService:(id *)a1 error:(NSObject *)a2 .cold.2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v4, "\"Failed to create PCS identity set with error: %@\", v5);

  OUTLINED_FUNCTION_6();
}

- (void)pcsKeysForService:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Fetching keys for service %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)pcsKeysForService:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Fetching keys with setupInfo: %{private}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)pcsKeysForService:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Fetching keys for %@ is not allowed.\", v2);
  OUTLINED_FUNCTION_4();
}

void __45__CDPDPCSController_pcsKeysForService_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "count");
  OUTLINED_FUNCTION_1();
  v5 = 2112;
  v6 = v3;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Fetched %lu keys for service %@\", v4, 0x16u);
  OUTLINED_FUNCTION_6();
}

@end
