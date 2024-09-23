@implementation CDPDClientHandler

- (CDPDClientHandler)initWithConnection:(id)a3 entitlements:(unint64_t)a4 clientType:(unint64_t)a5
{
  id v9;
  CDPDClientHandler *v10;
  CDPDClientHandler *v11;
  CDPWalrusDaemonService *v12;
  CDPWalrusDaemonService *walrusDaemonService;

  v9 = a3;
  v10 = -[CDPDClientHandler init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a3);
    v11->_entitlements = a4;
    v11->_clientType = a5;
    v12 = -[CDPWalrusDaemonService initWithEntitlements:]([CDPWalrusDaemonService alloc], "initWithEntitlements:", a4);
    walrusDaemonService = v11->_walrusDaemonService;
    v11->_walrusDaemonService = v12;

  }
  return v11;
}

- (void)walrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setEndpoint:", 3540853470);
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CDPDClientHandler_walrusStatusWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C848;
  v12 = v8;
  v9 = v8;
  v10 = _Block_copy(aBlock);
  -[CDPWalrusDaemonService walrusStatusWithContext:completion:](self->_walrusDaemonService, "walrusStatusWithContext:completion:", v6, v10);

}

uint64_t __56__CDPDClientHandler_walrusStatusWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchEscrowRecordDevicesWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  NSObject *v15;
  CDPDSecureBackupController *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setEndpoint:", 1288689617);
  v10 = _Block_copy(v9);

  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke;
  aBlock[3] = &unk_24C81D090;
  v12 = v10;
  v21 = v12;
  v13 = _Block_copy(aBlock);
  if (-[CDPDClientHandler _allowDataRecovery](self, "_allowDataRecovery"))
  {
    v14 = !v6;
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:].cold.1();

    v16 = -[CDPDSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSecureBackupController alloc], "initWithContext:uiProvider:delegate:", v8, 0, 0);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_28;
    v18[3] = &unk_24C81D0E0;
    v19 = v13;
    -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](v16, "getBackupRecordDevicesWithOptionForceFetch:completion:", v14, v18);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:].cold.2();

  if (v13)
  {
    _CDPStateError();
    v16 = (CDPDSecureBackupController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDSecureBackupController *))v13 + 2))(v13, 0, v16);
LABEL_9:

  }
}

uint64_t __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__CDPDClientHandler_fetchEscrowRecordDevicesWithContext_usingCache_completion___block_invoke_28(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Fetched escrow record devices with error: %@\", (uint8_t *)&v10, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);

}

- (void)deviceEscrowRecordRecoverableWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  CDPDOctagonTrustProxyImpl *v15;
  void *v16;
  id v17;
  CDPDOctagonTrustProxyImpl *v18;
  _QWORD v19[4];
  CDPDOctagonTrustProxyImpl *v20;
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setEndpoint:", 1888483151);
  v8 = _Block_copy(v7);

  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C0D0;
  v10 = v8;
  v24 = v10;
  v11 = _Block_copy(aBlock);
  v12 = -[CDPDClientHandler _allowDataRecovery](self, "_allowDataRecovery");
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler deviceEscrowRecordRecoverableWithContext:completion:].cold.1();

    v15 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", v6);
    +[CDPDSecureBackupConfiguration configurationWithContext:](CDPDSecureBackupConfiguration, "configurationWithContext:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountInfoFetchSetupDictionary");
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_34;
    v19[3] = &unk_24C81D108;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    v20 = v15;
    v17 = v21;
    v18 = v15;
    -[CDPDOctagonTrustProxyImpl fetchEscrowRecords:forceFetch:completion:](v18, "fetchEscrowRecords:forceFetch:completion:", v17, 1, v19);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:].cold.2();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5302);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v11 + 2))(v11, v16);
LABEL_9:

  }
}

uint64_t __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_34(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[8];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5305);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_34_cold_1();

    v22 = a1[6];
    if (v22)
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v7);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v5;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v25 = v5;
      v11 = 0;
      v12 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A410]), "initWithEscrowRecord:", v14);
          if (objc_msgSend(v15, "isCurrentDevice"))
          {
            v16 = (void *)a1[4];
            v17 = a1[5];
            v27 = v11;
            objc_msgSend(v16, "tlkRecoverabilityForEscrow:record:error:", v17, v14, &v27);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v27;

            if (v18)
            {
              _CDPLogSystem();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"Found one escrow record for current device that is recoverable!\", buf, 2u);
              }

              v20 = 0;
              v5 = v25;
              goto LABEL_28;
            }
            v11 = v19;
          }

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v10)
          continue;
        break;
      }

      v5 = v25;
      if (v11)
      {
        v20 = v11;
        v19 = v20;
        goto LABEL_26;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
LABEL_26:
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_34_cold_2();
LABEL_28:

    v24 = a1[6];
    if (v24)
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, v20);

    v7 = 0;
  }

}

- (void)handleCloudDataProtectionStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL8 v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  CDPDStateMachine *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = a5;
  objc_msgSend(v10, "setEndpoint:", 3142422530);
  v12 = _Block_copy(v11);

  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81D5D8;
  v14 = v12;
  v29 = v14;
  v15 = _Block_copy(aBlock);
  v16 = -[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess");
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Starting state machine...\", buf, 2u);
    }

    v19 = -[CDPDClientHandler _shouldForceUseSecureBackupCachedPassphraseWithContext:clientType:](self, "_shouldForceUseSecureBackupCachedPassphraseWithContext:clientType:", v10, self->_clientType);
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
        -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:].cold.2();
    }
    else if (v21)
    {
      -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:].cold.3();
    }

    objc_msgSend(v10, "set_useSecureBackupCachedPassphrase:", v19);
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CDPDStateMachine initWithContext:uiProvider:connection:]([CDPDStateMachine alloc], "initWithContext:uiProvider:connection:", v22, v9, self->_connection);
    -[CDPDClientHandler _startObservingConnectionStateForRepairWithStateMachine:context:](self, "_startObservingConnectionStateForRepairWithStateMachine:context:", v23, v22);
    if (objc_msgSend(v10, "type") == 12 || objc_msgSend(v10, "type") == 11)
    {
      _CDPLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[CDPDClientHandler handleCloudDataProtectionStateWithContext:uiProvider:completion:].cold.1((uint64_t)self, v10);

    }
    else
    {
      objc_msgSend(v10, "setType:", 1);
    }
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_39;
    v25[3] = &unk_24C81D600;
    v25[4] = self;
    v26 = v15;
    -[CDPDStateMachine handleCloudDataProtectionStateWithCompletion:](v23, "handleCloudDataProtectionStateWithCompletion:", v25);

    goto LABEL_20;
  }
  if (v18)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Denying access to state machine. Missing entitlement.\", buf, 2u);
  }

  if (v15)
  {
    _CDPStateError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v22);
LABEL_20:

  }
}

uint64_t __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__CDPDClientHandler_handleCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  id v8;

  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_removeObserver");
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v7 + 16))(v7, a2, a3, v8);

}

- (BOOL)_shouldForceUseSecureBackupCachedPassphraseWithContext:(id)a3 clientType:(unint64_t)a4
{
  BOOL v7;
  NSObject *v8;

  if ((objc_msgSend(MEMORY[0x24BE1A4A0], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled", a3) & 1) != 0)
    return 0;
  v7 = -[CDPDClientHandler _localDeviceHasLocalSecret](self, "_localDeviceHasLocalSecret");
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler _shouldForceUseSecureBackupCachedPassphraseWithContext:clientType:].cold.1(a4 == 2, v7, v8);

  return a4 == 2 && v7;
}

- (BOOL)_localDeviceHasLocalSecret
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLocalSecret");

  return v3;
}

- (void)repairCloudDataProtectionStateWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  CDPDStateMachine *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 844041777);
  v11 = _Block_copy(v10);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v13 = v11;
  v23 = v13;
  v14 = _Block_copy(aBlock);
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Starting state repair...\", buf, 2u);
    }

    v17 = -[CDPDStateMachine initWithContext:uiProvider:connection:]([CDPDStateMachine alloc], "initWithContext:uiProvider:connection:", v15, v9, self->_connection);
    -[CDPDClientHandler _startObservingConnectionStateForRepairWithStateMachine:context:](self, "_startObservingConnectionStateForRepairWithStateMachine:context:", v17, v15);
    objc_msgSend(v15, "setType:", 2);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_43;
    v19[3] = &unk_24C81C558;
    v19[4] = self;
    v20 = v14;
    -[CDPDStateMachine repairCloudDataProtectionStateWithCompletion:](v17, "repairCloudDataProtectionStateWithCompletion:", v19);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler repairCloudDataProtectionStateWithContext:uiProvider:completion:].cold.1();

  if (v14)
  {
    _CDPStateError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v14 + 2))(v14, 0, v15);
