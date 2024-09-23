@implementation CDPInternalWalrusStateController

- (CDPInternalWalrusStateController)initWithAccount:(id)a3 cdpdAccount:(id)a4 securityProxy:(id)a5 pcsProxy:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  CDPInternalWalrusStateController *v16;

  v10 = (void *)MEMORY[0x24BDB4398];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "defaultStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CDPInternalWalrusStateController initWithAccount:cdpdAccount:securityProxy:pcsProxy:accountStore:](self, "initWithAccount:cdpdAccount:securityProxy:pcsProxy:accountStore:", v14, v13, v12, v11, v15);

  return v16;
}

- (CDPInternalWalrusStateController)initWithAccount:(id)a3 cdpdAccount:(id)a4 securityProxy:(id)a5 pcsProxy:(id)a6 accountStore:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CDPInternalWalrusStateController *v17;
  CDPInternalWalrusStateController *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CDPInternalWalrusStateController;
  v17 = -[CDPInternalWalrusStateController init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cdpAccount, a3);
    objc_storeStrong((id *)&v18->_securityProxy, a5);
    objc_storeStrong((id *)&v18->_pcsProxy, a6);
    objc_storeStrong((id *)&v18->_cdpDaemonAccount, a4);
    objc_storeStrong((id *)&v18->_accountStore, a7);
  }

  return v18;
}

- (unint64_t)_walrusStatusForPrimaryAccountWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  id v12;

  v12 = 0;
  -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:](self, "_eligiblePrimaryAccountForFlow:error:", 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    -[CDPAccount contextForPrimaryAccount](self->_cdpAccount, "contextForPrimaryAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPInternalWalrusStateController _optionsWithContext:](self, "_optionsWithContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[CDPInternalWalrusStateController _walrusStatusWithOptions:withError:](self, "_walrusStatusWithOptions:withError:", v8, a3);
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController _walrusStatusForPrimaryAccountWithError:].cold.1();

    if (a3)
      *a3 = objc_retainAutorelease(v6);
    v9 = -[CDPInternalWalrusStateController _statusForError:](self, "_statusForError:", v6);
  }

  return v9;
}

- (void)_walrusStatusForPrimaryAccountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"No eligible primary account found, cannot fetch walrus status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (unint64_t)_statusForError:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "code");
  if (v3 == -5304 || v3 == -5110)
    return 2;
  else
    return 0;
}

- (id)_eligiblePrimaryAccountForFlow:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CDPDAccount *cdpDaemonAccount;
  void *v15;
  id v16;

  -[CDPAccount primaryAppleAccount](self->_cdpAccount, "primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:].cold.1();
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    -[CDPAccount primaryAuthKitAccount](self->_cdpAccount, "primaryAuthKitAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_12;
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:].cold.3();
LABEL_9:

    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = -5102;
LABEL_19:
      objc_msgSend(v11, "cdp_errorWithCode:", v12);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!a3)
  {
    objc_msgSend(v7, "aa_cloudKitAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      _CDPLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:].cold.2();
      goto LABEL_9;
    }
  }
LABEL_12:
  if (-[CDPAccount primaryAccountSecurityLevel](self->_cdpAccount, "primaryAccountSecurityLevel") != 4)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = -5110;
      goto LABEL_19;
    }
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  cdpDaemonAccount = self->_cdpDaemonAccount;
  -[CDPAccount primaryAccountDSID](self->_cdpAccount, "primaryAccountDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(cdpDaemonAccount) = -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](cdpDaemonAccount, "isICDPEnabledForDSID:checkWithServer:", v15, 0);

  if ((cdpDaemonAccount & 1) == 0)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = -5304;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v16 = v8;
LABEL_21:

  return v16;
}

