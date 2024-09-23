@implementation CDPDSecureBackupController

- (CDPDSecureBackupController)initWithContext:(id)a3 secureBackupProxy:(id)a4 octagonTrustProxy:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDSecureBackupController *v12;
  CDPDSecureBackupController *v13;
  uint64_t v14;
  CDPDSecureBackupConfiguration *configuration;
  CFIndex AppIntegerValue;
  NSObject *v17;
  NSObject *v18;
  Boolean keyExistsAndHasValidFormat;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CDPDSecureBackupController;
  v12 = -[CDPDSecureBackupController init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_secureBackupProxy, a4);
    objc_storeStrong((id *)&v13->_octagonTrustProxy, a5);
    objc_storeStrong((id *)&v13->_context, a3);
    +[CDPDSecureBackupConfiguration configurationWithContext:](CDPDSecureBackupConfiguration, "configurationWithContext:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    configuration = v13->_configuration;
    v13->_configuration = (CDPDSecureBackupConfiguration *)v14;

    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("RetryCount"), CFSTR("com.apple.corecdp"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      v13->_icscRepairTotalRetries = AppIntegerValue;
    }
    else if (-[CDPContext type](v13->_context, "type"))
    {
      v13->_icscRepairTotalRetries = 1;
    }
    else
    {
      v13->_icscRepairTotalRetries = 0;
    }
    v13->_icscRepairRetryDelay = CFPreferencesGetAppIntegerValue(CFSTR("RetryDelay"), CFSTR("com.apple.corecdp"), 0);
    if (CFPreferencesGetAppBooleanValue(CFSTR("SimulateNonViableEscrowRecord"), CFSTR("com.apple.corecdp"), 0))
    {
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:].cold.2();

      v13->_isSimulateNonViableEscrowRecordEnabled = 1;
    }
    if (CFPreferencesGetAppBooleanValue(CFSTR("SimulateEPThrottle"), CFSTR("com.apple.corecdp"), 0))
    {
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:].cold.1();

      v13->_simulateEPThrottle = 1;
    }
  }

  return v13;
}

- (CDPDSecureBackupController)initWithContext:(id)a3 uiProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDSecureBackupProxyImpl *v12;
  CDPDOctagonTrustProxyImpl *v13;
  CDPDSecureBackupController *v14;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = -[CDPDSecureBackupProxyImpl initWithContext:]([CDPDSecureBackupProxyImpl alloc], "initWithContext:", v11);
  v13 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", v11);
  v14 = -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:](self, "initWithContext:secureBackupProxy:octagonTrustProxy:", v11, v12, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_uiProvider, a4);
    objc_storeWeak((id *)&v14->_delegate, v10);
  }

  return v14;
}

- (void)synchronizeKeyValueStoreWithCompletion:(id)a3
{
  CDPContext *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CDPContext *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  CDPContext *v17;
  id v18;

  v5 = self->_context;
  v6 = a3;
  v7 = -[CDPContext backupActivity](v5, "backupActivity");
  if (v7)
    v8 = v7;
  else
    v8 = 4233613993;
  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", v8);
  v9 = _Block_copy(v6);

  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81CF50;
  v17 = v5;
  v18 = v9;
  v11 = v5;
  v12 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke_2;
  v14[3] = &unk_24C81BFF0;
  v15 = _Block_copy(aBlock);
  v13 = v15;
  -[CDPDSecureBackupController accountInfoWithCompletion:](self, "accountInfoWithCompletion:", v14);

}

uint64_t __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

uint64_t __69__CDPDSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)fetchEscrowRecordsWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  CDPDOctagonTrustProxy *octagonTrustProxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  -[CDPDSecureBackupConfiguration accountInfoFetchSetupDictionary](self->_configuration, "accountInfoFetchSetupDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController fetchEscrowRecordsWithOptionForceFetch:completion:].cold.1();

  octagonTrustProxy = self->_octagonTrustProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke;
  v11[3] = &unk_24C81D090;
  v12 = v6;
  v10 = v6;
  -[CDPDOctagonTrustProxy fetchEscrowRecords:forceFetch:completion:](octagonTrustProxy, "fetchEscrowRecords:forceFetch:completion:", v7, v4, v11);

}

void __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2();

  if (!v5 || v6)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_11;
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_11:
      v9();
    }
  }

}

- (void)fetchAllEscrowRecordsWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  CDPDOctagonTrustProxy *octagonTrustProxy;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  -[CDPDSecureBackupConfiguration accountInfoFetchSetupDictionary](self->_configuration, "accountInfoFetchSetupDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController fetchAllEscrowRecordsWithOptionForceFetch:completion:].cold.1();

  octagonTrustProxy = self->_octagonTrustProxy;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke;
  v11[3] = &unk_24C81D090;
  v12 = v6;
  v10 = v6;
  -[CDPDOctagonTrustProxy fetchAllEscrowRecords:forceFetch:completion:](octagonTrustProxy, "fetchAllEscrowRecords:forceFetch:completion:", v7, v4, v11);

}

void __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2();

  if (!v5 || v6)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_11;
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_11:
      v9();
    }
  }

}

- (void)accountInfoWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_cachedAccountInfo)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController accountInfoWithCompletion:].cold.1((uint64_t)self, &self->_cachedAccountInfo, v6);

    ((void (**)(_QWORD, NSDictionary *, _QWORD))v5)[2](v5, self->_cachedAccountInfo, 0);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke;
    v7[3] = &unk_24C81BFC8;
    v7[4] = self;
    v8 = v4;
    -[CDPDSecureBackupController _accountInfoWithCompletion:](self, "_accountInfoWithCompletion:", v7);

  }
}

void __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v6 = a2;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1(a1, v8);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v7);

}

- (void)clearAccountInfoCache
{
  CDPContext *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  NSDictionary *cachedAccountInfo;
  uint8_t v8[16];

  v3 = self->_context;
  v4 = -[CDPContext backupActivity](v3, "backupActivity");
  if (v4)
    v5 = v4;
  else
    v5 = 3819251231;
  -[CDPContext setBackupActivity:](v3, "setBackupActivity:", v5);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Clearing SecureBackup account info cache...\", v8, 2u);
  }

  cachedAccountInfo = self->_cachedAccountInfo;
  self->_cachedAccountInfo = 0;

  -[CDPContext setBackupActivity:](v3, "setBackupActivity:", 0);
}

- (void)_accountInfoWithCompletion:(id)a3
{
  CDPDSecureBackupConfiguration *configuration;
  id v5;
  void *v6;
  NSObject *v7;

  configuration = self->_configuration;
  v5 = a3;
  -[CDPDSecureBackupConfiguration accountInfoFetchSetupDictionary](configuration, "accountInfoFetchSetupDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _accountInfoWithCompletion:].cold.1();

  -[CDPDSecureBackupProxy accountInfoWithInfo:completion:](self->_secureBackupProxy, "accountInfoWithInfo:completion:", v6, v5);
}

- (void)isEligibleForCDPWithCompletion:(id)a3
{
  CDPContext *v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  id v9;
  CDPContext *v10;
  void (**v11)(void *, uint64_t, void *);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CDPContext *v19;
  id v20;

  v4 = self->_context;
  v5 = a3;
  v6 = -[CDPContext backupActivity](v4, "backupActivity");
  if (v6)
    v7 = v6;
  else
    v7 = 2909315642;
  -[CDPContext setBackupActivity:](v4, "setBackupActivity:", v7);
  v8 = _Block_copy(v5);

  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __61__CDPDSecureBackupController_isEligibleForCDPWithCompletion___block_invoke;
  v18 = &unk_24C81CF50;
  v9 = v8;
  v19 = v4;
  v20 = v9;
  v10 = v4;
  v11 = (void (**)(void *, uint64_t, void *))_Block_copy(&v15);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance", v15, v16, v17, v18, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasLocalSecret");

    if ((v13 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      _CDPStateError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11[2](v11, v13, v14);

  }
}

uint64_t __61__CDPDSecureBackupController_isEligibleForCDPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

- (void)backupRecordsArePresentWithCompletion:(id)a3
{
  CDPContext *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CDPContext *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  CDPContext *v17;
  id v18;

  v5 = self->_context;
  v6 = a3;
  v7 = -[CDPContext backupActivity](v5, "backupActivity");
  if (v7)
    v8 = v7;
  else
    v8 = 2254843714;
  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", v8);
  v9 = _Block_copy(v6);

  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81D0B8;
  v17 = v5;
  v18 = v9;
  v11 = v5;
  v12 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2;
  v14[3] = &unk_24C81D0E0;
  v15 = _Block_copy(aBlock);
  v13 = v15;
  -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](self, "getBackupRecordDevicesWithOptionForceFetch:completion:", 0, v14);

}

uint64_t __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_5();

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_19:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_4();

    v12 = objc_msgSend(v6, "count");
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14)
        __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_3(v6, v13);

      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_2();

      v16 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        v11 = *(void (**)(void))(v16 + 16);
        goto LABEL_19;
      }
    }
    else
    {
      if (v14)
        __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_1();

      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
      {
        v11 = *(void (**)(void))(v17 + 16);
        goto LABEL_19;
      }
    }
  }

}

- (void)getBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  CDPContext *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  id v12;
  CDPContext *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  CDPContext *v20;
  id v21;

  v5 = a3;
  v7 = self->_context;
  v8 = a4;
  v9 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v9)
    v10 = v9;
  else
    v10 = 707469235;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v10);
  v11 = _Block_copy(v8);

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __84__CDPDSecureBackupController_getBackupRecordDevicesWithOptionForceFetch_completion___block_invoke;
  v19 = &unk_24C81C928;
  v12 = v11;
  v21 = v12;
  v13 = v7;
  v20 = v13;
  v14 = _Block_copy(&v16);
  if ((-[CDPContext idmsRecovery](self->_context, "idmsRecovery", v16, v17, v18, v19) & 1) != 0
    || (-[CDPContext findMyiPhoneUUID](self->_context, "findMyiPhoneUUID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    -[CDPDSecureBackupController _getBackupRecordDevicesIncludingUnrecoverableRecords:](self, "_getBackupRecordDevicesIncludingUnrecoverableRecords:", v14);
  }
  else
  {
    -[CDPDSecureBackupController _getOctagonEscrowBackupRecordDevicesWithOptionForceFetch:completion:](self, "_getOctagonEscrowBackupRecordDevicesWithOptionForceFetch:completion:", v5, v14);
  }

}

uint64_t __84__CDPDSecureBackupController_getBackupRecordDevicesWithOptionForceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

- (id)handleCDPDevices:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v34;
    *(_QWORD *)&v6 = 138412290;
    v30 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (-[CDPDSecureBackupController fakeNearlyDepletedRecords](self, "fakeNearlyDepletedRecords", v30))
        {
          _CDPLogSystem();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v38 = v11;
            _os_log_debug_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEBUG, "\"**** DEBUG **** Setting fake remaining attempts value of 1 for %@\", buf, 0xCu);
          }

          objc_msgSend(v11, "setRemainingAttempts:", 1);
        }
        if (v11)
        {
          if (objc_msgSend(v11, "remainingAttempts"))
          {
            objc_msgSend(v31, "addObject:", v11);
          }
          else if (!objc_msgSend(v11, "remainingAttempts"))
          {
            _CDPLogSystem();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = objc_msgSend(v11, "remainingAttempts");
              *(_DWORD *)buf = 138412546;
              v38 = v11;
              v39 = 2048;
              v40 = v14;
              _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Disqualified device %@ because the remaining attempts is %lu\", buf, 0x16u);
            }

          }
        }
        _CDPLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "recordDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "recordDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          v38 = v11;
          v39 = 2112;
          v40 = (uint64_t)v16;
          v41 = 2112;
          v42 = v18;
          v19 = v18;
          _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"Backup record found for device %@ with date %@ (%@)\", buf, 0x20u);

        }
        if (!v8)
          goto LABEL_22;
        objc_msgSend(v11, "recordDate");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v11, "recordDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "laterDate:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "recordDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23 == v24)
          {
LABEL_22:
            _CDPLogSystem();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "recordDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v38 = v26;
              v39 = 2112;
              v40 = (uint64_t)v8;
              v41 = 2112;
              v42 = v11;
              _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"Backup record date %@ is later than the previously known newest record (%@), promoting %@ as newest device record\", buf, 0x20u);

            }
            objc_msgSend(v11, "recordDate");
            v27 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v27;
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  _CDPLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_20DB2C000, v28, OS_LOG_TYPE_DEFAULT, "\"Finished parsing multiple-iCSC records and found the newest record to be %@\", buf, 0xCu);
  }

  return v31;
}

- (void)_getOctagonEscrowBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  CDPContext *v7;
  NSObject *v8;
  CDPContext *v9;
  id v10;
  _QWORD v11[5];
  CDPContext *v12;
  id v13;
  BOOL v14;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  v7 = self->_context;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"_getOctagonEscrowBackupRecordDevicesWithOptionForceFetch: called, fetching escrow records\", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke;
  v11[3] = &unk_24C81D130;
  v12 = v7;
  v13 = v6;
  v11[4] = self;
  v14 = v4;
  v9 = v7;
  v10 = v6;
  -[CDPDSecureBackupController fetchEscrowRecordsWithOptionForceFetch:completion:](self, "fetchEscrowRecordsWithOptionForceFetch:completion:", v4, v11);

}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A410]), "initWithEscrowRecord:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleCDPDevices:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updateContext:withDevices:", *(_QWORD *)(a1 + 40), v15);
    if (objc_msgSend(v15, "count"))
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134218240;
        v33 = v17;
        v34 = 1024;
        v35 = 1;
        _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Finished parsing backup records, returning %lu devices and isUsingMultipleICSC=%i\", buf, 0x12u);
      }

      v18 = *(_QWORD *)(a1 + 48);
      if (!v18)
        goto LABEL_21;
      v19 = (void *)objc_msgSend(v15, "copy");
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v18 + 16))(v18, 1, v19, 0);
    }
    else
    {
      v20 = *(void **)(a1 + 32);
      v21 = *(unsigned __int8 *)(a1 + 56);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_40;
      v25[3] = &unk_24C81D108;
      v22 = *(id *)(a1 + 48);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      v27 = v22;
      v25[4] = v23;
      v26 = v24;
      objc_msgSend(v20, "fetchAllEscrowRecordsWithOptionForceFetch:completion:", v21, v25);

      v19 = v27;
    }