LABEL_9:

  }
}

uint64_t __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__CDPDClientHandler_repairCloudDataProtectionStateWithContext_uiProvider_completion___block_invoke_43(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_removeObserver");
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Finished repair with: didRepair = %d, repairError = %@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)startCircleApplicationApprovalServerWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void (**v12)(void *, _QWORD, id);
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  CDPDSecureChannelContext *v17;
  void *v18;
  CDPDSecureChannelContext *v19;
  _BOOL4 v20;
  id v21;
  CDPDSecureChannelController *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[16];
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setEndpoint:", 2121843186);
  v8 = _Block_copy(v7);

  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v10 = v8;
  v29 = v10;
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke_2;
  v26[3] = &unk_24C81C580;
  v11 = _Block_copy(aBlock);
  v27 = v11;
  v12 = (void (**)(void *, _QWORD, id))_Block_copy(v26);
  v13 = -[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess");
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Starting accepting side server...\", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "augmentWithCredentialsFromContext:", v16);
      v17 = [CDPDSecureChannelContext alloc];
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3E8]), "initWithContext:", v6);
      v19 = -[CDPDSecureChannelContext initWithContext:circleProxy:](v17, "initWithContext:circleProxy:", v6, v18);

      v24 = 0;
      v20 = -[CDPDSecureChannelContext initialize:](v19, "initialize:", &v24);
      v21 = v24;
      if (v20)
      {
        v22 = -[CDPDSecureChannelController initWithContext:]([CDPDSecureChannelController alloc], "initWithContext:", v19);
        -[CDPDSecureChannelController startCircleApplicationApprovalServerWithContext:completion:](v22, "startCircleApplicationApprovalServerWithContext:completion:", v6, v12);

      }
      else
      {
        v12[2](v12, 0, v21);
      }

    }
    else
    {
      _CDPLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CDPDClientHandler startCircleApplicationApprovalServerWithContext:completion:].cold.1();

      _CDPStateError();
      v19 = (CDPDSecureChannelContext *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v19);
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler startCircleApplicationApprovalServerWithContext:completion:].cold.2();

    _CDPStateError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v16);
  }

}

uint64_t __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__CDPDClientHandler_startCircleApplicationApprovalServerWithContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Application server completed result %{BOOL}d and error: %@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)_startObservingConnectionStateForRepairWithStateMachine:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSXPCConnection *connection;
  id v10;
  id v11;
  void *v12;
  id notificationObject;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke;
  v14[3] = &unk_24C81D650;
  objc_copyWeak(&v17, &location);
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("CDPDConnectionInvalidatedNotification"), connection, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  notificationObject = self->_notificationObject;
  self->_notificationObject = v12;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_removeObserver");
    _CDPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_cold_1();

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_48;
    v6[3] = &unk_24C81D628;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = v3;
    objc_msgSend(v5, "shouldPerformRepairWithOptionForceFetch:completion:", 0, v6);

  }
}

void __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v11 = v5;
    if (objc_msgSend(v5, "code") == -5305 || objc_msgSend(v11, "code") == -5312)
    {
      objc_msgSend(MEMORY[0x24BE1A428], "contextForConfirmExistingSecret");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1A428], "contextForStateRepair");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAltDSID:", v8);

    objc_msgSend(*(id *)(a1 + 32), "telemetryFlowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTelemetryFlowID:", v9);

    objc_msgSend(*(id *)(a1 + 32), "telemetryDeviceSessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTelemetryDeviceSessionID:", v10);

    objc_msgSend(*(id *)(a1 + 40), "postFollowUpWithContext:completion:", v7, 0);
    v5 = v11;
  }

}

- (void)_removeObserver
{
  id v3;

  if (self->_notificationObject)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_notificationObject);

  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[CDPDClientHandler _removeObserver](self, "_removeObserver");
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPDCircleStateObserver dealloc].cold.1();

  v4.receiver = self;
  v4.super_class = (Class)CDPDClientHandler;
  -[CDPDClientHandler dealloc](&v4, sel_dealloc);
}

- (void)generateEscrowRecordStatusReportForContext:(id)a3 usingCache:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  CDPDEscrowRecordController *v10;
  NSObject *v11;
  void *v12;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    v10 = -[CDPDEscrowRecordController initWithContext:]([CDPDEscrowRecordController alloc], "initWithContext:", v8);
    -[CDPDEscrowRecordController generateEscrowRecordStatusReportForLocalDeviceUsingCache:withCompletion:](v10, "generateEscrowRecordStatusReportForLocalDeviceUsingCache:withCompletion:", v6, v9);

  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler generateEscrowRecordStatusReportForContext:usingCache:withCompletion:].cold.1();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5302);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v12);

    }
  }

}

- (void)shouldPerformRepairForContext:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  CDPDStateMachine *v16;
  CDPDStateMachine *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  CDPDStateMachine *v23;
  id v24;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v27;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setEndpoint:", 546710380);
  v10 = _Block_copy(v9);

  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v12 = v10;
  v27 = v12;
  v13 = _Block_copy(aBlock);
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Checking whether repair should be performed on the CDP state...\", buf, 2u);
  }

  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    v15 = v8;
    if (v8
      || (objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount"),
          (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = -[CDPDStateMachine initWithContext:connection:]([CDPDStateMachine alloc], "initWithContext:connection:", v15, self->_connection);
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke_52;
      v22[3] = &unk_24C81C558;
      v23 = v16;
      v24 = v13;
      v17 = v16;
      -[CDPDStateMachine shouldPerformRepairWithOptionForceFetch:completion:](v17, "shouldPerformRepairWithOptionForceFetch:completion:", v6, v22);

    }
    else
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.1(v19, v20, v21);

      if (!v13)
      {
        v15 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5102);
      v17 = (CDPDStateMachine *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, CDPDStateMachine *))v13 + 2))(v13, 0, v17);
      v15 = 0;
    }
    goto LABEL_11;
  }
  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.2();

  v15 = v8;
  if (v13)
  {
    _CDPStateError();
    v17 = (CDPDStateMachine *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDStateMachine *))v13 + 2))(v13, 0, v17);
    v15 = v8;
LABEL_11:

  }
LABEL_12:

}

uint64_t __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73__CDPDClientHandler_shouldPerformRepairForContext_forceFetch_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"State machine status check completed shouldRepair=%{BOOL}d error=%@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)shouldPerformAuthenticatedRepairForContext:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  CDPDStateMachine *v15;
  CDPDStateMachine *v16;
  NSObject *v17;
  _QWORD v18[4];
  CDPDStateMachine *v19;
  id v20;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setEndpoint:", 546710380);
  v10 = _Block_copy(v9);

  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v12 = v10;
  v23 = v12;
  v13 = _Block_copy(aBlock);
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Checking whether authenticated repair should be performed on the CDP state...\", buf, 2u);
  }

  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    v15 = -[CDPDStateMachine initWithContext:connection:]([CDPDStateMachine alloc], "initWithContext:connection:", v8, self->_connection);
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke_53;
    v18[3] = &unk_24C81C558;
    v19 = v15;
    v20 = v13;
    v16 = v15;
    -[CDPDStateMachine _shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:](v16, "_shouldPerformAuthenticatedRepairWithOptionForceFetch:completion:", v6, v18);