- (void)_eligiblePrimaryAccountForFlow:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"No Primary account.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (CDPInternalWalrusStateController)initWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CDPDAccount *v7;
  void *v8;
  id v9;
  CDPInternalWalrusStateController *v10;

  v4 = (void *)MEMORY[0x24BE1A3D0];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPDAccount initWithContext:]([CDPDAccount alloc], "initWithContext:", v5);

  +[CDPWalrusSecurityProxyImpl sharedInstance](CDPWalrusSecurityProxyImpl, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE1A470]);
  v10 = -[CDPInternalWalrusStateController initWithAccount:cdpdAccount:securityProxy:pcsProxy:](self, "initWithAccount:cdpdAccount:securityProxy:pcsProxy:", v6, v7, v8, v9);

  return v10;
}

- (unint64_t)_walrusStatusWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  id v13;

  v6 = a3;
  if (v6)
  {
    v13 = 0;
    -[CDPInternalWalrusStateController _eligibleAccountWithContext:checkWithServer:requireCKAccount:error:](self, "_eligibleAccountWithContext:checkWithServer:requireCKAccount:error:", v6, 0, 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v7)
    {
      -[CDPInternalWalrusStateController _optionsWithContext:](self, "_optionsWithContext:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CDPInternalWalrusStateController _walrusStatusWithOptions:withError:](self, "_walrusStatusWithOptions:withError:", v9, a4);

    }
    else
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CDPInternalWalrusStateController _walrusStatusWithContext:error:].cold.1();

      if (a4)
        *a4 = objc_retainAutorelease(v8);
      v10 = -[CDPInternalWalrusStateController _statusForError:](self, "_statusForError:", v8);
    }

  }
  else
  {
    v10 = -[CDPInternalWalrusStateController _walrusStatusForPrimaryAccountWithError:](self, "_walrusStatusForPrimaryAccountWithError:", a4);
  }

  return v10;
}

- (unint64_t)_walrusStatusWithOptions:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  CDPProtectedCloudStorageProxy *pcsProxy;
  int v13;
  id v14;
  uint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  id v25;
  uint8_t buf[4];
  os_signpost_id_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchAccountCleanupStatus", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = v8;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAccountCleanupStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  pcsProxy = self->_pcsProxy;
  v25 = 0;
  v13 = -[CDPProtectedCloudStorageProxy isWalrusEnabledWithOptions:error:](pcsProxy, "isWalrusEnabledWithOptions:error:", v6, &v25);

  v14 = v25;
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = objc_msgSend(v14, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v27) = v18;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v17, OS_SIGNPOST_INTERVAL_END, v8, "FetchAccountCleanupStatus", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v14, "code");
    *(_DWORD *)buf = 134218496;
    v27 = v8;
    v28 = 2048;
    v29 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v30 = 1026;
    v31 = v20;
    _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchAccountCleanupStatus  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  _CDPLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v14)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController _walrusStatusWithOptions:withError:].cold.1();

    v23 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v13;
      _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"Successfully fetched walrus status: (%{BOOL}d)\", buf, 8u);
    }

    if (v13)
      v23 = 1;
    else
      v23 = 2;
  }

  return v23;
}

- (void)walrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C81D6A0;
  aBlock[4] = self;
  v19 = v7;
  v9 = v7;
  v10 = _Block_copy(aBlock);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_2;
  v16[3] = &unk_24C81D6C8;
  v16[4] = self;
  v17 = v6;
  v11 = v6;
  v12 = _Block_copy(v16);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_3;
  v15[3] = &unk_24C81D6F0;
  v15[4] = self;
  v13 = _Block_copy(v15);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFC630]), "initWithMaxRetries:", 1);
  objc_msgSend(v14, "scheduleTask:shouldRetry:completionHandler:", v12, v13, v10);

}

void __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v7 = a2;
  v5 = a3;
  v6 = v7;
  if (!v7 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_statusForError:", v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v6, "unsignedIntegerValue"), v5);

}

void __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (**v4)(id, void *, id);
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = a2;
  v5 = objc_msgSend(v2, "_walrusStatusWithContext:error:", v3, &v8);
  v6 = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, v6);

}

uint64_t __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldRetryForError:", a2);
}

