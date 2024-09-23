@implementation CDPDEscrowRecordController

- (CDPDEscrowRecordController)initWithContext:(id)a3 circleProxy:(id)a4 octagonTrustProxy:(id)a5 secureBackupProxy:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CDPDEscrowRecordController *v17;
  CDPDEscrowRecordController *v18;
  void *v19;
  AAFKeychainManager *v20;
  AAFKeychainManager *keychainManager;
  CDPDCircleController *v22;
  CDPDCircleController *circleController;
  CDPDSecureBackupController *v24;
  CDPDSecureBackupController *secureBackupController;
  CDPDEscrowRecordController *v26;
  NSObject *v27;
  id v29;
  objc_super v30;

  v11 = a3;
  v29 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "dsid");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14
    && (v15 = (void *)v14,
        objc_msgSend(v11, "altDSID"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    v30.receiver = self;
    v30.super_class = (Class)CDPDEscrowRecordController;
    v17 = -[CDPDEscrowRecordController init](&v30, sel_init);
    v18 = v17;
    v19 = v29;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_context, a3);
      objc_storeStrong((id *)&v18->_circleProxy, a4);
      objc_storeStrong((id *)&v18->_octagonTrustProxy, a5);
      objc_storeStrong((id *)&v18->_secureBackupProxy, a6);
      v20 = (AAFKeychainManager *)objc_alloc_init(MEMORY[0x24BDFC2F0]);
      keychainManager = v18->_keychainManager;
      v18->_keychainManager = v20;

      v22 = -[CDPDCircleController initWithUiProvider:delegate:circleProxy:octagonTrustProxy:]([CDPDCircleController alloc], "initWithUiProvider:delegate:circleProxy:octagonTrustProxy:", 0, v18, v29, v12);
      circleController = v18->_circleController;
      v18->_circleController = v22;

      v24 = -[CDPDSecureBackupController initWithContext:secureBackupProxy:octagonTrustProxy:]([CDPDSecureBackupController alloc], "initWithContext:secureBackupProxy:octagonTrustProxy:", v11, v13, v12);
      secureBackupController = v18->_secureBackupController;
      v18->_secureBackupController = v24;

      -[CDPDSecureBackupController setDelegate:](v18->_secureBackupController, "setDelegate:", v18);
    }
    self = v18;
    v26 = self;
  }
  else
  {
    _CDPLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[CDPDEscrowRecordController initWithContext:circleProxy:octagonTrustProxy:secureBackupProxy:].cold.1();

    v26 = 0;
    v19 = v29;
  }

  return v26;
}

- (CDPDEscrowRecordController)initWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  CDPDOctagonTrustProxyImpl *v7;
  CDPDSecureBackupProxyImpl *v8;
  CDPDEscrowRecordController *v9;

  v4 = (objc_class *)MEMORY[0x24BE1A3E8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContext:", v5);
  v7 = -[CDPDOctagonTrustProxyImpl initWithContext:]([CDPDOctagonTrustProxyImpl alloc], "initWithContext:", v5);
  v8 = -[CDPDSecureBackupProxyImpl initWithContext:]([CDPDSecureBackupProxyImpl alloc], "initWithContext:", v5);
  v9 = -[CDPDEscrowRecordController initWithContext:circleProxy:octagonTrustProxy:secureBackupProxy:](self, "initWithContext:circleProxy:octagonTrustProxy:secureBackupProxy:", v5, v6, v7, v8);

  return v9;
}

- (void)shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__CDPDEscrowRecordController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke;
  v8[3] = &unk_24C81C9B8;
  v9 = v6;
  v7 = v6;
  -[CDPDEscrowRecordController _shouldPerformSilentEscrowRecordRepairUsingCache:completion:](self, "_shouldPerformSilentEscrowRecordRepairUsingCache:completion:", v4, v8);

}

uint64_t __89__CDPDEscrowRecordController_shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

- (void)performSilentEscrowRecordRepairWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  +[CDPDLockAssertion lock](CDPDLockAssertion, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTelemetryFlowID:", v8);

  -[CDPDEscrowRecordController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "populateWalrusStatus");

  v11 = (void *)MEMORY[0x24BDFC2A0];
  -[CDPDEscrowRecordController context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "analyticsEventWithContext:eventName:category:", v12, *MEMORY[0x24BE1A7E0], *MEMORY[0x24BE1A860]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __76__CDPDEscrowRecordController_performSilentEscrowRecordRepairWithCompletion___block_invoke;
  v18[3] = &unk_24C81C9E0;
  v19 = v6;
  v20 = v13;
  v21 = v5;
  v22 = v4;
  v14 = v5;
  v15 = v4;
  v16 = v13;
  v17 = v6;
  -[CDPDEscrowRecordController _performSilentEscrowRecordRepairWithCompletion:](self, "_performSilentEscrowRecordRepairWithCompletion:", v18);

}

void __76__CDPDEscrowRecordController_performSilentEscrowRecordRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE1A640]);

  objc_msgSend(*(id *)(a1 + 40), "populateUnderlyingErrorsStartingWithRootError:", v8);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:", *(_QWORD *)(a1 + 40));

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (BOOL)updateLastSilentEscrowRecordRepairAttemptDate:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  CDPDEscrowRecordController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild");
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"%@: Attempting to update the last silent escrow record repair attempt date (%@)\", (uint8_t *)&v12, 0x16u);
    }

    v10 = -[CDPDEscrowRecordController _setLastEscrowRepairAttemptDate:error:](self, "_setLastEscrowRepairAttemptDate:error:", v6, a4);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CDPDEscrowRecordController updateLastSilentEscrowRecordRepairAttemptDate:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_shouldPerformSilentEscrowRecordRepairUsingCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__CDPDEscrowRecordController__shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke;
  v8[3] = &unk_24C81CA08;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingCache:completion:](self, "_deviceEscrowRecordStateUsingCache:completion:", v4, v8);

}