LABEL_9:
    goto LABEL_10;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.2();

  if (v13)
  {
    _CDPStateError();
    v16 = (CDPDStateMachine *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDStateMachine *))v13 + 2))(v13, 0, v16);
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __86__CDPDClientHandler_shouldPerformAuthenticatedRepairForContext_forceFetch_completion___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"State machine status check completed shouldRepair=%{BOOL}d error=%@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)attemptToEscrowPreRecord:(id)a3 preRecordUUID:(id)a4 secretType:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  -[CDPDClientHandler attemptToEscrowPreRecord:context:completion:](self, "attemptToEscrowPreRecord:context:completion:", a4, a6, a7);
}

- (void)attemptToEscrowPreRecord:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  CDPDLocalSecretController *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "setEndpoint:", 3950444510);
  v11 = _Block_copy(v10);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v13 = v11;
  v22 = v13;
  v14 = _Block_copy(aBlock);
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    objc_msgSend(v9, "setType:", 6);
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Handing change in an attempt to escrow preRecord: %@...\", buf, 0xCu);
    }

    v16 = -[CDPDLocalSecretController initWithContext:]([CDPDLocalSecretController alloc], "initWithContext:", v9);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke_55;
    v18[3] = &unk_24C81C558;
    v19 = v8;
    v20 = v14;
    -[CDPDLocalSecretController attemptToEscrowPreRecord:completion:](v16, "attemptToEscrowPreRecord:completion:", v19, v18);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.2();

  if (v14)
  {
    _CDPStateError();
    v16 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDLocalSecretController *))v14 + 2))(v14, 0, v16);
LABEL_9:

  }
}

uint64_t __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__CDPDClientHandler_attemptToEscrowPreRecord_context_completion___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"State machine finished handling preRecord %@ change with didUpdate=%{BOOL}d error=%@\", (uint8_t *)&v9, 0x1Cu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 context:(id)a5 uiProvider:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  CDPDLocalSecretController *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "setEndpoint:", 1996176790);
  v16 = _Block_copy(v15);

  v17 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v18 = v16;
  v27 = v18;
  v19 = _Block_copy(aBlock);
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    objc_msgSend(v13, "setType:", 6);
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v20, OS_LOG_TYPE_DEFAULT, "\"Handing change in local secret...\", buf, 2u);
    }

    v21 = -[CDPDLocalSecretController initWithContext:]([CDPDLocalSecretController alloc], "initWithContext:", v13);
    -[CDPDLocalSecretController setUiProvider:](v21, "setUiProvider:", v14);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke_56;
    v23[3] = &unk_24C81C580;
    v24 = v19;
    -[CDPDLocalSecretController localSecretChangedTo:secretType:completion:](v21, "localSecretChangedTo:secretType:completion:", v12, a4, v23);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.2();

  if (v19)
  {
    _CDPStateError();
    v21 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDLocalSecretController *))v19 + 2))(v19, 0, v21);
LABEL_9:

  }
}

uint64_t __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__CDPDClientHandler_localSecretChangedTo_secretType_context_uiProvider_completion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"State machine finished handling local secret change with didUpdate=%{BOOL}d error=%@\", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (void)finishOfflineLocalSecretChangeWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  CDPDLocalSecretController *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 4249179058);
  v11 = _Block_copy(v10);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v13 = v11;
  v23 = v13;
  v14 = _Block_copy(aBlock);
  v15 = -[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess");
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Finishing offline local secret change...\", buf, 2u);
    }

    objc_msgSend(v8, "setType:", 3);
    v18 = -[CDPDLocalSecretController initWithContext:]([CDPDLocalSecretController alloc], "initWithContext:", v8);
    -[CDPDLocalSecretController setUiProvider:](v18, "setUiProvider:", v9);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_57;
    v19[3] = &unk_24C81C580;
    v20 = v14;
    -[CDPDLocalSecretController finishOfflineLocalSecretChangeWithCompletion:](v18, "finishOfflineLocalSecretChangeWithCompletion:", v19);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.2();

  if (v14)
  {
    _CDPStateError();
    v18 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDLocalSecretController *))v14 + 2))(v14, 0, v18);
LABEL_9:

  }
}

uint64_t __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Updated local secret after offline change\", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_57_cold_1();
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)finishCyrusFlowAfterTermsAgreementWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  CDPDLocalSecretController *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 1979543336);
  v11 = _Block_copy(v10);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v13 = v11;
  v23 = v13;
  v14 = _Block_copy(aBlock);
  v15 = -[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess");
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Finishing Cyrus terms flow by collecting passcode...\", buf, 2u);
    }

    objc_msgSend(v8, "setType:", 7);
    v18 = -[CDPDLocalSecretController initWithContext:]([CDPDLocalSecretController alloc], "initWithContext:", v8);
    -[CDPDLocalSecretController setUiProvider:](v18, "setUiProvider:", v9);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_58;
    v19[3] = &unk_24C81C580;
    v20 = v14;
    -[CDPDLocalSecretController finishOfflineLocalSecretChangeWithCompletion:](v18, "finishOfflineLocalSecretChangeWithCompletion:", v19);

    goto LABEL_9;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:].cold.2();

  if (v14)
  {
    _CDPStateError();
    v18 = (CDPDLocalSecretController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, CDPDLocalSecretController *))v14 + 2))(v14, 0, v18);
LABEL_9:

  }
}

uint64_t __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Created backup after terms agreement.\", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_58_cold_1();
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)clearFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, uint64_t, id);
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(0, "setEndpoint:", 3725776297);
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CDPDClientHandler_clearFollowUpWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v9 = v8;
  v19 = v9;
  v10 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  v11 = -[CDPDClientHandler _allowFollowUps](self, "_allowFollowUps");
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Attempting to clear a follow up: %@\", buf, 0xCu);
    }

    +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v15 = objc_msgSend(v14, "clearFollowUpWithContext:error:", v6, &v17);
    v16 = v17;

    if (!v10)
      goto LABEL_10;
LABEL_9:
    v10[2](v10, v15, v16);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler clearFollowUpWithContext:completion:].cold.1();

  _CDPStateError();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (v10)
    goto LABEL_9;
LABEL_10:

}

uint64_t __57__CDPDClientHandler_clearFollowUpWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)postFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, _QWORD, void *);
  void *UMUserManagerClass;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(0, "setEndpoint:", 3045827236);
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CDPDClientHandler_postFollowUpWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v9 = v8;
  v25 = v9;
  v10 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  UMUserManagerClass = (void *)UserManagementLibraryCore();
  if (UMUserManagerClass)
    UMUserManagerClass = getUMUserManagerClass();
  objc_msgSend(UMUserManagerClass, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isSharedIPad") & 1) != 0)
  {
    objc_msgSend(v6, "followUpType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE1A3C0]);

    if (v14)
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[CDPDClientHandler postFollowUpWithContext:completion:].cold.1();

      if (v10)
      {
        _CDPStateError();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0, v16);

      }
      v17 = 0;
      goto LABEL_20;
    }
  }
  else
  {

  }
  v18 = -[CDPDClientHandler _allowFollowUps](self, "_allowFollowUps");
  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_20DB2C000, v20, OS_LOG_TYPE_DEFAULT, "\"Attempting to post a follow up: %@\", buf, 0xCu);
    }

    +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v22 = objc_msgSend(v21, "postFollowUpItemForContext:error:", v6, &v23);
    v17 = v23;

    if (!v10)
      goto LABEL_20;
LABEL_19:
    v10[2](v10, v22, v17);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler postFollowUpWithContext:completion:].cold.2();

  _CDPStateError();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  if (v10)
    goto LABEL_19;
LABEL_20:

}