- (id)_combinedWalrusStatusWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;

  v6 = a3;
  if (v6)
  {
    v13 = 0;
    -[CDPInternalWalrusStateController _eligibleAccountWithContext:checkWithServer:requireCKAccount:error:](self, "_eligibleAccountWithContext:checkWithServer:requireCKAccount:error:", v6, 0, 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v7)
    {
      -[CDPInternalWalrusStateController _optionsWithContext:](self, "_optionsWithContext:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:](self, "_combinedWalrusStatusWithOptions:context:error:", v9, v6, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithContext:error:].cold.1();

      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  else
  {
    -[CDPInternalWalrusStateController _combinedWalrusStatusForPrimaryAccountWithError:](self, "_combinedWalrusStatusForPrimaryAccountWithError:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_combinedWalrusStatusForPrimaryAccountWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;

  v12 = 0;
  -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:](self, "_eligiblePrimaryAccountForFlow:error:", 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    -[CDPAccount contextForPrimaryAccount](self->_cdpAccount, "contextForPrimaryAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPInternalWalrusStateController _optionsWithContext:](self, "_optionsWithContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:](self, "_combinedWalrusStatusWithOptions:context:error:", v8, v7, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController _combinedWalrusStatusForPrimaryAccountWithError:].cold.1();

    v9 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v9;
}

- (id)_combinedWalrusStatusWithOptions:(id)a3 context:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = (objc_class *)MEMORY[0x24BE1A3F0];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v34 = 0;
  v12 = -[CDPInternalWalrusStateController _walrusStatusWithOptions:withError:](self, "_walrusStatusWithOptions:withError:", v10, &v34);

  v13 = v34;
  objc_msgSend(v11, "setOctagonWalrusStatus:", v12);
  v33 = 0;
  -[CDPInternalWalrusStateController _fetchiCDPAccountInfoDictionaryWithContext:error:](self, "_fetchiCDPAccountInfoDictionaryWithContext:error:", v9, &v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v33;
  if (v15)
  {
    if (!v13)
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.7();

      v17 = v15;
      if (!a5)
        goto LABEL_12;
LABEL_11:
      *a5 = objc_retainAutorelease(v17);
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v11, "setPcsWalrusStatus:", -[CDPInternalWalrusStateController _pcsAccountInfoStatusUsingICDP:](self, "_pcsAccountInfoStatusUsingICDP:", v14));
    objc_msgSend(v11, "setEscrowWalrusStatus:", -[CDPInternalWalrusStateController _escrowedKeysStatusUsingICDP:](self, "_escrowedKeysStatusUsingICDP:", v14));
    if (!v13)
      goto LABEL_12;
  }
  _CDPLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.6();

  v17 = v13;
  if (a5)
    goto LABEL_11;
LABEL_12:
  v19 = objc_msgSend(v11, "mismatchDetected");
  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.1();
  }
  else
  {
    if (v21)
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.5();

    +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hasPendingFollowUpWithUniqueIdentifier:", CFSTR("com.apple.CDPFollowUpIdentifier.adpStateHealing"));

    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v24)
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.3();

      +[CDPDFollowUpController sharedInstance](CDPDFollowUpController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1A428], "contextForADPStateHealing");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v27 = objc_msgSend(v25, "clearFollowUpWithContext:error:", v26, &v32);
      v20 = v32;

      _CDPLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.2(v27, v20, v28);

    }
    else if (v24)
    {
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.4();
    }
  }

  _CDPLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_log_impl(&dword_20DB2C000, v29, OS_LOG_TYPE_DEFAULT, "\"Walrus state: %@\", buf, 0xCu);
  }

  v30 = v11;
  return v30;
}

- (void)repairWalrusStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CDPInternalWalrusStateController *v13;
  id v14;
  id v15;
  __int128 *p_buf;
  id v17;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:](self, "_eligiblePrimaryAccountForFlow:error:", 1, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Repairing status for account %@, initiating silent auth.\", (uint8_t *)&buf, 0xCu);
    }

    v9 = (void *)os_transaction_create();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5;
    v21 = __Block_byref_object_dispose__5;
    v22 = (id)objc_opt_new();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke;
    v11[3] = &unk_24C81D718;
    v10 = v9;
    v12 = v10;
    p_buf = &buf;
    v15 = v4;
    v13 = self;
    v14 = v5;
    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:](CDPAuthenticationHelper, "silentAuthenticationForPrimaryAccountWithCompletion:", v11);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController repairWalrusStatusWithCompletion:].cold.1();

    if (v4)
      (*((void (**)(id, id))v4 + 2))(v4, v6);
  }

}