void __90__CDPDEscrowRecordController__shouldPerformSilentEscrowRecordRepairUsingCache_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v9 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_shouldPerformSilentRepairForEscrowRecordState:", a2);
  if (a2 == 4)
  {
    v6 = objc_msgSend(v9, "code");
    v7 = v9;
    if (v6 == -5403)
    {

      v7 = 0;
    }
  }
  else
  {
    v7 = v9;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v10 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, v5);
    v7 = v10;
  }

}

- (BOOL)_shouldPerformSilentRepairForEscrowRecordState:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  const char *v9;
  int v10;
  CDPDEscrowRecordController *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_20DB2C000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "\"%@: Determining if silent repair should be performed for state (%lu)\", (uint8_t *)&v10, 0x16u);
  }

  if (-[CDPDEscrowRecordController _isEscrowRecordRepairPermitted](self, "_isEscrowRecordRepairPermitted"))
  {
    switch(a3)
    {
      case 0uLL:
        _CDPLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        v10 = 138412290;
        v11 = self;
        v7 = "\"%@: Silent repair should not be performed for unknown state\";
        goto LABEL_9;
      case 1uLL:
        _CDPLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        v10 = 138412290;
        v11 = self;
        v7 = "\"%@: Silent repair should not be performed for viable state\";
        goto LABEL_9;
      case 2uLL:
        _CDPLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        v10 = 138412290;
        v11 = self;
        v9 = "\"%@: Silent repair should be performed for not found state\";
        break;
      case 3uLL:
        LODWORD(v5) = objc_msgSend(MEMORY[0x24BE1A4A0], "isSilentEscrowRecordViabilityRepairEnabled");
        _CDPLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 138412546;
          v11 = self;
          v12 = 1024;
          LODWORD(v13) = v5;
          _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: Silent repair can be perfomed for non viable state (%{BOOL}d)\", (uint8_t *)&v10, 0x12u);
        }
        goto LABEL_11;
      case 4uLL:
        _CDPLogSystem();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        v10 = 138412290;
        v11 = self;
        v9 = "\"%@: Silent burn recovery can be perfomed for missing circle state\";
        break;
      default:
        return v5 & 1;
    }
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
LABEL_22:
    LOBYTE(v5) = 1;
  }
  else
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = self;
      v7 = "\"%@: Silent repair should not be performed due to rate limiting\";
LABEL_9:
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    }
LABEL_10:
    LOBYTE(v5) = 0;
  }
LABEL_11:

  return v5 & 1;
}

- (void)_performSilentEscrowRecordRepairWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD aBlock[4];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke;
  aBlock[3] = &unk_24C81CA30;
  v11 = v4;
  v6 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_2;
  v8[3] = &unk_24C81CA80;
  v8[4] = self;
  v9 = _Block_copy(aBlock);
  v7 = v9;
  -[CDPDEscrowRecordController _determineEligibilityForSilentRepairWithCompletion:](self, "_determineEligibilityForSilentRepairWithCompletion:", v8);

}

uint64_t __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned int a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, a3 & a4, a5);
  return result;
}

void __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2048;
      v15 = a2;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: Proceeding with silent escrow record repair for state (%lu)\", buf, 0x16u);
    }

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_45;
    v9[3] = &unk_24C81CA58;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = a2;
    objc_msgSend(v8, "_beginSilentEscrowRecordRepairWithState:completion:", a2, v9);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, 0, 0, a4);
  }
}

uint64_t __77__CDPDEscrowRecordController__performSilentEscrowRecordRepairWithCompletion___block_invoke_45(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, a2, a3);
}

- (void)generateEscrowRecordStatusReportForLocalDeviceUsingCache:(BOOL)a3 withCompletion:(id)a4
{
  -[CDPDEscrowRecordController generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:withCompletion:](self, "generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:withCompletion:", a3, a4);
}

- (void)generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a4;
  v11 = 0;
  v7 = -[CDPDEscrowRecordController _isEligibleForEscrowRecordOperationsWithError:](self, "_isEligibleForEscrowRecordOperationsWithError:", &v11);
  v8 = v11;
  if (v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke;
    v9[3] = &unk_24C81CAA8;
    v9[4] = self;
    v10 = v6;
    -[CDPDEscrowRecordController _fetchAllEscrowRecordsFromSource:completion:](self, "_fetchAllEscrowRecordsFromSource:completion:", a3, v9);

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v8);
  }

}

void __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_2();

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x24BE1A4A0], "shouldValidatePasscodeGenerations");
    v10 = objc_alloc(MEMORY[0x24BE1A418]);
    v11 = v10;
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithRecords:localDevice:", v5, v12);

      v14 = *(_QWORD *)(a1 + 40);
      if (v14)
        (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v13, 0);

    }
    else
    {
      v15 = (void *)objc_msgSend(v10, "initWithDefaultValues");
      objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "serialNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:", v17, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "escrowInformationMetadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "clientMetadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "deviceName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "serialNumber");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _CDPLogSystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v15;
          v25 = v17;
          v26 = v23;
          v27 = v22;
          v28 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v19, "recordId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v36 = v28;
          v22 = v27;
          v23 = v26;
          v17 = v25;
          v15 = v34;
          v37 = 2160;
          v38 = 1752392040;
          v39 = 2112;
          v40 = v29;
          v41 = 2112;
          v42 = v22;
          v43 = 2112;
          v44 = v23;
          _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "\"%{public}@: Processing device escrow record with id: %{mask.hash}@ (name: '%@', serial: %@)\", buf, 0x34u);

        }
        objc_msgSend(v15, "updatedReportWithRecord:", v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = *(_QWORD *)(a1 + 40);
        if (v31)
          (*(void (**)(uint64_t, void *, _QWORD))(v31 + 16))(v31, v30, 0);

      }
      else
      {
        _CDPLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_1();

        v33 = *(_QWORD *)(a1 + 40);
        if (v33)
          (*(void (**)(uint64_t, void *, _QWORD))(v33 + 16))(v33, v15, 0);
        v30 = v15;
      }

    }
  }

}