uint64_t __56__CDPDClientHandler_postFollowUpWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)saveTermsAcceptance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, CDPDTermsInfoBackupController *);
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  CDPDTermsInfoBackupController *v14;
  uint8_t v15[8];
  _QWORD aBlock[4];
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(0, "setEndpoint:", 3677280585);
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CDPDClientHandler_saveTermsAcceptance_completion___block_invoke;
  aBlock[3] = &unk_24C81C0D0;
  v17 = v8;
  v9 = v8;
  v10 = (void (**)(void *, CDPDTermsInfoBackupController *))_Block_copy(aBlock);
  v11 = -[CDPDClientHandler _allowDataRecovery](self, "_allowDataRecovery");
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Calling out to controller to save terms.\", v15, 2u);
    }

    v14 = objc_alloc_init(CDPDTermsInfoBackupController);
    -[CDPDTermsInfoBackupController saveTermsAcceptance:completion:](v14, "saveTermsAcceptance:completion:", v6, v10);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler saveTermsAcceptance:completion:].cold.1();

    _CDPStateError();
    v14 = (CDPDTermsInfoBackupController *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14);
  }

}

uint64_t __52__CDPDClientHandler_saveTermsAcceptance_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, _QWORD, CDPDTermsInfoBackupController *);
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  CDPDTermsInfoBackupController *v14;
  uint8_t v15[8];
  _QWORD aBlock[4];
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(0, "setEndpoint:", 819347453);
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CDPDClientHandler_fetchTermsAcceptanceForAccount_completion___block_invoke;
  aBlock[3] = &unk_24C81BFF0;
  v17 = v8;
  v9 = v8;
  v10 = (void (**)(void *, _QWORD, CDPDTermsInfoBackupController *))_Block_copy(aBlock);
  v11 = -[CDPDClientHandler _allowDataRecovery](self, "_allowDataRecovery");
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Calling out to controller to fetch terms.\", v15, 2u);
    }

    v14 = objc_alloc_init(CDPDTermsInfoBackupController);
    -[CDPDTermsInfoBackupController fetchTermsAcceptanceForAccount:completion:](v14, "fetchTermsAcceptanceForAccount:completion:", v6, v10);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler fetchTermsAcceptanceForAccount:completion:].cold.1();

    _CDPStateError();
    v14 = (CDPDTermsInfoBackupController *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v14);
  }

}

uint64_t __63__CDPDClientHandler_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performRecoveryWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void (**v17)(void *, _QWORD, CDPDRecoveryKeyController *);
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  CDPDRecoveryKeyController *v22;
  NSObject *v23;
  __objc2_class **v24;
  id v25;
  CDPDSecureBackupController *v26;
  uint64_t aBlock;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  v14 = a6;
  objc_msgSend(v13, "setEndpoint:", 2705534175);
  v15 = _Block_copy(v14);

  aBlock = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __83__CDPDClientHandler_performRecoveryWithContext_uiProvider_authProvider_completion___block_invoke;
  v30 = &unk_24C81BFF0;
  v16 = v15;
  v31 = v16;
  v17 = (void (**)(void *, _QWORD, CDPDRecoveryKeyController *))_Block_copy(&aBlock);
  v18 = -[CDPDClientHandler _allowDataRecovery](self, "_allowDataRecovery");
  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl(&dword_20DB2C000, v20, OS_LOG_TYPE_DEFAULT, "\"Initiating Account Recovery with UI provider: %@\", buf, 0xCu);
    }

    if (v11)
    {
      if (objc_msgSend(v13, "idmsMasterKeyRecovery"))
      {
        _CDPLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_DEFAULT, "\"Starting RK based Account Recovery flow\", buf, 2u);
        }

        v22 = -[CDPDRecoveryKeyController initWithContext:uiProvider:authProvider:]([CDPDRecoveryKeyController alloc], "initWithContext:uiProvider:authProvider:", v13, v11, v12);
        -[CDPDRecoveryKeyController recoverDataUsingMasterKeyWithCompletion:](v22, "recoverDataUsingMasterKeyWithCompletion:", v17);
        goto LABEL_23;
      }
      objc_msgSend(v13, "set_authProvider:", v12);
      _CDPLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"Initiating info recovery\", buf, 2u);
      }

      if (objc_msgSend(v13, "idmsRecovery"))
      {
        v22 = -[CDPDBackupErrorProviderImpl initWithContext:uiProvider:]([CDPDBackupIDMSErrorProvider alloc], "initWithContext:uiProvider:", v13, v11);
        v24 = off_24C81ABF8;
      }
      else
      {
        objc_msgSend(v13, "findMyiPhoneUUID");
        v22 = (CDPDRecoveryKeyController *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v25 = 0;
          goto LABEL_22;
        }
        v22 = objc_alloc_init(CDPDBackupErrorProviderImpl);
        v24 = off_24C81ABE8;
      }
      v25 = objc_alloc_init(*v24);
LABEL_22:
      v26 = -[CDPDSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSecureBackupController alloc], "initWithContext:uiProvider:delegate:", v13, v11, 0);
      -[CDPDClientHandler _performRecoveryWithContext:uiProvider:authProvider:errorProviuder:resultParser:secureBackUpController:completion:](self, "_performRecoveryWithContext:uiProvider:authProvider:errorProviuder:resultParser:secureBackUpController:completion:", v13, v11, v12, v22, v25, v26, v17, aBlock, v28, v29, v30);

      goto LABEL_23;
    }
    if (v17)
    {
LABEL_14:
      _CDPStateError();
      v22 = (CDPDRecoveryKeyController *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, 0, v22);
LABEL_23:

    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler performRecoveryWithContext:uiProvider:authProvider:completion:].cold.1();

    if (v17)
      goto LABEL_14;
  }

}

uint64_t __83__CDPDClientHandler_performRecoveryWithContext_uiProvider_authProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performRecoveryWithContext:(id)a3 uiProvider:(id)a4 authProvider:(id)a5 errorProviuder:(id)a6 resultParser:(id)a7 secureBackUpController:(id)a8 completion:(id)a9
{
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CDPDBackupInfoRecoveryFlowController *v22;
  void *v23;
  CDPDOctagonTrustProxyImpl *v24;
  CDPDBackupInfoRecoveryFlowController *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v14 = a9;
  v15 = (objc_class *)MEMORY[0x24BE1A480];
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  v21 = objc_alloc_init(v15);
  objc_msgSend(v21, "setContext:", v20);
  v22 = [CDPDBackupInfoRecoveryFlowController alloc];
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3E8]), "initWithContext:", v20);
  v24 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", v20);

  v25 = -[CDPDRecoveryFlowController initWithContext:uiProvider:secureBackupController:circleProxy:octagonProxy:](v22, "initWithContext:uiProvider:secureBackupController:circleProxy:octagonProxy:", v21, v19, v16, v23, v24);
  -[CDPDBackupInfoRecoveryFlowController setErrorProvider:](v25, "setErrorProvider:", v18);

  -[CDPDBackupInfoRecoveryFlowController setResultParser:](v25, "setResultParser:", v17);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __135__CDPDClientHandler__performRecoveryWithContext_uiProvider_authProvider_errorProviuder_resultParser_secureBackUpController_completion___block_invoke;
  v27[3] = &unk_24C81BFF0;
  v28 = v14;
  v26 = v14;
  -[CDPDBackupInfoRecoveryFlowController beginRecoveryWithCompletion:](v25, "beginRecoveryWithCompletion:", v27);

}

void __135__CDPDClientHandler__performRecoveryWithContext_uiProvider_authProvider_errorProviuder_resultParser_secureBackUpController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"info recovery completed with error: %@\", (uint8_t *)&v9, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void (**v11)(void *, uint64_t);
  CDPDAccount *v12;
  _QWORD aBlock[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend(0, "setEndpoint:", 3014816511);
  v9 = _Block_copy(v8);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDClientHandler_isICDPEnabledForDSID_checkWithServer_completion___block_invoke;
  aBlock[3] = &unk_24C81C1C0;
  v10 = v9;
  v14 = v10;
  v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v11)
  {
    v12 = objc_alloc_init(CDPDAccount);
    v11[2](v11, -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](v12, "isICDPEnabledForDSID:checkWithServer:", v7, v6));

  }
}

