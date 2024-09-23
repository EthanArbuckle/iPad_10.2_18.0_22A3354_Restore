@implementation CDPDDeviceSecretValidator

- (CDPDDeviceSecretValidator)init
{
  CDPDDeviceSecretValidator *v2;
  uint64_t v3;
  NSMutableDictionary *failedSecrets;
  uint64_t v5;
  NSMutableDictionary *recoveryErrors;
  uint64_t v7;
  NSMutableSet *failedRecoveryKeys;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CDPDDeviceSecretValidator;
  v2 = -[CDPDDeviceSecretValidator init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    failedSecrets = v2->_failedSecrets;
    v2->_failedSecrets = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    recoveryErrors = v2->_recoveryErrors;
    v2->_recoveryErrors = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    failedRecoveryKeys = v2->_failedRecoveryKeys;
    v2->_failedRecoveryKeys = (NSMutableSet *)v7;

  }
  return v2;
}

- (CDPDDeviceSecretValidator)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CDPDDeviceSecretValidator *v9;
  CDPDDeviceSecretValidator *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[CDPDDeviceSecretValidator init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)_attemptToRecoverDevice:(id)a3 withSecret:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, CDPDSecureBackupContext *);
  NSObject *v11;
  CDPDSecureBackupContext *v12;
  id WeakRetained;
  char v14;
  id v15;
  id v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD, CDPDSecureBackupContext *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, CDPDSecureBackupContext *))a5;
  if (-[CDPDDeviceSecretValidator _isFailedSecret:forDevice:](self, "_isFailedSecret:forDevice:", v9, v8))
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CDPDDeviceSecretValidator _attemptToRecoverDevice:withSecret:completion:].cold.1();

    _CDPStateError();
    v12 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);
  }
  else
  {
    v12 = objc_alloc_init(CDPDSecureBackupContext);
    -[CDPDSecureBackupContext setDevice:](v12, "setDevice:", v8);
    -[CDPDSecureBackupContext setRecoverySecret:](v12, "setRecoverySecret:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "secretValidatorWillAttemptRecovery");

    }
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke;
    v17[3] = &unk_24C81C898;
    v17[4] = self;
    v18 = v10;
    objc_msgSend(v16, "secretValidator:recoverSecureBackupWithContext:completion:", self, v12, v17);

  }
}

void __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 0;
      v10 = objc_msgSend(v8, "secretValidator:shouldAcceptRecoveryError:", v9, &v13);
      v11 = v13;

      if ((v10 & 1) == 0)
      {
        _CDPLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke_cold_1();

      }
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)_attemptToRecoverWithRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, CDPDSecureBackupContext *);
  NSObject *v8;
  CDPDSecureBackupContext *v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;
  _QWORD v14[5];
  void (**v15)(id, _QWORD, CDPDSecureBackupContext *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, CDPDSecureBackupContext *))a4;
  if (-[NSMutableSet containsObject:](self->_failedRecoveryKeys, "containsObject:", v6))
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDDeviceSecretValidator _attemptToRecoverWithRecoveryKey:completion:].cold.1();

    _CDPStateError();
    v9 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
  }
  else
  {
    v9 = objc_alloc_init(CDPDSecureBackupContext);
    -[CDPDSecureBackupContext setRecoveryKey:](v9, "setRecoveryKey:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "secretValidatorWillAttemptRecovery");

    }
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__CDPDDeviceSecretValidator__attemptToRecoverWithRecoveryKey_completion___block_invoke;
    v14[3] = &unk_24C81C898;
    v14[4] = self;
    v15 = v7;
    objc_msgSend(v13, "secretValidator:recoverSecureBackupWithContext:completion:", self, v9, v14);

  }
}

void __73__CDPDDeviceSecretValidator__attemptToRecoverWithRecoveryKey_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
      v9 = *(_QWORD *)(a1 + 32);
      v13 = 0;
      v10 = objc_msgSend(v8, "secretValidator:shouldAcceptRecoveryError:", v9, &v13);
      v11 = v13;

      if ((v10 & 1) == 0)
      {
        _CDPLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke_cold_1();

      }
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)validateRecoveryKey:(id)a3 withCompletion:(id)a4
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
  v10[2] = __64__CDPDDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke;
  v10[3] = &unk_24C81CFD0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CDPDDeviceSecretValidator _attemptToRecoverWithRecoveryKey:completion:](self, "_attemptToRecoverWithRecoveryKey:completion:", v9, v10);

}