void __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "reportRepairAttemptFailedDueToAuthenticationError:", v6);
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Silent auth completed, continuing walrus repair.\", buf, 2u);
  }

  v41 = v5;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_optionsWithContext:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 40);
  v46 = 0;
  v37 = objc_msgSend(v12, "_walrusStatusWithOptions:withError:", v11, &v46);
  v39 = v46;
  v13 = *(void **)(a1 + 40);
  v45 = 0;
  objc_msgSend(v13, "_fetchiCDPAccountInfoDictionaryWithContext:error:", v10, &v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  v38 = v45;
  if (!v38)
  {
    v15 = objc_msgSend(*(id *)(a1 + 40), "_pcsAccountInfoStatusUsingICDP:", v14);
    v16 = objc_msgSend(*(id *)(a1 + 40), "_escrowedKeysStatusUsingICDP:", v14);
  }
  v35 = v15;
  v17 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v19 = objc_msgSend(v17, "repairWalrusWithAccountIdentifier:options:error:", v18, v11, &v44);
  v20 = v44;

  v21 = *(void **)(a1 + 40);
  v43 = 0;
  v40 = (void *)v11;
  v22 = objc_msgSend(v21, "_walrusStatusWithOptions:withError:", v11, &v43);
  v36 = v43;
  v23 = *(void **)(a1 + 40);
  v42 = 0;
  v24 = (void *)v10;
  objc_msgSend(v23, "_fetchiCDPAccountInfoDictionaryWithContext:error:", v10, &v42);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v42;

  v27 = 0;
  v28 = 0;
  if (!v26)
  {
    v27 = objc_msgSend(*(id *)(a1 + 40), "_pcsAccountInfoStatusUsingICDP:", v25);
    v28 = objc_msgSend(*(id *)(a1 + 40), "_escrowedKeysStatusUsingICDP:", v25);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "reportRepairAttemptFinishedWithSuccess:authenticationError:accountInfoFetchErrorBeforeRepair:repairError:accountInfoFetchErrorAfterRepair:octagonStatusBefore:octagonStatusAfter:pcsStatusBefore:pcsStatusAfter:escrowKeysStatusBefore:escrowKeysStatusAfter:", v19, 0, v38, v20, v26, v37, v22, v35, v27, v16, v28);
  _CDPLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v19)
  {
    v5 = v41;
    if (v30)
    {
      *(_WORD *)buf = 0;
      v31 = "\"Repair completed successfully\";
      v32 = v29;
      v33 = 2;
LABEL_17:
      _os_log_impl(&dword_20DB2C000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
    }
  }
  else
  {
    v5 = v41;
    if (v30)
    {
      *(_DWORD *)buf = 138412290;
      v48 = v20;
      v31 = "\"Repair completed with error: %@\";
      v32 = v29;
      v33 = 12;
      goto LABEL_17;
    }
  }

  v34 = *(_QWORD *)(a1 + 56);
  if (v34)
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v20);

LABEL_21:
}