uint64_t __69__CDPDClientHandler_isICDPEnabledForDSID_checkWithServer_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)hasLocalSecretWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  objc_msgSend(0, "setEndpoint:", 540884795);
  v4 = _Block_copy(v3);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CDPDClientHandler_hasLocalSecretWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C1C0;
  v5 = v4;
  v9 = v5;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, objc_msgSend(v7, "hasLocalSecret"));

  }
}

uint64_t __50__CDPDClientHandler_hasLocalSecretWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)isUserVisibleKeychainSyncEnabledWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  objc_msgSend(0, "setEndpoint:", 3358439441);
  v4 = _Block_copy(v3);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CDPDClientHandler_isUserVisibleKeychainSyncEnabledWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C1C0;
  v5 = v4;
  v9 = v5;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v6)
  {
    +[CDPDKeychainSync keyChainSync](CDPDKeychainSync, "keyChainSync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, objc_msgSend(v7, "isUserVisibleKeychainSyncEnabled"));

  }
}

uint64_t __68__CDPDClientHandler_isUserVisibleKeychainSyncEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;

  v4 = a3;
  v5 = a4;
  objc_msgSend(0, "setEndpoint:", 581976373);
  v6 = _Block_copy(v5);

  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v15 = v6;
  v8 = v6;
  v9 = _Block_copy(aBlock);
  +[CDPDKeychainSync keyChainSync](CDPDKeychainSync, "keyChainSync");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2;
  v12[3] = &unk_24C81C580;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "setUserVisibleKeychainSyncEnabled:withCompletion:", v4, v12);

}

uint64_t __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__CDPDClientHandler_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeNonViewAwarePeersFromCircleWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setEndpoint:", 3866505848);
  v7 = _Block_copy(v6);

  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v18 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3E8]), "initWithContext:", v5);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A488]), "initWithContext:", v5);
  +[CDPDKeychainSync keyChainSyncWithProxy:sosCircleProxy:context:](CDPDKeychainSync, "keyChainSyncWithProxy:sosCircleProxy:context:", v11, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_2;
  v15[3] = &unk_24C81C580;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "removeNonViewAwarePeersFromCircleWithCompletion:", v15);

}

uint64_t __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__CDPDClientHandler_removeNonViewAwarePeersFromCircleWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)synchronizeUserVisibleKeychainSyncEligibilityForContext:(id)a3 completion:(id)a4
{
  id v5;
  CDPDKeychainSync *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v5 = a4;
    v6 = -[CDPDKeychainSync initWithContext:]([CDPDKeychainSync alloc], "initWithContext:", v9);
    -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:](v6, "updateKeychainSyncStateIfNeededWithCompletion:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = a4;
    objc_msgSend(v7, "cdp_errorWithCode:", -5003);
    v6 = (CDPDKeychainSync *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CDPDKeychainSync *))a4 + 2))(v8, 0, v6);
  }

}

- (void)isOTEnabledForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    v8 = (void *)objc_opt_new();
    v9 = v8;
    if (v7)
      v7[2](v7, objc_msgSend(v8, "isOTEnabledForContext:", v6), 0);
    goto LABEL_8;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler isOTEnabledForContext:completion:].cold.1();

  if (v7)
  {
    _CDPStateError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v9);
LABEL_8:

  }
}

- (void)cliqueStatusForContext:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a4;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    if (v7)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3E8]), "initWithContext:", v7);
      v14 = 0;
      v10 = objc_msgSend(v9, "cliqueStatus:", &v14);
      v11 = v14;
      if (v8)
        v8[2](v8, v10, v11);

      goto LABEL_14;
    }
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler cliqueStatusForContext:completion:].cold.1(a2, v13);

    if (v8)
    {
LABEL_13:
      _CDPStateError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, -1, v9);
LABEL_14:

    }
  }
  else
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler cliqueStatusForContext:completion:].cold.2(a2, v12);

    if (v8)
      goto LABEL_13;
  }

}

- (void)circleStatusForContext:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a4;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    if (v7)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A488]), "initWithContext:", v7);
      v14 = 0;
      v10 = objc_msgSend(v9, "cachedSOSCircleStatus:", &v14);
      v11 = v14;
      if (v8)
        v8[2](v8, v10, v11);

      goto LABEL_14;
    }
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler cliqueStatusForContext:completion:].cold.1(a2, v13);

    if (v8)
    {
LABEL_13:
      _CDPStateError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0xFFFFFFFFLL, v9);
LABEL_14:

    }
  }
  else
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler cliqueStatusForContext:completion:].cold.2(a2, v12);

    if (v8)
      goto LABEL_13;
  }

}

- (void)setKeyChainSyncCompatibilityState:(unint64_t)a3 withAltDSID:(id)a4
{
  char v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;

  v4 = a3;
  v6 = a4;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "deferSOSFromSignIn"))
    {
      if ((v4 & 3) == 1)
      {
        _CDPLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:].cold.2();

      }
      objc_msgSend(MEMORY[0x24BE1A3F8], "contextForAccountWithAltDSID:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      -[CDPDClientHandler _updateSOSCompatibilityMode:context:](self, "_updateSOSCompatibilityMode:context:", (v4 & 3) != 0, v8);
      if (-[CDPDClientHandler _allowFollowUps](self, "_allowFollowUps"))
      {
        objc_msgSend(MEMORY[0x24BE1A428], "contextForSOSCompatibilityMode");
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSObject setAltDSID:](v9, "setAltDSID:", v6);
        v10 = objc_alloc_init(MEMORY[0x24BE1A430]);
        v11 = v10;
        if ((v4 & 1) != 0)
          objc_msgSend(v10, "postFollowUpWithContext:error:", v9, 0);
        else
          objc_msgSend(v10, "clearFollowUpWithContext:error:", v9, 0);

      }
      else
      {
        _CDPLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:].cold.1(self);
      }

    }
    else
    {
      _CDPLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:].cold.3();
    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDClientHandler setKeyChainSyncCompatibilityState:withAltDSID:].cold.4();
  }

}

- (void)_updateSOSCompatibilityMode:(BOOL)a3 context:(id)a4
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  +[CDPCompatibilityModeUpdater setSOSCompatibilityMode:context:error:](CDPCompatibilityModeUpdater, "setSOSCompatibilityMode:context:error:", a3, a4, &v8);
  v4 = v8;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler _updateSOSCompatibilityMode:context:].cold.1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Successfully set SOSCCSetCompatibilityMode\", v7, 2u);
  }

}

- (void)recoverAndSynchronizeSquirrelWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(void *, _QWORD, void *);
  CDPDRecoveryKeyController *v14;
  void *v15;
  CDPDRecoveryKeyController *v16;
  NSObject *v17;
  _QWORD aBlock[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 4233277675);
  v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__CDPDClientHandler_recoverAndSynchronizeSquirrelWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v12 = v11;
  v19 = v12;
  v13 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    v14 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CDPDRecoveryKeyController initWithContext:uiProvider:](v14, "initWithContext:uiProvider:", v15, v9);
    -[CDPDRecoveryKeyController recoverAndSynchronizeStateWithServer:](v16, "recoverAndSynchronizeStateWithServer:", v13);

LABEL_7:
    goto LABEL_8;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:].cold.1();

  if (v13)
  {
    _CDPStateError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __84__CDPDClientHandler_recoverAndSynchronizeSquirrelWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)recoverSquirrelWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(void *, _QWORD, void *);
  CDPDRecoveryKeyController *v14;
  void *v15;
  CDPDRecoveryKeyController *v16;
  NSObject *v17;
  _QWORD aBlock[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 2013313151);
  v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CDPDClientHandler_recoverSquirrelWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v12 = v11;
  v19 = v12;
  v13 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    v14 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CDPDRecoveryKeyController initWithContext:uiProvider:](v14, "initWithContext:uiProvider:", v15, v9);
    -[CDPDRecoveryKeyController recoverAndSynchronizeStateWithServer:](v16, "recoverAndSynchronizeStateWithServer:", v13);