LABEL_21:
    goto LABEL_22;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_22:

}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_40_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setTotalEscrowDeviceCount:", objc_msgSend(v5, "count"));
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"there exists multiple icsc records and none of them will get the device into any trust system. Forcing a reset protected data\", buf, 2u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"constructed 0 CDP devices after refetching records, possibly single-iCSC.. calling _getBackupRecordDevicesIncludingUnrecoverableRecords\", buf, 2u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_41;
  v12[3] = &unk_24C81BED0;
  v11 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v11;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v13, "_getBackupRecordDevicesIncludingUnrecoverableRecords:", v12);

LABEL_10:
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_updateContext:withDevices:", *(_QWORD *)(a1 + 40), v9);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id, id))(v8 + 16))(v8, a2, v9, v7);

}

- (void)_updateContext:(id)a3 withDevices:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  id v26;
  id v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "remainingAttempts", v26);
        v14 = v13;
        if (v13 > v9)
          v9 = v13;
        if (!v8)
          goto LABEL_12;
        objc_msgSend(v12, "recordDate");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(v12, "recordDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "laterDate:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "recordDate");
          v30 = v9;
          v19 = v8;
          v20 = v10;
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v28;
          v22 = v18 == v21;
          v10 = v20;
          v8 = v19;
          v9 = v30;
          if (v22)
          {
LABEL_12:
            objc_msgSend(v12, "recordDate");
            v23 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v23;
          }
        }
        v7 += v14;
        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  v24 = objc_msgSend(obj, "count", v26);
  objc_msgSend(v27, "setValidEscrowDeviceCount:", v24);
  objc_msgSend(v27, "setTotalRecoveryAttempts:", v7);
  objc_msgSend(v27, "setMaxDeviceRecoveryAttempts:", v9);
  objc_msgSend(v8, "timeIntervalSinceNow");
  objc_msgSend(v27, "setNewestEscrowRecordAge:", fabs(v25));

}

- (void)_getBackupRecordDevicesIncludingUnrecoverableRecords:(id)a3
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
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"_getBackupRecordDevicesIncludingUnrecoverableRecords: called, fetching account info from SecureBackup\", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke;
  v7[3] = &unk_24C81CE10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CDPDSecureBackupController accountInfoWithCompletion:](self, "accountInfoWithCompletion:", v7);

}

void __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "desiresAllRecords");
  v8 = (_QWORD *)MEMORY[0x24BE17BA0];
  if (!v7)
    v8 = (_QWORD *)MEMORY[0x24BE17CF0];
  v44 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v8);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_41;
  }
  v10 = v9;
  v11 = 0;
  v47 = *(_QWORD *)v51;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v51 != v47)
        objc_enumerationMutation(obj);
      v49 = v12;
      v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v12);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A410]), "initWithSecureBackupRecordInfo:", v13);
      v15 = v14;
      if (objc_msgSend(*(id *)(a1 + 32), "fakeNearlyDepletedRecords"))
      {
        _CDPLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v55 = (uint64_t)v15;
          _os_log_debug_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEBUG, "\"**** DEBUG **** Setting fake remaining attempts value of 1 for %@\", buf, 0xCu);
        }

        v14 = v15;
        objc_msgSend(v15, "setRemainingAttempts:", 1);
      }
      if (v14)
      {
        if (objc_msgSend(v14, "remainingAttempts"))
        {
          objc_msgSend(v45, "addObject:", v14);
        }
        else if (!objc_msgSend(v14, "remainingAttempts"))
        {
          _CDPLogSystem();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_msgSend(v15, "remainingAttempts");
            *(_DWORD *)buf = 138412546;
            v55 = (uint64_t)v15;
            v56 = 2048;
            v57 = v18;
            _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Disqualified device %@ because the remaining attempts is %lu\", buf, 0x16u);
          }

        }
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ClientMetadata"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SecureBackupMetadataTimestamp"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        +[CDPDSecureBackupController _dateWithSecureBackupDateString:](CDPDSecureBackupController, "_dateWithSecureBackupDateString:", v21);
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
        v24 = v23;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        v23 = v21;
        goto LABEL_27;
      }
      v22 = v21;
      v24 = 0;
LABEL_29:
      objc_msgSend(v15, "setRecordDate:", v24);
      _CDPLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v55 = (uint64_t)v15;
        v56 = 2112;
        v57 = (uint64_t)v24;
        v58 = 2112;
        v59 = v26;
        v27 = v26;
        _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"Backup record found for device %@ with date %@ (%@)\", buf, 0x20u);

      }
      if (!v11
        || v24
        && (objc_msgSend(v11, "laterDate:", v24),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v28,
            v28 == v24))
      {
        _CDPLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v55 = (uint64_t)v24;
          v56 = 2112;
          v57 = (uint64_t)v11;
          v58 = 2112;
          v59 = v15;
          _os_log_impl(&dword_20DB2C000, v29, OS_LOG_TYPE_DEFAULT, "\"Backup record date %@ is later than the previously known newest record (%@), promoting %@ as newest device record\", buf, 0x20u);
        }

        v30 = v24;
        v11 = v30;
      }

      v12 = v49 + 1;
    }
    while (v10 != v49 + 1);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  }
  while (v10);
LABEL_41:

  _CDPLogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = (uint64_t)v11;
    _os_log_impl(&dword_20DB2C000, v31, OS_LOG_TYPE_DEFAULT, "\"Finished parsing multiple-iCSC records and found the newest record to be %@\", buf, 0xCu);
  }

  v32 = v45;
  v4 = v44;
  if (objc_msgSend(v45, "count"))
  {
    v33 = 1;
  }
  else
  {
    v34 = *MEMORY[0x24BE17C50];
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE17C50]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v35 == 0;
    if (v35)
    {
      objc_msgSend(v44, "objectForKeyedSubscript:", v34);
      v36 = objc_claimAutoreleasedReturnValue();
      _CDPLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = (uint64_t)v36;
        _os_log_impl(&dword_20DB2C000, v37, OS_LOG_TYPE_DEFAULT, "\"Found a single-iCSC metadata record. Returning that as a faux-device using %@\", buf, 0xCu);
      }

      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A410]), "initWithSecureBackupMetadataInfo:", v36);
      objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x24BE17CE0]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setHasRandomSecret:", objc_msgSend(v39, "BOOLValue"));

      v4 = v44;
      objc_msgSend(v45, "removeAllObjects");
      objc_msgSend(v45, "addObject:", v38);

      v32 = v45;
    }
    else
    {
      _CDPLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v36, OS_LOG_TYPE_DEFAULT, "\"No single-iCSC metadata record is present\", buf, 2u);
      }
    }

  }
  _CDPLogSystem();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 134218240;
    v55 = v41;
    v56 = 1024;
    LODWORD(v57) = v33;
    _os_log_impl(&dword_20DB2C000, v40, OS_LOG_TYPE_DEFAULT, "\"Finished parsing backup records, returning %lu devices and isUsingMultipleICSC=%i\", buf, 0x12u);
  }

  v42 = *(_QWORD *)(a1 + 40);
  if (v42)
  {
    v43 = (void *)objc_msgSend(v32, "copy");
    (*(void (**)(uint64_t, _BOOL8, void *, _QWORD))(v42 + 16))(v42, v33, v43, 0);

  }
  v5 = 0;
LABEL_57:

}

+ (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("dd-MM-yyyy HH:mm:ss"));
  objc_msgSend(v4, "dateFromString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v9);

    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(v4, "dateFromString:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  return v10;
}

- (void)enableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  CDPContext *v7;
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  CDPContext *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  CDPContext *v20;
  id v21;

  v7 = self->_context;
  v8 = a4;
  v9 = a3;
  v10 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v10)
    v11 = v10;
  else
    v11 = 3808140738;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v11);
  v12 = _Block_copy(v8);

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __71__CDPDSecureBackupController_enableSecureBackupWithContext_completion___block_invoke;
  v19 = &unk_24C81CF50;
  v20 = v7;
  v21 = v12;
  v13 = v7;
  v14 = v12;
  v15 = _Block_copy(&v16);
  -[CDPDSecureBackupController _enableSecureBackupWithContext:completion:](self, "_enableSecureBackupWithContext:completion:", v9, v15, v16, v17, v18, v19);

}

uint64_t __71__CDPDSecureBackupController_enableSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

- (void)upgradeICSCRecordsThenEnableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  CDPContext *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CDPContext *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD aBlock[4];
  CDPContext *v21;
  id v22;

  v6 = a3;
  v7 = self->_context;
  v8 = a4;
  v9 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v9)
    v10 = v9;
  else
    v10 = 4105090989;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v10);
  v11 = _Block_copy(v8);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81CF50;
  v21 = v7;
  v22 = v11;
  v13 = v7;
  v14 = v11;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2;
  v17[3] = &unk_24C81D158;
  v18 = v6;
  v19 = _Block_copy(aBlock);
  v17[4] = self;
  v15 = v6;
  v16 = v19;
  -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](self, "getBackupRecordDevicesWithOptionForceFetch:completion:", 0, v17);

}

uint64_t __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD);
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD aBlock[5];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_4();

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v8);
  }
  else if (a2)
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_59;
    aBlock[3] = &unk_24C81C470;
    v13 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v22 = v13;
    v23 = *(id *)(a1 + 48);
    v14 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v7, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasRandomSecret") & 1) != 0 || (objc_msgSend(v15, "hasNumericSecret") & 1) == 0)
    {
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_62;
      v19[3] = &unk_24C81C580;
      v20 = v14;
      objc_msgSend(v18, "promptForAdoptionOfMultipleICSCWithCompletion:", v19);

    }
    else
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_3();

      v14[2](v14);
    }

  }
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_59(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_60;
  v3[3] = &unk_24C81CDE8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "deleteSingleICSCBackupWithCompletion:", v3);

}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_60(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_60_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_60_cold_2();

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
  }

}

uint64_t __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_62(uint64_t a1)
{
  NSObject *v2;

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_62_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:(id)a3 completion:(id)a4
{
  id v6;
  CDPContext *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CDPContext *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CDPDSecureBackupController *v19;
  id v20;
  _QWORD aBlock[4];
  CDPContext *v22;
  id v23;

  v6 = a3;
  v7 = self->_context;
  v8 = a4;
  v9 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v9)
    v10 = v9;
  else
    v10 = 2608738587;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v10);
  v11 = _Block_copy(v8);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81CF50;
  v22 = v7;
  v23 = v11;
  v13 = v7;
  v14 = v11;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke_2;
  v17[3] = &unk_24C81D180;
  v18 = v6;
  v19 = self;
  v20 = _Block_copy(aBlock);
  v15 = v20;
  v16 = v6;
  -[CDPDSecureBackupController checkForExistingRecord:](self, "checkForExistingRecord:", v17);

}

uint64_t __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __103__CDPDSecureBackupController_checkAndRemoveExistingThenEnableSecureBackupRecordWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  v3 = a2;
  objc_msgSend(v3, "recordInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDevice:", v3);
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v6 = "\"Calling enable without delete due to existing record metadata being present\";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v6 = "\"No existing backup record found, continuing with enable\";
      v7 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "_enableSecureBackupWithContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)checkForAnyOctagonRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Starting to check whether the account has any OT viable escrow record...\", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke;
  v7[3] = &unk_24C81D0E0;
  v8 = v4;
  v6 = v4;
  -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](self, "getBackupRecordDevicesWithOptionForceFetch:completion:", 0, v7);

}

void __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v7);
  }
  else
  {
    objc_msgSend(v6, "aaf_firstObjectPassingTest:", &__block_literal_global_5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Completed the check for OT only viable escrow records with result: %@\", (uint8_t *)&v13, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, BOOL, _QWORD))(v12 + 16))(v12, v10 != 0, 0);

  }
}

BOOL __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke_64(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recordViability") != 2;

  return v3;
}

- (void)checkForExistingRecord:(id)a3
{
  CDPContext *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  CDPContext *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CDPContext *v19;
  id v20;

  v5 = self->_context;
  v6 = a3;
  v7 = -[CDPContext backupActivity](v5, "backupActivity");
  if (v7)
    v8 = v7;
  else
    v8 = 407282594;
  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", v8);
  v9 = _Block_copy(v6);

  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __53__CDPDSecureBackupController_checkForExistingRecord___block_invoke;
  v18 = &unk_24C81D1E8;
  v19 = v5;
  v20 = v9;
  v10 = v5;
  v11 = v9;
  v12 = _Block_copy(&v15);
  -[CDPDSecureBackupController delegate](self, "delegate", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "circlePeerIDForSecureBackupController:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPDSecureBackupController checkForExistingRecordWithPeerId:completion:](self, "checkForExistingRecordWithPeerId:completion:", v14, v12);
}

uint64_t __53__CDPDSecureBackupController_checkForExistingRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

- (void)checkForExistingRecordWithPeerId:(id)a3 completion:(id)a4
{
  id v6;
  CDPContext *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  CDPContext *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  CDPContext *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self->_context;
  v8 = a4;
  v9 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v9)
    v10 = v9;
  else
    v10 = 1412515335;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v10);
  v11 = _Block_copy(v8);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke;
  aBlock[3] = &unk_24C81D1E8;
  v24 = v11;
  v13 = v7;
  v23 = v13;
  v14 = v11;
  v15 = _Block_copy(aBlock);
  _CDPLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"Checking if the peer has a secure backup: %@\", buf, 0xCu);
  }

  v17 = (void *)MEMORY[0x24BDD1758];
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke_67;
  v20[3] = &unk_24C81C058;
  v21 = v6;
  v18 = v6;
  objc_msgSend(v17, "predicateWithBlock:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSecureBackupController checkForExistingRecordMatchingPredicate:forceFetch:completion:](self, "checkForExistingRecordMatchingPredicate:forceFetch:completion:", v19, 0, v15);

}

uint64_t __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