- (id)_fetchiCDPAccountInfoDictionaryWithContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CDPDSecureBackupProxyImpl *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a3;
  +[CDPDSecureBackupConfiguration configurationWithContext:](CDPDSecureBackupConfiguration, "configurationWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountInfoFetchSetupDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPInternalWalrusStateController _fetchiCDPAccountInfoDictionaryWithContext:error:].cold.2((uint64_t)v7);

  v9 = -[CDPDSecureBackupProxyImpl initWithContext:]([CDPDSecureBackupProxyImpl alloc], "initWithContext:", v5);
  -[CDPDSecureBackupProxyImpl accountInfoWithInfo:error:](v9, "accountInfoWithInfo:error:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SecureBackupStingrayMetadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SecureBackupiCloudDataProtection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[CDPInternalWalrusStateController _fetchiCDPAccountInfoDictionaryWithContext:error:].cold.1((uint64_t)v13);

  return v13;
}

- (unint64_t)_pcsAccountInfoStatusUsingICDP:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kPCSMetadataiCDPWalrus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v3, "BOOLValue"))
        v4 = 1;
      else
        v4 = 2;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (unint64_t)_escrowedKeysStatusUsingICDP:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kPCSMetadataEscrowedKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (void)setWalrusStatusEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  CDPInternalWalrusStateController *v19;
  id v20;
  id v21;
  BOOL v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v23 = 0;
  -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:](self, "_eligiblePrimaryAccountForFlow:error:", 1, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  if (v7)
  {
    v9 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aa_altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPInternalWalrusStateController _setAccountTelemetryOptInConfig:altDSID:authController:accountManager:completion:](self, "_setAccountTelemetryOptInConfig:altDSID:authController:accountManager:completion:", v4, v11, v9, v10, &__block_literal_global_8);

    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[CDPAccount primaryAccountAltDSID](self->_cdpAccount, "primaryAccountAltDSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Updating Walrus status for account %@, initiating silent auth.\", buf, 0xCu);

    }
    v14 = (void *)os_transaction_create();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __70__CDPInternalWalrusStateController_setWalrusStatusEnabled_completion___block_invoke_55;
    v17[3] = &unk_24C81D7A8;
    v18 = v14;
    v21 = v6;
    v19 = self;
    v22 = v4;
    v20 = v7;
    v15 = v14;
    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:](CDPAuthenticationHelper, "silentAuthenticationForPrimaryAccountWithCompletion:", v17);

  }
  else
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CDPInternalWalrusStateController repairWalrusStatusWithCompletion:].cold.1();

    if (v6)
      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v8);
  }

}

void __70__CDPInternalWalrusStateController_setWalrusStatusEnabled_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Silent auth completed, continuing walrus update.\", buf, 2u);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
    v11 = *(unsigned __int8 *)(a1 + 64);
    v13 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __70__CDPInternalWalrusStateController_setWalrusStatusEnabled_completion___block_invoke_56;
    v16[3] = &unk_24C81D780;
    v14 = *(void **)(a1 + 32);
    v16[4] = v13;
    v17 = v10;
    v18 = v14;
    v19 = *(id *)(a1 + 56);
    v15 = v10;
    objc_msgSend(v13, "_updateWalrusStateAndPerformPostEnablementActions:context:account:completion:", v11, v15, v12, v16);

  }
}

void __70__CDPInternalWalrusStateController_setWalrusStatusEnabled_completion___block_invoke_56(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_optionsWithContext:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(v7, "_combinedWalrusStatusWithOptions:context:error:", v6, v8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Walrus state after update attempt: %@\", buf, 0xCu);
  }

  if (a2)
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
      v13();
    }
  }
  else
  {
    if (!v5)
    {
      _CDPStateError();
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_10;
    }
  }

}

- (void)_setAccountTelemetryOptInConfig:(BOOL)a3 altDSID:(id)a4 authController:(id)a5 accountManager:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void (**v26)(id, _QWORD, void *);
  char v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, void *))a7;
  v15 = (void *)os_transaction_create();
  objc_msgSend(v13, "authKitAccountWithAltDSID:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5108);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v23);

    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = objc_msgSend(v13, "accountAccessTelemetryOptInForAccount:", v16);
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v29 = v17;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Is opted-in = %{BOOL}d\", buf, 8u);
    }

    if (a3)
      goto LABEL_10;
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"ADP was not enabled, so Telemetry collection was opted-out\", buf, 2u);
    }

    objc_msgSend(v13, "setAccountAccessTelemetryOptIn:forAccount:error:", 0, v16, 0);
  }
  v17 = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x24BE0AB38];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke;
  v24[3] = &unk_24C81C5A8;
  v25 = v15;
  v27 = v17;
  v26 = v14;
  objc_msgSend(v12, "setConfigurationInfo:forIdentifier:forAltDSID:completion:", v21, v22, v11, v24);