- (id)_firstUsableRecordForCurrentPeerWithSerialNumber:(id)a3 fromRecords:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v31;
  uint8_t v33;
  _BYTE v34[15];
  uint8_t v35;
  _BYTE v36[15];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[4];
  uint64_t v42;
  uint8_t buf[4];
  CDPDEscrowRecordController *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.7(v7, v8, v9);

  if (!objc_msgSend(v6, "count") || !objc_msgSend(v5, "length"))
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.1(v6);
    goto LABEL_39;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.6();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v6;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (!v12)
  {
LABEL_39:
    v28 = 0;
    goto LABEL_44;
  }
  v13 = v12;
  v14 = *(_QWORD *)v38;
  v31 = v6;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v38 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_msgSend(v16, "serialNumber", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v5);

      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((v18 & 1) == 0)
      {
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        objc_msgSend(v16, "serialNumber");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = self;
        v45 = 2112;
        v46 = (uint64_t)v24;
        v47 = 2112;
        v48 = v5;
        v25 = v20;
        v26 = "@\"%{public}@: Skipping record with serial number (%@). This device has a serial number of (%@)\";
        goto LABEL_33;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.5(v41, &v42, v20);

      objc_msgSend(v16, "label");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hasPrefix:", CFSTR("com.apple.icdp.record"));

      _CDPLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      v20 = v23;
      if ((v22 & 1) == 0)
      {
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        objc_msgSend(v16, "label");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = self;
        v45 = 2160;
        v46 = 1752392040;
        v47 = 2112;
        v48 = v24;
        v25 = v20;
        v26 = "@\"%{public}@: Skipping record with incorrect label %{mask.hash}@\";
        goto LABEL_33;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.4(&v35, v36, v20);

      if (objc_msgSend(v16, "hasRecordStatus") && objc_msgSend(v16, "recordStatus") == 1)
      {
        _CDPLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        objc_msgSend(v16, "recordId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = self;
        v45 = 2160;
        v46 = 1752392040;
        v47 = 2112;
        v48 = v24;
        v25 = v20;
        v26 = "\"%{public}@: Record %{mask.hash}@ has invalid status.\";
        goto LABEL_33;
      }
      _CDPLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.3(&v33, v34, v27);

      if (objc_msgSend(v16, "hasRecordViability")
        && (objc_msgSend(v16, "recordViability") == 1
         || !objc_msgSend(v16, "recordViability")))
      {
        _CDPLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[CDPDEscrowRecordController _firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:].cold.2(v16);

        v28 = v16;
        goto LABEL_43;
      }
      _CDPLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "recordId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = self;
        v45 = 2160;
        v46 = 1752392040;
        v47 = 2112;
        v48 = v24;
        v25 = v20;
        v26 = "\"%{public}@: Record %{mask.hash}@ is not partially or fully viable. Skipping update.\";
LABEL_33:
        _os_log_error_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x20u);

      }
LABEL_34:

    }
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v13)
      continue;
    break;
  }
  v28 = 0;
LABEL_43:
  v6 = v31;
LABEL_44:

  return v28;
}

- (void)_determineEligibilityForSilentRepairWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  CDPDEscrowRecordController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CDPDEscrowRecordController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLocalSecretCached");

  if ((v6 & 1) != 0)
  {
    if (-[CDPDEscrowRecordController _isEscrowRecordRepairPermitted](self, "_isEscrowRecordRepairPermitted"))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __81__CDPDEscrowRecordController__determineEligibilityForSilentRepairWithCompletion___block_invoke;
      v12[3] = &unk_24C81CA80;
      v12[4] = self;
      v13 = v4;
      -[CDPDEscrowRecordController _shouldPerformSilentEscrowRecordRepairUsingCache:completion:](self, "_shouldPerformSilentEscrowRecordRepairUsingCache:completion:", 1, v12);

      goto LABEL_13;
    }
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot silently repair escrow record due to rate limiting\", buf, 0xCu);
    }

    if (v4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = -5203;
      goto LABEL_12;
    }
  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot silently repair escrow record without cached local secret\", buf, 0xCu);
    }

    if (v4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = -5003;
LABEL_12:
      objc_msgSend(v8, "cdp_errorWithCode:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v11);

    }
  }
LABEL_13:

}

void __81__CDPDEscrowRecordController__determineEligibilityForSilentRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if ((a3 & 1) != 0
    || objc_msgSend(v7, "code") == 51
    && (objc_msgSend(v8, "domain"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.security.trustedpeers.container")),
        v9,
        v10))
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"%@: Double checking if silent escrow record repair should be performed (using network)\", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_shouldPerformSilentEscrowRecordRepairUsingCache:completion:", 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v13 + 16))(v13, a2, 0, v8);
  }

}