void __64__CDPDDeviceSecretValidator_validateRecoveryKey_withCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = (id *)a1[4];
  if (v5)
  {
    objc_msgSend(v6[4], "addObject:", a1[5]);
    v7 = a1[6];
    if (v7)
      (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v7 + 16))(v7, 0, 1, v5);
  }
  else
  {
    objc_msgSend(v6, "_handleMultiCSCRecoveryResults:clique:type:secret:device:completion:", v8, 0, 5, a1[5], 0, a1[6]);
  }

}

- (void)validateSecret:(id)a3 devices:(id)a4 type:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  CDPDevice *v15;
  CDPDevice *currentDevice;
  CDPDevice *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[CDPDDeviceSecretValidator isUsingMultipleICSC](self, "isUsingMultipleICSC"))
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CDPDDeviceSecretValidator validateSecret:devices:type:withCompletion:].cold.1();

    self->_isAttemptingRecovery = 1;
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v14, "firstObject");
    v15 = (CDPDevice *)objc_claimAutoreleasedReturnValue();
    currentDevice = self->_currentDevice;
    self->_currentDevice = v15;

    v17 = self->_currentDevice;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__CDPDDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke;
    v19[3] = &unk_24C81CFF8;
    v19[4] = self;
    v24 = a5;
    v20 = v10;
    v23 = v12;
    v21 = v11;
    v22 = v14;
    v18 = v14;
    -[CDPDDeviceSecretValidator _attemptToRecoverDevice:withSecret:completion:](self, "_attemptToRecoverDevice:withSecret:completion:", v17, v20, v19);

  }
  else
  {
    self->_isAttemptingRecovery = 1;
    -[CDPDDeviceSecretValidator _performSingleiCSCRecoveryWithSecret:type:completion:](self, "_performSingleiCSCRecoveryWithSecret:type:completion:", v10, a5, v12);
  }

}

void __72__CDPDDeviceSecretValidator_validateSecret_devices_type_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(a1 + 32);
  if (!a3)
  {
    objc_msgSend(v4, "_handleMultiCSCRecoveryResults:clique:type:secret:device:completion:", a2, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), v4[9], *(_QWORD *)(a1 + 64));
    return;
  }
  objc_msgSend(v4, "_handleMultiCSCRecoveryFailureForDevice:recoveryError:secret:", v4[9], a3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "remainingAttempts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Remaining attempts: %@\", (uint8_t *)&v13, 0xCu);

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "remainingAttempts"))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 56))
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 48);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Depleted remaining attempts for multiple-iCSC entry (%@)\", (uint8_t *)&v13, 0xCu);
    }

    v8 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 56), "removeObject:", *(_QWORD *)(v8 + 72));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "secretValidator:shouldContinueValidationAfterError:", *(_QWORD *)(a1 + 32), v5))
  {

    goto LABEL_15;
  }
  v12 = objc_msgSend(*(id *)(a1 + 56), "count");

  if (!v12)
  {
LABEL_15:
    objc_msgSend(*(id *)(a1 + 32), "_handleRecoveryFailureForFinalDevice:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_QWORD *)(a1 + 64));
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "validateSecret:devices:type:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
LABEL_16:

}

- (void)_handleRecoveryFailureForFinalDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id WeakRetained;
  char v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void (**validSecretHandler)(id, _QWORD, void *);
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  NSObject *v27;
  void (**v28)(id, _QWORD, void *);
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Un-set _isAttemptingRecovery to resume acting upon circle changes after failed multiple iCSC recovery\", buf, 2u);
  }

  self->_isAttemptingRecovery = 0;
  if ((-[CDPContext idmsRecovery](self->_context, "idmsRecovery") & 1) != 0
    || (-[CDPContext findMyiPhoneUUID](self->_context, "findMyiPhoneUUID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"Redirecting error to the delegate\", buf, 2u);
      }

      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = (void *)-[NSMutableDictionary copy](self->_recoveryErrors, "copy");
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke;
      v31[3] = &unk_24C81CF50;
      v31[4] = self;
      v32 = v7;
      objc_msgSend(v14, "secretValidator:didFailRecoveryWithErrors:completion:", self, v15, v31);

      v16 = v32;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CDPDDeviceSecretValidator _handleRecoveryFailureForFinalDevice:completion:].cold.1();

      validSecretHandler = (void (**)(id, _QWORD, void *))self->_validSecretHandler;
      _CDPStateError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      validSecretHandler[2](validSecretHandler, 0, v16);
    }
  }
  else
  {
    v18 = self->_failedAttempts + 1;
    self->_failedAttempts = v18;
    v19 = v18 > 2;
    v20 = -5200;
    if (v19)
      v20 = -5203;
    if (self->_depletedRemainingAttempts)
      v21 = -5206;
    else
      v21 = v20;
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:userInfo:", v21, self->_recoveryErrors);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"Reaching out to the delegate for error handling\", buf, 2u);
    }

    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_27;
      v29[3] = &unk_24C81CF50;
      v29[4] = self;
      v30 = v7;
      objc_msgSend(v25, "secretValidator:didFailRecovery:withError:completion:", self, v6, v16, v29);

      v26 = v30;
    }
    else
    {
      _CDPLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CDPDDeviceSecretValidator _handleRecoveryFailureForFinalDevice:completion:].cold.1();

      v28 = (void (**)(id, _QWORD, void *))self->_validSecretHandler;
      _CDPStateError();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2](v28, 0, v26);
    }

  }
  -[NSMutableDictionary removeAllObjects](self->_recoveryErrors, "removeAllObjects");

}