LABEL_12:
}

void __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 48);
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Set Account Telemetry Opt-In Value to %{BOOL}d\", (uint8_t *)v12, 8u);
    }

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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke_cold_1(a1, (uint64_t)v5, v7);

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }

}

- (void)webAccessStatusWithCompletion:(id)a3
{
  -[CDPWalrusSecurityProxy webAccessStatusWithCompletion:](self->_securityProxy, "webAccessStatusWithCompletion:", a3);
}

- (void)setWebAccessStatusEnabled:(BOOL)a3 completion:(id)a4
{
  -[CDPWalrusSecurityProxy setWebAccessStatusEnabled:completion:](self->_securityProxy, "setWebAccessStatusEnabled:completion:", a3, a4);
}

- (id)_eligibleAccountWithContext:(id)a3 checkWithServer:(BOOL)a4 requireCKAccount:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BE1A3D0];
    objc_msgSend(v8, "dsid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "altDSIDForPersonID:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BE1A3D0], "appleAccountForAltDSID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    if (a6)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = -5108;
LABEL_16:
      objc_msgSend(v17, "cdp_errorWithCode:", v18);
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  if (v7)
  {
    objc_msgSend(v13, "aa_cloudKitAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      _CDPLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CDPInternalWalrusStateController _eligibleAccountWithContext:checkWithServer:requireCKAccount:error:].cold.1();

      if (a6)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = -5102;
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
  if ((objc_msgSend(MEMORY[0x24BE1A3D0], "isHSA2Enabled:", v9) & 1) == 0)
  {
    if (a6)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = -5110;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v16 = v14;
LABEL_18:

  return v16;
}

- (BOOL)_shouldRetryForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE1A368]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    v7 = v6 != -5110 && v6 != -5102;
    v8 = v6 != -5304 && v7;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_updateWalrusStateAndPerformPostEnablementActions:(BOOL)a3 context:(id)a4 account:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[16];

  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Walrus state change initiated...\", buf, 2u);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke;
  v16[3] = &unk_24C81D820;
  v19 = v8;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v14 = v11;
  v15 = v10;
  -[CDPInternalWalrusStateController _updateWalrusState:context:account:completion:](self, "_updateWalrusState:context:account:completion:", v8, v12, v15, v16);

}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  char v21;
  uint8_t buf[16];

  v5 = a3;
  if (a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Walrus status change succeeded, notifying downstream systems...\", buf, 2u);
    }

    v7 = (void *)os_transaction_create();
    v8 = v7;
    v9 = *(_BYTE *)(a1 + 56);
    v10 = MEMORY[0x24BDAC760];
    if (v9)
    {
      v11 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_62;
      v19[3] = &unk_24C81D7D0;
      v21 = v9;
      v20 = v7;
      objc_msgSend(v11, "setWebAccessStatusEnabled:completion:", 0, v19);

    }
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_64;
    v17[3] = &unk_24C81D7F8;
    v14 = v8;
    v18 = v14;
    objc_msgSend(v13, "renewCredentialsForAccount:completion:", v12, v17);
    +[CDPBroadcaster broadcastWalrusStateChangeNotification](CDPBroadcaster, "broadcastWalrusStateChangeNotification");
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v15 + 16))(v15, 1, 0);

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 48);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v5);
  }

}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_62_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    v7 = *(_BYTE *)(a1 + 40) == 0;
    v8[0] = 67109376;
    v8[1] = v6;
    v9 = 1024;
    v10 = v7;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"After updating walrus state to %{BOOL}d, successfully updated web access status to %{BOOL}d\", (uint8_t *)v8, 0xEu);
  }

}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = a2;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Renew credentials completed with result %tu, with error: %@\", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_updateWalrusState:(BOOL)a3 context:(id)a4 account:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  void *v13;
  CDPProtectedCloudStorageProxy *pcsProxy;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  CDPInternalWalrusStateController *v22;
  id v23;
  void (**v24)(id, uint64_t, _QWORD);
  BOOL v25;
  uint8_t buf[8];
  id v27;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  -[CDPInternalWalrusStateController _optionsWithContext:](self, "_optionsWithContext:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  pcsProxy = self->_pcsProxy;
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v16 = -[CDPProtectedCloudStorageProxy setWalrusEnabled:accountIdentifier:options:error:](pcsProxy, "setWalrusEnabled:accountIdentifier:options:error:", v8, v15, v13, &v27);
  v17 = v27;

  if (v16)
  {
    if (v12)
LABEL_3:
      v12[2](v12, 1, 0);
  }
  else if (v8 && objc_msgSend(v17, "code") == 159)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Dropped keys successfully, this error means success for mismatched state\", buf, 2u);
    }

    if (v12)
      goto LABEL_3;
  }
  else
  {
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"Walrus state update failed... try again\", buf, 2u);
    }

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke;
    v20[3] = &unk_24C81D848;
    v21 = v10;
    v22 = self;
    v25 = v8;
    v23 = v11;
    v24 = v12;
    +[CDPAuthenticationHelper silentAuthenticationForContext:withCompletion:](CDPAuthenticationHelper, "silentAuthenticationForContext:withCompletion:", v21, v20);

  }
}