- (BOOL)_isEscrowRecordRepairPermitted
{
  void *v3;
  id v4;
  NSObject *v5;
  BOOL v6;
  _BOOL4 v7;
  double v8;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  id v14;
  uint8_t buf[4];
  CDPDEscrowRecordController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  -[CDPDEscrowRecordController _lastEscrowRepairAttemptDate:](self, "_lastEscrowRepairAttemptDate:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v4)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPDEscrowRecordController _isEscrowRecordRepairPermitted].cold.1((uint64_t)self);
    v6 = 0;
    goto LABEL_18;
  }
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"%@: Fetched last escrow repair attempt date (%@)\", buf, 0x16u);
    }

    objc_msgSend(v3, "dateByAddingTimeInterval:", 15552000.0);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceNow](v5, "timeIntervalSinceNow");
    v9 = v8;
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    v6 = v9 <= 0.0;
    if (v9 > 0.0)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        v12 = "\"%@: Escrow record repair will not be allowed at this time\";
        goto LABEL_16;
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      v12 = "\"%@: Escrow record repair will be allowed at this time\";
LABEL_16:
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }

    goto LABEL_18;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"%@: Could not find an existing keychain value for last escrow repair attempt date, allowing repair to proceed\", buf, 0xCu);
  }
  v6 = 1;
LABEL_18:

  return v6;
}

- (BOOL)_isEligibleForEscrowRecordOperationsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  CDPDEscrowRecordController *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[CDPDEscrowRecordController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController _getAccountRepresentationForAltDSID:](self, "_getAccountRepresentationForAltDSID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasLocalSecret") & 1) != 0)
    {
      -[CDPDEscrowRecordController circleController](self, "circleController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "circleStatus");

      if (v10 == 1)
      {
        v11 = 1;
LABEL_19:

        goto LABEL_20;
      }
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = self;
        v21 = 2048;
        v22 = v10;
        _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot determine escrow record state for device not in circle (%lu)\", (uint8_t *)&v19, 0x16u);
      }

      if (a3)
      {
        v16 = -5403;
        goto LABEL_17;
      }
    }
    else
    {
      _CDPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = self;
        _os_log_impl(&dword_20DB2C000, v15, OS_LOG_TYPE_DEFAULT, "\"%@: Will not determine escrow record state for device without local secret (not eligible)\", (uint8_t *)&v19, 0xCu);
      }

      if (a3)
      {
        v16 = -5500;
LABEL_17:
        objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", v16);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    v11 = 0;
    goto LABEL_19;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CDPDEscrowRecordController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "altDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = self;
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot determine escrow record for unknown account with altDSID (%{mask.hash}@)\", (uint8_t *)&v19, 0x20u);

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5108);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  int v22;
  CDPDEscrowRecordController *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[CDPDEscrowRecordController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController _getAppleAccountForAltDSID:](self, "_getAppleAccountForAltDSID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDPDEscrowRecordController _escrowRecordHealthCheckFailureCountForAccount:](self, "_escrowRecordHealthCheckFailureCountForAccount:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      -[CDPDEscrowRecordController _escrowRecordHealthCheckFailureCountForAccount:](self, "_escrowRecordHealthCheckFailureCountForAccount:", v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;

      v17 = objc_msgSend(v10, "intValue");
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = "unknown";
        if (v17 > 0)
          v19 = "non-viable or not found";
        v22 = 138412546;
        v23 = self;
        v24 = 2080;
        v25 = (uint64_t)v19;
        _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"%@: Used precomputed escrowRecordHealthCheckFailureCount bit and determined escrow record state is %s.\", (uint8_t *)&v22, 0x16u);
      }

      if (v17 < 1)
      {
        _CDPLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingAccountsHealthCheckCache:].cold.2();

        if (v4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5324);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, v21);

        }
      }
      else if (v4)
      {
        v4[2](v4, 2, 0);
      }
      goto LABEL_22;
    }
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingAccountsHealthCheckCache:].cold.1();

    if (v4)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = -5323;
      goto LABEL_13;
    }
  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CDPDEscrowRecordController context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "altDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = self;
      v24 = 2160;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot determine escrow record for unknown account with altDSID (%{mask.hash}@)\", (uint8_t *)&v22, 0x20u);

    }
    if (v4)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = -5108;
LABEL_13:
      objc_msgSend(v14, "cdp_errorWithCode:", v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v10);
LABEL_22:

    }
  }

}

- (void)_deviceEscrowRecordStateUsingCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD, id);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  void (**v34)(id, _QWORD, id);
  char v35;
  _QWORD v36[5];
  void (**v37)(id, _QWORD, id);
  id v38;
  uint8_t buf[4];
  CDPDEscrowRecordController *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v4 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, id))a4;
  -[CDPDEscrowRecordController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController _getAccountRepresentationForAltDSID:](self, "_getAccountRepresentationForAltDSID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[CDPDEscrowRecordController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "altDSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = self;
      v41 = 2160;
      v42 = 1752392040;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot determine escrow record for unknown account with altDSID (%{mask.hash}@)\", buf, 0x20u);

    }
    if (!v6)
      goto LABEL_26;
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = -5108;
LABEL_24:
    objc_msgSend(v21, "cdp_errorWithCode:", v22);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v13);
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasLocalSecret");

  if ((v11 & 1) == 0)
  {
    _CDPLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = self;
      _os_log_impl(&dword_20DB2C000, v23, OS_LOG_TYPE_DEFAULT, "\"%@: Will not determine escrow record state for device without local secret (not eligible)\", buf, 0xCu);
    }

    if (!v6)
      goto LABEL_26;
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = -5500;
    goto LABEL_24;
  }
  if ((objc_msgSend(v9, "isSilentEscrowRecordRepairEnabledV2") & 1) != 0)
  {
    v38 = 0;
    v12 = -[CDPDEscrowRecordController _combinedCircleStatusUsingCache:error:](self, "_combinedCircleStatusUsingCache:error:", v4, &v38);
    v13 = v38;
    if ((objc_msgSend(v9, "isSilentBurnCDPRepairEnabled") & 1) != 0)
    {
      if (objc_msgSend(MEMORY[0x24BE1A4A0], "isSilentBurnInMiniBuddyEnabled"))
      {
        -[CDPDEscrowRecordController context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "type");

        if (v15 == 10 && v12 != 1)
        {
          _CDPLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = self;
            _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"%@: Device not in circle; will try a silent burn recovery...\",
              buf,
              0xCu);
          }

          if (v6)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5403, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, 4, v17);

          }
          goto LABEL_25;
        }
      }
    }
    else
    {
      _CDPLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = self;
        _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot perform silent burn in mini-buddy due to server-side disablement\", buf, 0xCu);
      }

    }
    if (v4)
    {
      -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingAccountsHealthCheckCache:](self, "_deviceEscrowRecordStateUsingAccountsHealthCheckCache:", v6);
    }
    else if (objc_msgSend(MEMORY[0x24BE1A4A0], "shouldValidatePasscodeGenerations"))
    {
      -[CDPDEscrowRecordController circleController](self, "circleController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "peerID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[CDPDEscrowRecordController secureBackupController](self, "secureBackupController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isSimulateNonViableEscrowRecordEnabled");

        if (v29)
        {
          _CDPLogSystem();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = self;
            _os_log_impl(&dword_20DB2C000, v30, OS_LOG_TYPE_DEFAULT, "\"%@: Simulating escrow record as non-viable record only for testing\", buf, 0xCu);
          }

          if (v6)
            v6[2](v6, 3, 0);
        }
        else
        {
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke;
          v36[3] = &unk_24C81CAD0;
          v36[4] = self;
          v37 = v6;
          -[CDPDEscrowRecordController generateEscrowRecordStatusReportForLocalDeviceUsingCache:withCompletion:](self, "generateEscrowRecordStatusReportForLocalDeviceUsingCache:withCompletion:", 0, v36);

        }
      }
      else
      {
        _CDPLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingCache:completion:].cold.1();

        if (v6)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5309);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, 4, v32);

        }
      }

    }
    else
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_54;
      v33[3] = &unk_24C81CAF8;
      v33[4] = self;
      v34 = v6;
      v35 = 0;
      -[CDPDEscrowRecordController _checkAllRecordsForCurrentDeviceUsingCache:completion:](self, "_checkAllRecordsForCurrentDeviceUsingCache:completion:", 0, v33);

    }
    goto LABEL_25;
  }
  _CDPLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_impl(&dword_20DB2C000, v24, OS_LOG_TYPE_DEFAULT, "\"%@: Cannot determine escrow record state due to server-side disablement\", buf, 0xCu);
  }

  if (v6)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = -5004;
    goto LABEL_24;
  }
LABEL_26:

}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "deviceViability");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recordId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceViability");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "localViability");
      objc_msgSend(v5, "deviceViability");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localViability");
      CDPEscrowRecordStateString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v20 = v10;
      v21 = 2160;
      v22 = 1752392040;
      v23 = 2112;
      v24 = v11;
      v25 = 1024;
      v26 = v13;
      v27 = 2114;
      v28 = v15;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Report indicates that the current device's most viable record is: (%{mask.hash}@ with state: %d (%{public}@)\", buf, 0x30u);

    }
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
    {
      objc_msgSend(v5, "deviceViability");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v16 + 16))(v16, objc_msgSend(v17, "localViability"), 0);

    }
  }

}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_54_cold_1();

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_6:
      v9();
    }
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Determed that current device has an existing escrow record (%@)\", (uint8_t *)&v16, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_escrowRecordStateForDevice:usingCache:completion:", v5, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (v11)
      {
        v14 = *(_QWORD *)(a1 + 32);
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Existing escrow record for current device could not be found\", (uint8_t *)&v16, 0xCu);
      }

      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
      {
        v9 = *(void (**)(void))(v15 + 16);
        goto LABEL_6;
      }
    }
  }

}

- (void)_checkAllRecordsForCurrentDeviceUsingCache:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  -[CDPDEscrowRecordController circleController](self, "circleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __84__CDPDEscrowRecordController__checkAllRecordsForCurrentDeviceUsingCache_completion___block_invoke;
    v11[3] = &unk_24C81CB20;
    v12 = v6;
    -[CDPDEscrowRecordController _checkFirstUsableRecordForDeviceFromSource:completion:](self, "_checkFirstUsableRecordForDeviceFromSource:completion:", v4, v11);
    v9 = v12;
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CDPDEscrowRecordController _deviceEscrowRecordStateUsingCache:completion:].cold.1();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5309);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __84__CDPDEscrowRecordController__checkAllRecordsForCurrentDeviceUsingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = (objc_class *)MEMORY[0x24BE1A410];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithEscrowRecord:", v6);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v9);

}

- (void)_escrowRecordStateForDevice:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  CDPDEscrowRecordController *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v8;
    v21 = 1024;
    v22 = v6;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Checking if device (%@) is missing TLK recoverability using cache (%{BOOL}d)\", buf, 0x1Cu);
  }

  objc_msgSend(v8, "record");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke;
  v14[3] = &unk_24C81CB48;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[CDPDEscrowRecordController _tlkRecoveryViewsForRecord:usingCache:completion:](self, "_tlkRecoveryViewsForRecord:usingCache:completion:", v11, v6, v14);

}

void __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isRecordNotViableError"))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "recordID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412802;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%@: Checking TLK recoverability for escrow record (%@) exposed its non viableness (%@)\", (uint8_t *)&v21, 0x20u);

    }