void __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v7 + 16))(v7, 0, a2, v5);
  if ((a2 & 1) == 0 && (objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5206) & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v5, "code"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);

  }
}

void __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_cold_1();

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v7 + 16))(v7, 0, a2, v5);
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1A368]);

  if (v9)
  {
    v10 = objc_msgSend(v5, "code");
    if (v10 == -5308)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      _CDPStateError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
    else if (v10 == -5222 || v10 == -5307)
    {
      objc_msgSend(*(id *)(a1 + 32), "cancelValidationWithError:", v5);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;

}

- (void)cancelValidationWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  char v7;
  id v8;
  CDPDevice *currentDevice;
  void *v10;
  CDPDRemoteSecretValidationResult *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"cancelValidationWithError was called\", buf, 2u);
  }

  if (objc_msgSend(v4, "isLoginHardLimit"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      currentDevice = self->_currentDevice;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __55__CDPDDeviceSecretValidator_cancelValidationWithError___block_invoke;
      v13[3] = &unk_24C81C618;
      v13[4] = self;
      objc_msgSend(v8, "secretValidator:didFailRecovery:withError:completion:", self, currentDevice, v4, v13);
LABEL_10:

      goto LABEL_11;
    }
  }
  -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    v8 = v11;
    if (v4)
      -[CDPDRemoteSecretValidationResult setUserDidCancel:](v11, "setUserDidCancel:", 1);
    -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v12)[2](v12, v8, v4);

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __55__CDPDDeviceSecretValidator_cancelValidationWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDelegateValidationError:");
}

- (void)_handleDelegateValidationError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CDPDRemoteSecretValidationResult *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1A368]);

  if (!v6)
  {
LABEL_6:
    -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_9;
    -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
    v9 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v4);
LABEL_8:

    goto LABEL_9;
  }
  v7 = objc_msgSend(v4, "code");
  if (v7 == -5210)
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20DB2C000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "\"Event handled, skipping call to valid secret handler\", v13, 2u);
    }
    goto LABEL_8;
  }
  if (v7 != -5208)
  {
    if (v7 == -5209)
    {
      -[CDPDDeviceSecretValidator approveFromAnotherDeviceWithCompletion:](self, "approveFromAnotherDeviceWithCompletion:", 0);
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v10 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  -[CDPDRemoteSecretValidationResult setUserDidReset:](v10, "setUserDidReset:", 1);
  -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CDPDDeviceSecretValidator validSecretHandler](self, "validSecretHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CDPDRemoteSecretValidationResult *, id))v12)[2](v12, v10, v4);

  }
LABEL_9:

}