void __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithAuthenticationResults:", v5);
  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 40), "_optionsWithContext:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v10 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12 = objc_msgSend(v9, "setWalrusEnabled:accountIdentifier:options:error:", v10, v11, v8, &v15);
  v13 = v15;

  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v12, v13);

}

- (id)_optionsWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE1A468], "setupDictionaryWithContext:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_cdpDaemonAccount, 0);
  objc_storeStrong((id *)&self->_cdpAccount, 0);
  objc_storeStrong((id *)&self->_pcsProxy, 0);
  objc_storeStrong((id *)&self->_securityProxy, 0);
}

- (void)_walrusStatusWithContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Account not eligible, cannot fetch walrus status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_walrusStatusWithOptions:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to fetch walrus status with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_combinedWalrusStatusWithContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Account not eligible, cannot fetch walrus matched status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_combinedWalrusStatusForPrimaryAccountWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"No eligible primary account found, cannot fetch walrus matched status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Walrus state mismatch detected\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_combinedWalrusStatusWithOptions:(char)a1 context:(void *)a2 error:(NSObject *)a3 .cold.2(char a1, void *a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a1 & 1;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl(&dword_20DB2C000, a3, OS_LOG_TYPE_DEBUG, "\"Did Clear Pending ADPStateHealing CFU? %d with error: %@\", (uint8_t *)v6, 0x12u);

}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Pending ADPStateHealing CFU found. Dismissing...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"No Pending ADPStateHealing CFU found. Continuing to Return combined walrus status\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Walrus state mismatch NOT detected. Checking if there is a pending ADPStateHealing CFU posted...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Walrus octagon state error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Walrus stingray state error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)repairWalrusStatusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"No eligible primary account found, cannot update walrus status: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to perform silent auth with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_fetchiCDPAccountInfoDictionaryWithContext:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "\"Fetched iCDP dictionary: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)_fetchiCDPAccountInfoDictionaryWithContext:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  +[CDPDSecureBackupController _sanitizedInfoDictionary:](CDPDSecureBackupController, "_sanitizedInfoDictionary:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_20DB2C000, v2, v3, "\"Fetched account info with %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"Did not set Account Telemetry Opt-In Value to %{BOOL}d with error: %@\", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)_eligibleAccountWithContext:checkWithServer:requireCKAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Account has no CloudKit account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_eligiblePrimaryAccountForFlow:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Primary account has no CloudKit account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_eligiblePrimaryAccountForFlow:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Primary account has no AuthKit account\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"After successfully updating walrus state to ON, failed to update web access state to OFF with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Silent re-authentication prior to Walrus re-try failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