LABEL_7:
    goto LABEL_8;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:].cold.1();

  if (v13)
  {
    _CDPStateError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __70__CDPDClientHandler_recoverSquirrelWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)isRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(void *, uint64_t, id);
  void *v8;
  CDPDRecoveryKeyController *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD aBlock[4];
  id v15;

  v4 = a3;
  objc_msgSend(0, "setEndpoint:", 266770439);
  v5 = _Block_copy(v4);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CDPDClientHandler_isRecoveryKeyAvailableWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v6 = v5;
  v15 = v6;
  v7 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CDPDRecoveryKeyController initWithContext:]([CDPDRecoveryKeyController alloc], "initWithContext:", v8);
    v13 = 0;
    v10 = -[CDPDRecoveryKeyController isRecoveryKeyAvailableWithError:](v9, "isRecoveryKeyAvailableWithError:", &v13);
    v11 = v13;
    if (v7)
      v7[2](v7, v10, v11);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:].cold.1();

  if (v7)
  {
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
LABEL_9:

  }
}

uint64_t __58__CDPDClientHandler_isRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)isWalrusRecoveryKeyAvailableWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(void *, uint64_t, id);
  void *v8;
  CDPDRecoveryKeyController *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD aBlock[4];
  id v15;

  v4 = a3;
  objc_msgSend(0, "setEndpoint:", 266770439);
  v5 = _Block_copy(v4);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CDPDClientHandler_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v6 = v5;
  v15 = v6;
  v7 = (void (**)(void *, uint64_t, id))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CDPDRecoveryKeyController initWithContext:]([CDPDRecoveryKeyController alloc], "initWithContext:", v8);
    v13 = 0;
    v10 = -[CDPDRecoveryKeyController isWalrusRecoveryKeyAvailableWithError:](v9, "isWalrusRecoveryKeyAvailableWithError:", &v13);
    v11 = v13;
    if (v7)
      v7[2](v7, v10, v11);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:].cold.1();

  if (v7)
  {
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
LABEL_9:

  }
}

uint64_t __64__CDPDClientHandler_isWalrusRecoveryKeyAvailableWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CDPDRecoveryKeyController *v29;
  void *v30;
  CDPDRecoveryKeyController *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = -[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey");
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
      -[CDPDClientHandler authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:].cold.1();

    objc_msgSend(v8, "setType:", 4);
    v29 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[CDPDRecoveryKeyController initWithContext:uiProvider:](v29, "initWithContext:uiProvider:", v30, v9);
    -[CDPDRecoveryKeyController authenticateAndGenerateNewRecoveryKeyWithCompletion:](v31, "authenticateAndGenerateNewRecoveryKeyWithCompletion:", v10);

    goto LABEL_11;
  }
  if (v21)
    -[CDPDClientHandler authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:].cold.2(v20, v22, v23, v24, v25, v26, v27, v28);

  if (v10)
  {
    _CDPStateError();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v30);
LABEL_11:

  }
}

- (void)generateNewRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(void *, _QWORD, void *);
  CDPDRecoveryKeyController *v14;
  void *v15;
  CDPDRecoveryKeyController *v16;
  NSObject *v17;
  _QWORD aBlock[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 3301729261);
  v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDPDClientHandler_generateNewRecoveryKeyWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v12 = v11;
  v19 = v12;
  v13 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    objc_msgSend(v8, "setType:", 4);
    v14 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CDPDRecoveryKeyController initWithContext:uiProvider:](v14, "initWithContext:uiProvider:", v15, v9);
    -[CDPDRecoveryKeyController generateNewRecoveryKey:](v16, "generateNewRecoveryKey:", v13);

LABEL_7:
    goto LABEL_8;
  }
  _CDPLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:].cold.1();

  if (v13)
  {
    _CDPStateError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v15);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __77__CDPDClientHandler_generateNewRecoveryKeyWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)verifyRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(void *, _QWORD, CDPDRecoveryKeyController *);
  CDPDRecoveryKeyController *v14;
  NSObject *v15;
  _QWORD aBlock[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setEndpoint:", 1660048000);
  v11 = _Block_copy(v10);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CDPDClientHandler_verifyRecoveryKeyWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v12 = v11;
  v17 = v12;
  v13 = (void (**)(void *, _QWORD, CDPDRecoveryKeyController *))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    v14 = -[CDPDRecoveryKeyController initWithContext:uiProvider:]([CDPDRecoveryKeyController alloc], "initWithContext:uiProvider:", v8, v9);
    -[CDPDRecoveryKeyController verifyRecoveryKey:](v14, "verifyRecoveryKey:", v13);
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler verifyRecoveryKeyWithContext:uiProvider:completion:].cold.1();

  if (v13)
  {
    _CDPStateError();
    v14 = (CDPDRecoveryKeyController *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v14);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __72__CDPDClientHandler_verifyRecoveryKeyWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CDPDRecoveryKeyController *v29;
  void *v30;
  CDPDRecoveryKeyController *v31;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = -[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey");
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
      -[CDPDClientHandler authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:].cold.1();

    objc_msgSend(v8, "setType:", 4);
    v29 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[CDPDRecoveryKeyController initWithContext:uiProvider:](v29, "initWithContext:uiProvider:", v30, v9);
    -[CDPDRecoveryKeyController authenticateAndDeleteRecoveryKeyWithCompletion:](v31, "authenticateAndDeleteRecoveryKeyWithCompletion:", v10);

    goto LABEL_11;
  }
  if (v21)
    -[CDPDClientHandler authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:].cold.2(v20, v22, v23, v24, v25, v26, v27, v28);

  if (v10)
  {
    _CDPStateError();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v30);
LABEL_11:

  }
}

- (void)deleteRecoveryKeyWithContext:(id)a3 uiProvider:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  CDPDRecoveryKeyController *v16;
  void *v17;
  CDPDRecoveryKeyController *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = a5;
  objc_msgSend(v10, "setEndpoint:", 1512741306);
  v12 = _Block_copy(v11);

  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke;
  aBlock[3] = &unk_24C81C580;
  v14 = v12;
  v25 = v14;
  v15 = _Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    v16 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CDPDRecoveryKeyController initWithContext:uiProvider:](v16, "initWithContext:uiProvider:", v17, v9);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2;
    v21[3] = &unk_24C81D210;
    v23 = v15;
    v21[4] = self;
    v22 = v10;
    -[CDPDRecoveryKeyController deleteRecoveryKeyWithCompletion:](v18, "deleteRecoveryKeyWithCompletion:", v21);

    v19 = v23;
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:].cold.1();

  if (v15)
  {
    _CDPStateError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v15 + 2))(v15, 0, v19);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;

  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_2();

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_14:
      v8();
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "_allowFollowUps"))
  {
    objc_msgSend(MEMORY[0x24BE1A428], "contextForRecoveryKeyMismatchHealing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAltDSID:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BE1A430]);
    objc_msgSend(v11, "clearFollowUpWithContext:error:", v9, 0);
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, a2, 0);

  }
  else
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_1((id *)(a1 + 32));

    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      v8 = *(void (**)(void))(v14 + 16);
      goto LABEL_14;
    }
  }

}