- (id)_handleMultiCSCRecoveryFailureForDevice:(id)a3 recoveryError:(id)a4 secret:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  if (-[CDPDDeviceSecretValidator _isInvalidICSCError:](self, "_isInvalidICSCError:", v11))
  {
    objc_msgSend(v8, "setRemainingAttempts:", objc_msgSend(v8, "remainingAttempts") - 1);
    -[CDPDDeviceSecretValidator _failedSecretsForDevice:](self, "_failedSecretsForDevice:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE1A368]);

    v15 = v11;
    if ((v14 & 1) == 0)
    {
      v18 = *MEMORY[0x24BDD1398];
      v19[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _CDPStateError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (objc_msgSend(v11, "code") == 14 || (v15 = v11, objc_msgSend(v11, "code") == 14))
  {
    objc_msgSend(v8, "setRemainingAttempts:", 0);
    v15 = v11;
  }
  -[NSMutableDictionary setObject:forKey:](self->_recoveryErrors, "setObject:forKey:", v15, v8);

  return v15;
}

- (id)_failedSecretsForDevice:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_failedSecrets, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_failedSecrets, "setObject:forKeyedSubscript:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_failedSingleICSCs
{
  NSMutableSet *failedSingleICSCs;
  NSMutableSet *v4;
  NSMutableSet *v5;

  failedSingleICSCs = self->_failedSingleICSCs;
  if (!failedSingleICSCs)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_failedSingleICSCs;
    self->_failedSingleICSCs = v4;

    failedSingleICSCs = self->_failedSingleICSCs;
  }
  return failedSingleICSCs;
}

- (BOOL)_isFailedSecret:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *failedSecrets;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    failedSecrets = self->_failedSecrets;
    objc_msgSend(v7, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](failedSecrets, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v6);

  }
  else
  {
    v12 = -[NSMutableSet containsObject:](self->_failedSingleICSCs, "containsObject:", v6);
  }

  return v12;
}

- (void)_handleMultiCSCRecoveryResults:(id)a3 clique:(id)a4 type:(unint64_t)a5 secret:(id)a6 device:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  CDPDRemoteSecretValidationResult *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a8;
  -[NSMutableDictionary removeAllObjects](self->_recoveryErrors, "removeAllObjects");
  if (v15)
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v15 + 2))(v15, 1, 0, 0);
  if (self->_validSecretHandler)
  {
    v16 = objc_alloc_init(CDPDRemoteSecretValidationResult);
    -[CDPDRemoteSecretValidationResult setDevice:](v16, "setDevice:", v14);
    -[CDPDRemoteSecretValidationResult setValidSecret:](v16, "setValidSecret:", v13);
    -[CDPDRemoteSecretValidationResult setSecretType:](v16, "setSecretType:", a5);
    objc_msgSend(v19, "recoveredInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRemoteSecretValidationResult setRecoveredInfo:](v16, "setRecoveredInfo:", v17);

    objc_msgSend(v19, "recoveredClique");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDRemoteSecretValidationResult setRecoveredClique:](v16, "setRecoveredClique:", v18);

    (*((void (**)(void))self->_validSecretHandler + 2))();
  }

}

- (void)_performSingleiCSCRecoveryWithSecret:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke;
  v12[3] = &unk_24C81D020;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[CDPDDeviceSecretValidator _attemptToRecoverDevice:withSecret:completion:](self, "_attemptToRecoverDevice:withSecret:completion:", 0, v10, v12);

}