uint64_t __74__CDPDSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke_67(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)checkForExistingRecordMatchingPredicate:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  CDPContext *v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  CDPContext *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD aBlock[4];
  CDPContext *v23;
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = self->_context;
  v10 = a5;
  v11 = -[CDPContext backupActivity](v9, "backupActivity");
  if (v11)
    v12 = v11;
  else
    v12 = 1846835407;
  -[CDPContext setBackupActivity:](v9, "setBackupActivity:", v12);
  v13 = _Block_copy(v10);

  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke;
  aBlock[3] = &unk_24C81D1E8;
  v15 = v13;
  v24 = v15;
  v16 = v9;
  v23 = v16;
  v17 = _Block_copy(aBlock);
  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[CDPDSOSSecureBackupController checkForExistingRecordMatchingPredicate:forceFetch:completion:].cold.1();

  if (v17)
  {
    if (v8)
    {
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_69;
      v19[3] = &unk_24C81BEF8;
      v20 = v8;
      v21 = v17;
      -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](self, "getBackupRecordDevicesWithOptionForceFetch:completion:", v6, v19);

    }
    else
    {
      (*((void (**)(void *, _QWORD, _QWORD))v17 + 2))(v17, 0, 0);
    }
  }

}

uint64_t __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_69(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_69_cold_1();
  }
  else
  {
    objc_msgSend(a3, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v7, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Found %@ matching devices\", (uint8_t *)&v11, 0xCu);

    }
    if (-[NSObject count](v7, "count"))
    {
      -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)supportsRecoveryKeyWithError:(id *)a3
{
  CDPContext *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  id v27;

  v5 = self->_context;
  v6 = -[CDPContext backupActivity](v5, "backupActivity");
  if (v6)
    v7 = v6;
  else
    v7 = 3623838984;
  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", v7);
  if (!CFPreferencesGetAppBooleanValue(CFSTR("ForceRecoveryKeySupport"), CFSTR("com.apple.corecdp"), 0))
  {
    v10 = objc_alloc_init(MEMORY[0x24BDE84B8]);
    -[CDPDSecureBackupController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAltDSID:", v12);

    objc_msgSend(v10, "setContext:", *MEMORY[0x24BDE8508]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CDPDSecureBackupController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "telemetryFlowID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFlowID:", v14);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CDPDSecureBackupController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "telemetryDeviceSessionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDeviceSessionID:", v16);

    }
    -[CDPDSecureBackupController octagonTrustProxy](self, "octagonTrustProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v18 = objc_msgSend(v17, "isRecoveryKeySet:error:", v10, &v27);
    v19 = v27;

    -[CDPDSecureBackupController secureBackupProxy](self, "secureBackupProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v21 = objc_msgSend(v20, "isRecoveryKeySet:", &v26);
    v22 = v26;

    v9 = v21 | v18;
    if (((v21 | v18) & 1) != 0)
    {
      -[CDPContext setBackupActivity:](v5, "setBackupActivity:", 0);
LABEL_28:

      goto LABEL_29;
    }
    if (v19)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v19);
      -[CDPContext setBackupActivity:](v5, "setBackupActivity:", 0);
      _CDPLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController supportsRecoveryKeyWithError:].cold.2();

      if (!v22)
        goto LABEL_28;
    }
    else
    {
      if (!v22)
        goto LABEL_28;
      if (a3)
        *a3 = objc_retainAutorelease(v22);
      -[CDPContext setBackupActivity:](v5, "setBackupActivity:", 0);
    }
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController supportsRecoveryKeyWithError:].cold.1();

    goto LABEL_28;
  }
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController supportsRecoveryKeyWithError:].cold.3();

  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", 0);
  v9 = 1;
LABEL_29:

  return v9;
}

- (BOOL)supportsWalrusRecoveryKeyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  CDPDOctagonTrustProxy *octagonTrustProxy;
  id v20;
  id v22;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext altDSID](self->_context, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "hasModernRecoveryKeyForAccount:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    octagonTrustProxy = self->_octagonTrustProxy;
    v22 = 0;
    LODWORD(v17) = -[CDPDOctagonTrustProxy isRecoveryKeySet:error:](octagonTrustProxy, "isRecoveryKeySet:error:", v18, &v22);
    v20 = v22;
    if (v20)
    {
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController supportsRecoveryKeyWithError:].cold.2();

      LOBYTE(v17) = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v20);
    }
    else if ((_DWORD)v17)
    {
      LOBYTE(v17) = objc_msgSend(v8, "BOOLValue");
    }

  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController supportsWalrusRecoveryKeyWithError:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5102);
      LOBYTE(v17) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return (char)v17;
}

- (void)_enableSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _enableSecureBackupWithContext:completion:].cold.1();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke;
  v11[3] = &unk_24C81D210;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CDPDSecureBackupController _authenticatedEnableSecureBackupIncludingFallbackWithContext:completion:](self, "_authenticatedEnableSecureBackupIncludingFallbackWithContext:completion:", v9, v11);

}

void __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, 1, v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "_retryRepairWithContext:retryCount:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  }

}

- (void)_retryRepairWithContext:(id)a3 retryCount:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int64_t v19;

  v8 = a3;
  v9 = a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _retryRepairWithContext:retryCount:completion:].cold.2();

  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _retryRepairWithContext:retryCount:completion:].cold.1((uint64_t)self);

  v12 = dispatch_time(0, 1000000000 * self->_icscRepairRetryDelay);
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke;
  v16[3] = &unk_24C81D260;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = a4;
  v14 = v9;
  v15 = v8;
  dispatch_after(v12, v13, v16);

}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 16);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2;
  v7[3] = &unk_24C81CD98;
  v7[4] = v2;
  v8 = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "reauthenticateUserWithCompletion:", v7);

}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_2();

  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82;
    v21[3] = &unk_24C81D238;
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v23 = v9;
    v24 = v10;
    v11 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v11;
    objc_msgSend(v7, "_authenticatedEnableSecureBackupIncludingFallbackWithContext:completion:", v8, v21);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "circleJoinResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPeersWithCDPBackupRecords");

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BE1A428], "contextForStateRepair");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "altDSID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAltDSID:", v15);

      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "telemetryFlowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTelemetryFlowID:", v17);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "telemetryDeviceSessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTelemetryDeviceSessionID:", v18);

      +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postFollowUpItemForContext:error:", v14, 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "_postICSCCreationFailedEventWithError:", v5);
    v20 = *(_QWORD *)(a1 + 48);
    if (v20)
      (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v5);
  }

}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;

  v5 = a3;
  if (a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82_cold_1();

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_14:
      v8();
    }
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56) + 1;
    v10 = objc_msgSend(*(id *)(a1 + 32), "icscRepairTotalRetries");
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9 >= v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82_cold_3();

      v13 = *(_QWORD *)(a1 + 48);
      if (v13)
      {
        v8 = *(void (**)(void))(v13 + 16);
        goto LABEL_14;
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "_retryRepairWithContext:retryCount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
    }
  }

}

- (void)_postICSCCreationFailedEventWithError:(id)a3
{
  void *v3;
  CDPContext *context;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDFC2A0];
  context = self->_context;
  v5 = *MEMORY[0x24BE1A668];
  v6 = *MEMORY[0x24BE1A860];
  v7 = a3;
  objc_msgSend(v3, "analyticsEventWithContext:eventName:category:", context, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
  objc_msgSend(v9, "populateUnderlyingErrorsStartingWithRootError:", v7);

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v9);

}

- (void)enableSecureBackupWithRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  CDPContext *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  CDPContext *v14;
  void (**v15)(void *, uint64_t, _QWORD);
  BOOL v16;
  id v17;
  void *v18;
  NSObject *v19;
  CDPContext *context;
  _QWORD v21[5];
  id v22;
  void (**v23)(void *, uint64_t, _QWORD);
  id v24;
  _QWORD aBlock[4];
  CDPContext *v26;
  id v27;

  v6 = a3;
  v7 = self->_context;
  v8 = a4;
  v9 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v9)
    v10 = v9;
  else
    v10 = 2608738587;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v10);
  v11 = _Block_copy(v8);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke;
  aBlock[3] = &unk_24C81CF50;
  v13 = v11;
  v27 = v13;
  v14 = v7;
  v26 = v14;
  v15 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v24 = 0;
  v16 = -[CDPDSecureBackupController authenticatedEnableSecureBackupWithRecoveryKey:error:](self, "authenticatedEnableSecureBackupWithRecoveryKey:error:", v6, &v24);
  v17 = v24;
  v18 = v17;
  if (v16)
  {
    v15[2](v15, 1, 0);
  }
  else if (objc_msgSend(v17, "isAuthenticationError"))
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController enableSecureBackupWithRecoveryKey:completion:].cold.1();

    context = self->_context;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke_87;
    v21[3] = &unk_24C81CDE8;
    v21[4] = self;
    v22 = v6;
    v23 = v15;
    -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v21);

  }
  else
  {
    ((void (**)(void *, uint64_t, void *))v15)[2](v15, 0, v18);
  }

}

uint64_t __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __75__CDPDSecureBackupController_enableSecureBackupWithRecoveryKey_completion___block_invoke_87(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)a1[4];
    v7 = a1[5];
    v12 = 0;
    v8 = objc_msgSend(v6, "authenticatedEnableSecureBackupWithRecoveryKey:error:", v7, &v12);
    v9 = v12;
    v10 = a1[6];
    if (v10)
      (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v8, v9);

  }
  else
  {
    v11 = a1[6];
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v5);
  }

}

- (BOOL)authenticatedEnableSecureBackupWithRecoveryKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17BE0]);
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BE17CB8]);
    objc_msgSend(v7, "setObject:forKey:", v6, *MEMORY[0x24BE17C80]);
    -[CDPDSecureBackupConfiguration escrowAuthInfo](self->_configuration, "escrowAuthInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v9);

    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController authenticatedEnableSecureBackupWithRecoveryKey:error:].cold.2();

    v11 = -[CDPDSecureBackupProxy enableWithInfo:error:](self->_secureBackupProxy, "enableWithInfo:error:", v7, a4);
  }
  else if (a4)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController authenticatedEnableSecureBackupWithRecoveryKey:error:].cold.1();

    _CDPStateError();
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_authenticatedEnableSecureBackupIncludingFallbackWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke;
  v10[3] = &unk_24C81D210;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:](self, "_authenticatedEnableSecureBackupWithContext:fallbackState:completion:", v8, 0, v10);

}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_19:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_5();

    if ((objc_msgSend(v5, "isMissingCachedPassphraseError") & 1) != 0)
    {
      v10 = objc_msgSend(MEMORY[0x24BE1A4A0], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled");
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if ((v10 & 1) != 0)
      {
        if (v12)
          __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_2();

        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_90;
        v16[3] = &unk_24C81C580;
        v17 = *(id *)(a1 + 48);
        objc_msgSend(v13, "_authenticatedEnableSecureBackupWithContext:fallbackState:completion:", v14, 1, v16);

        goto LABEL_20;
      }
      if (v12)
        __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_3();
    }
    else
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_4();
    }

    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
    {
      v9 = *(void (**)(void))(v15 + 16);
      goto LABEL_19;
    }
  }
LABEL_20:

}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_90(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_90_cold_1();

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_90_cold_2();

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }

}

- (void)_authenticatedEnableSecureBackupWithContext:(id)a3 fallbackState:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NSObject *v83;
  CDPDSecureBackupProxy *secureBackupProxy;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  void *v91;
  CDPDSecureBackupController *v92;
  void (**v93)(id, _QWORD, void *);
  unint64_t v94;
  id v95;
  id v96;
  const __CFString *v97;
  void *v98;
  uint8_t buf[4];
  _BOOL4 v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.11();

  -[CDPDSecureBackupController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!self->_context || !v11 || (objc_msgSend(v11, "synchronizeCircleViewsForSecureBackupContext:", v8) & 1) != 0)
  {
    v13 = -[CDPDSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:](self, "_shouldUseSBDCacheWithSecureBackupContext:fallbackState:", v8, a4);
    if (CFPreferencesGetAppBooleanValue(CFSTR("ForceCachedSecretPurge"), CFSTR("com.apple.corecdp"), 0))
    {
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.10();

      -[CDPDSecureBackupProxy uncacheAllSecrets](self->_secureBackupProxy, "uncacheAllSecrets");
    }
    v93 = v9;
    v94 = a4;
    v15 = objc_msgSend(v8, "localSecretType");
    objc_msgSend(v8, "localSecret");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupController _clientMetadataWithSecretType:length:](self, "_clientMetadataWithSecretType:length:", v15, objc_msgSend(v16, "length"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v8, "localSecret");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v37 = v17;
        goto LABEL_33;
      }
      objc_msgSend(v8, "localSecret");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (!v20)
      {
        _CDPLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.9(v21, v22, v23, v24, v25, v26, v27, v28);

      }
    }
    v92 = self;
    v29 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unlockScreenType");
    _CDPLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v91 = v30;
    v33 = v17;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v100 = v31 == 0;
      _os_log_debug_impl(&dword_20DB2C000, v32, OS_LOG_TYPE_DEBUG, "\"Using cached secret and managed config reports devicePasscodeIsSimple=%i\", buf, 8u);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v31 != 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v34, *MEMORY[0x24BE17CC8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v31 == 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v35, *MEMORY[0x24BE17CD8]);

    if (v31)
    {
      objc_msgSend(v29, "removeObjectForKey:", *MEMORY[0x24BE17C60]);
      v36 = v30;
    }
    else
    {
      *(_DWORD *)buf = -1;
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unlockScreenTypeWithOutSimplePasscodeType:", buf);

      if (v39 && *(_DWORD *)buf != -1)
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.1();
      if (*(_DWORD *)buf)
        v40 = 6;
      else
        v40 = 4;
      _CDPLogSystem();
      v41 = objc_claimAutoreleasedReturnValue();
      v36 = v91;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.8();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", v42, *MEMORY[0x24BE17C60]);

    }
    v37 = (void *)objc_msgSend(v29, "copy");

    _CDPLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.7();

    self = v92;
LABEL_33:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localSecret");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v8, "localSecret");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "length");

      if (!v47)
      {
        _CDPLogSystem();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.6(v48, v49, v50, v51, v52, v53, v54, v55);

      }
      objc_msgSend(v8, "localSecret");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (_QWORD *)MEMORY[0x24BE17C68];
    }
    else
    {
      objc_msgSend(v8, "recoveryKey");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v58)
        goto LABEL_42;
      objc_msgSend(v44, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CB8]);
      objc_msgSend(v8, "recoveryKey");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (_QWORD *)MEMORY[0x24BE17C80];
    }
    objc_msgSend(v44, "setObject:forKey:", v56, *v57);