- (void)generateRandomRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, _QWORD, void *);
  CDPDRecoveryKeyController *v11;
  void *v12;
  CDPDRecoveryKeyController *v13;
  NSObject *v14;
  _QWORD aBlock[4];
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setEndpoint:", 4019745616);
  v8 = _Block_copy(v7);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDClientHandler_generateRandomRecoveryKeyWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81D678;
  v9 = v8;
  v16 = v9;
  v10 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (-[CDPDClientHandler _allowRecoveryKey](self, "_allowRecoveryKey"))
  {
    objc_msgSend(v6, "setType:", 4);
    v11 = [CDPDRecoveryKeyController alloc];
    objc_msgSend(MEMORY[0x24BE1A3F8], "preflightContext:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CDPDRecoveryKeyController initWithContext:](v11, "initWithContext:", v12);
    -[CDPDRecoveryKeyController generateRandomRecoveryKey:](v13, "generateRandomRecoveryKey:", v10);

LABEL_7:
    goto LABEL_8;
  }
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[CDPDClientHandler isRecoveryKeyAvailableWithCompletion:].cold.1();

  if (v10)
  {
    _CDPStateError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __69__CDPDClientHandler_generateRandomRecoveryKeyWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, id);
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a3;
  v6 = (void (**)(id, uint64_t, id))a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_alloc_init(MEMORY[0x24BE1A408]);
  v10 = 0;
  v8 = objc_msgSend(v7, "verifyRecoveryKeyObservingSystemsHaveMatchingStateWithContext:error:", v5, &v10);
  v9 = v10;
  if (v6)
    v6[2](v6, v8, v9);

}

- (void)combinedWalrusStatusWithContext:(id)a3 completion:(id)a4
{
  -[CDPWalrusDaemonService combinedWalrusStatusWithContext:completion:](self->_walrusDaemonService, "combinedWalrusStatusWithContext:completion:", a3, a4);
}

- (void)repairWalrusWithCompletion:(id)a3
{
  -[CDPWalrusDaemonService repairWalrusWithCompletion:](self->_walrusDaemonService, "repairWalrusWithCompletion:", a3);
}

- (void)broadcastWalrusStateChange
{
  -[CDPWalrusDaemonService broadcastWalrusStateChange](self->_walrusDaemonService, "broadcastWalrusStateChange");
}

- (void)updateWalrusStatus:(unint64_t)a3 completion:(id)a4
{
  -[CDPWalrusDaemonService updateWalrusStatus:completion:](self->_walrusDaemonService, "updateWalrusStatus:completion:", a3, a4);
}

- (void)webAccessStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;

  v4 = a3;
  objc_msgSend(0, "setEndpoint:", 1504201822);
  v5 = _Block_copy(v4);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CDPDClientHandler_webAccessStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81C848;
  v9 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);
  -[CDPWalrusDaemonService webAccessStatusWithCompletion:](self->_walrusDaemonService, "webAccessStatusWithCompletion:", v7);

}

uint64_t __51__CDPDClientHandler_webAccessStatusWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;

  v6 = a4;
  objc_msgSend(0, "setEndpoint:", 2557521267);
  v7 = _Block_copy(v6);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CDPDClientHandler_updateWebAccessStatus_completion___block_invoke;
  aBlock[3] = &unk_24C81C0D0;
  v11 = v7;
  v8 = v7;
  v9 = _Block_copy(aBlock);
  -[CDPWalrusDaemonService updateWebAccessStatus:completion:](self->_walrusDaemonService, "updateWebAccessStatus:completion:", a3, v9);

}

uint64_t __54__CDPDClientHandler_updateWebAccessStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pcsKeysForServices:(id)a3 completion:(id)a4
{
  -[CDPWalrusDaemonService pcsKeysForServices:completion:](self->_walrusDaemonService, "pcsKeysForServices:completion:", a3, a4);
}

- (void)shouldPerformSilentEscrowRecordRepairWithContext:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  CDPDEscrowRecordController *v10;
  NSObject *v11;
  void *v12;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    objc_msgSend(v8, "setType:", 10);
    v10 = -[CDPDEscrowRecordController initWithContext:]([CDPDEscrowRecordController alloc], "initWithContext:", v8);
    -[CDPDEscrowRecordController shouldPerformSilentEscrowRecordRepairUsingCache:completion:](v10, "shouldPerformSilentEscrowRecordRepairUsingCache:completion:", v6, v9);

  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler shouldPerformSilentEscrowRecordRepairWithContext:usingCache:completion:].cold.1();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5302);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v12);

    }
  }

}

- (void)startSilentEscrowRecordRepairWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  CDPDEscrowRecordController *v8;
  CDPDEscrowRecordController *v9;
  NSObject *v10;
  _QWORD v11[4];
  CDPDEscrowRecordController *v12;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    if (v7)
      v7[2](v7, 1, 0);
    objc_msgSend(v6, "setType:", 10);
    v8 = -[CDPDEscrowRecordController initWithContext:]([CDPDEscrowRecordController alloc], "initWithContext:", v6);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __73__CDPDClientHandler_startSilentEscrowRecordRepairWithContext_completion___block_invoke;
    v11[3] = &unk_24C81C618;
    v12 = v8;
    v9 = v8;
    -[CDPDEscrowRecordController performSilentEscrowRecordRepairWithCompletion:](v9, "performSilentEscrowRecordRepairWithCompletion:", v11);

    goto LABEL_9;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CDPDClientHandler startSilentEscrowRecordRepairWithContext:completion:].cold.1();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5302);
    v9 = (CDPDEscrowRecordController *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, CDPDEscrowRecordController *))v7)[2](v7, 0, v9);
LABEL_9:

  }
}

void __73__CDPDClientHandler_startSilentEscrowRecordRepairWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      v7 = "\"Successfully performed silent escrow record repair in background!\";
      v8 = v5;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    v10 = 138412290;
    v11 = v4;
    v7 = "\"Failed to perform silent escrow record repair in background with error: %@\";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)performSilentEscrowRecordRepairWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CDPDEscrowRecordController *v8;
  CDPDEscrowRecordController *v9;
  NSObject *v10;
  _QWORD v11[4];
  CDPDEscrowRecordController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    objc_msgSend(v6, "setType:", 10);
    v8 = -[CDPDEscrowRecordController initWithContext:]([CDPDEscrowRecordController alloc], "initWithContext:", v6);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __75__CDPDClientHandler_performSilentEscrowRecordRepairWithContext_completion___block_invoke;
    v11[3] = &unk_24C81C558;
    v12 = v8;
    v13 = v7;
    v9 = v8;
    -[CDPDEscrowRecordController performSilentEscrowRecordRepairWithCompletion:](v9, "performSilentEscrowRecordRepairWithCompletion:", v11);

LABEL_7:
    goto LABEL_8;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CDPDClientHandler performSilentEscrowRecordRepairWithContext:completion:].cold.1();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5302);
    v9 = (CDPDEscrowRecordController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, CDPDEscrowRecordController *))v7 + 2))(v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __75__CDPDClientHandler_performSilentEscrowRecordRepairWithContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a2)
  {
    if (!v7)
      goto LABEL_7;
    LOWORD(v12) = 0;
    v8 = "\"Successfully performed silent escrow record repair!\";
    v9 = v6;
    v10 = 2;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    v12 = 138412290;
    v13 = v5;
    v8 = "\"Failed to perform silent escrow record repair with error: %@\";
    v9 = v6;
    v10 = 12;
  }
  _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