LABEL_4:

    v10 = *(_QWORD *)(a1 + 48);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_11:
      v11();
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "secureBackupController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isSimulateNonViableEscrowRecordEnabled");

    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "recordID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v18;
        v23 = 2112;
        v24 = v19;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%@: Checked TLK recoverability for escrow record (%@) and found views (%@)\", (uint8_t *)&v21, 0x20u);

      }
      objc_msgSend(v5, "count");
      v20 = *(_QWORD *)(a1 + 48);
      if (v20)
      {
        v11 = *(void (**)(void))(v20 + 16);
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v21 = 138412290;
      v22 = v17;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%@: Simulating escrow record as non-viable record only for testing\", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_4;
  }
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke_cold_1(a1, v12);

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    v11 = *(void (**)(void))(v13 + 16);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_tlkRecoveryViewsForRecord:(id)a3 usingCache:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, void *, id);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  CDPDEscrowRecordController *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "recordId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = self;
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2112;
    v24 = v11;
    v25 = 1024;
    v26 = v6;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"%{public}@: Checking for recoverable TLK views in record (%{mask.hash}@) is missing TLK recoverability using cache (%{BOOL}d)\", buf, 0x26u);

  }
  -[CDPDEscrowRecordController context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPDSecureBackupConfiguration configurationWithContext:](CDPDSecureBackupConfiguration, "configurationWithContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "accountInfoFetchSetupDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController octagonTrustProxy](self, "octagonTrustProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v15, "tlkRecoverabilityForEscrow:record:source:error:", v14, v8, v6, &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v18;

  if (v9)
    v9[2](v9, v16, v17);

}

- (void)_beginSilentEscrowRecordRepairWithState:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, uint64_t, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  _QWORD aBlock[5];
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  CDPDEscrowRecordController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke;
  aBlock[3] = &unk_24C81CB70;
  v15 = v6;
  v16 = a3;
  aBlock[4] = self;
  v7 = v6;
  v8 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  -[CDPDEscrowRecordController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passwordEquivToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"%@: Context already has PET, auth is not necessary\", buf, 0xCu);
    }

    v8[2](v8, 1, 0);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"%@: Context does not have a PET, attempting to perform silent auth\", buf, 0xCu);
    }

    -[CDPDEscrowRecordController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reauthenticateUserWithCompletion:", v8);

  }
}

void __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "passwordEquivToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v8;
      v15 = 2160;
      v16 = 1752392040;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"%@: Context is authenticated and has PET (%{mask.hash}@}\", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_continueSilentEscrowRecordRepairWithState:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke_cold_1();

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5109, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

- (void)_continueSilentEscrowRecordRepairWithState:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  CDPDSecureBackupContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  CDPDEscrowRecordController *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = self;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Attempting to set the current date (%@) as last escrow repair attempt date\", buf, 0x16u);
  }

  v25 = 0;
  v9 = -[CDPDEscrowRecordController _setLastEscrowRepairAttemptDate:error:](self, "_setLastEscrowRepairAttemptDate:error:", v7, &v25);
  v10 = v25;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = self;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"%@: Successfully saved current date (%@) as last escrow repair attempt date, proceeding with silent repair attempt\", buf, 0x16u);
    }

    if (a3 == 4)
    {
      -[CDPDEscrowRecordController _cdpStateMachineWithNilUIProvider](self, "_cdpStateMachineWithNilUIProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke;
      v23[3] = &unk_24C81C558;
      v23[4] = self;
      v24 = v6;
      objc_msgSend(v13, "repairCloudDataProtectionStateWithCompletion:", v23);

    }
    else
    {
      v14 = objc_alloc_init(CDPDSecureBackupContext);
      -[CDPDEscrowRecordController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDSecureBackupContext setUsePreviouslyCachedSecret:](v14, "setUsePreviouslyCachedSecret:", objc_msgSend(v15, "_useSecureBackupCachedPassphrase"));

      -[CDPDEscrowRecordController context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDSecureBackupContext setSynchronous:](v14, "setSynchronous:", objc_msgSend(v16, "_disableAsyncSecureBackupEnrollment"));

      -[CDPDEscrowRecordController context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cachedLocalSecret");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDSecureBackupContext setLocalSecret:](v14, "setLocalSecret:", v18);

      -[CDPDEscrowRecordController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDSecureBackupContext setLocalSecretType:](v14, "setLocalSecretType:", objc_msgSend(v19, "cachedLocalSecretType"));

      -[CDPDSecureBackupContext setNonViableRequiresRepair:](v14, "setNonViableRequiresRepair:", a3 == 3);
      -[CDPDEscrowRecordController secureBackupController](self, "secureBackupController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_61;
      v21[3] = &unk_24C81C558;
      v21[4] = self;
      v22 = v6;
      objc_msgSend(v20, "enableSecureBackupWithContext:completion:", v14, v21);

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CDPDEscrowRecordController _continueSilentEscrowRecordRepairWithState:completion:].cold.1((uint64_t)self);

    if (v6)
      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v10);
  }

}

void __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"%@: silent repair with state machine completed with result: %{BOOL}d error: %@\", (uint8_t *)&v9, 0x1Cu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

void __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BE17B98]) && objc_msgSend(v5, "code") == -1002)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "secureBackupController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "simulateEPThrottle");

    if (!v8)
      goto LABEL_8;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_61_cold_1();

LABEL_8:
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

- (void)_checkFirstUsableRecordForDeviceFromSource:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke;
  v8[3] = &unk_24C81CB98;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[CDPDEscrowRecordController _fetchAllEscrowRecordsFromSource:completion:](self, "_fetchAllEscrowRecordsFromSource:completion:", a3, v8);

}

void __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 48);
      v22 = 138413058;
      v23 = v14;
      v24 = 2112;
      v25 = v10;
      v26 = 2050;
      v27 = v15;
      v28 = 2112;
      v29 = v11;
      v16 = "\"%@: First usable record matching the serial number (%@) with source (%{public}ld) is (%@)\";
      v17 = v12;
      v18 = 42;