LABEL_42:
    if (objc_msgSend(v8, "synchronous"))
      objc_msgSend(v44, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CB8]);
    objc_msgSend(v8, "preRecordUUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v8, "preRecordUUID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v60, *MEMORY[0x24BE17C38]);

    }
    if (v13)
    {
      objc_msgSend(v44, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CC0]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "localSecretType") == 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v61, *MEMORY[0x24BE17CE0]);

    }
    v62 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v44, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17BE0]);
    objc_msgSend(v44, "setObject:forKey:", v62, *MEMORY[0x24BE17CD0]);
    objc_msgSend(v8, "device");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "recordInfo");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend(v8, "device");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "recordInfo");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v66, *MEMORY[0x24BE17CA8]);

    }
    -[CDPDSecureBackupConfiguration escrowAuthInfo](self->_configuration, "escrowAuthInfo");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addEntriesFromDictionary:", v67);

    if (objc_msgSend(v8, "nonViableRequiresRepair"))
      objc_msgSend(v44, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17C58]);
    objc_msgSend(v8, "telemetryDeviceSessionID");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v8, "telemetryDeviceSessionID");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v69, *MEMORY[0x24BE17BF0]);

    }
    objc_msgSend(v8, "telemetryFlowID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      objc_msgSend(v8, "telemetryFlowID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v71, *MEMORY[0x24BE17C30]);

    }
    _CDPLogSystem();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.5(v8);

    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "primaryAccountStashedPRK");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      v75 = v37;
      v76 = v12;
      -[CDPDSecureBackupController _currentAnisetteData](self, "_currentAnisetteData");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "machineID");
      v78 = objc_claimAutoreleasedReturnValue();

      if (v78)
      {
        v79 = objc_msgSend(v75, "mutableCopy");
        -[NSObject setObject:forKeyedSubscript:](v79, "setObject:forKeyedSubscript:", v78, CFSTR("device_mid"));
        v80 = -[NSObject copy](v79, "copy");

        v97 = CFSTR("prk");
        v98 = v74;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v81, 1, 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKey:", v82, *MEMORY[0x24BE17C40]);

        v75 = (void *)v80;
      }
      else
      {
        _CDPLogSystem();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.4();
      }
      v9 = v93;

      v12 = v76;
      v37 = v75;
    }
    else
    {
      _CDPLogSystem();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.3();
      v9 = v93;
    }

    objc_msgSend(v44, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BE17C50]);
    _CDPLogSystem();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:].cold.2();

    secureBackupProxy = self->_secureBackupProxy;
    v96 = 0;
    -[CDPDSecureBackupProxy enableWithInfo:error:](secureBackupProxy, "enableWithInfo:error:", v44, &v96);
    v85 = v96;
    v86 = v85;
    if (!v85)
      goto LABEL_77;
    objc_msgSend(v85, "domain");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "isEqual:", *MEMORY[0x24BE17B98]))
    {
      v88 = objc_msgSend(v86, "code");

      if (v88 != -6005)
      {
LABEL_77:
        -[CDPDSecureBackupController context](self, "context");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:](self, "_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:", v86, v94, v90, v12, v9);

        goto LABEL_78;
      }
      _CDPLogSystem();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v89, OS_LOG_TYPE_DEFAULT, "\"Failed to enable due to existing record, disabling and trying again\", buf, 2u);
      }

      v95 = 0;
      -[CDPDSecureBackupController _disableThenEnableWithInfo:error:](self, "_disableThenEnableWithInfo:error:", v44, &v95);
      v87 = v86;
      v86 = v95;
    }

    goto LABEL_77;
  }
  if (v9)
  {
    _CDPStateError();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v37);
LABEL_78:

  }
}

- (void)_handleSecureBackupEnablementError:(id)a3 fallbackState:(unint64_t)a4 context:(id)a5 delegate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    v16 = objc_msgSend(v12, "isMissingCachedPassphraseError");
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasLocalSecret");

    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16 && v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.5();

      if (a4)
      {
        v21 = objc_msgSend(v13, "disableAsyncModeRequested");
        _CDPLogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        if ((v21 & 1) != 0)
        {
          if (v23)
            -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.3();

          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke;
          v27[3] = &unk_24C81CDC0;
          v27[4] = self;
          v28 = v15;
          objc_msgSend(v14, "promptForLocalSecretWithCompletion:", v27);

          goto LABEL_28;
        }
        if (v23)
          -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.4();

      }
      else
      {
        _CDPLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.2();

      }
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5501, v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v26);

    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.6();

      if (v15)
        (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v12);
    }
  }
  else
  {
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _handleSecureBackupEnablementError:fallbackState:context:delegate:completion:].cold.1();

    if (v15)
      (*((void (**)(id, uint64_t, _QWORD))v15 + 2))(v15, 1, 0);
  }
LABEL_28:

}

void __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CDPDSecureBackupContext *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(CDPDSecureBackupContext);
    objc_msgSend(v5, "validatedSecret");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupContext setLocalSecret:](v7, "setLocalSecret:", v8);

    -[CDPDSecureBackupContext setLocalSecretType:](v7, "setLocalSecretType:", objc_msgSend(v5, "secretType"));
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "_enableSecureBackupWithContext:completion:", v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
  }

}

- (BOOL)_shouldUseSBDCacheWithSecureBackupContext:(id)a3 fallbackState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  char v8;

  v6 = a3;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ForceUseCachedSecret"), CFSTR("com.apple.corecdp"), 0))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:].cold.1();

  }
  else
  {
    if (a4 == 2
      || !objc_msgSend(MEMORY[0x24BE1A4A0], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled"))
    {
      v8 = objc_msgSend(v6, "usePreviouslyCachedSecret");
      goto LABEL_11;
    }
    if (a4 != 1)
    {
      v8 = -[CDPContext type](self->_context, "type") == 10;
      goto LABEL_11;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)_disableThenEnableWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v13;

  v6 = a3;
  v13 = 0;
  v7 = -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:](self, "_disableSecureBackupWithEnableInfo:error:", v6, &v13);
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE17CA8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE17C58]);
    v11 = -[CDPDSecureBackupProxy enableWithInfo:error:](self->_secureBackupProxy, "enableWithInfo:error:", v10, a4);

  }
  else
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v11;
}

- (id)_currentAnisetteData
{
  id v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = objc_alloc_init(MEMORY[0x24BE0ACB0]);
  v3 = dispatch_semaphore_create(0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__CDPDSecureBackupController__currentAnisetteData__block_invoke;
  v7[3] = &unk_24C81D288;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v2, "anisetteDataWithCompletion:", v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __50__CDPDSecureBackupController__currentAnisetteData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __50__CDPDSecureBackupController__currentAnisetteData__block_invoke_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_clientMetadataWithSecretType:(unint64_t)a3 length:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BE17CC8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x24BE17CD8]);

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BE17C60]);

  }
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("device_name"));
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "marketingModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("device_model"));
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("device_model_version"));
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceClass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("device_model_class"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24C836758, CFSTR("device_platform"));
  v18 = (void *)MGCopyAnswer();
  if (v18)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("device_color"));
  v19 = (void *)MGCopyAnswer();
  if (v19)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("device_enclosure_color"));
  v20 = (void *)objc_msgSend(v6, "copy");

  return v20;
}

- (id)performEscrowRecoveryWithData:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController performEscrowRecoveryWithData:error:].cold.3();

  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE17C30]);

  }
  -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE17BF0]);

  }
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2114;
    v28 = v15;
    _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Passing telemetry flow ID %{public}@ and session ID %{public}@ to OTClique performEscrowRecoveryWithContextData\", buf, 0x16u);

  }
  v16 = (void *)MEMORY[0x24BDE84B0];
  -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v16, "performEscrowRecoveryWithContextData:escrowArguments:error:", v17, v8, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController performEscrowRecoveryWithData:error:].cold.2();

    v22 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController performEscrowRecoveryWithData:error:].cold.1();

    v22 = v18;
  }

  return v22;
}

- (id)performSilentEscrowRecoveryWithCDPContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  uint64_t Nanoseconds;
  NSObject *v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v51;
  id obj;
  _QWORD v53[4];
  NSObject *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  uint8_t buf[4];
  os_signpost_id_t v72;
  __int16 v73;
  double v74;
  __int16 v75;
  int v76;
  _BYTE v77[24];
  uint64_t v78;
  _QWORD v79[4];

  v79[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.7();

  v68 = 0;
  v69[0] = &v68;
  v69[1] = 0x3032000000;
  v69[2] = __Block_byref_object_copy__4;
  v69[3] = __Block_byref_object_dispose__4;
  v70 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__4;
  v66 = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 1;
  v8 = dispatch_semaphore_create(0);
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke;
  v53[3] = &unk_24C81D2B0;
  v55 = &v68;
  v56 = &v58;
  v57 = &v62;
  v9 = v8;
  v54 = v9;
  -[CDPDSecureBackupController getBackupRecordDevicesWithOptionForceFetch:completion:](self, "getBackupRecordDevicesWithOptionForceFetch:completion:", 0, v53);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(v69[0] + 40))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.6((uint64_t)v69, v10, v11, v12, v13, v14, v15, v16);

    if (a4)
    {
      v17 = 0;
      *a4 = objc_retainAutorelease(*(id *)(v69[0] + 40));
      goto LABEL_40;
    }
LABEL_33:
    v17 = 0;
    goto LABEL_40;
  }
  if (*((_BYTE *)v59 + 24))
  {
    if (!objc_msgSend((id)v63[5], "count"))
    {
      _CDPLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.2();

      if (a4)
      {
        v38 = (void *)MEMORY[0x24BDD1540];
        v78 = *MEMORY[0x24BDD0FC8];
        v79[0] = CFSTR("no escrow records found");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE1A368], -5305, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_retainAutorelease(v40);
        *a4 = v41;

      }
      goto LABEL_33;
    }
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.5((uint64_t)v77, objc_msgSend((id)v63[5], "count"), v18);

    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.4();

    objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, *MEMORY[0x24BE1A7D0], *MEMORY[0x24BE1A860]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPSignpostLogSystem();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _CDPSignpostCreate();

    _CDPSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20DB2C000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "OTCPerformSilentEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    _CDPSignpostLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v72 = v21;
      _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OTCPerformSilentEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    v25 = (void *)MEMORY[0x24BDE84B0];
    -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v63[5];
    v28 = (id *)(v69[0] + 40);
    obj = *(id *)(v69[0] + 40);
    objc_msgSend(v25, "performSilentEscrowRecovery:cdpContext:allRecords:error:", v26, v6, v27, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v28, obj);

    Nanoseconds = _CDPSignpostGetNanoseconds();
    _CDPSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      v32 = objc_msgSend(*(id *)(v69[0] + 40), "code");
      *(_DWORD *)buf = 67240192;
      LODWORD(v72) = v32;
      _os_signpost_emit_with_name_impl(&dword_20DB2C000, v31, OS_SIGNPOST_INTERVAL_END, v21, "OTCPerformSilentEscrowRecovery", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
    }

    _CDPSignpostLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(*(id *)(v69[0] + 40), "code");
      *(_DWORD *)buf = 134218496;
      v72 = v21;
      v73 = 2048;
      v74 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      v75 = 1026;
      v76 = v34;
      _os_log_impl(&dword_20DB2C000, v33, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: OTCPerformSilentEscrowRecovery  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
    }

    if (v17)
    {
      objc_msgSend(v51, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A640]);
    }
    else
    {
      _CDPLogSystem();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.3((uint64_t)v69, v42, v43, v44, v45, v46, v47, v48);

      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(v69[0] + 40));
      objc_msgSend(v51, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
      objc_msgSend(v51, "populateUnderlyingErrorsStartingWithRootError:", *(_QWORD *)(v69[0] + 40));
    }
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "sendEvent:", v51);

  }
  else
  {
    _CDPLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:].cold.1();

    objc_msgSend(MEMORY[0x24BE6E100], "CDPRecordContextToDictionary:", v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupController performEscrowRecoveryWithData:error:](self, "performEscrowRecoveryWithData:error:", v36, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_40:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v17;
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_4();
LABEL_4:

    goto LABEL_5;
  }
  if (!objc_msgSend(v7, "count"))
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_1();
    goto LABEL_4;
  }
  if ((a2 & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)MEMORY[0x24BE6E100];
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "recordInfo", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dictionaryToEscrowRecord:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v17);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_2(a1, v9);
    goto LABEL_4;
  }
  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_3();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)recordIsEmpty:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  if (objc_msgSend(v3, "creationDate"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "escrowInformationMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "secureBackupTimestamp")
      || objc_msgSend(v3, "recordStatus") != 1
      || objc_msgSend(v3, "remainingAttempts"))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "escrowInformationMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "secureBackupUsesMultipleIcscs"))
      {
        v4 = 0;
      }
      else
      {
        objc_msgSend(v3, "escrowInformationMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "clientMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "devicePlatform"))
        {
          v4 = 0;
        }
        else
        {
          objc_msgSend(v3, "escrowInformationMetadata");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "clientMetadata");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "secureBackupMetadataTimestamp"))
          {
            v4 = 0;
          }
          else
          {
            objc_msgSend(v3, "escrowInformationMetadata");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "clientMetadata");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v13, "secureBackupNumericPassphraseLength") == 0;

          }
        }

      }
    }

  }
  return v4;
}