void __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  CDPDRemoteSecretValidationResult *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_isInvalidICSCError:", v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "_failedSingleICSCs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));

    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_2();

    if (*(_QWORD *)(a1 + 48))
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) <= 2uLL)
        v9 = -5200;
      else
        v9 = -5203;
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(_QWORD, _QWORD, BOOL, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) < 3uLL, v10);

    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) >= 3uLL)
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_1();

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
      {
        CDPLocalizedString();
        v12 = (CDPDRemoteSecretValidationResult *)objc_claimAutoreleasedReturnValue();
        CDPLocalizedString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v12)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FC8]);
        if (v13)
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FD8]);
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        v17 = (void *)objc_msgSend(v15, "copy");
        _CDPStateError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v18);

        goto LABEL_24;
      }
    }
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 48);
    if (v19)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v19 + 16))(v19, 1, 0, 0);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
    {
      v12 = objc_alloc_init(CDPDRemoteSecretValidationResult);
      -[CDPDRemoteSecretValidationResult setValidSecret:](v12, "setValidSecret:", *(_QWORD *)(a1 + 40));
      -[CDPDRemoteSecretValidationResult setSecretType:](v12, "setSecretType:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v5, "recoveredInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDRemoteSecretValidationResult setRecoveredInfo:](v12, "setRecoveredInfo:", v20);

      objc_msgSend(v5, "recoveredClique");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPDRemoteSecretValidationResult setRecoveredClique:](v12, "setRecoveredClique:", v21);

      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
LABEL_24:

    }
  }

}

- (void)supportedEscapeOfferMaskCompletion:(id)a3
{
  id v5;

  if (a3)
  {
    v5 = a3;
    (*((void (**)(id, unint64_t))a3 + 2))(v5, -[CDPDDeviceSecretValidator supportedEscapeOfferMask](self, "supportedEscapeOfferMask"));

  }
}

- (void)approveFromAnotherDeviceWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)validateCustodianRecoveryInfo:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)attemptToJoinCircleWithPiggybacking:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (BOOL)_isInvalidICSCError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE17C10]))
    v5 = objc_msgSend(v3, "code") == 26;
  else
    v5 = 0;

  v6 = objc_msgSend(v3, "cdp_isCDPErrorWithCode:", -5205);
  return v6 | v5;
}

- (BOOL)isAttemptingRecovery
{
  return self->_isAttemptingRecovery;
}

- (unint64_t)failedAttempts
{
  return self->_failedAttempts;
}

- (unint64_t)supportedEscapeOfferMask
{
  return self->supportedEscapeOfferMask;
}

- (void)setSupportedEscapeOfferMask:(unint64_t)a3
{
  self->supportedEscapeOfferMask = a3;
}

- (BOOL)isUsingMultipleICSC
{
  return self->_isUsingMultipleICSC;
}

- (void)setIsUsingMultipleICSC:(BOOL)a3
{
  self->_isUsingMultipleICSC = a3;
}

- (id)validSecretHandler
{
  return self->_validSecretHandler;
}

- (void)setValidSecretHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CDPDDeviceSecretValidatorDelegate)delegate
{
  return (CDPDDeviceSecretValidatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_validSecretHandler, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recoveryErrors, 0);
  objc_storeStrong((id *)&self->_failedSingleICSCs, 0);
  objc_storeStrong((id *)&self->_failedRecoveryKeys, 0);
  objc_storeStrong((id *)&self->_failedSecrets, 0);
}

- (void)_attemptToRecoverDevice:withSecret:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Multiple-ICSC secret is known to be bad, skipping validation\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __75__CDPDDeviceSecretValidator__attemptToRecoverDevice_withSecret_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20DB2C000, v0, v1, "\"Recovery delegate rejected recovery with error. %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_attemptToRecoverWithRecoveryKey:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Recovery key is known to be bad, skipping validation\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)validateSecret:devices:type:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Set _isAttemptingRecovery to suppress acting on change in circle state\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_handleRecoveryFailureForFinalDevice:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Unsupported delegate\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __77__CDPDDeviceSecretValidator__handleRecoveryFailureForFinalDevice_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Delegate finished handling the error and returned: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Exceeded maximum attempts for iCSC entry\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __82__CDPDDeviceSecretValidator__performSingleiCSCRecoveryWithSecret_type_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Un-set _isAttemptingRecovery to resume acting upon circle changes after failed single iCSC recovery\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