LABEL_11:
      _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
    }
  }
  else if (v13)
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 48);
    v22 = 138412802;
    v23 = v19;
    v24 = 2112;
    v25 = v10;
    v26 = 2050;
    v27 = v20;
    v16 = "\"%@: Could not find a record matching serial number (%@) with source (%{public}ld).\";
    v17 = v12;
    v18 = 32;
    goto LABEL_11;
  }

  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v11, 0);

LABEL_15:
}

- (void)_fetchAllEscrowRecordsFromSource:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  CDPDOctagonTrustProxy *octagonTrustProxy;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  CDPDEscrowRecordController *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[CDPDEscrowRecordController secureBackupController](self, "secureBackupController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountInfoFetchSetupDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = self;
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"%@: Fetching all escrow records from source (%ld) with account info (%@)\", buf, 0x20u);

  }
  octagonTrustProxy = self->_octagonTrustProxy;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke;
  v14[3] = &unk_24C81CBC0;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  -[CDPDOctagonTrustProxy fetchAllEscrowRecords:source:completion:](octagonTrustProxy, "fetchAllEscrowRecords:source:completion:", v9, a3, v14);

}

void __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke_cold_1();

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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"%@: Successfully fetched all escrow records (%@)\", (uint8_t *)&v13, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }

}

- (id)_lastEscrowRepairAttemptDateDescriptor
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDFC2E8]);
  objc_msgSend(v2, "setItemClass:", 1);
  objc_msgSend(v2, "setItemAccessible:", 4);
  objc_msgSend(v2, "setInvisible:", 2);
  objc_msgSend(v2, "setSynchronizable:", 1);
  objc_msgSend(v2, "setUseDataProtection:", 2);
  objc_msgSend(v2, "setService:", CFSTR("com.apple.cdpd.escrow-repair.svc"));
  objc_msgSend(v2, "setLabel:", CFSTR("com.apple.cdpd.escrow-repair.label.last-attempt-date"));
  return v2;
}

- (id)_lastEscrowRepairAttemptDate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v18;
  id v19;
  uint8_t buf[4];
  CDPDEscrowRecordController *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CDPDEscrowRecordController _lastEscrowRepairAttemptDateDescriptor](self, "_lastEscrowRepairAttemptDateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController keychainManager](self, "keychainManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v6, "keychainItemForDescriptor:error:", v5, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;

  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "code") == -25300)
  {
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD1100]);

    if (v11)
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = self;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"%@: Last escrow repair attempt date not found in keychain (%@)\", buf, 0x16u);
      }

      goto LABEL_12;
    }
  }
  if (v9)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    v15 = v14;
    if (v14)
    {
      v16 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v14);
    }
    else
    {
      v16 = v13;
    }

  }
  else
  {
    if (!a3)
    {
LABEL_12:
      v16 = 0;
      goto LABEL_15;
    }
    v16 = 0;
    *a3 = objc_retainAutorelease(v8);
  }
LABEL_15:

  return v16;
}

- (BOOL)_setLastEscrowRepairAttemptDate:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  id v15;
  id v16;

  if (!a3)
    return -[CDPDEscrowRecordController _clearLastEscrowRepairAttemptDate:](self, "_clearLastEscrowRepairAttemptDate:", a4);
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    -[CDPDEscrowRecordController _lastEscrowRepairAttemptDateDescriptor](self, "_lastEscrowRepairAttemptDateDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFC2E0]), "initWithDescriptor:value:", v9, v6);
    -[CDPDEscrowRecordController keychainManager](self, "keychainManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v11, "addOrUpdateKeychainItem:error:", v10, &v15);
    v12 = v15;

    v13 = v12 == 0;
    if (a4)
    {
      if (v12)
        *a4 = objc_retainAutorelease(v12);
    }

  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v13;
}

- (BOOL)_clearLastEscrowRepairAttemptDate:(id *)a3
{
  void *v5;
  void *v6;

  -[CDPDEscrowRecordController _lastEscrowRepairAttemptDateDescriptor](self, "_lastEscrowRepairAttemptDateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDEscrowRecordController keychainManager](self, "keychainManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteKeychainItemsForDescriptor:error:", v5, a3);

  return a3 != 0;
}

- (unint64_t)_combinedCircleStatusUsingCache:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  CDPDEscrowRecordController *v19;
  __int16 v20;
  _BYTE v21[14];
  uint64_t v22;

  v5 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  -[CDPDEscrowRecordController circleProxy](self, "circleProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v17 = 0;
    v9 = (id *)&v17;
    v10 = objc_msgSend(v7, "combinedCachedCircleStatus:", &v17);
  }
  else
  {
    v16 = 0;
    v9 = (id *)&v16;
    v10 = objc_msgSend(v7, "combinedCircleStatus:", &v16);
  }
  v11 = v10;
  v12 = *v9;

  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = self;
      v20 = 1024;
      *(_DWORD *)v21 = v5;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v12;
      _os_log_error_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_ERROR, "\"%@: Failed to retrieve combined circle status using cache (%{BOOL}d) with error (%@)\", buf, 0x1Cu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v19 = self;
      v20 = 2048;
      *(_QWORD *)v21 = v11;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v5;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"%@: Retrieved combined circle status (%lu) using cache (%{BOOL}d)\", buf, 0x1Cu);
    }

  }
  return v11;
}

- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = a4;
    objc_msgSend(v5, "cdp_errorWithCode:", -5004);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))a4 + 2))(v6, 0, 0, v7);

  }
}

- (id)secureChannelContextForController:(id)a3
{
  return 0;
}