- (id)performEscrowRecoveryWithRecoveryContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v12;
  id v13;

  v6 = a3;
  v13 = 0;
  -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:](self, "_performEscrowRecoveryWithRecoveryContext:fallbackState:error:", v6, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (objc_msgSend(v8, "indicatesRecoveryCanBeRetried"))
  {
    v12 = v8;
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:](self, "_performEscrowRecoveryWithRecoveryContext:fallbackState:error:", v6, 1, &v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v12;

    v8 = v10;
    v7 = (void *)v9;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (id)_performEscrowRecoveryWithRecoveryContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  int v37;
  NSObject *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  os_signpost_id_t v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t Nanoseconds;
  NSObject *v73;
  NSObject *v74;
  int v75;
  NSObject *v76;
  int v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  void *v81;
  id v82;
  id v83;
  uint8_t buf[4];
  os_signpost_id_t v85;
  __int16 v86;
  double v87;
  __int16 v88;
  int v89;
  uint64_t v90;
  _QWORD v91[2];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.13();

  -[CDPDSecureBackupController _recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:](self, "_recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:", v8, -[CDPDSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:](self, "_shouldUseSBDCacheWithSecureBackupContext:fallbackState:", v8, a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E100], "dictionaryToCDPRecordContext:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recoveryKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.12();

    objc_msgSend(v8, "recoveryKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_25:
      v37 = objc_msgSend(v8, "silentRecovery");
      _CDPLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v39)
          -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.1();

        -[CDPDSecureBackupController performSilentEscrowRecoveryWithCDPContext:error:](self, "performSilentEscrowRecoveryWithCDPContext:error:", v11, a5);
        v40 = objc_claimAutoreleasedReturnValue();
LABEL_47:
        v36 = (void *)v40;
        v32 = 0;
        v35 = 0;
        goto LABEL_48;
      }
      if (v39)
        -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.7();

      objc_msgSend(v8, "device");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isUsingMultipleiCSC");

      if ((v44 & 1) == 0)
      {
        _CDPLogSystem();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.6();

        -[CDPDSecureBackupController performEscrowRecoveryWithData:error:](self, "performEscrowRecoveryWithData:error:", v10, a5);
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      v45 = (void *)MEMORY[0x24BE6E100];
      objc_msgSend(v8, "device");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "recordInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "dictionaryToEscrowRecord:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)v48;
      LODWORD(v46) = -[CDPDSecureBackupController recordIsEmpty:](self, "recordIsEmpty:", v48);
      _CDPLogSystem();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if ((_DWORD)v46)
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.2();

        if (a5)
        {
          v52 = (void *)MEMORY[0x24BDD1540];
          v53 = *MEMORY[0x24BE1A368];
          v90 = *MEMORY[0x24BDD0FC8];
          v91[0] = CFSTR("chosen record is empty");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", v53, -5305, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = objc_retainAutorelease(v55);
          *a5 = v56;

        }
        v32 = 0;
        v35 = 0;
LABEL_43:
        v36 = 0;
        goto LABEL_48;
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.5();

      v59 = objc_alloc(MEMORY[0x24BDFC2A0]);
      v60 = (void *)objc_msgSend(v59, "initWithEventName:eventCategory:initData:", *MEMORY[0x24BE1A778], *MEMORY[0x24BE1A860], 0);
      -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setObject:forKeyedSubscript:", v62, *MEMORY[0x24BDFC340]);

      }
      -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if (v63)
      {
        -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setObject:forKeyedSubscript:", v64, *MEMORY[0x24BDFC318]);

      }
      _CDPSignpostLogSystem();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = _CDPSignpostCreate();

      _CDPSignpostLogSystem();
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20DB2C000, v68, OS_SIGNPOST_INTERVAL_BEGIN, v66, "OTCPerformEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
      }

      _CDPSignpostLogSystem();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v85 = v66;
        _os_log_impl(&dword_20DB2C000, v69, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OTCPerformEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
      }

      v70 = (void *)MEMORY[0x24BDE84B0];
      -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v49;
      v82 = 0;
      objc_msgSend(v70, "performEscrowRecovery:cdpContext:escrowRecord:error:", v71, v11, v49, &v82);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v35 = v82;

      Nanoseconds = _CDPSignpostGetNanoseconds();
      _CDPSignpostLogSystem();
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v66 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        v75 = objc_msgSend(v35, "code");
        *(_DWORD *)buf = 67240192;
        LODWORD(v85) = v75;
        _os_signpost_emit_with_name_impl(&dword_20DB2C000, v74, OS_SIGNPOST_INTERVAL_END, v66, "OTCPerformEscrowRecovery", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
      }

      _CDPSignpostLogSystem();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v77 = objc_msgSend(v35, "code");
        *(_DWORD *)buf = 134218496;
        v85 = v66;
        v86 = 2048;
        v87 = (double)(unint64_t)Nanoseconds / 1000000000.0;
        v88 = 1026;
        v89 = v77;
        _os_log_impl(&dword_20DB2C000, v76, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: OTCPerformEscrowRecovery  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
      }

      v78 = *MEMORY[0x24BE1A640];
      if (v32)
      {
        objc_msgSend(v60, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v78);
      }
      else
      {
        objc_msgSend(v60, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v78);
        objc_msgSend(v60, "populateUnderlyingErrorsStartingWithRootError:", v35);
      }
      objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "sendEvent:", v60);

      if (v35)
      {
        _CDPLogSystem();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.4();

        if (a5)
        {
          v35 = objc_retainAutorelease(v35);
          v36 = 0;
          *a5 = v35;
          goto LABEL_48;
        }
        goto LABEL_43;
      }
      goto LABEL_22;
    }
  }
  else
  {
    if (!-[CDPDSecureBackupController supportsRecoveryKeyWithError:](self, "supportsRecoveryKeyWithError:", 0))
      goto LABEL_25;
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.11();

    +[CDPRecoveryKeyCache sharedInstance](CDPRecoveryKeyCache, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSecureBackupController context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "altDSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchRecoveryKeyFromCacheForAltDSID:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_25;
  }
  _CDPLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.10();

  -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOctagonCapableRecordsExist:", objc_msgSend(v8, "octagonCapableRecordsExist"));
  v21 = objc_alloc(MEMORY[0x24BDFC2A0]);
  v22 = (void *)objc_msgSend(v21, "initWithEventName:eventCategory:initData:", *MEMORY[0x24BE1A718], *MEMORY[0x24BE1A860], 0);
  -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDFC340]);

  }
  -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BDFC318]);

  }
  v83 = 0;
  v27 = objc_msgSend(MEMORY[0x24BDE84B0], "recoverWithRecoveryKey:recoveryKey:error:", v20, v14, &v83);
  v28 = v83;
  if ((v27 & 1) != 0)
  {
    _CDPLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.8();

    v30 = objc_alloc(MEMORY[0x24BDE84B0]);
    -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v30, "initWithContextData:", v31);

    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A640]);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sendEvent:", v22);

LABEL_22:
    _CDPLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.3();

    v32 = v32;
    v35 = 0;
    v36 = v32;
    goto LABEL_48;
  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
  objc_msgSend(v22, "populateUnderlyingErrorsStartingWithRootError:", v28);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sendEvent:", v22);

  _CDPLogSystem();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    -[CDPDSecureBackupController _performEscrowRecoveryWithRecoveryContext:fallbackState:error:].cold.9();

  if (a5)
    *a5 = objc_retainAutorelease(v28);

  v32 = 0;
  v35 = 0;
  v36 = 0;
LABEL_48:

  return v36;
}

- (void)performEscrowRecoveryWithRecoveryContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CDPDSecureBackupController *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke;
    v8[3] = &unk_24C81CDE8;
    v9 = v6;
    v10 = self;
    v11 = v7;
    -[CDPDSecureBackupController checkForAnyOctagonRecord:](self, "checkForAnyOctagonRecord:", v8);

  }
}

void __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint8_t buf[8];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  CDPDRemoteSecretValidationResult *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v5 = a3;
  objc_msgSend(a1[4], "setOctagonCapableRecordsExist:", a2);
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__4;
  v45 = __Block_byref_object_dispose__4;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  v7 = a1[4];
  v6 = a1[5];
  v8 = v42;
  obj = v42[5];
  objc_msgSend(v6, "performEscrowRecoveryWithRecoveryContext:error:", v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8 + 5, obj);
  objc_msgSend((id)v36[5], "setRecoveredClique:", v9);

  objc_msgSend((id)v36[5], "recoveredClique");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (v11 = v42[5], v10, v11))
  {
    if (objc_msgSend(v42[5], "isAuthenticationError"))
    {
      v13 = a1[4];
      v12 = a1[5];
      v14 = (void *)v12[2];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_2;
      v29[3] = &unk_24C81D2D8;
      v32 = &v35;
      v29[4] = v12;
      v30 = v13;
      v33 = &v41;
      v31 = a1[6];
      objc_msgSend(v14, "reauthenticateUserWithCompletion:", v29);

      v15 = 0;
    }
    else
    {
      if (objc_msgSend(a1[4], "silentRecovery")
        && objc_msgSend(v42[5], "isICSCInvalidError"))
      {
        v16 = a1[5];
        v28 = 0;
        v17 = objc_msgSend(v16, "supportsRecoveryKeyWithError:", &v28);
        v15 = v28;
        if (v17)
        {
          _CDPLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Recovering SecureBackup failed - iCSC Invalid (silent burn failed). Trying again with cached recovery key.\", buf, 2u);
          }

          objc_msgSend(a1[4], "setUsePreviouslyCachedRecoveryKey:", 1);
          objc_msgSend(a1[5], "_recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:", a1[4], objc_msgSend(a1[4], "usePreviouslyCachedSecret"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = a1[5];
          v26 = 0;
          objc_msgSend(v20, "performEscrowRecoveryWithData:error:", v19, &v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v26;
          objc_msgSend((id)v36[5], "setRecoveredClique:", v21);

          objc_msgSend((id)v36[5], "recoveredClique");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            if (v22)
            {
              _CDPLogSystem();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_2();

            }
            else if (v15)
            {
              _CDPLogSystem();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_1();

              v22 = v15;
            }
            else
            {
              v22 = 0;
            }
          }
          (*((void (**)(void))a1[6] + 2))();

          goto LABEL_24;
        }
      }
      else
      {
        v15 = 0;
      }
      (*((void (**)(void))a1[6] + 2))();
    }
LABEL_24:

    goto LABEL_25;
  }
  (*((void (**)(void))a1[6] + 2))();
LABEL_25:
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_2(_QWORD *a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  if (!a2)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "performEscrowRecoveryWithRecoveryContext:error:", v4, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setRecoveredClique:", v6);

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)recoverSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  CDPContext *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  CDPContext *v14;
  void (**v15)(void *, uint64_t);
  uint64_t v16;
  void *v17;
  id *v18;
  uint64_t v19;
  void *v20;
  CDPContext *context;
  id v22;
  _BOOL4 v23;
  NSObject *v24;
  id *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void (*v29)(void *, uint64_t);
  id v30;
  uint8_t buf[16];
  id v32;
  _QWORD v33[5];
  id v34;
  void (**v35)(void *, uint64_t);
  uint64_t *v36;
  uint64_t *v37;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD aBlock[4];
  CDPContext *v53;
  id v54;

  v6 = a3;
  v7 = self->_context;
  v8 = a4;
  v9 = -[CDPContext backupActivity](v7, "backupActivity");
  if (v9)
    v10 = v9;
  else
    v10 = 3877103917;
  -[CDPContext setBackupActivity:](v7, "setBackupActivity:", v10);
  v11 = _Block_copy(v8);

  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81C898;
  v13 = v11;
  v54 = v13;
  v14 = v7;
  v53 = v14;
  v15 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v15)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__4;
    v50 = __Block_byref_object_dispose__4;
    v51 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__4;
    v44 = __Block_byref_object_dispose__4;
    v45 = 0;
    obj = 0;
    -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:](self, "_recoverBackupDictionaryWithContext:fallbackState:error:", v6, 0, &obj);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v51, obj);
    v17 = (void *)v41[5];
    v41[5] = v16;

    if (objc_msgSend((id)v47[5], "indicatesRecoveryCanBeRetried"))
    {
      v18 = (id *)(v47 + 5);
      v38 = (id)v47[5];
      -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:](self, "_recoverBackupDictionaryWithContext:fallbackState:error:", v6, 1, &v38);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v18, v38);
      v20 = (void *)v41[5];
      v41[5] = v19;

    }
    if (objc_msgSend((id)v47[5], "isAuthenticationError"))
    {
      context = self->_context;
      v33[0] = v12;
      v33[1] = 3221225472;
      v33[2] = __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke_2;
      v33[3] = &unk_24C81D2D8;
      v36 = &v40;
      v33[4] = self;
      v34 = v6;
      v37 = &v46;
      v35 = v15;
      -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v33);

      v22 = 0;
    }
    else
    {
      if (objc_msgSend(v6, "silentRecovery")
        && objc_msgSend((id)v47[5], "isICSCInvalidError"))
      {
        v32 = 0;
        v23 = -[CDPDSecureBackupController supportsRecoveryKeyWithError:](self, "supportsRecoveryKeyWithError:", &v32);
        v22 = v32;
        if (v23)
        {
          _CDPLogSystem();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "\"Recovering SecureBackup failed - iCSC Invalid (silent burn failed). Trying again with cached recovery key.\", buf, 2u);
          }

          objc_msgSend(v6, "setUsePreviouslyCachedRecoveryKey:", 1);
          v25 = (id *)(v47 + 5);
          v30 = (id)v47[5];
          -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:](self, "_recoverBackupDictionaryWithContext:fallbackState:error:", v6, 2, &v30);
          v26 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v25, v30);
          v27 = (void *)v41[5];
          v41[5] = v26;

          ((void (*)(void (**)(void *, uint64_t), uint64_t, uint64_t))v15[2])(v15, v41[5], v47[5]);
          goto LABEL_19;
        }
      }
      else
      {
        v22 = 0;
      }
      v28 = v41[5];
      v29 = v15[2];
      if (v47[5])
        v29(v15, v28);
      else
        ((void (*)(void (**)(void *, uint64_t), uint64_t, id))v29)(v15, v28, v22);
    }
LABEL_19:

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);

  }
}

uint64_t __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

uint64_t __72__CDPDSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke_2(_QWORD *a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v16;
  id obj;

  if (!a2)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "_recoverBackupDictionaryWithContext:fallbackState:error:", v4, 0, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "indicatesRecoveryCanBeRetried"))
  {
    v9 = (void *)a1[4];
    v10 = a1[5];
    v11 = *(_QWORD *)(a1[8] + 8);
    v16 = *(id *)(v11 + 40);
    objc_msgSend(v9, "_recoverBackupDictionaryWithContext:fallbackState:error:", v10, 1, &v16);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), v16);
    v13 = *(_QWORD *)(a1[7] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_makeRecoveryKeyVerifyEventWithError:(id)a3 result:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  CDPContext *context;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BDFC2A0];
  context = self->_context;
  v7 = *MEMORY[0x24BE1A750];
  v8 = *MEMORY[0x24BE1A860];
  v9 = a3;
  objc_msgSend(v5, "analyticsEventWithContext:eventName:category:", context, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDFC328]);

  objc_msgSend(v10, "populateUnderlyingErrorsStartingWithRootError:", v9);
  return v10;
}