LABEL_7:

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  CDPDEscrowRecordController *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  if (-[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    objc_msgSend(v9, "setType:", 10);
    v11 = -[CDPDEscrowRecordController initWithContext:]([CDPDEscrowRecordController alloc], "initWithContext:", v9);
    v17 = 0;
    v12 = -[CDPDEscrowRecordController updateLastSilentEscrowRecordRepairAttemptDate:error:](v11, "updateLastSilentEscrowRecordRepairAttemptDate:error:", v8, &v17);
    v13 = v17;
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((_DWORD)v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Successfully updated last silent escrow record repair attempt date (%@)\", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CDPDClientHandler updateLastSilentEscrowRecordRepairAttemptDate:context:completion:].cold.1();
    }

    if (v10)
      v10[2](v10, v12, v13);

    goto LABEL_14;
  }
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CDPDClientHandler updateLastSilentEscrowRecordRepairAttemptDate:context:completion:].cold.2();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5302);
    v11 = (CDPDEscrowRecordController *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
LABEL_14:

  }
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *UMUserManagerClass;
  void *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  if (-[CDPDClientHandler _allowDataRecovery](self, "_allowDataRecovery")
    || -[CDPDClientHandler _allowStateMachineAccess](self, "_allowStateMachineAccess"))
  {
    UMUserManagerClass = (void *)UserManagementLibraryCore();
    if (UMUserManagerClass)
      UMUserManagerClass = getUMUserManagerClass();
    objc_msgSend(UMUserManagerClass, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSharedIPad");

    if (v7)
    {
      _CDPLogSystemAnalytics();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[CDPDClientHandler sendEvent:].cold.1();
    }
    else
    {
      +[CDPDAnalyticsTransport transportForEvent:](CDPDAnalyticsTransport, "transportForEvent:", v4);
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject sendEvent:](v8, "sendEvent:", v4);
    }
  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPDClientHandler sendEvent:].cold.2();
  }

}

- (BOOL)_allowFollowUps
{
  return (LOBYTE(self->_entitlements) >> 4) & 1;
}

- (BOOL)_allowDataRecovery
{
  return (LOBYTE(self->_entitlements) >> 3) & 1;
}

- (BOOL)_allowRecoveryKey
{
  return (LOBYTE(self->_entitlements) >> 5) & 1;
}

- (BOOL)_allowStateMachineAccess
{
  return (LOBYTE(self->_entitlements) >> 1) & 1;
}

- (BOOL)_allowUtilityAccess
{
  return (LOBYTE(self->_entitlements) >> 2) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walrusDaemonService, 0);
  objc_storeStrong(&self->_notificationObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)fetchEscrowRecordDevicesWithContext:usingCache:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Fetching escrow record devices...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchEscrowRecordDevicesWithContext:usingCache:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying access to data recovery, missing entitlements.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)deviceEscrowRecordRecoverableWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Checking current device's escrow record for recoverability...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Failed to fetch escrow records with error: %{public}@\", v2);
  OUTLINED_FUNCTION_4();
}

void __73__CDPDClientHandler_deviceEscrowRecordRecoverableWithContext_completion___block_invoke_34_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Failed to find any escrow record for this device that is recoverable: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)handleCloudDataProtectionStateWithContext:(uint64_t)a1 uiProvider:(void *)a2 completion:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a2, "type");
  OUTLINED_FUNCTION_10_2();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
  OUTLINED_FUNCTION_6();
}

- (void)handleCloudDataProtectionStateWithContext:uiProvider:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Forcing _useSecureBackupCachedPassphrase=YES\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)handleCloudDataProtectionStateWithContext:uiProvider:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Setting _useSecureBackupCachedPassphrase=NO\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_shouldForceUseSecureBackupCachedPassphraseWithContext:(os_log_t)log clientType:.cold.1(char a1, char a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"_shouldForceUseSecureBackupCachedPassphrase: clientTypeIsBuddy=%{BOOL}d, hasSecret=%{BOOL}d\", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_4();
}

- (void)repairCloudDataProtectionStateWithContext:uiProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"repairCloudDataProtection: Denying access to state repair. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)startCircleApplicationApprovalServerWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Approving TTSU attempted without primary iCloud account, failing...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)startCircleApplicationApprovalServerWithContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to state repair. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __85__CDPDClientHandler__startObservingConnectionStateForRepairWithStateMachine_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"CDP flow interrupted\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)generateEscrowRecordStatusReportForContext:usingCache:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying access to escrow record status (missing entitlements).\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)shouldPerformRepairForContext:(NSObject *)a1 forceFetch:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[CDPDClientHandler shouldPerformRepairForContext:forceFetch:completion:]";
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a1, a3, "\"Context passed into %s was nil, and context for primary account is also nil. Aborting.\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)shouldPerformRepairForContext:forceFetch:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to state machine. Missing entitlements\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __85__CDPDClientHandler_finishOfflineLocalSecretChangeWithContext_uiProvider_completion___block_invoke_57_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Failed to update local secret after offline change: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __89__CDPDClientHandler_finishCyrusFlowAfterTermsAgreementWithContext_uiProvider_completion___block_invoke_58_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Failed to create delayed backup: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)clearFollowUpWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to cleraing follow ups. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_20DB2C000, v0, v1, "\"Shared iPads don't have iCK, please investigate why repair CDP CFU was issued!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpWithContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to posting follow ups. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)saveTermsAcceptance:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Client is not permitted to save terms.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchTermsAcceptanceForAccount:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Client is not permitted to fetch terms.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performRecoveryWithContext:uiProvider:authProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to back up data. Missing entitlements\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)isOTEnabledForContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to check OT status operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)cliqueStatusForContext:(const char *)a1 completion:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11_0(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v3, "\"%s: Did not recieve a context, failing!\", v4);
  OUTLINED_FUNCTION_6();
}

- (void)cliqueStatusForContext:(const char *)a1 completion:(NSObject *)a2 .cold.2(const char *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_11_0(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v3, "\"%s: Missing entitlement, failing!\", v4);
  OUTLINED_FUNCTION_6();
}

- (void)setKeyChainSyncCompatibilityState:(void *)a1 withAltDSID:.cold.1(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "_allowFollowUps");
  objc_msgSend(a1, "_allowUtilityAccess");
  OUTLINED_FUNCTION_10_2();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xEu);
}

- (void)setKeyChainSyncCompatibilityState:withAltDSID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0(&dword_20DB2C000, v0, v1, "\"SOS Compatibility: Invalid state. We can't have CDPSOSCompatibilityTypeOptInNeeded but not CDPSOSCompatibilityTypeSOSNeeded.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)setKeyChainSyncCompatibilityState:withAltDSID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"DeferSOSFromSignIn feature flag not enabled\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)setKeyChainSyncCompatibilityState:withAltDSID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to check setKeyChainSyncCompatibilityState status operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_updateSOSCompatibilityMode:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "@\"Failed to update SOSCCSetCompatibilityMode with error: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)recoverAndSynchronizeSquirrelWithContext:uiProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access to recovery key operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)isRecoveryKeyAvailableWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying access recovery key operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:uiProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Recovery key is allowed. Calling authenticateAndGenerateNewRecoveryKeyWithCompletion on CDPDRecoveryKeyController\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"%s - Denying access to recovery key operation. Missing entitlement.\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)authenticateAndGenerateNewRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Entering %s in CDPDClientHandler\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)verifyRecoveryKeyWithContext:uiProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Denying verify recovery key operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:uiProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Recovery key is allowed. Calling authenticateAndDeleteRecoveryKeyWithCompletion on CDPDRecoveryKeyController\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"%s - Denying access to recovery key operation. Missing entitlement.\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)authenticateAndDeleteRecoveryKeyWithContext:(uint64_t)a3 uiProvider:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, a1, a3, "\"Entering %s in CDPDClientHandler\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(*a1, "_allowFollowUps");
  OUTLINED_FUNCTION_10_2();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 8u);
  OUTLINED_FUNCTION_4();
}

void __72__CDPDClientHandler_deleteRecoveryKeyWithContext_uiProvider_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Error deleting Recovery Key: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)shouldPerformSilentEscrowRecordRepairWithContext:usingCache:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying access (missing entitlement).\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)startSilentEscrowRecordRepairWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying access to start repairing escrow record (missing entitlement).\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performSilentEscrowRecordRepairWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying access to perform escrow record repair (missing entitlement).\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:context:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20DB2C000, v1, OS_LOG_TYPE_ERROR, "\"Failed to update last silent escrow record repair attempt date (%@) with error: %@\", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:context:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying access to update last silent escrow record repair attempt date (missing entitlement).\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)sendEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "Dropping event (On Shared iPad), not supported: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)sendEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Telemetry Event submission reported without entitlements!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