- (id)circlePeerIDForSecureBackupController:(id)a3
{
  void *v3;
  void *v4;

  -[CDPDEscrowRecordController circleController](self, "circleController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3
{
  void *v3;
  char v4;

  -[CDPDEscrowRecordController circleController](self, "circleController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "synchronizeCircleViews");

  return v4;
}

- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)promptForLocalSecretWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  NSObject *v4;
  void *v5;

  v3 = (void (**)(id, _QWORD, void *))a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[CDPDEscrowRecordController promptForLocalSecretWithCompletion:].cold.1();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v5);

  }
}

- (id)_cdpStateMachineWithNilUIProvider
{
  return -[CDPDStateMachine initWithContext:uiProvider:]([CDPDStateMachine alloc], "initWithContext:uiProvider:", self->_context, 0);
}

- (id)_escrowRecordHealthCheckFailureCountForAccount:(id)a3
{
  return (id)objc_msgSend(a3, "accountPropertyForKey:", CFSTR("escrowRecordHealthCheckFailureCount"));
}

- (id)_getAppleAccountForAltDSID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE1A3D0], "appleAccountForAltDSID:", a3);
}

- (id)_getAccountRepresentationForAltDSID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE1A3D8], "representationForAltDSID:", a3);
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (CDPDOctagonTrustProxy)octagonTrustProxy
{
  return self->_octagonTrustProxy;
}

- (CDPDSecureBackupProxy)secureBackupProxy
{
  return self->_secureBackupProxy;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (CDPDCircleController)circleController
{
  return self->_circleController;
}

- (CDPDSecureBackupController)secureBackupController
{
  return self->_secureBackupController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_secureBackupProxy, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:circleProxy:octagonTrustProxy:secureBackupProxy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, v0, v1, "\"Expected valid context (%@) with non-null DSID and altDSID\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateLastSilentEscrowRecordRepairAttemptDate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, v0, v1, "\"%@: Unexpected request to remove last silent escrow record repair attempt date\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v0, v1, "\"%{public}@: There are no usable records for the local device matching serial number (%@)\");
  OUTLINED_FUNCTION_4();
}

void __108__CDPDEscrowRecordController_generateEscrowRecordStatusReportForLocalDeviceUsingFetchSource_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to check all records with error: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(void *)a1 fromRecords:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v1, v2, "\"Exiting early from usable records check. AllRecordsCount=(%lu), serialNumber=(%@)\", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(void *)a1 fromRecords:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9(&dword_20DB2C000, v1, v2, "\"Returning record %{mask.hash}@ because it is partially or fully viable.\", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(NSObject *)a3 fromRecords:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8(&dword_20DB2C000, a3, (uint64_t)a3, "\"Checking if record (1) hasRecordViability and (2) the viability is either partially or fully viable\", a1);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(NSObject *)a3 fromRecords:.cold.4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8(&dword_20DB2C000, a3, (uint64_t)a3, "\"Checking if record (1) hasRecordStatus and (2) record status is any value other than INVALID\", a1);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(NSObject *)a3 fromRecords:.cold.5(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a2 = CFSTR("com.apple.icdp.record");
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a3, (uint64_t)a3, "\"Checking if record's label has prefix '%@'\", a1);
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:fromRecords:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Beginning account escrow record evaluation to find viable escrow records matching this device's serial number: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_firstUsableRecordForCurrentPeerWithSerialNumber:(uint64_t)a3 fromRecords:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_8(&dword_20DB2C000, a1, a3, "\"Ensuring the following items are not empty: array of records, serial number\", v3);
}

- (void)_isEscrowRecordRepairPermitted
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v1, v2, "\"%@: Failed to fetch keychain value for last escrow repair attempt date with error (%@)\", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"%@: escrowRecordHealthCheckFailureCountKey is not available in Accounts DB cache. Maybe the account health check was never run.\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_deviceEscrowRecordStateUsingAccountsHealthCheckCache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"%@: escrowRecordHealthCheckFailureCountKey = 0, indicating that we have a healthy escrow record for the device. MiniBuddy should not have attempted the repair. Please use the eligibility SPI shouldPerformSilentEscrowRecordRepairWithContext before attempting the repair.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_deviceEscrowRecordStateUsingCache:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"%@: Cannot silently repair escrow record for current device with nil peerID\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v1, v2, "\"%@: Failed to determine if device already has escrow record with error (%{public}@)\", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

void __76__CDPDEscrowRecordController__deviceEscrowRecordStateUsingCache_completion___block_invoke_54_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v0, v1, "\"%@: Failed to determine if device already has escrow record with error (%@)\");
  OUTLINED_FUNCTION_4();
}

void __80__CDPDEscrowRecordController__escrowRecordStateForDevice_usingCache_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"%@: Failed to check TLK recoverability for record with ID (%@)\", (uint8_t *)&v5, 0x16u);

}

void __81__CDPDEscrowRecordController__beginSilentEscrowRecordRepairWithState_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v0, v1, "\"%@: Unable to continue silent escrow record repair due to auth error (%@)\");
  OUTLINED_FUNCTION_4();
}

- (void)_continueSilentEscrowRecordRepairWithState:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v1, v2, "\"%@: Failed to set last escrow repair attempt date in keychain with error (%@)\", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

void __84__CDPDEscrowRecordController__continueSilentEscrowRecordRepairWithState_completion___block_invoke_61_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v0, v1, "\"%@: Failed to repair the non-viable escrow record as the request was dropped by escrow proxy with error (%@)\");
  OUTLINED_FUNCTION_4();
}

void __84__CDPDEscrowRecordController__checkFirstUsableRecordForDeviceFromSource_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to check all records with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __74__CDPDEscrowRecordController__fetchAllEscrowRecordsFromSource_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_4(&dword_20DB2C000, v1, v2, "\"%@: Failed to fetch all escrow records with error (%{public}@)\", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_4();
}

- (void)promptForLocalSecretWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, v0, v1, "\"%@: Prompting for local secret is not supported in this flow\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