- (void)validateRecoveryKeyWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  CDPDRemoteSecretValidationResult *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Validating Recovery Key\", buf, 2u);
  }

  objc_msgSend(v6, "recoveryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDE84B0];
    objc_msgSend(v6, "recoveryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v11, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:error:", v10, v12, &v23);
    v13 = v23;

    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v13;
        _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"validateRecoveryKey Failed: %@\", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDSecureBackupController _makeRecoveryKeyVerifyEventWithError:result:](self, "_makeRecoveryKeyVerifyEventWithError:result:", v13, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendEvent:", v17);

      if (v7)
        v7[2](v7, 0, v13);
    }
    else
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"RecoveryKey Validated\", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDSecureBackupController _makeRecoveryKeyVerifyEventWithError:result:](self, "_makeRecoveryKeyVerifyEventWithError:result:", 0, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendEvent:", v20);

      v21 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      -[CDPDRemoteSecretValidationResult setSecretType:](v21, "setSecretType:", 5);
      objc_msgSend(v6, "recoveryKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDRemoteSecretValidationResult setValidSecret:](v21, "setValidSecret:", v22);

      if (v7)
        ((void (**)(id, CDPDRemoteSecretValidationResult *, id))v7)[2](v7, v21, 0);

    }
    goto LABEL_19;
  }
  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Recovery key is nil, calling completion with error\", buf, 2u);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
LABEL_19:

  }
}

- (void)validateAndRepairRecoveryKeyMismatchWithContext:(id)a3 authProvider:(id)a4 circleProxy:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"Validating and Repairing Recovery Key Mismatch\", buf, 2u);
  }

  objc_msgSend(v10, "recoveryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A490]), "initWithContext:", self->_context);
    v29 = 0;
    v18 = objc_msgSend(v17, "verifyRecoveryKeyObservingSystemsHaveMatchingStateWithError:", &v29);
    v19 = v29;
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController validateAndRepairRecoveryKeyMismatchWithContext:authProvider:circleProxy:completion:].cold.1();

      -[CDPDSecureBackupController validateRecoveryKeyWithContext:completion:](self, "validateRecoveryKeyWithContext:completion:", v10, v13);
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_DEFAULT, "\"Detected a RK oserving system mismatch\", buf, 2u);
      }

      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke;
      v23[3] = &unk_24C81D328;
      v23[4] = self;
      v24 = v16;
      v25 = v10;
      v28 = v13;
      v26 = v12;
      v27 = v11;
      -[CDPDSecureBackupController _validateRecoveryKeyInIDMSWithContext:authProvider:completion:](self, "_validateRecoveryKeyInIDMSWithContext:authProvider:completion:", v25, v27, v23);

    }
    goto LABEL_16;
  }
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"Recovery key is nil, calling completion with error\", buf, 2u);
  }

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v16);
LABEL_16:

  }
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void (*v17)(void);
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  CDPDRemoteSecretValidationResult *v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id location;
  id v54;
  id v55;

  v5 = a3;
  if (!v5 && a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_4();

    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "recoveryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend(v7, "_setRecoveryKeyInOctagonIfRequiredWithConfig:recoveryKey:error:", v8, v9, &v55);
    v10 = v55;

    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "recoveryKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v11, "_setRecoveryKeyInSOSIfRequiredWithConfig:recoveryKey:error:", v12, v13, &v54);
    v14 = v54;

    if (v10)
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_3();

      v16 = *(_QWORD *)(a1 + 72);
      if (!v16)
        goto LABEL_34;
      v17 = *(void (**)(void))(v16 + 16);
    }
    else
    {
      _CDPLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (!v14)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_1();

        v40 = objc_alloc_init(CDPDRemoteSecretValidationResult);
        -[CDPDRemoteSecretValidationResult setSecretType:](v40, "setSecretType:", 5);
        objc_msgSend(*(id *)(a1 + 48), "recoveryKey");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDRemoteSecretValidationResult setValidSecret:](v40, "setValidSecret:", v41);

        v42 = *(_QWORD *)(a1 + 72);
        if (v42)
          (*(void (**)(uint64_t, CDPDRemoteSecretValidationResult *, _QWORD))(v42 + 16))(v42, v40, 0);

        goto LABEL_34;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_2();

      v38 = *(_QWORD *)(a1 + 72);
      if (!v38)
      {
LABEL_34:

        goto LABEL_35;
      }
      v17 = *(void (**)(void))(v38 + 16);
    }
    v17();
    goto LABEL_34;
  }
  v18 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "recoveryKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v18, "_validateOctagonRecoveryKeyWithConfig:recoveryKey:", v19, v20);

  if ((_DWORD)v18)
  {
    _CDPLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_5();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v22 = *(void **)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 56);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120;
    v48[3] = &unk_24C81D300;
    v25 = *(_QWORD *)(a1 + 64);
    v51 = *(id *)(a1 + 72);
    objc_copyWeak(&v52, &location);
    v49 = *(id *)(a1 + 40);
    v50 = *(id *)(a1 + 48);
    objc_msgSend(v22, "_setRecoveryKeyInIDMSWithContext:circleProxy:authProvider:completion:", v23, v24, v25, v48);

    objc_destroyWeak(&v52);
    v26 = v51;
LABEL_18:

    objc_destroyWeak(&location);
    goto LABEL_36;
  }
  v27 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "recoveryKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "_validateSOSRecoveryKey:config:", v28, *(_QWORD *)(a1 + 40));

  _CDPLogSystem();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_6();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v32 = *(void **)(a1 + 32);
    v33 = *(_QWORD *)(a1 + 48);
    v34 = *(_QWORD *)(a1 + 56);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121;
    v43[3] = &unk_24C81D300;
    v35 = *(_QWORD *)(a1 + 64);
    v46 = *(id *)(a1 + 72);
    objc_copyWeak(&v47, &location);
    v44 = *(id *)(a1 + 40);
    v45 = *(id *)(a1 + 48);
    objc_msgSend(v32, "_setRecoveryKeyInIDMSWithContext:circleProxy:authProvider:completion:", v33, v34, v35, v43);

    objc_destroyWeak(&v47);
    v26 = v46;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_7();

  v39 = *(_QWORD *)(a1 + 72);
  if (v39)
  {
    _CDPStateError();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v39 + 16))(v39, 0, v10);
LABEL_35:

  }
LABEL_36:

}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  CDPDRemoteSecretValidationResult *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "recoveryKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(WeakRetained, "_setRecoveryKeyInSOSIfRequiredWithConfig:recoveryKey:error:", v8, v9, &v18);
      v10 = v18;

      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120_cold_2();

        v13 = *(_QWORD *)(a1 + 48);
        if (v13)
          (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v10);
      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120_cold_1();

        v15 = objc_alloc_init(CDPDRemoteSecretValidationResult);
        -[CDPDRemoteSecretValidationResult setSecretType:](v15, "setSecretType:", 5);
        objc_msgSend(*(id *)(a1 + 40), "recoveryKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPDRemoteSecretValidationResult setValidSecret:](v15, "setValidSecret:", v16);

        v17 = *(_QWORD *)(a1 + 48);
        if (v17)
          (*(void (**)(uint64_t, CDPDRemoteSecretValidationResult *, _QWORD))(v17 + 16))(v17, v15, 0);

      }
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 48);
      if (!v14)
      {
LABEL_20:

        goto LABEL_21;
      }
      _CDPStateError();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v10);
    }

    goto LABEL_20;
  }
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120_cold_3();

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v4);
LABEL_21:

}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  CDPDRemoteSecretValidationResult *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "recoveryKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(WeakRetained, "_setRecoveryKeyInOctagonIfRequiredWithConfig:recoveryKey:error:", v8, v9, &v18);
      v10 = v18;

      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121_cold_2();

        v13 = *(_QWORD *)(a1 + 48);
        if (v13)
          (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v10);
        goto LABEL_20;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121_cold_1();

      v15 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      -[CDPDRemoteSecretValidationResult setSecretType:](v15, "setSecretType:", 5);
      objc_msgSend(*(id *)(a1 + 40), "recoveryKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDRemoteSecretValidationResult setValidSecret:](v15, "setValidSecret:", v16);

      v17 = *(_QWORD *)(a1 + 48);
      if (v17)
        (*(void (**)(uint64_t, CDPDRemoteSecretValidationResult *, _QWORD))(v17 + 16))(v17, v15, 0);
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 48);
      if (!v14)
      {
LABEL_19:
        v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
      _CDPStateError();
      v15 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, CDPDRemoteSecretValidationResult *))(v14 + 16))(v14, 0, v15);
    }

    goto LABEL_19;
  }
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121_cold_3();

  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v4);
LABEL_21:

}

- (BOOL)_isRecoveryKeySetInOctagonWithConfig:(id)a3
{
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  v3 = objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySetInOctagon:error:", a3, &v7);
  v4 = v7;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController _isRecoveryKeySetInOctagonWithConfig:].cold.1();

    v3 = 0;
  }

  return v3;
}

- (BOOL)_validateOctagonRecoveryKeyWithConfig:(id)a3 recoveryKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[CDPDSecureBackupController _isRecoveryKeySetInOctagonWithConfig:](self, "_isRecoveryKeySetInOctagonWithConfig:", v6))
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDE84B0], "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:error:", v6, v7, &v16);
    v8 = v16;
    v9 = v8 == 0;
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        v12 = "\"Octagon validateRecoveryKey Failed: %@\";
        v13 = v10;
        v14 = 12;
LABEL_10:
        _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      v12 = "\"Octagon RecoveryKey Validated\";
      v13 = v10;
      v14 = 2;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Recovery Key not set in Octagon\", buf, 2u);
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)_setRecoveryKeyInOctagonIfRequiredWithConfig:(id)a3 recoveryKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (-[CDPDSecureBackupController _isRecoveryKeySetInOctagonWithConfig:](self, "_isRecoveryKeySetInOctagonWithConfig:", v8))
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Recovery Key already set in Octagon\", buf, 2u);
    }
  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDE84B0], "setRecoveryKeyWithContext:recoveryKey:error:", v8, v9, &v13);
    v10 = v13;
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Set RK in Octagon Failed with error: %@\", buf, 0xCu);
      }

      if (a5)
      {
        v10 = objc_retainAutorelease(v10);
        *a5 = v10;
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Set RK in Octagon succeeded\", buf, 2u);
      }

    }
  }

}

- (BOOL)_isRecoveryKeySetInSOSWithConfig:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  if (!-[CDPDSecureBackupController _isSOSEnabled](self, "_isSOSEnabled"))
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _isRecoveryKeySetInSOSWithConfig:].cold.2();
    goto LABEL_8;
  }
  v9 = 0;
  v5 = objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySetInSOS:error:", v4, &v9);
  v6 = v9;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController _isRecoveryKeySetInSOSWithConfig:].cold.1();

LABEL_8:
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isInSOSCircle
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x24BE1A488];
  -[CDPContext altDSID](self->_context, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "syncingStatusForAltDSID:", v3);

  return v4 == 1;
}

- (BOOL)_validateSOSRecoveryKey:(id)a3 config:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v17;
  uint8_t buf[4];
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[CDPDSecureBackupController _isRecoveryKeySetInSOSWithConfig:](self, "_isRecoveryKeySetInSOSWithConfig:", a4))
  {
    -[CDPDSecureBackupController secureBackupProxy](self, "secureBackupProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v8 = objc_msgSend(v7, "verifyRecoveryKey:error:", v6, &v17);
    v9 = v17;

    if (v9)
      v10 = 0;
    else
      v10 = v8;
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        v13 = "\"SOS RecoveryKey Validated\";
        v14 = v11;
        v15 = 2;
LABEL_13:
        _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      v13 = "\"SOS validateRecoveryKey Failed: %@\";
      v14 = v11;
      v15 = 12;
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Recovery Key not set in SOS\", buf, 2u);
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (void)_setRecoveryKeyInSOSIfRequiredWithConfig:(id)a3 recoveryKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (-[CDPDSecureBackupController _isRecoveryKeySetInSOSWithConfig:](self, "_isRecoveryKeySetInSOSWithConfig:", a3)
    || !-[CDPDSecureBackupController _isInSOSCircle](self, "_isInSOSCircle"))
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Recovery Key Already Set in SOS\", buf, 2u);
    }
  }
  else
  {
    -[CDPDSecureBackupController secureBackupProxy](self, "secureBackupProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v10 = objc_msgSend(v9, "setRecoveryKeyInSOS:error:", v8, &v14);
    v11 = v14;

    if (v11 || (v10 & 1) == 0)
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"setRecoveryKeyInSOSWithCompletion Failed: %@\", buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v11);
    }
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"setRecoveryKeyInSOSWithCompletion suceeded\", buf, 2u);
    }

  }
}

- (void)_validateRecoveryKeyInIDMSWithContext:(id)a3 authProvider:(id)a4 completion:(id)a5
{
  CDPContext *context;
  id v8;
  id v9;
  id v10;

  context = self->_context;
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "recoveryKey");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cdpContext:verifyMasterKey:completion:", context, v10, v8);

}

- (void)_setRecoveryKeyInIDMSWithContext:(id)a3 circleProxy:(id)a4 authProvider:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, id);
  id v12;
  void *v13;
  void *v14;
  id v15;
  CDPContext *context;
  NSObject *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, id);
  id v20;

  v10 = a5;
  v11 = (void (**)(id, _QWORD, id))a6;
  v12 = a4;
  objc_msgSend(a3, "recoveryKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v12, "generateVerifierWithRecoveryKey:error:", v13, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v20;
  if (!v14 || v15)
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController _setRecoveryKeyInIDMSWithContext:circleProxy:authProvider:completion:].cold.1();

    if (v11)
      v11[2](v11, 0, v15);
  }
  else
  {
    context = self->_context;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __99__CDPDSecureBackupController__setRecoveryKeyInIDMSWithContext_circleProxy_authProvider_completion___block_invoke;
    v18[3] = &unk_24C81C580;
    v19 = v11;
    objc_msgSend(v10, "cdpContext:persistMasterKeyVerifier:completion:", context, v14, v18);

  }
}

void __99__CDPDSecureBackupController__setRecoveryKeyInIDMSWithContext_circleProxy_authProvider_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 || (a2 & 1) == 0)
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Locally Harmonized RK failed to register in IDMS: %@\", (uint8_t *)&v11, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_11;
    }
  }
  else
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = 0;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Locally Harmonized RK registered in IDMS successfully: %@\", (uint8_t *)&v11, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_11:
      v9();
    }
  }

}

- (id)_recoverBackupDictionaryWithContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  CDPDRemoteSecretValidationResult *v11;
  CDPDSecureBackupProxy *secureBackupProxy;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  id v20;

  v8 = a3;
  -[CDPDSecureBackupController _recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:](self, "_recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:", v8, -[CDPDSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:](self, "_shouldUseSBDCacheWithSecureBackupContext:fallbackState:", v8, a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.4(v8, (uint64_t)v9);

  v11 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  secureBackupProxy = self->_secureBackupProxy;
  v20 = 0;
  -[CDPDSecureBackupProxy recoverWithInfo:error:](secureBackupProxy, "recoverWithInfo:error:", v9, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (v14)
  {
    v15 = v14;
    if (v13)
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.3();

      objc_msgSend(v15, "errorByExtendingUserInfoWithDictionary:", v13);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v15 = (void *)v17;
    }
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.2();
  }
  else
  {
    -[CDPDRemoteSecretValidationResult setRecoveredInfo:](v11, "setRecoveredInfo:", v13);
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.1();
    v15 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v11;
}

- (id)_recoveryInfoDictionaryFromContext:(id)a3 usePreviouslyCachedSecret:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSecureBackupConfiguration escrowAuthInfo](self->_configuration, "escrowAuthInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  objc_msgSend(v8, "recordInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "recordInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("metadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, *MEMORY[0x24BE17C50]);

  }
  objc_msgSend(v6, "recoverySecret");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "recoverySecret");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (!v15)
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[CDPDSecureBackupController _recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    }
    objc_msgSend(v6, "recoverySecret");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v24, *MEMORY[0x24BE17C68]);

  }
  else
  {
    objc_msgSend(v6, "recoveryKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "recoveryKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v26, *MEMORY[0x24BE17C80]);

      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17BE0]);
    }
  }
  if (v4)
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CC0]);
  if ((objc_msgSend(v8, "isUsingMultipleiCSC") & 1) != 0 || objc_msgSend(v6, "silentRecovery"))
  {
    v27 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CD0]);
    objc_msgSend(v7, "setObject:forKey:", v27, *MEMORY[0x24BE17BE0]);
  }
  objc_msgSend(v8, "recordID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v8, "recordID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v29, *MEMORY[0x24BE17C78]);

  }
  if (objc_msgSend(v6, "silentRecovery"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CA0]);
  if (objc_msgSend(v6, "usePreviouslyCachedRecoveryKey"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CE8]);
  objc_msgSend(v6, "telemetryFlowID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v6, "telemetryFlowID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v31, *MEMORY[0x24BE17C30]);

  }
  objc_msgSend(v6, "telemetryDeviceSessionID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v6, "telemetryDeviceSessionID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v33, *MEMORY[0x24BE17BF0]);

  }
  _CDPLogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "telemetryFlowID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "telemetryDeviceSessionID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v35;
    v40 = 2114;
    v41 = v36;
    _os_log_impl(&dword_20DB2C000, v34, OS_LOG_TYPE_DEFAULT, "\"Adding telemetry flow ID %{public}@ and session ID %{public}@ to recoveryInfo\", (uint8_t *)&v38, 0x16u);

  }
  if (objc_msgSend(v6, "nonViableRequiresRepair"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17C58]);

  return v7;
}

- (void)deleteAllBackupRecordsWithCompletion:(id)a3
{
  CDPContext *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CDPContext *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  CDPContext *v17;
  id v18;

  v5 = self->_context;
  v6 = a3;
  v7 = -[CDPContext backupActivity](v5, "backupActivity");
  if (v7)
    v8 = v7;
  else
    v8 = 4108292144;
  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", v8);
  v9 = _Block_copy(v6);

  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81CF50;
  v17 = v5;
  v18 = v9;
  v11 = v5;
  v12 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2;
  v14[3] = &unk_24C81C558;
  v14[4] = self;
  v15 = _Block_copy(aBlock);
  v13 = v15;
  -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:](self, "_deleteAllBackupRecordsWithCompletion:", v14);

}

uint64_t __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
      __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2_cold_1();

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(v7 + 16);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_123;
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

void __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_123(uint64_t a1, int a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_deleteAllBackupRecordsWithCompletion:", *(_QWORD *)(a1 + 40));
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

- (void)_deleteAllBackupRecordsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  CDPDSecureBackupProxy *secureBackupProxy;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;

  v4 = (void (**)(id, uint64_t, id))a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext appleID](self->_context, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BE17BA8]);

  -[CDPContext passwordEquivToken](self->_context, "passwordEquivToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BE17BC8]);

  v8 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CF8]);
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BE17BE0]);
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:].cold.2();

  secureBackupProxy = self->_secureBackupProxy;
  v14 = 0;
  v11 = -[CDPDSecureBackupProxy disableWithInfo:error:](secureBackupProxy, "disableWithInfo:error:", v5, &v14);
  v12 = v14;
  if (v12)
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:].cold.1();

  }
  if (v4)
    v4[2](v4, v11, v12);

}

- (void)deleteSingleICSCBackupWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke;
  v6[3] = &unk_24C81C558;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CDPDSecureBackupController _deleteSingleICSCBackupWithCompletion:](self, "_deleteSingleICSCBackupWithCompletion:", v6);

}

void __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
      __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(v7 + 16);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_124;
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

void __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_124(uint64_t a1, int a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_deleteSingleICSCBackupWithCompletion:", *(_QWORD *)(a1 + 40));
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

- (void)_deleteSingleICSCBackupWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke;
  v6[3] = &unk_24C81BFC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CDPDSecureBackupController accountInfoWithCompletion:](self, "accountInfoWithCompletion:", v6);

}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BE17C50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8)
        __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_4();

      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v17 = 0;
      v10 = objc_msgSend(v9, "disableWithInfo:error:", 0, &v17);
      v11 = v17;
      if (v11)
      {
        _CDPLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CDPDSecureBackupController _deleteAllBackupRecordsWithCompletion:].cold.1();

      }
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v10, v11);

    }
    else
    {
      if (v8)
        __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_2();

      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v16 + 16))(v16, 1, 0);
    }

  }
  else
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_1();

    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v5);
  }

}

- (void)disableSecureBackupWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CDPContext *context;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v10 = 0;
  -[CDPDSecureBackupController _disableSecureBackup:](self, "_disableSecureBackup:", &v10);
  v5 = v10;
  if (objc_msgSend(v5, "isAuthenticationError"))
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController disableSecureBackupWithCompletion:].cold.1();

    context = self->_context;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__CDPDSecureBackupController_disableSecureBackupWithCompletion___block_invoke;
    v8[3] = &unk_24C81C558;
    v8[4] = self;
    v9 = v4;
    -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v8);

  }
  else if (v4)
  {
    (*((void (**)(id, id))v4 + 2))(v4, v5);
  }

}

void __64__CDPDSecureBackupController_disableSecureBackupWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v10 = 0;
    objc_msgSend(v6, "_disableSecureBackup:", &v10);
    v7 = v10;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    if (v7)
      v9 = v7;
    else
      v9 = v5;
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }

}

- (BOOL)_disableSecureBackup:(id *)a3
{
  return -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:](self, "_disableSecureBackupWithEnableInfo:error:", 0, a3);
}

- (BOOL)_disableSecureBackupWithEnableInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  char v16;
  int v17;
  NSObject *v18;
  NSObject *v19;

  v6 = a3;
  -[CDPDSecureBackupController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "circlePeerIDForSecureBackupController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CDPDSecureBackupConfiguration escrowAuthInfo](self->_configuration, "escrowAuthInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17BE0]);
    objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BE17CD0]);
    objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x24BE17C78]);
    objc_opt_class();
    v12 = *MEMORY[0x24BE17C58];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE17C58]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    v17 = objc_msgSend(v14, "BOOLValue");
    if (v17)
    {
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:].cold.3();

      objc_msgSend(v10, "setObject:forKey:", MEMORY[0x24BDBD1C8], v12);
    }
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:].cold.2();

    v16 = -[CDPDSecureBackupProxy disableWithInfo:error:](self->_secureBackupProxy, "disableWithInfo:error:", v10, a4);
  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupController _disableSecureBackupWithEnableInfo:error:].cold.1();

    if (a4)
    {
      _CDPStateError();
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (void)disableRecoveryKeyWithCompletion:(id)a3
{
  CDPContext *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  CDPContext *v12;
  void *v13;
  id v14;
  NSObject *v15;
  CDPContext *context;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD aBlock[4];
  CDPContext *v21;
  id v22;

  v5 = self->_context;
  v6 = a3;
  v7 = -[CDPContext backupActivity](v5, "backupActivity");
  if (v7)
    v8 = v7;
  else
    v8 = 3058721123;
  -[CDPContext setBackupActivity:](v5, "setBackupActivity:", v8);
  v9 = _Block_copy(v6);

  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81CF28;
  v11 = v9;
  v22 = v11;
  v12 = v5;
  v21 = v12;
  v13 = _Block_copy(aBlock);
  v19 = 0;
  -[CDPDSecureBackupController disableRecoveryKey:](self, "disableRecoveryKey:", &v19);
  v14 = v19;
  if (objc_msgSend(v14, "isAuthenticationError"))
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController disableRecoveryKeyWithCompletion:].cold.1();

    context = self->_context;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke_126;
    v17[3] = &unk_24C81C558;
    v17[4] = self;
    v18 = v13;
    -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v17);

  }
  else if (v13)
  {
    (*((void (**)(void *, id))v13 + 2))(v13, v14);
  }

}

uint64_t __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setBackupActivity:", 0);
}

void __63__CDPDSecureBackupController_disableRecoveryKeyWithCompletion___block_invoke_126(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v10 = 0;
    objc_msgSend(v6, "disableRecoveryKey:", &v10);
    v7 = v10;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    if (v7)
      v9 = v7;
    else
      v9 = v5;
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }

}

- (BOOL)disableRecoveryKey:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Removing recovery key\", buf, 2u);
  }

  -[CDPDSecureBackupController octagonTrustProxy](self, "octagonTrustProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "disableRecoveryKey:", &v11);
  v8 = v11;

  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Removed recovery key result: %{BOOL}d, error: %@\", buf, 0x12u);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v7;
}

- (void)disableRecoveryKeyFromAllSystemsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  CDPContext *context;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Removing recovery key from All systems\", buf, 2u);
  }

  v14 = 0;
  -[CDPDSecureBackupController disableRecoveryKey:](self, "disableRecoveryKey:", &v14);
  v6 = v14;
  v13 = 0;
  -[CDPDSecureBackupController _disableRecoveryKeyFromSOS:](self, "_disableRecoveryKeyFromSOS:", &v13);
  v7 = v13;
  if ((objc_msgSend(v6, "isAuthenticationError") & 1) != 0 || objc_msgSend(v7, "isAuthenticationError"))
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDSecureBackupController disableRecoveryKeyWithCompletion:].cold.1();

    context = self->_context;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__CDPDSecureBackupController_disableRecoveryKeyFromAllSystemsWithCompletion___block_invoke;
    v11[3] = &unk_24C81C558;
    v11[4] = self;
    v12 = v4;
    -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v11);

  }
  else if (v4)
  {
    if (v6)
      v10 = v6;
    else
      v10 = v7;
    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }

}

void __77__CDPDSecureBackupController_disableRecoveryKeyFromAllSystemsWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v13 = 0;
    objc_msgSend(v6, "disableRecoveryKey:", &v13);
    v7 = v13;
    v8 = *(void **)(a1 + 32);
    v12 = 0;
    objc_msgSend(v8, "_disableRecoveryKeyFromSOS:", &v12);
    v9 = v12;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    if (v7)
      v11 = v7;
    else
      v11 = v9;
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }

}

- (void)_disableRecoveryKeyFromSOS:(id *)a3
{
  void *v5;
  int v6;
  id v7;
  id v8;
  id v9;

  if (-[CDPDSecureBackupController _isSOSEnabled](self, "_isSOSEnabled")
    && -[CDPDSecureBackupController _isInSOSCircle](self, "_isInSOSCircle"))
  {
    -[CDPDSecureBackupController secureBackupProxy](self, "secureBackupProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = objc_msgSend(v5, "removeRecoveryKeyFromSOS:", &v9);
    v7 = v9;

    if (v7 || !v6)
    {
      if (a3)
      {
        v8 = objc_retainAutorelease(v7);
        goto LABEL_11;
      }
    }
    else if (a3)
    {
      v8 = 0;
LABEL_11:
      *a3 = v8;
    }

    return;
  }
  if (a3)
    *a3 = 0;
}

+ (id)_sanitizedInfoDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x24BE17C68];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17C68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v4);
  v6 = *MEMORY[0x24BE17BC8];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17BC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v6);
  v8 = *MEMORY[0x24BE17BB0];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17BB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v8);
  v10 = *MEMORY[0x24BE17C80];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17C80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v10);
  objc_msgSend(v3, "objectForKey:", CFSTR("kPCSMetadataEscrowedKeys"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), CFSTR("kPCSMetadataEscrowedKeys"));
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

+ (id)_printableAccountInfo:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  const __CFString *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          v13 = CFSTR("< array with %lu items >");
        }
        else
        {
          objc_opt_class();
          v14 = objc_opt_isKindOfClass();

          if ((v14 & 1) == 0)
            continue;
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = CFSTR("< dictionary with %lu keys >");
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v13, objc_msgSend(v12, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPDSecureBackupProxy)secureBackupProxy
{
  return self->_secureBackupProxy;
}

- (void)setSecureBackupProxy:(id)a3
{
  objc_storeStrong((id *)&self->_secureBackupProxy, a3);
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (CDPDOctagonTrustProxy)octagonTrustProxy
{
  return self->_octagonTrustProxy;
}

- (void)setOctagonTrustProxy:(id)a3
{
  objc_storeStrong((id *)&self->_octagonTrustProxy, a3);
}

- (BOOL)fakeNearlyDepletedRecords
{
  return self->fakeNearlyDepletedRecords;
}

- (void)setFakeNearlyDepletedRecords:(BOOL)a3
{
  self->fakeNearlyDepletedRecords = a3;
}

- (NSDictionary)cachedAccountInfo
{
  return self->_cachedAccountInfo;
}

- (void)setCachedAccountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccountInfo, a3);
}

- (CDPDSecureBackupDelegate)delegate
{
  return (CDPDSecureBackupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CDPDSecureBackupConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (int64_t)icscRepairTotalRetries
{
  return self->_icscRepairTotalRetries;
}

- (void)setIcscRepairTotalRetries:(int64_t)a3
{
  self->_icscRepairTotalRetries = a3;
}

- (int64_t)icscRepairRetryDelay
{
  return self->_icscRepairRetryDelay;
}

- (void)setIcscRepairRetryDelay:(int64_t)a3
{
  self->_icscRepairRetryDelay = a3;
}

- (BOOL)isSimulateNonViableEscrowRecordEnabled
{
  return self->_isSimulateNonViableEscrowRecordEnabled;
}

- (void)setIsSimulateNonViableEscrowRecordEnabled:(BOOL)a3
{
  self->_isSimulateNonViableEscrowRecordEnabled = a3;
}

- (BOOL)simulateEPThrottle
{
  return self->_simulateEPThrottle;
}

- (void)setSimulateEPThrottle:(BOOL)a3
{
  self->_simulateEPThrottle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedAccountInfo, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:secureBackupProxy:octagonTrustProxy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"**** DEBUG **** Simulate escrow proxy throttling mode is ENABLED\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithContext:secureBackupProxy:octagonTrustProxy:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"**** DEBUG **** Simulate non-viable records mode is ENABLED\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)fetchEscrowRecordsWithOptionForceFetch:completion:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Fetching escrow records with %@\", v3);

  OUTLINED_FUNCTION_6();
}

void __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"fetchEscrowRecordsWithCompletion: failed to fetch escrow records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __80__CDPDSecureBackupController_fetchEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Fetched Escrow Records %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)fetchAllEscrowRecordsWithOptionForceFetch:completion:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Fetching all escrow records with %@\", v3);

  OUTLINED_FUNCTION_6();
}

void __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"fetchAllEscrowRecordsWithOptionForceFetch: failed to fetch escrow records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __83__CDPDSecureBackupController_fetchAllEscrowRecordsWithOptionForceFetch_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Fetched All Escrow Records %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)accountInfoWithCompletion:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_printableAccountInfo:", *a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a3, v5, "\"Using cached SecureBackup account info %@\", v6);

  OUTLINED_FUNCTION_6();
}

void __56__CDPDSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_printableAccountInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v4, "\"Non-cached SecureBackup account info fetched %@\", v5);

  OUTLINED_FUNCTION_6();
}

- (void)_accountInfoWithCompletion:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Fetching account info with %@\", v3);

  OUTLINED_FUNCTION_6();
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"getBackupRecordDevicesWithOptionForceFetch fetched 0 records\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xEu);
  OUTLINED_FUNCTION_4();
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v3, "\"getBackupRecordDevicesWithOptionForceFetch fetched %lu records\", v4);
  OUTLINED_FUNCTION_6();
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"getBackupRecordDevicesWithOptionForceFetch returned!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __68__CDPDSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_2_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"getBackupRecordDevicesWithOptionForceFetch: Failed to check for secure backup records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"fetch escrow records returned error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __98__CDPDSecureBackupController__getOctagonEscrowBackupRecordDevicesWithOptionForceFetch_completion___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"fetch all escrow records returned error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __83__CDPDSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"SecureBackup returned error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Already using multiple ICSC, no need to prompt for adoption\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Single ICSC that is complex or random and not using multiple ICSC, prompting for adoption...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Single ICSC that is NOT random or complex, deleting old record and enabling multiple-ICSC\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to get backup record devices with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Single ICSC record deleted, proceeding with enable of secure backup\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_2_60_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to delete single-ICSC backup while attempting to enable secure backup: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __93__CDPDSecureBackupController_upgradeICSCRecordsThenEnableSecureBackupWithContext_completion___block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Accepted multiple ICSC, deleting old record...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __55__CDPDSecureBackupController_checkForAnyOctagonRecord___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to fetch escrow records for OT only viability check: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __92__CDPDSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_69_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Check for existing backup failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)supportsRecoveryKeyWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"SOS isRecoveryKeySet threw error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)supportsRecoveryKeyWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"OT isRecoveryKeySet threw error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)supportsRecoveryKeyWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Forcing recovery key support by preference (com.apple.corecdp: ForceRecoveryKeySupport)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)supportsWalrusRecoveryKeyWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a1, a3, "@\"%s: Can't find account. Returning...\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_enableSecureBackupWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"_enableSecureBackupWithContext called.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"_authenticatedEnableSecureBackupIncludingFallbackWithContext succeeded\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __72__CDPDSecureBackupController__enableSecureBackupWithContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"_authenticatedEnableSecureBackupIncludingFallbackWithContext failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_retryRepairWithContext:(uint64_t)a1 retryCount:completion:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v2, v3, "\"Will retry in %@ second(s)... Retry number: %ld\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_retryRepairWithContext:retryCount:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating after error... Retry number: %ld...\", v2);
  OUTLINED_FUNCTION_4();
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Posting followup for failed async SecureBackup path with error %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_2_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_4();
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Within retry, _authenticatedEnableSecureBackupWithContext succeeded.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Within retry, _authenticatedEnableSecureBackupWithContext failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __76__CDPDSecureBackupController__retryRepairWithContext_retryCount_completion___block_invoke_82_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Retry count has reached the maximum limit. Bubbling up previous retry error: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)enableSecureBackupWithRecoveryKey:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating after error from authenticatedEnableSecureBackupWithRecoveryKey: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)authenticatedEnableSecureBackupWithRecoveryKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"authenticatedEnableSecureBackupWithRecoveryKey received a nil recoveryKey\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)authenticatedEnableSecureBackupWithRecoveryKey:error:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Attempting to enable SecureBackup with recovery key using info %@\", v3);

  OUTLINED_FUNCTION_6();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"_authenticatedEnableSecureBackupWithContext succeeded\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Retrying _authenticatedEnableSecureBackupWithContext by falling back to SBD cache.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Even if the error is the missing cached passphrase error, we only add fallback logic with the feature flag turned on.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Errors that aren't the missing cached passphrase error don't get fallback logic.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"_authenticatedEnableSecureBackupWithContext failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_90_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"_authenticatedEnableSecureBackupWithContext succeeded after falling back to SBD cached secret\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __102__CDPDSecureBackupController__authenticatedEnableSecureBackupIncludingFallbackWithContext_completion___block_invoke_90_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Nested _authenticatedEnableSecureBackupWithContext failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.1()
{
  __assert_rtn("-[CDPDSecureBackupController _authenticatedEnableSecureBackupWithContext:fallbackState:completion:]", "CDPDSecureBackupController.m", 863, "unlockType == MCUnlockScreenSimple || simplePasscodeType == MCNotSimplePasscode");
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Attempting to enable SecureBackup with validated local secret using info %@\", v3);

  OUTLINED_FUNCTION_6();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Failed to escrow account recovery data due to missing recovery token\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Failed to escrow account recovery data due to missing MID\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_authenticatedEnableSecureBackupWithContext:(void *)a1 fallbackState:completion:.cold.5(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "telemetryFlowID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "telemetryDeviceSessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v3, v4, "\"Passing telemetry flow ID %{public}@ and deviceSession ID %{public}@ to secureBackupProxy\", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_authenticatedEnableSecureBackupWithContext:(uint64_t)a3 fallbackState:(uint64_t)a4 completion:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, a1, a3, "\"%s: Attempting to set passphrase key with empty, non-nil string\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.7()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Using cached secret with updated client metadata %@\", v3);

  OUTLINED_FUNCTION_6();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Using cached secret and managed config reports simplePasscodeLength=%li\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_authenticatedEnableSecureBackupWithContext:(uint64_t)a3 fallbackState:(uint64_t)a4 completion:(uint64_t)a5 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, a1, a3, "\"%s: Attempting to add local secret info for empty, non-nil string\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Forcing purge of cached secret by preference (com.apple.corecdp: ForceCachedSecretPurge)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_authenticatedEnableSecureBackupWithContext:fallbackState:completion:.cold.11()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Enabled SecureBackup!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Failed to enable with CDPContext local secret. Let's try again with SBD cached secret.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Using sync mode. Prompting user to enter local secret using delegate %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Using async mode. Failing early which should trigger a CFU.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Failed to enable SecureBackup because no cached secret was present when expected\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleSecureBackupEnablementError:fallbackState:context:delegate:completion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to enable SecureBackup with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Failed to get local secret\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __107__CDPDSecureBackupController__handleSecureBackupEnablementError_fallbackState_context_delegate_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Attempt to enable Secure Backup again now that we have the local secret\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_shouldUseSBDCacheWithSecureBackupContext:fallbackState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Forcing use of cached secret by preference (com.apple.corecdp: ForceUseCachedSecret)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __50__CDPDSecureBackupController__currentAnisetteData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Failed to fetch Anisette data! Error: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)performEscrowRecoveryWithData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithContextData: success!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performEscrowRecoveryWithData:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithContextData: failed to recover: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)performEscrowRecoveryWithData:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithData: calling performEscrowRecoveryWithContextData\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: cdp context does not support optimized recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: fetched 0 escrow records, exiting\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performSilentEscrowRecoveryWithCDPContext:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"performSilentEscrowRecoveryWithCDPContext: failed to perform silent burn and recover: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: performing silent restore now\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)performSilentEscrowRecoveryWithCDPContext:(NSObject *)a3 error:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a3, (uint64_t)a3, "\"performSilentEscrowRecoveryWithCDPContext: calling new recovery with %lu records\", (uint8_t *)a1);
}

- (void)performSilentEscrowRecoveryWithCDPContext:(uint64_t)a3 error:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"performSilentEscrowRecoveryWithCDPContext: failed to fetch escrow records: %@, exiting\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)performSilentEscrowRecoveryWithCDPContext:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: invoked\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: fetched 0 escrow records\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a2, v3, "\"performSilentEscrowRecoveryWithCDPContext: fetched %lu multiple icsc records\", v4);
  OUTLINED_FUNCTION_6();
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: single icsc\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __78__CDPDSecureBackupController_performSilentEscrowRecoveryWithCDPContext_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"performSilentEscrowRecoveryWithCDPContext: failed to fetch escrow records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: attempting silent burn\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: chosen record is empty, aborting recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: escrow recovery succeeded\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: failed to perform escrow recovery: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: record checks out, continuing with restore\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: need to perform a single icsc restore, choosing old recovery SPI\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: attempting remote restore\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: joined via recovery key!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext failed to join via recovery key: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: attempting recovery key recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: fetching RK from the keychain\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: using recovery key from recoveryContext\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_performEscrowRecoveryWithRecoveryContext:fallbackState:error:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithRecoveryContext: invoked with fallbackState=%ld\", v2);
  OUTLINED_FUNCTION_4();
}

void __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithData: failed to recover via cached recovery key, but an error was not reported. There was also an error checking recovery key support: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__CDPDSecureBackupController_performEscrowRecoveryWithRecoveryContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"performEscrowRecoveryWithData: failed to recover via cached recovery key. error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)validateAndRepairRecoveryKeyMismatchWithContext:authProvider:circleProxy:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Validating RK against OT because no mismatch exists\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Successfully registered IDMS RK to Octagon and SOS\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failure setting IDMS Recovery Key in SOS with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failure setting IDMS Recovery Key in Octagon with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Validated RK against IDMS successfully\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Validated RK against Octagon successfully\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Validated RK against SOS successfully\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Recovery Key is not valid in any observing system\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Successfully registered Octagon RK to IDMS and SOS\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failure setting Octagon Recovery Key in SOS with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_120_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failure setting Octagon Recovery Key in IDMS with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Successfully registered SOS RK to IDMS and Octagon\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failure setting SOS Recovery Key in Octagon with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __114__CDPDSecureBackupController_validateAndRepairRecoveryKeyMismatchWithContext_authProvider_circleProxy_completion___block_invoke_121_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failure setting SOS Recovery Key in IDMS with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_isRecoveryKeySetInOctagonWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Setting Recovery Set in Octagon failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_isRecoveryKeySetInSOSWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Received error while checking if RK is set in SOS: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_isRecoveryKeySetInSOSWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"SOS not enabled to check for RK\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_setRecoveryKeyInIDMSWithContext:circleProxy:authProvider:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"generateVerifierWithRecoveryKey failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Recovered SecureBackup\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to recover SecureBackup with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Recovery error had additional info: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_recoverBackupDictionaryWithContext:(void *)a1 fallbackState:(uint64_t)a2 error:.cold.4(void *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v4, v5, "\"Attempting to recover SecureBackup secret from device %@ using info %@\", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)_recoveryInfoDictionaryFromContext:(uint64_t)a3 usePreviouslyCachedSecret:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, a1, a3, "\"%s: Attempting to set recovery secret key with empty, non-nil string\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __67__CDPDSecureBackupController_deleteAllBackupRecordsWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating after error from _deleteAllBackupRecordsWithCompletion: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_deleteAllBackupRecordsWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Error attempting to delete all backup records %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_deleteAllBackupRecordsWithCompletion:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Attempting to delete all SecureBackup records with info %@\", v3);

  OUTLINED_FUNCTION_6();
}

void __67__CDPDSecureBackupController_deleteSingleICSCBackupWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating after error from _deleteSingleICSCBackupWithCompletion: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to get account info while deleting single-iCSC backup: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"No existing single-iCSC backup found to delete\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __68__CDPDSecureBackupController__deleteSingleICSCBackupWithCompletion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Deleting existing single-iCSC backup...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)disableSecureBackupWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating after error from _disableSecureBackupWithCompletion: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_disableSecureBackupWithEnableInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Failed to disable SecureBackup because no local peerID could be found\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_disableSecureBackupWithEnableInfo:error:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  v4 = *MEMORY[0x24BDAC8D0];
  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v2, "\"Attempting to disable SecureBackup with info %@\", v3);

  OUTLINED_FUNCTION_6();
}

- (void)_disableSecureBackupWithEnableInfo:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Setting non-viable repair key on securebackup disable info\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)disableRecoveryKeyWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Re-authenticating after error from disableRecoveryKeyWithCompletion: %@\", v2);
  OUTLINED_FUNCTION_4();
}

@end
